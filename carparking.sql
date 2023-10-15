-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 15, 2023 at 06:47 PM
-- Server version: 10.5.20-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id21366942_carparking`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `carno` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `username`, `password`, `email`, `phone`, `carno`) VALUES
(123414, 'akshita', 'akshita', 'akshitabansal24@gmai', '7340892226', 'PB08BD7338'),
(161634, 'doli', 'dolidoli', 'doli@gmail.com', '8888541021', 'PB07HU4150'),
(204016, 'rohan', 'hello', 'roro@gmail.com', '2154873690', 'CH01GB1234');

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `otp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `otp`
--

INSERT INTO `otp` (`otp`) VALUES
(73733);

-- --------------------------------------------------------

--
-- Table structure for table `spaces`
--

CREATE TABLE `spaces` (
  `space_id` int(11) NOT NULL,
  `is_available` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `latitude` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `spaces`
--

INSERT INTO `spaces` (`space_id`, `is_available`, `floor`, `tag`, `longitude`, `latitude`) VALUES
(1, 0, 1, 'A3', '75.536730', '31.394673'),
(2, 0, 1, 'B3', '75.538730', '31.395673'),
(3, 1, 2, 'A3', '75.546730', '31.394673'),
(4, 0, 3, 'C5', '75.536720', '31.393673'),
(5, 0, -1, 'D4', '75.536430', '31.397673'),
(6, 0, 0, 'B4', '75.536430', '31.397673'),
(7, 1, 0, 'F4', '75.533526', '31.395737'),
(8, 1, 1, 'C6', '75.532872', '31.398320'),
(9, 1, 1, 'A1', '75.536430', '31.397673'),
(10, 1, 2, 'D6', '75.536430', '31.397673');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `space_id` int(11) NOT NULL,
  `carno` varchar(15) NOT NULL,
  `entry_time` datetime NOT NULL,
  `exit_time` datetime DEFAULT NULL,
  `total_fare` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `customer_id`, `space_id`, `carno`, `entry_time`, `exit_time`, `total_fare`) VALUES
(1240, 123414, 2, 'PB08BD7338', '2023-10-02 20:32:16', '2023-10-02 20:32:31', 100),
(1241, 123414, 3, 'PB08BD7338', '2023-10-07 22:57:00', '2023-10-07 23:05:20', 100),
(1253, 123414, 3, 'PB08BD7338', '2023-10-15 01:01:41', '2023-10-15 01:04:56', 30),
(1254, 123414, 3, 'PB08BD7338', '2023-10-15 23:54:22', '2023-10-15 23:55:01', 0),
(1255, 123414, 3, 'PB08BD7338', '2023-10-16 00:02:42', '2023-10-16 00:03:01', 5),
(1256, 204016, 3, 'CH01GB1234', '2023-10-16 00:05:26', '2023-10-16 00:05:42', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spaces`
--
ALTER TABLE `spaces`
  ADD PRIMARY KEY (`space_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `space_id` (`space_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1257;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`space_id`) REFERENCES `spaces` (`space_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
