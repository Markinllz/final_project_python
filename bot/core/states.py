from aiogram.fsm.state import State, StatesGroup


class BotStates(StatesGroup):
    main_menu = State()

    settings = State()
    choosing_language = State()
    choosing_level = State()
    choosing_reminder_freq = State()

    choosing_training_mode = State()
    choosing_deck = State()
    
    training_deck = State()
    training_random = State()
    training_sentences = State()
    
    waiting_answer = State()
    
    viewing_progress = State()
