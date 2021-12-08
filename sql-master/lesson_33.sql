SELECT * FROM departments_dup order by dept_no DESC;

DELETE FROM departments_dup
WHERE dept_no = "d010";

ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL; 

INSERT INTO departments_dup (dept_no) VALUES ("d010"), ("d011");

ALTER TABLE departments_dup
ADD COLUMN dept_manager VARCHAR(255) NULL AFTER dept_name;

SELECT * FROM departments_dup ORDER BY dept_no ASC;

COMMIT;
ROLLBACK;