WITH all_action AS(
    SELECT user_id, SUM(1) AS action_cnt
    FROM Confirmations
    GROUP BY user_id
),
confirmed AS(
    SELECT user_id, SUM(1) AS confirmed_cnt
    FROM Confirmations
    WHERE action = 'confirmed'
    GROUP BY user_id
),
divide AS(
    SELECT A.user_id, ROUND(B.confirmed_cnt / A.action_cnt ::decimal, 2) AS confirmation_rate
    FROM all_action A LEFT JOIN confirmed B ON A.user_id = B.user_id
    )

SELECT A.user_id, COALESCE(B.confirmation_rate, 0,00) AS confirmation_rate
FROM Signups A LEFT JOIN divide B ON A.user_id = B.user_id;