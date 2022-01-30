-- economic / distribuition
WITH kpis AS (
	SELECT
		SUM(meal_price * order_quantity) AS revenue,
        COUNT(DISTINCT user_id) AS users
	FROM meals
    JOIN orders ON meals.meal_id = orders.meal_id)
    
SELECT
	ROUND(
		revenue:: NUMERIC / GREATEST(users, 1),
        2) AS arpu
FROM kpis
ORDER BY delivr_month ASC;