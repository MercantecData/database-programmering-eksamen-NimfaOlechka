-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2018 at 12:42 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `databaseexam`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminusers`
--

CREATE TABLE `adminusers` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminusers`
--

INSERT INTO `adminusers` (`id`, `username`, `password`, `created`, `modified`) VALUES
(1, 'admin', 'admin', '2018-02-14 12:39:54', '2018-02-14 12:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `imageURL` varchar(255) NOT NULL,
  `owner` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `imageURL`, `owner`, `created`, `modified`) VALUES
(1, 'https://imgix.ranker.com/user_node_img/50047/1000931305/original/x-wing-photo-u1?w=650&q=50&fm=jpg&fit=crop&crop=faces', 1, '2018-02-14 12:40:30', '2018-02-14 12:40:30'),
(2, 'https://imgix.ranker.com/user_node_img/50047/1000931279/original/millennium-falcon-photo-u1?w=650&q=50&fm=jpg&fit=crop&crop=faces', 1, '2018-02-14 12:40:30', '2018-02-14 12:40:30'),
(3, 'https://imgix.ranker.com/user_node_img/50047/1000931306/original/vader-and-39-s-tie-fighter-photo-u1?w=650&q=50&fm=jpg&fit=crop&crop=faces', 1, '2018-02-14 12:40:30', '2018-02-14 12:40:30'),
(4, 'https://imgix.ranker.com/user_node_img/50047/1000931297/original/star-destroyer-photo-u1?w=650&q=50&fm=jpg&fit=crop&crop=faces', 1, '2018-02-14 12:40:30', '2018-02-14 12:40:30'),
(5, 'https://imgix.ranker.com/user_node_img/50047/1000931296/original/slave-i-photo-u1?w=650&q=60&fm=jpg&fit=crop&crop=faces', 1, '2018-02-14 12:40:30', '2018-02-14 12:40:30'),
(6, 'http://static.tvtropes.org/pmwiki/pub/images/friendship_is_magic_newpageimage_1684.png', 2, '2018-02-14 12:40:30', '2018-02-14 12:40:30'),
(7, 'https://vignette.wikia.nocookie.net/mugen/images/1/13/Fluttershy_artwork.png/revision/latest?cb=20130311003323', 2, '2018-02-14 12:40:30', '2018-02-14 12:40:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `created`, `modified`) VALUES
(1, 'kyloren', 'darth4ever', 'Ben Solo', '2018-02-14 12:39:20', '2018-02-14 12:39:20'),
(2, 'fShy34', 'friendshipism4gic', 'Fluttershy', '2018-02-14 12:39:20', '2018-02-14 12:39:20'),
(3, 'testID', 'test123', 'test', '2018-02-14 12:39:20', '2018-02-14 12:39:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminusers`
--
ALTER TABLE `adminusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign key` (`owner`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminusers`
--
ALTER TABLE `adminusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `foreign key` FOREIGN KEY (`owner`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
