SELECT e.event_Name,g.games_name, MIN(g.games_Year) AS FirstYear, MAX(g.games_year) AS LastYear
FROM Event as e
join competitor_event as ce on ce.event_id= e. id
join games_competitor as ge on ge.id=ce.competitor_id
join games as g on g.id=ge.games_id
where g.games_year < 2016
GROUP BY 1,2
HAVING MIN(g.games_Year) < 2016 AND MAX(games_Year) <= 2016;
