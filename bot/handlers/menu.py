from aiogram import Router, F
from aiogram.types import Message
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select

from bot.core.states import BotStates
from bot.core.texts import MAIN_MENU
from bot.core.keyboards import main_menu_kb
from bot.models.db_models import User
from bot.services.stats import get_user_stats

router = Router(name="menu")


@router.message(F.text == "📊 Прогресс")
async def show_progress(message: Message, session: AsyncSession):
    user_result = await session.execute(
        select(User).where(User.telegram_id == message.from_user.id)
    )
    user = user_result.scalar_one_or_none()
    
    if user is None:
        await message.answer("Ошибка: пользователь не найден. Начните с /start")
        return
    
    stats = await get_user_stats(user.id, session)
    
    if stats["learned_words"] == 0 and stats["total_sessions"] == 0:
        await message.answer(
            "📊 <b>Твой прогресс</b>\n\n"
            "Выучено слов: <b>0</b>\n"
            "Streak: <b>0</b> дней\n"
            "Тренировок: <b>0</b>\n\n"
            "Пока пусто — начни тренировку! 🚀",
            parse_mode="HTML"
        )
    else:
        await message.answer(
            "📊 <b>Твой прогресс</b>\n\n"
            f"Выучено слов: <b>{stats['learned_words']}</b>\n"
            f"Текущий streak: <b>{stats['current_streak']}</b> дней 🔥\n"
            f"Максимальный streak: <b>{stats['max_streak']}</b> дней\n"
            f"Тренировок: <b>{stats['total_sessions']}</b>\n\n"
            "Продолжай в том же духе! 💪",
            parse_mode="HTML"
        )


@router.message(BotStates.main_menu)
async def menu_handler(message: Message):
    await message.answer(MAIN_MENU, reply_markup=main_menu_kb(), parse_mode="HTML")
