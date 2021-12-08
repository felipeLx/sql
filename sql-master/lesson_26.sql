SELECT * FROM departments_dup ORDER BY dept_no DESC;
COMMIT;

UPDATE departments_dup
SET
	dept_no = "d011",
    dept_name = "Quality Control";
    
# ROLLBACK;

COMMIT;