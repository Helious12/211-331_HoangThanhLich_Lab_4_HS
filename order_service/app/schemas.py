from pydantic import BaseModel
from enum import Enum

class OrderAction(str, Enum):
    buy = "buy"
    sell = "sell"

class OrderCreate(BaseModel):
    user_id: int
    coin: str
    amount: float
    action: OrderAction
    price: float

class OrderOut(OrderCreate):
    id: int
    status: str

    class Config:
        orm_mode = True
