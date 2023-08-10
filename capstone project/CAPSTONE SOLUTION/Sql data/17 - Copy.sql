select avg(age),g.games_year from games_competitor as gc(--17--)
join games as g on g.id = gc.games_id

group by 2
order by 1