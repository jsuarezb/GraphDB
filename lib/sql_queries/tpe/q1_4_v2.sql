SELECT member1.username, member2.username, COUNT(*)
      FROM grupo2v2.call AS call1
INNER JOIN grupo2v2.call AS call2 ON call1.id = call2.id
INNER JOIN grupo2v2.emisorreceptor AS member1 ON call1.memberid = member1.id
INNER JOIN grupo2v2.emisorreceptor AS member2 ON call2.memberid = member2.id
     WHERE member1.username < member2.username
  GROUP BY member1.username, member2.username;
