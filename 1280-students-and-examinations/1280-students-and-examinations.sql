WITH attend_class AS(
    SELECT student_id, subject_name, SUM(1) AS attended_exams
    FROM Examinations
    GROUP BY student_id, subject_name
)

SELECT A.student_id, A.student_name, A.subject_name, CASE WHEN C.attended_exams IS NULL THEN 0 ELSE C.attended_exams END AS attended_exams
FROM (Students CROSS JOIN Subjects) AS A LEFT JOIN attend_class C ON A.student_id = C.student_id AND A.subject_name = C.subject_name
ORDER BY A.student_id, A.subject_name;