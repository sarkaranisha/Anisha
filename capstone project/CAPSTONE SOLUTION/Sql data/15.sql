---15--

select
    nr.region_name as region,count(ce.medal_id),
    min(g2.games_year) as first_year,
    max(g2.games_year) as lastparticipationyear,
    (
        select group_concat(distinct g3.games_year order by g3.games_year asc)
        from games g3
        
    ) as allparticipationyears
from
    noc_region nr

join
    person_region as pr on pr.region_id = nr.id
join person as p on p.id = pr.person_id
   join games_competitor as gc on gc.person_id = p.id
   join competitor_event as ce on ce.competitor_id=gc.id
join
    games g2 on gc.games_id = g2.id
group by
    nr.region_name
order by
    nr.region_name;
