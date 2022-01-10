SELECT
	c.name AS country,
    COUNT(s.id) AS matches
FROM country AS c
INNER JOIN (
	SELECT country_id, id
    FROM match
    WHERE (home_goal + away_goal) >= 10) AS s
ON c.id = s.country_id
GROUP BY country;

# tranforming in subquery
WITH s AS (SELECT country_id, id
FROM match
WHERE (home_goal + away_goal) >= 10)
SELECT 
	c.name AS country,
    COUNT(s.id) AS matches
FROM country AS c
INNER JOIN s
ON c.id = s.country_id
GROUP BY country;

# all togheter
WITH s AS (
	SELECT country_id, id
    FROM match
    WHERE (home_goal + away_goal) >= 10),
s2 AS (            -- New subquery
	SELECT country_id, id
    FROM match
    WHERE (home_goal + away_goal) <= 1
)
SELECT
	c.name AS country,
    COUNT(s1.id) AS high_scores,
    COUNT(s2.id) AS low_scores     -- New column
FROM country AS c
INNER JOIN s1
ON c.id = s1.country_id
INNER JOIN s2                      -- New join
ON c.id = s2.country_id
GROUP BY country;

# CTE:
	# executed once: CTE is then stored in memory
    # improve query performance
    # improve organization of queries
	# refering itself (SELF JOIN)
-- Set up your CTE
WITH match_list AS (
    SELECT 
  		country_id, 
  		id
    FROM match
    WHERE (home_goal + away_goal) >= 10)
-- Select league and count of matches from the CTE
SELECT
    l.name AS league,
    COUNT(match_list.id) AS matches
FROM league AS l
-- Join the CTE to the league table
LEFT JOIN match_list 
ON l.id = match_list.country_id
GROUP BY l.name;

-- Set up your CTE
WITH match_list AS (
  -- Select the league, date, home, and away goals
    SELECT 
  		l.name AS league, 
     	m.date, 
  		m.home_goal, 
  		m.away_goal,
       (m.home_goal + m.away_goal) AS total_goals
    FROM match AS m
    LEFT JOIN league as l ON m.country_id = l.id)
-- Select the league, date, home, and away goals from the CTE
SELECT league, date, home_goal, away_goal
FROM match_list
-- Filter by total goals
WHERE total_goals >= 10;

-- Set up your CTE
WITH match_list AS (
    SELECT 
  		country_id,
  	   (home_goal + away_goal) AS goals
    FROM match
  	-- Create a list of match IDs to filter data in the CTE
    WHERE id IN (
       SELECT id
       FROM match
       WHERE season = '2013/2014' AND EXTRACT(MONTH FROM date) = 8))
-- Select the league name and average of goals in the CTE
SELECT 
	l.name,
    AVG(match_list.goals)
FROM league AS l
-- Join the CTE onto the league table
LEFT JOIN match_list ON l.id = match_list.country_id
GROUP BY l.name;