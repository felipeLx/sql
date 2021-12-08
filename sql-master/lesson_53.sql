# Subqueries
SELECT * FROM employees;

SELECT e.first_name, e.last_name
FROM employees e
WHERE e.emp_no IN(SELECT
				dm.emp_no
			FROM
				dept_manager dm);
