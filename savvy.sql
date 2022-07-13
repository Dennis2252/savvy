-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2022 at 02:44 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `savvy`
--

-- --------------------------------------------------------

--
-- Table structure for table `goal`
--

CREATE TABLE `goal` (
  `goal_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `goal_name` varchar(255) DEFAULT NULL,
  `goal_nominal` int(11) DEFAULT NULL,
  `is_completed` tinyint(1) DEFAULT NULL,
  `goal_date_start` date DEFAULT NULL,
  `goal_date_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `goal`
--

INSERT INTO `goal` (`goal_id`, `user_id`, `goal_name`, `goal_nominal`, `is_completed`, `goal_date_start`, `goal_date_end`) VALUES
(4, 2, 'Beli Laptop', 25000000, 0, '2022-06-10', '2022-11-30'),
(7, 1, 'Beli kuda', 20000000, 1, '2022-06-11', '2022-06-24'),
(10, 1, 'Beli Motor', 26000000, 0, '2022-06-11', '2022-06-30'),
(13, 5, 'Beli Motor', 2000000, 0, '2022-06-13', '2022-06-30'),
(14, 5, 'dwadaw', 25000000, 0, '2022-06-13', '2024-12-13'),
(16, 6, 'Beli samsung s22 ', 14000000, 0, '2022-06-14', '2023-01-14'),
(17, 7, 'Beli hp samsung s22', 13000000, 0, '2022-06-14', '2023-01-14');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL,
  `goal_id` int(11) DEFAULT NULL,
  `transaction_nominal` int(11) DEFAULT NULL,
  `transaction_type` varchar(255) DEFAULT NULL,
  `transaction_category` varchar(255) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `transaction_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `goal_id`, `transaction_nominal`, `transaction_type`, `transaction_category`, `transaction_date`, `transaction_description`) VALUES
(16, 7, 20000000, 'income', 'salary', '2022-06-11', 'Dapet thr 20 jt'),
(19, 10, 1000000, 'income', 'investation', '2022-06-11', 'wad dawdaw ad awdaw da dw'),
(20, 10, 2000000, 'expense', 'food and drink', '2022-06-11', 'DWd awd awdaw daw daw daw da'),
(24, 13, 1000000, 'income', 'salary', '2022-06-13', 'wada dawd awd awdaw da '),
(26, 16, 1000000, 'expense', 'food and drink', '2022-06-14', 'Makan traktir teman'),
(28, 17, 5000000, 'income', 'salary', '2022-06-14', 'lagi gajian bulan juni'),
(29, 17, 7000000, 'income', 'salary', '2022-06-14', 'dawd awda dadad ad a');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_email`, `user_password`) VALUES
(1, 'paulusricky4@gmail.com', 'user1234'),
(2, 'wilson123@gmail.com', 'user123'),
(3, 'dennis123@gmail.com', 'user29'),
(4, 'ivan123@gmail.com', 'user123'),
(5, 'juandreas@gmail.com', 'user123'),
(6, 'user123@gmail.com', 'user123'),
(7, 'ricky29@gmail.com', 'user123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `goal`
--
ALTER TABLE `goal`
  ADD PRIMARY KEY (`goal_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `goal_id` (`goal_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `goal`
--
ALTER TABLE `goal`
  MODIFY `goal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `goal`
--
ALTER TABLE `goal`
  ADD CONSTRAINT `goal_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`goal_id`) REFERENCES `goal` (`goal_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
