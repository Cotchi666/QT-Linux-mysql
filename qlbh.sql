-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 09, 2022 at 07:13 AM
-- Server version: 5.5.68-MariaDB
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qlbh`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`%` FUNCTION `no_of_years`(date1 date) RETURNS int(11)
    DETERMINISTIC
BEGIN
 DECLARE date2 DATE;
  Select current_date()into date2;
  RETURN year(date2)-year(date1);
END$$

CREATE DEFINER=`root`@`%` FUNCTION `tongTien`(`maHD` INT) RETURNS float
BEGIN 
declare tongtien FLOAT;
 SELECT   SUM(SANPHAM.GIA * CTHD.SL) into tongtien FROM SANPHAM JOIN CTHD ON SANPHAM.MASP = CTHD.MASP AND CTHD.SOHD = maHD;
 RETURN tongtien;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `CTHD`
--

CREATE TABLE IF NOT EXISTS `CTHD` (
  `SOHD` int(11) NOT NULL DEFAULT '0',
  `MASP` char(4) NOT NULL DEFAULT '',
  `SL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CTHD`
--

INSERT INTO `CTHD` (`SOHD`, `MASP`, `SL`) VALUES
(1001, 'BB01', 8),
(1001, 'BB02', 2),
(1001, 'BC01', 5),
(1001, 'BC02', 10),
(1001, 'ST01', 5),
(1001, 'ST08', 10),
(1001, 'TV02', 10),
(1002, 'BB01', 20),
(1002, 'BB02', 20),
(1002, 'BC04', 20),
(1003, 'BB03', 10),
(1004, 'TV01', 20),
(1004, 'TV02', 10),
(1004, 'TV03', 10),
(1004, 'TV04', 10),
(1005, 'TV05', 50),
(1005, 'TV06', 50),
(1006, 'ST01', 30),
(1006, 'ST02', 10),
(1006, 'TV07', 20),
(1007, 'ST03', 10),
(1008, 'ST04', 8),
(1009, 'ST05', 10),
(1010, 'ST04', 50),
(1010, 'ST07', 50),
(1010, 'ST08', 100),
(1010, 'TV03', 100),
(1010, 'TV07', 50),
(1011, 'ST06', 50),
(1012, 'ST07', 3),
(1013, 'ST08', 5),
(1014, 'BB01', 50),
(1014, 'BB02', 100),
(1014, 'BC02', 80),
(1014, 'BC04', 60),
(1015, 'BB02', 30),
(1015, 'BB03', 7),
(1016, 'TV01', 5),
(1017, 'TV02', 1),
(1017, 'TV03', 1),
(1017, 'TV04', 5),
(1018, 'ST04', 6),
(1019, 'ST05', 1),
(1019, 'ST06', 2),
(1020, 'ST07', 10),
(1021, 'ST08', 5),
(1021, 'TV01', 7),
(1021, 'TV02', 10),
(1022, 'ST07', 1),
(1023, 'ST04', 6);

-- --------------------------------------------------------

--
-- Table structure for table `HOADON`
--

CREATE TABLE IF NOT EXISTS `HOADON` (
  `SOHD` int(11) NOT NULL,
  `NGHD` date DEFAULT NULL,
  `MAKH` char(4) DEFAULT NULL,
  `MANV` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `HOADON`
--

INSERT INTO `HOADON` (`SOHD`, `NGHD`, `MAKH`, `MANV`) VALUES
(1001, '2006-07-23', 'KH01', 'NV01'),
(1002, '2006-08-12', 'KH01', 'NV02'),
(1003, '2006-08-23', 'KH02', 'NV01'),
(1004, '2006-08-01', 'KH02', 'NV01'),
(1005, '2006-10-20', 'KH01', 'NV02'),
(1006, '2006-10-16', 'KH01', 'NV03'),
(1007, '2006-10-28', 'KH03', 'NV03'),
(1008, '2006-10-13', 'KH01', 'NV03'),
(1009, '2006-10-28', 'KH03', 'NV04'),
(1010, '2006-11-01', 'KH01', 'NV01'),
(1011, '2006-11-04', 'KH04', 'NV03'),
(1012, '0000-00-00', 'KH05', 'NV03'),
(1013, '2006-12-12', 'KH06', 'NV01'),
(1014, '2006-12-31', 'KH03', 'NV02'),
(1015, '2007-01-01', 'KH06', 'NV01'),
(1016, '2007-01-01', 'KH07', 'NV02'),
(1017, '0000-00-00', 'KH08', 'NV03'),
(1018, '2007-01-13', 'KH08', 'NV03'),
(1019, '2007-01-13', 'KH01', 'NV03'),
(1020, '2007-01-14', 'KH09', 'NV04'),
(1021, '2007-01-16', 'KH10', 'NV03'),
(1022, '2007-01-16', NULL, 'NV03'),
(1023, '2007-01-17', NULL, 'NV01'),
(1024, '2007-01-01', 'KH11', 'NV03'),
(1025, '2006-07-23', 'KH01', 'NV01'),
(1026, '2006-07-23', 'KH01', 'NV01'),
(1027, '2006-07-23', 'KH01', 'NV01');

-- --------------------------------------------------------

--
-- Table structure for table `KHACHHANG`
--

CREATE TABLE IF NOT EXISTS `KHACHHANG` (
  `MAKH` char(4) NOT NULL,
  `HOTEN` varchar(40) DEFAULT NULL,
  `DCHI` varchar(50) DEFAULT NULL,
  `SODT` varchar(20) DEFAULT NULL,
  `NGSINH` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `KHACHHANG`
--

INSERT INTO `KHACHHANG` (`MAKH`, `HOTEN`, `DCHI`, `SODT`, `NGSINH`) VALUES
('KH01', 'Nguyen Van A', '731 Tran Hung Dao, Q5, TpHCM', '8823451', '1960-10-12'),
('KH02', 'Tran Ngoc Han', '23/5 Nguyen Trai, Q5, TpHCM', '908256478', '1974-04-03'),
('KH03', 'Tran Ngoc Linh', '45 Nguyen Canh Chan, Q1, TpHCM', '938776266', '1980-06-12'),
('KH04', 'Tran Minh Long', '50/34 Le Dai Hanh, Q10, TpHCM', '917325476', '1965-12-09'),
('KH05', 'Le Nhat Minh', '34 Truong Dinh, Q3, TpHCM', '8246108', '1984-12-31'),
('KH06', 'Le Hoai Thuong', '227 Nguyen Van Cu, Q5, TpHCM', '8631738', '1981-08-13'),
('KH07', 'Nguyen Van Tam', '32/3 Tran Binh Trong, Q5, TpHCM', '916783565', '1971-04-06'),
('KH08', 'Phan Thi Thanh', '45/2 An Duong Vuong, Q5, TpHCM', '938435756', '1971-01-10'),
('KH09', 'Le Ha Vinh', '873 Le Hong Phong, Q5, TpHCM', '8654763', '1979-09-03'),
('KH10', 'Ha Duy Lap', '34/34B Nguyen Trai, Q1, TpHCM', '8768904', '1983-05-02'),
('KH11', 'Ha Duy Lap', '8768904', '8768904', '1983-05-02');

-- --------------------------------------------------------

--
-- Table structure for table `NHANVIEN`
--

CREATE TABLE IF NOT EXISTS `NHANVIEN` (
  `MANV` char(4) NOT NULL,
  `HOTEN` varchar(40) DEFAULT NULL,
  `SODT` varchar(20) DEFAULT NULL,
  `NGVL` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `NHANVIEN`
--

INSERT INTO `NHANVIEN` (`MANV`, `HOTEN`, `SODT`, `NGVL`) VALUES
('NV01', 'Nguyen Nhat Truong', '927345679', '2006-04-13'),
('NV02', 'Le Thi Phi Yen', '987567390', '2006-04-21'),
('NV03', 'Nguyen Van B', '997047382', '2006-04-23'),
('NV04', 'Ngo Thanh Tuan', '913758498', '2006-04-29'),
('NV05', 'Nguyen Thi Truc Thanh', '918590387', '2006-07-21'),
('NV06', 'Le Thi Phi Yen', '987567390', '2006-04-21');

-- --------------------------------------------------------

--
-- Table structure for table `SANPHAM`
--

CREATE TABLE IF NOT EXISTS `SANPHAM` (
  `MASP` char(4) NOT NULL,
  `TENSP` varchar(40) NOT NULL,
  `DVT` varchar(20) NOT NULL,
  `NUOCSX` varchar(40) NOT NULL,
  `GIA` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SANPHAM`
--

INSERT INTO `SANPHAM` (`MASP`, `TENSP`, `DVT`, `NUOCSX`, `GIA`) VALUES
('BB01', 'But bi', 'cay', 'Viet Nam', 5000),
('BB02', 'But bi', 'cay', 'Trung Quoc', 7000),
('BB03', 'But bi', 'hop', 'Thai Lan', 100000),
('BC01', 'But chi', 'cay', 'Singapore', 3000),
('BC02', 'But chi', 'cay', 'Singapore', 5000),
('BC03', 'But chi', 'cay', 'Viet Nam', 3500),
('BC04', 'But chi', 'hop', 'Viet Nam', 30000),
('ST01', 'So tay 500 trang', 'quyen', 'Trung Quoc', 40000),
('ST02', 'So tay loai 1', 'quyen', 'Viet Nam', 55000),
('ST03', 'So tay loai 2', 'quyen', 'Viet Nam', 51000),
('ST04', 'So tay', 'quyen', 'Thai Lan', 55000),
('ST05', 'So tay mong', 'quyen', 'Thai Lan', 20000),
('ST06', 'Phan viet bang', 'hop', 'Viet Nam', 5000),
('ST07', 'Phan khong bui', 'hop', 'Viet Nam', 7000),
('ST08', 'Bong bang', 'cai', 'Viet Nam', 1000),
('ST09', 'But long', 'cay', 'Viet Nam', 5000),
('ST10', 'But long', 'cay', 'Trung Quoc', 7000),
('TV01', 'Tap 100 giay mong', 'quyen', 'Trung Quoc', 2500),
('TV02', 'Tap 200 giay mong', 'quyen', 'Trung Quoc', 4500),
('TV03', 'Tap 100 giay tot', 'quyen', 'Viet Nam', 3000),
('TV04', 'Tap 200 giay tot', 'quyen', 'Viet Nam', 5500),
('TV05', 'Tap 100 trang', 'chuc', 'Viet Nam', 23000),
('TV06', 'Tap 200 trang', 'chuc', 'Viet Nam', 53000),
('TV07', 'Tap 100 trang', 'chuc', 'Trung Quoc', 34000);

-- --------------------------------------------------------

--
-- Stand-in structure for view `table_cthd`
--
CREATE TABLE IF NOT EXISTS `table_cthd` (
`SOHD` int(11)
,`MASP` char(4)
,`SL` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `table_cthd`
--
DROP TABLE IF EXISTS `table_cthd`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `table_cthd` AS select `CTHD`.`SOHD` AS `SOHD`,`CTHD`.`MASP` AS `MASP`,`CTHD`.`SL` AS `SL` from `CTHD`;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CTHD`
--
ALTER TABLE `CTHD`
  ADD PRIMARY KEY (`SOHD`,`MASP`),
  ADD KEY `fk02_CTHD` (`MASP`);

--
-- Indexes for table `HOADON`
--
ALTER TABLE `HOADON`
  ADD PRIMARY KEY (`SOHD`),
  ADD KEY `fk01_HD` (`MAKH`),
  ADD KEY `fk02_HD` (`MANV`);

--
-- Indexes for table `KHACHHANG`
--
ALTER TABLE `KHACHHANG`
  ADD PRIMARY KEY (`MAKH`);

--
-- Indexes for table `NHANVIEN`
--
ALTER TABLE `NHANVIEN`
  ADD PRIMARY KEY (`MANV`);

--
-- Indexes for table `SANPHAM`
--
ALTER TABLE `SANPHAM`
  ADD PRIMARY KEY (`MASP`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `CTHD`
--
ALTER TABLE `CTHD`
  ADD CONSTRAINT `fk01_CTHD` FOREIGN KEY (`SOHD`) REFERENCES `HOADON` (`SOHD`),
  ADD CONSTRAINT `fk02_CTHD` FOREIGN KEY (`MASP`) REFERENCES `SANPHAM` (`MASP`);

--
-- Constraints for table `HOADON`
--
ALTER TABLE `HOADON`
  ADD CONSTRAINT `fk01_HD` FOREIGN KEY (`MAKH`) REFERENCES `KHACHHANG` (`MAKH`),
  ADD CONSTRAINT `fk02_HD` FOREIGN KEY (`MANV`) REFERENCES `NHANVIEN` (`MANV`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
