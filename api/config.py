"""Конфигурация для FastAPI приложения."""
import os
from dotenv import load_dotenv

load_dotenv()

DATABASE_URL = os.getenv(
    "DATABASE_URL",
    "postgresql+asyncpg://daniilgrecin:367564@localhost:5432/English_bot"
)

