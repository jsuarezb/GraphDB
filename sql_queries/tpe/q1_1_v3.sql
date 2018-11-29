SELECT member1.telnum, member2.telnum, AVG(call1.duration)
      FROM grupo2v3.call AS call1
INNER JOIN grupo2v3.call AS call2 ON call1.id = call2.id
INNER JOIN grupo2v3.emisorreceptor AS member1 ON call1.memberid = member1.id
INNER JOIN grupo2v3.emisorreceptor AS member2 ON call2.memberid = member2.id
     WHERE member1.telnum < member2.telnum
  GROUP BY member1.telnum, member2.telnum;

