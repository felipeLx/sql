USE american_energy;
SELECT * FROM energy;
SELECT
	YEAR(Start_Time) AS Year,
    Reason,
    Participant_Code AS Participant,
    ROUND(AVG(Outage_MW),2) AS Avg_Outage_MW_Loss,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, Start_Time, End_Time)),2) AS Average_Outage_Duration_Time_Minutes,
    COUNT(Start_Time) AS Total_Number_Outage_Events
    
FROM energy
WHERE Status = 'Approved' AND YEAR(Start_Time) BETWEEN '2016' AND '2017' AND Participant_Code = 'MELK' AND Reason = 'Forced' OR Reason = 'Scheduled (Planned)'
GROUP BY Year, Reason, Participant_Code
ORDER BY Year;