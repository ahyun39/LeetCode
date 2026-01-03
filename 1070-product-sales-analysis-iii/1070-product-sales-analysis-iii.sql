SELECT product_id, year first_year, quantity, price
FROM (
    SELECT product_id, year, quantity, price, RANK() OVER(PARTITION BY product_id ORDER BY year) AS rnk
    FROM Sales
) AS temp
WHERE rnk = 1;