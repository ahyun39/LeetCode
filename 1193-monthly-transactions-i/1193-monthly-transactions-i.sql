WITH all_trans AS(
    SELECT country, SUM(1) AS all_trans_cnt, SUM(amount) AS all_trans_amount, TO_CHAR(trans_date, 'YYYY-MM') AS d
    FROM Transactions
    GROUP BY country, d
),
approved AS(
    SELECT country, SUM(1) AS approved_cnt, SUM(amount) AS approved_amount, TO_CHAR(trans_date, 'YYYY-MM') AS d
    FROM Transactions
    WHERE state = 'approved'
    GROUP BY country, d
)
    
SELECT A.d AS month, A.country AS country, A.all_trans_cnt AS trans_count, COALESCE(B.approved_cnt, 0) AS approved_count, A.all_trans_amount AS trans_total_amount, COALESCE(B.approved_amount, 0) AS approved_total_amount
FROM all_trans A LEFT JOIN approved B ON COALESCE(A.country,'COUNTRY_NULL') = COALESCE(B.country, 'COUNTRY_NULL') AND A.d = B.d;