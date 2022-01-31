-- RANK, very useful function
SELECT
	user_id,
    SUM(meal_price * order_quantity) AS revenue
FROM meals
JOIN orders ON meals.meal_id = orders.meal_id
GROUP BY user_id
ORDER BY revenue DESC
LIMIT 3;

WITH user_revenues AS(
	SELECT
		user_id,
		SUM(meal_price * order_quantity) AS revenue
	FROM meals
	JOIN orders ON meals.meal_id = orders.meal_id
	GROUP BY user_id)

SELECT
	user_id,
    RANK() OVER(ORDER BY revenue DESC)
		AS revenue_bank
	FROM user_revenues
    ORDER BY revenue_bank DESC
    LIMIT 3;