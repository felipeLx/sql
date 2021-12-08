SELECT d.dept_name, AVG(s.salary) as avg_salaries
FROM departments d
JOIN dept_manager m ON d.dept_no = m.dept_no
JOIN salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
HAVING avg_salaries > 60000
ORDER BY avg_salaries DESC;