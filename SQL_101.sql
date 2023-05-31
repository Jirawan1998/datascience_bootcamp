-- Basic select
SELECT 
	FirstName, 
	LastName, 
	Country
 FROM customers
 LIMIT 10;

-- Create New Column
SELECT 
	FirstName, 
	LastName,
	FirstName || ' ' || LastName AS Fullname,
	LOWER(FirstName) || '@company.com' AS Email
 FROM customers;


-- SubString
SELECT 
	firstname, lastname,
    firstname || ' ' || lastname AS Fullname, -- camel case 
    firstname || SUBSTR(lastname, 1, 1) || '@fullstack.com' AS Email
from customers

  
SELECT 
	name,
	Milliseconds/ 60000 AS Minute, 
	Bytes / (1024*1024) AS mb
FROM tracks;

-- Round function
SELECT 
	name,
	ROUND (Milliseconds/ 60000.0, 2) AS Minute, 
	ROUND (Bytes / (1024*1024.0), 2) AS mb
FROM tracks;

-- CASE WHEN
SELECT 
	Company,
	CASE 
			WHEN Company IS NOT NULL THEN 'Corporate'
			ELSE ' End Customer'
	END AS segment
FROM customers;

-- Working with DateTime in SQLite
SELECT 
	InvoiceDate,
	STRFTIME('%Y' , invoicedate) AS year,
	STRFTIME('%m', invoicedate) AS month,
	STRFTIME('%d', invoicedate) AS day,
	STRFTIME('%Y-%m', invoicedate) AS year_month
FROM invoices
WHERE year = '2010';

-- CAST Function
SELECT 
	InvoiceDate,
	CAST(STRFTIME('%Y' , invoicedate) AS INT) AS year,
	CAST(STRFTIME('%m', invoicedate) AS INT) AS month,
	CAST(STRFTIME('%d', invoicedate) AS INT) AS day,
	STRFTIME('%Y-%m', invoicedate) AS year_month
FROM invoices
WHERE year = 2010;

-- Convert data type
SELECT 
	TYPEOF('100'), 
    TYPEOF(100),
    TYPEOF(100.00)

SELECT CAST(100 AS TEXT)
SELECT CAST('100' AS REAL) 
SELECT CAST('100' AS INT)

-- Review join syntax
SELECT 
	A.column,
	B.column
FROM tableA AS A
JOIN tableB AS B
	ON A.primary_key = B.foreign_key;

SELECT * FROM artists
JOIN albums
ON artists.ArtistId = albums.AlbumId;

SELECT * FROM artists
JOIN albums
ON artists.ArtistId = albums.ArtistId
WHERE artists.ArtistId = 50;

-- More JOIN Examples
SELECT 
	A.ArtistId,
	A.name,  
	B.Title,
	T.name,
	T.Composer
		FROM artists AS A
JOIN albums AS B
ON A.ArtistId = B.ArtistId
JOIN tracks AS T
ON T.AlbumId = B.AlbumId

WHERE A.name = 'Aerosmith';

-- RANDOM Function
SELECT name, RANDOM()
From tracks
Order By RANDOM()
LIMIT 10;