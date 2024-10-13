SELECT A.product_id, 
       COALESCE(ROUND(SUM(A.price * B.units) / NULLIF(SUM(B.units), 0)::decimal, 2),0) AS average_price
FROM Prices A LEFT JOIN UnitsSold B ON A.product_id = B.product_id 
                                   AND A.start_date <= B.purchase_date
                                   AND B.purchase_date <= A.end_date
GROUP BY A.product_id;
