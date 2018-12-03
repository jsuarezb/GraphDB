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
BEGIN;COMMIT;BEGIN;INSERT INTO grupo2v5.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('287-316-7565', 'Claro', 'Damián Oseman', 'Filadelfia', 'Uruguay');
INSERT INTO grupo2v5.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('284-903-4248', 'Movistar', 'Carlos Quinoa', 'Dusseldorf', 'Turquía');
INSERT INTO grupo2v5.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('202-102-3104', 'Movistar', 'Carlos Reilly', 'Ankara', 'Uruguay');
INSERT INTO grupo2v5.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('961-351-8364', 'Movistar', 'Beto Oseman', 'Buenos Aires', 'Uruguay');
INSERT INTO grupo2v5.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('371-848-9555', 'Personal', 'Jacinta Roberts', 'Guadalajara', 'Vietnam');
INSERT INTO grupo2v5.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('280-695-2370', 'Verizon', 'Beto Oseman', 'Buenos Aires', 'Uruguay');
INSERT INTO grupo2v5.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('175-290-7325', 'Verizon', 'Giuliana Oseman', 'Filadelfia', 'Uruguay');
INSERT INTO grupo2v5.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('963-517-8868', 'Movistar', 'Ernesto Reilly', 'Guadalajara', 'Vietnam');
INSERT INTO grupo2v5.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('510-554-9963', 'Claro', 'Carlos Lanchester', 'Dusseldorf', 'Turquía');
INSERT INTO grupo2v5.EmisorReceptor (TelNum, Operator, UserName, City, Country) VALUES ('429-633-8047', 'Verizon', 'Damián Neuer', 'Guadalajara', 'Vietnam');
COMMIT;BEGIN;COMMIT;BEGIN;INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-16 22:07:20.0', 16, 3, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 5, 5, 5085.267359002558);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 5, 9, 5085.267359002558);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 5, 7, 5085.267359002558);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-30 16:25:06.0', 30, 6, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 3, 3, 5599.232465455482);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 3, 7, 5599.232465455482);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-14 07:46:58.0', 14, 1, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 9, 9, 5752.859644700325);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 9, 2, 5752.859644700325);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 9, 4, 5752.859644700325);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 9, 3, 5752.859644700325);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-01 23:04:33.0', 1, 6, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 4, 4, 988.5801870900697);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 4, 7, 988.5801870900697);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 4, 6, 988.5801870900697);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 4, 5, 988.5801870900697);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-28 19:57:56.0', 28, 3, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 9, 9, 1109.6182603494703);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 9, 2, 1109.6182603494703);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 9, 3, 1109.6182603494703);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 9, 10, 1109.6182603494703);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-15 03:49:13.0', 15, 5, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 6, 6, 5612.410009335033);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 6, 5, 5612.410009335033);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 6, 4, 5612.410009335033);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 6, 1, 5612.410009335033);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 6, 10, 5612.410009335033);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-13 05:48:49.0', 13, 2, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 1, 1, 1813.3829343894135);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 1, 5, 1813.3829343894135);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-21 15:17:25.0', 21, 3, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 4, 4, 1861.3541580700971);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 4, 2, 1861.3541580700971);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 4, 8, 1861.3541580700971);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 4, 6, 1861.3541580700971);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 4, 5, 1861.3541580700971);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-10 04:27:28.0', 10, 3, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 3, 3, 3371.0520677489994);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 3, 10, 3371.0520677489994);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 3, 2, 3371.0520677489994);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 3, 7, 3371.0520677489994);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-20 14:39:23.0', 20, 3, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 5, 5, 759.8460890954246);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 5, 1, 759.8460890954246);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 5, 9, 759.8460890954246);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 5, 8, 759.8460890954246);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 5, 10, 759.8460890954246);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-10 08:45:18.0', 10, 1, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 5, 5, 4024.6057329603254);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 5, 10, 4024.6057329603254);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-29 03:27:24.0', 29, 5, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 10, 10, 4848.0474626378855);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 10, 7, 4848.0474626378855);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 10, 6, 4848.0474626378855);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 10, 5, 4848.0474626378855);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 10, 8, 4848.0474626378855);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-24 05:22:47.0', 24, 2, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 7, 7, 4912.125191253663);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 7, 5, 4912.125191253663);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 7, 6, 4912.125191253663);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-19 23:21:46.0', 19, 3, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 1, 1, 357.7436014765004);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 1, 4, 357.7436014765004);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 1, 9, 357.7436014765004);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 1, 6, 357.7436014765004);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 1, 7, 357.7436014765004);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-11 13:18:20.0', 11, 4, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 7, 7, 6382.766620827294);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 7, 10, 6382.766620827294);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 7, 6, 6382.766620827294);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 7, 3, 6382.766620827294);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 7, 8, 6382.766620827294);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-11 11:52:22.0', 11, 1, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 9, 9, 1790.14536047355);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 9, 10, 1790.14536047355);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 9, 7, 1790.14536047355);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 9, 8, 1790.14536047355);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-19 10:08:15.0', 19, 4, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 6, 6, 4716.572645588244);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 6, 8, 4716.572645588244);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 6, 5, 4716.572645588244);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 6, 10, 4716.572645588244);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 6, 2, 4716.572645588244);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-25 17:10:47.0', 25, 5, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 4, 4, 5077.281968419016);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 4, 10, 5077.281968419016);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 4, 1, 5077.281968419016);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 4, 7, 5077.281968419016);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-14 17:04:29.0', 14, 2, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 8, 8, 1877.4419105065574);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 8, 2, 1877.4419105065574);
INSERT INTO grupo2v5.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-25 17:32:52.0', 25, 6, 2017);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 4, 4, 278.41215267061875);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 4, 2, 278.41215267061875);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 4, 7, 278.41215267061875);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 4, 10, 278.41215267061875);
INSERT INTO grupo2v5.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 4, 5, 278.41215267061875);
COMMIT;