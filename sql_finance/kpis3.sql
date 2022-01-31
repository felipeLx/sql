WITH kpi AS (
  SELECT
    -- Select the week, revenue, and count of users
    DATE_TRUNC('week', order_date) :: DATE AS delivr_week,
    SUM(meal_price * order_quantity) AS revenue,
    COUNT(DISTINCT user_id) AS users
  FROM meals AS m
  JOIN orders AS o ON m.meal_id = o.meal_id
  GROUP BY delivr_week)

SELECT
  delivr_week,
  -- Calculate ARPU
  ROUND(
    revenue :: NUMERIC / users,
  2) AS arpu
FROM kpi
-- Order by week in ascending order
ORDER BY delivr_week ASC;