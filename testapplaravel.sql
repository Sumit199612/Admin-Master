-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 15, 2024 at 05:55 AM
-- Server version: 8.0.31
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testapplaravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) NOT NULL,
  `owner` varchar(191) NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(191) NOT NULL,
  `product_price` varchar(191) NOT NULL,
  `category_id` int NOT NULL,
  `coupon_id` int NOT NULL,
  `product_image` varchar(191) NOT NULL,
  `quantity` int DEFAULT '1',
  `product_total` varchar(191) DEFAULT NULL,
  `payment_status` tinyint DEFAULT '0',
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` varchar(191) NOT NULL,
  `parent_id` int DEFAULT '0',
  `slug` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
CREATE TABLE IF NOT EXISTS `communities` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `topic` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `content` varchar(191) NOT NULL,
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `coupon_option` varchar(191) NOT NULL,
  `coupon_code` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `amount` varchar(191) NOT NULL,
  `amount_type` varchar(191) NOT NULL,
  `expiry_date` date NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `c_m_s`
--

DROP TABLE IF EXISTS `c_m_s`;
CREATE TABLE IF NOT EXISTS `c_m_s` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `keyword` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `discussion_replies`
--

DROP TABLE IF EXISTS `discussion_replies`;
CREATE TABLE IF NOT EXISTS `discussion_replies` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `topic_id` bigint UNSIGNED DEFAULT NULL,
  `discussion_reply` varchar(191) NOT NULL,
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discussion_replies_user_id_index` (`user_id`),
  KEY `discussion_replies_topic_id_index` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2023_12_12_133257_create_c_m_s_table', 1),
(5, '2023_12_13_080950_create_settings_table', 1),
(6, '2023_12_13_120347_create_products_table', 1),
(7, '2023_12_13_121040_create_categories_table', 1),
(8, '2023_12_13_121745_create_coupons_table', 1),
(9, '2023_12_21_122224_create_plans_table', 1),
(10, '2024_01_01_082250_create_carts_table', 1),
(11, '2024_01_03_073917_create_orders_table', 1),
(12, '2024_01_09_125909_create_stripe_account_details_table', 1),
(13, '2024_01_11_100312_create_rating_reviews_table', 1),
(14, '2024_03_05_120020_create_communities_table', 1),
(15, '2024_03_06_072300_create_discussion_replies_table', 1),
(16, '2024_03_14_094302_create_permission_tables', 1),
(17, '2024_03_14_095759_create_customer_columns', 1),
(18, '2024_03_14_095800_create_subscriptions_table', 1),
(19, '2024_03_14_095801_create_subscription_items_table', 1),
(20, '2024_03_14_132023_create_oauth_auth_codes_table', 1),
(21, '2024_03_14_132024_create_oauth_access_tokens_table', 1),
(22, '2024_03_14_132025_create_oauth_refresh_tokens_table', 1),
(23, '2024_03_14_132026_create_oauth_clients_table', 1),
(24, '2024_03_14_132027_create_oauth_personal_access_clients_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `user_email` varchar(191) NOT NULL,
  `product_id` int NOT NULL,
  `category_id` int NOT NULL,
  `coupon_id` int NOT NULL,
  `cart_id` int NOT NULL,
  `order_type` varchar(191) DEFAULT NULL,
  `order_date` date NOT NULL,
  `order_time` time NOT NULL,
  `is_paid` tinyint DEFAULT NULL COMMENT '0: No, 1: Yes',
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'passport.token.refresh', 'web', '2024-03-14 23:37:28', '2024-03-14 23:37:28'),
(2, 'passport.authorizations.approve', 'web', '2024-03-14 23:37:28', '2024-03-14 23:37:28'),
(3, 'passport.authorizations.deny', 'web', '2024-03-14 23:37:28', '2024-03-14 23:37:28'),
(4, 'passport.tokens.index', 'web', '2024-03-14 23:37:28', '2024-03-14 23:37:28'),
(5, 'passport.tokens.destroy', 'web', '2024-03-14 23:37:28', '2024-03-14 23:37:28'),
(6, 'passport.clients.index', 'web', '2024-03-14 23:37:29', '2024-03-14 23:37:29'),
(7, 'passport.clients.store', 'web', '2024-03-14 23:37:29', '2024-03-14 23:37:29'),
(8, 'passport.clients.update', 'web', '2024-03-14 23:37:29', '2024-03-14 23:37:29'),
(9, 'passport.clients.destroy', 'web', '2024-03-14 23:37:29', '2024-03-14 23:37:29'),
(10, 'passport.scopes.index', 'web', '2024-03-14 23:37:29', '2024-03-14 23:37:29'),
(11, 'passport.personal.tokens.index', 'web', '2024-03-14 23:37:29', '2024-03-14 23:37:29'),
(12, 'passport.personal.tokens.store', 'web', '2024-03-14 23:37:29', '2024-03-14 23:37:29'),
(13, 'passport.personal.tokens.destroy', 'web', '2024-03-14 23:37:30', '2024-03-14 23:37:30'),
(14, 'sanctum.csrf-cookie', 'web', '2024-03-14 23:37:30', '2024-03-14 23:37:30'),
(15, 'login', 'web', '2024-03-14 23:37:30', '2024-03-14 23:37:30'),
(16, 'logout', 'web', '2024-03-14 23:37:30', '2024-03-14 23:37:30'),
(17, 'register', 'web', '2024-03-14 23:37:30', '2024-03-14 23:37:30'),
(18, 'password.request', 'web', '2024-03-14 23:37:30', '2024-03-14 23:37:30'),
(19, 'password.email', 'web', '2024-03-14 23:37:30', '2024-03-14 23:37:30'),
(20, 'password.reset', 'web', '2024-03-14 23:37:30', '2024-03-14 23:37:30'),
(21, 'password.update', 'web', '2024-03-14 23:37:31', '2024-03-14 23:37:31'),
(22, 'password.confirm', 'web', '2024-03-14 23:37:31', '2024-03-14 23:37:31'),
(23, 'admin.login', 'web', '2024-03-14 23:37:31', '2024-03-14 23:37:31'),
(24, 'forgot-password', 'web', '2024-03-14 23:37:31', '2024-03-14 23:37:31'),
(25, 'reset-password', 'web', '2024-03-14 23:37:31', '2024-03-14 23:37:31'),
(26, 'admin.dashboard', 'web', '2024-03-14 23:37:32', '2024-03-14 23:37:32'),
(27, 'admin.logout', 'web', '2024-03-14 23:37:32', '2024-03-14 23:37:32'),
(28, 'admin.profile', 'web', '2024-03-14 23:37:32', '2024-03-14 23:37:32'),
(29, 'admin.cms-index', 'web', '2024-03-14 23:37:32', '2024-03-14 23:37:32'),
(30, 'admin.cms-create', 'web', '2024-03-14 23:37:32', '2024-03-14 23:37:32'),
(31, 'admin.cms-update', 'web', '2024-03-14 23:37:32', '2024-03-14 23:37:32'),
(32, 'admin.delete-page', 'web', '2024-03-14 23:37:32', '2024-03-14 23:37:32'),
(33, 'admin.setting-email', 'web', '2024-03-14 23:37:33', '2024-03-14 23:37:33'),
(34, 'admin.setting-twillio', 'web', '2024-03-14 23:37:33', '2024-03-14 23:37:33'),
(35, 'admin.product-create', 'web', '2024-03-14 23:37:33', '2024-03-14 23:37:33'),
(36, 'admin.product-index', 'web', '2024-03-14 23:37:33', '2024-03-14 23:37:33'),
(37, 'admin.product-update', 'web', '2024-03-14 23:37:33', '2024-03-14 23:37:33'),
(38, 'admin.delete-product', 'web', '2024-03-14 23:37:33', '2024-03-14 23:37:33'),
(39, 'admin.category-create', 'web', '2024-03-14 23:37:33', '2024-03-14 23:37:33'),
(40, 'admin.category-index', 'web', '2024-03-14 23:37:33', '2024-03-14 23:37:33'),
(41, 'admin.category-update', 'web', '2024-03-14 23:37:34', '2024-03-14 23:37:34'),
(42, 'admin.delete-category', 'web', '2024-03-14 23:37:34', '2024-03-14 23:37:34'),
(43, 'admin.coupon-create', 'web', '2024-03-14 23:37:34', '2024-03-14 23:37:34'),
(44, 'admin.coupon-index', 'web', '2024-03-14 23:37:34', '2024-03-14 23:37:34'),
(45, 'admin.coupon-update', 'web', '2024-03-14 23:37:34', '2024-03-14 23:37:34'),
(46, 'admin.delete-coupon', 'web', '2024-03-14 23:37:34', '2024-03-14 23:37:34'),
(47, 'admin.user.index', 'web', '2024-03-14 23:37:34', '2024-03-14 23:37:34'),
(48, 'admin.user.create', 'web', '2024-03-14 23:37:35', '2024-03-14 23:37:35'),
(49, 'admin.user.store', 'web', '2024-03-14 23:37:35', '2024-03-14 23:37:35'),
(50, 'admin.user.edit', 'web', '2024-03-14 23:37:35', '2024-03-14 23:37:35'),
(51, 'admin.user.update', 'web', '2024-03-14 23:37:35', '2024-03-14 23:37:35'),
(52, 'admin.user.destroy', 'web', '2024-03-14 23:37:35', '2024-03-14 23:37:35'),
(53, 'roles.index', 'web', '2024-03-14 23:37:35', '2024-03-14 23:37:35'),
(54, 'roles.create', 'web', '2024-03-14 23:37:36', '2024-03-14 23:37:36'),
(55, 'roles.store', 'web', '2024-03-14 23:37:36', '2024-03-14 23:37:36'),
(56, 'roles.show', 'web', '2024-03-14 23:37:36', '2024-03-14 23:37:36'),
(57, 'roles.edit', 'web', '2024-03-14 23:37:36', '2024-03-14 23:37:36'),
(58, 'roles.update', 'web', '2024-03-14 23:37:36', '2024-03-14 23:37:36'),
(59, 'roles.destroy', 'web', '2024-03-14 23:37:36', '2024-03-14 23:37:36'),
(60, 'permissions.index', 'web', '2024-03-14 23:37:37', '2024-03-14 23:37:37'),
(61, 'permissions.create', 'web', '2024-03-14 23:37:37', '2024-03-14 23:37:37'),
(62, 'permissions.store', 'web', '2024-03-14 23:37:37', '2024-03-14 23:37:37'),
(63, 'permissions.show', 'web', '2024-03-14 23:37:37', '2024-03-14 23:37:37'),
(64, 'permissions.edit', 'web', '2024-03-14 23:37:37', '2024-03-14 23:37:37'),
(65, 'permissions.update', 'web', '2024-03-14 23:37:37', '2024-03-14 23:37:37'),
(66, 'permissions.destroy', 'web', '2024-03-14 23:37:37', '2024-03-14 23:37:37'),
(67, 'admin.plan-create', 'web', '2024-03-14 23:37:38', '2024-03-14 23:37:38'),
(68, 'admin.plan-index', 'web', '2024-03-14 23:37:38', '2024-03-14 23:37:38'),
(69, 'admin.plan-update', 'web', '2024-03-14 23:37:38', '2024-03-14 23:37:38'),
(70, 'admin.delete-plan', 'web', '2024-03-14 23:37:38', '2024-03-14 23:37:38'),
(71, 'admin.discussion-index', 'web', '2024-03-14 23:37:38', '2024-03-14 23:37:38'),
(72, 'admin.discussion-create', 'web', '2024-03-14 23:37:38', '2024-03-14 23:37:38'),
(73, 'admin.discussion-update', 'web', '2024-03-14 23:37:38', '2024-03-14 23:37:38'),
(74, 'admin.delete-discussion', 'web', '2024-03-14 23:37:39', '2024-03-14 23:37:39'),
(75, 'stripe-index', 'web', '2024-03-14 23:37:39', '2024-03-14 23:37:39'),
(76, 'single-charge', 'web', '2024-03-14 23:37:39', '2024-03-14 23:37:39'),
(77, 'save-stripe-card', 'web', '2024-03-14 23:37:39', '2024-03-14 23:37:39');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
CREATE TABLE IF NOT EXISTS `plans` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `price` varchar(191) NOT NULL,
  `plan_type` tinyint DEFAULT NULL COMMENT '0: Monthly, 1: Quartarly, 2: Yearly',
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `product_name` varchar(191) NOT NULL,
  `product_code` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `product_price` varchar(191) DEFAULT NULL,
  `product_image` varchar(191) DEFAULT NULL,
  `promo_code` varchar(191) DEFAULT NULL,
  `subscription_type` tinyint DEFAULT '1' COMMENT '0: Life time with subscription',
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `rating_reviews`
--

DROP TABLE IF EXISTS `rating_reviews`;
CREATE TABLE IF NOT EXISTS `rating_reviews` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `rating` varchar(191) NOT NULL,
  `review` varchar(191) NOT NULL,
  `isPublishable` tinyint DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'web', '2024-03-14 23:37:59', '2024-03-14 23:37:59');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `payload` longtext NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('UpRHVwHiV4HmWEfr2AAcayW9hvO6x2LwhR82CLS8', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiN1VIS0pQS0twMWpxS0MxbG4zQlU0V0RHZHhGRDByaTdVMExJSGZ0QSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MDoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL3JvbGVzLzEvZWRpdCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vcHJvZHVjdC1pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1710479337);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) NOT NULL,
  `value` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `stripe_account_details`
--

DROP TABLE IF EXISTS `stripe_account_details`;
CREATE TABLE IF NOT EXISTS `stripe_account_details` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `user_email` varchar(191) NOT NULL,
  `stripe_accountId` varchar(191) DEFAULT NULL,
  `stripe_accountLink` varchar(191) DEFAULT NULL,
  `created` varchar(191) DEFAULT NULL,
  `expires_at` varchar(191) DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE IF NOT EXISTS `subscriptions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `user_email` varchar(191) NOT NULL,
  `plan_name` varchar(191) NOT NULL,
  `plan_value` varchar(191) NOT NULL,
  `subscription_type` tinyint NOT NULL COMMENT '0: Quartarly, 1: Monthly, 2: Yearly',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `subscription_status` tinyint NOT NULL COMMENT '0: Payment Failed, 1: Active, 2: Expired',
  `type` varchar(191) NOT NULL,
  `stripe_id` varchar(191) NOT NULL,
  `stripe_status` varchar(191) NOT NULL,
  `stripe_price` varchar(191) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `status` tinyint DEFAULT '1' COMMENT '0: Inactive, 1: Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

DROP TABLE IF EXISTS `subscription_items`;
CREATE TABLE IF NOT EXISTS `subscription_items` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint UNSIGNED NOT NULL,
  `stripe_id` varchar(191) NOT NULL,
  `stripe_product` varchar(191) NOT NULL,
  `stripe_price` varchar(191) NOT NULL,
  `quantity` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`),
  KEY `subscription_items_subscription_id_stripe_price_index` (`subscription_id`,`stripe_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `username` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `isUser` varchar(191) DEFAULT NULL COMMENT '0: Administration, 1: User',
  `device_type` varchar(191) DEFAULT NULL,
  `device_token` varchar(191) DEFAULT NULL,
  `login_key` varchar(191) DEFAULT NULL,
  `login_type` varchar(191) DEFAULT NULL,
  `social_key` varchar(191) DEFAULT NULL,
  `referal_code` varchar(191) DEFAULT NULL,
  `invitation_count` int DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(191) DEFAULT NULL,
  `pm_type` varchar(191) DEFAULT NULL,
  `pm_last_four` varchar(4) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_mobile_unique` (`mobile`),
  KEY `users_stripe_id_index` (`stripe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `type`, `email`, `email_verified_at`, `mobile`, `avatar`, `password`, `isUser`, `device_type`, `device_token`, `login_key`, `login_type`, `social_key`, `referal_code`, `invitation_count`, `status`, `remember_token`, `created_at`, `updated_at`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`) VALUES
(1, 'Super Admin', NULL, 'superadmin', 'admin00@yopmail.com', NULL, '9999999999', NULL, '$2y$12$gGJm8WH4qepg4s4ojvlybOCZFt82LkXWJbZJ8Bat8noqpATrYjulm', '0', '', '', 'd9c03094d0d5b4d431febde540bf70646c21cf55', NULL, NULL, NULL, NULL, 1, NULL, '2024-03-14 23:37:59', '2024-03-14 23:38:37', NULL, NULL, NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `discussion_replies`
--
ALTER TABLE `discussion_replies`
  ADD CONSTRAINT `discussion_replies_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `communities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `discussion_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
