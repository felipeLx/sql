/*
Part 2: Energy Losses and Market Reliability
When an energy provider provides energy to the market, they are making a commitment to the market and saying;
 “We will supply X amount of energy to the market under a contractual obligation.” However, in a situation 
 where the outages are forced, the energy provider intended to provide energy but is unable to provide energy 
 and is forced offline. If many energy providers are forced offline at the same time, it could cause an 
 energy security risk that AEMR needs to mitigate.
To ensure this doesn’t happen, the AEMR is interested in exploring the following questions:
*/
/*
Of the outage types in 2016 and 2017, what percent were forced outages?
What was the average duration for a forced outage during both 2016 and 2017? Have we seen an increase in 
the average duration of forced outages?
Which energy providers tended to be the most unreliable?
*/
/*
Write a SQL Statement to COUNT the total number of approved forced outage events for 2016 and 2017.
 Order by Reason and Year.
Total_Number_Outage_Events / Reason / Year
*/
SELECT * FROM energy;
SELECT
	COUNT(Start_Time) AS Total_Number_Outage_Events,
    Reason,
    YEAR(Start_Time) AS Year
FROM energy
WHERE Status = 'Approved' AND Reason = 'Forced' AND YEAR(Start_Time) BETWEEN '2016' AND '2017'
GROUP BY Reason, Year
ORDER BY Reason, Year;