# Cross Join
SELECT m.*, d.*
FROM dept_manager m
CROSS JOIN
departments d
ORDER BY m.emp_no, d.dept_no; 

SELECT m.*, d.*
FROM departments d
CROSS JOIN
dept_manager m
WHERE d.dept_no <> m.dept_no 
ORDER BY m.emp_no, d.dept_no;

SELECT m.*, d.*
FROM departments d
CROSS JOIN
dept_manager m
JOIN
employees e ON m.emp_no = e.emp_no
WHERE d.dept_no <> m.dept_no 
ORDER BY m.emp_no, d.dept_no;