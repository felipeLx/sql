SELECT
  Reason,
  COUNT(Reason)
FROM energy
WHERE EXTRACT(YEAR FROM Start_Time) = '2016'
GROUP BY Reason
ORDER BY COUNT(Reason) DESC;
