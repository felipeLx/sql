SELECT e.emp_no, e.first_name, e.last_name,
	CASE
		WHEN dm.emp_no IS NOT NULL THEN 'is_manager'
        ELSE 'is_employee'
	END AS position
FROM
	employees e
    LEFT JOIN
    dept_manager dm ON dm.emp_no = e.emp_no
WHERE e.emp_no > 109990;
			