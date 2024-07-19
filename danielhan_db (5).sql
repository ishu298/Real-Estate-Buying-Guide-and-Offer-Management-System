-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: danielhan-db-instance.cjm8sia0yahs.us-west-1.rds.amazonaws.com:3306
-- Generation Time: Apr 01, 2024 at 09:28 AM
-- Server version: 8.0.35
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `danielhan_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `adorns`
--

CREATE TABLE `adorns` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `tshirt` varchar(255) DEFAULT NULL,
  `message` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `adorns`
--

INSERT INTO `adorns` (`id`, `name`, `email`, `phone`, `gender`, `country`, `tshirt`, `message`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'John Doe', 'johndoe@example.com', '1234567890', 'male', 'United States', 'XL', 'This is a sample message.', '2023-12-29 09:59:10', '2023-12-29 09:59:10', NULL),
(2, 'Vishal Singh', 'chauhan.vishal@outlook.com', '9910519195', 'male', 'IN', 'XL', 'The \'Username\' field is currently combined with the \'ID number.\' It is essential to have a separate and mandatory \'ID number\' for instructors. Other fields can be for on change profile page - the \'Username,\' but it should be editable, as it is the name displayed and seen by users in the community feed and other areas.', '2024-01-30 13:29:15', '2024-01-30 13:29:15', NULL),
(3, 'Hero', 'hero@mailinator.com', '8787878787', 'male', 'AF', 'XS', 'I want a tshirt', '2024-02-09 13:30:07', '2024-02-09 13:30:07', NULL),
(4, 'Apple', 'apple2@mailinator.com', '88787787878', 'male', 'AF', 'XS', 'Test Info', '2024-02-11 18:39:38', '2024-02-11 18:39:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `image`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(9, 'Signed & Dated Verso', '1706708470.png', 'signed-&-dated-verso', '2023-12-21 15:10:02', '2024-01-31 13:41:11', NULL),
(10, 'Fine art', '1706531921.jpg', 'fine-art', '2023-12-28 19:35:00', '2024-01-29 12:38:42', NULL),
(11, 'Popular culture', '1706531946.jpg', 'popular-culture', '2023-12-28 19:35:35', '2024-01-29 12:39:07', NULL),
(12, 'Decorative arts', '1706531958.jpg', 'decorative-arts', '2023-12-28 19:36:49', '2024-01-29 12:39:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_literature`
--

CREATE TABLE `category_literature` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `literature_id` varchar(255) DEFAULT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `category_literature`
--

INSERT INTO `category_literature` (`id`, `created_at`, `deleted_at`, `literature_id`, `category_id`, `updated_at`) VALUES
(19, NULL, NULL, '7', '20', NULL),
(21, NULL, NULL, '8', '20', NULL),
(22, NULL, NULL, '9', '18', NULL),
(23, NULL, NULL, '9', '19', NULL),
(24, NULL, NULL, '10', '32', NULL),
(25, NULL, NULL, '10', '33', NULL),
(26, NULL, NULL, '9', '34', NULL),
(27, NULL, NULL, '9', '35', NULL),
(28, NULL, NULL, '11', '36', NULL),
(29, NULL, NULL, '12', '38', NULL),
(30, NULL, NULL, '12', '39', NULL),
(31, NULL, NULL, '13', '40', NULL),
(32, NULL, NULL, '13', '41', NULL),
(33, NULL, NULL, '13', '42', NULL),
(34, NULL, NULL, '13', '43', NULL),
(35, NULL, NULL, '9', '43', NULL),
(36, NULL, NULL, '10', '43', NULL),
(37, NULL, NULL, '11', '43', NULL),
(38, NULL, NULL, '9', '44', NULL),
(39, NULL, NULL, '9', '45', NULL),
(40, NULL, NULL, '11', '46', NULL),
(41, NULL, NULL, '9', '47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_posts`
--

CREATE TABLE `category_posts` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `post_id` varchar(255) DEFAULT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `category_posts`
--

INSERT INTO `category_posts` (`id`, `created_at`, `deleted_at`, `post_id`, `category_id`, `updated_at`) VALUES
(6, '2023-12-18 07:59:37', NULL, '9', '2', '2023-12-18 07:59:37'),
(7, '2023-12-18 08:09:49', NULL, '10', '2', '2023-12-18 08:09:49'),
(8, '2023-12-18 08:19:06', NULL, '11', '2', '2023-12-18 08:19:06'),
(9, '2023-12-18 10:54:35', NULL, '12', '2', '2023-12-18 10:54:35'),
(10, '2023-12-20 06:43:37', NULL, '13', '2', '2023-12-20 06:43:37'),
(12, '2023-12-20 06:49:17', NULL, '14', '5', '2023-12-20 06:49:17'),
(13, '2023-12-20 07:16:57', NULL, '15', '8', '2023-12-20 07:16:57'),
(14, '2023-12-21 08:10:57', NULL, '16', '9', '2023-12-21 08:10:57'),
(15, '2023-12-28 09:53:23', NULL, '17', '9', '2023-12-28 09:53:23'),
(16, '2023-12-28 10:07:54', NULL, '18', '9', '2023-12-28 10:07:54'),
(18, '2023-12-28 12:43:16', NULL, '20', '10', '2023-12-28 12:43:16'),
(19, '2023-12-28 12:48:21', NULL, '21', '10', '2023-12-28 12:48:21'),
(20, '2023-12-28 12:50:51', NULL, '22', '10', '2023-12-28 12:50:51'),
(22, '2023-12-28 12:54:44', NULL, '24', '11', '2023-12-28 12:54:44'),
(23, '2023-12-28 13:00:10', NULL, '25', '12', '2023-12-28 13:00:10'),
(25, '2023-12-28 13:13:03', NULL, '27', '10', '2023-12-28 13:13:03'),
(26, '2023-12-28 13:52:32', NULL, '28', '12', '2023-12-28 13:52:32'),
(28, '2023-12-30 03:35:10', NULL, '30', '9', '2023-12-30 03:35:10'),
(29, '2023-12-30 05:11:02', NULL, '31', '10', '2023-12-30 05:11:02'),
(30, '2023-12-30 05:11:02', NULL, '31', '11', '2023-12-30 05:11:02'),
(31, '2023-12-30 05:21:41', NULL, '32', '9', '2023-12-30 05:21:41'),
(32, '2023-12-30 06:02:56', NULL, '34', '9', '2023-12-30 06:02:56'),
(34, '2024-02-12 06:37:34', NULL, '35', '10', '2024-02-12 06:37:34'),
(36, '2024-02-16 21:21:21', NULL, '29', '10', '2024-02-16 21:21:21'),
(37, '2024-02-16 21:31:30', NULL, '26', '10', '2024-02-16 21:31:30'),
(38, '2024-02-16 21:32:31', NULL, '24', '10', '2024-02-16 21:32:31'),
(39, '2024-02-16 21:33:02', NULL, '23', '10', '2024-02-16 21:33:02'),
(40, '2024-02-16 21:36:13', NULL, '19', '10', '2024-02-16 21:36:13'),
(41, '2024-02-18 04:07:20', NULL, '36', '10', '2024-02-18 04:07:20'),
(42, '2024-02-18 04:16:37', NULL, '37', '11', '2024-02-18 04:16:37'),
(43, '2024-02-20 05:14:49', NULL, '38', '10', '2024-02-20 05:14:49'),
(44, '2024-02-20 05:24:20', NULL, '39', '9', '2024-02-20 05:24:20'),
(45, '2024-02-20 13:47:27', NULL, '40', '10', '2024-02-20 13:47:27'),
(46, '2024-02-21 07:46:49', NULL, '41', '11', '2024-02-21 07:46:49'),
(47, '2024-02-22 13:55:56', NULL, '42', '11', '2024-02-22 13:55:56'),
(48, '2024-02-27 08:22:00', NULL, '43', '10', '2024-02-27 08:22:00'),
(49, '2024-02-28 23:13:27', NULL, '45', '10', '2024-02-28 23:13:27'),
(50, '2024-02-28 23:18:12', NULL, '46', '10', '2024-02-28 23:18:12');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `message` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `address`, `message`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'John', 'ashishtomar.liangtuang@gmail.com', '8006472513', 'Lorem', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Enim aut qui pariatur consectetur facilis minima cumque nulla perspiciatis placeat distinctio?', '2024-01-02 06:31:16', '2024-01-31 08:18:36', NULL),
(2, 'ashish tomar', 'as@mailinator.com', '08006472513', 'Meerut', 'as', '2024-02-12 06:45:24', '2024-02-29 11:42:11', '2024-02-29 11:42:11');

-- --------------------------------------------------------

--
-- Table structure for table `contact_replies`
--

CREATE TABLE `contact_replies` (
  `id` int NOT NULL,
  `reply_text` text,
  `contact_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contact_replies`
--

INSERT INTO `contact_replies` (`id`, `reply_text`, `contact_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(16, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus, vel reprehenderit! Dolorem maxime voluptatem inventore quas dolor, debitis temporibus quasi.', 1, '2024-02-01 06:09:00', '2024-02-01 06:09:00', NULL),
(17, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus, vel reprehenderit! Dolorem maxime voluptatem inventore quas dolor, debitis temporibus quasi.', 1, '2024-02-01 06:11:54', '2024-02-01 06:11:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_template`
--

CREATE TABLE `email_template` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subject` text COLLATE utf8mb4_general_ci,
  `alias_name` text COLLATE utf8mb4_general_ci NOT NULL,
  `template` text COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `email_template`
--

INSERT INTO `email_template` (`id`, `name`, `subject`, `alias_name`, `template`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Order Confirmation Template', 'Order Confirmation for Your Recent Purchase', 'SendPurchaseMail', '<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n<style type=\"text/css\">body, table, td, a { -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; }\r\n                        table, td { mso-table-lspace: 0pt; mso-table-rspace: 0pt; }\r\n                        img { -ms-interpolation-mode: bicubic; }\r\n                        img { border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none; }\r\n                        table { border-collapse: collapse !important; }\r\n                        body { height: 100% !important; margin: 0 !important; padding: 0 !important; width: 100% !important; }\r\n                        a[x-apple-data-detectors] { color: inherit !important; text-decoration: none !important; font-size: inherit !important; font-family: inherit !important; font-weight: inherit !important; line-height: inherit !important; }\r\n                        div[style*=\"margin: 16px 0;\"] { margin: 0 !important; }\r\n</style>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" bgcolor=\"#426899\">\r\n			<p>\r\n				</p><p><br></p><p></p><h2><span style=\"font-family: &quot;Times New Roman&quot;;\"><font color=\"#f7f7f7\" style=\"\">Real Estate Buying Guide and Offer Management System
</font></span></h2><h5><b><br></b></h5></td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"center\" bgcolor=\"#426899\" style=\"padding: 0px 10px 0px 10px;\">\r\n			<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"480\">\r\n				<tbody>\r\n					<tr>\r\n						<td align=\"left\" bgcolor=\"#ffffff\" style=\"padding: 30px 30px 20px 30px; border-radius: 4px 4px 0px 0px; color: #111111; font-family: Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; line-height: 48px;\" valign=\"top\">\r\n						<h1 style=\"font-size: 32px; font-weight: 400; margin: 0;\"><span style=\"color: inherit; font-family: inherit;\">Hii {{name}}!</span></h1>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"center\" bgcolor=\"#f4f4f4\" style=\"padding: 0px 10px 0px 10px;\">\r\n			<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"480\">\r\n				<tbody>\r\n					<tr>\r\n						<td align=\"left\" bgcolor=\"#ffffff\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td colspan=\"2\" style=\"padding-left: 30px; padding-right: 15px; padding-bottom: 10px; line-height: 25px;\">\r\n									<p style=\"font-family: Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400;\"><span style=\"font-size: 1rem;\">Thank you for choosing Danielhanart ! We are thrilled to confirm the details of your recent purchase. Below, you\'ll find a summary of your order:</span><br></p><table class=\"table table-bordered\" style=\"font-family: Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400;\"><tbody><tr><td><b>Order Number</b><br></td><td><span style=\"font-size: 18px;\">{{order}}</span><br></td></tr><tr><td><b>Billing Address</b><br></td><td><span style=\"font-size: 18px;\">{{address}}</span><br></td></tr><tr><td><b>Total Amount</b><b style=\"background-color: transparent; color: inherit;\">:</b><b><br></b></td><td><span style=\"font-size: 18px;\"><b>$&nbsp;</b>{{amount}}</span><br></td></tr></tbody></table>\r\n									</td>\r\n								</tr>\r\n								\r\n								\r\n								\r\n								\r\n								<tr>\r\n									<th align=\"left\" style=\"padding-left: 30px; padding-right: 15px; padding-bottom: 30px; font-family: Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;\" valign=\"top\"><p>Best regards,</p><p><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 2rem; text-align: -webkit-center;\">Real Estate Buying Guide and Offer Management System
</span></p></th>\r\n									<td align=\"left\" style=\"padding-left: 15px; padding-right: 30px; padding-bottom: 30px; font-family: Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;\" valign=\"top\"><br></td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td align=\"center\" bgcolor=\"#f4f4f4\" style=\"padding: 0px 10px 0px 10px;\">\r\n			<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"480\">\r\n				<tbody>\r\n					\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 0, '2023-08-09 12:57:07', '2024-02-01 05:29:38', NULL),
(2, 'Contact Reply Template', 'Real Estate Buying Guide and Offer Management System
', 'SendContactMail', '<meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\">\r\n    <title>Reset Password Email Template</title>\r\n    <meta name=\"description\" content=\"Reset Password Email Template.\">\r\n    <style type=\"text/css\">\r\n        a:hover {text-decoration: underline !important;}\r\n    </style>\r\n\r\n\r\n\r\n    <!--100% body table-->\r\n    <table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"#f2f3f8\" style=\"@import url(https://fonts.googleapis.com/css?family=Rubik:300,400,500,700|Open+Sans:300,400,600,700); font-family: \'Open Sans\', sans-serif;\">\r\n        <tbody><tr>\r\n            <td>\r\n                <table style=\"text-align: center; background-color: rgb(242, 243, 248); max-width: 670px; margin: 0px auto;\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tbody>\r\n                    <tr>\r\n                        <td style=\"text-align:center;\"><p></p></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style=\"height:20px;\"><h2><br></h2><h1>&nbsp;<span style=\"font-family: &quot;Times New Roman&quot;;\">Real Estate Buying Guide and Offer Management System
</span></h1><p><br></p></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td>\r\n                            <table width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width:670px;background:#fff; border-radius:3px; text-align:center;-webkit-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);-moz-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);box-shadow:0 6px 18px 0 rgba(0,0,0,.06);\">\r\n                                <tbody><tr>\r\n                                    <td style=\"height:40px;\"><br></td></tr><tr><td style=\"padding:0 35px;\"><p>Hii {{name}}</p><p>{{content}}</p></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"height:40px;\">&nbsp;</td>\r\n                                </tr>\r\n                            </tbody></table>\r\n                        </td>\r\n                    </tr><tr>\r\n                        <td style=\"height:20px;\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style=\"text-align:center;\">\r\n                            <p style=\"font-size:14px; color:rgba(69, 80, 86, 0.7411764705882353); line-height:18px; margin:0 0 0;\">© <strong>https://danielhanart.com/</strong></p>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style=\"height:80px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody></table>\r\n            </td>\r\n        </tr>\r\n    </tbody></table>\r\n    <!--/100% body table-->', 0, '2023-08-09 12:57:07', '2024-02-01 06:10:37', NULL),
(6, 'Enquire Reply Template', 'Real Estate Buying Guide and Offer Management System
', 'SendEnquireMail', '<meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\">\r\n    <title>Reset Password Email Template</title>\r\n    <meta name=\"description\" content=\"Reset Password Email Template.\">\r\n    <style type=\"text/css\">\r\n        a:hover {text-decoration: underline !important;}\r\n    </style>\r\n\r\n\r\n\r\n    <!--100% body table-->\r\n    <table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"#f2f3f8\" style=\"@import url(https://fonts.googleapis.com/css?family=Rubik:300,400,500,700|Open+Sans:300,400,600,700); font-family: \'Open Sans\', sans-serif;\">\r\n        <tbody><tr>\r\n            <td>\r\n                <table style=\"background-color: #f2f3f8; max-width:670px;  margin:0 auto;\" width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tbody>\r\n                    <tr>\r\n                        <td style=\"text-align:center;\"><h1><br></h1><p></p></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style=\"height:20px;\"><h1 style=\"text-align: center; \">&nbsp;<span style=\"font-family: &quot;Times New Roman&quot;;\">Real Estate Buying Guide and Offer Management System
</span></h1><p><br></p></td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td>\r\n                            <table width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width:670px;background:#fff; border-radius:3px; text-align:center;-webkit-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);-moz-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);box-shadow:0 6px 18px 0 rgba(0,0,0,.06);\">\r\n                                <tbody><tr>\r\n                                    <td style=\"height:40px;\"><br></td></tr><tr><td style=\"padding:0 35px;\"><p>Hii {{name}}</p><p>{{content}}</p></td>\r\n                                </tr>\r\n                                <tr>\r\n                                    <td style=\"height:40px;\">&nbsp;</td>\r\n                                </tr>\r\n                            </tbody></table>\r\n                        </td>\r\n                    </tr><tr>\r\n                        <td style=\"height:20px;\">&nbsp;</td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style=\"text-align:center;\">\r\n                            <p style=\"font-size:14px; color:rgba(69, 80, 86, 0.7411764705882353); line-height:18px; margin:0 0 0;\">© <strong>https://danielhanart.com/</strong></p>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td style=\"height:80px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody></table>\r\n            </td>\r\n        </tr>\r\n    </tbody></table>\r\n    <!--/100% body table-->', 0, '2023-08-09 12:57:07', '2024-02-01 06:11:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `enquires`
--

CREATE TABLE `enquires` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `product_id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `message` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `enquires`
--

INSERT INTO `enquires` (`id`, `name`, `product_id`, `email`, `phone`, `address`, `message`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 'Example', 35, 'ashishtomar.liangtuang@gmail.com', '1234567890', 'lorem Ipsum', 'Message', '2024-01-05 10:36:57', '2024-01-31 08:17:52', NULL),
(6, 'Raju', 35, 'raju@mailinator.com', '8978675645', 'Noida Sector 90', 'I want to purchase this.', '2024-02-09 13:05:40', '2024-02-09 13:05:40', NULL),
(7, 'ashish tomar', 35, 'ashish@mailinator.com', '8006472513', 'Meerut', 'as', '2024-02-12 06:44:19', '2024-02-12 06:44:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `enquire_replies`
--

CREATE TABLE `enquire_replies` (
  `id` int NOT NULL,
  `reply_text` text COLLATE utf8mb4_general_ci,
  `enquire_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enquire_replies`
--

INSERT INTO `enquire_replies` (`id`, `reply_text`, `enquire_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 'Nunc vestibulum purus vitae fringilla luctus. Proin sit amet tortor a quam feugiat iaculis. Aenean sit amet felis a risus dignissim tincidunt ac ut mi. Curabitur sed mi eu tellus vehicula laoreet. Suspendisse potenti. Integer vel malesuada arcu. Donec vel est nec enim posuere bibendum. Vivamus tincidunt sem eu justo luctus, sit amet mattis nisl pulvinar. Sed ac hendrerit odio.', 5, '2024-02-01 06:25:56', '2024-02-01 06:25:56', NULL),
(5, 'Hello I am reverting to Raju Enq', 6, '2024-02-09 13:11:02', '2024-02-09 13:11:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` text,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `venue` varchar(255) DEFAULT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `slug`, `date`, `time`, `venue`, `description`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 'GOING HOME', 'going-home', '2024-10-26', '18:00:00', 'NY, USA', '<p>                                            Real Estate Buying Guide and Offer Management System
\'s first solo exhibition titled \"Going Home,\" is a grand homage to his mother\'s life and influence over his work. It covers themes like contrarianism and hope, unveils the beauty of mystery, on a bed of fashion and textiles.</p><p>Exact event date and details will be updated here on this website and emailed to all subscribers.\r\n                                         </p>', 'a:1:{i:0;s:14:\"1708817668.jpg\";}', '2023-12-29 19:22:36', '2024-03-31 01:48:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int NOT NULL,
  `price` float DEFAULT NULL,
  `shipping_charge` int DEFAULT '0',
  `quantity` int DEFAULT '1',
  `total_amount` float DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `price`, `shipping_charge`, `quantity`, `total_amount`, `product_id`, `order_id`, `created_at`, `updated_at`) VALUES
(173, 20, 0, 1, 20, 29, 115, '2024-02-15 08:29:11', '2024-02-15 08:29:11'),
(184, 12, 12, 1, 24, 43, 122, '2024-02-27 13:23:00', '2024-02-27 13:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `literature`
--

CREATE TABLE `literature` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `featuredimage` text,
  `watermarkimage` text,
  `body` text,
  `status` int NOT NULL DEFAULT '0',
  `like` int DEFAULT '0',
  `dislike` int DEFAULT '0',
  `views` int DEFAULT '0',
  `user_id` int DEFAULT NULL,
  `literature_category_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `literature`
--

INSERT INTO `literature` (`id`, `title`, `slug`, `featuredimage`, `watermarkimage`, `body`, `status`, `like`, `dislike`, `views`, `user_id`, `literature_category_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(32, 'Girl with a Pearl Earring', 'Girl with a Pearl Earring', '1706188144.webp', NULL, '<span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif; font-size: 14px;\">Girl with a Pearl Earring is an oil painting by Dutch Golden Age painter Johannes Vermeer, dated c. 1665. Going by various names over the centuries, it became known by its present title towards the end of the 20th century after the earring worn by the girl portrayed there</span><br>', 1, 0, 0, 0, 3, NULL, '2023-12-28 19:08:39', '2024-01-25 20:09:06', NULL),
(33, 'The birth of Venus', 'the-tortoise-and-the-hare', '1706188127.jpg', NULL, '<span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif; font-size: 14px;\">The Birth of Venus is a painting by the Italian artist Sandro Botticelli, probably executed in the mid 1480s. It depicts the goddess Venus arriving at the shore after her birth, when she had emerged from the sea fully-grown</span><br>', 1, 0, 0, 0, 3, NULL, '2023-12-28 19:14:24', '2024-01-25 20:08:49', NULL),
(34, 'Out To Lunch', 'out-to-lunch', '1706188097.jpg', NULL, '<p><span style=\"color: rgb(48, 48, 48); font-family: &quot;open sans&quot;; font-size: 14px; background-color: rgb(248, 248, 248);\">This life-size bronze sculpture of a young man, sitting eating a sandwich &amp; reading a book, is titled ‘Out To Lunch’ and is located at the Harbour Town Marina on Hilton Head Island, South Carolina, USA.</span><br></p>', 1, 0, 0, 0, 3, NULL, '2023-12-28 19:16:47', '2024-01-25 20:08:19', NULL),
(35, 'Learning Curve', 'learning-curve', '1706188078.webp', NULL, '<a href=\"https://garyleeprice.com/product/learning-curve/\" target=\"_blank\" rel=\"nofollow noopener noreferrer\" style=\"margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: &quot;open sans&quot;; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(27, 25, 135); transition: color 0.3s ease 0s; background-color: rgb(248, 248, 248);\">Sculptor Gary Lee Price says on his website</a><span style=\"color: rgb(48, 48, 48); font-family: &quot;open sans&quot;; font-size: 14px; background-color: rgb(248, 248, 248);\">: “The curve is powerful, pleasing and fundamental because if you continue it, a circle is formed. Circles or mandalas have always been great symbols for unity, energy and creation. I also like the arch design of this piece as it reminds us of a bridge, and bridges bring us together!”</span>', 1, 0, 0, 0, 3, NULL, '2023-12-28 19:17:49', '2024-01-25 20:08:00', NULL),
(36, 'Pablo Picasso, Les Demoiselles d’Avignon, 1907', 'cinderella', '1709125253.jpg', '17091252541516452988-watermark.jpg', '<span style=\"color: rgb(26, 26, 26); font-family: Roboto, sans-serif;\">The ur-canvas of 20th-century art,&nbsp;</span><em style=\"color: rgb(26, 26, 26); font-family: Roboto, sans-serif;\">Les Demoiselles d’Avignon</em><span style=\"color: rgb(26, 26, 26); font-family: Roboto, sans-serif;\">&nbsp;ushered in the modern era by decisively breaking with the representational tradition of Western painting, incorporating allusions to the African masks that Picasso had seen in Paris\'s ethnographic museum at the Palais du Trocadro. Its compositional DNA also includes El Greco’s&nbsp;</span><em style=\"color: rgb(26, 26, 26); font-family: Roboto, sans-serif;\">The Vision of Saint John</em><span style=\"color: rgb(26, 26, 26); font-family: Roboto, sans-serif;\">&nbsp;(1608–14), now hanging in the Metropolitan Museum of Art. The women being depicted are actually prostitutes in a brothel in the artist\'s native Barcelona.</span><br>', 1, 0, 0, 0, 3, NULL, '2023-12-28 19:19:59', '2024-02-28 13:00:54', NULL),
(37, 'Beauty and the Beast', 'beauty-and-the-beast', '1709125243.jpg', '170912524442119808-watermark.jpg', '<span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif; font-size: 14px;\">Many fairy tales feature an absentee mother, as an example&nbsp;</span><span style=\"font-weight: bold; color: rgb(77, 81, 86); font-family: arial, sans-serif; font-size: 14px;\">Beauty and the Beast</span><span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif; font-size: 14px;\">, The Little Mermaid, Little Red Riding Hood and Donkeyskin, where the mother is&nbsp;...</span>', 1, 0, 0, 0, 3, NULL, '2023-12-28 19:21:24', '2024-02-28 13:00:45', NULL),
(38, 'Georges Seurat, A Sunday Afternoon on the Island of La Grande Jatte, 1884–1886', 'alice-in-wonderland', '1709125234.jpg', '170912523533626341-watermark.jpg', '<span style=\"color: rgb(26, 26, 26); font-family: Roboto, sans-serif;\">Georges Seurat’s masterpiece, evoking the Paris of La Belle Epoque, is actually depicting a working-class suburban scene well outside the city’s center. Seurat often made this milieu his subject, which differed from the bourgeois portrayals of his Impressionist contemporaries. Seurat abjured the capture-the-moment approach of Manet, Monet and Degas, going instead for the sense of timeless permanence found in Greek sculpture. And that is exactly what you get in this frieze-like processional of figures whose stillness is in keeping with Seurat’s aim of creating a classical landscape in modern form.</span><br>', 1, 0, 0, 0, 3, NULL, '2023-12-28 19:22:56', '2024-02-28 13:00:36', NULL),
(39, 'McNeill Whistler', 'harry-potter', '1709125224.webp', '17091252251433696064-watermark.jpg', '<span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif; font-size: 14px;\">The seven <b>Mcneil whistler&nbsp;</b></span><span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif; font-size: 14px;\">books are very well-written and laugh-out-loud funny, and it makes for an intoxicating combination.</span>', 1, 0, 0, 0, 3, NULL, '2023-12-28 19:24:31', '2024-02-28 13:00:26', NULL),
(40, 'Jane Eyre', 'jane-eyre', '1709125212.webp', '1709125213641658748-watermark.jpg', '<span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif; font-size: 14px;\">Jane Eyre is a novel by the English writer Charlotte Brontë. It was published under her pen name \"Currer Bell\" on 19 October 1847 by Smith, Elder &amp; Co. of London. The first American edition was published the following year by Harper &amp; Brothers of New York.</span>', 1, 0, 0, 0, 3, NULL, '2023-12-28 19:26:21', '2024-02-28 13:00:14', NULL),
(41, 'To Kill a Mockingbird', 'to-kill-a-mockingbird', '1709125201.webp', '17091252021465045520-watermark.jpg', '<span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif; font-size: 14px;\">To Kill a Mockingbird is a novel by the American author Harper Lee. It was published in 1960 and was instantly successful. In the United States, it is widely read in high schools and middle schools</span>', 1, 0, 0, 0, 3, NULL, '2023-12-28 19:27:30', '2024-02-28 13:00:03', NULL),
(42, 'The Great Gatsby', 'the-great-gatsby', '1709125187.jpg', '17091251881147651795-watermark.jpg', '<span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif; font-size: 14px;\">The Great Gatsby is a 1925 novel by American writer F. Scott Fitzgerald. Set in the Jazz Age on Long Island, near New York City, the novel depicts first-person narrator Nick Carraway\'s interactions with mysterious millionaire Jay Gatsby and Gatsby\'s obsession to reunite with his former lover, Daisy Buchanan</span>', 1, 0, 0, 0, 3, NULL, '2023-12-28 19:28:29', '2024-02-28 12:59:49', NULL),
(43, 'Anna  Frankenstein  Gone with the Wind Gone with the Wind', '-anna-karenina--frankenstein--gone-with-the-wind-gone-with-the-wind', '1709125111.jpg', '17091251121998966021-watermark.jpg', '<span style=\"font-weight: bold; color: rgb(77, 81, 86); font-family: arial, sans-serif; font-size: 14px;\">Gone with the Wind</span><span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif; font-size: 14px;\">, is the winner of the Pulitzer Prize and is regarded as one of the best historical fiction books. Margaret Mitchell, the author of the novel,&nbsp;...</span>', 1, 0, 0, 0, 3, NULL, '2023-12-28 19:29:44', '2024-02-28 12:58:33', NULL),
(44, 'Superstring Theory', 'the-great-gatsby-2', '1709125098.webp', '17091251001108323759-watermark.jpg', '<span style=\"background-color: rgb(244, 246, 249);\">The Great Gatsby&nbsp;</span><span style=\"background-color: rgb(244, 246, 249);\">The Great Gatsby&nbsp;</span><span style=\"background-color: rgb(244, 246, 249);\">The Great Gatsby</span>', 1, 0, 0, 0, 3, NULL, '2023-12-30 10:29:13', '2024-02-28 12:58:21', NULL),
(45, 'Test Art Jan', 'test-art-jan', '1709125069.jpg', '1709125072930448942-watermark.jpg', 'If we were in heaven,', 1, 0, 0, 0, 3, NULL, '2024-02-11 18:22:07', '2024-02-28 12:57:53', NULL),
(46, 'as', 'as', '1708425115.jpg', '1708425119894804648-watermark.jpg', 'as', 1, 0, 0, 0, 3, NULL, '2024-02-20 05:27:18', '2024-02-20 13:09:24', '2024-02-20 13:09:24'),
(47, 'zsas', 'zsas', '1708436761.jpg', '17084367651001974094-watermark.jpg', 'as', 1, 0, 0, 0, 3, NULL, '2024-02-20 13:46:05', '2024-02-20 13:46:42', '2024-02-20 13:46:42');

-- --------------------------------------------------------

--
-- Table structure for table `literature_categories`
--

CREATE TABLE `literature_categories` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `literature_categories`
--

INSERT INTO `literature_categories` (`id`, `title`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(9, 'Sculpture', 'sculpture', '2023-12-21 14:34:45', '2023-12-21 14:34:45', NULL),
(10, 'Fable', 'fable', '2023-12-28 19:02:01', '2023-12-28 19:02:01', NULL),
(11, 'Fairy Tale', 'fairy-tale', '2023-12-28 19:02:57', '2023-12-28 19:02:57', NULL),
(12, 'Fantasy', 'fantasy', '2023-12-28 19:03:10', '2023-12-28 19:03:10', NULL),
(13, 'Fiction', 'fiction', '2023-12-28 19:03:26', '2023-12-28 19:03:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newsletters`
--

INSERT INTO `newsletters` (`id`, `email`, `created_at`, `updated_at`) VALUES
(13, 'info@danielhanart.com', '2024-02-28 19:38:57', '2024-02-28 19:38:57'),
(14, 'newsletter@mailinator.com', '2024-03-30 05:48:06', '2024-03-30 05:48:06'),
(15, 'lalit@mailinator.com', '2024-03-30 05:48:59', '2024-03-30 05:48:59'),
(16, 'test@mailinator.com', '2024-03-30 06:03:16', '2024-03-30 06:03:16');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `unique_id` varchar(255) DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `remark` text,
  `invoice_link` varchar(255) DEFAULT NULL,
  `payment_intent_id` varchar(255) DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `full_data` text,
  `payment_status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `unique_id`, `total_amount`, `first_name`, `last_name`, `email`, `phone`, `address`, `city`, `pincode`, `landmark`, `country`, `remark`, `invoice_link`, `payment_intent_id`, `customer_id`, `currency`, `full_data`, `payment_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(115, '576d9a2', 20, 'ashish', 'tomar', 'ashish@mailinator.com', '+918006472513', 'noida', 'noida', NULL, NULL, 'IN', 'as', '1707985761_115_invoice.pdf', 'pi_3Ok0JoC5aOaKikP403AE6RnK', 'cus_PQrdPSj6axM09w', 'usd', '{\"id\":\"cs_test_a1txFMbIpa8JoSv9RQpUEScJcYkjA9Wr0notVPSuTYNWgfQ2ItMDGyOJof\",\"object\":\"checkout.session\",\"after_expiration\":null,\"allow_promotion_codes\":null,\"amount_subtotal\":2000,\"amount_total\":2000,\"automatic_tax\":{\"enabled\":false,\"liability\":null,\"status\":null},\"billing_address_collection\":null,\"cancel_url\":\"https:\\/\\/danielhanart.com\\/cart\",\"client_reference_id\":null,\"client_secret\":null,\"consent\":null,\"consent_collection\":null,\"created\":1707985753,\"currency\":\"usd\",\"currency_conversion\":null,\"custom_fields\":[],\"custom_text\":{\"after_submit\":null,\"shipping_address\":null,\"submit\":null,\"terms_of_service_acceptance\":null},\"customer\":\"cus_PQrdPSj6axM09w\",\"customer_creation\":null,\"customer_details\":{\"address\":{\"city\":null,\"country\":\"IN\",\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":\"ashish@mailinator.com\",\"name\":\"jefferson\",\"phone\":null,\"tax_exempt\":\"none\",\"tax_ids\":[]},\"customer_email\":null,\"expires_at\":1708072152,\"invoice\":null,\"invoice_creation\":{\"enabled\":false,\"invoice_data\":{\"account_tax_ids\":null,\"custom_fields\":null,\"description\":null,\"footer\":null,\"issuer\":null,\"metadata\":[],\"rendering_options\":null}},\"livemode\":false,\"locale\":null,\"metadata\":{\"order_id\":\"115\"},\"mode\":\"payment\",\"payment_intent\":\"pi_3Ok0JoC5aOaKikP403AE6RnK\",\"payment_link\":null,\"payment_method_collection\":\"if_required\",\"payment_method_configuration_details\":null,\"payment_method_options\":[],\"payment_method_types\":[\"card\"],\"payment_status\":\"paid\",\"phone_number_collection\":{\"enabled\":false},\"recovered_from\":null,\"setup_intent\":null,\"shipping_address_collection\":null,\"shipping_cost\":null,\"shipping_details\":null,\"shipping_options\":[],\"status\":\"complete\",\"submit_type\":null,\"subscription\":null,\"success_url\":\"https:\\/\\/danielhanart.com\\/success-payment?id=MTE1\",\"total_details\":{\"amount_discount\":0,\"amount_shipping\":0,\"amount_tax\":0},\"ui_mode\":\"hosted\",\"url\":null}', 'paid', '2024-02-15 08:29:11', '2024-02-15 08:29:22', NULL),
(122, '3472980', 24, 'ashish tomar', 'tomar', 'ashiish@mailinator.com', '08006472513', 'Meerut', 'Meerut', NULL, NULL, 'IN', 'asa', '1709040197_122_invoice.pdf', 'pi_3OoQcpC5aOaKikP41DxIJm5J', 'cus_Pdi2HKNC248JKL', 'usd', '{\"id\":\"cs_test_a1ZsC3BjJ5rkbPDeYRYurcNQhSjEpb1taHOV1jKrG8XTB5KDfvlnHMbCo4\",\"object\":\"checkout.session\",\"after_expiration\":null,\"allow_promotion_codes\":null,\"amount_subtotal\":2400,\"amount_total\":2400,\"automatic_tax\":{\"enabled\":false,\"liability\":null,\"status\":null},\"billing_address_collection\":null,\"cancel_url\":\"https:\\/\\/danielhanart.com\\/cart\",\"client_reference_id\":null,\"client_secret\":null,\"consent\":null,\"consent_collection\":null,\"created\":1709040182,\"currency\":\"usd\",\"currency_conversion\":null,\"custom_fields\":[],\"custom_text\":{\"after_submit\":null,\"shipping_address\":null,\"submit\":null,\"terms_of_service_acceptance\":null},\"customer\":\"cus_Pdi2HKNC248JKL\",\"customer_creation\":null,\"customer_details\":{\"address\":{\"city\":null,\"country\":\"IN\",\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":\"ashiish@mailinator.com\",\"name\":\"jefferson\",\"phone\":null,\"tax_exempt\":\"none\",\"tax_ids\":[]},\"customer_email\":null,\"expires_at\":1709126582,\"invoice\":null,\"invoice_creation\":{\"enabled\":false,\"invoice_data\":{\"account_tax_ids\":null,\"custom_fields\":null,\"description\":null,\"footer\":null,\"issuer\":null,\"metadata\":[],\"rendering_options\":null}},\"livemode\":false,\"locale\":null,\"metadata\":{\"order_id\":\"122\"},\"mode\":\"payment\",\"payment_intent\":\"pi_3OoQcpC5aOaKikP41DxIJm5J\",\"payment_link\":null,\"payment_method_collection\":\"if_required\",\"payment_method_configuration_details\":null,\"payment_method_options\":[],\"payment_method_types\":[\"card\"],\"payment_status\":\"paid\",\"phone_number_collection\":{\"enabled\":false},\"recovered_from\":null,\"setup_intent\":null,\"shipping_address_collection\":null,\"shipping_cost\":null,\"shipping_details\":null,\"shipping_options\":[],\"status\":\"complete\",\"submit_type\":null,\"subscription\":null,\"success_url\":\"https:\\/\\/danielhanart.com\\/success-payment?id=MTIy\",\"total_details\":{\"amount_discount\":0,\"amount_shipping\":0,\"amount_tax\":0},\"ui_mode\":\"hosted\",\"url\":null}', 'paid', '2024-02-27 13:23:00', '2024-02-27 13:23:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `selling_price` int DEFAULT NULL,
  `offer_price` int DEFAULT NULL,
  `shipping_charge` int NOT NULL DEFAULT '0',
  `slug` varchar(255) NOT NULL,
  `featuredimage` text,
  `other_images` text,
  `watermarkimage` text,
  `body` text,
  `status` int NOT NULL DEFAULT '0',
  `like` int DEFAULT '0',
  `order_number` int DEFAULT '0',
  `dislike` int DEFAULT '0',
  `views` int DEFAULT '0',
  `user_id` int DEFAULT NULL,
  `dimensions` text,
  `literature_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `selling_price`, `offer_price`, `shipping_charge`, `slug`, `featuredimage`, `other_images`, `watermarkimage`, `body`, `status`, `like`, `order_number`, `dislike`, `views`, `user_id`, `dimensions`, `literature_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(18, 'Superstring Theory', 25000, 25000, 0, 'superstring-theory', 'a:2:{i:0;s:15:\"1709112893.webp\";i:1;s:15:\"1709112894.webp\";}', 'a:2:{i:0;s:15:\"1709028976.webp\";i:1;s:15:\"1709028976.webp\";}', 'a:0:{}', '1 of 12 EVER MADE<br>', 1, 0, 11, 0, 36, 3, '<p>30in x 39in</p>', 32, '2023-12-28 17:07:54', '2024-03-29 21:04:16', NULL),
(19, 'Hat Heat Heart', 16000, 16000, 1, 'hat-heat-heart', 'a:2:{i:0;s:15:\"1709123150.webp\";i:1;s:15:\"1709123151.webp\";}', 'a:0:{}', 'a:0:{}', '1 of 8 Original Sets ONLY', 1, 0, 13, 0, 53, 3, '<p>Set is comprised of two separate frames.</p><p>30in x 40in</p>', 32, '2023-12-28 17:08:19', '2024-03-28 13:35:56', NULL),
(20, 'Vincent van Gogh, The Starry Night, 1889', 22, 12, 0, 'vincent-van-gogh-the-starry-night-1889', 'a:1:{i:0;s:14:\"1706188671.jpg\";}', NULL, NULL, '<h3 class=\"_h3_cuogz_1\" data-testid=\"tile-title_testID\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(26, 26, 26); line-height: 5.2rem !important;\"><span style=\"font-family: Roboto, sans-serif; font-size: 16px;\">Vincent Van Gogh’s most popular painting,&nbsp;</span><em style=\"font-family: Roboto, sans-serif; font-size: 16px;\">The Starry Night</em><span style=\"font-family: Roboto, sans-serif; font-size: 16px;\">&nbsp;was created by Van Gogh at the asylum in Saint-Rémy, where he’d committed himself in 1889. Indeed,&nbsp;</span><em style=\"font-family: Roboto, sans-serif; font-size: 16px;\">The Starry Night</em><span style=\"font-family: Roboto, sans-serif; font-size: 16px;\">&nbsp;seems to reflect his turbulent state of mind at the time, as the night sky comes alive with swirls and orbs of frenetically applied brush marks springing from the yin and yang of his personal demons and awe of nature.</span><br></h3>', 1, 0, 0, 0, 5, 3, NULL, 32, '2023-12-28 19:43:16', '2024-02-29 10:37:46', '2024-02-16 21:07:08'),
(21, 'Sandro Botticelli, The Birth of Venus, 1484–1486', 33, 22, 0, 'sandro-botticelli-the-birth-of-venus-1484-1486', 'a:1:{i:0;s:14:\"1706188656.jpg\";}', NULL, NULL, '<span style=\"color: rgb(26, 26, 26); font-family: Roboto, sans-serif;\">Botticelli’s&nbsp;</span><em style=\"color: rgb(26, 26, 26); font-family: Roboto, sans-serif;\">The Birth of Venus</em><span style=\"color: rgb(26, 26, 26); font-family: Roboto, sans-serif;\">&nbsp;was the first full-length, non-religious nude since antiquity, and was made for Lorenzo de Medici. It’s claimed that the figure of the Goddess of Love is modeled after one Simonetta Cattaneo Vespucci, whose favors were allegedly shared by Lorenzo and his younger brother, Giuliano. Venus is seen being blown ashore on a giant clamshell by the wind gods Zephyrus and Aura as the personification of spring awaits on land with a cloak. Unsurprisingly,&nbsp;</span><em style=\"color: rgb(26, 26, 26); font-family: Roboto, sans-serif;\">Venus</em><span style=\"color: rgb(26, 26, 26); font-family: Roboto, sans-serif;\">&nbsp;attracted the ire of Savonarola, the Dominican monk who led a fundamentalist crackdown on the secular tastes of the Florentines. His campaign included the infamous “Bonfire of the Vanities” of 1497, in which “profane” objects—cosmetics, artworks, books—were burned on a pyre.&nbsp;</span><em style=\"color: rgb(26, 26, 26); font-family: Roboto, sans-serif;\">The Birth of Venus</em><span style=\"color: rgb(26, 26, 26); font-family: Roboto, sans-serif;\">&nbsp;was itself scheduled for incineration, but somehow escaped destruction. Botticelli, though, was so freaked out by the incident that he gave up painting for a while.</span>', 1, 0, 0, 0, 1, 3, NULL, 32, '2023-12-28 19:48:21', '2024-02-29 10:37:46', '2024-02-16 21:07:04'),
(22, 'The Silent Poem', 9000, 9000, 1, 'the-silent-poem', 'a:1:{i:1;s:15:\"1709112836.webp\";}', 'a:1:{i:0;s:15:\"1709028940.webp\";}', 'a:0:{}', '<span style=\"color: rgb(26, 26, 26); font-family: Roboto, sans-serif;\">1 of 50 ORIGINALS ONLY</span><br>', 1, 0, 2, 0, 26, 3, '', 41, '2023-12-28 19:50:51', '2024-03-31 01:33:49', NULL),
(23, 'High Horse Heaven', 10000, 10000, 0, 'high-horse-heaven', 'a:1:{i:1;s:15:\"1709112810.webp\";}', 'a:1:{i:0;s:15:\"1709103696.webp\";}', 'a:0:{}', '<span style=\"color: rgb(26, 26, 26); font-family: Roboto, sans-serif;\">1 of 40 ORIGINALS ONLY</span>', 1, 0, 6, 0, 33, 3, '', 34, '2023-12-28 19:53:32', '2024-03-29 20:58:27', NULL),
(24, 'Looking for Good in Bad Places', 5000, 5000, 1, 'looking-for-good-in-bad-places', 'a:1:{i:1;s:15:\"1709112766.webp\";}', 'a:0:{}', 'a:0:{}', '<span id=\"docs-internal-guid-fb7a0591-7fff-5663-8fc8-aa7e3efcf02d\" style=\"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); text-size-adjust: auto;\"><p dir=\"ltr\" style=\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; padding: 0pt 0pt 12pt;\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; color: rgb(67, 67, 67); background-color: transparent; font-variant-numeric: normal; font-variant-alternates: normal; font-variant-east-asian: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\"><br class=\"Apple-interchange-newline\">* The \"Looking For\" series is an ongoing photographic endeavor launched by Real Estate Buying Guide and Offer Management System
, in an effort to challenge us to look for things less obvious and in doing so, discover treasure. \"Looking For Good in Bad Places\" is a gentle study in </span><span style=\"font-size: 12pt; font-family: Arial, sans-serif; color: rgb(67, 67, 67); background-color: transparent; font-style: italic; font-variant-numeric: normal; font-variant-alternates: normal; font-variant-east-asian: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">contrast</span><span style=\"font-size: 12pt; font-family: Arial, sans-serif; color: rgb(67, 67, 67); background-color: transparent; font-variant-numeric: normal; font-variant-alternates: normal; font-variant-east-asian: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\"> and </span><span style=\"font-size: 12pt; font-family: Arial, sans-serif; color: rgb(67, 67, 67); background-color: transparent; font-style: italic; font-variant-numeric: normal; font-variant-alternates: normal; font-variant-east-asian: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">coexistence</span><span style=\"font-size: 12pt; font-family: Arial, sans-serif; color: rgb(67, 67, 67); background-color: transparent; font-variant-numeric: normal; font-variant-alternates: normal; font-variant-east-asian: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">, themes that undergird the fascinating nature of my hometown, Los Angeles.</span></p><p dir=\"ltr\" style=\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt; padding: 0pt 0pt 12pt;\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; color: rgb(67, 67, 67); background-color: transparent; font-variant-numeric: normal; font-variant-alternates: normal; font-variant-east-asian: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">** All pieces from the \"Looking For\" series will be limited to a collection of 100 originals. There will never be another one made. The first original will always remain with me in my private collection, never to be sold. Once the 99 available pieces are sold, you will only be able to acquire a piece from one of the 99 collectors that moved before you.&nbsp;</span></p><p dir=\"ltr\" style=\"line-height: 1.38; margin-top: 0pt; margin-bottom: 12pt;\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; color: rgb(67, 67, 67); background-color: transparent; font-variant-numeric: normal; font-variant-alternates: normal; font-variant-east-asian: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">*** Every art piece that is purchased will be delivered with a custom title placard, an edged wooden cleat for hanging, and a certificate of authenticity displaying the specific piece number that you own</span></p></span>', 1, 0, 4, 0, 20, 3, '', 32, '2023-12-28 19:54:44', '2024-03-29 01:29:32', NULL),
(25, 'Farewell To Anger Them', 22, 11, 0, 'farewell-to-anger-them', 'a:1:{i:0;s:14:\"1706188558.jpg\";}', NULL, NULL, '<span style=\"color: rgb(26, 26, 26); font-family: Roboto, sans-serif;\">Manet’s scene of picnicking Parisians caused a scandal when it debuted at the Salon des Refusés, the alternative exhibition made up of works rejected by the jurors of the annual Salon—the official art exhibition of the Académie des Beaux-Arts that set artistic standards in France. The most vociferous objections to Manet’s work centered on the depiction of a nude woman in the company of men dressed in contemporary clothes. Based on motifs borrowed from such Renaissance greats as Raphael and Giorgione,&nbsp;</span><em style=\"color: rgb(26, 26, 26); font-family: Roboto, sans-serif;\">Le Déjeuner</em><span style=\"color: rgb(26, 26, 26); font-family: Roboto, sans-serif;\">&nbsp;was a cheeky send up of classical figuration—an insolent mash-up of modern life and painting tradition.</span>', 1, 0, 0, 0, 7, 3, NULL, 33, '2023-12-28 20:00:10', '2024-02-29 10:37:46', '2024-02-16 21:07:20'),
(26, 'Gone With The Wind', 10000, 10000, 0, 'gone-with-the-wind', 'a:1:{i:1;s:15:\"1709112746.webp\";}', 'a:1:{i:0;s:15:\"1709028871.webp\";}', 'a:0:{}', '<span style=\"color: rgb(26, 26, 26); font-family: Roboto, sans-serif;\">1 of 40 ORIGINALS ONLY</span><br>', 1, 0, 7, 0, 50, 3, '', 32, '2023-12-28 20:03:49', '2024-03-31 23:16:04', NULL),
(27, 'Venus, of Willendorf,', 22, 11, 0, 'venus-of-willendorf', 'a:3:{i:0;s:14:\"1706188505.jpg\";i:1;s:14:\"1706188506.jpg\";i:2;s:14:\"1706188507.jpg\";}', NULL, NULL, '<span style=\"color: rgb(26, 26, 26); font-family: Roboto, sans-serif;\">The ur sculpture of art history, this tiny figurine measuring just over four inches in height was discovered in Austria in 1908. Nobody knows what function it served, but guesswork has ranged from fertility goddess to masturbation aid. Some scholars suggest it may have been a self-portrait made by a woman. It’s the most famous of many such objects dating from the Old Stone Age.</span>', 1, 0, 0, 0, 13, 3, NULL, 32, '2023-12-28 20:13:03', '2024-02-29 10:37:46', '2024-02-16 21:07:12'),
(28, 'Wanderer above the Sea of Fog', 22, 11, 0, 'wanderer-above-the-sea-of-fog', 'a:1:{i:0;s:15:\"1706188477.webp\";}', NULL, NULL, '<span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif; font-size: 14px;\">Wanderer above the Sea of Fog is a painting by German Romanticist artist Caspar David Friedrich made in 1818.</span>', 1, 0, 0, 0, 20, 3, NULL, 32, '2023-12-28 20:52:32', '2024-02-29 10:37:46', '2024-02-16 21:07:15'),
(29, 'Looking for High in Low Places', 5000, 5000, 1, 'looking-for-high-in-low-places', 'a:1:{i:1;s:15:\"1709112720.webp\";}', 'a:0:{}', 'a:1:{i:0;s:34:\"17084575991960124662-watermark.jpg\";}', '<p dir=\"ltr\" style=\"line-height: 1.656; background-color: rgb(255, 255, 255); margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; color: rgb(67, 67, 67); background-color: transparent; font-weight: 400; font-style: normal; font-variant-ligatures: normal; font-variant-numeric: normal; font-variant-caps: normal; font-variant-alternates: normal; font-variant-east-asian: normal; font-variant-position: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">* The \"Looking For\" series is an ongoing photographic endeavor launched by Real Estate Buying Guide and Offer Management System
, in an effort to challenge us to look for things less obvious and in doing so, discover treasure. </span><span style=\"font-size: 12pt; font-family: Arial, sans-serif; color: rgb(67, 67, 67); background-color: transparent; font-weight: 700; font-style: normal; font-variant-ligatures: normal; font-variant-numeric: normal; font-variant-caps: normal; font-variant-alternates: normal; font-variant-east-asian: normal; font-variant-position: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">\"Looking For High in Low Places\"</span><span style=\"font-size: 12pt; font-family: Arial, sans-serif; color: rgb(67, 67, 67); background-color: transparent; font-weight: 400; font-style: normal; font-variant-ligatures: normal; font-variant-numeric: normal; font-variant-caps: normal; font-variant-alternates: normal; font-variant-east-asian: normal; font-variant-position: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"> is about seeing the </span><span style=\"font-size: 12pt; font-family: Arial, sans-serif; color: rgb(67, 67, 67); background-color: transparent; font-weight: 400; font-style: italic; font-variant-ligatures: normal; font-variant-numeric: normal; font-variant-caps: normal; font-variant-alternates: normal; font-variant-east-asian: normal; font-variant-position: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">marvelous</span><span style=\"font-size: 12pt; font-family: Arial, sans-serif; color: rgb(67, 67, 67); background-color: transparent; font-weight: 400; font-style: normal; font-variant-ligatures: normal; font-variant-numeric: normal; font-variant-caps: normal; font-variant-alternates: normal; font-variant-east-asian: normal; font-variant-position: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\"> in the </span><span style=\"font-size: 12pt; font-family: Arial, sans-serif; color: rgb(67, 67, 67); background-color: transparent; font-weight: 400; font-style: italic; font-variant-ligatures: normal; font-variant-numeric: normal; font-variant-caps: normal; font-variant-alternates: normal; font-variant-east-asian: normal; font-variant-position: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">mundane</span><span style=\"font-size: 12pt; font-family: Arial, sans-serif; color: rgb(67, 67, 67); background-color: transparent; font-weight: 400; font-style: normal; font-variant-ligatures: normal; font-variant-numeric: normal; font-variant-caps: normal; font-variant-alternates: normal; font-variant-east-asian: normal; font-variant-position: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">, themes that shaped my perspective on living and nurtured my vision for creating art.</span></p><p dir=\"ltr\" style=\"line-height: 1.656; background-color: rgb(255, 255, 255); margin-top: 0pt; margin-bottom: 0pt;\"><br></p><p dir=\"ltr\" style=\"line-height: 1.656; background-color: rgb(255, 255, 255); margin-top: 0pt; margin-bottom: 0pt; padding: 0pt 0pt 12pt;\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; color: rgb(67, 67, 67); background-color: transparent; font-weight: 400; font-style: normal; font-variant-ligatures: normal; font-variant-numeric: normal; font-variant-caps: normal; font-variant-alternates: normal; font-variant-east-asian: normal; font-variant-position: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">** All pieces from the \"Looking For\" series will be limited to a collection of 100 originals. There will never be another one made. The first original will always remain with me in my private collection, never to be sold. Once the 99 available pieces are sold, you will only be able to acquire a piece from one of the 99 collectors that moved before you.&nbsp;</span></p><p dir=\"ltr\" style=\"line-height: 1.656; background-color: rgb(255, 255, 255); margin-top: 0pt; margin-bottom: 12pt;\"><span style=\"font-size: 12pt; font-family: Arial, sans-serif; color: rgb(67, 67, 67); background-color: transparent; font-weight: 400; font-style: normal; font-variant-ligatures: normal; font-variant-numeric: normal; font-variant-caps: normal; font-variant-alternates: normal; font-variant-east-asian: normal; font-variant-position: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">*** Every art piece that is purchased will be delivered with a custom title placard, an edged wooden cleat for hanging, and a signed certificate of authenticity displaying the specific piece number that you own.</span></p><span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif; font-size: 14px;\"></span>', 1, 0, 3, 0, 186, 3, '<p>Cautiously combed, laid, stretched and printed on novelty shimmer fabric.</p><p><span style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 1rem;\">Meticulously framed in diagonally edged white walnut and sealed with museum grade AR glass.</span></p><p><span style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 1rem;\">36 x 28in</span></p>', 32, '2023-12-28 20:54:27', '2024-03-29 20:57:28', NULL),
(35, 'The Contrarian', 15000, 14000, 0, 'the-contrarian', 'a:1:{i:1;s:15:\"1709112681.webp\";}', 'a:0:{}', 'a:1:{i:0;s:34:\"17084575161354678273-watermark.jpg\";}', '<p></p><p><span style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 1rem;\">My mother was a true purist, a real contrarian, an honest soul.</span><br></p><p><span style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 1rem;\">Only 54 originals will ever be produced to honor the 54 full years that she lived.</span><br></p>', 1, 0, 1, 0, 250, 3, '<p>Cautiously combed, laid, stretched and printed on novelty shimmer fabric.</p><p><span style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 1rem;\">Meticulously framed in Italian wood and sealed with museum grade AR glass.</span></p><p><span style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 1rem;\">36 x 28in</span><br></p>', 32, '2023-12-30 14:05:24', '2024-03-31 01:32:12', NULL),
(36, 'testing', 12, 13, 14, 'testing', 'a:1:{i:0;s:14:\"1708229238.png\";}', NULL, 'a:1:{i:0;s:33:\"1708229239443317331-watermark.jpg\";}', 'as', 1, 0, 0, 0, 0, 3, '<p>sa</p>', 38, '2024-02-18 04:07:20', '2024-02-29 10:37:46', '2024-02-18 04:07:56'),
(37, 'asa', 12, 23, 12, 'asa', 'a:1:{i:0;s:14:\"1708229797.svg\";}', NULL, 'a:0:{}', 'cxc', 1, 0, 0, 0, 0, 3, '<p>xcx</p>', 40, '2024-02-18 04:16:37', '2024-02-29 10:37:46', '2024-02-18 04:19:57'),
(38, 'Dummy Product', 12, 13, 14, 'dummy-product', 'a:1:{i:0;s:14:\"1708406087.png\";}', NULL, 'a:1:{i:0;s:34:\"17084060881072104444-watermark.jpg\";}', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ad qui ullam quos expedita provident voluptatibus fugit sit vitae dolor odit.<span style=\"font-size: 1rem;\">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ad qui ullam quos expedita provident voluptatibus fugit sit vitae dolor odit.</span><span style=\"font-size: 1rem;\">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ad qui ullam quos expedita provident voluptatibus fugit sit vitae dolor odit.</span><span style=\"font-size: 1rem;\">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ad qui ullam quos expedita provident voluptatibus fugit sit vitae dolor odit.</span><span style=\"font-size: 1rem;\">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ad qui ullam quos expedita provident voluptatibus fugit sit vitae dolor odit.</span><span style=\"font-size: 1rem;\">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ad qui ullam quos expedita provident voluptatibus fugit sit vitae dolor odit.</span><span style=\"font-size: 1rem;\">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ad qui ullam quos expedita provident voluptatibus fugit sit vitae dolor odit.</span>', 1, 0, 0, 0, 0, 3, '<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ad qui ullam quos expedita provident voluptatibus fugit sit vitae dolor odit.<span style=\"font-size: 1rem;\">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ad qui ullam quos expedita provident voluptatibus fugit sit vitae dolor odit.</span><span style=\"font-size: 1rem;\">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ad qui ullam quos expedita provident voluptatibus fugit sit vitae dolor odit.</span><span style=\"font-size: 1rem;\">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ad qui ullam quos expedita provident voluptatibus fugit sit vitae dolor odit.</span><span style=\"font-size: 1rem;\">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ad qui ullam quos expedita provident voluptatibus fugit sit vitae dolor odit.</span><span style=\"font-size: 1rem;\">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ad qui ullam quos expedita provident voluptatibus fugit sit vitae dolor odit.</span><span style=\"font-size: 1rem;\">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ad qui ullam quos expedita provident voluptatibus fugit sit vitae dolor odit.</span><br></p>', 37, '2024-02-20 05:14:49', '2024-02-29 10:37:46', '2024-02-20 05:23:31'),
(39, 'asa', 11, 23, 12, 'asa', 'a:1:{i:0;s:14:\"1708406659.jpg\";}', NULL, 'a:1:{i:0;s:34:\"17084066601348157801-watermark.jpg\";}', 'as', 1, 0, 0, 0, 0, 3, '<p>as</p>', 34, '2024-02-20 05:24:20', '2024-02-29 10:37:46', '2024-02-20 05:26:48'),
(40, 'sa', 23, 23, 23, 'sa', 'a:1:{i:0;s:14:\"1708436843.jpg\";}', NULL, 'a:1:{i:0;s:34:\"17084368471807083071-watermark.jpg\";}', 'sds', 1, 0, 0, 0, 0, 3, '<p>sd</p>', 42, '2024-02-20 13:47:27', '2024-02-29 10:37:46', '2024-02-20 13:47:45'),
(41, 'test product', 12, 12, 12, 'test-product', 'a:2:{i:0;s:14:\"1708501932.jpg\";i:1;s:14:\"1708501937.jpg\";}', NULL, 'a:2:{i:0;s:33:\"1708501936835246837-watermark.jpg\";i:1;s:33:\"1708501940561949313-watermark.jpg\";}', 'asasass helo', 1, 0, 0, 0, 17, 3, '<p>asa</p>', 44, '2024-02-21 07:46:49', '2024-02-29 10:37:46', '2024-02-21 10:20:03'),
(42, 'as', 2, 2, 2, 'as', 'a:0:{}', NULL, 'a:0:{}', 'zx', 1, 0, 0, 0, 0, 3, '<p>zx</p>', 38, '2024-02-22 13:55:56', '2024-02-29 10:37:46', '2024-02-22 13:56:35'),
(43, 'test', 12, 12, 12, 'test', 'a:2:{i:0;s:14:\"1709022116.jpg\";i:1;s:14:\"1709022117.jpg\";}', 'a:3:{i:0;s:14:\"1709022118.jpg\";i:1;s:14:\"1709022119.jpg\";i:2;s:14:\"1709022119.jpg\";}', NULL, 'as', 1, 0, 0, 0, 19, 3, '<p>as</p>', 34, '2024-02-27 08:22:00', '2024-02-29 10:37:46', '2024-02-27 14:15:27'),
(44, 'Mystic Cloak', 15000, 15000, 1, 'mystic-cloak', 'a:1:{i:0;s:14:\"1709159937.jpg\";}', 'a:0:{}', NULL, '1 of 33', 1, 0, 6, 0, 10, 3, '', 37, '2024-02-28 22:37:10', '2024-03-16 18:11:25', '2024-03-16 18:11:25'),
(45, 'Now Leasing', 12000, 12000, 1, 'now-leasing', 'a:1:{i:0;s:14:\"1709162006.jpg\";}', 'a:0:{}', NULL, '<span style=\"font-family: &quot;Source Sans Pro&quot;;\">1 of 25 O</span><span style=\"color: rgb(26, 26, 26); font-family: &quot;Source Sans Pro&quot;;\">RIGINALS ONLY</span>', 1, 0, 5, 0, 15, 3, '', 35, '2024-02-28 23:13:27', '2024-03-31 01:31:47', NULL),
(46, 'Gold Rush', 8000, 8000, 1, 'gold-rush', 'a:1:{i:0;s:14:\"1709162292.jpg\";}', 'a:0:{}', NULL, '1 of 40', 1, 0, 15, 0, 11, 3, '<p><br></p>', 33, '2024-02-28 23:18:12', '2024-04-01 06:28:57', NULL),
(47, 'Boat Series Part I', 5000, 5000, 1, 'boat-series-part-i', 'a:1:{i:0;s:14:\"1709496376.jpg\";}', 'a:2:{i:0;s:14:\"1709496377.jpg\";i:1;s:14:\"1709496378.jpg\";}', NULL, 'Collection of 99', 1, 0, 8, 0, 6, 3, '', 32, '2024-03-03 20:01:30', '2024-03-29 20:58:41', NULL),
(48, 'Boat Series Part II', 5000, 5000, 1, 'boat-series-part-ii', 'a:1:{i:0;s:14:\"1709496529.jpg\";}', 'a:2:{i:0;s:14:\"1709496530.jpg\";i:1;s:14:\"1709496531.jpg\";}', NULL, 'Collection of 99&nbsp;', 1, 0, 9, 0, 3, 3, '', 32, '2024-03-03 20:08:53', '2024-03-31 01:34:00', NULL),
(49, 'Boat Series Part III', 5000, 5000, 1, 'boat-series-part-iii', 'a:1:{i:0;s:14:\"1709496639.jpg\";}', 'a:2:{i:0;s:14:\"1709496640.jpg\";i:1;s:14:\"1709496641.jpg\";}', NULL, 'Collection of 99', 1, 0, 10, 0, 3, 3, '', 32, '2024-03-03 20:10:41', '2024-03-28 10:17:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `post_id` varchar(255) DEFAULT NULL,
  `tag_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `payload` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_activity` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `payload`, `created_at`, `updated_at`, `last_activity`, `user_id`, `ip_address`, `user_agent`) VALUES
('7WlUgA2FC8f6jXBPFfD7H2lzZK9DJNzdHoJG4sof', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU3l3UFA4VVRBbmtUZ3NVMGlWZGh1cnFtdlJxSkxqSFRsWVhNODl4ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHBzOi8vZWMyLTEzLTU2LTg0LTE4MS51cy13ZXN0LTEuY29tcHV0ZS5hbWF6b25hd3MuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '2024-04-01 01:29:38', '2024-04-01 01:29:38', '1711934978', NULL, '199.45.155.54', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)'),
('b027MoU2sDj2qTOpfUSLKkrzHoCvcmTH4APcU3VR', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmlUSnRidk5UZkF3UW9ZWmhxNzNlUk9Xc2E5NzVKYldHb0hYVFdQaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xMy41Ni44NC4xODEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '2024-04-01 02:02:16', '2024-04-01 02:02:16', '1711936936', NULL, '199.45.155.37', ''),
('b0UlLDHeS6JGLhQTDdFr5lTZUyl26qOM7d4a0zT1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWFRY0hNS3F0aG5iZWxzOHNleDljbkZ3dGFwcHNjOVNmVEk1cTlUQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vMTMuNTYuODQuMTgxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '2024-04-01 01:29:31', '2024-04-01 01:29:31', '1711934971', NULL, '199.45.155.54', ''),
('B13YWYRXtXaRXK0Lae9Ycj1LB3jggjMyaMaxoyHQ', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiU0tWQ2NKYUFwcUdsczJ2blBLdmNQVVNwY0thQXZJUzNQU09Pc2Q2biI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '2024-04-01 00:46:09', '2024-04-01 00:46:09', '1711932369', NULL, '185.224.128.43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46'),
('BJeDePz08uReMB4y1dPMRQyRifUCaq08ntYIbg5A', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZlZrTWY0dWNMTFhiT0NmUDdPWlpPd2MyUWVRamZVRTNnZnZ2OTBaWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xMy41Ni44NC4xODEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '2024-04-01 06:15:34', '2024-04-01 06:15:34', '1711952134', NULL, '111.7.100.33', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36'),
('DVFrEC4T5Y9OU2Bjak3DhNnq8nvNk4WsY4UvGdG2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFZBNDR0bERSVTlHZUxRMDZoSkpjRWxhQ2U1ZmlUM2RzY0NMZUpLRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vMTMuNTYuODQuMTgxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '2024-04-01 05:31:51', '2024-04-01 05:31:51', '1711949511', NULL, '51.159.23.43', ''),
('eWVgoAFf3EqSqcsOkmc7dqq31zXQbBOlviqF8WV4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieHFaUXhISU1XSlBnbDBYMkdGS3JXV1NWT0VWMmV2ZThqdzJHYkpyRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xMy41Ni44NC4xODEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '2024-04-01 07:23:03', '2024-04-01 07:23:03', '1711956183', NULL, '185.150.26.240', ''),
('H5eY9OLPEUrnQZbWHObNma3CAGbuA1EEgh2aZsqC', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidjZhQ0NGVnBaVXpiTzZqMklFVnNkbUNzbXoyTW52d1ZUaVZsNmc3RCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xMy41Ni44NC4xODEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '2024-04-01 03:40:35', '2024-04-01 03:40:35', '1711942835', NULL, '54.241.196.130', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36'),
('HEqxJhkKsN8JuI6hKmtgIqgGZNqK2DeHknTl3gbn', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTUzaHVGSXQzeGhQYzJyT0Q0MGJxTUttcGFyMGVzd2pTd3FNNmlSOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vMTMuNTYuODQuMTgxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '2024-04-01 02:43:21', '2024-04-01 02:43:21', '1711939401', NULL, '34.209.154.231', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36'),
('HR6LXlOTowsYzrMuFzON1Tn8TEa0IzDIAY38bEJ2', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiR0pYTlFBRklzNzlVa3lVbzFCYklQN2hKcG9EVmx0WFgyeTlBVmxKNyI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MztzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJGw3MFVYNVJKOHRXeThRUGtjZHgvS2VFaVltaXE4S0tjcFlKNnNFSGZxYThOUGRBQ0lycTJTIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRsNzBVWDVSSjh0V3k4UVBrY2R4L0tlRWlZbWlxOEtLY3BZSjZzRUhmcWE4TlBkQUNJcnEyUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vY29uc29sZS5kYW5pZWxoYW5hcnQuY29tL2xpdGVyYXR1cmUvZWRpdC80MyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', '2024-04-01 01:37:15', '2024-04-01 01:53:34', '1711936414', '3', '45.50.113.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36'),
('MaGH8JGyyneTEHXQqaI6llt7z8bdciWhFeGQYD6W', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1ZZeTZnOVhFN0hpdVVsanNTNmNUcFFSMXNodW5OS01FT2pOZnBuUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xMy41Ni44NC4xODEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '2024-04-01 02:48:54', '2024-04-01 02:48:54', '1711939734', NULL, '213.199.44.170', 'python-requests/2.22.0'),
('MpbnyRYUJOhiu7eN4sTbabHDiNVlaW85ZhuNFfbf', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUNxVmk2WjI0ZmNrZ0YwQllyeTRUNzQ0enRTd1ZoZkxkN1NuZFhxRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHBzOi8vMTMuNTYuODQuMTgxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '2024-04-01 06:46:20', '2024-04-01 06:46:20', '1711953980', NULL, '34.140.108.54', 'python-requests/2.31.0'),
('nAOVNT7YaK4qyU9mVPmDMRsiq3oMyPyBRcl7igwY', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiczR0azZsYmtGcG5jbXpjQnJqWmdUazk5ajZMdFJsNXFzNVFMaXB5dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly9lYzItMTMtNTYtODQtMTgxLnVzLXdlc3QtMS5jb21wdXRlLmFtYXpvbmF3cy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '2024-04-01 02:02:19', '2024-04-01 02:02:19', '1711936939', NULL, '199.45.155.37', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)'),
('pRWGy6SXbOoXSH1tGgAVFHxAjfm1dWhYqXyzSkgX', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHpHMkgxODhMakp5RUJzNFVqTGR6azhEZFFHeFlVZm40a05ycEUyNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xMy41Ni44NC4xODEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '2024-04-01 06:18:23', '2024-04-01 06:18:23', '1711952303', NULL, '71.6.232.27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36'),
('TR0XTT8jCCrihB2uWvADfGKTyh2JUg1hlnH3nZNb', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVpueWQxMnd6VlNPa2tLTWppVkJhc0dhSU9wZDB3TFpTcmtwZUVRZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xMy41Ni44NC4xODEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '2024-04-01 04:21:15', '2024-04-01 04:21:15', '1711945275', NULL, '206.168.34.182', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)'),
('v896E5LwhXzSjCNyxcKeYb56ZqIXmfaF8U6SFi8V', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnMxb092NjB4MVI2T0NNZEU3Snp3eTV5VWxDZ3hNeGc5OFd5TGI1bCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8xMy41Ni44NC4xODEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', '2024-04-01 04:50:44', '2024-04-01 04:50:44', '1711947044', NULL, '198.23.197.232', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_general_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `slug`, `image`, `value`, `created_at`, `updated_at`) VALUES
(1, 'about_us', 'about_us', '1708335878_image_67193089.JPG', '<h2 class=\"mb-3 fw-bold fst-normal\" style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-weight: 700 !important;\">Real Estate Buying Guide and Offer Management System
</h2><h2 class=\"mb-3 fw-bold fst-normal\" style=\"font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-weight: 700 !important;\"><div class=\"fs-5\" style=\"font-style: italic; font-weight: 400; font-size: 1.25rem !important;\"><p dir=\"ltr\" style=\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 14pt; font-family: &quot;Cormorant Garamond&quot;, serif; color: rgb(2, 14, 19); background-color: transparent; font-weight: 500; font-style: normal; font-variant-ligatures: normal; font-variant-numeric: normal; font-variant-caps: normal; font-variant-alternates: normal; font-variant-east-asian: normal; font-variant-position: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">Real Estate Buying Guide and Offer Management System
 would grow up spending ample time outdoors, relishing the gift of movement and enchanting environments. The innate inclination towards natural environments is what first kindled the instinct to create, behold, and preserve the extravagant beauty of how this multidimensional experience of life is designed. </span><span style=\"font-size: 14pt; font-family: &quot;Cormorant Garamond&quot;, serif; color: rgb(0, 0, 0); background-color: transparent; font-weight: 500; font-style: normal; font-variant-ligatures: normal; font-variant-numeric: normal; font-variant-caps: normal; font-variant-alternates: normal; font-variant-east-asian: normal; font-variant-position: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">Born in Los Angeles and raised in a multilingual home of an immigrant family, Han was formed by its dreamy dust and forged by the flames of the city’s compulsory coexistence of contradictions. Forced to reconcile countless differences from an early age, </span><span style=\"font-size: 14pt; font-family: &quot;Cormorant Garamond&quot;, serif; color: rgb(0, 0, 0); background-color: transparent; font-weight: 500; font-style: italic; font-variant-ligatures: normal; font-variant-numeric: normal; font-variant-caps: normal; font-variant-alternates: normal; font-variant-east-asian: normal; font-variant-position: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">Real Estate Buying Guide and Offer Management System
 </span><span style=\"font-size: 14pt; font-family: &quot;Cormorant Garamond&quot;, serif; color: rgb(0, 0, 0); background-color: transparent; font-weight: 500; font-style: normal; font-variant-ligatures: normal; font-variant-numeric: normal; font-variant-caps: normal; font-variant-alternates: normal; font-variant-east-asian: normal; font-variant-position: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;\">naturally gravitated towards poetry.&nbsp;</span></p><p dir=\"ltr\" style=\"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;\"><span id=\"docs-internal-guid-041cc1aa-7fff-38fe-dc06-c3abadddc46c\" style=\"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-style: normal; text-size-adjust: auto;\"><br><span style=\"font-size: 14pt; font-family: &quot;Cormorant Garamond&quot;, serif; background-color: transparent; font-variant-numeric: normal; font-variant-alternates: normal; font-variant-east-asian: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">As the son of a gifted designer, he was thrust into creative environments quite literally from birth, which patently nurtured his artistic birthright. Equally, Han’s work is the result of an arcane perspective shaped by his years immersed in different cultures around the world. Even as he explores the raw realities of a traumatized world, Daniel wants people to see things in the best possible light. It is visual poetry with the goal of renewing your mind, digesting beauty, and engendering hope. </span><span style=\"font-size: 14pt; font-family: &quot;Cormorant Garamond&quot;, serif; color: rgb(2, 14, 19); background-color: transparent; font-variant-numeric: normal; font-variant-alternates: normal; font-variant-east-asian: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">It is the endeavor to squeeze life’s lemons dry, contriving a portal to perceive the visual poetry that is ever present for those who seek.</span></span><br></p></div></h2>', '2024-01-11 07:18:00', '2024-03-07 00:07:18'),
(9, 'contact_information', 'contact_information', NULL, '{\"address\":\"2001 S Santa Fe Ave #F, Los Angeles, CA 90021\",\"email\":\"info@danielhanart.com\",\"phone\":\"+1 (213) 247-1119\",\"linkedin_url\":\"https:\\/\\/www.linkedin.com\\/in\\/daniel-han-948b05a0\",\"instagram_url\":\"https:\\/\\/www.instagram.com\\/danielhan\"}', '2024-01-11 08:27:30', '2024-02-19 12:21:24'),
(10, 'privacy_policy', 'privacy_policy', NULL, '<h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-style: italic;\">Effective Date: 01-25-2024</h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_620597, __Cormorant_Garamond_Fallback_620597; font-style: italic;\"><p style=\"font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-size: 16px;\">Real Estate Buying Guide and Offer Management System
 (\"we,\" \"us,\" or \"our\") is committed to protecting the privacy of our users (\"you\" or \"your\"). This Privacy Policy explains what information we collect about you, how we use it, how we share it, and your choices regarding your information.</p></h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-style: italic;\">Personal Information We Collect:</h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_620597, __Cormorant_Garamond_Fallback_620597; font-style: italic;\"><p style=\"font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-size: 16px;\">When you make a purchase, we collect your name, email, shipping address, and payment details for order processing. We gather information about your interactions with the website, including pages visited and browsing behavior. Device information, such as device type, operating system, and IP address, is collected for site optimization.</p></h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-style: italic;\">How We Use Your Information:</h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_620597, __Cormorant_Garamond_Fallback_620597; font-style: italic;\"><p style=\"font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-size: 16px;\">Personal information is used for order fulfillment, communication, and customer support. We analyze usage data to enhance website functionality and user experience. With your consent, we may send promotional emails about new products or special offers.</p></h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-style: italic;\">Information Sharing:</h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_620597, __Cormorant_Garamond_Fallback_620597; font-style: italic;\"><p style=\"font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-size: 16px;\">We share personal information with service providers for order processing. Legal requests or protection of our rights may lead to disclosure of your information.</p></h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-style: italic;\">Your Choices:</h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_620597, __Cormorant_Garamond_Fallback_620597; font-style: italic;\"><p style=\"font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-size: 16px;\">You can update personal information through your website account. Opt-out of marketing emails by following the instructions in the emails.</p></h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-style: italic;\">Security:</h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_620597, __Cormorant_Garamond_Fallback_620597; font-style: italic;\"><p style=\"font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-size: 16px;\">We take reasonable measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. However, no internet transmission is completely secure, and we cannot guarantee the security of your information.</p></h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-style: italic;\">Changes to this Privacy Policy:</h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_620597, __Cormorant_Garamond_Fallback_620597; font-style: italic;\"><p style=\"font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-size: 16px;\">Updates will be posted on this page, with the last update date indicated.</p></h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-style: italic;\">Contact Us:</h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_620597, __Cormorant_Garamond_Fallback_620597; font-style: italic;\"><p style=\"margin-bottom: 0px; font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-size: 16px;\">For questions or concerns, contact us at info@danielhanart.com.</p></h4>', '2024-01-11 11:50:25', '2024-02-19 10:25:12'),
(11, 'terms_conditions', 'terms_conditions', NULL, '<h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-style: italic;\">Acceptance of Terms:</h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_620597, __Cormorant_Garamond_Fallback_620597; font-style: italic;\"><p style=\"font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-size: 16px;\">By accessing and using the Dainelhan E-commerce Website (\"Site\"), you agree to abide by these Terms and Conditions and all applicable laws and regulations.</p></h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-style: italic;\">Intellectual Property:</h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_620597, __Cormorant_Garamond_Fallback_620597; font-style: italic;\"><p style=\"font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-size: 16px;\">All content on the Site, including but not limited to text, images, graphics, logos, and product descriptions, is the intellectual property of Dainelhan. Unauthorized use of any material without our express written consent is prohibited.</p></h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-style: italic;\">Product Information:</h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_620597, __Cormorant_Garamond_Fallback_620597; font-style: italic;\"><p style=\"font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-size: 16px;\">We make every effort to provide accurate and up-to-date product information. However, we do not guarantee the accuracy, completeness, or reliability of any product descriptions or other content on the Site.</p></h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-style: italic;\">Orders and Payments:</h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_620597, __Cormorant_Garamond_Fallback_620597; font-style: italic;\"><p style=\"font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-size: 16px;\">Placing an order on the Site constitutes an offer to purchase the products. We reserve the right to refuse or cancel any order for any reason. Payment information must be accurate, and you agree to pay the total amount specified during the checkout process.</p></h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-style: italic;\">Shipping and Delivery:</h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_620597, __Cormorant_Garamond_Fallback_620597; font-style: italic;\"><p style=\"font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-size: 16px;\">Shipping and delivery times are estimates and may vary. We are not responsible for any delays or damages that occur during shipping.</p></h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-style: italic;\">Returns and Refunds:</h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_620597, __Cormorant_Garamond_Fallback_620597; font-style: italic;\"><p style=\"font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-size: 16px;\">Please refer to our \"Returns and Refunds\" policy for information on returning products and obtaining refunds.</p></h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-style: italic;\">User Accounts:</h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_620597, __Cormorant_Garamond_Fallback_620597; font-style: italic;\"><p style=\"font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-size: 16px;\">You may be required to create a user account to access certain features of the Site. You are responsible for maintaining the confidentiality of your account information and password.</p></h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-style: italic;\">Limitation of Liability:</h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_620597, __Cormorant_Garamond_Fallback_620597; font-style: italic;\"><p style=\"font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-size: 16px;\">Dainelhan and its affiliates are not liable for any direct, indirect, incidental, special, or consequential damages resulting from the use of or inability to use the Site.</p></h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-style: italic;\">Changes to Terms:</h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_620597, __Cormorant_Garamond_Fallback_620597; font-style: italic;\"><p style=\"font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-size: 16px;\">We reserve the right to update or modify these Terms and Conditions at any time. Changes will be effective immediately upon posting on the Site.</p></h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-style: italic;\">Contact Us:</h4><h4 style=\"color: rgb(33, 37, 41); font-family: __Cormorant_Garamond_620597, __Cormorant_Garamond_Fallback_620597; font-style: italic;\"><p style=\"margin-bottom: 0px; font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-size: 16px;\">For any questions or concerns regarding these Terms and Conditions, please contact us at info@danielhanart.com.</p></h4>', '2024-01-11 12:00:32', '2024-02-19 10:24:40'),
(12, 'footer_text', 'footer_text', '', 'Forced to reconcile countless differences from an early age, Real Estate Buying Guide and Offer Management System
 naturally gravitated towards poetry.', '2024-01-11 07:18:00', '2024-02-12 08:33:45'),
(13, 'adorn_description_data', 'adorn_description_data', '', '<p class=\"storyline\" style=\"font-size: 24px; font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-style: italic;\"><font color=\"#efefef\">Until one day, she had grown wearily sick of all the copycats that came to her store to steal her designs and recreate them with cheaper materials for lower prices. She knew that in order to compete at a level that suited her caliber, she would have to choose a different lane. So that year, she planned a sourcing trip to Italy to begin her own high end line under the moniker, Covenant.</font></p><p class=\"storyline\" style=\"font-size: 24px; font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-style: italic;\"><font color=\"#efefef\">These premium fabrics were sourced from Italy by my late mother personally and have always meant a great deal to me since her passing. It isn’t logical but I felt strangely attached to these rolls of fabric, as if it’s a precious piece of her that I still have to hold. But 2000 days into the process of grieving, I know now that to create something worthwhile with her inspired fibers is just the thing I can do to best honor her memory.</font></p><p class=\"storyline\" style=\"margin-bottom: 0px; font-size: 24px; font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-style: italic;\"><font color=\"#efefef\">As the son of a gifted fashion designer, it is my deep delight to present these garments to you. All handmade in Los Angeles, constructed with expert care using treasures from the past and designed by yours truly. Each piece is perfectly unique, a work of art, impossible to recreate. A truly one-of-a-kind collaboration involving one who no longer traverses this plane, but whose love and beauty will never be forgotten.</font></p>', '2024-01-11 07:18:00', '2024-04-01 01:38:08'),
(14, 'acquire_description_data', 'acquire_description_data', '', '<p class=\"text-center  mb-0\" style=\"font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-size: 20px; font-style: italic;\">Leonardo da Vinci once said that a painting is poetry that is seen rather than felt, and poetry is painting that is felt rather than seen.</p><p class=\"text-center\" style=\"margin-bottom: 0px; font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-size: 20px; font-style: italic;\">I’d like to think that if he stuck around for the age of photography, he would agree that a great photograph subsumes both sensibilities.</p>', '2024-01-11 07:18:00', '2024-02-19 10:19:56'),
(15, 'art_description_data', 'art_description_data', NULL, '<span style=\"font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-size: 20px; font-style: italic; text-align: center;\">Picking up from where nature ends, great art pierces the mundane to find the marvelous.</span><br style=\"font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-size: 20px; font-style: italic; text-align: center;\"><span style=\"font-family: __Cormorant_Garamond_6e0d9b, __Cormorant_Garamond_Fallback_6e0d9b; font-size: 20px; font-style: italic; text-align: center;\">And in doing so, art is the reward for taking the risk to realize and reveal that which is regularly rented but rarely recognized.</span>', '2024-02-19 10:22:12', '2024-02-19 10:22:12'),
(16, 'contact_description_data', 'contact_description_data', NULL, '<p><span id=\"docs-internal-guid-719a5f93-7fff-4b0a-0622-09c280edf03a\" style=\"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); text-size-adjust: auto;\"><span style=\"font-size: 14pt; font-family: &quot;Cormorant Garamond&quot;, serif; color: rgb(2, 14, 19); font-variant-numeric: normal; font-variant-alternates: normal; font-variant-east-asian: normal; font-variant-position: normal; vertical-align: baseline; white-space-collapse: preserve;\">Real Estate Buying Guide and Offer Management System
 is a Los Angeles, CA-based artist that fell in love with photography because of the medium\'s ability to tell stories with fulfilling efficiency. His affinity to photography inevitably fused with his familial ties to fashion, fabric, and freedom.</span></span><br></p>', '2024-02-19 10:30:57', '2024-02-22 21:08:15'),
(17, 'about_us_image', 'about_us_image', '1709881122.jpg', NULL, '2024-02-20 07:51:33', '2024-03-08 06:58:44'),
(18, 'copyright_text', 'copyright_text', NULL, 'Copyright © Real Estate Buying Guide and Offer Management System
 Art 2024', '2024-02-22 07:47:50', NULL),
(19, 'home_category_color', 'home_category_color', NULL, '#304656', '2024-02-22 13:21:28', '2024-02-26 09:46:33'),
(20, 'home_newsletter_color', 'home_newsletter_color', NULL, '#8d7e71', '2024-02-22 13:21:28', '2024-02-26 14:03:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `about`, `created_at`, `updated_at`) VALUES
(3, 'Real Estate Buying Guide and Offer Management System
', 'danielhan@mailinator.com', NULL, '$2y$10$l70UX5RJ8tWy8QPkcdx/KeEiYmiq8KKcpYJ6sEHfqa8NPdACIrq2S', NULL, NULL, 'atemKlfDEa63vphl0a7arC0pLAf299UD9UHbKuWTyCNbga5CayjD4VckPLUl', NULL, NULL, NULL, '2023-12-17 00:02:28', '2023-12-17 00:02:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adorns`
--
ALTER TABLE `adorns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_literature`
--
ALTER TABLE `category_literature`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_posts`
--
ALTER TABLE `category_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_replies`
--
ALTER TABLE `contact_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_template`
--
ALTER TABLE `email_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquires`
--
ALTER TABLE `enquires`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquire_replies`
--
ALTER TABLE `enquire_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `literature`
--
ALTER TABLE `literature`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `literature_categories`
--
ALTER TABLE `literature_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
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
-- AUTO_INCREMENT for table `adorns`
--
ALTER TABLE `adorns`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `category_literature`
--
ALTER TABLE `category_literature`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `category_posts`
--
ALTER TABLE `category_posts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contact_replies`
--
ALTER TABLE `contact_replies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `email_template`
--
ALTER TABLE `email_template`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `enquires`
--
ALTER TABLE `enquires`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `enquire_replies`
--
ALTER TABLE `enquire_replies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `literature`
--
ALTER TABLE `literature`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `literature_categories`
--
ALTER TABLE `literature_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
