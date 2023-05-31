-- JOIN using WHERE clause
SELECT 
	A.ArtistId,
	A.name ArtistName,
	B.Title AlbumName
FROM artists A, albums B
WHERE A.ArtistId = B.ArtistId AND A.name LIKE 'C%';

-- Convert WHERE to INNER JOIN
SELECT 
	A.ArtistId,
	A.name ArtistName,
	B.Title AlbumName
FROM artists A INNER JOIN albums B
ON A.ArtistId = B.ArtistId  
WHERE A.name LIKE 'C%';

-- Join 3 Tables
SELECT 
	A.ArtistId,
	A.name ArtistName,
	B.Title AlbumName,
	C.name TrackName
FROM artists A 
INNER JOIN albums B ON A.ArtistId = B.ArtistId  
INNER JOIN tracks C ON B.AlbumId = C.AlbumId
WHERE A.name =  'Aerosmith';

SELECT 
	COUNT (*) Aerosmith_Song
FROM artists A 
INNER JOIN albums B ON A.ArtistId = B.ArtistId  
INNER JOIN tracks C ON B.AlbumId = C.AlbumId
WHERE A.name =  'Aerosmith';

-- INNER vs. LEFT JOIN
-- INNER JOIN
SELECT * FROM book_shop A
INNER JOIN favourite_book B ON A.id = B.id; 

-- LEFT JOIN
SELECT * FROM book_shop A
LEFT JOIN favourite_book B ON A.id = B.id;

-- CROSS JOIN
-- Create two tables: ranks and suits
-- Reference: https://www.sqlitetutorial.net/sqlite-cross-join/
CREATE TABLE ranks (
    rank TEXT NOT NULL
);

CREATE TABLE suits (
    suit TEXT NOT NULL
);

INSERT INTO ranks(rank) 
VALUES('2'),('3'),('4'),('5'),('6'),('7'),('8'),('9'),('10'),('J'),('Q'),('K'),('A');

INSERT INTO suits(suit) 
VALUES('Clubs'),('Diamonds'),('Hearts'),('Spades');

-- Cross join both tables to create a full card deck
SELECT * FROM ranks 
CROSS JOIN suits ORDER BY suit;

-- SELF JOIN
-- Create a new employee table
CREATE TABLE employee (
    id INT,
    name TEXT,
    level TEXT,
    manager_id INT 
);

INSERT INTO employee VALUES 
    (1, 'David', 'CEO', NULL),
    (2, 'John', 'SVP', 1),
    (3, 'Mary', 'VP', 2),
    (4, 'Adam', 'VP', 2),
    (5, 'Scott', 'Manager', 3),
    (6, 'Louise', 'Manager', 3),
    (7, 'Kevin', 'Manager', 4),
    (8, 'Takeshi', 'Manager', 4),
    (9, 'Joe', 'AM', 6),
    (10, 'Anna', 'AM', 7);


SELECT * FROM employee;

SELECT * FROM employee e1, employee e2
WHERE e1.manager_id = e2.id;


-- Intersect and Except
-- Create two tables
CREATE TABLE book_shop (
	id INT,
  name TEXT,
  release_year INT
);
  
CREATE TABLE favourite_book (
  id INT, 
  author TEXT,
  reviews REAL
);

INSERT INTO book_shop VALUES
  (1, 'Think Like A Freak', 2014),
  (2, 'Ultralearning', 2019),
  (3, 'Blue Ocean Strategy', 2015),
  (4, 'The Power of Habit', 2012),
  (5, 'Outliers', 2008);

INSERT INTO favourite_book VALUES
  (1, 'Steven D. Levitt, Stephen J. Dubner', 1904),
  (4, 'Charles Duhigg', 12007),
  (5, 'Malcolm Gladwell', 12063);

-- INTERCEPT 
SELECT id FROM book_shop
INTERSECT 
SELECT id FROM favourite_book; [ANS: Id = 1, 4, 5]

-- EXCEPT 
SELECT id FROM book_shop
EXCEPT
SELECT id FROM favourite_book; [ANS: Id = 2, 3]


-- UNION
-- Create a new book shop table
CREATE TABLE book_shop_new (
  	id INT,
  	name TEXT,
	 	release_year INT
  );

INSERT INTO book_shop_new VALUES
	(1, 'Think Like A Freak', 2014),
  (6, 'Business Data Science', 2020),
  (7, 'Subliminal', 2018),
  (8, 'Good Strategy Bad Strategy', 2015);

-- UNION BTW book shop table and boook shop new table 
SELECT * FROM book_shop
UNION
SELECT * FROM book_shop_new;

-- UNION ALL
SELECT * FROM book_shop
UNION ALL
SELECT * FROM book_shop_new;


-- Intro to Subqueries
-- Not Subqueries
SELECT * FROM tracks ORDER by milliseconds DESC LIMIT 1;

--Subqueries
SELECT * 
FROM tracks
WHERE milliseconds = (SELECT MAX(milliseconds) 
                      FROM tracks);

SELECT firstname, lastname, country FROM
(SELECT * 
FROM customers
WHERE country = 'USA');
