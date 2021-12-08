USE employees;

DROP PROCEDURE IF EXISTS avg_salaries;

DELIMITER $$
CREATE PROCEDURE avg_salaries()
BEGIN
	SELECT ROUND(AVG(salary),2) AS Average_Salary
    FROM salaries;
END$$

DELIMITER ;

SELECT * FROM salaries;

CALL avg_salaries();
CALL avg_salaries;
CALL employees.avg_salaries();
CALL employees.avg_salaries;