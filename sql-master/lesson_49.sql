SELECT e.first_name, e.last_name, e.hire_date, t.title, m.from_date, d.dept_name
FROM employees e
JOIN dept_manager m ON m.emp_no = e.emp_no
JOIN departments d ON d.dept_no = m.dept_no
JOIN titles t ON t.emp_no = e.emp_no
ORDER BY e.emp_no;

/*
first and last name, hire date, job title, start date, and department name.
*/