
DROP DATABASE IF EXISTS Shopping_Management;
CREATE DATABASE Shopping_Management;
USE Shopping_Management;
 CREATE TABLE customers (
    Customer_Id INT AUTO_INCREMENT PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone_Number CHAR(10) NOT NULL UNIQUE,
    Age INT CHECK (Age > 0),
    Gender ENUM('Male', 'Female', 'Other'),
    Country VARCHAR(50) DEFAULT 'India',
    City VARCHAR(50) NOT NULL,
    Pincode CHAR(6) DEFAULT '201301',
    Registration_Date DATE DEFAULT (CURRENT_DATE),
    Registration_Time TIME DEFAULT (CURRENT_TIME),
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Address VARCHAR(250),
    Customer_Status ENUM('Active', 'Inactive', 'Blocked') DEFAULT 'Active',
    Customer_Notes TINYTEXT
);
 select * from customers;
 
 
 
 CREATE TABLE orders (
    Order_Id INT AUTO_INCREMENT PRIMARY KEY,
    Customer_Id INT,
    Order_Date DATE DEFAULT (CURRENT_DATE),
    Order_Amount DECIMAL(10,2) NOT NULL,
    Order_Status ENUM(
        'Pending',
        'Processing',
        'Shipped',
        'Delivered',
        'Cancelled'
    ) DEFAULT 'Pending',

    Payment_Method ENUM(
        'Cash',
        'Card',
        'UPI',
        'Net Banking'
    ),

    Payment_Status ENUM(
        'Pending',
        'Paid',
        'Failed'
    ) DEFAULT 'Pending',

    Shipping_Address VARCHAR(250) NOT NULL,
    Delivery_Pincode CHAR(6),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Discount_Amount DECIMAL(10,2) DEFAULT 0.00,
    Delivery_Date DATE NULL,
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tracking_Number VARCHAR(30) UNIQUE,

    Delivery_Status ENUM(
        'Not Dispatched',
        'In Transit',
        'Delivered',
        'Returned'
    ) DEFAULT 'Not Dispatched',

    Order_Notes TINYTEXT,

    CONSTRAINT fk_customer
    FOREIGN KEY (Customer_Id)
    REFERENCES customers(Customer_Id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
SHOW DATABASES;

USE Shopping_Management;

SELECT DATABASE();

DESC customers;

DESC orders;

SHOW CREATE TABLE customers;

SHOW CREATE TABLE orders;



