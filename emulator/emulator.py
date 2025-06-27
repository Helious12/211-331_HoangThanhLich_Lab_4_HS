# import os
# import random
# import asyncio
# import httpx

# # Giá cố định theo từng coin
# COIN_PRICES = {
#     "NVIDIA": [45000 + 500 * i for i in range(15)],
#     "Apple": [2000 + 50 * i for i in range(15)]
# }

# ORDER_API = os.getenv("ORDER_API", "http://order_service:8003/order")
# USER_IDS = list(range(1, 11))

# def generate_order():
#     user_id = random.choice(USER_IDS)
#     coin = random.choice(list(COIN_PRICES.keys()))
#     amount = round(random.uniform(1, 10), 2)
#     price = random.choice(COIN_PRICES[coin])
#     action = random.choice(["buy", "sell"])
#     return {
#         "user_id": user_id,
#         "coin": coin,
#         "amount": amount,
#         "price": price,
#         "action": action
#     }

# async def send_order(order, client):
#     try:
#         res = await client.post(ORDER_API, json=order, timeout=5.0)
#         # print(f"✅ Order: {order} → {res.status_code}")
#     except Exception as e:
#         print(f"❌ Error: {e}")

# async def send_batch(batch_size=1000):
#     async with httpx.AsyncClient() as client:
#         tasks = []
#         for _ in range(batch_size):
#             order = generate_order()
#             tasks.append(send_order(order, client))
#         await asyncio.gather(*tasks)

# async def main_loop():
#     while True:
#         await send_batch(batch_size=1000)  # Gửi 1000 request mỗi vòng lặp
#         await asyncio.sleep(1)  # Gửi 1000/giây

# if __name__ == "__main__":
#     asyncio.run(main_loop())


import os
import random
import asyncio
import httpx

# Giá cố định theo từng coin
COIN_PRICES = {
    "NVIDIA": [45000 + 500 * i for i in range(15)],
    "Apple": [2000 + 50 * i for i in range(15)]
}

ORDER_API = os.getenv("ORDER_API", "http://order_service:8003/order")
USER_IDS = list(range(1, 11))

def generate_order():
    user_id = random.choice(USER_IDS)
    coin = random.choice(list(COIN_PRICES.keys()))
    amount = random.randint(1, 10)
    price = random.choice(COIN_PRICES[coin])
    action = random.choice(["buy", "sell"])
    return {
        "user_id": user_id,
        "coin": coin,
        "amount": amount,
        "price": price,
        "action": action
    }

async def send_order(order, client):
    try:
        await client.post(ORDER_API, json=order, timeout= 0.1)
    except:
        pass  # Không in lỗi

async def send_batch(batch_size):
    async with httpx.AsyncClient() as client:
        tasks = [send_order(generate_order(), client) for _ in range(batch_size)]
        await asyncio.gather(*tasks)

async def main_loop():
    while True:
        await send_batch(batch_size=100)
        await send_batch(batch_size=100)
        await send_batch(batch_size=100)
        await send_batch(batch_size=100)
        await send_batch(batch_size=100)
        await send_batch(batch_size=100)
        await send_batch(batch_size=100)
        await send_batch(batch_size=100)
        await send_batch(batch_size=100)
        
        # await asyncio.sleep(1)

if __name__ == "__main__":
    asyncio.run(main_loop())
