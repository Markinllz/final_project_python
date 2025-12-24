from aiogram import Router, F
from aiogram.types import Message
from aiogram.filters import CommandStart
from aiogram.fsm.context import FSMContext

from bot.core.states import BotStates
from bot.core.texts import WELCOME_NEW, WELCOME_BACK
from bot.core.keyboards import main_menu_kb
from bot.database import get_session
from bot.models.db_models import User
from sqlalchemy import select

from sqlalchemy.ext.asyncio import AsyncSession

router = Router(name="start")


@router.message(CommandStart())
async def cmd_start(message: Message, state: FSMContext,
                    session: AsyncSession):
    result = await session.execute(
        select(User).where(User.telegram_id == message.from_user.id)
    )
    user = result.scalar_one_or_none()

    if user is None:
        await message.answer(WELCOME_NEW)
        new_user = User(
            telegram_id=message.from_user.id,
            username=message.from_user.username
        )
        session.add(new_user)
        await session.commit()

        text = "Профиль создан! Теперь давай настроим обучение."
    else:
        text = WELCOME_BACK.format(
            streak=3,
            learned=42
        )

    await message.answer(text, reply_markup=main_menu_kb())
    await state.set_state(BotStates.main_menu)
