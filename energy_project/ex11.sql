/* Write a SQL statement to calculate the AVERAGE duration of forced outage events rounded to 2 decimal places, 
as well as the AVERAGE amount of energy lost (MW) (also rounded to 2 decimal places) for both 2016 and 2017 
due to forced outages. Don't forget to order this by YEAR.
After the average, make sure you round to two decimal places.
Use TIMESTAMPDIFF to calculate the difference between Start_Time and End_Time.
The output of your query should have the following column headers:
Status / Year / Avg_Outage_MW_Loss / Average_Outage_Duration_Time_Minutes */
SELECT
	Status, YEAR(Start_Time) AS Year, ROUND(AVG(Outage_MW),2) AS Avg_Outage_MW_Loss, ROUND(AVG(TIMESTAMPDIFF(MINUTE, Start_Time, End_Time)),2) AS Average_Outage_Duration_Time_Minutes
FROM energy
WHERE Status = 'Approved' AND Reason = 'Forced' AND YEAR(Start_Time) BETWEEN '2016' AND '2017'
GROUP BY Status, Year
ORDER BY Year;
    