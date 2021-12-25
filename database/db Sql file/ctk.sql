-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2021 at 06:09 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ctk`
--

-- --------------------------------------------------------

--
-- Table structure for table `abouts`
--

CREATE TABLE `abouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`information`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `abouts`
--

INSERT INTO `abouts` (`id`, `description`, `information`, `created_at`, `updated_at`) VALUES
(1, '<p>Sohan bhai</p>', '[{\"description\":\"info 5\"},{\"description\":\"info 6\"},{\"description\":\"info 3\"},{\"description\":\"infor 4\"}]', '2021-03-05 13:48:53', '2021-03-05 14:07:58');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` tinyint(4) NOT NULL DEFAULT 1,
  `block` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('a','b','c') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `mobile`, `address`, `image`, `role_id`, `block`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'Admin', 'admin@gmail.com', NULL, '$2y$10$xVSRN32XUWseVtIiGER5auYNjZPwIufIP2Uy40rzP5vdQSRRpuLs2', '1234567890', 'Sylhet', 'beckham.jpg', 1, 0, 'a', '462gTAyXYJrtxCEkEtmDFrkmmpYPMytIeFBPwyxKb8flqAMh4CYI2nKmsYEK', NULL, '2021-03-05 13:00:37'),
(2, 'New Admin', 'new admin', 'new@admin.com', NULL, '$2y$10$XhGYM92ax2ynnTVYxI5Dr.JMbLoV6nr2/An2/jJybwqS/a0tWWLB.', '1234567890', NULL, NULL, 1, 0, 'a', NULL, '2021-02-27 23:50:35', '2021-02-27 23:50:35');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dominions`
--

CREATE TABLE `dominions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dominions`
--

INSERT INTO `dominions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2020-06-01 09:00:24', '2020-06-01 09:00:24'),
(2, 'Role', '2020-06-01 09:01:49', '2020-06-01 09:01:49'),
(14, 'Permission', '2020-06-01 11:53:39', '2020-06-01 11:53:39'),
(16, 'Dominion', '2020-06-04 03:03:54', '2020-06-04 03:03:54'),
(17, 'Process', '2020-06-04 03:04:11', '2020-06-04 03:04:11'),
(19, 'Menu', '2020-06-05 02:11:40', '2020-06-19 02:35:47'),
(72, 'About', '2021-03-05 13:11:52', '2021-03-05 13:11:52'),
(73, 'Parishad', '2021-03-05 14:16:28', '2021-03-05 14:16:28'),
(74, 'Notice', '2021-03-08 23:39:53', '2021-03-08 23:39:53'),
(75, 'Shava', '2021-03-08 23:40:37', '2021-03-08 23:40:37'),
(76, 'Staff', '2021-03-08 23:45:31', '2021-03-08 23:45:31'),
(77, 'Category', '2021-03-08 23:48:38', '2021-03-08 23:48:38'),
(78, 'File', '2021-03-08 23:51:15', '2021-03-08 23:51:15'),
(79, 'HomeSetting', '2021-03-11 07:53:34', '2021-03-11 07:53:34'),
(80, 'Gallery', '2021-03-11 11:21:01', '2021-03-11 11:21:01'),
(81, 'Slider', '2021-03-12 01:37:36', '2021-03-12 01:37:36');

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
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('a','d') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'a',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` int(11) NOT NULL DEFAULT 50,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `image`, `serial`, `created_at`, `updated_at`) VALUES
(1, 'upload/Gallerys/bXkpuN809WtzhnrdqJ5QVZGfQ09Q0URZLsBZSMW4.jpg', 3, '2021-03-12 01:40:49', '2021-03-13 10:49:01'),
(2, 'upload/Gallerys/I47Z4wA89MchYYNpfkSs4JBg4YdmOv7rhndHzKN2.jpg', 2, '2021-03-12 01:40:49', '2021-03-13 10:49:01'),
(3, 'upload/Gallerys/Tikt6S9jmKPTUrcnhRjJNeflDTVE274or3WMKeqs.jpg', 4, '2021-03-12 01:40:49', '2021-03-13 10:49:01'),
(4, 'upload/Gallerys/TC3nogWvxX61kKbjVOi2bgmquAJfuC2dgBhwPdro.jpg', 1, '2021-03-12 01:40:49', '2021-03-13 10:38:11'),
(5, 'upload/Gallerys/Td5UVmbU8CEx6IuQXCJgGEvvZbeVUKky1kRe1jPx.jpg', 3, '2021-03-12 01:40:49', '2021-03-13 10:38:11'),
(6, 'upload/Gallerys/OOFRb1TMMLq7tzjvt6qZEvNYDPO0NIkLY2iL3ouJ.jpg', 7, '2021-03-12 01:40:49', '2021-03-13 10:38:11'),
(7, 'upload/Gallerys/p3YehytvLL6aFYOGvmoGrJoshABbhf2xEWpXnb8u.jpg', 5, '2021-03-12 01:40:49', '2021-03-13 10:38:11'),
(8, 'upload/Gallerys/T4gPnvAAeD7AgG7DQ9m26HQlpmiUrefJXkLxrX5b.jpg', 2, '2021-03-12 01:40:49', '2021-03-13 10:38:11');

-- --------------------------------------------------------

--
-- Table structure for table `home_settings`
--

CREATE TABLE `home_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mayor_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mayor_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twiter_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkdin_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_pic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_settings`
--

INSERT INTO `home_settings` (`id`, `logo`, `site_name`, `mayor_name`, `mayor_image`, `app_image`, `app_url`, `fb_url`, `twiter_url`, `linkdin_url`, `google_url`, `youtube_url`, `address`, `cover_pic`, `created_at`, `updated_at`) VALUES
(1, 'upload/sites/4S9j1td5j7HvnYaPpc5IY82v3SUFomEopKBkFIUa.jpg', 'Chhatak Paurashavaa', 'yu', 'upload/sites/XQkyEs6gufhul9ITv5jYHZqa0wbR4SzmsUn8ATd7.jpg', 'upload/sites/llT2SVwERmGcn6y4j9fOOhTw1M72yWwlOcx9RjNL.jpg', 'io', 'q', 'w', 'e', 'r', 't', 'i', 'upload/sites/TD7Z0GxkdpsJeJZVtALDZU9FdlAZ4ZdMqDoZKAUc.jpg', '2021-03-11 10:49:02', '2021-03-11 11:12:36');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `dominion_id` int(11) DEFAULT NULL,
  `process_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `route_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `position` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `dominion_id`, `process_id`, `name`, `params`, `icon`, `route_name`, `guard`, `position`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, 'System Settingss', NULL, '<i class=\"fa fa-cogs\"></i>', NULL, 'admin', 50, '2020-06-05 14:20:28', '2021-01-03 03:04:11'),
(2, 1, 2, 8, 'Role', NULL, '<i class=\"fa fa-circle-o\"></i>', 'role.index', 'admin', 1, '2020-06-05 14:24:46', '2020-06-05 14:24:46'),
(3, 1, 16, 38, 'Dominion', NULL, '<i class=\"fa fa-circle-o\"></i>', 'dominion.index', 'admin', 2, '2020-06-05 14:25:21', '2020-06-05 14:25:21'),
(4, 1, 17, 45, 'Process', NULL, '<i class=\"fa fa-circle-o\"></i>', 'process.index', 'admin', 3, '2020-06-07 10:58:49', '2020-06-07 10:58:49'),
(5, 1, 14, 30, 'Permission', NULL, '<i class=\"fa fa-circle-o\"></i>', 'permission.index', 'admin', 4, '2020-06-07 11:00:46', '2020-06-07 11:00:46'),
(6, 1, 19, 52, 'Authorized Menu', NULL, '<i class=\"fa fa-circle-o\"></i>', 'menu.index', 'admin', 5, '2020-06-07 11:01:28', '2020-06-07 11:01:28'),
(7, NULL, 1, 1, 'Admins', NULL, '<i class=\"fa fa-users\"></i>', 'admin.index', 'admin', 49, '2020-06-07 11:02:26', '2020-06-29 07:51:03'),
(11, NULL, NULL, NULL, 'Master Setup', NULL, '<i class=\"fa fa-asterisk\" aria-hidden=\"true\"></i>', NULL, 'admin', 1, '2020-06-19 07:54:59', '2020-06-29 07:51:53'),
(61, NULL, 72, 330, 'About', NULL, '<i class=\"fa fa-user-circle-o\" aria-hidden=\"true\"></i>', 'about.index', 'admin', 5, '2021-03-05 13:14:05', '2021-03-05 13:14:05'),
(62, 74, 73, 337, 'Parishad', NULL, '<i class=\"fa fa-users\"></i>', 'parishad.index', 'admin', 5, '2021-03-05 14:17:59', '2021-03-13 10:40:21'),
(63, NULL, 74, 344, 'Notice', NULL, '<i class=\"fa fa-circle-o\"></i>', 'notice.index', 'admin', 8, '2021-03-08 23:41:29', '2021-03-08 23:41:29'),
(64, NULL, 75, 351, 'Sheba', NULL, '<i class=\"fa fa-circle-o text-aqua\"></i>', 'shava.index', 'admin', 12, '2021-03-08 23:42:12', '2021-03-08 23:42:12'),
(65, 76, 76, 358, 'Staff', NULL, '<i class=\"fa fa-circle-o text-aqua\"></i>', 'staff.index', 'admin', 15, '2021-03-08 23:46:12', '2021-03-13 11:01:15'),
(66, NULL, 77, 365, 'Category', NULL, '<i class=\"fa fa-circle-o text-aqua\"></i>', 'category.index', 'admin', 30, '2021-03-08 23:49:44', '2021-03-08 23:49:44'),
(67, NULL, 78, 372, 'Download', NULL, '<i class=\"fa fa-circle-o text-aqua\"></i>', 'file.index', 'admin', 20, '2021-03-08 23:52:06', '2021-03-08 23:52:06'),
(68, NULL, 79, 379, 'Home', NULL, '<i class=\"fa fa-circle-o text-aqua\"></i>', 'homesetting.index', 'admin', 18, '2021-03-11 07:54:45', '2021-03-11 07:54:45'),
(69, 71, 80, 387, 'Gallery', NULL, '<i class=\"fa fa-circle-o text-aqua\"></i>', 'gallery.index', 'admin', 25, '2021-03-11 11:21:54', '2021-03-12 01:47:20'),
(70, 72, 81, 394, 'Slider', NULL, '<i class=\"fa fa-circle-o text-aqua\"></i>', 'slider.index', 'admin', 30, '2021-03-12 01:38:29', '2021-03-12 01:48:43'),
(71, NULL, NULL, NULL, 'Photo Gallery', NULL, '<i class=\"fa fa-file-image-o\" aria-hidden=\"true\"></i>', NULL, 'admin', 15, '2021-03-12 01:46:25', '2021-03-12 01:46:52'),
(72, NULL, NULL, NULL, 'Sliders', NULL, '<i class=\"fa fa-sliders\" aria-hidden=\"true\"></i>', NULL, 'admin', 18, '2021-03-12 01:48:26', '2021-03-12 01:48:26'),
(73, 71, 80, 401, 'Position', NULL, '<i class=\"fa fa-circle-o text-aqua\"></i>', 'gallery.position', 'admin', 100, '2021-03-12 01:51:51', '2021-03-12 01:53:22'),
(74, NULL, NULL, NULL, 'Parishad', NULL, '<i class=\"fa fa-circle-o text-aqua\"></i>', NULL, 'admin', 30, '2021-03-13 10:40:07', '2021-03-13 10:40:07'),
(75, 74, 73, 402, 'Position', NULL, '<i class=\"fa fa-circle-o text-aqua\"></i>', 'parishad.position', 'admin', 50, '2021-03-13 10:44:18', '2021-03-13 10:44:18'),
(76, NULL, NULL, NULL, 'Staffs', NULL, '<i class=\"fa fa-circle-o text-aqua\"></i>', NULL, 'admin', 28, '2021-03-13 11:01:00', '2021-03-13 11:01:00'),
(77, 76, 76, 404, 'Position', NULL, '<i class=\"fa fa-circle-o text-aqua\"></i>', 'staff.position', 'admin', 50, '2021-03-13 11:01:43', '2021-03-13 11:04:33');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_05_31_144317_create_admins_table', 1),
(6, '2020_06_01_142131_create_dominions_table', 1),
(7, '2020_06_01_142319_create_processes_table', 1),
(8, '2020_06_01_174452_create_permissions_table', 1),
(9, '2020_06_05_080001_create_menus_table', 1),
(57, '2020_06_01_072036_create_roles_table', 17),
(58, '2014_10_12_000000_create_users_table', 18),
(59, '2021_03_05_190537_create_abouts_table', 19),
(64, '2021_03_05_201613_create_parishads_table', 20),
(66, '2021_03_07_075713_create_shavas_table', 21),
(67, '2021_03_07_180242_create_categories_table', 21),
(68, '2021_03_07_190317_create_files_table', 21),
(69, '2021_03_08_135336_create_notices_table', 21),
(70, '2021_03_08_180256_create_home_settings_table', 22),
(72, '2021_03_11_174936_create_sliders_table', 24),
(73, '2021_03_11_172010_create_galleries_table', 25),
(74, '2021_03_06_134810_create_staff_table', 26);

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_desc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_desc` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` int(11) NOT NULL DEFAULT 50,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parishads`
--

CREATE TABLE `parishads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fathers_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cell` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` int(11) NOT NULL DEFAULT 50,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'avatar.png',
  `status` enum('a','d') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'a',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parishads`
--

INSERT INTO `parishads` (`id`, `name`, `designation`, `fathers_name`, `address`, `cell`, `serial`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'sajkdn', 'njksnd', 'sfndjkns', NULL, 'sdjkf', 1, 'upload/image/esGOeUze1jCmFm5hGpmNdSrnk2aw6NwUUMcp3339.jpg', 'a', '2021-03-06 00:14:32', '2021-03-13 10:49:57'),
(2, 'nkj`', 'adkjas', 'dfjks', NULL, 'sdjkfnjks', 3, 'upload/parishad/OWi9ZUzfnF4fHd4PLvYDnpMAg3ZiEWxrj2p9G8vx.jpg', 'a', '2021-03-06 00:22:35', '2021-03-13 10:49:57'),
(3, 'New member', 'dsfsd', 'sdfds', NULL, 'sdfs', 4, 'upload/parishad/ipJ3R170SlO62U5utqEghWY2nHqCdS8nHpGbAALl.jpg', 'a', '2021-03-06 00:31:50', '2021-03-13 10:49:57'),
(4, 'CHeck image', 'ndjkf', 'nsdjkf', NULL, 'sd hf', 2, 'upload/parishad/owSg9e99fbRuLo83GkFTVYiS9JvKWmSuVDbPZSn3.jpg', 'a', '2021-03-06 00:39:01', '2021-03-13 10:49:57');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permissions` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `role_id`, `permissions`, `created_at`, `updated_at`) VALUES
(9, 1, '[\"{\\\"id\\\":1,\\\"dominion_id\\\":1,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Index\\\",\\\"route_name\\\":\\\"admin.index\\\",\\\"created_at\\\":\\\"2020-06-01T15:00:24.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-03T16:01:42.000000Z\\\"}\",\"{\\\"id\\\":2,\\\"dominion_id\\\":1,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Create\\\",\\\"route_name\\\":\\\"admin.create\\\",\\\"created_at\\\":\\\"2020-06-01T15:00:24.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-01T15:00:24.000000Z\\\"}\",\"{\\\"id\\\":3,\\\"dominion_id\\\":1,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Store\\\",\\\"route_name\\\":\\\"admin.store\\\",\\\"created_at\\\":\\\"2020-06-01T15:00:24.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-01T15:00:24.000000Z\\\"}\",\"{\\\"id\\\":4,\\\"dominion_id\\\":1,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Show\\\",\\\"route_name\\\":\\\"admin.show\\\",\\\"created_at\\\":\\\"2020-06-01T15:00:24.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-01T15:00:24.000000Z\\\"}\",\"{\\\"id\\\":5,\\\"dominion_id\\\":1,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Edit\\\",\\\"route_name\\\":\\\"admin.edit\\\",\\\"created_at\\\":\\\"2020-06-01T15:00:24.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-01T15:00:24.000000Z\\\"}\",\"{\\\"id\\\":6,\\\"dominion_id\\\":1,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Update\\\",\\\"route_name\\\":\\\"admin.update\\\",\\\"created_at\\\":\\\"2020-06-01T15:00:24.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-01T15:00:24.000000Z\\\"}\",\"{\\\"id\\\":7,\\\"dominion_id\\\":1,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Destroy\\\",\\\"route_name\\\":\\\"admin.destroy\\\",\\\"created_at\\\":\\\"2020-06-01T15:00:24.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-01T15:00:24.000000Z\\\"}\",\"{\\\"id\\\":37,\\\"dominion_id\\\":1,\\\"guard\\\":null,\\\"name\\\":\\\"profile\\\",\\\"route_name\\\":\\\"admin.profile\\\",\\\"created_at\\\":\\\"2020-06-03T15:45:31.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-03T15:45:31.000000Z\\\"}\",\"{\\\"id\\\":66,\\\"dominion_id\\\":1,\\\"guard\\\":null,\\\"name\\\":\\\"updateProfile\\\",\\\"route_name\\\":\\\"admin.updateprofile\\\",\\\"created_at\\\":\\\"2020-06-05T09:35:42.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-05T09:35:42.000000Z\\\"}\",\"{\\\"id\\\":82,\\\"dominion_id\\\":1,\\\"guard\\\":null,\\\"name\\\":\\\"changePassword\\\",\\\"route_name\\\":\\\"admin.changepassword\\\",\\\"created_at\\\":\\\"2020-06-19T13:46:30.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-19T13:46:30.000000Z\\\"}\",\"{\\\"id\\\":8,\\\"dominion_id\\\":2,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Index\\\",\\\"route_name\\\":\\\"role.index\\\",\\\"created_at\\\":\\\"2020-06-01T15:01:49.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-01T15:01:49.000000Z\\\"}\",\"{\\\"id\\\":9,\\\"dominion_id\\\":2,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Create\\\",\\\"route_name\\\":\\\"role.create\\\",\\\"created_at\\\":\\\"2020-06-01T15:01:49.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-01T15:01:49.000000Z\\\"}\",\"{\\\"id\\\":10,\\\"dominion_id\\\":2,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Store\\\",\\\"route_name\\\":\\\"role.store\\\",\\\"created_at\\\":\\\"2020-06-01T15:01:49.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-01T15:01:49.000000Z\\\"}\",\"{\\\"id\\\":11,\\\"dominion_id\\\":2,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Show\\\",\\\"route_name\\\":\\\"role.show\\\",\\\"created_at\\\":\\\"2020-06-01T15:01:49.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-01T15:01:49.000000Z\\\"}\",\"{\\\"id\\\":12,\\\"dominion_id\\\":2,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Edit\\\",\\\"route_name\\\":\\\"role.edit\\\",\\\"created_at\\\":\\\"2020-06-01T15:01:49.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-01T15:01:49.000000Z\\\"}\",\"{\\\"id\\\":13,\\\"dominion_id\\\":2,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Update\\\",\\\"route_name\\\":\\\"role.update\\\",\\\"created_at\\\":\\\"2020-06-01T15:01:49.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-01T15:01:49.000000Z\\\"}\",\"{\\\"id\\\":14,\\\"dominion_id\\\":2,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Destroy\\\",\\\"route_name\\\":\\\"role.destroy\\\",\\\"created_at\\\":\\\"2020-06-01T15:01:49.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-01T15:01:49.000000Z\\\"}\",\"{\\\"id\\\":30,\\\"dominion_id\\\":14,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Index\\\",\\\"route_name\\\":\\\"permission.index\\\",\\\"created_at\\\":\\\"2020-06-01T17:53:39.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-01T17:53:39.000000Z\\\"}\",\"{\\\"id\\\":31,\\\"dominion_id\\\":14,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Create\\\",\\\"route_name\\\":\\\"permission.create\\\",\\\"created_at\\\":\\\"2020-06-01T17:53:40.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-01T17:53:40.000000Z\\\"}\",\"{\\\"id\\\":32,\\\"dominion_id\\\":14,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Store\\\",\\\"route_name\\\":\\\"permission.store\\\",\\\"created_at\\\":\\\"2020-06-01T17:53:40.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-01T17:53:40.000000Z\\\"}\",\"{\\\"id\\\":33,\\\"dominion_id\\\":14,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Show\\\",\\\"route_name\\\":\\\"permission.show\\\",\\\"created_at\\\":\\\"2020-06-01T17:53:40.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-01T17:53:40.000000Z\\\"}\",\"{\\\"id\\\":34,\\\"dominion_id\\\":14,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Edit\\\",\\\"route_name\\\":\\\"permission.edit\\\",\\\"created_at\\\":\\\"2020-06-01T17:53:40.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-01T17:53:40.000000Z\\\"}\",\"{\\\"id\\\":35,\\\"dominion_id\\\":14,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Update\\\",\\\"route_name\\\":\\\"permission.update\\\",\\\"created_at\\\":\\\"2020-06-01T17:53:40.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-01T17:53:40.000000Z\\\"}\",\"{\\\"id\\\":36,\\\"dominion_id\\\":14,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Destroy\\\",\\\"route_name\\\":\\\"permission.destroy\\\",\\\"created_at\\\":\\\"2020-06-01T17:53:40.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-01T17:53:40.000000Z\\\"}\",\"{\\\"id\\\":38,\\\"dominion_id\\\":16,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Index\\\",\\\"route_name\\\":\\\"dominion.index\\\",\\\"created_at\\\":\\\"2020-06-04T09:03:54.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-04T09:03:54.000000Z\\\"}\",\"{\\\"id\\\":39,\\\"dominion_id\\\":16,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Create\\\",\\\"route_name\\\":\\\"dominion.create\\\",\\\"created_at\\\":\\\"2020-06-04T09:03:54.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-04T09:03:54.000000Z\\\"}\",\"{\\\"id\\\":40,\\\"dominion_id\\\":16,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Store\\\",\\\"route_name\\\":\\\"dominion.store\\\",\\\"created_at\\\":\\\"2020-06-04T09:03:54.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-04T09:03:54.000000Z\\\"}\",\"{\\\"id\\\":41,\\\"dominion_id\\\":16,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Show\\\",\\\"route_name\\\":\\\"dominion.show\\\",\\\"created_at\\\":\\\"2020-06-04T09:03:54.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-04T09:03:54.000000Z\\\"}\",\"{\\\"id\\\":42,\\\"dominion_id\\\":16,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Edit\\\",\\\"route_name\\\":\\\"dominion.edit\\\",\\\"created_at\\\":\\\"2020-06-04T09:03:54.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-04T09:03:54.000000Z\\\"}\",\"{\\\"id\\\":43,\\\"dominion_id\\\":16,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Update\\\",\\\"route_name\\\":\\\"dominion.update\\\",\\\"created_at\\\":\\\"2020-06-04T09:03:54.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-04T09:03:54.000000Z\\\"}\",\"{\\\"id\\\":44,\\\"dominion_id\\\":16,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Destroy\\\",\\\"route_name\\\":\\\"dominion.destroy\\\",\\\"created_at\\\":\\\"2020-06-04T09:03:54.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-04T09:03:54.000000Z\\\"}\",\"{\\\"id\\\":45,\\\"dominion_id\\\":17,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Index\\\",\\\"route_name\\\":\\\"process.index\\\",\\\"created_at\\\":\\\"2020-06-04T09:04:11.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-04T09:04:11.000000Z\\\"}\",\"{\\\"id\\\":46,\\\"dominion_id\\\":17,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Create\\\",\\\"route_name\\\":\\\"process.create\\\",\\\"created_at\\\":\\\"2020-06-04T09:04:11.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-04T09:04:11.000000Z\\\"}\",\"{\\\"id\\\":47,\\\"dominion_id\\\":17,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Store\\\",\\\"route_name\\\":\\\"process.store\\\",\\\"created_at\\\":\\\"2020-06-04T09:04:11.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-04T09:04:11.000000Z\\\"}\",\"{\\\"id\\\":48,\\\"dominion_id\\\":17,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Show\\\",\\\"route_name\\\":\\\"process.show\\\",\\\"created_at\\\":\\\"2020-06-04T09:04:11.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-04T09:04:11.000000Z\\\"}\",\"{\\\"id\\\":49,\\\"dominion_id\\\":17,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Edit\\\",\\\"route_name\\\":\\\"process.edit\\\",\\\"created_at\\\":\\\"2020-06-04T09:04:11.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-04T09:04:11.000000Z\\\"}\",\"{\\\"id\\\":50,\\\"dominion_id\\\":17,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Update\\\",\\\"route_name\\\":\\\"process.update\\\",\\\"created_at\\\":\\\"2020-06-04T09:04:11.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-04T09:04:11.000000Z\\\"}\",\"{\\\"id\\\":51,\\\"dominion_id\\\":17,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Destroy\\\",\\\"route_name\\\":\\\"process.destroy\\\",\\\"created_at\\\":\\\"2020-06-04T09:04:11.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-04T09:04:11.000000Z\\\"}\",\"{\\\"id\\\":52,\\\"dominion_id\\\":19,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Index\\\",\\\"route_name\\\":\\\"menu.index\\\",\\\"created_at\\\":\\\"2020-06-05T08:11:40.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-19T08:35:47.000000Z\\\"}\",\"{\\\"id\\\":53,\\\"dominion_id\\\":19,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Create\\\",\\\"route_name\\\":\\\"menu.create\\\",\\\"created_at\\\":\\\"2020-06-05T08:11:40.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-19T08:35:47.000000Z\\\"}\",\"{\\\"id\\\":54,\\\"dominion_id\\\":19,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Store\\\",\\\"route_name\\\":\\\"menu.store\\\",\\\"created_at\\\":\\\"2020-06-05T08:11:40.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-19T08:35:47.000000Z\\\"}\",\"{\\\"id\\\":55,\\\"dominion_id\\\":19,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Show\\\",\\\"route_name\\\":\\\"menu.show\\\",\\\"created_at\\\":\\\"2020-06-05T08:11:40.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-19T08:35:47.000000Z\\\"}\",\"{\\\"id\\\":56,\\\"dominion_id\\\":19,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Edit\\\",\\\"route_name\\\":\\\"menu.edit\\\",\\\"created_at\\\":\\\"2020-06-05T08:11:40.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-19T08:35:47.000000Z\\\"}\",\"{\\\"id\\\":57,\\\"dominion_id\\\":19,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Update\\\",\\\"route_name\\\":\\\"menu.update\\\",\\\"created_at\\\":\\\"2020-06-05T08:11:40.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-19T08:35:47.000000Z\\\"}\",\"{\\\"id\\\":58,\\\"dominion_id\\\":19,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Destroy\\\",\\\"route_name\\\":\\\"menu.destroy\\\",\\\"created_at\\\":\\\"2020-06-05T08:11:40.000000Z\\\",\\\"updated_at\\\":\\\"2020-06-19T08:35:47.000000Z\\\"}\",\"{\\\"id\\\":330,\\\"dominion_id\\\":72,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Index\\\",\\\"route_name\\\":\\\"about.index\\\",\\\"created_at\\\":\\\"2021-03-05T19:11:52.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-05T19:11:52.000000Z\\\"}\",\"{\\\"id\\\":331,\\\"dominion_id\\\":72,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Create\\\",\\\"route_name\\\":\\\"about.create\\\",\\\"created_at\\\":\\\"2021-03-05T19:11:52.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-05T19:11:52.000000Z\\\"}\",\"{\\\"id\\\":332,\\\"dominion_id\\\":72,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Store\\\",\\\"route_name\\\":\\\"about.store\\\",\\\"created_at\\\":\\\"2021-03-05T19:11:52.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-05T19:11:52.000000Z\\\"}\",\"{\\\"id\\\":333,\\\"dominion_id\\\":72,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Show\\\",\\\"route_name\\\":\\\"about.show\\\",\\\"created_at\\\":\\\"2021-03-05T19:11:52.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-05T19:11:52.000000Z\\\"}\",\"{\\\"id\\\":334,\\\"dominion_id\\\":72,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Edit\\\",\\\"route_name\\\":\\\"about.edit\\\",\\\"created_at\\\":\\\"2021-03-05T19:11:52.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-05T19:11:52.000000Z\\\"}\",\"{\\\"id\\\":335,\\\"dominion_id\\\":72,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Update\\\",\\\"route_name\\\":\\\"about.update\\\",\\\"created_at\\\":\\\"2021-03-05T19:11:52.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-05T19:11:52.000000Z\\\"}\",\"{\\\"id\\\":336,\\\"dominion_id\\\":72,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Destroy\\\",\\\"route_name\\\":\\\"about.destroy\\\",\\\"created_at\\\":\\\"2021-03-05T19:11:52.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-05T19:11:52.000000Z\\\"}\",\"{\\\"id\\\":337,\\\"dominion_id\\\":73,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Index\\\",\\\"route_name\\\":\\\"parishad.index\\\",\\\"created_at\\\":\\\"2021-03-05T20:16:28.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-05T20:16:28.000000Z\\\"}\",\"{\\\"id\\\":338,\\\"dominion_id\\\":73,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Create\\\",\\\"route_name\\\":\\\"parishad.create\\\",\\\"created_at\\\":\\\"2021-03-05T20:16:28.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-05T20:16:28.000000Z\\\"}\",\"{\\\"id\\\":339,\\\"dominion_id\\\":73,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Store\\\",\\\"route_name\\\":\\\"parishad.store\\\",\\\"created_at\\\":\\\"2021-03-05T20:16:28.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-05T20:16:28.000000Z\\\"}\",\"{\\\"id\\\":340,\\\"dominion_id\\\":73,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Show\\\",\\\"route_name\\\":\\\"parishad.show\\\",\\\"created_at\\\":\\\"2021-03-05T20:16:28.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-05T20:16:28.000000Z\\\"}\",\"{\\\"id\\\":341,\\\"dominion_id\\\":73,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Edit\\\",\\\"route_name\\\":\\\"parishad.edit\\\",\\\"created_at\\\":\\\"2021-03-05T20:16:28.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-05T20:16:28.000000Z\\\"}\",\"{\\\"id\\\":342,\\\"dominion_id\\\":73,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Update\\\",\\\"route_name\\\":\\\"parishad.update\\\",\\\"created_at\\\":\\\"2021-03-05T20:16:28.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-05T20:16:28.000000Z\\\"}\",\"{\\\"id\\\":343,\\\"dominion_id\\\":73,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Destroy\\\",\\\"route_name\\\":\\\"parishad.destroy\\\",\\\"created_at\\\":\\\"2021-03-05T20:16:28.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-05T20:16:28.000000Z\\\"}\",\"{\\\"id\\\":402,\\\"dominion_id\\\":73,\\\"guard\\\":null,\\\"name\\\":\\\"position\\\",\\\"route_name\\\":\\\"parishad.position\\\",\\\"created_at\\\":\\\"2021-03-13T16:43:09.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-13T16:43:09.000000Z\\\"}\",\"{\\\"id\\\":403,\\\"dominion_id\\\":73,\\\"guard\\\":null,\\\"name\\\":\\\"savePosition\\\",\\\"route_name\\\":\\\"parishad.saveposition\\\",\\\"created_at\\\":\\\"2021-03-13T16:43:25.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-13T16:43:25.000000Z\\\"}\",\"{\\\"id\\\":344,\\\"dominion_id\\\":74,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Index\\\",\\\"route_name\\\":\\\"notice.index\\\",\\\"created_at\\\":\\\"2021-03-09T05:39:53.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:39:53.000000Z\\\"}\",\"{\\\"id\\\":345,\\\"dominion_id\\\":74,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Create\\\",\\\"route_name\\\":\\\"notice.create\\\",\\\"created_at\\\":\\\"2021-03-09T05:39:53.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:39:53.000000Z\\\"}\",\"{\\\"id\\\":346,\\\"dominion_id\\\":74,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Store\\\",\\\"route_name\\\":\\\"notice.store\\\",\\\"created_at\\\":\\\"2021-03-09T05:39:53.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:39:53.000000Z\\\"}\",\"{\\\"id\\\":347,\\\"dominion_id\\\":74,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Show\\\",\\\"route_name\\\":\\\"notice.show\\\",\\\"created_at\\\":\\\"2021-03-09T05:39:53.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:39:53.000000Z\\\"}\",\"{\\\"id\\\":348,\\\"dominion_id\\\":74,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Edit\\\",\\\"route_name\\\":\\\"notice.edit\\\",\\\"created_at\\\":\\\"2021-03-09T05:39:53.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:39:53.000000Z\\\"}\",\"{\\\"id\\\":349,\\\"dominion_id\\\":74,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Update\\\",\\\"route_name\\\":\\\"notice.update\\\",\\\"created_at\\\":\\\"2021-03-09T05:39:53.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:39:53.000000Z\\\"}\",\"{\\\"id\\\":350,\\\"dominion_id\\\":74,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Destroy\\\",\\\"route_name\\\":\\\"notice.destroy\\\",\\\"created_at\\\":\\\"2021-03-09T05:39:53.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:39:53.000000Z\\\"}\",\"{\\\"id\\\":351,\\\"dominion_id\\\":75,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Index\\\",\\\"route_name\\\":\\\"shava.index\\\",\\\"created_at\\\":\\\"2021-03-09T05:40:37.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:40:37.000000Z\\\"}\",\"{\\\"id\\\":352,\\\"dominion_id\\\":75,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Create\\\",\\\"route_name\\\":\\\"shava.create\\\",\\\"created_at\\\":\\\"2021-03-09T05:40:37.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:40:37.000000Z\\\"}\",\"{\\\"id\\\":353,\\\"dominion_id\\\":75,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Store\\\",\\\"route_name\\\":\\\"shava.store\\\",\\\"created_at\\\":\\\"2021-03-09T05:40:37.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:40:37.000000Z\\\"}\",\"{\\\"id\\\":354,\\\"dominion_id\\\":75,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Show\\\",\\\"route_name\\\":\\\"shava.show\\\",\\\"created_at\\\":\\\"2021-03-09T05:40:37.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:40:37.000000Z\\\"}\",\"{\\\"id\\\":355,\\\"dominion_id\\\":75,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Edit\\\",\\\"route_name\\\":\\\"shava.edit\\\",\\\"created_at\\\":\\\"2021-03-09T05:40:37.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:40:37.000000Z\\\"}\",\"{\\\"id\\\":356,\\\"dominion_id\\\":75,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Update\\\",\\\"route_name\\\":\\\"shava.update\\\",\\\"created_at\\\":\\\"2021-03-09T05:40:37.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:40:37.000000Z\\\"}\",\"{\\\"id\\\":357,\\\"dominion_id\\\":75,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Destroy\\\",\\\"route_name\\\":\\\"shava.destroy\\\",\\\"created_at\\\":\\\"2021-03-09T05:40:37.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:40:37.000000Z\\\"}\",\"{\\\"id\\\":358,\\\"dominion_id\\\":76,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Index\\\",\\\"route_name\\\":\\\"staff.index\\\",\\\"created_at\\\":\\\"2021-03-09T05:45:31.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:45:31.000000Z\\\"}\",\"{\\\"id\\\":359,\\\"dominion_id\\\":76,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Create\\\",\\\"route_name\\\":\\\"staff.create\\\",\\\"created_at\\\":\\\"2021-03-09T05:45:31.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:45:31.000000Z\\\"}\",\"{\\\"id\\\":360,\\\"dominion_id\\\":76,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Store\\\",\\\"route_name\\\":\\\"staff.store\\\",\\\"created_at\\\":\\\"2021-03-09T05:45:31.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:45:31.000000Z\\\"}\",\"{\\\"id\\\":361,\\\"dominion_id\\\":76,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Show\\\",\\\"route_name\\\":\\\"staff.show\\\",\\\"created_at\\\":\\\"2021-03-09T05:45:31.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:45:31.000000Z\\\"}\",\"{\\\"id\\\":362,\\\"dominion_id\\\":76,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Edit\\\",\\\"route_name\\\":\\\"staff.edit\\\",\\\"created_at\\\":\\\"2021-03-09T05:45:31.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:45:31.000000Z\\\"}\",\"{\\\"id\\\":363,\\\"dominion_id\\\":76,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Update\\\",\\\"route_name\\\":\\\"staff.update\\\",\\\"created_at\\\":\\\"2021-03-09T05:45:31.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:45:31.000000Z\\\"}\",\"{\\\"id\\\":364,\\\"dominion_id\\\":76,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Destroy\\\",\\\"route_name\\\":\\\"staff.destroy\\\",\\\"created_at\\\":\\\"2021-03-09T05:45:31.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:45:31.000000Z\\\"}\",\"{\\\"id\\\":404,\\\"dominion_id\\\":76,\\\"guard\\\":null,\\\"name\\\":\\\"position\\\",\\\"route_name\\\":\\\"staff.position\\\",\\\"created_at\\\":\\\"2021-03-13T17:00:08.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-13T17:00:08.000000Z\\\"}\",\"{\\\"id\\\":405,\\\"dominion_id\\\":76,\\\"guard\\\":null,\\\"name\\\":\\\"savePosition\\\",\\\"route_name\\\":\\\"staff.saveposition\\\",\\\"created_at\\\":\\\"2021-03-13T17:00:20.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-13T17:00:20.000000Z\\\"}\",\"{\\\"id\\\":365,\\\"dominion_id\\\":77,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Index\\\",\\\"route_name\\\":\\\"category.index\\\",\\\"created_at\\\":\\\"2021-03-09T05:48:38.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:48:38.000000Z\\\"}\",\"{\\\"id\\\":366,\\\"dominion_id\\\":77,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Create\\\",\\\"route_name\\\":\\\"category.create\\\",\\\"created_at\\\":\\\"2021-03-09T05:48:38.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:48:38.000000Z\\\"}\",\"{\\\"id\\\":367,\\\"dominion_id\\\":77,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Store\\\",\\\"route_name\\\":\\\"category.store\\\",\\\"created_at\\\":\\\"2021-03-09T05:48:38.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:48:38.000000Z\\\"}\",\"{\\\"id\\\":368,\\\"dominion_id\\\":77,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Show\\\",\\\"route_name\\\":\\\"category.show\\\",\\\"created_at\\\":\\\"2021-03-09T05:48:38.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:48:38.000000Z\\\"}\",\"{\\\"id\\\":369,\\\"dominion_id\\\":77,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Edit\\\",\\\"route_name\\\":\\\"category.edit\\\",\\\"created_at\\\":\\\"2021-03-09T05:48:38.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:48:38.000000Z\\\"}\",\"{\\\"id\\\":370,\\\"dominion_id\\\":77,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Update\\\",\\\"route_name\\\":\\\"category.update\\\",\\\"created_at\\\":\\\"2021-03-09T05:48:38.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:48:38.000000Z\\\"}\",\"{\\\"id\\\":371,\\\"dominion_id\\\":77,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Destroy\\\",\\\"route_name\\\":\\\"category.destroy\\\",\\\"created_at\\\":\\\"2021-03-09T05:48:38.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:48:38.000000Z\\\"}\",\"{\\\"id\\\":372,\\\"dominion_id\\\":78,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Index\\\",\\\"route_name\\\":\\\"file.index\\\",\\\"created_at\\\":\\\"2021-03-09T05:51:15.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:51:15.000000Z\\\"}\",\"{\\\"id\\\":373,\\\"dominion_id\\\":78,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Create\\\",\\\"route_name\\\":\\\"file.create\\\",\\\"created_at\\\":\\\"2021-03-09T05:51:15.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:51:15.000000Z\\\"}\",\"{\\\"id\\\":374,\\\"dominion_id\\\":78,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Store\\\",\\\"route_name\\\":\\\"file.store\\\",\\\"created_at\\\":\\\"2021-03-09T05:51:15.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:51:15.000000Z\\\"}\",\"{\\\"id\\\":375,\\\"dominion_id\\\":78,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Show\\\",\\\"route_name\\\":\\\"file.show\\\",\\\"created_at\\\":\\\"2021-03-09T05:51:15.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:51:15.000000Z\\\"}\",\"{\\\"id\\\":376,\\\"dominion_id\\\":78,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Edit\\\",\\\"route_name\\\":\\\"file.edit\\\",\\\"created_at\\\":\\\"2021-03-09T05:51:15.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:51:15.000000Z\\\"}\",\"{\\\"id\\\":377,\\\"dominion_id\\\":78,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Update\\\",\\\"route_name\\\":\\\"file.update\\\",\\\"created_at\\\":\\\"2021-03-09T05:51:15.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:51:15.000000Z\\\"}\",\"{\\\"id\\\":378,\\\"dominion_id\\\":78,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Destroy\\\",\\\"route_name\\\":\\\"file.destroy\\\",\\\"created_at\\\":\\\"2021-03-09T05:51:15.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-09T05:51:15.000000Z\\\"}\",\"{\\\"id\\\":379,\\\"dominion_id\\\":79,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Index\\\",\\\"route_name\\\":\\\"homesetting.index\\\",\\\"created_at\\\":\\\"2021-03-11T13:53:34.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-11T13:53:34.000000Z\\\"}\",\"{\\\"id\\\":380,\\\"dominion_id\\\":79,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Create\\\",\\\"route_name\\\":\\\"homesetting.create\\\",\\\"created_at\\\":\\\"2021-03-11T13:53:34.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-11T13:53:34.000000Z\\\"}\",\"{\\\"id\\\":381,\\\"dominion_id\\\":79,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Store\\\",\\\"route_name\\\":\\\"homesetting.store\\\",\\\"created_at\\\":\\\"2021-03-11T13:53:34.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-11T13:53:34.000000Z\\\"}\",\"{\\\"id\\\":382,\\\"dominion_id\\\":79,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Show\\\",\\\"route_name\\\":\\\"homesetting.show\\\",\\\"created_at\\\":\\\"2021-03-11T13:53:34.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-11T13:53:34.000000Z\\\"}\",\"{\\\"id\\\":383,\\\"dominion_id\\\":79,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Edit\\\",\\\"route_name\\\":\\\"homesetting.edit\\\",\\\"created_at\\\":\\\"2021-03-11T13:53:34.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-11T13:53:34.000000Z\\\"}\",\"{\\\"id\\\":384,\\\"dominion_id\\\":79,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Update\\\",\\\"route_name\\\":\\\"homesetting.update\\\",\\\"created_at\\\":\\\"2021-03-11T13:53:34.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-11T13:53:34.000000Z\\\"}\",\"{\\\"id\\\":385,\\\"dominion_id\\\":79,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Destroy\\\",\\\"route_name\\\":\\\"homesetting.destroy\\\",\\\"created_at\\\":\\\"2021-03-11T13:53:34.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-11T13:53:34.000000Z\\\"}\",\"{\\\"id\\\":386,\\\"dominion_id\\\":79,\\\"guard\\\":null,\\\"name\\\":\\\"force_update\\\",\\\"route_name\\\":\\\"homesetting.force_update\\\",\\\"created_at\\\":\\\"2021-03-11T17:13:19.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-11T17:13:19.000000Z\\\"}\",\"{\\\"id\\\":387,\\\"dominion_id\\\":80,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Index\\\",\\\"route_name\\\":\\\"gallery.index\\\",\\\"created_at\\\":\\\"2021-03-11T17:21:01.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-11T17:21:01.000000Z\\\"}\",\"{\\\"id\\\":388,\\\"dominion_id\\\":80,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Create\\\",\\\"route_name\\\":\\\"gallery.create\\\",\\\"created_at\\\":\\\"2021-03-11T17:21:01.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-11T17:21:01.000000Z\\\"}\",\"{\\\"id\\\":389,\\\"dominion_id\\\":80,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Store\\\",\\\"route_name\\\":\\\"gallery.store\\\",\\\"created_at\\\":\\\"2021-03-11T17:21:01.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-11T17:21:01.000000Z\\\"}\",\"{\\\"id\\\":390,\\\"dominion_id\\\":80,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Show\\\",\\\"route_name\\\":\\\"gallery.show\\\",\\\"created_at\\\":\\\"2021-03-11T17:21:01.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-11T17:21:01.000000Z\\\"}\",\"{\\\"id\\\":391,\\\"dominion_id\\\":80,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Edit\\\",\\\"route_name\\\":\\\"gallery.edit\\\",\\\"created_at\\\":\\\"2021-03-11T17:21:01.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-11T17:21:01.000000Z\\\"}\",\"{\\\"id\\\":392,\\\"dominion_id\\\":80,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Update\\\",\\\"route_name\\\":\\\"gallery.update\\\",\\\"created_at\\\":\\\"2021-03-11T17:21:01.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-11T17:21:01.000000Z\\\"}\",\"{\\\"id\\\":393,\\\"dominion_id\\\":80,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Destroy\\\",\\\"route_name\\\":\\\"gallery.destroy\\\",\\\"created_at\\\":\\\"2021-03-11T17:21:01.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-11T17:21:01.000000Z\\\"}\",\"{\\\"id\\\":401,\\\"dominion_id\\\":80,\\\"guard\\\":null,\\\"name\\\":\\\"position\\\",\\\"route_name\\\":\\\"gallery.position\\\",\\\"created_at\\\":\\\"2021-03-12T07:49:30.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-12T07:49:30.000000Z\\\"}\",\"{\\\"id\\\":394,\\\"dominion_id\\\":81,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Index\\\",\\\"route_name\\\":\\\"slider.index\\\",\\\"created_at\\\":\\\"2021-03-12T07:37:36.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-12T07:37:36.000000Z\\\"}\",\"{\\\"id\\\":395,\\\"dominion_id\\\":81,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Create\\\",\\\"route_name\\\":\\\"slider.create\\\",\\\"created_at\\\":\\\"2021-03-12T07:37:36.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-12T07:37:36.000000Z\\\"}\",\"{\\\"id\\\":396,\\\"dominion_id\\\":81,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Store\\\",\\\"route_name\\\":\\\"slider.store\\\",\\\"created_at\\\":\\\"2021-03-12T07:37:36.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-12T07:37:36.000000Z\\\"}\",\"{\\\"id\\\":397,\\\"dominion_id\\\":81,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Show\\\",\\\"route_name\\\":\\\"slider.show\\\",\\\"created_at\\\":\\\"2021-03-12T07:37:36.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-12T07:37:36.000000Z\\\"}\",\"{\\\"id\\\":398,\\\"dominion_id\\\":81,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Edit\\\",\\\"route_name\\\":\\\"slider.edit\\\",\\\"created_at\\\":\\\"2021-03-12T07:37:36.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-12T07:37:36.000000Z\\\"}\",\"{\\\"id\\\":399,\\\"dominion_id\\\":81,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Update\\\",\\\"route_name\\\":\\\"slider.update\\\",\\\"created_at\\\":\\\"2021-03-12T07:37:36.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-12T07:37:36.000000Z\\\"}\",\"{\\\"id\\\":400,\\\"dominion_id\\\":81,\\\"guard\\\":\\\"admin\\\",\\\"name\\\":\\\"Destroy\\\",\\\"route_name\\\":\\\"slider.destroy\\\",\\\"created_at\\\":\\\"2021-03-12T07:37:36.000000Z\\\",\\\"updated_at\\\":\\\"2021-03-12T07:37:36.000000Z\\\"}\"]', NULL, '2021-03-13 11:04:12');

-- --------------------------------------------------------

--
-- Table structure for table `processes`
--

CREATE TABLE `processes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dominion_id` bigint(20) UNSIGNED NOT NULL,
  `guard` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `processes`
--

INSERT INTO `processes` (`id`, `dominion_id`, `guard`, `name`, `route_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'Index', 'admin.index', '2020-06-01 09:00:24', '2020-06-03 10:01:42'),
(2, 1, 'admin', 'Create', 'admin.create', '2020-06-01 09:00:24', '2020-06-01 09:00:24'),
(3, 1, 'admin', 'Store', 'admin.store', '2020-06-01 09:00:24', '2020-06-01 09:00:24'),
(4, 1, 'admin', 'Show', 'admin.show', '2020-06-01 09:00:24', '2020-06-01 09:00:24'),
(5, 1, 'admin', 'Edit', 'admin.edit', '2020-06-01 09:00:24', '2020-06-01 09:00:24'),
(6, 1, 'admin', 'Update', 'admin.update', '2020-06-01 09:00:24', '2020-06-01 09:00:24'),
(7, 1, 'admin', 'Destroy', 'admin.destroy', '2020-06-01 09:00:24', '2020-06-01 09:00:24'),
(8, 2, 'admin', 'Index', 'role.index', '2020-06-01 09:01:49', '2020-06-01 09:01:49'),
(9, 2, 'admin', 'Create', 'role.create', '2020-06-01 09:01:49', '2020-06-01 09:01:49'),
(10, 2, 'admin', 'Store', 'role.store', '2020-06-01 09:01:49', '2020-06-01 09:01:49'),
(11, 2, 'admin', 'Show', 'role.show', '2020-06-01 09:01:49', '2020-06-01 09:01:49'),
(12, 2, 'admin', 'Edit', 'role.edit', '2020-06-01 09:01:49', '2020-06-01 09:01:49'),
(13, 2, 'admin', 'Update', 'role.update', '2020-06-01 09:01:49', '2020-06-01 09:01:49'),
(14, 2, 'admin', 'Destroy', 'role.destroy', '2020-06-01 09:01:49', '2020-06-01 09:01:49'),
(30, 14, 'admin', 'Index', 'permission.index', '2020-06-01 11:53:39', '2020-06-01 11:53:39'),
(31, 14, 'admin', 'Create', 'permission.create', '2020-06-01 11:53:40', '2020-06-01 11:53:40'),
(32, 14, 'admin', 'Store', 'permission.store', '2020-06-01 11:53:40', '2020-06-01 11:53:40'),
(33, 14, 'admin', 'Show', 'permission.show', '2020-06-01 11:53:40', '2020-06-01 11:53:40'),
(34, 14, 'admin', 'Edit', 'permission.edit', '2020-06-01 11:53:40', '2020-06-01 11:53:40'),
(35, 14, 'admin', 'Update', 'permission.update', '2020-06-01 11:53:40', '2020-06-01 11:53:40'),
(36, 14, 'admin', 'Destroy', 'permission.destroy', '2020-06-01 11:53:40', '2020-06-01 11:53:40'),
(37, 1, NULL, 'profile', 'admin.profile', '2020-06-03 09:45:31', '2020-06-03 09:45:31'),
(38, 16, 'admin', 'Index', 'dominion.index', '2020-06-04 03:03:54', '2020-06-04 03:03:54'),
(39, 16, 'admin', 'Create', 'dominion.create', '2020-06-04 03:03:54', '2020-06-04 03:03:54'),
(40, 16, 'admin', 'Store', 'dominion.store', '2020-06-04 03:03:54', '2020-06-04 03:03:54'),
(41, 16, 'admin', 'Show', 'dominion.show', '2020-06-04 03:03:54', '2020-06-04 03:03:54'),
(42, 16, 'admin', 'Edit', 'dominion.edit', '2020-06-04 03:03:54', '2020-06-04 03:03:54'),
(43, 16, 'admin', 'Update', 'dominion.update', '2020-06-04 03:03:54', '2020-06-04 03:03:54'),
(44, 16, 'admin', 'Destroy', 'dominion.destroy', '2020-06-04 03:03:54', '2020-06-04 03:03:54'),
(45, 17, 'admin', 'Index', 'process.index', '2020-06-04 03:04:11', '2020-06-04 03:04:11'),
(46, 17, 'admin', 'Create', 'process.create', '2020-06-04 03:04:11', '2020-06-04 03:04:11'),
(47, 17, 'admin', 'Store', 'process.store', '2020-06-04 03:04:11', '2020-06-04 03:04:11'),
(48, 17, 'admin', 'Show', 'process.show', '2020-06-04 03:04:11', '2020-06-04 03:04:11'),
(49, 17, 'admin', 'Edit', 'process.edit', '2020-06-04 03:04:11', '2020-06-04 03:04:11'),
(50, 17, 'admin', 'Update', 'process.update', '2020-06-04 03:04:11', '2020-06-04 03:04:11'),
(51, 17, 'admin', 'Destroy', 'process.destroy', '2020-06-04 03:04:11', '2020-06-04 03:04:11'),
(52, 19, 'admin', 'Index', 'menu.index', '2020-06-05 02:11:40', '2020-06-19 02:35:47'),
(53, 19, 'admin', 'Create', 'menu.create', '2020-06-05 02:11:40', '2020-06-19 02:35:47'),
(54, 19, 'admin', 'Store', 'menu.store', '2020-06-05 02:11:40', '2020-06-19 02:35:47'),
(55, 19, 'admin', 'Show', 'menu.show', '2020-06-05 02:11:40', '2020-06-19 02:35:47'),
(56, 19, 'admin', 'Edit', 'menu.edit', '2020-06-05 02:11:40', '2020-06-19 02:35:47'),
(57, 19, 'admin', 'Update', 'menu.update', '2020-06-05 02:11:40', '2020-06-19 02:35:47'),
(58, 19, 'admin', 'Destroy', 'menu.destroy', '2020-06-05 02:11:40', '2020-06-19 02:35:47'),
(66, 1, NULL, 'updateProfile', 'admin.updateprofile', '2020-06-05 03:35:42', '2020-06-05 03:35:42'),
(82, 1, NULL, 'changePassword', 'admin.changepassword', '2020-06-19 07:46:30', '2020-06-19 07:46:30'),
(330, 72, 'admin', 'Index', 'about.index', '2021-03-05 13:11:52', '2021-03-05 13:11:52'),
(331, 72, 'admin', 'Create', 'about.create', '2021-03-05 13:11:52', '2021-03-05 13:11:52'),
(332, 72, 'admin', 'Store', 'about.store', '2021-03-05 13:11:52', '2021-03-05 13:11:52'),
(333, 72, 'admin', 'Show', 'about.show', '2021-03-05 13:11:52', '2021-03-05 13:11:52'),
(334, 72, 'admin', 'Edit', 'about.edit', '2021-03-05 13:11:52', '2021-03-05 13:11:52'),
(335, 72, 'admin', 'Update', 'about.update', '2021-03-05 13:11:52', '2021-03-05 13:11:52'),
(336, 72, 'admin', 'Destroy', 'about.destroy', '2021-03-05 13:11:52', '2021-03-05 13:11:52'),
(337, 73, 'admin', 'Index', 'parishad.index', '2021-03-05 14:16:28', '2021-03-05 14:16:28'),
(338, 73, 'admin', 'Create', 'parishad.create', '2021-03-05 14:16:28', '2021-03-05 14:16:28'),
(339, 73, 'admin', 'Store', 'parishad.store', '2021-03-05 14:16:28', '2021-03-05 14:16:28'),
(340, 73, 'admin', 'Show', 'parishad.show', '2021-03-05 14:16:28', '2021-03-05 14:16:28'),
(341, 73, 'admin', 'Edit', 'parishad.edit', '2021-03-05 14:16:28', '2021-03-05 14:16:28'),
(342, 73, 'admin', 'Update', 'parishad.update', '2021-03-05 14:16:28', '2021-03-05 14:16:28'),
(343, 73, 'admin', 'Destroy', 'parishad.destroy', '2021-03-05 14:16:28', '2021-03-05 14:16:28'),
(344, 74, 'admin', 'Index', 'notice.index', '2021-03-08 23:39:53', '2021-03-08 23:39:53'),
(345, 74, 'admin', 'Create', 'notice.create', '2021-03-08 23:39:53', '2021-03-08 23:39:53'),
(346, 74, 'admin', 'Store', 'notice.store', '2021-03-08 23:39:53', '2021-03-08 23:39:53'),
(347, 74, 'admin', 'Show', 'notice.show', '2021-03-08 23:39:53', '2021-03-08 23:39:53'),
(348, 74, 'admin', 'Edit', 'notice.edit', '2021-03-08 23:39:53', '2021-03-08 23:39:53'),
(349, 74, 'admin', 'Update', 'notice.update', '2021-03-08 23:39:53', '2021-03-08 23:39:53'),
(350, 74, 'admin', 'Destroy', 'notice.destroy', '2021-03-08 23:39:53', '2021-03-08 23:39:53'),
(351, 75, 'admin', 'Index', 'shava.index', '2021-03-08 23:40:37', '2021-03-08 23:40:37'),
(352, 75, 'admin', 'Create', 'shava.create', '2021-03-08 23:40:37', '2021-03-08 23:40:37'),
(353, 75, 'admin', 'Store', 'shava.store', '2021-03-08 23:40:37', '2021-03-08 23:40:37'),
(354, 75, 'admin', 'Show', 'shava.show', '2021-03-08 23:40:37', '2021-03-08 23:40:37'),
(355, 75, 'admin', 'Edit', 'shava.edit', '2021-03-08 23:40:37', '2021-03-08 23:40:37'),
(356, 75, 'admin', 'Update', 'shava.update', '2021-03-08 23:40:37', '2021-03-08 23:40:37'),
(357, 75, 'admin', 'Destroy', 'shava.destroy', '2021-03-08 23:40:37', '2021-03-08 23:40:37'),
(358, 76, 'admin', 'Index', 'staff.index', '2021-03-08 23:45:31', '2021-03-08 23:45:31'),
(359, 76, 'admin', 'Create', 'staff.create', '2021-03-08 23:45:31', '2021-03-08 23:45:31'),
(360, 76, 'admin', 'Store', 'staff.store', '2021-03-08 23:45:31', '2021-03-08 23:45:31'),
(361, 76, 'admin', 'Show', 'staff.show', '2021-03-08 23:45:31', '2021-03-08 23:45:31'),
(362, 76, 'admin', 'Edit', 'staff.edit', '2021-03-08 23:45:31', '2021-03-08 23:45:31'),
(363, 76, 'admin', 'Update', 'staff.update', '2021-03-08 23:45:31', '2021-03-08 23:45:31'),
(364, 76, 'admin', 'Destroy', 'staff.destroy', '2021-03-08 23:45:31', '2021-03-08 23:45:31'),
(365, 77, 'admin', 'Index', 'category.index', '2021-03-08 23:48:38', '2021-03-08 23:48:38'),
(366, 77, 'admin', 'Create', 'category.create', '2021-03-08 23:48:38', '2021-03-08 23:48:38'),
(367, 77, 'admin', 'Store', 'category.store', '2021-03-08 23:48:38', '2021-03-08 23:48:38'),
(368, 77, 'admin', 'Show', 'category.show', '2021-03-08 23:48:38', '2021-03-08 23:48:38'),
(369, 77, 'admin', 'Edit', 'category.edit', '2021-03-08 23:48:38', '2021-03-08 23:48:38'),
(370, 77, 'admin', 'Update', 'category.update', '2021-03-08 23:48:38', '2021-03-08 23:48:38'),
(371, 77, 'admin', 'Destroy', 'category.destroy', '2021-03-08 23:48:38', '2021-03-08 23:48:38'),
(372, 78, 'admin', 'Index', 'file.index', '2021-03-08 23:51:15', '2021-03-08 23:51:15'),
(373, 78, 'admin', 'Create', 'file.create', '2021-03-08 23:51:15', '2021-03-08 23:51:15'),
(374, 78, 'admin', 'Store', 'file.store', '2021-03-08 23:51:15', '2021-03-08 23:51:15'),
(375, 78, 'admin', 'Show', 'file.show', '2021-03-08 23:51:15', '2021-03-08 23:51:15'),
(376, 78, 'admin', 'Edit', 'file.edit', '2021-03-08 23:51:15', '2021-03-08 23:51:15'),
(377, 78, 'admin', 'Update', 'file.update', '2021-03-08 23:51:15', '2021-03-08 23:51:15'),
(378, 78, 'admin', 'Destroy', 'file.destroy', '2021-03-08 23:51:15', '2021-03-08 23:51:15'),
(379, 79, 'admin', 'Index', 'homesetting.index', '2021-03-11 07:53:34', '2021-03-11 07:53:34'),
(380, 79, 'admin', 'Create', 'homesetting.create', '2021-03-11 07:53:34', '2021-03-11 07:53:34'),
(381, 79, 'admin', 'Store', 'homesetting.store', '2021-03-11 07:53:34', '2021-03-11 07:53:34'),
(382, 79, 'admin', 'Show', 'homesetting.show', '2021-03-11 07:53:34', '2021-03-11 07:53:34'),
(383, 79, 'admin', 'Edit', 'homesetting.edit', '2021-03-11 07:53:34', '2021-03-11 07:53:34'),
(384, 79, 'admin', 'Update', 'homesetting.update', '2021-03-11 07:53:34', '2021-03-11 07:53:34'),
(385, 79, 'admin', 'Destroy', 'homesetting.destroy', '2021-03-11 07:53:34', '2021-03-11 07:53:34'),
(386, 79, NULL, 'force_update', 'homesetting.force_update', '2021-03-11 11:13:19', '2021-03-11 11:13:19'),
(387, 80, 'admin', 'Index', 'gallery.index', '2021-03-11 11:21:01', '2021-03-11 11:21:01'),
(388, 80, 'admin', 'Create', 'gallery.create', '2021-03-11 11:21:01', '2021-03-11 11:21:01'),
(389, 80, 'admin', 'Store', 'gallery.store', '2021-03-11 11:21:01', '2021-03-11 11:21:01'),
(390, 80, 'admin', 'Show', 'gallery.show', '2021-03-11 11:21:01', '2021-03-11 11:21:01'),
(391, 80, 'admin', 'Edit', 'gallery.edit', '2021-03-11 11:21:01', '2021-03-11 11:21:01'),
(392, 80, 'admin', 'Update', 'gallery.update', '2021-03-11 11:21:01', '2021-03-11 11:21:01'),
(393, 80, 'admin', 'Destroy', 'gallery.destroy', '2021-03-11 11:21:01', '2021-03-11 11:21:01'),
(394, 81, 'admin', 'Index', 'slider.index', '2021-03-12 01:37:36', '2021-03-12 01:37:36'),
(395, 81, 'admin', 'Create', 'slider.create', '2021-03-12 01:37:36', '2021-03-12 01:37:36'),
(396, 81, 'admin', 'Store', 'slider.store', '2021-03-12 01:37:36', '2021-03-12 01:37:36'),
(397, 81, 'admin', 'Show', 'slider.show', '2021-03-12 01:37:36', '2021-03-12 01:37:36'),
(398, 81, 'admin', 'Edit', 'slider.edit', '2021-03-12 01:37:36', '2021-03-12 01:37:36'),
(399, 81, 'admin', 'Update', 'slider.update', '2021-03-12 01:37:36', '2021-03-12 01:37:36'),
(400, 81, 'admin', 'Destroy', 'slider.destroy', '2021-03-12 01:37:36', '2021-03-12 01:37:36'),
(401, 80, NULL, 'position', 'gallery.position', '2021-03-12 01:49:30', '2021-03-12 01:49:30'),
(402, 73, NULL, 'position', 'parishad.position', '2021-03-13 10:43:09', '2021-03-13 10:43:09'),
(403, 73, NULL, 'savePosition', 'parishad.saveposition', '2021-03-13 10:43:25', '2021-03-13 10:43:25'),
(404, 76, NULL, 'position', 'staff.position', '2021-03-13 11:00:08', '2021-03-13 11:00:08'),
(405, 76, NULL, 'savePosition', 'staff.saveposition', '2021-03-13 11:00:20', '2021-03-13 11:00:20');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin', NULL, NULL),
(2, 'Admin', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shavas`
--

CREATE TABLE `shavas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `created_at`, `updated_at`) VALUES
(1, 'upload/sliders/7EXPto3oD5WrYXnLOmU0LBeauGfS1jtonEVcLVrM.jpg', '2021-03-12 01:38:52', '2021-03-12 01:38:52'),
(2, 'upload/sliders/rSjVkBh0GAShYN5qrdPnZJNjyyC6vdb0ldbWJBlt.jpg', '2021-03-12 01:38:52', '2021-03-12 01:38:52'),
(3, 'upload/sliders/2bnp63kYFpeZ1IFl0u8H6JYyfRC2kaNcbyc0xRVz.jpg', '2021-03-12 01:38:52', '2021-03-12 01:38:52');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marriage_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `chil_boy` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chil_girl` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joining_date` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_phone` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal_phone` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` int(11) NOT NULL DEFAULT 50,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'avatar.png',
  `status` enum('a','d') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'a',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `name`, `designation`, `father`, `mother`, `address`, `marriage_status`, `chil_boy`, `chil_girl`, `joining_date`, `office_phone`, `personal_phone`, `email`, `serial`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Hello', 'developer', 'world', 'sdkf sj', 'dsvghs f', '1', '1', '0', '12/12/2012', '3248923', '987987', 'a@a.a', 1, 'upload/staff/GEA3kFZIOLHt2483AaNOfV4DZrZnCDbFIGLhPwLs.jpg', 'a', '2021-03-13 11:07:35', '2021-03-13 11:09:01'),
(2, 'dbwhjb', 'bsdjhfbsdjh', 'bjhf', 'sdjf sdjh', 'sdfbsjhdb', '1', NULL, NULL, '12/12/12', 'jhdsf', '324897238', 'abc@gmail.com', 2, 'upload/staff/58qG9PWM2QJamb707KJ7uOht4sJ1T3hGC9VASf5A.jpg', 'a', '2021-03-13 11:08:12', '2021-03-13 11:09:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abouts`
--
ALTER TABLE `abouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dominions`
--
ALTER TABLE `dominions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_settings`
--
ALTER TABLE `home_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parishads`
--
ALTER TABLE `parishads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `processes`
--
ALTER TABLE `processes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `processes_dominion_id_foreign` (`dominion_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shavas`
--
ALTER TABLE `shavas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `abouts`
--
ALTER TABLE `abouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dominions`
--
ALTER TABLE `dominions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `home_settings`
--
ALTER TABLE `home_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parishads`
--
ALTER TABLE `parishads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `processes`
--
ALTER TABLE `processes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=406;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shavas`
--
ALTER TABLE `shavas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `processes`
--
ALTER TABLE `processes`
  ADD CONSTRAINT `processes_dominion_id_foreign` FOREIGN KEY (`dominion_id`) REFERENCES `dominions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
