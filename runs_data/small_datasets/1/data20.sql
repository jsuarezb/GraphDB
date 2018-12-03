\encoding UTF8;
CREATE SCHEMA grupo2v5;
DROP TABLE grupo2v5.Call CASCADE;
DROP TABLE grupo2v5.EmisorReceptor CASCADE;
DROP TABLE grupo2v5.DateTime CASCADE;

CREATE TABLE grupo2v5.DateTime (
    Id     SERIAL PRIMARY KEY,
	Time   TIMESTAMP,
	Day    INTEGER,
	Month  INTEGER,
	Year   INTEGER
);

CREATE TABLE grupo2v5.EmisorReceptor (
	Id       SERIAL PRIMARY KEY,
	TelNum   CHARACTER(12),
	Operator VARCHAR(64),
	UserName VARCHAR(64),
	City     VARCHAR(64),
	Country  VARCHAR(64)
);

CREATE TABLE grupo2v5.Call (
    Id       INTEGER,
 	TimeId 	 INTEGER REFERENCES grupo2v5.DateTime,
  	CallerId INTEGER REFERENCES grupo2v5.EmisorReceptor,
  	MemberId INTEGER REFERENCES grupo2v5.EmisorReceptor,
  	Duration INTEGER,

  	CONSTRAINT pk_call PRIMARY KEY (Id, TimeId, CallerId, MemberId)
);
BEGIN;COMMIT;BEGIN;INSERT INTO grupo2v5.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('268-487-6561', 'Personal', 'Ernesto Lanchester', 'Filadelfia', 'USA');
INSERT INTO grupo2v5.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('231-462-7595', 'Movistar', 'Giuliana Quinoa', 'Buenos Aires', 'Turquía');
INSERT INTO grupo2v5.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('424-833-7607', 'Personal', 'Ana Perez', 'Colón', 'USA');
INSERT INTO grupo2v5.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('826-242-4657', 'Verizon', 'Damián Reilly', 'Estambul', 'Vietnam');
INSERT INTO grupo2v5.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('243-450-6505', 'Verizon', 'Beto Merkel', 'Dusseldorf', 'Argentina');
INSERT INTO grupo2v5.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('557-970-8672', 'Personal', 'Damián Reilly', 'Estambul', 'Vietnam');
INSERT INTO grupo2v5.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('971-127-2046', 'Movistar', 'Ana Perez', 'Colón', 'USA');
INSERT INTO grupo2v5.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('696-293-9628', 'Claro', 'Federico Roberts', 'Guadalajara', 'Vietnam');
INSERT INTO grupo2v5.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('966-247-7064', 'Telecom', 'Giuliana Merkel', 'Colón', 'USA');
INSERT INTO grupo2v5.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('591-505-8021', 'Telecom', 'Ernesto Lanchester', 'Filadelfia', 'USA');
COMMIT;BEGIN;COMMIT;BEGIN;INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-24 01:20:00.0', 24, 5, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 3, 3, 4093.278865072994);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 3, 9, 4093.278865072994);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 3, 2, 4093.278865072994);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 3, 7, 4093.278865072994);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 3, 8, 4093.278865072994);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-20 15:49:30.0', 20, 3, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 9, 9, 7010.058708875826);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 9, 3, 7010.058708875826);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 9, 1, 7010.058708875826);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-29 20:18:20.0', 29, 3, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 5, 5, 5128.72675174963);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 5, 2, 5128.72675174963);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 5, 6, 5128.72675174963);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 5, 9, 5128.72675174963);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 5, 7, 5128.72675174963);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-04 05:22:16.0', 4, 2, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 6, 6, 5599.161493636736);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 6, 8, 5599.161493636736);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 6, 1, 5599.161493636736);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 6, 5, 5599.161493636736);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-04 17:26:16.0', 4, 3, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 5, 5, 2896.1599312542476);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 5, 8, 2896.1599312542476);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-12 07:30:51.0', 12, 6, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 8, 8, 2894.9915529582013);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 8, 7, 2894.9915529582013);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 8, 3, 2894.9915529582013);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 8, 2, 2894.9915529582013);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-07 01:32:11.0', 7, 1, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 9, 9, 5780.483704852228);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 9, 8, 5780.483704852228);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-16 19:47:02.0', 16, 1, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 5, 5, 1201.6409867391978);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 5, 4, 1201.6409867391978);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 5, 9, 1201.6409867391978);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 5, 2, 1201.6409867391978);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 5, 10, 1201.6409867391978);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-14 00:53:58.0', 14, 6, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 2, 2, 3435.3539731438204);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 2, 10, 3435.3539731438204);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 2, 5, 3435.3539731438204);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-10 20:28:52.0', 10, 5, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 5, 5, 4196.070227816723);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 5, 8, 4196.070227816723);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 5, 7, 4196.070227816723);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-28 10:57:13.0', 28, 1, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 1, 1, 5871.392907301189);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 1, 5, 5871.392907301189);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 1, 8, 5871.392907301189);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 1, 10, 5871.392907301189);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-24 23:55:44.0', 24, 2, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 5, 5, 149.07639736381483);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 5, 8, 149.07639736381483);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 5, 10, 149.07639736381483);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-26 04:47:47.0', 26, 5, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 6, 6, 2650.3881500643065);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 6, 5, 2650.3881500643065);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 6, 10, 2650.3881500643065);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 6, 8, 2650.3881500643065);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 6, 1, 2650.3881500643065);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-10 18:06:58.0', 10, 5, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 10, 10, 1165.1386628362932);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 10, 1, 1165.1386628362932);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-30 07:06:37.0', 30, 4, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 3, 3, 2253.7440846071704);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 3, 5, 2253.7440846071704);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-30 19:43:52.0', 30, 3, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 8, 8, 2917.073809520852);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 8, 9, 2917.073809520852);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 8, 4, 2917.073809520852);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-05 01:19:29.0', 5, 1, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 7, 7, 7097.282298253421);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 7, 6, 7097.282298253421);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 7, 8, 7097.282298253421);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-26 14:34:28.0', 26, 6, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 10, 10, 1052.8472594573893);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 10, 8, 1052.8472594573893);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 10, 6, 1052.8472594573893);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 10, 5, 1052.8472594573893);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-11 18:50:26.0', 11, 1, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 5, 5, 3758.9660119863934);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 5, 10, 3758.9660119863934);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 5, 8, 3758.9660119863934);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-14 08:39:23.0', 14, 6, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 7, 7, 4199.435781986406);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 7, 9, 4199.435781986406);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 7, 1, 4199.435781986406);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 7, 10, 4199.435781986406);
COMMIT;