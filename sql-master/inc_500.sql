USE test_felipe;
SELECT * FROM inc_500;
SELECT COUNT(*) AS count FROM inc_500 GROUP BY name ORDER BY count DESC;

SELECT
	name,
    (CASE 
		WHEN (workers < previous_workers) THEN 'less'
		WHEN (workers > previous_workers) THEN 'more'
		ELSE 'equal'
    END) AS status
FROM inc_500
GROUP BY name, status
HAVING status = 'less'
ORDER BY status;