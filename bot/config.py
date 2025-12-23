"""Конфигурация для Telegram-бота."""
from dotenv import load_dotenv
import os

load_dotenv()

BOT_TOKEN = os.getenv("BOT_TOKEN")
if not BOT_TOKEN:
    raise ValueError("BOT_TOKEN не найден в переменных окружения!")

DATABASE_URL = os.getenv(
    "DATABASE_URL",
    "postgresql+asyncpg://daniilgrecin:367564@localhost:5432/English_bot"
)
