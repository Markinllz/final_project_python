"""FastAPI приложение для работы с API бота изучения английского."""
import logging
from contextlib import asynccontextmanager
from fastapi import FastAPI, HTTPException, Depends, status
from fastapi.responses import JSONResponse
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from sqlalchemy.exc import IntegrityError

from api.config import DATABASE_URL
from api.database import engine, get_db
from api.schemas import (
    UserResponse, UserCreate,
    DeckResponse, DeckCreate,
    WordResponse, WordCreate,
    LevelResponse, LevelCreate,
    UserWordStatsResponse, UserWordStatsCreate
)
from bot.models.db_models import (
    User, Deck, Word, UserWordStats, Level, Base
)

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)


@asynccontextmanager
async def lifespan(app: FastAPI):
    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.create_all)
    logger.info("База данных инициализирована")
    yield
    await engine.dispose()
    logger.info("Подключения к БД закрыты")


app = FastAPI(
    title="English Learning Bot API",
    description="API для Telegram-бота изучения английского языка",
    version="1.0.0",
    lifespan=lifespan
)


@app.exception_handler(IntegrityError)
async def integrity_error_handler(request, exc):
    logger.error(f"Integrity error: {exc}")
    return JSONResponse(
        status_code=status.HTTP_400_BAD_REQUEST,
        content={"detail": "Нарушение целостности данных. Возможно, запись уже существует."}
    )


@app.exception_handler(Exception)
async def general_exception_handler(request, exc):
    logger.error(f"Unexpected error: {exc}", exc_info=True)
    return JSONResponse(
        status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
        content={"detail": "Внутренняя ошибка сервера"}
    )


@app.get("/user/{telegram_id}", response_model=UserResponse)
async def get_user(telegram_id: int, db: AsyncSession = Depends(get_db)):
    try:
        result = await db.execute(
            select(User).where(User.telegram_id == telegram_id)
        )
        user = result.scalar_one_or_none()
        
        if user is None:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail="Пользователь не найден"
            )
        
        return UserResponse(id=user.id, user_name=user.username)
    except HTTPException:
        raise
    except Exception as e:
        logger.error(f"Ошибка при получении пользователя {telegram_id}: {e}")
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Ошибка при получении пользователя"
        )


@app.post("/user/{telegram_id}", response_model=UserResponse, status_code=status.HTTP_201_CREATED)
async def create_user(
    telegram_id: int,
    user_data: UserCreate,
    db: AsyncSession = Depends(get_db)
):
    try:
        result = await db.execute(
            select(User).where(User.telegram_id == telegram_id)
        )
        existing_user = result.scalar_one_or_none()
        
        if existing_user is not None:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="Пользователь уже существует"
            )
        new_user = User(
            telegram_id=telegram_id,
            username=user_data.user_name
        )
        db.add(new_user)
        await db.commit()
        await db.refresh(new_user)
        
        logger.info(f"Создан пользователь: telegram_id={telegram_id}")
        return UserResponse(id=new_user.id, user_name=new_user.username)
    
    except HTTPException:
        raise
    except IntegrityError as e:
        await db.rollback()
        logger.error(f"Ошибка целостности при создании пользователя: {e}")
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Пользователь с таким telegram_id уже существует"
        )
    except Exception as e:
        await db.rollback()
        logger.error(f"Ошибка при создании пользователя: {e}")
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Ошибка при создании пользователя"
        )


@app.get("/deck/{deck_id}", response_model=DeckResponse)
async def get_deck(deck_id: int, db: AsyncSession = Depends(get_db)):
    try:
        result = await db.execute(
            select(Deck).where(Deck.id == deck_id)
        )
        deck = result.scalar_one_or_none()
        
        if deck is None:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail="Колода не найдена"
            )
        
        return DeckResponse(
            id=deck.id,
            name=deck.name,
            owner_id=deck.owner_id,
            type=deck.type
        )
    except HTTPException:
        raise
    except Exception as e:
        logger.error(f"Ошибка при получении колоды {deck_id}: {e}")
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Ошибка при получении колоды"
        )


@app.post("/deck", response_model=DeckResponse, status_code=status.HTTP_201_CREATED)
async def create_deck(
    deck_data: DeckCreate,
    db: AsyncSession = Depends(get_db)
):
    try:
        owner_db_id = None
        if deck_data.owner_id:
            result = await db.execute(
                select(User).where(User.telegram_id == deck_data.owner_id)
            )
            user = result.scalar_one_or_none()
            
            if user is None:
                raise HTTPException(
                    status_code=status.HTTP_404_NOT_FOUND,
                    detail="Пользователь не найден"
                )
            owner_db_id = user.id
        new_deck = Deck(
            name=deck_data.name,
            owner_id=owner_db_id,
            type=deck_data.type
        )
        db.add(new_deck)
        await db.commit()
        await db.refresh(new_deck)
        
        logger.info(f"Создана колода: {new_deck.id} - {new_deck.name}")
        return DeckResponse(
            id=new_deck.id,
            name=new_deck.name,
            owner_id=new_deck.owner_id,
            type=new_deck.type
        )
    
    except HTTPException:
        raise
    except Exception as e:
        await db.rollback()
        logger.error(f"Ошибка при создании колоды: {e}")
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Ошибка при создании колоды"
        )


@app.get("/word/{word_id}", response_model=WordResponse)
async def get_word(word_id: int, db: AsyncSession = Depends(get_db)):
    try:
        result = await db.execute(
            select(Word).where(Word.id == word_id)
        )
        word = result.scalar_one_or_none()
        
        if word is None:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail="Слово не найдено"
            )
        
        return WordResponse(
            id=word.id,
            deck_id=word.deck_id,
            front=word.front,
            back=word.back
        )
    except HTTPException:
        raise
    except Exception as e:
        logger.error(f"Ошибка при получении слова {word_id}: {e}")
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Ошибка при получении слова"
        )


@app.post("/word", response_model=WordResponse, status_code=status.HTTP_201_CREATED)
async def create_word(
    word_data: WordCreate,
    db: AsyncSession = Depends(get_db)
):
    try:
        result = await db.execute(
            select(Deck).where(Deck.id == word_data.deck_id)
        )
        deck = result.scalar_one_or_none()
        
        if deck is None:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail="Колода не найдена"
            )
        new_word = Word(
            deck_id=word_data.deck_id,
            front=word_data.front,
            back=word_data.back
        )
        db.add(new_word)
        await db.commit()
        await db.refresh(new_word)
        
        logger.info(f"Создано слово: {new_word.id} - {new_word.front}")
        return WordResponse(
            id=new_word.id,
            deck_id=new_word.deck_id,
            front=new_word.front,
            back=new_word.back
        )
    
    except HTTPException:
        raise
    except Exception as e:
        await db.rollback()
        logger.error(f"Ошибка при создании слова: {e}")
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Ошибка при создании слова"
        )


@app.get("/level/{level_id}", response_model=LevelResponse)
async def get_level(level_id: int, db: AsyncSession = Depends(get_db)):
    try:
        result = await db.execute(
            select(Level).where(Level.id == level_id)
        )
        level = result.scalar_one_or_none()
        
        if level is None:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail="Уровень не найден"
            )
        
        return LevelResponse(
            id=level.id,
            level_name=level.level_name
        )
    except HTTPException:
        raise
    except Exception as e:
        logger.error(f"Ошибка при получении уровня {level_id}: {e}")
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Ошибка при получении уровня"
        )


@app.post("/level", response_model=LevelResponse, status_code=status.HTTP_201_CREATED)
async def create_level(
    level_data: LevelCreate,
    db: AsyncSession = Depends(get_db)
):
    try:
        new_level = Level(level_name=level_data.level_name)
        db.add(new_level)
        await db.commit()
        await db.refresh(new_level)
        
        logger.info(f"Создан уровень: {new_level.id} - {new_level.level_name}")
        return LevelResponse(
            id=new_level.id,
            level_name=new_level.level_name
        )
    
    except IntegrityError as e:
        await db.rollback()
        logger.error(f"Ошибка целостности при создании уровня: {e}")
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Уровень с таким именем уже существует"
        )
    except Exception as e:
        await db.rollback()
        logger.error(f"Ошибка при создании уровня: {e}")
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Ошибка при создании уровня"
        )


@app.get("/user_word_stats/{user_id}/{word_id}", response_model=UserWordStatsResponse)
async def get_user_word_stats(
    user_id: int,
    word_id: int,
    db: AsyncSession = Depends(get_db)
):
    try:
        result = await db.execute(
            select(UserWordStats)
            .where(UserWordStats.user_id == user_id)
            .where(UserWordStats.word_id == word_id)
        )
        stats = result.scalar_one_or_none()
        
        if stats is None:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail="Статистика не найдена"
            )
        
        return UserWordStatsResponse(
            id=stats.id,
            user_id=stats.user_id,
            word_id=stats.word_id,
            success_count=stats.success_count,
            attempt_count=stats.attempt_count,
            last_shown_at=stats.last_shown_at
        )
    except HTTPException:
        raise
    except Exception as e:
        logger.error(f"Ошибка при получении статистики: {e}")
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Ошибка при получении статистики"
        )


@app.post("/user_word_stats", response_model=UserWordStatsResponse, status_code=status.HTTP_201_CREATED)
async def create_user_word_stats(
    stats_data: UserWordStatsCreate,
    db: AsyncSession = Depends(get_db)
):
    try:
        result = await db.execute(
            select(User).where(User.id == stats_data.user_id)
        )
        user = result.scalar_one_or_none()
        
        if user is None:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail="Пользователь не найден"
            )
        
        result = await db.execute(
            select(Word).where(Word.id == stats_data.word_id)
        )
        word = result.scalar_one_or_none()
        
        if word is None:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail="Слово не найдено"
            )
        result = await db.execute(
            select(UserWordStats)
            .where(UserWordStats.user_id == stats_data.user_id)
            .where(UserWordStats.word_id == stats_data.word_id)
        )
        existing_stats = result.scalar_one_or_none()
        
        if existing_stats:
            existing_stats.success_count = stats_data.success_count
            existing_stats.attempt_count = stats_data.attempt_count
            await db.commit()
            await db.refresh(existing_stats)
            
            logger.info(f"Обновлена статистика: user_id={stats_data.user_id}, word_id={stats_data.word_id}")
            return UserWordStatsResponse(
                id=existing_stats.id,
                user_id=existing_stats.user_id,
                word_id=existing_stats.word_id,
                success_count=existing_stats.success_count,
                attempt_count=existing_stats.attempt_count,
                last_shown_at=existing_stats.last_shown_at
            )
        else:
            new_stats = UserWordStats(
                user_id=stats_data.user_id,
                word_id=stats_data.word_id,
                success_count=stats_data.success_count,
                attempt_count=stats_data.attempt_count
            )
            db.add(new_stats)
            await db.commit()
            await db.refresh(new_stats)
            
            logger.info(f"Создана статистика: user_id={stats_data.user_id}, word_id={stats_data.word_id}")
            return UserWordStatsResponse(
                id=new_stats.id,
                user_id=new_stats.user_id,
                word_id=new_stats.word_id,
                success_count=new_stats.success_count,
                attempt_count=new_stats.attempt_count,
                last_shown_at=new_stats.last_shown_at
            )
    
    except HTTPException:
        raise
    except IntegrityError as e:
        await db.rollback()
        logger.error(f"Ошибка целостности при создании статистики: {e}")
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Нарушение целостности данных"
        )
    except Exception as e:
        await db.rollback()
        logger.error(f"Ошибка при создании статистики: {e}")
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Ошибка при создании статистики"
        )


@app.get("/")
async def root():
    return {
        "message": "English Learning Bot API",
        "version": "1.0.0",
        "docs": "/docs"
    }

