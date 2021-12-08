USE employees;

SELECT 
    dept_no
FROM
    departments;

SELECT 
    *
FROM
    departments;

# where operator
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
    
# and condition
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';
    
# or operator
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';

#and and or operator
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');