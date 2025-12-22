from aiogram.types import ReplyKeyboardMarkup, KeyboardButton, InlineKeyboardMarkup, InlineKeyboardButton

def main_menu_kb():
    buttons = [
        [KeyboardButton(text="📚 Тренировка"), KeyboardButton(text="🃏 Колоды")],
        [KeyboardButton(text="➕ Добавить слова"), KeyboardButton(text="📊 Прогресс")],
        [KeyboardButton(text="⚙️ Настройки")],
    ]
    return ReplyKeyboardMarkup(keyboard=buttons, resize_keyboard=True)

# Инлайн-клавиатуры для тренировки (заглушки)
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