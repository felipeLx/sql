USE employees;

DROP TRIGGER IF EXISTS check_hire_date;

DELIMITER $$

CREATE TRIGGER check_hire_date
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
	IF NEW.hire_date > date_format(sysdate(), '%Y-%m-%d') THEN
		SET NEW.hire_date = date_format(sysdate(), '%Y-%m-%d');
	END IF;
END$$
DELIMITER ;

INSERT employees VALUES ('999904', '1970-01-31', 'John', 'Johnson', 'M', '2025-01-01'); 
SELECT * FROM employees WHERE emp_no = "999904";
SELECT * FROM employees WHERE emp_no = "999904";