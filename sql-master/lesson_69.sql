USE employees;
DROP FUNCTION IF EXISTS f_emp_info;
/*
Create a function called ‘emp_info’ that takes for parameters the first
 and last name of an employee, and returns the salary from the newest contract 
 of that employee.
*/
DELIMITER $$
CREATE FUNCTION f_emp_info(f_first VARCHAR(14), f_last VARCHAR(14)) RETURNS DECIMAL(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN
	DECLARE v_max_from DATE;
    DECLARE v_salary DECIMAL(10,2);
    SELECT
		MAX(s.from_date)
	INTO v_max_from FROM
		employees e
        JOIN
        salaries s ON e.emp_no = s.emp_no
	WHERE e.first_name = f_first AND e.last_name = f_last;
    
    SELECT s.salary
    INTO v_salary FROM
		employees e
        JOIN
        salaries s ON e.emp_no = s.emp_no
	WHERE e.first_name = f_first AND e.last_name = f_last
    AND s.from_date = v_max_from;
    
    RETURN v_salary;
END$$
DELIMITER ;
SELECT f_emp_info('Aruna', 'Journel');