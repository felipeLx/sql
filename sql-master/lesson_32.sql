# MAX MIN AVG
SELECT MAX(emp_no) FROM employees;
SELECT MIN(emp_no) FROM employees;
SELECT MAX(salary) FROM salaries;

SELECT AVG(salary) FROM salaries;
SELECT AVG(salary) FROM salaries WHERE from_date > "1997-01-01";

SELECT ROUND(AVG(salary)) FROM salaries;
SELECT ROUND(AVG(salary), 2) FROM salaries;
SELECT ROUND(AVG(salary), 2) FROM salaries WHERE from_date > "1997-01-01";