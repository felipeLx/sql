CREATE INDEX i_hire_date ON employees(hire_date);

ALTER TABLE employees
DROP INDEX i_hire_date;

CREATE INDEX i_names ON employees(first_name, last_name);


SELECT * FROM employees
WHERE first_name = "Georgi"
	AND last_name = "Facello";