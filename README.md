# stock_prices_etl_pipeline
S&P500 주식의 5년치 가격표를 파이썬과 SQL을 활용해 ETL Pipeline을 만들고 분석하는 프로젝트 입니다. \
Python의 pandas를 활용하여 데이터 추출 및 변환을 하고 \
psycopg2와 dotenv를 활용하여 데이터를 Supabase에 로드하고 \
SQL에서는 SELECT를 활용하여 데이터 분석을 했습니다.

## Datasets
데이터의 용량이 커서 Github에 업로드 되지 않아서 csv파일은 따로 다운로드 해야 합니다.
https://www.kaggle.com/datasets/camnugent/sandp500 여기서 all_stocks_5yr.csv를 다운 받아주시길 바랍니다.

## Modules
외부 모듈들은 bash에 pip install -r requirement.txt 을 써서 다운 받아주시길 바랍니다.

## Create table
데이터베이스에 table/stock_prices.sql 코드들을 사용해 stock_prices 테이블을 만들고 실행시켜야됩니다.

## Connect Database
데이터베이스의 정보들을 .env에 넣은 후 python-dotenv을 이용해 로드 해주시길 바랍니다. \
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

## SQL
SQL에 작성되어있는 코드들은 Supabase의 SQL Editor에서 입력하거나 SQLTools 확장을 다운받아 사용해 주시길 바랍니다..

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
├─ table/ \
│ ├─ stock_prices.sql \
├─ analyze/ \
│ ├─ bull_bear_price_change.sql \
│ ├─ stock_count_averge_close_price.sql \
│ ├─ stock_maxprice_minprice.sql \
├─ .env \
├─ .gitignore \
└─ README.md

# Analyze
## bull_bear_price_change
종목의 상승/하락장세가 가장 차이나는 날과 차이값을 보여주는 분석입니다.
## stock_count_averge_close_price
종목의 갯수와 종가 평균을 보여주는 분석입니다.
## stock_maxprice_minprice.sql
종목의 최고값과 최저값과 날짜를 보여주는 분석입니다.