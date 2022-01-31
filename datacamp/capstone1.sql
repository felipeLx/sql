USE capsttone_one;

SELECT * FROM g_search;
SELECT * FROM history
;
SELECT Date FROM inflation;

SELECT 
    YearV,
    CAST(REPLACE(OpenV, ' ', '') AS UNSIGNED) AS v_open,
    CAST(REPLACE(CloseV, ' ', '') AS UNSIGNED) AS v_close
FROM
    history;

SELECT
	h.Year,
    h.Activity,
    CAST(REPLACE(h.Total, ' ','') AS UNSIGNED) AS employees,
    REPLACE(h.Diff, ' ','') AS v_open,
    ROUND(AVG(i.IPCA),2) AS IPCA,
    SUM(g.Brazil) AS Searches
FROM history AS h
JOIN inflation AS i
ON RIGHT(i.Date,4) = h.Year
JOIN g_search AS g
ON YEAR(g.week) = h.Year
GROUP BY h.Year, h.Activity, h.Total, h.Diff;