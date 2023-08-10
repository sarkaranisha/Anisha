
--5--
SELECT G.games_year, S.sport_name AS sport_name, COUNT(DISTINCT GC.id) AS num_participants
FROM Games G
JOIN Games_Competitor GC ON G.id = GC.games_id
JOIN Competitor_Event CE ON GC.id = CE.competitor_id
JOIN Event E ON CE.event_id = E.id
JOIN Sport S ON E.sport_id = S.id
GROUP BY G.games_year, S.sport_name
ORDER BY 2,num_participants DESC;
