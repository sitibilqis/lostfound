-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2024 at 10:42 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_lostfound`
--

-- --------------------------------------------------------

--
-- Table structure for table `found_items`
--

CREATE TABLE `found_items` (
  `found_id` int(11) NOT NULL,
  `itempic` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `datefound` date NOT NULL,
  `itemdesc` varchar(150) NOT NULL,
  `itemcat` varchar(100) NOT NULL,
  `contact` int(15) NOT NULL,
  `itemloc` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `found_items`
--

INSERT INTO `found_items` (`found_id`, `itempic`, `name`, `datefound`, `itemdesc`, `itemcat`, `contact`, `itemloc`) VALUES
(2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAy057JPZrtmuB62oo_taw6dWLbPu5g6PqaQ&s\r\n', 'Airpods 3', '2024-06-03', 'Airpods 3 berwarna putih, hilang yang kanan', 'Personal Item', 8123512, 'Di Lab A5'),
(4, 'https://www.kucari.com/wp-content/uploads/2022/03/Laptop-Asus-A516MA-N40204GB256GB-SSD.jpeg.webp', 'Laptop Asus ', '0000-00-00', 'Laptop Asus berwarna abu-abu tipe A516MA', 'Personal Item ', 4322355, 'Lab');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `fullname` text NOT NULL,
  `email` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `fullname`, `email`, `username`, `password`) VALUES
(15, 'nanamirdad', 'nana@gmail.com', 'nanaa', '12345'),
(18, 'niki', 'niki@gmail.com', 'nikii', 'zefanya'),
(20, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `lost`
--

CREATE TABLE `lost` (
  `lost_id` int(10) NOT NULL,
  `name` varchar(155) NOT NULL,
  `datelost` date NOT NULL,
  `itemdesc` text NOT NULL,
  `itempic` text NOT NULL,
  `itemcat` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `itemloc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lost`
--

INSERT INTO `lost` (`lost_id`, `name`, `datelost`, `itemdesc`, `itempic`, `itemcat`, `contact`, `itemloc`) VALUES
(5, 'Tupperware', '2024-09-08', 'Tupperwares Aquasafe water bottles with capacity of 1.5 litres', 'https://cdn.karaca.com/image/cdndata/185/202208/153.03.08.3455/8683650087953-1.jpg', 'Personal items', '+628998876654', 'TULT'),
(12, 'Perfume', '2023-09-10', '250ml of Joyeux Eau de Perfume with clear bottle and silver cap.', 'https://recreationbeauty.com/cdn/shop/articles/Joyeux_2.jpg?v=1676155552', 'Personal Items', '08978685642', 'Danau Galau');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `found_items`
--
ALTER TABLE `found_items`
  ADD PRIMARY KEY (`found_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lost`
--
ALTER TABLE `lost`
  ADD PRIMARY KEY (`lost_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `found_items`
--
ALTER TABLE `found_items`
  MODIFY `found_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `lost`
--
ALTER TABLE `lost`
  MODIFY `lost_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
