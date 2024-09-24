USE bestbuy;
/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT p.Name AS ProductName, c.Name AS CategoryName
FROM Products p
JOIN Categories c
ON p.CategoryID = c.CategoryID;

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name AS ProductName, p.Price, r.Rating
FROM Products p
JOIN Reviews r
ON p.ProductID = r.ProductID
WHERE r.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, SUM(s.Quantity) AS TotalQuantitySold
FROM Employees e
JOIN Sales s
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY TotalQuantitySold DESC
LIMIT 1;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS DepartmentName, c.Name AS CategoryName
FROM Categories c
JOIN Departments d
ON c.DepartmentID = d.DepartmentID
WHERE c.Name IN ('Appliances', 'Games');

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name AS ProductName, SUM(s.Quantity) AS TotalQuantitySold, SUM(s.Quantity * s.PricePerUnit) AS TotalPriceSold
FROM Products p
JOIN Sales s
ON p.ProductID = s.ProductID
WHERE p.Name = 'Eagles: Hotel California'
GROUP BY p.Name;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name AS ProductName, r.Reviewer, r.Rating, r.Comment
FROM Products p
JOIN Reviews r
ON p.ProductID = r.ProductID
WHERE p.Name = 'Visio TV'
ORDER BY r.Rating ASC
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name AS ProductName, SUM(s.Quantity) AS TotalQuantitySold
FROM Employees e
JOIN Sales s
ON e.EmployeeID = s.EmployeeID
JOIN Products p
ON s.ProductID = p.ProductID
GROUP BY e.EmployeeID, e.FirstName, e.LastName, p.Name
ORDER BY e.EmployeeID, p.Name;