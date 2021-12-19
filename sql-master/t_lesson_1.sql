USE employees_mod;
/*
** Create vizualization that provides a breakdown between the male and female
** employees working in the company each year. Starting from 1990
*/
SELECT
	year(de.from_date) as years,
    e.gender,
    count(e.emp_no) as quantity
FROM
	t_employees e
    JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
    WHERE de.from_date > '1989-12-31'
GROUP BY years, gender
ORDER BY years, gender;

SELECT
	year(de.from_date) as years,
    e.gender,
    count(e.emp_no) as qnty
FROM
	t_employees e
    JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
GROUP BY years, gender
HAVING years >= 1990 
ORDER BY years, gender;

	