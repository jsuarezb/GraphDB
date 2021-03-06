\encoding UTF8;
CREATE SCHEMA grupo2v8;
DROP TABLE grupo2v8.Call CASCADE;
DROP TABLE grupo2v8.EmisorReceptor CASCADE;
DROP TABLE grupo2v8.DateTime CASCADE;

CREATE TABLE grupo2v8.DateTime (
    Id     SERIAL PRIMARY KEY,
	Time   TIMESTAMP,
	Day    INTEGER,
	Month  INTEGER,
	Year   INTEGER
);

CREATE TABLE grupo2v8.EmisorReceptor (
	Id       SERIAL PRIMARY KEY,
	TelNum   CHARACTER(12),
	Operator VARCHAR(64),
	UserName VARCHAR(64),
	City     VARCHAR(64),
	Country  VARCHAR(64)
);

CREATE TABLE grupo2v8.Call (
    Id       INTEGER,
 	TimeId 	 INTEGER REFERENCES grupo2v8.DateTime,
  	CallerId INTEGER REFERENCES grupo2v8.EmisorReceptor,
  	MemberId INTEGER REFERENCES grupo2v8.EmisorReceptor,
  	Duration INTEGER,

  	CONSTRAINT pk_call PRIMARY KEY (Id, TimeId, CallerId, MemberId)
);
BEGIN;COMMIT;BEGIN;INSERT INTO grupo2v8.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('268-487-6561', 'Personal', 'Ernesto Lanchester', 'Filadelfia', 'USA');
INSERT INTO grupo2v8.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('231-462-7595', 'Movistar', 'Giuliana Quinoa', 'Buenos Aires', 'Turquía');
INSERT INTO grupo2v8.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('424-833-7607', 'Personal', 'Ana Perez', 'Colón', 'USA');
INSERT INTO grupo2v8.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('826-242-4657', 'Verizon', 'Damián Reilly', 'Estambul', 'Vietnam');
INSERT INTO grupo2v8.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('243-450-6505', 'Verizon', 'Beto Merkel', 'Dusseldorf', 'Argentina');
INSERT INTO grupo2v8.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('557-970-8672', 'Personal', 'Damián Reilly', 'Estambul', 'Vietnam');
INSERT INTO grupo2v8.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('971-127-2046', 'Movistar', 'Ana Perez', 'Colón', 'USA');
INSERT INTO grupo2v8.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('696-293-9628', 'Claro', 'Federico Roberts', 'Guadalajara', 'Vietnam');
INSERT INTO grupo2v8.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('966-247-7064', 'Telecom', 'Giuliana Merkel', 'Colón', 'USA');
INSERT INTO grupo2v8.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('591-505-8021', 'Telecom', 'Ernesto Lanchester', 'Filadelfia', 'USA');
COMMIT;BEGIN;COMMIT;BEGIN;INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-06 21:48:56.0', 6, 3, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 4, 4, 416.9382921522374);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 4, 6, 416.9382921522374);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-27 03:49:34.0', 27, 3, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 4, 4, 3354.0310860176423);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 4, 1, 3354.0310860176423);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 4, 6, 3354.0310860176423);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-07 06:44:01.0', 7, 1, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 8, 8, 329.33623030451946);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 8, 3, 329.33623030451946);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 8, 10, 329.33623030451946);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-01 08:15:59.0', 1, 3, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 4, 4, 3335.3588921463684);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 4, 1, 3335.3588921463684);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 4, 2, 3335.3588921463684);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-29 15:01:54.0', 29, 4, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 2, 2, 6301.14559715903);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 2, 5, 6301.14559715903);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 2, 9, 6301.14559715903);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 2, 6, 6301.14559715903);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-11 09:31:59.0', 11, 3, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 8, 8, 2550.475106782476);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 8, 1, 2550.475106782476);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 8, 9, 2550.475106782476);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 8, 2, 2550.475106782476);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-27 19:50:07.0', 27, 1, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 3, 3, 6035.521199927525);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 3, 2, 6035.521199927525);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-03 03:19:29.0', 3, 5, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 6, 6, 2524.425326651736);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 6, 9, 2524.425326651736);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 6, 3, 2524.425326651736);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 6, 2, 2524.425326651736);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 6, 7, 2524.425326651736);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-29 01:59:03.0', 29, 4, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 7, 7, 6547.3135901696405);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 7, 8, 6547.3135901696405);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 7, 6, 6547.3135901696405);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 7, 9, 6547.3135901696405);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-15 20:00:05.0', 15, 4, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 8, 8, 6888.904815826403);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 8, 3, 6888.904815826403);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 8, 7, 6888.904815826403);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-04 00:50:51.0', 4, 6, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 9, 9, 6871.624052904488);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 9, 6, 6871.624052904488);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 9, 7, 6871.624052904488);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-19 04:15:37.0', 19, 5, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 8, 8, 3854.3212353058034);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 8, 7, 3854.3212353058034);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 8, 3, 3854.3212353058034);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 8, 10, 3854.3212353058034);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 8, 4, 3854.3212353058034);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-03 00:56:07.0', 3, 2, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 3, 3, 2838.531427539139);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 3, 1, 2838.531427539139);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-13 06:04:53.0', 13, 5, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 1, 1, 6452.393261238922);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 1, 2, 6452.393261238922);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 1, 6, 6452.393261238922);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 1, 7, 6452.393261238922);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 1, 5, 6452.393261238922);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-02 02:01:17.0', 2, 6, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 8, 8, 3182.0256673116073);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 8, 7, 3182.0256673116073);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 8, 4, 3182.0256673116073);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 8, 9, 3182.0256673116073);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 8, 2, 3182.0256673116073);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-17 02:58:57.0', 17, 6, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 5, 5, 2764.4182087402464);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 5, 10, 2764.4182087402464);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-01 13:16:54.0', 1, 5, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 6, 6, 3458.490695139982);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 6, 3, 3458.490695139982);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 6, 4, 3458.490695139982);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 6, 5, 3458.490695139982);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 6, 2, 3458.490695139982);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-26 16:04:48.0', 26, 6, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 2, 2, 4474.651616162171);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 2, 10, 4474.651616162171);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 2, 5, 4474.651616162171);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-18 14:51:30.0', 18, 6, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 7, 7, 1928.0464453488169);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 7, 2, 1928.0464453488169);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 7, 9, 1928.0464453488169);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 7, 1, 1928.0464453488169);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-20 23:35:05.0', 20, 3, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 4, 4, 3490.913661776105);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 4, 10, 3490.913661776105);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 4, 5, 3490.913661776105);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 4, 2, 3490.913661776105);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-30 23:10:42.0', 30, 6, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 1, 1, 5022.958267307885);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 1, 5, 5022.958267307885);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 1, 6, 5022.958267307885);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 1, 2, 5022.958267307885);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 1, 8, 5022.958267307885);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-01 16:55:55.0', 1, 4, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (22, 22, 1, 1, 44.56594706438508);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (22, 22, 1, 3, 44.56594706438508);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-26 19:11:40.0', 26, 2, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 9, 9, 6006.527054809866);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 9, 1, 6006.527054809866);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 9, 8, 6006.527054809866);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-26 13:44:40.0', 26, 6, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 9, 9, 3463.2707002755546);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 9, 10, 3463.2707002755546);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 9, 7, 3463.2707002755546);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 9, 6, 3463.2707002755546);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 9, 3, 3463.2707002755546);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-17 12:37:32.0', 17, 4, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 4, 4, 1040.5067333768707);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 4, 6, 1040.5067333768707);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 4, 3, 1040.5067333768707);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 4, 9, 1040.5067333768707);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-27 06:02:45.0', 27, 4, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (26, 26, 1, 1, 2845.0473208657636);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (26, 26, 1, 6, 2845.0473208657636);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-05 03:17:40.0', 5, 4, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 4, 4, 6336.8594041682);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 4, 9, 6336.8594041682);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 4, 1, 6336.8594041682);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 4, 5, 6336.8594041682);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 4, 7, 6336.8594041682);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-16 14:47:27.0', 16, 3, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 3, 3, 2331.0479881884353);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 3, 5, 2331.0479881884353);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 3, 8, 2331.0479881884353);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 3, 2, 2331.0479881884353);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 3, 4, 2331.0479881884353);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-10 15:12:18.0', 10, 1, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (29, 29, 1, 1, 4862.536779157181);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (29, 29, 1, 4, 4862.536779157181);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-01 02:23:52.0', 1, 2, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 9, 9, 2838.383828366747);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 9, 6, 2838.383828366747);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-27 16:51:45.0', 27, 2, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (31, 31, 1, 1, 5314.001774662072);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (31, 31, 1, 8, 5314.001774662072);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (31, 31, 1, 3, 5314.001774662072);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-12 10:26:23.0', 12, 4, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (32, 32, 6, 6, 2634.297325952573);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (32, 32, 6, 10, 2634.297325952573);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-18 21:38:07.0', 18, 4, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (33, 33, 3, 3, 6518.211078577171);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (33, 33, 3, 1, 6518.211078577171);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (33, 33, 3, 2, 6518.211078577171);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-23 14:42:55.0', 23, 5, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (34, 34, 10, 10, 6348.791672221517);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (34, 34, 10, 7, 6348.791672221517);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-28 22:11:44.0', 28, 1, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (35, 35, 6, 6, 6191.141564480281);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (35, 35, 6, 9, 6191.141564480281);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-07 18:09:58.0', 7, 1, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (36, 36, 4, 4, 6686.649073322388);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (36, 36, 4, 8, 6686.649073322388);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (36, 36, 4, 6, 6686.649073322388);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-14 17:37:04.0', 14, 4, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (37, 37, 7, 7, 2890.341564874435);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (37, 37, 7, 4, 2890.341564874435);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (37, 37, 7, 10, 2890.341564874435);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-01 06:16:28.0', 1, 5, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (38, 38, 3, 3, 1659.9722566074563);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (38, 38, 3, 5, 1659.9722566074563);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (38, 38, 3, 6, 1659.9722566074563);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (38, 38, 3, 7, 1659.9722566074563);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-07 12:50:10.0', 7, 5, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (39, 39, 7, 7, 7009.136367840693);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (39, 39, 7, 9, 7009.136367840693);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (39, 39, 7, 4, 7009.136367840693);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (39, 39, 7, 5, 7009.136367840693);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (39, 39, 7, 10, 7009.136367840693);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-27 15:22:43.0', 27, 6, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (40, 40, 8, 8, 7052.222225446327);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (40, 40, 8, 5, 7052.222225446327);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (40, 40, 8, 4, 7052.222225446327);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (40, 40, 8, 10, 7052.222225446327);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (40, 40, 8, 3, 7052.222225446327);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-21 14:42:06.0', 21, 2, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (41, 41, 3, 3, 393.53977386278325);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (41, 41, 3, 1, 393.53977386278325);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (41, 41, 3, 10, 393.53977386278325);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (41, 41, 3, 2, 393.53977386278325);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-01 22:51:47.0', 1, 6, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (42, 42, 9, 9, 3366.175103622829);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (42, 42, 9, 10, 3366.175103622829);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (42, 42, 9, 1, 3366.175103622829);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (42, 42, 9, 6, 3366.175103622829);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (42, 42, 9, 8, 3366.175103622829);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-04 08:39:48.0', 4, 6, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (43, 43, 9, 9, 1665.6857335648656);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (43, 43, 9, 8, 1665.6857335648656);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (43, 43, 9, 10, 1665.6857335648656);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (43, 43, 9, 1, 1665.6857335648656);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (43, 43, 9, 3, 1665.6857335648656);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-08 00:28:43.0', 8, 2, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (44, 44, 6, 6, 2405.6223683762496);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (44, 44, 6, 2, 2405.6223683762496);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (44, 44, 6, 3, 2405.6223683762496);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-18 02:12:56.0', 18, 3, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (45, 45, 1, 1, 1801.0547849143943);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (45, 45, 1, 10, 1801.0547849143943);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (45, 45, 1, 2, 1801.0547849143943);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (45, 45, 1, 5, 1801.0547849143943);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-04 16:44:45.0', 4, 5, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (46, 46, 6, 6, 1284.5606346553736);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (46, 46, 6, 3, 1284.5606346553736);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (46, 46, 6, 1, 1284.5606346553736);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (46, 46, 6, 4, 1284.5606346553736);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-21 14:17:39.0', 21, 5, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (47, 47, 5, 5, 1685.3390871324327);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (47, 47, 5, 8, 1685.3390871324327);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-08 00:24:18.0', 8, 5, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (48, 48, 10, 10, 2668.502990481398);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (48, 48, 10, 4, 2668.502990481398);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (48, 48, 10, 7, 2668.502990481398);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (48, 48, 10, 6, 2668.502990481398);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (48, 48, 10, 1, 2668.502990481398);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-11 03:33:41.0', 11, 5, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (49, 49, 8, 8, 846.6784811213964);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (49, 49, 8, 2, 846.6784811213964);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (49, 49, 8, 3, 846.6784811213964);
INSERT INTO grupo2v8.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-26 21:48:08.0', 26, 4, 2017);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (50, 50, 6, 6, 1854.5444596786645);
INSERT INTO grupo2v8.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (50, 50, 6, 10, 1854.5444596786645);
COMMIT;