CREATE DATABASE ONLINESHOPPINGSYSTEM;
Use  ONLINESHOPPINGSYSTEM;
Create Table Customer 
(
CustomerID INT IDentity Primary Key ,
Name NVARCHAR(50) NOT NUll,
Email VARCHAR(100)  UNIQUE,
PhoneNumber NVARCHAR(11) UNIQUE,
Address NVARCHAR(50)
)
INSERT INTO Customer (Name, Email, PhoneNumber, Address)
VALUES
('Ali Hassan', 'ali.hassan@example.com', '01012345678', 'Giza, Egypt'),
('Mona Ahmed', 'mona.ahmed@example.com', '01198765432', 'Cairo, Egypt');
Create Table Orders 
(
OrderID INT IDentity Primary Key ,
Customerid INT NOT NULL,
OrderDate DateTime Default GETUTCDATE(),
TotalAmount Decimal(9,5),
Status VARCHAR(10) DEFAULT 'confirmed' CHECK (Status IN ('confirmed', 'cancelled')),
Foreign key  (Customerid) References Customer(CustomerID)
)
INSERT INTO Orders (Customerid, TotalAmount, Status)
VALUES
(1, 750.99, 'confirmed'),
(2, 1499.50, 'cancelled');
Create Table OrderDetails
(
OrderDetailsID INT IDentity Primary Key ,
Quantity NVARCHAR(100),
Price Decimal (9,3)
)
INSERT INTO OrderDetails (Quantity, Price)
VALUES
('2', 500.00),
('1', 999.99);
Create Table Products 
(
ProductID INT IDentity Primary Key ,
Category NVARCHAR(30),
Name VARCHAR(50) NOt NULL,
Descriptions VARCHAR(150) ,
Price Decimal (9,3)
)
INSERT INTO Products (Category, Name, Descriptions, Price)
VALUES
('Electronics', 'Smartphone', 'Latest model with high performance', 999.99),
('Home Appliances', 'Microwave', '800W microwave with digital control', 500.00);
Create Table Supplier
(
SupplierID INT IDentity Primary Key ,
Name VARCHAR(50) NOT NULL,
ContactInfo NVARCHAR(100) 
)
INSERT INTO Supplier (Name, ContactInfo)
VALUES
('ElectroStore', 'contact@electrostore.com'),
('HomeTech', 'info@hometech.com');
Create Table ProductSupplier 
(
supplierid INT NOT NULL,
productid INT NOT NULL,
Foreign key (supplierid) REFERENCES  Supplier(SupplierID),
Foreign key (productid) REFERENCES   Products(ProductID)
)
INSERT INTO ProductSupplier (supplierid, productid)
VALUES
(1, 1),
(2, 2);
Create Table Associated
(
product_id INT NOT NULL,
order_id INT NOT NULL,
orderdetails_id INT NOT NULL,
Foreign key (product_id) REFERENCES   Products(ProductID),
Foreign key (order_id) REFERENCES   Orders(OrderID),
Foreign key (orderdetails_id) REFERENCES   OrderDetails(OrderDetailsID)
)
INSERT INTO Associated (product_id, order_id, orderdetails_id)
VALUES
(1, 1, 1),
(2, 2, 2);
Create Table OrderProduct 
(
Product_ID INT NOT NULL,
Order_ID INT NOT NULL,
Foreign key (Product_ID) REFERENCES   Products(ProductID),
Foreign key (Order_ID) REFERENCES   Orders(OrderID)
)
INSERT INTO OrderProduct (Product_ID, Order_ID)
VALUES
(1, 1),
(2, 2);
Alter Table Products
ADD Rating Decimal Default 0;

ALTER TABLE Products
ADD DEFAULT 'new' FOR Category;

ALTER TABLE Products DROP COLUMN Rating;
UPDATE Orders
SET OrderDate = GETDATE()
WHERE OrderID > 0;

