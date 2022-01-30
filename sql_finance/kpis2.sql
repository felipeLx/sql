-- economic / distribuition
WITH kpis AS (
	SELECT
		EXTRACT(YEAR_MONTH FROM order_date) AS delivr_month,
		SUM(meal_price * order_quantity) AS revenue,
        COUNT(DISTINCT user_id) AS users
	FROM meals
    JOIN orders ON meals.meal_id = orders.meal_id
    GROUP BY delivr_month)
    
SELECT
	ROUND(
		revenue / GREATEST(users, 1),
        2) AS arpu
FROM kpis
ORDER BY delivr_month ASC;

WITH users_revenue AS (
	SELECT
		user_id,
        SUM(meal_price * order_quantity) AS revenue
	FROM meals
    JOIN orders ON meals.meal_id = orders.meal_id
    GROUP BY user_id)

SELECT
	ROUND(AVG(revenue), 2) AS arpu
FROM users_revenue;