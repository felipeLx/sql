/*
Question 2.1: Write a SQL statement showing the monthly COUNT of all approved outage types (Forced, Consequential, Scheduled, Opportunistic) that occurred for 2016. Order by Reason and Month.
The output of your query should have the following column headers:
Status / Reason / Total_Number_Outage_Events / Month
*/
SELECT
	Status,
    Reason,
    COUNT(MONTH(Start_Time)) AS Total_Number_Outage_Events,
    MONTH(Start_Time) AS Month
FROM energy
WHERE Status = 'Approved' AND YEAR(Start_Time) = '2016'
GROUP BY Status, Reason, Month
ORDER BY Total_Number_Outage_Events DESC, Reason, Month;
