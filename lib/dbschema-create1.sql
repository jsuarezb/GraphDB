DROP TABLE grupo2v1.Call CASCADE;
DROP TABLE grupo2v1.EmisorReceptor CASCADE;
DROP TABLE grupo2v1.DateTime CASCADE;

CREATE TABLE grupo2v1.DateTime (
    Id     SERIAL PRIMARY KEY,
	Time   TIMESTAMP,
	Day    INTEGER,
	Month  INTEGER,
	Year   INTEGER
);

CREATE TABLE grupo2v1.EmisorReceptor (
	Id       SERIAL PRIMARY KEY,
	TelNum   CHARACTER(12),
	Operator VARCHAR(64),
	UserName VARCHAR(64),
	City     VARCHAR(64),
	Country  VARCHAR(64)
);

CREATE TABLE grupo2v1.Call (
    Id       INTEGER,
 	TimeId 	 INTEGER REFERENCES grupo2v1.DateTime,
  	CallerId INTEGER REFERENCES grupo2v1.EmisorReceptor,
  	MemberId INTEGER REFERENCES grupo2v1.EmisorReceptor,
  	Duration INTEGER,

  	CONSTRAINT pk_call PRIMARY KEY (Id, TimeId, CallerId, MemberId)
);