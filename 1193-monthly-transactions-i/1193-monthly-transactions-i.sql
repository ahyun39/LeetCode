WITH all_trans AS (
    -- 모든 거래에 대한 집계
    SELECT 
        country, 
        SUM(1) AS all_trans_cnt, 
        SUM(amount) AS all_trans_amount, 
        TO_CHAR(trans_date, 'YYYY-MM') AS month
    FROM Transactions
    GROUP BY country, month
),
approved AS (
    -- 승인된 거래에 대한 집계
    SELECT 
        country, 
        SUM(1) AS approved_cnt, 
        SUM(amount) AS approved_amount, 
        TO_CHAR(trans_date, 'YYYY-MM') AS month
    FROM Transactions
    WHERE state = 'approved'
    GROUP BY country, month
)

-- 모든 거래와 승인된 거래를 연결하여 최종 결과 반환
SELECT 
    A.month AS month, 
    A.country AS country, 
    A.all_trans_cnt AS trans_count, 
    COALESCE(B.approved_cnt, 0) AS approved_count, 
    A.all_trans_amount AS trans_total_amount, 
    COALESCE(B.approved_amount, 0) AS approved_total_amount
FROM 
    all_trans A
LEFT JOIN 
    approved B 
    ON COALESCE(A.country, 'NULL') = COALESCE(B.country, 'NULL') 
    AND A.month = B.month;