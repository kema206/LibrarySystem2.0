DROP TABLE books;
DROP TABLE users;

CREATE TABLE books (
	isbn VARCHAR(13),
	bookName VARCHAR(30),
	author VARCHAR(50),
	yearPub INT,
	genre VARCHAR(50),
    qty INT,
    originalAmt INT,
	);

CREATE TABLE users (
	uid INT IDENTITY,
	uname VARCHAR(30),
	password VARCHAR(20),
	lvl INT,
    book1 VARCHAR(50),
    book2 VARCHAR(50),
    date1 DATE,
    date2 DATE,
	PRIMARY KEY (uid) 
	);

INSERT INTO books values ('9781649360298','Animal Stories','Peter Hoey',2022,'fiction',3,5),
('9781684067886','Cosmoknights','Hannah Templer',2019,'romance',2,3),
('9781684069897','The Delicacy','James Albon',2021,'bildungsroman',4,5),
('9781603091190','Essex County','Jeff Lemire',2009,'fiction',4,4),
('9780451499103','Dosa Kitchen','Nash Patel',1850,'bildungsroman',4,4),
('9780525518365','Dozens of Doughnuts','Carrie Finison',2020,'fiction',6,6),
('9780814779965','American Cool','Peter Stearns',1994,'epic',3,4),
('9781338048179','Rick','Alex Gino',2020,'tragedy',2,2),
('9780826496744','After Finitude','Quentin Meillassoux',2008,'philosophy',2,3),
('9788193540190','The Little Prince','Antoine de Saint-Exupery',2017,'romance',3,4),
('9780545103770','Save the White Whale!','Geronimo Stilton',2011,'romance',4,4);

DECLARE @uid int
INSERT INTO users (uname, password, lvl, book1, book2, date1, date2) VALUES ('catdog', 'catcat123', '1', 'Cosmoknights', NULL, '2022-10-03', NULL);
INSERT INTO users (uname, password, lvl, book1, book2, date1, date2) VALUES ('monstercute', 'cute1212', '1', 'The Delicacy', 'Animal Stories', '2022-11-04', '2022-11-04');
INSERT INTO users (uname, password, lvl, book1, book2, date1, date2) VALUES ('catslayer66', 'slaycat12', '1', NULL, NULL, NULL, NULL);
INSERT INTO users (uname, password, lvl, book1, book2, date1, date2) VALUES ('ubcostudent', 'goheat', '1', 'After Finitude', 'American Cool', '2022-11-02', '2022-11-15');
INSERT INTO users (uname, password, lvl, book1, book2, date1, date2) VALUES ('katyplaty', 'jibakutai', '0', 'The Little Prince', NULL, '2022-11-23', NULL);
INSERT INTO users (uname, password, lvl, book1, book2, date1, date2) VALUES ('taylorjeez', 'nienfu', '0', 'Animal Stories', NULL, '2022-10-01', NULL);
