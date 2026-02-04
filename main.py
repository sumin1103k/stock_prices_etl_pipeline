from etl.Extract import Extract_data
from etl.Transform import Transform_data
from etl.Load import Load_data

def main():
    row_data = Extract_data('data/all_stocks_5yr.csv')
    clean_data = Transform_data(row_data)
    Load_data(clean_data)

if __name__ == "__main__":
    main()