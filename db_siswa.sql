-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2024 at 12:55 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_siswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_webcam`
--

CREATE TABLE `data_webcam` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nomor_induk` varchar(50) NOT NULL,
  `webcam_stream` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_webcam`
--

INSERT INTO `data_webcam` (`id`, `nama`, `nomor_induk`, `webcam_stream`, `created_at`) VALUES
(18, '3', 'r54', 'http://192.168.0.17:5000/video_feed', '2024-11-24 05:04:30'),
(19, 'peh', '47563', 'http://127.0.0.1:5000/video_feed', '2024-11-24 09:29:23'),
(22, 'mamat', '3454', 'http://192.168.1.1:5000/video_feed', '2024-11-24 11:48:39');

-- --------------------------------------------------------

--
-- Table structure for table `violations`
--

CREATE TABLE `violations` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `nomor_induk_siswa` varchar(50) DEFAULT NULL,
  `waktu` time DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `violations`
--

INSERT INTO `violations` (`id`, `nama`, `nomor_induk_siswa`, `waktu`, `file_path`) VALUES
(101, 'prehh', '34874', '13:49:09', 'uploads\\violation_2024-11-24T06-49-01-401Z.jpg'),
(102, 'prehh', '34874', '13:49:11', 'uploads\\violation_2024-11-24T06-49-03-891Z.jpg'),
(103, 'prehh', '34874', '13:49:14', 'uploads\\violation_2024-11-24T06-49-05-218Z.jpg'),
(104, 'prehh', '34874', '13:49:19', 'uploads\\violation_2024-11-24T06-49-09-982Z.jpg'),
(105, 'prehh', '34874', '13:49:46', 'uploads\\violation_2024-11-24T06-49-36-696Z.jpg'),
(106, 'prehh', '34874', '13:50:58', 'uploads\\violation_2024-11-24T06-50-49-150Z.jpg'),
(107, 'prehh', '34874', '13:50:59', 'uploads\\violation_2024-11-24T06-50-50-398Z.jpg'),
(108, 'prehh', '34874', '13:51:00', 'uploads\\violation_2024-11-24T06-50-51-655Z.jpg'),
(109, 'prehh', '34874', '13:51:04', 'uploads\\violation_2024-11-24T06-50-55-461Z.jpg'),
(110, 'prehh', '34874', '13:52:02', 'uploads\\violation_2024-11-24T06-51-53-297Z.jpg'),
(111, 'prehh', '34874', '13:52:03', 'uploads\\violation_2024-11-24T06-51-54-490Z.jpg'),
(112, 'sentolop', '846584', '18:36:19', 'uploads\\violation_2024-11-24T11-36-10-584Z.jpg'),
(113, 'sentolop', '846584', '18:36:21', 'uploads\\violation_2024-11-24T11-36-11-886Z.jpg'),
(114, 'sentolop', '846584', '18:36:24', 'uploads\\violation_2024-11-24T11-36-15-399Z.jpg'),
(115, 'sentolop', '846584', '18:36:26', 'uploads\\violation_2024-11-24T11-36-16-728Z.jpg'),
(116, 'sentolop', '846584', '18:36:27', 'uploads\\violation_2024-11-24T11-36-17-976Z.jpg'),
(117, 'sentolop', '846584', '18:36:28', 'uploads\\violation_2024-11-24T11-36-19-287Z.jpg'),
(118, 'sentolop', '846584', '18:36:29', 'uploads\\violation_2024-11-24T11-36-20-836Z.jpg'),
(119, 'sentolop', '846584', '18:36:32', 'uploads\\violation_2024-11-24T11-36-22-699Z.jpg'),
(120, 'sentolop', '846584', '18:36:33', 'uploads\\violation_2024-11-24T11-36-24-030Z.jpg'),
(121, 'sentolop', '846584', '18:36:35', 'uploads\\violation_2024-11-24T11-36-27-607Z.jpg'),
(122, 'sentolop', '846584', '18:36:43', 'uploads\\violation_2024-11-24T11-36-33-908Z.jpg'),
(123, 'sentolop', '846584', '18:36:44', 'uploads\\violation_2024-11-24T11-36-35-129Z.jpg'),
(124, 'sentolop', '846584', '18:36:45', 'uploads\\violation_2024-11-24T11-36-36-387Z.jpg'),
(125, 'sentolop', '846584', '18:36:46', 'uploads\\violation_2024-11-24T11-36-37-660Z.jpg'),
(126, 'sentolop', '846584', '18:36:48', 'uploads\\violation_2024-11-24T11-36-38-948Z.jpg'),
(127, 'sentolop', '846584', '18:36:49', 'uploads\\violation_2024-11-24T11-36-40-221Z.jpg'),
(128, 'sentolop', '846584', '18:36:50', 'uploads\\violation_2024-11-24T11-36-41-462Z.jpg'),
(129, 'sentolop', '846584', '18:36:52', 'uploads\\violation_2024-11-24T11-36-42-878Z.jpg'),
(130, 'sentolop', '846584', '18:36:53', 'uploads\\violation_2024-11-24T11-36-44-170Z.jpg'),
(131, 'sentolop', '846584', '18:36:54', 'uploads\\violation_2024-11-24T11-36-45-516Z.jpg'),
(132, 'sentolop', '846584', '18:36:56', 'uploads\\violation_2024-11-24T11-36-46-828Z.jpg'),
(133, 'sentolop', '846584', '18:36:57', 'uploads\\violation_2024-11-24T11-36-48-220Z.jpg'),
(134, 'sentolop', '846584', '18:36:59', 'uploads\\violation_2024-11-24T11-36-49-867Z.jpg'),
(135, 'sentolop', '846584', '18:37:00', 'uploads\\violation_2024-11-24T11-36-51-152Z.jpg'),
(136, 'sentolop', '846584', '18:37:01', 'uploads\\violation_2024-11-24T11-36-52-502Z.jpg'),
(137, 'sentolop', '846584', '18:37:03', 'uploads\\violation_2024-11-24T11-36-53-814Z.jpg'),
(138, 'sentolop', '846584', '18:37:04', 'uploads\\violation_2024-11-24T11-36-55-061Z.jpg'),
(139, 'sentolop', '846584', '18:37:05', 'uploads\\violation_2024-11-24T11-36-56-364Z.jpg'),
(140, 'sentolop', '846584', '18:37:06', 'uploads\\violation_2024-11-24T11-36-57-653Z.jpg'),
(141, 'sentolop', '846584', '18:37:08', 'uploads\\violation_2024-11-24T11-36-58-972Z.jpg'),
(142, 'sentolop', '846584', '18:37:09', 'uploads\\violation_2024-11-24T11-37-00-299Z.jpg'),
(143, 'sentolop', '846584', '18:37:10', 'uploads\\violation_2024-11-24T11-37-01-580Z.jpg'),
(144, 'sentolop', '846584', '18:37:12', 'uploads\\violation_2024-11-24T11-37-02-929Z.jpg'),
(145, 'sentolop', '846584', '18:37:13', 'uploads\\violation_2024-11-24T11-37-04-168Z.jpg'),
(146, 'sentolop', '846584', '18:37:14', 'uploads\\violation_2024-11-24T11-37-04-916Z.jpg'),
(147, 'sentolop', '846584', '18:37:14', 'uploads\\violation_2024-11-24T11-37-05-588Z.jpg'),
(148, 'sentolop', '846584', '18:37:15', 'uploads\\violation_2024-11-24T11-37-06-285Z.jpg'),
(149, 'sentolop', '846584', '18:37:16', 'uploads\\violation_2024-11-24T11-37-06-958Z.jpg'),
(150, 'sentolop', '846584', '18:37:17', 'uploads\\violation_2024-11-24T11-37-07-682Z.jpg'),
(151, 'sentolop', '846584', '18:37:18', 'uploads\\violation_2024-11-24T11-37-09-378Z.jpg'),
(152, 'sentolop', '846584', '18:37:19', 'uploads\\violation_2024-11-24T11-37-09-900Z.jpg'),
(153, 'sentolop', '846584', '18:37:20', 'uploads\\violation_2024-11-24T11-37-11-430Z.jpg'),
(154, 'sentolop', '846584', '18:37:20', 'uploads\\violation_2024-11-24T11-37-11-469Z.jpg'),
(155, 'jaka', '83734', '18:49:17', 'uploads\\violation_2024-11-24T11-49-08-115Z.jpg'),
(156, 'jaka', '83734', '18:49:18', 'uploads\\violation_2024-11-24T11-49-09-552Z.jpg'),
(157, 'jaka', '83734', '18:49:29', 'uploads\\violation_2024-11-24T11-49-19-759Z.jpg'),
(158, 'jaka', '83734', '18:49:30', 'uploads\\violation_2024-11-24T11-49-21-024Z.jpg'),
(159, 'jaka', '83734', '18:49:33', 'uploads\\violation_2024-11-24T11-49-24-502Z.jpg'),
(160, 'jaka', '83734', '18:49:51', 'uploads\\violation_2024-11-24T11-49-41-850Z.jpg'),
(161, 'jaka', '83734', '18:49:59', 'uploads\\violation_2024-11-24T11-49-49-915Z.jpg'),
(162, 'jaka', '83734', '18:50:02', 'uploads\\violation_2024-11-24T11-49-53-207Z.jpg'),
(163, 'mamat', '827384', '18:50:54', 'uploads\\violation_2024-11-24T11-50-54-830Z.jpg'),
(164, 'mamat', '827384', '18:50:56', 'uploads\\violation_2024-11-24T11-50-56-098Z.jpg'),
(165, 'mamat', '827384', '18:50:57', 'uploads\\violation_2024-11-24T11-50-57-369Z.jpg'),
(166, 'jaka', '83734', '18:51:24', 'uploads\\violation_2024-11-24T11-51-14-966Z.jpg'),
(167, 'jaka', '83734', '18:51:58', 'uploads\\violation_2024-11-24T11-51-49-637Z.jpg'),
(168, 'jaka', '83734', '18:52:00', 'uploads\\violation_2024-11-24T11-51-50-875Z.jpg'),
(169, 'jaka', '83734', '18:52:01', 'uploads\\violation_2024-11-24T11-51-52-467Z.jpg'),
(170, 'jaka', '83734', '18:52:03', 'uploads\\violation_2024-11-24T11-51-54-156Z.jpg'),
(171, 'jaka', '83734', '18:52:11', 'uploads\\violation_2024-11-24T11-52-02-442Z.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_webcam`
--
ALTER TABLE `data_webcam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `violations`
--
ALTER TABLE `violations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_webcam`
--
ALTER TABLE `data_webcam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `violations`
--
ALTER TABLE `violations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
