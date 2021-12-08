# Union and Union All
SELECT e.emp_no, e.first_name, e.last_name, NULL as dept_no, NULL as from_date
FROM employees_dup e
WHERE e.emp_no = "10001"
UNION ALL SELECT
	NULL as emp_no,
    NULL as first_name,
    NULL as last_name,
    m.dept_no,
    m.from_date
FROM
	dept_manager m;

SELECT e.emp_no, e.first_name, e.last_name, NULL as dept_no, NULL as from_date
FROM employees_dup e
WHERE e.emp_no = "10001"
UNION SELECT
	NULL as emp_no,
    NULL as first_name,
    NULL as last_name,
    m.dept_no,
    m.from_date
FROM
	dept_manager m;
    
SELECT
    *
FROM
    (SELECT
        e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' UNION SELECT
        NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            dm.dept_no,
            dm.from_date
    FROM
        dept_manager dm) as a
ORDER BY -a.emp_no DESC;