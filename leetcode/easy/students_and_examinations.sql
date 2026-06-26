-- Problem: Students and Examinations
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/students-and-examinations

SELECT stu.student_id,
    stu.student_name,
    sub.subject_name,
    COUNT(exam.subject_name) AS attended_exams
FROM Students stu
CROSS JOIN Subjects sub
LEFT JOIN Examinations exam ON stu.student_id = exam.student_id
    AND sub.subject_name = exam.subject_name
GROUP BY stu.student_id,
    stu.student_name,
    sub.subject_name
ORDER BY student_id, subject_name
