# Join more than two tables
SELECT e.first_name, e.last_name, e.hire_date, m.from_date, d.dept_name
FROM employees e
JOIN dept_manager m ON e.emp_no = m.emp_no
JOIN departments d ON m.dept_no = d.dept_no; 

SELECT e.first_name, e.last_name, e.hire_date, m.from_date, d.dept_name
FROM departments d
JOIN dept_manager m ON d.dept_no = m.dept_no
JOIN employees e ON m.emp_no = e.emp_no; 