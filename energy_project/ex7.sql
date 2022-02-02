/*
Write a SQL statement showing the count of all approved outage types 
for all participant codes for 2016 and 2017. Order by Year and Participant_Code.
Total_Number_Outage_Events / Participant_Code / Status / Year
*/
SELECT * FROM energy;
SELECT
	COUNT(Start_Time) AS Total_Number_Outage_Events,
    Participant_Code,
    Status,
    Year(Start_Time) AS Year
FROM energy
WHERE Status = 'Approved' AND YEAR(Start_Time) BETWEEN '2016' AND '2017'
GROUP BY Participant_Code, Status, Year
ORDER BY Year, Participant_Code;