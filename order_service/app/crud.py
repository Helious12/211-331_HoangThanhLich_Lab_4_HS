from sqlalchemy.orm import Session
from .models import Order

def create_order(db: Session, order_data: dict):
    order = Order(**order_data)
    db.add(order)
    db.commit()
    db.refresh(order)
    return order
