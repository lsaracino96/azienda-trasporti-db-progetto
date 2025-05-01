
-- CREAZIONE TABELLE E INSERIMENTO DATI

CREATE TABLE Treno (
    ID_Treno INT PRIMARY KEY,
    Modello VARCHAR(50),
    Capacita INT
);

INSERT INTO Treno VALUES
(1, 'Frecciarossa 1000', 500),
(2, 'Italo EVO', 480),
(3, 'Regionale Veloce', 350),
(4, 'Intercity', 400),
(5, 'Frecciargento', 420);

CREATE TABLE Stazione (
    ID_Stazione INT PRIMARY KEY,
    Nome VARCHAR(100),
    Città VARCHAR(100)
);

INSERT INTO Stazione VALUES
(1, 'Milano Centrale', 'Milano'),
(2, 'Roma Termini', 'Roma'),
(3, 'Bologna Centrale', 'Bologna'),
(4, 'Firenze S.M.N.', 'Firenze'),
(5, 'Napoli Centrale', 'Napoli');

CREATE TABLE Tratta (
    ID_Tratta INT PRIMARY KEY,
    Stazione_Partenza INT,
    Stazione_Arrivo INT,
    Durata INT,
    FOREIGN KEY (Stazione_Partenza) REFERENCES Stazione(ID_Stazione),
    FOREIGN KEY (Stazione_Arrivo) REFERENCES Stazione(ID_Stazione)
);

INSERT INTO Tratta VALUES
(1, 1, 2, 180),
(2, 2, 5, 70),
(3, 1, 3, 60),
(4, 3, 4, 50),
(5, 4, 2, 90);

CREATE TABLE Fermata (
    ID_Fermata INT PRIMARY KEY,
    ID_Tratta INT,
    ID_Stazione INT,
    Orario_Partenza TIME,
    Orario_Arrivo TIME,
    FOREIGN KEY (ID_Tratta) REFERENCES Tratta(ID_Tratta),
    FOREIGN KEY (ID_Stazione) REFERENCES Stazione(ID_Stazione)
);

INSERT INTO Fermata VALUES
(1, 1, 1, '08:00:00', NULL),
(2, 1, 3, '09:00:00', '09:05:00'),
(3, 1, 4, '10:00:00', '10:05:00'),
(4, 1, 2, NULL, '11:00:00'),
(5, 2, 2, '11:30:00', NULL);

CREATE TABLE Passeggero (
    ID_Passeggero INT PRIMARY KEY,
    Nome VARCHAR(100),
    Cognome VARCHAR(100),
    Email VARCHAR(100) UNIQUE
);

INSERT INTO Passeggero VALUES
(1, 'Luca', 'Rossi', 'luca.rossi@example.com'),
(2, 'Giulia', 'Bianchi', 'giulia.bianchi@example.com'),
(3, 'Marco', 'Verdi', 'marco.verdi@example.com'),
(4, 'Elena', 'Neri', 'elena.neri@example.com'),
(5, 'Alessandro', 'Conti', 'alessandro.conti@example.com');

CREATE TABLE Biglietto (
    ID_Biglietto INT PRIMARY KEY,
    ID_Passeggero INT,
    ID_Tratta INT,
    Data_Partenza DATE,
    Prezzo DECIMAL(10,2),
    Validato BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (ID_Passeggero) REFERENCES Passeggero(ID_Passeggero),
    FOREIGN KEY (ID_Tratta) REFERENCES Tratta(ID_Tratta)
);

INSERT INTO Biglietto VALUES
(1, 1, 1, '2025-05-10', 45.50, TRUE),
(2, 2, 3, '2025-05-11', 30.00, FALSE),
(3, 3, 2, '2025-05-12', 55.00, TRUE),
(4, 4, 4, '2025-05-13', 25.00, FALSE),
(5, 5, 5, '2025-05-14', 38.00, TRUE);

CREATE TABLE Prenotazione (
    ID_Prenotazione INT PRIMARY KEY,
    ID_Passeggero INT,
    ID_Biglietto INT,
    Data_Ora TIMESTAMP,
    FOREIGN KEY (ID_Passeggero) REFERENCES Passeggero(ID_Passeggero),
    FOREIGN KEY (ID_Biglietto) REFERENCES Biglietto(ID_Biglietto)
);

INSERT INTO Prenotazione VALUES
(1, 1, 1, '2025-05-01 12:00:00'),
(2, 2, 2, '2025-05-02 13:30:00'),
(3, 3, 3, '2025-05-03 14:45:00'),
(4, 4, 4, '2025-05-04 16:10:00'),
(5, 5, 5, '2025-05-05 10:25:00');
