SELECT 'HIGH' AS price_type,
       s.symbol,
       s.trade_date,
       s.high_price AS price
FROM stock_prices s
JOIN (
    SELECT symbol, MAX(high_price) AS price
    FROM stock_prices
    GROUP BY symbol
) m
  ON s.symbol = m.symbol AND s.high_price = m.price

UNION ALL

SELECT 'LOW' AS price_type,
       s.symbol,
       s.trade_date,
       s.low_price AS price
FROM stock_prices s
JOIN (
    SELECT symbol, MIN(low_price) AS price
    FROM stock_prices
    GROUP BY symbol
) m
  ON s.symbol = m.symbol AND s.low_price = m.price
ORDER BY symbol, price_type;
