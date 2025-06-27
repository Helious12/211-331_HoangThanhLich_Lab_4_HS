from pydantic import BaseModel

class ProductCreate(BaseModel):
    name: str
    buy_price: float
    sell_price: float
    available: float

class ProductOut(ProductCreate):
    id: int

    class Config:
        orm_mode = True
