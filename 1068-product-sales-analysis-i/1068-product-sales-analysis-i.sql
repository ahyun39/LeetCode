SELECT B.product_name, A.year, A.price
FROM Sales A LEFT JOIN Product B ON A.product_id = B.product_id;