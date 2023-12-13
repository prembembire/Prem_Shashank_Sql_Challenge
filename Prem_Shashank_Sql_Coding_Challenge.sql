/*ECOMMERCE – SQL Coding Challenge 6*/
Create Database Ecommerce
Use Ecommerce

--SQL Tables:
--1. customers table:
Create Table Customers(
Customer_id Int Primary Key,
Name Varchar(255),
Email Varchar(255),
Password Varchar(255) Not Null
);



--2. products table:
Create Table Products(
Product_id int Primary Key,
Name Varchar(255),
Price Decimal(10,2),
Description Text,
StockQuantity float,
);

--3. cart table:
Create Table Cart(
Cart_Id Int Primary Key,
Customer_Id Int,
Product_Id Int,
Quantity Int,
Foreign Key (Customer_Id) References Customers(Customer_Id),
Foreign Key (Product_Id) References Products(Product_Id)
);




--4. orders table:
Create Table Orders(
Order_Id Int Primary Key,
Customer_Id Int,
Order_Date Date,
Total_Price Decimal(10,2),
Shipping_Address Varchar(255),
Foreign Key (Customer_Id) References Customers(Customer_Id)
);

--5. order_items table (to store order details):
Create Table Order_Items(
Order_Item_Id Int Primary Key,
Order_Id Int,
Product_Id Int,
Quantity Int,
Foreign Key (Order_Id) References Orders(Order_Id),
Foreign Key (Product_Id) References Products(Product_Id)
);

Select * from Customers;
Select * from Products;
Select * from Cart;
Select * from Orders;
Select * from Order_Items;


--Inserting Values to Tables
--Customers Table
Insert Into Customers(Customer_Id,Name,Email,Password)
Values
(1 ,'John Doe' ,'johndoe@example.com' ,'123 Main St, City'),
(2 ,'Jane Smith', 'janesmith@example.com', '456 Elm St, Town'),
(3 ,'Robert Johnson' ,'robert@example.com ','789 Oak St, Village'),
(4 ,'Sarah Brown', 'sarah@example.com', '101 Pine St, Suburb'),
(5 ,'David Lee', 'david@example.com', '234 Cedar St, District'),
(6 ,'Laura Hall', 'laura@example.com', '567 Birch St, County'),
(7 ,'Michael Davis', 'michael@example.com', '890 Maple St, State'),
(8 ,'Emma Wilson', 'emma@example.com', '321 Redwood St, Country'),
(9 ,'William Taylor', 'william@example.com','432 Spruce St, Province'),
(10 ,'Olivia Adams', 'olivia@example.com', '765 Fir St, Territory');

Select * from Customers

--Products Table
Insert Into Products(Product_Id,Name,Description,Price,StockQuantity)
Values
   (1, 'Laptop', 'High-performance laptop', 800.00, 10),
   (2, 'Smartphone', 'Latest smartphone', 600.00, 15),
   (3, 'Tablet', 'Portable tablet', 300.00, 20),
   (4, 'Headphones', 'Noise-canceling', 150.00, 30),
   (5, 'TV', '4K Smart TV', 900.00, 5),
   (6, 'Coffee Maker', 'Automatic coffee maker', 50.00, 25),
   (7, 'Refrigerator', 'Energy-efficient', 700.00, 10),
   (8, 'Microwave Oven', 'Countertop microwave', 80.00, 15),
   (9, 'Blender', 'High-speed blender', 70.00, 20),
   (10, 'Vacuum Cleaner', 'Bagless vacuum cleaner', 120.00, 10);

Select * from Products

--Carts Table
Insert Into Cart(Cart_Id,Customer_Id,Product_Id,Quantity)
Values
(1,1, 1, 2),
(2, 1 ,3, 1),
(3, 2, 2, 3),
(4 ,3 ,4 ,4),
(5 ,3, 5, 2),
(6 ,4, 6 ,1),
(7 ,5 ,1, 1),
(8 ,6 ,10, 2),
(9 ,6, 9 ,3),
(10 ,7 ,7 ,2);


Select * from Cart;


--Orders Table
INSERT INTO orders (Order_id, Customer_id, Order_date, Total_price)
VALUES
   (1, 1, '2023-01-05', 1200.00),
   (2, 2, '2023-02-10', 900.00),
   (3, 3, '2023-03-15', 300.00),
   (4, 4, '2023-04-20', 150.00),
   (5, 5, '2023-05-25', 1800.00),
   (6, 6, '2023-06-30', 400.00),
   (7, 7, '2023-07-05', 700.00),
   (8, 8, '2023-08-10', 160.00),
   (9, 9, '2023-09-15', 140.00),
   (10, 10, '2023-10-20', 1400.00);

Select * from Orders;

--Order_Items Table

Alter table order_items
Add item_amount int;

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, item_amount)
VALUES
   (1, 1, 1, 2, 1600.00),
   (2, 1, 3, 1, 300.00),
   (3, 2, 2, 3, 1800.00),
   (4, 3, 5, 2, 1800.00),
   (5, 4, 4, 4, 600.00),
   (6, 4, 6, 1, 50.00),
   (7, 5, 1, 1, 800.00),
   (8, 5, 2, 2, 1200.00),
   (9, 6, 10, 2, 240.00),
   (10, 6, 9, 3, 210.00);

Select * from Order_Items;





Select * from Customers;
Select * from Products;
Select * from Cart;
Select * from Orders;
Select * from Order_Items;

--1. Update refrigerator product price to 800.
Update Products Set Price=800
Where(Name='Refrigerator')


--2. Remove all cart items for a specific customer.
Delete from Cart
Where Customer_Id=5;

--3. Retrieve Products Priced Below $100.
Select * from Products
Where(Price<100);


--4. Find Products with Stock Quantity Greater Than 5.
Select * from Products
Where(StockQuantity>5);



--5. Retrieve Orders with Total Amount Between $500 and $1000.
Select * from Orders
Where Total_Price Between 500 And 1000;



--6. Find Products which name end with letter ‘r’.
Select * from Products
Where Name Like '%r';

--7. Retrieve Cart Items for Customer 5.
Select * from Cart
Where(Customer_Id=5);--It returns an empty table because we have deleted the record with customer_Id=5 in 2nd query.

--8. Find Customers Who Placed Orders in 2023.
Select * from Customers C
Inner Join Orders O on C.Customer_Id=O.Customer_Id
Where(Year(Order_Date)='2023');


--9. Determine the Minimum Stock Quantity for Each Product Category.
Select Name,Min(StockQuantity) As Minimum_Stock_Quantity from Products
Group By Name;



--10. Calculate the Total Amount Spent by Each Customer.
SELECT c.customer_id, c.name, SUM(o.total_price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;


--11. Find the Average Order Amount for Each Customer.
SELECT customer_id, AVG(total_price) AS avg_order_amount
FROM orders
GROUP BY customer_id;



--12. Count the Number of Orders Placed by Each Customer.
SELECT customer_id, COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id;



--13. Find the Maximum Order Amount for Each Customer.
SELECT customer_id, MAX(Total_price) AS Max_Amount
FROM orders
GROUP BY customer_id;



--14. Get Customers Who Placed Orders Totaling Over $1000.

SELECT * FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.total_price > 1000.00;

--15. Subquery to Find Products Not in the Cart.

select Product_Id,Name from Products
Where Product_Id Not in (Select Product_Id from Cart);


--16. Subquery to Find Customers Who Havent Placed Orders.
select * from Customers
Where Customer_id Not In (Select Customer_Id from Orders);



--17. Subquery to Calculate the Percentage of Total Revenue for a Product.



--18. Subquery to Find Products with Low Stock.
Select Name As Low_Stock from Products
Where StockQuantity in (Select StockQuantity from Products Where (StockQuantity<=10));



--19. Subquery to Find Customers Who Placed High-Value Orders

select Name As Customers_With_High_Value_Orders from Customers
Where Customer_Id In (Select Customer_Id from Orders Where (Total_Price>=1000 ));
