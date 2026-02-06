SELECT 'BULL' AS price_type,
        s.symbol,
        s.trade_date,
        (s.close_price - s.open_price) AS price_change
FROM stock_prices s
JOIN (
    SELECT symbol,
    MAX(close_price - open_price) AS price_change
    FROM stock_prices
    GROUP BY symbol
) m
  ON s.symbol = m.symbol AND (s.close_price - s.open_price) = m.price_change

UNION ALL

SELECT 'BEAR' AS price_type,
        s.symbol,
        s.trade_date,
        (s.close_price - s.open_price) AS price_change
FROM stock_prices s
JOIN (
    SELECT symbol,
    MIN(close_price - open_price) AS price_change
    FROM stock_prices
    GROUP BY symbol
) m
  ON s.symbol = m.symbol AND (s.close_price - s.open_price) = m.price_change
ORDER BY symbol, price_type DESC;