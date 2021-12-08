SELECT DISTINCT
    first_name, COUNT(first_name)
FROM
    employees
WHERE
    hire_date > '1999--01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC;

SELECT 
    emp_no, COUNT(emp_no) AS emp_contracts_count
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(emp_no) > 1
ORDER BY emp_no;