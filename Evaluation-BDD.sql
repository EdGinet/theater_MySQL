CREATE DATABASE IF NOT EXISTS theater_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CREATION DES TABLES --

CREATE TABLE theaters (
    TheaterID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name VARCHAR(30) NOT NULL,
    Address VARCHAR(30) NOT NULL,
    PostalCode INTEGER NOT NULL,
    City VARCHAR(30) NOT NULL
) ENGINE=INNODB;

CREATE TABLE admins (
    AdminID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    UserName VARCHAR(30) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    FirstName VARCHAR(30) NOT NULL,
    Status VARCHAR(30) NOT NULL,
    Password VARCHAR(155) NOT NULL
) ENGINE=INNODB;

CREATE TABLE customers (
    CustomerID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Username VARCHAR(30) NOT NULL,
    Password VARCHAR(155) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    FirstName VARCHAR(30) NOT NULL
) ENGINE=INNODB;

CREATE TABLE prices (
    PriceID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Description VARCHAR(30) NOT NULL,
    Price FLOAT NOT NULL
) ENGINE=INNODB;

CREATE TABLE theater_sessions (
    SessionID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    FilmTitle VARCHAR(100) NOT NULL,
    SessionSchedule TIME NOT NULL,
    FilmGenre VARCHAR(30) NOT NULL,
    RemainingSeats INTEGER NOT NULL,
    TheaterID INTEGER,
    CONSTRAINT FK_TheaterID FOREIGN KEY (TheaterID)
    REFERENCES theaters(TheaterID)
) ENGINE=INNODB;

CREATE TABLE added_sessions (
    AddedSessionID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Date DATETIME,
    AdminID INTEGER,
    SessionID INTEGER,
    CONSTRAINT FK_AdminID FOREIGN KEY (AdminID)
    REFERENCES admins(AdminID),
    CONSTRAINT FK_SessionID FOREIGN KEY (SessionID)
    REFERENCES theater_sessions(SessionID)
) ENGINE=INNODB;

CREATE TABLE tickets (
    TicketID INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Customer_ID INTEGER,
    Session_ID INTEGER,
    Theater_ID INTEGER,
    Price_ID INTEGER,
    CONSTRAINT FK_Theater_ID FOREIGN KEY (Theater_ID)
    REFERENCES theaters(TheaterID),
    CONSTRAINT FK_Price_ID FOREIGN KEY (Price_ID)
    REFERENCES prices(PriceID),
    CONSTRAINT FK_Customer_ID FOREIGN KEY (Customer_ID)
    REFERENCES customers(CustomerID),
    CONSTRAINT FK_Session_ID FOREIGN KEY (Session_ID)
    REFERENCES theater_sessions(SessionID)
) ENGINE=INNODB;

-- CONTENU DES TABLES --

INSERT INTO theaters (Name, Address, PostalCode, City) VALUES 
('Le Théâtre 4D', '44, rue de Potier', '86254', 'Riou'),
('Cinéthèque', '5 rue Custodes Astartes', '26020', 'Horaou'),
('Cinemanimal', '6, boulevard de Grondin', '02047', 'Dufourdan'),
('Mon Siège à Rêves', '98, boulevard Regnier', '13125', 'Marin-la-Forêt'),
('Le Coin Hollywood', '36, boulevard de Lebreton', '07247', 'Noel-sur-Gonzalez'),
('Il était une fois', '58, avenue de Fleury', '40662', 'Bruneau'),
('Projector', '17, chemin Chauveau', '42503' , 'Guillou-sur-Gilles');



INSERT INTO theater_sessions (FilmTitle, SessionSchedule, FilmGenre, RemainingSeats) VALUES
('Pink Saris', '12:00', 'Documentary|Drama', 41);
('Nicht alle waren Mörder', '11:50', 'Drama|War', 3);
('Amos & Andrew', '11:50', 'Comedy', 14);
('Happiness Never Comes Alone (Un bonheur n''arrive jamais seul)', '11:20', 'Comedy|Romance', 13);
('Low Down Dirty Shame, A', '14:10', 'Action|Comedy', 18);
('Bucket of Blood, A (Dark Secrets) (Death Artist, The)', '18:00', 'Comedy|Horror|Thriller', 14);
('Scarecrow, The', '10:20', 'Drama|Fantasy|Romance', 18);
('Step Into Liquid', '13:00', 'Documentary', 19);
('Pacifier, The', '17:40', 'Action|Comedy', 32);
('Simple Simon (I rymden finns inga känslor)', '18:00', 'Comedy|Drama', 46);
('Quest', '10:30', 'Animation', 5);
('Magdalene Sisters, The', '18:45', 'Drama', 9);
('Manzanar Fishing Club, The', '10:30', 'Adventure|Documentary', 42);
('Mortal Kombat: Annihilation', '15:40', 'Action|Adventure|Fantasy', 5);
('LennoNYC', '20:30', 'Documentary', 11);


INSERT INTO customers (FirstName, LastName, Email, Username, Password) VALUES
('Brittan', 'Hamfleet', 'bhamfleet0@exblog.jp', 'bhamfleet0', '$2y$10$PI/9I5SJeyB70gb3TDQlselC2kMPUEyhhZvl8iDuCTka9fpD5JY.i'),
('Babette', 'Meddows', 'bmeddows1@icq.com', 'bmeddows1', '$2y$10$IfjMheLHvBRTyGdX6L4.fOckADWNN9lXmV0wbha.KihuEIr7wOyAW'),
('Ernie', 'Bugdell', 'ebugdell2@studiopress.com', 'ebugdell2', '$2y$10$cCgHjTlAVzpmn7SXcxiMa.dmDRE988RyJ3X6PD68yCp/iDdgr43nG'),
('Becka', 'Scotchford', 'bscotchford3@cargocollective.com', 'bscotchford3', '$2y$10$M0K1CEq0zlUDmFp4b0ov5eKtbT8isUPofjLkqHakCMSA.8CFzCFMe'),
('Chet', 'Ratnege', 'cratnege4@about.me', 'cratnege4', '$2y$10$XOn0geojlkaNSSyD4oU74OHUO0tvP9/3Lk1i0DH4q7Y3kIYTIeQTu'),
('Garrek', 'De Marchi', 'gdemarchi5@ask.com', 'gdemarchi5', '$2y$10$nwpFdjE2zlPz3.qva.bmWOB7PorcbfB1gE3DqfHLrDO0D7LrZkvm.'),
('Ripley', 'Ruggier', 'rruggier6@loc.gov', 'rruggier6', '$2y$10$VcjMd9XrSBQvqGznPx3xOOH.A.VkXK7..Di3hdKFxzYsEUlB35/Q2'),
('Yulma', 'Allenby', 'yallenby7@patch.com', 'yallenby7', '$2y$10$a7chQkK8KYtzigli9GxZt.UTwYemcpk64vSai3Qn8O4agSOM5GTyq'),
('Lisetta', 'Paragreen', 'lparagreen8@bluehost.com', 'lparagreen8', '$2y$10$HaznP/F0KtQcVdfaAQh5sOsZomWn5.jeVo1uIQfYhzv1M5Q/RbQV2'),
('Gordy', 'Timmes', 'gtimmes9@msu.edu', 'gtimmes9', '$2y$10$eCC1/RkfC91RKMxGWPEE9.uAKDQM6G/Bsic7FOHhJtomuTVNdPEzu'),
('Bourke', 'MacEllen', 'bmacellena@amazon.co.uk', 'bmacellena', '$2y$10$iZrw58d48yZjTVguQsFgwuIr71FfWc4/gFHboY32dZN8BQMQL3y82'),
('Malcolm', 'Yanele', 'myaneleb@weebly.com', 'myaneleb', '$2y$10$0Q8tlCVYyDU1juZta6u6t.WlA7RfmmJ8NRxWLNSN1SaofLa0HzobC'),
('Ellwood', 'Medgewick', 'emedgewickc@nifty.com', 'emedgewickc', '$2y$10$rNS5/vMcxrYTlhMNVfVG7OdJeNSMXPRweA9GpLvI9cvdz.c5f9GSS'),
('Torr', 'Schapiro', 'tschapirod@cocolog-nifty.com', 'tschapirod', '$2y$10$kVi0unrLARr9rQls1FRLQub4o2VjKJPIhoqt7QfUUllASfj08uRNO'),
('Merissa', 'Stockau', 'mstockaue@weather.com', 'mstockaue', '$2y$10$DBcbnxQcYgCZM1JQmsopWudSEpJ.HL0JxVVYzEn4FR5rGqYQcKShi');

INSERT INTO prices (Description, Price) VALUES 
('Adulte', 9.20),
('Etudiant', 7.60),
('Enfant', 5.60);

INSERT INTO admins (UserName, Email, LastName, FirstName, Status, Password) VALUES
('arimmington0', 'arimmington0@163.com', 'Rimmington', 'Amii', 'Administrator', '$2y$10$.uJRsjSUODgddWsIvHgnaOq1J4BVRR/jjXPNqPvM3dxzNai6Jj/c6');
('bkeatch1', 'bkeatch1@addtoany.com', 'Keatch', 'Babs', 'Theater user', '$2y$10$ElS8y5eD7mBgM5qwTqMzjOxQk1O.UFdsTHjHO4f0oKcUYFAEl3yiy');
('njosephsen2', 'njosephsen2@ucoz.com', 'Josephsen', 'Neall', 'Theater user', '$2y$10$m9F3l1gVih/AckEn6hRSeeU2MFxokzYRRRzUY4yQ3Pr6FW/zW3ARy');
('igriffitt3', 'igriffitt3@over-blog.com', 'Griffitt', 'Imojean', 'Theater user', '$2y$10$0ePma/qf0dXAvUu6Q2q.IObr3kFRCQZmu/Y831K5mued3cL/eNTS.');
('zslayton4', 'zslayton4@webs.com', 'Slayton', 'Zebulen', 'Theater user', '$2y$10$Ous.HMKP26QdUiccGP0DQeMKdXNqChi0gGKBP6GV9vc4rrpAHCMXK');
('rpellingar5', 'rpellingar5@census.gov', 'Pellingar', 'Rolland', 'Theater user', '$2y$10$xo10jJ3JLD8E0okq6Qh0.eyJ9mrRHWsknVKwF3v8jcOoFS3SLzkky');
('llarive0', 'llarive0@infoseek.co.jp', 'Larive', 'Lilia', 'Theater user', '$2y$10$jB4sMRbKyegHfxcAdXGkeeInhklpF81exDBA.GbASfh9W0SK.rxuG');
('adelatour1', 'adelatour1@netlog.com', 'Delatour', 'Amitie', 'Theater user', '$2y$10$FGAwLSuRe14QsKaSSSFUsOxOAoJEfwneCNXAQb5GOWtZHIKuJt4YO');

INSERT INTO added_sessions (Date) VALUES 
('2021-12-18');
('2022-04-24');
('2021-12-24');
('2022-02-14');
('2022-02-03');
('2022-04-14');
('2022-11-23');

INSERT INTO tickets (Customer_ID, Session_ID, Theater_ID, Price_ID) VALUES
(5, 7, 7, 1),
(2, 15, 2, 1),
(2, 15, 2, 3), 
(3, 14, 5, 2), 
(4, 14, 5, 2), 
(1, 11, 6, 1), 
(14, 9, 3, 1), 
(15, 9, 3, 1), 
(9, 13, 1, 1), 
(10, 3, 2, 1), 
(11, 2, 4, 1), 
(6, 8, 7, 2), 
(7, 8, 7, 2), 
(8, 2, 3, 1), 
(12, 1, 4, 2);

-- Modification de la table 'admins', l'ajout de la clé étrangère 'TheaterID' semblait plus logique --

ALTER TABLE admins ADD Theater_ID INTEGER;
ALTER TABLE admins ADD FOREIGN KEY (TheaterID) REFERENCES theaters(TheaterID);


UPDATE admins SET TheaterID = '1' WHERE admins.AdminID = 2;
UPDATE admins SET TheaterID = '2' WHERE admins.AdminID = 3;
UPDATE admins SET TheaterID = '3' WHERE admins.AdminID = 4;
UPDATE admins SET TheaterID = '4' WHERE admins.AdminID = 5;
UPDATE admins SET TheaterID = '5' WHERE admins.AdminID = 6;
UPDATE admins SET TheaterID = '6' WHERE admins.AdminID = 7;
UPDATE admins SET TheaterID = '7' WHERE admins.AdminID = 8;

--Modification de la table 'theater_session' et ajout du contenu de la clé étrangère 'SessionID' --

UPDATE theater_sessions SET TheaterID = '4' WHERE theater_sessions.SessionID = 1;
UPDATE theater_sessions SET TheaterID = '3' WHERE theater_sessions.SessionID = 2;
UPDATE theater_sessions SET TheaterID = '2' WHERE theater_sessions.SessionID = 3;
UPDATE theater_sessions SET TheaterID = '1' WHERE theater_sessions.SessionID = 4;
UPDATE theater_sessions SET TheaterID = '5' WHERE theater_sessions.SessionID = 5;
UPDATE theater_sessions SET TheaterID = '6' WHERE theater_sessions.SessionID = 6;
UPDATE theater_sessions SET TheaterID = '7' WHERE theater_sessions.SessionID = 7;
UPDATE theater_sessions SET TheaterID = '7' WHERE theater_sessions.SessionID = 8;
UPDATE theater_sessions SET TheaterID = '3' WHERE theater_sessions.SessionID = 9;
UPDATE theater_sessions SET TheaterID = '2' WHERE theater_sessions.SessionID = 10;
UPDATE theater_sessions SET TheaterID = '6' WHERE theater_sessions.SessionID = 11;
UPDATE theater_sessions SET TheaterID = '4' WHERE theater_sessions.SessionID = 12;
UPDATE theater_sessions SET TheaterID = '1' WHERE theater_sessions.SessionID = 13;
UPDATE theater_sessions SET TheaterID = '5' WHERE theater_sessions.SessionID = 14;
UPDATE theater_sessions SET TheaterID = '2' WHERE theater_sessions.SessionID = 15;


-- Ajout du contenu des clés étrangère 'AdminID' et 'SessionID' à la table 'added_sessions' --

UPDATE added_sessions
SET AdminID = '2', SessionID = '4'
WHERE AddedSessionID = 1;

UPDATE added_sessions
SET AdminID = '5', SessionID = '1'
WHERE AddedSessionID = 2;

UPDATE added_sessions
SET AdminID = '8', SessionID = '7'
WHERE AddedSessionID = 3;

UPDATE added_sessions
SET AdminID = '3', SessionID = '10'
WHERE AddedSessionID = 4;

UPDATE added_sessions
SET AdminID = '6', SessionID = '14'
WHERE AddedSessionID = 5;

UPDATE added_sessions
SET AdminID = '4', SessionID = '9'
WHERE AddedSessionID = 6;

UPDATE added_sessions
SET AdminID = '7', SessionID = '11'
WHERE AddedSessionID = 7;

-- Droit de gestion de la base de donnée à l'utilisateur 'Administrator' --

GRANT ALL PRIVILEGES ON *.* TO 'arimmington0'@'localhost' IDENTIFIED BY '$2y$10$.uJRsjSUODgddWsIvHgnaOq1J4BVRR/jjXPNqPvM3dxzNai6Jj/c6';

-- Droit de vue sur la base de donnée aux utilisateurs 'Theater user'

GRANT SELECT ON Evaluation-BDD.* TO 'bkeatch1'@'localhost' IDENTIFIED BY '$2y$10$ElS8y5eD7mBgM5qwTqMzjOxQk1O.UFdsTHjHO4f0oKcUYFAEl3yiy';

GRANT SELECT ON Evaluation-BDD.* TO 'njosephsen2'@'localhost' IDENTIFIED BY '$2y$10$m9F3l1gVih/AckEn6hRSeeU2MFxokzYRRRzUY4yQ3Pr6FW/zW3ARy';

GRANT SELECT ON Evaluation-BDD.* TO 'igriffitt3'@'localhost' IDENTIFIED BY '$2y$10$0ePma/qf0dXAvUu6Q2q.IObr3kFRCQZmu/Y831K5mued3cL/eNTS.';

GRANT SELECT ON Evaluation-BDD.* TO 'zslayton4'@'localhost' IDENTIFIED BY '$2y$10$Ous.HMKP26QdUiccGP0DQeMKdXNqChi0gGKBP6GV9vc4rrpAHCMXK';

GRANT SELECT ON Evaluation-BDD.* TO 'rpellingar5'@'localhost' IDENTIFIED BY '$2y$10$xo10jJ3JLD8E0okq6Qh0.eyJ9mrRHWsknVKwF3v8jcOoFS3SLzkky';

GRANT SELECT ON Evaluation-BDD.* TO 'llarive0'@'localhost' IDENTIFIED BY '$2y$10$jB4sMRbKyegHfxcAdXGkeeInhklpF81exDBA.GbASfh9W0SK.rxuG';

GRANT SELECT ON Evaluation-BDD.* TO 'adelatour1'@'localhost' IDENTIFIED BY '$2y$10$FGAwLSuRe14QsKaSSSFUsOxOAoJEfwneCNXAQb5GOWtZHIKuJt4YO';

-- Export des données de la base de données --

mysqldump -u root -p Evaluation-BDD > Evaluation_BDD.sql;

-- Export de la structure de la base de données --

mysqldump --no-data -u root -p Evaluation-BDD > Evaluation_BDD.sql;