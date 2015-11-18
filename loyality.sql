-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 14, 2015 at 12:23 PM
-- Server version: 5.6.19-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `loyalty_card_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_current_subscriber_list`
--

CREATE TABLE IF NOT EXISTS `loyalty_current_subscriber_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_name` varchar(255) DEFAULT NULL,
  `plan_name` varchar(255) DEFAULT NULL,
  `plan_type` varchar(255) DEFAULT NULL,
  `no_of_store` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `Expiry_date` varchar(255) DEFAULT NULL,
  `Is_active` varchar(255) DEFAULT NULL,
  `payment_date` varchar(255) DEFAULT NULL,
  `link_details` varchar(255) DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_customer_reg_details`
--

CREATE TABLE IF NOT EXISTS `loyalty_customer_reg_details` (
  `cus_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `apartment` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_code` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cus_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `loyalty_customer_reg_details`
--

INSERT INTO `loyalty_customer_reg_details` (`cus_id`, `firstname`, `lastname`, `email`, `gender`, `country`, `address`, `apartment`, `city`, `state`, `user_type`, `zip`, `phone`, `mobile_no`, `flag`, `status`, `user_code`, `user_name`, `password`, `date_modified`) VALUES
(1, 'd', 'd', 'suraj@gmail.com', 'female', 'd', 'd', '', 'Kolkata', 'west bengal', 'ADMIN', 'd', 'd', 'd', '1', 'active', 'super456', '001', '1234', '2015-07-22 12:14:14');

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_daily_purchase_details`
--

CREATE TABLE IF NOT EXISTS `loyalty_daily_purchase_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(255) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `unit_price` varchar(255) DEFAULT NULL,
  `points` varchar(255) DEFAULT NULL,
  `total_price` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `loyalty_daily_purchase_details`
--

INSERT INTO `loyalty_daily_purchase_details` (`id`, `member_id`, `item_name`, `unit_price`, `points`, `total_price`, `quantity`, `date`, `date_modified`) VALUES
(5, 'MEM-47', 'Snaks', '15', '5', '10', '2', '23/07/2015', '2015-07-23 09:48:51'),
(6, 'MEM-47', 'Drinks', '60', '10', '120', '2', '23/07/2015', '2015-07-23 10:42:09');

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_delete_subscriber_list`
--

CREATE TABLE IF NOT EXISTS `loyalty_delete_subscriber_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_name` varchar(255) DEFAULT NULL,
  `plan_name` varchar(255) DEFAULT NULL,
  `plan_type` varchar(255) DEFAULT NULL,
  `no_of_store` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `Expiry_date` varchar(255) DEFAULT NULL,
  `payment_date` varchar(255) DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_Enquiry_log_details`
--

CREATE TABLE IF NOT EXISTS `loyalty_Enquiry_log_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Enquiry_type` varchar(255) DEFAULT NULL,
  `Customer_name` varchar(255) DEFAULT NULL,
  `Email_id` varchar(255) DEFAULT NULL,
  `Ph_no` varchar(255) DEFAULT NULL,
  `Enquiry_date` varchar(255) DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_free_subscriber_list`
--

CREATE TABLE IF NOT EXISTS `loyalty_free_subscriber_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_name` varchar(255) DEFAULT NULL,
  `plan_name` varchar(255) DEFAULT NULL,
  `plan_type` varchar(255) DEFAULT NULL,
  `no_of_store` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `Expiry_date` varchar(255) DEFAULT NULL,
  `created_date` varchar(255) DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_kiosk_reg_info`
--

CREATE TABLE IF NOT EXISTS `loyalty_kiosk_reg_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kiosk_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_member_login_info_datewise`
--

CREATE TABLE IF NOT EXISTS `loyalty_member_login_info_datewise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(255) DEFAULT NULL,
  `kiosk_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_member_reg_details`
--

CREATE TABLE IF NOT EXISTS `loyalty_member_reg_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `member_id` varchar(255) DEFAULT NULL,
  `card_no` varchar(255) DEFAULT NULL,
  `bonus_point` varchar(255) DEFAULT NULL,
  `admin_code` varchar(255) DEFAULT NULL,
  `present_city` varchar(255) DEFAULT NULL,
  `present_state` varchar(255) DEFAULT NULL,
  `present_district` varchar(255) DEFAULT NULL,
  `present_address` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `terms_n_cond` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_code` varchar(255) DEFAULT NULL,
  `pin_code` varchar(255) DEFAULT NULL,
  `permanent_city` varchar(255) DEFAULT NULL,
  `permanent_state` varchar(255) DEFAULT NULL,
  `permanent_district` varchar(255) DEFAULT NULL,
  `permanent_address` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `loyalty_member_reg_details`
--

INSERT INTO `loyalty_member_reg_details` (`id`, `fullname`, `username`, `password`, `member_id`, `card_no`, `bonus_point`, `admin_code`, `present_city`, `present_state`, `present_district`, `present_address`, `user_type`, `gender`, `terms_n_cond`, `mobile_no`, `email`, `status`, `user_code`, `pin_code`, `permanent_city`, `permanent_state`, `permanent_district`, `permanent_address`, `image`, `date_modified`) VALUES
(2, 'Sukanya Dutta', '8697425776', '1234', 'MEM-ZX209', 'CARD-123456', '200', 'super456', 'Kolkata', 'WB', 'Howrah', 'Madhyamgram', 'MEMBER', 'Female', 'accept', '8697425776', 'abc@abc.com', 'deactive', 'userZB362', '700030', 'Kolkata', 'WB', 'Howrah', 'Madhyamgram', 'mano1435820554485.jpg', '2015-07-22 12:34:01'),
(3, 'mam1', 'k', '5654', 'MEM-AN392', '646546', '90', '6789', 'gfgjfgjfg', 'vnbn', 'hhfgfg', '4dr', 'member', 'ghk', 'jgfjfg', 'bn68858658658', 'hhhhhh', 'active', '566', 'gh67567568', 'fgj', 'gjgfj', 'fgf', '63hh', 'doon1436176192840.png', '2015-07-21 12:55:48'),
(4, 'mem2', 'kghghjg', '5654', 'MEM-RF472', '87568685', '90', '6789675', 'gfgjfgjfgghj', 'vnbntyy', 'hhfgfgghgj', '4drjgh', 'member', 'ghkjghjh', 'jgfjfgghjhg', 'bn68858658658', 'hhhhhhgh', 'active', '5669087', 'gh67567568u67', 'fgjghjgh', 'gjgfjhgjghj', 'fgfhkgk', '63hhjhhj', 'images1436176262660.jpg', '2015-07-21 12:55:50'),
(5, 'mem3', 'kghghjgryrey', '56545646', 'MEM-WT388', '8756868554754', '83', '67896757567575', 'gfgjfgjfgghjrey', 'vnbntyytyr', 'hhfgfgghgjfgth', '4drjghtyyf', 'member', 'ghkjghjhfhh', 'jgfjfgghjhgy', 'bn68858658658tyry', 'hhhhhhghfgh', 'active', '5669087hg7y876', 'gh67567568u67fghfh', 'fgjghjghyre', 'gjgfjhgjghjfhgfh', 'fgfhkgkgh', '63hhjhhjgfhfg', 'nada1436176318690.jpg', '2015-07-21 06:53:22');

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_order_details`
--

CREATE TABLE IF NOT EXISTS `loyalty_order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `subscribe_plan` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `updated_date` varchar(255) DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_subscription_details`
--

CREATE TABLE IF NOT EXISTS `loyalty_subscription_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_plan_name` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `pricing_type` varchar(255) DEFAULT NULL,
  `plan_description` varchar(255) NOT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `offer_from` varchar(255) NOT NULL,
  `offer_to` varchar(255) NOT NULL,
  `user_code` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `subscription_order` varchar(255) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `loyalty_subscription_details`
--

INSERT INTO `loyalty_subscription_details` (`id`, `subscription_plan_name`, `price`, `pricing_type`, `plan_description`, `discount`, `status`, `offer_from`, `offer_to`, `user_code`, `user_name`, `user_type`, `subscription_order`, `date_modified`) VALUES
(1, 'basic', '100', 'Weekly', ' Basic plan', '5', 'Active', '2/3/15', '2/4/15', '', '', '', 'surjit', '2015-06-30 09:25:01');

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_superadmin_all_details`
--

CREATE TABLE IF NOT EXISTS `loyalty_superadmin_all_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `organization_type` varchar(255) DEFAULT NULL,
  `postal_country` varchar(255) DEFAULT NULL,
  `postal_state` varchar(255) DEFAULT NULL,
  `postal_city` varchar(255) DEFAULT NULL,
  `postal_address` varchar(255) DEFAULT NULL,
  `Postal_zip` varchar(255) DEFAULT NULL,
  `physical_country` varchar(255) DEFAULT NULL,
  `physical_state` varchar(255) DEFAULT NULL,
  `physical_city` varchar(255) DEFAULT NULL,
  `physical_address` varchar(255) DEFAULT NULL,
  `physical_zip` varchar(255) DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `sales_ph_no` varchar(255) DEFAULT NULL,
  `marketing_ph_no` varchar(255) DEFAULT NULL,
  `in_trial_ph_no` varchar(255) DEFAULT NULL,
  `billing_accounts_no` varchar(255) DEFAULT NULL,
  `support_email` varchar(255) DEFAULT NULL,
  `sales_email` varchar(255) DEFAULT NULL,
  `paypal_email_id` varchar(255) NOT NULL,
  `paypal_display_name` varchar(255) NOT NULL,
  `paypal_client_name` varchar(255) NOT NULL,
  `paypal_secret_token` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `user_code` varchar(255) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `loyalty_superadmin_all_details`
--

INSERT INTO `loyalty_superadmin_all_details` (`id`, `firstname`, `lastname`, `website`, `organization_type`, `postal_country`, `postal_state`, `postal_city`, `postal_address`, `Postal_zip`, `physical_country`, `physical_state`, `physical_city`, `physical_address`, `physical_zip`, `contact_no`, `email_id`, `fax`, `sales_ph_no`, `marketing_ph_no`, `in_trial_ph_no`, `billing_accounts_no`, `support_email`, `sales_email`, `paypal_email_id`, `paypal_display_name`, `paypal_client_name`, `paypal_secret_token`, `logo`, `user_code`, `date_modified`) VALUES
(1, 'surjit', 'sfd', 's@gmail.com', 'company', 'india', 'wb', 'kol', 'sfsg', '700129', 'jhfg', 'gf', 'fj', 'gj', 'fj', 'fgj5777', 'dry', 'hgj', 'ghjf', 'fh', 'g', 'fh', 'fh', 'fgh', 'fh', 'hf', 'fh', 'fh', 'doon1435655961382.png', 'super456', '2015-06-30 09:19:21');

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_superadmin_login_details`
--

CREATE TABLE IF NOT EXISTS `loyalty_superadmin_login_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `user_code` varchar(255) DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `loyalty_superadmin_login_details`
--

INSERT INTO `loyalty_superadmin_login_details` (`id`, `username`, `password`, `user_type`, `user_code`, `date_modified`) VALUES
(1, 'superadmin', '1234', 'super_admin', 'super456', '2015-08-06 07:38:45');

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_total_subscriber_list`
--

CREATE TABLE IF NOT EXISTS `loyalty_total_subscriber_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_name` varchar(255) DEFAULT NULL,
  `plan_name` varchar(255) DEFAULT NULL,
  `plan_type` varchar(255) DEFAULT NULL,
  `no_of_store` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `Expiry_date` varchar(255) DEFAULT NULL,
  `Is_active` varchar(255) DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_user_reg_details`
--

CREATE TABLE IF NOT EXISTS `loyalty_user_reg_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `present_state` varchar(255) DEFAULT NULL,
  `present_dist` varchar(255) DEFAULT NULL,
  `present_pin_code` varchar(255) DEFAULT NULL,
  `present_address` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `permanent_state` varchar(255) DEFAULT NULL,
  `permanent_district` varchar(255) DEFAULT NULL,
  `permanent_pincode` varchar(255) DEFAULT NULL,
  `permanent_address` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `admin_code` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_code` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `loyalty_user_reg_details`
--

INSERT INTO `loyalty_user_reg_details` (`id`, `fullname`, `contact_no`, `present_state`, `present_dist`, `present_pin_code`, `present_address`, `designation`, `permanent_state`, `permanent_district`, `permanent_pincode`, `permanent_address`, `user_type`, `admin_code`, `status`, `user_code`, `user_name`, `password`, `date_modified`) VALUES
(3, 'e', 'r', 'qwrwr', 'wrwrwrw', 'rrwerwerw', 'rtuwr', 'eFr', 'erwrwrwer', 'wrwrwrwr', 'werrwr', 'erwrewer', 'null', 'super456', 'active', 'userZB362', 't', 'er', '2015-07-21 11:02:32'),
(4, 'jecob', '90876576', 'ry', 'yr', 'yr', 'rdy', 'fdhfhfh', 'yr', 'yr', 'ry', 'yr', 'EMP', 'super456', 'active', 'userDZ766', 'jecob', '23456', '2015-07-08 06:36:29');

-- --------------------------------------------------------

--
-- Table structure for table `sengroup_new_member_reg_details`
--

CREATE TABLE IF NOT EXISTS `sengroup_new_member_reg_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) DEFAULT NULL,
  `member_id` varchar(255) DEFAULT NULL,
  `present_address` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `points` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `kiosk_ip` varchar(255) DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sengroup_new_member_reg_details`
--

INSERT INTO `sengroup_new_member_reg_details` (`id`, `fullname`, `member_id`, `present_address`, `user_type`, `email`, `phone_no`, `points`, `status`, `kiosk_ip`, `date_modified`) VALUES
(1, 'asd', 'MEM-47', 'ads', 'MEM', 'asd', 'asd', '210', 'active', NULL, '2015-07-23 10:42:09'),
(2, 'asd', 'MEM-4756', 'asd', 'MEM', 'asd', 'asd', '200', 'active', NULL, '2015-07-23 09:45:40');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
