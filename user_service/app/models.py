from sqlalchemy import Column, Integer, String, Float
from .database import Base

class User(Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True, index=True)
    username = Column(String, index=True)
    balances = Column(Float)

class UserCoin(Base):
    __tablename__ = "user_coins"
    user_id = Column(Integer, primary_key=True)
    coin = Column(String, primary_key=True)
    amount = Column(Float)
