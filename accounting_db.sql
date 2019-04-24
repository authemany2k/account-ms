-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 08, 2017 at 05:43 PM
-- Server version: 10.2.3-MariaDB-log
-- PHP Version: 7.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `accounting_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `ak_accounts`
--

CREATE TABLE `ak_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_balance` double(15,4) NOT NULL DEFAULT 0.0000,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ak_accounts`
--

INSERT INTO `ak_accounts` (`id`, `company_id`, `name`, `number`, `currency_code`, `opening_balance`, `bank_name`, `bank_phone`, `bank_address`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Cash', '1', 'USD', 0.0000, 'Cash', NULL, NULL, 1, '2017-11-07 14:12:46', '2017-11-07 14:12:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ak_bills`
--

CREATE TABLE `ak_bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_status_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billed_at` date NOT NULL,
  `due_at` date NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `vendor_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ak_bill_histories`
--

CREATE TABLE `ak_bill_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `status_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ak_bill_items`
--

CREATE TABLE `ak_bill_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(15,4) NOT NULL,
  `total` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT 0.0000,
  `tax_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ak_bill_payments`
--

CREATE TABLE `ak_bill_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` date NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ak_bill_statuses`
--

CREATE TABLE `ak_bill_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ak_bill_statuses`
--

INSERT INTO `ak_bill_statuses` (`id`, `company_id`, `name`, `code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'New', 'new', '2017-11-07 14:12:46', '2017-11-07 14:12:46', NULL),
(2, 1, 'Updated', 'updated', '2017-11-07 14:12:46', '2017-11-07 14:12:46', NULL),
(3, 1, 'Partial', 'partial', '2017-11-07 14:12:46', '2017-11-07 14:12:46', NULL),
(4, 1, 'Paid', 'paid', '2017-11-07 14:12:46', '2017-11-07 14:12:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ak_bill_totals`
--

CREATE TABLE `ak_bill_totals` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ak_categories`
--

CREATE TABLE `ak_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ak_categories`
--

INSERT INTO `ak_categories` (`id`, `company_id`, `name`, `type`, `color`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Transfer', 'other', '#605ca8', 1, '2017-11-07 14:12:46', '2017-11-07 14:12:46', NULL),
(2, 1, 'Deposit', 'income', '#f39c12', 1, '2017-11-07 14:12:47', '2017-11-07 14:12:47', NULL),
(3, 1, 'Sales', 'income', '#6da252', 1, '2017-11-07 14:12:47', '2017-11-07 14:12:47', NULL),
(4, 1, 'Uncategorised', 'expense', '#d2d6de', 1, '2017-11-07 14:12:47', '2017-11-07 14:12:47', NULL),
(5, 1, 'General', 'item', '#00c0ef', 1, '2017-11-07 14:12:47', '2017-11-07 14:12:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ak_companies`
--

CREATE TABLE `ak_companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `domain` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ak_companies`
--

INSERT INTO `ak_companies` (`id`, `domain`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test.com', 1, '2017-11-07 14:12:45', '2017-11-07 14:12:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ak_currencies`
--

CREATE TABLE `ak_currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(15,8) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ak_currencies`
--

INSERT INTO `ak_currencies` (`id`, `company_id`, `name`, `code`, `rate`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'US Dollar', 'USD', 1.00000000, 1, '2017-11-07 14:12:47', '2017-11-07 14:12:47', NULL),
(2, 1, 'Euro', 'EUR', 1.25000000, 0, '2017-11-07 14:12:47', '2017-11-07 14:12:47', NULL),
(3, 1, 'British Pound', 'GBP', 1.60000000, 0, '2017-11-07 14:12:47', '2017-11-07 14:12:47', NULL),
(4, 1, 'Turkish Lira', 'TRY', 0.80000000, 0, '2017-11-07 14:12:47', '2017-11-07 14:12:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ak_customers`
--

CREATE TABLE `ak_customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ak_invoices`
--

CREATE TABLE `ak_invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_status_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoiced_at` date NOT NULL,
  `due_at` date NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ak_invoice_histories`
--

CREATE TABLE `ak_invoice_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `status_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ak_invoice_items`
--

CREATE TABLE `ak_invoice_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(15,4) NOT NULL,
  `total` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT 0.0000,
  `tax_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ak_invoice_payments`
--

CREATE TABLE `ak_invoice_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` date NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ak_invoice_statuses`
--

CREATE TABLE `ak_invoice_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ak_invoice_statuses`
--

INSERT INTO `ak_invoice_statuses` (`id`, `company_id`, `name`, `code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Draft', 'draft', '2017-11-07 14:12:47', '2017-11-07 14:12:47', NULL),
(2, 1, 'Sent', 'sent', '2017-11-07 14:12:48', '2017-11-07 14:12:48', NULL),
(3, 1, 'Viewed', 'viewed', '2017-11-07 14:12:48', '2017-11-07 14:12:48', NULL),
(4, 1, 'Approved', 'approved', '2017-11-07 14:12:48', '2017-11-07 14:12:48', NULL),
(5, 1, 'Partial', 'partial', '2017-11-07 14:12:48', '2017-11-07 14:12:48', NULL),
(6, 1, 'Paid', 'paid', '2017-11-07 14:12:48', '2017-11-07 14:12:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ak_invoice_totals`
--

CREATE TABLE `ak_invoice_totals` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ak_items`
--

CREATE TABLE `ak_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_price` double(15,4) NOT NULL,
  `purchase_price` double(15,4) NOT NULL,
  `quantity` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ak_jobs`
--

CREATE TABLE `ak_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ak_migrations`
--

CREATE TABLE `ak_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ak_migrations`
--

INSERT INTO `ak_migrations` (`id`, `migration`, `batch`) VALUES
(1, '2017_09_01_000000_create_accounts_table', 1),
(2, '2017_09_01_000000_create_bills_table', 1),
(3, '2017_09_01_000000_create_categories_table', 1),
(4, '2017_09_01_000000_create_companies_table', 1),
(5, '2017_09_01_000000_create_currencies_table', 1),
(6, '2017_09_01_000000_create_customers_table', 1),
(7, '2017_09_01_000000_create_invoices_table', 1),
(8, '2017_09_01_000000_create_items_table', 1),
(9, '2017_09_01_000000_create_jobs_table', 1),
(10, '2017_09_01_000000_create_modules_table', 1),
(11, '2017_09_01_000000_create_notifications_table', 1),
(12, '2017_09_01_000000_create_password_resets_table', 1),
(13, '2017_09_01_000000_create_payments_table', 1),
(14, '2017_09_01_000000_create_revenues_table', 1),
(15, '2017_09_01_000000_create_roles_table', 1),
(16, '2017_09_01_000000_create_sessions_table', 1),
(17, '2017_09_01_000000_create_settings_table', 1),
(18, '2017_09_01_000000_create_taxes_table', 1),
(19, '2017_09_01_000000_create_transfers_table', 1),
(20, '2017_09_01_000000_create_users_table', 1),
(21, '2017_09_01_000000_create_vendors_table', 1),
(22, '2017_09_19_delete_offline_file', 1),
(23, '2017_10_11_000000_create_bill_totals_table', 1),
(24, '2017_10_11_000000_create_invoice_totals_table', 1),
(25, '2020_01_01_000000_add_locale_column', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ak_modules`
--

CREATE TABLE `ak_modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ak_module_histories`
--

CREATE TABLE `ak_module_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ak_notifications`
--

CREATE TABLE `ak_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) UNSIGNED NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ak_password_resets`
--

CREATE TABLE `ak_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ak_payments`
--

CREATE TABLE `ak_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` date NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ak_permissions`
--

CREATE TABLE `ak_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ak_permissions`
--

INSERT INTO `ak_permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'read-admin-panel', 'Read Admin Panel', 'Read Admin Panel', '2017-11-07 14:12:11', '2017-11-07 14:12:11'),
(2, 'read-api', 'Read Api', 'Read Api', '2017-11-07 14:12:12', '2017-11-07 14:12:12'),
(3, 'create-auth-users', 'Create Auth Users', 'Create Auth Users', '2017-11-07 14:12:12', '2017-11-07 14:12:12'),
(4, 'read-auth-users', 'Read Auth Users', 'Read Auth Users', '2017-11-07 14:12:12', '2017-11-07 14:12:12'),
(5, 'update-auth-users', 'Update Auth Users', 'Update Auth Users', '2017-11-07 14:12:13', '2017-11-07 14:12:13'),
(6, 'delete-auth-users', 'Delete Auth Users', 'Delete Auth Users', '2017-11-07 14:12:13', '2017-11-07 14:12:13'),
(7, 'create-auth-roles', 'Create Auth Roles', 'Create Auth Roles', '2017-11-07 14:12:13', '2017-11-07 14:12:13'),
(8, 'read-auth-roles', 'Read Auth Roles', 'Read Auth Roles', '2017-11-07 14:12:13', '2017-11-07 14:12:13'),
(9, 'update-auth-roles', 'Update Auth Roles', 'Update Auth Roles', '2017-11-07 14:12:14', '2017-11-07 14:12:14'),
(10, 'delete-auth-roles', 'Delete Auth Roles', 'Delete Auth Roles', '2017-11-07 14:12:14', '2017-11-07 14:12:14'),
(11, 'create-auth-permissions', 'Create Auth Permissions', 'Create Auth Permissions', '2017-11-07 14:12:14', '2017-11-07 14:12:14'),
(12, 'read-auth-permissions', 'Read Auth Permissions', 'Read Auth Permissions', '2017-11-07 14:12:14', '2017-11-07 14:12:14'),
(13, 'update-auth-permissions', 'Update Auth Permissions', 'Update Auth Permissions', '2017-11-07 14:12:14', '2017-11-07 14:12:14'),
(14, 'delete-auth-permissions', 'Delete Auth Permissions', 'Delete Auth Permissions', '2017-11-07 14:12:15', '2017-11-07 14:12:15'),
(15, 'read-auth-profile', 'Read Auth Profile', 'Read Auth Profile', '2017-11-07 14:12:15', '2017-11-07 14:12:15'),
(16, 'update-auth-profile', 'Update Auth Profile', 'Update Auth Profile', '2017-11-07 14:12:16', '2017-11-07 14:12:16'),
(17, 'create-companies-companies', 'Create Companies Companies', 'Create Companies Companies', '2017-11-07 14:12:16', '2017-11-07 14:12:16'),
(18, 'read-companies-companies', 'Read Companies Companies', 'Read Companies Companies', '2017-11-07 14:12:16', '2017-11-07 14:12:16'),
(19, 'update-companies-companies', 'Update Companies Companies', 'Update Companies Companies', '2017-11-07 14:12:16', '2017-11-07 14:12:16'),
(20, 'delete-companies-companies', 'Delete Companies Companies', 'Delete Companies Companies', '2017-11-07 14:12:16', '2017-11-07 14:12:16'),
(21, 'create-items-items', 'Create Items Items', 'Create Items Items', '2017-11-07 14:12:17', '2017-11-07 14:12:17'),
(22, 'read-items-items', 'Read Items Items', 'Read Items Items', '2017-11-07 14:12:17', '2017-11-07 14:12:17'),
(23, 'update-items-items', 'Update Items Items', 'Update Items Items', '2017-11-07 14:12:17', '2017-11-07 14:12:17'),
(24, 'delete-items-items', 'Delete Items Items', 'Delete Items Items', '2017-11-07 14:12:17', '2017-11-07 14:12:17'),
(25, 'create-incomes-invoices', 'Create Incomes Invoices', 'Create Incomes Invoices', '2017-11-07 14:12:18', '2017-11-07 14:12:18'),
(26, 'read-incomes-invoices', 'Read Incomes Invoices', 'Read Incomes Invoices', '2017-11-07 14:12:18', '2017-11-07 14:12:18'),
(27, 'update-incomes-invoices', 'Update Incomes Invoices', 'Update Incomes Invoices', '2017-11-07 14:12:18', '2017-11-07 14:12:18'),
(28, 'delete-incomes-invoices', 'Delete Incomes Invoices', 'Delete Incomes Invoices', '2017-11-07 14:12:18', '2017-11-07 14:12:18'),
(29, 'create-incomes-revenues', 'Create Incomes Revenues', 'Create Incomes Revenues', '2017-11-07 14:12:19', '2017-11-07 14:12:19'),
(30, 'read-incomes-revenues', 'Read Incomes Revenues', 'Read Incomes Revenues', '2017-11-07 14:12:19', '2017-11-07 14:12:19'),
(31, 'update-incomes-revenues', 'Update Incomes Revenues', 'Update Incomes Revenues', '2017-11-07 14:12:19', '2017-11-07 14:12:19'),
(32, 'delete-incomes-revenues', 'Delete Incomes Revenues', 'Delete Incomes Revenues', '2017-11-07 14:12:19', '2017-11-07 14:12:19'),
(33, 'create-incomes-customers', 'Create Incomes Customers', 'Create Incomes Customers', '2017-11-07 14:12:19', '2017-11-07 14:12:19'),
(34, 'read-incomes-customers', 'Read Incomes Customers', 'Read Incomes Customers', '2017-11-07 14:12:20', '2017-11-07 14:12:20'),
(35, 'update-incomes-customers', 'Update Incomes Customers', 'Update Incomes Customers', '2017-11-07 14:12:20', '2017-11-07 14:12:20'),
(36, 'delete-incomes-customers', 'Delete Incomes Customers', 'Delete Incomes Customers', '2017-11-07 14:12:20', '2017-11-07 14:12:20'),
(37, 'create-expenses-bills', 'Create Expenses Bills', 'Create Expenses Bills', '2017-11-07 14:12:20', '2017-11-07 14:12:20'),
(38, 'read-expenses-bills', 'Read Expenses Bills', 'Read Expenses Bills', '2017-11-07 14:12:21', '2017-11-07 14:12:21'),
(39, 'update-expenses-bills', 'Update Expenses Bills', 'Update Expenses Bills', '2017-11-07 14:12:21', '2017-11-07 14:12:21'),
(40, 'delete-expenses-bills', 'Delete Expenses Bills', 'Delete Expenses Bills', '2017-11-07 14:12:21', '2017-11-07 14:12:21'),
(41, 'create-expenses-payments', 'Create Expenses Payments', 'Create Expenses Payments', '2017-11-07 14:12:21', '2017-11-07 14:12:21'),
(42, 'read-expenses-payments', 'Read Expenses Payments', 'Read Expenses Payments', '2017-11-07 14:12:22', '2017-11-07 14:12:22'),
(43, 'update-expenses-payments', 'Update Expenses Payments', 'Update Expenses Payments', '2017-11-07 14:12:22', '2017-11-07 14:12:22'),
(44, 'delete-expenses-payments', 'Delete Expenses Payments', 'Delete Expenses Payments', '2017-11-07 14:12:22', '2017-11-07 14:12:22'),
(45, 'create-expenses-vendors', 'Create Expenses Vendors', 'Create Expenses Vendors', '2017-11-07 14:12:22', '2017-11-07 14:12:22'),
(46, 'read-expenses-vendors', 'Read Expenses Vendors', 'Read Expenses Vendors', '2017-11-07 14:12:23', '2017-11-07 14:12:23'),
(47, 'update-expenses-vendors', 'Update Expenses Vendors', 'Update Expenses Vendors', '2017-11-07 14:12:23', '2017-11-07 14:12:23'),
(48, 'delete-expenses-vendors', 'Delete Expenses Vendors', 'Delete Expenses Vendors', '2017-11-07 14:12:23', '2017-11-07 14:12:23'),
(49, 'create-banking-accounts', 'Create Banking Accounts', 'Create Banking Accounts', '2017-11-07 14:12:23', '2017-11-07 14:12:23'),
(50, 'read-banking-accounts', 'Read Banking Accounts', 'Read Banking Accounts', '2017-11-07 14:12:24', '2017-11-07 14:12:24'),
(51, 'update-banking-accounts', 'Update Banking Accounts', 'Update Banking Accounts', '2017-11-07 14:12:24', '2017-11-07 14:12:24'),
(52, 'delete-banking-accounts', 'Delete Banking Accounts', 'Delete Banking Accounts', '2017-11-07 14:12:24', '2017-11-07 14:12:24'),
(53, 'create-banking-transfers', 'Create Banking Transfers', 'Create Banking Transfers', '2017-11-07 14:12:24', '2017-11-07 14:12:24'),
(54, 'read-banking-transfers', 'Read Banking Transfers', 'Read Banking Transfers', '2017-11-07 14:12:25', '2017-11-07 14:12:25'),
(55, 'update-banking-transfers', 'Update Banking Transfers', 'Update Banking Transfers', '2017-11-07 14:12:25', '2017-11-07 14:12:25'),
(56, 'delete-banking-transfers', 'Delete Banking Transfers', 'Delete Banking Transfers', '2017-11-07 14:12:25', '2017-11-07 14:12:25'),
(57, 'read-banking-transactions', 'Read Banking Transactions', 'Read Banking Transactions', '2017-11-07 14:12:25', '2017-11-07 14:12:25'),
(58, 'create-settings-categories', 'Create Settings Categories', 'Create Settings Categories', '2017-11-07 14:12:26', '2017-11-07 14:12:26'),
(59, 'read-settings-categories', 'Read Settings Categories', 'Read Settings Categories', '2017-11-07 14:12:26', '2017-11-07 14:12:26'),
(60, 'update-settings-categories', 'Update Settings Categories', 'Update Settings Categories', '2017-11-07 14:12:26', '2017-11-07 14:12:26'),
(61, 'delete-settings-categories', 'Delete Settings Categories', 'Delete Settings Categories', '2017-11-07 14:12:26', '2017-11-07 14:12:26'),
(62, 'read-settings-settings', 'Read Settings Settings', 'Read Settings Settings', '2017-11-07 14:12:27', '2017-11-07 14:12:27'),
(63, 'update-settings-settings', 'Update Settings Settings', 'Update Settings Settings', '2017-11-07 14:12:27', '2017-11-07 14:12:27'),
(64, 'create-settings-taxes', 'Create Settings Taxes', 'Create Settings Taxes', '2017-11-07 14:12:27', '2017-11-07 14:12:27'),
(65, 'read-settings-taxes', 'Read Settings Taxes', 'Read Settings Taxes', '2017-11-07 14:12:28', '2017-11-07 14:12:28'),
(66, 'update-settings-taxes', 'Update Settings Taxes', 'Update Settings Taxes', '2017-11-07 14:12:28', '2017-11-07 14:12:28'),
(67, 'delete-settings-taxes', 'Delete Settings Taxes', 'Delete Settings Taxes', '2017-11-07 14:12:28', '2017-11-07 14:12:28'),
(68, 'create-settings-currencies', 'Create Settings Currencies', 'Create Settings Currencies', '2017-11-07 14:12:29', '2017-11-07 14:12:29'),
(69, 'read-settings-currencies', 'Read Settings Currencies', 'Read Settings Currencies', '2017-11-07 14:12:29', '2017-11-07 14:12:29'),
(70, 'update-settings-currencies', 'Update Settings Currencies', 'Update Settings Currencies', '2017-11-07 14:12:29', '2017-11-07 14:12:29'),
(71, 'delete-settings-currencies', 'Delete Settings Currencies', 'Delete Settings Currencies', '2017-11-07 14:12:29', '2017-11-07 14:12:29'),
(72, 'read-settings-modules', 'Read Settings Modules', 'Read Settings Modules', '2017-11-07 14:12:30', '2017-11-07 14:12:30'),
(73, 'update-settings-modules', 'Update Settings Modules', 'Update Settings Modules', '2017-11-07 14:12:30', '2017-11-07 14:12:30'),
(74, 'read-modules-home', 'Read Modules Home', 'Read Modules Home', '2017-11-07 14:12:30', '2017-11-07 14:12:30'),
(75, 'read-modules-tiles', 'Read Modules Tiles', 'Read Modules Tiles', '2017-11-07 14:12:31', '2017-11-07 14:12:31'),
(76, 'create-modules-item', 'Create Modules Item', 'Create Modules Item', '2017-11-07 14:12:31', '2017-11-07 14:12:31'),
(77, 'read-modules-item', 'Read Modules Item', 'Read Modules Item', '2017-11-07 14:12:31', '2017-11-07 14:12:31'),
(78, 'update-modules-item', 'Update Modules Item', 'Update Modules Item', '2017-11-07 14:12:31', '2017-11-07 14:12:31'),
(79, 'delete-modules-item', 'Delete Modules Item', 'Delete Modules Item', '2017-11-07 14:12:31', '2017-11-07 14:12:31'),
(80, 'create-modules-token', 'Create Modules Token', 'Create Modules Token', '2017-11-07 14:12:32', '2017-11-07 14:12:32'),
(81, 'update-modules-token', 'Update Modules Token', 'Update Modules Token', '2017-11-07 14:12:32', '2017-11-07 14:12:32'),
(82, 'read-install-updates', 'Read Install Updates', 'Read Install Updates', '2017-11-07 14:12:32', '2017-11-07 14:12:32'),
(83, 'update-install-updates', 'Update Install Updates', 'Update Install Updates', '2017-11-07 14:12:33', '2017-11-07 14:12:33'),
(84, 'read-notifications', 'Read Notifications', 'Read Notifications', '2017-11-07 14:12:33', '2017-11-07 14:12:33'),
(85, 'update-notifications', 'Update Notifications', 'Update Notifications', '2017-11-07 14:12:33', '2017-11-07 14:12:33'),
(86, 'read-reports-income-summary', 'Read Reports Income Summary', 'Read Reports Income Summary', '2017-11-07 14:12:33', '2017-11-07 14:12:33'),
(87, 'read-reports-expense-summary', 'Read Reports Expense Summary', 'Read Reports Expense Summary', '2017-11-07 14:12:34', '2017-11-07 14:12:34'),
(88, 'read-reports-income-expense-summary', 'Read Reports Income Expense Summary', 'Read Reports Income Expense Summary', '2017-11-07 14:12:34', '2017-11-07 14:12:34'),
(89, 'read-customer-panel', 'Read Customer Panel', 'Read Customer Panel', '2017-11-07 14:12:43', '2017-11-07 14:12:43'),
(90, 'read-customers-invoices', 'Read Customers Invoices', 'Read Customers Invoices', '2017-11-07 14:12:44', '2017-11-07 14:12:44'),
(91, 'update-customers-invoices', 'Update Customers Invoices', 'Update Customers Invoices', '2017-11-07 14:12:44', '2017-11-07 14:12:44'),
(92, 'read-customers-payments', 'Read Customers Payments', 'Read Customers Payments', '2017-11-07 14:12:44', '2017-11-07 14:12:44'),
(93, 'update-customers-payments', 'Update Customers Payments', 'Update Customers Payments', '2017-11-07 14:12:44', '2017-11-07 14:12:44'),
(94, 'read-customers-transactions', 'Read Customers Transactions', 'Read Customers Transactions', '2017-11-07 14:12:45', '2017-11-07 14:12:45'),
(95, 'read-customers-profile', 'Read Customers Profile', 'Read Customers Profile', '2017-11-07 14:12:45', '2017-11-07 14:12:45'),
(96, 'update-customers-profile', 'Update Customers Profile', 'Update Customers Profile', '2017-11-07 14:12:45', '2017-11-07 14:12:45');

-- --------------------------------------------------------

--
-- Table structure for table `ak_revenues`
--

CREATE TABLE `ak_revenues` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` date NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ak_roles`
--

CREATE TABLE `ak_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ak_roles`
--

INSERT INTO `ak_roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Admin', '2017-11-07 14:12:11', '2017-11-07 14:12:11'),
(2, 'manager', 'Manager', 'Manager', '2017-11-07 14:12:34', '2017-11-07 14:12:34'),
(3, 'customer', 'Customer', 'Customer', '2017-11-07 14:12:43', '2017-11-07 14:12:43');

-- --------------------------------------------------------

--
-- Table structure for table `ak_role_permissions`
--

CREATE TABLE `ak_role_permissions` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ak_role_permissions`
--

INSERT INTO `ak_role_permissions` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(1, 71),
(1, 72),
(1, 73),
(1, 74),
(1, 75),
(1, 76),
(1, 77),
(1, 78),
(1, 79),
(1, 80),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(2, 1),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(2, 29),
(2, 30),
(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 35),
(2, 36),
(2, 37),
(2, 38),
(2, 39),
(2, 40),
(2, 41),
(2, 42),
(2, 43),
(2, 44),
(2, 45),
(2, 46),
(2, 47),
(2, 48),
(2, 49),
(2, 50),
(2, 51),
(2, 52),
(2, 53),
(2, 54),
(2, 55),
(2, 56),
(2, 57),
(2, 58),
(2, 59),
(2, 60),
(2, 61),
(2, 62),
(2, 63),
(2, 64),
(2, 65),
(2, 66),
(2, 67),
(2, 68),
(2, 69),
(2, 70),
(2, 71),
(2, 72),
(2, 73),
(2, 82),
(2, 83),
(2, 84),
(2, 85),
(2, 86),
(2, 87),
(2, 88),
(3, 89),
(3, 90),
(3, 91),
(3, 92),
(3, 93),
(3, 94),
(3, 95),
(3, 96);

-- --------------------------------------------------------

--
-- Table structure for table `ak_sessions`
--

CREATE TABLE `ak_sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ak_settings`
--

CREATE TABLE `ak_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ak_settings`
--

INSERT INTO `ak_settings` (`id`, `company_id`, `key`, `value`) VALUES
(1, 1, 'general.default_account', '1'),
(2, 1, 'general.date_format', 'd M Y'),
(3, 1, 'general.date_separator', 'space'),
(4, 1, 'general.timezone', 'Europe/London'),
(5, 1, 'general.invoice_prefix', 'INV-'),
(6, 1, 'general.invoice_digit', '5'),
(7, 1, 'general.invoice_start', '1'),
(8, 1, 'general.default_payment_method', 'offlinepayment.cash.1'),
(9, 1, 'general.email_protocol', 'mail'),
(10, 1, 'general.email_sendmail_path', '/usr/sbin/sendmail -bs'),
(11, 1, 'general.send_invoice_reminder', '0'),
(12, 1, 'general.schedule_invoice_days', '1,3,5,10'),
(13, 1, 'general.send_bill_reminder', '0'),
(14, 1, 'general.schedule_bill_days', '10,5,3,1'),
(15, 1, 'general.schedule_time', '09:00'),
(16, 1, 'general.admin_theme', 'skin-green-light'),
(17, 1, 'general.list_limit', '25'),
(18, 1, 'general.use_gravatar', '0'),
(19, 1, 'general.session_handler', 'file'),
(20, 1, 'general.session_lifetime', '30'),
(21, 1, 'general.file_size', '2'),
(22, 1, 'general.file_types', 'pdf,jpeg,jpg,png'),
(23, 1, 'general.company_name', 'Autheman Tech.'),
(24, 1, 'general.company_email', 'info@authemantechnology.com'),
(25, 1, 'general.company_address', 'New Street 1254'),
(26, 1, 'general.default_currency', 'USD'),
(27, 1, 'offlinepayment.methods', '[{\"code\":\"offlinepayment.cash.1\",\"name\":\"Cash\",\"order\":\"1\",\"description\":null},{\"code\":\"offlinepayment.bank_transfer.2\",\"name\":\"Bank Transfer\",\"order\":\"2\",\"description\":null}]');

-- --------------------------------------------------------

--
-- Table structure for table `ak_taxes`
--

CREATE TABLE `ak_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(15,4) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ak_taxes`
--

INSERT INTO `ak_taxes` (`id`, `company_id`, `name`, `rate`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Tax Exempt', 0.0000, 1, '2017-11-07 14:12:48', '2017-11-07 14:12:48', NULL),
(2, 1, 'Normal Tax', 5.0000, 1, '2017-11-07 14:12:48', '2017-11-07 14:12:48', NULL),
(3, 1, 'Sales Tax', 15.0000, 1, '2017-11-07 14:12:48', '2017-11-07 14:12:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ak_transfers`
--

CREATE TABLE `ak_transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `revenue_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ak_users`
--

CREATE TABLE `ak_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_logged_in_at` timestamp NULL DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en-GB'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ak_users`
--

INSERT INTO `ak_users` (`id`, `name`, `email`, `password`, `remember_token`, `picture`, `last_logged_in_at`, `enabled`, `created_at`, `updated_at`, `deleted_at`, `locale`) VALUES
(1, 'Admin', 'admin@akaunting.com', '$2y$10$GVRJGty2PMJUq0sSBUjaT.lnQKSBdyukjul6GS89LnsQyR2rS0whG', NULL, NULL, NULL, 1, '2017-11-07 14:12:49', '2017-11-07 14:12:49', NULL, 'en-GB');

-- --------------------------------------------------------

--
-- Table structure for table `ak_user_companies`
--

CREATE TABLE `ak_user_companies` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ak_user_companies`
--

INSERT INTO `ak_user_companies` (`user_id`, `company_id`, `user_type`) VALUES
(1, 1, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `ak_user_permissions`
--

CREATE TABLE `ak_user_permissions` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ak_user_roles`
--

CREATE TABLE `ak_user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ak_user_roles`
--

INSERT INTO `ak_user_roles` (`user_id`, `role_id`, `user_type`) VALUES
(1, 1, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `ak_vendors`
--

CREATE TABLE `ak_vendors` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ak_accounts`
--
ALTER TABLE `ak_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_company_id_index` (`company_id`);

--
-- Indexes for table `ak_bills`
--
ALTER TABLE `ak_bills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bills_company_id_bill_number_deleted_at_unique` (`company_id`,`bill_number`,`deleted_at`),
  ADD KEY `bills_company_id_index` (`company_id`);

--
-- Indexes for table `ak_bill_histories`
--
ALTER TABLE `ak_bill_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_histories_company_id_index` (`company_id`);

--
-- Indexes for table `ak_bill_items`
--
ALTER TABLE `ak_bill_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_items_company_id_index` (`company_id`);

--
-- Indexes for table `ak_bill_payments`
--
ALTER TABLE `ak_bill_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_payments_company_id_index` (`company_id`);

--
-- Indexes for table `ak_bill_statuses`
--
ALTER TABLE `ak_bill_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_statuses_company_id_index` (`company_id`);

--
-- Indexes for table `ak_bill_totals`
--
ALTER TABLE `ak_bill_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_totals_company_id_index` (`company_id`);

--
-- Indexes for table `ak_categories`
--
ALTER TABLE `ak_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_company_id_index` (`company_id`);

--
-- Indexes for table `ak_companies`
--
ALTER TABLE `ak_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ak_currencies`
--
ALTER TABLE `ak_currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currencies_company_id_code_deleted_at_unique` (`company_id`,`code`,`deleted_at`),
  ADD KEY `currencies_company_id_index` (`company_id`);

--
-- Indexes for table `ak_customers`
--
ALTER TABLE `ak_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_company_id_email_deleted_at_unique` (`company_id`,`email`,`deleted_at`),
  ADD KEY `customers_company_id_index` (`company_id`);

--
-- Indexes for table `ak_invoices`
--
ALTER TABLE `ak_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_company_id_invoice_number_deleted_at_unique` (`company_id`,`invoice_number`,`deleted_at`),
  ADD KEY `invoices_company_id_index` (`company_id`);

--
-- Indexes for table `ak_invoice_histories`
--
ALTER TABLE `ak_invoice_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_histories_company_id_index` (`company_id`);

--
-- Indexes for table `ak_invoice_items`
--
ALTER TABLE `ak_invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_company_id_index` (`company_id`);

--
-- Indexes for table `ak_invoice_payments`
--
ALTER TABLE `ak_invoice_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_payments_company_id_index` (`company_id`);

--
-- Indexes for table `ak_invoice_statuses`
--
ALTER TABLE `ak_invoice_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_statuses_company_id_index` (`company_id`);

--
-- Indexes for table `ak_invoice_totals`
--
ALTER TABLE `ak_invoice_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_totals_company_id_index` (`company_id`);

--
-- Indexes for table `ak_items`
--
ALTER TABLE `ak_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `items_company_id_sku_deleted_at_unique` (`company_id`,`sku`,`deleted_at`),
  ADD KEY `items_company_id_index` (`company_id`);

--
-- Indexes for table `ak_jobs`
--
ALTER TABLE `ak_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Indexes for table `ak_migrations`
--
ALTER TABLE `ak_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ak_modules`
--
ALTER TABLE `ak_modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `modules_company_id_alias_deleted_at_unique` (`company_id`,`alias`,`deleted_at`),
  ADD KEY `modules_company_id_index` (`company_id`);

--
-- Indexes for table `ak_module_histories`
--
ALTER TABLE `ak_module_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_histories_company_id_module_id_index` (`company_id`,`module_id`);

--
-- Indexes for table `ak_notifications`
--
ALTER TABLE `ak_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`);

--
-- Indexes for table `ak_password_resets`
--
ALTER TABLE `ak_password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `ak_payments`
--
ALTER TABLE `ak_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_company_id_index` (`company_id`);

--
-- Indexes for table `ak_permissions`
--
ALTER TABLE `ak_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `ak_revenues`
--
ALTER TABLE `ak_revenues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revenues_company_id_index` (`company_id`);

--
-- Indexes for table `ak_roles`
--
ALTER TABLE `ak_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `ak_role_permissions`
--
ALTER TABLE `ak_role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `role_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `ak_sessions`
--
ALTER TABLE `ak_sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `ak_settings`
--
ALTER TABLE `ak_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_company_id_key_unique` (`company_id`,`key`),
  ADD KEY `settings_company_id_index` (`company_id`);

--
-- Indexes for table `ak_taxes`
--
ALTER TABLE `ak_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taxes_company_id_index` (`company_id`);

--
-- Indexes for table `ak_transfers`
--
ALTER TABLE `ak_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfers_company_id_index` (`company_id`);

--
-- Indexes for table `ak_users`
--
ALTER TABLE `ak_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_deleted_at_unique` (`email`,`deleted_at`);

--
-- Indexes for table `ak_user_companies`
--
ALTER TABLE `ak_user_companies`
  ADD PRIMARY KEY (`user_id`,`company_id`,`user_type`);

--
-- Indexes for table `ak_user_permissions`
--
ALTER TABLE `ak_user_permissions`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `user_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `ak_user_roles`
--
ALTER TABLE `ak_user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `user_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `ak_vendors`
--
ALTER TABLE `ak_vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_company_id_email_deleted_at_unique` (`company_id`,`email`,`deleted_at`),
  ADD KEY `vendors_company_id_index` (`company_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ak_accounts`
--
ALTER TABLE `ak_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ak_bills`
--
ALTER TABLE `ak_bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ak_bill_histories`
--
ALTER TABLE `ak_bill_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ak_bill_items`
--
ALTER TABLE `ak_bill_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ak_bill_payments`
--
ALTER TABLE `ak_bill_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ak_bill_statuses`
--
ALTER TABLE `ak_bill_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ak_bill_totals`
--
ALTER TABLE `ak_bill_totals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ak_categories`
--
ALTER TABLE `ak_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ak_companies`
--
ALTER TABLE `ak_companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ak_currencies`
--
ALTER TABLE `ak_currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ak_customers`
--
ALTER TABLE `ak_customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ak_invoices`
--
ALTER TABLE `ak_invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ak_invoice_histories`
--
ALTER TABLE `ak_invoice_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ak_invoice_items`
--
ALTER TABLE `ak_invoice_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ak_invoice_payments`
--
ALTER TABLE `ak_invoice_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ak_invoice_statuses`
--
ALTER TABLE `ak_invoice_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ak_invoice_totals`
--
ALTER TABLE `ak_invoice_totals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ak_items`
--
ALTER TABLE `ak_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ak_jobs`
--
ALTER TABLE `ak_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ak_migrations`
--
ALTER TABLE `ak_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `ak_modules`
--
ALTER TABLE `ak_modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ak_module_histories`
--
ALTER TABLE `ak_module_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ak_payments`
--
ALTER TABLE `ak_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ak_permissions`
--
ALTER TABLE `ak_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT for table `ak_revenues`
--
ALTER TABLE `ak_revenues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ak_roles`
--
ALTER TABLE `ak_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ak_settings`
--
ALTER TABLE `ak_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `ak_taxes`
--
ALTER TABLE `ak_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ak_transfers`
--
ALTER TABLE `ak_transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ak_users`
--
ALTER TABLE `ak_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ak_vendors`
--
ALTER TABLE `ak_vendors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ak_role_permissions`
--
ALTER TABLE `ak_role_permissions`
  ADD CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `ak_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `ak_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ak_user_permissions`
--
ALTER TABLE `ak_user_permissions`
  ADD CONSTRAINT `user_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `ak_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ak_user_roles`
--
ALTER TABLE `ak_user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `ak_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
