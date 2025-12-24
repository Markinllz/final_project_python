from dotenv import load_dotenv
import os

load_dotenv()  # ← Эта строка читает файл .env

BOT_TOKEN = os.getenv("BOT_TOKEN")  # ← Берёт токен из .env
DATABASE_URL = os.getenv("DATABASE_URL",
                         "postgresql+psycopg2://daniilgrecin:367564@localhost:5432/English_bot")
