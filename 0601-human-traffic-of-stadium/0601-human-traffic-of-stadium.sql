WITH Grouped AS (
    SELECT *,
           id - ROW_NUMBER() OVER (ORDER BY id) AS grp
    FROM Stadium
    WHERE people >= 100
),
Counts AS (
    SELECT *, 
           COUNT(*) OVER (PARTITION BY grp) AS cnt
    FROM Grouped
)
SELECT id, visit_date, people
FROM Counts
WHERE cnt >= 3
ORDER BY visit_date;