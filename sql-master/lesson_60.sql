CREATE OR REPLACE VIEW v_avg_manager_salary AS
	SELECT AVG(s.salary)
    FROM salaries s
    JOIN
    dept_manager dm ON s.emp_no = dm.emp_no;

SELECT ROUND(AVG(s.salary),2)
    FROM salaries s
    JOIN
    dept_manager dm ON s.emp_no = dm.emp_no;