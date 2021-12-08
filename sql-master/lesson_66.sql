USE employees;
DROP PROCEDURE IF EXISTS emp_info;

DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_info(in p_first_name VARCHAR(11), in p_last_name VARCHAR(11), out p_employee_id INTEGER)
BEGIN
	SELECT
		e.emp_no
	INTO p_employee_id FROM
		employees e
		WHERE e.first_name = p_first_name AND e.last_name = p_last_name;
END$$

DELIMITER ;


