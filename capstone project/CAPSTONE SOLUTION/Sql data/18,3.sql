use olympic_data_analysis;
SELECT
   NR.region_name,g.games_year,
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
    event e on e.id = ce.event_id
JOIN
    Medal M ON ce.medal_id = M.id
JOIN
    sport s on s.id = e.sport_id
GROUP BY
    NR.region_name, g.games_year
ORDER BY
    NR.region_name, g.games_year;
    
    --3--
    select e.event_name,g.season,count(g.id),count(CE.medal_ID) from games as g
    join games_competitor as gc on gc.games_id=g.id
    join competitor_event as ce on gc.id=ce.competitor_id
    join event as e on ce.event_id=e.id
    join medal as m on m.id=ce.medal_id
    where m.medal_name != "NA"
    group by 1,2;
    
   --3--
    with cte as (select g.games_year as years ,g.games_name as olympic_games,e.event_name as event_name,
   m.medal_name as medal_name,count(g.id) as id from games g
   JOIN Games_Competitor gc ON g.id = gc.games_id   
JOIN
     Competitor_Event ce ON ce.competitor_ID = gc.ID
JOIN
    Event e ON ce.event_ID = e.ID
    join medal as m on m.id =ce.medal_id
    group by 1,2,3,4
    order by 1)
    select years,event_name,olympic_games,id as t_m from cte
    where medal_name='gold' or medal_name="bronze" or medal_name = 'silver'
    group by 1,2,3,4
    order by 4 
    
    
    

    

    
    
    
