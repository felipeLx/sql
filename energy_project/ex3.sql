/*
Question 1.5: Write a SQL statement that calculates the average duration in days rounded to 2 decimal places for each approved outage type across both 2016 and 2017. Don't forget to Order this by Reason and Year.
Please note: The average duration in days should be rounded to 2 decimal places for ease of comparison. Additionally, include the overall count of outage events per outage type (i.e. Forced, Consequential, Planned, Opportunistic).
You may find the function TIMESTAMPDIFF() here to be very helpful! Look at the Unit argument and think carefully regarding how we might be able to convert this to days.
We've included a hint below to help guide your thinking:
TIMESTAMPDIFF(__) / 60 = Hours
How could we convert this to Days?
Please note you should not use the unit DAY as this will round up to the nearest day which will result inaccuracies
The output of your query should have the following column headers:
Status / Reason / Total_Number_Outage_Events / Average_Outage_Duration_Time_Days / Year
*/
SELECT * FROM energy
WHERE Reason = 'Consequential' AND YEAR(Start_Time) = '2018';

SELECT
	Status,
    Reason,
    COUNT(Reason) AS Total_Number_Outage_Events,
    ROUND(AVG(TIMESTAMPDIFF(DAY, Start_Time, End_Time)),2) AS Average_Outage_Duration_Time_Days,
    YEAR(Start_Time) AS years
FROM energy
GROUP BY Status, Reason, years
ORDER BY years;