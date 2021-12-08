USE employees;
DROP TRIGGER IF EXISTS before_salaries_insert;

COMMIT;

# Before insert
DELIMITER $$

CREATE TRIGGER before_salaries_insert
BEFORE INSERT ON salaries
FOR EACH ROW
BEGIN
	IF NEW.salary < 0 THEN
		SET NEW.salary = 0;
	END IF;
END$$

DELIMITER ;

INSERT INTO salaries VALUES ('10001', -92000, '2010-06-22', '9999-01-01');

DELETE FROM salaries
WHERE emp_no = "10001" and from_date = "2010-06-22";

SELECT * FROM salaries WHERE emp_no = "10001";