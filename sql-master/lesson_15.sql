#Order By and Group By
SELECT * FROM employees ORDER BY first_name, last_name ASC; #ASC is default

SELECT * FROM employees ORDER BY hire_date DESC;

# Group By is slower than SELECT DISTINCT
SELECT first_name FROM employees GROUP BY first_name;
SELECT DISTINCT first_name FROM employees;

# Always include the field grouped in the Select statement
SELECT first_name, COUNT(first_name) FROM employees GROUP BY first_name ORDER BY first_name DESC;