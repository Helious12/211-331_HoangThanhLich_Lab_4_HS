from fastapi import FastAPI, Depends, HTTPException
import os
import psycopg2
from sqlalchemy.orm import Session
from prometheus_fastapi_instrumentator import Instrumentator
from app import crud, models

from .database import SessionLocal, engine
from . import models, schemas

models.Base.metadata.create_all(bind=engine)

def init_data():
    db: Session = SessionLocal()
    if db.query(models.User).count() == 0:
        user1 = models.User(id=1, username="1alice", balances="1000000")
        user2 = models.User(id=2, username="2bob", balances="1000000")
        user3 = models.User(id=3, username="3cbob", balances="1000000")
        user4 = models.User(id=4, username="4dbob", balances="1000000")
        user5 = models.User(id=5, username="5ebob", balances="1000000")
        user6 = models.User(id=6, username="6bob", balances="1000000")
        user7 = models.User(id=7, username="7bob", balances="1000000")
        user8 = models.User(id=8, username="8bob", balances="1000000")
        user9 = models.User(id=9, username="9bob", balances="1000000")
        user10 = models.User(id=10, username="10bob", balances="1000000")
        user11 = models.User(id=11, username="11bob", balances="100000000000000")
        db.add_all([user1, user2, user3, user4, user5, user6, user7, user8, user9, user10, user11])

        coins = [
            models.UserCoin(user_id=1, coin="NVIDIA", amount=100.0),
            models.UserCoin(user_id=1, coin="Apple", amount=100.0),
            models.UserCoin(user_id=2, coin="NVIDIA", amount=100.0),
            models.UserCoin(user_id=2, coin="Apple", amount=100.0),
            models.UserCoin(user_id=3, coin="NVIDIA", amount=100.0),
            models.UserCoin(user_id=3, coin="Apple", amount=100.0),
            models.UserCoin(user_id=4, coin="NVIDIA", amount=100.0),
            models.UserCoin(user_id=4, coin="Apple", amount=100.0),
            models.UserCoin(user_id=5, coin="NVIDIA", amount=100.0),
            models.UserCoin(user_id=5, coin="Apple", amount=100.0),
            models.UserCoin(user_id=6, coin="NVIDIA", amount=100.0),
            models.UserCoin(user_id=6, coin="Apple", amount=100.0),
            models.UserCoin(user_id=7, coin="NVIDIA", amount=100.0),
            models.UserCoin(user_id=7, coin="Apple", amount=100.0),
            models.UserCoin(user_id=8, coin="NVIDIA", amount=100.0),
            models.UserCoin(user_id=8, coin="Apple", amount=100.0),
            models.UserCoin(user_id=9, coin="NVIDIA", amount=100.0),
            models.UserCoin(user_id=9, coin="Apple", amount=100.0),
            models.UserCoin(user_id=10, coin="NVIDIA", amount=100.0),
            models.UserCoin(user_id=10, coin="Apple", amount=100.0),
            models.UserCoin(user_id=11, coin="Bitcoin", amount=200000000.0),
            models.UserCoin(user_id=11, coin="Ethereum", amount=200000000.0)
        ]
        db.add_all(coins)
        db.commit()
    db.close()

init_data()

app = FastAPI()
Instrumentator().instrument(app).expose(app)


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


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@app.get("/users/ping")
def ping():
    return {
        "service": "user_service",
        "db_connected": db_test()
    }


@app.get("/users/{user_id}/coins")
def read_user_full_info(user_id: int, db: Session = Depends(get_db)):
    result = crud.get_user_with_coins(db, user_id)
    if not result:
        raise HTTPException(status_code=404, detail="User not found")
    
    user, coins = result
    return {
        "user_id": user.id,
        "username": user.username,
        "balances": float(user.balances),
        "coins": [
            {"coin": c.coin, "amount": float(c.amount)} for c in coins
        ]
    }
