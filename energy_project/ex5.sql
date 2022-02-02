/*
Write a SQL Statement showing the monthly COUNT of all approved outage types (Forced, Consequential, Scheduled, Opportunistic) that occurred during 2017. Order by Reason and Month.
The output of your query should have the following column headers:
Status / Reason / Total_Number_Outage_Events / Month
*/
USE american_energy;
SELECT
	Status,
    Reason,
    COUNT(Start_Time) AS Total_Number_Outage_Events,
    MONTH(Start_Time) As Month
FROM energy
WHERE Status = 'Approved' AND YEAR(Start_Time) = '2017'
GROUP BY Status, Reason, Month
ORDER BY Total_Number_Outage_Events DESC, Reason, Month;