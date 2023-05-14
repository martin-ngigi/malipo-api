-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 14, 2023 at 07:14 AM
-- Server version: 10.3.38-MariaDB-cll-lve
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codegara_malipo_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_11_025846_create_mpesa_settings_table', 1),
(6, '2023_05_11_025847_create_mpesa_settings_table', 2),
(7, '2023_05_11_025849_create_mpesa_settings_table', 3),
(8, '2023_05_13_083933_create_mpesa_s_t_k_pushes_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `mpesa_settings`
--

CREATE TABLE `mpesa_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_short_code` varchar(255) DEFAULT NULL,
  `till_number` varchar(255) DEFAULT NULL,
  `pass_key` varchar(255) DEFAULT NULL,
  `consumer_key` varchar(255) DEFAULT NULL,
  `consumer_secret` varchar(255) DEFAULT NULL,
  `account_reference` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `mpesa_environment` varchar(255) DEFAULT NULL,
  `sanbox_base_url` varchar(225) DEFAULT NULL,
  `live_base_url` varchar(225) DEFAULT NULL,
  `safaricom_passkey` varchar(225) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mpesa_settings`
--

INSERT INTO `mpesa_settings` (`id`, `business_short_code`, `till_number`, `pass_key`, `consumer_key`, `consumer_secret`, `account_reference`, `status`, `mpesa_environment`, `sanbox_base_url`, `live_base_url`, `safaricom_passkey`, `created_at`, `updated_at`) VALUES
(1, '174379', '174379', NULL, 'BAf8doEsxz42w5XGeoLUjGk4vw7rGk5y', 'cc6OWqQx3thhDAW3', NULL, 0, 'sandbox', 'https://sandbox.safaricom.co.ke', 'https://api.safaricom.co.ke', 'bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mpesa_s_t_k_pushes`
--

CREATE TABLE `mpesa_s_t_k_pushes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `result_desc` varchar(255) DEFAULT NULL,
  `result_code` varchar(255) DEFAULT NULL,
  `merchant_request_id` varchar(255) DEFAULT NULL,
  `checkout_request_id` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `mpesa_receipt_number` varchar(255) DEFAULT NULL,
  `transaction_date` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mpesa_s_t_k_pushes`
--

INSERT INTO `mpesa_s_t_k_pushes` (`id`, `result_desc`, `result_code`, `merchant_request_id`, `checkout_request_id`, `amount`, `mpesa_receipt_number`, `transaction_date`, `phonenumber`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, '120319-5151961-1', 'ws_CO_13052023120238943797292290', NULL, NULL, NULL, NULL, '2023-05-13 06:02:21', '2023-05-13 06:02:21'),
(2, NULL, NULL, '120327-5187276-1', 'ws_CO_13052023121311838797292290', NULL, NULL, NULL, NULL, '2023-05-13 06:12:28', '2023-05-13 06:12:28'),
(3, NULL, NULL, '25732-5116011-1', 'ws_CO_13052023124122125797292290', NULL, NULL, NULL, NULL, '2023-05-13 06:40:38', '2023-05-13 06:40:38'),
(4, NULL, NULL, '4086-6089499-1', 'ws_CO_13052023171137947797292290', NULL, NULL, NULL, NULL, '2023-05-13 11:11:20', '2023-05-13 11:11:20'),
(5, NULL, NULL, '120324-8236174-335', 'ws_CO_14052023065209453797292290', NULL, NULL, NULL, NULL, '2023-05-14 00:51:25', '2023-05-14 00:51:25'),
(6, 'The service request is processed successfully.', '0', '10476-8294910-1', 'ws_CO_14052023070507229797292290', '1', 'REE4HZPSUO', '1218106277', '1394221826', '2023-05-14 01:04:23', '2023-05-14 01:04:38'),
(7, 'The service request is processed successfully.', '0', '12142-8100122-2', 'ws_CO_14052023071358459797292290', '1', 'REE9I02WOD', '1218107167', '1394221826', '2023-05-14 01:13:14', '2023-05-14 01:13:28');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mpesa_settings`
--
ALTER TABLE `mpesa_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mpesa_s_t_k_pushes`
--
ALTER TABLE `mpesa_s_t_k_pushes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mpesa_settings`
--
ALTER TABLE `mpesa_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mpesa_s_t_k_pushes`
--
ALTER TABLE `mpesa_s_t_k_pushes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
