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
COMMIT;BEGIN;COMMIT;BEGIN;INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-16 14:39:06.0', 16, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 10, 10, 7054.607870290434);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 10, 1, 7054.607870290434);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 10, 4, 7054.607870290434);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 10, 7, 7054.607870290434);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 10, 8, 7054.607870290434);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-20 03:25:15.0', 20, 6, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 4, 4, 6143.110753074224);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 4, 7, 6143.110753074224);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 4, 6, 6143.110753074224);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 4, 2, 6143.110753074224);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 4, 8, 6143.110753074224);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-15 21:58:52.0', 15, 6, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 7, 7, 4878.60772386344);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 7, 8, 4878.60772386344);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-10 23:50:42.0', 10, 2, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 2, 2, 3692.668543306445);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 2, 4, 3692.668543306445);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-05 09:35:27.0', 5, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 8, 8, 5897.269843616171);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 8, 5, 5897.269843616171);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 8, 4, 5897.269843616171);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 8, 6, 5897.269843616171);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-11 15:22:34.0', 11, 4, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 5, 5, 1861.0542494120414);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 5, 9, 1861.0542494120414);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-25 23:08:08.0', 25, 3, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 7, 7, 1100.8310659734796);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 7, 6, 1100.8310659734796);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 7, 5, 1100.8310659734796);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 7, 9, 1100.8310659734796);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 7, 1, 1100.8310659734796);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-06 13:44:44.0', 6, 2, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 8, 8, 4125.027586317953);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 8, 1, 4125.027586317953);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-20 08:41:38.0', 20, 3, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 3, 3, 2166.7313895423476);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 3, 6, 2166.7313895423476);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 3, 1, 2166.7313895423476);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 3, 8, 2166.7313895423476);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 3, 5, 2166.7313895423476);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-08 16:05:28.0', 8, 3, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 2, 2, 1703.7192876963952);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 2, 5, 1703.7192876963952);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-15 20:12:46.0', 15, 3, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 1, 1, 5467.2773466715);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 1, 7, 5467.2773466715);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 1, 2, 5467.2773466715);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 1, 9, 5467.2773466715);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 1, 8, 5467.2773466715);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-18 23:10:14.0', 18, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 8, 8, 529.4464854910001);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 8, 3, 529.4464854910001);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 8, 1, 529.4464854910001);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 8, 5, 529.4464854910001);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 8, 2, 529.4464854910001);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-10 14:01:13.0', 10, 4, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 3, 3, 4491.38925057875);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 3, 7, 4491.38925057875);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 3, 4, 4491.38925057875);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 3, 2, 4491.38925057875);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 3, 8, 4491.38925057875);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-19 06:04:26.0', 19, 2, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 8, 8, 2219.1563716676305);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 8, 6, 2219.1563716676305);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-09 12:12:11.0', 9, 1, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 8, 8, 2131.357013845394);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 8, 2, 2131.357013845394);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 8, 9, 2131.357013845394);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 8, 5, 2131.357013845394);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-25 03:24:44.0', 25, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 4, 4, 4608.170360765525);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 4, 1, 4608.170360765525);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-24 07:31:11.0', 24, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 10, 10, 3313.5694040821822);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 10, 8, 3313.5694040821822);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-19 05:24:54.0', 19, 4, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 8, 8, 144.50357955142655);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 8, 4, 144.50357955142655);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 8, 5, 144.50357955142655);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-03 23:53:34.0', 3, 1, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 7, 7, 4280.420393974127);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 7, 2, 4280.420393974127);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 7, 4, 4280.420393974127);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 7, 3, 4280.420393974127);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 7, 10, 4280.420393974127);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-12 00:33:03.0', 12, 2, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 3, 3, 5422.620373851626);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 3, 8, 5422.620373851626);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 3, 7, 5422.620373851626);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 3, 4, 5422.620373851626);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 3, 9, 5422.620373851626);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-08 01:03:47.0', 8, 3, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 2, 2, 6297.107573240595);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 2, 5, 6297.107573240595);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 2, 4, 6297.107573240595);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-30 17:53:08.0', 30, 4, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (22, 22, 5, 5, 5124.001888499348);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (22, 22, 5, 1, 5124.001888499348);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-05 06:49:55.0', 5, 4, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 2, 2, 4785.111507356378);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 2, 5, 4785.111507356378);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 2, 9, 4785.111507356378);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 2, 7, 4785.111507356378);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-04 12:56:47.0', 4, 1, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 2, 2, 2851.9165264503363);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 2, 6, 2851.9165264503363);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 2, 4, 2851.9165264503363);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 2, 10, 2851.9165264503363);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-26 19:41:31.0', 26, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 10, 10, 4831.059200322379);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 10, 2, 4831.059200322379);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 10, 3, 4831.059200322379);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 10, 5, 4831.059200322379);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 10, 7, 4831.059200322379);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-14 03:27:58.0', 14, 1, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (26, 26, 5, 5, 4036.2350180992003);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (26, 26, 5, 1, 4036.2350180992003);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-21 05:46:09.0', 21, 3, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 1, 1, 560.4534585155634);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 1, 2, 560.4534585155634);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-31 20:28:14.0', 31, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 1, 1, 1755.0508931237528);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 1, 4, 1755.0508931237528);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-29 18:59:18.0', 29, 6, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (29, 29, 4, 4, 3736.8791686609984);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (29, 29, 4, 5, 3736.8791686609984);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (29, 29, 4, 2, 3736.8791686609984);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (29, 29, 4, 7, 3736.8791686609984);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (29, 29, 4, 6, 3736.8791686609984);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-19 10:30:48.0', 19, 1, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 2, 2, 6763.146621041486);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 2, 1, 6763.146621041486);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 2, 7, 6763.146621041486);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 2, 4, 6763.146621041486);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 2, 9, 6763.146621041486);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-20 05:17:15.0', 20, 5, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (31, 31, 3, 3, 505.52397407472796);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (31, 31, 3, 6, 505.52397407472796);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (31, 31, 3, 2, 505.52397407472796);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-06 17:52:28.0', 6, 6, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (32, 32, 4, 4, 3067.5115635487828);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (32, 32, 4, 3, 3067.5115635487828);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-10 14:34:52.0', 10, 3, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (33, 33, 5, 5, 4445.879414635324);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (33, 33, 5, 6, 4445.879414635324);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-22 16:18:04.0', 22, 6, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (34, 34, 3, 3, 2540.0064516303273);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (34, 34, 3, 7, 2540.0064516303273);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (34, 34, 3, 10, 2540.0064516303273);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-13 06:13:06.0', 13, 3, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (35, 35, 10, 10, 1290.784237163153);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (35, 35, 10, 4, 1290.784237163153);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (35, 35, 10, 8, 1290.784237163153);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (35, 35, 10, 3, 1290.784237163153);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (35, 35, 10, 5, 1290.784237163153);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-31 18:50:39.0', 31, 1, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (36, 36, 1, 1, 1341.8896614717828);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (36, 36, 1, 3, 1341.8896614717828);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (36, 36, 1, 8, 1341.8896614717828);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (36, 36, 1, 9, 1341.8896614717828);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-14 03:39:35.0', 14, 6, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (37, 37, 7, 7, 1312.4591790466793);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (37, 37, 7, 8, 1312.4591790466793);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (37, 37, 7, 4, 1312.4591790466793);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (37, 37, 7, 1, 1312.4591790466793);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (37, 37, 7, 6, 1312.4591790466793);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-05 04:20:42.0', 5, 4, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (38, 38, 3, 3, 5805.080329815188);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (38, 38, 3, 2, 5805.080329815188);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (38, 38, 3, 4, 5805.080329815188);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (38, 38, 3, 1, 5805.080329815188);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (38, 38, 3, 6, 5805.080329815188);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-26 18:55:40.0', 26, 4, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (39, 39, 9, 9, 1581.041868808175);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (39, 39, 9, 6, 1581.041868808175);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (39, 39, 9, 5, 1581.041868808175);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (39, 39, 9, 7, 1581.041868808175);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (39, 39, 9, 4, 1581.041868808175);
INSERT INTO grupo2v7.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-26 11:29:29.0', 26, 6, 2017);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (40, 40, 6, 6, 6821.189868362631);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (40, 40, 6, 10, 6821.189868362631);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (40, 40, 6, 3, 6821.189868362631);
INSERT INTO grupo2v7.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (40, 40, 6, 8, 6821.189868362631);
COMMIT;