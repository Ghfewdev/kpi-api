-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 06, 2023 at 04:26 AM
-- Server version: 8.1.0
-- PHP Version: 7.4.3-4ubuntu2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sbpkpi01`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail`
--

CREATE TABLE `detail` (
  `de_id` int NOT NULL,
  `fm_id` int NOT NULL,
  `de_qur` char(1) COLLATE utf8mb4_general_ci NOT NULL,
  `de_paras` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `de_ans` float NOT NULL,
  `de_result` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail`
--

INSERT INTO `detail` (`de_id`, `fm_id`, `de_qur`, `de_paras`, `de_ans`, `de_result`) VALUES
(1, 2, '1', '21, 10, 16, 19', 90.4762, 'ผ่าน'),
(2, 2, '1', '8, 3, 4, 7', 87.5, 'ไม่ผ่าน'),
(3, 2, '2', '88, 15, 96, 85', 96.5909, 'ผ่าน'),
(4, 2, '3', '70, 69, 66, 67', 95.7143, 'ผ่าน'),
(5, 2, '4', '90, 81, 85, 85', 94.4444, 'ผ่าน');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `ev_id` int NOT NULL,
  `de_id` int NOT NULL,
  `fms_id` int NOT NULL,
  `ev_name` text NOT NULL,
  `ev_res` text NOT NULL,
  `ev_status` text NOT NULL,
  `ev_budget` text NOT NULL,
  `ev_buded` text NOT NULL,
  `ev_point` text NOT NULL,
  `ev_target` text NOT NULL,
  `ev_result` text NOT NULL,
  `ev_problem` text NOT NULL,
  `ev_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`ev_id`, `de_id`, `fms_id`, `ev_name`, `ev_res`, `ev_status`, `ev_budget`, `ev_buded`, `ev_point`, `ev_target`, `ev_result`, `ev_problem`, `ev_img`) VALUES
(1, 1, 4, 'asfasfqwgqwg', 'sagasgrhrftjftjftjk', 'กำลังดำเนินการ', '0, 0, 90', '0, 0, 70', 'เป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมาย', 'เป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมาย', 'เป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมาย', 'เป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมายเป้าหมาย', '{}'),
(2, 2, 7, 'ชื่อโครงการ / กิจกรรมชื่อโครงการ / กิจกรรม', 'daw', 'กำลังดำเนินการ', '0, 0, 80', '0, 0, 60', 'วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', 'วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', 'วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', 'วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', '{}'),
(3, 3, 10, 'asfasfqwgqwg', 'daw', 'ชะลอ', '0, 1111, 0', '0, 1000, 0', '268วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', 'วัตถุประสงค์vวัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', 'วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', 'วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', '{}'),
(4, 4, 11, 'ชื่อโครงการ / กิจกรรมชื่อโครงการ / กิจกรรม', 'ชื่อโครงการ / กิจกรรม', 'ยังไม่ดำเนินการ', '15, 0, 0', '14, 0, 0', 'วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', 'วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', 'วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', 'วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', '{}'),
(5, 5, 15, 'ชื่อโครงการ / กิจกรรมชื่อโครงการ / กิจกรรม', 'ชื่อโครงการ / กิจกรรม', 'แล้วเสร็จ', '200, 0, 0', '190, 0, 0', 'วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', 'วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', 'วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', 'วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', '{}');

-- --------------------------------------------------------

--
-- Table structure for table `form`
--

CREATE TABLE `form` (
  `fm_id` int NOT NULL,
  `fm_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fm_solve` text COLLATE utf8mb4_general_ci NOT NULL,
  `fm_method` text COLLATE utf8mb4_general_ci NOT NULL,
  `fm_define` text COLLATE utf8mb4_general_ci NOT NULL,
  `fm_paras` text COLLATE utf8mb4_general_ci NOT NULL,
  `fm_numpara` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `form`
--

INSERT INTO `form` (`fm_id`, `fm_name`, `fm_solve`, `fm_method`, `fm_define`, `fm_paras`, `fm_numpara`) VALUES
(2, 'ชื่อตัวชี้วัด:  1', 'ร้อยละ 89', 'ร้อยละ', 'นิยามของตัวชี้วัด:  นิยามของตัวชี้วัด:  นิยามของตัวชี้วัด:  นิยามของตัวชี้วัด:  นิยามของตัวชี้วัด:  นิยามของตัวชี้วัด:  นิยามของตัวชี้วัด:  นิยามของตัวชี้วัด:  นิยามของตัวชี้วัด:  นิยามของตัวชี้วัด:  นิยามของตัวชี้วัด:  นิยามของตัวชี้วัด:  นิยามของตัวชี้วัด:  นิยามของตัวชี้วัด:  ', 'ค่าการประเมินที่ 1 *, ค่าการประเมินที่ 2, ค่าการประเมินที่ 3, ค่าการประเมินที่ 4*', 4);

-- --------------------------------------------------------

--
-- Table structure for table `formed`
--

CREATE TABLE `formed` (
  `fd_id` int NOT NULL,
  `us_id` int NOT NULL,
  `de_id` int NOT NULL,
  `fd_date` date NOT NULL,
  `fd_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `formed`
--

INSERT INTO `formed` (`fd_id`, `us_id`, `de_id`, `fd_date`, `fd_time`) VALUES
(2, 11, 1, '2023-09-04', '16:35:27'),
(4, 10, 2, '2023-09-05', '11:19:36'),
(6, 11, 3, '2023-09-05', '11:22:48'),
(8, 11, 4, '2023-09-05', '11:25:26'),
(10, 11, 5, '2023-09-05', '11:26:51');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `re_id` int NOT NULL,
  `fm_id` int NOT NULL,
  `h1` float DEFAULT '0',
  `h2` float DEFAULT '0',
  `h3` float DEFAULT '0',
  `h4` float DEFAULT '0',
  `h5` float DEFAULT '0',
  `h6` float DEFAULT '0',
  `h7` float DEFAULT '0',
  `h8` float DEFAULT '0',
  `h9` float DEFAULT '0',
  `h10` float DEFAULT '0',
  `h11` float DEFAULT '0',
  `pa1` int DEFAULT '0',
  `pa2` int DEFAULT '0',
  `re_sum` float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`re_id`, `fm_id`, `h1`, `h2`, `h3`, `h4`, `h5`, `h6`, `h7`, `h8`, `h9`, `h10`, `h11`, `pa1`, `pa2`, `re_sum`) VALUES
(1, 2, 87.5, 94.4444, 0, 0, 0, 0, 0, 0, 0, 0, 0, 269, 256, 97.01);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `us_id` int NOT NULL,
  `us_email` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `us_password` text COLLATE utf8mb4_general_ci NOT NULL,
  `us_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `us_agency` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `us_level` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`us_id`, `us_email`, `us_password`, `us_name`, `us_agency`, `us_level`) VALUES
(10, 'klang@gmail.con', '$2b$10$TniWjT1398nfNe6Ew4lTNe6yh130Ewadwg62diy8/2CIkYrUNb.mm', 'klang', 'รพ.กลาง', 0),
(11, 'taksin@gmail.con', '$2b$10$eEwJWlQ9Sh8o9D7dnkzq6.Svv7O1UBIKP8FexGq.0mf.dNTaGgZ5q', 'taksin', 'รพ.ตากสิน', 0),
(12, 'jalean@gmail.con', '$2b$10$MH4yrunHu/FFGIq5.X3VRemKs4l2eWvjbsLVzASDCXb5HD5nSu2LS', 'jalean', 'รพ.เจริญกรุงประชารัก', 0),
(13, 'ruangp@gmail.con', '$2b$10$cVY657Eb90jHDxwlqJg.h.giauj6YsnioZcUwvHCKA7eLCNuE4BDW', 'ruangp', 'รพ.หลวงพ่อทวีศักดิ์', 0),
(14, 'wecha@gmail.con', '$2b$10$sazZMKKDW5SAzg3GGWCPIeNZ6IRdecyGpQnQ6lb4m58QRFaFb.E36', 'wecha', 'รพ.เวชการุณย์รัศมิ์', 0),
(15, 'ladka@gmail.con', '$2b$10$Sqt.zE9sX2pwK7xFOLx9Ru.buaWaJy3pwXzpcBL.V8H6WQDcgKF0W', 'ladka', 'รพ.ลาดกระบัง', 0),
(16, 'raadp@gmail.con', '$2b$10$r1apCpWzVcvfnyofQ4s.g.eR2jX/V7pTcyAeMbnhSVAmZtyC3TzMe', 'raadp', 'รพ.ราชพิพัฒน์', 0),
(17, 'sirint@gmail.con', '$2b$10$bwcz/5/WDrUeTmvJpnjBY.yfa5sg9/9KkG6RxqglllrFqJrdG.CEW', 'sirint', 'รพ.สิรินธร', 0),
(18, 'bangkt@gmail.con', '$2b$10$6w3kqSXpYe4at.Iefhol8.VzIo94tK43zdgAgZ2dM7gVsGXWRuJ1a', 'bangkt', 'รพ.ผู้สูงอายุบางขุนเทียน', 0),
(19, 'krongz@gmail.con', '$2b$10$wmTOBVUMtlT9JFoSqzBlX.ptEQOEHrfVj/Svb4f9bh/lTdJSUuroO', 'krongz', 'รพ.คลองสามวา', 0),
(20, 'bangnaa@gmail.con', '$2b$10$FhC/5.w8D8fxlC9NOko8guXz.9c7QdMuFhra8pH6FrlpU27ny7cnm', 'bangnaa', 'รพ.บางนา', 0),
(21, 'sg@gmail.com', '$2b$10$KaGLLqbLoTsR7H4O1XoBHe2RzckwCKJBOLMIMHAJtMqFqzymY6VjW', 'sg', 'สก.', 0),
(22, 'sbc@gmail.com', '$2b$10$drtUOO.lhlKBFVAgED9mMOVJ/5PtuRq79fAQAPTyTj/nLJmHNfFwe', 'sbc', 'ศบฉ.', 0),
(23, 'sbp@gmail.con', '$2b$10$bb.ar1nO4BAfqDA103J0euAfh3hUT3wPGDR/.WKps6XnS6b5NaAh2', 'sbp', 'สพบ.', 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail`
--
ALTER TABLE `detail`
  ADD PRIMARY KEY (`de_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`ev_id`);

--
-- Indexes for table `form`
--
ALTER TABLE `form`
  ADD PRIMARY KEY (`fm_id`);

--
-- Indexes for table `formed`
--
ALTER TABLE `formed`
  ADD PRIMARY KEY (`fd_id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`re_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`us_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail`
--
ALTER TABLE `detail`
  MODIFY `de_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `ev_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `formed`
--
ALTER TABLE `formed`
  MODIFY `fd_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `re_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `us_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
