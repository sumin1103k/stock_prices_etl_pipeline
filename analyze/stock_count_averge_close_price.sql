SELECT symbol,
COUNT(*) AS cnt,
AVG(close_price) AS avg_close_price
FROM stock_prices
GROUP BY symbol
ORDER BY avg_close_price DESC;