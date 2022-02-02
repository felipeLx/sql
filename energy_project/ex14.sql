/* Write a SQL statement to calculate the Average Outage (MW) Loss and Overall Summed Outage (MW) loss 
for each participant code where the Status is Approved and the Outage Reason is Forced across both 2016 
and 2017.
This data extract should be sorted in descending order for Summed_Energy_Lost, and ordered from 2016 to 2017.
The output of your query should have the following column headers. Please note that, as this is a tricky query, we’ve included an example of what the output would look like for one participant code:
Please also note that for grading purposes, you should use the YEAR() function when extracting the Year data from the Start_Time Column as opposed to EXTRACT().
PS: Don't forget to use ROUND() to ensure your results are rounded to 2 decimal places!
Participant Code / Facility_Code / Status / Year / Avg_Outage_MW_Loss / Summed_Energy_Lost */
SELECT * FROM energy;
SELECT
	Participant_Code, Facility_Code, Status, YEAR(Start_Time) AS Year,
    ROUND(AVG(Outage_MW),2) AS Avg_Outage_MW_Loss,
    ROUND(SUM(Outage_MW),2) AS Summed_Energy_Lost
FROM energy
WHERE Status = 'Approved' AND Reason = 'Forced' AND YEAR(Start_Time) BETWEEN '2016' AND '2017'
GROUP BY Participant_Code, Facility_Code, Status, Year
ORDER BY Summed_Energy_Lost DESC, Year ASC;
