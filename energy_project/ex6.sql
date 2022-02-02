/*
Write a SQL statement showing the total number of all approved outage types (Forced, Consequential, Scheduled, Opportunistic) that occurred for both 2016 and 2017 per month (i.e. 1 – 12). Don't forget to Order this by by Month and Year.
Status / Total_Number_Outage_Events / Month / Year
*/
SELECT
	Status,
    COUNT(Start_Time) AS Total_Number_Outage_Events,
    MONTH(Start_Time) AS Month,
    YEAR(Start_Time) AS Year
FROM energy
WHERE Status = 'Approved' AND YEAR(Start_Time) BETWEEN '2016' AND '2017'
GROUP BY Status, Month, Year
ORDER BY Total_Number_Outage_Events DESC, Month, Year;