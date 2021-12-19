/*
Compare the average salary by gender with departments filter while is <= 2002
Fields by table:
	employees: gender,
    salaries: salary,
    departments: dept_name,
    dept_emp: from_date
*/
SELECT
	e.gender,
    d.dept_name,
    ROUND(AVG(s.salary), 2) AS salary,
    YEAR(de.from_date) AS years
FROM 
	t_salaries s
		JOIN
	t_employees e ON s.emp_no = e.emp_no
		JOIN
	t_dept_emp de ON de.emp_no = e.emp_no
		JOIN
	t_departments d ON d.dept_no = de.dept_no
GROUP BY d.dept_no, e.gender, years
HAVING years <= 2002
ORDER BY d.dept_no;
    