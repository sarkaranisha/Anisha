
--8--
SELECT
    E.event_name,
    G.games_year
FROM
    Competitor_Event CE
JOIN
    Games_Competitor GC ON CE.competitor_id = GC.id
JOIN
    Games G ON GC.games_id = G.id
JOIN
    Event E ON E.id = CE.event_id
WHERE
    G.games_year = 2016
    
    AND NOT EXISTS (
        SELECT *
	
        FROM Competitor_Event CE1
        JOIN Games_Competitor GC1 ON CE1.competitor_id = GC1.id
        JOIN Games G1 ON GC1.games_id = G1.id
        WHERE CE1.event_id = CE.event_id AND G1.games_year < 2016
    );
    
    
