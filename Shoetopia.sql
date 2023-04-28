create DATABASE ShoeTopia;
use ShoeTopia;
-- Shoe Brands table

CREATE TABLE Shoe_Brands (
  BKey INT AUTO_INCREMENT,
  Name VARCHAR(30),
  PRIMARY KEY (BKey)
);
CREATE TABLE Customers (
CKEY INT auto_increment,
    Name varchar(40),
    Gender varchar(10),
    Address varchar(80),
    Phone varchar(12),
    primary key (CKEY)

);
-- Shoe table
CREATE TABLE Shoe (
  SKey INT AUTO_INCREMENT,
  Size INT,
  Price INT,
  Color VARCHAR(20),
  Type VARCHAR(30),
  FK_CKey INT,
  FK_BKey INT,
  PRIMARY KEY (SKey),
  FOREIGN KEY (FK_CKey) REFERENCES Customers(CKey),
  FOREIGN KEY (FK_BKey) REFERENCES Shoe_Brands(BKey)
);

-- Basketball Shoes table
CREATE TABLE Basketball_Shoes (
  Support VARCHAR(40),
  FK_SKey INT,
  PRIMARY KEY (FK_SKey),
  FOREIGN KEY (FK_SKey) REFERENCES Shoe(SKey)
);

-- Casual Shoes table
CREATE TABLE Casual_Shoes (
  Materials VARCHAR(40),
  FK_SKey INT,
  PRIMARY KEY (FK_SKey),
  FOREIGN KEY (FK_SKey) REFERENCES Shoe(SKey)
);

-- Cleats table
CREATE TABLE Cleats (
  Sport_Type VARCHAR(40),
  FK_SKey INT,
  PRIMARY KEY (FK_SKey),
  FOREIGN KEY (FK_SKey) REFERENCES Shoe(SKey)
);

-- Retail Stores table
CREATE TABLE Retail_Stores (
  StoreID INT AUTO_INCREMENT,
  State VARCHAR(20),
  Address VARCHAR(30),
  Name VARCHAR(20),
  FK_BKey INT,
  PRIMARY KEY (StoreID),
  FOREIGN KEY (FK_BKey) REFERENCES Shoe_Brands(BKey)
);

-- Factories table
CREATE TABLE Factories (
  FactoryID INT AUTO_INCREMENT,
  Locations VARCHAR(80),
  FK_BKey INT,
  PRIMARY KEY (FactoryID),
  FOREIGN KEY (FK_BKey) REFERENCES Shoe_Brands(BKey)
);

-- Employees table
CREATE TABLE Employees (
  EmployeeID INT AUTO_INCREMENT,
  Name VARCHAR(40),
  Department VARCHAR(40),
  FK_BKey INT,
  FK_StoreID INT,
  PRIMARY KEY (EmployeeID),
  FOREIGN KEY (FK_BKey) REFERENCES Shoe_Brands(BKey),
  FOREIGN KEY (FK_StoreID) REFERENCES Retail_Stores(StoreID)
);

-- Running Shoes table
CREATE TABLE Running_Shoes (
  Breathability INT,
  FK_SKey INT,
  PRIMARY KEY (FK_SKey),
  FOREIGN KEY (FK_SKey) REFERENCES Shoe(SKey)
);

-- Inventory table
CREATE TABLE Inventory (
  IKey INT AUTO_INCREMENT,
  Quantity INT,
  FK_BKey INT,
  PRIMARY KEY (IKey),
  FOREIGN KEY (FK_BKey) REFERENCES Shoe_Brands(BKey)
);

-- Orders table
CREATE TABLE Orders (
  OrderID INT AUTO_INCREMENT,
  Date VARCHAR(20),
  FK_CKey INT,
  PRIMARY KEY (OrderID),
  FOREIGN KEY (FK_CKey) REFERENCES Customers(CKey)
);

-- FootLocker table
CREATE TABLE FootLocker (
  Wide_Variety INT,
  FK_StoreID INT,
  PRIMARY KEY (FK_StoreID),
  FOREIGN KEY (FK_StoreID) REFERENCES Retail_Stores(StoreID)
);

-- Fulfill table
CREATE TABLE Fulfill (
  FK_StoreID INT,
  FK_OrderID INT,
  PRIMARY KEY (FK_StoreID, FK_OrderID),
  FOREIGN KEY (FK_StoreID) REFERENCES Retail_Stores(StoreID),
  FOREIGN KEY (FK_OrderID) REFERENCES Orders(OrderID)
);

-- Shoe_Color table
CREATE TABLE Shoe_Color (
  FK_SKey INT,
  SColor VARCHAR(20),
  PRIMARY KEY (FK_SKey, SColor),
  FOREIGN KEY (FK_SKey) REFERENCES Shoe(SKey)
);

-- Suppliers table
CREATE TABLE Suppliers (
  SupplierKey INT AUTO_INCREMENT,
  Materials VARCHAR(40),
  PRIMARY KEY (SupplierKey)
);

-- Target table
CREATE TABLE Target (
  Trendy_Styles INT,
  FK_StoreID INT,
  PRIMARY KEY (FK_StoreID),
  FOREIGN KEY (FK_StoreID) REFERENCES Retail_Stores(StoreID)
);

-- Walmart table
CREATE TABLE Walmart (
  Convenience BOOLEAN,
  FK_StoreID INT,
  PRIMARY KEY (FK_StoreID),
  FOREIGN KEY (FK_StoreID) REFERENCES Retail_Stores(StoreID)
);

-- WorksWith2 table
CREATE TABLE WorksWith2 (
  FK_SupplierKey INT,
  FK_FactoryID INT,
  PRIMARY KEY (FK_SupplierKey, FK_FactoryID),
  FOREIGN KEY (FK_SupplierKey) REFERENCES Suppliers(SupplierKey),
  FOREIGN KEY (FK_FactoryID) REFERENCES Factories(FactoryID)
);
