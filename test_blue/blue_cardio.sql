USE b_orange;
SELECT * FROM cardio_base;
SELECT ROUND(age/365, 0) FROM cardio_base;

# How much heavier is the age group with the highest average weight than the age group with the lowest weight?
# highest average weight: 75.4133 (64)
# lower average weight: 67.25 (30)
SELECT
	years,
    MIN(avg_weight) AS h_weight
FROM (SELECT ROUND(age/365,0) AS years, AVG(weight) AS avg_weight
		FROM cardio_base
        GROUP BY ROUND(age/365,0)) AS diff_weight
GROUP BY years
ORDER BY h_weight;
    
# Do people over 50 have higher cholesterol levels than the rest?
# If so, what is the percentage of that difference?    
SELECT 
		ROUND(age/365,0) > 50 AS Over_50,
        ROUND(age/365,0) <= 50 AS Under_50,
        SUM(cholesterol) AS chol
 FROM cardio_base
 GROUP BY Over_50, Under_50;
 
SELECT 
    ROUND(age/365,0) AS years,
    SUM(cholesterol) AS chol
FROM cardio_base
GROUP BY ROUND(age/365,0)
ORDER BY chol DESC;

# Are men more likely to be a smoker than women? If so, how many times more?
# The data contains information to identify gender IDs.
SELECT 
	gender,
	SUM(CASE WHEN smoke = 1 THEN 1 ELSE 0 END) AS smoke
FROM cardio_base
GROUP BY gender;

# How tall are the tallest 1% of the people?
SELECT MAX(height) FROM cardio_base;

# Which two features have the highest spearman rank correlation?
WITH 
cte AS ( SELECT POW((CAST(RANK() OVER(ORDER BY gender) AS SIGNED) - CAST(RANK() OVER(ORDER BY weight) AS SIGNED)), 2) as di2
         FROM cardio_base )
SELECT 1 - 6 * SUM(di2) / COUNT(*) / (COUNT(*) * COUNT(*) - 1) AS srcc
FROM cte;

# What percentage of people are more than 2 standard deviations far from the average height?
WITH
stats (av, st) AS (
  SELECT AVG(height), 2*STDDEV(height) FROM cardio_base
)
SELECT COUNT(height)/70000 * 100
FROM cardio_base
CROSS JOIN stats s
WHERE height < s.av - s.st OR height > s.av + s.st;

# What percentage of the population over 50 years old consume alcohol?
SELECT
	COUNT(b.age)/70000 * 100
FROM cardio_base AS b
JOIN cardio_alco AS a
ON a.id = b.id
WHERE ROUND(b.age/365,2) > 50 AND a.alco = 1;

# Which of the following statements is true with 95% confidence?
# Smokers have higher blood pressure than non-smokers - wrong
# Smokers have higher cholesterol level than non smokers
SELECT
	gender,
    COUNT(*) AS qty,
    AVG(ap_hi) AS mean,
    STDDEV(ap_hi) AS std_dev,
    STDDEV(ap_hi)/SQRT(COUNT(*)) AS std_error,
    AVG(ap_hi) - 1.96*STDDEV(ap_hi)/SQRT(COUNT(*)) AS low_interval,
    AVG(ap_hi) + 1.96*STDDEV(ap_hi)/SQRT(COUNT(*)) AS upper_interval
FROM cardio_base
GROUP BY gender;
# query to generate table of confidence
WITH confidence_rate AS (
    SELECT
        b.gender,
        COUNT(b.gender) AS total_smoke,
        SUM(b.ap_hi) AS h_cholesterol,
        COUNT(b.gender)/SUM(b.ap_hi) AS smoke_rate_cholesterol
    FROM
        cardio_base b
    GROUP BY b.gender
),
confidence_rate_error AS (
    SELECT
        e.*,
        SQRT(e.smoke_rate_cholesterol * (1 - e.smoke_rate_cholesterol)/e.h_cholesterol) AS smoke_rate_se
    FROM
        confidence_rate e

),
-- as an extension, we'll add a table of z-scores
z_values AS (
    SELECT  1.96 AS z_value, '95% CI' AS z_value_name
)
-- We then apply each z-value to the implied error and subtract/add it
-- get a lower/upper bound
SELECT
    z.z_value_name,
    s.*,
    -- lower bound at 0
    GREATEST(
        s.smoke_rate_cholesterol - z.z_value * s.smoke_rate_se
    , 0) AS smoke_rate_lb,
    s.smoke_rate_cholesterol + z.z_value * s.smoke_rate_se AS smoke_rate_ub
FROM
    confidence_rate_error s,
    z_values z;

SELECT
	smoke,
    AVG(ap_hi) AS varible
FROM cardio_base
GROUP BY smoke
LIMIT 500;

SELECT
	smoke,
    SUM(weight) AS sum1,
    STDDEV(weight) AS stddev2
FROM cardio_base
GROUP BY smoke
LIMIT 5000;