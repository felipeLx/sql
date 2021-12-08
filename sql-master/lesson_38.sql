SELECT * FROM dept_manager_dup;
SELECT * FROM employees;

SELECT 
    d.emp_no, e.first_name, e.last_name, d.dept_no, d.from_date
FROM
    dept_manager_dup d
        INNER JOIN
    employees e ON e.emp_no = d.emp_no
ORDER BY d.emp_no;

SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, e.hire_date
FROM
    employees e
        INNER JOIN
    dept_manager d ON d.emp_no = e.emp_no
ORDER BY e.emp_no;

