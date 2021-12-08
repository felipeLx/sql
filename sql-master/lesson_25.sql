# Update statement
SELECT * FROM employees ORDER BY emp_no DESC LIMIT 10;

UPDATE employees
SET 
	first_name = "Stella",
    last_name = "Arroba",
    birth_date = "1990-12-31",
    gender = "F"
WHERE
	emp_no = 999901;
