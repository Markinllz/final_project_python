from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from datetime import datetime
from bot.models.db_models import UserWordStats, UserStats


async def get_user_stats(user_id: int, session: AsyncSession) -> dict:
    result = await session.execute(
        select(UserStats).where(UserStats.user_id == user_id)
    )
    user_stats = result.scalar_one_or_none()
    
    if not user_stats:
        user_stats = UserStats(
            user_id=user_id,
            total_sessions=0,
            current_streak=0,
            max_streak=0
        )
        session.add(user_stats)
        await session.commit()
        await session.refresh(user_stats)
    
    all_stats_result = await session.execute(
        select(UserWordStats)
        .where(UserWordStats.user_id == user_id)
        .where(UserWordStats.attempt_count > 0)
    )
    all_stats = all_stats_result.scalars().all()
    
    learned_words = 0
    for stat in all_stats:
        if stat.attempt_count > 0:
            success_rate = stat.success_count / stat.attempt_count
            if success_rate >= 0.7:
                learned_words += 1
    
    return {
        "learned_words": learned_words,
        "total_sessions": user_stats.total_sessions,
        "current_streak": user_stats.current_streak,
        "max_streak": user_stats.max_streak,
    }


async def update_user_activity(user_id: int, session: AsyncSession):
    result = await session.execute(
        select(UserStats).where(UserStats.user_id == user_id)
    )
    user_stats = result.scalar_one_or_none()
    
    today = datetime.utcnow().date()
    
    if not user_stats:
        user_stats = UserStats(
            user_id=user_id,
            total_sessions=1,
            current_streak=1,
            max_streak=1,
            last_active_date=datetime.utcnow()
        )
        session.add(user_stats)
    else:
        if user_stats.last_active_date:
            last_date = user_stats.last_active_date.date()
            days_diff = (today - last_date).days
            
            if days_diff == 0:
                pass
            elif days_diff == 1:
                user_stats.current_streak += 1
                user_stats.max_streak = max(user_stats.max_streak, user_stats.current_streak)
            else:
                user_stats.current_streak = 1
                user_stats.max_streak = max(user_stats.max_streak, 1)
        else:
            user_stats.current_streak = 1
            user_stats.max_streak = max(user_stats.max_streak, 1)
        
        if user_stats.last_active_date is None or user_stats.last_active_date.date() != today:
            user_stats.total_sessions += 1
        
        user_stats.last_active_date = datetime.utcnow()
    
    await session.commit()

