# between and / not between and
SELECT * FROM salaries WHERE salary BETWEEN 66000 AND 70000;
SELECT * FROM employees WHERE emp_no NOT BETWEEN "10004" AND "10012";
SELECT * FROM departments WHERE dept_no BETWEEN "d003" AND "d006";