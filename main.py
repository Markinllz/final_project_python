from fastapi import FastAPI
from sqlalchemy import *
app = FastAPI()
engine = create_engine("sqlite:///testDB.db", echo=True)

metadata = MetaData()
user_table = Table("users", metadata,
                   Column('ID', Integer, primary_key=True),
                    Column('tgID', String, nullable=False),
                    Column('tgUsername', String),
                    sqlite_autoincrement=True
                   )
metadata.create_all(engine)
conn = engine.connect()
@app.get("/{a}/{b}")
async def root(a: str, b: str):
    print(conn.execute(select(user_table.c.tgID).where(user_table.c.tgID == a)).rowcount)
    conn.execute(insert(user_table).values(tgID=a, tgUsername=b))
    conn.commit()
    return ""