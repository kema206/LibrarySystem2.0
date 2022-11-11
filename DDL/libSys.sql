CREATE DATABASE IF NOT EXISTS librarySystem;

USE librarySystem;

CREATE TABLE books (
	isbn integer,
	bookName varchar(30),
	author varchar(50),
	yearPub int,
	genre varchar(50),
    qty int,
    borrowed char(1),
    originalAmt int,
	primary key (isbn) 
	);

CREATE TABLE users (
	uid integer,
	uname varchar(30),
	pwd varchar(20),
	lvl integer,
    book1 varchar(50),
    book2 varchar(50),
    date1 date,
    date2 date,
	primary key (uid) 
	);

INSERT INTO books values (11111, 'The History of Tom Jones', 'Henry Fielding', 1749, 'fiction', 3, 'T', 5),
(11112,'Pride and Prejudice','Jane Austen',1813,'romance',2,'T',3),
(11113,'The Red and the Black','Stendhal',1830,'bildungsroman',4,'T',5),
(11114,'Le Pere Goriot','Honore de Balzac',1835,'fiction',4,'T',4),
(11115,'David Copperfield','Charles Dickens',1850,'bildungsroman',4,'T',4),
(11116,'Madame Bovary','Gustave Flaubert',1856,'fiction',6,'T',6),
(11117,'Moby-Dick','Herman Malville',1851,'epic',3,'T',4),
(11118,'Wuthering Heights','Emily Bronte',1847,'tragedy',2,'F',2),
(11119,'The Brothers Karamazov','Dostoevsky',1879,'philosophy',2,'T',3),
(11120,'War and Peace','Tolstoy',1869,'romance',3,'T',4),
(11121,'Alice','Matt',1500,'romance',4,'F',4);

INSERT INTO users VALUES
(112233, 'catdog', 'catcat123', '1', 'Pride and Prejudice', NULL, '2022-10-03', NULL),
(112234, 'monstercute', 'cute1212', '1', 'The Red and the Blac', 'The History of Tom J', '2022-11-04', '2022-11-04'),
(112236, 'catslayer66', 'slaycat12', '1', NULL, NULL, NULL, NULL),
(112237, 'ubcostudent', 'goheat', '1', 'The Brothers Karamaz', 'Moby-Dick', '2022-11-02', '2022-11-15'),
(112240, 'katyplaty', 'jibakutai', '0', 'War and Peace', NULL, '2022-11-23', NULL),
(112241, 'taylorjeez', 'nienfu', '0', 'The History of Tom J', NULL, '2022-10-01', NULL);
