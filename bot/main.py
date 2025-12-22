import asyncio
import logging

from aiogram import Bot, Dispatcher
from aiogram.fsm.storage.memory import MemoryStorage
from aiogram.types import TelegramObject
from typing import Callable, Dict, Any, Awaitable
from aiogram.client.default import DefaultBotProperties
from aiogram.enums import ParseMode

from bot.config import BOT_TOKEN
from bot.database import init_db, get_session
from bot.handlers import start, menu  # settings пока можно без него

import importlib
import bot.core.keyboards

# Принудительно перезагружаем модуль keyboards, чтобы точно взять свежий код
importlib.reload(bot.core.keyboards)

print("Модуль keyboards перезагружен!")  # отладка


# === Middleware для передачи сессии БД ===
async def db_session_middleware(
    handler: Callable[[TelegramObject, Dict[str, Any]], Awaitable[Any]],
    event: TelegramObject,
    data: Dict[str, Any],
) -> Any:
    async for session in get_session():
        data["session"] = session
        try:
            return await handler(event, data)
        finally:
            await session.close()


async def on_startup():
    await init_db()
    print("Бот запущен! База данных инициализирована.")


async def main():
    logging.basicConfig(level=logging.INFO)

    # Вот здесь исправление
    bot = Bot(token=BOT_TOKEN, default=DefaultBotProperties(parse_mode=ParseMode.HTML))
    storage = MemoryStorage()
    dp = Dispatcher(storage=storage)

    # Middleware
    dp.update.middleware(db_session_middleware)

    # Роутеры
    dp.include_router(start.router)
    dp.include_router(menu.router)
    # dp.include_router(settings.router)  # раскомментируешь позже

    dp.startup.register(on_startup)

    await dp.start_polling(bot)


if __name__ == "__main__":
    asyncio.run(main())