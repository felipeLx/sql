SELECT
	team_long_name,
	team_api_id
FROM teams_germany
WHERE team_long_name IN ('FC Schalke 04', 'FC Bayern Munich');

SELECT 
	CASE WHEN hometeam_id = 9823 THEN 'FC Bayern Munich'
             WHEN hometeam_id = 10189 THEN 'FC Schalke 04'
         ELSE 'Other' END AS home_team,
	COUNT(id) AS total_matches
FROM matches_germany
GROUP BY home_team;