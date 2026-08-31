import sqlite3
import pandas as pd
from pathlib import Path


# Project paths
BASE_DIR = Path(__file__).resolve().parent.parent

CSV_PATH = BASE_DIR / "data" / "processed" / "ecommerce_orders_clean.csv"
DB_PATH = BASE_DIR / "ecommerce_sales_analysis.db"


# Load cleaned dataset
df = pd.read_csv(CSV_PATH)


# Connect to SQLite database
conn = sqlite3.connect(DB_PATH)


# Load data into the orders table
df.to_sql(
    "orders",
    conn,
    if_exists="replace",
    index=False
)


# Close connection
conn.close()


print("Data loaded successfully into SQLite.")
print(f"Rows: {len(df)}")
print(f"Columns: {len(df.columns)}")
print(f"Database: {DB_PATH}")