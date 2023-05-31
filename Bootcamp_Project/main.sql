-- Restaurant 5 tables
-- 3-5 queries
-- 1 Subquery
-- 1 WITH clause
-- 1 Aggregate Function

.open Jirawan_restaurant.db

DROP TABLE Menus_dim;
DROP TABLE Customers_dim;
DROP TABLE Orders_dim;
DROP TABLE Invoices_dim;
DROP TABLE Employees_dim;
  
--table 1
CREATE TABLE Menus_dim (
  Menu_id int unique,
  Menu_name text,
  Menu_type text,
  Price real
  );

--table 2
CREATE TABLE Customers_dim (
  Customer_id int unique,
  Firstname text,
  Lastname text,
  Sex text,
  Country text,
  Email text,
  Member_class text,
  Order_id int,
  Invoice_id int
);

--table 3
CREATE TABLE Orders_dim (
  OrderLine_ID int unique,
  Order_id int,
  Menu_id int,
  Unit_price real,
  Quantity int
);

--table 4
CREATE TABLE Invoices_dim (
  Invoice_id int unique,
  Customer_id int,
  Total real,
  Order_id int,
  Employee_id int,
  Payment text
);

--table 5
CREATE TABLE Employees_dim (
  Employee_id int unique,
  Firstname text,
  Lastname text,
  Sex text,
  Country text,
  Email text,
  Phone int
);

INSERT INTO Menus_dim VALUES
  (1, 'Breakfast Sandwishes', 'Sandwishes', 9.5 ),
  (2,	'Croissant Breakfast Sandwishes',	'Sandwishes',	11),
  (3,	'Avocado & Egg Sandwishes',	'Sandwishes',	12.25),
  (4,	'Bread & Butter',	'Sandwishes',	6),
  (5,	'Lobster Roll',	'Sandwishes', 17),
  (6,	'Tuna Roll',	'Sandwishes', 12.25),
  (7,	'Grilled Cheese',	'Sandwishes', 8),
  (8,	'Italy Pasta Salad', 'Salad', 10.25), 
  (9,	'Chicken Salad', 'Salad',	13.5),
  (10, 'Grilled Shrimp Salad',	'Salad', 14.85),
  (11,	'Caesar Salad', 'Salad',	11.25),
  (12,	'Avocado & Tomato Salad',	'Salad', 12.5),
  (13,	'Cole Slaw', 'Salad', 11.75),
  (14,	'Shrimp Scampi', 'Main dishes', 25),
  (15,	'Lobster Scampi', 'Main dishes', 35),
  (16,	'Clam Chowder', 'Main dishes', 13.75),
  (17,	'Lobster Stew', 'Main dishes', 30),
  (18,	'Raw Oysters', 'Main dishes', 30),
  (19,	'Crab Stuffed Mushroom',	'Main dishes', 22.5),
  (20,	'Raw Scallop', 'Main dishes',	18),
  (21,	'Iced Latte',	'Beverage',	4.25),
  (22,	'Iced Cappuccino', 'Beverage',	4.25),
  (23,	'Iced Americano',	'Beverage',	4.25),
  (24,	'Iced Matcha Latte', 'Beverage',	4.25),
  (25,	'Iced Tea',	'Beverage',	3.25),
  (26,	'Orange Juice',	'Beverage',	4),
  (27,	'Coke',	'Beverage',	2.5),
  (28,	'Lemonade', 'Beverage', 4),
  (29,	'Bud Light',	'Beverage',	7.5),
  (30,	'Budweiser',	'Beverage',	7.5);

INSERT INTO Customers_dim VALUES
  (1, 'Tyler', 	'Jones', 'Male', 'USA',	'Tyler.J@gmail.com',	'Platinium',	3,	2347),
  (2,	'Miguel',	'Robinson',	'Male',	'USA',	'Miguel.R@gmail.com',	'Platinium',	6,	2350),
  (3,	'Robert',	'Smith',	'Male',	'England',	'Robert.S@gmail.com',	NULL,	9,	2353),
  (4,	'William',	'Carter',	'Male',	'USA',	'William.C@gmail.com',	'Silver',	12,	2356),
  (5,	'Matthew',	'Collins',	'Male',	'USA',	'Matthew.C@gmail.com',	'Platinium',	15,	2359),
  (6,	'Austin',	'Brown',	'Male',	'England',	'Austin.B@gmail.com',	'Gold',	18,	2362),
  (7,	'Andrew',	'Peterson',	'Male',	'Germany',	'Andrew.P@gmail.com',	'Silver',	1,	2345),
  (8,	'Patrick',	'Walker',	'Male',	'USA',	'Patrick.W@gmail.com',	'Gold',	4,	2348),
  (9,	'Timothy',	'Lewis',	'Male',	'France',	'Timothy.L@gmail.com',	'Gold',	7,	2351),
  (10,	'Jeffrey',	'Miller',	'Male',	'Spain',	'Jeffrey.M@gmail.com', NULL,	10,	2354),
  (11,	'Patricia',	'Martinez',	'Female',	'USA',	'Patricia.M@gmail.com',	'Silver',	13,	2357),
  (12,	'Jessica',	'Campbell',	'Female',	'France',	'Jessica.C@gmail.com',	'Platinium',	16,	2360),
  (13,	'Betty',	'Nelson',	'Female',	'Spain',	'Betty.N@gmail.com',	'Gold',	19,	2363),
  (14,	'Melissa',	'Jones',	'Female',	'USA',	'Melissa.J@gmail.com',	'Gold',	2,	2346),
  (15,	'Laura',	'Mitchell',	'Female',	'Spain',	'Laura.M@gmail.com',	'Gold',	5,	2349),
  (16,	'Emma',	'Scott',	'Female',	'Scotland',	'Emma.S@gmail.com',	'Platinium',	8,	2352),
  (17,	'Julie',	'Davis',	'Female',	'USA',	'Julie.D@gmail.com',	'Silver',	11,	2355),
  (18,	'Olivia',	'Baker',	'Female',	'England',	'Olivia.B@gmail.com',	NULL,	14,	2358),
  (19,	'Madison',	'Taylor',	'Female',	'USA',	'Madison.T@gmail.com',	'Gold',	20,	2364),
  (20,	'Judy',	'Howard',	'Female',	'Germany',	'Judy.H@gmail.com',	NULL,	17,	2361);

INSERT INTO Orders_dim VALUES
  (1,	1,	7,	8,	1),
  (2,	1,	9,	13.5,	1),
  (3,	1,	23,	4.25,	1),
  (4,	2,	1,	9.5,	1),
  (5,	2,	25,	3.25,	1),
  (6,	3,	12,	12.5,	1),
  (7,	3,	21,	4.25,	1),
  (8,	4,	24,	4.25,	2),
  (9,	4,	23,	4.25,	1),
  (10,	5,	16,	13.75,	1),
  (11,	5,	17,	30,	1),
  (12,	5,	18,	30,	1),
  (13,	5,	19,	22.5,	1),
  (14,	5,	29,	7.5,	2),
  (15,	5,	30,	7.5,	2),
  (16,	6,	23,	4.25,	1),
  (17,	7,	4,	6,	1),
  (18,	7,	3,	12.25,	1),
  (19,	8,	1,	9.5,	1),
  (20,	8,	2,	11,	1),
  (21,	8,	8,	10.25,	1),
  (22,	8,	26,	4,	1),
  (23,	8,	28,	4,	1),
  (24,	9,	16,	13.75,	1),
  (25,	9,	17,	30,	1),
  (26,	9,	19,	22.5,	1),
  (27,	9,	27,	2.5,	2),
  (28,	10,	18,	30,	1),
  (29,	10,	7,	8,	1),
  (30,	10,	10,	14.85,	1),
  (31,	10,	30,	7.5,	2),
  (32,	11,	21,	4.5,	2),
  (33,	11,	22,	4.5,	1),
  (34,	11,	24,	4.5,	2),
  (35,	11,	23,	4.5,	1),
  (36,	12,	5,	17,	1),
  (37,	12,	6,	12.25,	1),
  (38,	13,	3,	12.25,	1),
  (39,	13,	10,	14.85,	1),
  (40,	13,	12,	12.5,	1),
  (41,	13,	19,	22.5,	1),
  (42,	13,	24,	4.25,	1),
  (43,	14,	5,	17,	1),
  (44,	14,	27,	2.5,	1),
  (45,	15,	4,	6,	1),
  (46,	15,	8,	10.25,	1),
  (47,	15,	11,	11.25,	1),
  (48,	15,	23,	4.25,	1),
  (49,	16,	12,	12.5,	1),
  (50,	16,	14,	25,	1),
  (51,	16,	15,	35,	1),
  (52,	16,	9,	13.5,	1),
  (53,	16,	25,	3.25,	2),
  (54,	17,	2,	11,	1),
  (55,	17,	3,	12.25, 1),
  (56,	17,	4,	6,	2),
  (57,	18,	15,	35,	1),
  (58,	18,	17,	30,	1),
  (59,	18,	18,	30,	1),
  (60,	18,	30,	7.5,	3),
  (61,	19,	6,	12.25,	2),
  (62,	19,	11,	11.25,	1),
  (63,	20,	22,	4.25,	1),
  (64,	20,	24,	4.25,	1),
  (65,	20,	23,	4.25,	1);

INSERT INTO Invoices_dim VALUES
  (2345,	7,	25.75,	1,	2, 'Cash'),
  (2346,	14,	12.75,	2,	6,	'Credit Card'),
  (2347,	1,	16.75,	3,	4,	'E-Wallet'),
  (2348,	8,	12.75,	4,	8,	'Credit Card'),
  (2349,	15,	126.25,	5,	9,	'E-Wallet'),
  (2350,	2,	4.25,	6,	1,	'E-Wallet'),
  (2351,	9,	18.25,	7,	2,	'Cash'),
  (2352,	16,	38.75,	8,	3,	'E-Wallet'),
  (2353,	3,	71.25,	9,	4,	'Credit Card'),
  (2354,	10,	67.85,	10,	6,	'Credit Card'),
  (2355,	17,	27,	11,	5,	'E-Wallet'),
  (2356,	4,	29.25,	12,	7,	'Cash'),
  (2357,	11,	66.35,	13,	7,	'E-Wallet'),
  (2358,	18,	19.5,	14,	9,	'E-Wallet'),
  (2359,	5,	31.75,	15,	9,	'E-Wallet'),
  (2360,	12,	92.5,	16,	1,	'Cash'),
  (2361,	20,	35.25,	17,	1,	'E-Wallet'),
  (2362,	6,	117.5,	18,	1,	'E-Wallet'),
  (2363,	13,	35.75,	19,	9, 'Cash'),
  (2364,	19,	12.75,	20,	7,	'E-Wallet');

INSERT INTO Employees_dim VALUES
  (1,	'Elizabeth',	'Johnson',	'Female',	'USA',	'Elizabeth.J@gmail.com', 2072341097),
  (2,	'Henry',	'Jones',	'Male',	'USA',	'Henry.J@gmail.com',	2072341098),
  (3,	'Luna',	'White',	'Female',	'USA',	'Luna.W@gmail.com',	2072341099),
  (4,	'Nicholas',	'Allen',	'Male',	'USA',	'Nicholas.A@gmail.com',	2072341100),
  (5,	'Anna',	'Mitchell',	'Female',	'USA',	'Anna.M@gmail.com',	2072341101),
  (6,	'Logan',	'Morris',	'Male',	'USA',	'Logan.M@gmail.com',	2072341102),
  (7,	'Claire',	'Watson',	'Female',	'USA',	'Claire.W@gmail.com',	2072341103),
  (8,	'Emily',	'Murphy',	'Female',	'USA',	'Emily.M@gmail.com',	2072341104),
  (9,	'Lucas',	'Gray',	'Male', 'USA',	'Lucas.G@gmail.com',	2072341105);

.mode box
.header on

.print '5 Tables of The Restaurant'
.print ' ' 
.print 'Menus_dim'
SELECT * FROM Menus_dim;
.print 'Customers_dim'
SELECT * FROM Customers_dim;
.print 'Orders_dim'
SELECT * FROM Orders_dim;
.print 'Invoices_dim'
SELECT * FROM Invoices_dim;
.print 'Employees_dim'
SELECT * FROM Employees_dim;

.print' '
.print 'Query 1 Customers from USA and have the Platinium and Gold Member class' 
SELECT 
	customer_id,
	firstname,
    lastname,
    member_class
FROM Customers_dim
WHERE country = 'USA' and member_class IN ('Platinium', 'Gold');

.print 'Query 2 Create a new segment with CASE WHEN'
SELECT 
	customer_id,
    firstname,
    lastname,
	member_class,
    CASE 
    	WHEN member_class is NOT NULL THEN 'Member'
        ELSE 'Normal'
    END AS Segment
FROM Customers_dim
ORDER BY Segment;

.print ' Query 3 What countries are the customers from?'
SELECT DISTINCT country, COUNT(country) 
FROM Customers_dim
GROUP by country;

.print ' Query 4 Total income for each Main dishes menu'
SELECT  
		M.menu_name,
        M.menu_type,        
        O.unit_price,
        COUNT(quantity) AS Total_quantity,
        COUNT(quantity) * O.unit_price AS Total_Price
FROM Orders_dim AS O
LEFT JOIN Invoices_dim AS I 
ON O.order_id = I.order_id
LEFT JOIN Menus_dim AS M
ON O.menu_id = M.Menu_id
GROUP BY M.menu_name
HAVING Menu_type = 'Main dishes'
ORDER BY Total_price DESC;

.print 'Query 5 Count the number of orders of each employees'
SELECT 
	E.employee_id, 
    E.firstname,
    E.lastname,
    COUNT(I.Order_id) AS Count_Order
from Invoices_dim AS I
LEFT JOIN Employees_dim AS E
ON I.Employee_id = E.employee_id
GROUP BY E.employee_id;

.print 'Aggregate Function -- What is the Top 5 menus?'
SELECT  
		M.menu_id,
    M.menu_name,
    COUNT(*) AS 'top5_menu'
FROM Menus_dim M
JOIN Orders_dim O
ON M.menu_id = O.menu_id
GROUP BY menu_name
ORDER BY top5_menu DESC
LIMIT 5;

.print 'Subquery -- Who has an order of more than 100 dollars?'
SELECT 
	C.customer_id,
  C.firstname,
  C.lastname,
  I.total
FROM Invoices_dim AS I
INNER JOIN Customers_dim As C
ON I.Invoice_id = C.invoice_id
WHERE I.total = (SELECT I.total
                 FROM Invoices_dim
                 WHERE I.total > 100);

.print 'WITH Clause -- Total orders of customers who has Silver member class'
WITH customer_orders AS (
    SELECT customer_id, SUM(total) AS total_orders
    FROM Invoices_dim
    GROUP BY customer_id
)
SELECT C.firstname, 
	C.lastname,
	customer_orders.total_orders
FROM Customers_dim AS C
INNER JOIN customer_orders ON C.customer_id = customer_orders.customer_id
WHERE C.member_class = 'Silver';