WITH first_order AS (
    SELECT 
        customer_id,
        order_date,
        customer_pref_delivery_date,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS rn
    FROM Delivery
),
order_state AS(
    SELECT 
        customer_id, 
        CASE WHEN order_date = customer_pref_delivery_date THEN 'immediate' ELSE 'scheduled' END AS ord_state
    FROM first_order
    WHERE rn = 1
),
order_state_cnt AS(
    SELECT ord_state, SUM(1) AS state_cnt
    FROM order_state
    GROUP BY ord_state
)

SELECT ROUND(SUM(CASE WHEN ord_state = 'immediate' THEN state_cnt ELSE 0 END)/SUM(state_cnt) ::decimal * 100, 2) AS immediate_percentage
FROM order_state_cnt