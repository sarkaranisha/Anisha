SELECT
   NR.region_name as country,g.games_year as olympic_year,(15,13,18--)
   SUM(CASE WHEN M.medal_name = 'Gold' THEN 1 ELSE 0 END) AS GoldMedals,
   SUM(CASE WHEN M.medal_name = 'Silver' THEN 1 ELSE 0 END) AS SilverMedals,
   SUM(CASE WHEN M.medal_name = 'Bronze' THEN 1 ELSE 0 END) AS BronzeMedals,
   COUNT(M.medal_name) AS TotalMedals
FROM
    NOC_Region NR
JOIN
    Person_Region PR ON NR.id = PR.region_id
JOIN
    Games_Competitor GC ON PR.person_id = GC.person_id
JOIN
    games g on g.id = GC.games_id
JOIN
    competitor_event ce on ce.competitor_id = GC.id
JOIN
    Medal M ON ce.medal_id = M.id
    where M.medal_name !='NA'
GROUP BY
    NR.region_name, g.games_year
ORDER BY
    NR.region_name;