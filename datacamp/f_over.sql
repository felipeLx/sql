# window functions
-- perform calculations on an already generated result set (a window)
-- aggregate calculation (whithout having to group your data. just as you did with a subquery in Select)
-- running totals, rankings, moving averages

# how many goals were scored in each match in 2011/2012, and how did that compare to the average?
SELECT
	date,
    (home_goal + away_goal) AS goals,
    (SELECT AVG(home_goal + away_goal)
		FROM match
        WHERE season='2011/2012') AS overall_avg
FROM match
WHERE season = '2011/2012';

SELECT
	date,
    (home_goal + away_goal) AS goals,
    AVG(home_goal + away_goal) OVER() AS overall_avg -- clause common to all window function
FROM match                                             -- pass this aggregate value over this existing result set
WHERE season = '2011/2012'
