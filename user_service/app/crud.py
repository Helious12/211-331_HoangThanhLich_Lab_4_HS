from sqlalchemy.orm import Session
from .models import User, UserCoin

def get_user_with_coins(db: Session, user_id: int):
    user = db.query(User).filter(User.id == user_id).first()
    if not user:
        return None
    coins = db.query(UserCoin).filter(UserCoin.user_id == user_id).all()
    return user, coins
