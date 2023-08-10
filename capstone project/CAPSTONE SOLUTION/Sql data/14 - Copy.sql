--14--
SELECT
    nr.region_name AS Region,
    s.sport_name AS Sport,
    count(m.id) AS TotalMedals
FROM
    NOC_Region nr
inner JOIN
    person_region AS pr ON pr.region_id = nr.id
inner JOIN person AS p ON p.id = pr.person_id
inner JOIN games_competitor AS gc ON gc.person_id = p.id
inner join competitor_event as ce on ce.competitor_id=gc.id
inner JOIN games AS g ON gc.games_id = g.id
inner JOIN Medal AS m ON m.id = ce.medal_id
inner JOIN Event AS e ON e.id = ce.event_id
inner JOIN Sport AS s ON s.id = e.sport_id
GROUP BY
    nr.region_name,
    s.sport_name;
    
    
