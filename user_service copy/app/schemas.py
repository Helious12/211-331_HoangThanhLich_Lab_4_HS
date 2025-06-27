from pydantic import BaseModel

class UserCreate(BaseModel):
    username: str

class UserOut(BaseModel):
    id: int
    username: str
    coin_balance: float

    class Config:
        orm_mode = True

class UpdateCoin(BaseModel):
    amount: float
