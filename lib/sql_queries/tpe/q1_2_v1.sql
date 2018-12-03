  SELECT emisor.telnum, receptor.telnum, AVG(duration)
    FROM grupo2v1.call
    JOIN grupo2v1.emisorreceptor AS emisor ON call.callerid = emisor.id
    JOIN grupo2v1.emisorreceptor AS receptor ON call.memberid = receptor.id
   WHERE emisor.telnum <> receptor.telnum
GROUP BY emisor.telnum, receptor.telnum;
