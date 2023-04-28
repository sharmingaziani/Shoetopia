/* Selects 10 customers*/
SELECT name, gender, address, phone
FROM customers
LIMIT 10;

/* Get first 10 orders with customer information*/
SELECT o.orderid, o.date, c.name, c.address, c.phone
FROM (SELECT * FROM orders LIMIT 10) AS o
JOIN customers AS c ON o.fk_ckey = c.CKey;

/* Gets average price of all shoe types*/
SELECT s.Type, AVG(s.Price) AS AveragePrice
FROM shoe AS s
GROUP BY s.Type;

/* Given the Customer key, we can get all customer keys and see which customers have placed orders
Using left join*/
SELECT c.ckey, c.name, c.gender, o.orderid, o.date
FROM (SELECT * FROM customers LIMIT 10) AS c
LEFT OUTER JOIN orders AS o ON c.ckey = o.fk_ckey;

/* Gets employees and factories that share a brand*/
(SELECT e.employeeID, e.name, e.FK_BKey
FROM employees AS e
WHERE e.fk_bkey IN (SELECT f.fk_bkey FROM factories AS f)
limit 5)
UNION
(SELECT f.FactoryID, f.Locations, f.FK_BKey
FROM factories AS f
WHERE f.fk_bkey IN (SELECT e.fk_bkey FROM employees AS e)
limit 5);



