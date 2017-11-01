DROP TABLE Call;
DROP TABLE EmisorReceptor;
DROP TABLE DateTime;

CREATE TABLE DateTime (
    Id     SERIAL PRIMARY KEY,
	Time   TIMESTAMP,
	Day    INTEGER,
	Month  INTEGER,
	Year   INTEGER
);

CREATE TABLE EmisorReceptor (
	Id       SERIAL PRIMARY KEY,
	TelNum   CHARACTER(12),
	Operator VARCHAR(64),
	UserName VARCHAR(64),
	City     VARCHAR(64),
	Country  VARCHAR(64)
);

CREATE TABLE Call (
    Id       INTEGER,
 	TimeId 	 INTEGER REFERENCES DateTime,
  	CallerId INTEGER REFERENCES EmisorReceptor,
  	MemberId INTEGER REFERENCES EmisorReceptor,
  	Duration INTEGER,

  	CONSTRAINT pk_call PRIMARY KEY (Id, TimeId, CallerId, MemberId)
);
