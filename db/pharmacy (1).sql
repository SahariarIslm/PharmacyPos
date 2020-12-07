-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2020 at 08:54 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `batch_stocks`
--

CREATE TABLE `batch_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `batch_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimum` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` double(10,2) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `shop` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `batch_stocks`
--

INSERT INTO `batch_stocks` (`id`, `name`, `code`, `expiry_date`, `batch_no`, `minimum`, `quantity`, `unit`, `cost`, `price`, `shop`, `created_at`, `updated_at`) VALUES
(1, 'Napa', '202012011', '2021-01-09', '1', 1234, 36, 'mg', 1234.00, 123.00, 5, NULL, NULL),
(2, 'Napa Extend', '202012012', '2021-01-09', '2', 120, 16, 'Select Medicine Unit', 220.00, 250.00, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `shop` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `shop`, `created_at`, `updated_at`) VALUES
(1, 'New', 0, 2, '2020-07-07 16:44:57', '2020-10-25 10:25:49'),
(2, 'Demo', 1, 3, '2020-07-18 15:04:42', '2020-07-18 15:04:42'),
(3, 'Paracetamol', 1, 3, '2020-10-25 04:29:18', '2020-10-25 04:29:18'),
(4, 'crud', 1, 3, '2020-10-25 04:29:38', '2020-10-25 04:30:18'),
(5, 'Renited', 1, 3, '2020-10-25 05:10:01', '2020-10-25 05:10:01'),
(6, 'Laravel', 1, 3, '2020-10-25 09:12:19', '2020-10-25 09:40:20'),
(7, 'Paracetamol', 1, 3, '2020-10-25 09:59:05', '2020-10-26 06:06:14'),
(8, 'Pain killer', 1, 5, '2020-12-01 07:26:14', '2020-12-01 07:26:14'),
(9, 'High Pressure', 1, 5, '2020-12-01 07:26:30', '2020-12-01 07:26:30'),
(10, 'Low Pressure', 1, 5, '2020-12-01 07:26:44', '2020-12-01 07:26:44');

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE `collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `customer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid` double(10,2) DEFAULT NULL,
  `due` double(10,2) DEFAULT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collections`
--

INSERT INTO `collections` (`id`, `date`, `customer`, `delivery`, `invoice`, `paid`, `due`, `amount`, `details`, `shop`, `user`, `created_at`, `updated_at`) VALUES
(1, '2020-11-25', '0', '1', 'INV320201', 400.00, 10.00, 0.00, NULL, 3, 3, '2020-11-25 09:28:45', '2020-11-25 09:28:45');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` double(10,2) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `shop` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `shop` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`id`, `name`, `mobile`, `address`, `status`, `shop`, `created_at`, `updated_at`) VALUES
(1, 'Self', '123456', '123456thgbv', 1, 3, '2020-11-25 09:28:03', '2020-11-27 08:25:59');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(2) NOT NULL,
  `name` varchar(25) NOT NULL,
  `bn_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`, `bn_name`) VALUES
(1, 'Cumilla', 'কুমিল্লা'),
(2, 'Feni', 'ফেনী'),
(3, 'Brahmanbaria', 'ব্রাহ্মণবাড়িয়া'),
(4, 'Rangamati', 'রাঙ্গামাটি'),
(5, 'Noakhali', 'নোয়াখালী'),
(6, 'Chandpur', 'চাঁদপুর'),
(7, 'Lakshmipur', 'লক্ষ্মীপুর'),
(8, 'Chattogram', 'চট্টগ্রাম'),
(9, 'Coxsbazar', 'কক্সবাজার'),
(10, 'Khagrachhari', 'খাগড়াছড়ি'),
(11, 'Bandarban', 'বান্দরবান'),
(12, 'Sirajganj', 'সিরাজগঞ্জ'),
(13, 'Pabna', 'পাবনা'),
(14, 'Bogura', 'বগুড়া'),
(15, 'Rajshahi', 'রাজশাহী'),
(16, 'Natore', 'নাটোর'),
(17, 'Joypurhat', 'জয়পুরহাট'),
(18, 'Chapainawabganj', 'চাঁপাইনবাবগঞ্জ'),
(19, 'Naogaon', 'নওগাঁ'),
(20, 'Josshore', 'যশোর'),
(21, 'Satkhira', 'সাতক্ষীরা'),
(22, 'Meherpur', 'মেহেরপুর'),
(23, 'Narail', 'নড়াইল'),
(24, 'Chuadanga', 'চুয়াডাঙ্গা'),
(25, 'Kushtia', 'কুষ্টিয়া'),
(26, 'Magura', 'মাগুরা'),
(27, 'Khulna', 'খুলনা'),
(28, 'Bagerhat', 'বাগেরহাট'),
(29, 'Jhenaidah', 'ঝিনাইদহ'),
(30, 'Jhalakathi', 'ঝালকাঠি'),
(31, 'Patuakhali', 'পটুয়াখালী'),
(32, 'Pirojpur', 'পিরোজপুর'),
(33, 'Barishal', 'বরিশাল'),
(34, 'Bhola', 'ভোলা'),
(35, 'Barguna', 'বরগুনা'),
(36, 'Sylhet', 'সিলেট'),
(37, 'Moulvibazar', 'মৌলভীবাজার'),
(38, 'Habiganj', 'হবিগঞ্জ'),
(39, 'Sunamganj', 'সুনামগঞ্জ'),
(40, 'Narsingdi', 'নরসিংদী'),
(41, 'Gazipur', 'গাজীপুর'),
(42, 'Shariatpur', 'শরীয়তপুর'),
(43, 'Narayanganj', 'নারায়ণগঞ্জ'),
(44, 'Tangail', 'টাঙ্গাইল'),
(45, 'Kishoreganj', 'কিশোরগঞ্জ'),
(46, 'Manikganj', 'মানিকগঞ্জ'),
(47, 'Dhaka', 'ঢাকা'),
(48, 'Munshiganj', 'মুন্সিগঞ্জ'),
(49, 'Rajbari', 'রাজবাড়ী'),
(50, 'Madaripur', 'মাদারীপুর'),
(51, 'Gopalganj', 'গোপালগঞ্জ'),
(52, 'Faridpur', 'ফরিদপুর'),
(53, 'Panchagarh', 'পঞ্চগড়'),
(54, 'Dinajpur', 'দিনাজপুর'),
(55, 'Lalmonirhat', 'লালমনিরহাট'),
(56, 'Nilphamari', 'নীলফামারী'),
(57, 'Gaibandha', 'গাইবান্ধা'),
(58, 'Thakurgaon', 'ঠাকুরগাঁও'),
(59, 'Rangpur', 'রংপুর'),
(60, 'Kurigram', 'কুড়িগ্রাম'),
(61, 'Sherpur', 'শেরপুর'),
(62, 'Mymensingh', 'ময়মনসিংহ'),
(63, 'Jamalpur', 'জামালপুর'),
(64, 'Netrokona', 'নেত্রকোণা');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `expense_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_types`
--

CREATE TABLE `expense_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `shop` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `medicine_shelves`
--

CREATE TABLE `medicine_shelves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `shop` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medicine_shelves`
--

INSERT INTO `medicine_shelves` (`id`, `name`, `status`, `shop`, `created_at`, `updated_at`) VALUES
(3, 'shelf-1', 1, 3, '2020-10-25 11:55:04', '2020-10-26 04:52:16'),
(4, 'Shelf-2', 1, 3, '2020-10-26 05:42:47', '2020-10-26 05:42:47'),
(5, 'Shelf-3', 1, 3, '2020-10-26 08:54:38', '2020-10-26 08:54:38'),
(6, 'Shelf-1', 1, 5, '2020-12-01 07:24:05', '2020-12-01 07:24:05'),
(7, 'Shelf-2', 1, 5, '2020-12-01 07:24:13', '2020-12-01 07:24:13'),
(8, 'Shelf-3', 1, 5, '2020-12-01 07:24:21', '2020-12-01 07:24:21');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_types`
--

CREATE TABLE `medicine_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `shop` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medicine_types`
--

INSERT INTO `medicine_types` (`id`, `name`, `status`, `shop`, `created_at`, `updated_at`) VALUES
(2, 'Tablates', 1, 3, '2020-10-26 04:55:08', '2020-10-26 04:55:08'),
(3, 'Injection', 1, 3, '2020-10-26 05:01:56', '2020-10-26 05:01:56'),
(4, 'Syrup', 1, 3, '2020-10-26 05:02:39', '2020-10-26 05:02:39'),
(6, 'Tablates', 1, 5, '2020-12-01 07:24:46', '2020-12-01 07:24:46'),
(7, 'Syrup', 1, 5, '2020-12-01 07:24:57', '2020-12-01 07:24:57'),
(8, 'Injection', 1, 5, '2020-12-01 07:25:40', '2020-12-01 07:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_units`
--

CREATE TABLE `medicine_units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `shop` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medicine_units`
--

INSERT INTO `medicine_units` (`id`, `name`, `status`, `shop`, `created_at`, `updated_at`) VALUES
(1, 'ml', 1, 3, '2020-10-25 11:55:43', '2020-10-26 04:52:38'),
(3, 'mg', 1, 3, '2020-10-26 05:43:08', '2020-10-26 05:43:08'),
(4, 'mg', 1, 5, '2020-12-01 07:23:25', '2020-12-01 07:23:25'),
(5, 'ml', 1, 5, '2020-12-01 07:23:33', '2020-12-01 07:23:33');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Welcome !!!', '2020-07-07 16:41:00', NULL);

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
(4, '2020_02_15_163516_create_customers_table', 1),
(5, '2020_02_15_163931_create_suppliers_table', 1),
(7, '2020_02_17_154055_create_categories_table', 1),
(8, '2020_02_18_114805_create_purchases_table', 1),
(9, '2020_02_18_115320_create_purchase_items_table', 1),
(10, '2020_02_20_111658_create_sales_table', 1),
(11, '2020_02_20_112511_create_sale_items_table', 1),
(12, '2020_02_20_113900_create_stocks_table', 1),
(13, '2020_02_23_161728_create_purchase_cancels_table', 1),
(14, '2020_02_24_155630_create_sale_cancels_table', 1),
(15, '2020_02_27_141338_create_expenses_table', 1),
(16, '2020_02_27_142236_create_expense_types_table', 1),
(17, '2020_02_27_151247_create_collections_table', 1),
(18, '2020_02_27_151447_create_payments_table', 1),
(19, '2020_03_22_232225_create_deliveries_table', 1),
(20, '2020_03_24_184246_create_shop_payments_table', 1),
(21, '2020_03_24_184705_create_shop_packages_table', 1),
(22, '2020_04_03_055017_create_messages_table', 1),
(23, '2020_06_18_090242_create_subscribers_table', 1),
(24, '2020_06_18_094230_create_testimonials_table', 1),
(25, '2020_06_21_025300_create_tickets_table', 1),
(26, '2020_06_22_010545_create_ticket_attachments_table', 1),
(27, '2020_06_22_030651_create_ticket_statuses_table', 1),
(28, '2020_06_23_225524_create_shops_table', 1),
(29, '2020_06_23_225810_create_references_table', 1),
(30, '2020_06_23_230036_create_reference_payments_table', 1),
(31, '2020_06_26_030838_create_contacts_table', 1),
(32, '2020_06_27_205303_create_shop_employees_table', 1),
(34, '2020_10_25_152249_create_medicine_types_table', 2),
(35, '2020_10_25_163838_create_medicine_shelves_table', 3),
(36, '2020_10_25_173801_create_medicine_units_table', 4),
(42, '2016_06_01_000001_create_oauth_auth_codes_table', 6),
(43, '2016_06_01_000002_create_oauth_access_tokens_table', 6),
(44, '2016_06_01_000003_create_oauth_refresh_tokens_table', 6),
(45, '2016_06_01_000004_create_oauth_clients_table', 6),
(46, '2016_06_01_000005_create_oauth_personal_access_clients_table', 6),
(47, '2020_02_17_145049_create_products_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('00d664d960c599b5b60b0c10efe331af3b30da10c8c9f5a2b25cbc02e13f51585359562dfd11dc8e', 3, 1, 'MyApp', '[]', 0, '2020-11-29 07:45:16', '2020-11-29 07:45:16', '2021-11-29 13:45:16'),
('010a465c2b232bdb07555b0c018e284491c4921d00f0887a8a1fc48168ff6c70878123a2d95fadfd', 3, 1, 'MyApp', '[]', 0, '2020-12-01 06:06:40', '2020-12-01 06:06:40', '2021-12-01 12:06:40'),
('033098f64a3c5df88f5bf4726bd90b90e7dacd891ad879b10ebf4122872018da681d2cc242485cba', 3, 1, 'MyApp', '[]', 0, '2020-11-29 05:43:06', '2020-11-29 05:43:06', '2021-11-29 11:43:06'),
('07354afdfdc92399ffe6b3965ff8c138ca591d7314e4f0afbff83bbad8ae35c51546df84da215763', 3, 1, 'MyApp', '[]', 0, '2020-11-30 11:39:58', '2020-11-30 11:39:58', '2021-11-30 17:39:58'),
('112990e535c92cdc343bb65da5029c05ab788e917440b1341d0de5c9fcc784fff798052953005477', 3, 1, 'MyApp', '[]', 0, '2020-11-30 11:33:16', '2020-11-30 11:33:16', '2021-11-30 17:33:16'),
('11a7f1b978b1abf15169c820c9630fe8b6d90c94ead56bdc280d15615cbb0110b92497edd4f908f0', 3, 1, 'MyApp', '[]', 0, '2020-12-01 05:58:58', '2020-12-01 05:58:58', '2021-12-01 11:58:58'),
('138c1a8b9850209eedb75037518399756f4e4e151cc64179f54e503ff3d514126ab8fbbba310e0c0', 3, 1, 'MyApp', '[]', 0, '2020-11-29 05:43:55', '2020-11-29 05:43:55', '2021-11-29 11:43:55'),
('145a3f9b94ed79fb6954c58e3a790b09405540f3ce547a208639e266430754e6307029555cb6d6a6', 3, 1, 'MyApp', '[]', 0, '2020-11-29 07:00:37', '2020-11-29 07:00:37', '2021-11-29 13:00:37'),
('15ffeac878d7c224d72b6c93e4d25b6b34d255c3b140e8cebd72b2180c8a7f644c660dac0962ebfb', 3, 1, 'MyApp', '[]', 0, '2020-11-29 06:27:36', '2020-11-29 06:27:36', '2021-11-29 12:27:36'),
('173857c122b32d0b8b77d2154b026b93ac369c2db659dc3d4ce73e410ae37210c1bc68deb69a3e8b', 3, 1, 'MyApp', '[]', 0, '2020-12-01 05:12:50', '2020-12-01 05:12:50', '2021-12-01 11:12:50'),
('1f8e7a91ed1a595465bd88c4bf9af3c4e7f00c94079be08ef44f786bac594d5ea1c99ac0b95a56b0', 3, 1, 'MyApp', '[]', 0, '2020-11-28 11:16:05', '2020-11-28 11:16:05', '2021-11-28 17:16:05'),
('26590432d94871d6499f82e690742987d9a79c2daf9ed01fd3193f2c3c6c5641c466fc9837c1fe63', 3, 1, 'MyApp', '[]', 0, '2020-11-29 07:58:19', '2020-11-29 07:58:19', '2021-11-29 13:58:19'),
('272c51244c6cea7eb45ed6d6ac519a29036831ae3c4ad9d6924ad81166c9f0a9431e0c6a177e8be9', 3, 1, 'MyApp', '[]', 0, '2020-11-28 11:29:27', '2020-11-28 11:29:27', '2021-11-28 17:29:27'),
('2734538fffb9e2fb63c067f8c7eb7728d20fb5241f462567a92ea2131c1b37ba6d605ea624010cd8', 3, 1, 'MyApp', '[]', 0, '2020-11-29 08:22:43', '2020-11-29 08:22:43', '2021-11-29 14:22:43'),
('2931e8bfdc923c5bf606af6a0aac28d899ebfc30cefacd0c0a4d541111cc9acc400aa7981724e146', 3, 1, 'MyApp', '[]', 0, '2020-11-26 10:17:03', '2020-11-26 10:17:03', '2021-11-26 16:17:03'),
('2f9da97d52b5482d3ce554ed58d548708587700173e5f84f98aa55954ce1ceed8f4c3c0f492fd42d', 3, 1, 'MyApp', '[]', 0, '2020-11-29 07:09:14', '2020-11-29 07:09:14', '2021-11-29 13:09:14'),
('37d5066a94a0adf5ca65a609bf3398afa8e0b60a3b2a63ccf2993b10c3501f82055b67ea53f345c0', 3, 1, 'MyApp', '[]', 0, '2020-11-28 06:57:06', '2020-11-28 06:57:06', '2021-11-28 12:57:06'),
('4668ddb9024643ecc8400f17b7758c22245ad57c42755b69e3c61750e6e0289f9726dcb670f94432', 3, 1, 'MyApp', '[]', 0, '2020-11-28 11:36:29', '2020-11-28 11:36:29', '2021-11-28 17:36:29'),
('4ddd4d0871d61bb8de555da6e1ac5d1283fdff6b49cb553b9165cfe9946eb6e172c42ec77a61ea5b', 3, 1, 'MyApp', '[]', 0, '2020-11-28 06:56:35', '2020-11-28 06:56:35', '2021-11-28 12:56:35'),
('4eecd51140460d82d2129b2d20559ebf14fc3dab117f78629eefc37d5340de6a8af15207d0810910', 3, 1, 'MyApp', '[]', 0, '2020-11-28 11:46:03', '2020-11-28 11:46:03', '2021-11-28 17:46:03'),
('56e3c45397fc43fb395c036ad4597f055e9a913888bdc4b8ceff6ffcbd52568211542c6c6bf898dd', 3, 1, 'MyApp', '[]', 0, '2020-11-26 11:39:41', '2020-11-26 11:39:41', '2021-11-26 17:39:41'),
('5822db2da316cc3cc6776f3f1e56e2d354cfd7b0b7d84f47395af02ef80657e34418fec1e7e1016a', 3, 1, 'MyApp', '[]', 0, '2020-11-28 11:41:41', '2020-11-28 11:41:41', '2021-11-28 17:41:41'),
('5c8da051b35899608d596b3f5e5eb39fa0943a7c097309925fa639b70fd0929ee0d8a02384757b55', 3, 1, 'MyApp', '[]', 0, '2020-11-29 07:58:29', '2020-11-29 07:58:29', '2021-11-29 13:58:29'),
('6142f1bac874d604d1b2a6c61b592d05642a5981b1aef439e322021a8f8b1beb13145e720911d594', 3, 1, 'MyApp', '[]', 0, '2020-11-29 08:56:11', '2020-11-29 08:56:11', '2021-11-29 14:56:11'),
('6271510e9d941bde180f0de09f1f6d2962833f4fc4c81eb853b0dcefa6222907816a0edda73be188', 3, 1, 'MyApp', '[]', 0, '2020-11-29 08:28:45', '2020-11-29 08:28:45', '2021-11-29 14:28:45'),
('63d557016e4f7e1967b4b9a47b1ea70f27694e56969bd82f02b570abfc14f12856851f6dc57327eb', 3, 1, 'MyApp', '[]', 0, '2020-11-29 09:08:01', '2020-11-29 09:08:01', '2021-11-29 15:08:01'),
('64e80d19fd105f32ad14e68de1a98cc1312afc8f02c4c24894f0fa02b7d1b7eb4ce77cfd36e89503', 3, 1, 'MyApp', '[]', 0, '2020-11-28 11:42:41', '2020-11-28 11:42:41', '2021-11-28 17:42:41'),
('66ecb27c04b14653e27ced92492414a804c9cc1729dcba9991537e803a8f3130cfacf5273b9e3203', 3, 1, 'MyApp', '[]', 0, '2020-11-29 09:15:00', '2020-11-29 09:15:00', '2021-11-29 15:15:00'),
('694f817b07eddfbda7a8b0bfd215fc9f1ffb497f28ee7863a10f2705b47a475b92510766606fa176', 3, 1, 'MyApp', '[]', 0, '2020-11-26 11:38:10', '2020-11-26 11:38:10', '2021-11-26 17:38:10'),
('6fcd389327b5323c60477195f9be246c1ce2d1d9aa708f088622afcba11ac7e98ba8a1dd4fadc052', 3, 1, 'MyApp', '[]', 0, '2020-12-01 05:09:37', '2020-12-01 05:09:37', '2021-12-01 11:09:37'),
('736e82ef4ac672b3825d460c0907598ac2ed13070881590e17f2ac123b8addb161d1e8c7726c728b', 3, 1, 'MyApp', '[]', 0, '2020-11-28 11:38:45', '2020-11-28 11:38:45', '2021-11-28 17:38:45'),
('75aabc9c9ebde0367e942c11e83ed85869493de0f7d456bb21a85dd19b26db96aa2701b9761ea017', 3, 1, 'MyApp', '[]', 0, '2020-11-28 07:15:35', '2020-11-28 07:15:35', '2021-11-28 13:15:35'),
('7e3279ff8970a0d3cfadb43e1409151a5f0c8aea4074f0b874b42286aee37d735ae676adac578653', 3, 1, 'MyApp', '[]', 0, '2020-11-28 11:40:13', '2020-11-28 11:40:13', '2021-11-28 17:40:13'),
('7f812d06a5c730b520fc208e9af6a9f66d25023849351513608b9d6892505a046819939986cb7a39', 3, 1, 'MyApp', '[]', 0, '2020-11-29 09:49:40', '2020-11-29 09:49:40', '2021-11-29 15:49:40'),
('80cf8ea1815d1f99b602205997ec8e41ece015c401db60f7094feaf166c1e0ff073b95503df44745', 3, 1, 'MyApp', '[]', 0, '2020-11-28 11:11:42', '2020-11-28 11:11:42', '2021-11-28 17:11:42'),
('848d0ae25c89df00a7649d11fa74360ff061d86daceee55a49033df90f134bb4916f9dc2b5be5b55', 3, 1, 'MyApp', '[]', 0, '2020-11-29 07:03:06', '2020-11-29 07:03:06', '2021-11-29 13:03:06'),
('8599774374f1ea1c8795150fc4104a7f51842194a331d0db1519deabcc9bba10b4a2d3ce0244fb68', 3, 1, 'MyApp', '[]', 0, '2020-11-29 05:51:20', '2020-11-29 05:51:20', '2021-11-29 11:51:20'),
('8870497224fbe7dd68b44ea35e2149e2cb4b78eef49668b47822e1dac3fc467951e3d08512bfbe23', 3, 1, 'MyApp', '[]', 0, '2020-11-28 11:34:46', '2020-11-28 11:34:46', '2021-11-28 17:34:46'),
('8a4b0dd71db6b2b66d60acbc61bb4653eeea84a4bef5e56ee4ee6b1e3f8e4ae64fa24220edd13b37', 3, 1, 'MyApp', '[]', 0, '2020-11-30 11:41:28', '2020-11-30 11:41:28', '2021-11-30 17:41:28'),
('8be35aa1840fb8b1ae4d0e55509a8f8f661237b959190539d55906d0a239f627e79f8b7787b6c8ff', 3, 1, 'MyApp', '[]', 0, '2020-11-26 10:37:34', '2020-11-26 10:37:34', '2021-11-26 16:37:34'),
('8cab4aea8006e2b37eb89090300cfe7d7ba735374710747ecaf6f4c210ae6d1062b680ab49dde5e3', 3, 1, 'MyApp', '[]', 0, '2020-11-23 05:01:50', '2020-11-23 05:01:50', '2021-11-23 11:01:50'),
('93cefd9799eec628d7ed44fc66e2086ddacdf2151e3794ae221165d7246182e378b156a57d292f86', 3, 1, 'MyApp', '[]', 0, '2020-11-29 05:43:42', '2020-11-29 05:43:42', '2021-11-29 11:43:42'),
('9693749cd5978e0bd1883b70ec625f92d2d036b78c403cae53db048d43d906f6dbb9ae2f245cf5c6', 3, 1, 'MyApp', '[]', 0, '2020-11-26 11:37:03', '2020-11-26 11:37:03', '2021-11-26 17:37:03'),
('97024fca215b38ebb3c494a86e0855d37052d1d76b79d7e46219114783b229c2c8d878fe468046b9', 3, 1, 'MyApp', '[]', 0, '2020-11-29 08:40:03', '2020-11-29 08:40:03', '2021-11-29 14:40:03'),
('9a8ec9a2d2495bb55bcdcba87234f7468be2a4462ef9b4235fc41c50072777e24f6230161b331d78', 3, 1, 'MyApp', '[]', 0, '2020-11-26 11:34:58', '2020-11-26 11:34:58', '2021-11-26 17:34:58'),
('9dca72e92e8272e93fd0b231d4db3f13d7ddd252889cdec60f68cf4390ef2f4a723adbd4a256c918', 3, 1, 'MyApp', '[]', 0, '2020-11-28 11:19:37', '2020-11-28 11:19:37', '2021-11-28 17:19:37'),
('a280948384e6dc27c2da3deb45b78defe35e2171fb3072d44253088a182871305cc2db9f8b16c5df', 3, 1, 'MyApp', '[]', 0, '2020-11-29 06:38:02', '2020-11-29 06:38:02', '2021-11-29 12:38:02'),
('a827e43d01830e4e3b86a2e1cd017668e01a25eff8721036b37fd91fed970a34cea541582329b12d', 3, 1, 'MyApp', '[]', 0, '2020-11-28 11:43:56', '2020-11-28 11:43:56', '2021-11-28 17:43:56'),
('a9033ded88fd9a90d5e21941341d49efa6f7d9fcc1307624e7d0cc7d17dd3167fab07c1bd654f8ec', 3, 1, 'MyApp', '[]', 0, '2020-11-28 11:41:12', '2020-11-28 11:41:12', '2021-11-28 17:41:12'),
('aba993bffc7a56c68a98aef9797329321ebdf55106edd0b32408c9b7ae9fdc0137b5efccba12e155', 3, 1, 'MyApp', '[]', 0, '2020-11-28 08:08:13', '2020-11-28 08:08:13', '2021-11-28 14:08:13'),
('abbce1105da8b8ddc7daaa9d64997b7b335a6f51f78b1bd079ee8cd61abb315ebf04dad473d6b124', 3, 1, 'MyApp', '[]', 0, '2020-11-26 11:24:48', '2020-11-26 11:24:48', '2021-11-26 17:24:48'),
('ace44a189e35939d833f3a78ed48fb5b5022f40bfb24702b55d3b4cc6325d6e16bbbe163b52a2e01', 3, 1, 'MyApp', '[]', 0, '2020-11-29 08:28:42', '2020-11-29 08:28:42', '2021-11-29 14:28:42'),
('b05ca5b264c0360ea23f0d997bf4349e8d3e9284c1ebc731057f89de75d4130f24cd2aaeb3874b6a', 3, 1, 'MyApp', '[]', 0, '2020-11-29 08:01:56', '2020-11-29 08:01:56', '2021-11-29 14:01:56'),
('b74dd9db12a9ac3d69de92d0c1c840c04c7495ad0434ba7d74526021778c10015512ccfb6f22c9e2', 3, 1, 'MyApp', '[]', 0, '2020-11-26 11:26:20', '2020-11-26 11:26:20', '2021-11-26 17:26:20'),
('b7b255bf4317fdeb5ea51ecd1d9cbc660bccf86d32ba41c04557889daecf4b943996d68c83f4c559', 3, 1, 'MyApp', '[]', 0, '2020-11-30 11:36:39', '2020-11-30 11:36:39', '2021-11-30 17:36:39'),
('b994dfbcadac6a9c7425a0f9999ed5e926d27d055b90b8aba22ebe79d15239de15133514946d340f', 3, 1, 'MyApp', '[]', 0, '2020-11-29 07:01:52', '2020-11-29 07:01:52', '2021-11-29 13:01:52'),
('bc242e4d0ae51216c6f132f6833db6e8a69080d97e60182ebde904ce362633d3a226a0575e80cc55', 3, 1, 'MyApp', '[]', 0, '2020-11-29 09:03:32', '2020-11-29 09:03:32', '2021-11-29 15:03:32'),
('bd76763753fc2103e7c6628b572c530863089794621b5e0aca2988e8e45414fdf4b27688587fc828', 3, 1, 'MyApp', '[]', 0, '2020-11-30 11:31:27', '2020-11-30 11:31:27', '2021-11-30 17:31:27'),
('c48bfd78b464c972a2638b321efb77953f73877c8c072a0c2829044e8a1397c3ff59ab3d0c782569', 3, 1, 'MyApp', '[]', 0, '2020-11-29 06:48:57', '2020-11-29 06:48:57', '2021-11-29 12:48:57'),
('cb2761c5801ebac715ce52da71755e03f4f8eae2edb021afaedf433b6eb6640ddd4b70720f2bbbc2', 3, 1, 'MyApp', '[]', 0, '2020-11-29 06:39:28', '2020-11-29 06:39:28', '2021-11-29 12:39:28'),
('ce436579641a454357249f9882c32e49df9173692c7ba20c1a7690ca1f35df8e537e516b80529134', 3, 1, 'MyApp', '[]', 0, '2020-12-01 05:09:37', '2020-12-01 05:09:37', '2021-12-01 11:09:37'),
('d7708ae4c538bb973666bc0f044facf89220aa372b502c631b2242c7250815ec961f4092c94e282a', 3, 1, 'MyApp', '[]', 0, '2020-11-28 07:46:44', '2020-11-28 07:46:44', '2021-11-28 13:46:44'),
('d852cec4e970768b7947336d8ac1835739d28fc46202320c4045593bcf6ab5410805f641ac3140ce', 3, 1, 'MyApp', '[]', 0, '2020-11-29 05:42:42', '2020-11-29 05:42:42', '2021-11-29 11:42:42'),
('dfc712e5109840251d4a18e80f6ca148b2e9db7a0379b191e35d5f280f3196137bd7d2998da274c1', 3, 1, 'MyApp', '[]', 0, '2020-11-26 10:20:07', '2020-11-26 10:20:07', '2021-11-26 16:20:07'),
('e195b743215585fb70e0348c4a3c47248081eb07720878a3a8c23bc6a6b783634fdb85b0237d281b', 3, 1, 'MyApp', '[]', 0, '2020-11-29 05:42:42', '2020-11-29 05:42:42', '2021-11-29 11:42:42'),
('e482709e631938e795c130b1be6ada8fb71e4dbca16db019decebc7c93ca0aff304fc5a44a65d3dd', 3, 1, 'MyApp', '[]', 0, '2020-11-29 06:29:33', '2020-11-29 06:29:33', '2021-11-29 12:29:33'),
('e50766c72b222c7a3ab28f21f91e968f77b7595fb5249b93bad8e1af521e9fffd6eaea86d2e2187b', 3, 1, 'MyApp', '[]', 0, '2020-12-01 06:00:54', '2020-12-01 06:00:54', '2021-12-01 12:00:54'),
('ed5aa56316ddbc3765f253055216ea403d9ea944643608f6ad9163ece499f6e20534aef707da1683', 3, 1, 'MyApp', '[]', 0, '2020-11-30 11:40:15', '2020-11-30 11:40:15', '2021-11-30 17:40:15'),
('edf7dada4a7976243108421d8efb1a105cedc6e025d80cbe74c71cd147bdf7a3a8d95412e2fca3a0', 3, 1, 'MyApp', '[]', 0, '2020-11-29 09:05:52', '2020-11-29 09:05:52', '2021-11-29 15:05:52'),
('ee3c26b1d17c8b8b6f008b9cc3311c8425d0f7191847a8a224dae9642ae05b9d29ab80543e1b55ad', 3, 1, 'MyApp', '[]', 0, '2020-11-28 11:46:51', '2020-11-28 11:46:51', '2021-11-28 17:46:51'),
('f017c8786b3f3714c7e0c4261f2a3ddcf5d014b7ac8c74360c09c93a2373733376ab988cce8a8c84', 3, 1, 'MyApp', '[]', 0, '2020-11-28 10:21:13', '2020-11-28 10:21:13', '2021-11-28 16:21:13'),
('f03a1a028a1f53e7b543856630bd7944a7bf20a654870f4c9471fdd2556a18d3090affb311d8687e', 3, 1, 'MyApp', '[]', 0, '2020-11-29 06:49:39', '2020-11-29 06:49:39', '2021-11-29 12:49:39'),
('f3ffe9d40eaf5875f077c73addff1bd407b614585cd5af5ea8b68538fc5e4e5e4c319502a5f8bc20', 3, 1, 'MyApp', '[]', 0, '2020-11-29 07:50:19', '2020-11-29 07:50:19', '2021-11-29 13:50:19'),
('f5ee6d6ced3c8a948065b9e48300821e421f018f24297888dcdf5b7fa1fc62cb579b44287e2e4780', 3, 1, 'MyApp', '[]', 0, '2020-11-28 11:20:49', '2020-11-28 11:20:49', '2021-11-28 17:20:49'),
('f62b08fa66c24d0dcc7266a03f63e38c5aa43ff624233d12bcbc23c273689d0ecf1b76b0fdb7839d', 3, 1, 'MyApp', '[]', 0, '2020-11-28 11:32:15', '2020-11-28 11:32:15', '2021-11-28 17:32:15'),
('f81f39c22ad9cb312238942305332040c197ffea453a87f47df9149b2f804b50c7fe558f32adf65a', 3, 1, 'MyApp', '[]', 0, '2020-12-01 06:15:30', '2020-12-01 06:15:30', '2021-12-01 12:15:30'),
('f8b18ad59f3fde5aaa0f83d12acb66bffe24d886e712c59295a62fc235539cb631e25c09937e76db', 3, 1, 'MyApp', '[]', 0, '2020-11-29 06:32:57', '2020-11-29 06:32:57', '2021-11-29 12:32:57'),
('f9668e5017285066e4092fd7cb4540d0a0082c3d013312b3825dc1770c6b134c9ac5c81834bb4922', 3, 1, 'MyApp', '[]', 0, '2020-11-28 07:49:44', '2020-11-28 07:49:44', '2021-11-28 13:49:44'),
('f9a8b745f192684e1f84e129024dd04fb6fa856a2aa04fbc480f8b6574e098107628f55aacc7b9e6', 3, 1, 'MyApp', '[]', 0, '2020-12-01 06:12:41', '2020-12-01 06:12:41', '2021-12-01 12:12:41'),
('f9dee8c1f0b13a7241c5d2b8de3f13f2cdbc92eeba0d92388c48a1258e8c6dfa5d40ca920c169bd5', 3, 1, 'MyApp', '[]', 0, '2020-11-28 11:18:20', '2020-11-28 11:18:20', '2021-11-28 17:18:20'),
('fd1ce184d699fb23470654a999254ba5049efffa15c468efacfa0746031bca7cd6ec0bb16b1a8494', 3, 1, 'MyApp', '[]', 0, '2020-11-29 06:44:19', '2020-11-29 06:44:19', '2021-11-29 12:44:19'),
('fdb10729647ef0ef5063e5ec0183d9c511e6f423a2500fe0d8c2fb8323cf1ba0aee3667a17b31e83', 3, 1, 'MyApp', '[]', 0, '2020-11-30 11:31:27', '2020-11-30 11:31:27', '2021-11-30 17:31:27');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Dokan Pos Pharmacy Personal Access Client', 'pXem7di0LUPg2TfAAqFUipeTfBxKXGeS4MopCwQn', 'http://localhost', 1, 0, 0, '2020-11-22 11:45:15', '2020-11-22 11:45:15'),
(2, NULL, 'Dokan Pos Pharmacy Password Grant Client', 'pqGEQknBV9YhdcNNeHI3EFoT85SJaskCe9gpuikn', 'http://localhost', 0, 1, 0, '2020-11-22 11:45:15', '2020-11-22 11:45:15');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-11-22 11:45:15', '2020-11-22 11:45:15');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `supplier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid` double(10,2) DEFAULT NULL,
  `due` double(10,2) DEFAULT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `date`, `supplier`, `purchase_no`, `paid`, `due`, `amount`, `details`, `shop`, `user`, `created_at`, `updated_at`) VALUES
(1, '2020-07-18', '1', 'PO3202020', 5000.00, 2900.00, 0.00, NULL, 3, 3, '2020-07-18 16:20:47', '2020-07-18 16:20:47'),
(2, '2020-07-19', 'Cash', 'PO3202021', 10000.00, 650.00, 0.00, NULL, 3, 3, '2020-07-18 20:53:57', '2020-07-18 20:53:57'),
(3, '2020-07-19', 'Cash', 'PO3202022', 2000.00, 40.00, 0.00, NULL, 3, 3, '2020-07-18 20:57:12', '2020-07-18 20:57:12'),
(4, '2020-07-19', 'Cash', 'PO3202023', 200000.00, 2510.00, 0.00, NULL, 3, 3, '2020-07-18 21:40:46', '2020-07-18 21:40:46'),
(5, '2020-11-01', 'Cash', 'PO32020110126', NULL, NULL, 0.00, NULL, 3, 3, '2020-11-01 07:45:15', '2020-11-01 07:45:15'),
(6, '2020-11-25', 'Abul Mia', 'PO32020112529', 12000.00, 2256.00, 0.00, NULL, 3, 3, '2020-11-25 05:36:43', '2020-11-25 05:36:43'),
(7, '2020-11-25', 'Abul Mia', 'PO32020112531', 3.00, 2926.00, 0.00, NULL, 3, 3, '2020-11-25 07:28:29', '2020-11-25 07:28:29'),
(8, '2020-11-25', 'Abul Mia', 'PO32020112532', 4.00, 8482.00, 0.00, NULL, 3, 3, '2020-11-25 07:34:28', '2020-11-25 07:34:28'),
(9, '2020-11-25', 'Abul Mia', 'PO32020112533', 0.00, 12120.00, 0.00, NULL, 3, 3, '2020-11-25 08:51:54', '2020-11-25 08:51:54'),
(10, '2020-11-25', 'Abul Mia', 'PO32020112534', 1.00, 10998.00, 0.00, NULL, 3, 3, '2020-11-25 08:54:13', '2020-11-25 08:54:13'),
(11, '2020-11-25', 'Sahariar', 'PO32020112535', 1300.00, 106.00, 0.00, NULL, 3, 3, '2020-11-25 09:18:19', '2020-11-25 09:18:19'),
(12, '2020-11-25', 'Sahariar', 'PO32020112536', 0.00, 1300.00, 0.00, NULL, 3, 3, '2020-11-25 09:32:52', '2020-11-25 09:32:52'),
(13, '2020-11-27', 'Sahariar', 'PO32020112737', 400.00, 1274.00, 0.00, NULL, 3, 3, '2020-11-27 08:21:16', '2020-11-27 08:21:16'),
(14, '2020-11-27', 'Abul Mia', 'PO3202011271', 400.00, 518.00, 0.00, NULL, 3, 3, '2020-11-27 11:23:55', '2020-11-27 11:23:55'),
(15, '2020-11-30', 'Sahariar', 'PO32020113054', 1.00, 256.00, 0.00, NULL, 3, 3, '2020-11-30 06:54:33', '2020-11-30 06:54:33'),
(16, '2020-11-30', 'Sahariar', 'PO32020113054', 1.00, 256.00, 0.00, NULL, 3, 3, '2020-11-30 06:54:34', '2020-11-30 06:54:34'),
(17, '2020-11-30', 'Abul Mia', 'PO32020113056', 1.00, 999.00, 0.00, NULL, 3, 3, '2020-11-30 06:57:56', '2020-11-30 06:57:56'),
(18, '2020-11-30', 'Abul Mia', 'PO3202011301', 3.00, 1898.00, 0.00, NULL, 3, 3, '2020-11-30 07:11:27', '2020-11-30 07:11:27'),
(19, '2020-11-30', 'Abul Mia', 'PO3202011301', NULL, 675.00, 0.00, NULL, 3, 3, '2020-11-30 07:27:06', '2020-11-30 07:27:06'),
(20, '2020-11-30', 'Sahariar', 'PO32020113063', 1.00, 256.00, 0.00, NULL, 3, 3, '2020-11-30 07:33:08', '2020-11-30 07:33:08'),
(21, '2020-11-30', 'Abul Mia', 'PO32020113064', 2.00, 4310.00, 0.00, NULL, 3, 3, '2020-11-30 07:33:36', '2020-11-30 07:33:36'),
(22, '2020-11-30', 'Abul Mia', 'PO3202011301', 2.00, 1468.00, 0.00, NULL, 3, 3, '2020-11-30 07:48:08', '2020-11-30 07:48:08'),
(23, '2020-11-30', 'Abul Mia', 'PO32020113067', 1.00, 999.00, 0.00, NULL, 3, 3, '2020-11-30 08:18:55', '2020-11-30 08:18:55'),
(24, '2020-11-30', 'Abul Mia', 'PO3202011301', 1.00, 742.00, 0.00, NULL, 3, 3, '2020-11-30 08:20:44', '2020-11-30 08:20:44'),
(25, '2020-11-30', 'Abul Mia', 'PO3202011301', 1.00, 742.00, 0.00, NULL, 3, 3, '2020-11-30 08:23:15', '2020-11-30 08:23:15'),
(26, '2020-11-30', 'Abul Mia', 'PO3202011301', 2.00, 1978.00, 0.00, NULL, 3, 3, '2020-11-30 08:26:37', '2020-11-30 08:26:37'),
(27, '2020-11-30', 'Abul Mia', 'PO3202011301', 2.00, 1978.00, 0.00, NULL, 3, 3, '2020-11-30 08:28:21', '2020-11-30 08:28:21'),
(28, '2020-11-30', 'Abul Mia', 'PO32020113072', 2.00, 4310.00, 0.00, NULL, 3, 3, '2020-11-30 08:28:41', '2020-11-30 08:28:41'),
(29, '2020-11-30', 'Abul Mia', 'PO32020113072', 2.00, 4310.00, 0.00, NULL, 3, 3, '2020-11-30 08:29:58', '2020-11-30 08:29:58'),
(30, '2020-11-30', 'Abul Mia', 'PO3202011301', 2.00, 988.00, 0.00, NULL, 3, 3, '2020-11-30 08:34:11', '2020-11-30 08:34:11'),
(31, '2020-11-30', 'Abul Mia', 'PO3202011301', 2.00, 988.00, 0.00, NULL, 3, 3, '2020-11-30 08:36:38', '2020-11-30 08:36:38'),
(32, '2020-11-30', 'Abul Mia', 'PO3202011301', 2.00, 988.00, 0.00, NULL, 3, 3, '2020-11-30 08:38:34', '2020-11-30 08:38:34'),
(33, '2020-11-30', 'Abul Mia', 'PO3202011301', 2.00, 988.00, 0.00, NULL, 3, 3, '2020-11-30 08:40:25', '2020-11-30 08:40:25'),
(34, '2020-11-30', 'Sahariar', 'PO32020113078', 2.00, 508.00, 0.00, NULL, 3, 3, '2020-11-30 08:41:30', '2020-11-30 08:41:30'),
(35, '2020-11-30', 'Sahariar', 'PO32020113079', 2.00, 390.00, 0.00, NULL, 3, 3, '2020-11-30 08:43:22', '2020-11-30 08:43:22'),
(36, '2020-11-30', 'Sahariar', 'PO32020113079', 2.00, 390.00, 0.00, NULL, 3, 3, '2020-11-30 08:43:58', '2020-11-30 08:43:58'),
(37, '2020-11-30', 'Sahariar', 'PO32020113079', 2.00, 390.00, 0.00, NULL, 3, 3, '2020-11-30 08:44:44', '2020-11-30 08:44:44'),
(38, '2020-11-30', 'Sahariar', 'PO32020113079', 2.00, 390.00, 0.00, NULL, 3, 3, '2020-11-30 08:45:06', '2020-11-30 08:45:06'),
(39, '2020-11-30', 'Sahariar', 'PO32020113083', 2.00, 508.00, 0.00, NULL, 3, 3, '2020-11-30 08:45:58', '2020-11-30 08:45:58'),
(40, '2020-11-30', 'Sahariar', 'PO32020113083', 2.00, 508.00, 0.00, NULL, 3, 3, '2020-11-30 08:46:12', '2020-11-30 08:46:12'),
(41, '2020-11-30', 'Sahariar', 'PO32020113083', 2.00, 508.00, 0.00, NULL, 3, 3, '2020-11-30 08:46:48', '2020-11-30 08:46:48'),
(42, '2020-11-30', 'Sahariar', 'PO32020113083', 2.00, 508.00, 0.00, NULL, 3, 3, '2020-11-30 08:47:16', '2020-11-30 08:47:16'),
(43, '2020-11-30', 'Sahariar', 'PO32020113083', 2.00, 508.00, 0.00, NULL, 3, 3, '2020-11-30 08:47:40', '2020-11-30 08:47:40'),
(44, '2020-11-30', 'Sahariar', 'PO32020113083', 2.00, 508.00, 0.00, NULL, 3, 3, '2020-11-30 09:11:15', '2020-11-30 09:11:15'),
(45, '2020-11-30', 'Sahariar', 'PO32020113083', 2.00, 508.00, 0.00, NULL, 3, 3, '2020-11-30 09:11:33', '2020-11-30 09:11:33'),
(46, '2020-11-30', 'Sahariar', 'PO32020113083', 2.00, 508.00, 0.00, NULL, 3, 3, '2020-11-30 09:15:50', '2020-11-30 09:15:50'),
(47, '2020-11-30', 'Abul Mia', 'PO3202011301', 3.00, 5429.00, 0.00, NULL, 3, 3, '2020-11-30 09:31:05', '2020-11-30 09:31:05'),
(48, '2020-11-30', 'Abul Mia', 'PO3202011301', 3.00, 5429.00, 0.00, NULL, 3, 3, '2020-11-30 09:31:05', '2020-11-30 09:31:05'),
(49, '2020-11-30', 'Abul Mia', 'PO3202011301', 12.00, 3398.00, 0.00, NULL, 3, 3, '2020-11-30 09:33:27', '2020-11-30 09:33:27'),
(50, '2020-11-30', 'Abul Mia', 'PO32020113094', 2.00, 3408.00, 0.00, NULL, 3, 3, '2020-11-30 09:47:28', '2020-11-30 09:47:28'),
(51, '2020-11-30', 'Abul Mia', 'PO3202011301', 1.00, 2920.00, 0.00, NULL, 3, 3, '2020-11-30 10:04:08', '2020-11-30 10:04:08'),
(52, '2020-11-30', 'Sahariar', 'PO32020113096', 399.00, 183.00, 0.00, NULL, 3, 3, '2020-11-30 10:05:35', '2020-11-30 10:05:35'),
(53, '2020-12-01', 'Korim', 'PO52020120197', 20000.00, 15298.00, 0.00, NULL, 5, 5, '2020-12-01 07:33:02', '2020-12-01 07:33:02');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `barcode` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medicine_shelf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `strength` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medicine_unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generic_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_stock` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medicine_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat` decimal(20,2) DEFAULT NULL,
  `tax` decimal(20,2) DEFAULT NULL,
  `seller_price` decimal(20,2) DEFAULT NULL,
  `manufacturer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `manufacturer_price` decimal(20,2) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `shop` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `barcode`, `name`, `category`, `medicine_shelf`, `strength`, `medicine_unit`, `generic_name`, `min_stock`, `medicine_type`, `details`, `vat`, `tax`, `seller_price`, `manufacturer_id`, `manufacturer_price`, `status`, `shop`, `created_at`, `updated_at`) VALUES
(1, 5, 202012011, 'Napa', 'High Pressure', 'Shelf-1', '500 mg', 'mg', '123rwfwrf', '1234', 'Tablates', 'revewv', '12.00', '12.00', '123.00', 7, '1234.00', 1, 5, '2020-12-01 07:29:16', '2020-12-01 07:29:16'),
(2, 5, 202012012, 'Napa Extend', 'Pain killer', 'Select Medicine Shelf', '500 mg', 'Select Medicine Unit', 'Paracetamol', '120', 'Tablates', 'asdfghjnb', '10.00', '10.00', '250.00', 7, '220.00', 1, 5, '2020-12-01 07:30:54', '2020-12-01 07:30:54');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `totalQty` int(11) DEFAULT NULL,
  `subTotal` double(10,2) DEFAULT NULL,
  `discount` double(10,2) DEFAULT NULL,
  `d_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payable` double(10,2) DEFAULT NULL,
  `paid` double(10,2) DEFAULT NULL,
  `return` double(10,2) DEFAULT NULL,
  `due` double(10,2) DEFAULT NULL,
  `p_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `purchase_no`, `supplier`, `date`, `totalQty`, `subTotal`, `discount`, `d_type`, `payable`, `paid`, `return`, `due`, `p_type`, `shop`, `user`, `created_at`, `updated_at`) VALUES
(95, 'PO3202011301', 'Abul Mia', '2020-11-30', 1, 2950.00, 1.00, '%', 2921.00, 1.00, 0.00, 2920.00, 'Cash', 3, 3, '2020-11-30 10:04:08', '2020-11-30 10:04:08'),
(96, 'PO32020113096', 'Sahariar', '2020-11-30', 2, 640.00, 9.00, '%', 582.00, 399.00, 0.00, 183.00, 'Cash', 3, 3, '2020-11-30 10:05:35', '2020-11-30 10:05:35'),
(97, 'PO52020120197', 'Korim', '2020-12-01', 40, 39220.00, 10.00, '%', 35298.00, 20000.00, 0.00, 15298.00, 'Cash', 5, 5, '2020-12-01 07:33:02', '2020-12-01 07:33:02'),
(98, 'PO52020120198', 'Korim', '2020-12-01', 8, 5816.00, 10.00, '%', 5234.00, 20000.00, 14766.00, 0.00, 'Cash', 5, 5, '2020-12-01 07:36:24', '2020-12-01 07:36:24'),
(99, 'PO52020120198', 'Korim', '2020-12-01', 8, 5816.00, 10.00, '%', 5234.00, 20000.00, 14766.00, 0.00, 'Cash', 5, 5, '2020-12-01 07:37:59', '2020-12-01 07:37:59'),
(100, 'PO520201201100', 'Korim', '2020-12-01', 4, 2908.00, 0.00, '%', 2908.00, 20000.00, 17092.00, 0.00, 'Cash', 5, 5, '2020-12-01 07:39:22', '2020-12-01 07:39:22');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_cancels`
--

CREATE TABLE `purchase_cancels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancel_date` date NOT NULL,
  `p_date` date NOT NULL,
  `totalQty` int(11) DEFAULT NULL,
  `subTotal` double(10,2) DEFAULT NULL,
  `shop` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

CREATE TABLE `purchase_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `batch_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `cost` double(8,2) DEFAULT NULL,
  `total` double(10,2) DEFAULT NULL,
  `shop` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_items`
--

INSERT INTO `purchase_items` (`id`, `purchase_no`, `name`, `code`, `date`, `expiry_date`, `batch_no`, `qty`, `cost`, `total`, `shop`, `user`, `created_at`, `updated_at`) VALUES
(160, 'PO3202011301', 'Dexpoten', '51435', '2020-11-30', NULL, '1', 1, 1000.00, 1000.00, 3, 3, NULL, NULL),
(161, 'PO3202011301', 'wine', '51434', '2020-11-30', NULL, '2', 1, 10.00, 10.00, 3, 3, NULL, NULL),
(162, 'PO3202011301', 'wine', '51433', '2020-11-30', NULL, '3', 1, 1200.00, 1200.00, 3, 3, NULL, NULL),
(163, 'PO3202011301', 'drinks', '511232143', '2020-11-30', NULL, '4', 1, 740.00, 740.00, 3, 3, NULL, NULL),
(164, 'PO32020113096', 'Napa 50', '202011251', '2020-11-30', NULL, NULL, 3, 120.00, 360.00, 3, 3, NULL, NULL),
(165, 'PO32020113096', 'Napa Extend', '202011252', '2020-11-30', NULL, NULL, 2, 140.00, 280.00, 3, 3, NULL, NULL),
(166, 'PO52020120197', 'Napa', '202012011', '2020-12-01', '2021-01-09', '1', 30, 1234.00, 37020.00, 5, 5, NULL, NULL),
(167, 'PO52020120197', 'Napa Extend', '202012012', '2020-12-01', '2021-01-09', '2', 10, 220.00, 2200.00, 5, 5, NULL, NULL),
(168, 'PO52020120198', 'Napa', '202012011', '2020-12-01', '2021-06-09', '1', 4, 1234.00, 4936.00, 5, 5, NULL, NULL),
(169, 'PO52020120198', 'Napa Extend', '202012012', '2020-12-01', '2021-06-09', '2', 4, 220.00, 880.00, 5, 5, NULL, NULL),
(170, 'PO52020120198', 'Napa', '202012011', '2020-12-01', '2021-06-09', '1', 4, 1234.00, 4936.00, 5, 5, NULL, NULL),
(171, 'PO52020120198', 'Napa Extend', '202012012', '2020-12-01', '2021-06-09', '2', 4, 220.00, 880.00, 5, 5, NULL, NULL),
(172, 'PO520201201100', 'Napa', '202012011', '2020-12-01', '2021-01-09', '1', 2, 1234.00, 2468.00, 5, 5, NULL, NULL),
(173, 'PO520201201100', 'Napa Extend', '202012012', '2020-12-01', '2021-01-09', '2', 2, 220.00, 440.00, 5, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `references`
--

CREATE TABLE `references` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bkash_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reference_payments`
--

CREATE TABLE `reference_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `collection` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `totalQty` int(11) DEFAULT NULL,
  `subTotal` double(10,2) DEFAULT NULL,
  `discount` double(10,2) DEFAULT NULL,
  `d_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dCharge` double(10,2) DEFAULT NULL,
  `payable` double(10,2) DEFAULT NULL,
  `paid` double(10,2) DEFAULT NULL,
  `return` double(10,2) DEFAULT NULL,
  `due` double(10,2) DEFAULT NULL,
  `p_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop` int(11) NOT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `sale_no`, `customer`, `delivery`, `date`, `totalQty`, `subTotal`, `discount`, `d_type`, `dCharge`, `payable`, `paid`, `return`, `due`, `p_type`, `shop`, `user`, `created_at`, `updated_at`) VALUES
(1, 'INV320201', '0', '1', '2020-11-25', 2, 400.00, 10.00, '%', 50.00, 410.00, 400.00, 0.00, 10.00, 'Cash', 3, 'Demo CRM', '2020-11-25 09:28:45', '2020-11-25 09:28:45'),
(2, 'INV320202', '0', '1', '2020-11-27', 100, 20600.00, 10.00, '%', 0.00, 18540.00, 20000.00, 1460.00, 0.00, 'Cash', 3, 'Demo CRM', '2020-11-27 08:24:40', '2020-11-27 08:24:40');

-- --------------------------------------------------------

--
-- Table structure for table `sale_cancels`
--

CREATE TABLE `sale_cancels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancel_date` date NOT NULL,
  `s_date` date NOT NULL,
  `totalQty` int(11) DEFAULT NULL,
  `subTotal` double(10,2) DEFAULT NULL,
  `shop` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

CREATE TABLE `sale_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `total` double(10,2) DEFAULT NULL,
  `shop` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_items`
--

INSERT INTO `sale_items` (`id`, `sale_no`, `name`, `code`, `date`, `qty`, `price`, `total`, `shop`, `user`, `created_at`, `updated_at`) VALUES
(1, 'INV320201', 'Napa 50', '202011251', '2020-11-25', 1, 200.00, 200.00, 3, 3, NULL, NULL),
(2, 'INV320201', 'Napa Extend', '202011252', '2020-11-25', 1, 200.00, 200.00, 3, 3, NULL, NULL),
(3, 'INV320202', 'Napa Extend', '202011252', '2020-11-27', 100, 206.00, 20600.00, 3, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `business_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `user_id`, `business_name`, `business_type`, `reference_no`, `area`, `address`, `created_at`, `updated_at`) VALUES
(1, 2, 'Demo Shop', 'E-commerce', NULL, 'Dhaka', 'Dhaka-1205.', '2020-07-07 16:44:18', '2020-07-07 16:44:18'),
(2, 3, 'Nrew f fdx', 'Book Shop', NULL, 'Coxsbazar', 'nai', '2020-07-07 17:11:35', '2020-07-07 17:11:35'),
(3, 4, 'AMAR sHOP', 'Dealership', NULL, 'Lakshmipur', 'Dhaka', '2020-11-01 07:59:21', '2020-11-01 07:59:21'),
(4, 5, 'Emon Hossain', 'E-commerce', NULL, 'Coxsbazar', 'block:B,road:3,house:17', '2020-12-01 07:14:19', '2020-12-01 07:14:19');

-- --------------------------------------------------------

--
-- Table structure for table `shop_employees`
--

CREATE TABLE `shop_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_packages`
--

CREATE TABLE `shop_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `days` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_packages`
--

INSERT INTO `shop_packages` (`id`, `name`, `price`, `days`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Startup', '500', '30', 1, '2020-11-01 08:40:05', '2020-11-01 08:40:05'),
(2, 'Professional', '1000', '30', 1, '2020-11-01 08:40:26', '2020-11-01 08:40:26'),
(3, 'Enterprise', '1500', '30', 1, '2020-11-01 08:40:46', '2020-11-01 08:40:46');

-- --------------------------------------------------------

--
-- Table structure for table `shop_payments`
--

CREATE TABLE `shop_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `package` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `days` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `shop` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_payments`
--

INSERT INTO `shop_payments` (`id`, `date`, `package`, `price`, `days`, `type`, `number`, `comment`, `status`, `shop`, `created_at`, `updated_at`) VALUES
(1, '2020-07-07', 'Free Demo Package', '0', '15', NULL, NULL, NULL, 1, 2, '2020-07-07 16:44:18', '2020-07-07 16:44:18'),
(2, '2020-07-07', 'Free Demo Package', '0', '15', NULL, NULL, NULL, 1, 3, '2020-07-07 17:11:35', '2020-07-07 17:11:35'),
(3, '2020-11-01', 'Free Demo Package', '0', '15', NULL, NULL, NULL, 0, 4, '2020-11-01 07:59:21', '2020-11-01 08:45:06'),
(4, '2020-11-01', 'Enterprise', '1500', '30', 'Bkash', '1324536475869', 'dfsgdhf', 0, 4, '2020-11-01 08:41:37', '2020-11-01 08:45:06'),
(5, '2020-11-01', 'Professional', '1000', '30', 'Bkash', '123456789', NULL, 1, 4, '2020-11-01 08:45:06', '2020-11-01 08:45:06'),
(6, '2020-12-01', 'Free Demo Package', '0', '15', NULL, NULL, NULL, 1, 5, '2020-12-01 07:14:19', '2020-12-01 07:14:19');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimum` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` double(10,2) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `shop` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `name`, `code`, `minimum`, `quantity`, `unit`, `cost`, `price`, `shop`, `user`, `created_at`, `updated_at`) VALUES
(99, 'Dexpoten', '51435', NULL, 1, 'mg', 1000.00, 150.00, 3, 3, NULL, NULL),
(100, 'wine', '51434', NULL, 1, 'mg', 10.00, 15.00, 3, 3, NULL, NULL),
(101, 'wine', '51433', NULL, 1, 'mg', 1200.00, 15.00, 3, 3, NULL, NULL),
(102, 'drinks', '511232143', NULL, 1, 'ml', 740.00, 1000.00, 3, 3, NULL, NULL),
(103, 'Napa 50', '202011251', 123457, 3, 'mg', 120.00, 200.00, 3, 3, NULL, NULL),
(104, 'Napa Extend', '202011252', 123, 2, 'mg', 140.00, 200.00, 3, 3, NULL, NULL),
(105, 'Napa', '202012011', 1234, 40, 'mg', 373.00, 123.00, 5, 5, NULL, NULL),
(106, 'Napa Extend', '202012012', 120, 20, 'Select Medicine Unit', 246.25, 250.00, 5, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` double(10,2) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `shop` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `mobile`, `address`, `balance`, `status`, `shop`, `created_at`, `updated_at`) VALUES
(1, 'Demo Supplier', '0192019090', 'nai', 100.00, 1, 3, '2020-07-18 15:07:26', '2020-07-18 15:07:26'),
(2, 'Maria Fatema', '0987654321', NULL, NULL, 1, 3, '2020-10-25 04:22:49', '2020-10-25 04:22:49'),
(3, 'Beximco new', '0987654321', NULL, NULL, 0, 3, '2020-10-25 05:12:42', '2020-10-26 06:06:26'),
(4, 'Menufecturer Info', NULL, NULL, NULL, 1, 3, '2020-10-26 09:23:53', '2020-10-26 09:23:53'),
(5, 'Sahariar', '+8801624911270', 'block:B,road:3,house:17\nBanasree,Rampura,Dhaka', 400.00, 1, 3, '2020-10-26 09:25:45', '2020-11-22 04:37:17'),
(6, 'Abul Mia', '0987654321667', NULL, NULL, 1, 3, '2020-10-26 09:27:27', '2020-10-26 09:27:27'),
(7, 'Korim', 'sdfq1231214', '12122312', 22124.00, 1, 5, '2020-12-01 07:28:23', '2020-12-01 07:28:23');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `b_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_no` int(11) DEFAULT NULL,
  `b_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` tinyint(4) DEFAULT NULL,
  `priority` tinyint(4) DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_attachments`
--

CREATE TABLE `ticket_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_no` int(11) DEFAULT NULL,
  `attachment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_statuses`
--

CREATE TABLE `ticket_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ticket_no` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Admin',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `mobile`, `email`, `role`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Demo Reference', '01910000000', 'reference@gmail.com', 'Reference', 'Active', NULL, '$2y$10$1KjPrsV3lVqxyASb/.mL8OVGS11eAfbakvpYegvY7.pxAeVZbos5K', NULL, '2020-07-07 17:00:00', NULL),
(2, 'Super Admin', '01210000000', 'demo@gmail.com', 'SuperAdmin', 'Active', NULL, '$2y$10$1KjPrsV3lVqxyASb/.mL8OVGS11eAfbakvpYegvY7.pxAeVZbos5K', 'PDumTK41FJ0dX6LVJy2puO8lMeWrmbwH0MtlGLfEjB6y8Ty7L1MZaCAFdip4', '2020-07-07 16:44:18', '2020-07-07 16:44:18'),
(3, 'Demo CRM', '01410000000', 'new@gmail.com', 'Admin', 'Active', NULL, '$2y$10$1KjPrsV3lVqxyASb/.mL8OVGS11eAfbakvpYegvY7.pxAeVZbos5K', '5q8nJbbA8a0zqFGGbEAW9xpK6hcJq1xV7wjCY3b2ZOtkHOxh7zk8ZMj9KqtW', '2020-07-07 17:11:35', '2020-07-07 17:11:35'),
(4, 'mONIR', '01909642730', 'monir@gmail.com', 'Admin', 'Active', NULL, '$2y$10$1KjPrsV3lVqxyASb/.mL8OVGS11eAfbakvpYegvY7.pxAeVZbos5K', '57HP22LHwsXSKGcP4svVQP3BQEd6iO2FFTy5RtNmeS1keLwFkCipKhkr1HAF', '2020-11-01 07:59:21', '2020-11-01 07:59:21'),
(5, 'Emon Hossain', '01940000000', 'emon@gmail.com', 'Admin', 'Active', NULL, '$2y$10$CM18WcrAbET/r30JJVRZ3.oddYof0/MWxPVeg0Myfu8CUvip7P3xK', NULL, '2020-12-01 07:14:19', '2020-12-01 07:14:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batch_stocks`
--
ALTER TABLE `batch_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_types`
--
ALTER TABLE `expense_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine_shelves`
--
ALTER TABLE `medicine_shelves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine_types`
--
ALTER TABLE `medicine_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine_units`
--
ALTER TABLE `medicine_units`
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
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_manufacturer_id_foreign` (`manufacturer_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_cancels`
--
ALTER TABLE `purchase_cancels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `references`
--
ALTER TABLE `references`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reference_payments`
--
ALTER TABLE `reference_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_cancels`
--
ALTER TABLE `sale_cancels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_employees`
--
ALTER TABLE `shop_employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_packages`
--
ALTER TABLE `shop_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_payments`
--
ALTER TABLE `shop_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_attachments`
--
ALTER TABLE `ticket_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_statuses`
--
ALTER TABLE `ticket_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `batch_stocks`
--
ALTER TABLE `batch_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_types`
--
ALTER TABLE `expense_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicine_shelves`
--
ALTER TABLE `medicine_shelves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `medicine_types`
--
ALTER TABLE `medicine_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `medicine_units`
--
ALTER TABLE `medicine_units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `purchase_cancels`
--
ALTER TABLE `purchase_cancels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `references`
--
ALTER TABLE `references`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reference_payments`
--
ALTER TABLE `reference_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sale_cancels`
--
ALTER TABLE `sale_cancels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shop_employees`
--
ALTER TABLE `shop_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_packages`
--
ALTER TABLE `shop_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shop_payments`
--
ALTER TABLE `shop_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_attachments`
--
ALTER TABLE `ticket_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_statuses`
--
ALTER TABLE `ticket_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_manufacturer_id_foreign` FOREIGN KEY (`manufacturer_id`) REFERENCES `suppliers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
