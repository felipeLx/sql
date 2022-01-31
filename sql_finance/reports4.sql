-- Pivoting: convert a long table with many rows and few columns, into a wide table, with fewer rows and more columns
SELECT
	meal_id,
    DATE_TRUNC('month', order_date) :: DATE AS delivr_month,
    COUNT(DISTINCT orders) :: INT AS revenue
FROM meals
JOIN orders ON meals.meal_id = orders.meal_id
WHERE meals.meal_id IN (0,1)
	AND order_date < '2018-08-01'
GROUP BY meal_id, delivr_month
ORDER BY meal_id, delivr_month;
/*
-- tablefunc is a collection of SQL functions that arent available by default in POSTGRESQL
CREATE EXTENSION IF NOT EXISTS tablefunc;
-- create extension is like import in Python
SELECT * FROM CROSSTAB($$
	TEXT source_sql
$$)

AS ct (meal_id INT,
	  column2 DATA	_TYPE_2,
      ...,
      column3 DATA_TYPE_N)
ORDER BY meal_id ASC;
*/