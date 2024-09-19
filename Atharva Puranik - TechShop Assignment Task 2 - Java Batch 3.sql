-- Task 2 -- 


-- 1. retrieve customer name --
select FirstName, LastName, Email from Customers;


-- 2. all orders with their order dates and corresponding customer name -- 
select  Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName from Orders
join Customers ON Orders.CustomerID = Customers.CustomerID;


-- 3. Insert new entry in customer table -- 
Insert into customers values ( 92,"Mangal","Singh", "msingh@ex.com","1290903456","cbs st");

-- 4. increasing by 10% -- 
update  Products
set Price = Price * 1.10
where  ProductName IN ('Laptop', 'Smartphone', 'Tablet', 'Smartwatch', 'Headphones');


-- 5. deleting specific orders -- 
SET SQL_SAFE_UPDATES = 0; 
delete from OrderDetails where OrderID = 10;
delete from Orders Where OrderID = 10; 
     
     
-- 6. insert new order -- 
insert into  Orders (OrderID, CustomerID, OrderDate, TotalAmount)
values (11, 5, '2024-09-19', 750.00);


-- 7. Update contact information -- 
update  Customers set  Email = 'uxz@example.com', Address = 'ono st' where CustomerID = 5 ;


-- 8. recalculate and update the total cost of each order
update  Orders
set  TotalAmount = ( select SUM(OrderDetails.Quantity * Products.Price) from OrderDetails join  Products ON OrderDetails.ProductID = Products.ProductID where  OrderDetails.OrderID = Orders.OrderID );



-- 9.delete all orders and their associated order details
SET SQL_SAFE_UPDATES = 0;
delete from  OrderDetails where OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = 5);
delete from  Orders WHERE CustomerID = 5; 

-- 10. insert a new electronic gadget product
insert into Products (ProductID, ProductName, Description, Price)
values (11, 'Bluetooth Speaker', 'fhsbfsbfkjsfksfksn', 120.00);


-- 11.update the status of a specific order in the Orders table
alter table  Orders
add  Status varchar(50);

update Orders set  Status = 'Shipped' where OrderID = 2;
update Orders set Status = 'pending' where OrderID = 2;



-- 12.calculate and update the number of orders placed by each customer --
alter table  Customers
add  NumberOfOrders int default 0;
update Customers set NumberOfOrders = ( select COUNT(*) from Orders
where  Orders.CustomerID = Customers.CustomerID );







