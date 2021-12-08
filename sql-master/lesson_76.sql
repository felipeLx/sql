SELECT dm.emp_no, e.first_name, MAX(s.salary) - MIN(s.salary) AS salary_diff,
	CASE
		WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary raised more than 30,000'
        WHEN MAX(s.salary) - MIN(s.salary) BETWEEN 20000 AND 3000 THEN 'Salary raised more than 20,000 and less than 30,000'
        ELSE 'Salary was raised less than 20,000'
	END AS salary_increase
FROM
	dept_manager dm
    JOIN
    employees e ON e.emp_no = dm.emp_no
    JOIN
    salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;