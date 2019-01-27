-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2017 at 02:43 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zoostore_fx_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `CCNumber` varchar(16) DEFAULT NULL,
  `Balance` double DEFAULT '50'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `UserName`, `Email`, `Password`, `CCNumber`, `Balance`) VALUES
(1, 'stefanek', 'stefan12@gmail.com', '123456', '1596384569125478', 100);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `Quantity` tinyint(4) DEFAULT '1',
  `ProductID` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `Quantity`, `ProductID`, `CustomerID`) VALUES
(1, 1, 11, 1),
(2, 1, 9, 1),
(3, 1, 3, 1),
(4, 1, 4, 1),
(5, 1, 10, 2),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `Price` double(5,2) DEFAULT NULL,
  `Description` text,
  `Video` varchar(45) DEFAULT NULL,
  `Promotion` enum('-25%','-50%','brak') DEFAULT NULL,
  `Cover` varchar(55) DEFAULT NULL,
  `Image1` varchar(55) DEFAULT NULL,
  `Image2` varchar(55) DEFAULT NULL,
  `Image3` varchar(55) DEFAULT NULL,
  `Image4` varchar(55) DEFAULT NULL,
  `ExeFile` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `Title`, `Price`, `Description`, `Video`, `Promotion`, `Cover`, `Image1`, `Image2`, `Image3`, `Image4`, `ExeFile`) VALUES
(1, 'Gryzak dla szczeniąt', 7.00, 'Gryzak przeznaczony szczególnie dla młodych pupilów.', 'https://www.youtube.com/watch?v=dHd2ayuOU7o', '-50%', '/resources/images/covers/gryzak.jpg', '/resources/images/gryzak1.jpg', '/resources/images/gryzak2.jpg', '/resources/images/gryzak3.jpg', '/resources/images/gryzak4.jpg', 'https://www.youtube.com/watch?v=dHd2ayuOU7o'),
(2, 'Karma dla kota', 5.00, 'Karma dla kota - drobiowa', 'https://www.youtube.com/watch?v=f2ChH3G-O_s', 'brak', '/resources/images/covers/karma_drob.jpg', '/resources/images/karmad1.jpg', '/resources/images/karmad2.jpg', '/resources/images/karmad3.jpg', '/resources/images/karmad4.jpg', 'https://www.youtube.com/watch?v=f2ChH3G-O_s'),
(3, 'Karma dla psa', 6.00, 'Karma dla psa - wołowa', 'https://www.youtube.com/watch?v=jiCahk-00cI', 'brak', '/resources/images/covers/karma_p.jpg', '/resources/images/karma_p1.jpg', '/resources/images/karma_p2.jpg', '/resources/images/karma_p3.jpg', '/resources/images/karma_p4.jpg', 'https://www.youtube.com/watch?v=jiCahk-00cI'),
(4, 'Szelki i smycz dla kota', 4.00, 'Szelki i smycz do wyprowadzania kota na spacer', 'https://www.youtube.com/watch?v=DqFwcxq18N0', '-25%', '/resources/images/covers/kot_szel.jpg', '/resources/images/kotszel1.jpg', '/resources/images/kotszel2.jpg', '/resources/images/kotszel3.jpg', '/resources/images/kotszel4.jpg', 'https://www.youtube.com/watch?v=DqFwcxq18N0'),
(5, 'Szelki i smycz dla psa', 8.00, 'Szelki i smycz do wyprowadzania psa na spacer', 'https://www.youtube.com/watch?v=c-U6VuyBQCA', 'brak', '/resources/images/covers/piesszel.jpg', '/resources/images/piesszel1.jpg', '/resources/images/piesszel2.jpg', '/resources/images/piesszel3.jpg', '/resources/images/piesszel4.jpg', 'https://www.youtube.com/watch?v=c-U6VuyBQCA'),
(6, 'Kaganiec', 12.00, 'Kaganiec dla psów', 'https://www.youtube.com/watch?v=6n-ml2D8gjs', 'brak', '/resources/images/covers/kaganiec.jpg', '/resources/images/kaganiec1.jpg', '/resources/images/kaganiec2.jpg', '/resources/images/kaganiec3.jpg', '/resources/images/kaganiec4.jpg', 'https://www.youtube.com/watch?v=6n-ml2D8gjs'),
(7, 'Obcinarka do pazurów', 3.50, 'Obcinarka do pazurów', 'https://www.youtube.com/watch?v=cQkj7EGwKxM', '-25%', '/resources/images/covers/obcinarka.jpg', '/resources/images/obcinarka1.jpg', '/resources/images/obcinarka2.jpg', '/resources/images/obcinarka3.jpg', '/resources/images/obcinarka4.jpg', 'https://www.youtube.com/watch?v=cQkj7EGwKxM'),
(8, 'Świńskie ucho', 9.00, 'Przysmak każdego pupila - świńskie ucho', 'https://www.youtube.com/watch?v=RRX9104_k34', 'brak', '/resources/images/covers/ucho.jpg', '/resources/images/ucho1.jpg', '/resources/images/ucho2.jpg', '/resources/images/ucho3.jpg', '/resources/images/ucho4.jpg', 'https://www.youtube.com/watch?v=RRX9104_k34'),
(9, 'Drapak duży', 11.00, 'Legowisko dla kota - duże', 'https://www.youtube.com/watch?v=TM8mMuuIHrw', 'brak', '/resources/images/covers/drapak.jpg', '/resources/images/drapak1.jpg', '/resources/images/drapak2.jpg', '/resources/images/drapak3.jpg', '/resources/images/drapak4.jpg', 'https://www.youtube.com/watch?v=TM8mMuuIHrw'),
(10, 'Drapak mały', 7.00, 'Legowisko dla kota - małe', 'https://www.youtube.com/watch?v=TM8mMuuIHrw', 'brak', '/resources/images/covers/drapakm.jpg', '/resources/images/drapakm1.jpg', '/resources/images/drapakm2.jpg', '/resources/images/drapakm3.jpg', '/resources/images/drapakm4.jpg', 'https://www.youtube.com/watch?v=TM8mMuuIHrw'),
(11, 'Miski metalowe', 9.00, 'Miski dla psa lub kota', 'https://www.youtube.com/watch?v=k0QhnMJnJE0', '-50%', '/resources/images/covers/metal_m.jpg', '/resources/images/metal_m1.jpg', '/resources/images/metal_m2.jpg', '/resources/images/metal_m3.jpg', '/resources/images/metal_m3.jp4', 'https://www.youtube.com/watch?v=k0QhnMJnJE0'),
(12, 'Miski plastikowe', 5.50, 'Miski dla psa lub kota', 'https://www.youtube.com/watch?v=k0QhnMJnJE0', 'brak', '/resources/images/covers/miski_p.jpg', '/resources/images/miski_p1.jpg', '/resources/images/miski_p2.jpg', '/resources/images/miski_p3.jpg', '/resources/images/miski_p4.jpg', 'https://www.youtube.com/watch?v=k0QhnMJnJE0'),
(13, 'Obroża dla psa', 8.50, 'Obroża dla psów', 'https://www.youtube.com/watch?v=X2xEwc-xqQo', 'brak', '/resources/images/covers/obroza.jpg', '/resources/images/obroza1.jpg', '/resources/images/obroza2.jpg', '/resources/images/obroza3.jpg', '/resources/images/obroza4.jpg', 'https://www.youtube.com/watch?v=X2xEwc-xqQo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
