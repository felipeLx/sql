create table phones (
      name varchar(20) not null unique,
      phone_number integer not null unique
  );
  
create table calls (
      id integer not null,
      caller integer not null,
      callee integer not null,
      duration integer not null,
      unique(id)
  );
  
insert into phones values ('Jack', 1234);
insert into phones values ('Lena', 3333);
insert into phones values ('Mark', 9999);
insert into phones values ('Anna', 7582);
insert into calls values (25, 1234, 7582, 8);
insert into calls values (7, 9999, 7582, 1);
insert into calls values (18, 9999, 3333, 4);
insert into calls values (2, 7582, 3333, 3);
insert into calls values (3, 3333, 1234, 1);
insert into calls values (21, 3333, 1234, 1);

SELECT 
	p.name
FROM phones AS p
INNER JOIN calls AS c
ON p.phone_number = c.caller OR p.phone_number = c.callee
WHERE c.duration IN (
	SELECT(SUM(CASE WHEN p.phone_number = c.caller OR p.phone_number = c.callee THEN duration END) >= 10))
GROUP BY p.name
ORDER BY p.name;

SELECT 
	p.name,
    SUM(CASE WHEN p.phone_number = c.caller OR p.phone_number = c.callee THEN duration END)
FROM phones AS p
JOIN calls AS c
ON p.phone_number = c.caller OR p.phone_number = c.callee
GROUP BY p.name;

SELECT 
	CASE WHEN SUM(c.duration) >= 10 THEN p.name END AS names
FROM phones AS p
JOIN calls AS c
ON p.phone_number = c.caller OR p.phone_number = c.callee
WHERE p.phone_number = c.caller OR p.phone_number = c.callee
GROUP BY p.name
ORDER BY p.name;

SELECT 
	p.name
FROM phones AS p
JOIN calls AS c
ON p.phone_number = c.caller OR p.phone_number = c.callee
WHERE p.phone_number = c.caller OR p.phone_number = c.callee 
GROUP BY p.name
HAVING SUM(c.duration) >= 10
ORDER BY p.name;

SELECT 
	CASE WHEN ROUND(SUM(c.duration),0) >= 10 THEN p.name END AS names
FROM phones AS p
JOIN calls AS c
ON p.phone_number = c.caller OR p.phone_number = c.callee
WHERE p.phone_number = c.caller OR p.phone_number = c.callee
GROUP BY p.name;