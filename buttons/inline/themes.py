from aiogram.types import InlineKeyboardMarkup, InlineKeyboardButton

THEMES_KB = InlineKeyboardMarkup(
    inline_keyboard=[
        [InlineKeyboardButton("Бизнес", callback_data="business_theme")],
        [InlineKeyboardButton("Повседневное общение", callback_data="everyday_theme")], #бытовой английский
        [InlineKeyboardButton("Путешествия", callback_data="travel_theme")],
        [InlineKeyboardButton("Спорт", callback_data="sport_theme")],
        [InlineKeyboardButton("Политика", callback_data="policy_theme")],
        [InlineKeyboardButton("Кулинария", callback_data="cooking_theme")],
        [InlineKeyboardButton("Фильмы", callback_data="movie_theme")],
        [InlineKeyboardButton("Сериалы", callback_data="series_theme")], #Если Даня реализует, иначе - удалить эту кнопку
        [InlineKeyboardButton("Книги", callback_data="book_theme")],
        [InlineKeyboardButton("Технологии", callback_data="tech_theme")],
        [InlineKeyboardButton("Базовые слова по уровню", callback_data="general_theme")],
        [InlineKeyboardButton("Назад", callback_data="back_to_menu")]
    ]
)

GENERAL_WORDS_KB = InlineKeyboardMarkup(
    inline_keyboard=[
        [InlineKeyboardButton("Базовые слова А1", callback_data="A1_theme")],
        [InlineKeyboardButton("Базовые слова A2", callback_data="A2_theme")],
        [InlineKeyboardButton("Базовые слова B1", callback_data="B1_theme")],
        [InlineKeyboardButton("Базовые слова B2", callback_data="B2_theme")],
        [InlineKeyboardButton("Базовые слова C1", callback_data="C1_theme")],
        [InlineKeyboardButton("Базовые слова C2", callback_data="C2_theme")],
        [InlineKeyboardButton("Назад", callback_data="back_to_menu")]
    ]
)

