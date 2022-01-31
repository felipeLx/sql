/**
 percentile
help to understand what percentage of your dataset is beneath a certain value, and what percentage is
 at or above it.

lowest value is the 0th percentile
highest value is the 99th percentile
**/

/**
QUARTILES
example: 25th percentile of users orders is 17, then 25% have ordered 17 times or less
First quartile: 25 percentile
Third quartile: 75 percentile

-- a good way to remove outliers from your dataset is to remove everything outside of 
	the interquartile range or IQR
IQR - all data between the first and third quartiles
**/
WITH user_orders AS (
	SELECT
		user_id,
        COUNT(DISTINCT order_id) AS orders
	FROM orders
    GROUP BY user_id)
    
SELECT
	ROUND(
		PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY orders ASC),
	2) AS orders_p25,
    ROUND(
		PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY orders ASC),
	2) AS orders_p50,
    ROUND(
		PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY orders ASC),
	2) AS orders_p75,
    ROUND(AVG(orders), 2) AS avg_orders
FROM user_orders;
    