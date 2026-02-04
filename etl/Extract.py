import pandas as pd

def Extract_data(file_path: str) -> pd.DataFrame:
    '''
    원본 데이터 추출
    '''

    df = pd.read_csv(file_path)
    print(f"[Extract] rows: {len(df)}")
    return df
