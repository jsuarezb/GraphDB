\encoding UTF8;
CREATE SCHEMA grupo2v6;
DROP TABLE grupo2v6.Call CASCADE;
DROP TABLE grupo2v6.EmisorReceptor CASCADE;
DROP TABLE grupo2v6.DateTime CASCADE;

CREATE TABLE grupo2v6.DateTime (
    Id     SERIAL PRIMARY KEY,
	Time   TIMESTAMP,
	Day    INTEGER,
	Month  INTEGER,
	Year   INTEGER
);

CREATE TABLE grupo2v6.EmisorReceptor (
	Id       SERIAL PRIMARY KEY,
	TelNum   CHARACTER(12),
	Operator VARCHAR(64),
	UserName VARCHAR(64),
	City     VARCHAR(64),
	Country  VARCHAR(64)
);

CREATE TABLE grupo2v6.Call (
    Id       INTEGER,
 	TimeId 	 INTEGER REFERENCES grupo2v6.DateTime,
  	CallerId INTEGER REFERENCES grupo2v6.EmisorReceptor,
  	MemberId INTEGER REFERENCES grupo2v6.EmisorReceptor,
  	Duration INTEGER,

  	CONSTRAINT pk_call PRIMARY KEY (Id, TimeId, CallerId, MemberId)
);
BEGIN;COMMIT;BEGIN;INSERT INTO grupo2v6.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('287-316-7565', 'Claro', 'Damián Oseman', 'Filadelfia', 'Uruguay');
INSERT INTO grupo2v6.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('284-903-4248', 'Movistar', 'Carlos Quinoa', 'Dusseldorf', 'Turquía');
INSERT INTO grupo2v6.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('202-102-3104', 'Movistar', 'Carlos Reilly', 'Ankara', 'Uruguay');
INSERT INTO grupo2v6.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('961-351-8364', 'Movistar', 'Beto Oseman', 'Buenos Aires', 'Uruguay');
INSERT INTO grupo2v6.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('371-848-9555', 'Personal', 'Jacinta Roberts', 'Guadalajara', 'Vietnam');
INSERT INTO grupo2v6.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('280-695-2370', 'Verizon', 'Beto Oseman', 'Buenos Aires', 'Uruguay');
INSERT INTO grupo2v6.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('175-290-7325', 'Verizon', 'Giuliana Oseman', 'Filadelfia', 'Uruguay');
INSERT INTO grupo2v6.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('963-517-8868', 'Movistar', 'Ernesto Reilly', 'Guadalajara', 'Vietnam');
INSERT INTO grupo2v6.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('510-554-9963', 'Claro', 'Carlos Lanchester', 'Dusseldorf', 'Turquía');
INSERT INTO grupo2v6.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('429-633-8047', 'Verizon', 'Damián Neuer', 'Guadalajara', 'Vietnam');
COMMIT;BEGIN;COMMIT;BEGIN;INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-11 02:33:10.0', 11, 3, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 7, 7, 3072.289325932914);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 7, 1, 3072.289325932914);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 7, 5, 3072.289325932914);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 7, 9, 3072.289325932914);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-12 23:15:25.0', 12, 4, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 7, 7, 539.7502091234185);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 7, 9, 539.7502091234185);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 7, 8, 539.7502091234185);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 7, 2, 539.7502091234185);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-17 17:26:06.0', 17, 3, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 8, 8, 3830.57833613051);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 8, 7, 3830.57833613051);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 8, 4, 3830.57833613051);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 8, 2, 3830.57833613051);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 8, 1, 3830.57833613051);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-20 03:25:23.0', 20, 4, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 4, 4, 462.39890345502926);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 4, 2, 462.39890345502926);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-05 05:08:56.0', 5, 4, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 8, 8, 1290.0389406738548);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 8, 9, 1290.0389406738548);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 8, 5, 1290.0389406738548);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 8, 6, 1290.0389406738548);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-13 07:28:27.0', 13, 2, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 2, 2, 5034.60907366253);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 2, 1, 5034.60907366253);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 2, 6, 5034.60907366253);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 2, 5, 5034.60907366253);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 2, 9, 5034.60907366253);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-08 14:53:00.0', 8, 1, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 8, 8, 2165.8988853828746);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 8, 5, 2165.8988853828746);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-05 13:39:27.0', 5, 3, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 3, 3, 6336.454928893115);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 3, 10, 6336.454928893115);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 3, 2, 6336.454928893115);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 3, 5, 6336.454928893115);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-19 08:08:34.0', 19, 5, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 2, 2, 5778.3708540165235);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 2, 10, 5778.3708540165235);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 2, 9, 5778.3708540165235);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 2, 4, 5778.3708540165235);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 2, 1, 5778.3708540165235);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-29 13:39:37.0', 29, 5, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 2, 2, 3784.319509434246);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 2, 6, 3784.319509434246);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-15 23:30:33.0', 15, 3, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 6, 6, 560.0559788691633);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 6, 3, 560.0559788691633);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 6, 2, 560.0559788691633);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 6, 5, 560.0559788691633);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 6, 1, 560.0559788691633);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-26 11:31:50.0', 26, 6, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 9, 9, 6338.717406368717);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 9, 2, 6338.717406368717);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 9, 7, 6338.717406368717);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-29 22:58:09.0', 29, 4, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 4, 4, 4647.6556596968985);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 4, 9, 4647.6556596968985);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 4, 8, 4647.6556596968985);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-30 05:12:25.0', 30, 4, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 5, 5, 1437.379004681117);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 5, 3, 1437.379004681117);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-07 13:25:54.0', 7, 3, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 5, 5, 3122.1057325301954);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 5, 8, 3122.1057325301954);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 5, 2, 3122.1057325301954);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 5, 4, 3122.1057325301954);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 5, 9, 3122.1057325301954);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-22 15:58:09.0', 22, 1, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 10, 10, 4486.711218996694);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 10, 3, 4486.711218996694);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 10, 2, 4486.711218996694);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-21 17:33:15.0', 21, 5, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 5, 5, 3805.66768250577);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 5, 8, 3805.66768250577);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 5, 2, 3805.66768250577);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 5, 9, 3805.66768250577);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 5, 4, 3805.66768250577);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-10 01:51:39.0', 10, 3, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 2, 2, 5854.521780017243);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 2, 5, 5854.521780017243);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-12 08:01:03.0', 12, 4, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 8, 8, 1939.0461220826435);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 8, 5, 1939.0461220826435);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 8, 1, 1939.0461220826435);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 8, 2, 1939.0461220826435);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-22 06:54:19.0', 22, 5, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 10, 10, 2298.401343286125);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 10, 2, 2298.401343286125);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 10, 9, 2298.401343286125);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 10, 3, 2298.401343286125);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-03 00:42:45.0', 3, 2, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 5, 5, 6791.579399619465);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 5, 7, 6791.579399619465);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 5, 3, 6791.579399619465);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-17 00:01:06.0', 17, 3, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (22, 22, 5, 5, 3124.245959106193);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (22, 22, 5, 7, 3124.245959106193);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (22, 22, 5, 1, 3124.245959106193);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-23 16:54:07.0', 23, 2, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 8, 8, 719.7764468320005);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 8, 9, 719.7764468320005);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 8, 10, 719.7764468320005);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 8, 2, 719.7764468320005);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 8, 7, 719.7764468320005);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-02 18:04:46.0', 2, 5, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 6, 6, 2880.786369667826);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 6, 10, 2880.786369667826);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-02 11:44:05.0', 2, 4, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 8, 8, 6405.99779565298);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 8, 2, 6405.99779565298);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 8, 5, 6405.99779565298);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 8, 9, 6405.99779565298);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-01 05:10:07.0', 1, 6, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (26, 26, 1, 1, 6025.979481513997);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (26, 26, 1, 9, 6025.979481513997);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-15 07:05:36.0', 15, 3, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 9, 9, 445.9331940675656);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 9, 8, 445.9331940675656);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 9, 2, 445.9331940675656);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 9, 4, 445.9331940675656);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 9, 3, 445.9331940675656);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-03 01:37:57.0', 3, 5, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 5, 5, 4185.405949615374);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 5, 1, 4185.405949615374);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 5, 6, 4185.405949615374);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 5, 4, 4185.405949615374);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 5, 9, 4185.405949615374);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-04 03:09:55.0', 4, 4, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (29, 29, 9, 9, 1284.474672040742);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (29, 29, 9, 6, 1284.474672040742);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-26 03:49:29.0', 26, 6, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 10, 10, 1514.1749045009622);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 10, 9, 1514.1749045009622);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 10, 8, 1514.1749045009622);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 10, 6, 1514.1749045009622);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 10, 5, 1514.1749045009622);
COMMIT;