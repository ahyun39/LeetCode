(SELECT name AS results
FROM MovieRating mr LEFT JOIN Users u ON mr.user_id = u.user_id
GROUP BY mr.user_id
ORDER BY COUNT(rating) DESC, name
LIMIT 1)

UNION ALL

(SELECT title AS results
FROM MovieRating mr LEFT JOIN Movies m ON mr.movie_id = m.movie_id
WHERE DATE_FORMAT(created_at, '%Y-%m')='2020-02'
GROUP BY DATE_FORMAT(created_at, '%Y-%m'), mr.movie_id
ORDER BY AVG(rating) DESC, title
LIMIT 1);
