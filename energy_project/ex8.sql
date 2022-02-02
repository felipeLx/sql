/*
Write a SQL statement showing the average duration of all approved outage types
for all participant codes from 2016 to 2017. Don't forget to order the average duration 
in descending order with the DESC keyword.

Participant_Code / Status / Year / Average_Outage_Duration_Time_Days
*/
SELECT
	Participant_Code,
    Status,
    YEAR(Start_Time) AS Year,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, Start_Time, End_Time)/60/24),2) AS Average_Outage_Duration_Time_Days
FROM energy
WHERE Status = 'Approved' AND YEAR(Start_Time) BETWEEN '2016' AND '2017'
GROUP BY Participant_Code, Status, Year
ORDER BY Average_Outage_Duration_Time_Days DESC;