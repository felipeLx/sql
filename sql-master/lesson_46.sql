SELECT 
    m.*, d.*
FROM
    dept_manager m
        CROSS JOIN
    departments d
WHERE
    d.dept_no = 'd009'
ORDER BY d.dept_no;

SELECT e.*, d.*
FROM employees e
CROSS JOIN
departments d
WHERE e.emp_no < 10011
ORDER BY e.emp_no, d.dept_name;