USE datacamp_finance;
SELECT
  -- Select the user ID and calculate revenue
  user_id,
  SUM(meal_price * order_quantity) AS revenue
FROM meals AS m
JOIN orders AS o ON m.meal_id = o.meal_id
GROUP BY user_id;


-- Create a CTE named kpi
WITH  kpi AS (
  SELECT
    -- Select the user ID and calculate revenue
    user_id,
    SUM(m.meal_price * o.order_quantity) AS revenue
  FROM meals AS m
  JOIN orders AS o ON m.meal_id = o.meal_id
  GROUP BY user_id)
-- Calculate ARPU
SELECT ROUND(AVG(revenue), 2) AS arpu
FROM kpi;
