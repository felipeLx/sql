# aggregated functions, COUNT
SELECT * FROM salaries ORDER BY salary DESC Limit 10;
SELECT COUNT(salary) FROM salaries;
SELECT COUNT(DISTINCT from_date) FROM salaries;
SELECT COUNT(DISTINCT dept_no) FROM departments;