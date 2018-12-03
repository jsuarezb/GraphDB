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
COMMIT;BEGIN;COMMIT;BEGIN;INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-13 14:27:28.0', 13, 5, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 7, 7, 7025.741643649955);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (1, 1, 7, 8, 7025.741643649955);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-27 01:38:48.0', 27, 5, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 2, 2, 6962.249561362743);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 2, 1, 6962.249561362743);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 2, 7, 6962.249561362743);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (2, 2, 2, 6, 6962.249561362743);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-11 02:08:06.0', 11, 3, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 6, 6, 4447.509084770157);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 6, 8, 4447.509084770157);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 6, 7, 4447.509084770157);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 6, 3, 4447.509084770157);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (3, 3, 6, 10, 4447.509084770157);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-09 14:13:06.0', 9, 1, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 9, 9, 1227.3232861145652);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 9, 8, 1227.3232861145652);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (4, 4, 9, 6, 1227.3232861145652);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-30 13:37:57.0', 30, 4, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 9, 9, 3075.6650935652046);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 9, 6, 3075.6650935652046);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (5, 5, 9, 2, 3075.6650935652046);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-17 13:41:29.0', 17, 5, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 3, 3, 5699.908430508537);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 3, 1, 5699.908430508537);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 3, 10, 5699.908430508537);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 3, 9, 5699.908430508537);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (6, 6, 3, 6, 5699.908430508537);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-22 04:23:53.0', 22, 3, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 3, 3, 6800.39635408799);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 3, 2, 6800.39635408799);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 3, 9, 6800.39635408799);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 3, 7, 6800.39635408799);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (7, 7, 3, 1, 6800.39635408799);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-27 15:17:57.0', 27, 2, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 5, 5, 6409.267538524873);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 5, 6, 6409.267538524873);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 5, 4, 6409.267538524873);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 5, 3, 6409.267538524873);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (8, 8, 5, 9, 6409.267538524873);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-23 15:52:11.0', 23, 1, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 6, 6, 3899.9703232482366);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 6, 7, 3899.9703232482366);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (9, 9, 6, 1, 3899.9703232482366);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-19 02:46:50.0', 19, 3, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 1, 1, 4775.671224983794);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (10, 10, 1, 4, 4775.671224983794);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-03 21:11:56.0', 3, 2, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 2, 2, 3884.8231763494605);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 2, 9, 3884.8231763494605);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (11, 11, 2, 10, 3884.8231763494605);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-07 21:53:32.0', 7, 5, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 6, 6, 2648.369196458797);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 6, 4, 2648.369196458797);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 6, 7, 2648.369196458797);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (12, 12, 6, 1, 2648.369196458797);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-09 13:20:53.0', 9, 5, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 4, 4, 5539.9403489125225);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (13, 13, 4, 1, 5539.9403489125225);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-23 16:25:16.0', 23, 3, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 9, 9, 539.4710940944076);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 9, 10, 539.4710940944076);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 9, 7, 539.4710940944076);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 9, 1, 539.4710940944076);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (14, 14, 9, 4, 539.4710940944076);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-23 17:39:25.0', 23, 4, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 1, 1, 2252.9922414543357);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (15, 15, 1, 4, 2252.9922414543357);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-09 06:08:58.0', 9, 3, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 5, 5, 1019.0663711581032);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 5, 7, 1019.0663711581032);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 5, 4, 1019.0663711581032);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (16, 16, 5, 10, 1019.0663711581032);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-02 18:59:33.0', 2, 3, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 4, 4, 6565.844950434828);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 4, 9, 6565.844950434828);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 4, 10, 6565.844950434828);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 4, 6, 6565.844950434828);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (17, 17, 4, 1, 6565.844950434828);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-05-23 04:23:58.0', 23, 5, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 1, 1, 4786.72622606283);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (18, 18, 1, 10, 4786.72622606283);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-10 21:43:20.0', 10, 2, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 4, 4, 1545.8231933754432);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (19, 19, 4, 10, 1545.8231933754432);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-30 10:47:29.0', 30, 4, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 3, 3, 3432.1369729199673);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 3, 10, 3432.1369729199673);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 3, 4, 3432.1369729199673);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 3, 7, 3432.1369729199673);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (20, 20, 3, 9, 3432.1369729199673);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-06 17:37:44.0', 6, 2, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 8, 8, 4659.069486245334);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 8, 6, 4659.069486245334);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (21, 21, 8, 4, 4659.069486245334);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-06-13 00:39:00.0', 13, 6, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (22, 22, 1, 1, 1384.403214478735);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (22, 22, 1, 8, 1384.403214478735);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (22, 22, 1, 3, 1384.403214478735);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-29 18:52:35.0', 29, 1, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 3, 3, 969.103191534567);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 3, 6, 969.103191534567);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 3, 10, 969.103191534567);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (23, 23, 3, 2, 969.103191534567);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-08 00:04:14.0', 8, 3, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 3, 3, 320.2613884731492);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (24, 24, 3, 4, 320.2613884731492);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-01-30 04:58:27.0', 30, 1, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 1, 1, 5094.5860776972395);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 1, 7, 5094.5860776972395);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 1, 5, 5094.5860776972395);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (25, 25, 1, 4, 5094.5860776972395);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-02-01 00:41:16.0', 1, 2, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (26, 26, 6, 6, 2472.9240576550524);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (26, 26, 6, 7, 2472.9240576550524);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (26, 26, 6, 5, 2472.9240576550524);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (26, 26, 6, 3, 2472.9240576550524);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-08 14:45:52.0', 8, 4, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 10, 10, 2208.1258732951464);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 10, 8, 2208.1258732951464);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (27, 27, 10, 2, 2208.1258732951464);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-01 00:52:37.0', 1, 3, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 7, 7, 3078.227370782058);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 7, 4, 3078.227370782058);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 7, 10, 3078.227370782058);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 7, 3, 3078.227370782058);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (28, 28, 7, 5, 3078.227370782058);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-03-01 20:34:29.0', 1, 3, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (29, 29, 9, 9, 329.77167206187795);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (29, 29, 9, 7, 329.77167206187795);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (29, 29, 9, 3, 329.77167206187795);
INSERT INTO grupo2v6.DateTime (Time, Day, Month, Year) VALUES (TIMESTAMP '2017-04-05 02:54:14.0', 5, 4, 2017);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 7, 7, 3250.5114256089328);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 7, 6, 3250.5114256089328);
INSERT INTO grupo2v6.Call (Id, TimeId, CallerId, MemberId, Duration) VALUES (30, 30, 7, 2, 3250.5114256089328);
COMMIT;