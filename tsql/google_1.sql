# Google Data Analysis
# Subquery

SELECT * FROM warehouse_orders.Orders;
SELECT * FROM warehouse_orders.Warehouse;

SELECT 
	warehouse.warehouse_id,
	CONCAT(warehouse.state, ':', warehouse.warehouse_alias) AS warehouse_name,
	COUNT(orders.order_id) AS number_orders,
	(SELECT 
		COUNT(*)
	FROM warehouse_orders.Orders) AS total_orders,
	CASE
		WHEN COUNT(orders.order_id)/(SELECT COUNT(*) FROM warehouse_orders.Orders) <= 0.20
		THEN 'filfilled 0-20% of Orders'
		WHEN COUNT(orders.order_id)/(SELECT COUNT(*) FROM warehouse_orders.Orders) > 0.20
		AND COUNT(orders.order_id)/(SELECT COUNT(*) FROM warehouse_orders.Orders) <= 0.60
		THEN 'filfilled 21-60% of Orders'
		ELSE 'filfilled more then 60% of Orders'
		END AS fulfillment_summary
		HAVING COUNT(orders.order_id) > 0
FROM warehouse_orders.Warehouse AS warehouse
LEFT JOIN warehouse_orders.Orders AS orders
ON warehouse.warehouse_id = orders.warehouse_id
GROUP BY warehouse.warehouse_id, warehouse_name;

