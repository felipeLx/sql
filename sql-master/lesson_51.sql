SELECT e.gender, COUNT(m.emp_no) AS total_managers
FROM employees e
JOIN dept_manager m ON e.emp_no = m.emp_no
GROUP BY e.gender;

