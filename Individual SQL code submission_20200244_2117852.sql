-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2021 at 04:40 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `acl`
--

-- --------------------------------------------------------

--
-- Table structure for table `acedemic_journal`
--

CREATE TABLE `acedemic_journal` (
  `ISSN` int(6) NOT NULL,
  `subsription_cost` decimal(6,2) NOT NULL,
  `year_of_creation` date DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `publisher_name` varchar(25) NOT NULL,
  `publication_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `acedemic_journal`
--

INSERT INTO `acedemic_journal` (`ISSN`, `subsription_cost`, `year_of_creation`, `description`, `publisher_name`, `publication_name`) VALUES
(28197, '4000.00', '2001-05-29', 'They do not cover original research but instead accumulate results of multiple articles about the state of the art in the said field.', '\"Fyodor Dostoevsky\"', '\" A TIME TO KILL \"'),
(28231, '3000.00', '2009-07-23', 'The short descriptions of important latest study or research findings which are usually considered urgent for immediate publication', '\"Ernest Hemingway\"', '\"The Devil Wears Prada \"'),
(28258, '2500.00', '2008-11-02', 'These mostly consist of large-volume tabular data that details all the results of current research.', '\"Agatha Christie\"', '\"Catcher in the Rye\"'),
(28539, '1500.00', '2013-04-11', 'These are the short descriptions which are considered less urgent compared to Letters.', '\"Barbara Cartland\"', '\"The Wisdom\"'),
(28742, '5000.00', '2006-06-30', 'These are usually around 5-20 pages and are complete descriptions of current original research findings.', '\"Franz Kafka\"', '\"Don Quixote\"');

-- --------------------------------------------------------

--
-- Table structure for table `ace_journal_article`
--

CREATE TABLE `ace_journal_article` (
  `ISSN` int(6) NOT NULL,
  `issue_of_journal` date DEFAULT NULL,
  `volume` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ace_journal_article`
--

INSERT INTO `ace_journal_article` (`ISSN`, `issue_of_journal`, `volume`) VALUES
(28197, '2007-11-11', 55),
(28231, '2007-12-12', 72),
(28258, '2015-08-17', 15),
(28539, '2004-02-20', 41),
(28742, '2000-01-19', 25);

-- --------------------------------------------------------

--
-- Table structure for table `acl_user`
--

CREATE TABLE `acl_user` (
  `User_ID` int(6) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `name` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `acl_user`
--

INSERT INTO `acl_user` (`User_ID`, `address`, `name`) VALUES
(111, '711-2880 Nulla St.Mankato Mississippi 96522', 'Amal Perera'),
(112, 'P.O. Box 283 8562 Fusce Rd.Frederick Nebraska 20620', 'Iris Watson'),
(113, '606-3727 Ullamcorper.Street Roseville NH 11523', 'Theodore Low'),
(114, 'Ap #867-859 Sit Rd.Azusa New York 39531', 'Emmily Rose'),
(115, '7292 Dictum Av.San Antonio MI 47096711-2880 Nulla St.Mankato Mississippi 96522', 'Sadun Perera');

-- --------------------------------------------------------

--
-- Table structure for table `acl_user_book`
--

CREATE TABLE `acl_user_book` (
  `User_ID` int(5) NOT NULL,
  `ISBN` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `acl_user_book`
--

INSERT INTO `acl_user_book` (`User_ID`, `ISBN`) VALUES
(111, 13089),
(112, 13226),
(113, 13087),
(114, 13528),
(115, 13916),

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `DOI` int(5) NOT NULL,
  `ISSN` int(5) NOT NULL,
  `abstract` varchar(50) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`DOI`, `ISSN`, `abstract`, `title`) VALUES
(10011, 28231, 'This briefing sets the stage for COP26 from the pe', 'Resetting climate negotiations'),
(10012, 28539, 'The international efforts to address the climate c', 'The impacts of COVID-19'),
(10013, 28742, 'Climate change has global impacts, but hits poor a', 'climate change'),
(10014, 28258, 'Global climate resilience is a matter of life and ', 'Diversification for climate resilience'),
(10015, 28197, 'In Uganda, many people illegally hunt, traffic or ', 'Improving community attitudes');

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `DOI` int(5) NOT NULL,
  `author` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`DOI`, `author`) VALUES
(10011, 'William Shakespeare'),
(10012, 'William Faulkner'),
(10013, 'Henry James'),
(10014, 'Jane Austen'),
(10015, 'Charles Dickens');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `ISBN` int(5) NOT NULL,
  `User_ID` int(5) NOT NULL,
  `edition` varchar(12) NOT NULL,
  `year_of_publication` date DEFAULT NULL,
  `title` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`ISBN`, `User_ID`, `edition`, `year_of_publication`, `title`) VALUES
(13087, 113, '1st edition', '2000-04-26', 'ABSALOM, ABSALOM!'),
(13089, 111, '1st edition', '2000-08-27', 'THE HOUSE OF MIRTH'),
(13226, 112, '2nd edition', '1998-04-16', 'A TIME TO KILL'),
(13528, 114, '3rd edition', '2009-07-23', 'EAST OF EDEN'),
(13916, 115, '1st edition', '2014-02-18', 'THE SUN ALSO RISES');

-- --------------------------------------------------------

--
-- Table structure for table `book_copy`
--

CREATE TABLE `book_copy` (
  `copy_number` int(6) NOT NULL,
  `ISBN` int(5) NOT NULL,
  `User_ID` int(5) NOT NULL,
  `no_of_copies` int(100) NOT NULL,
  `orderDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book_copy`
--

INSERT INTO `book_copy` (`copy_number`, `ISBN`, `User_ID`, `no_of_copies`, `orderDate`) VALUES
(12908, 13089, 111, 6, '2000-03-26'),
(13642, 13528, 114, 4, '1999-01-08'),
(13785, 13226, 112, 5, '2001-08-17'),
(18245, 13916, 115, 8, '2002-02-25'),
(19345, 13087, 113, 2, '2005-11-13');

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

CREATE TABLE `librarian` (
  `librarian_ID` int(5) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `librarian`
--

INSERT INTO `librarian` (`librarian_ID`, `first_name`, `last_name`) VALUES
(11, 'Ann', 'Fernando'),
(12, 'William', 'Fernando'),
(13, 'Sandushke', 'De Alwis'),
(14, 'Chryshall', 'Fonseka'),
(15, 'Imaya', 'Perera');

-- --------------------------------------------------------

--
-- Table structure for table `lib_contact`
--

CREATE TABLE `lib_contact` (
  `librarian_ID` int(5) NOT NULL,
  `contact_number` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lib_contact`
--

INSERT INTO `lib_contact` (`librarian_ID`, `contact_number`) VALUES
(11, '719586384'),
(12, '779862355'),
(13, '777234698'),
(14, '712647983'),
(15, '713698357');

-- --------------------------------------------------------

--
-- Table structure for table `places_orders`
--

CREATE TABLE `places_orders` (
  `librarian_ID` int(6) NOT NULL,
  `ISBN` int(6) NOT NULL,
  `copy_number` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `places_orders`
--

INSERT INTO `places_orders` (`librarian_ID`, `ISBN`, `copy_number`) VALUES
(11, 13089, 12908),
(12, 13226, 13785),
(13, 13087, 19345),
(14, 13528, 13642),
(15, 13916, 18245);

-- --------------------------------------------------------

--
-- Table structure for table `publication`
--

CREATE TABLE `publication` (
  `publication_ID` int(6) NOT NULL,
  `publication_type` varchar(15) NOT NULL,
  `published_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `publication`
--

INSERT INTO `publication` (`publication_ID`, `publication_type`, `published_date`) VALUES
(49223, 'journal', '1998-04-26'),
(49453, 'journal', '1999-03-21'),
(49712, 'journal', '1995-01-31'),
(49836, 'acedemic_book', '2005-10-14'),
(49896, 'acedemic_book', '2003-05-05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acedemic_journal`
--
ALTER TABLE `acedemic_journal`
  ADD PRIMARY KEY (`ISSN`);

--
-- Indexes for table `ace_journal_article`
--
ALTER TABLE `ace_journal_article`
  ADD PRIMARY KEY (`ISSN`);

--
-- Indexes for table `acl_user`
--
ALTER TABLE `acl_user`
  ADD PRIMARY KEY (`User_ID`);

--
-- Indexes for table `acl_user_book`
--
ALTER TABLE `acl_user_book`
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `ISBN` (`ISBN`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`DOI`),
  ADD KEY `ISSN` (`ISSN`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`DOI`,`author`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `book_copy`
--
ALTER TABLE `book_copy`
  ADD PRIMARY KEY (`copy_number`),
  ADD KEY `ISBN` (`ISBN`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `librarian`
--
ALTER TABLE `librarian`
  ADD PRIMARY KEY (`librarian_ID`);

--
-- Indexes for table `lib_contact`
--
ALTER TABLE `lib_contact`
  ADD PRIMARY KEY (`librarian_ID`,`contact_number`);

--
-- Indexes for table `places_orders`
--
ALTER TABLE `places_orders`
  ADD KEY `librarian_ID` (`librarian_ID`),
  ADD KEY `ISBN` (`ISBN`),
  ADD KEY `copy_number` (`copy_number`);

--
-- Indexes for table `publication`
--
ALTER TABLE `publication`
  ADD PRIMARY KEY (`publication_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acl_user_book`
--
ALTER TABLE `acl_user_book`
  ADD CONSTRAINT `acl_user_book_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `acl_user` (`User_ID`),
  ADD CONSTRAINT `acl_user_book_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`);

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`ISSN`) REFERENCES `acedemic_journal` (`ISSN`);

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `acl_user` (`User_ID`);

--
-- Constraints for table `book_copy`
--
ALTER TABLE `book_copy`
  ADD CONSTRAINT `book_copy_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `book_copy_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `acl_user` (`User_ID`);

--
-- Constraints for table `places_orders`
--
ALTER TABLE `places_orders`
  ADD CONSTRAINT `places_orders_ibfk_1` FOREIGN KEY (`librarian_ID`) REFERENCES `librarian` (`librarian_ID`),
  ADD CONSTRAINT `places_orders_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `places_orders_ibfk_3` FOREIGN KEY (`copy_number`) REFERENCES `book_copy` (`copy_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
