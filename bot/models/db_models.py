from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, relationship
from sqlalchemy import BigInteger, Text, Integer, DateTime, ForeignKey, UniqueConstraint
from datetime import datetime


class Base(DeclarativeBase):
    pass


class User(Base):
    __tablename__ = "users"
    id: Mapped[int] = mapped_column(
        BigInteger, primary_key=True, autoincrement=True)
    telegram_id: Mapped[int] = mapped_column(
        BigInteger, unique=True, nullable=False)
    username: Mapped[str | None] = mapped_column(Text)


class Deck(Base):
    __tablename__ = "decks"
    id: Mapped[int] = mapped_column(
        BigInteger, primary_key=True, autoincrement=True)
    name: Mapped[str] = mapped_column(Text, nullable=False)
    type: Mapped[str] = mapped_column(
        Text, server_default="custom", nullable=False)
    owner_id: Mapped[int | None] = mapped_column(
        BigInteger, ForeignKey("users.id"))


class Word(Base):
    __tablename__ = "words"
    id: Mapped[int] = mapped_column(
        BigInteger, primary_key=True, autoincrement=True)
    deck_id: Mapped[int] = mapped_column(
        BigInteger,
        ForeignKey(
            "decks.id",
            ondelete="CASCADE"),
        nullable=False)
    front: Mapped[str] = mapped_column(Text, nullable=False)
    back: Mapped[str] = mapped_column(Text, nullable=False)


class UserWordStats(Base):
    __tablename__ = "user_word_stats"
    id: Mapped[int] = mapped_column(
        BigInteger, primary_key=True, autoincrement=True)
    user_id: Mapped[int] = mapped_column(
        BigInteger,
        ForeignKey(
            "users.id",
            ondelete="CASCADE"),
        nullable=False)
    word_id: Mapped[int] = mapped_column(
        BigInteger,
        ForeignKey(
            "words.id",
            ondelete="CASCADE"),
        nullable=False)
    success_count: Mapped[int] = mapped_column(
        Integer, server_default="0", nullable=False)
    attempt_count: Mapped[int] = mapped_column(
        Integer, server_default="0", nullable=False)
    last_shown_at: Mapped[datetime | None] = mapped_column(
        DateTime(timezone=True))

    __table_args__ = (
        UniqueConstraint(
            "user_id",
            "word_id",
            name="uq_user_word"),
    )


class Level(Base):
    __tablename__ = "levels"
    id: Mapped[int] = mapped_column(
        BigInteger, primary_key=True, autoincrement=True)
    level_name: Mapped[str] = mapped_column(
        Text, nullable=False, unique=True)


class UserStats(Base):
    __tablename__ = "user_stats"
    id: Mapped[int] = mapped_column(
        BigInteger, primary_key=True, autoincrement=True)
    user_id: Mapped[int] = mapped_column(
        BigInteger,
        ForeignKey("users.id", ondelete="CASCADE"),
        unique=True,
        nullable=False)
    total_sessions: Mapped[int] = mapped_column(
        Integer, server_default="0", nullable=False)
    current_streak: Mapped[int] = mapped_column(
        Integer, server_default="0", nullable=False)
    max_streak: Mapped[int] = mapped_column(
        Integer, server_default="0", nullable=False)
    last_active_date: Mapped[datetime | None] = mapped_column(
        DateTime(timezone=True))


class Sentence(Base):
    __tablename__ = "sentences"
    id: Mapped[int] = mapped_column(
        BigInteger, primary_key=True, autoincrement=True)
    word_id: Mapped[int] = mapped_column(
        BigInteger,
        ForeignKey("words.id", ondelete="CASCADE"),
        nullable=False)
    sentence_text: Mapped[str] = mapped_column(Text, nullable=False)
    correct_answer: Mapped[str] = mapped_column(Text, nullable=False)
    option1: Mapped[str] = mapped_column(Text, nullable=False)
    option2: Mapped[str] = mapped_column(Text, nullable=False)
    option3: Mapped[str] = mapped_column(Text, nullable=False)
    option4: Mapped[str] = mapped_column(Text, nullable=False)
