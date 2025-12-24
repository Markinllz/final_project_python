from fastapi import FastAPI, HTTPException
from sqlalchemy import *
from bot.config import DATABASE_URL

app = FastAPI()
engine = create_engine(
    DATABASE_URL.replace("asyncpg", "psycopg2"),
    echo = True
)

metadata = MetaData()
users_table = Table(
    "users",
    metadata,
    Column("id", BigInteger, primary_key=True, autoincrement=True),
    Column("telegram_id", BigInteger, unique=True),
    Column("username", Text),
)
decks_table = Table(
    "decks",
    metadata,
    Column("id", BigInteger, primary_key=True, autoincrement=True),
    Column("name", Text, nullable=False),
    #Column("type", Text, nullable=False, server_default="custom"),
    Column("owner_id", BigInteger, ForeignKey("users.id")))
words_table = Table(
    "words",
    metadata,
    Column("id", BigInteger, primary_key=True, autoincrement=True),
    Column(
        "deck_id",
        BigInteger,
        ForeignKey("decks.id", ondelete="CASCADE"),
        nullable=False
    ),
    Column("front", Text, nullable=False),
    Column("back", Text, nullable=False)
)
user_word_stats_table = Table(
    "user_word_stats",
    metadata,
    Column("id", BigInteger, primary_key=True, autoincrement=True),
    Column(
        "user_id",
        BigInteger,
        ForeignKey("users.id", ondelete="CASCADE"),
        nullable=False
    ),
    Column(
        "word_id",
        BigInteger,
        ForeignKey("words.id", ondelete="CASCADE"),
        nullable=False
    ),
    Column("success_count", Integer, nullable=False, server_default="0"),
    Column("attempt_count", Integer, nullable=False, server_default="0"),
    Column("last_shown_at", DateTime(timezone=True)),
    UniqueConstraint("user_id", "word_id", name="uq_user_word")
)

levels_table = Table(
    "levels",
    metadata,
    Column("id", BigInteger, primary_key=True, autoincrement=True),
    Column("level_name", Text, nullable=False, unique=True)
)
#metadata.create_all(engine)


@app.get("/user/{telegram_id}")
async def get_user(telegram_id: int):
    q = (select(users_table.c.id, users_table.c.username)
         .where(users_table.c.telegram_id == telegram_id))
    res = 0
    with engine.connect() as conn:
        result = conn.execute(q)
        res = result.fetchone()
    # print(conn.execute(select(user_table.c.tgID).where(user_table.c.tgID == a)).rowcount)
    # conn.execute(insert(user_table).values(tgID=a, tgUsername=b))
    # conn.commit()
    if res is None:
        raise HTTPException(status_code=404, detail="User not found")
    return {'id': res.id, 'user_name': res.username}


@app.post("/user/{telegram_id}/{user_name}")
async def create_user(user_name: str, telegram_id: int):
    q = (select(users_table.c.id, users_table.c.username)
         .where(users_table.c.telegram_id == telegram_id))
    res = 0
    with engine.connect() as conn:
        result = conn.execute(q)
        res = result.fetchone()
    if res is not None:
        raise HTTPException(status_code=400, detail="User allready exists")
    q = (insert(users_table)
         .values(username=user_name, telegram_id=telegram_id)
         .returning(users_table.c.id, users_table.c.username))
    with engine.connect() as conn:
        result = conn.execute(q)
        res = result.fetchone()
        conn.commit()
    return {'id': res.id, 'user_name': res.username}


@app.get("/deck/{deck_id}")
async def get_deck(deck_id: int):
    q = (select(decks_table)
         .where(decks_table.c.id == deck_id))
    res = 0
    with engine.connect() as conn:
        result = conn.execute(q)
        res = result.fetchone()
    if res is None:
        raise HTTPException(status_code=404, detail="Deck not found")
    return {'id': res.id, 'name': res.name, 'owner_id': res.owner_id}


@app.post("/deck/{deck_name}/{owner_id}")
async def create_deck(deck_name: str, owner_id: int):
    q = (select(users_table.c.id)
         .where(users_table.c.telegram_id == owner_id))
    owner_db_id = 0
    with (engine.connect() as conn):
        result = conn.execute(q)
        owner_db_id = result.scalar()
    if owner_db_id is None:
        raise HTTPException(status_code=404, detail="User not found")
    q = (insert(decks_table)
         .values(name=deck_name, owner_id=owner_db_id)
         .returning(decks_table))
    res = 0
    with engine.connect() as conn:
        result = conn.execute(q)
        res = result.fetchone()
        conn.commit()
    return {'id': res.id, 'name': res.name, 'owner_id': res.owner_id}


@app.get("/word/{word_id}")
async def get_word(word_id: int):
    q = (select(words_table)
         .where(words_table.c.id == word_id))
    res = 0
    with engine.connect() as conn:
        result = conn.execute(q)
        res = result.fetchone()
    if res is None:
        raise HTTPException(status_code=404, detail="Word not found")
    return {'id': res.id, 'deck_id': res.deck_id,
            'front': res.front, 'back': res.back}


@app.post("/word/{deck_id}/{front}/{back}")
async def create_word(deck_id: int, front: str, back: str):
    q = (select(decks_table.c.id)
         .where(decks_table.c.id == deck_id))
    deck_exists = False
    with engine.connect() as conn:
        result = conn.execute(q)
        deck_exists = result.scalar() is not None

    if not deck_exists:
        raise HTTPException(status_code=404, detail="Deck not found")

    q = (insert(words_table)
         .values(deck_id=deck_id, front=front, back=back)
         .returning(words_table))
    res = 0
    with engine.connect() as conn:
        result = conn.execute(q)
        res = result.fetchone()
        conn.commit()
    return {'id': res.id, 'deck_id': res.deck_id,
            'front': res.front, 'back': res.back}


@app.get("/level/{level_id}")
async def get_level(level_id: int):
    q = (select(levels_table)
         .where(levels_table.c.id == level_id))
    res = 0
    with engine.connect() as conn:
        result = conn.execute(q)
        res = result.fetchone()
    if res is None:
        raise HTTPException(status_code=404, detail="Level not found")
    return {'id': res.id, 'level_name': res.level_name}


@app.post("/level/{level_name}")
async def create_level(level_name: str):
    q = (insert(levels_table)
         .values(level_name=level_name)
         .returning(levels_table))
    res = 0
    with engine.connect() as conn:
        result = conn.execute(q)
        res = result.fetchone()
        conn.commit()
    return {'id': res.id, 'level_name': res.level_name}


@app.get("/user_word_stats/{user_id}/{word_id}")
async def get_user_word_stats(user_id: int, word_id: int):
    q = (select(user_word_stats_table)
         .where(user_word_stats_table.c.user_id == user_id)
         .where(user_word_stats_table.c.word_id == word_id))
    res = 0
    with engine.connect() as conn:
        result = conn.execute(q)
        res = result.fetchone()
    if res is None:
        raise HTTPException(
            status_code=404,
            detail="User word stats not found")
    return {
        'id': res.id,
        'user_id': res.user_id,
        'word_id': res.word_id,
        'success_count': res.success_count,
        'attempt_count': res.attempt_count,
        'last_shown_at': res.last_shown_at
    }


@app.post("/user_word_stats/{user_id}/{word_id}/{success_count}/{attempt_count}")
async def create_user_word_stats(
        user_id: int, word_id: int, success_count: int, attempt_count: int):
    q = (select(users_table.c.id)
         .where(users_table.c.id == user_id))
    user_exists = False
    with engine.connect() as conn:
        result = conn.execute(q)
        user_exists = result.scalar() is not None

    if not user_exists:
        raise HTTPException(status_code=404, detail="User not found")

    q = (select(words_table.c.id)
         .where(words_table.c.id == word_id))
    word_exists = False
    with engine.connect() as conn:
        result = conn.execute(q)
        word_exists = result.scalar() is not None

    if not word_exists:
        raise HTTPException(status_code=404, detail="Word not found")

    q = (insert(user_word_stats_table)
         .values(user_id=user_id, word_id=word_id, success_count=success_count, attempt_count=attempt_count)
         .returning(user_word_stats_table))
    res = 0
    with engine.connect() as conn:
        result = conn.execute(q)
        res = result.fetchone()
        conn.commit()
    return {
        'id': res.id,
        'user_id': res.user_id,
        'word_id': res.word_id,
        'success_count': res.success_count,
        'attempt_count': res.attempt_count,
        'last_shown_at': res.last_shown_at
    }
