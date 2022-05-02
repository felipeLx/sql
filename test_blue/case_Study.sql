USE study_case;

SELECT * FROM brend LIMIT 10;
SELECT * FROM min_wage_clean WHERE Country_code = 'AUS' AND Time = 2001;
SELECT * FROM countryContinent;

SELECT 
	a.Country_code,
    b.continent,
    b.sub_region,
    a.Time AS 'Year',
    a.Unit_Code,
    a.Value,
    c.Price_FOB_per_Barrel
FROM min_wage_clean AS a
INNER JOIN countryContinent AS b
ON b.code_3 = a.Country_code
INNER JOIN brend AS c
ON RIGHT(c.Date, 4) = a.Time
WHERE a.SERIES = 'PPP'
ORDER BY a.Time, a.Country_code;

SELECT
	a.Country_code,
    b.sub_region,
    ROUND(AVG(a.Value),2) AS avg_region
FROM min_wage_clean AS a
INNER JOIN countryContinent AS b
ON a.Country_code = b.code_3
GROUP BY a.Country_code, b.sub_region;

SELECT
	a.Country_code,
    a.Time,
    b.continent,
    ROUND(AVG(a.Value),2) AS avg_continent
FROM min_wage_clean AS a
INNER JOIN countryContinent AS b
ON a.Country_code = b.code_3
GROUP BY a.Country_code, b.continent, a.Time
ORDER BY a.Time;
