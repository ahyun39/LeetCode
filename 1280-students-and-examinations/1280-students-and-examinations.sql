SELECT 
    s.student_id, 
    s.student_name, 
    sub.subject_name, 
    IFNULL(e.cnt, 0) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN (
    -- 시험 기록을 미리 집계하여 조인할 데이터 양을 축소
    SELECT student_id, subject_name, COUNT(*) AS cnt
    FROM Examinations
    GROUP BY student_id, subject_name
) e ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
ORDER BY s.student_id, sub.subject_name;