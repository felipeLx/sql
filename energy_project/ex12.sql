/* Write a SQL statement to compare the AVERAGE duration of each individual outage event
 (Forced, Consequential, Planned and Opportunistic) for both 2016 and 2017. Order from 2016 to 2017.
After the average, make sure you round to two decimal places.
Use TIMESTAMPDIFF to calculate the difference between Start_Time and End_Time.
The output of your query should have the following column headers:
Status, Reason, Year, Avg_Outage_MW_Loss, Average_Outage_Duration_Time_Minutes */
SELECT
	Status, Reason, YEAR(Start_Time) As Year,
    ROUND(AVG(Outage_MW),2) AS Avg_Outage_MW_Loss,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, Start_Time, End_Time)),2) AS Average_Outage_Duration_Time_Minutes
FROM energy
WHERE Status = 'Approved' AND YEAR(Start_Time) BETWEEN '2016' AND '2017'
GROUP BY Status, Reason, Year
ORDER BY Year ASC;