from sqlalchemy.orm import Session
from .models import Product

def get_all_products(db: Session):
    return db.query(Product).all()
