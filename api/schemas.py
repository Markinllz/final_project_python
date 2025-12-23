"""Pydantic схемы для валидации данных API."""
from pydantic import BaseModel, Field
from datetime import datetime
from typing import Optional


class UserResponse(BaseModel):
    """Схема ответа для пользователя."""
    id: int
    user_name: Optional[str] = None

    class Config:
        from_attributes = True


class UserCreate(BaseModel):
    """Схема создания пользователя."""
    user_name: Optional[str] = None


class DeckResponse(BaseModel):
    """Схема ответа для колоды."""
    id: int
    name: str
    owner_id: Optional[int] = None
    type: str = "custom"

    class Config:
        from_attributes = True


class DeckCreate(BaseModel):
    """Схема создания колоды."""
    name: str = Field(..., min_length=1, max_length=255)
    owner_id: Optional[int] = None
    type: str = "custom"


class WordResponse(BaseModel):
    """Схема ответа для слова."""
    id: int
    deck_id: int
    front: str
    back: str

    class Config:
        from_attributes = True


class WordCreate(BaseModel):
    """Схема создания слова."""
    deck_id: int
    front: str = Field(..., min_length=1, max_length=500)
    back: str = Field(..., min_length=1, max_length=500)


class LevelResponse(BaseModel):
    """Схема ответа для уровня."""
    id: int
    level_name: str

    class Config:
        from_attributes = True


class LevelCreate(BaseModel):
    """Схема создания уровня."""
    level_name: str = Field(..., min_length=1, max_length=100)


class UserWordStatsResponse(BaseModel):
    """Схема ответа для статистики слова пользователя."""
    id: int
    user_id: int
    word_id: int
    success_count: int
    attempt_count: int
    last_shown_at: Optional[datetime] = None

    class Config:
        from_attributes = True


class UserWordStatsCreate(BaseModel):
    """Схема создания статистики слова пользователя."""
    user_id: int
    word_id: int
    success_count: int = Field(default=0, ge=0)
    attempt_count: int = Field(default=0, ge=0)

