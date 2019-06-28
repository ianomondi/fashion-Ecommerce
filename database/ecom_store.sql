-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2019 at 05:53 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_pass` varchar(255) NOT NULL,
  `admin_image` text NOT NULL,
  `admin_country` text NOT NULL,
  `admin_about` text NOT NULL,
  `admin_contact` varchar(255) NOT NULL,
  `admin_job` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_name`, `admin_email`, `admin_pass`, `admin_image`, `admin_country`, `admin_about`, `admin_contact`, `admin_job`) VALUES
(2, 'Jian', 'admin@gmail.com', 'admin123', 'IMG_20181002_124030.jpg', 'Kenya', 'Experienced full stack web developer . Can develop website using vue js, laravel and python. Aspire to learn machine language and AI using python in 2 years', '0701780411', 'Super Admin');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(255) NOT NULL,
  `qty` int(10) NOT NULL,
  `size` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`p_id`, `ip_add`, `qty`, `size`) VALUES
(14, '::1', 1, 'Small');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(10) NOT NULL,
  `cat_title` text NOT NULL,
  `cat_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`, `cat_desc`) VALUES
(1, ' Cat Men ', 'This Cat Men has been edited by the admin of this website'),
(2, 'Women', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit rem eos illo tempora dicta possimus adipisci doloribus obcaecati odit officiis, sapiente eius excepturi harum voluptates nihil aut quo vero eveniet.'),
(3, 'Kids', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit rem eos illo tempora dicta possimus adipisci doloribus obcaecati odit officiis, sapiente eius excepturi harum voluptates nihil aut quo vero eveniet.'),
(4, 'Other', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit rem eos illo tempora dicta possimus adipisci doloribus obcaecati odit officiis, sapiente eius excepturi harum voluptates nihil aut quo vero eveniet.');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(10) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_pass` varchar(255) NOT NULL,
  `customer_country` text NOT NULL,
  `customer_city` text NOT NULL,
  `customer_contact` varchar(255) NOT NULL,
  `customer_address` text NOT NULL,
  `customer_image` text NOT NULL,
  `customer_ip` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_email`, `customer_pass`, `customer_country`, `customer_city`, `customer_contact`, `customer_address`, `customer_image`, `customer_ip`) VALUES
(5, 'Rianti', 'Riannti@gmail.com', 'rianti123', 'India', 'Calcuta', '8891822', 'Anywhere you want', 'member1.jpg', '::1'),
(6, 'James Bono', 'jamesbono@gmail.com', 'james1123', 'England', 'London', '555-2255-222', 'Hyde Park', 'member2.jpg', '::1'),
(7, 'hosea', 'hozykip59@gmail.com', 'hozy', 'Kenya', 'Nairobi', '0702127533', 'Manyanja road', 'front.jpg', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `customer_orders`
--

CREATE TABLE `customer_orders` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `due_amount` int(100) NOT NULL,
  `invoice_no` int(100) NOT NULL,
  `qty` int(10) NOT NULL,
  `size` text NOT NULL,
  `order_date` date NOT NULL,
  `order_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_orders`
--

INSERT INTO `customer_orders` (`order_id`, `customer_id`, `due_amount`, `invoice_no`, `qty`, `size`, `order_date`, `order_status`) VALUES
(11, 6, 300, 206863956, 1, 'Small', '2019-02-06', 'Complete'),
(12, 6, 10, 206863956, 1, 'Small', '2019-02-06', 'Complete'),
(13, 7, 10, 1686126210, 1, '', '2019-06-09', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(10) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  `payment_mode` text NOT NULL,
  `ref_no` int(10) NOT NULL,
  `code` int(10) NOT NULL,
  `payment_date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `invoice_no`, `amount`, `payment_mode`, `ref_no`, `code`, `payment_date`) VALUES
(6, 206863956, 10, 'Western Union', 123123, 321321, '02-09-2019');

-- --------------------------------------------------------

--
-- Table structure for table `pending_orders`
--

CREATE TABLE `pending_orders` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `product_id` text NOT NULL,
  `qty` int(10) NOT NULL,
  `size` text NOT NULL,
  `order_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pending_orders`
--

INSERT INTO `pending_orders` (`order_id`, `customer_id`, `invoice_no`, `product_id`, `qty`, `size`, `order_status`) VALUES
(9, 6, 206863956, '10', 1, 'Small', 'pending'),
(10, 6, 206863956, '15', 1, 'Small', 'pending'),
(11, 7, 1686126210, '15', 1, '', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(10) NOT NULL,
  `p_cat_id` int(10) NOT NULL,
  `cat_id` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `product_title` text NOT NULL,
  `product_img1` text NOT NULL,
  `product_img2` text NOT NULL,
  `product_img3` text NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_keywords` text NOT NULL,
  `product_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `p_cat_id`, `cat_id`, `date`, `product_title`, `product_img1`, `product_img2`, `product_img3`, `product_price`, `product_keywords`, `product_desc`) VALUES
(16, 3, 3, '2019-06-27 04:15:19', 'Children Snow Boots', '1 Fashion Children Snow Boots Shoes Winter Boots Fashion Kids Shoes Students Sneakers Boot-Black.jpg', '2 Fashion Children Snow Boots Shoes Winter Boots Fashion Kids Shoes Students Sneakers Boot-Black.jpg', '3 Fashion Children Snow Boots Shoes Winter Boots Fashion Kids Shoes Students Sneakers Boot-Black.jpg', 2000, 'Children Snow Boots', '<p>Fashion Children Snow Boots Shoes Winter Boots Fashion Kids Shoes Students Sneakers Boot-Black</p>'),
(17, 2, 2, '2019-06-27 04:19:10', 'Afriashop Necklaces', '1 Fashion Afriashop Necklaces Women Tassel Multilayer Necklace Elegant Chain Jewelry-Gold.jpg', '2 Fashion Afriashop Necklaces Women Tassel Multilayer Necklace Elegant Chain Jewelry-Gold.jpg', '1 Fashion Afriashop Necklaces Women Tassel Multilayer Necklace Elegant Chain Jewelry-Gold.jpg', 578, 'Afriashop Necklaces', '<p>&nbsp;Fashion Afriashop Necklaces Women Tassel Multilayer Necklace Elegant Chain Jewelry-Gold</p>'),
(18, 6, 2, '2019-06-27 04:22:03', 'Casual sport shoes', '3 Fashion Womens Casual sport shoes Athletic Sneakers Running Breathable Mesh walking Flat BLACK.jpg', '1 Fashion Womens Casual sport shoes Athletic Sneakers Running Breathable Mesh walking Flat BLACK.jpg', '1 Fashion Womens Casual sport shoes Athletic Sneakers Running Breathable Mesh walking Flat BLACK.jpg', 2500, 'Casual sport shoes', '<p>Fashion Womens Casual sport shoes Athletic Sneakers Running Breathable Mesh walking Flat BLACK</p>'),
(19, 3, 3, '2019-06-27 04:24:48', 'Baby Girl Flower Leather ', '1 Fashion Baby Girl Flower Leather Fashion Toddler First Walkers Kid Shoes+1PC Hairband.jpg', '2 Fashion Baby Girl Flower Leather Fashion Toddler First Walkers Kid Shoes+1PC Hairband.jpg', '4 Fashion Baby Girl Flower Leather Fashion Toddler First Walkers Kid Shoes+1PC Hairband.jpg', 2345, 'Baby Girl Flower Leather ', '<p>Fashion Baby Girl Flower Leather Fashion Toddler First Walkers Kid Shoes+1PC Hairband</p>'),
(20, 2, 1, '2019-06-27 04:26:49', 'Leather Wallet', '4 Hengsheng Fovibery Men Blocking Short Leather Wallet Card Holder Purse With Coin Pocket.jpg', '3 Hengsheng Fovibery Men Blocking Short Leather Wallet Card Holder Purse With Coin Pocket.jpg', '1 Hengsheng Fovibery Men Blocking Short Leather Wallet Card Holder Purse With Coin Pocket.jpg', 785, 'Leather Wallet', '<p>&nbsp;Hengsheng Fovibery Men Blocking Short Leather Wallet Card Holder Purse With Coin Pocket</p>'),
(21, 2, 4, '2019-06-27 04:28:48', 'Night Driving Glasses ', '1 Fashion Night Driving Glasses Anti Glare Vision Driver Safety Sunglasses goggles.jpg', '2 Fashion Night Driving Glasses Anti Glare Vision Driver Safety Sunglasses goggles.jpg', '3 Fashion Night Driving Glasses Anti Glare Vision Driver Safety Sunglasses goggles.jpg', 756, 'Night Driving Glasses ', '<p>Fashion Night Driving Glasses Anti Glare Vision Driver Safety Sunglasses goggles</p>'),
(22, 2, 1, '2019-06-27 04:30:34', 'Ankle Socks ', '1 Fashion Men Boys Simple Ankle Socks Summer Breathable Toddler Low Cut Sweat.jpg', '1 Fashion Men Boys Simple Ankle Socks Summer Breathable Toddler Low Cut Sweat.jpg', '1 Fashion Men Boys Simple Ankle Socks Summer Breathable Toddler Low Cut Sweat.jpg', 125, 'Ankle Socks ', '<p>&nbsp;Fashion Men Boys Simple Ankle Socks Summer Breathable Toddler Low Cut Sweat</p>'),
(23, 2, 1, '2019-06-27 04:40:52', 'Knee-Length Shorts', '1 Fashion Linen Mens Summer Loose Knee-Length Shorts Drawstring Solid Color Mid Rise Shorts.jpg', '1 Fashion Linen Mens Summer Loose Knee-Length Shorts Drawstring Solid Color Mid Rise Shorts.jpg', '1 Fashion Linen Mens Summer Loose Knee-Length Shorts Drawstring Solid Color Mid Rise Shorts.jpg', 342, 'Knee-Length Shorts', '<p>&nbsp;Fashion Linen Mens Summer Loose Knee-Length Shorts Drawstring Solid Color Mid Rise Shorts</p>'),
(24, 4, 2, '2019-06-27 04:42:53', 'Hoodie', '1 Fashion Vogue Black Hoodie.jpg', '1 Fashion Vogue Black Hoodie.jpg', '1 Fashion Vogue Black Hoodie.jpg', 879, 'Hoodie', '<p>Fashion Vogue Black Hoodie</p>'),
(25, 4, 4, '2019-06-27 04:46:32', 'Sports Coats', '1 Generic Coloured Horse Print Men and Women Sports Coats.jpg', '1 Generic Coloured Horse Print Men and Women Sports Coats.jpg', '1 Generic Coloured Horse Print Men and Women Sports Coats.jpg', 1200, 'Sports Coats', '<p>&nbsp;Generic Coloured Horse Print Men and Women Sports Coats</p>'),
(26, 2, 1, '2019-06-27 04:47:28', 'Silver Chain', '1 Eissely Fashion Women Heart Crystal Rhinestone Silver Chain Pendant Necklace Jewelry H.jpg', '1 Eissely Fashion Women Heart Crystal Rhinestone Silver Chain Pendant Necklace Jewelry H.jpg', '1 Eissely Fashion Women Heart Crystal Rhinestone Silver Chain Pendant Necklace Jewelry H.jpg', 1590, 'Silver Chain', '<p>Eissely Fashion Women Heart Crystal Rhinestone Silver Chain Pendant Necklace Jewelry H</p>'),
(27, 3, 3, '2019-06-27 04:48:33', 'Sneaker Child Girls', '1 Eissely bluerdream-Baby Fashion Sneaker Child Girls Bow Casual Single Leather Pricness Shoes- Pink.jpg', '3 Eissely bluerdream-Baby Fashion Sneaker Child Girls Bow Casual Single Leather Pricness Shoes- Pink.jpg', '4 Eissely bluerdream-Baby Fashion Sneaker Child Girls Bow Casual Single Leather Pricness Shoes- Pink.jpg', 2454, 'Sneaker Child Girls', '<p>&nbsp;Eissely bluerdream-Baby Fashion Sneaker Child Girls Bow Casual Single Leather Pricness Shoes- Pink</p>');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `p_cat_id` int(10) NOT NULL,
  `p_cat_title` text NOT NULL,
  `p_cat_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`p_cat_id`, `p_cat_title`, `p_cat_desc`) VALUES
(1, ' Jackets Kulit', 'Tes Change description for product category Jackets'),
(2, 'Accessories', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit rem eos illo tempora dicta possimus adipisci doloribus obcaecati odit officiis, sapiente eius excepturi harum voluptates nihil aut quo vero eveniet.'),
(3, 'Shoes', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit rem eos illo tempora dicta possimus adipisci doloribus obcaecati odit officiis, sapiente eius excepturi harum voluptates nihil aut quo vero eveniet.'),
(4, 'Rain Coats ', 'This description is for the product category Rain Coats lol ^_^'),
(5, 'T-Shirt', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit rem eos illo tempora dicta possimus adipisci doloribus obcaecati odit officiis, sapiente eius excepturi harum voluptates nihil aut quo vero eveniet.'),
(6, 'Sport Shoes', 'Outdoor Athletic sport shoes'),
(7, 'Shirts', 'Short sleeved '),
(8, 'Sneakers', 'Outdoor Shoes for party');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `slide_id` int(10) NOT NULL,
  `slide_name` varchar(255) NOT NULL,
  `slide_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`slide_id`, `slide_name`, `slide_image`) VALUES
(8, 'Slide Number 6', 'slide-6.jpg'),
(9, 'Slide Number 7', 'slide-7.jpg'),
(10, 'Editing Slide Number 8', 'slide-5.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customer_orders`
--
ALTER TABLE `customer_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `pending_orders`
--
ALTER TABLE `pending_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`p_cat_id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`slide_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_orders`
--
ALTER TABLE `customer_orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pending_orders`
--
ALTER TABLE `pending_orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `p_cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `slide_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
