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
BEGIN;COMMIT;BEGIN;INSERT INTO grupo2v6.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('268-487-6561', 'Personal', 'Ernesto Lanchester', 'Filadelfia', 'USA');
INSERT INTO grupo2v6.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('231-462-7595', 'Movistar', 'Giuliana Quinoa', 'Buenos Aires', 'Turquía');
INSERT INTO grupo2v6.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('424-833-7607', 'Personal', 'Ana Perez', 'Colón', 'USA');
INSERT INTO grupo2v6.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('826-242-4657', 'Verizon', 'Damián Reilly', 'Estambul', 'Vietnam');
INSERT INTO grupo2v6.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('243-450-6505', 'Verizon', 'Beto Merkel', 'Dusseldorf', 'Argentina');
INSERT INTO grupo2v6.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('557-970-8672', 'Personal', 'Damián Reilly', 'Estambul', 'Vietnam');
INSERT INTO grupo2v6.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('971-127-2046', 'Movistar', 'Ana Perez', 'Colón', 'USA');
INSERT INTO grupo2v6.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('696-293-9628', 'Claro', 'Federico Roberts', 'Guadalajara', 'Vietnam');
INSERT INTO grupo2v6.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('966-247-7064', 'Telecom', 'Giuliana Merkel', 'Colón', 'USA');
INSERT INTO grupo2v6.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('591-505-8021', 'Telecom', 'Ernesto Lanchester', 'Filadelfia', 'USA');
COMMIT;BEGIN;COMMIT;BEGIN;INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-22 23:13:10.0', 22, 5, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 4, 4, 1834.8825881459593);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 4, 6, 1834.8825881459593);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 4, 1, 1834.8825881459593);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-13 16:31:45.0', 13, 3, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 5, 5, 2806.858789485853);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 5, 2, 2806.858789485853);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 5, 6, 2806.858789485853);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-09 12:06:45.0', 9, 3, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 8, 8, 6064.875139926652);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 8, 6, 6064.875139926652);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 8, 4, 6064.875139926652);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 8, 1, 6064.875139926652);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 8, 2, 6064.875139926652);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-31 08:21:01.0', 31, 5, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 4, 4, 6190.78340812696);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 4, 2, 6190.78340812696);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 4, 6, 6190.78340812696);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-27 15:12:32.0', 27, 3, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 5, 5, 4898.219980063569);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 5, 1, 4898.219980063569);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 5, 6, 4898.219980063569);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 5, 8, 4898.219980063569);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 5, 10, 4898.219980063569);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-17 19:42:01.0', 17, 4, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 8, 8, 4246.132459665757);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 8, 5, 4246.132459665757);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 8, 2, 4246.132459665757);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 8, 1, 4246.132459665757);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 8, 10, 4246.132459665757);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-27 12:19:25.0', 27, 1, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 4, 4, 3345.634851087547);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 4, 5, 3345.634851087547);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 4, 6, 3345.634851087547);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-25 22:27:52.0', 25, 1, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 8, 8, 2370.7450234701105);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 8, 3, 2370.7450234701105);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 8, 9, 2370.7450234701105);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 8, 10, 2370.7450234701105);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 8, 6, 2370.7450234701105);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-22 10:48:09.0', 22, 6, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 5, 5, 2877.259365505904);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 5, 6, 2877.259365505904);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 5, 4, 2877.259365505904);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-04 02:31:02.0', 4, 5, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 8, 8, 7102.39012202376);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 8, 9, 7102.39012202376);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-13 11:56:06.0', 13, 6, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 6, 6, 1327.5499440146323);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 6, 1, 1327.5499440146323);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 6, 2, 1327.5499440146323);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 6, 4, 1327.5499440146323);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 6, 10, 1327.5499440146323);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-20 18:44:56.0', 20, 4, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 10, 10, 3617.753018792208);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 10, 2, 3617.753018792208);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 10, 6, 3617.753018792208);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 10, 5, 3617.753018792208);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-19 08:41:26.0', 19, 5, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 2, 2, 1319.2353659601831);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 2, 9, 1319.2353659601831);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 2, 6, 1319.2353659601831);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 2, 7, 1319.2353659601831);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-14 22:09:11.0', 14, 5, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 4, 4, 1736.3195815317904);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 4, 9, 1736.3195815317904);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 4, 1, 1736.3195815317904);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 4, 5, 1736.3195815317904);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 4, 10, 1736.3195815317904);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-08 22:49:29.0', 8, 3, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 2, 2, 2798.959740335742);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 2, 6, 2798.959740335742);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-15 22:07:15.0', 15, 5, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 10, 10, 78.06431237312572);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 10, 9, 78.06431237312572);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 10, 3, 78.06431237312572);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-13 18:42:39.0', 13, 5, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 4, 4, 1552.9208352964285);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 4, 3, 1552.9208352964285);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-08 22:22:30.0', 8, 6, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 1, 1, 1020.6938427072891);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 1, 4, 1020.6938427072891);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-19 10:23:23.0', 19, 4, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 6, 6, 682.4032016795875);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 6, 2, 682.4032016795875);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 6, 4, 682.4032016795875);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 6, 7, 682.4032016795875);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-18 12:43:55.0', 18, 5, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 10, 10, 3271.6039096249624);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 10, 6, 3271.6039096249624);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-26 03:40:12.0', 26, 6, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 5, 5, 7120.049545201012);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 5, 10, 7120.049545201012);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 5, 9, 7120.049545201012);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 5, 7, 7120.049545201012);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-20 10:37:01.0', 20, 4, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (22, 22, 5, 5, 3369.602550366338);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (22, 22, 5, 1, 3369.602550366338);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (22, 22, 5, 7, 3369.602550366338);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (22, 22, 5, 6, 3369.602550366338);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-24 13:11:38.0', 24, 3, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 1, 1, 2202.600029175748);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 1, 3, 2202.600029175748);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 1, 6, 2202.600029175748);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 1, 5, 2202.600029175748);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 1, 10, 2202.600029175748);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-19 11:55:44.0', 19, 5, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 1, 1, 5897.800112883954);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 1, 10, 5897.800112883954);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 1, 4, 5897.800112883954);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 1, 7, 5897.800112883954);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-15 22:09:55.0', 15, 6, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 7, 7, 5249.199120536456);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 7, 1, 5249.199120536456);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 7, 9, 5249.199120536456);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 7, 3, 5249.199120536456);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 7, 2, 5249.199120536456);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-20 20:06:10.0', 20, 6, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (26, 26, 8, 8, 4869.646925618949);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (26, 26, 8, 3, 4869.646925618949);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (26, 26, 8, 10, 4869.646925618949);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (26, 26, 8, 2, 4869.646925618949);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (26, 26, 8, 6, 4869.646925618949);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-15 21:15:30.0', 15, 1, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 2, 2, 3954.4044817714775);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 2, 4, 3954.4044817714775);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-09 06:41:57.0', 9, 6, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 1, 1, 3093.209971885627);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 1, 10, 3093.209971885627);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 1, 7, 3093.209971885627);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 1, 6, 3093.209971885627);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-25 19:13:20.0', 25, 2, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (29, 29, 1, 1, 2322.3741699433685);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (29, 29, 1, 7, 2322.3741699433685);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (29, 29, 1, 3, 2322.3741699433685);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (29, 29, 1, 8, 2322.3741699433685);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (29, 29, 1, 4, 2322.3741699433685);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-08 01:19:12.0', 8, 2, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 7, 7, 1952.0593620451896);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 7, 9, 1952.0593620451896);
COMMIT;