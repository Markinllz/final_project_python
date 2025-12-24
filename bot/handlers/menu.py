from aiogram import Router, F
from aiogram.types import Message
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from bot.core.states import BotStates
from bot.core.texts import MAIN_MENU
from bot.core.keyboards import main_menu_kb

router = Router(name="menu")

from aiogram.fsm.context import FSMContext
from bot.models.db_models import Deck, Word
# ... остальной код

@router.message(F.text == "➕ Добавить слова")
async def add_word_start(message: Message, state: FSMContext):
    await message.answer(
        "Напиши слово в формате:\n<code>слово — перевод</code>\nПример: <code>meeting — совещание</code>\n\nНапиши /cancel, чтобы выйти."
    )
    await state.set_state(BotStates.adding_word)

@router.message(BotStates.adding_word)
async def add_word_process(message: Message, state: FSMContext, session: AsyncSession):
    text = message.text.strip()
    if text == "/cancel":
        await message.answer("Отменено. Возвращаюсь в меню.", reply_markup=main_menu_kb())
        await state.set_state(BotStates.main_menu)
        return

    if "—" not in text:
        await message.answer("Неправильный формат! Попробуй снова.")
        return

    front, back = text.split("—", 1)
    front = front.strip()
    back = back.strip()

    # Находим или создаём custom deck для пользователя
    result = await session.execute(
        select(Deck).where(Deck.owner_id == message.from_user.id, Deck.type == "custom")
    )
    deck = result.scalar_one_or_none()
    if deck is None:
        deck = Deck(name="Мои слова", type="custom", owner_id=message.from_user.id)
        session.add(deck)
        await session.commit()
        await session.refresh(deck)

    # Добавляем слово
    word = Word(deck_id=deck.id, front=front, back=back)
    session.add(word)
    await session.commit()

    await message.answer(f"Слово добавлено! {front} — {back}\n\nДобавь ещё или /cancel.")

# Ловим состояние главного меню и любые сообщения в нём
@router.message(BotStates.main_menu)
async def menu_handler(message: Message):
    text = message.text

    if text == "📚 Тренировка":
        await message.answer("Тренировка пока в разработке 🚧\nСкоро будем повторять слова по умному алгоритму!")
    elif text == "🃏 Колоды":
        decks_list = [
            "1. Бизнес Английский Light — 328 слов",
            "2. Бытовой Английский Light — 457 слов",
            "3. Бытовой Английский Hard — 344 слов",
            "4. Путешествия Light — 276 слов",
            "5. Бизнес английский Hard — 241 слово",
            "6. Путешествия Hard — 191 слово",
            "7. Спорт Light — 221 слово",
            "8. Спорт Hard — 170 слово",
            "9. Политика Light — 109 слов",
            "10. Политика Hard — 144 слова",
            "11. Кулинария Light — 172 слова",
            "12. Кулинария Hard — 119 слов",
            "13. Фильмы Light — 150 слов",
            "14. Фильмы Hard — 121 слово",
            "15. Книги Light — 122 слова",
            "16. Книги Hard — 116 слов",
            "17. Технологии Light — 137 слов",
            "18. Технологии Hard — 128 слов",
            "19. General English A1 — 551 слово",
        ]
        await message.answer("Доступные колоды:\n\n" + "\n".join(decks_list) + "\n\nНапиши номер колоды (1-19), чтобы выбрать тему для изучения!")
    elif text == "➕ Добавить слова":
        await message.answer("Напиши слово в формате:\nслово — перевод\nПример: hello — привет")
    elif text == "📊 Прогресс":
        await message.answer("📊 Твой прогресс:\nВыучено слов: 0\nStreak: 0 дней\nТренировок: 0\nПока пусто — начни тренировку!")
    elif text == "⚙️ Настройки":
        await message.answer("⚙️ Настройки пока недоступны.\nСкоро: выбор уровня, частота напоминаний")
    elif text.isdigit() and 1 <= int(text) <= 19:
        await message.answer(f"Отлично! Выбрана колода №{text}.\n\nТренировка по этой теме скоро начнётся 🚀\n(пока в разработке)")
    else:
        await message.answer(MAIN_MENU, reply_markup=main_menu_kb())

