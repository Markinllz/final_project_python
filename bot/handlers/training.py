from aiogram import Router, F
from aiogram.types import Message, CallbackQuery
from aiogram.fsm.context import FSMContext
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from random import shuffle, choice
from datetime import datetime
import asyncio
import asyncio

from bot.core.states import BotStates
from bot.core.keyboards import main_menu_kb, training_modes_kb, skip_kb, sentence_options_kb
from bot.models.db_models import User, Deck, Word, UserWordStats, Sentence
from bot.core.texts import DECK_DESCRIPTIONS
from bot.services.stats import update_user_activity

router = Router(name="training")


@router.message(F.text == "📚 Тренировка")
async def choose_training_mode(message: Message, state: FSMContext):
    from bot.core.texts import TRAINING_MODES_INFO
    await message.answer(
        TRAINING_MODES_INFO,
        reply_markup=training_modes_kb(),
        parse_mode="HTML"
    )
    await state.set_state(BotStates.choosing_training_mode)


@router.message(F.text == "⬅️ Назад")
async def back_to_menu(message: Message, state: FSMContext):
    from bot.core.texts import MAIN_MENU
    await message.answer(MAIN_MENU, reply_markup=main_menu_kb(), parse_mode="HTML")
    await state.set_state(BotStates.main_menu)


@router.message(F.text == "🃏 По колоде", BotStates.choosing_training_mode)
async def choose_deck_start(message: Message, state: FSMContext):
    decks_list = []
    for num, desc in DECK_DESCRIPTIONS.items():
        decks_list.append(f"{num}. {desc}")
    
    await message.answer(
        "🃏 <b>Тренировка по колоде</b>\n\n"
        "Выбери тему для изучения:\n\n" + "\n".join(decks_list) + 
        "\n\nНапиши <b>номер колоды (1-19)</b> для начала тренировки.\n"
        "Бот покажет слова из выбранной темы, тебе нужно вспомнить перевод.\n\n"
        "💡 <i>Можно пропускать слова кнопкой 'Пропустить'</i>",
        reply_markup=main_menu_kb(),
        parse_mode="HTML"
    )
    await state.set_state(BotStates.choosing_deck)


@router.message(BotStates.choosing_deck)
async def start_deck_training(message: Message, state: FSMContext, session: AsyncSession):
    if message.text in ["📚 Тренировка", "📊 Прогресс", "⚙️ Настройки", "⬅️ Назад"]:
        await state.set_state(BotStates.main_menu)
        return
    
    if not message.text.isdigit():
        await message.answer(
            "❌ Пожалуйста, введи <b>номер колоды (1-19)</b> или используй кнопки меню",
            parse_mode="HTML"
        )
        return
    
    deck_num = int(message.text)
    if not (1 <= deck_num <= 19):
        await message.answer(
            "❌ Неверный номер колоды. Введи число от <b>1 до 19</b>",
            parse_mode="HTML"
        )
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
        f"<b>{word['front']}</b>\n\n"
        "Вспомни перевод и напиши его:",
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
    
    user_result = await session.execute(
        select(User).where(User.telegram_id == message.from_user.id)
    )
    user = user_result.scalar_one_or_none()
    if user:
        await update_user_activity(user.id, session)
    
    await message.answer(
        f"🎉 Тренировка завершена!\n\nПравильных ответов: <b>{correct}</b>",
        reply_markup=main_menu_kb(),
        parse_mode="HTML"
    )
    await state.set_state(BotStates.main_menu)


@router.message(F.text == "🎲 Случайные слова", BotStates.choosing_training_mode)
async def start_random_training(message: Message, state: FSMContext, session: AsyncSession):
    await message.answer(
        "🎲 <b>Режим случайных слов</b>\n\n"
        "Слова из всех колод в случайном порядке.\n"
        "Отслеживается <b>стрик</b> — серия правильных ответов подряд.\n"
        "Твой <b>максимальный стрик</b> = количество правильных ответов подряд.\n\n"
        "💡 <i>При неправильном ответе или пропуске стрик сбрасывается</i>\n\n"
        "Начинаем тренировку!",
        parse_mode="HTML"
    )
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
        await finish_random_training(message, state, session)
        return
    
    word = words[current_index]
    await message.answer(
        f"<b>{word['front']}</b>\n\n"
        "Вспомни перевод и напиши его:\n\n"
        f"🔥 Текущий стрик: <b>{streak}</b>\n"
        f"🏆 Максимальный стрик: <b>{max_streak}</b>\n\n"
        "💡 <i>При правильном ответе стрик увеличивается, при ошибке — сбрасывается</i>",
        reply_markup=skip_kb(),
        parse_mode="HTML"
    )
    await state.set_state(BotStates.training_random)


@router.message(BotStates.training_random)
async def process_random_answer(message: Message, state: FSMContext, session: AsyncSession):
    data = await state.get_data()
    
    if message.text == "⏹ Закончить тренировку":
        await finish_random_training(message, state, session)
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


async def finish_random_training(message: Message, state: FSMContext, session: AsyncSession):
    data = await state.get_data()
    max_streak = data.get("max_streak", 0)
    
    user_result = await session.execute(
        select(User).where(User.telegram_id == message.from_user.id)
    )
    user = user_result.scalar_one_or_none()
    if user:
        await update_user_activity(user.id, session)
    
    await message.answer(
        f"🎉 Тренировка завершена!\n\nМаксимальный стрик: <b>{max_streak}</b>",
        reply_markup=main_menu_kb(),
        parse_mode="HTML"
    )
    await state.set_state(BotStates.main_menu)


@router.message(F.text == "📝 Предложения", BotStates.choosing_training_mode)
async def start_sentences_training(message: Message, state: FSMContext, session: AsyncSession):
    await message.answer(
        "📝 <b>Режим предложений</b>\n\n"
        "Тебе будет показано предложение с пропущенным словом (___).\n"
        "Выбери правильный вариант из четырех предложенных.\n\n"
        "💡 <i>Можно пропускать предложения кнопкой 'Пропустить'</i>\n\n"
        "Начинаем тренировку!",
        parse_mode="HTML"
    )
    user_result = await session.execute(
        select(User).where(User.telegram_id == message.from_user.id)
    )
    user = user_result.scalar_one_or_none()
    
    if user is None:
        await message.answer("Ошибка: пользователь не найден. Начните с /start")
        await state.set_state(BotStates.main_menu)
        return
    
    result = await session.execute(select(Sentence))
    all_sentences = result.scalars().all()
    
    if not all_sentences:
        await message.answer("В базе нет предложений для тренировки.")
        return
    
    sentences_list = []
    for sentence in all_sentences:
        sentences_list.append({
            "id": sentence.id,
            "word_id": sentence.word_id,
            "sentence_text": sentence.sentence_text,
            "correct_answer": sentence.correct_answer,
            "option1": sentence.option1,
            "option2": sentence.option2,
            "option3": sentence.option3,
            "option4": sentence.option4
        })
    
    shuffle(sentences_list)
    selected_sentences = sentences_list[:20]
    
    await state.update_data(
        mode="sentences",
        sentences=selected_sentences,
        current_index=0,
        correct=0
    )
    
    await show_sentence(message, state, session)


async def show_sentence(message: Message, state: FSMContext, session: AsyncSession):
    data = await state.get_data()
    sentences = data["sentences"]
    current_index = data["current_index"]
    
    if current_index >= len(sentences):
        await finish_sentences_training(message, state, session)
        return
    
    sentence_data = sentences[current_index]
    
    options = [
        sentence_data['option1'],
        sentence_data['option2'],
        sentence_data['option3'],
        sentence_data['option4']
    ]
    
    correct_answer = sentence_data['correct_answer']
    correct_pos = None
    for i, opt in enumerate(options):
        if opt.lower() == correct_answer.lower():
            correct_pos = i
            break
    
    if correct_pos is None:
        options[0] = correct_answer
        correct_pos = 0
    
    shuffle_indices = list(range(4))
    shuffle(shuffle_indices)
    shuffled_options = [options[i] for i in shuffle_indices]
    new_correct_pos = shuffle_indices.index(correct_pos)
    
    await state.update_data(
        current_sentence_id=sentence_data['id'],
        current_word_id=sentence_data['word_id'],
        current_options=shuffled_options,
        correct_position=new_correct_pos
    )
    
    await message.answer(
        f"<b>{sentence_data['sentence_text']}</b>\n\n"
        "Выбери правильный вариант:",
        reply_markup=sentence_options_kb(shuffled_options, current_index),
        parse_mode="HTML"
    )
    await state.set_state(BotStates.training_sentences)


@router.callback_query(F.data.startswith("sentence_option:"), BotStates.training_sentences)
async def process_sentence_answer(callback: CallbackQuery, state: FSMContext, session: AsyncSession):
    data = await state.get_data()
    selected_option = int(callback.data.split(":")[1])
    correct_position = data.get("correct_position")
    
    sentences = data["sentences"]
    current_index = data["current_index"]
    sentence_data = sentences[current_index]
    options = data.get("current_options", [])
    word_id = data.get("current_word_id")
    
    user_result = await session.execute(
        select(User).where(User.telegram_id == callback.from_user.id)
    )
    user = user_result.scalar_one_or_none()
    
    if selected_option >= len(options):
        await callback.answer("Ошибка: неверный вариант", show_alert=True)
        return
    
    selected_word = options[selected_option]
    correct_word = sentence_data['correct_answer']
    
    is_correct = (selected_option == correct_position) and (selected_word.lower() == correct_word.lower())
    
    if is_correct:
        await callback.message.edit_text(
            f"<b>{sentence_data['sentence_text']}</b>\n\n"
            f"✅ <b>Правильно!</b> Ответ: <b>{sentence_data['correct_answer']}</b>",
            parse_mode="HTML"
        )
        correct = data.get("correct", 0) + 1
        await state.update_data(correct=correct)
        
        if word_id:
            stats_result = await session.execute(
                select(UserWordStats)
                .where(UserWordStats.user_id == user.id)
                .where(UserWordStats.word_id == word_id)
            )
            stats = stats_result.scalar_one_or_none()
            
            if stats:
                stats.success_count += 1
                stats.attempt_count += 1
                stats.last_shown_at = datetime.utcnow()
            else:
                stats = UserWordStats(
                    user_id=user.id,
                    word_id=word_id,
                    success_count=1,
                    attempt_count=1,
                    last_shown_at=datetime.utcnow()
                )
                session.add(stats)
            await session.commit()
    else:
        await callback.message.edit_text(
            f"<b>{sentence_data['sentence_text']}</b>\n\n"
            f"❌ Неправильно. Правильный ответ: <b>{sentence_data['correct_answer']}</b>",
            parse_mode="HTML"
        )
        
        if word_id:
            stats_result = await session.execute(
                select(UserWordStats)
                .where(UserWordStats.user_id == user.id)
                .where(UserWordStats.word_id == word_id)
            )
            stats = stats_result.scalar_one_or_none()
            
            if stats:
                stats.attempt_count += 1
                stats.last_shown_at = datetime.utcnow()
            else:
                stats = UserWordStats(
                    user_id=user.id,
                    word_id=word_id,
                    success_count=0,
                    attempt_count=1,
                    last_shown_at=datetime.utcnow()
                )
                session.add(stats)
            await session.commit()
    
    await callback.answer()
    await state.update_data(current_index=current_index + 1)
    await asyncio.sleep(1.5)
    await show_sentence(callback.message, state, session)


@router.callback_query(F.data == "sentence_skip", BotStates.training_sentences)
async def skip_sentence(callback: CallbackQuery, state: FSMContext, session: AsyncSession):
    data = await state.get_data()
    sentences = data["sentences"]
    current_index = data["current_index"]
    sentence_data = sentences[current_index]
    
    await callback.message.edit_text(
        f"<b>{sentence_data['sentence_text']}</b>\n\n"
        f"Правильный ответ: <b>{sentence_data['correct_answer']}</b>",
        parse_mode="HTML"
    )
    await callback.answer()
    await state.update_data(current_index=current_index + 1)
    await asyncio.sleep(1.5)
    await show_sentence(callback.message, state, session)


@router.callback_query(F.data == "sentence_finish", BotStates.training_sentences)
async def finish_sentences_from_callback(callback: CallbackQuery, state: FSMContext, session: AsyncSession):
    await callback.answer()
    await finish_sentences_training(callback.message, state, session)




async def finish_sentences_training(message: Message, state: FSMContext, session: AsyncSession):
    data = await state.get_data()
    correct = data.get("correct", 0)
    
    user_result = await session.execute(
        select(User).where(User.telegram_id == message.from_user.id)
    )
    user = user_result.scalar_one_or_none()
    if user:
        await update_user_activity(user.id, session)
    
    await message.answer(
        f"🎉 Тренировка завершена!\n\nПравильных ответов: <b>{correct}</b>",
        reply_markup=main_menu_kb(),
        parse_mode="HTML"
    )
    await state.set_state(BotStates.main_menu)
