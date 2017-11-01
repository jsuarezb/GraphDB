  SELECT emisor.telnum, receptor.telnum, AVG(duration)
    FROM call
    JOIN emisorreceptor AS emisor ON call.callerid = emisor.id
    JOIN emisorreceptor AS receptor ON call.memberid = receptor.id
   WHERE emisor.telnum <> receptor.telnum
GROUP BY emisor.telnum, receptor.telnum
