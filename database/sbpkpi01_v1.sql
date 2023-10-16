-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 29, 2023 at 08:51 AM
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
(59, 13, '1', '28, 13, 41, 23, 14, 37', 90.24, 'ผ่าน'),
(60, 13, '2', '36, 16, 52, 31, 17, 48', 92.3077, 'ผ่าน'),
(61, 13, '3', '36, 16, 55, 31, 17, 49', 89.0909, 'ผ่าน'),
(62, 13, '1', '33, 9, 42, 30, 7, 36', 85.7143, 'ไม่ผ่าน'),
(63, 13, '2', '26, 14, 40, 24, 12, 36', 90, 'ผ่าน'),
(64, 13, '3', '20, 4, 24, 16, 3, 21', 87.5, 'ไม่ผ่าน'),
(65, 13, '4', '15, 19, 34, 16, 19, 35', 97.1429, 'ผ่าน'),
(66, 13, '4', '13, 20, 33, 16, 18, 34', 97.0588, 'ผ่าน'),
(67, 2, '2', '7, 8, 6, 7', 87.5, 'ไม่ผ่าน'),
(69, 13, '3', '6, 3, 9, 7, 4, 11', 81.8182, 'ไม่ผ่าน'),
(71, 13, '4', '12, 11, 23, 15, 14, 29', 79.3103, 'ไม่ผ่าน');

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
(7, 70, 4, 'ชื่อโครงการ / กิจกรรม', 'ผู้รับผิดชอบ', 'แล้วเสร็จ', '23, 0, 0', '11, 0, 0', 'วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', 'วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', 'วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', 'วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', '{}'),
(8, 72, 4, 'ชื่อโครงการ / กิจกรรม', 'ผู้รับผิดชอบ', 'ยังไม่ดำเนินการ', '15, 0, 0', '6, 0, 0', 'วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', 'วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', 'วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', 'วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์วัตถุประสงค์', '{}'),
(9, 72, 4, 'ชื่อโครงการ / กิจกรรม', 'ผู้รับผิดชอบ', 'ยังไม่ดำเนินการ', '11, 0, 0', '8, 0, 0', 'http://localhost:3000http://localhost:3000http://localhost:3000http://localhost:3000', 'http://localhost:3000http://localhost:3000http://localhost:3000http://localhost:3000', 'http://localhost:3000http://localhost:3000http://localhost:3000http://localhost:3000', 'http://localhost:3000http://localhost:3000http://localhost:3000http://localhost:3000', '{}'),
(10, 74, 3, 'ชื่อโครงการ / กิจกรรม', 'ผู้รับผิดชอบ', 'แล้วเสร็จ', '28, 0, 0', '28, 0, 0', 'http://localhost:3000http://localhost:3000http://localhost:3000', 'http://localhost:3000http://localhost:3000http://localhost:3000', 'http://localhost:3000http://localhost:3000', 'http://localhost:3000http://localhost:3000', '{}'),
(11, 75, 5, 'ชื่อโครงการ / กิจกรรม', 'ผู้รับผิดชอบ', 'แล้วเสร็จ', '0, 10, 0', '0, 1, 0', 'http://localhost:3000http://localhost:3000http://localhost:3000http://localhost:3000http://localhost:3000http://localhost:3000http://localhost:3000', 'http://localhost:3000http://localhost:3000http://localhost:3000http://localhost:3000http://localhost:3000', 'http://localhost:3000http://localhost:3000http://localhost:3000http://localhost:3000http://localhost:3000', 'http://localhost:3000http://localhost:3000http://localhost:3000http://localhost:3000http://localhost:3000http://localhost:3000', '{}'),
(12, 75, 4, 'ชื่อโครงการ / กิจกรรม', 'ผู้รับผิดชอบ', 'แล้วเสร็จ', '100, 0, 0', '10, 0, 0', 'วัตถุประสงค์', 'วัตถุประสงค์', 'วัตถุประสงค์', 'วัตถุประสงค์', '{}');

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
(1, 'ชื่อตัวชี้วัด2', 'ร้อยละ 90', 'ร้อยละ', 'ชื่อตัวชี้วัด2ชื่อตัวชี้วัด2ชื่อตัวชี้วัด2ชื่อตัวชี้วัด2ชื่อตัวชี้วัด2ชื่อตัวชี้วัด2ชื่อตัวชี้วัด2ชื่อตัวชี้วัด2', '', 0),
(2, 'ทดสอบแก้ 1', 'ร้อยละ 92', 'ร้อยละ', 'ทดสอบแก้ 1ทดสอบแก้ 1ทดสอบแก้ 1ทดสอบแก้ 1ทดสอบแก้ 1ทดสอบแก้ 1', 'ค่าการประเมินที่ 1 , ค่าการประเมินที่ 2*, ค่าการประเมินที่ 3, ค่าการประเมินที่ 4*', 4),
(13, 'อัตราความสำเร็จของการรักษา  วัณโรคปอดรายใหม่ (ผลลัพธ์)', 'ร้อยละ 88', 'ร้อยละ', '1 ความสำเร็จของการรักษา หมายถึง ผู้ป่วยวัณโรคปอดรายใหม่ที่มีผลการรักษาหายรวมกับรักษาครบ \n       1.1 รักษาหาย (Cured) หมายถึง ผู้ป่วยวัณโรคปอดรายใหม่ที่มีผลตรวจทางห้องปฏิบัติการพบเชื้อวัณโรคก่อนเริ่มการรักษา และต่อมาตรวจไม่พบเชื้อวัณโรคอย่างน้อยหนึ่งครั้งก่อนสิ้นสุดการรักษา และในเดือนสุดท้ายของการรักษา\n1.2 รักษาครบ (Treatment Completed) หมายถึง ผู้ป่วยวัณโรคปอดรายใหม่ที่รักษาครบกำหนดโดยไม่มีหลักฐานที่แสดงว่าการรักษาล้มเหลว ซึ่งผู้ป่วยดังกล่าวไม่มีเอกสารที่แสดงผลการตรวจเสมหะในเดือนสุดท้ายของการรักษา ทั้งนี้มีผลตรวจเสมหะเป็นลบอย่างน้อยหนึ่งครั้งก่อนสิ้นสุดการรักษา รวมทั้งผู้ป่วยที่ไม่ได้ตรวจหรือไม่มีผลตรวจ\n2 ผู้ป่วยวัณโรคปอดรายใหม่ หมายถึง ผู้ป่วย     วัณโรคปอดที่ไม่เคยรักษาวัณโรคมาก่อนและผู้ป่วยที่รักษาวัณโรคน้อยกว่า 1 เดือน และไม่เคยขึ้นทะเบียนในแผนงานวัณโรคแห่งชาติ แบ่งเป็น 2 กลุ่ม คือ\n2.1 ผู้ป่วยที่มีผลตรวจยืนยันพบเชื้อวัณโรค (Bacteriologically confirmed: B+) หมายถึง ผู้ป่วยวัณโรคที่มีผลตรวจเสมหะเป็นบวก อาจจะเป็นการตรวจด้วยวิธี Smear microscopy หรือ Culture หรือวิธี Molecular หรือวิธีการอื่นๆ ที่องค์การอนามัยโลกรับรอง \n2.2 ผู้ป่วยที่วินิจฉัยด้วยลักษณะทางคลินิก (Clinically diagnosed: B-) หมายถึง ผู้ป่วยวัณโรคที่มีผลตรวจเสมหะเป็นลบ หรือไม่มีผลตรวจ แต่ผลการวินิจฉัยด้วยวิธีการตรวจเอกซเรย์รังสีทรวงอกหรือผลการตรวจชิ้นเนื้อผิดปกติเข้าได้กับวัณโรค ร่วมกับมีลักษณะทางคลินิกเข้าได้กับวัณโรค และแพทย์ตัดสินใจรักษาด้วยสูตรยารักษาวัณโรค\n', 'ผลตรวจยืนยัน พบเชื้อ (B+)  (ราย), วินิจฉัยด้วยลักษณะทางคลินิก (B-)  (ราย), ผลรวมผู้ป่วยรายใหม่*, ผลการรักษาหาย (Cure Rate)  (ราย), ผลการรักษาครบ (Complete Rate) (ราย, ผลความสำเร็จของการรักษา (Cure+Complete) (ราย)*', 6);

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
(62, 16, 59, '2023-08-08', '17:24:24'),
(63, 16, 60, '2023-08-08', '17:25:37'),
(64, 16, 61, '2023-08-08', '17:26:31'),
(65, 10, 62, '2023-08-08', '17:29:20'),
(66, 10, 63, '2023-08-08', '17:30:01'),
(67, 10, 64, '2023-08-08', '17:30:29'),
(68, 11, 65, '2023-08-16', '15:49:36'),
(69, 20, 66, '2023-08-16', '16:00:14'),
(70, 11, 67, '2023-08-17', '11:11:37'),
(72, 17, 69, '2023-08-25', '16:03:23'),
(74, 10, 71, '2023-08-25', '17:08:51');

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
(7, 13, 80.9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40, 39, 80.25);

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
  MODIFY `de_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `ev_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `formed`
--
ALTER TABLE `formed`
  MODIFY `fd_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `re_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `us_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
