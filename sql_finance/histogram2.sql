WITH user_orders AS (
  SELECT
    user_id,
    COUNT(DISTINCT order_id) AS orders
  FROM orders
  GROUP BY user_id)

SELECT
  -- Return the frequency table of orders by user
  orders,
  COUNT(DISTINCT user_id) AS users
FROM user_orders
GROUP BY orders
ORDER BY orders ASC;