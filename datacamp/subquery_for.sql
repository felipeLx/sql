# subqueries in WHERE just can return a single column
# subqueries in FROM
	# Subquery in FROM are also useful when calculating aggregates of aggregate information
    # Restructure and Transform you data
		# Transforming data from long to wide before selecting
        # Prefiltering data
	# Calculating aggregates of aggregates
		# Wich 3 teams has the highest average of home goals scored?
			# Calculate the AVG from each team
            # Get the highest of the AVG values

SELECT
	t.team_long_name AS team,
    AVG(m.home_goal) AS home_avg
FROM match AS m
LEFT JOIN team AS t
ON m.hometeam_id = t.team_api_id
WHERE season = '2011/2012'
GROUP BY team;

# to take the top teams
SELECT team, home_avg
FROM (SELECT
		t.team_long_name AS team,
        AVG(m.home_goal) AS home_avg
	FROM match AS m
    LEFT JOIN team as t
    ON m.hometeam_id = t.team_api_id
    WHERE season = '2011/2012'
    GROUP BY team) AS subquery
ORDER BY home_avg DESC
LIMIT 3;

# thing to remember
	# you can create multiple subqueries in one FROM statement
    # alias them, join them
SELECT 
	-- Select the country ID and match ID
	country_id, 
    id 
FROM match
-- Filter for matches with 10 or more goals in total
WHERE (home_goal + away_goal) >= 10;

SELECT
	-- Select country name and the count match IDs
    c.name AS country_name,
    COUNT(c.id) AS matches
FROM country AS c
-- Inner join the subquery onto country
-- Select the country id and match id columns
INNER JOIN (SELECT country_id, id 
           FROM match
           -- Filter the subquery by matches with 10+ goals
           WHERE (home_goal + away_goal) >= 10) AS sub
ON c.id = sub.country_id
GROUP BY country_name;

SELECT
	-- Select country, date, home, and away goals from the subquery
    country,
    date,
    home_goal,
    away_goal
FROM
	-- Select country name, date, home_goal, away_goal, and total goals in the subquery
	(SELECT c.name AS country, 
     	    m.date, 
     		m.home_goal, 
     		m.away_goal,
           (m.home_goal + m.away_goal) AS total_goals
    FROM match AS m
    LEFT JOIN country AS c
    ON m.country_id = c.id) AS subquery
-- Filter by total goals scored in the main query
WHERE total_goals >= 10;