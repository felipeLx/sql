SELECT * FROM departments_dup ORDER BY dept_no;
DROP TABLE departments_dup;
SELECT * FROM dept_manager_dup;

CREATE TABLE departments_dup
SELECT * FROM departments;

ALTER TABLE departments_dup
CHANGE COLUMN dept_no dept_no CHAR(4) NULL;

ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

INSERT INTO departments_dup (dept_no) VALUES ("d010"), ("d011");
DELETE FROM departments_dup
WHERE dept_name = "d010" or dept_name = "d011";
ROLLBACK;

COMMIT;