# JOIN LEFT
DELETE FROM dept_manager_dup
WHERE emp_no = "110228";

DELETE FROM departments_dup
WHERE dept_no = "d009";

INSERT INTO dept_manager_dup
VALUES("110228","d003","1992-03-21","9999-01-01");

INSERT INTO departments_dup
VALUES("d009", "Customer Service");

COMMIT;

SELECT * FROM dept_manager_dup;
SELECT * FROM departments_dup;

SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
LEFT JOIN
departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no; 

SELECT d.dept_no, m.emp_no, d.dept_name
FROM departments_dup d
LEFT JOIN
dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY m.dept_no; 

SELECT d.dept_no, m.emp_no, d.dept_name
FROM departments_dup d
LEFT OUTER JOIN
dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY m.dept_no; 
