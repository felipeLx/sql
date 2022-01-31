-- readability
/*
Dates: use redeable data format
Number: round numbers to 2 decimals
Table shape: reshape long tables into wide ones, pivoting by date when possible
Order: sort
*/

WITH eatery_orders AS (
	SELECT
		eatery,
		TO_CHAR(order_date, 'MM-Mon YYYY') AS delivr_month,
		COUNT(DISTINCT order_id) AS count_orders
	FROM meals
	JOIN orders ON meals.meal_id = orders.meal_id
	WHERE order_date >= '2018-10-01'
	GROUP BY eatery, delivr_month)

SELECT
	eatery,
    delivr_month,
    RANK() OVER
		(PARTITION BY delivr_month
        ORDER BY count_orders DESC) :: INT AS orders_rank
FROM eatery_orders
ORDER BY eatery, delivr_month;

CREATE EXTENSION IF NOT EXISTS tablefunc;

SELECT * FROM CROSSTAB($$
	...
$$) AS ct (eatery TEXT,
			"10-Oct 2018" INT,
            "10-Nov 2018" INT,
            "10-Dec 2018" INT)
ORDER BY eatery ASC;