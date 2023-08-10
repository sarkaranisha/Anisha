SELECT(__12___)
    e.event_name,count(m.id)
FROM
    event as e
JOIN competitor_event as ce on ce.event_id=e.id
    join Medal as m ON m.id=ce.medal_id
WHERE
    m.medal_name = 'Gold'
   
GROUP BY
    1
ORDER BY
    2 DESC
LIMIT 5;
