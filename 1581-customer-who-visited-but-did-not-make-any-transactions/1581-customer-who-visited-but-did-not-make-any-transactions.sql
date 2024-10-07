SELECT A.customer_id, SUM(1) AS count_no_trans
FROM Visits A LEFT JOIN Transactions B ON A.visit_id = B.visit_id
WHERE transaction_id IS NULL
GROUP BY customer_id;