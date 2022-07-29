CREATE DATABASE IF NOT EXISTS theater_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


CREATE TABLE theaters (
    theater_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name VARCHAR(30) NOT NULL,
    Address VARCHAR(30) NOT NULL,
    PostalCode INTEGER NOT NULL,
    City VARCHAR(30) NOT NULL
) ENGINE=INNODB;

CREATE TABLE theater_sessions (
    theater_session_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    FilmTitle VARCHAR(100) NOT NULL,
    Session_Schedule TIME NOT NULL,
    FilmGenre VARCHAR(30) NOT NULL,
    Remaining_Seats INTEGER NOT NULL,
    theater_id INTEGER,
    ticket_id INTEGER, 
    FOREIGN KEY (theater_id) REFERENCES theater_sessions(theater_session_id),
    FOREIGN KEY (ticket_id) REFERENCES theater_sessions(theater_session_id)

) ENGINE=INNODB;

CREATE TABLE tickets (
    ticket_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Description VARCHAR(30) NOT NULL,
    Price FLOAT NOT NULL,
    Booking DATETIME NOT NULL,
    customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES tickets(ticket_id)

) ENGINE=INNODB;

CREATE TABLE users (
    users_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Username VARCHAR(30) NOT NULL,
    Password VARCHAR(30) NOT NULL
) ENGINE=INNODB;

CREATE TABLE added_sessions (
    added_session_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Date DATETIME,
    users_id INTEGER,
    theater_session_id INTEGER,
    FOREIGN KEY (users_id) REFERENCES added_sessions(added_session_id),
    FOREIGN KEY (theater_session_id) REFERENCES added_sessions(added_session_id)
) ENGINE=INNODB;

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Username VARCHAR(30) NOT NULL,
    Password VARCHAR(30) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    FirstName VARCHAR(30) NOT NULL
) ENGINE=INNODB;



INSERT INTO theaters (Name, Address, PostalCode, City) VALUES 
('Le Théâtre 4D', '44, rue de Potier', '86254', 'Riou'),
('Cinéthèque', '5 rue mes couilles', '26020', 'Horaou'),
('Cinemanimal', '6, boulevard de Grondin', '02047', 'Dufourdan'),
('Mon Siège à Rêves', '98, boulevard Regnier', '13125', 'Marin-la-Forêt'),
('Le Coin Hollywood', '36, boulevard de Lebreton', '07247', 'Noel-sur-Gonzalez'),
('Il était une fois', '58, avenue de Fleury', '40662', 'Bruneau'),
('Projector', '17, chemin Chauveau', '42503' , 'Guillou-sur-Gilles'),
('Au Septième', '14, rue de Roche', '16878', 'David-sur-Menard'),
('Spectackl', '13, impasse de Aubry', '22013', 'Dubois');



INSERT INTO theater_sessions (FilmTitle, Session_Schedule, FilmGenre, Remaining_Seats) VALUES
('Guyver, The', '15:00', 'Action|Comedy|Sci-Fi', 16),
('Magnificent Yankee, The', '9:30', 'Drama', 22),
('Fallen Idol, The', '20:30', 'Drama|Mystery|Thriller', 2),
('The Key', '15:30', 'Drama', 33),
('The Real Glory', '14:00', 'War', 24),
('The Auction', '12:58', 'Drama', 14),
('Late Great Planet Earth, The', '10:50', 'Documentary|Drama', 37),
('Chicken, the Fish and the King Crab, The (El pollo, el pez y el cangrejo real)', '12:40', 'Documentary', 28),
('She Monkeys', '20:50', 'Drama', 46),
('Vivre sa vie: Film en douze tableaux (My Life to Live)', '19:00', 'Drama', 8),
('Five Graves to Cairo', '19:40', 'Thriller|War', 43),
('Divided We Fall (Musíme si pomáhat)', '13:00', 'Comedy|Drama', 39),
('Late Great Planet Earth, The', '12:00', 'Documentary|Drama', 40),
('Quiet City', '22:00', 'Drama', 24),
('Light Is Calling', '10:40', '(no genres listed)', 28),
('Thanksgiving Family Reunion (National Lampoon''s Holiday Reunion)', '11:30', 'Comedy', 34),
('Tears of April (Käsky)', '10:00', 'Drama|Romance|War', 33),
('Lady in Red, The', '21:00', 'Action', 1),
('Railroaded!', '15:30', 'Film-Noir', 24),
('Wuthering Heights', '16:00', 'Drama|Romance', 24),
('Indestructible Man', '17:00', 'Crime|Horror|Sci-Fi', 33),
('Germany Year Zero (Germania anno zero) (Deutschland im Jahre Null)', '19:00', 'Drama|War', 14),
('OKA!', '14:00', 'Drama', 35),
('After Earth', '17:40', 'Action|Adventure|Sci-Fi|IMAX', 4),
('Tonight and Every Night', '12:40', 'Musical', 5);

INSERT INTO customers (FirstName, LastName, Email, Username, Password) VALUES
('Zorine', 'Hallett', 'zhallett0@jimdo.com', 'zhallett0', 'GemeRjR5'),
('Salem', 'Winkett', 'swinkett1@themeforest.net', 'swinkett1', '7JhQpz8ruDsa'),
('Odella', 'Noyes', 'onoyes2@woothemes.com', 'onoyes2', 'Bjt9LQ'),
('Hunt', 'Erwin', 'herwin3@senate.gov', 'herwin3', 'xMEcUnn');
