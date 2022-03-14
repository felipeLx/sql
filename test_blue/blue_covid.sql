USE b_orange;

SELECT * FROM covid_data;

# When did the difference in the total number of confirmed cases between Italy and Germany become more than 10 000?
SELECT
	a.date,
    a.location,
    b.location,
    SUM(b.new_cases) OVER (PARTITION BY b.location ORDER BY date) - 
    SUM(a.new_cases) OVER (PARTITION BY a.location ORDER BY date) AS diff_total
FROM covid_data AS a
CROSS JOIN covid_data AS b
ON a.date = b.date
WHERE a.location = 'Germany' AND b.location = 'Italy';

# What is the difference between the exponential curve and the total number of real cases on 2020-03-20
SELECT 
	date,
    ROW_NUMBER() OVER (ORDER BY date) AS dp,
    new_cases,
    SUM(new_cases) OVER (ORDER BY date) AS total_cases,
    LOG(SUM(new_cases) OVER (ORDER BY date)) AS log_total_cases,
    (SELECT new_cases
    FROM covid_data
    WHERE location = 'Italy' AND date = '2020-03-20') AS total_day20
FROM covid_data
WHERE date BETWEEN '2020-02-28' AND '2020-03-20'
AND location = 'Italy'
GROUP BY date, new_cases;

WITH cumulative AS(
	SELECT SUM(new_cases) OVER (ORDER BY date) AS total_range
FROM covid_data
WHERE date BETWEEN '2020-02-28' AND '2020-03-20'
AND location = 'Italy')
SELECT
	EXP(total_range) AS exp_range,
    (SELECT new_cases
    FROM covid_data
    WHERE location = 'Italy' AND date = '2020-03-20') AS total_day20
FROM cumulative;

# Which country has the 3rd highest death rate? Death rate: total number of death per million inhabitants
SELECT
	DISTINCT location,
    SUM(new_deaths) AS total_death,
    SUM(new_deaths)/(population/1000000) AS total_by_pop,
    population
FROM covid_data
GROUP BY location, population
ORDER BY total_by_pop DESC
LIMIT 3;

# What is the F1 score of the following statement: Countries, 
# where more than 20% of the population is over 65 years old, 
# have death rates over 50 per million inhabitants.
SELECT 
	location,
    SUM(new_deaths)/(population/1000000) AS total_by_pop,
    aged_65_older_percent,
    SUM(new_deaths) AS total_death
FROM covid_data
WHERE aged_65_older_percent > 20
GROUP BY location, population, aged_65_older_percent
HAVING (SUM(new_deaths)/(population/1000000)) > 50
ORDER BY total_by_pop DESC;

# What is the probability that a country has GDP over $10 000, 
# if we know that they have at least 5 hospital beds per 1000 inhabitants.
# R. 82.14%
# at least 5 hospital beds per 1,000
SELECT 
	COUNT(DISTINCT location)
FROM covid_data
WHERE hospital_beds_per_thousand >= 5;
# R. 28 countries

# passing two conditions: GDP and beds
SELECT 
	COUNT(DISTINCT location)
FROM covid_data
WHERE gdp_per_capita > 10000 AND hospital_beds_per_thousand >= 5;
# R.23 countries