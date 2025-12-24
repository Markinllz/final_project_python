from aiogram.types import ReplyKeyboardMarkup, KeyboardButton

MENU_KB = ReplyKeyboardMarkup(
    keyboard=[[KeyboardButton("Начать занятие")],
              [KeyboardButton("Темы"), KeyboardButton("Словарь")],
              #Помощь - краткая справка о том, как пользоваться ботом.
              [KeyboardButton("Настройки"), KeyboardButton("Помощь")],
              ],
               resize_keyboard=True
)