WITH items AS (
    SELECT DISTINCT product_id
    FROM Products
)

SELECT DISTINCT A.product_id, CASE WHEN B.new_price IS NULL THEN 10 ELSE B.new_price END AS price
FROM items A LEFT JOIN (
    SELECT product_id, new_price, ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rn
    FROM Products
    WHERE change_date <= '2019-08-16'
) B ON A.product_id = B.product_id
WHERE rn = 1 OR rn IS NULL
