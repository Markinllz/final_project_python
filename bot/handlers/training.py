from aiogram import Router, F
from aiogram.types import Message
from aiogram.fsm.context import FSMContext
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from random import shuffle, choice
from datetime import datetime

from bot.core.states import BotStates
from bot.core.keyboards import main_menu_kb, training_modes_kb, skip_kb
from bot.models.db_models import User, Deck, Word, UserWordStats
from bot.core.texts import DECK_DESCRIPTIONS

router = Router(name="training")


@router.message(F.text == "📚 Тренировка", BotStates.main_menu)
async def choose_training_mode(message: Message, state: FSMContext):
    await message.answer(
        "Выбери режим тренировки:",
        reply_markup=training_modes_kb()
    )
    await state.set_state(BotStates.choosing_training_mode)


@router.message(F.text == "⬅️ Назад", BotStates.choosing_training_mode)
async def back_to_menu(message: Message, state: FSMContext):
    from bot.core.texts import MAIN_MENU
    await message.answer(MAIN_MENU, reply_markup=main_menu_kb())
    await state.set_state(BotStates.main_menu)


@router.message(F.text == "🃏 По колоде", BotStates.choosing_training_mode)
async def choose_deck_start(message: Message, state: FSMContext):
    decks_list = []
    for num, desc in DECK_DESCRIPTIONS.items():
        decks_list.append(f"{num}. {desc}")
    
    await message.answer(
        "Выбери колоду:\n\n" + "\n".join(decks_list) + "\n\nНапиши номер колоды (1-19):",
        reply_markup=main_menu_kb()
    )
    await state.set_state(BotStates.choosing_deck)


@router.message(BotStates.choosing_deck)
async def start_deck_training(message: Message, state: FSMContext, session: AsyncSession):
    if not message.text.isdigit():
        await message.answer("Пожалуйста, введи номер колоды (1-19):")
        return
    
    deck_num = int(message.text)
    if not (1 <= deck_num <= 19):
        await message.answer("Неверный номер колоды. Введи число от 1 до 19:")
        return
    
    user_result = await session.execute(
        select(User).where(User.telegram_id == message.from_user.id)
    )
    user = user_result.scalar_one_or_none()
    
    if user is None:
        await message.answer("Ошибка: пользователь не найден. Начните с /start")
        await state.set_state(BotStates.main_menu)
        return
    
    result = await session.execute(
        select(Word).where(Word.deck_id == deck_num)
    )
    words = result.scalars().all()
    
    if not words:
        await message.answer("Эта колода пуста. Выбери другую.")
        return
    
    words_list = [{"id": w.id, "front": w.front, "back": w.back} for w in words]
    shuffle(words_list)
    
    await state.update_data(
        mode="deck",
        deck_id=deck_num,
        words=words_list,
        current_index=0,
        correct=0,
        total=len(words_list)
    )
    
    await show_deck_word(message, state, session)


async def show_deck_word(message: Message, state: FSMContext, session: AsyncSession):
    data = await state.get_data()
    words = data["words"]
    current_index = data["current_index"]
    
    if current_index >= len(words):
        await finish_deck_training(message, state, session)
        return
    
    word = words[current_index]
    await message.answer(
        f"<b>{word['front']}</b>\n\nВспомни перевод:\n\nСлово {current_index + 1} из {len(words)}",
        reply_markup=skip_kb(),
        parse_mode="HTML"
    )
    await state.set_state(BotStates.training_deck)


@router.message(BotStates.training_deck)
async def process_deck_answer(message: Message, state: FSMContext, session: AsyncSession):
    data = await state.get_data()
    
    if message.text == "⏹ Закончить тренировку":
        await finish_deck_training(message, state, session)
        return
    
    if message.text == "⏭ Пропустить":
        words = data["words"]
        current_index = data["current_index"]
        word = words[current_index]
        await message.answer(
            f"Правильный ответ: <b>{word['front']}</b> — <i>{word['back']}</i>",
            parse_mode="HTML"
        )
        await state.update_data(current_index=current_index + 1)
        await show_deck_word(message, state, session)
        return
    
    words = data["words"]
    current_index = data["current_index"]
    word = words[current_index]
    
    user_result = await session.execute(
        select(User).where(User.telegram_id == message.from_user.id)
    )
    user = user_result.scalar_one_or_none()
    
    user_answer = message.text.strip().lower()
    correct_answer = word['back'].lower()
    
    is_correct = user_answer == correct_answer
    
    if is_correct:
        await message.answer("✅ Правильно!")
        correct = data.get("correct", 0) + 1
        await state.update_data(correct=correct)
        
        stats_result = await session.execute(
            select(UserWordStats)
            .where(UserWordStats.user_id == user.id)
            .where(UserWordStats.word_id == word['id'])
        )
        stats = stats_result.scalar_one_or_none()
        
        if stats:
            stats.success_count += 1
            stats.attempt_count += 1
            stats.last_shown_at = datetime.utcnow()
        else:
            stats = UserWordStats(
                user_id=user.id,
                word_id=word['id'],
                success_count=1,
                attempt_count=1,
                last_shown_at=datetime.utcnow()
            )
            session.add(stats)
        await session.commit()
    else:
        await message.answer(f"❌ Неправильно. Правильный ответ: <b>{word['back']}</b>", parse_mode="HTML")
        
        stats_result = await session.execute(
            select(UserWordStats)
            .where(UserWordStats.user_id == user.id)
            .where(UserWordStats.word_id == word['id'])
        )
        stats = stats_result.scalar_one_or_none()
        
        if stats:
            stats.attempt_count += 1
            stats.last_shown_at = datetime.utcnow()
        else:
            stats = UserWordStats(
                user_id=user.id,
                word_id=word['id'],
                success_count=0,
                attempt_count=1,
                last_shown_at=datetime.utcnow()
            )
            session.add(stats)
        await session.commit()
    
    await state.update_data(current_index=current_index + 1)
    await show_deck_word(message, state, session)


async def finish_deck_training(message: Message, state: FSMContext, session: AsyncSession):
    data = await state.get_data()
    correct = data.get("correct", 0)
    total = data.get("total", 0)
    await message.answer(
        f"🎉 Тренировка завершена!\n\nПравильно: <b>{correct}</b> из {total}",
        reply_markup=main_menu_kb(),
        parse_mode="HTML"
    )
    await state.set_state(BotStates.main_menu)


@router.message(F.text == "🎲 Случайные слова", BotStates.choosing_training_mode)
async def start_random_training(message: Message, state: FSMContext, session: AsyncSession):
    user_result = await session.execute(
        select(User).where(User.telegram_id == message.from_user.id)
    )
    user = user_result.scalar_one_or_none()
    
    if user is None:
        await message.answer("Ошибка: пользователь не найден. Начните с /start")
        await state.set_state(BotStates.main_menu)
        return
    
    result = await session.execute(select(Word))
    all_words = result.scalars().all()
    
    if not all_words:
        await message.answer("В базе нет слов для тренировки.")
        return
    
    words_list = [{"id": w.id, "front": w.front, "back": w.back} for w in all_words]
    shuffle(words_list)
    
    await state.update_data(
        mode="random",
        words=words_list,
        current_index=0,
        streak=0,
        max_streak=0
    )
    
    await show_random_word(message, state, session)


async def show_random_word(message: Message, state: FSMContext, session: AsyncSession):
    data = await state.get_data()
    words = data["words"]
    current_index = data["current_index"]
    streak = data.get("streak", 0)
    max_streak = data.get("max_streak", 0)
    
    if current_index >= len(words):
        await finish_random_training(message, state)
        return
    
    word = words[current_index]
    await message.answer(
        f"<b>{word['front']}</b>\n\nВспомни перевод:\n\nТекущий стрик: {streak}\nМаксимальный стрик: {max_streak}",
        reply_markup=skip_kb(),
        parse_mode="HTML"
    )
    await state.set_state(BotStates.training_random)


@router.message(BotStates.training_random)
async def process_random_answer(message: Message, state: FSMContext, session: AsyncSession):
    data = await state.get_data()
    
    if message.text == "⏹ Закончить тренировку":
        await finish_random_training(message, state)
        return
    
    if message.text == "⏭ Пропустить":
        words = data["words"]
        current_index = data["current_index"]
        word = words[current_index]
        await message.answer(
            f"Правильный ответ: <b>{word['front']}</b> — <i>{word['back']}</i>\n\nСтрик сброшен.",
            parse_mode="HTML"
        )
        await state.update_data(
            current_index=current_index + 1,
            streak=0
        )
        await show_random_word(message, state, session)
        return
    
    words = data["words"]
    current_index = data["current_index"]
    word = words[current_index]
    streak = data.get("streak", 0)
    max_streak = data.get("max_streak", 0)
    
    user_result = await session.execute(
        select(User).where(User.telegram_id == message.from_user.id)
    )
    user = user_result.scalar_one_or_none()
    
    user_answer = message.text.strip().lower()
    correct_answer = word['back'].lower()
    
    is_correct = user_answer == correct_answer
    
    if is_correct:
        new_streak = streak + 1
        new_max_streak = max(max_streak, new_streak)
        await message.answer(f"✅ Правильно! Стрик: {new_streak}")
        await state.update_data(
            streak=new_streak,
            max_streak=new_max_streak
        )
        
        stats_result = await session.execute(
            select(UserWordStats)
            .where(UserWordStats.user_id == user.id)
            .where(UserWordStats.word_id == word['id'])
        )
        stats = stats_result.scalar_one_or_none()
        
        if stats:
            stats.success_count += 1
            stats.attempt_count += 1
            stats.last_shown_at = datetime.utcnow()
        else:
            stats = UserWordStats(
                user_id=user.id,
                word_id=word['id'],
                success_count=1,
                attempt_count=1,
                last_shown_at=datetime.utcnow()
            )
            session.add(stats)
        await session.commit()
    else:
        await message.answer(
            f"❌ Неправильно. Правильный ответ: <b>{word['back']}</b>\n\nСтрик сброшен.",
            parse_mode="HTML"
        )
        await state.update_data(streak=0)
        
        stats_result = await session.execute(
            select(UserWordStats)
            .where(UserWordStats.user_id == user.id)
            .where(UserWordStats.word_id == word['id'])
        )
        stats = stats_result.scalar_one_or_none()
        
        if stats:
            stats.attempt_count += 1
            stats.last_shown_at = datetime.utcnow()
        else:
            stats = UserWordStats(
                user_id=user.id,
                word_id=word['id'],
                success_count=0,
                attempt_count=1,
                last_shown_at=datetime.utcnow()
            )
            session.add(stats)
        await session.commit()
    
    await state.update_data(current_index=current_index + 1)
    await show_random_word(message, state, session)


async def finish_random_training(message: Message, state: FSMContext):
    data = await state.get_data()
    max_streak = data.get("max_streak", 0)
    
    await message.answer(
        f"🎉 Тренировка завершена!\n\nМаксимальный стрик: <b>{max_streak}</b>",
        reply_markup=main_menu_kb(),
        parse_mode="HTML"
    )
    await state.set_state(BotStates.main_menu)


@router.message(F.text == "📝 Предложения", BotStates.choosing_training_mode)
async def start_sentences_training(message: Message, state: FSMContext, session: AsyncSession):
    user_result = await session.execute(
        select(User).where(User.telegram_id == message.from_user.id)
    )
    user = user_result.scalar_one_or_none()
    
    if user is None:
        await message.answer("Ошибка: пользователь не найден. Начните с /start")
        await state.set_state(BotStates.main_menu)
        return
    
    result = await session.execute(select(Word))
    all_words = result.scalars().all()
    
    if not all_words:
        await message.answer("В базе нет слов для тренировки.")
        return
    
    sentences_list = []
    sentence_templates = [
        "I need to {back} the meeting tomorrow.",
        "She likes to {back} in the morning.",
        "They decided to {back} this project.",
        "We should {back} before making a decision.",
        "He wants to {back} his English skills.",
        "Can you {back} me with this task?",
        "Let's {back} at the restaurant tonight.",
        "She will {back} the presentation next week.",
        "I can't {back} without your help.",
        "They plan to {back} next month."
    ]
    
    for word in all_words:
        template = choice(sentence_templates)
        full_sentence = template.format(back=word.back)
        sentence_with_gap = full_sentence.replace(word.back, "___")
        sentences_list.append({
            "id": word.id,
            "front": word.front,
            "back": word.back,
            "sentence": full_sentence,
            "sentence_with_gap": sentence_with_gap
        })
    
    shuffle(sentences_list)
    
    await state.update_data(
        mode="sentences",
        sentences=sentences_list,
        current_index=0,
        correct=0,
        total=len(sentences_list)
    )
    
    await show_sentence(message, state, session)


async def show_sentence(message: Message, state: FSMContext, session: AsyncSession):
    data = await state.get_data()
    sentences = data["sentences"]
    current_index = data["current_index"]
    
    if current_index >= len(sentences):
        await finish_sentences_training(message, state)
        return
    
    sentence_data = sentences[current_index]
    
    await message.answer(
        f"{sentence_data['sentence_with_gap']}\n\nВпиши пропущенное слово:\n\nПредложение {current_index + 1} из {len(sentences)}",
        reply_markup=skip_kb()
    )
    await state.set_state(BotStates.training_sentences)


@router.message(BotStates.training_sentences)
async def process_sentence_answer(message: Message, state: FSMContext, session: AsyncSession):
    data = await state.get_data()
    
    if message.text == "⏹ Закончить тренировку":
        await finish_sentences_training(message, state)
        return
    
    if message.text == "⏭ Пропустить":
        sentences = data["sentences"]
        current_index = data["current_index"]
        sentence_data = sentences[current_index]
        await message.answer(
            f"Правильный ответ: <b>{sentence_data['back']}</b>\n\n{sentence_data['sentence']}",
            parse_mode="HTML"
        )
        await state.update_data(current_index=current_index + 1)
        await show_sentence(message, state, session)
        return
    
    sentences = data["sentences"]
    current_index = data["current_index"]
    sentence_data = sentences[current_index]
    
    user_answer = message.text.strip().lower()
    correct_answer = sentence_data["back"].lower()
    
    is_correct = user_answer == correct_answer
    
    if is_correct:
        await message.answer("✅ Правильно!")
        correct = data.get("correct", 0) + 1
        await state.update_data(correct=correct)
    else:
        await message.answer(
            f"❌ Неправильно. Правильный ответ: <b>{sentence_data['back']}</b>\n\n{sentence_data['sentence']}",
            parse_mode="HTML"
        )
    
    await state.update_data(current_index=current_index + 1)
    await show_sentence(message, state, session)


async def finish_sentences_training(message: Message, state: FSMContext):
    data = await state.get_data()
    correct = data.get("correct", 0)
    total = data.get("total", 0)
    
    await message.answer(
        f"🎉 Тренировка завершена!\n\nПравильно: <b>{correct}</b> из {total}",
        reply_markup=main_menu_kb(),
        parse_mode="HTML"
    )
    await state.set_state(BotStates.main_menu)
