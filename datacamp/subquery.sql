# subqueries
# useful for intermediary transformations => to your data before selecting, filtering, or calculating information.
SELECT column
FROM (SELECT column
		FROM table) AS subquery;

# What do you do with subqueries
# can be in any part of a query: SELECT, FROM, WHERE, GROUP BY
# can return a variety of information
	# scalar quantities(3.14159, -2, 0.001)
    # a list (id = (12, 25, 392, 401, 939))
    # a table

# WHY SUBQUERIES?
# Comparing groups to summarize values
	# how did Liverpool compare to the English Premier League's average performance for that year?
# Reshaping data
	# What is the highest monthly average goals scored in the Bundesliga?
# Combining data that cannot be joined
	# How do you get both the home and away team names into a table of match results?
    
SELECT home_goal
FROM match
WHERE home_goal > (
	SELECT AVG(home_goal)
    FROM match);
SELECT AVG(home_goal) FROM match;

# Subquery filtering list with IN
	# the team table doesnt have the country ID, but the match table has both: country and team IDs
SELECT
	team_long_name,
    team_short_name AS abbr
FROM team
WHERE
	team_api_id IN
    (SELECT hometeam_id
    FROM match
    WHERE country_id= 15722);

SELECT 
	3 * AVG(home_goal + away_goal)
FROM matches_2013_2014;

SELECT 
	-- Select the date, home goals, and away goals scored
    date,
	home_goal,
	away_goal
FROM  matches_2013_2014
-- Filter for matches where total goals exceeds 3x the average
WHERE (home_goal + away_goal) > 
       (SELECT 3 * AVG(home_goal + away_goal)
        FROM matches_2013_2014);

SELECT 
	-- Select the team long and short names
	team_long_name,
	team_short_name
FROM team 
-- Exclude all values from the subquery
WHERE team_api_id NOT IN
     (SELECT DISTINCT hometeam_ID  FROM match);

SELECT
	-- Select the team long and short names
	team_long_name,
	team_short_name
FROM team
-- Filter for teams with 8 or more home goals
WHERE team_api_id IN
	  (SELECT hometeam_ID 
       FROM match
       WHERE home_goal >= 8);