-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2024 at 11:27 PM
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
  `gender` enum('female','male') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'male',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cairo',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'null',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `gender`, `address`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$3u8fXMXcKB3MqU.Jxn6TceOlb/SCUKtVj6liAz2fosNwvhg3JXSUG', 'male', 'cairo', '12346', '2024-12-31 20:13:11', '2024-12-31 20:17:13');

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

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doc_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'null',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'null',
  `gender` enum('female','male') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'male',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'null',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cairo',
  `age` int(11) NOT NULL DEFAULT 30,
  `days` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'null',
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'null',
  `Consultancyfees` int(11) NOT NULL DEFAULT 300,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `doc_image`, `name`, `email`, `password`, `department`, `gender`, `phone`, `address`, `age`, `days`, `time`, `Consultancyfees`, `created_at`, `updated_at`) VALUES
(2, '173568350155.jpg', 'doctor', 'doctor@gmail.com', '$2y$10$AqTIvcxjMb/98nJpQUb9uOzMVdbE8nh8nLHw.nFQDNerH3YVqzta.', 'dental', 'male', '21112', 'cairo', 45, 'every saturday', '10am to 5pm', 300, '2024-12-31 20:12:11', '2024-12-31 20:18:21'),
(7, '173568356851.jpg', 'doctor2', 'doctor2@gmail.com', '$2y$10$xiMqc2M7hnnRjqn/VVmhdO.w4M5XbDeB4D8V.E6651tgMif6FY7VS', 'dental', 'female', '21112', 'cairo', 30, 'every saturday', '10am to 5pm', 300, '2024-12-31 20:12:56', '2024-12-31 20:20:06');

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
(5, '2024_12_20_145938_create_departments_table', 1),
(6, '2024_12_27_180621_create_patientbookings_table', 1),
(7, '2024_12_30_181307_create_patients_table', 1),
(8, '2024_12_31_151702_create_admins_table', 1),
(9, '2024_12_31_165726_create_doctors_table', 1);

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
(1, 'doctor', 'doctor@gmail.com', 'dental', 'every', '10am', 'menna', 'patient@gmail.com', '222', '43', 300, '2024-12-31 20:21:16', '2024-12-31 20:21:16'),
(2, 'doctor', 'doctor@gmail.com', 'dental', 'every', '10am', 'menna', 'patient@gmail.com', '12346', '45', 300, '2024-12-31 20:21:31', '2024-12-31 20:21:31'),
(3, 'doctor', 'doctor@gmail.com', 'dental', 'every', '10am', 'menna', 'patient@gmail.com', '12346', '45', 300, '2024-12-31 20:21:40', '2024-12-31 20:21:40'),
(4, 'doctor2', 'doctor2@gmail.com', 'dental', 'every', '10am', 'menna', 'patient@gmail.com', '12346', '45', 300, '2024-12-31 20:21:51', '2024-12-31 20:21:51'),
(5, 'doctor2', 'doctor2@gmail.com', 'dental', 'every', '10am', 'menna', 'patient@gmail.com', '12346', '45', 300, '2024-12-31 20:22:04', '2024-12-31 20:22:04'),
(6, 'doctor2', 'doctor2@gmail.com', 'dental', 'every', '10am', 'menna', 'patient2@gmail.com', '12346', '45', 300, '2024-12-31 20:23:03', '2024-12-31 20:23:03');

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
  `prescription` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$8vhzC9CPjxHxGzVFcHVWjOH1fty0lj6AWwlKd31vicV4mV1ADoNDu', 'admin', NULL, '2024-12-31 20:11:05', '2024-12-31 20:17:13'),
(2, 'doctor', 'doctor@gmail.com', NULL, '$2y$10$AqTIvcxjMb/98nJpQUb9uOzMVdbE8nh8nLHw.nFQDNerH3YVqzta.', 'doctor', NULL, '2024-12-31 20:12:11', '2024-12-31 20:12:11'),
(7, 'doctor2', 'doctor2@gmail.com', NULL, '$2y$10$9.Q3rpvFmCUo4qufCfXzp.xic1BSvqr/9JTrGz.Pk/HJCiOUaLpGW', 'doctor', NULL, '2024-12-31 20:12:56', '2024-12-31 20:20:06'),
(10, 'patient', 'patient@gmail.com', NULL, '$2y$10$FAFPTm57Hf7sKf91poVqMu4Ejs8HD8SZfWH9H1DdG5WXvDeDAkHBS', 'patient', NULL, '2024-12-31 20:20:57', '2024-12-31 20:20:57'),
(11, 'patient2', 'patient2@gmail.com', NULL, '$2y$10$P0pW3TM4soQFwt7E/sPrOeT1Dr8VkADv0TOOrfFxS.ZN/jj0T/3pm', 'patient', NULL, '2024-12-31 20:22:44', '2024-12-31 20:22:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `patientbookings`
--
ALTER TABLE `patientbookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
