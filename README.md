# stock_prices_etl_pipeline
SnP500 주식의 5년치 가격표를 파이썬과 SQL을 활용해 ETL Pipeline을 만들고 분석하는 프로젝트 입니다.

## Datasets
데이터의 용량이 커서 Github에 업로드 되지 않아서 csv파일은 따로 다운로드 해야 합니다.
https://www.kaggle.com/datasets/camnugent/sandp500 여기서 all_stocks_5yr.csv를 다운 받아주시길 바랍니다.

## Modules
외부 모듈들은 bash에 pip install -r requirement.txt 을 써서 다운 받아주시길 바랍니다.

## Connect Database
데이터 베이스의 정보들을 .env에 넣은 후 python-dotenv을 이용해 로드 해주시길 바랍니다. \
ex) \
DB_HOST = host\
DB_PORT = port\
DB_NAME = dbname\
DB_USER = user\
DB_PASSWORD = password\

## Information
Language : Python \
Database : Supabase(PostgreSQL) \
Environment : Github Codespaces

## ETL pipeline design
CSV -> Extract : pd.read_csv -> Transform : 컬럼 정규화, 타입 변환, 결측치 제거 -> Load : PostgreSQL bulk insert (execute_values) -> Supabase

## Project structure
stock_price_etl_pipeline \
├─ main.py \
├─ requirements.txt \
├─ data/ \
│ ├─ all_stocks_5yr.csv \
├─ etl/ \
│ ├─ extract.py \
│ ├─ transform.py \
│ └─ load.py \
├─ .env \
├─ .gitignore \
└─ README.md