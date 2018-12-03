\encoding UTF8;
CREATE SCHEMA grupo2v7;
DROP TABLE grupo2v7.Call CASCADE;
DROP TABLE grupo2v7.EmisorReceptor CASCADE;
DROP TABLE grupo2v7.DateTime CASCADE;

CREATE TABLE grupo2v7.DateTime (
    Id     SERIAL PRIMARY KEY,
	Time   TIMESTAMP,
	Day    INTEGER,
	Month  INTEGER,
	Year   INTEGER
);

CREATE TABLE grupo2v7.EmisorReceptor (
	Id       SERIAL PRIMARY KEY,
	TelNum   CHARACTER(12),
	Operator VARCHAR(64),
	UserName VARCHAR(64),
	City     VARCHAR(64),
	Country  VARCHAR(64)
);

CREATE TABLE grupo2v7.Call (
    Id       INTEGER,
 	TimeId 	 INTEGER REFERENCES grupo2v7.DateTime,
  	CallerId INTEGER REFERENCES grupo2v7.EmisorReceptor,
  	MemberId INTEGER REFERENCES grupo2v7.EmisorReceptor,
  	Duration INTEGER,

  	CONSTRAINT pk_call PRIMARY KEY (Id, TimeId, CallerId, MemberId)
);
BEGIN;COMMIT;BEGIN;INSERT INTO grupo2v7.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('287-316-7565', 'Claro', 'Damián Oseman', 'Filadelfia', 'Uruguay');
INSERT INTO grupo2v7.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('284-903-4248', 'Movistar', 'Carlos Quinoa', 'Dusseldorf', 'Turquía');
INSERT INTO grupo2v7.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('202-102-3104', 'Movistar', 'Carlos Reilly', 'Ankara', 'Uruguay');
INSERT INTO grupo2v7.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('961-351-8364', 'Movistar', 'Beto Oseman', 'Buenos Aires', 'Uruguay');
INSERT INTO grupo2v7.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('371-848-9555', 'Personal', 'Jacinta Roberts', 'Guadalajara', 'Vietnam');
INSERT INTO grupo2v7.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('280-695-2370', 'Verizon', 'Beto Oseman', 'Buenos Aires', 'Uruguay');
INSERT INTO grupo2v7.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('175-290-7325', 'Verizon', 'Giuliana Oseman', 'Filadelfia', 'Uruguay');
INSERT INTO grupo2v7.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('963-517-8868', 'Movistar', 'Ernesto Reilly', 'Guadalajara', 'Vietnam');
INSERT INTO grupo2v7.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('510-554-9963', 'Claro', 'Carlos Lanchester', 'Dusseldorf', 'Turquía');
INSERT INTO grupo2v7.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('429-633-8047', 'Verizon', 'Damián Neuer', 'Guadalajara', 'Vietnam');
COMMIT;BEGIN;COMMIT;BEGIN;INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-08 13:09:46.0', 8, 6, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 10, 10, 4600.181707389601);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 10, 7, 4600.181707389601);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 10, 2, 4600.181707389601);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-02 18:58:46.0', 2, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 4, 4, 1592.6309594880017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 4, 5, 1592.6309594880017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 4, 6, 1592.6309594880017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 4, 7, 1592.6309594880017);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-15 11:27:20.0', 15, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 8, 8, 1459.7669565358715);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 8, 5, 1459.7669565358715);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-23 00:37:19.0', 23, 1, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 5, 5, 857.2035053385448);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 5, 8, 857.2035053385448);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 5, 1, 857.2035053385448);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-18 10:16:16.0', 18, 2, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 10, 10, 5668.266208011325);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 10, 3, 5668.266208011325);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 10, 8, 5668.266208011325);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 10, 6, 5668.266208011325);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 10, 4, 5668.266208011325);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-25 04:37:47.0', 25, 6, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 10, 10, 610.6534399379331);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 10, 3, 610.6534399379331);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-26 00:06:13.0', 26, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 9, 9, 1452.5712749998877);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 9, 1, 1452.5712749998877);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 9, 10, 1452.5712749998877);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 9, 5, 1452.5712749998877);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 9, 6, 1452.5712749998877);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-23 05:16:45.0', 23, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 7, 7, 6107.297548837958);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 7, 5, 6107.297548837958);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 7, 4, 6107.297548837958);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-03 13:01:12.0', 3, 1, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 1, 1, 4237.193305537095);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 1, 6, 4237.193305537095);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 1, 10, 4237.193305537095);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 1, 4, 4237.193305537095);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 1, 5, 4237.193305537095);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-21 19:05:04.0', 21, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 5, 5, 1290.9192678204995);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 5, 4, 1290.9192678204995);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 5, 7, 1290.9192678204995);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-13 05:05:45.0', 13, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 3, 3, 6394.319325819457);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 3, 2, 6394.319325819457);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 3, 8, 6394.319325819457);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 3, 7, 6394.319325819457);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-01 22:11:08.0', 1, 3, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 2, 2, 1288.1010630021028);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 2, 8, 1288.1010630021028);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-27 10:14:45.0', 27, 6, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 6, 6, 6107.146904729952);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 6, 1, 6107.146904729952);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 6, 4, 6107.146904729952);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-10 11:54:24.0', 10, 3, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 9, 9, 958.2502889370568);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 9, 8, 958.2502889370568);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 9, 5, 958.2502889370568);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 9, 2, 958.2502889370568);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-21 01:34:12.0', 21, 2, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 7, 7, 2218.3500180140136);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 7, 4, 2218.3500180140136);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 7, 9, 2218.3500180140136);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 7, 1, 2218.3500180140136);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-08 18:27:08.0', 8, 2, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 4, 4, 4342.721493910902);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 4, 3, 4342.721493910902);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 4, 2, 4342.721493910902);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-13 12:29:30.0', 13, 2, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 4, 4, 1160.592002373765);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 4, 6, 1160.592002373765);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 4, 8, 1160.592002373765);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 4, 9, 1160.592002373765);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-16 23:06:26.0', 16, 3, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 8, 8, 2756.501153730435);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 8, 1, 2756.501153730435);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-07 02:30:44.0', 7, 3, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 4, 4, 1397.5164712172648);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 4, 7, 1397.5164712172648);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 4, 1, 1397.5164712172648);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-03 17:39:00.0', 3, 2, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 3, 3, 4589.201328066296);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 3, 4, 4589.201328066296);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 3, 10, 4589.201328066296);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 3, 1, 4589.201328066296);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-12 12:54:53.0', 12, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 3, 3, 5885.83971898854);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 3, 10, 5885.83971898854);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 3, 7, 5885.83971898854);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-04 08:47:57.0', 4, 4, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (22, 22, 5, 5, 4859.591191888666);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (22, 22, 5, 3, 4859.591191888666);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (22, 22, 5, 8, 4859.591191888666);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (22, 22, 5, 2, 4859.591191888666);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-17 19:07:38.0', 17, 1, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 6, 6, 1545.2777942779617);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 6, 2, 1545.2777942779617);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 6, 4, 1545.2777942779617);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-07 01:38:43.0', 7, 4, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 9, 9, 5479.9795057514275);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 9, 7, 5479.9795057514275);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 9, 8, 5479.9795057514275);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 9, 3, 5479.9795057514275);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 9, 6, 5479.9795057514275);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-16 20:01:43.0', 16, 4, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 2, 2, 1323.9847231383994);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 2, 7, 1323.9847231383994);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 2, 8, 1323.9847231383994);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-02 21:35:44.0', 2, 6, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (26, 26, 7, 7, 5685.892090445563);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (26, 26, 7, 6, 5685.892090445563);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-02 08:54:10.0', 2, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 10, 10, 5750.432689419328);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 10, 5, 5750.432689419328);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 10, 4, 5750.432689419328);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 10, 1, 5750.432689419328);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 10, 2, 5750.432689419328);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-07 12:53:26.0', 7, 3, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 6, 6, 1891.0140587344051);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 6, 4, 1891.0140587344051);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 6, 1, 1891.0140587344051);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 6, 5, 1891.0140587344051);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 6, 7, 1891.0140587344051);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-10 06:48:52.0', 10, 6, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (29, 29, 1, 1, 825.8702882855752);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (29, 29, 1, 5, 825.8702882855752);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-26 23:47:52.0', 26, 6, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 1, 1, 2845.239812498232);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 1, 7, 2845.239812498232);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 1, 4, 2845.239812498232);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 1, 3, 2845.239812498232);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 1, 10, 2845.239812498232);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-14 17:17:05.0', 14, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (31, 31, 8, 8, 3976.315227812285);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (31, 31, 8, 5, 3976.315227812285);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (31, 31, 8, 2, 3976.315227812285);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (31, 31, 8, 3, 3976.315227812285);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-29 15:07:07.0', 29, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (32, 32, 8, 8, 3666.1746527586392);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (32, 32, 8, 6, 3666.1746527586392);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (32, 32, 8, 10, 3666.1746527586392);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (32, 32, 8, 5, 3666.1746527586392);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-14 11:00:46.0', 14, 2, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (33, 33, 3, 3, 1043.8753572321823);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (33, 33, 3, 5, 1043.8753572321823);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (33, 33, 3, 4, 1043.8753572321823);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (33, 33, 3, 6, 1043.8753572321823);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-24 23:05:53.0', 24, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (34, 34, 10, 10, 3830.00418274977);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (34, 34, 10, 1, 3830.00418274977);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (34, 34, 10, 9, 3830.00418274977);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (34, 34, 10, 7, 3830.00418274977);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (34, 34, 10, 4, 3830.00418274977);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-19 10:38:30.0', 19, 3, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (35, 35, 10, 10, 4489.90149220637);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (35, 35, 10, 4, 4489.90149220637);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (35, 35, 10, 9, 4489.90149220637);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (35, 35, 10, 8, 4489.90149220637);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-05 16:53:32.0', 5, 6, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (36, 36, 1, 1, 765.5305492517261);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (36, 36, 1, 2, 765.5305492517261);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (36, 36, 1, 3, 765.5305492517261);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (36, 36, 1, 8, 765.5305492517261);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (36, 36, 1, 10, 765.5305492517261);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-29 04:56:01.0', 29, 4, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (37, 37, 7, 7, 7108.1742158155475);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (37, 37, 7, 8, 7108.1742158155475);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-21 18:21:24.0', 21, 1, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (38, 38, 8, 8, 5339.282638437294);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (38, 38, 8, 5, 5339.282638437294);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-18 06:35:21.0', 18, 4, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (39, 39, 1, 1, 6515.114629934612);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (39, 39, 1, 8, 6515.114629934612);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (39, 39, 1, 4, 6515.114629934612);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-05 23:48:48.0', 5, 4, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (40, 40, 5, 5, 5197.155085717345);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (40, 40, 5, 7, 5197.155085717345);
COMMIT;