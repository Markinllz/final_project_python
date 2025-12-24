from aiogram import Router, F
from aiogram.types import Message
from aiogram.filters import CommandStart
from aiogram.fsm.context import FSMContext

from bot.core.states import BotStates
from bot.core.texts import WELCOME_NEW, WELCOME_BACK
from bot.core.keyboards import main_menu_kb
from bot.database import get_session
from bot.models.db_models import User
from bot.services.stats import get_user_stats
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
        await session.refresh(new_user)
        
        await get_user_stats(new_user.id, session)
        text = "Профиль создан! Теперь давай настроим обучение."
    else:
        user_name = user.username or message.from_user.first_name or "друг"
        text = WELCOME_BACK.format(name=user_name)

    from bot.core.texts import MAIN_MENU
    await message.answer(text)
    await message.answer(MAIN_MENU, reply_markup=main_menu_kb(), parse_mode="HTML")
    await state.set_state(BotStates.main_menu)
