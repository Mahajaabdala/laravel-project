-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2023 at 02:52 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `shipper` varchar(255) DEFAULT NULL,
  `consignee` varchar(255) DEFAULT NULL,
  `container_size` varchar(255) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `vessel` varchar(255) DEFAULT NULL,
  `deadline_date` date DEFAULT NULL,
  `payment_cutoff_date` date DEFAULT NULL,
  `empty_gate_out_date` date DEFAULT NULL,
  `empty_gate_in_date` date DEFAULT NULL,
  `stuffing_date` date DEFAULT NULL,
  `loading_date` date DEFAULT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:not,1:yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `shipper`, `consignee`, `container_size`, `destination`, `vessel`, `deadline_date`, `payment_cutoff_date`, `empty_gate_out_date`, `empty_gate_in_date`, `stuffing_date`, `loading_date`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'ShipperValue', 'ConsigneeValue', 'ContainerSizeValue', 'DestinationValue', 'VesselValue', '2023-12-31', '2023-12-30', '2023-12-29', '2023-12-28', '2023-12-27', '2023-12-26', 1, NULL, '2023-12-03 14:54:44');

-- --------------------------------------------------------

--
-- Table structure for table `combinedtable`
--

CREATE TABLE `combinedtable` (
  `container_id` int(11) NOT NULL,
  `container_no` varchar(20) NOT NULL,
  `container_size` varchar(10) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `eta` date DEFAULT NULL,
  `berth` varchar(20) DEFAULT NULL,
  `atb` date DEFAULT NULL,
  `start_discharge_date` date DEFAULT NULL,
  `start_storage` date DEFAULT NULL,
  `cwt` decimal(10,2) DEFAULT NULL,
  `final_pod` date DEFAULT NULL,
  `truck_details` varchar(255) DEFAULT NULL,
  `loading_date` date DEFAULT NULL,
  `gate_out` date DEFAULT NULL,
  `ata_border` date DEFAULT NULL,
  `atd_border` date DEFAULT NULL,
  `container_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:imported,1:exported,2:in_transit,3:in_storage,4:delivered',
  `user_type` tinyint(4) DEFAULT 4 COMMENT '1:admin,2:export,3:import,4:transit',
  `is_delete` tinyint(4) DEFAULT 0 COMMENT '0:not deleted,1:deleted ',
  `file_no` varchar(20) NOT NULL,
  `docs_received` date DEFAULT NULL,
  `consignee` varchar(255) NOT NULL,
  `commodity` varchar(255) NOT NULL,
  `bill_of_lading` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countdowns`
--

CREATE TABLE `countdowns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `arrival_date` date NOT NULL,
  `end_date` date NOT NULL,
  `current_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `free_days`
--

CREATE TABLE `free_days` (
  `id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `free_days` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `import`
--

CREATE TABLE `import` (
  `id` int(11) NOT NULL,
  `received_date` varchar(255) DEFAULT NULL,
  `file_no` varchar(255) DEFAULT NULL,
  `supplier` varchar(255) DEFAULT NULL,
  `importer` varchar(255) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `item_description` varchar(255) DEFAULT NULL,
  `mode_of_transport` varchar(255) DEFAULT NULL,
  `bill_of_lading` varchar(255) DEFAULT NULL,
  `container_number` varchar(255) DEFAULT NULL,
  `container_size` varchar(255) DEFAULT NULL,
  `place_of_delivery` varchar(255) DEFAULT NULL,
  `eta` varchar(255) DEFAULT NULL,
  `etb` varchar(255) DEFAULT NULL,
  `discharge_date` varchar(255) DEFAULT NULL,
  `arrived_icd` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:not,1:yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `import`
--

INSERT INTO `import` (`id`, `received_date`, `file_no`, `supplier`, `importer`, `invoice`, `item_description`, `mode_of_transport`, `bill_of_lading`, `container_number`, `container_size`, `place_of_delivery`, `eta`, `etb`, `discharge_date`, `arrived_icd`, `remarks`, `is_delete`, `created_at`, `updated_at`) VALUES
(2, '2023-12-14 00:00:00', 'ntrfr', 'tfr u', 'nhu', 'rgtg', 'rgr', 'sea', 'njgf57yr', 'bg', 'tbn', 'tt', '2023-12-21', '2023-12-21', '1970-01-01', 'drry', 'gttb', 1, '2023-12-03 02:30:03', '2023-12-14 17:55:44'),
(3, '2023-12-14 00:00:00', '34', 'geeks for geeks', 'geeks', 'Inv No 2023', 'Bulck Goods', 'Train', '343', 'XY2346', '200m', 'Dar es salaam', '2023-12-15', '2023-12-16', '2023-12-22', 'KGS', 'Under supervision', 1, '2023-12-14 17:56:49', '2023-12-15 07:51:26'),
(4, '2023-12-13', '34', 'Geek', 'geeks', 'no 1293', 'Bulck Goods', 'Ship', 'xyzy', 'XY2345', '34m', 'Mtwara Port', '2023-12-22', '2023-12-22', '2023-12-22', 'Kamuzu banda', 'It okay now', 1, '2023-12-15 07:52:09', '2023-12-16 05:28:23');

-- --------------------------------------------------------

--
-- Table structure for table `importdetails`
--

CREATE TABLE `importdetails` (
  `import_id` int(11) NOT NULL,
  `received_date` date DEFAULT NULL,
  `file_no` varchar(255) DEFAULT NULL,
  `supplier` varchar(255) DEFAULT NULL,
  `importer` varchar(255) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `item_description` varchar(255) DEFAULT NULL,
  `mode_of_transport` varchar(50) DEFAULT NULL,
  `bill_of_lading` varchar(255) DEFAULT NULL,
  `container_number` varchar(20) DEFAULT NULL,
  `container_size` varchar(10) DEFAULT NULL,
  `place_of_delivery` varchar(255) DEFAULT NULL,
  `eta` date DEFAULT NULL,
  `etb` date DEFAULT NULL,
  `discharge_date` date DEFAULT NULL,
  `arrived_icd` varchar(255) DEFAULT NULL,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `importdetails`
--

INSERT INTO `importdetails` (`import_id`, `received_date`, `file_no`, `supplier`, `importer`, `invoice`, `item_description`, `mode_of_transport`, `bill_of_lading`, `container_number`, `container_size`, `place_of_delivery`, `eta`, `etb`, `discharge_date`, `arrived_icd`, `remarks`) VALUES
(1, '2023-03-01', 'File123', 'Supplier1', 'Importer1', 'InvoiceABC', 'Electronics', 'Sea', 'BOL456', 'ABC789', '40ft', 'CityA', '2023-03-15', '2023-03-18', '2023-03-20', 'ICD123', 'Some remarks about the import.');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `future_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `future_date`) VALUES
(1, 'Item 1', '2023-12-01'),
(2, 'Item 2', '2023-12-15'),
(3, 'Item 3', '2023-12-30');

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
(7, '2023_11_26_202437_create_countdowns_table', 2),
(8, '2023_11_27_132537_create_tasks_table', 2),
(9, '2023_11_29_081800_create_event_table', 3),
(10, '2023_11_11_201656_create_shipments_table', 4);

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
-- Table structure for table `reminder`
--

CREATE TABLE `reminder` (
  `id` int(11) NOT NULL,
  `alert` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `is_read` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:unread,1:read',
  `is_delete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:not,1:yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reminder`
--

INSERT INTO `reminder` (`id`, `alert`, `date`, `is_read`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'Few days remains for container to be in storage', '2023-12-08', 0, 0, '2023-12-08 15:46:42', '2023-12-08 16:43:02'),
(6, 'geek', '2023-12-13', 0, 0, '2023-12-13 06:20:09', '2023-12-13 06:20:09'),
(7, 'geek', '2023-12-14', 0, 0, '2023-12-13 07:46:07', '2023-12-13 07:46:07');

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `due_date` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ship`
--

CREATE TABLE `ship` (
  `id` int(11) NOT NULL,
  `docs_received_date` date DEFAULT NULL,
  `bill_no` varchar(255) DEFAULT NULL,
  `commodity` varchar(255) DEFAULT NULL,
  `container_no` varchar(255) DEFAULT NULL,
  `no_of_containers` varchar(255) DEFAULT NULL,
  `Container_size` varchar(255) DEFAULT NULL,
  `stuffing` varchar(255) DEFAULT NULL,
  `shipping_line` varchar(255) DEFAULT NULL,
  `empty_gate_out` varchar(255) DEFAULT NULL,
  `empty_gate_in` varchar(255) DEFAULT NULL,
  `assessment` varchar(255) DEFAULT NULL,
  `deadline` varchar(255) DEFAULT NULL,
  `pay_cutoff` varchar(255) DEFAULT NULL,
  `vessel_name` varchar(255) DEFAULT NULL,
  `container_to_port` varchar(255) DEFAULT NULL,
  `scanner_report` varchar(255) DEFAULT NULL,
  `loaded_on_board` varchar(255) DEFAULT NULL,
  `current_status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:not;1:yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ship`
--

INSERT INTO `ship` (`id`, `docs_received_date`, `bill_no`, `commodity`, `container_no`, `no_of_containers`, `Container_size`, `stuffing`, `shipping_line`, `empty_gate_out`, `empty_gate_in`, `assessment`, `deadline`, `pay_cutoff`, `vessel_name`, `container_to_port`, `scanner_report`, `loaded_on_board`, `current_status`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, '2023-12-15', 'sddfe', NULL, NULL, '23', 'rrtrtrt', '2023-12-15', 'MSC', '2023-12-15', '2023-12-15', '1703030400', NULL, '', 'Ship', 'hyhy', 'done', '2023-12-22', 'at storage', 1, '2023-12-14 07:56:00', '2023-12-14 17:24:58'),
(2, '2023-12-15', '34', NULL, NULL, '3', '40ft', '2023-12-23', 'MSC', '2023-12-16', '2023-12-15', '2023-12-18', NULL, '2023-12-21', 'Plane', 'Dar es Salaam Port', 'Geek', '2023-12-28', 'at the border', 1, '2023-12-14 17:28:43', '2023-12-14 17:32:02'),
(3, '2023-12-15', '5373326 r4rjrfj', NULL, NULL, '54', '40ft', '2023-12-15', 'MSC', '2023-12-22', '2023-12-15', '1702598400', NULL, '2023-12-22', 'Ship', 'Dar es Salaam Port', 'done', '2023-12-22', 'at the border', 1, '2023-12-14 17:33:08', '2023-12-15 03:57:56'),
(4, '2023-12-16', '45', NULL, NULL, '5', '40m', '2023-12-22', 'msc', '2023-12-22', '2023-12-23', '2023-12-23', NULL, '2023-12-21', 'Ship', 'Dar es Salaam Port', 'ghtuu', '2023-12-22', 'at storage', 1, '2023-12-15 04:12:42', '2023-12-18 11:21:41'),
(5, '2023-12-28', 'ft', 'maize', '01', '30', '12ft', '2023-12-28', 'Maesk', '2023-12-28', '2023-12-29', '2023-12-29', '2023-12-28', '2023-12-29', 'Ships', 'azam', 'assigned', '2023-12-30', 'at the port', 0, '2023-12-27 08:50:15', '2023-12-27 08:50:15');

-- --------------------------------------------------------

--
-- Table structure for table `shiping`
--

CREATE TABLE `shiping` (
  `id` int(11) NOT NULL,
  `bl` varchar(255) DEFAULT NULL,
  `container_no` varchar(255) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `gate_out_date` varchar(255) DEFAULT NULL,
  `icd` varchar(255) DEFAULT NULL,
  `day_of_week` varchar(255) DEFAULT NULL,
  `transporter` varchar(255) DEFAULT NULL,
  `no_of_containers` int(11) DEFAULT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:not,1:yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shiping`
--

INSERT INTO `shiping` (`id`, `bl`, `container_no`, `client`, `destination`, `gate_out_date`, `icd`, `day_of_week`, `transporter`, `no_of_containers`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, '12', '56', 'geeks', 'mumbai', '2023-12-09', 'Azam', 'monday', 'Juma', 12, 1, '2023-12-07 02:08:48', '2023-12-18 11:25:57'),
(2, '232652789', 'MSKU9924248', 'SITA STEEL', 'TANZANIA', '2023-12-15', 'GALCO ICD', 'Friday', 'T4', 1, 1, '2023-12-15 05:15:30', '2023-12-15 05:24:22');

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `id` int(11) NOT NULL,
  `docs_received_date` date DEFAULT NULL,
  `bill_no` varchar(255) DEFAULT NULL,
  `no_of_containers` int(11) DEFAULT NULL,
  `Container_size` varchar(255) DEFAULT NULL,
  `stuffing` date DEFAULT NULL,
  `shipping_line` varchar(255) DEFAULT NULL,
  `empty_gate_out` varchar(255) DEFAULT NULL,
  `empty_gate_in` varchar(255) DEFAULT NULL,
  `assessment` date DEFAULT NULL,
  `pay_cufoff` date DEFAULT NULL,
  `cutoff` date DEFAULT NULL,
  `vessel_name` varchar(255) DEFAULT NULL,
  `container_to_port` varchar(255) DEFAULT NULL,
  `scanner_report` varchar(255) DEFAULT NULL,
  `loaded_on_board` date DEFAULT NULL,
  `current_status` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:not,1:yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipments`
--

INSERT INTO `shipments` (`id`, `docs_received_date`, `bill_no`, `no_of_containers`, `Container_size`, `stuffing`, `shipping_line`, `empty_gate_out`, `empty_gate_in`, `assessment`, `pay_cufoff`, `cutoff`, `vessel_name`, `container_to_port`, `scanner_report`, `loaded_on_board`, `current_status`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, '2023-12-16', '33453', 2434, '4454t', '2023-12-08', 'Maesk', '2023-12-14 00:00:th', '2023-12-13', '2023-12-08', '1970-01-01', '2023-12-21', '4rt5v34', 'frtgr', 'tttyy', '2023-12-13', 'ttyrytrt', 0, '2023-12-03 16:00:12', '2023-12-03 16:00:12'),
(2, '2023-12-22', 'sddfe', 123, 'rrtrtrt', '2023-12-15', 'MSC', '2023-12-13 00:00:th', '2023-12-20', '2023-12-13', '1970-01-01', '2023-12-13', 'Ship', 'errrtrrrr', 'hfvhfgrj', '2023-12-15', 'at the border', 0, '2023-12-04 05:21:37', '2023-12-04 05:21:37');

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `id` int(11) NOT NULL,
  `docs_received_date` varchar(255) DEFAULT NULL,
  `file_no` varchar(255) DEFAULT NULL,
  `consignee_name` varchar(255) DEFAULT NULL,
  `bill_no` varchar(255) DEFAULT NULL,
  `no_of_unit` varchar(255) DEFAULT NULL,
  `shipping_line` varchar(255) DEFAULT NULL,
  `do_status` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT 0 COMMENT '0:not,1:yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`id`, `docs_received_date`, `file_no`, `consignee_name`, `bill_no`, `no_of_unit`, `shipping_line`, `do_status`, `date`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, NULL, 'F456', 'ConsigneeA', 'B123', NULL, 'ShippingLineX', 'In Progress', '2023-12-03', 1, NULL, '2023-12-18 11:22:23'),
(2, NULL, 'F101', 'ConsigneeB', 'B789', NULL, 'ShippingLineY', 'Completed', '2023-12-04', 1, NULL, '2023-12-18 11:25:42'),
(3, NULL, '12', 'Johnym', 'sddfe', NULL, 'MAESK', 'hold', '2023-12-15', 1, '2023-12-07 10:44:28', '2023-12-18 11:25:45'),
(4, '2023-12-28', '54', 'geek', 'ft', '74', 'Maesk', 'grg', '2023-12-26', 0, '2023-12-27 09:44:00', '2023-12-27 09:44:00');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `arrival_date` date NOT NULL,
  `end_date` date NOT NULL,
  `free_days` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transit`
--

CREATE TABLE `transit` (
  `id` int(11) NOT NULL,
  `docs_received` varchar(255) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `consignee` varchar(255) DEFAULT NULL,
  `bill_of_lading` varchar(255) DEFAULT NULL,
  `commodity` varchar(255) DEFAULT NULL,
  `container_size` varchar(255) DEFAULT NULL,
  `container_no` varchar(255) DEFAULT NULL,
  `final_pod` varchar(255) DEFAULT NULL,
  `arrival` varchar(255) DEFAULT NULL,
  `start_discharge` varchar(255) DEFAULT NULL,
  `carry_in` varchar(255) DEFAULT NULL,
  `truck_details` varchar(255) DEFAULT NULL,
  `loading_date` varchar(255) DEFAULT NULL,
  `departure` varchar(255) DEFAULT NULL,
  `ata_border` varchar(255) DEFAULT NULL,
  `atd_border` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:not, 1:yes',
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transit`
--

INSERT INTO `transit` (`id`, `docs_received`, `customer`, `consignee`, `bill_of_lading`, `commodity`, `container_size`, `container_no`, `final_pod`, `arrival`, `start_discharge`, `carry_in`, `truck_details`, `loading_date`, `departure`, `ata_border`, `atd_border`, `created_at`, `is_delete`, `updated_at`) VALUES
(2, '2023-12-16', 'geek', 'week', '65759', 'Maize', '23', '40 fx', '2334', '2023-12-15', '2023-12-15', NULL, 'Geeks for Geeks', '2023-12-15', NULL, '2023-12-15', '2023-12-16', NULL, 1, '2023-12-27 06:40:24'),
(3, '2023-12-22', '35GHTUJ', 'HRHVRFRH', 'KLLTHTHLT0KM92', 'wick', 'T5Y55UI5OT', 'TGTOGTOGTMGFB', 'O6Y6Y OK', '2023-12-15', '2023-12-08', NULL, 'WTY698IT', '2023-12-22', NULL, '2023-12-20', '2023-12-13', NULL, 1, '2023-12-27 06:40:30'),
(4, '2023-10-15', 'AGANZE # 01', 'MAYURESH', 'ISB1342087', 'COIL', '20', 'TLLU2780387', 'BUJUMBURA', '2023-09-29', '2023-10-29', NULL, 'T119DWT/T165DWR', '2023-12-20', NULL, '2023-12-24', '2023-12-27', NULL, 1, '2023-12-27 06:40:35'),
(5, '2023-12-22', 'geek', 'geeek', '1374945tb', 'maize', '674m', '90', 'dsm', '2023-12-19', '2023-12-22', '', 'on motion', '2023-12-25', '2023-12-28', '2023-12-28', '2023-12-28', '2023-12-27 06:43:18', 1, '2023-12-27 06:51:42'),
(6, '2023-12-21', 'geek', 'geek', '1374945tb', 'maize', '4545m', '01', 'dsm', '2023-12-19', '2023-12-18', '2023-12-28', 'on motion', '2023-12-28', '2023-12-28', '2023-12-28', '2023-12-28', '2023-12-27 06:51:36', 0, '2023-12-27 06:51:36');

-- --------------------------------------------------------

--
-- Table structure for table `transport`
--

CREATE TABLE `transport` (
  `id` int(11) NOT NULL,
  `bl` varchar(255) DEFAULT NULL,
  `container_no` varchar(255) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `gate_out` varchar(255) DEFAULT NULL,
  `icd` varchar(255) DEFAULT NULL,
  `agent_name` varchar(255) DEFAULT NULL,
  `transporter` varchar(255) DEFAULT NULL,
  `no_of_containers` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `free_days` int(10) NOT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:not,1:yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transport`
--

INSERT INTO `transport` (`id`, `bl`, `container_no`, `client`, `destination`, `gate_out`, `icd`, `agent_name`, `transporter`, `no_of_containers`, `start_date`, `end_date`, `free_days`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, '12', '56', 'geeks', 'mumbai', '2023-12-11', 'Azam', 'geeks for geeks', 'Geeks', 34, '2023-12-12', '2023-12-12', 0, 1, '2023-12-07 02:28:22', '2023-12-10 13:50:31'),
(2, '12', '56', 'geeks', 'mumbai', '2023-12-13', 'mumbai', 'geeks for geeks', 'Geeks', 45, '2023-12-13', '2023-12-20', 7, 1, '2023-12-10 00:22:57', '2023-12-18 06:32:22'),
(3, '12', '44', 'geeks', 'mumbai', '2023-12-13', 'mgm', 'geeks for geeks', 'Geeks', 4, '2023-12-12', '2023-12-21', 9, 1, '2023-12-10 02:53:10', '2023-12-11 09:49:24'),
(4, 'ytotutgy', '56', 'geeks', 'mumbai', '2023-12-14', 'Azam', 'geeks for geeks', 'Geeks', 4, '2023-12-11', '2023-12-31', 20, 1, '2023-12-10 04:41:13', '2023-12-18 06:32:31'),
(5, 'eu4r4872', '75t59t09', 'Geek Company', 'Uganda', '2023-12-06', 'BBCCA', 'Jorg', 'Emma', 7, '2023-12-14', '2023-12-16', 2, 1, '2023-12-10 13:48:21', '2023-12-18 06:32:37'),
(6, '234Tb', '9858', 'geek', 'Dsm', '2023-12-28', 'Azam', 'Geek', 'Geek', 10, '2023-12-28', '2023-12-29', 1, 0, '2023-12-27 10:07:31', '2023-12-27 10:07:31');

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
  `user_type` tinyint(4) NOT NULL DEFAULT 3 COMMENT '1:admin, 2:export, 3:import, \r\n4: transit ',
  `is_delete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:not deleted, 1:deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `user_type`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$Itx8Jo6R8QUQWzXndmMyWerlBoM0NBigVwWvFpDoWU9aHsUlGaW/m', 'qGOa34p3tCFCXDqhX1p0E0WuA6SD9rw4EGdKBQvDyn1c23wB88UO7BaRDbSw', 1, 0, '2023-10-07 06:26:27', '2023-11-06 11:42:50'),
(3, 'export', 'export@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', 'mP0UgBYiZ1V6V3OrbiZe5V1RwUh3fvfO7VuCBsbQON0BOtRG3pLlpCkFL3bn', 2, 0, '2023-10-07 06:26:27', '2023-10-07 06:26:27'),
(4, 'imports', 'imports@gmail.com', NULL, '$2y$10$ZdSdEK8t864BiCkWL2zdMeLakSwsaxyNAbCLQIGrobbvtD5AhizOm', 'Ua9gDAjOyiVZr3LE5ex7wDpNFgC9ij2MdRYmz7XMxAdxMTpfG6YuU5a1flH4', 3, 0, '2023-10-07 06:26:27', '2023-10-07 06:26:27'),
(5, 'Transit', 'transit@gmail.com', NULL, '$2y$10$ZdSdEK8t864BiCkWL2zdMeLakSwsaxyNAbCLQIGrobbvtD5AhizOm', 'vTVArwYM6JZxijNLLCxejJ0eB87Mmee7erEDbesKVOzBqRkmN773p0IEsU6a', 4, 1, '2023-10-07 06:26:27', '2023-11-08 06:44:53'),
(6, 'jorg', 'admin@getsourcecodes.com', NULL, '$2y$10$bV.y2zeSCuL4FJffUXlPXO/NDr5kg0padP2E/Ejj5h5hAn5xLZglq', 'BiKiUCqoVAHy1onT1amycfdv3EozEiR4V36icbFfPFiFaNykgnLLAq0gsR2n', 1, 0, '2023-11-04 02:57:26', '2023-11-06 11:41:52'),
(9, 'John', 'admincu@gmail.com', NULL, '$2y$10$Ba1DbtFPk4I/3WXXA9y40ebtKSZZ7Jd/SvVHfioaQhzUaOfff2/im', NULL, 1, 1, '2023-11-04 03:09:41', '2023-11-06 01:59:31'),
(11, 'geek', 'gee123@gmail.com', NULL, '$2y$10$w/ZCz4/6FHaLkj434AMgmesnEd4i9gi7wH7QAixd9GebceVOU5mGC', NULL, 1, 1, '2023-11-04 03:34:02', '2023-11-04 05:21:31'),
(12, 'Emmanuel', 'emma@gmail.com', NULL, '$2y$10$pSSh6je1rZCOeAX2OsSpiOD1a6oZmNITEYJst4jl/YTtzMEK2CVyC', NULL, 1, 1, '2023-11-06 03:38:30', '2023-11-06 10:00:32'),
(13, 'Wick', 'admin@wick.com', NULL, '$2y$10$bai/0DwoYZSckqZCj8C3rexePQq6KCAQhHWctYrKreHL5VGYfEPw2', NULL, 1, 0, '2023-11-06 09:50:12', '2023-11-06 09:50:12'),
(14, 'Car', 'geeek@gmail.com', NULL, '$2y$10$sUQeDDyzqxGIbwCHEfu7hePAdeKUmYf9bCmTmEQADnnVmB03U1Mp.', NULL, 1, 0, '2023-11-07 05:39:42', '2023-11-07 05:39:42'),
(16, 'maesk', 'xyz@gmail.com', NULL, '$2y$10$uI/hATYu9.5i8ktFFrLU7OI99ueIVi8EVxMGaxawtIsdS91MetopG', NULL, 4, 1, '2023-11-07 19:04:48', '2023-11-08 11:17:01'),
(17, 'maesk', 'wick@gmail.com', NULL, '$2y$10$tSKvHDW5ykJpCEt48d.iZevVUgaClYjelVYq4BbzPCmvpiLPLqC5.', NULL, 4, 0, '2023-11-07 19:23:19', '2023-11-07 19:23:19'),
(18, 'Maesk', 'jorg@gmail.com', NULL, '$2y$10$e5DuxwUOf9OMzJq7Ixy8Be/A506cmWTs0caE2KocHIJabWFsu73WS', NULL, 4, 0, '2023-11-08 03:11:28', '2023-11-08 04:12:46'),
(19, 'MSC', 'alert@gmail.com', NULL, '$2y$10$Pk9qIu5TX/UP.vDjn6soM.s.v8lL86sVP1BXF97dF988tjWqIp0v6', NULL, 4, 0, '2023-11-08 06:50:18', '2023-11-09 12:16:51'),
(20, 'geek', '1222@gmail.com', NULL, '$2y$10$mp0VQYvJ1JtBhTy4i4cFZedC1cO73ih8iS8ZN0/7GQpdzOQi21Grm', NULL, 4, 1, '2023-11-10 01:58:59', '2023-11-10 12:23:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `combinedtable`
--
ALTER TABLE `combinedtable`
  ADD PRIMARY KEY (`container_id`);

--
-- Indexes for table `countdowns`
--
ALTER TABLE `countdowns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `free_days`
--
ALTER TABLE `free_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `import`
--
ALTER TABLE `import`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `importdetails`
--
ALTER TABLE `importdetails`
  ADD PRIMARY KEY (`import_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
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
-- Indexes for table `reminder`
--
ALTER TABLE `reminder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ship`
--
ALTER TABLE `ship`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shiping`
--
ALTER TABLE `shiping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transit`
--
ALTER TABLE `transit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transport`
--
ALTER TABLE `transport`
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
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `combinedtable`
--
ALTER TABLE `combinedtable`
  MODIFY `container_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countdowns`
--
ALTER TABLE `countdowns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `free_days`
--
ALTER TABLE `free_days`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `import`
--
ALTER TABLE `import`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `importdetails`
--
ALTER TABLE `importdetails`
  MODIFY `import_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reminder`
--
ALTER TABLE `reminder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ship`
--
ALTER TABLE `ship`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shiping`
--
ALTER TABLE `shiping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shipping`
--
ALTER TABLE `shipping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transit`
--
ALTER TABLE `transit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transport`
--
ALTER TABLE `transport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
