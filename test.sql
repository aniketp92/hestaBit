-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2021 at 12:13 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `register_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:auto;1:link;2:code',
  `points` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email_id`, `register_type`, `points`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 'Aniket', 'anikt@gmail.com', 0, 5, '2021-01-26 08:12:00', '2021-01-26 10:10:39', 0),
(2, 'Vivek', 'vivek@gmail.com', 1, 0, '2021-01-26 08:12:29', '2021-01-26 09:51:26', 0),
(3, 'Mathur', 'mathur@gmail.com', 2, 0, '2021-01-26 08:12:45', '2021-01-26 09:51:11', 0),
(4, 'Sanjay', 'sanjay@gmail.com', 2, 0, '2021-01-26 08:12:45', '2021-01-26 09:51:11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_invitation`
--

CREATE TABLE `user_invitation` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `registered_user_id` int(11) NOT NULL DEFAULT 0,
  `invite_link` text NOT NULL,
  `invite_code` text NOT NULL,
  `invite_link_expiry` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_deleted` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_invitation`
--

INSERT INTO `user_invitation` (`id`, `user_id`, `registered_user_id`, `invite_link`, `invite_code`, `invite_link_expiry`, `created_at`, `is_deleted`) VALUES
(1, 1, 2, 'some_link', '', '2021-01-26 14:54:25', '2021-01-26 08:14:17', 0),
(2, 1, 3, '', 'abcd', '2021-01-26 14:54:25', '2021-01-26 08:14:17', 0),
(3, 3, 4, '', 'abcd', '2021-01-26 14:54:25', '2021-01-26 08:14:17', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_invitation`
--
ALTER TABLE `user_invitation`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
