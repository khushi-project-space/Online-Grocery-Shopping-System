-- MySQL dump for GRO1 (derived schema, sample seed data)
-- NOTE: The original application is ASP.NET + SQL Server. To use MySQL you'll also need to update the app's data access and connection string.

CREATE DATABASE IF NOT EXISTS `gro1_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gro1_db`;

-- User_info
DROP TABLE IF EXISTS `User_info`;
CREATE TABLE `User_info` (
  `unm` VARCHAR(100) NOT NULL PRIMARY KEY,
  `uimage` VARCHAR(255) DEFAULT NULL,
  `fnm` VARCHAR(100) DEFAULT NULL,
  `mnm` VARCHAR(100) DEFAULT NULL,
  `lnm` VARCHAR(100) DEFAULT NULL,
  `city` VARCHAR(100) DEFAULT NULL,
  `address` TEXT DEFAULT NULL,
  `mno` VARCHAR(50) DEFAULT NULL,
  `email` VARCHAR(150) DEFAULT NULL,
  `password` VARCHAR(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed sample user
INSERT INTO `User_info` (`unm`,`uimage`,`fnm`,`mnm`,`lnm`,`city`,`address`,`mno`,`email`,`password`) VALUES
('testuser','/assets/images/user.png','Test','M','User','Ahmedabad','Sample address','9999999999','test@example.com','testpass');

-- Admin_info
DROP TABLE IF EXISTS `Admin_info`;
CREATE TABLE `Admin_info` (
  `Admin_id` INT AUTO_INCREMENT PRIMARY KEY,
  `Admin_nm` VARCHAR(100) NOT NULL,
  `Admin_pass` VARCHAR(255) NOT NULL,
  `email` VARCHAR(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed admin
INSERT INTO `Admin_info` (`Admin_nm`,`Admin_pass`,`email`) VALUES
('admin','admin','admin@example.com');

-- Category_info
DROP TABLE IF EXISTS `Category_info`;
CREATE TABLE `Category_info` (
  `P_cat` INT AUTO_INCREMENT PRIMARY KEY,
  `cat_nm` VARCHAR(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Category_info` (`cat_nm`) VALUES
('Beverages'),
('Snacks'),
('Bakery');

-- Item_info
DROP TABLE IF EXISTS `Item_info`;
CREATE TABLE `Item_info` (
  `Pro_id` INT AUTO_INCREMENT PRIMARY KEY,
  `Pro_nm` VARCHAR(255) NOT NULL,
  `Price` DECIMAL(10,2) DEFAULT 0.00,
  `Qty` INT DEFAULT 0,
  `P_img` VARCHAR(255) DEFAULT NULL,
  `cat_nm` VARCHAR(150) DEFAULT NULL,
  INDEX (`cat_nm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Item_info` (`Pro_nm`,`Price`,`Qty`,`P_img`,`cat_nm`) VALUES
('Coca Cola 500ml',50.00,100,'/assets/images/coke.jpg','Beverages'),
('Lays Classic',20.00,200,'/assets/images/lays.jpg','Snacks'),
('Brown Bread',35.00,50,'/assets/images/bread.jpg','Bakery');

-- OrderDetails
DROP TABLE IF EXISTS `OrderDetails`;
CREATE TABLE `OrderDetails` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `unm` VARCHAR(100) DEFAULT NULL,
  `orderid` VARCHAR(100) DEFAULT NULL,
  `sno` INT DEFAULT NULL,
  `productid` INT DEFAULT NULL,
  `productname` VARCHAR(255) DEFAULT NULL,
  `price` DECIMAL(10,2) DEFAULT 0.00,
  `quantity` INT DEFAULT 0,
  `orderdate` DATETIME DEFAULT NULL,
  `status` VARCHAR(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Feedback_info
DROP TABLE IF EXISTS `Feedback_info`;
CREATE TABLE `Feedback_info` (
  `feed_id` INT AUTO_INCREMENT PRIMARY KEY,
  `unm` VARCHAR(100) DEFAULT NULL,
  `feddback` TEXT DEFAULT NULL,
  `rating` INT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Feedback_info` (`unm`,`feddback`,`rating`) VALUES
('testuser','Great service',5);

-- cash_info
DROP TABLE IF EXISTS `cash_info`;
CREATE TABLE `cash_info` (
  `cash_id` INT AUTO_INCREMENT PRIMARY KEY,
  `pid` INT DEFAULT NULL,
  `unm` VARCHAR(100) DEFAULT NULL,
  `address` TEXT DEFAULT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Helpful views / sample data
-- Add sample order for testuser
INSERT INTO `OrderDetails` (`unm`,`orderid`,`sno`,`productid`,`productname`,`price`,`quantity`,`orderdate`,`status`) VALUES
('testuser','ORD1001',1,1,'Coca Cola 500ml',50.00,2,NOW(),'Pending');

-- End of dump
