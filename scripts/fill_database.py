import asyncio
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent.parent))

from sqlalchemy.ext.asyncio import AsyncSession, create_async_engine, async_sessionmaker
from sqlalchemy import select, text
from bot.config import DATABASE_URL
from bot.models.db_models import Base, Deck, Word

engine = create_async_engine(DATABASE_URL, echo=False)
async_session = async_sessionmaker(engine, class_=AsyncSession, expire_on_commit=False)

DECK_NAMES = {
    1: "Бизнес Английский Light",
    2: "Бытовой Английский Light",
    3: "Бытовой Английский Hard",
    4: "Путешествия Light",
    5: "Бизнес Hard",
    6: "Путешествия Hard",
    7: "Спорт Light",
    8: "Спорт Hard",
    9: "Политика Light",
    10: "Политика Hard",
    11: "Кулинария Light",
    12: "Кулинария Hard",
    13: "Фильмы Light",
    14: "Фильмы Hard",
    15: "Книги Light",
    16: "Книги Hard",
    17: "Технологии Light",
    18: "Технологии Hard",
    19: "General English A1",
}

SAMPLE_WORDS = {
    1: [
        ("meeting", "встреча"), ("deadline", "крайний срок"), ("contract", "договор"),
        ("salary", "зарплата"), ("manager", "менеджер"), ("client", "клиент"),
        ("project", "проект"), ("budget", "бюджет"), ("report", "отчет"),
        ("office", "офис"), ("conference", "конференция"), ("presentation", "презентация"),
        ("agenda", "повестка дня"), ("negotiation", "переговоры"), ("partnership", "партнерство"),
        ("revenue", "доход"), ("expense", "расход"), ("profit", "прибыль"),
    ],
    2: [
        ("hello", "привет"), ("goodbye", "до свидания"), ("please", "пожалуйста"),
        ("thank you", "спасибо"), ("sorry", "извините"), ("excuse me", "извините"),
        ("house", "дом"), ("apartment", "квартира"), ("room", "комната"),
        ("kitchen", "кухня"), ("bathroom", "ванная"), ("bedroom", "спальня"),
        ("table", "стол"), ("chair", "стул"), ("window", "окно"),
        ("door", "дверь"), ("floor", "пол"), ("ceiling", "потолок"),
    ],
    3: [
        ("appliance", "бытовая техника"), ("utensil", "кухонная утварь"), ("household", "домашнее хозяйство"),
        ("maintenance", "обслуживание"), ("renovation", "ремонт"), ("furniture", "мебель"),
        ("wardrobe", "гардероб"), ("cabinet", "шкаф"), ("shelf", "полка"),
        ("drawer", "ящик"), ("curtain", "штора"), ("carpet", "ковер"),
        ("blanket", "одеяло"), ("pillow", "подушка"), ("mattress", "матрас"),
        ("laundry", "стирка"), ("ironing", "глажка"), ("vacuum", "пылесосить"),
    ],
    4: [
        ("passport", "паспорт"), ("ticket", "билет"), ("hotel", "отель"),
        ("luggage", "багаж"), ("flight", "рейс"), ("destination", "направление"),
        ("reservation", "бронь"), ("boarding", "посадка"), ("customs", "таможня"),
        ("visa", "виза"), ("suitcase", "чемодан"), ("backpack", "рюкзак"),
        ("map", "карта"), ("guidebook", "путеводитель"), ("souvenir", "сувенир"),
        ("beach", "пляж"), ("sightseeing", "осмотр достопримечательностей"), ("tourist", "турист"),
    ],
    5: [
        ("merger", "слияние"), ("acquisition", "поглощение"), ("stakeholder", "заинтересованная сторона"),
        ("dividend", "дивиденд"), ("equity", "акционерный капитал"), ("liability", "обязательство"),
        ("asset", "актив"), ("balance sheet", "балансовый отчет"), ("cash flow", "денежный поток"),
        ("forecast", "прогноз"), ("strategy", "стратегия"), ("executive", "руководитель"),
        ("board of directors", "совет директоров"), ("shareholder", "акционер"), ("IPO", "первичное публичное размещение"),
        ("venture capital", "венчурный капитал"), ("startup", "стартап"), ("valuation", "оценка"),
    ],
    6: [
        ("itinerary", "маршрут"), ("accommodation", "размещение"), ("excursion", "экскурсия"),
        ("cruise", "круиз"), ("resort", "курорт"), ("hostel", "хостел"),
        ("check-in", "регистрация"), ("check-out", "выезд"), ("layover", "пересадка"),
        ("jet lag", "смена часовых поясов"), ("travel insurance", "страховка для путешествий"), ("currency exchange", "обмен валюты"),
        ("landmark", "достопримечательность"), ("monument", "памятник"), ("cathedral", "собор"),
        ("museum", "музей"), ("gallery", "галерея"), ("exhibition", "выставка"),
    ],
    7: [
        ("goal", "гол"), ("match", "матч"), ("team", "команда"),
        ("stadium", "стадион"), ("tournament", "турнир"), ("champion", "чемпион"),
        ("coach", "тренер"), ("training", "тренировка"), ("victory", "победа"),
        ("defeat", "поражение"), ("score", "счет"), ("referee", "судья"),
        ("player", "игрок"), ("fan", "болельщик"), ("league", "лига"),
        ("championship", "чемпионат"), ("medal", "медаль"), ("trophy", "трофей"),
    ],
    8: [
        ("endurance", "выносливость"), ("stamina", "выносливость"), ("athlete", "атлет"),
        ("workout", "тренировка"), ("fitness", "фитнес"), ("strength", "сила"),
        ("agility", "ловкость"), ("flexibility", "гибкость"), ("technique", "техника"),
        ("tactics", "тактика"), ("strategy", "стратегия"), ("opponent", "противник"),
        ("rivalry", "соперничество"), ("doping", "допинг"), ("qualification", "квалификация"),
        ("semifinal", "полуфинал"), ("final", "финал"), ("record", "рекорд"),
    ],
    9: [
        ("government", "правительство"), ("parliament", "парламент"), ("election", "выборы"),
        ("vote", "голосовать"), ("candidate", "кандидат"), ("party", "партия"),
        ("policy", "политика"), ("law", "закон"), ("bill", "законопроект"),
        ("minister", "министр"), ("president", "президент"), ("democracy", "демократия"),
        ("republic", "республика"), ("constitution", "конституция"), ("citizen", "гражданин"),
        ("rights", "права"), ("freedom", "свобода"), ("justice", "справедливость"),
    ],
    10: [
        ("diplomacy", "дипломатия"), ("treaty", "договор"), ("alliance", "альянс"),
        ("sanctions", "санкции"), ("embassy", "посольство"), ("ambassador", "посол"),
        ("summit", "саммит"), ("negotiation", "переговоры"), ("compromise", "компромисс"),
        ("sovereignty", "суверенитет"), ("independence", "независимость"), ("regime", "режим"),
        ("coup", "переворот"), ("revolution", "революция"), ("reform", "реформа"),
        ("corruption", "коррупция"), ("scandal", "скандал"), ("protest", "протест"),
    ],
    11: [
        ("recipe", "рецепт"), ("ingredient", "ингредиент"), ("cook", "готовить"),
        ("bake", "печь"), ("fry", "жарить"), ("boil", "варить"),
        ("knife", "нож"), ("fork", "вилка"), ("spoon", "ложка"),
        ("plate", "тарелка"), ("bowl", "миска"), ("pan", "сковорода"),
        ("oven", "духовка"), ("stove", "плита"), ("spice", "специя"),
        ("seasoning", "приправа"), ("flavor", "вкус"), ("taste", "вкус"),
    ],
    12: [
        ("cuisine", "кухня"), ("gourmet", "гурман"), ("chef", "шеф-повар"),
        ("sous chef", "су-шеф"), ("pastry", "выпечка"), ("sauce", "соус"),
        ("marinade", "маринад"), ("garnish", "гарнир"), ("appetizer", "закуска"),
        ("entree", "основное блюдо"), ("dessert", "десерт"), ("beverage", "напиток"),
        ("wine", "вино"), ("cocktail", "коктейль"), ("sommelier", "сомелье"),
        ("menu", "меню"), ("reservation", "бронирование"), ("tip", "чаевые"),
    ],
    13: [
        ("actor", "актер"), ("director", "режиссер"), ("script", "сценарий"),
        ("scene", "сцена"), ("plot", "сюжет"), ("character", "персонаж"),
        ("premiere", "премьера"), ("review", "рецензия"), ("genre", "жанр"),
        ("sequel", "сиквел"), ("trailer", "трейлер"), ("cast", "актерский состав"),
        ("crew", "съемочная группа"), ("cinema", "кинотеатр"), ("screen", "экран"),
        ("ticket", "билет"), ("popcorn", "попкорн"), ("subtitles", "субтитры"),
    ],
    14: [
        ("cinematography", "кинематография"), ("editing", "монтаж"), ("soundtrack", "саундтрек"),
        ("special effects", "спецэффекты"), ("stunt", "трюк"), ("makeup", "грим"),
        ("costume", "костюм"), ("set", "декорация"), ("location", "локация"),
        ("shooting", "съемка"), ("take", "дубль"), ("cut", "стоп"),
        ("blockbuster", "блокбастер"), ("indie film", "независимое кино"), ("documentary", "документальный фильм"),
        ("thriller", "триллер"), ("horror", "ужасы"), ("sci-fi", "научная фантастика"),
    ],
    15: [
        ("book", "книга"), ("novel", "роман"), ("author", "автор"),
        ("chapter", "глава"), ("page", "страница"), ("cover", "обложка"),
        ("library", "библиотека"), ("shelf", "полка"), ("reading", "чтение"),
        ("story", "история"), ("plot", "сюжет"), ("character", "персонаж"),
        ("fiction", "художественная литература"), ("non-fiction", "нон-фикшн"), ("biography", "биография"),
        ("poetry", "поэзия"), ("poem", "стихотворение"), ("verse", "стих"),
    ],
    16: [
        ("literature", "литература"), ("prose", "проза"), ("narrative", "повествование"),
        ("metaphor", "метафора"), ("symbolism", "символизм"), ("allegory", "аллегория"),
        ("protagonist", "главный герой"), ("antagonist", "антагонист"), ("narrator", "рассказчик"),
        ("setting", "место действия"), ("theme", "тема"), ("motif", "мотив"),
        ("epic", "эпос"), ("tragedy", "трагедия"), ("comedy", "комедия"),
        ("satire", "сатира"), ("irony", "ирония"), ("foreshadowing", "предзнаменование"),
    ],
    17: [
        ("computer", "компьютер"), ("software", "программное обеспечение"), ("hardware", "аппаратное обеспечение"),
        ("application", "приложение"), ("program", "программа"), ("code", "код"),
        ("internet", "интернет"), ("website", "веб-сайт"), ("browser", "браузер"),
        ("email", "электронная почта"), ("password", "пароль"), ("download", "скачать"),
        ("upload", "загрузить"), ("file", "файл"), ("folder", "папка"),
        ("keyboard", "клавиатура"), ("mouse", "мышь"), ("screen", "экран"),
    ],
    18: [
        ("algorithm", "алгоритм"), ("database", "база данных"), ("server", "сервер"),
        ("cloud", "облако"), ("encryption", "шифрование"), ("firewall", "файрвол"),
        ("malware", "вредоносное ПО"), ("virus", "вирус"), ("backup", "резервная копия"),
        ("update", "обновление"), ("bug", "ошибка"), ("debug", "отладка"),
        ("API", "API"), ("framework", "фреймворк"), ("library", "библиотека"),
        ("repository", "репозиторий"), ("version control", "контроль версий"), ("deployment", "развертывание"),
    ],
    19: [
        ("hello", "привет"), ("goodbye", "до свидания"), ("please", "пожалуйста"),
        ("thank you", "спасибо"), ("sorry", "извините"), ("yes", "да"),
        ("no", "нет"), ("house", "дом"), ("car", "машина"),
        ("water", "вода"), ("food", "еда"), ("friend", "друг"),
        ("family", "семья"), ("work", "работа"), ("school", "школа"),
        ("time", "время"), ("day", "день"), ("night", "ночь"),
    ],
}


async def create_decks_and_words():
    async with async_session() as session:
        try:
            for deck_id, deck_name in DECK_NAMES.items():
                result = await session.execute(
                    select(Deck).where(Deck.id == deck_id)
                )
                existing_deck = result.scalar_one_or_none()
                
                if existing_deck:
                    print(f"Колода {deck_id} ({deck_name}) уже существует, проверяю слова...")
                    word_result = await session.execute(
                        select(Word).where(Word.deck_id == deck_id)
                    )
                    existing_words = word_result.scalars().all()
                    if len(existing_words) >= 15:
                        print(f"  В колоде уже есть {len(existing_words)} слов, пропускаю...")
                        continue
                    else:
                        print(f"  В колоде {len(existing_words)} слов, добавляю еще...")
                else:
                    await session.execute(
                        text("INSERT INTO decks (id, name, type, owner_id) VALUES (:id, :name, :type, NULL)"),
                        {"id": deck_id, "name": deck_name, "type": "premade"}
                    )
                    print(f"Создана колода {deck_id}: {deck_name}")
                
                if deck_id in SAMPLE_WORDS:
                    words_to_add = SAMPLE_WORDS[deck_id]
                    existing_word_result = await session.execute(
                        select(Word).where(Word.deck_id == deck_id)
                    )
                    existing_words_list = existing_word_result.scalars().all()
                    existing_fronts = {w.front.lower() for w in existing_words_list}
                    
                    words_count = 0
                    for front, back in words_to_add:
                        if front.lower() not in existing_fronts:
                            word = Word(
                                deck_id=deck_id,
                                front=front,
                                back=back
                            )
                            session.add(word)
                            words_count += 1
                            existing_fronts.add(front.lower())
                    
                    if words_count > 0:
                        print(f"  Добавлено {words_count} слов")
                    else:
                        print(f"  Все слова уже есть в колоде")
                else:
                    print(f"  Нет примеров слов для этой колоды")
            
            await session.commit()
            print("\n✅ База данных успешно заполнена!")
            
        except Exception as e:
            await session.rollback()
            print(f"❌ Ошибка при заполнении БД: {e}")
            import traceback
            traceback.print_exc()
            raise


async def main():
    print("Начинаю заполнение базы данных...")
    print(f"Подключение к БД: {DATABASE_URL.split('@')[1] if '@' in DATABASE_URL else DATABASE_URL}\n")
    
    try:
        print("Проверка и создание таблиц...")
        async with engine.begin() as conn:
            await conn.run_sync(Base.metadata.create_all)
        print("Таблицы готовы!\n")
        
        await create_decks_and_words()
    finally:
        await engine.dispose()


if __name__ == "__main__":
    asyncio.run(main())
