-- functions to produce reports
SELECT distinct
	order_date,
    TO_CHAR(order_date,
		'FMday 00, FMMonth YYYY') AS format1,
	TO_CHAR(order_date,
		'Dy DD Mon/YYYY') AS format2
FROM orders
ORDER BY order_date ASC
LIMIT 3;

SELECT distinct
	order_date,
    DATE_FORMAT(order_date,
		'%W %D, %M %Y') AS format1,
	DATE_FORMAT(order_date,
		'%W %D/%M %Y') AS format2
FROM orders
ORDER BY order_date ASC
LIMIT 3;

SELECT DISTINCT
  -- Select the order date
  order_date,
  -- Format the order date
  TO_CHAR(order_date, 'FMDay DD, FMMonth YYYY') AS format_order_date
FROM orders
ORDER BY order_date ASC
LIMIT 3;