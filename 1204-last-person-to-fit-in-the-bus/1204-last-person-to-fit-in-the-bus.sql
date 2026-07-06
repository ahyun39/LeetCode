SELECT person_name
FROM(
SELECT person_name, SUM(weight) OVER(ORDER BY turn) AS sw
FROM Queue
) AS p
WHERE sw <= 1000
ORDER BY sw DESC
LIMIT 1;