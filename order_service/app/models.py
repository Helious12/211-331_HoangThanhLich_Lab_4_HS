from sqlalchemy import Column, Integer, String, Float
from .database import Base

class Order(Base):
    __tablename__ = "orders"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, nullable=False)
    coin = Column(String, nullable=False)
    amount = Column(Float, nullable=False)
    action = Column(String, nullable=False)  # "buy" or "sell"
    price = Column(Float, nullable=False)   
