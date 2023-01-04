
/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

-- WHEN JOINING TABLES FIND A COLUMN THAT THEY HAVE IN COMMON. Check the tables to see which has the primary key & which has the foreign key

SELECT	p.Name as Product, c.Name as Category
FROM products p
INNER JOIN categories c 
ON c.CategoryID = p.CategoryID
WHERE c.Name = "Computers";

 -- SELECT products.Name, categories.Name
--  FROM products
--  INNER JOIN categories on categories.CategoryID = products.CategoryID
--  WHERE	categories.Name = "Computers";
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 
 SELECT p.Name as "Product Name", p.Price as "Product Price", r.Rating as "Review Rating"
 FROM products p 
 INNER JOIN reviews r 
 ON p.ProductID = r.ProductID
 WHERE r.Rating = 5;
 

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, e.Title, SUM(s.Quantity) as "Quantity" 
-- For select, we always refer to a column rather than a table
FROM employees e
-- in From, we refer to a table 
INNER JOIN sales s 
-- For our Join, we refer to a table
ON e.EmployeeID = s.EmployeeID
group by s.EmployeeID order by Quantity DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name, categories.Name
FROM departments 
INNER JOIN categories 
ON categories.DepartmentID = departments.DepartmentID
WHERE categories.Name = 'Appliances' OR categories.name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
 SELECT p.Name, SUM(s.Quantity) as 'Total Sold', SUM(s.Quantity * s.PricePerUNit) as 'Price Sold'
 FROM products as p
 INNER JOIN sales as s
 ON s.ProductID = p.ProductID
 WHERE p.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT p.Name, r.Reviewer, r.rating, r.Comment
FROM products as p
INNER JOIN reviews as r
ON r.ProductID = p.ProductID
WHERE p.ProductID = 857 and r.Rating =1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */