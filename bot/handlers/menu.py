from aiogram import Router, F
from aiogram.types import Message

from bot.core.states import BotStates
from bot.core.texts import MAIN_MENU
from bot.core.keyboards import main_menu_kb

router = Router(name="menu")


@router.message(BotStates.main_menu)
async def menu_handler(message: Message):
    text = message.text

    if text == "📊 Прогресс":
        await message.answer("📊 Твой прогресс:\nВыучено слов: 0\nStreak: 0 дней\nТренировок: 0\nПока пусто — начни тренировку!")
    elif text == "⚙️ Настройки":
        await message.answer("⚙️ Настройки пока недоступны.\nСкоро: выбор уровня, частота напоминаний")
    else:
        await message.answer(MAIN_MENU, reply_markup=main_menu_kb())
