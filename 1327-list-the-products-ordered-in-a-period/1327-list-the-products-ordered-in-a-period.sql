WITH order_product AS (
    SELECT *
    FROM Orders A 
    LEFT JOIN Products B 
    ON A.product_id = B.product_id
    WHERE EXTRACT(YEAR FROM order_date) = 2020 
    AND EXTRACT(MONTH FROM order_date) = 02
)

SELECT product_name, SUM(unit) AS unit
FROM order_product
GROUP BY product_name
HAVING SUM(unit) >= 100;