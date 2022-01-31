WITH user_revenues AS (
	SELECT
		user_id,
        SUM(meal_price + order_quantity) AS revenue
	FROM meals
    JOIN orders ON meals.meal_id = orders.meal_id
    GROUP BY user_id)

SELECT
	CASE
		WHEN revenue < 150 THEN 'low-revenue users'
        WHEN revenue < 300 THEN 'mid-revenue users'
        ELSE 'high-revenue users'
	END AS revenue_group,
    COUNT(DISTINCT user_id) AS users
FROM user_revenues
GROUP BY revenue_group;