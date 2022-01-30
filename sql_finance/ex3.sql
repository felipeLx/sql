SELECT
  -- Calculate cost per meal ID
  meals.meal_id,
  SUM(stock.stocked_quantity * meals.meal_cost) AS cost
FROM meals
JOIN stock ON meals.meal_id = stock.meal_id
GROUP BY meals.meal_id
ORDER BY cost DESC
-- Only the top 5 meal IDs by purchase cost
LIMIT 5;