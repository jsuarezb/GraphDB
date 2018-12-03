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
COMMIT;BEGIN;COMMIT;BEGIN;INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-30 12:00:12.0', 30, 5, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 3, 3, 1089.8480475844408);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 3, 4, 1089.8480475844408);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 3, 8, 1089.8480475844408);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 3, 2, 1089.8480475844408);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 3, 10, 1089.8480475844408);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-05 04:15:35.0', 5, 4, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 5, 5, 3595.81042531293);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 5, 1, 3595.81042531293);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 5, 2, 3595.81042531293);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-11 04:29:52.0', 11, 1, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 4, 4, 5535.370291531399);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 4, 1, 5535.370291531399);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 4, 6, 5535.370291531399);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 4, 10, 5535.370291531399);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 4, 2, 5535.370291531399);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-24 21:03:07.0', 24, 1, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 4, 4, 2514.905385601418);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 4, 5, 2514.905385601418);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 4, 9, 2514.905385601418);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-27 06:20:17.0', 27, 1, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 2, 2, 543.8993063771337);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 2, 6, 543.8993063771337);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-30 11:51:04.0', 30, 3, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 9, 9, 5552.713142182084);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 9, 4, 5552.713142182084);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 9, 2, 5552.713142182084);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 9, 8, 5552.713142182084);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 9, 5, 5552.713142182084);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-02 21:45:44.0', 2, 2, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 7, 7, 4489.374400932788);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 7, 2, 4489.374400932788);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-06 17:43:36.0', 6, 3, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 10, 10, 67.75021902724922);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 10, 7, 67.75021902724922);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 10, 3, 67.75021902724922);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-22 10:02:39.0', 22, 5, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 3, 3, 5293.904846960159);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 3, 5, 5293.904846960159);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 3, 9, 5293.904846960159);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 3, 10, 5293.904846960159);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-15 12:38:43.0', 15, 1, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 4, 4, 2565.476537576615);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 4, 9, 2565.476537576615);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 4, 8, 2565.476537576615);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 4, 10, 2565.476537576615);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-01 02:47:31.0', 1, 2, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 7, 7, 4150.56523119928);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 7, 1, 4150.56523119928);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 7, 10, 4150.56523119928);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-08 20:38:38.0', 8, 6, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 3, 3, 1542.1903461452819);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 3, 6, 1542.1903461452819);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 3, 4, 1542.1903461452819);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 3, 9, 1542.1903461452819);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-30 08:11:26.0', 30, 4, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 2, 2, 3926.4527458507036);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 2, 5, 3926.4527458507036);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-25 05:36:52.0', 25, 3, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 5, 5, 1977.9019700882527);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 5, 1, 1977.9019700882527);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 5, 4, 1977.9019700882527);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 5, 3, 1977.9019700882527);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-01 21:19:08.0', 1, 1, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 10, 10, 1019.166181944594);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 10, 1, 1019.166181944594);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-03 06:33:07.0', 3, 2, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 2, 2, 4916.480008792954);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 2, 9, 4916.480008792954);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 2, 1, 4916.480008792954);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 2, 10, 4916.480008792954);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 2, 3, 4916.480008792954);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-14 07:37:39.0', 14, 4, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 4, 4, 35.81109362382635);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 4, 7, 35.81109362382635);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 4, 8, 35.81109362382635);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-26 09:07:12.0', 26, 2, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 3, 3, 6603.288665688405);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 3, 1, 6603.288665688405);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 3, 5, 6603.288665688405);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 3, 9, 6603.288665688405);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-10 12:23:09.0', 10, 3, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 1, 1, 502.0884466987645);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 1, 9, 502.0884466987645);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-26 22:08:11.0', 26, 4, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 5, 5, 4069.69483049494);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 5, 8, 4069.69483049494);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 5, 1, 4069.69483049494);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 5, 6, 4069.69483049494);
COMMIT;