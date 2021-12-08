# Old version approach
SELECT

    e.emp_no,

    e.first_name,

    e.last_name,

    dm.dept_no,

    e.hire_date

FROM

    employees e,

    dept_manager dm

WHERE

    e.emp_no = dm.emp_no;



# New Join Syntax:

SELECT

    e.emp_no,

    e.first_name,

    e.last_name,

    dm.dept_no,

    e.hire_date

FROM

    employees e

        JOIN

    dept_manager dm ON e.emp_no = dm.emp_no; 