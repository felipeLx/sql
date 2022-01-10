# OVER and Partition By
-- calculate separate values for different categories
-- calculate different calculations in the same column

# use an aggregate function to compute a calculation, such as the AVG of the home goal column
AVG(home_goal) OVER(PARTITION BY season)

# how many goals were scored in each match, and how did that compare to the overall average?
SELECT
	date,
    (home_goal + away_goal) AS goals,
    AVG(home_goal + away_goal) OVER() AS overall_avg
FROM match;

SELECT
	date,
    (home_goal + away_goal) AS goals,
    # each season's average on each row, in accordance to the season that each records belongs
    AVG(home_goal + away_goal) OVER(PARTITION BY season) AS overall_avg
FROM match;

# can use PARTITION to calculate values broken out by multiple columns
SELECT
	c.name,
    m.season,
    (home_goal + away_goal) AS goals,
    AVG(home_goal + away_goal)
		OVER(PARTITION BY m.season, c.name) AS season_ctry_avg
FROM country AS c
LEFT JOIN match AS m -- returns the average goals scored broken out by season and country
ON c.id = m.country_id; 