from aiogram.types import InlineKeyboardMarkup, InlineKeyboardButton

SETTINGS_KB = InlineKeyboardMarkup(
    inline_keyboard=[
        [InlineKeyboardButton("Уровень владения", callback_data="settings_level")],
        [InlineKeyboardButton("Управление напоминаниями", callback_data="settings_reminders")],
        [InlineKeyboardButton("Назад", callback_data="back_to_menu")]
    ]
)

LEVEL_KB = InlineKeyboardMarkup(
    inline_keyboard=[
        [InlineKeyboardButton("A1", callback_data="level_A1")],
        [InlineKeyboardButton("A2", callback_data="level_A2")],
        [InlineKeyboardButton("B1", callback_data="level_B1")],
        [InlineKeyboardButton("B2", callback_data="level_B2")],
        [InlineKeyboardButton("C1", callback_data="level_C1")],
        [InlineKeyboardButton("C2", callback_data="level_C2")],
        #тест для определения уровня владения языком
        [InlineKeyboardButton("Определить уровень", callback_data="test_level")],
        [InlineKeyboardButton("Назад", callback_data="back_to_settings")]
    ]
)

REMINDERS_KB = InlineKeyboardMarkup(
    inline_keyboard=[
        [InlineKeyboardButton("Включить", callback_data="turn_on_reminders")],
        [InlineKeyboardButton("Выключить", callback_data="turn_off_reminders")],
        [InlineKeyboardButton("Частота", callback_data="frequency_reminders")],
        [InlineKeyboardButton("Назад", callback_data="back_to_settings")]

    ]
)

FREQUENCY_REMINDERS_KB = InlineKeyboardMarkup(
    inline_keyboard=[
        [InlineKeyboardButton("Каждый день", callback_data="1days")],
        [InlineKeyboardButton("Раз в два дня", callback_data="2days")],
        [InlineKeyboardButton("Раз в неделю", callback_data="7days")],
        [InlineKeyboardButton("Назад", callback_data="back_to_settings")]
    ]
)


