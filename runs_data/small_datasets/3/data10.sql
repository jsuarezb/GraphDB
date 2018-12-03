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
BEGIN;COMMIT;BEGIN;INSERT INTO grupo2v4.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('287-316-7565', 'Claro', 'Damián Oseman', 'Filadelfia', 'Uruguay');
INSERT INTO grupo2v4.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('284-903-4248', 'Movistar', 'Carlos Quinoa', 'Dusseldorf', 'Turquía');
INSERT INTO grupo2v4.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('202-102-3104', 'Movistar', 'Carlos Reilly', 'Ankara', 'Uruguay');
INSERT INTO grupo2v4.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('961-351-8364', 'Movistar', 'Beto Oseman', 'Buenos Aires', 'Uruguay');
INSERT INTO grupo2v4.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('371-848-9555', 'Personal', 'Jacinta Roberts', 'Guadalajara', 'Vietnam');
INSERT INTO grupo2v4.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('280-695-2370', 'Verizon', 'Beto Oseman', 'Buenos Aires', 'Uruguay');
INSERT INTO grupo2v4.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('175-290-7325', 'Verizon', 'Giuliana Oseman', 'Filadelfia', 'Uruguay');
INSERT INTO grupo2v4.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('963-517-8868', 'Movistar', 'Ernesto Reilly', 'Guadalajara', 'Vietnam');
INSERT INTO grupo2v4.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('510-554-9963', 'Claro', 'Carlos Lanchester', 'Dusseldorf', 'Turquía');
INSERT INTO grupo2v4.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('429-633-8047', 'Verizon', 'Damián Neuer', 'Guadalajara', 'Vietnam');
COMMIT;BEGIN;COMMIT;BEGIN;INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-26 15:18:08.0', 26, 5, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 10, 10, 4736.671720779351);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 10, 7, 4736.671720779351);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 10, 5, 4736.671720779351);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-19 23:27:59.0', 19, 5, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 10, 10, 2952.5339258772183);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 10, 6, 2952.5339258772183);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-30 14:03:42.0', 30, 3, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 4, 4, 6407.965819814625);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 4, 8, 6407.965819814625);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 4, 1, 6407.965819814625);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 4, 10, 6407.965819814625);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-06 05:30:01.0', 6, 1, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 4, 4, 7092.379946492995);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 4, 8, 7092.379946492995);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 4, 3, 7092.379946492995);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 4, 10, 7092.379946492995);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-08 16:20:49.0', 8, 1, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 7, 7, 211.127300353292);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 7, 3, 211.127300353292);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 7, 5, 211.127300353292);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-29 21:01:49.0', 29, 5, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 3, 3, 6741.437633004832);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 3, 1, 6741.437633004832);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-22 03:38:20.0', 22, 1, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 3, 3, 4233.632924719003);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 3, 1, 4233.632924719003);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-28 06:03:53.0', 28, 3, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 4, 4, 5779.186416015928);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 4, 5, 5779.186416015928);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 4, 7, 5779.186416015928);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-02 08:52:22.0', 2, 1, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 4, 4, 901.0339492848412);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 4, 6, 901.0339492848412);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 4, 3, 901.0339492848412);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 4, 2, 901.0339492848412);
INSERT INTO grupo2v4.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-25 08:35:11.0', 25, 3, 2017);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 7, 7, 3246.852374835562);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 7, 9, 3246.852374835562);
INSERT INTO grupo2v4.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 7, 3, 3246.852374835562);
COMMIT;