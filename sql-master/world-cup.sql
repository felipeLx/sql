USE world_cup;
SELECT YEAR(rank_date) FROM fifa_ranking;
SELECT *
FROM data_processed;

SELECT 
	dp.*,
	fr.rank 
FROM data_processed AS dp
LEFT JOIN fifa_ranking AS fr 
ON dp.Winner = fr.country_full AND dp.Year = YEAR(fr.rank_date)
WHERE dp.Winner = fr.country_full AND dp.Year = YEAR(fr.rank_date);