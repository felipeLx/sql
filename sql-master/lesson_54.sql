# Subqueries


SELECT d.*
FROM dept_manager d
WHERE d.emp_no IN(SELECT
				e.emp_no
			FROM
				employees e
			WHERE e.hire_date BETWEEN "1990-01-01" AND "1995-01-01");

SELECT e.first_name, e.last_name
FROM employees e
WHERE
	EXISTS( SELECT
			*
		FROM
			dept_manager dm
		WHERE
			dm.emp_no = e.emp_no)
ORDER BY emp_no;