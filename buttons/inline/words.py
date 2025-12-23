from aiogram.types import InlineKeyboardMarkup, InlineKeyboardButton


WORDS_KB = InlineKeyboardMarkup(
    inline_keyboard=[
        [InlineKeyboardButton("Добавить слова", callback_data="add_words")],
        #хранение изучаемых/изученных слов
        [InlineKeyboardButton("Личный словарь", callback_data="personal_dict")],
        [InlineKeyboardButton("Назад", callback_data="back_to_menu")]
    ]
)

