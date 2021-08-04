CREATE database AgenziaViaggi;


CREATE TABLE Partecipante (
	PartecipanteID INTEGER IDENTITY(1,1) NOT NULL,
	Nome NVARCHAR(30) NOT NULL,
	Cognome NVARCHAR(30) NOT NULL,
	DataNascita DATE NOT NULL,
	Città NVARCHAR(30) NOT NULL,
	Indirizzo NVARCHAR(30) NOT NULL,
	CONSTRAINT Partecipante_PK PRIMARY KEY(PartecipanteID),
);

CREATE TABLE Gita (
	GitaID INTEGER IDENTITY(1,1) NOT NULL,
	DataPartenza DATE NOT NULL,
	ResponsabileID INTEGER NOT NULL,
	ItinerarioID INTEGER NOT NULL,
	CONSTRAINT Gita_PK PRIMARY KEY(GitaID),
	CONSTRAINT GitaID_FK FOREIGN KEY(ResponsabileID) REFERENCES Responsabile(ResponsabileID),
	CONSTRAINT Gita2_FK FOREIGN KEY(ItinerarioID) REFERENCES Itinerario(ItinerarioID)
);


CREATE TABLE Responsabile (
	ResponsabileID INTEGER IDENTITY(1,1) NOT NULL,
	Nome NVARCHAR(30) NOT NULL,
	Cognome NVARCHAR(30) NOT NULL,
	NumeroTelefono NVARCHAR(10) NOT NULL,
	CONSTRAINT Responsabile_PK PRIMARY KEY(ResponsabileID)
);


CREATE TABLE Itinerario (
	ItinerarioID INTEGER IDENTITY(1,1) NOT NULL,
	Descrizione NVARCHAR(50) NOT NULL,
	Durata TIME(0) NOT NULL,
	Prezzo Decimal NOT NULL,
	CONSTRAINT Itinerario_PK PRIMARY KEY(ItinerarioID)
);

CREATE TABLE ItinerarioTappa (
	ItinerarioID INTEGER NOT NULL,
	TappaID INTEGER NOT NULL,
	GiorniPermanenza INTEGER NOT NULL,
    CONSTRAINT It_FK FOREIGN KEY(ItinerarioID)  REFERENCES Itinerario(ItinerarioID),
	CONSTRAINT It2_FK FOREIGN KEY(TappaID)  REFERENCES Tappa(TappaID)
);

CREATE TABLE Tappa (
	TappaID INTEGER IDENTITY(1,1)NOT NULL,
	Città NVARCHAR(20) NOT NULL,
    CONSTRAINT Tappa_PK PRIMARY KEY(TappaID)
);

CREATE TABLE PartecipanteGita (
	PartecipanteID INTEGER NOT NULL,
	GitaID INTEGER NOT NULL,
	CONSTRAINT PartecGita_FK FOREIGN KEY(PartecipanteID)  REFERENCES Partecipante(PartecipanteID),
	CONSTRAINT PartecGita2_FK FOREIGN KEY(GitaID)  REFERENCES Gita(GitaID)
);



INSERT INTO Partecipante VALUES ('Luca', 'Verdi', '1978-02-04', 'Roma', 'Via Casa 1');
INSERT INTO Partecipante VALUES ('Mario', 'Rossi', '1986-03-10', 'Milano', 'Via Palazzo 10');
INSERT INTO Partecipante VALUES ('Maria', 'Bianchi', '1998-10-04', 'Napoli', 'Via Condominio 3');
INSERT INTO Partecipante VALUES ('Giovanni', 'Neri', '1994-02-04', 'Roma', 'Via Roma 5');
INSERT INTO Partecipante VALUES ('Sara', 'Ceri', '1993-02-04', 'Caserta', 'Via CasaMia 8');
INSERT INTO Partecipante VALUES ('Michela', 'Micheli', '1972-06-12', 'Caserta', 'Via CasaMia 12');
INSERT INTO Partecipante VALUES ('Lucia', 'Gialli', '1998-03-09', 'Bari', 'Via CasaMia 6');
INSERT INTO Partecipante VALUES ('Marco', 'Verdi', '1969-10-04', 'Firenze', 'Via Palazzo 4');


INSERT INTO Responsabile VALUES ('Franco', 'Franchi', '3465890238');
INSERT INTO Responsabile VALUES ('Luisa', 'Luisi', '3289507943');
INSERT INTO Responsabile VALUES ('Matteo', 'Mattei', '3289041759');
INSERT INTO Responsabile VALUES ('Simona', 'Simoni', '3349012678');
INSERT INTO Responsabile VALUES ('Marcello', 'Marcelli', '3214567901');


INSERT INTO Itinerario VALUES ('Spiagge', '04:00:00:00', 800);
INSERT INTO Itinerario VALUES ('Città di arte', '09:00:00:00', 2500);
INSERT INTO Itinerario VALUES ('Musei', '05:00:00:00', 900);
INSERT INTO Itinerario VALUES ('Capitali', '12:00:00:00', 4800);
INSERT INTO Itinerario VALUES ('Spiagge', '6:00:00:00', 1000);
INSERT INTO Itinerario VALUES ('Montagne', '3:00:00:00', 400);

INSERT INTO Tappa VALUES ('Roma');
INSERT INTO Tappa VALUES ('Madrid');
INSERT INTO Tappa VALUES ('Berlino');
INSERT INTO Tappa VALUES ('Barcellona');
INSERT INTO Tappa VALUES ('Vienna');
INSERT INTO Tappa VALUES ('Praga');
INSERT INTO Tappa VALUES ('Parigi');
INSERT INTO Tappa VALUES ('Palma de Mallorca');
INSERT INTO Tappa VALUES ('Zante');
INSERT INTO Tappa VALUES ('Creta');


INSERT INTO ItinerarioTappa VALUES (1,8,4);
INSERT INTO ItinerarioTappa VALUES (2,1,9);
INSERT INTO ItinerarioTappa VALUES (3,4,5);
INSERT INTO ItinerarioTappa VALUES (5,9,6);
INSERT INTO ItinerarioTappa VALUES (2,7,9);
INSERT INTO ItinerarioTappa VALUES (4,3,12);
INSERT INTO ItinerarioTappa VALUES (4,6,12);
INSERT INTO ItinerarioTappa VALUES (5,10,6);

INSERT INTO Gita VALUES ('2021-04-03', 1, 2);
INSERT INTO Gita VALUES ('2021-07-21', 2, 1);
INSERT INTO Gita VALUES ('2021-08-03', 3, 5);
INSERT INTO Gita VALUES ('2022-10-12', 4, 3);
INSERT INTO Gita VALUES ('2021-04-03', 5, 4);
INSERT INTO Gita VALUES ('2022-04-03', 2, 1);
INSERT INTO Gita VALUES ('2021-12-30', 1, 4);


INSERT INTO PartecipanteGita VALUES (1,2);
INSERT INTO PartecipanteGita VALUES (2,2);
INSERT INTO PartecipanteGita VALUES (3,4);
INSERT INTO PartecipanteGita VALUES (4,5);
INSERT INTO PartecipanteGita VALUES (5,3);
INSERT INTO PartecipanteGita VALUES (6,1);
INSERT INTO PartecipanteGita VALUES (7,2);
INSERT INTO PartecipanteGita VALUES (8,5);


SELECT * FROM Gita;
SELECT * FROM PartecipanteGita;
SELECT * FROM Itinerario;
SELECT * FROM ItinerarioTappa;
SELECT * FROM Partecipante;
SELECT * FROM Responsabile;
SELECT * FROM Tappa;


--1.Mostrare tutti i dati dei partecipanti di Roma
SELECT *
FROM Partecipante
WHERE Città = 'Roma';

--2.Mostrare i dati degli itinerari con prezzo superiore ai 500 euro o durata superiore ai 7 giorni
SELECT *
FROM Itinerario
WHERE Prezzo>500 OR Durata>'07:00:00';

--3.Selezionare la data di partenza delle gite il cui itinerario ha un prezzo superiore ai 100 euro
SELECT g.DataPartenza
FROM Gita g INNER JOIN Itinerario i ON i.ItinerarioID = g.ItinerarioID
WHERE i.Prezzo>100

--4.Mostrare nome, cognome e numero di telefono dei responsabili delle gite in partenza il 3 Aprile 2022
SELECT r.Nome, r.Cognome, r.NumeroTelefono 
FROM Responsabile r INNER JOIN Gita g ON g.ResponsabileID = r.ResponsabileID
WHERE g.DataPartenza = '2021-04-03';

--5.Mostrare i dati degli itinerari ordinati per prezzo e per durata
SELECT *
FROM Itinerario i
ORDER BY i.Prezzo, i.Durata;

--6.Mostrare i dati degli itinerari con durata massima e minima
SELECT i.ItinerarioID, i.Descrizione, i.Prezzo, MAX(i.Durata) as 'Durata Massima', MIN(i.Durata) as 'Durata Minima'
FROM Itinerario i 
GROUP BY i.ItinerarioID, i.Descrizione, i.Prezzo;

--7.Mostrare le gite in partenza tra il 1 Gennaio 2021 ed il 31 Dicembre 2021
SELECT *
FROM Gita g
WHERE g.DataPartenza BETWEEN '2021-01-01' AND '2021-12-31'
