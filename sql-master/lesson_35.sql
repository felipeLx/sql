SELECT * FROM departments_dup ORDER BY dept_no;

ALTER TABLE departments_dup
DROP COLUMN dept_manager;
# alter to accept NULL
ALTER TABLE departments_dup
CHANGE COLUMN dept_no dept_no CHAR(4) NULL;

ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

# copy all from departments
INSERT INTO departments_dup
SELECT * FROM departments;

# insert dep_name leaving dep_no NULL
INSERT INTO departments_dup(dept_name) VALUES ("Public Relations");

DELETE FROM departments_dup
WHERE dept_no = "d002";

DELETE FROM departments_dup
WHERE dept_no = "d010" OR dept_no = "d011";

INSERT INTO departments_dup(dept_no) VALUES("d010"),("d011");

COMMIT;
