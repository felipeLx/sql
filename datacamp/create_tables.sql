USE datacamp;
drop table teams_germany;
CREATE TABLE teams_germany (
id INT NOT NULL PRIMARY KEY,
team_api_id INT NOT NULL,
team_long_name varchar(30),
team_short_name varchar(3)
);
INSERT INTO teams_germany
VALUES
(15617,	9823,	"FC Bayern Munich",	"BMU"),
(15618,	9790,	"Hamburger SV",	'HAM'),
(15619,	8178,	'Bayer 04 Leverkusen',	'LEV'),
(15620,	9789,	'Borussia Dortmund',	'DOR'),
(15621,	10189,	'FC Schalke 04',	'S04'),
(15622,	9904,	'Hannover 96',	'HAN'),
(15623,	8721,	'VfL Wolfsburg',	'WOL'),
(15624,	8722,	'1. FC Köln',	'FCK'),
(15625,	9810,	'Eintracht Frankfurt',	'EFR'),
(15626,	8177,	'Hertha BSC Berlin',	'HBE'),
(15628,	8697,	'SV Werder Bremen',	'WBR'),
(15630,	8226,	'TSG 1899 Hoffenheim',	'HOF'),
(15631,	9788,	'Borussia Mönchengladbach',	'GLA'),
(15632,	10269,	'VfB Stuttgart',	'STU'),
(16237,	8358,	'SC Freiburg',	'FRE'),
(16239,	8165,	'1. FC Nürnberg',	'NUR'),
(16243,	9905,	'1. FSV Mainz 05',	'MAI'),
(16848,	8350,	'1. FC Kaiserslautern',	'KAI'),
(17465,	8406,	'FC Augsburg',	'AUG'),
(18074,	8194,	'Fortuna Düsseldorf',	'FDU'),
(18079,	8357,	'SpVgg Greuther Fürth',	'GRF'),
(18691,	9776,	'Eintracht Braunschweig',	'BRA'),
(19305,	8460,	'SC Paderborn 07',	'PAD');
