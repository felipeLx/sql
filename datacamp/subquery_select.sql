# subquery in select
# returns a single value
	# include aggregate values to compare to individual values
# used in mathematical calculations
	# deviation from the average
SELECT
	season,
    COUNT(id) AS matches,
    (SELECT COUNT(id) FROM match) AS total_matches
FROM match
GROUP BY season;

SELECT
	date,
    (home_goal + away_goal) AS goals,
    (home_goal + away_goal) - 2.72 as diff
FROM match
WHERE season = '2011/2012';

SELECT
	date,
    (home_goal + away_goal) AS goals,
    (home_goal + away_goal) - 
		(SELECT AVG(home_goal + away_goal)
        FROM match
        WHERE season = '2011/2012') AS diff
FROM match
WHERE season = '2011/2012';

# subquery in Select: need to return a single value
SELECT 
	l.name AS league,
    -- Select and round the league's total goals
    ROUND(AVG(m.home_goal + m.away_goal), 2) AS avg_goals,
    -- Select & round the average total goals for the season
    (SELECT ROUND(AVG(home_goal + away_goal), 2) 
     FROM match
     WHERE season = '2013/2014') AS overall_avg
FROM league AS l
LEFT JOIN match AS m
ON l.country_id = m.country_id
-- Filter for the 2013/2014 season
WHERE season = '2013/2014'
GROUP BY league;

SELECT
	-- Select the league name and average goals scored
	l.name AS league,
	ROUND(AVG(m.home_goal + m.away_goal),2) AS avg_goals,
    -- Subtract the overall average from the league average
	ROUND(AVG(m.home_goal + m.away_goal) -
		(SELECT AVG(home_goal + away_goal)
		 FROM match 
         WHERE season = '2013/2014'),2) AS diff
FROM league AS l
LEFT JOIN match AS m
ON l.country_id = m.country_id
-- Only include 2013/2014 results
WHERE season = '2013/2014'
GROUP BY l.name;
