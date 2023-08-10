Select s.sport_name , e.event_name , n.region_name ,count(*)(11)
 from competitor_event ce 
left join event e on ce.event_id=e.id
left join sport s on s.id=e.sport_id
left join medal m on ce.medal_id=m.id
left join games_competitor gc on gc.id=ce.competitor_id
left join person p on p.id=gc.person_id
left join person_region pr on pr.person_id=p.id
left join noc_region n on n.id=pr.region_id
group by 1,2,3
order by 4 desc;
--16--
SELECT
    nr.region_name as region
FROM
    NOC_Region nr
WHERE
    nr.id NOT in (
        SELECT DISTINCT pr.region_id
        FROM person_region pr
        JOIN person p ON pr.person_id = p.id
        JOIN games_competitor gc ON gc.person_id = p.id
        JOIN games g ON gc.games_id = g.id
        WHERE g.games_year = 2016
    )
ORDER BY
    Region;
    
    


