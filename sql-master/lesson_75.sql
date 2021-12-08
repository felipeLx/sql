SELECT
	emp_no,
	first_name,
    last_name,
    CASE gender
		WHEN 'M' THEN 'Male'
        ELSE 'Female'
	END AS gender
FROM employees;

SELECT e.emp_no, e.first_name, e.last_name,
	CASE
		WHEN dm.emp_no IS NOT NULL THEN "Manager"
        ELSE "Employee"
	END AS is_manager
FROM
	employees e
		LEFT JOIN
	dept_manager dm ON dm.emp_no = e.emp_no
WHERE
	e.emp_no > 109990;
    
SELECT e.emp_no, e.first_name, e.last_name,
	CASE 
		WHEN dm.emp_no IS NOT NULL THEN "Manager"
        ELSE "Employee"
	END AS is_manager
FROM
	employees e
		LEFT JOIN
	dept_manager dm ON dm.emp_no = e.emp_no
WHERE
	e.emp_no > 109990;
    
SELECT emp_no, first_name,
	IF(gender = 'M', 'Male', 'Female') AS gender
FROM
	employees;