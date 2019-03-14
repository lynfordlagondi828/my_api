-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2019 at 07:52 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `sku` text NOT NULL,
  `status` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `product_id`, `name`, `price`, `description`, `image`, `sku`, `status`, `created_at`) VALUES
(1, '2', 'Sandisk Cruzer Blade 16 GB Flash Pendrive', 400, 'USB 2.0, 16 GB, Black & Red, Read 17.62 MB/sec, Write 4.42 MB/sec', 'http://192.168.254.103/ford_php/rest_api/PayPalServer/images/usb.jpg', 'sku-78955545w', 'on_order', '2019-03-14 06:26:07'),
(2, '2', 'Sandisk Cruzer Blade 16 GB Flash Pendrive', 400, 'USB 2.0, 16 GB, Black & Red, Read 17.62 MB/sec, Write 4.42 MB/sec', 'http://192.168.254.103/ford_php/rest_api/PayPalServer/images/usb.jpg', 'sku-78955545w', 'on_order', '2019-03-14 06:26:54'),
(3, '2', 'Sandisk Cruzer Blade 16 GB Flash Pendrive', 400, 'USB 2.0, 16 GB, Black & Red, Read 17.62 MB/sec, Write 4.42 MB/sec', 'http://192.168.254.103/ford_php/rest_api/PayPalServer/images/usb.jpg', 'sku-78955545w', 'on_cart', '2019-03-14 06:27:42');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) NOT NULL,
  `product_id` text NOT NULL,
  `name` text NOT NULL,
  `price` text NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL,
  `payment_type` text NOT NULL,
  `sku` text NOT NULL,
  `status` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `product_id`, `name`, `price`, `description`, `image`, `payment_type`, `sku`, `status`, `created_at`) VALUES
(1, '2', 'Sandisk Cruzer Blade 16 GB Flash Pendrive', '400', 'USB 2.0, 16 GB, Black & Red, Read 17.62 MB/sec, Write 4.42 MB/sec', 'http://192.168.254.103/ford_php/rest_api/PayPalServer/images/usb.jpg', 'COD', 'sku-78955545w', 'Pending', '2019-03-14 06:26:33'),
(2, '2', 'Sandisk Cruzer Blade 16 GB Flash Pendrive', '400', 'USB 2.0, 16 GB, Black & Red, Read 17.62 MB/sec, Write 4.42 MB/sec', 'http://192.168.254.103/ford_php/rest_api/PayPalServer/images/usb.jpg', 'COD', 'sku-78955545w', 'Pending', '2019-03-14 06:27:23');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `price` int(10) NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL,
  `sku` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `sku`, `created_at`) VALUES
(1, 'Huawei Nexus 6P', 42695, 'Huawei Nexus 6P 64GB (Graphite)', 'http://192.168.254.103/ford_php/rest_api/PayPalServer/images/Nexus_6.jpg', 'sku-2123wers100', '2015-02-04 15:19:42'),
(2, 'Sandisk Cruzer Blade 16 GB Flash Pendrive', 400, 'USB 2.0, 16 GB, Black & Red, Read 17.62 MB/sec, Write 4.42 MB/sec', 'http://192.168.254.103/ford_php/rest_api/PayPalServer/images/usb.jpg', 'sku-78955545w', '2015-02-10 14:54:28'),
(3, 'Extra Large Backpack', 1900, 'Extra Large Backpack, Durable Lightweight Travel Laptop Bag with Computer Compartment Headphone Hole,Friendly Business Backpacks for Men & Women Holds 17 inch Laptops', 'http://192.168.254.103/ford_php/rest_api/PayPalServer/images/back_pack.jpg', 'sku-8493948kk4', '2015-02-10 14:55:34'),
(4, 'American Legacy 1.5 L Rice Cooker Glass ', 600, '\r\nAmerican Legacy 1.5 L Rice Cooker Glass Cover (Black/ Matte Black)', 'http://192.168.254.103/ford_php/rest_api/PayPalServer/images/rice_cooker.jpg', 'sku-90903034ll', '2015-02-10 14:59:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
