# temporary table
WITH trips AS (
	SELECT *
	FROM bigquery-public-data.new_york.citibike_trips
	WHERE tripduration > 60)

## count how many are > 60
SELECT COUNT(*) AS cnt
FROM trips;
