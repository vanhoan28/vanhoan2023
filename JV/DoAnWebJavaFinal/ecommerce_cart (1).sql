-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 09, 2023 at 11:00 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_cart`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `o_quantity` int(11) DEFAULT NULL,
  `o_date` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`o_id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`o_id`, `p_id`, `u_id`, `o_quantity`, `o_date`) VALUES
(1, 4, 1, 1, '2023-05-29'),
(4, 4, 1, 1, '2023-05-29'),
(5, 4, 1, 1, '2023-05-29'),
(6, 4, 1, 1, '2023-05-29'),
(7, 3, 1, 1, '2023-05-29'),
(8, 4, 1, 1, '2023-05-29'),
(9, 4, 1, 1, '2023-05-29'),
(10, 3, 1, 1, '2023-05-29'),
(11, 2, 1, 1, '2023-05-29'),
(12, 4, 1, 1, '2023-05-29'),
(13, 3, 1, 1, '2023-05-29'),
(14, 4, 3, 4, '2023-05-31'),
(15, 4, 3, 4, '2023-05-31'),
(16, 3, 3, 5, '2023-05-31'),
(26, 4, 2, 1, '2023-06-02'),
(27, 3, 2, 1, '2023-06-02'),
(28, 2, 2, 1, '2023-06-02'),
(29, 4, 2, 4, '2023-06-03'),
(30, 2, 2, 4, '2023-06-03'),
(31, 3, 2, 4, '2023-06-03'),
(32, 1, 2, 1, '2023-06-08'),
(33, 9, 2, 1, '2023-06-08'),
(34, 5, 2, 1, '2023-06-08'),
(35, 1, 3, 1, '2023-06-08'),
(36, 1, 5, 1, '2023-06-08'),
(37, 6, 9, 1, '2023-06-09'),
(38, 7, 9, 1, '2023-06-09'),
(39, 1, 9, 1, '2023-06-09'),
(40, 6, 9, 1, '2023-06-09'),
(41, 7, 9, 1, '2023-06-09'),
(42, 8, 2, 1, '2023-06-09'),
(43, 1, 2, 1, '2023-06-09'),
(44, 6, 2, 1, '2023-06-09'),
(45, 8, 2, 1, '2023-06-09'),
(46, 8, 2, 1, '2023-06-09'),
(47, 1, 2, 1, '2023-06-09'),
(48, 6, 2, 1, '2023-06-09'),
(49, 8, 10, 1, '2023-06-09'),
(50, 1, 10, 1, '2023-06-09'),
(51, 6, 10, 1, '2023-06-09');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `category` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `image` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `image`, `description`) VALUES
(8, 'Laptop Asus vivobook 14', 'laptop office', 700, 'product-images/asus-vivobook.png', 'intel core i5 11400H, GPU GTX 1650, Ram 8gb DDR4, 15.6 inch monitor'),
(1, 'Asus tuf gaming', 'Laptop Gaming', 900, 'product-images/asus-tuf.png', 'intel core i5 11400H, GPU GTX 1650, Ram 8gb DDR4, 15.6 inch monitor 144hz'),
(6, 'HP Pavilion', 'office laptop', 700.99, 'product-images/hp-pavilion.png', 'intel core i5 11400H,\r\nGPU GTX 1650,\r\nRam 8gb DDR4,      \r\n15.6 inch monitor'),
(7, 'Lenovo Ideapad 3', 'laptop gaming', 900.99, 'product-images/lenovo-ideapad3.png', 'intel core i5 11400H,\r\nGPU GTX 1650,\r\nRam 8gb DDR4,      \r\n15.6 inch monitor'),
(5, 'Laptop Acer Nitro 5', 'laptop gaming', 1100.99, 'product-images/acer-nitro.png', 'intel core i5 12400H,GPU GTX 3050,Ram 8gb DDR4, 15.6 inch monitor 144hz'),
(2, 'Laptop Gigabyte G5 GD', 'Laptop Gaming', 1200, 'product-images/gigabyte.png', 'intel core i5 12400H,GPU GTX 3050,Ram 8gb DDR4, 15.6 inch monitor'),
(3, 'Laptop Lenovo Legion 50000', 'Laptop Gaming000', 1300, 'product-images/lenovo-legion5.png', 'intel core i5 12400H,GPU GTX 3050,Ram 8gb DDR4, 15.6 inch monitor 144hz');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `phanquyen` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phanquyen`) VALUES
(1, 'Almamun', 'almamun@mail.com', '123456', 0),
(2, 'quocdung', 'quocdung@gmail.com', 'denlun111', 0),
(3, 'admin', 'admin@gmail.com', '123', 1),
(4, 'lee', 'lee@gmail.com', '123', 0),
(5, 'kal', 'lee@gmail.com', '111', 0),
(6, 'Dung', 'dungkal@gmail.com', '', 0),
(8, 'lee', 'lee1@gmail.com', '111', 0),
(9, 'lee', 'dung@gmail.com', '111', 0),
(10, 'lee', '111@gmail.com', '111', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
