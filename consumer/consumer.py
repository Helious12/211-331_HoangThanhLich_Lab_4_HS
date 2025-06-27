import os
import json
import asyncio
import httpx
import aio_pika
import psycopg2
from psycopg2 import pool
from prometheus_client import start_http_server, Counter

ORDERS_PROCESSED = Counter("orders_processed_total", "Total number of orders processed", ["action", "status"])

pg_pool = None
audit_queue = asyncio.Queue()

async def send_audit_log_worker():
    while True:
        payload = await audit_queue.get()
        try:
            async with httpx.AsyncClient() as client:
                await client.post("http://audit_service:8005/audit", json=payload)
        except Exception as e:
            print("Failed to send audit log:", e)
        audit_queue.task_done()

def queue_audit_log(event_type, entity, entity_id, status, action, user_id, coin, amount):
    payload = {
        "event_type": event_type,
        "entity": entity,
        "entity_id": entity_id,
        "data": {
            "status": status,
            "action": action,
            "user_id": user_id,
            "coin": coin,
            "amount": amount
        }
    }
    audit_queue.put_nowait(payload)

def process_order(message: str):
    data = json.loads(message)
    order = data["data"]
    user_id = order["user_id"]
    coin = order["coin"]
    amount = order["amount"]
    action = order["action"]
    price = order["price"]

    conn = None
    cur = None
    try:
        conn = pg_pool.getconn()
        cur = conn.cursor()
        cur.execute("BEGIN")

        # Khóa chính user và user_coins trước
        cur.execute("SELECT balances FROM users WHERE id = %s FOR UPDATE", (user_id,))
        cur.execute("SELECT amount FROM user_coins WHERE user_id = %s AND coin = %s FOR UPDATE", (user_id, coin))

        if action == "buy":
            cur.execute("SELECT balances FROM users WHERE id = %s FOR UPDATE", (user_id,))
            result = cur.fetchone()
            if not result or result[0] < price * amount:
                raise Exception(f"BUY failed: not enough balance for user {user_id}")
            remaining = amount

            cur.execute("""
                SELECT id, user_id, amount, price FROM products
                WHERE coin = %s AND action = 'sell' AND price <= %s AND user_id != %s
                ORDER BY price ASC, user_id ASC, id ASC
                FOR UPDATE SKIP LOCKED;
            """, (coin, price, user_id))
            sellers = cur.fetchall()

            for s_id, s_user_id, s_amount, s_price in sellers:
                if remaining <= 0:
                    break

                # Khóa người bán theo đúng thứ tự
                cur.execute("SELECT amount FROM user_coins WHERE user_id = %s AND coin = %s FOR UPDATE", (s_user_id, coin))

                seller_coins = cur.fetchone()
                if not seller_coins or seller_coins[0] < 1:
                    continue
                match_amount = min(remaining, s_amount, seller_coins[0])

                cur.execute("UPDATE user_coins SET amount = amount - %s WHERE user_id = %s AND coin = %s", (match_amount, s_user_id, coin))
                cur.execute("INSERT INTO user_coins (user_id, coin, amount) VALUES (%s, %s, %s) ON CONFLICT (user_id, coin) DO UPDATE SET amount = user_coins.amount + EXCLUDED.amount", (user_id, coin, match_amount))
                cur.execute("UPDATE users SET balances = balances - %s WHERE id = %s", (match_amount * s_price, user_id))
                cur.execute("UPDATE users SET balances = balances + %s WHERE id = %s", (match_amount * s_price, s_user_id))

                if match_amount == s_amount:
                    cur.execute("DELETE FROM products WHERE id = %s", (s_id,))
                else:
                    cur.execute("UPDATE products SET amount = amount - %s WHERE id = %s", (match_amount, s_id))

                remaining -= match_amount

            if remaining > 0:
                cur.execute("SELECT balances FROM users WHERE id = %s", (user_id,))
                new_balance = cur.fetchone()
                if new_balance and new_balance[0] >= remaining * price:
                    cur.execute("INSERT INTO products (user_id, coin, action, price, amount) VALUES (%s, %s, %s, %s, %s)",
                                (user_id, coin, "buy", price, remaining))

        elif action == "sell":
            result = cur.fetchone()
            if not result or result[0] < amount:
                raise Exception(f"SELL failed: not enough {coin} for user {user_id}")
            remaining = amount

            cur.execute("""
                SELECT id, user_id, amount, price FROM products
                WHERE coin = %s AND action = 'buy' AND price >= %s AND user_id != %s
                ORDER BY price DESC, user_id ASC, id ASC
                FOR UPDATE SKIP LOCKED;
            """, (coin, price, user_id))
            buyers = cur.fetchall()

            for b_id, b_user_id, b_amount, b_price in buyers:
                if remaining <= 0:
                    break

                # Khóa buyer trước khi dùng tiền
                cur.execute("SELECT balances FROM users WHERE id = %s FOR UPDATE", (b_user_id,))
                buyer_balance = cur.fetchone()
                if not buyer_balance or buyer_balance[0] <= 0:
                    continue

                max_buyable = min(remaining, b_amount, buyer_balance[0] / b_price)
                if max_buyable < 1e-6:
                    continue

                cur.execute("UPDATE user_coins SET amount = amount - %s WHERE user_id = %s AND coin = %s", (max_buyable, user_id, coin))
                cur.execute("INSERT INTO user_coins (user_id, coin, amount) VALUES (%s, %s, %s) ON CONFLICT (user_id, coin) DO UPDATE SET amount = user_coins.amount + EXCLUDED.amount", (b_user_id, coin, max_buyable))
                cur.execute("UPDATE users SET balances = balances + %s WHERE id = %s", (max_buyable * b_price, user_id))
                cur.execute("UPDATE users SET balances = balances - %s WHERE id = %s", (max_buyable * b_price, b_user_id))

                if max_buyable == b_amount:
                    cur.execute("DELETE FROM products WHERE id = %s", (b_id,))
                else:
                    cur.execute("UPDATE products SET amount = amount - %s WHERE id = %s", (max_buyable, b_id))

                remaining -= max_buyable

            if remaining > 0:
                cur.execute("SELECT amount FROM user_coins WHERE user_id = %s AND coin = %s", (user_id, coin))
                new_coin = cur.fetchone()
                if new_coin and new_coin[0] >= remaining:
                    cur.execute("INSERT INTO products (user_id, coin, action, price, amount) VALUES (%s, %s, %s, %s, %s)",
                                (user_id, coin, "sell", price, remaining))

        else:
            raise Exception("Unknown action")

        conn.commit()
        ORDERS_PROCESSED.labels(action=action, status="success").inc()
        queue_audit_log("processed_order", "order", user_id, "success", action, user_id, coin, amount)

    except Exception as e:
        print(f"Order processing error: {e}")
        if conn:
            conn.rollback()
        ORDERS_PROCESSED.labels(action=action, status="fail").inc()
        queue_audit_log("processed_order", "order", user_id, "fail", action, user_id, coin, amount)
    finally:
        if cur: cur.close()
        if conn: pg_pool.putconn(conn)

async def consume_message(message: aio_pika.IncomingMessage):
    async with message.process():
        await asyncio.to_thread(process_order, message.body.decode())

async def main():
    global pg_pool
    start_http_server(8006)

    pg_pool = psycopg2.pool.SimpleConnectionPool(
        5, 100,
        host=os.getenv("DB_HOST", "haproxy"),
        port=os.getenv("DB_PORT", "5432"),
        user=os.getenv("DB_USER", "admin"),
        password=os.getenv("DB_PASSWORD", "password"),
        dbname=os.getenv("DB_NAME", "analytics")
    )

    asyncio.create_task(send_audit_log_worker())

    connection = await aio_pika.connect_robust(
        host=os.getenv("RABBITMQ_HOST", "rabbitmq"),
        login=os.getenv("RABBITMQ_USER", "admin"),
        password=os.getenv("RABBITMQ_PASSWORD", "password"),
        virtualhost="/"
    )
    channel = await connection.channel()
    await channel.set_qos(prefetch_count=100)

    queue = await channel.declare_queue("order_events", durable=True)
    await queue.consume(consume_message)

    print("[*] Async consumer is running...", flush=True)
    await asyncio.Future()

if __name__ == "__main__":
    asyncio.run(main())
