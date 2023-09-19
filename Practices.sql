-- SELECT 
SELECT CustomerName, City, Country FROM Customers;

-- WHERE
SELECT * FROM Customers
WHERE CustomerID = 1;

-- AND/OR/NOT
SELECT * FROM Customers
WHERE Country = 'Germany' AND (City = 'Berlin' OR City = 'Stuttgart');

SELECT * FROM Customers
WHERE NOT Country = 'Germany' AND NOT Country = 'USA';



--NULL
SELECT CustomerName, ContactName, Address
FROM Customers
WHERE Address IS NOT NULL;

SELECT CustomerName, ContactName, Address
FROM Customers
WHERE Address IS NULL;


--GROUP BY
SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
GROUP BY ShipperName;

--HAVING
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;

--ORDER BY
SELECT * FROM Customers
ORDER BY Country ASC, CustomerName DESC; --DESC/ASC

--INSERT/UPDATE/DELETE
insert into titles
(
   emp_no,
    title,
    from_date
)
values
(
     999903,
    'Senior Engineer',
    '1997-10-01'
);


UPDATE Customers
SET ContactName = 'Alfred Schmidt', City = 'Frankfurt'
WHERE CustomerID = 1;

DELETE FROM departments
WHERE
    dept_no = 'd010';

--LIMIT
SELECT * FROM Customers
LIMIT 3;


--Aggregate Functions
SELECT
    COUNT(DISTINCT dept_no)
FROM dept_emp;


SELECT 
  SUM(salary)
FROM salaries
WHERE from_date > '1997-01-01';


SELECT
    MAX(emp_no) --MIN/MAX
FROM employees;


SELECT
    ROUND(AVG(salary), 2)
FROM salaries
WHERE from_date > '1997-01-01';


SELECT
    IFNULL(dept_no, 'N/A') as dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM departments_dup
ORDER BY dept_no ASC;


--JOINS:INNER JOIN/LEFT JOIN/RIGHT JOIN/CROSS JOIN/Self Join
SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    e.hire_date
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no;

--UNION/UNION ALL
SELECT City FROM Customers
UNION  --(only distinct values)
SELECT City FROM Suppliers
ORDER BY City;


SELECT City FROM Customers
UNION ALL  --(duplicate values also)
SELECT City FROM Suppliers
ORDER BY City;

--INSERT SELECT: copies data from one table and inserts it into another table
INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers
WHERE Country='Germany';


--CASE: The CASE statement goes through conditions and returns a value when the first condition is met (like an if-then-else statement)
SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;


SELECT CustomerName, City, Country
FROM Customers
ORDER BY
(CASE
    WHEN City IS NULL THEN Country
    ELSE City
END);

--EXISTS:  used to test for the existence of any record in a subquery 
SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price = 22);

