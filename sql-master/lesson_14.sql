# Distinct and introduction lesson row count
SELECT DISTINCT hire_date FROM employees;

SELECT COUNT(DISTINCT first_name) FROM employees;

SELECT COUNT(*) FROM salaries WHERE salary >= 100000;

SELECT COUNT(*) FROM dept_manager;