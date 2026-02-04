import os
import psycopg2
from psycopg2.extras import execute_values
from dotenv import load_dotenv

load_dotenv()

def Load_data(df, chunk_size = 10_000):
    conn = psycopg2.connect(
        host = os.getenv('DB_HOST'),
        port = os.getenv('DB_PORT'),
        dbname = os.getenv('DB_NAME'),
        user = os.getenv('DB_USER'),
        password = os.getenv('DB_PASSWORD')
    )

    cursor = conn.cursor()

    sql = """
        INSERT INTO stock_prices (
            symbol,
            trade_date,
            open_price,
            high_price,
            low_price,
            close_price,
            volume
        ) VALUES %s
        ON CONFLICT (symbol, trade_date) DO NOTHING
    """

    data = [
        (
            row.symbol,
            row.trade_date,
            row.open_price,
            row.high_price,
            row.low_price,
            row.close_price,
            row.volume
        )
        for row in df.itertuples(index=False)
    ]

    for i in range(0, len(data), chunk_size):
        chunk = data[i:i + chunk_size]
        execute_values(cursor, sql, chunk)

        print(f"✅ Inserted {i + len(chunk):,} rows")

    conn.commit()
    cursor.close()
    conn.close()