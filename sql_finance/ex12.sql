-- calculate delta
/**
WITH maus AS(...),
maus_lag AS (...)

SELECT
	delivr_month,
    mau,
    mau - maus_lag
ORDER BY delivr_month
LIMIT 3
**/

-- show one of three things:
-- decreasing <0
-- stable =0
-- increasing >0

-- better to show Growth rate
/*
(current value - previous value) / previous value
SELECT
	delivr_month,
	mau,
    ROUND(
		NUMBER(mau - last_mau) :: NUMERIC /last_mau,
        2) AS growth
	FROM maus_lag
    ORDER BY delivr_month
    LIMIT 3;
*/

WITH mau AS (
  SELECT
    EXTRACT(YEAR_MONTH FROM order_date) AS delivr_month,
    COUNT(DISTINCT user_id) AS mau
  FROM orders
  GROUP BY delivr_month),

  mau_with_lag AS (
  SELECT
    delivr_month,
    mau,
    -- Fetch the previous month's MAU
    COALESCE(
      LAG(mau) OVER (ORDER BY delivr_month ASC),
    0) AS last_mau
  FROM mau)

SELECT
  -- Calculate each month's delta of MAUs
  delivr_month,
  mau - last_mau AS mau_delta
FROM mau_with_lag
-- Order by month in ascending order
ORDER BY delivr_month ASC;