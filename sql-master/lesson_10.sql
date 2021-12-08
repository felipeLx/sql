# Like with combination of %  _ *
SELECT * FROM employees WHERE first_name LIKE("Mark%");
SELECT * FROM employees WHERE hire_date LIKE("2000%");
SELECT * FROM employees WHERE emp_no LIKE("1000_");
SELECT * FROM employees WHERE first_name LIKE("%Jack%");
SELECT * FROM employees WHERE first_name NOT LIKE("%Jack%");