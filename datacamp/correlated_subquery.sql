# Simple vs. correlated subqueries
# Simple can be used in extracting, structuring or filtering info, and can run independent of the main query
	# Evaluated once in the whole query
# Correlated cannot be executed on its own because it's dependent on values in the main query.
	# Evaluated in loops / down performance
    
    
# Correlated
SELECT c.name AS country,
AVG(m.home_goal + m.away_goal) AS avg_goals
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
GROUP BY country;

	# what is the avg number of goals scored in each country
SELECT
	c.name AS country,
    (SELECT
		AVG(home_goal + away_goal)
	FROM match AS m
    WHERE m.country_id = c.id) AS avg_goals
FROM country AS c
GROUP BY country;

SELECT 
	-- Select country ID, date, home, and away goals from match
	main.country_id,
    main.date,
    main.home_goal, 
    main.away_goal
FROM match AS main
WHERE 
	-- Filter the main query by the subquery
	(home_goal + away_goal) > 
        (SELECT AVG((sub.home_goal + sub.away_goal) * 3)
         FROM match AS sub
         -- Join the main query to the subquery in WHERE
         WHERE main.country_id = sub.country_id);

SELECT 
	-- Select country ID, date, home, and away goals from match
	main.country_id,
    main.date,
    main.home_goal, 
    main.away_goal
FROM match AS main
WHERE 
	-- Filter the main query by the subquery
	(home_goal + away_goal) > 
        (SELECT AVG((sub.home_goal + sub.away_goal) * 3)
         FROM match AS sub
         -- Join the main query to the subquery in WHERE
         WHERE main.country_id = sub.country_id);