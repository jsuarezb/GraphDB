SELECT member1.username, member2.username, MAX(call1.duration)
      FROM call AS call1
INNER JOIN call AS call2 ON call1.id = call2.id
INNER JOIN emisorreceptor AS member1 ON call1.memberid = member1.id
INNER JOIN emisorreceptor AS member2 ON call2.memberid = member2.id
     WHERE member1.username <= member2.username
       AND member1.id <> member2.id
  GROUP BY member1.username, member2.username;
