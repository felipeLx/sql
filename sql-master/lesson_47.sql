# JOIN + Aggregation function
SELECT e.gender, AVG(s.salary) as avg_salary
FROM employees e
JOIN
salaries s ON e.emp_no = s.emp_no
GROUP BY gender;