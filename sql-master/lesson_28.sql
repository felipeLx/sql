# DELETE statment / Commit and Rollback
USE employees;
COMMIT;

SELECT * FROM employees WHERE emp_no = 999903;
SELECT * FROM titles WHERE emp_no = 999903;

DELETE FROM employees
WHERE
	emp_no = 999903;
    
ROLLBACK;