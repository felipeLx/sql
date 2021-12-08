SELECT
	dept_no,
	IFNULL(dept_name,
			"Department name not provided") as dept_name
FROM
	departments_dup;
    
SELECT
	dept_no,
    dept_name,
	COALESCE(dept_manager, dept_name, '#N/A') as dept_manager
FROM
	departments_dup
ORDER BY dept_no ASC;
    
SELECT
	dept_no,
    dept_name,
	COALESCE('New column to be implemented') as dept_manager
FROM
	departments_dup
ORDER BY dept_no ASC;

SELECT 
	dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) as dept_info
FROM
	departments_dup
ORDER BY dept_no ASC;

/*
IFNULL() function to the values from the first and second column,
 so that ‘N/A’ is displayed whenever a department number has no value, 
 and ‘Department name not provided’ is shown if there is no value for ‘dept_name’.
*/
SELECT 
	IFNULL(dept_no, 'NA') as dept_no,
    IFNULL(dept_name,
			'Department not provided') as dept_name,
	COALESCE(dept_no, dept_name) as dept_info
FROM
	departments_dup
ORDER BY dept_no ASC;