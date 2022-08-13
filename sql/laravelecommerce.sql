-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2022 at 09:04 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravelecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2a$05$9dndPCmel6.zNEKfe7xmg.fNYb/Yqk7DYIby82ZQDPsdVQHP0cgI6', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_attribute_id` bigint(20) UNSIGNED DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `product_attribute_id`, `value`, `product_id`, `created_at`, `updated_at`) VALUES
(7, 1, 'er', 35, '2022-08-12 23:41:22', '2022-08-12 23:41:22'),
(8, 2, '42', 35, '2022-08-12 23:41:22', '2022-08-12 23:41:22'),
(9, 1, 'Red', 37, '2022-08-13 00:20:28', '2022-08-13 00:20:28'),
(10, 1, 'Green', 37, '2022-08-13 00:20:28', '2022-08-13 00:20:28'),
(11, 1, 'White', 37, '2022-08-13 00:20:28', '2022-08-13 00:20:28'),
(12, 2, '32', 37, '2022-08-13 00:20:28', '2022-08-13 00:20:28'),
(13, 2, '42', 37, '2022-08-13 00:20:28', '2022-08-13 00:20:28'),
(14, 2, '64', 37, '2022-08-13 00:20:28', '2022-08-13 00:20:28');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'enim id', 'enim-id', '2022-06-30 03:26:49', '2022-06-30 03:26:49'),
(2, 'quia ratione', 'quia-ratione', '2022-06-30 03:26:50', '2022-06-30 03:26:50'),
(3, 'adipisci assumenda', 'adipisci-assumenda', '2022-06-30 03:26:50', '2022-06-30 03:26:50'),
(4, 'cum consequatur', 'cum-consequatur', '2022-06-30 03:26:50', '2022-06-30 03:26:50'),
(5, 'consequuntur omnis', 'consequuntur-omnis', '2022-06-30 03:26:50', '2022-06-30 03:26:50'),
(6, 'corrupti molestiae', 'corrupti-molestiae', '2022-06-30 03:26:50', '2022-06-30 03:26:50'),
(10, 'Electronices', 'electronices', '2022-08-11 14:24:21', '2022-08-11 14:24:21'),
(11, 'Appliences', 'appliences', '2022-08-11 14:38:09', '2022-08-11 14:38:09');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `comment`, `created_at`, `updated_at`) VALUES
(1, 'SARMILA', 'sarmilaroy583032@gmail.com', '01812757639', 'hi', '2022-08-10 11:58:12', '2022-08-10 11:58:12');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `cart_value` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expiry_date` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `cart_value`, `created_at`, `updated_at`, `expiry_date`) VALUES
(3, 'OFF100', 'fixed', '100.00', '1000.00', '2022-07-20 10:54:08', '2022-07-21 04:00:24', '2022-07-30'),
(4, 'OFF20P', 'percent', '10.00', '1200.00', '2022-07-20 11:38:47', '2022-07-20 11:38:47', '2022-07-21'),
(5, 'OFF30P', 'percent', '30.00', '1300.00', '2022-07-20 14:14:38', '2022-07-20 14:18:58', '2022-07-24'),
(6, 'OFF40', 'fixed', '24.00', '1230.00', '2022-07-21 04:11:05', '2022-07-21 04:11:05', '2022-07-29');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_categories`
--

CREATE TABLE `home_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sel_categories` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_products` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_categories`
--

INSERT INTO `home_categories` (`id`, `sel_categories`, `no_of_products`, `created_at`, `updated_at`) VALUES
(1, '1,2,3,4,5,6', 8, '2022-07-16 16:31:38', '2022-07-16 12:58:53');

-- --------------------------------------------------------

--
-- Table structure for table `home_sliders`
--

CREATE TABLE `home_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_sliders`
--

INSERT INTO `home_sliders` (`id`, `title`, `subtitle`, `price`, `link`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Great Range of Exclusive Furniture Packages', 'Exclusive Furniture Packages to Suit every need.', '225.00', 'http://127.0.0.1:8000/shop', '1657959791.jpg', '1', '2022-07-16 02:23:11', '2022-07-16 04:32:40'),
(3, 'Kid Smart Watches', 'Compra todos tus productos Smart por internet.', '59.99', 'http://127.0.0.1:8000/shop', '1657967355.jpg', '1', '2022-07-16 04:29:15', '2022-07-16 04:29:15'),
(4, 'Extra 25% Off', 'On online payments', '95', 'http://127.0.0.1:8000/shop', '1657967486.jpg', '1', '2022-07-16 04:31:26', '2022-07-16 04:31:26');

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
(9, '2014_10_12_000000_create_users_table', 1),
(10, '2014_10_12_100000_create_password_resets_table', 1),
(11, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(12, '2019_08_19_000000_create_failed_jobs_table', 1),
(13, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(14, '2022_06_29_062348_create_sessions_table', 1),
(15, '2022_06_29_170635_create_categories_table', 1),
(16, '2022_06_29_170910_create_products_table', 1),
(17, '2022_07_16_063943_create_home_sliders_table', 2),
(18, '2022_07_16_162702_create_home_categories_table', 3),
(19, '2022_07_17_070122_create_sales_table', 4),
(20, '2022_07_18_121946_create_coupons_table', 5),
(21, '2022_07_20_195746_add_expiry_date_to_coupons_table', 6),
(22, '2022_07_20_203253_create_orders_table', 7),
(23, '2022_07_20_203328_create_order_items_table', 7),
(24, '2022_07_20_203352_create_shippings_table', 7),
(25, '2022_07_20_203457_create_transactions_table', 7),
(26, '2022_07_22_110150_add_delivered_canceled_date_to_orders_table', 8),
(29, '2022_08_07_175316_create_reviews_table', 9),
(30, '2022_08_07_181439_add_rstatus_to_order_items_table', 9),
(31, '2022_08_10_152625_create_contacts_table', 10),
(32, '2022_08_10_181637_create_settings_table', 11),
(33, '2022_08_11_192121_create_shoppingcart_table', 12),
(34, '2022_08_11_201031_create_subcategories_table', 13),
(35, '2022_08_12_082943_add_subcategory_id_to_products_table', 14),
(36, '2022_08_12_103241_create_profiles_table', 15),
(37, '2022_08_12_141117_create_product_attributes_table', 16),
(38, '2022_08_12_154040_create_attribute_values_table', 17),
(39, '2022_08_13_064205_add_options_to_order_items_table', 18);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `fastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('ordered','delivered','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ordered',
  `is_shipping_difference` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivered_date` date DEFAULT NULL,
  `canceled_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `subtotal`, `discount`, `tax`, `total`, `fastname`, `lastname`, `mobile`, `email`, `line1`, `line2`, `city`, `province`, `country`, `zipcode`, `status`, `is_shipping_difference`, `created_at`, `updated_at`, `delivered_date`, `canceled_date`) VALUES
(21, 1, '576.00', '0.00', '120.96', '696.96', 'John', 'Doe', '112757639', 'jon@gmail.com', 'text1', NULL, 'dhaka', 'haryana', 'india', '1200', 'delivered', 0, '2022-07-21 14:42:12', '2022-07-22 05:47:30', '2022-07-22', NULL),
(22, 1, '576.00', '0.00', '120.96', '696.96', 'John', 'Doe', '1812757639', 'admifn@gmail.com', 'text1', 'text1', 'G.M Hat', 'dhaka', 'bangladesh', '3900', 'canceled', 0, '2022-07-22 06:16:06', '2022-07-22 06:18:52', NULL, '2022-07-22'),
(23, 1, '327.00', '0.00', '68.67', '395.67', 'sarmila', 'roy', '1812757639', 'sarmilaroy.tumpa@yahoo.com', 'Sree chandrapur, G.M hat, Fulgazi', 'fgggf', 'G.M Hat', 'mumbai', 'bangladesh', '3900', 'delivered', 1, '2022-08-07 08:38:37', '2022-08-07 08:38:37', NULL, NULL),
(24, 1, '327.00', '0.00', '68.67', '395.67', 'sdfddf', 'bn', '1812757639', 'shawon@gmail.com', 'Sree chandrapur, G.M hat, Fulgazi', 'bvb', 'G.M Hat', 'nvb', ' bbn', '3900', 'delivered', 0, '2022-08-07 08:40:56', '2022-08-07 08:40:56', NULL, NULL),
(25, 1, '597.00', '0.00', '125.37', '722.37', 'John', 'Doe', '976543444', 'user@user.com', 'text1', 'text1', 'G.M Hat', 'mumbai', 'india', '3900', 'delivered', 0, '2022-08-08 12:04:05', '2022-08-08 12:04:47', NULL, '2022-08-09'),
(26, 1, '738.00', '0.00', '154.98', '892.98', 'sarmila', 'roy', '01812757639', 'sarmilaroy.tumpa@gmail.com', 'Sree chandrapur, G.M hat, Fulgazi', 'Sree chandrapur, G.M hat, Fulgazi', 'G.M Hat', 'Feni', 'bangladesh', '3900', 'ordered', 0, '2022-08-11 12:40:51', '2022-08-11 12:40:51', NULL, NULL),
(27, 1, '78.00', '0.00', '16.38', '94.38', 'John', 'roy', '01812757639', 'sarmilaroy.tumpas@gmail.com', 'Sree chandrapur, G.M hat, Fulgazi', 'cdd', 'G.M Hat', 'mumbai', 'bangladesh', '3900', 'ordered', 0, '2022-08-11 13:00:52', '2022-08-11 13:00:52', NULL, NULL),
(28, 3, '444.00', '0.00', '93.24', '537.24', 'sarmila', 'Dev', '01812757639', 'admin1@gmail.com', 'Sree chandrapur, G.M hat, Fulgazi', 'ssss', 'G.M Hat', 'dhaka', 'bangladesh', '3900', 'ordered', 0, '2022-08-11 13:52:54', '2022-08-11 13:52:54', NULL, NULL),
(29, 1, '400.00', '0.00', '84.00', '484.00', 'sanjoy', 'Dev', '01812757639', 'sanjoy@gmail.com', 'Sree chandrapur, G.M hat, Fulgazi', 'Sree chandrapur, G.M hat, Fulgazi', 'G.M Hat', 'dhaka', 'bangladesh', '3900', 'ordered', 0, '2022-08-13 00:51:50', '2022-08-13 00:51:50', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rstatus` tinyint(1) NOT NULL DEFAULT 0,
  `options` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `product_id`, `order_id`, `price`, `quantity`, `created_at`, `updated_at`, `rstatus`, `options`) VALUES
(39, 1, 21, '327.00', 1, '2022-07-21 14:42:12', '2022-08-07 13:20:06', 1, NULL),
(40, 2, 21, '249.00', 1, '2022-07-21 14:42:12', '2022-08-07 13:29:05', 1, NULL),
(41, 2, 22, '249.00', 1, '2022-07-22 06:16:06', '2022-07-22 06:16:06', 0, NULL),
(42, 1, 22, '327.00', 1, '2022-07-22 06:16:06', '2022-07-22 06:16:06', 0, NULL),
(43, 1, 23, '327.00', 1, '2022-08-07 08:38:38', '2022-08-07 08:38:38', 0, NULL),
(44, 1, 24, '327.00', 1, '2022-08-07 08:40:58', '2022-08-07 08:40:58', 0, NULL),
(45, 4, 25, '199.00', 1, '2022-08-08 12:04:05', '2022-08-08 12:08:46', 1, NULL),
(46, 5, 25, '398.00', 1, '2022-08-08 12:04:05', '2022-08-08 12:04:05', 0, NULL),
(47, 5, 26, '398.00', 1, '2022-08-11 12:40:51', '2022-08-11 12:40:51', 0, NULL),
(48, 4, 26, '199.00', 1, '2022-08-11 12:40:51', '2022-08-11 12:40:51', 0, NULL),
(49, 7, 26, '78.00', 1, '2022-08-11 12:40:51', '2022-08-11 12:40:51', 0, NULL),
(50, 8, 26, '63.00', 1, '2022-08-11 12:40:51', '2022-08-11 12:40:51', 0, NULL),
(51, 7, 27, '78.00', 1, '2022-08-11 13:00:52', '2022-08-11 13:00:52', 0, NULL),
(52, 9, 28, '46.00', 1, '2022-08-11 13:52:54', '2022-08-11 13:52:54', 0, NULL),
(53, 5, 28, '398.00', 1, '2022-08-11 13:52:55', '2022-08-11 13:52:55', 0, NULL),
(54, 37, 29, '400.00', 1, '2022-08-13 00:51:51', '2022-08-13 00:51:51', 0, 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:2:{s:6:\"Colour\";s:5:\"White\";s:5:\"Sizes\";s:2:\"42\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('sarmilaroy583032@gmail.com', '$2y$10$Ax/8ptjAmW4K43dvTnoMCuWWc9pp5yXUYYiPolI9uK7QzXKrIc5CW', '2022-08-11 03:43:54'),
('sarmilaroy.tumpa@gmail.com', '$2y$10$tVmmiaLBjZqCuWs0PC4/LuitWVydkGRA5afFprlfMOoQhQhVnHG5K', '2022-08-11 12:58:33');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `regular_price` decimal(8,2) NOT NULL,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `SKU` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_status` enum('instock','outofstock') COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `regular_price`, `sale_price`, `SKU`, `stock_status`, `featured`, `quantity`, `image`, `images`, `category_id`, `created_at`, `updated_at`, `subcategory_id`) VALUES
(1, 'perspiciatis eligendi', 'perspiciatis-eligendi', 'Est enim et voluptatem quia dicta aut. Ipsam deserunt minima dolor nostrum. Aut atque nisi commodi dicta quae eveniet. Vel voluptatem ut magnam.', 'Ipsa cum libero atque voluptas quis debitis tempore a. Ut earum nesciunt aperiam sit dolores vel corporis. Perspiciatis consequatur minus laborum non adipisci.', '327.00', '215.00', 'DIGI380', 'instock', 0, 109, 'digital_15.jpg', ',16602386940.jpg,16602386941.jpg,16602386942.jpg', 2, '2022-06-30 03:26:50', '2022-08-11 11:24:54', NULL),
(2, 'numquam culpa', 'numquam-culpa', 'Velit nihil nemo minus nam vel. Molestiae voluptatum nam autem in iusto. Aut voluptatem perferendis non quia quis. Nulla eveniet facere architecto sapiente. Ipsa et ullam voluptates ipsum aliquam.', 'Culpa ullam et beatae ut voluptas rem culpa beatae. Assumenda error ut laborum ut cum. Recusandae eligendi excepturi nisi ab.', '249.00', '200.00', 'DIGI127', 'instock', 0, 140, 'digital_17.jpg', NULL, 1, '2022-06-30 03:26:50', '2022-07-16 14:07:22', NULL),
(3, 'consequatur occaecati', 'consequatur-occaecati', 'Dicta eius fuga quasi sint. Eos quidem eos reprehenderit explicabo est necessitatibus. Sed aspernatur fuga eum enim. Repellendus quo aperiam qui fugit.', 'Nesciunt a reprehenderit fuga esse. Blanditiis est aliquid quo quasi minima. Sed est voluptas voluptas maxime sunt officia vero.', '196.00', '170.00', 'DIGI394', 'instock', 0, 132, 'digital_18.jpg', NULL, 1, '2022-06-30 03:26:50', '2022-07-16 14:07:38', 7),
(4, 'voluptatibus blanditiis', 'voluptatibus-blanditiis', 'Maiores ut qui rerum quia facilis. Molestiae dolores ratione pariatur ratione quibusdam a. Qui fugit illo sed omnis consectetur ut. Rem consequatur quod magnam magni.', 'Id ratione repellendus nostrum ad dolorum dolorem ducimus. Minus eos iure blanditiis quo adipisci. Sint repudiandae quis mollitia perferendis cumque autem iusto.', '199.00', '180.00', 'DIGI456', 'instock', 0, 190, 'digital_20.jpg', NULL, 5, '2022-06-30 03:26:50', '2022-07-16 14:07:57', NULL),
(5, 'sed libero', 'sed-libero', 'Cumque illum id alias nihil. Qui blanditiis id quidem incidunt aut.', 'Odit culpa necessitatibus perferendis voluptas pariatur accusantium. Eos expedita delectus deserunt eveniet alias rerum sint. Et laborum non qui ut et vel et.', '398.00', '222.00', 'DIGI273', 'instock', 0, 199, 'digital_8.jpg', NULL, 1, '2022-06-30 03:26:50', '2022-07-16 14:08:12', 8),
(6, 'reprehenderit dicta', 'reprehenderit-dicta', 'Velit itaque ut saepe molestiae molestiae enim. Cupiditate eum ut beatae illo nulla est eius. Eveniet velit pariatur numquam.', 'Illo consectetur expedita itaque. Porro facilis similique totam mollitia et dolore quis. Enim provident sit qui nulla ipsam. Eius deserunt dolorum ducimus quam quia quia.', '116.00', NULL, 'DIGI201', 'instock', 0, 197, 'digital_6.jpg', NULL, 1, '2022-06-30 03:26:50', '2022-06-30 03:26:50', 7),
(7, 'placeat cumque', 'placeat-cumque', 'Dolorem sequi ut officiis et quia enim maxime quos. Et ipsum incidunt ab beatae. Explicabo tempore magnam laudantium repellendus consequatur ratione iure.', 'Eos cumque qui consequatur enim sint aliquam perspiciatis nostrum. Iusto at esse sapiente esse atque. Repudiandae adipisci omnis ex ipsam. Non amet velit quaerat iste eos odio saepe.', '78.00', NULL, 'DIGI321', 'instock', 0, 165, 'digital_19.jpg', NULL, 3, '2022-06-30 03:26:51', '2022-06-30 03:26:51', NULL),
(8, 'qui perspiciatis', 'qui-perspiciatis', 'Voluptas quaerat vitae laudantium cumque sunt. Libero et aut autem qui officiis repellendus.', 'Commodi illo error fugiat porro et quas. Quam debitis similique blanditiis explicabo aliquam et. Ex totam non nihil ipsam. Dolorem laboriosam tempore voluptate qui. Et quo debitis laboriosam nihil.', '63.00', NULL, 'DIGI406', 'instock', 0, 131, 'digital_9.jpg', NULL, 1, '2022-06-30 03:26:51', '2022-06-30 03:26:51', 8),
(9, 'quibusdam qui', 'quibusdam-qui', 'Iste porro eaque perferendis ex excepturi quod error. Beatae quo earum nostrum reiciendis.', 'Molestias eum deleniti ipsam aut reiciendis id sed. Eum qui iste quaerat porro ut in alias. Quibusdam eius harum commodi sapiente quam.', '46.00', NULL, 'DIGI384', 'instock', 0, 148, 'digital_11.jpg', NULL, 3, '2022-06-30 03:26:51', '2022-06-30 03:26:51', NULL),
(10, 'distinctio hic', 'distinctio-hic', 'Officiis eos quidem eum deserunt molestiae quia eum. Sint impedit doloribus laboriosam nisi eos temporibus amet. At est quae iure architecto non non nihil.', 'Eveniet totam earum minima consequatur consectetur aut a. Aut odit provident tenetur vel neque possimus. Dolorum consequatur et fugit quia quisquam sapiente.', '186.00', NULL, 'DIGI191', 'instock', 0, 134, 'digital_10.jpg', NULL, 5, '2022-06-30 03:26:51', '2022-06-30 03:26:51', NULL),
(11, 'delectus ut', 'delectus-ut', 'Aut ea ullam quia aspernatur. Et et vero aut aut saepe. Assumenda cum ea quia ut voluptates.', 'Pariatur deleniti animi vel praesentium inventore. Quis adipisci corrupti sint quod. Culpa et quia molestias impedit. Placeat maxime nobis voluptatibus architecto aut et.', '155.00', NULL, 'DIGI441', 'instock', 0, 141, 'digital_16.jpg', NULL, 1, '2022-06-30 03:26:51', '2022-06-30 03:26:51', NULL),
(12, 'cupiditate corporis', 'cupiditate-corporis', 'Nisi occaecati consequuntur in iste saepe atque totam. Dolorem neque odit earum exercitationem. Eum qui voluptas quisquam occaecati veritatis mollitia reiciendis.', 'Inventore et eius dicta necessitatibus quia. Iure illo laborum voluptas possimus maiores voluptas perferendis. Reiciendis quisquam voluptas maiores ullam nihil soluta natus.', '394.00', NULL, 'DIGI379', 'instock', 0, 100, 'digital_21.jpg', NULL, 4, '2022-06-30 03:26:51', '2022-06-30 03:26:51', NULL),
(13, 'est deserunt', 'est-deserunt', 'Veritatis est debitis perspiciatis repudiandae. Cupiditate expedita consequatur rerum qui laborum. Eaque beatae debitis qui maxime dicta.', 'Explicabo officiis ex alias voluptas sit. Blanditiis eius officia ea laudantium. Est similique ea consequuntur minus.', '359.00', NULL, 'DIGI286', 'instock', 0, 184, 'digital_22.jpg', NULL, 3, '2022-06-30 03:26:51', '2022-06-30 03:26:51', NULL),
(14, 'sed earum', 'sed-earum', 'Explicabo illo non iusto dolores minus quos. Dolores ea recusandae eligendi saepe labore quas minus. Maiores vitae molestias hic autem. Cupiditate explicabo dolore autem aut temporibus itaque.', 'Doloribus sequi natus fuga debitis repudiandae a molestias hic. Tempore aliquam ipsam distinctio eius. Nisi rem sint cumque nam voluptas culpa. Quia consequatur sit placeat vel dolor voluptas.', '324.00', NULL, 'DIGI437', 'instock', 0, 119, 'digital_3.jpg', NULL, 5, '2022-06-30 03:26:51', '2022-06-30 03:26:51', NULL),
(15, 'ea nesciunt', 'ea-nesciunt', 'Voluptatem quisquam veritatis recusandae aliquid harum voluptatem ullam exercitationem. Voluptates iste ullam qui. Dignissimos illo qui qui distinctio voluptas vero.', 'Exercitationem expedita odio est sed ea. Facilis voluptatem eos impedit rerum dolores. Deserunt qui quia aliquid recusandae est ut. Dolorem dolor rem libero molestias et vel assumenda.', '75.00', NULL, 'DIGI451', 'instock', 0, 102, 'digital_12.jpg', NULL, 5, '2022-06-30 03:26:51', '2022-06-30 03:26:51', NULL),
(16, 'autem vel', 'autem-vel', 'Qui tempora aspernatur fuga odit cum necessitatibus. Vel nisi tenetur numquam autem et porro ipsa. Id inventore dolores laborum alias. Facilis et optio voluptatum nulla reiciendis sint quod.', 'Porro totam qui culpa voluptatem. Consequatur natus ex aut vel. Numquam recusandae porro reprehenderit.', '313.00', NULL, 'DIGI469', 'instock', 0, 175, 'digital_14.jpg', NULL, 4, '2022-06-30 03:26:51', '2022-06-30 03:26:51', NULL),
(17, 'rerum maxime', 'rerum-maxime', 'Provident in non inventore qui ut amet. A tempore eligendi aliquid et dolorem dolores. Aperiam autem dolores voluptatem quibusdam officia aut optio.', 'Minus aut dolores quae qui molestiae nesciunt. Minima nisi nihil porro enim. Quia eaque facere velit alias quibusdam. Nemo id veritatis voluptatibus officiis qui tempore.', '198.00', NULL, 'DIGI393', 'instock', 0, 161, 'digital_1.jpg', NULL, 1, '2022-06-30 03:26:51', '2022-06-30 03:26:51', NULL),
(18, 'eum necessitatibus', 'eum-necessitatibus', 'Consequatur consectetur et debitis aut. Distinctio optio aliquam non tempore maxime ut. Eum in blanditiis ad consequuntur.', 'Delectus fuga minima excepturi excepturi voluptatibus qui ullam. Saepe cum qui harum exercitationem quis rerum rerum. Saepe esse similique occaecati ipsa.', '273.00', NULL, 'DIGI479', 'instock', 0, 105, 'digital_5.jpg', NULL, 5, '2022-06-30 03:26:51', '2022-06-30 03:26:51', NULL),
(19, 'aperiam numquam', 'aperiam-numquam', 'Consequatur ex autem rerum ab et neque minus. Aspernatur dolores est veniam et non culpa aperiam. Qui ut veniam corporis nemo enim voluptatum. Sunt nisi aut dolorem.', 'Quia quia blanditiis provident omnis molestias quas et. Autem officia aspernatur commodi dolore. Veritatis et deserunt commodi dolorem. Id qui cupiditate dicta quibusdam saepe.', '52.00', NULL, 'DIGI329', 'instock', 0, 167, 'digital_2.jpg', NULL, 4, '2022-06-30 03:26:51', '2022-06-30 03:26:51', NULL),
(20, 'sequi nisi', 'sequi-nisi', 'Sint ullam excepturi fuga. Nihil quo deserunt earum veritatis corrupti facilis.', 'Occaecati enim consectetur aut veritatis aliquid consequatur qui aperiam. A tenetur soluta laboriosam sit.', '343.00', NULL, 'DIGI141', 'instock', 0, 150, 'digital_13.jpg', NULL, 1, '2022-06-30 03:26:51', '2022-06-30 03:26:51', NULL),
(21, 'repellat atque', 'repellat-atque', 'Cum laudantium non a voluptatibus quasi excepturi. Rem a consequatur et nihil impedit. Fugit illo omnis neque eos quia. Ut est alias voluptatem dolore itaque. Commodi sunt et a ea.', 'Eaque hic quam sapiente eum omnis. Illum harum id numquam quasi et voluptatem sed. Qui voluptatibus blanditiis harum quasi vel odit. Et eum vel quidem.', '225.00', NULL, 'DIGI330', 'instock', 0, 159, 'digital_7.jpg', NULL, 4, '2022-06-30 03:26:51', '2022-06-30 03:26:51', NULL),
(22, 'molestias optio', 'molestias-optio', 'Quaerat quos ullam quas rerum quae ab. Et magni qui architecto ducimus et repellendus sint. Ea et rerum expedita illum.', 'Unde enim voluptas quo exercitationem porro qui repellendus. Beatae in repellat numquam fuga odit enim.', '251.00', NULL, 'DIGI131', 'instock', 0, 192, 'digital_4.jpg', NULL, 5, '2022-06-30 03:26:51', '2022-06-30 03:26:51', NULL),
(24, 'New product', 'new-product', 'New product short description', 'New product description', '200.00', NULL, 'digi209', 'instock', 0, 23, '1657978705.jpg', NULL, 1, '2022-07-16 07:38:25', '2022-07-16 07:38:25', NULL),
(27, 'New Products', 'new-products', '<p>New Products Short Description</p>', '<p>New Products Description</p>', '559.00', '550.00', 'DIGI454332', 'instock', 0, 11, '1660161086.jpg', ',1660161086.jpg,1660161086.jpg', 3, '2022-08-10 13:51:27', '2022-08-10 13:51:27', NULL),
(29, 'product', 'product', '<p>product short</p>', '<p>product description</p>', '560.00', '450.00', 'DIGI4564', 'instock', 0, 3, '1660201449.jpg', ',16602014490.jpg,16602014491.jpg,16602014492.jpg', 2, '2022-08-11 01:04:09', '2022-08-11 01:04:09', NULL),
(30, 'Camera', 'camera', '<p>Camera short description</p>', '<p>Camera description</p>', '500.00', '470.00', 'DIGI9867', 'instock', 0, 13, '1660296909.jpg', ',16602969090.jpg,16602969091.jpg,16602969092.jpg', 1, '2022-08-12 03:35:09', '2022-08-12 03:48:43', 10),
(31, 'new pro', 'new-pro', '<p>new pro</p>', '<p>new pro</p>', '300.00', '290.00', 'DIGI7876', 'instock', 0, 12, '1660327113.jpg', ',16603271130.jpg,16603271131.jpg,16603271132.jpg', 10, '2022-08-12 11:58:33', '2022-08-12 11:58:33', 5),
(32, 'asd', 'asd', '<p>asd</p>', '<p>asd</p>', '450.00', '440.00', 'DIGI4544', 'instock', 0, 11, '1660327305.jpg', ',16603273050.jpg,16603273051.jpg,16603273052.jpg', 10, '2022-08-12 12:01:45', '2022-08-12 12:01:45', 2),
(33, 'asdf', 'asdf', '<p>asd</p>', '<p>asd</p>', '300.00', '300.00', 'DIGI6554', 'instock', 0, 12, '1660327463.jpg', ',16603274630.jpg,16603274631.jpg', 10, '2022-08-12 12:04:23', '2022-08-12 12:04:23', 2),
(34, 'dsa', 'dsa', '<p>fgh</p>', '<p>hhhh</p>', '400.00', '380.00', 'DiGi5434', 'instock', 0, 11, '1660327624.jpg', ',16603276240.jpg,16603276241.jpg,16603276242.jpg', 10, '2022-08-12 12:07:04', '2022-08-12 12:07:04', 2),
(35, 'xcve', 'xcve', '<p>dfg</p>', '<p>gghh</p>', '400.00', '300.00', 'DIGI4543', 'instock', 0, 11, '1660327835.jpg', ',16603278350.jpg', 10, '2022-08-12 12:10:35', '2022-08-12 23:41:22', 2),
(36, 'zxc', 'zxc', '<p>zxc</p>', '<p>zxc</p>', '300.00', '300.00', 'DIGI4543', 'instock', 0, 11, '1660327968.jpg', ',16603279680.jpg', 10, '2022-08-12 12:12:48', '2022-08-12 12:12:48', 2),
(37, 'kli', 'kli', '<p>hjk</p>', '<p>uuu</p>', '400.00', '380.00', 'DIGI5434', 'instock', 0, 21, '1660328265.jpg', ',16603282650.jpg', 10, '2022-08-12 12:17:45', '2022-08-12 12:17:45', 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Colour', '2022-08-12 09:10:01', '2022-08-12 09:10:01'),
(2, 'Sizes', '2022-08-12 09:11:01', '2022-08-12 09:29:31');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `image`, `mobile`, `line1`, `line2`, `city`, `province`, `country`, `zipcode`, `created_at`, `updated_at`) VALUES
(1, 1, '1660309173.png', '01812757639', 'Feni', 'Feni', 'Feni', 'G.M.Hat', 'Bangladesh', '3900', '2022-08-12 06:00:56', '2022-08-12 07:24:54');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `rating`, `comment`, `order_item_id`, `created_at`, `updated_at`) VALUES
(1, 3, 'good product', 39, '2022-08-07 13:20:06', '2022-08-07 13:20:06'),
(2, 4, 'very nice', 40, '2022-08-07 13:29:04', '2022-08-07 13:29:04'),
(3, 4, 'good quality', 45, '2022-08-08 12:08:46', '2022-08-08 12:08:46');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `sale_date`, `status`, `created_at`, `updated_at`) VALUES
(1, '2022-07-22 04:08:10', 1, NULL, '2022-07-17 02:49:51');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('DeCZVEmnu5vAw1fm0CuGQHQpwUBy7SSSPaogZX5Q', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicjd2R0VHQzJRVHpqallGcG1RQWZ6dGVuVXdoN25KT1BCVElrQ0cyciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9vcmRlcnMvZGV0YWlscy8yOCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czo0OiJjYXJ0IjthOjI6e3M6NDoiY2FydCI7TzoyOToiSWxsdW1pbmF0ZVxTdXBwb3J0XENvbGxlY3Rpb24iOjI6e3M6ODoiACoAaXRlbXMiO2E6Mjp7czozMjoiOWQyMTE3NTUyMjhkNjQyNjY2NTgzNmZhNmEwMTBkZDAiO086MzI6Ikdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtIjo5OntzOjU6InJvd0lkIjtzOjMyOiI5ZDIxMTc1NTIyOGQ2NDI2NjY1ODM2ZmE2YTAxMGRkMCI7czoyOiJpZCI7aTozNztzOjM6InF0eSI7aToxO3M6NDoibmFtZSI7czozOiJrbGkiO3M6NToicHJpY2UiO2Q6NDAwO3M6Nzoib3B0aW9ucyI7TzozOToiR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW1PcHRpb25zIjoyOntzOjg6IgAqAGl0ZW1zIjthOjI6e3M6NToiU2l6ZXMiO3M6MjoiNDIiO3M6NjoiQ29sb3VyIjtzOjU6IldoaXRlIjt9czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO31zOjQ5OiIAR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0AYXNzb2NpYXRlZE1vZGVsIjtzOjE4OiJBcHBcTW9kZWxzXFByb2R1Y3QiO3M6NDE6IgBHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbQB0YXhSYXRlIjtpOjIxO3M6NDE6IgBHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbQBpc1NhdmVkIjtiOjA7fXM6MzI6IjQ4Y2UzMThmMDZhYzI5YzY4ZmU4MzBjNWUyMGNhOTZmIjtPOjMyOiJHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbSI6OTp7czo1OiJyb3dJZCI7czozMjoiNDhjZTMxOGYwNmFjMjljNjhmZTgzMGM1ZTIwY2E5NmYiO3M6MjoiaWQiO2k6Mzc7czozOiJxdHkiO2k6MTtzOjQ6Im5hbWUiO3M6Mzoia2xpIjtzOjU6InByaWNlIjtkOjQwMDtzOjc6Im9wdGlvbnMiO086Mzk6Ikdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtT3B0aW9ucyI6Mjp7czo4OiIAKgBpdGVtcyI7YToxOntzOjU6IlNpemVzIjtzOjI6IjMyIjt9czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO31zOjQ5OiIAR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0AYXNzb2NpYXRlZE1vZGVsIjtzOjE4OiJBcHBcTW9kZWxzXFByb2R1Y3QiO3M6NDE6IgBHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbQB0YXhSYXRlIjtpOjIxO3M6NDE6IgBHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbQBpc1NhdmVkIjtiOjA7fX1zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fXM6ODoid2lzaGxpc3QiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjA6e31zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fX19', 1660374092);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `map` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twiter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinterest` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `email`, `phone`, `phone2`, `address`, `map`, `twiter`, `facebook`, `pinterest`, `instagram`, `youtube`, `created_at`, `updated_at`) VALUES
(1, 'sarmilaroy@gmail.com', '123456789', '23232323', 'Zigatola,Dhanmondi,Dhaka', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3652.227128131684!2d90.37316291429671!3d23.73927869511944!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755b8ca98924d35%3A0x80755166618aa9f7!2sZigatola%20Bus%20Stand!5e0!3m2!1sbn!2sbd!4v1660159262297!5m2!1sbn!2sbd', '#', '#', '#', '#', '#', '2022-08-10 12:58:44', '2022-08-10 13:25:56');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `fastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `order_id`, `fastname`, `lastname`, `mobile`, `email`, `line1`, `line2`, `city`, `province`, `country`, `zipcode`, `created_at`, `updated_at`) VALUES
(3, 23, 'sarmila', 'roy', '1812757639', 'sarmilaroy583032@gmail.com', 'text1', NULL, 'G.M Hat', 'ghg', 'india', '3900', '2022-08-07 08:38:46', '2022-08-07 08:38:46');

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shoppingcart`
--

INSERT INTO `shoppingcart` (`identifier`, `instance`, `content`, `created_at`, `updated_at`) VALUES
('admin@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:2:{s:32:\"9d211755228d6426665836fa6a010dd0\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"9d211755228d6426665836fa6a010dd0\";s:2:\"id\";i:37;s:3:\"qty\";i:1;s:4:\"name\";s:3:\"kli\";s:5:\"price\";d:400;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:2:{s:5:\"Sizes\";s:2:\"42\";s:6:\"Colour\";s:5:\"White\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:21;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}s:32:\"48ce318f06ac29c68fe830c5e20ca96f\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"48ce318f06ac29c68fe830c5e20ca96f\";s:2:\"id\";i:37;s:3:\"qty\";i:1;s:4:\"name\";s:3:\"kli\";s:5:\"price\";d:400;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:1:{s:5:\"Sizes\";s:2:\"32\";}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:21;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2022-08-13 00:33:04', NULL),
('admin@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2022-08-13 00:32:29', NULL),
('sarmilaroy.tumpa@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:2:{s:32:\"370d08585360f5c568b18d1f2e4ca1df\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"370d08585360f5c568b18d1f2e4ca1df\";s:2:\"id\";i:2;s:3:\"qty\";i:1;s:4:\"name\";s:13:\"numquam culpa\";s:5:\"price\";d:249;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:21;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}s:32:\"efb26e2c6ab6bd4d1323288923522d4e\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"efb26e2c6ab6bd4d1323288923522d4e\";s:2:\"id\";i:4;s:3:\"qty\";i:1;s:4:\"name\";s:23:\"voluptatibus blanditiis\";s:5:\"price\";d:199;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:21;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2022-08-11 13:58:58', NULL),
('sarmilaroy583032@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2022-08-13 00:52:40', NULL),
('sarmilaroy583032@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2022-08-13 00:50:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `slug`, `category_id`, `created_at`, `updated_at`) VALUES
(2, 'Mobile', 'mobile', 10, '2022-08-11 14:26:04', '2022-08-11 14:26:04'),
(3, 'Refrigerator', 'refrigerator', 11, '2022-08-11 14:38:31', '2022-08-11 14:38:31'),
(4, 'Indunction Stove', 'indunction-stove', 11, '2022-08-11 14:38:50', '2022-08-11 14:38:50'),
(5, 'Leptop', 'leptop', 10, '2022-08-12 00:35:38', '2022-08-12 00:35:38'),
(6, 'desktop', 'desktop', 10, '2022-08-12 00:35:58', '2022-08-12 00:35:58'),
(7, 'Camera', 'camera', 1, '2022-08-12 03:09:05', '2022-08-12 03:09:05'),
(8, 'Television', 'television', 1, '2022-08-12 03:09:29', '2022-08-12 03:09:29'),
(10, 'Electric', 'electric', 1, '2022-08-12 03:47:58', '2022-08-12 03:47:58');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `mode` enum('cod','card','paypal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','declined','refunded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `mode`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 21, 'card', 'approved', '2022-07-21 14:42:16', '2022-07-21 14:42:16'),
(3, 1, 22, 'card', 'approved', '2022-07-22 06:16:12', '2022-07-22 06:16:12'),
(4, 1, 24, 'card', 'approved', '2022-08-07 08:41:14', '2022-08-07 08:41:14'),
(5, 1, 25, 'card', 'approved', '2022-08-08 12:04:12', '2022-08-08 12:04:12'),
(6, 1, 26, 'cod', 'pending', '2022-08-11 12:40:51', '2022-08-11 12:40:51'),
(7, 1, 27, 'cod', 'pending', '2022-08-11 13:00:52', '2022-08-11 13:00:52'),
(8, 3, 28, 'cod', 'pending', '2022-08-11 13:52:55', '2022-08-11 13:52:55'),
(9, 1, 29, 'cod', 'pending', '2022-08-13 00:51:51', '2022-08-13 00:51:51');

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
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USR' COMMENT 'ADM for Admin and USR for User or Customer',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `utype`, `created_at`, `updated_at`) VALUES
(1, 'SARMILA', 'sarmilaroy583032@gmail.com', NULL, '$2y$10$EWBr8.lUuhLd0xs6AMe69.pWdngEbxc08RAmBSqw0HHSFcfALfyYa', NULL, NULL, NULL, NULL, NULL, NULL, 'USR', '2022-07-03 13:45:53', '2022-08-10 09:22:10'),
(2, 'admin', 'admin@gmail.com', NULL, '$2y$10$mmUsSINgkVMa3mgkjqYyK.SYAM53nK2jpb3Btuqdbzi80F3P4WCJy', NULL, NULL, NULL, NULL, NULL, NULL, 'ADM', '2022-07-15 09:16:09', '2022-07-15 09:16:09'),
(3, 'Sarmila Roy', 'sarmilaroy.tumpa@gmail.com', NULL, '$2y$10$i0f.YpvlXb8enEFSUuYgWOB5DduKH60X9IZolsk4wTwWhPc6XBnwy', NULL, NULL, NULL, NULL, NULL, NULL, 'USR', '2022-08-11 02:05:29', '2022-08-11 02:05:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_values_product_attribute_id_foreign` (`product_attribute_id`),
  ADD KEY `attribute_values_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `home_categories`
--
ALTER TABLE `home_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_sliders`
--
ALTER TABLE `home_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_subcategory_id_foreign` (`subcategory_id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_order_item_id_foreign` (`order_item_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shippings_order_id_foreign` (`order_id`);

--
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategories_category_id_foreign` (`category_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

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
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_categories`
--
ALTER TABLE `home_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_sliders`
--
ALTER TABLE `home_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_product_attribute_id_foreign` FOREIGN KEY (`product_attribute_id`) REFERENCES `product_attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shippings`
--
ALTER TABLE `shippings`
  ADD CONSTRAINT `shippings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
