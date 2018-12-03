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
COMMIT;BEGIN;COMMIT;BEGIN;INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-08 18:23:40.0', 8, 6, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 5, 5, 6813.024348379106);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 5, 6, 6813.024348379106);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 5, 3, 6813.024348379106);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-13 20:40:33.0', 13, 2, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 4, 4, 2359.488834086175);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 4, 5, 2359.488834086175);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-22 04:55:07.0', 22, 4, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 8, 8, 2426.5736742565746);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 8, 4, 2426.5736742565746);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 8, 7, 2426.5736742565746);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 8, 10, 2426.5736742565746);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-29 07:14:52.0', 29, 1, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 8, 8, 7010.051624471812);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 8, 10, 7010.051624471812);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-21 04:18:14.0', 21, 2, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 1, 1, 5688.146447966177);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 1, 5, 5688.146447966177);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 1, 3, 5688.146447966177);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-02 17:57:40.0', 2, 6, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 2, 2, 1129.4214859004114);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 2, 7, 1129.4214859004114);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 2, 6, 1129.4214859004114);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 2, 3, 1129.4214859004114);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 2, 9, 1129.4214859004114);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-02 17:08:10.0', 2, 3, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 6, 6, 280.85145440564105);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 6, 7, 280.85145440564105);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-20 05:27:55.0', 20, 5, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 3, 3, 3569.899337656157);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 3, 4, 3569.899337656157);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 3, 10, 3569.899337656157);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 3, 2, 3569.899337656157);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-15 08:13:01.0', 15, 1, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 1, 1, 3667.946777707913);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 1, 6, 3667.946777707913);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 1, 5, 3667.946777707913);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-28 14:24:59.0', 28, 6, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 6, 6, 183.48795757825926);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 6, 5, 183.48795757825926);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 6, 10, 183.48795757825926);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 6, 9, 183.48795757825926);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 6, 4, 183.48795757825926);
COMMIT;