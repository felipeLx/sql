DROP TABLE IF EXISTS employees_dup;
CREATE TABLE employees_dup (
	emp_no 		int(11),
	birth_date 	date,
	first_name 	varchar(14),
	last_name	varchar(16),
	gender		enum('M','F'),
	hire_date	date
);

INSERT INTO employees_dup
SELECT e.* FROM employees e
LIMIT 20;

COMMIT;

INSERT INTO employees_dup
VALUES ("10001","1953-09-02","Georgi","Facello","M","1986-06-26");

SELECT * FROM employees_dup;
