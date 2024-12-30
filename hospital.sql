-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2024 at 07:46 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('female','male') COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `gender`, `address`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin2@gmail.com', '$2y$10$Y.pbWCqG62oIL39/FWs64..qcpoqUlCTS3BOTWrjdGyLrAp8H2fhi', 'male', 'cairo', '123753', '2024-12-26 18:20:54', '2024-12-26 18:20:54');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'dental', '2024-12-26 18:22:33', '2024-12-26 18:22:33'),
(2, 'surgery', '2024-12-26 18:22:50', '2024-12-26 18:22:50');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doc_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('female','male') COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `days` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Consultancyfees` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `doc_image`, `name`, `email`, `password`, `department`, `gender`, `phone`, `address`, `age`, `days`, `time`, `Consultancyfees`, `created_at`, `updated_at`) VALUES
(1, '173534535993.jpg', 'doctor', 'doctor@gmail.com', '$2y$10$SbrBYFQ9s8PBX8W2HzsspOLwizncpFXCvOtMADShj36AL0AoTo/zK', 'dental', 'female', '46464', 'cairo', 34, 'sat-mon-wed', '12pm to 8pm', 300, '2024-12-27 22:22:39', '2024-12-27 22:22:39'),
(3, '173557902831.jpg', 'doctor2', 'doctor2@gmail.com', '$2y$10$hu7UW9/Pw8uIpZLCD9ChYeAhqhPwZMuoZ.2aPvj1ICWzt2X5JTNPu', 'dental', 'female', '222', 'cairo', 43, 'every sat', '10am to 5pm', 250, '2024-12-30 15:17:08', '2024-12-30 15:17:08');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobil` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `mobil`, `message`, `created_at`, `updated_at`) VALUES
(1, 'doctor', 'doctor@gmail.com', '727272', 'good', '2024-12-26 18:39:43', '2024-12-26 18:39:43');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2024_09_26_162007_create_messages_table', 1),
(5, '2024_12_12_025138_create_doctors_table', 1),
(6, '2024_12_20_145938_create_admins_table', 1),
(7, '2024_12_20_145938_create_departments_table', 1),
(8, '2024_12_25_163250_create_patientbookings_table', 1),
(9, '2024_12_25_180735_create_patients_table', 1),
(10, '2024_12_27_123722_create_doctors_table', 2),
(11, '2024_12_27_130459_create_patientbookings_table', 3),
(12, '2024_12_27_153507_create_doctors_table', 4),
(13, '2024_12_27_180621_create_patientbookings_table', 5),
(14, '2024_12_27_200108_create_doctors_table', 6),
(15, '2024_12_30_162956_create_relations_table', 7),
(16, '2024_12_30_173907_create_patients_table', 8),
(17, '2024_12_30_181307_create_patients_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patientbookings`
--

CREATE TABLE `patientbookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctoremail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `days` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patientname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patientemail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patientphone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patientage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consultancyfees` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patientbookings`
--

INSERT INTO `patientbookings` (`id`, `doctor`, `doctoremail`, `department`, `days`, `time`, `patientname`, `patientemail`, `patientphone`, `patientage`, `consultancyfees`, `created_at`, `updated_at`) VALUES
(17, 'doctor', 'doctor@gmail.com', 'dental', 'sat-mon-wed', '12pm', 'patient', 'patient@gmail.com', '7757', '30', 300, '2024-12-27 22:32:44', '2024-12-27 22:32:44'),
(19, 'doctor', 'doctor@gmail.com', 'dental', 'sat-mon-wed', '12pm', 'menna', 'patient@gmail.com', '222', '43', 300, '2024-12-30 14:49:06', '2024-12-30 14:49:06');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctoremail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('female','male') COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `medicalhistory` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prescription` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `doctoremail`, `name`, `email`, `gender`, `phone`, `address`, `age`, `medicalhistory`, `prescription`, `created_at`, `updated_at`) VALUES
(1, 'doctor@gmail.com', 'patinet', 'patient@gmail.com', 'male', '112345', 'cairo', 66, 'none', 'ddd', '2024-12-30 16:23:19', '2024-12-30 16:23:29'),
(2, 'doctor@gmail.com', 'patinet2', 'patient2@gmail.com', 'female', '112348', 'cairo', 50, 'none', 'ddd', '2024-12-30 16:37:01', '2024-12-30 16:37:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','doctor','patient') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'patient',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'patinet', 'patient@gmail.com', NULL, '$2y$10$VT1NuDBNf9JCB2qWgDx0he9smmv9grfDTTkFk2DACITFKeJqZ6tvi', 'patient', NULL, '2024-12-26 17:22:18', '2024-12-26 17:22:18'),
(2, 'admin', 'admin@gmail.com', NULL, '$2y$10$2kD.WoAf4vYLnu8Y/LaJpO3Rb5ty0nc1JOmbkKqatzJkUaMat/25i', 'admin', NULL, '2024-12-26 17:22:51', '2024-12-26 17:22:51'),
(3, 'doctor', 'doctor@gmail.com', NULL, '$2y$10$qv98jxVKdMRXYTRJJzhtz.nqcHxNooY1yuB.c4ILQjqdYDniu1mgC', 'doctor', NULL, '2024-12-26 17:23:52', '2024-12-26 17:23:52'),
(9, 'menna', 'menna@gmail.com', NULL, '$2y$10$D/xEOtJ.kIUS.y/e8Fs9uuGxRS7QzwG4CMxbgQbkZmMz00jbvLjHa', 'doctor', NULL, '2024-12-27 22:33:20', '2024-12-27 22:33:20'),
(10, 'menna', 'patient2@gmail.com', NULL, '$2y$10$6LmM5xcHJH6heSEruAFl.eqau27mQAtd.yG/rS.HRfgUFMZA99BVe', 'patient', NULL, '2024-12-30 14:50:20', '2024-12-30 14:50:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `doctors_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `patientbookings`
--
ALTER TABLE `patientbookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patients_email_unique` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `patientbookings`
--
ALTER TABLE `patientbookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
