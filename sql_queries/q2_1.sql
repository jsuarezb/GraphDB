    SELECT member1.username, member2.username, member3.username, AVG(call1.duration)
      FROM call AS call1
INNER JOIN call AS call2 ON call1.id = call2.id
INNER JOIN call AS call3 ON call1.id = call3.id
INNER JOIN emisorreceptor AS member1 ON call1.memberid = member1.id
INNER JOIN emisorreceptor AS member2 ON call2.memberid = member2.id
INNER JOIN emisorreceptor AS member3 ON call3.memberid = member3.id
INNER JOIN datetime AS calldate ON call1.timeid = calldate.id
     WHERE calldate.year = 2017
       AND calldate.month = 4
       AND member1.username < member2.username
       AND member2.username < member3.username
  GROUP BY member1.username, member2.username, member3.username;
