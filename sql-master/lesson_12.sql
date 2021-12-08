# IS NULL and IS NOT NULL
SELECT 
    *
FROM
    departments
WHERE
    'dept_no' IS NOT NULL;
    
SELECT 
    *
FROM
    departments
WHERE
    'dept_no' IS NULL;
