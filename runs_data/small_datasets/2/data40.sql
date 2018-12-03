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
BEGIN;COMMIT;BEGIN;INSERT INTO grupo2v7.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('268-487-6561', 'Personal', 'Ernesto Lanchester', 'Filadelfia', 'USA');
INSERT INTO grupo2v7.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('231-462-7595', 'Movistar', 'Giuliana Quinoa', 'Buenos Aires', 'Turquía');
INSERT INTO grupo2v7.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('424-833-7607', 'Personal', 'Ana Perez', 'Colón', 'USA');
INSERT INTO grupo2v7.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('826-242-4657', 'Verizon', 'Damián Reilly', 'Estambul', 'Vietnam');
INSERT INTO grupo2v7.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('243-450-6505', 'Verizon', 'Beto Merkel', 'Dusseldorf', 'Argentina');
INSERT INTO grupo2v7.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('557-970-8672', 'Personal', 'Damián Reilly', 'Estambul', 'Vietnam');
INSERT INTO grupo2v7.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('971-127-2046', 'Movistar', 'Ana Perez', 'Colón', 'USA');
INSERT INTO grupo2v7.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('696-293-9628', 'Claro', 'Federico Roberts', 'Guadalajara', 'Vietnam');
INSERT INTO grupo2v7.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('966-247-7064', 'Telecom', 'Giuliana Merkel', 'Colón', 'USA');
INSERT INTO grupo2v7.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('591-505-8021', 'Telecom', 'Ernesto Lanchester', 'Filadelfia', 'USA');
COMMIT;BEGIN;COMMIT;BEGIN;INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-27 07:23:25.0', 27, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 8, 8, 5987.789401954717);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 8, 3, 5987.789401954717);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 8, 2, 5987.789401954717);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-05 17:36:56.0', 5, 4, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 7, 7, 4544.495881391211);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 7, 6, 4544.495881391211);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 7, 5, 4544.495881391211);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 7, 8, 4544.495881391211);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-12 22:27:23.0', 12, 4, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 7, 7, 1203.7718455697063);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 7, 9, 1203.7718455697063);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 7, 4, 1203.7718455697063);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 7, 3, 1203.7718455697063);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 7, 6, 1203.7718455697063);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-13 20:00:06.0', 13, 1, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 1, 1, 4391.33332438562);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 1, 4, 4391.33332438562);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 1, 5, 4391.33332438562);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 1, 9, 4391.33332438562);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 1, 8, 4391.33332438562);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-09 19:03:01.0', 9, 1, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 2, 2, 5026.46300139547);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 2, 7, 5026.46300139547);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 2, 9, 5026.46300139547);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-29 16:43:23.0', 29, 1, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 6, 6, 6555.342732199621);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 6, 5, 6555.342732199621);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 6, 2, 6555.342732199621);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-07 08:13:23.0', 7, 1, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 2, 2, 923.6700912820539);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 2, 10, 923.6700912820539);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-03 22:30:11.0', 3, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 6, 6, 3544.0077706915567);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 6, 9, 3544.0077706915567);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 6, 4, 3544.0077706915567);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 6, 1, 3544.0077706915567);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 6, 10, 3544.0077706915567);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-22 09:28:55.0', 22, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 9, 9, 4230.744738751643);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 9, 6, 4230.744738751643);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 9, 10, 4230.744738751643);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-10 18:13:14.0', 10, 2, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 5, 5, 5739.685137812107);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 5, 1, 5739.685137812107);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 5, 10, 5739.685137812107);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 5, 9, 5739.685137812107);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 5, 3, 5739.685137812107);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-06 21:13:46.0', 6, 1, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 10, 10, 3808.2787425163287);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 10, 7, 3808.2787425163287);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 10, 6, 3808.2787425163287);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 10, 2, 3808.2787425163287);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 10, 3, 3808.2787425163287);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-18 23:21:39.0', 18, 3, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 4, 4, 1387.9371163957053);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 4, 1, 1387.9371163957053);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 4, 5, 1387.9371163957053);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 4, 7, 1387.9371163957053);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 4, 2, 1387.9371163957053);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-23 21:03:26.0', 23, 6, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 1, 1, 4904.01536919272);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 1, 3, 4904.01536919272);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 1, 4, 4904.01536919272);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-20 09:54:50.0', 20, 2, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 9, 9, 5558.319917829559);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 9, 5, 5558.319917829559);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-21 05:33:23.0', 21, 2, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 3, 3, 3807.025831771477);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 3, 5, 3807.025831771477);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 3, 10, 3807.025831771477);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 3, 1, 3807.025831771477);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-16 07:48:32.0', 16, 4, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 9, 9, 3622.513717467667);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 9, 1, 3622.513717467667);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 9, 10, 3622.513717467667);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-23 18:11:21.0', 23, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 9, 9, 2810.0744476534883);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 9, 7, 2810.0744476534883);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 9, 10, 2810.0744476534883);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 9, 5, 2810.0744476534883);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 9, 8, 2810.0744476534883);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-17 10:18:27.0', 17, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 1, 1, 607.9199793653186);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 1, 8, 607.9199793653186);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-28 11:32:16.0', 28, 6, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 7, 7, 5966.152549650412);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 7, 4, 5966.152549650412);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 7, 3, 5966.152549650412);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 7, 1, 5966.152549650412);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-08 12:21:05.0', 8, 4, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 1, 1, 1862.2188228943317);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 1, 6, 1862.2188228943317);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 1, 9, 1862.2188228943317);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 1, 3, 1862.2188228943317);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 1, 7, 1862.2188228943317);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-05 21:23:42.0', 5, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 1, 1, 6315.848886826977);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 1, 5, 6315.848886826977);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 1, 4, 6315.848886826977);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 1, 10, 6315.848886826977);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 1, 9, 6315.848886826977);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-01 10:26:10.0', 1, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (22, 22, 5, 5, 4870.817373066519);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (22, 22, 5, 6, 4870.817373066519);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (22, 22, 5, 4, 4870.817373066519);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (22, 22, 5, 8, 4870.817373066519);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (22, 22, 5, 3, 4870.817373066519);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-19 14:18:11.0', 19, 3, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 4, 4, 5183.490516586173);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 4, 8, 5183.490516586173);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 4, 6, 5183.490516586173);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-24 08:28:36.0', 24, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 1, 1, 905.5033758193986);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 1, 7, 905.5033758193986);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-16 20:28:46.0', 16, 4, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 4, 4, 5631.993117370682);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 4, 8, 5631.993117370682);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-03 00:40:30.0', 3, 2, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (26, 26, 6, 6, 6929.3566857381675);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (26, 26, 6, 1, 6929.3566857381675);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (26, 26, 6, 8, 6929.3566857381675);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-15 06:20:20.0', 15, 1, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 3, 3, 658.2631876579027);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 3, 6, 658.2631876579027);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 3, 7, 658.2631876579027);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 3, 10, 658.2631876579027);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-21 00:37:31.0', 21, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 10, 10, 4973.890181301583);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 10, 6, 4973.890181301583);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-25 00:57:57.0', 25, 4, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (29, 29, 3, 3, 4864.690406435489);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (29, 29, 3, 5, 4864.690406435489);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (29, 29, 3, 9, 4864.690406435489);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-17 04:55:55.0', 17, 6, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 5, 5, 4500.39359640343);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 5, 9, 4500.39359640343);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 5, 1, 4500.39359640343);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 5, 8, 4500.39359640343);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 5, 10, 4500.39359640343);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-13 02:13:13.0', 13, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (31, 31, 1, 1, 2231.119772498128);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (31, 31, 1, 9, 2231.119772498128);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (31, 31, 1, 2, 2231.119772498128);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-08 23:15:39.0', 8, 2, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (32, 32, 3, 3, 5205.318295857917);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (32, 32, 3, 4, 5205.318295857917);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (32, 32, 3, 1, 5205.318295857917);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (32, 32, 3, 7, 5205.318295857917);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (32, 32, 3, 5, 5205.318295857917);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-06 15:43:37.0', 6, 2, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (33, 33, 6, 6, 579.3214924991534);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (33, 33, 6, 2, 579.3214924991534);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (33, 33, 6, 10, 579.3214924991534);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-22 00:57:50.0', 22, 6, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (34, 34, 1, 1, 4465.642474465979);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (34, 34, 1, 6, 4465.642474465979);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (34, 34, 1, 2, 4465.642474465979);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-02 05:13:14.0', 2, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (35, 35, 10, 10, 6485.959996599146);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (35, 35, 10, 4, 6485.959996599146);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (35, 35, 10, 9, 6485.959996599146);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (35, 35, 10, 2, 6485.959996599146);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (35, 35, 10, 5, 6485.959996599146);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-29 01:21:33.0', 29, 4, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (36, 36, 7, 7, 2289.2375554895107);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (36, 36, 7, 8, 2289.2375554895107);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (36, 36, 7, 2, 2289.2375554895107);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-27 04:38:40.0', 27, 2, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (37, 37, 2, 2, 6180.750144355277);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (37, 37, 2, 1, 6180.750144355277);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-27 19:04:11.0', 27, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (38, 38, 5, 5, 3444.183146914176);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (38, 38, 5, 8, 3444.183146914176);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-15 01:15:51.0', 15, 2, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (39, 39, 1, 1, 845.6609675464805);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (39, 39, 1, 9, 845.6609675464805);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-10 04:46:41.0', 10, 1, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (40, 40, 1, 1, 6317.424291114152);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (40, 40, 1, 9, 6317.424291114152);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (40, 40, 1, 8, 6317.424291114152);
COMMIT;