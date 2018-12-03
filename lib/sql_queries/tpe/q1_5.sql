SELECT member1.username, member2.username, calldate.month, calldate.year, CASE
                                            WHEN (member1.username = member2.username) THEN COUNT(*) / 2
                                            ELSE COUNT(*)
                                          END
      FROM call AS call1
INNER JOIN call AS call2 ON call1.id = call2.id
INNER JOIN emisorreceptor AS member1 ON call1.memberid = member1.id
INNER JOIN emisorreceptor AS member2 ON call2.memberid = member2.id
INNER JOIN datetime AS calldate ON call1.timeid = calldate.id
     WHERE member1.username <= member2.username
       AND member1.id <> member2.id
  GROUP BY member1.username, member2.username, calldate.month, calldate.year;
