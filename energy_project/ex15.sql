SELECT
	Participant_Code,
    Status,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, Start_Time, End_Time)/60/24),2) AS Average_Outage_Duration_Time_Days
FROM energy
WHERE Status = 'Approved' AND YEAR(Start_Time) BETWEEN '2016' AND '2017'
GROUP BY Participant_Code, Status
ORDER BY Average_Outage_Duration_Time_Days DESC;