SELECT
    g.games_name,e.event_name,
    AVG(p.Height) AS AverageHeight,
    AVG(p.Weight) AS AverageWeight
FROM
    Person p
JOIN Games_Competitor gc ON p.id = gc.person_id
join games as g on g.id=gc.games_id
   
JOIN
     Competitor_Event ce ON ce.competitor_ID = g.ID
JOIN
    Event e ON ce.event_ID = e.ID
JOIN
    Sport s ON e.sport_ID = s.ID
GROUP BY
    1,2
    
