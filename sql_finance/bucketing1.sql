-- to customize your histogram and create groups,
-- you'll need the CASE statement
-- bucketing allows you to summarize the frequency tables and present a dataset's distribution in a cleaner way

SELECT
	CASE
		WHEN meal_price < 4 THEN 'low-price meal'
		WHEN meal_price < 6 THEN 'mid-price meal'
        ELSE 'high-price meal'
	END AS price_category,
    COUNT(DISTINCT meal_id)
FROM meals
GROUP BY price_category;
    