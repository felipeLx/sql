SELECT * FROM titles ORDER BY emp_no DESC LIMIT 10;

INSERT INTO titles
(
	emp_no,
    title,
    from_date
)
VALUES
(
	999903,
    'Senior Engineer',
    '1997-10-01'
);

SELECT * FROM titles ORDER BY emp_no DESC LIMIT 10;