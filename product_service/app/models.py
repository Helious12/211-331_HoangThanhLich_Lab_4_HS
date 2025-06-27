from sqlalchemy import Column, Integer, String, Float
from .database import Base

class Product(Base):
    __tablename__ = "products"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, nullable=False)
    coin = Column(String, nullable=False)
    action = Column(String, nullable=False)  # 'buy' or 'sell'
    price = Column(Float, nullable=False)    # đơn giá 1 coin
    amount = Column(Float, nullable=False)   # số lượng coin
