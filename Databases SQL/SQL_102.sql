--- Filter Data I
SELECT * FROM customers
WHERE FirstName = 'Leonie';

SELECT * FROM customers
WHERE Lower (Country) = 'united kingdom';

-- AND / OR
SELECT * FROM customers
WHERE Country = 'USA' AND state = 'CA';

SELECT * FROM customers
WHERE Country = 'USA' OR Country = 'Canada';

-- NOT
SELECT * FROM customers
WHERE NOT ( Country = 'USA' OR Country = 'Canada');


--- Filter Data II
SELECT * FROM customers
WHERE Country = 'Brazil' OR Country = 'Germany' OR Country = 'Norway';

-- IN Operator 
SELECT * FROM customers
WHERE Country IN ('Brazil', 'Germany', 'Norway');

-- NOT IN
SELECT * FROM customers
WHERE Country NOT  IN ('Brazil', 'Germany', 'Norway');

-- BETWEEN___AND 
SELECT * FROM customers
WHERE CustomerId BETWEEN 5 AND 10;

[ SELECT * FROM customers
WHERE CustomerId >= 5 AND CustomerId <=10;]

-- Date 
SELECT InvoiceDate FROM invoices
WHERE  InvoiceDate BETWEEN '2009-01-01 00:00:00' AND '2009-01-19  20:00:00';

-- NULL
SELECT * FROM customers
WHERE Company IS NULL;

-- NOT NULL
SELECT * FROM customers
WHERE Company IS  NOT NULL;

--- Filter Data III
-- pattern matching

-- LIKE 
SELECT FirstName, LastName, Country, Email FROM customers
WHERE Email LIKE '%gmail.com' AND Country = 'USA';

-- NOT LIKE 
SELECT FirstName, LastName, Country, Email FROM customers
WHERE Email NOT LIKE '%gmail.com' AND Country = 'USA';

-- LIKE '%_%' 
SELECT FirstName, LastName, Country, Email, Phone FROM customers
WHERE Phone LIKE '%99%';

-- Single Charactet MAtching
SELECT FirstName, LastName, Country, Email, Phone FROM customers
WHERE FirstName LIKE 'J_hn';

SELECT FirstName, LastName, Country, Email, Phone FROM customers
WHERE FirstName LIKE 'Leon__';(Leonie)

-- NULL / missing values --
-- COALESCE use for replacing NULL --
SELECT 
	Company ,
	COALESCE (Company, 'End customer') AS 'Company Clean'
FROM customers;

SELECT 
	Company ,
	COALESCE (Company, 'End customer') AS 'Company Clean', 
	CASE WHEN Company IS NULL THEN 'End Customer'
		ELSE 'Corporate'
	END AS 'Company Clean 2'
FROM customers;

--  Join Data with WHERE clause
SELECT * FROM artists, albums
WHERE artists.ArtistId = albums.ArtistId;
-- OR (Get the same result)--
SELECT * FROM artists 
JOIN albums
ON artists.ArtistId = albums.ArtistId;

-- We want ArtistID, ArtistName from Artists and Title from Album
SELECT 
	artists.ArtistId,
	artists.name AS Artist_name,
	Albums.Title AS Album_name
FROM artists, albums
WHERE artists.ArtistId = albums.ArtistId;

-- We want to know info of artist No.100 
SELECT 
	artists.ArtistId,
	artists.name AS Artist_name,
	Albums.Title AS Album_name
FROM artists, albums
WHERE artists.ArtistId = albums.ArtistId
	AND artists.ArtistId = 100;

-- We want to know info of artist No.8, 100, 120 
SELECT 
	artists.ArtistId,
	artists.name AS Artist_name,
	Albums.Title AS Album_name
FROM artists, albums
WHERE artists.ArtistId = albums.ArtistId
	AND artists.ArtistId IN (8, 100, 120);


-- JOIN 3 TABLE 
/*1.Artists.ArtistID (PK) JOIN Albums.ArtistID (FK)
  2.Albums.AlbumID (PK) JOIN Tracks.AlbumID (FK)
  3. Want more Name from Tracks*/

SELECT 
	artists.ArtistId,
	artists.name AS Artist_name,
	Albums.Title AS Album_name,
	tracks.name AS Song_name
FROM artists, albums, tracks
WHERE artists.ArtistId = albums.ArtistId -- PK = FK (1)
	AND  Albums.AlbumId = tracks.AlbumId -- PK = FK (2)
	AND artists.ArtistId IN (8, 100, 120);


-- Aggregate Functions
SELECT 
	AVG(Milliseconds) avg_mill,
	SUM (Milliseconds) sum_mill,
	MIN (Milliseconds) min_mill,
	MAX (Milliseconds) max_mill,
	COUNT (Milliseconds) count_mill
FROM tracks;

-- Count Distinct (Unique value)
-- DISTINCT
SELECT DISTINCT Country FROM customers;

-- Count Distinct
SELECT COUNT (DISTINCT Country)  FROM customers;
SELECT COUNT (DISTINCT Country), COUNT(*)  FROM customers;

-- Group By
SELECT country, COUNT(*) AS count_country 
FROM customers
GROUP BY Country; -- 1

-- JOIN Genres and Tracks Then count Genres.Name
SELECT genres.name, COUNT(*) AS count_song
FROM genres, tracks
WHERE genres.GenreId = tracks.GenreId
GROUP BY genres.name; -- 2

-- Having
-- Filter Group
SELECT genres.name, COUNT(*) AS count_song
FROM genres, tracks
WHERE genres.GenreId = tracks.GenreId
GROUP BY genres.name
HAVING COUNT(*) >= 100; -- 1

SELECT genres.name, COUNT(*) AS count_song
FROM genres, tracks
WHERE genres.GenreId = tracks.GenreId AND Genres.name <> 'Rock'
GROUP BY genres.name
HAVING COUNT(*) >= 100; -- 2

-- Order By + Limit
SELECT genres.name, COUNT(*) 
FROM genres, tracks
WHERE genres.GenreId = tracks.GenreId
GROUP BY genres.GenreId
ORDER BY COUNT(*) DESC LIMIT 5;›

-- JOIN 
SELECT genres.name, COUNT(*) 
FROM genres
JOIN tracks
		ON genres.GenreId = tracks.GenreId
GROUP BY genres.GenreId
ORDER BY COUNT(*) DESC LIMIT 5;
