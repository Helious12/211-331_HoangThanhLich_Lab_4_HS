from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy.orm import Session
from .database import SessionLocal, engine
from . import schemas, models, crud
from prometheus_fastapi_instrumentator import Instrumentator

models.Base.metadata.create_all(bind=engine)

app = FastAPI()
Instrumentator().instrument(app).expose(app)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/products/ping")
def ping():
    return {"service": "product_service", "status": "ok"}


@app.get("/products")
def list_products(db: Session = Depends(get_db)):
    products = crud.get_all_products(db)
    return [
        {
            "id": p.id,
            "user_id": p.user_id,
            "coin": p.coin,
            "action": p.action,
            "price": p.price,
            "amount": p.amount,
        }
        for p in products
    ]
