# DELETE statement without WHERE condition : !!
SELECT * FROM departments_dup ORDER BY dept_no DESC;
SELECT * FROM departments ORDER BY dept_no DESC;
ROLLBACK;
DELETE FROM departments_dup;

INSERT INTO departments_dup
(
	dept_no,
    dept_name
)
SELECT
	*
	FROM
	departments
;

UPDATE departments_dup
SET
	dept_name = "Data Analysis"
WHERE
	dept_no = "d010";

DELETE FROM departments
WHERE dept_no = "d010";
COMMIT;