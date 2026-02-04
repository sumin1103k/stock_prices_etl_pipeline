import pandas as pd

def Transform_data(df: pd.DataFrame) -> pd.DataFrame:
    '''
    데이터 컬럼명 변경 및 데이터 변환 및 결측치 제거
    '''

    df = df.rename(columns = {
        'Name' : 'symbol',
        'date' : 'trade_date',
        'open' : 'open_price',
        'high' : 'high_price',
        'low' : 'low_price',
        'close' : 'close_price',
    })

    df["trade_date"] = pd.to_datetime(df["trade_date"]).dt.date

    df = df.dropna()

    print(f"[Transform] rows: {len(df)}")

    return df