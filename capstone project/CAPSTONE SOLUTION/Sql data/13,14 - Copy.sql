
--13--
SELECT
   g.games_year,NR.region_name,COUNT(M.medal_name)
    
FROM
    NOC_Region NR
JOIN
    Person_Region PR ON NR.id = PR.region_id
JOIN
    Games_Competitor GC ON PR.person_id = GC.person_id
    join games as g on g.id=gc.games_id
    join competitor_event as ce on ce.competitor_id=gc.id
    join event as e on e.id=gc.id
JOIN
    Medal M ON ce.medal_id= M.id
    join sport as s on s.id=e.sport_id
GROUP BY 1,2;
---14--
SELECT
   g.games_name,e.event_name,count(m.medal_name)
   
FROM
    games g
JOIN
    Games_Competitor as GC ON g.id = GC.games_id
    join competitor_event as ce on ce.competitor_id=gc.id
    join event as e on e.id=gc.id
JOIN
    Medal M ON ce.medal_id= M.id
GROUP BY
    1,2
    order by 3 desc

