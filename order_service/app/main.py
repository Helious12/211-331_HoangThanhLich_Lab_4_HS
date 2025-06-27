from fastapi import FastAPI, HTTPException, Request
import os
import psycopg2
import pika
import json
import httpx
from prometheus_fastapi_instrumentator import Instrumentator
from . import models, crud
from .database import engine

app = FastAPI()
Instrumentator().instrument(app).expose(app)

models.Base.metadata.create_all(bind=engine)


# Kiểm tra kết nối DB
def db_test():
    try:
        conn = psycopg2.connect(
            host=os.getenv("DB_HOST", "haproxy"),
            port=os.getenv("DB_PORT", "5432"),
            user=os.getenv("DB_USER", "admin"),
            password=os.getenv("DB_PASSWORD", "password"),
            dbname=os.getenv("DB_NAME", "analytics")
        )
        cur = conn.cursor()
        cur.execute("SELECT 1;")
        conn.close()
        return True
    except Exception as e:
        print(f"DB error: {e}")
        return False


# Gửi message lên RabbitMQ
def send_message_to_queue(msg: str, queue_name='order_events'):
    try:
        connection = pika.BlockingConnection(
            pika.ConnectionParameters(
                host=os.getenv("RABBITMQ_HOST", "rabbitmq"),
                credentials=pika.PlainCredentials(
                    os.getenv("RABBITMQ_USER", "admin"),
                    os.getenv("RABBITMQ_PASSWORD", "password")
                )
            )
        )
        channel = connection.channel()
        channel.queue_declare(queue=queue_name, durable=True)
        channel.basic_publish(
            exchange='',
            routing_key=queue_name,
            body=msg,
            properties=pika.BasicProperties(delivery_mode=2)
        )
        connection.close()
        print(f"✅ Sent message to queue {queue_name}: {msg}")
        return True
    except Exception as e:
        print(f"❌ RabbitMQ error: {e}")
        return False


# Format và gửi message lên RabbitMQ
def audit_event(event_type, entity, entity_id, data):
    payload = {
        "event_type": event_type,
        "entity": entity,
        "entity_id": entity_id,
        "data": data
    }
    msg = json.dumps(payload)
    return send_message_to_queue(msg)


# Gửi HTTP đến dịch vụ audit
async def send_audit_log(event_type, entity, entity_id, data):
    payload = {
        "event_type": event_type,
        "entity": entity,
        "entity_id": entity_id,
        "data": data
    }
    try:
        async with httpx.AsyncClient() as client:
            response = await client.post("http://audit_service:8005/audit", json=payload)
            print("✅ Audit log sent:", response.status_code)
    except Exception as e:
        print("❌ Failed to send audit log:", e)


# API tạo order
@app.post("/order")
async def create_order(req: Request):
    body = await req.json()
    required_fields = ["user_id", "coin", "amount", "action", "price"]

    for field in required_fields:
        if field not in body:
            raise HTTPException(status_code=400, detail=f"Missing field: {field}")

    if body["action"] not in ["buy", "sell"]:
        raise HTTPException(status_code=400, detail="Action must be 'buy' or 'sell'")

    order_data = {
        "user_id": body["user_id"],
        "coin": body["coin"],
        "amount": body["amount"],
        "action": body["action"],
        "price": body["price"]
    }

    # Gửi RabbitMQ
    success = audit_event("create_order", "order", str(body["user_id"]), order_data)

    # Gửi audit log qua HTTP
    await send_audit_log("create_order", "order", body["user_id"], order_data)

    if not success:
        raise HTTPException(status_code=500, detail="Failed to send order to queue")

    return {"status": "queued"}


