# Rank
-- rank simply creates a column numbering
-- set highest to lowest, or lowest to highest, based on a column that you specify.

# what is the rank of matches based on number of goals scored?
SELECT
	date,
    (home_goal + away_goal) AS goals
FROM match
WHERE season = '2011/2012';

SELECT
	date,
    (home_goal + away_goal) AS goals,
    -- inside OVER, include the ORDER BY clause, and the column or columns you want to use to generate the rank
    RANK() OVER(ORDER BY home_goal + away_goal DESC) AS goals_rank
FROM match
WHERE season = '2011/2012';

# window functions are processed after the entire query except the final ORDER BY statement
# postgreSQL, ORACLE, MySQL, (not in SQLite)
