import os
import pandas as pd 
from sqlalchemy import create_engine

ROOT = "./data"
CONN = os.getenv("CONN")

engine = create_engine(CONN)

for file in os.listdir(ROOT):
    if file.endswith(".env") and not file.startswith("payment_"):
        filepath = os.path.join(ROOT, file)
        print(filepath)
        print(table_name)
        pd.read_csv(filepath).to_sql(table_name, con=engine, index=False, if_exists="replace")
        