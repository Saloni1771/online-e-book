-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2019 at 07:53 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7
 
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";
 
 
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
 
--
-- Database: `ecommerece`
--
 
DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$
 
DELIMITER ;
 
-- --------------------------------------------------------
 
--
-- Table structure for table `admin_info`
--
 
CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
--
-- Dumping data for table `admin_info`
--
 
INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');
 
-- --------------------------------------------------------
 
--
-- Table structure for table `brands`
--
 
CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
--
-- Dumping data for table `brands`
--
 
INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Arihant'),
(2, 'cengage'),
(3, 'SCharms'),
(4, 'Pearson'),
(5, 'Oxford'),
(6, 'MTG');
 
-- --------------------------------------------------------
 
--
-- Table structure for table `cart`
--
 
CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
--
-- Dumping data for table `cart`
--
 
INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1);
 
-- --------------------------------------------------------
 
--
-- Table structure for table `categories`
--
 
CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
--
-- Dumping data for table `categories`
--
 
INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'NCERT Textbooks'),
(2, 'NCERT Reference Books'),
(3, 'NCERT Question Bank'),
(4, 'JEE Books'),
(5, 'NEET Books'),
(6, 'Novels'),
(7, 'Classics');
 
-- --------------------------------------------------------
 
--
-- Table structure for table `email_info`
--
 
CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
--
-- Dumping data for table `email_info`
--
 
INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'b19110@students.iitmandi.ac.in'),
(5, 'b19111@students.iitmandi.ac.in');
 
-- --------------------------------------------------------
 
--
-- Table structure for table `logs`
--
 
CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
-- --------------------------------------------------------
 
--
-- Table structure for table `orders`
--
 
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
--
-- Dumping data for table `orders`
--
 
INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');
 
-- --------------------------------------------------------
 
--
-- Table structure for table `orders_info`
--
 
CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
--
-- Dumping data for table `orders_info`
--
 
INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Sagar', 'patidarsaloni22@gmail.com', 'Indore, Kumbalagodu, Karnataka', 'Bangalore', 'Karnataka', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, 1234);
 
-- --------------------------------------------------------
 
--
-- Table structure for table `order_products`
--
 
CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
--
-- Dumping data for table `order_products`
--
 
INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000);
 
-- --------------------------------------------------------
 
--
-- Table structure for table `products`
--
 
CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
--
-- Dumping data for table `products`
--
 
INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, 'Booksl', 500, 'Books', 'prod7.png', 'Book'),
(2, 1, 3, 'Books', 2500, 'Books', 'prod6.png', 'Book'),
(3, 1, 3, 'Books', 300, 'Books', 'prod3.png', 'Book'),
(4, 1, 3, 'Books', 3200, 'books ', 'pt5.jpg', 'Book'),
(5, 1, 2, 'Books', 1000, 'Books', 'prod7.png', 'Book'),
(6, 1, 1, 'Books', 1000,'Books',  'prod1.png', 'Book '),
(7, 1, 1, 'Books', 500, 'Book', 'prod13.png', 'Book'),
(8, 1, 4, 'Books', 4000, 'Book', 'pm1.jpg', 'Book'),
(9, 1, 3, 'Books', 1200, 'Book', 'pm2.jpg', 'Book'),
(10, 2, 6, 'Books', 1000, 'Book', 'pm3.jpg', 'Book '),
(11, 2, 6, 'Books', 1200, 'Book', 'pm4.jpg', 'Book'),
(12, 2, 6, 'Books', 1500, 'Book', 'pm5.jpg', 'Book'),
(13, 2, 6, 'Books', 1200, 'Book', 'pm6.jpg', 'Book'),
(14, 2, 6, 'Books', 1400, 'Book', 'pm7.jpg', 'Book'),
(15, 2, 6, 'Books', 1500, 'Book', 'pm8.jpg', 'Book'),
(16, 3, 6, 'Books', 600, 'Book', 'pm9.jpg', 'Book'),
(17, 3, 6, 'Books', 500, 'Book', 'pm10.jpg', 'Book'),
(19, 3, 6, 'Books', 300, 'Book', 'pm11.jpg', 'Book'),
(20, 3, 6, 'Books', 1600, 'Book', 'pm12.jpg', 'Book '),
(21, 3, 6, 'Books', 800, 'Book', 'pm13.jpg', 'Book'),
(22, 4, 6, 'Books', 1300, 'Book', 'pt1.jpg', 'Books'),
(23, 4, 6, 'Books', 1900, 'Book', 'pt2.jpg', 'Book'),
(24, 4, 6, 'Book', 700, 'Book', 'pt3.jpg', 'Book'),
(25, 4, 6, 'Book', 750, 'Book', 'pt4.jpg', 'Book'),
(27, 4, 6, 'Books', 690, 'Copy', 'pt5.jpg', 'Book'),
(32, 5, 0, 'Books', 2500, 'book ', 'pt6.jpg', 'Book'),
(33, 6, 2, 'Books', 350, 'Book', 'pt7.jpg', 'Book'),
(34, 6, 4, 'Books', 1000, 'Book', 'pt8.jpg', 'Book'),
(35, 6, 0, 'Novel', 600, 'Novel', 'pb1.jpg', 'Novel'),
(36, 6, 5, 'Novel', 1500, 'Novel', 'pb2.jpg', 'Novel'),
(37, 6, 5, 'Novel', 2000, 'Novel', 'pb3.jpg', 'Novel'),
(38, 6, 4, 'Novel', 350, 'Novel', 'pb4.jpg', 'Novel'),
(39, 6, 5, 'Novel', 250, 'Novel', 'pb5.jpg', 'Novel'),
(40, 2, 6, 'Novel', 300, 'Novel', 'pb6.jpg', 'Novel'),
(45, 1, 2, 'Novel', 1000, 'Novel', 'pb6.jpg', 'Novel'),
(46, 1, 2, 'Novel', 1000, 'Novel', 'pb7.jpg', 'Novel'),
(47, 4, 6, 'Novel', 650, 'Novel', 'pb8.png', 'novel'),
(48, 1, 7, 'Novel', 250, 'Novel', 'prod2.png', 'Book'),
(49, 1, 7, 'Book', 250, 'Book', 'prod5.png', 'Book'),
(50, 3, 6, 'Book', 350, 'Book', 'prod6.png', 'Book'),
(51, 3, 6, 'Book', 270, 'Book', 'prod7.png', 'Book'),
(52, 3, 6, 'Book', 453, 'Book', 'prod8.png', 'Book'),
(53, 3, 6, 'Book', 220, 'Book', 'prod9.png', 'Book'),
(54, 3, 6, 'Book', 290, 'Book', 'pbb1.jpg', 'Book'),
(55, 3, 6, 'Book', 259, 'Book', 'pbb2.jpg', 'Book'),
(56, 3, 6, '''Book', 299, 'Book', 'pbb3.jpg', 'Book'),
(57, 3, 6, 'Book', 260, 'Book', 'pt1.jpg', 'Book'),
(58, 3, 6, 'Book', 350, 'Book', 'pt2.jpg', 'Book'),
(59, 3, 6, 'Book', 855, 'Book', 'pt3.jpg', 'Book'),
(60, 3, 6, 'Book', 150, 'Book', 'pt4.jpg', 'Book'),
(61, 3, 6, 'Book', 215, 'Book', 'pt5.jpg', 'Book'),
(62, 3, 6, 'Book', 299, 'Book', 'pt6.jpg', 'Book'),
(63, 3, 6, 'Novel1', 550, 'Books', 'pb1.jpg', 'Novel'),
(64, 3, 6, 'Novel2', 460, 'Books', 'pb2.jpg', 'Novel'),
(65, 3, 6, 'Novel3', 470, 'Books', 'pb3.jpg', 'Novel'),
(66, 3, 6, 'Novel4', 480, 'Books', 'pb4.jpg', 'Novel'),
(67, 3, 6, 'Novel', 360, 'books', 'pb5.jpg', 'Novel'),
(68, 3, 6, 'Novel', 550, 'books', 'pb6.jpg', 'Novel'),
(69, 3, 6, 'Novel', 390, 'books', 'pb7.jpg', 'Novel'),
(70, 3, 6, 'Novel', 399, 'Novel', 'pb8.jpg', 'Novel'),
(71, 1, 2, 'Novel', 500, 'Novel', 'prod9.png', 'Book'),
(72, 7, 2, 'Book', 3500, 'Book', 'pm1.jpg', 'Book'),
(73, 7, 2, 'Book', 350, 'Book', 'pm2.jpg', 'Book'),
(74, 1, 1, 'Book', 550, 'Book', 'pm3.jpg', 'Book'),
(75, 1, 1, 'Book', 550, 'Book', 'pm4.jpg', 'Book'),
(76, 1, 5, 'Book', 450, 'Book', 'pm5.jpg', 'Book'),
(77, 1, 4, 'Book', 499, 'Book', 'pm6.jpg', 'Book'),
(78, 1, 5, 'Books', 579, 'Book', 'pm7.jpg', 'Book'),
(79, 7, 2, 'Books', 269, 'Book', 'pm8.jpg', 'Book'),
(80, 1, 1, 'book', 343, 'Book', 'pm9.jpg', 'Book'),
(81, 4, 6, 'Book', 300, 'Book', 'pm10.jpg', 'Book');
 
-- --------------------------------------------------------
 
--
-- Table structure for table `user_info`
--
 
CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
--
-- Dumping data for table `user_info`
--
 
INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'priyanshu', 'Reddy', 'priyanshureddy951@gmail.com', 'priyanshu', '9448121558', '123456789', 'sdcjns,djc'),
(15, 'hemu', 'ajhgdg', 'priyanshureddy951@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'priyanshu', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'priyanshu@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'priyanshu@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'priyanshu@123', '9535688928', 'Bangalore', 'Kumbalagodu');
 
--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;
 
-- --------------------------------------------------------
 
--
-- Table structure for table `user_info_backup`
--
 
CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
--
-- Dumping data for table `user_info_backup`
--
 
INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'priyanshu', 'Reddy', 'priyanshureddy951@gmail.com', '123456789', '9448121558', '123456789', 'sdcjns,djc'),
(14, 'hemanthu', 'reddy', 'hemanthreddy951@gmail.com', '123456788', '6526436723', 's,dc wfjvnvn', 'b efhfhvvbr'),
(15, 'hemu', 'ajhgdg', 'keeru@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(20, 'pramod', 'vh', 'pramod@gmail.com', '124335353', '9767645653', 'ksbdfcdf', 'sjrgrevgsib'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'priyanshu', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'priyanshu@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'priyanshu@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'priyanshu@123', '9535688928', 'Bangalore', 'Kumbalagodu');
 
--
-- Indexes for dumped tables
--
 
--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);
 
--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);
 
--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);
 
--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);
 
--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);
 
--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);
 
--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);
 
--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);
 
--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);
 
--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);
 
--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);
 
--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);
 
--
-- AUTO_INCREMENT for dumped tables
--
 
--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
 
--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
 
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;
 
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
 
--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
 
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
 
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
 
--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
 
--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;
 
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
 
--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
 
--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
 
--
-- Constraints for dumped tables
--
 
--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);
 
--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;
 
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
 
 
 


