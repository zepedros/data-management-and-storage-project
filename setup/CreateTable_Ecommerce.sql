/*tell which database you will use*/
USE e_commerce;

CREATE TABLE IF NOT EXISTS `Product_Category` (
  `Product_Category_ID`SERIAL NOT NULL,
  `Product_Category` varchar(25) NOT NULL,
  `Created_At` DATETIME,
  `Modified_At`  DATETIME,
  PRIMARY KEY (`Product_Category_ID`)
);

CREATE TABLE IF NOT EXISTS `Discount` (
  `Discount_ID`SERIAL NOT NULL,
  `Discount_Name` varchar(25) DEFAULT NULL,
  `Discount_Description` varchar(50) DEFAULT NULL,
  `Discount_Percentage` FLOAT NOT NULL,
  `Discount_Active` BOOLEAN DEFAULT FALSE,
  `Created_At` DATETIME,
  `Modified_At`  DATETIME,
  PRIMARY KEY (`Discount_ID`)
  );


CREATE TABLE IF NOT EXISTS `Product` (
  `Product_ID` SERIAL NOT NULL,
  `Product_Name` varchar(25) NOT NULL,
  `Product_Description` varchar(50) DEFAULT NULL,
  `Product_Price` FLOAT NOT NULL,
  `Product_Category_ID` BIGINT UNSIGNED NOT NULL,
  `Created_At` DATETIME,
  `Modified_At`  DATETIME,
  PRIMARY KEY (`Product_ID`),
  FOREIGN KEY (`Product_Category_ID`) REFERENCES Product_Category(`Product_Category_ID`)
);


CREATE TABLE IF NOT EXISTS `User` (
  `User_ID` SERIAL NOT NULL,
  `User_Email` varchar(30) NOT NULL,
  `User_Password` varchar(25) NOT NULL,
  `User_First_Name` varchar(25) DEFAULT NULL,
  `User_Last_Name` varchar(25) DEFAULT NULL,
  `User_Telephone` varchar(25) DEFAULT NULL,
  `Created_At` DATETIME,
  `Modified_At`  DATETIME,
  PRIMARY KEY (`User_ID`)
);

CREATE TABLE IF NOT EXISTS `User_Address` (
  `User_Address_ID` SERIAL NOT NULL,
  `User_ID` BIGINT UNSIGNED NOT NULL,
  `User_Address_Streetname` varchar(25) NOT NULL,
  `User_Address_Streetnumber` varchar(25) NOT NULL,
  `User_Address_City` varchar(25) NOT NULL,
  `User_Address_Postalcode` varchar(25) NOT NULL,
  `User_Adress_Country` varchar(25) NOT NULL,
  `Created_At` DATETIME,
  `Modified_At`  DATETIME,
  PRIMARY KEY (`User_Address_ID`),
  FOREIGN KEY (User_ID) REFERENCES User(User_ID)
) ;

CREATE TABLE IF NOT EXISTS `Product_Rating` (
  `Product_Rating_ID` SERIAL NOT NULL PRIMARY KEY,
  `Product_Rating` FLOat NOT NULL,
  `Product_ID` BIGINT UNSIGNED NOT NULL ,
  `User_ID` BIGINT UNSIGNED NOT NULL,
  `Created_At` DATETIME,
  `Modified_At`  DATETIME,
  FOREIGN KEY(Product_ID) REFERENCES Product(Product_ID),
  FOREIGN KEY(User_ID) REFERENCES User(User_ID)
) ;

CREATE TABLE IF NOT EXISTS `Product_Colour` (
  `Product_Colour_ID` SERIAL NOT NULL PRIMARY KEY,
  `Colour` VARCHAR(25) NOT NULL,
  `Created_At` DATETIME,
  `Modified_At`  DATETIME
) ;

CREATE TABLE IF NOT EXISTS `Product_Size` (
  `Product_Size_ID` SERIAL NOT NULL PRIMARY KEY,
  `Size` VARCHAR(25) NOT NULL,
  `Created_At` DATETIME,
  `Modified_At`  DATETIME
) ;

CREATE TABLE IF NOT EXISTS `Warehouse` (
  `Warehouse_ID` SERIAL NOT NULL PRIMARY KEY,
  `Warehouse_Name` VARCHAR(25) NOT NULL,
  `Warehouse_Street_Name` VARCHAR(25) NOT NULL,
  `Warehouse_Street_Number` INT NOT NULL,
  `Warehouse_City` VARCHAR(25) NOT NULL,
  `Warehouse_Postal_Code` VARCHAR(25) NOT NULL,
  `Created_At` DATETIME,
  `Modified_At`  DATETIME
) ;

CREATE TABLE IF NOT EXISTS `SKU` (
  `SKU_ID` SERIAL NOT NULL,
  `Quantity` INT NOT NULL DEFAULT 0,
  `Product_ID` BIGINT UNSIGNED NOT NULL,
  `Product_Colour_ID` BIGINT UNSIGNED NOT NULL,
  `Product_Size_ID` BIGINT UNSIGNED NOT NULL,
  `Warehouse_ID` BIGINT UNSIGNED NOT NULL,
  `Created_At` DATETIME,
  `Modified_At`  DATETIME,
  FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
  FOREIGN KEY (Product_Colour_ID) REFERENCES Product_Colour(Product_Colour_ID),
  FOREIGN KEY (Product_Size_ID) REFERENCES Product_Size(Product_Size_ID),
  FOREIGN KEY (Warehouse_ID) REFERENCES Warehouse(Warehouse_ID),
  PRIMARY KEY(SKU_ID,Product_ID, Product_Colour_ID, Product_Size_ID, Warehouse_ID)
) ;

CREATE TABLE IF NOT EXISTS `Orders` (
  `Order_ID` SERIAL PRIMARY KEY,
  `User_ID` BIGINT UNSIGNED NOT NULL,
  `Total_Amount` INT NOT NULL DEFAULT 0,
  `Created_At` DATETIME,
  `Modified_At`  DATETIME,
  `Discount_ID` BIGINT UNSIGNED DEFAULT NULL,
  FOREIGN KEY (User_ID) REFERENCES User(User_ID),
  FOREIGN KEY (`Discount_ID`) REFERENCES Discount(`Discount_ID`)
) ;

CREATE TABLE IF NOT EXISTS `Invoice` (
  `Invoice_ID` SERIAL NOT NULL PRIMARY KEY,
  `Order_ID` BIGINT UNSIGNED NOT NULL,
  `Sales_Amount` FLOAT NOT NULL,
  `Tax_Amount` FLOAT NOT NULL,
  `Tax_Rate` FLOAT NOT NULL,
  `Status` BOOLEAN NOT NULL DEFAULT FALSE,
  `Due_Date` DATE NOT NULL,
  `Created_At` DATETIME,
  `Modified_At`  DATETIME,
  FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
) ;

CREATE TABLE IF NOT EXISTS `Order_Item` (
  `Order_Item_ID` SERIAL NOT NULL PRIMARY KEY,
  `Order_ID` BIGINT UNSIGNED NOT NULL,
  `SKU_ID` BIGINT UNSIGNED NOT NULL,
  `Quantity` INTEGER NOT NULL,
  `Created_At` DATETIME,
  `Modified_At`  DATETIME,
  FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
  FOREIGN KEY (SKU_ID) REFERENCES SKU(SKU_ID)
) ;


CREATE TABLE IF NOT EXISTS `Company` (
  `Company_ID` SERIAL NOT NULL PRIMARY KEY,
  `Company_Name` VARCHAR(25) NOT NULL,
  `Company_Email` VARCHAR(25) NOT NULL,
  `Company_Website` VARCHAR(25) NOT NULL,
  `Company_Telephone` VARCHAR(25) NOT NULL,
  `Company_Street_Name` VARCHAR(25) NOT NULL,
  `Company_Street_Number` VARCHAR(25) NOT NULL,
  `Company_City` VARCHAR(25) NOT NULL,
  `Company_Postal_Code` VARCHAR(25) NOT NULL,
  `Company_Country` VARCHAR(25) NOT NULL,
  `Created_At` DATETIME,
  `Modified_At`  DATETIME
) ;