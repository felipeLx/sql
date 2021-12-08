USE employees;
DROP FUNCTION IF EXISTS f_emp_avg_salary;

DELIMITER $$
USE employees $$
CREATE FUNCTION f_emp_avg_salary(p_emp_no INTEGER) RETURNS DECIMAL(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN
	DECLARE v_avg_salary DECIMAL(10,2);
    SELECT
		AVG(salary)
	INTO v_avg_salary FROM
		employees e
        JOIN
        salaries s ON e.emp_no = s.emp_no
	WHERE e.emp_no = p_emp_no;
RETURN v_avg_salary;
END$$

DELIMITER ;


