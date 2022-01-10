USE datacamp;
CREATE TABLE teams (
	team_id INT NOT NULL,
    name VARCHAR(30) NOT NULL,
    UNIQUE(team_id)
);

INSERT INTO teams
VALUES
	(10, 'Give'),
    (20, 'Never'),
    (30, 'You'),
    (40, 'Up'),
    (50, 'Gon');

CREATE TABLE matches (
	id INT NOT NULL,
    home_id INT NOT NULL,
    away_id INT NOT NULL,
    home_goal INT NOT NULL,
    away_goal INT NOT NULL,
    UNIQUE(id));

INSERT INTO matches
	VALUES
	(1,30,20,1,0),
    (2,10,20,1,2),
    (3,20,50,2,2),
    (4,10,30,1,0),
    (5,30,50,0,1);

SELECT
	t.team_id,
	t.name,
    SUM(CASE WHEN m.home_goal > m.away_goal AND t.team_id = m.home_id THEN 3
	     WHEN m.home_goal = m.away_goal AND t.team_id = m.home_id THEN 1
         WHEN m.home_goal < m.away_goal AND t.team_id = m.home_id THEN 0
         WHEN m.home_goal < m.away_goal AND t.team_id = m.away_id THEN 3
	     WHEN m.home_goal = m.away_goal AND t.team_id = m.away_id THEN 1
         WHEN m.home_goal > m.away_goal AND t.team_id = m.away_id THEN 0 
         END
    ) AS total_points       
	FROM teams t
    JOIN matches m
    ON t.team_id = m.home_id OR t.team_id = m.away_id
    GROUP BY t.team_id
    ORDER BY total_points DESC, team_id;