/*
Building upon the query you completed in the previous question, calculate the proportion 
of outages that were forced for both 2016 and 2017. Order from 2016 to 2017.
Please consider the usage of SUM(CASE WHEN Column = "Condition" THEN 1 ELSE 0 END) when writing your query.
Total_Number_Forced_Outage_Events / Total_Number_Outage_Events / Forced_Outage_Percentage / Year
*/
SELECT * FROM energy;
SELECT
	SUM(CASE WHEN Reason = 'Forced' THEN 1
        ELSE 0 END) AS Total_Number_Forced_Outage_Events,
	COUNT(Start_Time) AS Total_Number_Outage_Events,
    ROUND((SUM(CASE WHEN Reason = 'Forced' THEN 1
        ELSE 0 END) / COUNT(Start_Time))*100,2) AS Forced_Outage_Percentage,
    YEAR(Start_Time) AS Year
FROM energy
WHERE Status = 'Approved' AND YEAR(Start_Time) BETWEEN '2016' AND '2017'
GROUP BY Year
ORDER BY Year;