USE employees;
DROP PROCEDURE IF EXISTS emp_avg_salary;

DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_avg_salary(IN p_emp_no INTEGER)
BEGIN
	SELECT
		e.first_name, e.last_name, ROUND(AVG(s.salary),2) AS emp_avg_salary
	FROM
		employees e
			JOIN
		salaries s ON e.emp_no = s.emp_no
	WHERE e.emp_no = p_emp_no
    GROUP BY s.emp_no;
END$$

DELIMITER ;