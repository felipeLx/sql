/* Write a SQL Statement to calculate the AVERAGE duration and AVERAGE energy lost (MW) 
for all approved outages where the reason is equal to Forced for each participant code, 
Ordered By AVERAGE energy loss (Avg_Outage_MW_Loss) and Year in descending order.
The output of your query should have the following column headers:
Participant Code / Status / Year / Avg_Outage_MW_Loss / Average_Outage_Duration_Time_Days 
Also, please ensure all your calculations are Rounded to two decimal places. */
SELECT
	Participant_Code, Status, YEAR(Start_Time) AS Year,
    ROUND(AVG(Outage_MW),2) AS Avg_Outage_MW_Loss,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, Start_Time, End_Time)/60/24),2) AS Average_Outage_Duration_Time_Days
FROM energy
WHERE Status = 'Approved' AND Reason = 'Forced' AND YEAR(Start_Time) BETWEEN '2016' AND '2017'
GROUP BY Participant_Code, Status, Year
ORDER BY Avg_Outage_MW_Loss DESC, Year;