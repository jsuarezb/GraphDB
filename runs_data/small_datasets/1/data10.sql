\encoding UTF8;
CREATE SCHEMA grupo2v4;
DROP TABLE grupo2v4.Call CASCADE;
DROP TABLE grupo2v4.EmisorReceptor CASCADE;
DROP TABLE grupo2v4.DateTime CASCADE;

CREATE TABLE grupo2v4.DateTime (
    Id     SERIAL PRIMARY KEY,
	Time   TIMESTAMP,
	Day    INTEGER,
	Month  INTEGER,
	Year   INTEGER
);

CREATE TABLE grupo2v4.EmisorReceptor (
	Id       SERIAL PRIMARY KEY,
	TelNum   CHARACTER(12),
	Operator VARCHAR(64),
	UserName VARCHAR(64),
	City     VARCHAR(64),
	Country  VARCHAR(64)
);

CREATE TABLE grupo2v4.Call (
    Id       INTEGER,
 	TimeId 	 INTEGER REFERENCES grupo2v4.DateTime,
  	CallerId INTEGER REFERENCES grupo2v4.EmisorReceptor,
  	MemberId INTEGER REFERENCES grupo2v4.EmisorReceptor,
  	Duration INTEGER,

  	CONSTRAINT pk_call PRIMARY KEY (Id, TimeId, CallerId, MemberId)
);
BEGIN;COMMIT;BEGIN;INSERT INTO grupo2v4.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('268-487-6561', 'Personal', 'Ernesto Lanchester', 'Filadelfia', 'USA');
INSERT INTO grupo2v4.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('231-462-7595', 'Movistar', 'Giuliana Quinoa', 'Buenos Aires', 'Turquía');
INSERT INTO grupo2v4.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('424-833-7607', 'Personal', 'Ana Perez', 'Colón', 'USA');
INSERT INTO grupo2v4.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('826-242-4657', 'Verizon', 'Damián Reilly', 'Estambul', 'Vietnam');
INSERT INTO grupo2v4.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('243-450-6505', 'Verizon', 'Beto Merkel', 'Dusseldorf', 'Argentina');
INSERT INTO grupo2v4.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('557-970-8672', 'Personal', 'Damián Reilly', 'Estambul', 'Vietnam');
INSERT INTO grupo2v4.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('971-127-2046', 'Movistar', 'Ana Perez', 'Colón', 'USA');
INSERT INTO grupo2v4.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('696-293-9628', 'Claro', 'Federico Roberts', 'Guadalajara', 'Vietnam');
INSERT INTO grupo2v4.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('966-247-7064', 'Telecom', 'Giuliana Merkel', 'Colón', 'USA');
INSERT INTO grupo2v4.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('591-505-8021', 'Telecom', 'Ernesto Lanchester', 'Filadelfia', 'USA');
COMMIT;BEGIN;COMMIT;BEGIN;INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-29 22:05:55.0', 29, 5, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 1, 1, 6238.862671651485);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 1, 3, 6238.862671651485);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-13 05:24:09.0', 13, 3, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 7, 7, 6559.688176184041);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 7, 9, 6559.688176184041);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 7, 10, 6559.688176184041);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 7, 3, 6559.688176184041);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 7, 1, 6559.688176184041);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-22 18:10:10.0', 22, 2, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 2, 2, 3598.1844349353414);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 2, 10, 3598.1844349353414);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 2, 3, 3598.1844349353414);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-22 16:17:57.0', 22, 5, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 9, 9, 6225.995440992711);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 9, 10, 6225.995440992711);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 9, 2, 6225.995440992711);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 9, 1, 6225.995440992711);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 9, 4, 6225.995440992711);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-01 20:55:16.0', 1, 5, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 4, 4, 3347.9693874567365);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 4, 8, 3347.9693874567365);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-04 21:26:34.0', 4, 4, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 10, 10, 5647.214848760339);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 10, 9, 5647.214848760339);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 10, 3, 5647.214848760339);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-04 05:53:53.0', 4, 1, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 4, 4, 1339.1389083050003);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 4, 2, 1339.1389083050003);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-01 21:59:06.0', 1, 4, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 1, 1, 3890.685511002642);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 1, 4, 3890.685511002642);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 1, 7, 3890.685511002642);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 1, 10, 3890.685511002642);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 1, 5, 3890.685511002642);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-24 18:56:58.0', 24, 2, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 4, 4, 4769.866717724659);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 4, 9, 4769.866717724659);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-16 21:49:57.0', 16, 4, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 6, 6, 2029.4815803313631);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 6, 8, 2029.4815803313631);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 6, 9, 2029.4815803313631);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 6, 1, 2029.4815803313631);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 6, 2, 2029.4815803313631);
COMMIT;