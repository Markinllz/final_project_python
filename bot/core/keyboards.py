from aiogram.types import ReplyKeyboardMarkup, KeyboardButton, InlineKeyboardMarkup, InlineKeyboardButton

def main_menu_kb():
    buttons = [
        [KeyboardButton(text="📚 Тренировка"), KeyboardButton(text="📊 Прогресс")],
    ]
    return ReplyKeyboardMarkup(keyboard=buttons, resize_keyboard=True)


def training_modes_kb():
    buttons = [
        [KeyboardButton(text="🃏 По колоде"), KeyboardButton(text="🎲 Случайные слова")],
        [KeyboardButton(text="📝 Предложения"), KeyboardButton(text="⬅️ Назад")],
    ]
    return ReplyKeyboardMarkup(keyboard=buttons, resize_keyboard=True)


def skip_kb():
    buttons = [
        [KeyboardButton(text="⏭ Пропустить")],
        [KeyboardButton(text="⏹ Закончить тренировку")],
    ]
    return ReplyKeyboardMarkup(keyboard=buttons, resize_keyboard=True)


def continue_training_kb():
    buttons = [
        [KeyboardButton(text="➡️ Следующее слово")],
        [KeyboardButton(text="⏹ Закончить тренировку")],
    ]
    return ReplyKeyboardMarkup(keyboard=buttons, resize_keyboard=True)


def training_kb():
    buttons = [
        [InlineKeyboardButton(text="Показать перевод", callback_data="show_back"),
         InlineKeyboardButton(text="Знаю отлично", callback_data="rate:easy")],
        [InlineKeyboardButton(text="Сложно", callback_data="rate:hard"),
         InlineKeyboardButton(text="Не помню", callback_data="rate:again")],
        [InlineKeyboardButton(text="⏹ Закончить", callback_data="stop_training")],
    ]
    return InlineKeyboardMarkup(inline_keyboard=buttons)

def rating_kb():
    buttons = [
        [InlineKeyboardButton(text="Легко 🟢", callback_data="ease:easy"),
         InlineKeyboardButton(text="Хорошо 🟡", callback_data="ease:good")],
        [InlineKeyboardButton(text="Сложно 🟠", callback_data="ease:hard"),
         InlineKeyboardButton(text="Забыл 🔴", callback_data="ease:again")],
    ]
    return InlineKeyboardMarkup(inline_keyboard=buttons)


def sentence_options_kb(options, current_index):
    buttons = []
    for i, option in enumerate(options):
        buttons.append([InlineKeyboardButton(
            text=option,
            callback_data=f"sentence_option:{i}"
        )])
    buttons.append([InlineKeyboardButton(
        text="⏭ Пропустить",
        callback_data="sentence_skip"
    )])
    buttons.append([InlineKeyboardButton(
        text="⏹ Закончить тренировку",
        callback_data="sentence_finish"
    )])
    return InlineKeyboardMarkup(inline_keyboard=buttons)