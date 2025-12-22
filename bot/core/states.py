from aiogram.fsm.state import State, StatesGroup


class BotStates(StatesGroup):
    main_menu = State()

    settings = State()
    choosing_language = State()
    choosing_level = State()
    choosing_reminder_freq = State()

    deck_menu = State()
    choosing_deck = State()
    creating_custom_deck = State()
    adding_word = State()

    training = State()
    showing_answer = State()

    viewing_progress = State()
