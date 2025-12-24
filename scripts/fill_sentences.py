import asyncio
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent.parent))

from sqlalchemy.ext.asyncio import AsyncSession, create_async_engine, async_sessionmaker
from sqlalchemy import select, text
from bot.config import DATABASE_URL
from bot.models.db_models import Base, Word, Sentence
from random import choice, shuffle

engine = create_async_engine(DATABASE_URL, echo=False)
async_session = async_sessionmaker(engine, class_=AsyncSession, expire_on_commit=False)

SENTENCES_DATA = {
    "meeting": {
        "sentence": "I need to schedule a ___ tomorrow.",
        "options": ["meeting", "flight", "dinner", "exercise"]
    },
    "deadline": {
        "sentence": "The project ___ is next Friday.",
        "options": ["deadline", "manager", "office", "report"]
    },
    "contract": {
        "sentence": "We signed a new ___ with the client.",
        "options": ["contract", "meeting", "report", "budget"]
    },
    "salary": {
        "sentence": "My ___ increased this year.",
        "options": ["salary", "project", "client", "strategy"]
    },
    "manager": {
        "sentence": "The ___ approved our proposal.",
        "options": ["manager", "contract", "deadline", "investment"]
    },
    "client": {
        "sentence": "Our new ___ is very satisfied.",
        "options": ["client", "salary", "profit", "loss"]
    },
    "project": {
        "sentence": "This ___ will take three months.",
        "options": ["project", "meeting", "contract", "report"]
    },
    "budget": {
        "sentence": "We need to reduce the ___.",
        "options": ["budget", "salary", "profit", "investment"]
    },
    "report": {
        "sentence": "Please send me the ___ by email.",
        "options": ["report", "contract", "meeting", "deadline"]
    },
    "office": {
        "sentence": "I'll be in the ___ all day.",
        "options": ["office", "airport", "hotel", "restaurant"]
    },
    "negotiation": {
        "sentence": "The ___ lasted for hours.",
        "options": ["negotiation", "meeting", "flight", "dinner"]
    },
    "investment": {
        "sentence": "This is a good ___ opportunity.",
        "options": ["investment", "meeting", "report", "contract"]
    },
    "profit": {
        "sentence": "The company made a huge ___.",
        "options": ["profit", "loss", "budget", "salary"]
    },
    "loss": {
        "sentence": "We suffered a significant ___.",
        "options": ["loss", "profit", "budget", "investment"]
    },
    "strategy": {
        "sentence": "We need a new marketing ___.",
        "options": ["strategy", "report", "contract", "meeting"]
    },
    "marketing": {
        "sentence": "Our ___ campaign was successful.",
        "options": ["marketing", "investment", "profit", "loss"]
    },
    "innovation": {
        "sentence": "This product is a real ___.",
        "options": ["innovation", "contract", "report", "meeting"]
    },
    "partnership": {
        "sentence": "We formed a new ___ with them.",
        "options": ["partnership", "contract", "meeting", "report"]
    },
    "airport": {
        "sentence": "We arrived at the ___ early.",
        "options": ["airport", "hotel", "restaurant", "office"]
    },
    "hotel": {
        "sentence": "The ___ has a great view.",
        "options": ["hotel", "airport", "restaurant", "office"]
    },
    "passport": {
        "sentence": "Don't forget your ___.",
        "options": ["passport", "ticket", "luggage", "reservation"]
    },
    "luggage": {
        "sentence": "My ___ was lost at the airport.",
        "options": ["luggage", "passport", "ticket", "reservation"]
    },
    "ticket": {
        "sentence": "I bought a ___ for the concert.",
        "options": ["ticket", "passport", "luggage", "reservation"]
    },
    "reservation": {
        "sentence": "I made a ___ for dinner.",
        "options": ["reservation", "ticket", "passport", "luggage"]
    },
    "flight": {
        "sentence": "Our ___ was delayed.",
        "options": ["flight", "meeting", "dinner", "exercise"]
    },
    "restaurant": {
        "sentence": "This ___ serves Italian food.",
        "options": ["restaurant", "hotel", "airport", "office"]
    },
    "beach": {
        "sentence": "We spent the day at the ___.",
        "options": ["beach", "office", "airport", "hotel"]
    },
    "sightseeing": {
        "sentence": "We went ___ in the city.",
        "options": ["sightseeing", "shopping", "working", "sleeping"]
    },
    "currency": {
        "sentence": "What's the local ___ here?",
        "options": ["currency", "language", "weather", "food"]
    },
    "coach": {
        "sentence": "The ___ trained the team well.",
        "options": ["coach", "manager", "client", "director"]
    },
    "stadium": {
        "sentence": "The ___ was full of fans.",
        "options": ["stadium", "office", "hotel", "restaurant"]
    },
    "championship": {
        "sentence": "They won the ___ last year.",
        "options": ["championship", "meeting", "contract", "report"]
    },
    "victory": {
        "sentence": "It was a great ___.",
        "options": ["victory", "loss", "meeting", "report"]
    },
    "defeat": {
        "sentence": "The team suffered a ___.",
        "options": ["defeat", "victory", "meeting", "contract"]
    },
    "training": {
        "sentence": "Daily ___ is important.",
        "options": ["training", "meeting", "report", "contract"]
    },
    "recipe": {
        "sentence": "Follow this ___ carefully.",
        "options": ["recipe", "contract", "report", "meeting"]
    },
    "ingredient": {
        "sentence": "Add all ___ to the bowl.",
        "options": ["ingredients", "reports", "contracts", "meetings"]
    },
    "kitchen": {
        "sentence": "The ___ is very modern.",
        "options": ["kitchen", "office", "airport", "hotel"]
    },
    "cook": {
        "sentence": "I love to ___ dinner.",
        "options": ["cook", "eat", "buy", "order"]
    },
    "taste": {
        "sentence": "This food has a great ___.",
        "options": ["taste", "price", "size", "color"]
    },
    "movie": {
        "sentence": "We watched a great ___.",
        "options": ["movie", "meeting", "contract", "report"]
    },
    "actor": {
        "sentence": "The ___ performed brilliantly.",
        "options": ["actor", "manager", "client", "director"]
    },
    "director": {
        "sentence": "The ___ won an award.",
        "options": ["director", "actor", "manager", "client"]
    },
    "scene": {
        "sentence": "This ___ was very emotional.",
        "options": ["scene", "meeting", "contract", "report"]
    },
    "plot": {
        "sentence": "The ___ was very interesting.",
        "options": ["plot", "meeting", "contract", "report"]
    },
    "character": {
        "sentence": "The main ___ was brave.",
        "options": ["character", "manager", "client", "director"]
    },
    "book": {
        "sentence": "I'm reading a good ___.",
        "options": ["book", "report", "contract", "meeting"]
    },
    "author": {
        "sentence": "The ___ wrote many novels.",
        "options": ["author", "manager", "client", "director"]
    },
    "chapter": {
        "sentence": "I finished the first ___.",
        "options": ["chapter", "meeting", "contract", "report"]
    },
    "technology": {
        "sentence": "Modern ___ changes quickly.",
        "options": ["technology", "meeting", "contract", "report"]
    },
    "computer": {
        "sentence": "My ___ is very fast.",
        "options": ["computer", "meeting", "contract", "report"]
    },
    "software": {
        "sentence": "This ___ is easy to use.",
        "options": ["software", "meeting", "contract", "report"]
    },
    "internet": {
        "sentence": "The ___ connection is slow.",
        "options": ["internet", "meeting", "contract", "report"]
    },
    "email": {
        "sentence": "I sent an ___ yesterday.",
        "options": ["email", "meeting", "contract", "report"]
    }
}

async def create_sentences():
    async with async_session() as session:
        try:
            await session.execute(text("DELETE FROM sentences"))
            await session.commit()
            
            result = await session.execute(select(Word))
            all_words = result.scalars().all()
            
            sentences_created = 0
            processed_words = set()
            
            for word in all_words:
                word_front = word.front.lower()
                
                if word_front in SENTENCES_DATA and sentences_created < 20:
                    sentence_data = SENTENCES_DATA[word_front]
                    
                    if word_front in processed_words:
                        continue
                    
                    options = sentence_data["options"].copy()
                    options_lower = [opt.lower() for opt in options]
                    if word.front.lower() not in options_lower:
                        options[0] = word.front
                    else:
                        for i, opt in enumerate(options):
                            if opt.lower() == word.front.lower():
                                options[i] = word.front
                                break
                    
                    shuffle(options)
                    correct_pos = next(i for i, opt in enumerate(options) if opt.lower() == word.front.lower())
                    
                    sentence = Sentence(
                        word_id=word.id,
                        sentence_text=sentence_data["sentence"],
                        correct_answer=word.front,
                        option1=options[0],
                        option2=options[1],
                        option3=options[2],
                        option4=options[3]
                    )
                    session.add(sentence)
                    sentences_created += 1
                    processed_words.add(word_front)
            
            await session.commit()
            print(f"\n✅ Создано {sentences_created} предложений!")
            
        except Exception as e:
            await session.rollback()
            print(f"❌ Ошибка при создании предложений: {e}")
            import traceback
            traceback.print_exc()
            raise


async def main():
    print("Начинаю создание предложений...")
    print(f"Подключение к БД: {DATABASE_URL.split('@')[1] if '@' in DATABASE_URL else DATABASE_URL}\n")
    
    try:
        print("Проверка и создание таблиц...")
        async with engine.begin() as conn:
            await conn.run_sync(Base.metadata.create_all)
        print("Таблицы готовы!\n")
        
        await create_sentences()
    finally:
        await engine.dispose()


if __name__ == "__main__":
    asyncio.run(main())

