import asyncio
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent.parent))

from bot.database import engine
from bot.models.db_models import Base

async def main():
    print("Создание таблицы user_stats...")
    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.create_all)
    print("✅ Таблица user_stats создана!")
    await engine.dispose()

if __name__ == "__main__":
    asyncio.run(main())

