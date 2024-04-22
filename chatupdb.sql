-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2024 at 07:13 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatupdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add profile', 1, 'add_profile'),
(2, 'Can change profile', 1, 'change_profile'),
(3, 'Can delete profile', 1, 'delete_profile'),
(4, 'Can view profile', 1, 'view_profile'),
(5, 'Can add user session', 2, 'add_usersession'),
(6, 'Can change user session', 2, 'change_usersession'),
(7, 'Can delete user session', 2, 'delete_usersession'),
(8, 'Can view user session', 2, 'view_usersession'),
(9, 'Can add log entry', 3, 'add_logentry'),
(10, 'Can change log entry', 3, 'change_logentry'),
(11, 'Can delete log entry', 3, 'delete_logentry'),
(12, 'Can view log entry', 3, 'view_logentry'),
(13, 'Can add permission', 4, 'add_permission'),
(14, 'Can change permission', 4, 'change_permission'),
(15, 'Can delete permission', 4, 'delete_permission'),
(16, 'Can view permission', 4, 'view_permission'),
(17, 'Can add group', 5, 'add_group'),
(18, 'Can change group', 5, 'change_group'),
(19, 'Can delete group', 5, 'delete_group'),
(20, 'Can view group', 5, 'view_group'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add content type', 7, 'add_contenttype'),
(26, 'Can change content type', 7, 'change_contenttype'),
(27, 'Can delete content type', 7, 'delete_contenttype'),
(28, 'Can view content type', 7, 'view_contenttype'),
(29, 'Can add session', 8, 'add_session'),
(30, 'Can change session', 8, 'change_session'),
(31, 'Can delete session', 8, 'delete_session'),
(32, 'Can view session', 8, 'view_session'),
(33, 'Can add account', 9, 'add_account'),
(34, 'Can change account', 9, 'change_account'),
(35, 'Can delete account', 9, 'delete_account'),
(36, 'Can view account', 9, 'view_account'),
(37, 'Can add channels', 10, 'add_channels'),
(38, 'Can change channels', 10, 'change_channels'),
(39, 'Can delete channels', 10, 'delete_channels'),
(40, 'Can view channels', 10, 'view_channels'),
(41, 'Can add subchannels', 11, 'add_subchannels'),
(42, 'Can change subchannels', 11, 'change_subchannels'),
(43, 'Can delete subchannels', 11, 'delete_subchannels'),
(44, 'Can view subchannels', 11, 'view_subchannels');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$1xNzi7SI8yrvL6MDyxK9t3$JFiBOB+iMLvrhjo+VAwYHJIEWSW7X/um+AAyExZ+rsY=', '2024-04-16 02:49:28.587500', 1, 'redbyte', '', '', '', 1, 1, '2024-04-05 12:01:32.777788'),
(2, 'pbkdf2_sha256$720000$MfwK7ARP4b3OhBhWdc6yzo$zQiP2HMeHpS1zlfoBr0WlebSlyqUjl92T9UTYI8coj0=', NULL, 0, 'testaccount', '', '', 'itsme@gmail.com', 0, 1, '2024-04-06 08:31:19.313962'),
(3, 'pbkdf2_sha256$720000$JEdYhI4NoRL9ce6HNALONH$EpkAkP5Xb5IbEc7nJ6WMTBU05yEsk6zPkHaENGuRA/Y=', '2024-04-16 02:42:40.222354', 0, 'dennis', '', '', 'gamester1014@gmail.com', 0, 1, '2024-04-15 12:38:45.616226');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_account`
--

CREATE TABLE `chat_account` (
  `id` bigint(20) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `student_number` varchar(12) DEFAULT NULL,
  `middle_name` varchar(12) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_account`
--

INSERT INTO `chat_account` (`id`, `gender`, `student_number`, `middle_name`, `user_id`) VALUES
(1, 'MALE', '22-BGU-1233', 'B', 2),
(2, 'MALE', '11111111111', 'e', 3);

-- --------------------------------------------------------

--
-- Table structure for table `chat_channels`
--

CREATE TABLE `chat_channels` (
  `id` bigint(20) NOT NULL,
  `channel_name` varchar(12) DEFAULT NULL,
  `host_id` int(11) NOT NULL,
  `channel_key` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_channels`
--

INSERT INTO `chat_channels` (`id`, `channel_name`, `host_id`, `channel_key`) VALUES
(1, 'Test Channel', 1, '123456789101'),
(2, 'rwqrewqr', 2, '123456789101'),
(3, 'test_channel', 1, '123456789101'),
(4, 'hello', 1, '123456789101'),
(5, 'testchannel2', 1, '123456789101');

-- --------------------------------------------------------

--
-- Table structure for table `chat_subchannels`
--

CREATE TABLE `chat_subchannels` (
  `id` bigint(20) NOT NULL,
  `subchannel_name` varchar(12) DEFAULT NULL,
  `subchannel_root_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_subchannels`
--

INSERT INTO `chat_subchannels` (`id`, `subchannel_name`, `subchannel_root_id`) VALUES
(1, 'subchannel1', 1),
(2, 'subchannel 2', 5),
(3, 'subchannel12', 5);

-- --------------------------------------------------------

--
-- Table structure for table `chat_subchannels_members`
--

CREATE TABLE `chat_subchannels_members` (
  `id` bigint(20) NOT NULL,
  `subchannels_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-04-06 09:05:50.663095', '1', 'Test Channel', 1, '[{\"added\": {}}]', 10, 1),
(2, '2024-04-06 09:45:37.612201', '2', 'rwqrewqr', 1, '[{\"added\": {}}]', 10, 1),
(3, '2024-04-06 11:08:38.481389', '1', 'subchannel 1', 1, '[{\"added\": {}}]', 11, 1),
(4, '2024-04-06 11:08:49.863094', '2', 'subchannel 2', 1, '[{\"added\": {}}]', 11, 1),
(5, '2024-04-07 04:54:07.134007', '1', 'subchannel1', 2, '[{\"changed\": {\"fields\": [\"Subchannel name\"]}}]', 11, 1),
(6, '2024-04-11 13:25:23.015682', '3', 'test_channel', 2, '[{\"changed\": {\"fields\": [\"Channel key\"]}}]', 10, 1),
(7, '2024-04-11 13:25:27.147249', '2', 'rwqrewqr', 2, '[{\"changed\": {\"fields\": [\"Channel key\"]}}]', 10, 1),
(8, '2024-04-11 13:25:35.050630', '1', 'Test Channel', 2, '[{\"changed\": {\"fields\": [\"Channel key\"]}}]', 10, 1),
(9, '2024-04-13 00:14:54.774534', '2', 'subchannel 2', 2, '[{\"changed\": {\"fields\": [\"Subchannel root\"]}}]', 11, 1),
(10, '2024-04-13 01:21:47.423567', '3', 'subchannel12', 1, '[{\"added\": {}}]', 11, 1),
(11, '2024-04-13 01:25:24.609066', '1', 'subchannel1', 2, '[{\"changed\": {\"fields\": [\"Subchannel root\"]}}]', 11, 1),
(12, '2024-04-13 01:25:29.235774', '2', 'subchannel 2', 2, '[{\"changed\": {\"fields\": [\"Subchannel root\"]}}]', 11, 1),
(13, '2024-04-13 01:25:33.097139', '3', 'subchannel12', 2, '[{\"changed\": {\"fields\": [\"Subchannel root\"]}}]', 11, 1),
(14, '2024-04-13 01:29:18.163814', '1', 'subchannel1', 2, '[{\"changed\": {\"fields\": [\"Subchannel root\", \"Members\"]}}]', 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(3, 'admin', 'logentry'),
(5, 'auth', 'group'),
(4, 'auth', 'permission'),
(6, 'auth', 'user'),
(9, 'chat', 'account'),
(10, 'chat', 'channels'),
(1, 'chat', 'profile'),
(11, 'chat', 'subchannels'),
(2, 'chat', 'usersession'),
(7, 'contenttypes', 'contenttype'),
(8, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-04-05 11:56:00.040987'),
(2, 'auth', '0001_initial', '2024-04-05 11:56:01.606724'),
(3, 'admin', '0001_initial', '2024-04-05 11:56:01.973499'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-04-05 11:56:02.004473'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-04-05 11:56:02.054649'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-04-05 11:56:02.372299'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-04-05 11:56:02.579929'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-04-05 11:56:02.658754'),
(9, 'auth', '0004_alter_user_username_opts', '2024-04-05 11:56:02.700184'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-04-05 11:56:03.045852'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-04-05 11:56:03.053939'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-04-05 11:56:03.093423'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-04-05 11:56:03.219580'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-04-05 11:56:03.321815'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-04-05 11:56:03.388134'),
(16, 'auth', '0011_update_proxy_permissions', '2024-04-05 11:56:03.434477'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-04-05 11:56:03.535345'),
(18, 'chat', '0001_initial', '2024-04-05 11:56:03.858364'),
(19, 'chat', '0002_rename_student_profile_profile_user_and_more', '2024-04-05 11:56:04.821079'),
(20, 'chat', '0003_usersession', '2024-04-05 11:56:04.888537'),
(21, 'chat', '0004_remove_usersession_username_usersession_host_and_more', '2024-04-05 11:56:05.392038'),
(22, 'sessions', '0001_initial', '2024-04-05 11:56:05.498025'),
(23, 'chat', '0005_profile_groups_profile_user_permissions_and_more', '2024-04-06 04:28:09.057427'),
(24, 'chat', '0006_account_delete_profile', '2024-04-06 08:03:22.403947'),
(25, 'chat', '0007_channels_subchannels', '2024-04-06 09:05:24.980817'),
(26, 'chat', '0008_channels_channel_key', '2024-04-11 13:07:32.615630');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1rm6uvfxsgl8yexdcnt0iabqwo34iw8w', 'eyJfYXV0aF91c2VyX2lkIjoxfQ:1rtLa8:5vYB6EKjrHy2BaBdEWRDZxpVMsHmyjOPc5vApwj_Zds', '2024-04-21 06:00:44.662652'),
('1xokpjyz29rpbzx2ec6ds8z3ed2908tm', 'eyJfYXV0aF91c2VyX2lkIjoxfQ:1rsiGR:wVjI1JvRmLq_5GodGk8rfoiM_v9_Y02_jm50afGskkU', '2024-04-19 12:01:47.884916'),
('3fs9rkpuv2tym9kq5s2ocmfkjilaitn7', 'eyJfYXV0aF91c2VyX2lkIjoxfQ:1rtLSz:1-OmGm7wrahk7PevAvgxdsT8STt8mbg-80A0CfNoH1g', '2024-04-21 05:53:21.658187'),
('6uqj6wneowvmepoafxmp22q0epcigqo8', '.eJxVjEsOwiAUAO_C2hD-H5fuewby4FGpGkhKuzLe3ZJ0oduZybxJgH0rYe95DQuSK-Hk8ssipGeuQ-AD6r3R1Oq2LpGOhJ6206lhft3O9m9QoJexNV6xxIREPwulnWagk7QcNNcKTczOIvdZJT9HlJYBGqWsiEfC3WHJ5wu6RjcS:1rwYsy:hFh49kL1mAWMHdQrJiyBMiGUDKTWXR0vTjTtet6OKI0', '2024-04-30 02:49:28.595515'),
('77bgoxkhsj594gv2oqsciffo49g2wj2j', 'eyJfYXV0aF91c2VyX2lkIjoxfQ:1rt4tp:qaqGZG4pSqSyZq3BaVyzy6XlMnBqRKRlfkOkIYoCjKc', '2024-04-20 12:11:57.923841'),
('9o8ij0htn7mm772l4k3cw13o5n69ijb7', 'eyJfYXV0aF91c2VyX2lkIjoxfQ:1rtQMT:JtsrQJYUYXodb3NvnWBFfK_jcXUXVywvl0Dcb--EK_M', '2024-04-21 11:06:57.059952'),
('a2e0sijzmfhjq52jb7hhh5dltnkeyp9k', 'eyJfYXV0aF91c2VyX2lkIjoxfQ:1rtLKQ:Uvyilx4n1owNDAlWuCL_dk5svMksaHFNp2iSIj5YVoc', '2024-04-21 05:44:30.106663'),
('a6vrqywoz2l41r0puyyc4mp6ydo6n8if', '.eJxVjMsOwiAQRf-FtSEM5enSvd9AhgGkaiAp7cr479qkC93ec859sYDbWsM28hLmxM5sYqffLSI9cttBumO7dU69rcsc-a7wgw5-7Sk_L4f7d1Bx1G8tSRQDRRjnSlQaJkHZF9RGAVmbJUhbLOikrEvCG4MarfNAeZIOECV7fwDLdjcZ:1rwYmO:s7YWrPIZELBX8AuMVfgOfryQSYfj2HpE_W4WuCPeHXo', '2024-04-30 02:42:40.238021'),
('ghob1h6t66qxg0512fq9elk04mzcfe8e', 'eyJfYXV0aF91c2VyX2lkIjoxfQ:1rtLNa:Bvdk7fRJsoMlGPitE_IbrQgErkkCdOZFncZ8R8KA3wg', '2024-04-21 05:47:46.730626'),
('hk3raxcqufllnbs0cwbcx45r2zha5uvd', 'eyJfYXV0aF91c2VyX2lkIjoxfQ:1rtLJg:3xJtWpu00jofINYR1YDZ5Rqnqh24vEaKBts8zI63ZVs', '2024-04-21 05:43:44.115507'),
('jgrkmyzuh2rska1e9t3ku3kenuqe4nlk', '.eJxVjEsOwiAUAO_C2hD-H5fuewby4FGpGkhKuzLe3ZJ0oduZybxJgH0rYe95DQuSK-Hk8ssipGeuQ-AD6r3R1Oq2LpGOhJ6206lhft3O9m9QoJexNV6xxIREPwulnWagk7QcNNcKTczOIvdZJT9HlJYBGqWsiEfC3WHJ5wu6RjcS:1rtksx:0PeRV_2LS0x5Zp_EvZXlyjsjqcLlNARUz-26Hkj55gA', '2024-04-22 09:01:51.452775'),
('joxygdsghmuxu6vs4hroifh4gp6pn5g2', '.eJxVjEsOwiAUAO_C2hD-H5fuewby4FGpGkhKuzLe3ZJ0oduZybxJgH0rYe95DQuSK-Hk8ssipGeuQ-AD6r3R1Oq2LpGOhJ6206lhft3O9m9QoJexNV6xxIREPwulnWagk7QcNNcKTczOIvdZJT9HlJYBGqWsiEfC3WHJ5wu6RjcS:1rutei:6j3KV5160Z9hPLNDVQLZFMuatzkjPpHKU_nQHOsPVn4', '2024-04-25 12:35:52.759357'),
('kyk8dh2111bun0hd4ki3b9chccjakeqx', '.eJxVjEsOwiAUAO_C2hD-H5fuewby4FGpGkhKuzLe3ZJ0oduZybxJgH0rYe95DQuSK-Hk8ssipGeuQ-AD6r3R1Oq2LpGOhJ6206lhft3O9m9QoJexNV6xxIREPwulnWagk7QcNNcKTczOIvdZJT9HlJYBGqWsiEfC3WHJ5wu6RjcS:1rt1Ne:lu2cc-VEUPEvwmKhbSTAXHOdFUkc5-lFMpZ9SFTEdIo', '2024-04-20 08:26:30.836174'),
('mdwj8r2u7sq119ywibvas5ix5uesudxo', '.eJxVjEsOwiAUAO_C2hD-H5fuewby4FGpGkhKuzLe3ZJ0oduZybxJgH0rYe95DQuSK-Hk8ssipGeuQ-AD6r3R1Oq2LpGOhJ6206lhft3O9m9QoJexNV6xxIREPwulnWagk7QcNNcKTczOIvdZJT9HlJYBGqWsiEfC3WHJ5wu6RjcS:1rvR2b:2zIT1gl46IeAQ8EfHvqGByxM6LzOBtBK7Wes1o-C9Uw', '2024-04-27 00:14:45.061871'),
('ntogs222b8412n0nt56m218xu0nrxxa9', '.eJxVjEsOwiAUAO_C2hD-H5fuewby4FGpGkhKuzLe3ZJ0oduZybxJgH0rYe95DQuSK-Hk8ssipGeuQ-AD6r3R1Oq2LpGOhJ6206lhft3O9m9QoJexNV6xxIREPwulnWagk7QcNNcKTczOIvdZJT9HlJYBGqWsiEfC3WHJ5wu6RjcS:1rwL8q:9ez-hFKt5DJyBO9dZpYxYilrRu12IXc7Bq5SngzmUmE', '2024-04-29 12:08:56.458697'),
('omjdnsisl8xcuobcob7ho3xybahif9e2', '.eJxVjEsOwiAUAO_C2hD-H5fuewby4FGpGkhKuzLe3ZJ0oduZybxJgH0rYe95DQuSK-Hk8ssipGeuQ-AD6r3R1Oq2LpGOhJ6206lhft3O9m9QoJexNV6xxIREPwulnWagk7QcNNcKTczOIvdZJT9HlJYBGqWsiEfC3WHJ5wu6RjcS:1rtPdT:UOFcRlqIgNTzIG0cXhygeEnbBr5MVUy0MvAg2dG0aBQ', '2024-04-21 10:20:27.856855'),
('qlzs6twcp87pwgjurak05uttueiz58jc', 'e30:1rsiGM:LS4PrgF-k6PIJpobEftF2FOl12eLnmo_ejtDGt0sjng', '2024-04-19 12:01:42.508832'),
('rj0zs0m3offmjkpwxos12q0t1q30t0w7', '.eJxVjEsOwiAUAO_C2hD-H5fuewby4FGpGkhKuzLe3ZJ0oduZybxJgH0rYe95DQuSK-Hk8ssipGeuQ-AD6r3R1Oq2LpGOhJ6206lhft3O9m9QoJexNV6xxIREPwulnWagk7QcNNcKTczOIvdZJT9HlJYBGqWsiEfC3WHJ5wu6RjcS:1rsiGM:kj8Q_cuLwlsitt0vRZ7RN6aCghBm84Gv-qK_XWWsx4Y', '2024-04-19 12:01:42.542237'),
('smycffs6hgf25dtka4a6eylgz6ymz0es', '.eJxVjEsOwiAUAO_C2hD-H5fuewby4FGpGkhKuzLe3ZJ0oduZybxJgH0rYe95DQuSK-Hk8ssipGeuQ-AD6r3R1Oq2LpGOhJ6206lhft3O9m9QoJexNV6xxIREPwulnWagk7QcNNcKTczOIvdZJT9HlJYBGqWsiEfC3WHJ5wu6RjcS:1rv7Lg:sy-UGrWiGKOSECqUJcCZt5bx6QLcRuY6me7OYOFFQdQ', '2024-04-26 03:13:08.923364'),
('tlda4fkvqav1y5llrycqtuvzw53qaik3', 'eyJfYXV0aF91c2VyX2lkIjoxfQ:1rtLRi:AWQ92RZt0zFCm1IJIXU-8OJHCXVoQaJBHLHphiSukeo', '2024-04-21 05:52:02.052568'),
('ueay3ocyo9vrq62aoh3omvi37kxpgmph', '.eJxVjEsOwiAUAO_C2hD-H5fuewby4FGpGkhKuzLe3ZJ0oduZybxJgH0rYe95DQuSK-Hk8ssipGeuQ-AD6r3R1Oq2LpGOhJ6206lhft3O9m9QoJexNV6xxIREPwulnWagk7QcNNcKTczOIvdZJT9HlJYBGqWsiEfC3WHJ5wu6RjcS:1rt11j:_F3GZsmJQzmXtr0hEwKQd0AUPPe3WvRfCvR5USWTlJI', '2024-04-20 08:03:51.024353');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `chat_account`
--
ALTER TABLE `chat_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `chat_channels`
--
ALTER TABLE `chat_channels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_channels_host_id_bcd4db85_fk_auth_user_id` (`host_id`);

--
-- Indexes for table `chat_subchannels`
--
ALTER TABLE `chat_subchannels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_subchannels_members`
--
ALTER TABLE `chat_subchannels_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chat_subchannels_members_subchannels_id_user_id_741b1c54_uniq` (`subchannels_id`,`user_id`),
  ADD KEY `chat_subchannels_members_user_id_ac4c0ca4_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_account`
--
ALTER TABLE `chat_account`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chat_channels`
--
ALTER TABLE `chat_channels`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `chat_subchannels`
--
ALTER TABLE `chat_subchannels`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chat_subchannels_members`
--
ALTER TABLE `chat_subchannels_members`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `chat_account`
--
ALTER TABLE `chat_account`
  ADD CONSTRAINT `chat_account_user_id_d6da2c33_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `chat_channels`
--
ALTER TABLE `chat_channels`
  ADD CONSTRAINT `chat_channels_host_id_bcd4db85_fk_auth_user_id` FOREIGN KEY (`host_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `chat_subchannels_members`
--
ALTER TABLE `chat_subchannels_members`
  ADD CONSTRAINT `chat_subchannels_mem_subchannels_id_fc532d96_fk_chat_subc` FOREIGN KEY (`subchannels_id`) REFERENCES `chat_subchannels` (`id`),
  ADD CONSTRAINT `chat_subchannels_members_user_id_ac4c0ca4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
