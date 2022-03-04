USE american_energy;

SELECT * FROM energy;
SELECT
  COUNT(Start_Time) AS Total_Number_Outage_Events,
  Status,
  Reason
FROM energy
WHERE EXTRACT(YEAR FROM Start_Time) = '2016' AND
      Status = 'Approved'
GROUP BY Status, Reason
ORDER BY Total_Number_Outage_Events DESC, Reason;