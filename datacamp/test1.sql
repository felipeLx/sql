CREATE TABLE servers (
	id INT NOT NULL,
    server_name VARCHAR(30) NOT NULL,
    connections INT NOT NULL);
    
INSERT INTO servers 
VALUES
	(105, 'Hawk', 3),
    (104, 'Buzz', 0),
    (100, 'Light', 6),
    (103, 'Ears', 3);
SELECT connections FROM servers;

SELECT
    id,
    server_name,
    (CASE WHEN connections <= ROUND(AVG(connections),0) THEN 1
         ELSE 0 END) AS status
FROM servers
GROUP BY id, server_name, connections
ORDER BY id;

SELECT
    id,
    server_name,
    CASE WHEN connections <= (SELECT AVG(connections)
		FROM servers) THEN 'OK'
        ELSE 'OVERLOAD' END AS status
FROM servers;