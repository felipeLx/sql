# nested subqueries
	# subqueries inside another subquery
    # how much did the each country's average differ from the overall average?
SELECT
	c.name as country,
    AVG(m.home_goal + m.away_goal) AS avg_goals,
    AVG(m.home_goal + m.away_goal) -
		(SELECT AVG(home_goal + away_goal)
		FROM match) AS avg_diff
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
GROUP BY country;

	# how does each month's total goals differ from the average monthly total of goals scored?
SELECT
	EXTRACT(MONTH FROM date) AS month,
    SUM(m.home_goal + m.away_goal) AS total_goals,
    SUM(m.home_goal + m.away_goal) -
    (SELECT AVG(goals)
    FROM (SELECT
		EXTRACT(MONTH FROM date) AS month,
        SUM(home_goal + away_goal) AS goals
        FROM match
        GROUP BY month)) AS avg_diff
	FROM match AS m
    GROUP BY month;
    
# INNER subquery
SELECT
	EXTRACT(MONTH FROM date) AS month,
    SUM(home_goal + away_goal) AS goals
FROM match
GROUP BY month;

# OUTER subquery
SELECT AVG(goals)
FROM (SELECT
		EXTRACT(MONTH FROM date) AS month,
        AVG(home_goal + away_goal) AS goals
FROM match
GROUP BY month) AS s;

# FINAL query
SELECT
	EXTRACT(MONTH FROM date) AS month,
    SUM(home_goal + away_goal) AS total_goals,
    SUM(home_goal + away_goal) -
    (SELECT AVG(goals)
    FROM (SELECT
			EXTRACT(MONTH FROM date) AS month,
            SUM(
		  FROM match
          GROUP BY month) AS s) AS diff
FROM match AS m
GROUP BY month;

 # What is the each country's average goals scored in the 2011/2012 season?
SELECT
	c.name AS country,
    (SELECT match AS m
    WHERE m.country_id = c.id
		AND id IN (
			SELECT id
            FROM match
            WHERE season = '2011/2012')) AS avg_goals
FROM country AS c
GROUP BY country;

# What is the each country's average goals scored in the 2011/2012 season?
SELECT
	c.name AS country,
    (SELECT AVG(home_goal + away_goal)
    FROM match AS m
    WHERE m.country_id = c.id -- Correlates with main query
		AND id IN (
			SELECT id -- Begin inner subquery
            FROM match
            WHERE season = '2011/2012')) AS avg_goals
FROM country AS c
GROUP BY country; 
        