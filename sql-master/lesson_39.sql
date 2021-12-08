# duplicate records
INSERT INTO dept_manager_dup
VALUES ("110228","d003","1992-03-21","9999-01-01");

insert into departments_dup
VALUES ("d009", "Customer Service");

SELECT * FROM dept_manager_dup ORDER BY dept_no;
SELECT * FROM departments_dup ORDER BY dept_no;

COMMIT;