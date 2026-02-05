CREATE TABLE stock_prices (
    id BIGSERIAL PRIMARY KEY,
    symbol VARCHAR(10) NOT NULL,
    trade_date DATE NOT NULL,
    open_price NUMERIC(12,2),
    high_price NUMERIC(12,2),
    low_price NUMERIC(12,2),
    close_price NUMERIC(12,2),
    volume BIGINT,
    created_at TIMESTAMP DEFAULT NOW(),
    UNIQUE (symbol, trade_date)
);

CREATE INDEX idx_stock_prices_symbol
ON stock_prices(symbol);

CREATE INDEX idx_stock_prices_trade_date
ON stock_prices(trade_date);