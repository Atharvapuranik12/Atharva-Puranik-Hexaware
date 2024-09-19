-- Task 1 -- 
create database Techshop;
use Techshop; 
-- customer table 
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY AUTO_INCREMENT,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  Email VARCHAR(255) UNIQUE,
  Phone VARCHAR(20),
  Address TEXT
);

-- Product Table 

CREATE TABLE Products (
  ProductID INT PRIMARY KEY AUTO_INCREMENT,
  ProductName VARCHAR(255) NOT NULL,
  Description TEXT,
  Price DECIMAL(10,2) NOT NULL
);

-- Orders Table 

CREATE TABLE Orders (
  OrderID INT PRIMARY KEY AUTO_INCREMENT,
  CustomerID INT NOT NULL,
  OrderDate DATE NOT NULL,
  TotalAmount DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- OrderDetails  Table

CREATE TABLE OrderDetails (
  OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
  OrderID INT NOT NULL,
  ProductID INT NOT NULL,
  Quantity INT NOT NULL,
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Inventory Table 

CREATE TABLE Inventory (
  InventoryID INT PRIMARY KEY AUTO_INCREMENT,
  ProductID INT NOT NULL,
  QuantityInStock INT NOT NULL,
  LastStockUpdate DATE NOT NULL,
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES
(1, 'Ajay', 'Sharma', 'ajay.sharma@ex.com', '9876543210', '123 Main St, City A'),
(2, 'Piyush', 'Verma', 'piyush.verma@ex.com', '9123456789', '456 Market St, City B'),
(3, 'John', 'Doe', 'john.doe@ex.com', '9988776655', '789 King St, City C'),
(4, 'Ravi', 'Kumar', 'ravi.kumar@ex.com', '9234567890', '101 Queen St, City D'),
(5, 'Priya', 'Singh', 'priya.singh@ex.com', '9871234567', '202 raja St, City E'),
(6, 'Sana', 'Khan', 'sana.khan@ex.com', '9876543211', '303 rani St, City F'),
(7, 'Rohan', 'Patel', 'rohan.patel@ex.com', '9812345678', '404 mantri St, City G'),
(8, 'Amit', 'Mehta', 'amit.mehta@ex.com', '9234567812', '505 chai St, City H'),
(9, 'Suresh', 'Nair', 'suresh.nair@ex.com', '9123456711', '606 no St, City I'),
(10, 'Anita', 'Roy', 'anita.roy@ex.com', '9988776622', '707 these St, City J');

INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES
(1, 'Laptop', 'husbfsiucisnsni', 1200.00),
(2, 'Smartphone', 'shvcsdnocvsiovneovn', 800.00),
(3, 'Tablet', 'jbvbsivndvndfvoe', 450.00),
(4, 'Smartwatch', 'yubvvdbvuvdiodoin', 200.00),
(5, 'Headphones', 'dshjsdbvbjdsbvsn', 150.00),
(6, 'Keyboard', 'dvhbevrvnfsfdefef', 75.00),
(7, 'Mouse', 'vdbvdenvudnvdio', 50.00),
(8, 'Monitor', 'hbvbhbvdvdfvdvkhjb', 300.00),
(9, 'Printer', 'cshcsjcvhbsvlsvskbv', 250.00),
(10, 'Camera', 'fhbvevkvelkvnevoie', 1000.00);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(1, 1, '2024-09-01', 1250.00),
(2, 2, '2024-09-02', 800.00),
(3, 3, '2024-09-03', 1500.00),
(4, 4, '2024-09-04', 950.00),
(5, 5, '2024-09-05', 300.00),
(6, 6, '2024-09-06', 1200.00),
(7, 7, '2024-09-07', 500.00),
(8, 8, '2024-09-08', 250.00),
(9, 9, '2024-09-09', 700.00),
(10, 10, '2024-09-10', 1000.00);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 1, 1),
(4, 4, 3, 2),
(5, 5, 4, 1),
(6, 6, 1, 1),
(7, 7, 5, 2),
(8, 8, 6, 1),
(9, 9, 7, 3),
(10, 10, 10, 1);

INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate)
VALUES
(1, 1, 50, '2024-08-20'),
(2, 2, 30, '2024-08-18'),
(3, 3, 100, '2024-08-15'),
(4, 4, 25, '2024-08-10'),
(5, 5, 60, '2024-08-12'),
(6, 6, 80, '2024-08-14'),
(7, 7, 90, '2024-08-16'),
(8, 8, 40, '2024-08-22'),
(9, 9, 70, '2024-08-19'),
(10, 10, 20, '2024-08-23');



