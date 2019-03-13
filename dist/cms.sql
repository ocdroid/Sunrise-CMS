-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 02, 2019 at 11:35 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `api`
--

CREATE TABLE `api` (
  `api_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `api`
--

INSERT INTO `api` (`api_id`, `name`, `key`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Default', 'FgdJ5jU76KwNYyA4OwvbUW72qB6DvKCoA5FGwoJROqqN9CQmY2puGbeo4yitF2VLgpH4NcorFn2pyhLI0D9NiUToj80w4KrxipbBGoCSNAWDOXlI9AEJO5LOnhvfdtP25Euf8fM6CUTnb3708M4NMR22SgMgBGuYpXr2y6JfBd8c4BuuZITbGDQZKjEOzYTRSCbwbtp19JicRytSSJr3pP9EigLVrp3K67c2wucCmUU3LWEA5g0RPgxrW0FproO3', 1, '2018-09-21 22:04:47', '2018-09-21 22:04:47');

-- --------------------------------------------------------

--
-- Table structure for table `api_ip`
--

CREATE TABLE `api_ip` (
  `api_ip_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `api_session`
--

CREATE TABLE `api_session` (
  `api_session_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `date_available` date NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `article_review` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `noindex` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `gstatus` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`article_id`, `image`, `date_available`, `sort_order`, `article_review`, `status`, `noindex`, `date_added`, `date_modified`, `viewed`, `gstatus`) VALUES
(120, 'catalog/demo_categories/3.jpg', '0000-00-00', 1, 1, 1, 1, '2014-04-08 04:26:00', '2018-11-16 13:27:29', 46, 0),
(123, 'catalog/demo_categories/2.jpg', '0000-00-00', 1, 1, 1, 1, '2014-03-31 06:55:15', '2018-11-16 13:28:17', 178, 1),
(124, 'catalog/demo_categories/7.jpg', '0000-00-00', 1, 0, 1, 1, '2015-06-29 09:05:38', '2018-11-16 13:28:53', 40, 0),
(125, 'catalog/demo_categories/8.jpg', '0000-00-00', 1, 0, 1, 1, '2015-06-29 09:09:03', '2018-12-19 00:16:10', 175, 0);

-- --------------------------------------------------------

--
-- Table structure for table `article_description`
--

CREATE TABLE `article_description` (
  `article_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL,
  `tag` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article_description`
--

INSERT INTO `article_description` (`article_id`, `language_id`, `name`, `description`, `meta_description`, `meta_title`, `meta_h1`, `tag`) VALUES
(120, 2, 'Voluptatem corporis qui sequi', '&lt;p&gt;Ad quibusdam accusantium quam ex. Fuga delectus ipsam, quo sint repellendus maxime eos amet perferendis corrupti molestias dolor earum labore porro quos asperiores et quasi in! Corporis officia doloribus excepturi?&lt;br&gt;Earum, sint similique perferendis accusantium animi expedita nihil magni quo sed distinctio eveniet modi ut corrupti cum optio deserunt odio recusandae unde, fugit assumenda consequatur voluptate alias consectetur porro. Ipsa?&lt;br&gt;Odio veniam, sapiente nihil tempora cumque expedita repudiandae quis nulla accusantium asperiores totam illum dolore. Repudiandae aspernatur veritatis cupiditate distinctio eaque id! Reiciendis delectus dolore corporis ex est perspiciatis nam?&lt;br&gt;Totam laudantium quam dolorum voluptatibus ipsam error reiciendis aliquam quia fuga recusandae magnam nostrum illo excepturi, doloremque sapiente nisi incidunt expedita cumque voluptatem corporis qui sequi eveniet molestias aut. Iure?&lt;br&gt;Odit, facere totam magni in laboriosam, enim illum minus est, nihil nesciunt corrupti non exercitationem. Ut deleniti nostrum enim quod similique, voluptas ipsum voluptatum adipisci quam numquam dolore, totam recusandae?&lt;br&gt;Nam, aspernatur deserunt. Sunt blanditiis temporibus labore ex officiis corrupti alias iure quisquam aperiam corporis eaque tempore dolores ipsum, sint nesciunt iste laboriosam obcaecati quas cumque quidem maxime suscipit. Vitae!&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;span class=&quot;long_text&quot; id=&quot;result_box&quot; lang=&quot;en&quot;&gt;&lt;span class=&quot;hps&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n', 'Voluptatem corporis qui sequi', 'Voluptatem corporis qui sequi', 'Voluptatem corporis qui sequi', 'Voluptatem, corporis, qui, sequi'),
(123, 2, 'Fugit assumenda consequatur voluptate', '&lt;p&gt;Ad quibusdam accusantium quam ex. Fuga delectus ipsam, quo sint repellendus maxime eos amet perferendis corrupti molestias dolor earum labore porro quos asperiores et quasi in! Corporis officia doloribus excepturi?&lt;br&gt;Earum, sint similique perferendis accusantium animi expedita nihil magni quo sed distinctio eveniet modi ut corrupti cum optio deserunt odio recusandae unde, fugit assumenda consequatur voluptate alias consectetur porro. Ipsa?&lt;br&gt;Odio veniam, sapiente nihil tempora cumque expedita repudiandae quis nulla accusantium asperiores totam illum dolore. Repudiandae aspernatur veritatis cupiditate distinctio eaque id! Reiciendis delectus dolore corporis ex est perspiciatis nam?&lt;br&gt;Totam laudantium quam dolorum voluptatibus ipsam error reiciendis aliquam quia fuga recusandae magnam nostrum illo excepturi, doloremque sapiente nisi incidunt expedita cumque voluptatem corporis qui sequi eveniet molestias aut. Iure?&lt;br&gt;Odit, facere totam magni in laboriosam, enim illum minus est, nihil nesciunt corrupti non exercitationem. Ut deleniti nostrum enim quod similique, voluptas ipsum voluptatum adipisci quam numquam dolore, totam recusandae?&lt;br&gt;Nam, aspernatur deserunt. Sunt blanditiis temporibus labore ex officiis corrupti alias iure quisquam aperiam corporis eaque tempore dolores ipsum, sint nesciunt iste laboriosam obcaecati quas cumque quidem maxime suscipit. Vitae!&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;span id=&quot;result_box&quot; lang=&quot;en&quot;&gt;&lt;span class=&quot;hps&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n', 'Fugit assumenda consequatur voluptate', 'Fugit assumenda consequatur voluptate', 'Fugit assumenda consequatur voluptate', 'Fugit, assumenda, consequatur, voluptate'),
(124, 2, 'Perferendis accusantium animi', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;Nam, aspernatur deserunt. Sunt blanditiis temporibus labore ex officiis corrupti alias iure quisquam aperiam corporis eaque tempore dolores ipsum, sint nesciunt iste laboriosam obcaecati quas cumque quidem maxime suscipit. Vitae!&lt;br&gt;Odit, facere totam magni in laboriosam, enim illum minus est, nihil nesciunt corrupti non exercitationem. Ut deleniti nostrum enim quod similique, voluptas ipsum voluptatum adipisci quam numquam dolore, totam recusandae?&lt;br&gt;Totam laudantium quam dolorum voluptatibus ipsam error reiciendis aliquam quia fuga recusandae magnam nostrum illo excepturi, doloremque sapiente nisi incidunt expedita cumque voluptatem corporis qui sequi eveniet molestias aut. Iure?&lt;br&gt;Odio veniam, sapiente nihil tempora cumque expedita repudiandae quis nulla accusantium asperiores totam illum dolore. Repudiandae aspernatur veritatis cupiditate distinctio eaque id! Reiciendis delectus dolore corporis ex est perspiciatis nam?&lt;br&gt;Earum, sint similique perferendis accusantium animi expedita nihil magni quo sed distinctio eveniet modi ut corrupti cum optio deserunt odio recusandae unde, fugit assumenda consequatur voluptate alias consectetur porro. Ipsa?&lt;br&gt;Ad quibusdam accusantium quam ex. Fuga delectus ipsam, quo sint repellendus maxime eos amet perferendis corrupti molestias dolor earum labore porro quos asperiores et quasi in! Corporis officia doloribus excepturi?&lt;br&gt;&lt;/p&gt;', 'Perferendis accusantium animi', 'Perferendis accusantium animi', 'Perferendis accusantium animi', 'perferendis, accusantium,animi'),
(125, 2, 'Aspernatur deserunt', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;Nam, aspernatur deserunt. Sunt blanditiis temporibus labore ex officiis corrupti alias iure quisquam aperiam corporis eaque tempore dolores ipsum, sint nesciunt iste laboriosam obcaecati quas cumque quidem maxime suscipit. Vitae!&lt;br&gt;Odit, facere totam magni in laboriosam, enim illum minus est, nihil nesciunt corrupti non exercitationem. Ut deleniti nostrum enim quod similique, voluptas ipsum voluptatum adipisci quam numquam dolore, totam recusandae?&lt;br&gt;Totam laudantium quam dolorum voluptatibus ipsam error reiciendis aliquam quia fuga recusandae magnam nostrum illo excepturi, doloremque sapiente nisi incidunt expedita cumque voluptatem corporis qui sequi eveniet molestias aut. Iure?&lt;br&gt;Odio veniam, sapiente nihil tempora cumque expedita repudiandae quis nulla accusantium asperiores totam illum dolore. Repudiandae aspernatur veritatis cupiditate distinctio eaque id! Reiciendis delectus dolore corporis ex est perspiciatis nam?&lt;br&gt;Earum, sint similique perferendis accusantium animi expedita nihil magni quo sed distinctio eveniet modi ut corrupti cum optio deserunt odio recusandae unde, fugit assumenda consequatur voluptate alias consectetur porro. Ipsa?&lt;br&gt;Ad quibusdam accusantium quam ex. Fuga delectus ipsam, quo sint repellendus maxime eos amet perferendis corrupti molestias dolor earum labore porro quos asperiores et quasi in! Corporis officia doloribus excepturi?&lt;br&gt;&lt;/p&gt;', 'Aspernatur deserunt', 'Aspernatur deserunt', 'Aspernatur deserunt', 'aspernatur, deserunt');

-- --------------------------------------------------------

--
-- Table structure for table `article_image`
--

CREATE TABLE `article_image` (
  `article_image_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `article_related`
--

CREATE TABLE `article_related` (
  `article_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article_related`
--

INSERT INTO `article_related` (`article_id`, `related_id`) VALUES
(120, 123),
(120, 124),
(120, 125),
(123, 120),
(123, 124),
(123, 125),
(124, 120),
(124, 123),
(124, 125),
(125, 120),
(125, 123),
(125, 124);

-- --------------------------------------------------------

--
-- Table structure for table `article_related_mn`
--

CREATE TABLE `article_related_mn` (
  `article_id` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `article_related_product`
--

CREATE TABLE `article_related_product` (
  `article_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article_related_product`
--

INSERT INTO `article_related_product` (`article_id`, `product_id`) VALUES
(30, 123),
(31, 123),
(43, 123),
(45, 123),
(120, 28),
(120, 30),
(120, 41),
(123, 30),
(123, 31),
(123, 43),
(123, 45),
(124, 28),
(124, 30),
(124, 41),
(124, 47),
(125, 42),
(125, 96),
(125, 97),
(125, 98),
(125, 99);

-- --------------------------------------------------------

--
-- Table structure for table `article_related_wb`
--

CREATE TABLE `article_related_wb` (
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `article_to_blog_category`
--

CREATE TABLE `article_to_blog_category` (
  `article_id` int(11) NOT NULL,
  `blog_category_id` int(11) NOT NULL,
  `main_blog_category` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article_to_blog_category`
--

INSERT INTO `article_to_blog_category` (`article_id`, `blog_category_id`, `main_blog_category`) VALUES
(120, 69, 0),
(120, 71, 1),
(123, 70, 1),
(124, 71, 1),
(125, 69, 1);

-- --------------------------------------------------------

--
-- Table structure for table `article_to_download`
--

CREATE TABLE `article_to_download` (
  `article_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article_to_download`
--

INSERT INTO `article_to_download` (`article_id`, `download_id`) VALUES
(125, 1);

-- --------------------------------------------------------

--
-- Table structure for table `article_to_layout`
--

CREATE TABLE `article_to_layout` (
  `article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article_to_layout`
--

INSERT INTO `article_to_layout` (`article_id`, `store_id`, `layout_id`) VALUES
(120, 0, 0),
(123, 0, 0),
(124, 0, 0),
(125, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `article_to_store`
--

CREATE TABLE `article_to_store` (
  `article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article_to_store`
--

INSERT INTO `article_to_store` (`article_id`, `store_id`) VALUES
(120, 0),
(123, 0),
(124, 0),
(125, 0);

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

CREATE TABLE `attribute` (
  `attribute_id` int(11) NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attribute`
--

INSERT INTO `attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8),
(12, 8, 1),
(13, 7, 1),
(14, 9, 3),
(15, 10, 1),
(16, 11, 1),
(17, 12, 1),
(18, 13, 1),
(19, 14, 1),
(20, 15, 1),
(21, 16, 1),
(22, 8, 2),
(23, 8, 3),
(24, 8, 4),
(25, 8, 5),
(26, 8, 6),
(27, 8, 7),
(28, 8, 8),
(29, 8, 9),
(30, 8, 10);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_description`
--

CREATE TABLE `attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attribute_description`
--

INSERT INTO `attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(12, 2, 'Attribute 1-1'),
(13, 2, 'Attribute 2-1'),
(14, 2, 'Attribute 3-1'),
(15, 2, 'Attribute 4-1'),
(16, 2, 'Attribute 5-1'),
(17, 2, 'Attribute 6-1'),
(18, 2, 'Attribute 7-1'),
(19, 2, 'Attribute 8-1'),
(20, 2, 'Attribute 9-1'),
(21, 2, 'Attribute 10-1'),
(22, 2, 'Attribute 1-2'),
(23, 2, 'Attribute 1-3'),
(24, 2, 'Attribute 1-4'),
(25, 2, 'Attribute 1-5'),
(26, 2, 'Attribute 1-6'),
(27, 2, 'Attribute 1-7'),
(28, 2, 'Attribute 1-8'),
(29, 2, 'Attribute 1-9'),
(30, 2, 'Attribute 1-10');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_group`
--

CREATE TABLE `attribute_group` (
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attribute_group`
--

INSERT INTO `attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4),
(7, 2),
(8, 1),
(9, 3),
(10, 4),
(11, 5),
(12, 6),
(13, 7),
(14, 8),
(15, 9),
(16, 10);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_group_description`
--

CREATE TABLE `attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attribute_group_description`
--

INSERT INTO `attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(7, 2, 'Attribute Group 2'),
(8, 2, 'Attribute Group 1'),
(9, 2, 'Attribute Group 3'),
(10, 2, 'Attribute Group 4'),
(11, 2, 'Attribute Group 5'),
(12, 2, 'Attribute Group 6'),
(13, 2, 'Attribute Group 7'),
(14, 2, 'Attribute Group 8'),
(15, 2, 'Attribute Group 9'),
(16, 2, 'Attribute Group 10');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `banner_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`banner_id`, `name`, `status`) VALUES
(9, 'test_banner_for_homepage', 1);

-- --------------------------------------------------------

--
-- Table structure for table `banner_image`
--

CREATE TABLE `banner_image` (
  `banner_image_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `banner_image`
--

INSERT INTO `banner_image` (`banner_image_id`, `banner_id`, `language_id`, `title`, `link`, `image`, `sort_order`) VALUES
(126, 9, 2, '11', 'test_banner_for_homepage_test_link', 'catalog/demo_banners/1.jpg', 0),
(127, 9, 2, '22', '', 'catalog/demo_banners/2.jpg', 0),
(128, 9, 2, '33', '', 'catalog/demo_banners/3.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `benefit`
--

CREATE TABLE `benefit` (
  `benefit_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `benefit`
--

INSERT INTO `benefit` (`benefit_id`, `link`, `status`, `type`, `image`, `name`) VALUES
(25, '', 1, 1, 'catalog/demo_benefits/1.jpg', 'Lorem ipsum dolor 4'),
(38, 'http://ru.wikipedia.org/wiki/Bluetooth', 1, 1, 'catalog/demo_benefits/1.jpg', 'Lorem ipsum dolor 2'),
(39, '', 1, 0, 'catalog/demo_benefits/mado-el-khouly-347678-unsplash.jpg', 'Lorem ipsum dolor 5'),
(41, '', 1, 1, 'catalog/demo_benefits/1.jpg', 'Lorem ipsum dolor'),
(42, '', 1, 0, 'catalog/demo_benefits/mado-el-khouly-347678-unsplash.jpg', 'Lorem ipsum dolor 6'),
(43, '', 1, 1, 'catalog/demo_benefits/1.jpg', 'Lorem ipsum dolor 3');

-- --------------------------------------------------------

--
-- Table structure for table `benefit_description`
--

CREATE TABLE `benefit_description` (
  `benefit_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `benefit_description`
--

INSERT INTO `benefit_description` (`benefit_id`, `language_id`, `description`) VALUES
(25, 2, '&lt;p&gt;&lt;span style=&quot;font-size: 13px; line-height: 20.7999992370605px;&quot;&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;&lt;/span&gt;&lt;/p&gt;\r\n'),
(38, 2, '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;b style=&quot;color: rgb(37, 37, 37); font-family: sans-serif; font-size: 14px; line-height: 22.3999996185303px;&quot;&gt;&lt;/b&gt;&lt;/p&gt;\r\n'),
(39, 2, '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;/p&gt;\r\n'),
(41, 2, '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;&lt;/p&gt;'),
(42, 2, '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem \r\nharum corporis architecto, ex corrupti beatae doloremque neque porro \r\nillo ea molestiae accusantium dignissimos earum in. Nemo blanditiis \r\nerror similique?&lt;/p&gt;&lt;p&gt;\r\n&lt;/p&gt;\r\n'),
(43, 2, '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `blog_category`
--

CREATE TABLE `blog_category` (
  `blog_category_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `noindex` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_category`
--

INSERT INTO `blog_category` (`blog_category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `noindex`, `date_added`, `date_modified`) VALUES
(69, 'catalog/demo_categories/6.jpg', 0, 1, 0, 0, 1, 1, '2014-04-08 03:56:26', '2018-11-16 13:15:25'),
(70, 'catalog/demo_categories/7.jpg', 0, 1, 0, 0, 1, 1, '2014-04-08 03:58:55', '2018-11-16 13:26:12'),
(71, 'catalog/demo_categories/4.jpg', 69, 1, 0, 0, 1, 1, '2015-06-18 09:13:57', '2018-11-16 13:16:15');

-- --------------------------------------------------------

--
-- Table structure for table `blog_category_description`
--

CREATE TABLE `blog_category_description` (
  `blog_category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_category_description`
--

INSERT INTO `blog_category_description` (`blog_category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_title`, `meta_h1`) VALUES
(69, 2, 'Lorem ipsum', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;Nam, aspernatur deserunt. Sunt blanditiis temporibus labore ex officiis corrupti alias iure quisquam aperiam corporis eaque tempore dolores ipsum, sint nesciunt iste laboriosam obcaecati quas cumque quidem maxime suscipit. Vitae!&lt;br&gt;Odit, facere totam magni in laboriosam, enim illum minus est, nihil nesciunt corrupti non exercitationem. Ut deleniti nostrum enim quod similique, voluptas ipsum voluptatum adipisci quam numquam dolore, totam recusandae?&lt;br&gt;Totam laudantium quam dolorum voluptatibus ipsam error reiciendis aliquam quia fuga recusandae magnam nostrum illo excepturi, doloremque sapiente nisi incidunt expedita cumque voluptatem corporis qui sequi eveniet molestias aut. Iure?&lt;br&gt;Odio veniam, sapiente nihil tempora cumque expedita repudiandae quis nulla accusantium asperiores totam illum dolore. Repudiandae aspernatur veritatis cupiditate distinctio eaque id! Reiciendis delectus dolore corporis ex est perspiciatis nam?&lt;br&gt;Earum, sint similique perferendis accusantium animi expedita nihil magni quo sed distinctio eveniet modi ut corrupti cum optio deserunt odio recusandae unde, fugit assumenda consequatur voluptate alias consectetur porro. Ipsa?&lt;br&gt;Ad quibusdam accusantium quam ex. Fuga delectus ipsam, quo sint repellendus maxime eos amet perferendis corrupti molestias dolor earum labore porro quos asperiores et quasi in! Corporis officia doloribus excepturi?&lt;br&gt;&lt;/p&gt;', 'Lorem ipsum', 'Lorem ipsum', 'Lorem ipsum'),
(70, 2, 'Ipsum dolor sit', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;Nam, aspernatur deserunt. Sunt blanditiis temporibus labore ex officiis corrupti alias iure quisquam aperiam corporis eaque tempore dolores ipsum, sint nesciunt iste laboriosam obcaecati quas cumque quidem maxime suscipit. Vitae!&lt;br&gt;Odit, facere totam magni in laboriosam, enim illum minus est, nihil nesciunt corrupti non exercitationem. Ut deleniti nostrum enim quod similique, voluptas ipsum voluptatum adipisci quam numquam dolore, totam recusandae?&lt;br&gt;Totam laudantium quam dolorum voluptatibus ipsam error reiciendis aliquam quia fuga recusandae magnam nostrum illo excepturi, doloremque sapiente nisi incidunt expedita cumque voluptatem corporis qui sequi eveniet molestias aut. Iure?&lt;br&gt;Odio veniam, sapiente nihil tempora cumque expedita repudiandae quis nulla accusantium asperiores totam illum dolore. Repudiandae aspernatur veritatis cupiditate distinctio eaque id! Reiciendis delectus dolore corporis ex est perspiciatis nam?&lt;br&gt;Earum, sint similique perferendis accusantium animi expedita nihil magni quo sed distinctio eveniet modi ut corrupti cum optio deserunt odio recusandae unde, fugit assumenda consequatur voluptate alias consectetur porro. Ipsa?&lt;br&gt;Ad quibusdam accusantium quam ex. Fuga delectus ipsam, quo sint repellendus maxime eos amet perferendis corrupti molestias dolor earum labore porro quos asperiores et quasi in! Corporis officia doloribus excepturi?&lt;br&gt;&lt;/p&gt;', 'Ipsum dolor sit', 'Ipsum dolor sit', 'Ipsum dolor sit'),
(71, 2, 'Lorem ipsum dolor', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;Nam, aspernatur deserunt. Sunt blanditiis temporibus labore ex officiis corrupti alias iure quisquam aperiam corporis eaque tempore dolores ipsum, sint nesciunt iste laboriosam obcaecati quas cumque quidem maxime suscipit. Vitae!&lt;br&gt;Odit, facere totam magni in laboriosam, enim illum minus est, nihil nesciunt corrupti non exercitationem. Ut deleniti nostrum enim quod similique, voluptas ipsum voluptatum adipisci quam numquam dolore, totam recusandae?&lt;br&gt;Totam laudantium quam dolorum voluptatibus ipsam error reiciendis aliquam quia fuga recusandae magnam nostrum illo excepturi, doloremque sapiente nisi incidunt expedita cumque voluptatem corporis qui sequi eveniet molestias aut. Iure?&lt;br&gt;Odio veniam, sapiente nihil tempora cumque expedita repudiandae quis nulla accusantium asperiores totam illum dolore. Repudiandae aspernatur veritatis cupiditate distinctio eaque id! Reiciendis delectus dolore corporis ex est perspiciatis nam?&lt;br&gt;Earum, sint similique perferendis accusantium animi expedita nihil magni quo sed distinctio eveniet modi ut corrupti cum optio deserunt odio recusandae unde, fugit assumenda consequatur voluptate alias consectetur porro. Ipsa?&lt;br&gt;Ad quibusdam accusantium quam ex. Fuga delectus ipsam, quo sint repellendus maxime eos amet perferendis corrupti molestias dolor earum labore porro quos asperiores et quasi in! Corporis officia doloribus excepturi?&lt;br&gt;&lt;/p&gt;', 'Lorem ipsum dolor', 'Lorem ipsum dolor', 'Lorem ipsum dolor');

-- --------------------------------------------------------

--
-- Table structure for table `blog_category_path`
--

CREATE TABLE `blog_category_path` (
  `blog_category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_category_path`
--

INSERT INTO `blog_category_path` (`blog_category_id`, `path_id`, `level`) VALUES
(69, 69, 0),
(70, 70, 0),
(71, 69, 0),
(71, 71, 1);

-- --------------------------------------------------------

--
-- Table structure for table `blog_category_to_layout`
--

CREATE TABLE `blog_category_to_layout` (
  `blog_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_category_to_layout`
--

INSERT INTO `blog_category_to_layout` (`blog_category_id`, `store_id`, `layout_id`) VALUES
(69, 0, 0),
(70, 0, 0),
(71, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `blog_category_to_store`
--

CREATE TABLE `blog_category_to_store` (
  `blog_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_category_to_store`
--

INSERT INTO `blog_category_to_store` (`blog_category_id`, `store_id`) VALUES
(69, 0),
(70, 0),
(71, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) UNSIGNED NOT NULL,
  `api_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `noindex` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `noindex`, `date_added`, `date_modified`) VALUES
(17, 'catalog/demo_categories/5.jpg', 0, 1, 0, 4, 1, 1, '2009-01-03 21:08:57', '2018-11-16 13:38:48'),
(18, 'catalog/demo_categories/2.jpg', 0, 1, 0, 2, 1, 1, '2009-01-05 21:49:15', '2018-11-16 13:35:53'),
(20, 'catalog/demo_categories/1.jpg', 0, 1, 0, 1, 1, 1, '2009-01-05 21:49:43', '2019-01-23 22:14:21'),
(24, 'catalog/demo_categories/6.jpg', 0, 1, 0, 5, 1, 1, '2009-01-20 02:36:26', '2018-11-16 13:39:15'),
(25, 'catalog/demo_categories/3.jpg', 0, 1, 0, 3, 1, 1, '2009-01-31 01:04:25', '2018-11-16 13:36:23'),
(28, 'catalog/demo_categories/4.jpg', 25, 0, 0, 1, 1, 1, '2009-02-02 13:11:12', '2018-11-16 13:44:09'),
(29, 'catalog/demo_categories/1.jpg', 25, 0, 0, 1, 1, 1, '2009-02-02 13:11:37', '2018-11-16 13:43:42'),
(33, 'catalog/demo_categories/7.jpg', 0, 1, 0, 6, 1, 1, '2009-02-03 14:17:55', '2018-11-16 13:39:41'),
(34, 'catalog/demo_categories/8.jpg', 0, 1, 0, 7, 1, 1, '2009-02-03 14:18:11', '2018-11-16 13:40:05'),
(57, 'catalog/demo_categories/4.jpg', 0, 1, 0, 3, 1, 1, '2011-04-26 08:53:16', '2018-11-16 13:38:11');

-- --------------------------------------------------------

--
-- Table structure for table `category_description`
--

CREATE TABLE `category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `description_bottom` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_description`
--

INSERT INTO `category_description` (`category_id`, `language_id`, `name`, `description`, `description_bottom`, `meta_title`, `meta_description`, `meta_h1`) VALUES
(17, 2, 'Minima quos', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;Nam, aspernatur deserunt. Sunt blanditiis temporibus labore ex officiis corrupti alias iure quisquam aperiam corporis eaque tempore dolores ipsum, sint nesciunt iste laboriosam obcaecati quas cumque quidem maxime suscipit. Vitae!&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;Nam, aspernatur deserunt. Sunt blanditiis temporibus labore ex officiis corrupti alias iure quisquam aperiam corporis eaque tempore dolores ipsum, sint nesciunt iste laboriosam obcaecati quas cumque quidem maxime suscipit. Vitae!&lt;br&gt;Odit, facere totam magni in laboriosam, enim illum minus est, nihil nesciunt corrupti non exercitationem. Ut deleniti nostrum enim quod similique, voluptas ipsum voluptatum adipisci quam numquam dolore, totam recusandae?&lt;br&gt;Totam laudantium quam dolorum voluptatibus ipsam error reiciendis aliquam quia fuga recusandae magnam nostrum illo excepturi, doloremque sapiente nisi incidunt expedita cumque voluptatem corporis qui sequi eveniet molestias aut. Iure?&lt;br&gt;Odio veniam, sapiente nihil tempora cumque expedita repudiandae quis nulla accusantium asperiores totam illum dolore. Repudiandae aspernatur veritatis cupiditate distinctio eaque id! Reiciendis delectus dolore corporis ex est perspiciatis nam?&lt;br&gt;Earum, sint similique perferendis accusantium animi expedita nihil magni quo sed distinctio eveniet modi ut corrupti cum optio deserunt odio recusandae unde, fugit assumenda consequatur voluptate alias consectetur porro. Ipsa?&lt;br&gt;Ad quibusdam accusantium quam ex. Fuga delectus ipsam, quo sint repellendus maxime eos amet perferendis corrupti molestias dolor earum labore porro quos asperiores et quasi in! Corporis officia doloribus excepturi?&lt;br&gt;&lt;/p&gt;', 'Minima quos', 'Minima quos', 'Minima quos'),
(18, 2, 'Nihil tempora', '&lt;p&gt;\r\n	Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;Nam, aspernatur deserunt. Sunt blanditiis temporibus labore ex officiis corrupti alias iure quisquam aperiam corporis eaque tempore dolores ipsum, sint nesciunt iste laboriosam obcaecati quas cumque quidem maxime suscipit. Vitae!&lt;br&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;Nam, aspernatur deserunt. Sunt blanditiis temporibus labore ex officiis corrupti alias iure quisquam aperiam corporis eaque tempore dolores ipsum, sint nesciunt iste laboriosam obcaecati quas cumque quidem maxime suscipit. Vitae!&lt;br&gt;Odit, facere totam magni in laboriosam, enim illum minus est, nihil nesciunt corrupti non exercitationem. Ut deleniti nostrum enim quod similique, voluptas ipsum voluptatum adipisci quam numquam dolore, totam recusandae?&lt;br&gt;Totam laudantium quam dolorum voluptatibus ipsam error reiciendis aliquam quia fuga recusandae magnam nostrum illo excepturi, doloremque sapiente nisi incidunt expedita cumque voluptatem corporis qui sequi eveniet molestias aut. Iure?&lt;br&gt;Odio veniam, sapiente nihil tempora cumque expedita repudiandae quis nulla accusantium asperiores totam illum dolore. Repudiandae aspernatur veritatis cupiditate distinctio eaque id! Reiciendis delectus dolore corporis ex est perspiciatis nam?&lt;br&gt;Earum, sint similique perferendis accusantium animi expedita nihil magni quo sed distinctio eveniet modi ut corrupti cum optio deserunt odio recusandae unde, fugit assumenda consequatur voluptate alias consectetur porro. Ipsa?&lt;br&gt;Ad quibusdam accusantium quam ex. Fuga delectus ipsam, quo sint repellendus maxime eos amet perferendis corrupti molestias dolor earum labore porro quos asperiores et quasi in! Corporis officia doloribus excepturi?&lt;br&gt;&lt;/p&gt;', 'Nihil tempora', 'Nihil tempora', 'Nihil tempora'),
(20, 2, 'Quia maioresa', '&lt;p&gt;\r\n	Lorem ipsum dolor, sit amet consectetur adipisicing elit. Mollitia inventore molestias labore, sequi quaerat illum libero possimus, excepturi repellat nulla consequuntur nihil. Tempora, neque sit dignissimos quo minus iure dolorum?&lt;br&gt;Perferendis pariatur provident quae omnis, cupiditate aliquid aspernatur vel harum, maiores doloribus iure placeat numquam impedit? Delectus nemo, laudantium animi nesciunt voluptas minima fugit aliquid harum voluptate inventore modi facilis.&lt;br&gt;Suscipit doloribus, minima aut ducimus obcaecati a quibusdam quod optio voluptatibus commodi reiciendis accusamus aspernatur, consequatur ea voluptate nostrum minus ullam. Ipsam velit officiis aliquid cupiditate voluptatibus rem soluta veniam?&lt;br&gt;Amet fugiat architecto excepturi nam, praesentium aliquid beatae? Molestiae autem odit, nostrum fuga dignissimos omnis similique, a, debitis exercitationem ut culpa ipsa? Delectus non eveniet, maxime modi amet vitae aspernatur.&lt;br&gt;Nobis incidunt neque ab rem illo porro unde accusamus ea debitis esse exercitationem amet molestiae, vero, doloremque dicta quisquam. Quia, neque. Nesciunt est amet exercitationem assumenda ducimus ratione. Cumque, soluta!&lt;br&gt;Nihil, ad! Sint aperiam atque earum temporibus, repellendus, magnam quam esse fugiat aliquid at repudiandae omnis cupiditate illum, sit molestiae! Ut, sunt ullam? Blanditiis amet praesentium molestias eius, adipisci perferendis?&lt;br&gt;Sapiente, aperiam a, corporis quaerat eum in facilis tenetur tempora ipsam possimus rem esse alias ullam amet vitae, itaque laborum aliquam nobis incidunt voluptas quidem? Tempora dolore blanditiis eius quas?&lt;br&gt;Beatae, odio labore esse ullam sed tempore aliquid saepe libero et optio earum, inventore eveniet enim quibusdam sit cupiditate dolores sint architecto voluptate! Neque omnis nostrum aliquid, quisquam incidunt atque.&lt;br&gt;Asperiores placeat blanditiis magnam? Aut praesentium laborum accusantium iusto! Incidunt animi sed, a nemo similique hic quis nulla, pariatur fugit, ut eius! Et eveniet, ullam sequi sint non unde vero!&lt;br&gt;Aliquam officia obcaecati modi rem totam quisquam autem molestiae suscipit, ratione adipisci dolore qui voluptatum asperiores similique aut eaque mollitia explicabo nobis illum, vitae impedit sint minima nulla quidem. Vel?&lt;br&gt;&lt;br&gt;&lt;/p&gt;\r\n', '&lt;p&gt;Lorem ipsum dolor, sit amet consectetur adipisicing elit. Mollitia inventore molestias labore, sequi quaerat illum libero possimus, excepturi repellat nulla consequuntur nihil. Tempora, neque sit dignissimos quo minus iure dolorum?&lt;br&gt;Perferendis pariatur provident quae omnis, cupiditate aliquid aspernatur vel harum, maiores doloribus iure placeat numquam impedit? Delectus nemo, laudantium animi nesciunt voluptas minima fugit aliquid harum voluptate inventore modi facilis.&lt;br&gt;Suscipit doloribus, minima aut ducimus obcaecati a quibusdam quod optio voluptatibus commodi reiciendis accusamus aspernatur, consequatur ea voluptate nostrum minus ullam. Ipsam velit officiis aliquid cupiditate voluptatibus rem soluta veniam?&lt;br&gt;Amet fugiat architecto excepturi nam, praesentium aliquid beatae? Molestiae autem odit, nostrum fuga dignissimos omnis similique, a, debitis exercitationem ut culpa ipsa? Delectus non eveniet, maxime modi amet vitae aspernatur.&lt;br&gt;Nobis incidunt neque ab rem illo porro unde accusamus ea debitis esse exercitationem amet molestiae, vero, doloremque dicta quisquam. Quia, neque. Nesciunt est amet exercitationem assumenda ducimus ratione. Cumque, soluta!&lt;br&gt;Nihil, ad! Sint aperiam atque earum temporibus, repellendus, magnam quam esse fugiat aliquid at repudiandae omnis cupiditate illum, sit molestiae! Ut, sunt ullam? Blanditiis amet praesentium molestias eius, adipisci perferendis?&lt;br&gt;Sapiente, aperiam a, corporis quaerat eum in facilis tenetur tempora ipsam possimus rem esse alias ullam amet vitae, itaque laborum aliquam nobis incidunt voluptas quidem? Tempora dolore blanditiis eius quas?&lt;br&gt;Beatae, odio labore esse ullam sed tempore aliquid saepe libero et optio earum, inventore eveniet enim quibusdam sit cupiditate dolores sint architecto voluptate! Neque omnis nostrum aliquid, quisquam incidunt atque.&lt;br&gt;Asperiores placeat blanditiis magnam? Aut praesentium laborum accusantium iusto! Incidunt animi sed, a nemo similique hic quis nulla, pariatur fugit, ut eius! Et eveniet, ullam sequi sint non unde vero!&lt;br&gt;Aliquam officia obcaecati modi rem totam quisquam autem molestiae suscipit, ratione adipisci dolore qui voluptatum asperiores similique aut eaque mollitia explicabo nobis illum, vitae impedit sint minima nulla quidem. Vel?&lt;br&gt;&lt;/p&gt;', 'Quia maiores', 'Quia maiores', 'Quia maiores'),
(24, 2, 'Repellendus quod', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;Nam, aspernatur deserunt. Sunt blanditiis temporibus labore ex officiis corrupti alias iure quisquam aperiam corporis eaque tempore dolores ipsum, sint nesciunt iste laboriosam obcaecati quas cumque quidem maxime suscipit. Vitae!&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;Nam, aspernatur deserunt. Sunt blanditiis temporibus labore ex officiis corrupti alias iure quisquam aperiam corporis eaque tempore dolores ipsum, sint nesciunt iste laboriosam obcaecati quas cumque quidem maxime suscipit. Vitae!&lt;br&gt;Odit, facere totam magni in laboriosam, enim illum minus est, nihil nesciunt corrupti non exercitationem. Ut deleniti nostrum enim quod similique, voluptas ipsum voluptatum adipisci quam numquam dolore, totam recusandae?&lt;br&gt;Totam laudantium quam dolorum voluptatibus ipsam error reiciendis aliquam quia fuga recusandae magnam nostrum illo excepturi, doloremque sapiente nisi incidunt expedita cumque voluptatem corporis qui sequi eveniet molestias aut. Iure?&lt;br&gt;Odio veniam, sapiente nihil tempora cumque expedita repudiandae quis nulla accusantium asperiores totam illum dolore. Repudiandae aspernatur veritatis cupiditate distinctio eaque id! Reiciendis delectus dolore corporis ex est perspiciatis nam?&lt;br&gt;Earum, sint similique perferendis accusantium animi expedita nihil magni quo sed distinctio eveniet modi ut corrupti cum optio deserunt odio recusandae unde, fugit assumenda consequatur voluptate alias consectetur porro. Ipsa?&lt;br&gt;Ad quibusdam accusantium quam ex. Fuga delectus ipsam, quo sint repellendus maxime eos amet perferendis corrupti molestias dolor earum labore porro quos asperiores et quasi in! Corporis officia doloribus excepturi?&lt;br&gt;&lt;/p&gt;', 'Repellendus quod', 'Repellendus quod', 'Repellendus quod'),
(25, 2, 'Nulla deleniti', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;Nam, aspernatur deserunt. Sunt blanditiis temporibus labore ex officiis corrupti alias iure quisquam aperiam corporis eaque tempore dolores ipsum, sint nesciunt iste laboriosam obcaecati quas cumque quidem maxime suscipit. Vitae!&lt;br&gt;Odit, facere totam magni in laboriosam, enim illum minus est, nihil nesciunt corrupti non exercitationem. Ut deleniti nostrum enim quod similique, voluptas ipsum voluptatum adipisci quam numquam dolore, totam recusandae?&lt;br&gt;Totam laudantium quam dolorum voluptatibus ipsam error reiciendis aliquam quia fuga recusandae magnam nostrum illo excepturi, doloremque sapiente nisi incidunt expedita cumque voluptatem corporis qui sequi eveniet molestias aut. Iure?&lt;br&gt;Odio veniam, sapiente nihil tempora cumque expedita repudiandae quis nulla accusantium asperiores totam illum dolore. Repudiandae aspernatur veritatis cupiditate distinctio eaque id! Reiciendis delectus dolore corporis ex est perspiciatis nam?&lt;br&gt;Earum, sint similique perferendis accusantium animi expedita nihil magni quo sed distinctio eveniet modi ut corrupti cum optio deserunt odio recusandae unde, fugit assumenda consequatur voluptate alias consectetur porro. Ipsa?&lt;br&gt;Ad quibusdam accusantium quam ex. Fuga delectus ipsam, quo sint repellendus maxime eos amet perferendis corrupti molestias dolor earum labore porro quos asperiores et quasi in! Corporis officia doloribus excepturi?&lt;br&gt;&lt;/p&gt;', 'Nulla deleniti', 'Nulla deleniti', 'Nulla deleniti'),
(28, 2, 'Officiis corrupti', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;Nam, aspernatur deserunt. Sunt blanditiis temporibus labore ex officiis corrupti alias iure quisquam aperiam corporis eaque tempore dolores ipsum, sint nesciunt iste laboriosam obcaecati quas cumque quidem maxime suscipit. Vitae!&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;Nam, aspernatur deserunt. Sunt blanditiis temporibus labore ex officiis corrupti alias iure quisquam aperiam corporis eaque tempore dolores ipsum, sint nesciunt iste laboriosam obcaecati quas cumque quidem maxime suscipit. Vitae!&lt;br&gt;Odit, facere totam magni in laboriosam, enim illum minus est, nihil nesciunt corrupti non exercitationem. Ut deleniti nostrum enim quod similique, voluptas ipsum voluptatum adipisci quam numquam dolore, totam recusandae?&lt;br&gt;Totam laudantium quam dolorum voluptatibus ipsam error reiciendis aliquam quia fuga recusandae magnam nostrum illo excepturi, doloremque sapiente nisi incidunt expedita cumque voluptatem corporis qui sequi eveniet molestias aut. Iure?&lt;br&gt;Odio veniam, sapiente nihil tempora cumque expedita repudiandae quis nulla accusantium asperiores totam illum dolore. Repudiandae aspernatur veritatis cupiditate distinctio eaque id! Reiciendis delectus dolore corporis ex est perspiciatis nam?&lt;br&gt;Earum, sint similique perferendis accusantium animi expedita nihil magni quo sed distinctio eveniet modi ut corrupti cum optio deserunt odio recusandae unde, fugit assumenda consequatur voluptate alias consectetur porro. Ipsa?&lt;br&gt;Ad quibusdam accusantium quam ex. Fuga delectus ipsam, quo sint repellendus maxime eos amet perferendis corrupti molestias dolor earum labore porro quos asperiores et quasi in! Corporis officia doloribus excepturi?&lt;br&gt;&lt;/p&gt;', 'Officiis corrupti', 'Officiis corrupti', 'Officiis corrupti'),
(29, 2, 'Sint nesciunt', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;Nam, aspernatur deserunt. Sunt blanditiis temporibus labore ex officiis corrupti alias iure quisquam aperiam corporis eaque tempore dolores ipsum, sint nesciunt iste laboriosam obcaecati quas cumque quidem maxime suscipit. Vitae!&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;Nam, aspernatur deserunt. Sunt blanditiis temporibus labore ex officiis corrupti alias iure quisquam aperiam corporis eaque tempore dolores ipsum, sint nesciunt iste laboriosam obcaecati quas cumque quidem maxime suscipit. Vitae!&lt;br&gt;Odit, facere totam magni in laboriosam, enim illum minus est, nihil nesciunt corrupti non exercitationem. Ut deleniti nostrum enim quod similique, voluptas ipsum voluptatum adipisci quam numquam dolore, totam recusandae?&lt;br&gt;Totam laudantium quam dolorum voluptatibus ipsam error reiciendis aliquam quia fuga recusandae magnam nostrum illo excepturi, doloremque sapiente nisi incidunt expedita cumque voluptatem corporis qui sequi eveniet molestias aut. Iure?&lt;br&gt;Odio veniam, sapiente nihil tempora cumque expedita repudiandae quis nulla accusantium asperiores totam illum dolore. Repudiandae aspernatur veritatis cupiditate distinctio eaque id! Reiciendis delectus dolore corporis ex est perspiciatis nam?&lt;br&gt;Earum, sint similique perferendis accusantium animi expedita nihil magni quo sed distinctio eveniet modi ut corrupti cum optio deserunt odio recusandae unde, fugit assumenda consequatur voluptate alias consectetur porro. Ipsa?&lt;br&gt;Ad quibusdam accusantium quam ex. Fuga delectus ipsam, quo sint repellendus maxime eos amet perferendis corrupti molestias dolor earum labore porro quos asperiores et quasi in! Corporis officia doloribus excepturi?&lt;br&gt;&lt;/p&gt;', 'Sint nesciunt', 'Sint nesciunt', 'Sint nesciunt'),
(33, 2, 'Nesciunt corrupti', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;Nam, aspernatur deserunt. Sunt blanditiis temporibus labore ex officiis corrupti alias iure quisquam aperiam corporis eaque tempore dolores ipsum, sint nesciunt iste laboriosam obcaecati quas cumque quidem maxime suscipit. Vitae!&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;Nam, aspernatur deserunt. Sunt blanditiis temporibus labore ex officiis corrupti alias iure quisquam aperiam corporis eaque tempore dolores ipsum, sint nesciunt iste laboriosam obcaecati quas cumque quidem maxime suscipit. Vitae!&lt;br&gt;Odit, facere totam magni in laboriosam, enim illum minus est, nihil nesciunt corrupti non exercitationem. Ut deleniti nostrum enim quod similique, voluptas ipsum voluptatum adipisci quam numquam dolore, totam recusandae?&lt;br&gt;Totam laudantium quam dolorum voluptatibus ipsam error reiciendis aliquam quia fuga recusandae magnam nostrum illo excepturi, doloremque sapiente nisi incidunt expedita cumque voluptatem corporis qui sequi eveniet molestias aut. Iure?&lt;br&gt;Odio veniam, sapiente nihil tempora cumque expedita repudiandae quis nulla accusantium asperiores totam illum dolore. Repudiandae aspernatur veritatis cupiditate distinctio eaque id! Reiciendis delectus dolore corporis ex est perspiciatis nam?&lt;br&gt;Earum, sint similique perferendis accusantium animi expedita nihil magni quo sed distinctio eveniet modi ut corrupti cum optio deserunt odio recusandae unde, fugit assumenda consequatur voluptate alias consectetur porro. Ipsa?&lt;br&gt;Ad quibusdam accusantium quam ex. Fuga delectus ipsam, quo sint repellendus maxime eos amet perferendis corrupti molestias dolor earum labore porro quos asperiores et quasi in! Corporis officia doloribus excepturi?&lt;br&gt;&lt;/p&gt;', 'Nesciunt corrupti', 'Nesciunt corrupti', 'Nesciunt corrupti'),
(34, 2, 'Illum minus', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;Nam, aspernatur deserunt. Sunt blanditiis temporibus labore ex officiis corrupti alias iure quisquam aperiam corporis eaque tempore dolores ipsum, sint nesciunt iste laboriosam obcaecati quas cumque quidem maxime suscipit. Vitae!&lt;br&gt;Odit, facere totam magni in laboriosam, enim illum minus est, nihil nesciunt corrupti non exercitationem. Ut deleniti nostrum enim quod similique, voluptas ipsum voluptatum adipisci quam numquam dolore, totam recusandae?&lt;br&gt;Totam laudantium quam dolorum voluptatibus ipsam error reiciendis aliquam quia fuga recusandae magnam nostrum illo excepturi, doloremque sapiente nisi incidunt expedita cumque voluptatem corporis qui sequi eveniet molestias aut. Iure?&lt;br&gt;Odio veniam, sapiente nihil tempora cumque expedita repudiandae quis nulla accusantium asperiores totam illum dolore. Repudiandae aspernatur veritatis cupiditate distinctio eaque id! Reiciendis delectus dolore corporis ex est perspiciatis nam?&lt;br&gt;Earum, sint similique perferendis accusantium animi expedita nihil magni quo sed distinctio eveniet modi ut corrupti cum optio deserunt odio recusandae unde, fugit assumenda consequatur voluptate alias consectetur porro. Ipsa?&lt;br&gt;Ad quibusdam accusantium quam ex. Fuga delectus ipsam, quo sint repellendus maxime eos amet perferendis corrupti molestias dolor earum labore porro quos asperiores et quasi in! Corporis officia doloribus excepturi?&lt;br&gt;&lt;/p&gt;', 'Illum minus', 'Illum minus', 'Illum minus'),
(57, 2, 'Vitae possimus', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;Nam, aspernatur deserunt. Sunt blanditiis temporibus labore ex officiis corrupti alias iure quisquam aperiam corporis eaque tempore dolores ipsum, sint nesciunt iste laboriosam obcaecati quas cumque quidem maxime suscipit. Vitae!&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?&lt;br&gt;Consequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!&lt;br&gt;Obcaecati voluptatem aliquam, dolorum tempore quo quia reiciendis ipsum? Vitae possimus aspernatur itaque, nam eos, dolore eaque tempora facilis nisi cumque quia maiores voluptatem. Ratione, enim! Eius debitis error dolore.&lt;br&gt;Eos est sequi temporibus laborum at dignissimos illum saepe recusandae, repellendus quod inventore sed dicta illo incidunt beatae tempore, et reiciendis ipsa rem quae porro nihil, voluptates quam. Quasi, provident.&lt;br&gt;Nam, aspernatur deserunt. Sunt blanditiis temporibus labore ex officiis corrupti alias iure quisquam aperiam corporis eaque tempore dolores ipsum, sint nesciunt iste laboriosam obcaecati quas cumque quidem maxime suscipit. Vitae!&lt;br&gt;Odit, facere totam magni in laboriosam, enim illum minus est, nihil nesciunt corrupti non exercitationem. Ut deleniti nostrum enim quod similique, voluptas ipsum voluptatum adipisci quam numquam dolore, totam recusandae?&lt;br&gt;Totam laudantium quam dolorum voluptatibus ipsam error reiciendis aliquam quia fuga recusandae magnam nostrum illo excepturi, doloremque sapiente nisi incidunt expedita cumque voluptatem corporis qui sequi eveniet molestias aut. Iure?&lt;br&gt;Odio veniam, sapiente nihil tempora cumque expedita repudiandae quis nulla accusantium asperiores totam illum dolore. Repudiandae aspernatur veritatis cupiditate distinctio eaque id! Reiciendis delectus dolore corporis ex est perspiciatis nam?&lt;br&gt;Earum, sint similique perferendis accusantium animi expedita nihil magni quo sed distinctio eveniet modi ut corrupti cum optio deserunt odio recusandae unde, fugit assumenda consequatur voluptate alias consectetur porro. Ipsa?&lt;br&gt;Ad quibusdam accusantium quam ex. Fuga delectus ipsam, quo sint repellendus maxime eos amet perferendis corrupti molestias dolor earum labore porro quos asperiores et quasi in! Corporis officia doloribus excepturi?&lt;br&gt;&lt;/p&gt;', 'Vitae possimus', 'Vitae possimus', 'Vitae possimus');

-- --------------------------------------------------------

--
-- Table structure for table `category_filter`
--

CREATE TABLE `category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category_path`
--

CREATE TABLE `category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_path`
--

INSERT INTO `category_path` (`category_id`, `path_id`, `level`) VALUES
(17, 17, 0),
(18, 18, 0),
(20, 20, 0),
(24, 24, 0),
(25, 25, 0),
(28, 25, 0),
(28, 28, 1),
(29, 25, 0),
(29, 29, 1),
(33, 33, 0),
(34, 34, 0),
(57, 57, 0);

-- --------------------------------------------------------

--
-- Table structure for table `category_to_layout`
--

CREATE TABLE `category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_to_layout`
--

INSERT INTO `category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(17, 0, 0),
(18, 0, 0),
(20, 0, 0),
(24, 0, 0),
(25, 0, 0),
(28, 0, 0),
(29, 0, 0),
(33, 0, 0),
(34, 0, 0),
(57, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `category_to_store`
--

CREATE TABLE `category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_to_store`
--

INSERT INTO `category_to_store` (`category_id`, `store_id`) VALUES
(17, 0),
(18, 0),
(20, 0),
(24, 0),
(25, 0),
(28, 0),
(29, 0),
(33, 0),
(34, 0),
(57, 0);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Армения', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Азербайджан', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Белоруссия (Беларусь)', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D\'Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TL', 'TLS', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Грузия', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Казахстан', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'South Korea', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Киргизия (Кыргызстан)', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People\'s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Молдова', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Российская Федерация', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Таджикистан', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Туркменистан', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Украина', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Узбекистан', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 1),
(243, 'Serbia', 'RS', 'SRB', '', 0, 1),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 1),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 1),
(246, 'Curacao', 'CW', 'CUW', '', 0, 1),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 1),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 1),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 1),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 1),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 1),
(252, 'Ascension Island (British)', 'AC', 'ASC', '', 0, 1),
(253, 'Kosovo, Republic of', 'XK', 'UNK', '', 0, 1),
(254, 'Isle of Man', 'IM', 'IMN', '', 0, 1),
(255, 'Tristan da Cunha', 'TA', 'SHN', '', 0, 1),
(256, 'Guernsey', 'GG', 'GGY', '', 0, 1),
(257, 'Jersey', 'JE', 'JEY', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `currency_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Pound Sterling', 'GBP', '£ ', '', '2', 0.80269998, 1, '2018-09-25 16:52:24'),
(2, 'US Dollar', 'USD', '$ ', '', '2', 1.00000000, 1, '2018-09-25 21:40:22'),
(3, 'Euro', 'EUR', '', ' €', '2', 0.94660002, 1, '2018-09-25 16:52:16'),
(4, 'Гривна', 'UAH', '', ' грн.', '2', 1.00000000, 1, '2019-01-31 22:35:39'),
(5, 'Рубль', 'RUB', '', ' р.', '2', 58.45199966, 1, '2018-09-25 16:52:47');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer_group`
--

CREATE TABLE `customer_group` (
  `customer_group_id` int(11) NOT NULL,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_group`
--

INSERT INTO `customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1),
(2, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_group_description`
--

CREATE TABLE `customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_group_description`
--

INSERT INTO `customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(2, 2, 'default', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `customer_history`
--

CREATE TABLE `customer_history` (
  `customer_history_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer_ip`
--

CREATE TABLE `customer_ip` (
  `customer_ip_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer_login`
--

CREATE TABLE `customer_login` (
  `customer_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer_reward`
--

CREATE TABLE `customer_reward` (
  `customer_reward_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer_transaction`
--

CREATE TABLE `customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `custommenu`
--

CREATE TABLE `custommenu` (
  `custommenu_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `columns` int(3) NOT NULL,
  `custommenu_type` varchar(20) NOT NULL,
  `status` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `custommenu`
--

INSERT INTO `custommenu` (`custommenu_id`, `sort_order`, `columns`, `custommenu_type`, `status`) VALUES
(9, 1, 1, 'product', 1),
(14, 9, 1, 'custom', 1),
(17, 1, 1, 'manufacturer', 1),
(30, 11, 1, 'information', 1),
(31, 12, 1, 'custom', 1),
(35, 1, 1, 'manufacturer', 1),
(36, 1, 1, 'manufacturer', 1),
(37, 1, 1, 'manufacturer', 1),
(38, 1, 1, 'manufacturer', 1),
(39, 1, 1, 'manufacturer', 1),
(41, 1, 1, 'custom', 1),
(44, 1, 1, 'custom', 1),
(49, 1, 1, 'custom', 1),
(51, 1, 1, 'custom', 1),
(53, 10, 3, 'custom', 1),
(65, 1, 1, 'category', 1),
(67, 2, 1, 'category', 1),
(68, 3, 1, 'category', 1),
(69, 4, 1, 'category', 1),
(76, 5, 1, 'category', 1),
(77, 6, 1, 'category', 1),
(78, 7, 1, 'category', 1),
(79, 8, 1, 'category', 1);

-- --------------------------------------------------------

--
-- Table structure for table `custommenu_child`
--

CREATE TABLE `custommenu_child` (
  `custommenu_child_id` int(11) NOT NULL,
  `custommenu_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `custommenu_type` varchar(20) NOT NULL,
  `status` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `custommenu_child`
--

INSERT INTO `custommenu_child` (`custommenu_child_id`, `custommenu_id`, `sort_order`, `custommenu_type`, `status`) VALUES
(41, 24, 1, 'category', 1),
(42, 24, 2, 'category', 1),
(81, 68, 1, 'category', 1),
(82, 68, 1, '', 1),
(83, 68, 2, 'category', 1),
(84, 53, 4, 'manufacturer', 1),
(85, 53, 5, 'manufacturer', 1),
(86, 14, 2, '', 1),
(87, 53, 2, 'manufacturer', 1),
(88, 14, 2, '', 1),
(89, 14, 3, '', 1),
(90, 53, 3, 'manufacturer', 1),
(91, 14, 2, '', 1),
(92, 14, 3, '', 1),
(93, 14, 4, '', 1),
(94, 14, 1, '', 1),
(95, 53, 6, 'manufacturer', 1),
(96, 14, 3, '', 1),
(97, 14, 4, '', 1),
(98, 14, 5, '', 1),
(99, 14, 1, '', 1),
(100, 14, 2, '', 1),
(101, 53, 1, 'manufacturer', 1),
(102, 14, 4, '', 1),
(103, 14, 5, '', 1),
(104, 14, 6, '', 1),
(105, 14, 1, '', 1),
(106, 14, 2, '', 1),
(107, 14, 3, '', 1),
(108, 14, 4, '', 1),
(109, 14, 5, '', 1),
(110, 53, 1, '', 1),
(111, 14, 1, '', 1),
(112, 14, 2, '', 1),
(113, 14, 3, '', 1),
(114, 14, 4, '', 1),
(115, 53, 1, '', 1),
(116, 53, 2, '', 1),
(117, 14, 1, '', 1),
(118, 14, 2, '', 1),
(119, 14, 3, '', 1),
(120, 53, 1, '', 1),
(121, 53, 2, '', 1),
(122, 53, 3, '', 1),
(123, 14, 1, '', 1),
(124, 14, 2, '', 1),
(125, 53, 1, '', 1),
(126, 53, 2, '', 1),
(127, 53, 3, '', 1),
(128, 53, 4, '', 1),
(129, 14, 1, '', 1),
(130, 53, 1, '', 1),
(131, 53, 2, '', 1),
(132, 53, 3, '', 1),
(133, 53, 4, '', 1),
(134, 53, 5, '', 1),
(135, 53, 1, '', 1),
(136, 53, 2, '', 1),
(137, 53, 3, '', 1),
(138, 53, 4, '', 1),
(139, 53, 5, '', 1),
(140, 53, 6, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `custommenu_child_description`
--

CREATE TABLE `custommenu_child_description` (
  `custommenu_child_id` int(11) NOT NULL,
  `custommenu_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL DEFAULT '',
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `custommenu_child_description`
--

INSERT INTO `custommenu_child_description` (`custommenu_child_id`, `custommenu_id`, `name`, `link`, `language_id`) VALUES
(41, 24, 'Mac', '27', 2),
(42, 24, 'PC', '26', 2),
(53, 0, 'Phones &amp; PDAs', '24', 2),
(81, 68, 'Sint nesciunt', '29', 2),
(83, 68, 'Officiis corrupti', '28', 2),
(84, 53, 'Quos', '6', 2),
(85, 53, 'Deleniti', '7', 2),
(87, 53, 'Maiores', '8', 2),
(90, 53, 'Corrupti', '10', 2),
(95, 53, 'Possimus', '5', 2),
(101, 53, 'Tempora', '9', 2);

-- --------------------------------------------------------

--
-- Table structure for table `custommenu_child_to_store`
--

CREATE TABLE `custommenu_child_to_store` (
  `custommenu_child_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `custommenu_child_to_store`
--

INSERT INTO `custommenu_child_to_store` (`custommenu_child_id`, `store_id`) VALUES
(2, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(29, 0),
(32, 0),
(33, 0),
(37, 0),
(41, 0),
(42, 0),
(45, 0),
(77, 0),
(81, 0),
(83, 0),
(84, 0),
(85, 0),
(87, 0),
(90, 0),
(95, 0),
(101, 0);

-- --------------------------------------------------------

--
-- Table structure for table `custommenu_description`
--

CREATE TABLE `custommenu_description` (
  `custommenu_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL DEFAULT '',
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `custommenu_description`
--

INSERT INTO `custommenu_description` (`custommenu_id`, `name`, `link`, `language_id`) VALUES
(14, 'Special', 'product/special', 2),
(24, 'Desktops', '20', 2),
(26, 'PC', '', 2),
(30, 'About Us', '4', 2),
(31, 'Contact Us', 'information/contact', 2),
(37, 'Apple', '8', 0),
(38, 'Apple', '8', 0),
(53, 'Brand', 'product/manufacturer', 2),
(65, 'Quia maiores', '20', 2),
(67, 'Nihil tempora', '18', 2),
(68, 'Nulla deleniti', '25', 2),
(69, 'Vitae possimus', '57', 2),
(76, 'Minima quos', '17', 2),
(77, 'Repellendus quod', '24', 2),
(78, 'Nesciunt corrupti', '33', 2),
(79, 'Illum minus', '34', 2);

-- --------------------------------------------------------

--
-- Table structure for table `custommenu_to_store`
--

CREATE TABLE `custommenu_to_store` (
  `custommenu_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `custommenu_to_store`
--

INSERT INTO `custommenu_to_store` (`custommenu_id`, `store_id`) VALUES
(9, 0),
(14, 0),
(17, 0),
(30, 0),
(31, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(41, 0),
(44, 0),
(49, 0),
(51, 0),
(53, 0),
(65, 0),
(67, 0),
(68, 0),
(69, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0);

-- --------------------------------------------------------

--
-- Table structure for table `custom_field`
--

CREATE TABLE `custom_field` (
  `custom_field_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_customer_group`
--

CREATE TABLE `custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_description`
--

CREATE TABLE `custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_value`
--

CREATE TABLE `custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_value_description`
--

CREATE TABLE `custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `download`
--

CREATE TABLE `download` (
  `download_id` int(11) NOT NULL,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `download`
--

INSERT INTO `download` (`download_id`, `filename`, `mask`, `date_added`) VALUES
(1, 'flag-ukraine.png.Pd2abs6qFq72O2vcUJJUgmwtNzGCzeGJ', 'flag-ukraine.png', '2018-12-19 00:15:18');

-- --------------------------------------------------------

--
-- Table structure for table `download_description`
--

CREATE TABLE `download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `download_description`
--

INSERT INTO `download_description` (`download_id`, `language_id`, `name`) VALUES
(1, 2, 'test download');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `extension`
--

CREATE TABLE `extension` (
  `extension_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `extension`
--

INSERT INTO `extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(17, 'payment', 'free_checkout'),
(20, 'theme', 'theme_default'),
(21, 'dashboard', 'activity'),
(22, 'dashboard', 'sale'),
(23, 'dashboard', 'recent'),
(24, 'dashboard', 'order'),
(25, 'dashboard', 'online'),
(26, 'dashboard', 'map'),
(27, 'dashboard', 'customer'),
(28, 'dashboard', 'chart'),
(31, 'module', 'slideshow'),
(34, 'module', 'cachemanager'),
(42, 'module', 'blocksforallcategories'),
(44, 'module', 'random'),
(46, 'captcha', 'basic_captcha'),
(48, 'module', 'popular'),
(49, 'module', 'html'),
(50, 'module', 'blog_latest'),
(51, 'module', 'latest'),
(52, 'module', 'special'),
(54, 'module', 'specialpercategory'),
(55, 'total', 'reward'),
(57, 'module', 'featured'),
(58, 'module', 'latestpercategory'),
(59, 'module', 'custom_template');

-- --------------------------------------------------------

--
-- Table structure for table `filter`
--

CREATE TABLE `filter` (
  `filter_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `filter_description`
--

CREATE TABLE `filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `filter_group`
--

CREATE TABLE `filter_group` (
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `filter_group_description`
--

CREATE TABLE `filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `geo_zone`
--

CREATE TABLE `geo_zone` (
  `geo_zone_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `geo_zone`
--

INSERT INTO `geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25'),
(4, 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `information`
--

CREATE TABLE `information` (
  `information_id` int(11) NOT NULL,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `noindex` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `information`
--

INSERT INTO `information` (`information_id`, `bottom`, `sort_order`, `status`, `noindex`) VALUES
(3, 1, 3, 1, 1),
(4, 1, 1, 1, 1),
(5, 1, 4, 1, 1),
(6, 1, 2, 1, 1),
(7, 1, 10, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `information_description`
--

CREATE TABLE `information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `information_description`
--

INSERT INTO `information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_h1`) VALUES
(3, 2, 'Privacy Policy', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta rem aut laborum perferendis, in voluptate molestiae, repudiandae corrupti aperiam eos fuga similique magnam. Possimus illo quos sit ipsum quia quod?&lt;/span&gt;&lt;br&gt;Ipsa et voluptatum at veniam doloremque delectus explicabo. Dolores aliquam non mollitia hic earum enim similique expedita atque vel, molestiae sit voluptate accusantium natus quasi vitae, labore deserunt modi itaque.&lt;br&gt;Aspernatur excepturi voluptates unde officiis repudiandae at voluptatum libero, ex labore. Ipsum, quos velit? A suscipit consequuntur debitis, quia accusantium ratione eius quo, architecto, molestiae at eligendi dolorum voluptatum quidem?&lt;br&gt;Minima dolore velit pariatur voluptas deleniti qui quis dolores ipsam cupiditate hic nam similique, laudantium ullam asperiores ut? Saepe corporis ipsam provident nihil tenetur deleniti iste consequatur optio id. Consequuntur!&lt;br&gt;Veritatis libero aperiam ullam dolore eveniet labore delectus porro! Possimus vero provident ea libero officiis ut consequatur illo quidem in a, magnam obcaecati sunt commodi iure. Consectetur velit aperiam ullam!&lt;br&gt;Quaerat magni vitae reprehenderit placeat doloremque similique iusto aliquam, necessitatibus deleniti debitis! Provident repudiandae accusantium at nemo, nisi magnam labore cum hic ipsa iusto voluptates inventore temporibus dolor ratione sapiente.&lt;br&gt;Dolore nesciunt placeat repellat! Animi quos pariatur asperiores impedit necessitatibus sunt quasi cupiditate corrupti sapiente, nobis cumque rem inventore vero perspiciatis dolorem minima iure illum? Nulla possimus quo expedita rem.&lt;br&gt;Voluptates quia voluptatem eum maxime totam doloribus, quasi error? Itaque dolor suscipit sit soluta quas omnis, quasi harum veritatis magnam. Error delectus suscipit rem ut voluptates? Quae eveniet rem quas.&lt;br&gt;Vero fugit veritatis similique fugiat quod, culpa sapiente tempore beatae at? Omnis nisi tempore, officiis quis soluta iste. Omnis voluptates deleniti veniam voluptate soluta? At eum deleniti similique distinctio quibusdam?&lt;br&gt;Nam ducimus rerum corrupti cum et deleniti sint quod culpa magnam non eum, amet sit at numquam accusantium voluptatum quam explicabo pariatur. Facilis inventore delectus corrupti assumenda amet autem dicta.&lt;br&gt;Culpa doloremque accusantium iste ratione iusto voluptates, consequuntur tempore fuga. Reprehenderit magnam nihil ipsam vel libero facilis porro commodi, laboriosam totam molestias officiis sit dicta optio tempora magni soluta assumenda.&lt;br&gt;Aliquid atque eos, sint amet quis blanditiis distinctio ea veritatis porro ut aspernatur quas, suscipit quidem recusandae, sed praesentium adipisci minus tempore saepe facere. Fugit error fugiat soluta quam necessitatibus.&lt;br&gt;Ullam quisquam amet ad eligendi ducimus eveniet ipsa eum natus reiciendis praesentium voluptas laudantium culpa, dolorum explicabo aliquid, doloremque quas optio facere unde est? Voluptas error vitae soluta accusantium ab.&lt;br&gt;Consequuntur reprehenderit ab qui facilis facere rerum minima alias libero magnam! Molestiae, porro! Ipsum alias consequatur cumque officia. Et perspiciatis, numquam nulla corporis laboriosam nemo eos quia magnam vitae aliquam?&lt;br&gt;Consequatur cumque voluptatibus porro eligendi, sed magnam quia quidem, temporibus sint exercitationem reprehenderit illo recusandae eius ut magni ullam odit, libero molestias cum. Fugit dignissimos praesentium ex illum quod architecto.&lt;br&gt;Facilis iste ab sequi mollitia quasi necessitatibus repellendus provident magni id facere quis magnam pariatur, ratione porro amet quibusdam eligendi hic tempora nesciunt sapiente minus sed asperiores. Delectus, quasi placeat.&lt;br&gt;Dolor laboriosam molestias eaque commodi nostrum ipsum perspiciatis blanditiis autem reiciendis est nemo libero, eveniet tempore porro sapiente nam laudantium maiores! Laudantium totam earum sit quia exercitationem mollitia omnis praesentium.&lt;br&gt;Placeat, natus odit, quisquam aliquid nemo incidunt nam rerum voluptatem molestias similique cumque deserunt. Libero, esse! Ipsum architecto consequatur sapiente animi tempora, ex quis ipsa eum cupiditate culpa explicabo amet.&lt;br&gt;Quidem nemo architecto corrupti amet commodi id minima quis, ullam placeat suscipit labore odio porro a ut voluptatibus consectetur distinctio repellendus. Quam accusantium ducimus libero repudiandae vel asperiores similique nostrum.&lt;br&gt;Quisquam sequi porro numquam aut, in dolore ut aperiam, ipsam, ea repudiandae quia! Quibusdam deserunt voluptate ex nostrum fuga? Expedita voluptatibus voluptas quis sequi, amet earum eaque mollitia sed laudantium!&lt;/p&gt;&lt;table&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td class=&quot; sun-editor-selected-cell&quot;&gt;&lt;div&gt;&lt;span style=&quot;background-color: rgb(250, 244, 192);&quot;&gt;​1&lt;/span&gt;&lt;/div&gt;&lt;/td&gt;&lt;td class=&quot;&quot;&gt;&lt;div&gt;​2&lt;/div&gt;&lt;/td&gt;&lt;td class=&quot;&quot;&gt;&lt;div&gt;​3&lt;/div&gt;&lt;/td&gt;&lt;td class=&quot;&quot;&gt;&lt;div&gt;​4&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td class=&quot;&quot;&gt;&lt;div&gt;​5&lt;/div&gt;&lt;/td&gt;&lt;td class=&quot;&quot;&gt;&lt;div&gt;​6&lt;/div&gt;&lt;/td&gt;&lt;td class=&quot;&quot;&gt;&lt;div&gt;​7&lt;/div&gt;&lt;/td&gt;&lt;td class=&quot;&quot;&gt;&lt;div&gt;​8&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td class=&quot;&quot;&gt;&lt;div&gt;9&lt;/div&gt;&lt;/td&gt;&lt;td class=&quot;&quot;&gt;&lt;div&gt;10​&lt;/div&gt;&lt;/td&gt;&lt;td class=&quot;&quot;&gt;&lt;div&gt;​11&lt;/div&gt;&lt;/td&gt;&lt;td class=&quot; sun-editor-selected-cell&quot;&gt;&lt;div&gt;​12&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;​&lt;/p&gt;&lt;p&gt;Laudantium, perferendis molestiae hic adipisci neque repellendus ab a nostrum, mollitia esse blanditiis dolores fugit ea harum temporibus fuga nesciunt. Aliquid dolor praesentium alias accusamus nihil recusandae eius obcaecati nisi?&lt;br&gt;Nihil exercitationem corporis at sunt harum minima aliquam mollitia aspernatur provident nisi quas maiores odio doloremque ipsam totam quasi adipisci molestiae quia, veniam commodi ea optio deleniti molestias. Natus, minima.&lt;br&gt;Tenetur aspernatur necessitatibus quasi commodi enim quaerat debitis repellendus iure in aliquam sint assumenda neque exercitationem dignissimos inventore voluptate optio, ipsum mollitia consequatur suscipit. Magni officiis laboriosam inventore consectetur animi.&lt;br&gt;Exercitationem vitae sunt et accusamus quo, quod, asperiores consectetur inventore obcaecati qui ea sed explicabo eveniet dolorum officiis est earum? Mollitia, quae commodi vitae ducimus quis ab atque minus magni.&lt;br&gt;Quaerat repudiandae voluptas amet ratione voluptatibus? Fuga provident dolor quos deserunt rerum veniam atque voluptas? Non quod voluptate consequuntur. Unde nulla doloremque voluptates culpa corporis quisquam perferendis debitis iure assumenda.&lt;br&gt;Aliquam, veritatis perspiciatis sequi itaque quidem, ipsam, aut quos totam tempora qui exercitationem hic ad recusandae quasi magni amet! Aspernatur at perspiciatis ex facere libero exercitationem corporis delectus repellat reiciendis.&lt;br&gt;Ad aperiam voluptas at voluptatem quae rem, ipsam totam a sed cumque ipsa veritatis impedit soluta autem eos earum veniam, quis eius maiores, eaque ratione necessitatibus. Modi eos minima omnis.&lt;br&gt;Velit tempore soluta facilis tempora vel nam similique incidunt nihil cumque! Quas itaque aut hic fugit! Excepturi provident magnam nam facilis earum doloribus quaerat asperiores minus voluptate. Perferendis, pariatur iure?&lt;br&gt;Nulla inventore est dolore deleniti ad, beatae praesentium ab error nobis voluptatem? Deserunt fuga officia debitis! Ea quam ex itaque quidem cum culpa sed veritatis quaerat debitis excepturi, tenetur odio!&lt;br&gt;Ad repudiandae nihil dolorum blanditiis veritatis, non culpa? Rem aliquam nam itaque eius, molestias odit at possimus quae facilis, vel inventore deserunt dicta quo. Eaque velit inventore facere vero cumque!&lt;br&gt;Dolorem nobis et possimus quod consequatur laudantium fugit officiis, doloremque eum id nulla quas illum magni tempore quisquam sit repellendus nemo iure illo itaque placeat asperiores corrupti assumenda culpa. Similique!&lt;br&gt;Quasi facere repellat delectus ipsam enim reiciendis? Numquam non, velit est, nostrum vero, quas totam unde asperiores laudantium pariatur reiciendis dignissimos ipsum itaque perspiciatis error recusandae eum placeat quasi blanditiis!&lt;br&gt;Sapiente molestias asperiores laudantium, numquam impedit quidem temporibus rerum, aspernatur placeat quae libero sint quisquam porro tempora, possimus inventore assumenda quis! Sed sunt unde facere corrupti nihil doloribus dolorum ab.&lt;br&gt;Ipsam culpa obcaecati atque maxime facere vel beatae quibusdam? Voluptatibus nostrum fugit inventore obcaecati optio alias minus omnis, nisi possimus dolorum cumque quisquam id ipsa adipisci recusandae cupiditate tenetur similique.&lt;br&gt;Iure saepe sapiente facere quas ea facilis porro iusto aperiam quo tempore vitae ducimus eius obcaecati quis itaque error perspiciatis nemo reiciendis sint dicta, culpa ipsum officiis! Voluptatem, assumenda dolore!&lt;br&gt;Provident facere amet nesciunt. Qui a, sunt doloremque inventore, recusandae minus nihil tempore odio fugiat nostrum repudiandae eveniet sint, quod quisquam. Repellendus quis labore quidem natus possimus atque voluptatum facilis.&lt;br&gt;Placeat rerum laboriosam sequi dolorem dolor illum unde, suscipit vitae nam optio iure, autem consequatur, nostrum iusto a explicabo fugiat? Velit laudantium ad suscipit, sunt quam officiis. In, accusamus totam.&lt;br&gt;Voluptatem minima deserunt quasi esse dolores tempore eos iusto quos labore laborum, suscipit sint numquam commodi vero distinctio in modi quaerat pariatur quod saepe molestias. Omnis quis porro culpa esse?&lt;br&gt;Quod facere exercitationem itaque incidunt similique eaque iste, excepturi maxime illo cupiditate iure minus. Consectetur amet deserunt sed alias harum magni maiores ea velit minus eius. Velit voluptas deserunt quo.&lt;br&gt;Suscipit atque temporibus eligendi maiores provident voluptates laborum, assumenda impedit perferendis exercitationem nemo odit in amet neque ipsum doloremque dolor nesciunt commodi! Doloribus suscipit libero ratione! Praesentium repudiandae minus suscipit.&lt;br&gt;&lt;/p&gt;', 'Privacy Policy', 'Privacy Policy', 'Privacy Policy'),
(4, 2, 'About us', '&lt;div&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;Lorem, ipsum dolor sit amet &lt;a href=&quot;111&quot; target=&quot;_blank&quot;&gt;consectetur adipisicing elit.&lt;/a&gt; Adipisci provident minima enim dignissimos omnis possimus odio quisquam libero sint mollitia rem sed nisi facilis culpa, impedit, fugiat id, sequi doloribus?&lt;/span&gt;&lt;/div&gt;&lt;div&gt;​&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;table&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td class=&quot;&quot;&gt;&lt;div&gt;​6&lt;/div&gt;&lt;/td&gt;&lt;td class=&quot;&quot;&gt;&lt;div&gt;​5&lt;/div&gt;&lt;/td&gt;&lt;td class=&quot;&quot;&gt;&lt;div&gt;​4&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td class=&quot;&quot;&gt;&lt;div&gt;​1&lt;/div&gt;&lt;/td&gt;&lt;td class=&quot; sun-editor-selected-cell&quot;&gt;&lt;div&gt;​2&lt;/div&gt;&lt;/td&gt;&lt;td class=&quot;&quot;&gt;&lt;div&gt;​3&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;div&gt;​&lt;blockquote&gt;&lt;div align=&quot;justify&quot;&gt;Ea poracere neque aliquam fugiat asperiores quia harum distinctio! Consectetur tempora dolore nulla! Mole 16 stias a liquam, voluptas, nulla aliquid, accusamus ea sapiente dolorum dicta voluptates maiores dolores recusandae sed quibusdam?&lt;/div&gt;&lt;/blockquote&gt;&lt;/div&gt;&lt;pre&gt;&lt;div align=&quot;justify&quot;&gt;Ea porro facere neque aliquam fugiat asperiores quia harum distinctio! Consectetur tempora dolore nulla! Mole 16 stias a liquam, voluptas, nulla aliquid, accusamus ea sapiente dolorum dicta voluptates maiores dolores recusandae sed quibusdam?&lt;/div&gt;&lt;/pre&gt;&lt;pre&gt;&lt;div&gt;​Ea porro facere neque aliquam fugiat asperiores quia harum distinctio! Consectetur tempora do&lt;/div&gt;&lt;/pre&gt;&lt;div&gt;​&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div align=&quot;justify&quot;&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;Ea porro f&lt;b&gt;acere neque aliquam &lt;/b&gt;&lt;/span&gt;fugiat&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;&lt;b&gt; asperio&lt;/b&gt;&lt;/span&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;res quia h&lt;/span&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;&lt;u&gt;arum distinctio! Consectetur te&lt;/u&gt;&lt;/span&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;mpora do&lt;/span&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;&lt;i&gt;lore nulla! Mole &lt;/i&gt;16&lt;i&gt; stias a &lt;/i&gt;&lt;i&gt;liqua&lt;/i&gt;&lt;/span&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;m, volu&lt;/span&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;&lt;strike&gt;ptas, nulla aliquid, acc&lt;/strike&gt;&lt;/span&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;usamus ea sapiente dolorum dicta volu&lt;/span&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;&lt;sub&gt;ptates maiores dolore&lt;/sub&gt;&lt;/span&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;s recus&lt;/span&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;&lt;sup&gt;andae sed quib&lt;/sup&gt;&lt;/span&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;usdam?&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;​&lt;/div&gt;&lt;div&gt;1&lt;br&gt;&lt;/div&gt;&lt;table&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td class=&quot;&quot;&gt;&lt;div&gt;2​&lt;/div&gt;&lt;/td&gt;&lt;td&gt;&lt;div&gt;​&lt;/div&gt;&lt;/td&gt;&lt;td&gt;&lt;div&gt;​&lt;/div&gt;&lt;/td&gt;&lt;td&gt;&lt;div&gt;​&lt;/div&gt;&lt;/td&gt;&lt;td&gt;&lt;div&gt;​&lt;/div&gt;&lt;/td&gt;&lt;td&gt;&lt;div&gt;​&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;&lt;div&gt;​&lt;/div&gt;&lt;/td&gt;&lt;td class=&quot; sun-editor-selected-cell&quot;&gt;&lt;div&gt;​&lt;/div&gt;&lt;/td&gt;&lt;td&gt;&lt;div&gt;​&lt;/div&gt;&lt;/td&gt;&lt;td&gt;&lt;div&gt;​&lt;/div&gt;&lt;/td&gt;&lt;td&gt;&lt;div&gt;​&lt;/div&gt;&lt;/td&gt;&lt;td&gt;&lt;div&gt;​&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;&lt;div&gt;​&lt;/div&gt;&lt;/td&gt;&lt;td&gt;&lt;div&gt;​&lt;/div&gt;&lt;/td&gt;&lt;td&gt;&lt;div&gt;​&lt;/div&gt;&lt;/td&gt;&lt;td&gt;&lt;div&gt;​&lt;/div&gt;&lt;/td&gt;&lt;td&gt;&lt;div&gt;​&lt;/div&gt;&lt;/td&gt;&lt;td&gt;&lt;div&gt;​&lt;/div&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;div&gt;​&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;ol&gt;&lt;li&gt;&lt;div&gt;&lt;span style=&quot;font-family: Tahoma;&quot;&gt;Perferendis dolorum, \r\nconsequatur&lt;/span&gt; co&lt;span style=&quot;font-size: 24px;&quot;&gt;nsequuntur vitae aspernat&lt;/span&gt;ur sint fuga &lt;br&gt;&lt;/div&gt;&lt;/li&gt;&lt;li&gt;&lt;div&gt;&lt;h2&gt;velit eaque fugiat \r\nsimilique nesciunt ducimus saepe expedita commodi &lt;/h2&gt;&lt;/div&gt;&lt;/li&gt;&lt;li&gt;&lt;div align=&quot;center&quot;&gt;minus hic. Fugiat \r\nimpedit perferendis expedita sint exercitationem &lt;br&gt;&lt;/div&gt;&lt;/li&gt;&lt;li&gt;&lt;div&gt;&lt;h1&gt;corporis voluptatibus \r\nnulla iste aliquid!&lt;/h1&gt;&lt;/div&gt;&lt;/li&gt;&lt;li&gt;&lt;div&gt;Aperiam\r\n adipisci nostrum &lt;br&gt;&lt;/div&gt;&lt;/li&gt;&lt;ul&gt;&lt;li&gt;&lt;div style=&quot;margin-left: 0px;&quot;&gt;&lt;h4&gt;eos numquam &lt;/h4&gt;&lt;/div&gt;&lt;/li&gt;&lt;li&gt;&lt;br&gt;&lt;/li&gt;&lt;hr class=&quot;dotted&quot;&gt;&lt;li style=&quot;margin-left: 0px;&quot;&gt;&lt;div style=&quot;margin-left: 0px;&quot;&gt;ratione, voluptatum quam, &lt;br&gt;&lt;/div&gt;&lt;/li&gt;&lt;li style=&quot;margin-left: 0px;&quot;&gt;&lt;div style=&quot;margin-left: 0px;&quot;&gt;&lt;h5&gt;sapiente vitae \r\ntotam nulla natus labore&lt;/h5&gt;&lt;/div&gt;&lt;/li&gt;&lt;li style=&quot;margin-left: 0px;&quot;&gt;&lt;div style=&quot;margin-left: 0px;&quot;&gt;a eaque amet animi iusto&amp;nbsp;&lt;/div&gt;&lt;/li&gt;&lt;li style=&quot;margin-left: 0px;&quot;&gt;&lt;br&gt;&lt;/li&gt;&lt;hr class=&quot;dashed&quot;&gt;&lt;li style=&quot;margin-left: 0px;&quot;&gt;&lt;div style=&quot;margin-left: 0px;&quot;&gt;dicta perspiciatis, \r\nsunt inventore obcaecati et &lt;br&gt;&lt;/div&gt;&lt;/li&gt;&lt;li style=&quot;margin-left: 0px;&quot;&gt;&lt;div style=&quot;margin-left: 0px;&quot;&gt;molestias similique iure dolor. Voluptate.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;/li&gt;&lt;/ul&gt;&lt;li&gt;​&lt;/li&gt;&lt;li&gt;&lt;br&gt;&lt;/li&gt;&lt;hr class=&quot;solid&quot;&gt;&lt;li&gt;​&lt;/li&gt;&lt;/ol&gt;&lt;li&gt;​&lt;/li&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;Aperia&lt;/span&gt;&lt;span style=&quot;color: rgb(153, 138, 0);&quot;&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;m adipisci error assum&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;enda quod. D&lt;/span&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;&lt;b&gt;oloremque, recusandae asperiores laudantium suscipit repudiandae quam impedit reprehenderit at numquam molestias laborum nisi cumq&lt;/b&gt;&lt;/span&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;ue earum amet&lt;/span&gt;&lt;span style=&quot;background-color: rgb(255, 0, 0);&quot;&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt; facere ipsa dolorum ad quos minus ab? Dict&lt;/span&gt;&lt;br&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;Dolorum asperiores ullam consectetur sapiente saepe, odi&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;o placeat eius eveniet eum animi nihil distinctio. Magni voluptatum similique officia, exercitationem est at corporis impedit? Harum sapiente, molestiae dolore earum obcaecati in?&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;&lt;/span&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;Perferendis dolorum, consequatur consequuntur vitae aspernatur sint fuga velit eaque fugiat similique nesciunt ducimus saepe expedita commodi minus hic. Fugiat impedit perferendis expedita sint exercitationem corporis voluptatibus nulla iste aliquid!&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;Aperiam adipisci nostrum eos numquam ratione, voluptatum quam, sapiente vitae totam nulla natus labore a eaque amet animi iusto dicta perspiciatis, sunt inventore obcaecati et molestias similique iure dolor. Voluptate.&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;Facere et inventore minima temporibus animi ducimus, eos asperiores non exercitationem possimus. At, repellendus molestiae. Adipisci exercitationem fugiat ratione sed mollitia numquam ea accusantium, harum aperiam itaque consequatur, vero dicta.&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;Deserunt reprehenderit natus vel nobis eligendi placeat? Provident non esse eius obcaecati harum suscipit quis eum nemo neque. Dicta nemo porro consequatur aliquid corporis ratione accusamus, adipisci tenetur ducimus nesciunt.&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;Excepturi ab cumque, earum dignissimos, quaerat unde alias accusamus, deserunt doloribus ipsam saepe iure nam vero? Nisi quisquam neque enim consequatur eaque eligendi officia, quasi labore. A facere aperiam nam?&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;Officiis vitae error reiciendis, saepe quisquam ratione laudantium maxime. Eum nesciunt soluta voluptatibus eaque blanditiis laboriosam aspernatur necessitatibus error repellendus facilis nihil ea asperiores ipsum reiciendis quo sint, dolorem quae.&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-family: Segoe UI;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class=&quot;sun-editor-id-comp sun-editor-id-image-container float-center&quot; contenteditable=&quot;false&quot;&gt;&lt;figure class=&quot;sun-editor-figure-cover&quot; style=&quot;margin: auto; width: 1339px; height: 866px;&quot;&gt;&lt;img src=&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAA3MAAAI9CAIAAAAfDraFAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAADo1SURBVHja7d0rcCLBooBhzKlCIpFIJJJCcR0SibqFuRQSiUPiDjgkMhIHEolEIhBIJBKZW5tJJpMZIAQI4fF9tXUem4TdDNnkp3u6O/UKAACXkHIJAABQlgAAKEsAAJQlAAAoSwAAlCUAAMoSAABlCQAAyhIAAGUJAICyBABAWQIAgLIEAEBZAgCgLAEAQFkCAKAsAQBQlgAAKEsAAFCWAAAoSwAAlCUAAMoSAACUJQAAyhIAAGUJAADKEgAAZQkAgLIEAEBZAgCAsgQAQFkCAKAsAQBQlgAAoCwBAFCWAAAoSwAAUJYAAChLAACUJQAAyhIAAJQlAADKEgAAZQkAgLIEAABlCQCAsgQAQFkCAICyBABAWQIAoCxPMp1Oy+XycDj0hAEAKMvTrdfrdDqdeuMJAwBQlqfLZrNBVo5GI08YAICyPOOv+MGzBQCgLJUlAICyVJYAAChLAACUpbIEAFCWyhIAQFkqSwAAlCUAAMpSWQIAKEtlCQCAsgQAQFkCAKAslSUAgLJUlgAAKEsAAJSlsgQAUJbKEgBAWSpLAACUJQAAylJZAgAoS2UJAICyBABAWQIAoCyVJQCAslSWAAAoSwAAlKWyBABQlsoSAEBZKksAAJQlAADKUlkCAChLZQkAgLIEAEBZAgCgLJUlAICyVJYAAChLAACUpbIEAFCWyhIAQFkqSwAAlCUAAMpSWQIAKEtlCQCAsgQAQFkCAKAsfySdTgdlud1uPWEAAMrydPl8PijLxWLhCQMAUJanK5fLQVlOp1NPGACAsjxdvV4PynI4HHrCAACU5ena7XZQlt1u1xMGAKAsT9fr9YKybLVanjAAAGV5utFoFJRlrVbzhAEAKMvTzWazoCzL5bInDABAWZ5utVoFZZnL5TxhAADK8ry/5Zt0Ou0JAwBQlmfJZrNBXG42G88ZAICyPF2xWAzKcjabec4AAJTl6ZrNZlCWg8HAcwYAoCxPZ0tLAABleRmTySQoy0ql4jkDAFCWp1uv10FZZrNZzxkAgLI8SyaTsTwcAEBZXoDl4QAAyvIyLOLZKZfLpSKy2Wyr1Vqv164MAKAs97KIZ6dut5tKSKfT+hIAUJZ7WcRzwHw+b7VasfHLdDrdbrfdlgoAKMsdLOL51mg0KhQKsfnxl5cXVwYAUJZfWMRzcl+Wy+XFYuHKAADK8l2tVgs6ySDcMV5eXrLZbLQvO52OywIAKMt/Op2OQvqRzWbTbrejcVmtVt1LAAAoy3+DcEEe1Wo1z9zxFotFuVwO4zKfz5sZBwCevSxns1nQRsVi0TP3U+GIbyqVymQyo9HINQEAnrcsN5tNGEaeuROMRqNwfX0qlep2u64JAPCkZWnjofMtFot8Pm9NDwCgLG08dAGbzaZSqYhLAODZy9LGQxex3W7FJQDw7GVp4yFxCQAoy8uw8ZC4BACU5WXYeEhcAgDK8jJsPCQuAQBleTE2HhKXAICyvIxCoRAE0Hw+9/yJSwBAWZ6uWq0G9eN8wl+Ny1ar5ZoAAA9elq1WK0ifwWDg+fvVuCwWi4vFwmUBAB62LG08dAWDwSCdToeJWavV3NUKADxgWdp46DoWi0V4S2sqlcpms07UBAAerSzX63XQOrlczvP3q7bbbbvdTkW02+3tduvKAAAPUpavr6/hRK3n7womk0k2mw3jMp/PG7wEAB6nLPP5fFA5q9XKU3gFm80murLH4CUAF1EqNfrjZarUX7oWyvIPlcvloG+m06mn8GqGw2G4Tb3BSwBOj4+vSsF/NcYCU1n+jXq9HnwRDodDT+E1rddrg5cAnGy5HDdKpfCHyL/f6Ddex433wmyMXSJl+Qc6nU7wFdntdj2F12fwEoATjBvvTVnqj5fxN4UDmAYuleVflE3w5ddsNj2Ff8LgJQDfikXisl86sAD3463GLZXl1U2n0+BLs1KpeAr/NvGjg5fFYtGaKgA+BiDjw48f5RgflPx616WyVJZXt1gswnlYT+Hfig1eZjIZ57kDPLnS58qcSFwu+8najC3lcemU5d/Ybrdhx3gKb0Gv14ueBtlqtcyMAzyJ+Bjjst//XKLzGZLLfin4/VJ/KSiV5c0J9+52nvWNmM1muVzOzDjA89hzX2Q0HP+V5UdcLhup1JFNaUpcWV6bzdJvUGxDdTPjAI9s+Tk0+aUD/91lWer3k4u9j1n//f6g1ocry2sLN0u3382t6Xa70dejrVbLNQF4hGKINeGyv2s5d+S3PnapDMvyMy73DEmGuxIZslSW11atVh3Dc7Nms1n0qPFisbher10WgDsWycRoXCYnxN9+760mw/3PP+MyMs6ZqMvlchyOabreyvLaHMNz4zabTTiunEqlstms0WWAuy7LxBjkR0V+6cRgLny590Pe3iM8zvHt2PDICvFSqdQYL02FK8vra7fbwRfhYDDwLN6s8LSkVCqVTqc9WQB3UAb7Jqt3ZWJs2DI+iLnz1splf5xcy2ORuLK8kWTpdDqexVs2mUyiu6nXajUbEgHcqMPH4OyY3f7yIW8fFRmzPNCjbx85bpSW436jZO5bWd6A8IBHC0Ru32q1KhaLYVwWCgUr+gFutiyPict963h2rNDZeYMmyvLWvLy8BF+89Xrds3j7tttts9m0IRHA7ei/nbK43BWXO8sytktl8kP+fdTbLumxTYj2D1uiLG/GfD4PvojL5bJn8Y4sFotwL9Lg6bNsHOAKlv8mn0vRmxqX/UZp102QXxZwJ2+CPLhIPHiLPYOU5f1ZrVbBF3Aul/Ms3pfNZlOr1aLjl5PJxGUB+N2f92FQfsRgkInvodgY794aKLmq5rtF4pE/AmV5P8Kjw7PZrGfxHsWOGm+3264JwCV/wEfCbxxuQd7fMZwYnwDfd7hOJC4PzYmX+lf7HIfDYblctv+gsrzwyy/P4p1KHjVuZhzgXMuPjEws4G6Mlwd+mO47SWdHXO5ZJH7Nz3I4HIY/QdLptF1HlOUFhF9Sm83GE3mnNptNeJySlT0A5wvHG5exTEysnzm0l+QJi8T/oinD/ew878rykmVpC5t7lzxq3KtPgGM0EoON780XmZKOTFMvvwnKRFweLsvrf77RAzhsk6wsLyw8PHCxWHgi713sqPF8Pu80SIDvhMtvPuesP8Jyz7ZAxx948+3dlte1c6hSUyrLXynL6XTqiXwAsaPGg2U9vmsARDW+JOM4GpeB0o4U/HKY4r5Hjg9Rft0C/a90u91YUKZSqUql4qeDsry8cOcaZflIhsNh9DRIg5cAkQHEUuLWxq9luey/v2dss/JU6rv7Ipf7lnv/1ae8WCyi57cZqlSWv65erwdfZLYbeDDr9bpSqRi8BEiUZSoMx48E/ByPDGKytHuQcRwOPybfulx+7kp0I5ucd7vd6M50mlJZXkOr1VKWD8zgJfDMdh+9+JmSpWB0cfn6ddhy2Q/HHb/uMbRMRmjw9s+jcxrj5Q1scR4bqkyn091u19eDsryGcIGYr7lHZfASeLqfykHklRpB6u0cf3xPy7e567eK/Hob5fuo5vu8+Zf57ciinFKj/2U8sFS6hU8/NlRZLBYt0lWWV/36C77yOp2OJ/KBGbwEHt5y3I8d6h3OT+++N3LZ/5KTH7dRvlfo29vCd4h+/LiRCvdSD/7EG7kCq9XKUKWy/PvgCLc/9EQ+tuTgZavVskM+8Dg/jHcd6r3sl8JlN7vy8j0QS/8mzndsPxQZofz3e7Gxz+W4fyOf+2az6XQ60REEQ5XK8o/Lsl6veyKfQWzwMpvNusUWuH8Hls+MDx528/ZxH6OUye2HgraMzJX/wXk5B6xWq+FwWK/Xo9/YDVUqy780nU4d6/RskoOXxWJxPp+7MsB9/NDddePkrr3Nv9Thzo/6GJCMbZGe2nfM941cgWCEMrlFpaFKZXlDZVkulz2RT2U0GkUP7DE5DtxDUKaiC7PH8XLcu9vP55z2l/ZcJg4Dj28/dGuSs96hXC5nDkpZ/r3FYqEsn9Z2u22329ElhNls9uXlxZUBbjUo3xZuJwYWv94MeTAuv45qNr7cl/klLm+wLAeDQawp0+l0pVLpdrsWZSrLW7FarcLXOp7I57RYLGKT4+Vy2WQKcGtNebD9dnZjPBgTN1uOg///NSL/PfqtXYr5fB6ebGKEUlnetM1moyx5fX19eXmJTY7b9hL4O5+z0jtX3XzsERQ5n7v07fqacezxxo1UaceY5W1JHvmtKZXlfbwoTKfTnsgnt9ls2u127PvXZDJxZYA/KctDh3THhy3//f/DcbnjVsxlP/iA27wEO4/8rlQqXvMry1sXvhiyeoNQbHOiTCbjJTJw4Z+dXxfk7FntfXjYMpqKy+gNl5FjGz//oJs4eHH/a/udy71tIaQs70+hUAi+fN1aR9R6vY7d1lOpVFarlSsDXCwo/93RuG9HoPGhbSh3z4nHjl4cfz15sXHLTblzubcthJTlXQpXb0ynU88lMZPJJHr/pVfPwIkizfd1Rc6+snz9tix3LuO+2aMXd+r1epZ782hlGY5Lme5kp2BzotjLaN/ygBPLMt6JkeTcNSH+k7stvz7uuH/L12Oz2VSrVUtzeMCy7HQ6wde0sSgOmM1m4Y0T4eJxlwX4gb3n5Bw1bHnc3ZZ38x01ekulpuShynIwGIRHsHguOazb7UZ3Vq/X61YpAlH98fKbstwRgYfK8puRydvd19w3Up61LEejkaPDOV5sZ/VKpWJXASBcJROOSu6IvY8hxsTo47+y/HbYcl9Z3tFVWq1W0Y2EMpmMY894wLKczWYOeOSnosvGC4WCuISnFaySCS37jdL+zYIS53TH3rJr+6Fjjm68eckF4NZ987Bl6YBHThPeoRt88diQCJ7Qcvm+s89HKr79d3j741sKLhOVuKsQl/vmxMPvM/3lXV6iZFPaZIMHL0vH8HCy4XAYndaZz+euCTyPcSNc7T1OvCkVnrcY2xKosXepd7ws+8vobumNe7xEsVMnDFXyLGUZblhoTpOfGo1G4a3omUzGaZDwkHYOF34MQC4PjFkkBijHpb17CMV2vCwFZXmnV2y73TabTZsK8aRl6RgezjGbzcIX5el02rdOuIOfW3uP197xnm+H2by/f/K0m+XuoPw8tzFWjzvO7979gaU7nf4OzjCLrtTRlDxdWTqGhzPN5/Po3my9Xs81gZsMymO77XMdTvDeH5kYflg42R38TvJkwr2P/DUsd33g+zqfO43L2WwWPbqs2WzaVIinK0vH8HC+1WoV3Uq91Wr5Zgq3F5TfDAqGq26igbgcN3adoJM4rvFgUH5Yfm5LdOgD9y8iv2HBYp3wBqF0Oj0YDHz58Yxl6RgeLvVdNToB5EZ1uLWmfP/dyHHckXQLt40M3/zlDsrPxTTvA46R3zgYlF+GKL980IEPvLOyTC4Az2azTsHlecvSMTxcyna7jZ6Em06nzYzDrQRlJBKjcRlNx8OnJX6MUgYfFVm3vTcAY4F4bIwGH3gvV7vb7SYXgK/Xa1+HPG9ZOoaHyxoOh9GzyyqVim+ycBXxIcHv3jHWhJ8fvvzuo77E5b8lPvEWXS4/dyX6eNve4x3v1GKxiE7UWKyDsnznGB5++xtuJpMZjUYuC1ytLL/Jt49GTA5bRtflJD8q/MC3h/83shj7I8MZ9M9TeXYMi953XK5Wq+FwWK/Xoy+h8/m8pkRZfv4jcQwPvyF6Tk8qlarX6/ZMhevE5ffttmtC/NsPD3cz/3yPyEqeUqP/dY1QqRR/oPsethwMBtF9MJypg7Lc/zk4hoffMZvN8vl8dKrIXe3w22XZ+Mmw5Z51PN98XPQd3vYzf5/8Do8RP/qj78Nms4neRG6pIsryG+HmW55OLm673YY7WwXa7bY9ieBX4/LoskztnhDf9+Efb999Ks+4/+3f7U5fIUeHKtPpdKVS6Xa7XiejLPcK/814Ovklk8kkuntwPp/3TRl+uyyPH7b89ncDpbs/H+dnYltUBnf1eGGMslSW3JDhcBjdoUNiwq/G5eH3+m6ReOltZfcyeutkY7x8+KxMbiSUz+fNeqMslSU3ar1eh2eKmh+H3yvL8+fES6V/N05+d/fk47CREMpSWXKvDF7CFeLyzEXi/353OX74i2UjIZSlsuQRGLyEK5TlOYvEH/uOyuA2ShsJoSyVJQ/F4CX8UlmecbflMYc33n1Txm6mtJEQylJZ8iAMXsIvxeWPjuTZ/buPVZY7m9JGQihLZckDMngJly3LH9xteaA3+8vHiMudTWmBDspSWfLIdg5euixwclyeWZaNR/nRkNxISFOiLJUlzyI2eFkulx04DieX5Tlx+QCXYDqdRs+Y1ZQoS2XJM4oNXuZyufl87rLAaXF5l2d1X+LbSK1W05QoS2UJ7zqdTvQW+5eXF9cEflqWT/XZzufz0WjU6XSq1Wp06iOTydhICGWpLOF1NBpFfzy0Wi3XBIgKluYUCoXUHrVabb1eu1Aoy+sJf3J7OrlBi8UiepuU2y6BaFPu3JYy3GJiOp26UCjLq38OHzyd3OzPj2q16rZL4HBTFgqFarXa6XRGo5HvEihLZQmHuO0SsC0lylJZwsXEbru02yVoSk2JslSWcLrYbZfVatVtl6ApQVkqSzj9x0z0tst8Pr9YLFwWeDyr1ardbmtKlKWyhF8Xve0yk8mMRiPXBB7Gy8tL7KxXTYmyVJbwu2K3XXY6HdcE7tp8Pm+1WtlsVlOiLJUl/IHkbpe2RIY7Dcrw2I6oSqViIwiUpbKEa+t2u9GfRpaNwy3bOdmdSqWy2Wyz2bS9OcpSWcLfm81m0Um0YrFo/BJu8EVgcrJbUIKyhFu02WyiAyGZTGYymbgscCOv/ZKne5vsBmUJt87MONzaS756vR4bpGy326vVysUBZQl3IDkz7mcY/IlerxfdwyGTyXS7XZcFlCXcmeTMuD0v4Zomk0l064ZUKlWr1dz9DMoS7lhsZrzVam23W5cFftVisYgt/S4UCrPZzJUBZQl3z5pxuJrNZtNqtWK3VA4GA1cG7qwsl6+v/eVrqb9UlrDzp125XI7OjNvfBC4recZ3Op1ut9ubzcbFgXsqy/Hra2P8mir1U6nSaXWoLHkS0aPGnQYJl7Jz2/NKpbJYLFwcuJuyDAYpU41xKtWI/mNWlnDAdDqNjqlUKhUDKnCyndue5/N5+8jCPZXl+PXfrHc4SBlopFLjRup13FCWcNh6vS4Wi+GXfS6Xs7AATniRFlv3bdtzuLOyXAaz3l8HKUupVL+UWvZLb8F56uegLHk+0UUG6XTaCgM4/rVZrVaz7TnccVkGS3PeBik/g/K9BZf9t+Y873NQljyl0WgUnRmv1Wo2JILDbHsOd1yW489Byi+z3v9GKJf9C7agsuRpLRaL6EHG+XzemgPYJ7YGzrbncDdl+T5IGZn1jtxGOY7moLKEM22322azGR2DcaMYHM7KfD5v3y64p7IMBymTQRnLQWUJFzEcDtPptKN64NusrFQq/nXA3ZXlW1Y2Gv3leHnwfZQlXMp8Po+udS0UCmbGeXKr1Wo4HEbX68hKuMuyjGxQWUqV+qX+sr+Mr9NRlnBxm80m+kPUmnGe9h9Cp9PJ5XLJTYVkJdxlWb6+jpf9Ur8UWbnzkZhjZQm/LDYzbjd1nq0po6u/ZSU8RlkGlq/L/rJf+nLGTqqRaoz/rRlXlvBrFotFdDf1bDZrvQJP2JTpdLpSqXS7XacJwGOUZdL4ddz4Opb52Zonb5WuLGGf6XQaPbyuWCy6+ZLHrslcLjccDl0ceJKyDLyPZe5MTGUJF//pW61Wo6M4fu7yAIbDoaYEZbkjMceNVHS6XFnCbxgMBtGbL6vVqpsvuVOxPVw1JSjLpH+z5EFinvDB4c9Ld2fDAbEDe7LZrJvPuDvr9Tp6D7GmBGX5XWL+XLi1xGq18ozCAdvttt1uRwd72u22y8K9mM1m0fuGm82mAQV4irJcnvFLWcJvm0wmsWU9/u1w+7rdbjhDZa9WeK6yTJX6J/864Y8LZ0bsqwJH2mw2lUoletr4aDRyWbhNs9kseiNHJpPx3R6erCzPcMIfVy6XlSWcoNfrRZf1mFvk1qzX63q9Hv0ZUSgUDLHD05Xlsl/a9yv41nDgHU7448KhF4Mu8FOx08bz+bwNL7kFyb0qM5lMt9t1ZeAZy/LQn/cL2wOFr2itEITTfoRHh4XcwcatNWUqlarVauv12sUBZaks4T7EThu34SV/9XUYa8p8Pu9OJ1CWVy3LcBeVTqfjGYWTxTa8zOVyNrzkaux/DsryVsqy0+koS/iln+7ubOMK7H8OyvKGyrLb7QYP22q1PKNwvtFoFJ2RLJfLbnHj99j/HJTlbZXlcDgMHrZer3tG4SJWq1V0DCmTyUwmE5eFy5rP561Wy/7noCyVJTyF2FGQrVbLYBIXMRgMwuPTHGQPyvK2ynIymYRzdp5RuPi/L0dBckGbzaZarcbOyCgWi+64AGV5K2U5nU6VJfye9XodnnTlKEjOMZvNokOV2Wy22WzaVAiU5TdK/eW+X8F3kwPvcNq3qvDUL88o/JJwEwYz45wgdktlcP+SLyFQlsc96HXPDV+tVuFGFZ5R+D3T6dTMOCcEZeyWynQ6bVMhUJY/0C+lTv6lLOGWmRnnSMPhMBaUzqYHZXk/n8YZQ57ACYxfsu+1R3S/KndSgrJUlsCxDWH8kih7ngO/Mxu+fD1hKc7JK3iUJfwhK3sIdLtde54Dv7SCp5RKlXa+qTH+9+tAHSpLuDtmxp/cYrGIzYDb8xyU5WXLcm/knfYmZQk3zsz404oOVdrzHFCWwMWYGX8qsaHKVCrVbrc946AslSVwMcmZ8StuMTNufLNh7sn3chMXG6rM5/NmwAFlCVxecmb8WttiK8trmM1mhULBUCWgLIHr6Xa70fi4ylF+QVnKx198zVCv12PbnhuqBJQlcA2z2Sx6Cks+n5/P58ryTg2Hw0wmEx2K7na7LgugLIHr2Ww21Wo1emB0r9e7qbJcjvuNUikyYV5q9MfLnQ+8R2wnte8fcPdfc9kv7Xu0yEONl3/+JKZSqVqtZgE4oCyBvzEYDKKrParV6mazuYWyHDdKR92QeXRZHvWAR5fl+2/96b2isSVZhULBUY2AsgT+2GKxyOfzv7yZ9g/L8r0XowOByzANv4wdHtmCRz7gkY/20ZWl9yHP5fj9N/YdN3Fh2+223W5bqQMoS+AWbbfb2PqPTqfzC2W5e8zw2Enpj6D78vvHteCxD3jco+2aHd89Y/5LrwRix+oYqgT+uCxTjfGOX9+9SVnCY3t5eYkuBCmXy5e7Y+/bXYf+DSd+9yCnl+WxD3jUo10vImNWq1W73b7K3QuAsvxh551AWcLDW61W0fGwTCYzmUwuV5Y7ZsOX4Uzy7lZbLpfj8Xjcb3yuvTmvLA8+4FF3bf7BOveXl5dKpRL9y6TT6WvtRQooy/36pdTJv5QlPIPkPXyXOArycI193rf45S7IY9bwHL/m5pgHvLGy3Gw2nU4nukznL85PApTlIcszfilLeBaTySQaNGdvu/1NjS1jK2A+C+/fXZiNRr8/Hi+XZ8yGH/mARz3aNcoyaMrozQmBSqXy8vLi6xO4nbK8+qehLOE+xY6CTKfTZ+y//aOy3FWQrwfvs4xPe+++M/JCK3h+9z7LnU2ZzWbb7fZqtfJlCTxCWfaXO34pS3gG3W43umTk1HnY42bD32Ntdy2GO1L+vCyPfsCfrDSPPd5FejN2mk4qlcrlcu6nBB6tLFOpUvKXsoQnEdvmJpPJ/Lx19pfljhU8H1PXn5tPfj3v5svW5qWjy/KIBzxxP8sLbGi53W6bzaamBO6sLM9aG77sf/mlLOHJzGaz2J7qR68c/9l+lvEFN+HZiZHyCx+x1Nix4vybFTy7HvD1j053nM1m0Vtam82mPc+BuynL0s7hx+9+2XUICCRXjtfrdVsqnix6s0E6nR4MBq4JcE9lGR93PO6XsgSiLr1y/Bklj9JxDYE7LMsz6lBZAqHNZhM7ENLR1cdLrou63HFHAMoSuE+j0Si6ltng5bfW63X0NJ3z9nICUJbAQ6eSwct9khtVOkoHUJbKEtghthGjwcvDTWmoElCWyhI4xODlMU1pqBJQlsoSOJbBywNNafNzQFkqS+BnDF5qSkBZKkvgkp5z8FJTAspSWQK/4tkGLzUl8HRlWeovT/ilLIGTPfzgpXFK4HnLMnUGZQmc5lEHLzUl8Oxl2S+lTv6lLIFzxAYvi8XiarW6x0/Eum9AWYaWZ/xSlsBZYoOXmUxmNBrd19+/3W5rSkBZ/t2noSyBr3q9XjqdDr85tFqt258Zn81mtVotdo+QpgSUpbIEbiLUcrncXcyMD4fDYrGoKQFlqSyB27XZbKrV6s3OjM/n81arlc1mY01ZLBY1JaAslSVwi7rdbrTb/nxmPAjK6HhqIJ1O1+v1+XzuKQOUpbIEbtdsNosODf7JzPhisWi328mgDCa+u93uZrPxTAHKUlkCd2Cz2fzJmvHNZjMYDJK3UaZSqWw222w2p9OpZwdQlsoSuEux8ctMJtPtdi84Px5sRZm8ezKVStVqtfvaAglAWQJ8H3/lcjk2H/3y8nKRpoxtRRlMvg8GA5PdgLJUlsDDGo1Gsbsei8XiaXPTO5sym8222+3FYuFSA8pSWQJPodfrxWauq9Xq8TnoGEYAZQnwpQ7b7Xb0zJ5UKtXpdA5/1GKxaLVamhJAWQLErdfrer0eG7xM3hwZrPUuFAqOzAFQlgCHzOfz6OKeXC4Xbl0+Go2S53prSgBlCXBIr9eLHo3zv//7v3YRAlCWACeaTqfJ/YMChULBLkIAyhLgWIvF4n/+53+iQfmf//zn//7v/+wiBKAsAY612WxardbO0cpsNjubzVwiAGUJ8E1Qvry81Ov16CR4Op1ut9v//e9/wz2J0ul0r9dzuQCUJUDcfD7vdrvFYjE5QlmtVlerVfhu0QN7arXaBY8aB1CWyhK4b8nTd6JrdJLHPMZOGy8UCmF3AqAsgSc1mUzy+XwyKPP5fKvVmkwmBz623W6H75/JZOw6BKAsgSe1WCwqlUq0JtPpdLVaHQwGxw9Ajkaj6L2Y354DCaAslSXwUJIrvrPZ7GAwOLlQo6OeO8+BBFCWyhJ4wKbsdDqxbc9brdaZLbjZbKKHPebzeVtdAspSWQLP1ZSVSuWCCRg9B9Jtl4CyVJbAszRlPp8/vDrnNLFzIN12CShLZQk8clPmcrnhcPh7f6jbLgGUJaAmL6zT6ZgcB5SlsgQ05WXE9iRqt9tO6wGUpbIENOWJYpPjuVzuN+7vBFCWyhI413a7vdmmjIZvtVr9vTXpAMpSWQLnGg6HscO+b60po15eXqJ/23Q6bXIcUJbKEvh70+m0UCjcS1OGNptN9Kjx4OwfK3sAZaksgb+RPOz7nIMZ/+pTKJfL0U+hXC6bHAeUpbIErme9XjebzWiQpdPpTqdzpxPKscnxixwyCaAslSXwvW63G1um02w21+v1XX9SycnxTCbT6/XcfAkoS2UJ/IrFYlEsFmMLq+fz+SN9grHJ8Vwu9/Ly4qkHlKWyBC6p2+2m0+nw33WhUHjUzSBHo1Eul4v2ZbFYnE6nvgYAZaksgXOt1+voSp10Ot3tdh/+s+71erGbL6vVqsU9gLJUlsCJkgfqFIvF56mr4ObL6EitYyEBZaksgQs05ZMMVSat1+t6vR6Ny3w+P5vNfJEAylJZAj9uymcbqtxpPp/HFvcYvASUpbIEftaUd3GgztUMh8Po9TF4CShLZQloytPF1jMZvASUpbIENOVZDF4CylJZApryYgxeAspSWQKa8pIMXgLKUlmCptSUF2PwElCWyhKeSPK8bzUpMQFlqSyBH4ud953P5zXlrzI/DihLZQkPKDlUaQjtOgxeAspSWcJDSQ5VGjm7MoOXgLJUlnD3DFXejuTgZavVWq/XrgygLJUl3LrtdtvpdAxV3prY4GU6ndaXgLJUlnDTBoNBNps1VHmbkoOX+hJQlsoSbtFkMikUCtFqMVR5m6bTablc1peAslSWcIvm83msVDKZTK/XM1R5d31pgBlQlsoS/sxqtarVask62Ww2Ls6d9qWRZkBZKku4ts1m02q1ost0UqlUs9k0o/oYfWnwElCWyhKupNvtxk79rlari8XClblrdr4ElKWyhKtK7lJZLBan06kr8xgc2wMoS2UJ17DdbtvtdrQ5crncaDRyZR6PwUtAWSpL+EXT6TSfz0eX6XQ6HUNZD2znsT0WZgHKUlnCWTabTb1ej01/u6XyScQGL7PZrFFqQFkqSzg9LKIH6mQymcFg4LI8leTgZaVSsQMAoCyVJegJTvTy8hJ7jdHtdl0WQFkC39hut51OJ7pRpTlQ9t0XMZ/PXRlAWQK7DQaD6NBUKpWq1+vWbRCazWbRtVzBtkS+QgBlCXwxGo1ixWCvGXbabrfdbjc2qu0GXEBZwrNbrVbVajV26nen0zEExfEvSHK5XOw0ptVq5coAyhKeyHq9brVaqa+c+s0JgiHM6OZEXp8AyhKetwOMM3GR1yrNZjP6RZXNZnu9nisDKEt4WLG9Y1KpVLlcdjMll7JYLGKbVTkCFFCW8IBms1mxWIz+yC8UCn7k8xsmk0lsNVixWJxOp64MKEtlCXdvtVrVarXYNKWVvPy25A5WbroAZaks4Y5tNpt2ux3dHSZYWrHdbl0crvMVGNt1P5VKtVoti3tAWSpLuLOf6N1uNzZiZOk3f2K9XscO78lms8Ph0JUBZaks4dYtFotmsxkbJapUKk7h42/N5/NyuRxbPbZYLFwZUJbKEm7RZDKJLcsNlulMJhMXhxsxGo1iQ+kOhwRlqSzhhmy32+FwGFuKGwwIWfrNbX7Fxm7/taQMlKWyhJv4CZ3c8zyVStXrdXPf3LjFYhGbHC8UCnYmAmWpLOFvJPc8z2Qy7XbbGh3uiGPHQVkqS/hjyT3Pc7ncYDCwlxD3aN+x476eQVkqS/hd9jznUe08dvzl5cWVAWWpLOHy7HnOM0geO14sFp1rD8pSWcIlm9Ke5zyV5LHjtVrNFzwoS2UJZ1mtVvY852n1ej03X4KyVJZwAdPptFqt2vOcJ7fZbFqtVvRfQT6fNzkOylJZwrGGw2GhULDnOYSSN1+2222Dl6AslSUc0uv1YjdT2vMcoi+6opPjBi9BWSpL2C25XsGe55C0Xq9jg5etVss/E1CWyhJ23EBmZ0o4OTHT6bTKBGWpLHlG8/m81WrFFr222+3NZuPiwPGm02ns5HF9CcpSWfJcQRk7ItkpyaAvQVkqSzg3KINdhKbTqUsE+hKUpbKEbwwGg51Bmc1mm82mpoSLG41GsU279CUoS2XJ3ZtOp8k9KQUl6EtQlsoSfmC1WsXOzhGUoC8BZQk/s9ls2u129IxvuwjBbfalF3ugLJUlN92U3W43enyOXYTgxvvSfAIoS2XJzVmtVrGdKe0iBPfVl0FimiUHZaks+Uvz+bxer9tFCO7xH+/OjcDchQnKUlnyByaTSWzbvFQqVSwWR6ORiwP3npj6EpSlsuRKhsNhPp9PnqAzm81cHLhfO1f5uFUalKWy5FcEAxvRBTrh8lL3U8ID96XtHUBZKksuHJTJm7Gy2Wyn0zFZBk/Sl+6fBmWpLLl8UKZSqVwuNxgMttutqwQP35exbwL2fABlqSz5ge122+l0HPMNhN8Tut1udE+x4OZL8xWgLJUl3+j1erHbKAUl8Pr6ul6vm82mxeOgLJUlR0nOeQlKIGaxWFQqFX0JylJZstd0Ok2uA+31em6jBPZ904jtZRvsEbFYLFwcUJY8r/l8nhx+6HQ69q4DTujL4KyE4XDodSkoS57Fer1utVrpdNpiT+BSZrNZvV6PfWMxUQ7Kkke2WCxarVZ0gWcqlSqXy/P53MUBzrfZbAaDQeyALn0JypKHsl6ve71e8jDGQqEwmUxcH+DinBIJypJHs91uh8Nh7DbKcJ/zl5cXlwi4cl9ms1nffEBZcmcmk0nyhqdgzKBWq41GI5cI+MO+LJfLVpGDsuTWBWfnJPc5D76PD4dD81DAX3l5eYl9d7JLEcpSWXK7BoNBsinz+Xy327XoG7gFm82m3W7bpQiUJTdtNBrFVucEZ+dY8Q3coMVikdwFM5PJ1Ot19+qgLJUlf2k2m8W+QTs7B7iXb187bweXmChLZcnfvOivVquxb8fOzgHuy879L8PvafewS9Ey+M9xo/TvP/uNUqnkaUVZck/W63Wz2bQLMfBI5vN5q9XK5XKxvrzxXYrGjVS/lNrJc4qy5A5e3Hc6ndjkUb1et0AHeOzEvL1dipbvXfmu1F++lhr98XIZ/TmbKpVKjb7nFGXJLer1erGl39Vq1Rod4FEldym6ocnxZf99qLIxfvuPQz9tx0tPJsqSWzKZTGI3IZXL5el06soAjy25S9GtTI6PGx9huT8+3+66fB+7bPTlJcqSv7dYLGJnMxYKBUsmgWf7ThjbBONvJ8eXn3dWlr4NxmUwY15SlihL/vqVeqvVir1SHwwGrgzwnJKT43+1cnHZ/3a8cteP3WPfHWWpLLm0Xq+XyWSiS7/vYesNgF9/yR2bHL/+zhjLfum9LI8chlz2P9b52I0IZcnVJW+prFQqztUFCCUnx6/al++d2Dh+grv0tki8P16aEUdZctXvlbFbKvP5/GQycWUAkkajUaFQiPVls9n85Zfi4T5DpTPmtk2Loyz5TclbKjOZTK/Xc2UAftqXqVSqWCwOh8NfOuQ2SMvG+PWMAcj3PPX0oSy5vG63G72lMrgn3S2VAGf2ZSaT+ZUp8jAtz30Ip/WgLLmQzWYTO57RxDfApb7BJg8iv+iNmOP3HSpPbMuP+zTHr+EjJA6GbHgelaWy5FjD4TC6cUY6ne52u780awPwtHbeiHmRvgy2Pz91NvyzLPf/gLZBkbJUlhwhuZ6xUqn8yWZsAPryjEddBofrhAeF7yzIfwn579jwcTIrd8fjuLErO//9ludRWSpLvthut+12O51OR7c9N/0NcK99uRzv+2G6HDeCbS8bHwn50Z7jwwOW0TeOd/7uq12LlKWy5G2LylwuF/2O1m63TX8D3HVf9huNUunL3ZHL5Tj+W18icscdlvvKctfv/vsf4UHknk1lqSyf0Xq9jm1RWSwWbXsOcGt9ec45Zx8bXH5tylIjMTJ5zIDljqnwPUold2MqS2X5PLbbbafTiU1/D4dDVwbgNvsym82+vLyc85hvt12+/49lfD/0f4145FT4gd4svf8J7z/KzY4rS2X5FGKrv1OpVLPZtEUlwO33Zblc/p2ZpaPusIwNWH6WZeIkyX8T7z84vBxlqSzv03Q6jX2TKhQKs9nMlQG4WS8vL8nhgEv35fjkAcvG+HVHPy77pf2rzJfjvqdVWSrL+5Y89TubzQ4GA1cG4PZtNpt2u/1rp0SeuNlQ4+DmlsEH7RvNDNYSeWaVpbK8P+v1OnagTjqd7nQ6Vn8D3N0YQWzX4eCUyEtt6HHqZkO7vY9ahmn59v93LvkplRzqoyyV5T3YbrfJU7+bzabNzwHu12w2q9fr0SWYwRm8v3Vr064By/B3995HmRgGDafHgw8pve2jGf79+2P3YypLZXnbkvflVCqV+XzuygA8gJ3nj19+N+JvNxvaOWj5OYEeZOQyEpbJD3ifHy811KWyVJY3aecyHQfqADyk4XAYnZv6jcHL/ZsN7R6y/KjI0sc7jMOJ8Z0lenC1D8pSWf6d1WpVrVYt0wF4KsljL2q12mAw+L39iRrRLdcTQ40f4dkIBiz7pdQ3U+ev4z1vX74PaZYkgbJUlte12WxarVZymY5dKgGeRGzwMhxf6PV6Fy/LIANLpfeDfd4z8HMS/OPAx9cdK3l2iqfnsh/8Sf34aZQlT7SyVJa/LrlMp16vW6YD8GySg5eBTqfzG2X5mjiIPFykE53Wfk/L/TPdy34pfNDwd6KPW+qPP3vVYh9lqSx/z2Qyid2+XS6XLdMBeGbz+bzX61Wr1eigw4Xi8nNMMjoG+XFO+DJ8wzLelYfSMjqqufzyxzQ+9ywK/nPPJpkoS2V5ruQtlfl8fjQauTIABLbbbXQI8+xd577fbGi5v0b3fsjnhHdjnPiN8Z531pbKUlle8jtFu92O7mSWyWS63a4rA8DhuEyn061W6+S+/LzD8mdhtwwX++zrzo9UjOxPtHOIc9m3hlxZKstL2nl6rFsqATgQl7E5rnQ63W63r7nEM9ixMpVKhSt0ggHIz3nvj1YNs3JfvJakpbJUlmdKHs+YzWZfXl5cGQB+ZDQaxTY8LpfLv7M50aEf8aXSlyXkn29e9sMRS0+WslSWl7fZbDqdTvQW7OCFpiO/AThZcvrrnCny04yXn2c8RpU+RjANSipLZfm7TZlKparV6mq18oUOwPk/ZdrtdmyK/Pp9uaM4G/v2rXwfzfTcKUtleYGmzOfzjmcE4LIWi0W5XL6xvgy3v/yyc1FkJyKjmcpSWZ7RlLlcbjgc+uIG4Jckb75Mp9PNZnM6nf5NWkb2X3//v5FbMu03pCyVpaYE4P76Mlgw+lc39ydPEtKUylJZakoA7r4vi8XiX93lHxzt8/Y/dKWyVJaaEoA7NJ/PW61WLpeLHsnhmDdlqSw1JQCcrtPpxMYvc7ncYDBwZZSlsrwJq9Wq3W5rSgDuxXQ6jW1+mUqlOp2OK6MsleUf/8us1WrJV36aEoAbt16vY5sTOVtYWSrLv7HdbofDYT6f15QAPMAPtUqlcmubq6Msn6Isd058ByvsNCUA9xuX1Wo1tvllt9t1ZZSlsvwts9ksOfGdSqXq9fpsNvNlCsC9S25OZHJcWSrLyxsOhzu3me10Ov69AfDYfWnwUlkqy8sIdhFKLp0z8Q3AY0tOjhu8VJbK8tymjN1MmU6n6/X6fD73FQnAMzB4qSyV5a80ZS6X63a7XqsB8GySg5f2VFeWyvKspjTxDcCTS67syeVydiZSlspSUwLAKbbbbb1ejy08sPOlslSWmhIALtyX7XZ7u926PsryqtLpdPAleAuLYDqdjpoEgHMkZ8klprK8nnCb8Wq1ejtZqSkB4BzD4TA6+5fP5x0goiyvYT6f38KEeDQrK5WKl1YAcKb1eh09eTyVStmfSFle5TP5o7LcbrfT6bTb7Ua3TpCVAHBBscHLVqvl56yy/F3hrZbXeSkTLNDJ5/PJw75lJQBc3Hq9LpfLZsaV5ZW0Wq1wHdkVmjK26DtUrVZlJQD8huTm6nYmUpa/+NV2hQnxbrebbMpisdhsNgeDgRdPAPDbYjPjDu9Rlr/2yfxmWa5Wq2KxaDshAPhzyWU9fi4ry7spy+T0dz6f97ULAH9rOp1G77y8wh1xPFdZXnYRz2QyyeVyycMAbHYAALcjenhPs9l0QZTlxVx2EU82m03eT7lYLHzRAAA8flledhFPOALq1g0AgKcry8veatntdo2rAwAoy5SnFgBAWSpLAABleQPCmyNXq5VnFwBAWZ4u3NfKghsAAGV5lk6nE5RlvV737AIAKMvTTafTcJ8gzy4AgLI83WW3tAQA4HnL0vJwAABlqSwBAJTljbHxEACAsrwMGw8BACjLy7DxEACAsrwMGw8BACjLy7DxEACAsrzcZ6UsAQCU5UVYHg4AoCwvw/JwAABleRmWhwMAKMvLsDwcAEBZXobl4QAAyvJyn5iyBABQlsoSAEBZKksAAGWpLAEAUJbKEgBAWV6jLP9cLperVCqdTmc0Gi0WC19zAICyVJYXUy6Xm81mr9ebTqfb7dZXIQCgLG9aeHT47cvlcuU3wdBmIOjOwHw+95UKACjLP9PtdlOpVLPZ/PO/yXw+f3l56XQ65XI5m82emaGZTCZs0JeXl9ls5osYAB7Jer0eDof1ej2Xy115qGs4HCrLO7PZbKbTabfbrdfrxWLxIl8K+XxeawLAXZvP561WK5/P/+E8ajqdVpZPZ7VaTafTTqdTr9fL5fLx9RnMuYcT7uFsu0sKANcsyNFo1Ol0qtXqzlHJdDpdqVS63e49jhYpy4dqzVqtds44aJCe7XY76E7DnwBwpu12G8xV1mq1QqFw4KdwNpttNpv3PuKjLB/TYrGYTCbnt2Z4Z2etVut0OsPhcDqdrlYrVxgAvk3JY6a2HyMoleUztmYw9z0YDILZ8FqtFgxSnrauKJheb7VawVad0+l0s9m4zgA8g32LbI7Zmia6OuLxtn9RlsTrs9frdTqdSqVy/E2cUYVCQXEC8JBOW2RTLBabzeZgMHiG28yUJd8IRvWDe42bzWa5XD5tE4RCoeAsIgDuNyiP//H3VCmpLLmMYIAzmFsPJtZ/OqteLBbr9XqwWmi9XrukcJs/UA8vYoXndNfLt5UlT1GcwVKhVqs1GAycewlJm83m5eXlapsnZzIZ9QCPvdpGWXLfxRmOfBx5h0p47mXs6MvAZDKZRhj15IFHDbvd7qUOVgAEpbLkMQVDm+12u1wuX3x0JJvNBkkaTLgHS/CCBjUayi3odrt3MblcKBSq1Wpwh/TjLWIFlCUPa71eX/zcy293hncqJn/ymurk09vy+Xyr1ZpMJi4joCzhZ+bzeXS+O9yJM7YfZ+Aiwz9OYOe3Xz7VarUTFgpUq9XBYOCQAkBZwt8ITrycTqfD4TAo0eCY9Z82qNbkR6+Fjl9Gnclkut2uiwYoS3gQp52Becz5CtHlR8HBmJ1Op9frBbGrUB/mpUtwrEC5XD58FnBSrVaz5gxQlqA1L7wdWvkg2wfeoDNXm+XzectLAWUJWrNm2xcsowZQlvAHwhs9gxvvAuFgpD2o711wt0Or1QoOkdKRAMoSAABlCQCAsgQAQFkCAICyBABAWQIAoCwBAFCWAIcs+6W3TR0b411vHPcbpfddH0v9pasFoCwBTinLj7coSwBlCXBOWYZdqSgBlCXAOWU5bqT2T5IDoCwBji3L97A0XgmgLAHOKsuP3zsQlm9rez7vwyyVGv3xznf+GPzcK/IH77/n8+NRPv5GB9Yd7Y/i5XJ83N85+AS/vG/sXb/9rN7/+H3vt//PPvrCAihL4B7K8ruw/Bddu3upkYygS5Tl51qi08ty3995Z4L2S9+857lluftWgx9dWABlCdxBWX5zi2UYS5HciSRR/KP2DyG+v+Xbsox23ollGVmO9Pl3XoY7Ku28EyDyzsv4kOm3cX7ws19+Xq7oh/zwwgIoS+DGy/Lbktk/nrnnLWeX5Zdhv5PK8vOdl8e/c+wvfGjbz1Om5hNv+PGFBVCWwM2W5bdTxN8G1u6MOrMsg98q9fuNk8vy/X33fEqxv8XeBz7wJ55RluGH/PzCAihL4A7KslTqj79558MT5V8K6KyyfP+NxjjxMN8+bPiWw2EZf3PyL3X8JTy6LJeJGw5OuLAAyhK42bL81zSRWw9Lu097/FGlnV2WwXu8feieXty/jDzeoKmjFhJ9U3inluW3S4dOuLAAyhK46bL8GkOl76vtiMQ6vSw/JsKXr4fuS/yy3iVyzvlZZfmzhDuxLKN/zAkXFkBZArdfltEJ8j3b/1xlzDJ489fhy13jfN9V249mkn9pzDL+hy/37M9pzBJQlsCjleX+trzefZaRifADDxMZo3y7QbTU6PfjK6l/Fov777Pc/zgnbdv+9S3uswSUJfCwZbm3La+0Nrwfrtz5eVsl3vNHR6Aff//mmWUZ+yBrwwFlCTxuWe5ry1P3s9xfXTun4fftanlKWX4+7DEjkVfazzIxwW0/S0BZAg9clvva8mdHxXxfXXvK8ugN14+JucjfOXoIzzix3Cf6zp+fX/iOlzmDZ88hPM7gAZQl8MBl+SV34ndc/rvDMXqLY2O8XO7+wFLjqD3Kvx7C+O2ZNT8qy51/57f7MmN/6+g7R963dPDg7lPWhu99xG8vLICyBABAWQIAoCwBAEBZAgCgLAEAUJYAAKAsAQBQlgAAKEsAAJQlAAB84/8B/Q7b4uE04S8AAAAASUVORK5CYII=&quot; data-align=&quot;center&quot; alt=&quot;&quot; data-rotate=&quot;0&quot; style=&quot;width: 1339px; height: 866px; max-width: none; transform: rotate(0deg);&quot; data-proportion=&quot;true&quot; origin-size=&quot;883,573&quot; data-origin=&quot;150,97&quot; data-index=&quot;0&quot; data-file-name=&quot;баланс предложения и спроса.png&quot; data-file-size=&quot;14987&quot;&gt;&lt;/figure&gt;&lt;/div&gt;', 'About Us', 'About us Meta Tag Description ', 'About Us');
INSERT INTO `information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_h1`) VALUES
(5, 2, 'Terms &amp; Conditions', '&lt;p&gt;Lorem, ipsum dolor sit amet consectetur adipisicing elit. Voluptatibus soluta perferendis ratione velit voluptatem officia repudiandae itaque perspiciatis quas architecto mollitia amet, dolorum, totam natus ut omnis porro quaerat expedita!&lt;br&gt;Minus ipsam praesentium obcaecati libero, quia, expedita eligendi a, ipsa aliquid cum similique veritatis assumenda animi non? Nemo ullam, quos numquam ea pariatur vel et dolore accusamus harum veniam ducimus.&lt;br&gt;Eius libero numquam molestiae eaque accusamus vitae non minus et, cumque sunt optio quis nulla dolore alias pariatur exercitationem repudiandae amet corrupti ullam ipsam esse cupiditate distinctio eos perferendis! Maxime.&lt;br&gt;Asperiores, ab ut? Ipsum quaerat vitae, facere, in soluta similique asperiores dolor consectetur, quas nesciunt totam! Placeat possimus, id, vitae labore nisi minima quam officia officiis reiciendis soluta recusandae! Ea!&lt;br&gt;Sunt a animi, et similique eius mollitia sint alias debitis amet repellat vitae beatae tempore consequatur. Quod tenetur et, accusantium modi quia suscipit, doloremque maxime hic iusto illo omnis totam!&lt;br&gt;Voluptatibus laboriosam repudiandae deleniti ut deserunt? Ipsam repudiandae at animi eius fugiat, recusandae, numquam blanditiis corrupti laborum praesentium ut tenetur qui quas fugit possimus? Minus cum quae atque quis fugit.&lt;br&gt;Blanditiis inventore fuga, maiores aliquid odio vel! Ipsum perspiciatis, iusto rem vero quas officiis aperiam illum nihil distinctio nulla est, maxime velit laboriosam similique totam nisi perferendis quasi eaque doloribus?&lt;br&gt;Sit totam tempora natus cumque libero rem repudiandae fugiat molestiae ex at sunt impedit, quisquam numquam, quas nesciunt ab facere soluta quaerat ut quidem velit provident vitae! Fugiat, sit tempore!&lt;br&gt;Sint, quidem, quia officiis nemo perferendis dicta quibusdam, a saepe voluptates numquam aperiam dolor amet delectus id? Quos odio possimus officia nesciunt dolor aliquid impedit? Sequi quis quasi ipsam expedita.&lt;br&gt;Excepturi suscipit repellat qui nobis quod consequuntur dolore cumque error provident? Voluptatibus sint culpa excepturi, animi quod eligendi repellendus consequuntur possimus recusandae, temporibus repudiandae unde vitae iure doloremque similique nihil?&lt;br&gt;Autem a nobis iure expedita consectetur officiis libero alias laborum, repellendus necessitatibus! Numquam fugiat officiis corporis! Nemo perferendis animi quo repellat mollitia distinctio consequuntur, voluptatum deleniti esse eligendi corporis molestias.&lt;br&gt;Sint odio corrupti consectetur molestiae odit corporis quas eaque ratione dolores fugiat. Quae tenetur expedita incidunt quaerat voluptate rem suscipit. Et quas culpa cum nulla doloribus, distinctio temporibus! Sint, impedit?&lt;br&gt;Doloribus vel corporis dolorum autem similique perspiciatis aspernatur repudiandae at laborum ducimus rerum vitae iure, temporibus, numquam, quidem aut esse delectus velit iste. Suscipit eius, aspernatur nam necessitatibus in culpa!&lt;br&gt;Quod maiores vel animi! Iste, itaque fuga et atque assumenda accusantium rerum eligendi voluptatem amet tenetur sint natus minus adipisci dicta dolor ea excepturi distinctio dolorem eaque enim omnis quaerat!&lt;br&gt;Cumque aperiam minima dolores veniam! Vero doloremque placeat architecto officia accusantium quaerat, obcaecati itaque veritatis quam odio velit libero at dicta, aliquam a necessitatibus, perspiciatis hic. Magni dolorum consectetur dolores!&lt;br&gt;Provident quis obcaecati unde. Ipsam obcaecati minus incidunt nemo veritatis at reiciendis unde illo asperiores. Rem reprehenderit in, labore aperiam vero ullam voluptatum quos dolor, rerum perferendis, eius nesciunt. Quos!&lt;br&gt;Architecto libero non, quaerat eveniet natus asperiores laborum, nobis velit quam neque, porro debitis aut. Fugiat, autem? Aperiam dolorem recusandae ipsum, non quos quisquam similique molestiae repudiandae a cumque ullam.&lt;br&gt;Eligendi laborum facilis aut, officiis dicta assumenda eius nisi exercitationem doloremque quidem! Nam a voluptatem eos nostrum, ex quam, nobis repellendus quidem dolorem numquam qui est quaerat, accusamus vero quos!&lt;br&gt;Natus fugit nobis delectus aliquam, quasi labore eos totam incidunt eum ducimus libero dolorem expedita dolorum vel dignissimos consequatur assumenda itaque aut unde vitae modi dolores voluptatum, atque odio? Accusantium.&lt;br&gt;Exercitationem beatae rerum facere facilis eum hic, repellat corporis quas sit doloremque molestiae sunt maiores maxime harum odit repellendus, neque architecto recusandae? Illum porro tempore, alias minima neque dolore optio.&lt;br&gt;A deleniti dignissimos consectetur, aspernatur perspiciatis animi nemo cumque ullam incidunt inventore placeat est veritatis fuga, sint alias ipsa. Cumque harum, voluptatem architecto accusamus illum dolor vero optio quasi molestias.&lt;br&gt;Quibusdam cum vitae quae temporibus corporis, neque iusto consectetur asperiores unde exercitationem enim? Quis velit laboriosam pariatur debitis corrupti voluptate consequuntur molestias quaerat tenetur! Voluptates at ex molestiae deleniti sunt.&lt;br&gt;Non error alias fugit facilis magni neque eligendi iure dignissimos nobis. Facilis accusantium quos dolor doloremque nam dignissimos, nihil ducimus porro exercitationem debitis libero dolores accusamus iste, laboriosam autem ad!&lt;br&gt;Beatae iste sint atque natus nisi dolorem inventore obcaecati asperiores dolor consequuntur laboriosam iusto sit labore maxime vero, dolorum ea nemo voluptatum! Magni laborum quis hic earum, qui dolorum quod.&lt;br&gt;Nostrum obcaecati totam fugit est ea! Incidunt reprehenderit sit eum porro! Minus ipsum temporibus sed, repellat quia nulla in nisi qui aut repellendus labore officiis et quod. Eaque, aperiam animi?&lt;br&gt;Et illo cum, consectetur tenetur suscipit ratione enim pariatur, nulla saepe debitis sapiente blanditiis eligendi delectus excepturi molestias ex quae aliquam dolorum magnam, provident laudantium aut voluptate quo? Velit, itaque?&lt;br&gt;Alias atque doloribus, dolores quis similique placeat eius quas omnis adipisci quaerat quasi tempore, vitae ullam, necessitatibus sit doloremque voluptatem possimus facilis aut aliquam veritatis! Cum excepturi necessitatibus tenetur culpa.&lt;br&gt;Autem culpa numquam quasi explicabo tempore doloribus non ab ad, nulla voluptas harum molestiae voluptatem eaque dolore velit temporibus cupiditate consequuntur libero a architecto tempora illo. Enim nulla dolore eveniet?&lt;br&gt;Sit dolores deserunt enim blanditiis aliquid nesciunt incidunt, esse, eos sed cum fuga repudiandae, molestiae veritatis at nemo culpa saepe assumenda ipsam eius labore unde odit? Accusantium explicabo numquam aut?&lt;br&gt;Suscipit, voluptatibus dicta facere esse odio laudantium minima adipisci, reprehenderit nam sit neque atque molestias at beatae ullam voluptatem nulla earum qui cupiditate commodi itaque fuga ipsum incidunt alias. Numquam.&lt;br&gt;Architecto sapiente labore perferendis, delectus ipsum iusto aliquam fugit eum velit, veritatis esse nihil eaque tempore eos excepturi adipisci laboriosam? Vero provident in, recusandae corrupti sunt maiores magni perferendis cupiditate!&lt;br&gt;Suscipit non perspiciatis voluptatum eius, hic possimus tempora deleniti sapiente quibusdam quidem provident asperiores odio maiores est corrupti voluptatibus quos quam totam? Facilis ipsa quibusdam aliquid iusto quisquam quis dignissimos!&lt;br&gt;Aperiam earum iste similique sit possimus atque rerum deserunt commodi eligendi obcaecati quaerat hic quae quis assumenda eaque, repellat vero velit quia molestias nulla! Quia eligendi iste molestias nihil aut!&lt;br&gt;Laborum aliquid quia deleniti atque hic possimus mollitia doloribus, aspernatur debitis. Alias cum, asperiores error quos optio reiciendis voluptatum laborum animi, eum quae, itaque id architecto eaque est ullam commodi?&lt;br&gt;Sapiente accusamus earum, repellat delectus quia mollitia et molestiae veritatis fugiat nesciunt? Corporis voluptatum molestias eligendi ullam eaque deleniti quas, aspernatur praesentium facilis nulla, voluptatibus veritatis fuga, dolor odio laborum?&lt;br&gt;Et laudantium, saepe accusantium amet error doloribus perferendis iste libero obcaecati placeat reiciendis, necessitatibus voluptatum ullam consequatur aliquam neque facere? Ipsa corporis expedita voluptatum rem? Rem placeat aspernatur earum animi?&lt;br&gt;Cupiditate voluptatem quaerat vero nisi illo, consequuntur consequatur, labore soluta facilis repudiandae incidunt fugiat rerum quisquam? Nesciunt, nisi enim, incidunt vitae culpa ratione non nobis vero dolores, doloribus maxime blanditiis.&lt;br&gt;Minus facere praesentium reiciendis. Qui facilis porro voluptatum fugit debitis laboriosam provident voluptatibus ex nesciunt maiores aut quibusdam nobis aliquid consectetur id earum esse velit aliquam quas, consequatur iste. Placeat.&lt;br&gt;Harum velit laborum iste doloremque perferendis fugit placeat blanditiis error atque corporis! Quo officia possimus cumque voluptates quibusdam vel omnis, repellendus sequi, adipisci expedita dolor corrupti eligendi fugiat dicta suscipit.&lt;br&gt;Ducimus sit aspernatur modi eius pariatur placeat ex optio. Et velit quod quisquam aperiam amet voluptates dolores quibusdam quis officiis error ipsum laborum molestias expedita maiores, asperiores harum vero repellendus!&lt;br&gt;Aliquam delectus ut eius quia aperiam minima fugiat ipsum, reprehenderit nihil laborum placeat, tempora reiciendis unde distinctio quasi modi itaque perspiciatis voluptatibus deleniti, praesentium quae accusantium omnis suscipit dolorem? Facere.&lt;br&gt;Cum fugiat, doloribus vel ea quibusdam magnam dolorum, eius illum nam ipsum officia unde ad error numquam autem facere cumque ipsam expedita dolor dolorem reiciendis quam harum modi. Non, eos.&lt;br&gt;Reprehenderit sapiente molestiae repellendus vero necessitatibus rerum corrupti officia porro animi commodi ipsa fuga dolor debitis unde, quis tempora, voluptatem vitae sequi. Laborum eveniet perspiciatis quos laudantium quaerat mollitia nisi!&lt;br&gt;Dignissimos, in suscipit. Provident, ducimus! Adipisci accusamus, aperiam ab, ratione eum rerum est animi perferendis qui ea magni blanditiis illo, minus eaque perspiciatis unde eveniet quisquam alias atque voluptatum incidunt?&lt;br&gt;Iste officiis saepe earum qui itaque sit, molestiae nemo culpa magni doloribus ullam vitae? Sint provident odio facere in eius iure quia, ut nam minima eos numquam tempora, saepe repellendus.&lt;br&gt;Mollitia aliquam labore beatae dolorem itaque reiciendis perferendis fugit quos rem sit quis saepe, consectetur ipsum nulla cupiditate porro officia soluta id hic voluptatibus. Sequi illo deleniti harum placeat accusantium?&lt;br&gt;Numquam, non. Veniam et nisi dolore, laboriosam sit officiis cupiditate explicabo, quisquam iusto inventore perferendis repudiandae exercitationem. Corporis voluptates laboriosam aliquam reprehenderit ratione beatae omnis! Quas ad delectus illo minus!&lt;br&gt;Esse aspernatur, fugiat laboriosam illum eveniet vitae delectus at quaerat autem corrupti consectetur facilis natus molestiae ducimus sint nam quae amet aperiam! Eligendi sunt et quam? Nam placeat sunt odit.&lt;br&gt;Laboriosam illum et accusamus consequatur perferendis magnam excepturi inventore eaque ipsam velit ullam tempora doloremque, saepe, quia tempore numquam deleniti beatae modi non aliquid repudiandae libero! Similique culpa adipisci quam!&lt;br&gt;Mollitia quis quia, vitae tenetur consequatur assumenda natus officia facere consectetur. Qui perspiciatis repellendus cumque rem eos? Sunt, facere corrupti cumque hic ad at quia fugit temporibus soluta, facilis impedit.&lt;br&gt;Iure rerum, quaerat asperiores sequi commodi quidem illum obcaecati praesentium velit maiores reiciendis, eaque eum. At voluptatibus id omnis ad quia repellendus culpa ea fugiat, ab a sint obcaecati veniam.&lt;br&gt;Harum itaque voluptates, illum, iste quidem dolores beatae quos numquam impedit placeat veritatis accusamus quas obcaecati? Ipsum doloribus, vero, magni eaque consectetur esse a debitis, placeat et quae expedita ex.&lt;br&gt;Libero dolorem iste natus fugit repellendus aliquam ipsa cupiditate eos tempore earum magnam doloribus expedita, impedit minus voluptatem omnis neque maiores veritatis ex, culpa reprehenderit enim. Repudiandae saepe et commodi.&lt;br&gt;Perspiciatis, eum? Officia numquam fuga aut unde, quo velit harum exercitationem et laborum necessitatibus repellat id. Quam fuga, eum atque beatae non corrupti a ullam cum, ipsum, totam adipisci sint!&lt;br&gt;Dolores perferendis ut quas tempore fugit! Impedit dignissimos voluptatum voluptas magnam praesentium, eligendi esse harum accusantium reiciendis magni quam minima ratione minus quos fugiat unde corrupti quisquam perspiciatis excepturi id.&lt;br&gt;Nulla quidem optio odio fugiat, saepe aperiam reiciendis commodi tempore nemo sequi, magnam ullam ratione odit, atque reprehenderit cumque vel mollitia inventore beatae iste architecto. Rerum blanditiis hic corporis distinctio!&lt;br&gt;Distinctio dolor harum maxime assumenda maiores voluptatem iure vel suscipit quibusdam saepe, sed asperiores delectus exercitationem amet sit dolorum quia voluptates at voluptatibus. Cumque fugit ab nulla repellendus quo quia?&lt;br&gt;Quas error vel at blanditiis veritatis velit aliquam, modi voluptatum sed distinctio itaque ea quidem minus eveniet quae quis qui? Consequuntur atque natus id autem voluptatem vitae doloribus, deleniti quia!&lt;br&gt;Est rem commodi doloribus repellat voluptatum, libero voluptatibus quibusdam laboriosam minima natus reprehenderit et facere officia iste illum sunt id soluta ratione voluptas. Praesentium, aperiam. Ipsam molestias corrupti assumenda nesciunt!&lt;br&gt;Eum consectetur earum ipsa a nemo soluta assumenda, quis, minus ab praesentium rerum hic, autem eligendi quod itaque sit culpa! Fugiat eum quam aperiam asperiores, blanditiis eveniet inventore voluptates ipsum.&lt;br&gt;Quaerat, hic debitis vitae perspiciatis ipsam, iste rerum voluptatum repellat nam sequi quibusdam inventore quod cupiditate odit facilis rem quo! Dolore pariatur accusamus officiis facere perferendis ex ullam distinctio modi.&lt;br&gt;Accusamus non soluta pariatur similique vitae, enim numquam. Sequi, id? Dolores consectetur, suscipit iure facere doloremque ratione aspernatur tempora? Quo commodi at ad temporibus ipsum a odit neque similique tenetur.&lt;br&gt;Nihil, quae neque unde magnam molestias, necessitatibus ex eveniet quidem rerum, quo quisquam! Consectetur veritatis porro impedit, tenetur fugit expedita odio reprehenderit quidem recusandae laborum quia, temporibus modi at dolores.&lt;br&gt;Vitae aperiam tenetur eligendi qui doloribus aliquid, exercitationem, quis possimus aliquam molestiae dolores? Dolor itaque odit est inventore eos tempore tenetur porro! Nisi tempore placeat repellat eius delectus. Aperiam, aspernatur.&lt;br&gt;Omnis quidem blanditiis debitis ad officiis quaerat ratione laborum nihil, voluptatem laboriosam voluptate animi perferendis doloribus. Obcaecati sapiente quam excepturi dignissimos corrupti temporibus. Vitae quaerat facere, autem adipisci nulla consectetur.&lt;br&gt;Voluptatem excepturi odit ad nobis officiis doloremque nisi maiores cumque inventore explicabo animi ducimus alias, deleniti recusandae, quia odio neque quae officia cum iusto minima! Voluptatum reiciendis soluta tempora sunt.&lt;br&gt;Ullam esse voluptatibus iusto laudantium dolorum, consequatur culpa, eligendi rerum reprehenderit modi accusamus quidem voluptatum perspiciatis sapiente a explicabo impedit omnis, nam ipsa error tempore officiis beatae. Obcaecati, molestias placeat!&lt;br&gt;Incidunt, quaerat corporis? Nobis est exercitationem dicta vitae vero recusandae numquam, ipsam veritatis a minus suscipit illo voluptatem cupiditate voluptate perferendis labore omnis possimus atque porro dolore! Cumque, neque voluptates!&lt;br&gt;Debitis sint, vero quod fugit odit iure doloribus modi, minus ab repudiandae magni aperiam dicta beatae soluta numquam nemo itaque, nihil obcaecati quisquam atque consequatur animi quo dolorem? Eum, error!&lt;br&gt;Fugit optio molestiae itaque eligendi, eius praesentium commodi sint deleniti beatae? Molestias libero incidunt culpa! Quia obcaecati ex iusto, accusantium quisquam et officia fugiat cumque a cupiditate sunt autem eaque.&lt;br&gt;Expedita sit pariatur exercitationem obcaecati officia blanditiis eos reiciendis temporibus ea officiis quis, laboriosam repellat aliquam tenetur consequuntur repellendus nemo quos omnis consectetur ut suscipit vero. Expedita aliquid officiis nesciunt?&lt;br&gt;Alias esse dignissimos autem recusandae fugiat officiis possimus suscipit voluptatibus doloremque fugit sit veritatis blanditiis beatae, iure obcaecati et saepe necessitatibus, ad a vel assumenda, unde tempore. Cupiditate, sapiente in?&lt;br&gt;Consequatur expedita minus quaerat esse, nulla dolores aperiam rerum omnis nihil. Eius quidem illo voluptatibus exercitationem, quos nesciunt culpa doloremque nobis iusto alias accusantium provident ullam at. Quisquam, veniam nam!&lt;br&gt;Quasi voluptate labore inventore magni doloribus dolore nulla molestias blanditiis enim quae facere, praesentium, error omnis voluptas atque tenetur, sit dignissimos sequi. Eaque nesciunt animi blanditiis. Accusamus odio perspiciatis magnam?&lt;br&gt;Sunt dolores, consequatur aut veritatis suscipit nobis ipsam, aliquam eius explicabo iste sequi corporis magni ipsum recusandae quasi ex, modi hic laudantium quos architecto. Ex possimus minima voluptatum saepe totam!&lt;br&gt;Laudantium unde culpa voluptate dolorem voluptates ipsa asperiores consectetur iure quisquam sint illo ullam minima suscipit rem ad, omnis amet illum pariatur vitae vero expedita eveniet accusantium quod repudiandae? Fuga!&lt;br&gt;Velit, perspiciatis. Magni fuga enim eius sunt architecto consectetur ratione consequatur, minus illo quaerat repellat similique inventore beatae eos eligendi molestiae corrupti deleniti facere iure, quas a voluptatum voluptas culpa.&lt;br&gt;Quis, cupiditate! Odio alias ducimus facilis dolorem vitae veritatis voluptas laborum eligendi, culpa blanditiis, sed aperiam enim! Libero delectus ipsam, reprehenderit magni quia eveniet soluta, voluptatibus minus quidem fugit ex.&lt;br&gt;Culpa velit ducimus minima, repellat mollitia, similique modi odio debitis asperiores et magni accusantium vitae, maiores nostrum ea dicta quod harum voluptate earum sapiente esse. Atque quisquam ullam temporibus id?&lt;br&gt;Molestias distinctio beatae aperiam, ad corporis recusandae minima aliquam reiciendis soluta officiis cupiditate odio? Nemo perspiciatis necessitatibus, porro mollitia id possimus odio non dolore. Quae numquam praesentium cumque in sit?&lt;br&gt;Doloribus similique itaque autem. Consequuntur, eius consectetur. Omnis qui alias saepe, ex cupiditate aliquid iste, illo dicta dignissimos facere sapiente nesciunt dolorum blanditiis possimus eveniet nam ipsam porro expedita ducimus!&lt;br&gt;Aliquid impedit, dicta animi architecto id quas dolorum odit expedita adipisci, beatae iusto commodi, dolores distinctio neque sunt nemo quia molestias enim soluta nobis facilis aut asperiores? Minus, tempore sapiente.&lt;br&gt;Repellendus facere porro laudantium dolorem cupiditate soluta, doloremque nisi officiis? Nam saepe quo accusamus, ex maxime fuga, libero ipsam ducimus consequuntur ut aperiam hic ea deserunt fugiat sed dolores in?&lt;br&gt;Voluptates eligendi est possimus asperiores. Inventore reiciendis repellat illo! Nihil, culpa aspernatur dolor nam hic, tempore totam ex recusandae minima asperiores labore nisi cum nobis dolore minus magnam voluptatibus autem.&lt;br&gt;Facilis quaerat doloribus eligendi odio eveniet veritatis, neque mollitia necessitatibus placeat ratione deleniti reiciendis amet cum esse voluptatibus maxime debitis expedita repellat, molestias id repellendus cumque nam? Vitae, porro accusantium.&lt;br&gt;Officiis repellat fugiat ratione atque voluptatum recusandae repellendus at corrupti! Aliquam, ut quaerat. Rerum ipsum eos fugit quia laboriosam quaerat, nisi, adipisci, libero sapiente eaque exercitationem aspernatur! Enim, quod dolor?&lt;br&gt;Maiores quis commodi ducimus provident sapiente rem laborum dolor animi tenetur? Dolores aperiam distinctio harum quidem tenetur, repellat incidunt quaerat. Beatae exercitationem quo a minus est odio explicabo sed laboriosam?&lt;br&gt;Dicta quod ipsa nostrum dolorem ullam? Eum quisquam voluptatem voluptates blanditiis delectus quod, dignissimos cumque aperiam cupiditate mollitia voluptatibus porro dolore reiciendis ad obcaecati. Dolorem nihil non possimus illo reprehenderit.&lt;br&gt;At eum aspernatur accusantium earum delectus odit doloremque commodi. Consequuntur enim accusamus saepe a, modi nisi nulla error provident, expedita sit recusandae necessitatibus voluptatem officia delectus, temporibus voluptate suscipit exercitationem.&lt;br&gt;Soluta consectetur laudantium aliquam mollitia pariatur ipsam maxime id modi animi alias exercitationem vitae voluptates quis, blanditiis sint ducimus corporis officia itaque praesentium tempore nesciunt. Repellendus dignissimos repellat sequi nisi.&lt;br&gt;Voluptates incidunt excepturi placeat nulla voluptas quis quasi unde deserunt sunt fuga laborum repudiandae hic et veritatis quas officiis deleniti quibusdam fugit, odio magni animi rem pariatur quod dolorem? Quam?&lt;br&gt;Ducimus, consectetur sunt itaque placeat at quos eligendi reiciendis quod voluptatibus illo temporibus esse dicta in ipsa corrupti quas quaerat laborum numquam eos libero. Iusto aspernatur consequatur quo error nihil!&lt;br&gt;Cum, facere repellendus! Sapiente, temporibus! Neque modi repellendus at labore! Consequatur quidem blanditiis necessitatibus voluptas quisquam, neque sapiente numquam totam quo, excepturi exercitationem obcaecati quia eligendi facilis veniam minima provident.&lt;br&gt;Saepe corrupti dolorem quam praesentium exercitationem ipsam eum sint sed culpa. Laboriosam quam suscipit id ea perspiciatis neque possimus, impedit eius odit nobis, eaque incidunt necessitatibus, dolorem provident doloremque sunt.&lt;br&gt;Necessitatibus, ducimus! Neque odit adipisci labore cum architecto error enim quisquam ea iure animi ducimus dolorum nam aperiam voluptas tempore, vero nisi ipsum omnis aut, magnam eveniet accusamus laboriosam porro?&lt;br&gt;Consectetur similique ratione impedit soluta omnis nisi provident! Ad blanditiis, asperiores cumque dicta delectus et, harum, velit ratione commodi quo aliquam non animi inventore iste perferendis sint quidem doloribus? Eius.&lt;br&gt;Pariatur ea voluptatem delectus magnam rerum odit dolores inventore eligendi odio corporis, praesentium harum mollitia nostrum sequi maxime iure expedita fuga explicabo ducimus suscipit hic itaque! Quasi numquam vitae dignissimos!&lt;br&gt;Omnis consequatur, molestias, harum perspiciatis ipsum amet hic officia quod fuga quo rerum enim eum veniam minus temporibus quae possimus voluptate! Corporis eum ut perspiciatis, consectetur eaque beatae autem sit?&lt;br&gt;Repellendus alias similique minima nihil? Voluptate harum, accusantium reprehenderit expedita odio, a necessitatibus eius error quod cum doloribus tenetur quo esse unde obcaecati ex maxime perspiciatis nemo sed sapiente aliquid!&lt;br&gt;Aut ad mollitia amet reprehenderit. Ea minus dolores molestiae, culpa modi qui nam quasi earum praesentium tenetur at! Esse mollitia quisquam fugiat dignissimos deleniti omnis quae eos quidem fugit porro.&lt;br&gt;&lt;/p&gt;', 'Terms &amp; Conditions', 'Terms &amp; Conditions', 'Terms &amp; Conditions'),
(6, 2, 'Delivery Information', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Beatae illo inventore laboriosam consequuntur alias atque quas voluptatem voluptatum suscipit tempore officiis dolor eligendi quae earum vero unde eveniet, blanditiis libero.&lt;/span&gt;&lt;br&gt;Alias quam libero dicta quos ut voluptatem assumenda corporis nam, voluptas, accusamus error natus iusto aspernatur vel minima eaque id iure. Praesentium atque architecto dignissimos, doloremque ipsam sed quod ipsa.&lt;br&gt;Quod cum sapiente laudantium veritatis amet aliquam perspiciatis quasi a tempore, ducimus voluptas ratione harum incidunt ullam aliquid veniam fuga cupiditate voluptatum ad nostrum. Fugit reprehenderit dolorum ratione nesciunt temporibus.&lt;br&gt;Odio, placeat! Vero cum corrupti numquam illum blanditiis, dolore magnam nam iusto animi omnis tenetur hic debitis natus non possimus labore sapiente totam perferendis impedit fugiat libero? Nemo, culpa cum?&lt;br&gt;Facilis quos ad molestias mollitia sed? Molestias aut consequatur laudantium similique, possimus inventore tenetur exercitationem earum tempora dolorum quas cum ut, facere minus repellendus vitae rem quae quis suscipit nisi.&lt;br&gt;Animi mollitia molestias maxime quam officia eligendi, illum libero explicabo amet nam, tempore iste veritatis deserunt ad exercitationem minima quo, repellendus est accusantium hic? Possimus eveniet natus officiis vero accusamus?&lt;br&gt;Quam, debitis perferendis placeat accusantium soluta hic error quod aliquam itaque quidem praesentium impedit necessitatibus porro laboriosam assumenda et ea veniam ad corporis esse quasi ducimus rem quis. Totam, officiis?&lt;br&gt;Voluptatibus itaque quae veritatis sapiente, nulla sunt animi facilis labore sit, ab vero voluptatem beatae iste odio earum, alias rerum impedit est. Nisi adipisci magni esse necessitatibus labore! Officia, vitae.&lt;br&gt;Atque expedita dignissimos, placeat esse, perferendis quidem deleniti, praesentium libero ullam nihil impedit temporibus deserunt facere voluptas. Facilis tenetur id voluptatibus, quaerat vel laboriosam velit reprehenderit beatae asperiores sint excepturi.&lt;br&gt;Porro temporibus totam voluptatibus facere doloribus voluptatum delectus, quia mollitia nisi magnam cum hic at dolorem officia veniam, quisquam cumque consequatur tenetur sunt laudantium excepturi. Explicabo voluptatum aliquam officiis quaerat?&lt;br&gt;Quas aliquid obcaecati perspiciatis corrupti voluptate assumenda, nostrum vitae omnis delectus, nobis in commodi quia recusandae veniam error! Sed quod alias officiis esse molestias voluptate ea incidunt enim porro natus.&lt;br&gt;Porro corporis aliquam qui doloribus facilis minima. Unde, corporis veritatis iure, incidunt labore placeat, vel a tempora perferendis nihil alias dolor culpa! Alias maiores sint modi beatae ex facere veniam?&lt;br&gt;Reprehenderit ratione harum perferendis sequi repudiandae voluptatum aut molestiae maxime ipsa excepturi saepe, architecto pariatur rem voluptas quisquam facere, veritatis molestias esse laboriosam. Placeat recusandae pariatur iste nemo sit! Consequuntur!&lt;br&gt;Magni consequuntur eius nostrum placeat harum quaerat tenetur ipsam, tempora, expedita ad pariatur accusantium cum blanditiis iste minus nemo. Illum molestiae facilis est ducimus vero quam itaque officia, sunt consequuntur.&lt;br&gt;Dolorem quidem tempora quis hic autem voluptatum aspernatur dolores, earum est nemo. Nesciunt exercitationem illo, delectus obcaecati dolore quidem provident nihil enim atque, cumque omnis ipsa tempore iste, maxime asperiores?&lt;br&gt;&lt;/p&gt;', 'Delivery Information', 'Delivery Information', 'Delivery Information'),
(7, 2, 'test', '&lt;p&gt;​&lt;/p&gt;&lt;p&gt;uno&lt;/p&gt;', 'test', 'test', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `information_to_layout`
--

CREATE TABLE `information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `information_to_layout`
--

INSERT INTO `information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(3, 0, 0),
(4, 0, 0),
(5, 0, 0),
(6, 0, 0),
(7, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `information_to_store`
--

CREATE TABLE `information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `information_to_store`
--

INSERT INTO `information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(2, 'English', 'en-gb', 'en-US,en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `layout`
--

CREATE TABLE `layout` (
  `layout_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `layout`
--

INSERT INTO `layout` (`layout_id`, `name`) VALUES
(1, 'common/home'),
(3, 'product/category'),
(4, '_default'),
(5, 'product/manufacturer'),
(8, 'information/contact'),
(11, 'information/information'),
(13, 'product/search'),
(14, 'blog/latest'),
(15, 'blog/category'),
(16, 'blog/article'),
(17, 'product/manufacturer/info'),
(18, 'product/product'),
(19, 'error/not_found'),
(20, 'checkout/cart'),
(21, 'checkout/onepagecheckout');

-- --------------------------------------------------------

--
-- Table structure for table `layout_module`
--

CREATE TABLE `layout_module` (
  `layout_module_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `layout_module`
--

INSERT INTO `layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(175, 18, 'random.8', 'content_bottom', 0),
(190, 19, 'blocksforallcategories.6', 'content_bottom', 0),
(191, 19, 'random.8', 'content_bottom', 1),
(201, 1, 'slideshow.1', 'content_top', 0),
(202, 1, 'blocksforallcategories.6', 'content_top', 1),
(203, 1, 'random.8', 'content_top', 2),
(204, 1, 'latest.12', 'content_top', 3),
(205, 1, 'blog_latest.11', 'content_top', 4),
(206, 1, 'html.10', 'content_top', 5),
(207, 1, 'special.13', 'content_top', 6),
(208, 1, 'featured.15', 'content_top', 7),
(213, 3, 'random.8', 'column', 0),
(214, 3, 'specialpercategory.14', 'content_bottom', 0),
(215, 3, 'latestpercategory.16', 'content_bottom', 1);

-- --------------------------------------------------------

--
-- Table structure for table `layout_route`
--

CREATE TABLE `layout_route` (
  `layout_route_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `layout_route`
--

INSERT INTO `layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(98, 18, 0, 'product/product'),
(101, 14, 0, 'blog/latest'),
(102, 11, 0, 'information/information'),
(103, 15, 0, 'blog/category'),
(104, 16, 0, 'blog/article'),
(106, 13, 0, 'product/search'),
(107, 8, 0, 'information/contact'),
(108, 5, 0, 'product/manufacturer'),
(109, 17, 0, 'product/manufacturer/info'),
(110, 19, 0, 'error/not_found'),
(113, 20, 0, 'checkout/cart'),
(115, 4, 0, ''),
(116, 21, 0, 'checkout/onepagecheckout'),
(118, 1, 0, 'common/home'),
(120, 3, 0, 'product/category');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `name`, `address`, `telephone`, `fax`, `geocode`, `image`, `open`, `comment`) VALUES
(1, 'Location 1', 'Location 1 Addres', '1234567890', '1234567890', '213123', 'catalog/logos/logo.png', '9:00 - 18:00, 10:00 - 17:00', 'Location 1 Comment'),
(2, 'Location 2', 'Location 2 Addres', '0987654321', '0987654321', '4345654645', 'catalog/logos/logo.png', '9:00 - 18:00, 10:00 - 17:00', 'Location 2 Comment');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `noindex` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`manufacturer_id`, `name`, `image`, `noindex`, `sort_order`) VALUES
(5, 'Possimus', 'catalog/demo_categories/6.jpg', 1, 0),
(6, 'Quos', 'catalog/demo_categories/8.jpg', 1, 0),
(7, 'Deleniti', 'catalog/demo_categories/3.jpg', 1, 0),
(8, 'Maiores', 'catalog/demo_categories/2.jpg', 1, 0),
(9, 'Tempora', 'catalog/demo_categories/1.jpg', 1, 0),
(10, 'Corrupti', 'catalog/demo_categories/5.jpg', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer_description`
--

CREATE TABLE `manufacturer_description` (
  `manufacturer_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `description_bottom` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manufacturer_description`
--

INSERT INTO `manufacturer_description` (`manufacturer_id`, `language_id`, `description`, `description_bottom`, `meta_description`, `meta_title`, `meta_h1`) VALUES
(5, 2, '&lt;p&gt;Possimus&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Possimus&lt;br&gt;&lt;/p&gt;', 'Possimus', 'Possimus', 'Possimus'),
(6, 2, '&lt;p&gt;Quos&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Quos&lt;br&gt;&lt;/p&gt;', 'Quos', 'Quos', 'Quos'),
(7, 2, '&lt;p&gt;Deleniti&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Deleniti&lt;br&gt;&lt;/p&gt;', 'Deleniti', 'Deleniti', 'Deleniti'),
(8, 2, '&lt;p&gt;Maiores&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Maiores&lt;br&gt;&lt;/p&gt;', 'Maiores', 'Maiores', 'Maiores'),
(9, 2, '&lt;p&gt;Tempora&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Tempora&lt;br&gt;&lt;/p&gt;', 'Tempora', 'Tempora', 'Tempora'),
(10, 2, '&lt;p&gt;Corrupti&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Corrupti&lt;br&gt;&lt;/p&gt;', 'Corrupti', 'Corrupti', 'Corrupti');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer_to_layout`
--

CREATE TABLE `manufacturer_to_layout` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `manufacturer_to_layout`
--

INSERT INTO `manufacturer_to_layout` (`manufacturer_id`, `store_id`, `layout_id`) VALUES
(5, 0, 0),
(6, 0, 0),
(7, 0, 0),
(8, 0, 0),
(9, 0, 0),
(10, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer_to_store`
--

CREATE TABLE `manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manufacturer_to_store`
--

INSERT INTO `manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `marketing`
--

CREATE TABLE `marketing` (
  `marketing_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `type` varchar(6) NOT NULL,
  `link` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `menu_description`
--

CREATE TABLE `menu_description` (
  `menu_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `menu_module`
--

CREATE TABLE `menu_module` (
  `menu_module_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `module_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`module_id`, `name`, `code`, `setting`) VALUES
(1, 'module_slideshow', 'slideshow', '{\"name\":\"module_slideshow\",\"banner_id\":\"9\",\"width\":\"1920\",\"height\":\"550\",\"status\":\"1\"}'),
(6, 'module_blocksforallcategories', 'blocksforallcategories', '{\"name\":\"module_blocksforallcategories\",\"category_limit\":\"100\",\"sub_category_limit\":\"4\",\"width\":\"266\",\"height\":\"266\",\"cover_status\":\"1\",\"status\":\"1\"}'),
(8, 'module_randomproducts', 'random', '{\"name\":\"module_randomproducts\",\"limit\":\"9\",\"width\":\"257\",\"height\":\"257\",\"status\":\"1\"}'),
(10, 'module_htmlcontent_about', 'html', '{\"name\":\"module_htmlcontent_about\",\"module_description\":{\"2\":{\"title\":\"Sunrise CMS Demo\",\"description\":\"&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Debitis error, rem similique fugiat vel quaerat iure tenetur corrupti itaque quae mollitia incidunt eum qui ea, distinctio quis ipsam nulla optio.&lt;br&gt;Odit exercitationem culpa expedita laboriosam modi libero? Similique eius quaerat error voluptas, excepturi voluptates recusandae quas ipsa magni. Explicabo a facilis repellendus, vero quod suscipit dolorem sint modi voluptatum tempora.&lt;br&gt;Commodi quos voluptate voluptas incidunt dicta cum debitis nisi reiciendis nostrum? Rerum, fugiat labore? Vel eum dolor soluta, sed, cumque voluptatem quisquam dolore, tempore illum optio obcaecati provident ullam laudantium.&lt;br&gt;In debitis molestias perspiciatis esse! Incidunt, recusandae! Aspernatur fugit eaque quo dolores dignissimos deserunt excepturi velit reprehenderit facere perferendis eveniet repudiandae magnam quaerat sequi voluptate tenetur ullam, dolore error itaque.&lt;br&gt;Nobis, asperiores dignissimos. Porro laborum nemo minus molestiae quidem fugit dolorum? Veniam deserunt quia sint delectus necessitatibus quidem beatae quaerat odio obcaecati nemo optio, hic unde, eius itaque eos libero?&lt;br&gt;Hic, ipsam provident! Laboriosam perspiciatis rem iure est fuga eum quod tempora nam reprehenderit odit ullam, similique corrupti perferendis minima quas labore sed aliquid voluptate dolores nihil ratione animi dolorum?&lt;br&gt;Explicabo a repellat, labore laboriosam sapiente consequatur iusto temporibus consectetur pariatur quae nesciunt eum adipisci earum doloremque obcaecati. Consequatur quasi laboriosam, tempore incidunt porro illo neque eum et eos architecto.&lt;br&gt;Sit est itaque repellendus iure repellat, incidunt ut dolorem omnis sunt velit voluptates amet libero magnam cupiditate. Laborum repellat aliquam rerum quas vel nam quae, provident, blanditiis est, eos ab?&lt;br&gt;Iure voluptatem soluta recusandae officiis excepturi suscipit, alias quo ipsam sit dolore sapiente deserunt a mollitia voluptate, quibusdam, atque non similique labore quasi ea repellendus assumenda quas esse. Reprehenderit, aperiam.&lt;br&gt;Aperiam, nostrum nobis suscipit rerum quo aspernatur consequatur in aut dolor enim, soluta vel quam blanditiis beatae dignissimos sit. Quam enim voluptate beatae quia incidunt itaque mollitia distinctio, quasi cum.&lt;br&gt;&lt;\\/p&gt;\"}},\"status\":\"1\"}'),
(11, 'module_latestarticles_main', 'blog_latest', '{\"name\":\"module_latestarticles_main\",\"limit\":\"9\",\"width\":\"257\",\"height\":\"257\",\"status\":\"1\"}'),
(12, 'module_latest_main', 'latest', '{\"name\":\"module_latest_main\",\"limit\":\"9\",\"width\":\"257\",\"height\":\"257\",\"status\":\"1\"}'),
(13, 'module_specials_main', 'special', '{\"name\":\"module_specials_main\",\"limit\":\"9\",\"width\":\"257\",\"height\":\"257\",\"status\":\"1\"}'),
(14, 'module_specialspercategory', 'specialpercategory', '{\"name\":\"module_specialspercategory\",\"limit\":\"9\",\"width\":\"257\",\"height\":\"257\",\"status\":\"1\"}'),
(15, 'module_featured_main', 'featured', '{\"name\":\"module_featured_main\",\"product_name\":\"\",\"product\":[\"42\"],\"limit\":\"9\",\"width\":\"257\",\"height\":\"257\",\"status\":\"1\"}'),
(16, 'module_latestpercategory', 'latestpercategory', '{\"name\":\"module_latestpercategory\",\"limit\":\"9\",\"width\":\"257\",\"height\":\"257\",\"status\":\"1\"}'),
(19, 'module_popularproducts', 'popular', '{\"name\":\"module_popularproducts\",\"limit\":\"9\",\"width\":\"257\",\"height\":\"257\",\"status\":\"1\"}');

-- --------------------------------------------------------

--
-- Table structure for table `option`
--

CREATE TABLE `option` (
  `option_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `option`
--

INSERT INTO `option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11),
(13, 'select', 1),
(14, 'radio', 2),
(15, 'checkbox', 3);

-- --------------------------------------------------------

--
-- Table structure for table `option_description`
--

CREATE TABLE `option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `option_description`
--

INSERT INTO `option_description` (`option_id`, `language_id`, `name`) VALUES
(13, 2, 'Option 1'),
(14, 2, 'Option 2'),
(15, 2, 'Option 3');

-- --------------------------------------------------------

--
-- Table structure for table `option_value`
--

CREATE TABLE `option_value` (
  `option_value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `option_value`
--

INSERT INTO `option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(23, 2, '', 1),
(24, 2, '', 2),
(31, 1, '', 2),
(32, 1, '', 1),
(39, 5, '', 1),
(40, 5, '', 2),
(41, 5, '', 3),
(42, 5, '', 4),
(43, 1, '', 3),
(44, 2, '', 3),
(45, 2, '', 4),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3),
(49, 13, 'catalog/logos/logo-small.png', 1),
(50, 13, 'catalog/logos/logo-small.png', 2),
(51, 13, 'catalog/logos/logo-small.png', 3),
(52, 13, 'catalog/logos/logo-small.png', 4),
(53, 13, 'catalog/logos/logo-small.png', 5),
(54, 13, '', 6),
(55, 13, '', 7),
(56, 13, '', 8),
(57, 13, '', 9),
(58, 13, '', 10),
(59, 14, 'catalog/logos/logo-small.png', 1),
(60, 14, 'catalog/logos/logo-small.png', 2),
(61, 14, 'catalog/logos/logo-small.png', 3),
(62, 14, 'catalog/logos/logo-small.png', 4),
(63, 14, 'catalog/logos/logo-small.png', 5),
(64, 14, '', 6),
(65, 14, '', 7),
(66, 14, '', 8),
(67, 14, '', 9),
(68, 14, '', 10),
(69, 15, 'catalog/logos/logo-small.png', 1),
(70, 15, 'catalog/logos/logo-small.png', 2),
(71, 15, 'catalog/logos/logo-small.png', 3),
(72, 15, 'catalog/logos/logo-small.png', 4),
(73, 15, 'catalog/logos/logo-small.png', 5),
(74, 15, '', 6),
(75, 15, '', 7),
(76, 15, '', 8),
(77, 15, '', 9),
(78, 15, '', 10);

-- --------------------------------------------------------

--
-- Table structure for table `option_value_description`
--

CREATE TABLE `option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `option_value_description`
--

INSERT INTO `option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(49, 2, 13, 'Option 1-1'),
(50, 2, 13, 'Option 1-2'),
(51, 2, 13, 'Option 1-3'),
(52, 2, 13, 'Option 1-4'),
(53, 2, 13, 'Option 1-5'),
(54, 2, 13, 'Option 1-6'),
(55, 2, 13, 'Option 1-7'),
(56, 2, 13, 'Option 1-8'),
(57, 2, 13, 'Option 1-9'),
(58, 2, 13, 'Option 1-10'),
(59, 2, 14, 'Option 2-1'),
(60, 2, 14, 'Option 2-2'),
(61, 2, 14, 'Option 2-3'),
(62, 2, 14, 'Option 2-4'),
(63, 2, 14, 'Option 2-5'),
(64, 2, 14, 'Option 2-6'),
(65, 2, 14, 'Option 2-7'),
(66, 2, 14, 'Option 2-8'),
(67, 2, 14, 'Option 2-9'),
(68, 2, 14, 'Option 2-10'),
(69, 2, 15, 'Option 3-1'),
(70, 2, 15, 'Option 3-2'),
(71, 2, 15, 'Option 3-3'),
(72, 2, 15, 'Option 3-4'),
(73, 2, 15, 'Option 3-5'),
(74, 2, 15, 'Option 3-6'),
(75, 2, 15, 'Option 3-7'),
(76, 2, 15, 'Option 3-8'),
(77, 2, 15, 'Option 3-9'),
(78, 2, 15, 'Option 3-10');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(60) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_custom_field`
--

CREATE TABLE `order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_history`
--

CREATE TABLE `order_history` (
  `order_history_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_option`
--

CREATE TABLE `order_option` (
  `order_option_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `order_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`order_status_id`, `language_id`, `name`) VALUES
(1, 2, 'Pending'),
(2, 2, 'Processing'),
(3, 2, 'Shipped'),
(5, 2, 'Complete'),
(7, 2, 'Canceled'),
(8, 2, 'Denied'),
(9, 2, 'Canceled Reversal'),
(10, 2, 'Failed'),
(11, 2, 'Refunded'),
(12, 2, 'Reversed'),
(13, 2, 'Chargeback'),
(14, 2, 'Expired'),
(15, 2, 'Processed'),
(16, 2, 'Voided');

-- --------------------------------------------------------

--
-- Table structure for table `order_total`
--

CREATE TABLE `order_total` (
  `order_total_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '1000-01-01',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `marked_product` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `noindex` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `width`, `height`, `subtract`, `minimum`, `sort_order`, `status`, `marked_product`, `viewed`, `noindex`, `date_added`, `date_modified`) VALUES
(42, '837463782', 'Product 1 SKU', 'Product 1 UP', 'Product 1 EAN', 'Product 1 JAN', 'Product 1 ISBN', 'Product 1 MNP', 'Product 1 Location', 999, 5, 'catalog/demo_products/product_1/nikolay-tarashchenko-551722-unsplash.jpg', 8, 1, '98765.0000', 400, 9, '2018-11-02', '0.00000000', '0.00000000', 0, 2, 1, 1, 0, 1470, 1, '2009-02-03 21:07:37', '2018-12-19 18:07:54'),
(64, '94387843574', '', '', 'Product 2 EAN', 'Product 2 JAN', 'Product 2 ISBN', 'Product 2 MNP', 'Product 2 Location', 999, 5, 'catalog/demo_products/product_1/goran-ivos-771531-unsplash.jpg', 8, 1, '98123.0000', 400, 9, '2018-11-02', '0.00000000', '0.00000000', 0, 1, 1, 1, 0, 61, 1, '2018-11-16 14:06:22', '2018-11-16 14:13:54'),
(80, '6-98640594', '', '', 'Product 3 EAN', 'Product 3 JAN', 'Product 3 ISBN', 'Product 3 MNP', 'Product 3 Location', 999, 5, 'catalog/demo_products/product_1/alejandro-escamilla-10-unsplash.jpg', 8, 1, '98765.0000', 400, 9, '2018-11-02', '0.00000000', '0.00000000', 0, 4, 1, 1, 0, 66, 1, '2018-11-16 14:15:20', '2018-11-16 14:17:33'),
(82, '5640-965', '', '', 'Product 4 EAN', 'Product 4 JAN', 'Product 4 ISBN', 'Product 4 MNP', 'Product 4 Location', 999, 5, 'catalog/demo_products/product_1/aidan-hancock-609469-unsplash.jpg', 8, 1, '98765.0000', 400, 9, '2018-11-02', '0.00000000', '0.00000000', 0, 1, 1, 1, 0, 70, 1, '2018-11-16 14:15:24', '2018-11-16 14:20:05'),
(83, '098709865', '', '', 'Product 5 EAN', 'Product 5 JAN', 'Product 5 ISBN', 'Product 5 MNP', 'Product 5 Location', 999, 5, 'catalog/demo_products/product_1/andras-vas-655218-unsplash.jpg', 8, 1, '98765.0000', 400, 9, '2018-11-02', '0.00000000', '0.00000000', 0, 1, 1, 1, 0, 47, 1, '2018-11-16 14:15:24', '2018-11-16 14:24:35'),
(86, '43975943', '', '', 'Product 6 EAN', 'Product 6 JAN', 'Product 6 ISBN', 'Product 6 MNP', 'Product 6 Location', 999, 5, 'catalog/demo_products/product_1/burst-521042-unsplash.jpg', 8, 1, '98765.0000', 400, 9, '2018-11-02', '0.00000000', '0.00000000', 0, 1, 1, 1, 0, 49, 1, '2018-11-16 14:15:27', '2018-11-16 14:26:52'),
(87, '463564564', '', '', 'Product 7 EAN', 'Product 7 JAN', 'Product 7 ISBN', 'Product 7 MNP', 'Product 7 Location', 999, 5, 'catalog/demo_products/product_1/caspar-rubin-224229-unsplash.jpg', 8, 1, '98765.0000', 400, 9, '2018-11-02', '0.00000000', '0.00000000', 0, 1, 1, 1, 0, 49, 1, '2018-11-16 14:15:27', '2018-11-16 14:48:17'),
(88, '409850435', '', '', 'Product 8 EAN', 'Product 8 JAN', 'Product 8 ISBN', 'Product 8 MNP', 'Product 8 Location', 999, 5, 'catalog/demo_products/product_1/charles-deluvio-456792-unsplash.jpg', 8, 1, '98765.0000', 400, 9, '2018-11-02', '0.00000000', '0.00000000', 0, 2, 1, 1, 0, 50, 1, '2018-11-16 14:15:27', '2018-11-16 14:40:15'),
(89, '4534543543', '', '', 'Product 9 EAN', 'Product 9 JAN', 'Product 9 ISBN', 'Product 9 MNP', 'Product 9 Location', 999, 5, 'catalog/demo_products/product_1/evan-gebhart-666379-unsplash.jpg', 8, 1, '98765.0000', 400, 9, '2018-11-02', '0.00000000', '0.00000000', 0, 3, 1, 1, 0, 48, 1, '2018-11-16 14:15:27', '2018-11-16 14:41:47'),
(96, '59798343', '', '', 'Product 10 EAN', 'Product 10 JA', 'Product 10 ISBN', 'Product 10 MNP', 'Product 10 Location', 999, 5, 'catalog/demo_products/product_1/dillon-shook-511764-unsplash.jpg', 8, 1, '99999.0000', 400, 9, '2018-11-02', '0.00000000', '0.00000000', 0, 1, 1, 1, 0, 85, 1, '2018-11-16 14:49:44', '2018-11-16 14:55:20'),
(97, '59798343', '', '', 'Product 11 EAN', 'Product 11 JA', 'Product 11 ISBN', 'Product 11 MNP', 'Product 11 Location', 999, 5, 'catalog/demo_products/product_1/ibrahim-rifath-720971-unsplash.jpg', 8, 1, '99999.0000', 400, 9, '2018-11-02', '0.00000000', '0.00000000', 0, 1, 1, 1, 0, 59, 1, '2018-11-16 14:54:27', '2018-11-16 14:56:23'),
(98, '54465465765', '', '', 'Product 12 EAN', 'Product 12 JA', 'Product 12 ISBN', 'Product 12 MNP', 'Product 12 Location', 999, 5, 'catalog/demo_products/product_1/julian-o-hayon-257567-unsplash.jpg', 8, 1, '99999.0000', 400, 9, '2018-11-02', '0.00000000', '0.00000000', 0, 1, 1, 1, 0, 54, 1, '2018-11-16 14:54:31', '2018-11-16 14:57:35'),
(99, '543085043854', '', '', 'Product 13 EAN', 'Product 13 JA', 'Product 13 ISBN', 'Product 13 MNP', 'Product 13 Location', 999, 5, 'catalog/demo_products/product_1/max-nelson-492729-unsplash.jpg', 8, 1, '99999.0000', 400, 9, '2018-11-02', '0.00000000', '0.00000000', 0, 1, 1, 1, 0, 58, 1, '2018-11-16 14:54:31', '2018-11-16 14:58:35'),
(100, '56546546478', '', '', 'Product 14 EAN', 'Product 14 JA', 'Product 14 ISBN', 'Product 14 MNP', 'Product 14 Location', 999, 5, 'catalog/demo_products/product_1/nikolay-tarashchenko-551717-unsplash.jpg', 8, 1, '99999.0000', 400, 9, '2018-11-02', '0.00000000', '0.00000000', 0, 1, 1, 1, 0, 63, 1, '2018-11-16 14:54:36', '2018-11-16 14:59:27'),
(101, '587643853', '', '', 'Product 15 EAN', 'Product 15 JA', 'Product 15 ISBN', 'Product 15 MNP', 'Product 15 Location', 999, 5, 'catalog/demo_products/product_1/nikolay-tarashchenko-614285-unsplash.jpg', 8, 1, '99999.0000', 400, 9, '2018-11-02', '0.00000000', '0.00000000', 0, 1, 1, 1, 0, 102, 1, '2018-11-16 14:54:36', '2018-11-16 15:00:22'),
(102, '65765765', '', '', 'Product 16 EAN', 'Product 16 JA', 'Product 16 ISBN', 'Product 16 MNP', 'Product 16 Location', 999, 5, 'catalog/demo_products/product_1/realmac-dan-365523-unsplash.jpg', 8, 1, '99999.0000', 400, 9, '2018-11-02', '0.00000000', '0.00000000', 0, 1, 1, 1, 0, 64, 1, '2018-11-16 14:54:36', '2018-11-16 15:01:16'),
(103, '65765765', '', '', 'Product 17 EAN', 'Product 17 JA', 'Product 17 ISBN', 'Product 17 MNP', 'Product 17 Location', 999, 5, 'catalog/demo_products/product_1/vivek-kumar-394543-unsplash.jpg', 8, 1, '99999.0000', 400, 9, '2018-11-02', '0.00000000', '0.00000000', 0, 1, 1, 1, 0, 54, 1, '2018-11-16 14:54:36', '2018-11-16 15:02:08'),
(104, '6765765765', '', '', 'Product 18 EAN', 'Product 18 JA', 'Product 18 ISBN', 'Product 18 MNP', 'Product 18 Location', 999, 5, 'catalog/demo_products/product_1/yu-kato-629650-unsplash.jpg', 8, 1, '99999.0000', 400, 9, '2018-11-02', '0.00000000', '0.00000000', 0, 1, 1, 1, 0, 53, 1, '2018-11-16 14:54:43', '2018-11-16 15:02:57');

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute`
--

CREATE TABLE `product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_attribute`
--

INSERT INTO `product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(42, 12, 2, '1'),
(42, 13, 2, '2'),
(42, 14, 2, '3'),
(42, 15, 2, '4'),
(42, 16, 2, '5'),
(42, 17, 2, '6'),
(42, 18, 2, '7'),
(42, 19, 2, '8'),
(42, 20, 2, '9'),
(42, 21, 2, '10'),
(42, 22, 2, 'Lorem ipsum dolor'),
(42, 23, 2, 'sit amet consectetur'),
(42, 24, 2, 'adipisicing elit'),
(42, 25, 2, 'Atque provident alias'),
(42, 26, 2, 'sit ipsam cum minima'),
(42, 27, 2, 'officia, a omnis aut quis'),
(42, 28, 2, 'doloribus nobis dolor placeat'),
(42, 30, 2, 'Dolorem, autem!'),
(64, 12, 2, '1'),
(64, 13, 2, '2'),
(64, 14, 2, '3'),
(64, 15, 2, '4'),
(64, 16, 2, '5'),
(64, 17, 2, '6'),
(64, 18, 2, '7'),
(64, 19, 2, '8'),
(64, 20, 2, '9'),
(64, 21, 2, '10'),
(64, 22, 2, 'Lorem ipsum dolor'),
(64, 23, 2, 'sit amet consectetur'),
(64, 24, 2, 'adipisicing elit'),
(64, 25, 2, 'Atque provident alias'),
(64, 26, 2, 'sit ipsam cum minima'),
(64, 27, 2, 'officia, a omnis aut quis'),
(64, 28, 2, 'doloribus nobis dolor placeat'),
(64, 30, 2, 'Dolorem, autem!'),
(80, 12, 2, '1'),
(80, 13, 2, '2'),
(80, 14, 2, '3'),
(80, 15, 2, '4'),
(80, 16, 2, '5'),
(80, 17, 2, '6'),
(80, 18, 2, '7'),
(80, 19, 2, '8'),
(80, 20, 2, '9'),
(80, 21, 2, '10'),
(80, 22, 2, 'Lorem ipsum dolor'),
(80, 23, 2, 'sit amet consectetur'),
(80, 24, 2, 'adipisicing elit'),
(80, 25, 2, 'Atque provident alias'),
(80, 26, 2, 'sit ipsam cum minima'),
(80, 27, 2, 'officia, a omnis aut quis'),
(80, 28, 2, 'doloribus nobis dolor placeat'),
(80, 30, 2, 'Dolorem, autem!'),
(82, 12, 2, '1'),
(82, 13, 2, '2'),
(82, 14, 2, '3'),
(82, 15, 2, '4'),
(82, 16, 2, '5'),
(82, 17, 2, '6'),
(82, 18, 2, '7'),
(82, 19, 2, '8'),
(82, 20, 2, '9'),
(82, 21, 2, '10'),
(82, 22, 2, 'Lorem ipsum dolor'),
(82, 23, 2, 'sit amet consectetur'),
(82, 24, 2, 'adipisicing elit'),
(82, 25, 2, 'Atque provident alias'),
(82, 26, 2, 'sit ipsam cum minima'),
(82, 27, 2, 'officia, a omnis aut quis'),
(82, 28, 2, 'doloribus nobis dolor placeat'),
(82, 30, 2, 'Dolorem, autem!'),
(83, 12, 2, '1'),
(83, 13, 2, '2'),
(83, 14, 2, '3'),
(83, 15, 2, '4'),
(83, 16, 2, '5'),
(83, 17, 2, '6'),
(83, 18, 2, '7'),
(83, 19, 2, '8'),
(83, 20, 2, '9'),
(83, 21, 2, '10'),
(83, 22, 2, 'Lorem ipsum dolor'),
(83, 23, 2, 'sit amet consectetur'),
(83, 24, 2, 'adipisicing elit'),
(83, 25, 2, 'Atque provident alias'),
(83, 26, 2, 'sit ipsam cum minima'),
(83, 27, 2, 'officia, a omnis aut quis'),
(83, 28, 2, 'doloribus nobis dolor placeat'),
(83, 30, 2, 'Dolorem, autem!'),
(86, 12, 2, '1'),
(86, 13, 2, '2'),
(86, 14, 2, '3'),
(86, 15, 2, '4'),
(86, 16, 2, '5'),
(86, 17, 2, '6'),
(86, 18, 2, '7'),
(86, 19, 2, '8'),
(86, 20, 2, '9'),
(86, 21, 2, '10'),
(86, 22, 2, 'Lorem ipsum dolor'),
(86, 23, 2, 'sit amet consectetur'),
(86, 24, 2, 'adipisicing elit'),
(86, 25, 2, 'Atque provident alias'),
(86, 26, 2, 'sit ipsam cum minima'),
(86, 27, 2, 'officia, a omnis aut quis'),
(86, 28, 2, 'doloribus nobis dolor placeat'),
(86, 30, 2, 'Dolorem, autem!'),
(87, 12, 2, '1'),
(87, 13, 2, '2'),
(87, 14, 2, '3'),
(87, 15, 2, '4'),
(87, 16, 2, '5'),
(87, 17, 2, '6'),
(87, 18, 2, '7'),
(87, 19, 2, '8'),
(87, 20, 2, '9'),
(87, 21, 2, '10'),
(87, 22, 2, 'Lorem ipsum dolor'),
(87, 23, 2, 'sit amet consectetur'),
(87, 24, 2, 'adipisicing elit'),
(87, 25, 2, 'Atque provident alias'),
(87, 26, 2, 'sit ipsam cum minima'),
(87, 27, 2, 'officia, a omnis aut quis'),
(87, 28, 2, 'doloribus nobis dolor placeat'),
(87, 30, 2, 'Dolorem, autem!'),
(88, 12, 2, '1'),
(88, 13, 2, '2'),
(88, 14, 2, '3'),
(88, 15, 2, '4'),
(88, 16, 2, '5'),
(88, 17, 2, '6'),
(88, 18, 2, '7'),
(88, 19, 2, '8'),
(88, 20, 2, '9'),
(88, 21, 2, '10'),
(88, 22, 2, 'Lorem ipsum dolor'),
(88, 23, 2, 'sit amet consectetur'),
(88, 24, 2, 'adipisicing elit'),
(88, 25, 2, 'Atque provident alias'),
(88, 26, 2, 'sit ipsam cum minima'),
(88, 27, 2, 'officia, a omnis aut quis'),
(88, 28, 2, 'doloribus nobis dolor placeat'),
(88, 30, 2, 'Dolorem, autem!'),
(89, 12, 2, '1'),
(89, 13, 2, '2'),
(89, 14, 2, '3'),
(89, 15, 2, '4'),
(89, 16, 2, '5'),
(89, 17, 2, '6'),
(89, 18, 2, '7'),
(89, 19, 2, '8'),
(89, 20, 2, '9'),
(89, 21, 2, '10'),
(89, 22, 2, 'Lorem ipsum dolor'),
(89, 23, 2, 'sit amet consectetur'),
(89, 24, 2, 'adipisicing elit'),
(89, 25, 2, 'Atque provident alias'),
(89, 26, 2, 'sit ipsam cum minima'),
(89, 27, 2, 'officia, a omnis aut quis'),
(89, 28, 2, 'doloribus nobis dolor placeat'),
(89, 30, 2, 'Dolorem, autem!'),
(96, 12, 2, '1'),
(96, 13, 2, '2'),
(96, 14, 2, '3'),
(96, 15, 2, '4'),
(96, 16, 2, '5'),
(96, 17, 2, '6'),
(96, 18, 2, '7'),
(96, 19, 2, '8'),
(96, 20, 2, '9'),
(96, 21, 2, '10'),
(96, 22, 2, 'Lorem ipsum dolor'),
(96, 23, 2, 'sit amet consectetur'),
(96, 24, 2, 'adipisicing elit'),
(96, 25, 2, 'Atque provident alias'),
(96, 26, 2, 'sit ipsam cum minima'),
(96, 27, 2, 'officia, a omnis aut quis'),
(96, 28, 2, 'doloribus nobis dolor placeat'),
(96, 30, 2, 'Dolorem, autem!'),
(97, 12, 2, '1'),
(97, 13, 2, '2'),
(97, 14, 2, '3'),
(97, 15, 2, '4'),
(97, 16, 2, '5'),
(97, 17, 2, '6'),
(97, 18, 2, '7'),
(97, 19, 2, '8'),
(97, 20, 2, '9'),
(97, 21, 2, '10'),
(97, 22, 2, 'Lorem ipsum dolor'),
(97, 23, 2, 'sit amet consectetur'),
(97, 24, 2, 'adipisicing elit'),
(97, 25, 2, 'Atque provident alias'),
(97, 26, 2, 'sit ipsam cum minima'),
(97, 27, 2, 'officia, a omnis aut quis'),
(97, 28, 2, 'doloribus nobis dolor placeat'),
(97, 30, 2, 'Dolorem, autem!'),
(98, 12, 2, '1'),
(98, 13, 2, '2'),
(98, 14, 2, '3'),
(98, 15, 2, '4'),
(98, 16, 2, '5'),
(98, 17, 2, '6'),
(98, 18, 2, '7'),
(98, 19, 2, '8'),
(98, 20, 2, '9'),
(98, 21, 2, '10'),
(98, 22, 2, 'Lorem ipsum dolor'),
(98, 23, 2, 'sit amet consectetur'),
(98, 24, 2, 'adipisicing elit'),
(98, 25, 2, 'Atque provident alias'),
(98, 26, 2, 'sit ipsam cum minima'),
(98, 27, 2, 'officia, a omnis aut quis'),
(98, 28, 2, 'doloribus nobis dolor placeat'),
(98, 30, 2, 'Dolorem, autem!'),
(99, 12, 2, '1'),
(99, 13, 2, '2'),
(99, 14, 2, '3'),
(99, 15, 2, '4'),
(99, 16, 2, '5'),
(99, 17, 2, '6'),
(99, 18, 2, '7'),
(99, 19, 2, '8'),
(99, 20, 2, '9'),
(99, 21, 2, '10'),
(99, 22, 2, 'Lorem ipsum dolor'),
(99, 23, 2, 'sit amet consectetur'),
(99, 24, 2, 'adipisicing elit'),
(99, 25, 2, 'Atque provident alias'),
(99, 26, 2, 'sit ipsam cum minima'),
(99, 27, 2, 'officia, a omnis aut quis'),
(99, 28, 2, 'doloribus nobis dolor placeat'),
(99, 30, 2, 'Dolorem, autem!'),
(100, 12, 2, '1'),
(100, 13, 2, '2'),
(100, 14, 2, '3'),
(100, 15, 2, '4'),
(100, 16, 2, '5'),
(100, 17, 2, '6'),
(100, 18, 2, '7'),
(100, 19, 2, '8'),
(100, 20, 2, '9'),
(100, 21, 2, '10'),
(100, 22, 2, 'Lorem ipsum dolor'),
(100, 23, 2, 'sit amet consectetur'),
(100, 24, 2, 'adipisicing elit'),
(100, 25, 2, 'Atque provident alias'),
(100, 26, 2, 'sit ipsam cum minima'),
(100, 27, 2, 'officia, a omnis aut quis'),
(100, 28, 2, 'doloribus nobis dolor placeat'),
(100, 30, 2, 'Dolorem, autem!'),
(101, 12, 2, '1'),
(101, 13, 2, '2'),
(101, 14, 2, '3'),
(101, 15, 2, '4'),
(101, 16, 2, '5'),
(101, 17, 2, '6'),
(101, 18, 2, '7'),
(101, 19, 2, '8'),
(101, 20, 2, '9'),
(101, 21, 2, '10'),
(101, 22, 2, 'Lorem ipsum dolor'),
(101, 23, 2, 'sit amet consectetur'),
(101, 24, 2, 'adipisicing elit'),
(101, 25, 2, 'Atque provident alias'),
(101, 26, 2, 'sit ipsam cum minima'),
(101, 27, 2, 'officia, a omnis aut quis'),
(101, 28, 2, 'doloribus nobis dolor placeat'),
(101, 30, 2, 'Dolorem, autem!'),
(102, 12, 2, '1'),
(102, 13, 2, '2'),
(102, 14, 2, '3'),
(102, 15, 2, '4'),
(102, 16, 2, '5'),
(102, 17, 2, '6'),
(102, 18, 2, '7'),
(102, 19, 2, '8'),
(102, 20, 2, '9'),
(102, 21, 2, '10'),
(102, 22, 2, 'Lorem ipsum dolor'),
(102, 23, 2, 'sit amet consectetur'),
(102, 24, 2, 'adipisicing elit'),
(102, 25, 2, 'Atque provident alias'),
(102, 26, 2, 'sit ipsam cum minima'),
(102, 27, 2, 'officia, a omnis aut quis'),
(102, 28, 2, 'doloribus nobis dolor placeat'),
(102, 30, 2, 'Dolorem, autem!'),
(103, 12, 2, '1'),
(103, 13, 2, '2'),
(103, 14, 2, '3'),
(103, 15, 2, '4'),
(103, 16, 2, '5'),
(103, 17, 2, '6'),
(103, 18, 2, '7'),
(103, 19, 2, '8'),
(103, 20, 2, '9'),
(103, 21, 2, '10'),
(103, 22, 2, 'Lorem ipsum dolor'),
(103, 23, 2, 'sit amet consectetur'),
(103, 24, 2, 'adipisicing elit'),
(103, 25, 2, 'Atque provident alias'),
(103, 26, 2, 'sit ipsam cum minima'),
(103, 27, 2, 'officia, a omnis aut quis'),
(103, 28, 2, 'doloribus nobis dolor placeat'),
(103, 30, 2, 'Dolorem, autem!'),
(104, 12, 2, '1'),
(104, 13, 2, '2'),
(104, 14, 2, '3'),
(104, 15, 2, '4'),
(104, 16, 2, '5'),
(104, 17, 2, '6'),
(104, 18, 2, '7'),
(104, 19, 2, '8'),
(104, 20, 2, '9'),
(104, 21, 2, '10'),
(104, 22, 2, 'Lorem ipsum dolor'),
(104, 23, 2, 'sit amet consectetur'),
(104, 24, 2, 'adipisicing elit'),
(104, 25, 2, 'Atque provident alias'),
(104, 26, 2, 'sit ipsam cum minima'),
(104, 27, 2, 'officia, a omnis aut quis'),
(104, 28, 2, 'doloribus nobis dolor placeat'),
(104, 30, 2, 'Dolorem, autem!');

-- --------------------------------------------------------

--
-- Table structure for table `product_description`
--

CREATE TABLE `product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `description_mini` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_description`
--

INSERT INTO `product_description` (`product_id`, `language_id`, `name`, `description`, `description_mini`, `tag`, `meta_title`, `meta_description`, `meta_h1`) VALUES
(42, 2, 'Product 1', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut minima architecto quas harum aperiam! Dolorem officia asperiores nemo. Obcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad reiciendis ipsa quia necessitatibus ducimus vero praesentium repellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore, alias id officia eveniet quod sunt sequi explicabo odio error incidunt deserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi dignissimos rerum optio perferendis debitis omnis, corrupti ea atque consequuntur odio doloribus incidunt error dicta veniam explicabo neque autem. Possimus suscipit in qui exercitationem maxime?&lt;br&gt;Laboriosam impedit ullam dignissimos, asperiores voluptas magni corrupti blanditiis odit eligendi. Similique sint commodi ex magnam tenetur aspernatur tempore nemo, molestias dolores voluptatibus fuga nulla earum eius porro numquam unde.&lt;br&gt;Aliquam veniam cumque assumenda sint consequuntur corporis harum nihil eos sequi. Asperiores, numquam. Eligendi et itaque deserunt reprehenderit sequi provident modi tempora in! Perspiciatis officiis tempora assumenda! Nam, nisi placeat?&lt;br&gt;A nihil culpa ut assumenda magni cupiditate quo commodi totam possimus eaque, soluta hic eos itaque accusamus, laudantium dolore in labore exercitationem ipsum nesciunt incidunt, ducimus ab? Modi, accusantium enim!&lt;br&gt;Unde nulla molestiae rem dolor modi dolorum harum doloremque, hic ex odio facilis quisquam consectetur necessitatibus recusandae enim, deserunt aliquam temporibus aliquid ut illo numquam. Praesentium vero voluptas nostrum libero.&lt;br&gt;Repellendus maiores fuga eveniet dolores eos placeat sequi molestiae, hic facilis ipsum voluptas earum est neque quo qui aut necessitatibus cumque impedit ducimus ab accusamus. Maiores enim quidem inventore voluptatibus.&lt;br&gt;Blanditiis atque sed ullam. Veritatis, deserunt odit optio dolore, accusantium soluta error corrupti omnis eos itaque, facilis iste culpa voluptates. Commodi ut laudantium voluptas, officia id inventore optio reprehenderit expedita!&lt;br&gt;Natus eligendi quo officia sint minima possimus voluptate reprehenderit? Quam tempora reiciendis, laborum inventore hic numquam sint aliquam sequi in esse ut omnis! Quisquam officia corrupti, nesciunt quis et pariatur.&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Mini lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut\r\n minima architecto quas harum aperiam! Dolorem officia asperiores nemo. \r\nObcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad\r\n reiciendis ipsa quia necessitatibus ducimus vero praesentium \r\nrepellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore,\r\n alias id officia eveniet quod sunt sequi explicabo odio error incidunt \r\ndeserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi \r\ndignissimos rerum optio perferendis debitis omnis, corrupti ea atque \r\nconsequuntur odio doloribus incidunt error dicta veniam explicabo neque \r\nautem. Possimus suscipit in qui exercitationem maxime?&lt;/p&gt;', 'Product 1', 'Product 1', 'Product 1', 'Product 1'),
(64, 2, 'Product 2', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut minima architecto quas harum aperiam! Dolorem officia asperiores nemo. Obcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad reiciendis ipsa quia necessitatibus ducimus vero praesentium repellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore, alias id officia eveniet quod sunt sequi explicabo odio error incidunt deserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi dignissimos rerum optio perferendis debitis omnis, corrupti ea atque consequuntur odio doloribus incidunt error dicta veniam explicabo neque autem. Possimus suscipit in qui exercitationem maxime?&lt;br&gt;Laboriosam impedit ullam dignissimos, asperiores voluptas magni corrupti blanditiis odit eligendi. Similique sint commodi ex magnam tenetur aspernatur tempore nemo, molestias dolores voluptatibus fuga nulla earum eius porro numquam unde.&lt;br&gt;Aliquam veniam cumque assumenda sint consequuntur corporis harum nihil eos sequi. Asperiores, numquam. Eligendi et itaque deserunt reprehenderit sequi provident modi tempora in! Perspiciatis officiis tempora assumenda! Nam, nisi placeat?&lt;br&gt;A nihil culpa ut assumenda magni cupiditate quo commodi totam possimus eaque, soluta hic eos itaque accusamus, laudantium dolore in labore exercitationem ipsum nesciunt incidunt, ducimus ab? Modi, accusantium enim!&lt;br&gt;Unde nulla molestiae rem dolor modi dolorum harum doloremque, hic ex odio facilis quisquam consectetur necessitatibus recusandae enim, deserunt aliquam temporibus aliquid ut illo numquam. Praesentium vero voluptas nostrum libero.&lt;br&gt;Repellendus maiores fuga eveniet dolores eos placeat sequi molestiae, hic facilis ipsum voluptas earum est neque quo qui aut necessitatibus cumque impedit ducimus ab accusamus. Maiores enim quidem inventore voluptatibus.&lt;br&gt;Blanditiis atque sed ullam. Veritatis, deserunt odit optio dolore, accusantium soluta error corrupti omnis eos itaque, facilis iste culpa voluptates. Commodi ut laudantium voluptas, officia id inventore optio reprehenderit expedita!&lt;br&gt;Natus eligendi quo officia sint minima possimus voluptate reprehenderit? Quam tempora reiciendis, laborum inventore hic numquam sint aliquam sequi in esse ut omnis! Quisquam officia corrupti, nesciunt quis et pariatur.&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Mini lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut\r\n minima architecto quas harum aperiam! Dolorem officia asperiores nemo. \r\nObcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad\r\n reiciendis ipsa quia necessitatibus ducimus vero praesentium \r\nrepellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore,\r\n alias id officia eveniet quod sunt sequi explicabo odio error incidunt \r\ndeserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi \r\ndignissimos rerum optio perferendis debitis omnis, corrupti ea atque \r\nconsequuntur odio doloribus incidunt error dicta veniam explicabo neque \r\nautem. Possimus suscipit in qui exercitationem maxime?&lt;/p&gt;', 'Product 2', 'Product 2', 'Product 2', 'Product 2'),
(80, 2, 'Product 3', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut minima architecto quas harum aperiam! Dolorem officia asperiores nemo. Obcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad reiciendis ipsa quia necessitatibus ducimus vero praesentium repellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore, alias id officia eveniet quod sunt sequi explicabo odio error incidunt deserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi dignissimos rerum optio perferendis debitis omnis, corrupti ea atque consequuntur odio doloribus incidunt error dicta veniam explicabo neque autem. Possimus suscipit in qui exercitationem maxime?&lt;br&gt;Laboriosam impedit ullam dignissimos, asperiores voluptas magni corrupti blanditiis odit eligendi. Similique sint commodi ex magnam tenetur aspernatur tempore nemo, molestias dolores voluptatibus fuga nulla earum eius porro numquam unde.&lt;br&gt;Aliquam veniam cumque assumenda sint consequuntur corporis harum nihil eos sequi. Asperiores, numquam. Eligendi et itaque deserunt reprehenderit sequi provident modi tempora in! Perspiciatis officiis tempora assumenda! Nam, nisi placeat?&lt;br&gt;A nihil culpa ut assumenda magni cupiditate quo commodi totam possimus eaque, soluta hic eos itaque accusamus, laudantium dolore in labore exercitationem ipsum nesciunt incidunt, ducimus ab? Modi, accusantium enim!&lt;br&gt;Unde nulla molestiae rem dolor modi dolorum harum doloremque, hic ex odio facilis quisquam consectetur necessitatibus recusandae enim, deserunt aliquam temporibus aliquid ut illo numquam. Praesentium vero voluptas nostrum libero.&lt;br&gt;Repellendus maiores fuga eveniet dolores eos placeat sequi molestiae, hic facilis ipsum voluptas earum est neque quo qui aut necessitatibus cumque impedit ducimus ab accusamus. Maiores enim quidem inventore voluptatibus.&lt;br&gt;Blanditiis atque sed ullam. Veritatis, deserunt odit optio dolore, accusantium soluta error corrupti omnis eos itaque, facilis iste culpa voluptates. Commodi ut laudantium voluptas, officia id inventore optio reprehenderit expedita!&lt;br&gt;Natus eligendi quo officia sint minima possimus voluptate reprehenderit? Quam tempora reiciendis, laborum inventore hic numquam sint aliquam sequi in esse ut omnis! Quisquam officia corrupti, nesciunt quis et pariatur.&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Mini lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut\r\n minima architecto quas harum aperiam! Dolorem officia asperiores nemo. \r\nObcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad\r\n reiciendis ipsa quia necessitatibus ducimus vero praesentium \r\nrepellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore,\r\n alias id officia eveniet quod sunt sequi explicabo odio error incidunt \r\ndeserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi \r\ndignissimos rerum optio perferendis debitis omnis, corrupti ea atque \r\nconsequuntur odio doloribus incidunt error dicta veniam explicabo neque \r\nautem. Possimus suscipit in qui exercitationem maxime?&lt;/p&gt;', 'Product 3', 'Product 3', 'Product 3', 'Product 3'),
(82, 2, 'Product 4', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut minima architecto quas harum aperiam! Dolorem officia asperiores nemo. Obcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad reiciendis ipsa quia necessitatibus ducimus vero praesentium repellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore, alias id officia eveniet quod sunt sequi explicabo odio error incidunt deserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi dignissimos rerum optio perferendis debitis omnis, corrupti ea atque consequuntur odio doloribus incidunt error dicta veniam explicabo neque autem. Possimus suscipit in qui exercitationem maxime?&lt;br&gt;Laboriosam impedit ullam dignissimos, asperiores voluptas magni corrupti blanditiis odit eligendi. Similique sint commodi ex magnam tenetur aspernatur tempore nemo, molestias dolores voluptatibus fuga nulla earum eius porro numquam unde.&lt;br&gt;Aliquam veniam cumque assumenda sint consequuntur corporis harum nihil eos sequi. Asperiores, numquam. Eligendi et itaque deserunt reprehenderit sequi provident modi tempora in! Perspiciatis officiis tempora assumenda! Nam, nisi placeat?&lt;br&gt;A nihil culpa ut assumenda magni cupiditate quo commodi totam possimus eaque, soluta hic eos itaque accusamus, laudantium dolore in labore exercitationem ipsum nesciunt incidunt, ducimus ab? Modi, accusantium enim!&lt;br&gt;Unde nulla molestiae rem dolor modi dolorum harum doloremque, hic ex odio facilis quisquam consectetur necessitatibus recusandae enim, deserunt aliquam temporibus aliquid ut illo numquam. Praesentium vero voluptas nostrum libero.&lt;br&gt;Repellendus maiores fuga eveniet dolores eos placeat sequi molestiae, hic facilis ipsum voluptas earum est neque quo qui aut necessitatibus cumque impedit ducimus ab accusamus. Maiores enim quidem inventore voluptatibus.&lt;br&gt;Blanditiis atque sed ullam. Veritatis, deserunt odit optio dolore, accusantium soluta error corrupti omnis eos itaque, facilis iste culpa voluptates. Commodi ut laudantium voluptas, officia id inventore optio reprehenderit expedita!&lt;br&gt;Natus eligendi quo officia sint minima possimus voluptate reprehenderit? Quam tempora reiciendis, laborum inventore hic numquam sint aliquam sequi in esse ut omnis! Quisquam officia corrupti, nesciunt quis et pariatur.&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Mini lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut\r\n minima architecto quas harum aperiam! Dolorem officia asperiores nemo. \r\nObcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad\r\n reiciendis ipsa quia necessitatibus ducimus vero praesentium \r\nrepellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore,\r\n alias id officia eveniet quod sunt sequi explicabo odio error incidunt \r\ndeserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi \r\ndignissimos rerum optio perferendis debitis omnis, corrupti ea atque \r\nconsequuntur odio doloribus incidunt error dicta veniam explicabo neque \r\nautem. Possimus suscipit in qui exercitationem maxime?&lt;/p&gt;', 'Product 4', 'Product 4', 'Product 4', 'Product 4'),
(83, 2, 'Product 5', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut minima architecto quas harum aperiam! Dolorem officia asperiores nemo. Obcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad reiciendis ipsa quia necessitatibus ducimus vero praesentium repellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore, alias id officia eveniet quod sunt sequi explicabo odio error incidunt deserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi dignissimos rerum optio perferendis debitis omnis, corrupti ea atque consequuntur odio doloribus incidunt error dicta veniam explicabo neque autem. Possimus suscipit in qui exercitationem maxime?&lt;br&gt;Laboriosam impedit ullam dignissimos, asperiores voluptas magni corrupti blanditiis odit eligendi. Similique sint commodi ex magnam tenetur aspernatur tempore nemo, molestias dolores voluptatibus fuga nulla earum eius porro numquam unde.&lt;br&gt;Aliquam veniam cumque assumenda sint consequuntur corporis harum nihil eos sequi. Asperiores, numquam. Eligendi et itaque deserunt reprehenderit sequi provident modi tempora in! Perspiciatis officiis tempora assumenda! Nam, nisi placeat?&lt;br&gt;A nihil culpa ut assumenda magni cupiditate quo commodi totam possimus eaque, soluta hic eos itaque accusamus, laudantium dolore in labore exercitationem ipsum nesciunt incidunt, ducimus ab? Modi, accusantium enim!&lt;br&gt;Unde nulla molestiae rem dolor modi dolorum harum doloremque, hic ex odio facilis quisquam consectetur necessitatibus recusandae enim, deserunt aliquam temporibus aliquid ut illo numquam. Praesentium vero voluptas nostrum libero.&lt;br&gt;Repellendus maiores fuga eveniet dolores eos placeat sequi molestiae, hic facilis ipsum voluptas earum est neque quo qui aut necessitatibus cumque impedit ducimus ab accusamus. Maiores enim quidem inventore voluptatibus.&lt;br&gt;Blanditiis atque sed ullam. Veritatis, deserunt odit optio dolore, accusantium soluta error corrupti omnis eos itaque, facilis iste culpa voluptates. Commodi ut laudantium voluptas, officia id inventore optio reprehenderit expedita!&lt;br&gt;Natus eligendi quo officia sint minima possimus voluptate reprehenderit? Quam tempora reiciendis, laborum inventore hic numquam sint aliquam sequi in esse ut omnis! Quisquam officia corrupti, nesciunt quis et pariatur.&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Mini lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut\r\n minima architecto quas harum aperiam! Dolorem officia asperiores nemo. \r\nObcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad\r\n reiciendis ipsa quia necessitatibus ducimus vero praesentium \r\nrepellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore,\r\n alias id officia eveniet quod sunt sequi explicabo odio error incidunt \r\ndeserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi \r\ndignissimos rerum optio perferendis debitis omnis, corrupti ea atque \r\nconsequuntur odio doloribus incidunt error dicta veniam explicabo neque \r\nautem. Possimus suscipit in qui exercitationem maxime?&lt;/p&gt;', 'Product 5', 'Product 5', 'Product 5', 'Product 5'),
(86, 2, 'Product 6', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut minima architecto quas harum aperiam! Dolorem officia asperiores nemo. Obcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad reiciendis ipsa quia necessitatibus ducimus vero praesentium repellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore, alias id officia eveniet quod sunt sequi explicabo odio error incidunt deserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi dignissimos rerum optio perferendis debitis omnis, corrupti ea atque consequuntur odio doloribus incidunt error dicta veniam explicabo neque autem. Possimus suscipit in qui exercitationem maxime?&lt;br&gt;Laboriosam impedit ullam dignissimos, asperiores voluptas magni corrupti blanditiis odit eligendi. Similique sint commodi ex magnam tenetur aspernatur tempore nemo, molestias dolores voluptatibus fuga nulla earum eius porro numquam unde.&lt;br&gt;Aliquam veniam cumque assumenda sint consequuntur corporis harum nihil eos sequi. Asperiores, numquam. Eligendi et itaque deserunt reprehenderit sequi provident modi tempora in! Perspiciatis officiis tempora assumenda! Nam, nisi placeat?&lt;br&gt;A nihil culpa ut assumenda magni cupiditate quo commodi totam possimus eaque, soluta hic eos itaque accusamus, laudantium dolore in labore exercitationem ipsum nesciunt incidunt, ducimus ab? Modi, accusantium enim!&lt;br&gt;Unde nulla molestiae rem dolor modi dolorum harum doloremque, hic ex odio facilis quisquam consectetur necessitatibus recusandae enim, deserunt aliquam temporibus aliquid ut illo numquam. Praesentium vero voluptas nostrum libero.&lt;br&gt;Repellendus maiores fuga eveniet dolores eos placeat sequi molestiae, hic facilis ipsum voluptas earum est neque quo qui aut necessitatibus cumque impedit ducimus ab accusamus. Maiores enim quidem inventore voluptatibus.&lt;br&gt;Blanditiis atque sed ullam. Veritatis, deserunt odit optio dolore, accusantium soluta error corrupti omnis eos itaque, facilis iste culpa voluptates. Commodi ut laudantium voluptas, officia id inventore optio reprehenderit expedita!&lt;br&gt;Natus eligendi quo officia sint minima possimus voluptate reprehenderit? Quam tempora reiciendis, laborum inventore hic numquam sint aliquam sequi in esse ut omnis! Quisquam officia corrupti, nesciunt quis et pariatur.&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Mini lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut\r\n minima architecto quas harum aperiam! Dolorem officia asperiores nemo. \r\nObcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad\r\n reiciendis ipsa quia necessitatibus ducimus vero praesentium \r\nrepellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore,\r\n alias id officia eveniet quod sunt sequi explicabo odio error incidunt \r\ndeserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi \r\ndignissimos rerum optio perferendis debitis omnis, corrupti ea atque \r\nconsequuntur odio doloribus incidunt error dicta veniam explicabo neque \r\nautem. Possimus suscipit in qui exercitationem maxime?&lt;/p&gt;', 'Product 6', 'Product 6', 'Product 6', 'Product 6'),
(87, 2, 'Product 7', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut minima architecto quas harum aperiam! Dolorem officia asperiores nemo. Obcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad reiciendis ipsa quia necessitatibus ducimus vero praesentium repellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore, alias id officia eveniet quod sunt sequi explicabo odio error incidunt deserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi dignissimos rerum optio perferendis debitis omnis, corrupti ea atque consequuntur odio doloribus incidunt error dicta veniam explicabo neque autem. Possimus suscipit in qui exercitationem maxime?&lt;br&gt;Laboriosam impedit ullam dignissimos, asperiores voluptas magni corrupti blanditiis odit eligendi. Similique sint commodi ex magnam tenetur aspernatur tempore nemo, molestias dolores voluptatibus fuga nulla earum eius porro numquam unde.&lt;br&gt;Aliquam veniam cumque assumenda sint consequuntur corporis harum nihil eos sequi. Asperiores, numquam. Eligendi et itaque deserunt reprehenderit sequi provident modi tempora in! Perspiciatis officiis tempora assumenda! Nam, nisi placeat?&lt;br&gt;A nihil culpa ut assumenda magni cupiditate quo commodi totam possimus eaque, soluta hic eos itaque accusamus, laudantium dolore in labore exercitationem ipsum nesciunt incidunt, ducimus ab? Modi, accusantium enim!&lt;br&gt;Unde nulla molestiae rem dolor modi dolorum harum doloremque, hic ex odio facilis quisquam consectetur necessitatibus recusandae enim, deserunt aliquam temporibus aliquid ut illo numquam. Praesentium vero voluptas nostrum libero.&lt;br&gt;Repellendus maiores fuga eveniet dolores eos placeat sequi molestiae, hic facilis ipsum voluptas earum est neque quo qui aut necessitatibus cumque impedit ducimus ab accusamus. Maiores enim quidem inventore voluptatibus.&lt;br&gt;Blanditiis atque sed ullam. Veritatis, deserunt odit optio dolore, accusantium soluta error corrupti omnis eos itaque, facilis iste culpa voluptates. Commodi ut laudantium voluptas, officia id inventore optio reprehenderit expedita!&lt;br&gt;Natus eligendi quo officia sint minima possimus voluptate reprehenderit? Quam tempora reiciendis, laborum inventore hic numquam sint aliquam sequi in esse ut omnis! Quisquam officia corrupti, nesciunt quis et pariatur.&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Mini lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut\r\n minima architecto quas harum aperiam! Dolorem officia asperiores nemo. \r\nObcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad\r\n reiciendis ipsa quia necessitatibus ducimus vero praesentium \r\nrepellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore,\r\n alias id officia eveniet quod sunt sequi explicabo odio error incidunt \r\ndeserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi \r\ndignissimos rerum optio perferendis debitis omnis, corrupti ea atque \r\nconsequuntur odio doloribus incidunt error dicta veniam explicabo neque \r\nautem. Possimus suscipit in qui exercitationem maxime?&lt;/p&gt;', 'Product 7', 'Product 7', 'Product 7', 'Product 7'),
(88, 2, 'Product 8', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut minima architecto quas harum aperiam! Dolorem officia asperiores nemo. Obcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad reiciendis ipsa quia necessitatibus ducimus vero praesentium repellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore, alias id officia eveniet quod sunt sequi explicabo odio error incidunt deserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi dignissimos rerum optio perferendis debitis omnis, corrupti ea atque consequuntur odio doloribus incidunt error dicta veniam explicabo neque autem. Possimus suscipit in qui exercitationem maxime?&lt;br&gt;Laboriosam impedit ullam dignissimos, asperiores voluptas magni corrupti blanditiis odit eligendi. Similique sint commodi ex magnam tenetur aspernatur tempore nemo, molestias dolores voluptatibus fuga nulla earum eius porro numquam unde.&lt;br&gt;Aliquam veniam cumque assumenda sint consequuntur corporis harum nihil eos sequi. Asperiores, numquam. Eligendi et itaque deserunt reprehenderit sequi provident modi tempora in! Perspiciatis officiis tempora assumenda! Nam, nisi placeat?&lt;br&gt;A nihil culpa ut assumenda magni cupiditate quo commodi totam possimus eaque, soluta hic eos itaque accusamus, laudantium dolore in labore exercitationem ipsum nesciunt incidunt, ducimus ab? Modi, accusantium enim!&lt;br&gt;Unde nulla molestiae rem dolor modi dolorum harum doloremque, hic ex odio facilis quisquam consectetur necessitatibus recusandae enim, deserunt aliquam temporibus aliquid ut illo numquam. Praesentium vero voluptas nostrum libero.&lt;br&gt;Repellendus maiores fuga eveniet dolores eos placeat sequi molestiae, hic facilis ipsum voluptas earum est neque quo qui aut necessitatibus cumque impedit ducimus ab accusamus. Maiores enim quidem inventore voluptatibus.&lt;br&gt;Blanditiis atque sed ullam. Veritatis, deserunt odit optio dolore, accusantium soluta error corrupti omnis eos itaque, facilis iste culpa voluptates. Commodi ut laudantium voluptas, officia id inventore optio reprehenderit expedita!&lt;br&gt;Natus eligendi quo officia sint minima possimus voluptate reprehenderit? Quam tempora reiciendis, laborum inventore hic numquam sint aliquam sequi in esse ut omnis! Quisquam officia corrupti, nesciunt quis et pariatur.&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Mini lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut\r\n minima architecto quas harum aperiam! Dolorem officia asperiores nemo. \r\nObcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad\r\n reiciendis ipsa quia necessitatibus ducimus vero praesentium \r\nrepellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore,\r\n alias id officia eveniet quod sunt sequi explicabo odio error incidunt \r\ndeserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi \r\ndignissimos rerum optio perferendis debitis omnis, corrupti ea atque \r\nconsequuntur odio doloribus incidunt error dicta veniam explicabo neque \r\nautem. Possimus suscipit in qui exercitationem maxime?&lt;/p&gt;', 'Product 8', 'Product 8', 'Product 8', 'Product 8'),
(89, 2, 'Product 9', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut minima architecto quas harum aperiam! Dolorem officia asperiores nemo. Obcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad reiciendis ipsa quia necessitatibus ducimus vero praesentium repellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore, alias id officia eveniet quod sunt sequi explicabo odio error incidunt deserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi dignissimos rerum optio perferendis debitis omnis, corrupti ea atque consequuntur odio doloribus incidunt error dicta veniam explicabo neque autem. Possimus suscipit in qui exercitationem maxime?&lt;br&gt;Laboriosam impedit ullam dignissimos, asperiores voluptas magni corrupti blanditiis odit eligendi. Similique sint commodi ex magnam tenetur aspernatur tempore nemo, molestias dolores voluptatibus fuga nulla earum eius porro numquam unde.&lt;br&gt;Aliquam veniam cumque assumenda sint consequuntur corporis harum nihil eos sequi. Asperiores, numquam. Eligendi et itaque deserunt reprehenderit sequi provident modi tempora in! Perspiciatis officiis tempora assumenda! Nam, nisi placeat?&lt;br&gt;A nihil culpa ut assumenda magni cupiditate quo commodi totam possimus eaque, soluta hic eos itaque accusamus, laudantium dolore in labore exercitationem ipsum nesciunt incidunt, ducimus ab? Modi, accusantium enim!&lt;br&gt;Unde nulla molestiae rem dolor modi dolorum harum doloremque, hic ex odio facilis quisquam consectetur necessitatibus recusandae enim, deserunt aliquam temporibus aliquid ut illo numquam. Praesentium vero voluptas nostrum libero.&lt;br&gt;Repellendus maiores fuga eveniet dolores eos placeat sequi molestiae, hic facilis ipsum voluptas earum est neque quo qui aut necessitatibus cumque impedit ducimus ab accusamus. Maiores enim quidem inventore voluptatibus.&lt;br&gt;Blanditiis atque sed ullam. Veritatis, deserunt odit optio dolore, accusantium soluta error corrupti omnis eos itaque, facilis iste culpa voluptates. Commodi ut laudantium voluptas, officia id inventore optio reprehenderit expedita!&lt;br&gt;Natus eligendi quo officia sint minima possimus voluptate reprehenderit? Quam tempora reiciendis, laborum inventore hic numquam sint aliquam sequi in esse ut omnis! Quisquam officia corrupti, nesciunt quis et pariatur.&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Mini lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut\r\n minima architecto quas harum aperiam! Dolorem officia asperiores nemo. \r\nObcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad\r\n reiciendis ipsa quia necessitatibus ducimus vero praesentium \r\nrepellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore,\r\n alias id officia eveniet quod sunt sequi explicabo odio error incidunt \r\ndeserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi \r\ndignissimos rerum optio perferendis debitis omnis, corrupti ea atque \r\nconsequuntur odio doloribus incidunt error dicta veniam explicabo neque \r\nautem. Possimus suscipit in qui exercitationem maxime?&lt;/p&gt;', 'Product 9', 'Product 9', 'Product 9', 'Product 9'),
(96, 2, 'Product 10', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut minima architecto quas harum aperiam! Dolorem officia asperiores nemo. Obcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad reiciendis ipsa quia necessitatibus ducimus vero praesentium repellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore, alias id officia eveniet quod sunt sequi explicabo odio error incidunt deserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi dignissimos rerum optio perferendis debitis omnis, corrupti ea atque consequuntur odio doloribus incidunt error dicta veniam explicabo neque autem. Possimus suscipit in qui exercitationem maxime?&lt;br&gt;Laboriosam impedit ullam dignissimos, asperiores voluptas magni corrupti blanditiis odit eligendi. Similique sint commodi ex magnam tenetur aspernatur tempore nemo, molestias dolores voluptatibus fuga nulla earum eius porro numquam unde.&lt;br&gt;Aliquam veniam cumque assumenda sint consequuntur corporis harum nihil eos sequi. Asperiores, numquam. Eligendi et itaque deserunt reprehenderit sequi provident modi tempora in! Perspiciatis officiis tempora assumenda! Nam, nisi placeat?&lt;br&gt;A nihil culpa ut assumenda magni cupiditate quo commodi totam possimus eaque, soluta hic eos itaque accusamus, laudantium dolore in labore exercitationem ipsum nesciunt incidunt, ducimus ab? Modi, accusantium enim!&lt;br&gt;Unde nulla molestiae rem dolor modi dolorum harum doloremque, hic ex odio facilis quisquam consectetur necessitatibus recusandae enim, deserunt aliquam temporibus aliquid ut illo numquam. Praesentium vero voluptas nostrum libero.&lt;br&gt;Repellendus maiores fuga eveniet dolores eos placeat sequi molestiae, hic facilis ipsum voluptas earum est neque quo qui aut necessitatibus cumque impedit ducimus ab accusamus. Maiores enim quidem inventore voluptatibus.&lt;br&gt;Blanditiis atque sed ullam. Veritatis, deserunt odit optio dolore, accusantium soluta error corrupti omnis eos itaque, facilis iste culpa voluptates. Commodi ut laudantium voluptas, officia id inventore optio reprehenderit expedita!&lt;br&gt;Natus eligendi quo officia sint minima possimus voluptate reprehenderit? Quam tempora reiciendis, laborum inventore hic numquam sint aliquam sequi in esse ut omnis! Quisquam officia corrupti, nesciunt quis et pariatur.&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Mini lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut\r\n minima architecto quas harum aperiam! Dolorem officia asperiores nemo. \r\nObcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad\r\n reiciendis ipsa quia necessitatibus ducimus vero praesentium \r\nrepellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore,\r\n alias id officia eveniet quod sunt sequi explicabo odio error incidunt \r\ndeserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi \r\ndignissimos rerum optio perferendis debitis omnis, corrupti ea atque \r\nconsequuntur odio doloribus incidunt error dicta veniam explicabo neque \r\nautem. Possimus suscipit in qui exercitationem maxime?&lt;/p&gt;', 'Product 10', 'Product 10', 'Product 10', 'Product 10'),
(97, 2, 'Product 11', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut minima architecto quas harum aperiam! Dolorem officia asperiores nemo. Obcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad reiciendis ipsa quia necessitatibus ducimus vero praesentium repellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore, alias id officia eveniet quod sunt sequi explicabo odio error incidunt deserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi dignissimos rerum optio perferendis debitis omnis, corrupti ea atque consequuntur odio doloribus incidunt error dicta veniam explicabo neque autem. Possimus suscipit in qui exercitationem maxime?&lt;br&gt;Laboriosam impedit ullam dignissimos, asperiores voluptas magni corrupti blanditiis odit eligendi. Similique sint commodi ex magnam tenetur aspernatur tempore nemo, molestias dolores voluptatibus fuga nulla earum eius porro numquam unde.&lt;br&gt;Aliquam veniam cumque assumenda sint consequuntur corporis harum nihil eos sequi. Asperiores, numquam. Eligendi et itaque deserunt reprehenderit sequi provident modi tempora in! Perspiciatis officiis tempora assumenda! Nam, nisi placeat?&lt;br&gt;A nihil culpa ut assumenda magni cupiditate quo commodi totam possimus eaque, soluta hic eos itaque accusamus, laudantium dolore in labore exercitationem ipsum nesciunt incidunt, ducimus ab? Modi, accusantium enim!&lt;br&gt;Unde nulla molestiae rem dolor modi dolorum harum doloremque, hic ex odio facilis quisquam consectetur necessitatibus recusandae enim, deserunt aliquam temporibus aliquid ut illo numquam. Praesentium vero voluptas nostrum libero.&lt;br&gt;Repellendus maiores fuga eveniet dolores eos placeat sequi molestiae, hic facilis ipsum voluptas earum est neque quo qui aut necessitatibus cumque impedit ducimus ab accusamus. Maiores enim quidem inventore voluptatibus.&lt;br&gt;Blanditiis atque sed ullam. Veritatis, deserunt odit optio dolore, accusantium soluta error corrupti omnis eos itaque, facilis iste culpa voluptates. Commodi ut laudantium voluptas, officia id inventore optio reprehenderit expedita!&lt;br&gt;Natus eligendi quo officia sint minima possimus voluptate reprehenderit? Quam tempora reiciendis, laborum inventore hic numquam sint aliquam sequi in esse ut omnis! Quisquam officia corrupti, nesciunt quis et pariatur.&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Mini lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut\r\n minima architecto quas harum aperiam! Dolorem officia asperiores nemo. \r\nObcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad\r\n reiciendis ipsa quia necessitatibus ducimus vero praesentium \r\nrepellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore,\r\n alias id officia eveniet quod sunt sequi explicabo odio error incidunt \r\ndeserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi \r\ndignissimos rerum optio perferendis debitis omnis, corrupti ea atque \r\nconsequuntur odio doloribus incidunt error dicta veniam explicabo neque \r\nautem. Possimus suscipit in qui exercitationem maxime?&lt;/p&gt;', 'Product 11', 'Product 11', 'Product 11', 'Product 11'),
(98, 2, 'Product 12', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut minima architecto quas harum aperiam! Dolorem officia asperiores nemo. Obcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad reiciendis ipsa quia necessitatibus ducimus vero praesentium repellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore, alias id officia eveniet quod sunt sequi explicabo odio error incidunt deserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi dignissimos rerum optio perferendis debitis omnis, corrupti ea atque consequuntur odio doloribus incidunt error dicta veniam explicabo neque autem. Possimus suscipit in qui exercitationem maxime?&lt;br&gt;Laboriosam impedit ullam dignissimos, asperiores voluptas magni corrupti blanditiis odit eligendi. Similique sint commodi ex magnam tenetur aspernatur tempore nemo, molestias dolores voluptatibus fuga nulla earum eius porro numquam unde.&lt;br&gt;Aliquam veniam cumque assumenda sint consequuntur corporis harum nihil eos sequi. Asperiores, numquam. Eligendi et itaque deserunt reprehenderit sequi provident modi tempora in! Perspiciatis officiis tempora assumenda! Nam, nisi placeat?&lt;br&gt;A nihil culpa ut assumenda magni cupiditate quo commodi totam possimus eaque, soluta hic eos itaque accusamus, laudantium dolore in labore exercitationem ipsum nesciunt incidunt, ducimus ab? Modi, accusantium enim!&lt;br&gt;Unde nulla molestiae rem dolor modi dolorum harum doloremque, hic ex odio facilis quisquam consectetur necessitatibus recusandae enim, deserunt aliquam temporibus aliquid ut illo numquam. Praesentium vero voluptas nostrum libero.&lt;br&gt;Repellendus maiores fuga eveniet dolores eos placeat sequi molestiae, hic facilis ipsum voluptas earum est neque quo qui aut necessitatibus cumque impedit ducimus ab accusamus. Maiores enim quidem inventore voluptatibus.&lt;br&gt;Blanditiis atque sed ullam. Veritatis, deserunt odit optio dolore, accusantium soluta error corrupti omnis eos itaque, facilis iste culpa voluptates. Commodi ut laudantium voluptas, officia id inventore optio reprehenderit expedita!&lt;br&gt;Natus eligendi quo officia sint minima possimus voluptate reprehenderit? Quam tempora reiciendis, laborum inventore hic numquam sint aliquam sequi in esse ut omnis! Quisquam officia corrupti, nesciunt quis et pariatur.&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Mini lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut\r\n minima architecto quas harum aperiam! Dolorem officia asperiores nemo. \r\nObcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad\r\n reiciendis ipsa quia necessitatibus ducimus vero praesentium \r\nrepellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore,\r\n alias id officia eveniet quod sunt sequi explicabo odio error incidunt \r\ndeserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi \r\ndignissimos rerum optio perferendis debitis omnis, corrupti ea atque \r\nconsequuntur odio doloribus incidunt error dicta veniam explicabo neque \r\nautem. Possimus suscipit in qui exercitationem maxime?&lt;/p&gt;', 'Product 12', 'Product 12', 'Product 12', 'Product 12'),
(99, 2, 'Product 13', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut minima architecto quas harum aperiam! Dolorem officia asperiores nemo. Obcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad reiciendis ipsa quia necessitatibus ducimus vero praesentium repellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore, alias id officia eveniet quod sunt sequi explicabo odio error incidunt deserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi dignissimos rerum optio perferendis debitis omnis, corrupti ea atque consequuntur odio doloribus incidunt error dicta veniam explicabo neque autem. Possimus suscipit in qui exercitationem maxime?&lt;br&gt;Laboriosam impedit ullam dignissimos, asperiores voluptas magni corrupti blanditiis odit eligendi. Similique sint commodi ex magnam tenetur aspernatur tempore nemo, molestias dolores voluptatibus fuga nulla earum eius porro numquam unde.&lt;br&gt;Aliquam veniam cumque assumenda sint consequuntur corporis harum nihil eos sequi. Asperiores, numquam. Eligendi et itaque deserunt reprehenderit sequi provident modi tempora in! Perspiciatis officiis tempora assumenda! Nam, nisi placeat?&lt;br&gt;A nihil culpa ut assumenda magni cupiditate quo commodi totam possimus eaque, soluta hic eos itaque accusamus, laudantium dolore in labore exercitationem ipsum nesciunt incidunt, ducimus ab? Modi, accusantium enim!&lt;br&gt;Unde nulla molestiae rem dolor modi dolorum harum doloremque, hic ex odio facilis quisquam consectetur necessitatibus recusandae enim, deserunt aliquam temporibus aliquid ut illo numquam. Praesentium vero voluptas nostrum libero.&lt;br&gt;Repellendus maiores fuga eveniet dolores eos placeat sequi molestiae, hic facilis ipsum voluptas earum est neque quo qui aut necessitatibus cumque impedit ducimus ab accusamus. Maiores enim quidem inventore voluptatibus.&lt;br&gt;Blanditiis atque sed ullam. Veritatis, deserunt odit optio dolore, accusantium soluta error corrupti omnis eos itaque, facilis iste culpa voluptates. Commodi ut laudantium voluptas, officia id inventore optio reprehenderit expedita!&lt;br&gt;Natus eligendi quo officia sint minima possimus voluptate reprehenderit? Quam tempora reiciendis, laborum inventore hic numquam sint aliquam sequi in esse ut omnis! Quisquam officia corrupti, nesciunt quis et pariatur.&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Mini lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut\r\n minima architecto quas harum aperiam! Dolorem officia asperiores nemo. \r\nObcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad\r\n reiciendis ipsa quia necessitatibus ducimus vero praesentium \r\nrepellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore,\r\n alias id officia eveniet quod sunt sequi explicabo odio error incidunt \r\ndeserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi \r\ndignissimos rerum optio perferendis debitis omnis, corrupti ea atque \r\nconsequuntur odio doloribus incidunt error dicta veniam explicabo neque \r\nautem. Possimus suscipit in qui exercitationem maxime?&lt;/p&gt;', 'Product 13', 'Product 13', 'Product 13', 'Product 13'),
(100, 2, 'Product 14', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut minima architecto quas harum aperiam! Dolorem officia asperiores nemo. Obcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad reiciendis ipsa quia necessitatibus ducimus vero praesentium repellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore, alias id officia eveniet quod sunt sequi explicabo odio error incidunt deserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi dignissimos rerum optio perferendis debitis omnis, corrupti ea atque consequuntur odio doloribus incidunt error dicta veniam explicabo neque autem. Possimus suscipit in qui exercitationem maxime?&lt;br&gt;Laboriosam impedit ullam dignissimos, asperiores voluptas magni corrupti blanditiis odit eligendi. Similique sint commodi ex magnam tenetur aspernatur tempore nemo, molestias dolores voluptatibus fuga nulla earum eius porro numquam unde.&lt;br&gt;Aliquam veniam cumque assumenda sint consequuntur corporis harum nihil eos sequi. Asperiores, numquam. Eligendi et itaque deserunt reprehenderit sequi provident modi tempora in! Perspiciatis officiis tempora assumenda! Nam, nisi placeat?&lt;br&gt;A nihil culpa ut assumenda magni cupiditate quo commodi totam possimus eaque, soluta hic eos itaque accusamus, laudantium dolore in labore exercitationem ipsum nesciunt incidunt, ducimus ab? Modi, accusantium enim!&lt;br&gt;Unde nulla molestiae rem dolor modi dolorum harum doloremque, hic ex odio facilis quisquam consectetur necessitatibus recusandae enim, deserunt aliquam temporibus aliquid ut illo numquam. Praesentium vero voluptas nostrum libero.&lt;br&gt;Repellendus maiores fuga eveniet dolores eos placeat sequi molestiae, hic facilis ipsum voluptas earum est neque quo qui aut necessitatibus cumque impedit ducimus ab accusamus. Maiores enim quidem inventore voluptatibus.&lt;br&gt;Blanditiis atque sed ullam. Veritatis, deserunt odit optio dolore, accusantium soluta error corrupti omnis eos itaque, facilis iste culpa voluptates. Commodi ut laudantium voluptas, officia id inventore optio reprehenderit expedita!&lt;br&gt;Natus eligendi quo officia sint minima possimus voluptate reprehenderit? Quam tempora reiciendis, laborum inventore hic numquam sint aliquam sequi in esse ut omnis! Quisquam officia corrupti, nesciunt quis et pariatur.&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Mini lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut\r\n minima architecto quas harum aperiam! Dolorem officia asperiores nemo. \r\nObcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad\r\n reiciendis ipsa quia necessitatibus ducimus vero praesentium \r\nrepellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore,\r\n alias id officia eveniet quod sunt sequi explicabo odio error incidunt \r\ndeserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi \r\ndignissimos rerum optio perferendis debitis omnis, corrupti ea atque \r\nconsequuntur odio doloribus incidunt error dicta veniam explicabo neque \r\nautem. Possimus suscipit in qui exercitationem maxime?&lt;/p&gt;', 'Product 14', 'Product 14', 'Product 14', 'Product 14'),
(101, 2, 'Product 15', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut minima architecto quas harum aperiam! Dolorem officia asperiores nemo. Obcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad reiciendis ipsa quia necessitatibus ducimus vero praesentium repellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore, alias id officia eveniet quod sunt sequi explicabo odio error incidunt deserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi dignissimos rerum optio perferendis debitis omnis, corrupti ea atque consequuntur odio doloribus incidunt error dicta veniam explicabo neque autem. Possimus suscipit in qui exercitationem maxime?&lt;br&gt;Laboriosam impedit ullam dignissimos, asperiores voluptas magni corrupti blanditiis odit eligendi. Similique sint commodi ex magnam tenetur aspernatur tempore nemo, molestias dolores voluptatibus fuga nulla earum eius porro numquam unde.&lt;br&gt;Aliquam veniam cumque assumenda sint consequuntur corporis harum nihil eos sequi. Asperiores, numquam. Eligendi et itaque deserunt reprehenderit sequi provident modi tempora in! Perspiciatis officiis tempora assumenda! Nam, nisi placeat?&lt;br&gt;A nihil culpa ut assumenda magni cupiditate quo commodi totam possimus eaque, soluta hic eos itaque accusamus, laudantium dolore in labore exercitationem ipsum nesciunt incidunt, ducimus ab? Modi, accusantium enim!&lt;br&gt;Unde nulla molestiae rem dolor modi dolorum harum doloremque, hic ex odio facilis quisquam consectetur necessitatibus recusandae enim, deserunt aliquam temporibus aliquid ut illo numquam. Praesentium vero voluptas nostrum libero.&lt;br&gt;Repellendus maiores fuga eveniet dolores eos placeat sequi molestiae, hic facilis ipsum voluptas earum est neque quo qui aut necessitatibus cumque impedit ducimus ab accusamus. Maiores enim quidem inventore voluptatibus.&lt;br&gt;Blanditiis atque sed ullam. Veritatis, deserunt odit optio dolore, accusantium soluta error corrupti omnis eos itaque, facilis iste culpa voluptates. Commodi ut laudantium voluptas, officia id inventore optio reprehenderit expedita!&lt;br&gt;Natus eligendi quo officia sint minima possimus voluptate reprehenderit? Quam tempora reiciendis, laborum inventore hic numquam sint aliquam sequi in esse ut omnis! Quisquam officia corrupti, nesciunt quis et pariatur.&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Mini lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut\r\n minima architecto quas harum aperiam! Dolorem officia asperiores nemo. \r\nObcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad\r\n reiciendis ipsa quia necessitatibus ducimus vero praesentium \r\nrepellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore,\r\n alias id officia eveniet quod sunt sequi explicabo odio error incidunt \r\ndeserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi \r\ndignissimos rerum optio perferendis debitis omnis, corrupti ea atque \r\nconsequuntur odio doloribus incidunt error dicta veniam explicabo neque \r\nautem. Possimus suscipit in qui exercitationem maxime?&lt;/p&gt;', 'Product 15', 'Product 15', 'Product 15', 'Product 15');
INSERT INTO `product_description` (`product_id`, `language_id`, `name`, `description`, `description_mini`, `tag`, `meta_title`, `meta_description`, `meta_h1`) VALUES
(102, 2, 'Product 16', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut minima architecto quas harum aperiam! Dolorem officia asperiores nemo. Obcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad reiciendis ipsa quia necessitatibus ducimus vero praesentium repellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore, alias id officia eveniet quod sunt sequi explicabo odio error incidunt deserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi dignissimos rerum optio perferendis debitis omnis, corrupti ea atque consequuntur odio doloribus incidunt error dicta veniam explicabo neque autem. Possimus suscipit in qui exercitationem maxime?&lt;br&gt;Laboriosam impedit ullam dignissimos, asperiores voluptas magni corrupti blanditiis odit eligendi. Similique sint commodi ex magnam tenetur aspernatur tempore nemo, molestias dolores voluptatibus fuga nulla earum eius porro numquam unde.&lt;br&gt;Aliquam veniam cumque assumenda sint consequuntur corporis harum nihil eos sequi. Asperiores, numquam. Eligendi et itaque deserunt reprehenderit sequi provident modi tempora in! Perspiciatis officiis tempora assumenda! Nam, nisi placeat?&lt;br&gt;A nihil culpa ut assumenda magni cupiditate quo commodi totam possimus eaque, soluta hic eos itaque accusamus, laudantium dolore in labore exercitationem ipsum nesciunt incidunt, ducimus ab? Modi, accusantium enim!&lt;br&gt;Unde nulla molestiae rem dolor modi dolorum harum doloremque, hic ex odio facilis quisquam consectetur necessitatibus recusandae enim, deserunt aliquam temporibus aliquid ut illo numquam. Praesentium vero voluptas nostrum libero.&lt;br&gt;Repellendus maiores fuga eveniet dolores eos placeat sequi molestiae, hic facilis ipsum voluptas earum est neque quo qui aut necessitatibus cumque impedit ducimus ab accusamus. Maiores enim quidem inventore voluptatibus.&lt;br&gt;Blanditiis atque sed ullam. Veritatis, deserunt odit optio dolore, accusantium soluta error corrupti omnis eos itaque, facilis iste culpa voluptates. Commodi ut laudantium voluptas, officia id inventore optio reprehenderit expedita!&lt;br&gt;Natus eligendi quo officia sint minima possimus voluptate reprehenderit? Quam tempora reiciendis, laborum inventore hic numquam sint aliquam sequi in esse ut omnis! Quisquam officia corrupti, nesciunt quis et pariatur.&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Mini lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut\r\n minima architecto quas harum aperiam! Dolorem officia asperiores nemo. \r\nObcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad\r\n reiciendis ipsa quia necessitatibus ducimus vero praesentium \r\nrepellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore,\r\n alias id officia eveniet quod sunt sequi explicabo odio error incidunt \r\ndeserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi \r\ndignissimos rerum optio perferendis debitis omnis, corrupti ea atque \r\nconsequuntur odio doloribus incidunt error dicta veniam explicabo neque \r\nautem. Possimus suscipit in qui exercitationem maxime?&lt;/p&gt;', 'Product 16', 'Product 16', 'Product 16', 'Product 16'),
(103, 2, 'Product 17', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut minima architecto quas harum aperiam! Dolorem officia asperiores nemo. Obcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad reiciendis ipsa quia necessitatibus ducimus vero praesentium repellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore, alias id officia eveniet quod sunt sequi explicabo odio error incidunt deserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi dignissimos rerum optio perferendis debitis omnis, corrupti ea atque consequuntur odio doloribus incidunt error dicta veniam explicabo neque autem. Possimus suscipit in qui exercitationem maxime?&lt;br&gt;Laboriosam impedit ullam dignissimos, asperiores voluptas magni corrupti blanditiis odit eligendi. Similique sint commodi ex magnam tenetur aspernatur tempore nemo, molestias dolores voluptatibus fuga nulla earum eius porro numquam unde.&lt;br&gt;Aliquam veniam cumque assumenda sint consequuntur corporis harum nihil eos sequi. Asperiores, numquam. Eligendi et itaque deserunt reprehenderit sequi provident modi tempora in! Perspiciatis officiis tempora assumenda! Nam, nisi placeat?&lt;br&gt;A nihil culpa ut assumenda magni cupiditate quo commodi totam possimus eaque, soluta hic eos itaque accusamus, laudantium dolore in labore exercitationem ipsum nesciunt incidunt, ducimus ab? Modi, accusantium enim!&lt;br&gt;Unde nulla molestiae rem dolor modi dolorum harum doloremque, hic ex odio facilis quisquam consectetur necessitatibus recusandae enim, deserunt aliquam temporibus aliquid ut illo numquam. Praesentium vero voluptas nostrum libero.&lt;br&gt;Repellendus maiores fuga eveniet dolores eos placeat sequi molestiae, hic facilis ipsum voluptas earum est neque quo qui aut necessitatibus cumque impedit ducimus ab accusamus. Maiores enim quidem inventore voluptatibus.&lt;br&gt;Blanditiis atque sed ullam. Veritatis, deserunt odit optio dolore, accusantium soluta error corrupti omnis eos itaque, facilis iste culpa voluptates. Commodi ut laudantium voluptas, officia id inventore optio reprehenderit expedita!&lt;br&gt;Natus eligendi quo officia sint minima possimus voluptate reprehenderit? Quam tempora reiciendis, laborum inventore hic numquam sint aliquam sequi in esse ut omnis! Quisquam officia corrupti, nesciunt quis et pariatur.&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Mini lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut\r\n minima architecto quas harum aperiam! Dolorem officia asperiores nemo. \r\nObcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad\r\n reiciendis ipsa quia necessitatibus ducimus vero praesentium \r\nrepellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore,\r\n alias id officia eveniet quod sunt sequi explicabo odio error incidunt \r\ndeserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi \r\ndignissimos rerum optio perferendis debitis omnis, corrupti ea atque \r\nconsequuntur odio doloribus incidunt error dicta veniam explicabo neque \r\nautem. Possimus suscipit in qui exercitationem maxime?&lt;/p&gt;', 'Product 17', 'Product 17', 'Product 17', 'Product 17'),
(104, 2, 'Product 18', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut minima architecto quas harum aperiam! Dolorem officia asperiores nemo. Obcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad reiciendis ipsa quia necessitatibus ducimus vero praesentium repellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore, alias id officia eveniet quod sunt sequi explicabo odio error incidunt deserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi dignissimos rerum optio perferendis debitis omnis, corrupti ea atque consequuntur odio doloribus incidunt error dicta veniam explicabo neque autem. Possimus suscipit in qui exercitationem maxime?&lt;br&gt;Laboriosam impedit ullam dignissimos, asperiores voluptas magni corrupti blanditiis odit eligendi. Similique sint commodi ex magnam tenetur aspernatur tempore nemo, molestias dolores voluptatibus fuga nulla earum eius porro numquam unde.&lt;br&gt;Aliquam veniam cumque assumenda sint consequuntur corporis harum nihil eos sequi. Asperiores, numquam. Eligendi et itaque deserunt reprehenderit sequi provident modi tempora in! Perspiciatis officiis tempora assumenda! Nam, nisi placeat?&lt;br&gt;A nihil culpa ut assumenda magni cupiditate quo commodi totam possimus eaque, soluta hic eos itaque accusamus, laudantium dolore in labore exercitationem ipsum nesciunt incidunt, ducimus ab? Modi, accusantium enim!&lt;br&gt;Unde nulla molestiae rem dolor modi dolorum harum doloremque, hic ex odio facilis quisquam consectetur necessitatibus recusandae enim, deserunt aliquam temporibus aliquid ut illo numquam. Praesentium vero voluptas nostrum libero.&lt;br&gt;Repellendus maiores fuga eveniet dolores eos placeat sequi molestiae, hic facilis ipsum voluptas earum est neque quo qui aut necessitatibus cumque impedit ducimus ab accusamus. Maiores enim quidem inventore voluptatibus.&lt;br&gt;Blanditiis atque sed ullam. Veritatis, deserunt odit optio dolore, accusantium soluta error corrupti omnis eos itaque, facilis iste culpa voluptates. Commodi ut laudantium voluptas, officia id inventore optio reprehenderit expedita!&lt;br&gt;Natus eligendi quo officia sint minima possimus voluptate reprehenderit? Quam tempora reiciendis, laborum inventore hic numquam sint aliquam sequi in esse ut omnis! Quisquam officia corrupti, nesciunt quis et pariatur.&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;Mini lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum labore ut\r\n minima architecto quas harum aperiam! Dolorem officia asperiores nemo. \r\nObcaecati debitis aliquam harum tempore cum eius nihil aliquid dolor?&lt;br&gt;Ad\r\n reiciendis ipsa quia necessitatibus ducimus vero praesentium \r\nrepellendus? Voluptatum dicta iste voluptatibus quasi laboriosam labore,\r\n alias id officia eveniet quod sunt sequi explicabo odio error incidunt \r\ndeserunt eos est?&lt;br&gt;Sit, exercitationem ullam aspernatur modi \r\ndignissimos rerum optio perferendis debitis omnis, corrupti ea atque \r\nconsequuntur odio doloribus incidunt error dicta veniam explicabo neque \r\nautem. Possimus suscipit in qui exercitationem maxime?&lt;/p&gt;', 'Product 18', 'Product 18', 'Product 18', 'Product 18');

-- --------------------------------------------------------

--
-- Table structure for table `product_discount`
--

CREATE TABLE `product_discount` (
  `product_discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_discount`
--

INSERT INTO `product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(615, 64, 2, 10, 1, '88.0000', '0000-00-00', '0000-00-00'),
(616, 64, 2, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(617, 64, 2, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(666, 80, 2, 10, 1, '88.0000', '0000-00-00', '0000-00-00'),
(667, 80, 2, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(668, 80, 2, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(669, 82, 2, 10, 1, '88.0000', '0000-00-00', '0000-00-00'),
(670, 82, 2, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(671, 82, 2, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(672, 83, 2, 10, 1, '88.0000', '0000-00-00', '0000-00-00'),
(673, 83, 2, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(674, 83, 2, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(675, 86, 2, 10, 1, '88.0000', '0000-00-00', '0000-00-00'),
(676, 86, 2, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(677, 86, 2, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(681, 88, 2, 10, 1, '88.0000', '0000-00-00', '0000-00-00'),
(682, 88, 2, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(683, 88, 2, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(684, 89, 2, 10, 1, '88.0000', '0000-00-00', '0000-00-00'),
(685, 89, 2, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(686, 89, 2, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(687, 87, 2, 10, 1, '88.0000', '0000-00-00', '0000-00-00'),
(688, 87, 2, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(689, 87, 2, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(723, 96, 2, 10, 1, '88.0000', '0000-00-00', '0000-00-00'),
(724, 96, 2, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(725, 96, 2, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(726, 97, 2, 10, 1, '88.0000', '0000-00-00', '0000-00-00'),
(727, 97, 2, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(728, 97, 2, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(729, 98, 2, 10, 1, '88.0000', '0000-00-00', '0000-00-00'),
(730, 98, 2, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(731, 98, 2, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(732, 99, 2, 10, 1, '88.0000', '0000-00-00', '0000-00-00'),
(733, 99, 2, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(734, 99, 2, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(735, 100, 2, 10, 1, '88.0000', '0000-00-00', '0000-00-00'),
(736, 100, 2, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(737, 100, 2, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(738, 101, 2, 10, 1, '88.0000', '0000-00-00', '0000-00-00'),
(739, 101, 2, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(740, 101, 2, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(741, 102, 2, 10, 1, '88.0000', '0000-00-00', '0000-00-00'),
(742, 102, 2, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(743, 102, 2, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(744, 103, 2, 10, 1, '88.0000', '0000-00-00', '0000-00-00'),
(745, 103, 2, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(746, 103, 2, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(747, 104, 2, 10, 1, '88.0000', '0000-00-00', '0000-00-00'),
(748, 104, 2, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(749, 104, 2, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(750, 42, 2, 10, 1, '88.0000', '0000-00-00', '0000-00-00'),
(751, 42, 2, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(752, 42, 2, 30, 1, '66.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `product_filter`
--

CREATE TABLE `product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2807, 64, 'catalog/demo_products/product_1/nikolay-tarashchenko-551722-unsplash.jpg', 0),
(2808, 64, 'catalog/demo_products/product_1/aidan-hancock-609469-unsplash.jpg', 0),
(2809, 64, 'catalog/demo_products/product_1/alejandro-escamilla-10-unsplash.jpg', 0),
(2810, 64, 'catalog/demo_products/product_1/andras-vas-655218-unsplash.jpg', 0),
(2811, 64, 'catalog/demo_products/product_1/burst-521042-unsplash.jpg', 0),
(2812, 64, 'catalog/demo_products/product_1/caspar-rubin-224229-unsplash.jpg', 0),
(2813, 64, 'catalog/demo_products/product_1/charles-deluvio-456792-unsplash.jpg', 0),
(2814, 64, 'catalog/demo_products/product_1/evan-gebhart-666379-unsplash.jpg', 0),
(2943, 80, 'catalog/demo_products/product_1/aidan-hancock-609469-unsplash.jpg', 0),
(2944, 80, 'catalog/demo_products/product_1/nikolay-tarashchenko-551722-unsplash.jpg', 0),
(2945, 80, 'catalog/demo_products/product_1/andras-vas-655218-unsplash.jpg', 0),
(2946, 80, 'catalog/demo_products/product_1/burst-521042-unsplash.jpg', 0),
(2947, 80, 'catalog/demo_products/product_1/caspar-rubin-224229-unsplash.jpg', 0),
(2948, 80, 'catalog/demo_products/product_1/charles-deluvio-456792-unsplash.jpg', 0),
(2949, 80, 'catalog/demo_products/product_1/evan-gebhart-666379-unsplash.jpg', 0),
(2950, 80, 'catalog/demo_products/product_1/goran-ivos-771531-unsplash.jpg', 0),
(2951, 82, 'catalog/demo_products/product_1/goran-ivos-771531-unsplash.jpg', 0),
(2952, 82, 'catalog/demo_products/product_1/nikolay-tarashchenko-551722-unsplash.jpg', 0),
(2953, 82, 'catalog/demo_products/product_1/alejandro-escamilla-10-unsplash.jpg', 0),
(2954, 82, 'catalog/demo_products/product_1/andras-vas-655218-unsplash.jpg', 0),
(2955, 82, 'catalog/demo_products/product_1/burst-521042-unsplash.jpg', 0),
(2956, 82, 'catalog/demo_products/product_1/caspar-rubin-224229-unsplash.jpg', 0),
(2957, 82, 'catalog/demo_products/product_1/charles-deluvio-456792-unsplash.jpg', 0),
(2958, 82, 'catalog/demo_products/product_1/evan-gebhart-666379-unsplash.jpg', 0),
(2959, 83, 'catalog/demo_products/product_1/aidan-hancock-609469-unsplash.jpg', 0),
(2960, 83, 'catalog/demo_products/product_1/alejandro-escamilla-10-unsplash.jpg', 0),
(2961, 83, 'catalog/demo_products/product_1/nikolay-tarashchenko-551722-unsplash.jpg', 0),
(2962, 83, 'catalog/demo_products/product_1/burst-521042-unsplash.jpg', 0),
(2963, 83, 'catalog/demo_products/product_1/caspar-rubin-224229-unsplash.jpg', 0),
(2964, 83, 'catalog/demo_products/product_1/charles-deluvio-456792-unsplash.jpg', 0),
(2965, 83, 'catalog/demo_products/product_1/evan-gebhart-666379-unsplash.jpg', 0),
(2966, 83, 'catalog/demo_products/product_1/goran-ivos-771531-unsplash.jpg', 0),
(2967, 86, 'catalog/demo_products/product_1/goran-ivos-771531-unsplash.jpg', 0),
(2968, 86, 'catalog/demo_products/product_1/aidan-hancock-609469-unsplash.jpg', 0),
(2969, 86, 'catalog/demo_products/product_1/alejandro-escamilla-10-unsplash.jpg', 0),
(2970, 86, 'catalog/demo_products/product_1/andras-vas-655218-unsplash.jpg', 0),
(2971, 86, 'catalog/demo_products/product_1/nikolay-tarashchenko-551722-unsplash.jpg', 0),
(2972, 86, 'catalog/demo_products/product_1/caspar-rubin-224229-unsplash.jpg', 0),
(2973, 86, 'catalog/demo_products/product_1/charles-deluvio-456792-unsplash.jpg', 0),
(2974, 86, 'catalog/demo_products/product_1/evan-gebhart-666379-unsplash.jpg', 0),
(2983, 88, 'catalog/demo_products/product_1/goran-ivos-771531-unsplash.jpg', 0),
(2984, 88, 'catalog/demo_products/product_1/aidan-hancock-609469-unsplash.jpg', 0),
(2985, 88, 'catalog/demo_products/product_1/alejandro-escamilla-10-unsplash.jpg', 0),
(2986, 88, 'catalog/demo_products/product_1/andras-vas-655218-unsplash.jpg', 0),
(2987, 88, 'catalog/demo_products/product_1/burst-521042-unsplash.jpg', 0),
(2988, 88, 'catalog/demo_products/product_1/caspar-rubin-224229-unsplash.jpg', 0),
(2989, 88, 'catalog/demo_products/product_1/nikolay-tarashchenko-551722-unsplash.jpg', 0),
(2990, 88, 'catalog/demo_products/product_1/evan-gebhart-666379-unsplash.jpg', 0),
(2991, 89, 'catalog/demo_products/product_1/aidan-hancock-609469-unsplash.jpg', 0),
(2992, 89, 'catalog/demo_products/product_1/alejandro-escamilla-10-unsplash.jpg', 0),
(2993, 89, 'catalog/demo_products/product_1/andras-vas-655218-unsplash.jpg', 0),
(2994, 89, 'catalog/demo_products/product_1/burst-521042-unsplash.jpg', 0),
(2995, 89, 'catalog/demo_products/product_1/caspar-rubin-224229-unsplash.jpg', 0),
(2996, 89, 'catalog/demo_products/product_1/charles-deluvio-456792-unsplash.jpg', 0),
(2997, 89, 'catalog/demo_products/product_1/nikolay-tarashchenko-551722-unsplash.jpg', 0),
(2998, 89, 'catalog/demo_products/product_1/goran-ivos-771531-unsplash.jpg', 0),
(2999, 87, 'catalog/demo_products/product_1/aidan-hancock-609469-unsplash.jpg', 0),
(3000, 87, 'catalog/demo_products/product_1/alejandro-escamilla-10-unsplash.jpg', 0),
(3001, 87, 'catalog/demo_products/product_1/andras-vas-655218-unsplash.jpg', 0),
(3002, 87, 'catalog/demo_products/product_1/burst-521042-unsplash.jpg', 0),
(3003, 87, 'catalog/demo_products/product_1/nikolay-tarashchenko-551722-unsplash.jpg', 0),
(3004, 87, 'catalog/demo_products/product_1/charles-deluvio-456792-unsplash.jpg', 0),
(3005, 87, 'catalog/demo_products/product_1/evan-gebhart-666379-unsplash.jpg', 0),
(3006, 87, 'catalog/demo_products/product_1/goran-ivos-771531-unsplash.jpg', 0),
(3095, 96, 'catalog/demo_products/product_1/ibrahim-rifath-720971-unsplash.jpg', 0),
(3096, 96, 'catalog/demo_products/product_1/julian-o-hayon-257567-unsplash.jpg', 0),
(3097, 96, 'catalog/demo_products/product_1/max-nelson-492729-unsplash.jpg', 0),
(3098, 96, 'catalog/demo_products/product_1/nikolay-tarashchenko-551717-unsplash.jpg', 0),
(3099, 96, 'catalog/demo_products/product_1/nikolay-tarashchenko-614285-unsplash.jpg', 0),
(3100, 96, 'catalog/demo_products/product_1/realmac-dan-365523-unsplash.jpg', 0),
(3101, 96, 'catalog/demo_products/product_1/vivek-kumar-394543-unsplash.jpg', 0),
(3102, 96, 'catalog/demo_products/product_1/yu-kato-629650-unsplash.jpg', 0),
(3103, 97, 'catalog/demo_products/product_1/dillon-shook-511764-unsplash.jpg', 0),
(3104, 97, 'catalog/demo_products/product_1/julian-o-hayon-257567-unsplash.jpg', 0),
(3105, 97, 'catalog/demo_products/product_1/max-nelson-492729-unsplash.jpg', 0),
(3106, 97, 'catalog/demo_products/product_1/nikolay-tarashchenko-551717-unsplash.jpg', 0),
(3107, 97, 'catalog/demo_products/product_1/nikolay-tarashchenko-614285-unsplash.jpg', 0),
(3108, 97, 'catalog/demo_products/product_1/realmac-dan-365523-unsplash.jpg', 0),
(3109, 97, 'catalog/demo_products/product_1/vivek-kumar-394543-unsplash.jpg', 0),
(3110, 97, 'catalog/demo_products/product_1/yu-kato-629650-unsplash.jpg', 0),
(3111, 98, 'catalog/demo_products/product_1/ibrahim-rifath-720971-unsplash.jpg', 0),
(3112, 98, 'catalog/demo_products/product_1/dillon-shook-511764-unsplash.jpg', 0),
(3113, 98, 'catalog/demo_products/product_1/max-nelson-492729-unsplash.jpg', 0),
(3114, 98, 'catalog/demo_products/product_1/nikolay-tarashchenko-551717-unsplash.jpg', 0),
(3115, 98, 'catalog/demo_products/product_1/nikolay-tarashchenko-614285-unsplash.jpg', 0),
(3116, 98, 'catalog/demo_products/product_1/realmac-dan-365523-unsplash.jpg', 0),
(3117, 98, 'catalog/demo_products/product_1/vivek-kumar-394543-unsplash.jpg', 0),
(3118, 98, 'catalog/demo_products/product_1/yu-kato-629650-unsplash.jpg', 0),
(3119, 99, 'catalog/demo_products/product_1/ibrahim-rifath-720971-unsplash.jpg', 0),
(3120, 99, 'catalog/demo_products/product_1/julian-o-hayon-257567-unsplash.jpg', 0),
(3121, 99, 'catalog/demo_products/product_1/dillon-shook-511764-unsplash.jpg', 0),
(3122, 99, 'catalog/demo_products/product_1/nikolay-tarashchenko-551717-unsplash.jpg', 0),
(3123, 99, 'catalog/demo_products/product_1/nikolay-tarashchenko-614285-unsplash.jpg', 0),
(3124, 99, 'catalog/demo_products/product_1/realmac-dan-365523-unsplash.jpg', 0),
(3125, 99, 'catalog/demo_products/product_1/vivek-kumar-394543-unsplash.jpg', 0),
(3126, 99, 'catalog/demo_products/product_1/yu-kato-629650-unsplash.jpg', 0),
(3127, 100, 'catalog/demo_products/product_1/ibrahim-rifath-720971-unsplash.jpg', 0),
(3128, 100, 'catalog/demo_products/product_1/julian-o-hayon-257567-unsplash.jpg', 0),
(3129, 100, 'catalog/demo_products/product_1/max-nelson-492729-unsplash.jpg', 0),
(3130, 100, 'catalog/demo_products/product_1/dillon-shook-511764-unsplash.jpg', 0),
(3131, 100, 'catalog/demo_products/product_1/nikolay-tarashchenko-614285-unsplash.jpg', 0),
(3132, 100, 'catalog/demo_products/product_1/realmac-dan-365523-unsplash.jpg', 0),
(3133, 100, 'catalog/demo_products/product_1/vivek-kumar-394543-unsplash.jpg', 0),
(3134, 100, 'catalog/demo_products/product_1/yu-kato-629650-unsplash.jpg', 0),
(3135, 101, 'catalog/demo_products/product_1/ibrahim-rifath-720971-unsplash.jpg', 0),
(3136, 101, 'catalog/demo_products/product_1/julian-o-hayon-257567-unsplash.jpg', 0),
(3137, 101, 'catalog/demo_products/product_1/max-nelson-492729-unsplash.jpg', 0),
(3138, 101, 'catalog/demo_products/product_1/nikolay-tarashchenko-551717-unsplash.jpg', 0),
(3139, 101, 'catalog/demo_products/product_1/dillon-shook-511764-unsplash.jpg', 0),
(3140, 101, 'catalog/demo_products/product_1/realmac-dan-365523-unsplash.jpg', 0),
(3141, 101, 'catalog/demo_products/product_1/vivek-kumar-394543-unsplash.jpg', 0),
(3142, 101, 'catalog/demo_products/product_1/yu-kato-629650-unsplash.jpg', 0),
(3143, 102, 'catalog/demo_products/product_1/julian-o-hayon-257567-unsplash.jpg', 0),
(3144, 102, 'catalog/demo_products/product_1/max-nelson-492729-unsplash.jpg', 0),
(3145, 102, 'catalog/demo_products/product_1/nikolay-tarashchenko-551717-unsplash.jpg', 0),
(3146, 102, 'catalog/demo_products/product_1/nikolay-tarashchenko-614285-unsplash.jpg', 0),
(3147, 102, 'catalog/demo_products/product_1/dillon-shook-511764-unsplash.jpg', 0),
(3148, 102, 'catalog/demo_products/product_1/vivek-kumar-394543-unsplash.jpg', 0),
(3149, 102, 'catalog/demo_products/product_1/yu-kato-629650-unsplash.jpg', 0),
(3150, 102, 'catalog/demo_products/product_1/ibrahim-rifath-720971-unsplash.jpg', 0),
(3151, 103, 'catalog/demo_products/product_1/ibrahim-rifath-720971-unsplash.jpg', 0),
(3152, 103, 'catalog/demo_products/product_1/julian-o-hayon-257567-unsplash.jpg', 0),
(3153, 103, 'catalog/demo_products/product_1/max-nelson-492729-unsplash.jpg', 0),
(3154, 103, 'catalog/demo_products/product_1/nikolay-tarashchenko-551717-unsplash.jpg', 0),
(3155, 103, 'catalog/demo_products/product_1/nikolay-tarashchenko-614285-unsplash.jpg', 0),
(3156, 103, 'catalog/demo_products/product_1/realmac-dan-365523-unsplash.jpg', 0),
(3157, 103, 'catalog/demo_products/product_1/dillon-shook-511764-unsplash.jpg', 0),
(3158, 103, 'catalog/demo_products/product_1/yu-kato-629650-unsplash.jpg', 0),
(3159, 104, 'catalog/demo_products/product_1/ibrahim-rifath-720971-unsplash.jpg', 0),
(3160, 104, 'catalog/demo_products/product_1/julian-o-hayon-257567-unsplash.jpg', 0),
(3161, 104, 'catalog/demo_products/product_1/max-nelson-492729-unsplash.jpg', 0),
(3162, 104, 'catalog/demo_products/product_1/nikolay-tarashchenko-551717-unsplash.jpg', 0),
(3163, 104, 'catalog/demo_products/product_1/nikolay-tarashchenko-614285-unsplash.jpg', 0),
(3164, 104, 'catalog/demo_products/product_1/realmac-dan-365523-unsplash.jpg', 0),
(3165, 104, 'catalog/demo_products/product_1/vivek-kumar-394543-unsplash.jpg', 0),
(3166, 104, 'catalog/demo_products/product_1/dillon-shook-511764-unsplash.jpg', 0),
(3167, 42, 'catalog/demo_products/product_1/goran-ivos-771531-unsplash.jpg', 0),
(3168, 42, 'catalog/demo_products/product_1/aidan-hancock-609469-unsplash.jpg', 0),
(3169, 42, 'catalog/demo_products/product_1/alejandro-escamilla-10-unsplash.jpg', 0),
(3170, 42, 'catalog/demo_products/product_1/andras-vas-655218-unsplash.jpg', 0),
(3171, 42, 'catalog/demo_products/product_1/burst-521042-unsplash.jpg', 0),
(3172, 42, 'catalog/demo_products/product_1/caspar-rubin-224229-unsplash.jpg', 0),
(3173, 42, 'catalog/demo_products/product_1/charles-deluvio-456792-unsplash.jpg', 0),
(3174, 42, 'catalog/demo_products/product_1/evan-gebhart-666379-unsplash.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_option`
--

CREATE TABLE `product_option` (
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_option`
--

INSERT INTO `product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(227, 42, 13, '', 0),
(228, 42, 14, '', 0),
(229, 42, 15, '', 0),
(260, 64, 13, '', 1),
(261, 64, 14, '', 0),
(262, 64, 15, '', 0),
(308, 80, 13, '', 1),
(309, 80, 14, '', 0),
(310, 80, 15, '', 0),
(314, 82, 13, '', 1),
(315, 82, 14, '', 0),
(316, 82, 15, '', 0),
(317, 83, 13, '', 1),
(318, 83, 14, '', 0),
(319, 83, 15, '', 0),
(326, 86, 13, '', 1),
(327, 86, 14, '', 0),
(328, 86, 15, '', 0),
(329, 87, 13, '', 1),
(330, 87, 14, '', 0),
(331, 87, 15, '', 0),
(332, 88, 13, '', 1),
(333, 88, 14, '', 0),
(334, 88, 15, '', 0),
(335, 89, 13, '', 1),
(336, 89, 14, '', 0),
(337, 89, 15, '', 0),
(356, 96, 13, '', 1),
(357, 96, 14, '', 0),
(358, 96, 15, '', 0),
(359, 97, 13, '', 1),
(360, 97, 14, '', 0),
(361, 97, 15, '', 0),
(362, 98, 13, '', 1),
(363, 98, 14, '', 0),
(364, 98, 15, '', 0),
(365, 99, 13, '', 1),
(366, 99, 14, '', 0),
(367, 99, 15, '', 0),
(368, 100, 13, '', 1),
(369, 100, 14, '', 0),
(370, 100, 15, '', 0),
(371, 101, 13, '', 1),
(372, 101, 14, '', 0),
(373, 101, 15, '', 0),
(374, 102, 13, '', 1),
(375, 102, 14, '', 0),
(376, 102, 15, '', 0),
(377, 103, 13, '', 1),
(378, 103, 14, '', 0),
(379, 103, 15, '', 0),
(380, 104, 13, '', 1),
(381, 104, 14, '', 0),
(382, 104, 15, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_option_value`
--

CREATE TABLE `product_option_value` (
  `product_option_value_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_option_value`
--

INSERT INTO `product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`) VALUES
(17, 227, 42, 13, 49, 10, 1, '10.0000', '+', 0, '+'),
(18, 227, 42, 13, 50, 10, 1, '20.0000', '+', 0, '+'),
(19, 227, 42, 13, 51, 10, 1, '30.0000', '+', 0, '+'),
(20, 227, 42, 13, 52, 10, 1, '40.0000', '+', 0, '+'),
(21, 227, 42, 13, 53, 10, 1, '50.0000', '+', 0, '+'),
(22, 227, 42, 13, 54, 10, 1, '60.0000', '+', 0, '+'),
(23, 227, 42, 13, 55, 10, 1, '70.0000', '+', 0, '+'),
(24, 227, 42, 13, 56, 10, 1, '80.0000', '+', 0, '+'),
(25, 227, 42, 13, 57, 10, 1, '90.0000', '+', 0, '+'),
(26, 227, 42, 13, 58, 10, 1, '100.0000', '+', 0, '+'),
(27, 228, 42, 14, 59, 10, 1, '10.0000', '+', 0, '+'),
(28, 228, 42, 14, 60, 10, 1, '20.0000', '+', 0, '+'),
(29, 228, 42, 14, 61, 10, 1, '30.0000', '+', 0, '+'),
(30, 228, 42, 14, 62, 10, 1, '40.0000', '+', 0, '+'),
(31, 228, 42, 14, 63, 10, 1, '50.0000', '+', 0, '+'),
(32, 228, 42, 14, 64, 10, 1, '60.0000', '+', 0, '+'),
(33, 228, 42, 14, 65, 10, 1, '70.0000', '+', 0, '+'),
(34, 228, 42, 14, 66, 10, 1, '80.0000', '+', 0, '+'),
(35, 228, 42, 14, 67, 10, 1, '90.0000', '+', 0, '+'),
(36, 228, 42, 14, 68, 10, 1, '100.0000', '+', 0, '+'),
(37, 229, 42, 15, 69, 10, 1, '10.0000', '+', 0, '+'),
(38, 229, 42, 15, 70, 10, 1, '20.0000', '+', 0, '+'),
(39, 229, 42, 15, 71, 10, 1, '30.0000', '+', 0, '+'),
(40, 229, 42, 15, 72, 10, 1, '40.0000', '+', 0, '+'),
(41, 229, 42, 15, 73, 10, 1, '50.0000', '+', 0, '+'),
(42, 229, 42, 15, 74, 10, 1, '60.0000', '+', 0, '+'),
(43, 229, 42, 15, 75, 10, 1, '70.0000', '+', 0, '+'),
(44, 229, 42, 15, 76, 10, 1, '80.0000', '+', 0, '+'),
(45, 229, 42, 15, 77, 10, 1, '90.0000', '+', 0, '+'),
(46, 229, 42, 15, 78, 10, 1, '100.0000', '+', 0, '+'),
(266, 260, 64, 13, 49, 10, 1, '10.0000', '+', 0, '+'),
(267, 260, 64, 13, 50, 10, 1, '20.0000', '+', 0, '+'),
(268, 260, 64, 13, 51, 10, 1, '30.0000', '+', 0, '+'),
(269, 260, 64, 13, 52, 10, 1, '40.0000', '+', 0, '+'),
(270, 260, 64, 13, 53, 10, 1, '50.0000', '+', 0, '+'),
(271, 260, 64, 13, 54, 10, 1, '60.0000', '+', 0, '+'),
(272, 260, 64, 13, 55, 10, 1, '70.0000', '+', 0, '+'),
(273, 260, 64, 13, 56, 10, 1, '80.0000', '+', 0, '+'),
(274, 260, 64, 13, 57, 10, 1, '90.0000', '+', 0, '+'),
(275, 260, 64, 13, 58, 10, 1, '100.0000', '+', 0, '+'),
(276, 261, 64, 14, 59, 10, 1, '10.0000', '+', 0, '+'),
(277, 261, 64, 14, 60, 10, 1, '20.0000', '+', 0, '+'),
(278, 261, 64, 14, 61, 10, 1, '30.0000', '+', 0, '+'),
(279, 261, 64, 14, 62, 10, 1, '40.0000', '+', 0, '+'),
(280, 261, 64, 14, 63, 10, 1, '50.0000', '+', 0, '+'),
(281, 261, 64, 14, 64, 10, 1, '60.0000', '+', 0, '+'),
(282, 261, 64, 14, 65, 10, 1, '70.0000', '+', 0, '+'),
(283, 261, 64, 14, 66, 10, 1, '80.0000', '+', 0, '+'),
(284, 261, 64, 14, 67, 10, 1, '90.0000', '+', 0, '+'),
(285, 261, 64, 14, 68, 10, 1, '100.0000', '+', 0, '+'),
(286, 262, 64, 15, 69, 10, 1, '10.0000', '+', 0, '+'),
(287, 262, 64, 15, 70, 10, 1, '20.0000', '+', 0, '+'),
(288, 262, 64, 15, 71, 10, 1, '30.0000', '+', 0, '+'),
(289, 262, 64, 15, 72, 10, 1, '40.0000', '+', 0, '+'),
(290, 262, 64, 15, 73, 10, 1, '50.0000', '+', 0, '+'),
(291, 262, 64, 15, 74, 10, 1, '60.0000', '+', 0, '+'),
(292, 262, 64, 15, 75, 10, 1, '70.0000', '+', 0, '+'),
(293, 262, 64, 15, 76, 10, 1, '80.0000', '+', 0, '+'),
(294, 262, 64, 15, 77, 10, 1, '90.0000', '+', 0, '+'),
(295, 262, 64, 15, 78, 10, 1, '100.0000', '+', 0, '+'),
(746, 308, 80, 13, 49, 10, 1, '10.0000', '+', 0, '+'),
(747, 308, 80, 13, 50, 10, 1, '20.0000', '+', 0, '+'),
(748, 308, 80, 13, 51, 10, 1, '30.0000', '+', 0, '+'),
(749, 308, 80, 13, 52, 10, 1, '40.0000', '+', 0, '+'),
(750, 308, 80, 13, 53, 10, 1, '50.0000', '+', 0, '+'),
(751, 308, 80, 13, 54, 10, 1, '60.0000', '+', 0, '+'),
(752, 308, 80, 13, 55, 10, 1, '70.0000', '+', 0, '+'),
(753, 308, 80, 13, 56, 10, 1, '80.0000', '+', 0, '+'),
(754, 308, 80, 13, 57, 10, 1, '90.0000', '+', 0, '+'),
(755, 308, 80, 13, 58, 10, 1, '100.0000', '+', 0, '+'),
(756, 309, 80, 14, 59, 10, 1, '10.0000', '+', 0, '+'),
(757, 309, 80, 14, 60, 10, 1, '20.0000', '+', 0, '+'),
(758, 309, 80, 14, 61, 10, 1, '30.0000', '+', 0, '+'),
(759, 309, 80, 14, 62, 10, 1, '40.0000', '+', 0, '+'),
(760, 309, 80, 14, 63, 10, 1, '50.0000', '+', 0, '+'),
(761, 309, 80, 14, 64, 10, 1, '60.0000', '+', 0, '+'),
(762, 309, 80, 14, 65, 10, 1, '70.0000', '+', 0, '+'),
(763, 309, 80, 14, 66, 10, 1, '80.0000', '+', 0, '+'),
(764, 309, 80, 14, 67, 10, 1, '90.0000', '+', 0, '+'),
(765, 309, 80, 14, 68, 10, 1, '100.0000', '+', 0, '+'),
(766, 310, 80, 15, 69, 10, 1, '10.0000', '+', 0, '+'),
(767, 310, 80, 15, 70, 10, 1, '20.0000', '+', 0, '+'),
(768, 310, 80, 15, 71, 10, 1, '30.0000', '+', 0, '+'),
(769, 310, 80, 15, 72, 10, 1, '40.0000', '+', 0, '+'),
(770, 310, 80, 15, 73, 10, 1, '50.0000', '+', 0, '+'),
(771, 310, 80, 15, 74, 10, 1, '60.0000', '+', 0, '+'),
(772, 310, 80, 15, 75, 10, 1, '70.0000', '+', 0, '+'),
(773, 310, 80, 15, 76, 10, 1, '80.0000', '+', 0, '+'),
(774, 310, 80, 15, 77, 10, 1, '90.0000', '+', 0, '+'),
(775, 310, 80, 15, 78, 10, 1, '100.0000', '+', 0, '+'),
(806, 314, 82, 13, 49, 10, 1, '10.0000', '+', 0, '+'),
(807, 314, 82, 13, 50, 10, 1, '20.0000', '+', 0, '+'),
(808, 314, 82, 13, 51, 10, 1, '30.0000', '+', 0, '+'),
(809, 314, 82, 13, 52, 10, 1, '40.0000', '+', 0, '+'),
(810, 314, 82, 13, 53, 10, 1, '50.0000', '+', 0, '+'),
(811, 314, 82, 13, 54, 10, 1, '60.0000', '+', 0, '+'),
(812, 314, 82, 13, 55, 10, 1, '70.0000', '+', 0, '+'),
(813, 314, 82, 13, 56, 10, 1, '80.0000', '+', 0, '+'),
(814, 314, 82, 13, 57, 10, 1, '90.0000', '+', 0, '+'),
(815, 314, 82, 13, 58, 10, 1, '100.0000', '+', 0, '+'),
(816, 315, 82, 14, 59, 10, 1, '10.0000', '+', 0, '+'),
(817, 315, 82, 14, 60, 10, 1, '20.0000', '+', 0, '+'),
(818, 315, 82, 14, 61, 10, 1, '30.0000', '+', 0, '+'),
(819, 315, 82, 14, 62, 10, 1, '40.0000', '+', 0, '+'),
(820, 315, 82, 14, 63, 10, 1, '50.0000', '+', 0, '+'),
(821, 315, 82, 14, 64, 10, 1, '60.0000', '+', 0, '+'),
(822, 315, 82, 14, 65, 10, 1, '70.0000', '+', 0, '+'),
(823, 315, 82, 14, 66, 10, 1, '80.0000', '+', 0, '+'),
(824, 315, 82, 14, 67, 10, 1, '90.0000', '+', 0, '+'),
(825, 315, 82, 14, 68, 10, 1, '100.0000', '+', 0, '+'),
(826, 316, 82, 15, 69, 10, 1, '10.0000', '+', 0, '+'),
(827, 316, 82, 15, 70, 10, 1, '20.0000', '+', 0, '+'),
(828, 316, 82, 15, 71, 10, 1, '30.0000', '+', 0, '+'),
(829, 316, 82, 15, 72, 10, 1, '40.0000', '+', 0, '+'),
(830, 316, 82, 15, 73, 10, 1, '50.0000', '+', 0, '+'),
(831, 316, 82, 15, 74, 10, 1, '60.0000', '+', 0, '+'),
(832, 316, 82, 15, 75, 10, 1, '70.0000', '+', 0, '+'),
(833, 316, 82, 15, 76, 10, 1, '80.0000', '+', 0, '+'),
(834, 316, 82, 15, 77, 10, 1, '90.0000', '+', 0, '+'),
(835, 316, 82, 15, 78, 10, 1, '100.0000', '+', 0, '+'),
(836, 317, 83, 13, 49, 10, 1, '10.0000', '+', 0, '+'),
(837, 317, 83, 13, 50, 10, 1, '20.0000', '+', 0, '+'),
(838, 317, 83, 13, 51, 10, 1, '30.0000', '+', 0, '+'),
(839, 317, 83, 13, 52, 10, 1, '40.0000', '+', 0, '+'),
(840, 317, 83, 13, 53, 10, 1, '50.0000', '+', 0, '+'),
(841, 317, 83, 13, 54, 10, 1, '60.0000', '+', 0, '+'),
(842, 317, 83, 13, 55, 10, 1, '70.0000', '+', 0, '+'),
(843, 317, 83, 13, 56, 10, 1, '80.0000', '+', 0, '+'),
(844, 317, 83, 13, 57, 10, 1, '90.0000', '+', 0, '+'),
(845, 317, 83, 13, 58, 10, 1, '100.0000', '+', 0, '+'),
(846, 318, 83, 14, 59, 10, 1, '10.0000', '+', 0, '+'),
(847, 318, 83, 14, 60, 10, 1, '20.0000', '+', 0, '+'),
(848, 318, 83, 14, 61, 10, 1, '30.0000', '+', 0, '+'),
(849, 318, 83, 14, 62, 10, 1, '40.0000', '+', 0, '+'),
(850, 318, 83, 14, 63, 10, 1, '50.0000', '+', 0, '+'),
(851, 318, 83, 14, 64, 10, 1, '60.0000', '+', 0, '+'),
(852, 318, 83, 14, 65, 10, 1, '70.0000', '+', 0, '+'),
(853, 318, 83, 14, 66, 10, 1, '80.0000', '+', 0, '+'),
(854, 318, 83, 14, 67, 10, 1, '90.0000', '+', 0, '+'),
(855, 318, 83, 14, 68, 10, 1, '100.0000', '+', 0, '+'),
(856, 319, 83, 15, 69, 10, 1, '10.0000', '+', 0, '+'),
(857, 319, 83, 15, 70, 10, 1, '20.0000', '+', 0, '+'),
(858, 319, 83, 15, 71, 10, 1, '30.0000', '+', 0, '+'),
(859, 319, 83, 15, 72, 10, 1, '40.0000', '+', 0, '+'),
(860, 319, 83, 15, 73, 10, 1, '50.0000', '+', 0, '+'),
(861, 319, 83, 15, 74, 10, 1, '60.0000', '+', 0, '+'),
(862, 319, 83, 15, 75, 10, 1, '70.0000', '+', 0, '+'),
(863, 319, 83, 15, 76, 10, 1, '80.0000', '+', 0, '+'),
(864, 319, 83, 15, 77, 10, 1, '90.0000', '+', 0, '+'),
(865, 319, 83, 15, 78, 10, 1, '100.0000', '+', 0, '+'),
(926, 326, 86, 13, 49, 10, 1, '10.0000', '+', 0, '+'),
(927, 326, 86, 13, 50, 10, 1, '20.0000', '+', 0, '+'),
(928, 326, 86, 13, 51, 10, 1, '30.0000', '+', 0, '+'),
(929, 326, 86, 13, 52, 10, 1, '40.0000', '+', 0, '+'),
(930, 326, 86, 13, 53, 10, 1, '50.0000', '+', 0, '+'),
(931, 326, 86, 13, 54, 10, 1, '60.0000', '+', 0, '+'),
(932, 326, 86, 13, 55, 10, 1, '70.0000', '+', 0, '+'),
(933, 326, 86, 13, 56, 10, 1, '80.0000', '+', 0, '+'),
(934, 326, 86, 13, 57, 10, 1, '90.0000', '+', 0, '+'),
(935, 326, 86, 13, 58, 10, 1, '100.0000', '+', 0, '+'),
(936, 327, 86, 14, 59, 10, 1, '10.0000', '+', 0, '+'),
(937, 327, 86, 14, 60, 10, 1, '20.0000', '+', 0, '+'),
(938, 327, 86, 14, 61, 10, 1, '30.0000', '+', 0, '+'),
(939, 327, 86, 14, 62, 10, 1, '40.0000', '+', 0, '+'),
(940, 327, 86, 14, 63, 10, 1, '50.0000', '+', 0, '+'),
(941, 327, 86, 14, 64, 10, 1, '60.0000', '+', 0, '+'),
(942, 327, 86, 14, 65, 10, 1, '70.0000', '+', 0, '+'),
(943, 327, 86, 14, 66, 10, 1, '80.0000', '+', 0, '+'),
(944, 327, 86, 14, 67, 10, 1, '90.0000', '+', 0, '+'),
(945, 327, 86, 14, 68, 10, 1, '100.0000', '+', 0, '+'),
(946, 328, 86, 15, 69, 10, 1, '10.0000', '+', 0, '+'),
(947, 328, 86, 15, 70, 10, 1, '20.0000', '+', 0, '+'),
(948, 328, 86, 15, 71, 10, 1, '30.0000', '+', 0, '+'),
(949, 328, 86, 15, 72, 10, 1, '40.0000', '+', 0, '+'),
(950, 328, 86, 15, 73, 10, 1, '50.0000', '+', 0, '+'),
(951, 328, 86, 15, 74, 10, 1, '60.0000', '+', 0, '+'),
(952, 328, 86, 15, 75, 10, 1, '70.0000', '+', 0, '+'),
(953, 328, 86, 15, 76, 10, 1, '80.0000', '+', 0, '+'),
(954, 328, 86, 15, 77, 10, 1, '90.0000', '+', 0, '+'),
(955, 328, 86, 15, 78, 10, 1, '100.0000', '+', 0, '+'),
(956, 329, 87, 13, 49, 10, 1, '10.0000', '+', 0, '+'),
(957, 329, 87, 13, 50, 10, 1, '20.0000', '+', 0, '+'),
(958, 329, 87, 13, 51, 10, 1, '30.0000', '+', 0, '+'),
(959, 329, 87, 13, 52, 10, 1, '40.0000', '+', 0, '+'),
(960, 329, 87, 13, 53, 10, 1, '50.0000', '+', 0, '+'),
(961, 329, 87, 13, 54, 10, 1, '60.0000', '+', 0, '+'),
(962, 329, 87, 13, 55, 10, 1, '70.0000', '+', 0, '+'),
(963, 329, 87, 13, 56, 10, 1, '80.0000', '+', 0, '+'),
(964, 329, 87, 13, 57, 10, 1, '90.0000', '+', 0, '+'),
(965, 329, 87, 13, 58, 10, 1, '100.0000', '+', 0, '+'),
(966, 330, 87, 14, 59, 10, 1, '10.0000', '+', 0, '+'),
(967, 330, 87, 14, 60, 10, 1, '20.0000', '+', 0, '+'),
(968, 330, 87, 14, 61, 10, 1, '30.0000', '+', 0, '+'),
(969, 330, 87, 14, 62, 10, 1, '40.0000', '+', 0, '+'),
(970, 330, 87, 14, 63, 10, 1, '50.0000', '+', 0, '+'),
(971, 330, 87, 14, 64, 10, 1, '60.0000', '+', 0, '+'),
(972, 330, 87, 14, 65, 10, 1, '70.0000', '+', 0, '+'),
(973, 330, 87, 14, 66, 10, 1, '80.0000', '+', 0, '+'),
(974, 330, 87, 14, 67, 10, 1, '90.0000', '+', 0, '+'),
(975, 330, 87, 14, 68, 10, 1, '100.0000', '+', 0, '+'),
(976, 331, 87, 15, 69, 10, 1, '10.0000', '+', 0, '+'),
(977, 331, 87, 15, 70, 10, 1, '20.0000', '+', 0, '+'),
(978, 331, 87, 15, 71, 10, 1, '30.0000', '+', 0, '+'),
(979, 331, 87, 15, 72, 10, 1, '40.0000', '+', 0, '+'),
(980, 331, 87, 15, 73, 10, 1, '50.0000', '+', 0, '+'),
(981, 331, 87, 15, 74, 10, 1, '60.0000', '+', 0, '+'),
(982, 331, 87, 15, 75, 10, 1, '70.0000', '+', 0, '+'),
(983, 331, 87, 15, 76, 10, 1, '80.0000', '+', 0, '+'),
(984, 331, 87, 15, 77, 10, 1, '90.0000', '+', 0, '+'),
(985, 331, 87, 15, 78, 10, 1, '100.0000', '+', 0, '+'),
(986, 332, 88, 13, 49, 10, 1, '10.0000', '+', 0, '+'),
(987, 332, 88, 13, 50, 10, 1, '20.0000', '+', 0, '+'),
(988, 332, 88, 13, 51, 10, 1, '30.0000', '+', 0, '+'),
(989, 332, 88, 13, 52, 10, 1, '40.0000', '+', 0, '+'),
(990, 332, 88, 13, 53, 10, 1, '50.0000', '+', 0, '+'),
(991, 332, 88, 13, 54, 10, 1, '60.0000', '+', 0, '+'),
(992, 332, 88, 13, 55, 10, 1, '70.0000', '+', 0, '+'),
(993, 332, 88, 13, 56, 10, 1, '80.0000', '+', 0, '+'),
(994, 332, 88, 13, 57, 10, 1, '90.0000', '+', 0, '+'),
(995, 332, 88, 13, 58, 10, 1, '100.0000', '+', 0, '+'),
(996, 333, 88, 14, 59, 10, 1, '10.0000', '+', 0, '+'),
(997, 333, 88, 14, 60, 10, 1, '20.0000', '+', 0, '+'),
(998, 333, 88, 14, 61, 10, 1, '30.0000', '+', 0, '+'),
(999, 333, 88, 14, 62, 10, 1, '40.0000', '+', 0, '+'),
(1000, 333, 88, 14, 63, 10, 1, '50.0000', '+', 0, '+'),
(1001, 333, 88, 14, 64, 10, 1, '60.0000', '+', 0, '+'),
(1002, 333, 88, 14, 65, 10, 1, '70.0000', '+', 0, '+'),
(1003, 333, 88, 14, 66, 10, 1, '80.0000', '+', 0, '+'),
(1004, 333, 88, 14, 67, 10, 1, '90.0000', '+', 0, '+'),
(1005, 333, 88, 14, 68, 10, 1, '100.0000', '+', 0, '+'),
(1006, 334, 88, 15, 69, 10, 1, '10.0000', '+', 0, '+'),
(1007, 334, 88, 15, 70, 10, 1, '20.0000', '+', 0, '+'),
(1008, 334, 88, 15, 71, 10, 1, '30.0000', '+', 0, '+'),
(1009, 334, 88, 15, 72, 10, 1, '40.0000', '+', 0, '+'),
(1010, 334, 88, 15, 73, 10, 1, '50.0000', '+', 0, '+'),
(1011, 334, 88, 15, 74, 10, 1, '60.0000', '+', 0, '+'),
(1012, 334, 88, 15, 75, 10, 1, '70.0000', '+', 0, '+'),
(1013, 334, 88, 15, 76, 10, 1, '80.0000', '+', 0, '+'),
(1014, 334, 88, 15, 77, 10, 1, '90.0000', '+', 0, '+'),
(1015, 334, 88, 15, 78, 10, 1, '100.0000', '+', 0, '+'),
(1016, 335, 89, 13, 49, 10, 1, '10.0000', '+', 0, '+'),
(1017, 335, 89, 13, 50, 10, 1, '20.0000', '+', 0, '+'),
(1018, 335, 89, 13, 51, 10, 1, '30.0000', '+', 0, '+'),
(1019, 335, 89, 13, 52, 10, 1, '40.0000', '+', 0, '+'),
(1020, 335, 89, 13, 53, 10, 1, '50.0000', '+', 0, '+'),
(1021, 335, 89, 13, 54, 10, 1, '60.0000', '+', 0, '+'),
(1022, 335, 89, 13, 55, 10, 1, '70.0000', '+', 0, '+'),
(1023, 335, 89, 13, 56, 10, 1, '80.0000', '+', 0, '+'),
(1024, 335, 89, 13, 57, 10, 1, '90.0000', '+', 0, '+'),
(1025, 335, 89, 13, 58, 10, 1, '100.0000', '+', 0, '+'),
(1026, 336, 89, 14, 59, 10, 1, '10.0000', '+', 0, '+'),
(1027, 336, 89, 14, 60, 10, 1, '20.0000', '+', 0, '+'),
(1028, 336, 89, 14, 61, 10, 1, '30.0000', '+', 0, '+'),
(1029, 336, 89, 14, 62, 10, 1, '40.0000', '+', 0, '+'),
(1030, 336, 89, 14, 63, 10, 1, '50.0000', '+', 0, '+'),
(1031, 336, 89, 14, 64, 10, 1, '60.0000', '+', 0, '+'),
(1032, 336, 89, 14, 65, 10, 1, '70.0000', '+', 0, '+'),
(1033, 336, 89, 14, 66, 10, 1, '80.0000', '+', 0, '+'),
(1034, 336, 89, 14, 67, 10, 1, '90.0000', '+', 0, '+'),
(1035, 336, 89, 14, 68, 10, 1, '100.0000', '+', 0, '+'),
(1036, 337, 89, 15, 69, 10, 1, '10.0000', '+', 0, '+'),
(1037, 337, 89, 15, 70, 10, 1, '20.0000', '+', 0, '+'),
(1038, 337, 89, 15, 71, 10, 1, '30.0000', '+', 0, '+'),
(1039, 337, 89, 15, 72, 10, 1, '40.0000', '+', 0, '+'),
(1040, 337, 89, 15, 73, 10, 1, '50.0000', '+', 0, '+'),
(1041, 337, 89, 15, 74, 10, 1, '60.0000', '+', 0, '+'),
(1042, 337, 89, 15, 75, 10, 1, '70.0000', '+', 0, '+'),
(1043, 337, 89, 15, 76, 10, 1, '80.0000', '+', 0, '+'),
(1044, 337, 89, 15, 77, 10, 1, '90.0000', '+', 0, '+'),
(1045, 337, 89, 15, 78, 10, 1, '100.0000', '+', 0, '+'),
(1226, 356, 96, 13, 49, 10, 1, '10.0000', '+', 0, '+'),
(1227, 356, 96, 13, 50, 10, 1, '20.0000', '+', 0, '+'),
(1228, 356, 96, 13, 51, 10, 1, '30.0000', '+', 0, '+'),
(1229, 356, 96, 13, 52, 10, 1, '40.0000', '+', 0, '+'),
(1230, 356, 96, 13, 53, 10, 1, '50.0000', '+', 0, '+'),
(1231, 356, 96, 13, 54, 10, 1, '60.0000', '+', 0, '+'),
(1232, 356, 96, 13, 55, 10, 1, '70.0000', '+', 0, '+'),
(1233, 356, 96, 13, 56, 10, 1, '80.0000', '+', 0, '+'),
(1234, 356, 96, 13, 57, 10, 1, '90.0000', '+', 0, '+'),
(1235, 356, 96, 13, 58, 10, 1, '100.0000', '+', 0, '+'),
(1236, 357, 96, 14, 59, 10, 1, '10.0000', '+', 0, '+'),
(1237, 357, 96, 14, 60, 10, 1, '20.0000', '+', 0, '+'),
(1238, 357, 96, 14, 61, 10, 1, '30.0000', '+', 0, '+'),
(1239, 357, 96, 14, 62, 10, 1, '40.0000', '+', 0, '+'),
(1240, 357, 96, 14, 63, 10, 1, '50.0000', '+', 0, '+'),
(1241, 357, 96, 14, 64, 10, 1, '60.0000', '+', 0, '+'),
(1242, 357, 96, 14, 65, 10, 1, '70.0000', '+', 0, '+'),
(1243, 357, 96, 14, 66, 10, 1, '80.0000', '+', 0, '+'),
(1244, 357, 96, 14, 67, 10, 1, '90.0000', '+', 0, '+'),
(1245, 357, 96, 14, 68, 10, 1, '100.0000', '+', 0, '+'),
(1246, 358, 96, 15, 69, 10, 1, '10.0000', '+', 0, '+'),
(1247, 358, 96, 15, 70, 10, 1, '20.0000', '+', 0, '+'),
(1248, 358, 96, 15, 71, 10, 1, '30.0000', '+', 0, '+'),
(1249, 358, 96, 15, 72, 10, 1, '40.0000', '+', 0, '+'),
(1250, 358, 96, 15, 73, 10, 1, '50.0000', '+', 0, '+'),
(1251, 358, 96, 15, 74, 10, 1, '60.0000', '+', 0, '+'),
(1252, 358, 96, 15, 75, 10, 1, '70.0000', '+', 0, '+'),
(1253, 358, 96, 15, 76, 10, 1, '80.0000', '+', 0, '+'),
(1254, 358, 96, 15, 77, 10, 1, '90.0000', '+', 0, '+'),
(1255, 358, 96, 15, 78, 10, 1, '100.0000', '+', 0, '+'),
(1256, 359, 97, 13, 49, 10, 1, '10.0000', '+', 0, '+'),
(1257, 359, 97, 13, 50, 10, 1, '20.0000', '+', 0, '+'),
(1258, 359, 97, 13, 51, 10, 1, '30.0000', '+', 0, '+'),
(1259, 359, 97, 13, 52, 10, 1, '40.0000', '+', 0, '+'),
(1260, 359, 97, 13, 53, 10, 1, '50.0000', '+', 0, '+'),
(1261, 359, 97, 13, 54, 10, 1, '60.0000', '+', 0, '+'),
(1262, 359, 97, 13, 55, 10, 1, '70.0000', '+', 0, '+'),
(1263, 359, 97, 13, 56, 10, 1, '80.0000', '+', 0, '+'),
(1264, 359, 97, 13, 57, 10, 1, '90.0000', '+', 0, '+'),
(1265, 359, 97, 13, 58, 10, 1, '100.0000', '+', 0, '+'),
(1266, 360, 97, 14, 59, 10, 1, '10.0000', '+', 0, '+'),
(1267, 360, 97, 14, 60, 10, 1, '20.0000', '+', 0, '+'),
(1268, 360, 97, 14, 61, 10, 1, '30.0000', '+', 0, '+'),
(1269, 360, 97, 14, 62, 10, 1, '40.0000', '+', 0, '+'),
(1270, 360, 97, 14, 63, 10, 1, '50.0000', '+', 0, '+'),
(1271, 360, 97, 14, 64, 10, 1, '60.0000', '+', 0, '+'),
(1272, 360, 97, 14, 65, 10, 1, '70.0000', '+', 0, '+'),
(1273, 360, 97, 14, 66, 10, 1, '80.0000', '+', 0, '+'),
(1274, 360, 97, 14, 67, 10, 1, '90.0000', '+', 0, '+'),
(1275, 360, 97, 14, 68, 10, 1, '100.0000', '+', 0, '+'),
(1276, 361, 97, 15, 69, 10, 1, '10.0000', '+', 0, '+'),
(1277, 361, 97, 15, 70, 10, 1, '20.0000', '+', 0, '+'),
(1278, 361, 97, 15, 71, 10, 1, '30.0000', '+', 0, '+'),
(1279, 361, 97, 15, 72, 10, 1, '40.0000', '+', 0, '+'),
(1280, 361, 97, 15, 73, 10, 1, '50.0000', '+', 0, '+'),
(1281, 361, 97, 15, 74, 10, 1, '60.0000', '+', 0, '+'),
(1282, 361, 97, 15, 75, 10, 1, '70.0000', '+', 0, '+'),
(1283, 361, 97, 15, 76, 10, 1, '80.0000', '+', 0, '+'),
(1284, 361, 97, 15, 77, 10, 1, '90.0000', '+', 0, '+'),
(1285, 361, 97, 15, 78, 10, 1, '100.0000', '+', 0, '+'),
(1286, 362, 98, 13, 49, 10, 1, '10.0000', '+', 0, '+'),
(1287, 362, 98, 13, 50, 10, 1, '20.0000', '+', 0, '+'),
(1288, 362, 98, 13, 51, 10, 1, '30.0000', '+', 0, '+'),
(1289, 362, 98, 13, 52, 10, 1, '40.0000', '+', 0, '+'),
(1290, 362, 98, 13, 53, 10, 1, '50.0000', '+', 0, '+'),
(1291, 362, 98, 13, 54, 10, 1, '60.0000', '+', 0, '+'),
(1292, 362, 98, 13, 55, 10, 1, '70.0000', '+', 0, '+'),
(1293, 362, 98, 13, 56, 10, 1, '80.0000', '+', 0, '+'),
(1294, 362, 98, 13, 57, 10, 1, '90.0000', '+', 0, '+'),
(1295, 362, 98, 13, 58, 10, 1, '100.0000', '+', 0, '+'),
(1296, 363, 98, 14, 59, 10, 1, '10.0000', '+', 0, '+'),
(1297, 363, 98, 14, 60, 10, 1, '20.0000', '+', 0, '+'),
(1298, 363, 98, 14, 61, 10, 1, '30.0000', '+', 0, '+'),
(1299, 363, 98, 14, 62, 10, 1, '40.0000', '+', 0, '+'),
(1300, 363, 98, 14, 63, 10, 1, '50.0000', '+', 0, '+'),
(1301, 363, 98, 14, 64, 10, 1, '60.0000', '+', 0, '+'),
(1302, 363, 98, 14, 65, 10, 1, '70.0000', '+', 0, '+'),
(1303, 363, 98, 14, 66, 10, 1, '80.0000', '+', 0, '+'),
(1304, 363, 98, 14, 67, 10, 1, '90.0000', '+', 0, '+'),
(1305, 363, 98, 14, 68, 10, 1, '100.0000', '+', 0, '+'),
(1306, 364, 98, 15, 69, 10, 1, '10.0000', '+', 0, '+'),
(1307, 364, 98, 15, 70, 10, 1, '20.0000', '+', 0, '+'),
(1308, 364, 98, 15, 71, 10, 1, '30.0000', '+', 0, '+'),
(1309, 364, 98, 15, 72, 10, 1, '40.0000', '+', 0, '+'),
(1310, 364, 98, 15, 73, 10, 1, '50.0000', '+', 0, '+'),
(1311, 364, 98, 15, 74, 10, 1, '60.0000', '+', 0, '+'),
(1312, 364, 98, 15, 75, 10, 1, '70.0000', '+', 0, '+'),
(1313, 364, 98, 15, 76, 10, 1, '80.0000', '+', 0, '+'),
(1314, 364, 98, 15, 77, 10, 1, '90.0000', '+', 0, '+'),
(1315, 364, 98, 15, 78, 10, 1, '100.0000', '+', 0, '+'),
(1316, 365, 99, 13, 49, 10, 1, '10.0000', '+', 0, '+'),
(1317, 365, 99, 13, 50, 10, 1, '20.0000', '+', 0, '+'),
(1318, 365, 99, 13, 51, 10, 1, '30.0000', '+', 0, '+'),
(1319, 365, 99, 13, 52, 10, 1, '40.0000', '+', 0, '+'),
(1320, 365, 99, 13, 53, 10, 1, '50.0000', '+', 0, '+'),
(1321, 365, 99, 13, 54, 10, 1, '60.0000', '+', 0, '+'),
(1322, 365, 99, 13, 55, 10, 1, '70.0000', '+', 0, '+'),
(1323, 365, 99, 13, 56, 10, 1, '80.0000', '+', 0, '+'),
(1324, 365, 99, 13, 57, 10, 1, '90.0000', '+', 0, '+'),
(1325, 365, 99, 13, 58, 10, 1, '100.0000', '+', 0, '+'),
(1326, 366, 99, 14, 59, 10, 1, '10.0000', '+', 0, '+'),
(1327, 366, 99, 14, 60, 10, 1, '20.0000', '+', 0, '+'),
(1328, 366, 99, 14, 61, 10, 1, '30.0000', '+', 0, '+'),
(1329, 366, 99, 14, 62, 10, 1, '40.0000', '+', 0, '+'),
(1330, 366, 99, 14, 63, 10, 1, '50.0000', '+', 0, '+'),
(1331, 366, 99, 14, 64, 10, 1, '60.0000', '+', 0, '+'),
(1332, 366, 99, 14, 65, 10, 1, '70.0000', '+', 0, '+'),
(1333, 366, 99, 14, 66, 10, 1, '80.0000', '+', 0, '+'),
(1334, 366, 99, 14, 67, 10, 1, '90.0000', '+', 0, '+'),
(1335, 366, 99, 14, 68, 10, 1, '100.0000', '+', 0, '+'),
(1336, 367, 99, 15, 69, 10, 1, '10.0000', '+', 0, '+'),
(1337, 367, 99, 15, 70, 10, 1, '20.0000', '+', 0, '+'),
(1338, 367, 99, 15, 71, 10, 1, '30.0000', '+', 0, '+'),
(1339, 367, 99, 15, 72, 10, 1, '40.0000', '+', 0, '+'),
(1340, 367, 99, 15, 73, 10, 1, '50.0000', '+', 0, '+'),
(1341, 367, 99, 15, 74, 10, 1, '60.0000', '+', 0, '+'),
(1342, 367, 99, 15, 75, 10, 1, '70.0000', '+', 0, '+'),
(1343, 367, 99, 15, 76, 10, 1, '80.0000', '+', 0, '+'),
(1344, 367, 99, 15, 77, 10, 1, '90.0000', '+', 0, '+'),
(1345, 367, 99, 15, 78, 10, 1, '100.0000', '+', 0, '+'),
(1346, 368, 100, 13, 49, 10, 1, '10.0000', '+', 0, '+'),
(1347, 368, 100, 13, 50, 10, 1, '20.0000', '+', 0, '+'),
(1348, 368, 100, 13, 51, 10, 1, '30.0000', '+', 0, '+'),
(1349, 368, 100, 13, 52, 10, 1, '40.0000', '+', 0, '+'),
(1350, 368, 100, 13, 53, 10, 1, '50.0000', '+', 0, '+'),
(1351, 368, 100, 13, 54, 10, 1, '60.0000', '+', 0, '+'),
(1352, 368, 100, 13, 55, 10, 1, '70.0000', '+', 0, '+'),
(1353, 368, 100, 13, 56, 10, 1, '80.0000', '+', 0, '+'),
(1354, 368, 100, 13, 57, 10, 1, '90.0000', '+', 0, '+'),
(1355, 368, 100, 13, 58, 10, 1, '100.0000', '+', 0, '+'),
(1356, 369, 100, 14, 59, 10, 1, '10.0000', '+', 0, '+'),
(1357, 369, 100, 14, 60, 10, 1, '20.0000', '+', 0, '+'),
(1358, 369, 100, 14, 61, 10, 1, '30.0000', '+', 0, '+'),
(1359, 369, 100, 14, 62, 10, 1, '40.0000', '+', 0, '+'),
(1360, 369, 100, 14, 63, 10, 1, '50.0000', '+', 0, '+'),
(1361, 369, 100, 14, 64, 10, 1, '60.0000', '+', 0, '+'),
(1362, 369, 100, 14, 65, 10, 1, '70.0000', '+', 0, '+'),
(1363, 369, 100, 14, 66, 10, 1, '80.0000', '+', 0, '+'),
(1364, 369, 100, 14, 67, 10, 1, '90.0000', '+', 0, '+'),
(1365, 369, 100, 14, 68, 10, 1, '100.0000', '+', 0, '+'),
(1366, 370, 100, 15, 69, 10, 1, '10.0000', '+', 0, '+'),
(1367, 370, 100, 15, 70, 10, 1, '20.0000', '+', 0, '+'),
(1368, 370, 100, 15, 71, 10, 1, '30.0000', '+', 0, '+'),
(1369, 370, 100, 15, 72, 10, 1, '40.0000', '+', 0, '+'),
(1370, 370, 100, 15, 73, 10, 1, '50.0000', '+', 0, '+'),
(1371, 370, 100, 15, 74, 10, 1, '60.0000', '+', 0, '+'),
(1372, 370, 100, 15, 75, 10, 1, '70.0000', '+', 0, '+'),
(1373, 370, 100, 15, 76, 10, 1, '80.0000', '+', 0, '+'),
(1374, 370, 100, 15, 77, 10, 1, '90.0000', '+', 0, '+'),
(1375, 370, 100, 15, 78, 10, 1, '100.0000', '+', 0, '+'),
(1376, 371, 101, 13, 49, 10, 1, '10.0000', '+', 0, '+'),
(1377, 371, 101, 13, 50, 10, 1, '20.0000', '+', 0, '+'),
(1378, 371, 101, 13, 51, 10, 1, '30.0000', '+', 0, '+'),
(1379, 371, 101, 13, 52, 10, 1, '40.0000', '+', 0, '+'),
(1380, 371, 101, 13, 53, 10, 1, '50.0000', '+', 0, '+'),
(1381, 371, 101, 13, 54, 10, 1, '60.0000', '+', 0, '+'),
(1382, 371, 101, 13, 55, 10, 1, '70.0000', '+', 0, '+'),
(1383, 371, 101, 13, 56, 10, 1, '80.0000', '+', 0, '+'),
(1384, 371, 101, 13, 57, 10, 1, '90.0000', '+', 0, '+'),
(1385, 371, 101, 13, 58, 10, 1, '100.0000', '+', 0, '+'),
(1386, 372, 101, 14, 59, 10, 1, '10.0000', '+', 0, '+'),
(1387, 372, 101, 14, 60, 10, 1, '20.0000', '+', 0, '+'),
(1388, 372, 101, 14, 61, 10, 1, '30.0000', '+', 0, '+'),
(1389, 372, 101, 14, 62, 10, 1, '40.0000', '+', 0, '+'),
(1390, 372, 101, 14, 63, 10, 1, '50.0000', '+', 0, '+'),
(1391, 372, 101, 14, 64, 10, 1, '60.0000', '+', 0, '+'),
(1392, 372, 101, 14, 65, 10, 1, '70.0000', '+', 0, '+'),
(1393, 372, 101, 14, 66, 10, 1, '80.0000', '+', 0, '+'),
(1394, 372, 101, 14, 67, 10, 1, '90.0000', '+', 0, '+'),
(1395, 372, 101, 14, 68, 10, 1, '100.0000', '+', 0, '+'),
(1396, 373, 101, 15, 69, 10, 1, '10.0000', '+', 0, '+'),
(1397, 373, 101, 15, 70, 10, 1, '20.0000', '+', 0, '+'),
(1398, 373, 101, 15, 71, 10, 1, '30.0000', '+', 0, '+'),
(1399, 373, 101, 15, 72, 10, 1, '40.0000', '+', 0, '+'),
(1400, 373, 101, 15, 73, 10, 1, '50.0000', '+', 0, '+'),
(1401, 373, 101, 15, 74, 10, 1, '60.0000', '+', 0, '+'),
(1402, 373, 101, 15, 75, 10, 1, '70.0000', '+', 0, '+'),
(1403, 373, 101, 15, 76, 10, 1, '80.0000', '+', 0, '+'),
(1404, 373, 101, 15, 77, 10, 1, '90.0000', '+', 0, '+'),
(1405, 373, 101, 15, 78, 10, 1, '100.0000', '+', 0, '+'),
(1406, 374, 102, 13, 49, 10, 1, '10.0000', '+', 0, '+'),
(1407, 374, 102, 13, 50, 10, 1, '20.0000', '+', 0, '+'),
(1408, 374, 102, 13, 51, 10, 1, '30.0000', '+', 0, '+'),
(1409, 374, 102, 13, 52, 10, 1, '40.0000', '+', 0, '+'),
(1410, 374, 102, 13, 53, 10, 1, '50.0000', '+', 0, '+'),
(1411, 374, 102, 13, 54, 10, 1, '60.0000', '+', 0, '+'),
(1412, 374, 102, 13, 55, 10, 1, '70.0000', '+', 0, '+'),
(1413, 374, 102, 13, 56, 10, 1, '80.0000', '+', 0, '+'),
(1414, 374, 102, 13, 57, 10, 1, '90.0000', '+', 0, '+'),
(1415, 374, 102, 13, 58, 10, 1, '100.0000', '+', 0, '+'),
(1416, 375, 102, 14, 59, 10, 1, '10.0000', '+', 0, '+'),
(1417, 375, 102, 14, 60, 10, 1, '20.0000', '+', 0, '+'),
(1418, 375, 102, 14, 61, 10, 1, '30.0000', '+', 0, '+'),
(1419, 375, 102, 14, 62, 10, 1, '40.0000', '+', 0, '+'),
(1420, 375, 102, 14, 63, 10, 1, '50.0000', '+', 0, '+'),
(1421, 375, 102, 14, 64, 10, 1, '60.0000', '+', 0, '+'),
(1422, 375, 102, 14, 65, 10, 1, '70.0000', '+', 0, '+'),
(1423, 375, 102, 14, 66, 10, 1, '80.0000', '+', 0, '+'),
(1424, 375, 102, 14, 67, 10, 1, '90.0000', '+', 0, '+'),
(1425, 375, 102, 14, 68, 10, 1, '100.0000', '+', 0, '+'),
(1426, 376, 102, 15, 69, 10, 1, '10.0000', '+', 0, '+'),
(1427, 376, 102, 15, 70, 10, 1, '20.0000', '+', 0, '+'),
(1428, 376, 102, 15, 71, 10, 1, '30.0000', '+', 0, '+'),
(1429, 376, 102, 15, 72, 10, 1, '40.0000', '+', 0, '+'),
(1430, 376, 102, 15, 73, 10, 1, '50.0000', '+', 0, '+'),
(1431, 376, 102, 15, 74, 10, 1, '60.0000', '+', 0, '+'),
(1432, 376, 102, 15, 75, 10, 1, '70.0000', '+', 0, '+'),
(1433, 376, 102, 15, 76, 10, 1, '80.0000', '+', 0, '+'),
(1434, 376, 102, 15, 77, 10, 1, '90.0000', '+', 0, '+'),
(1435, 376, 102, 15, 78, 10, 1, '100.0000', '+', 0, '+'),
(1436, 377, 103, 13, 49, 10, 1, '10.0000', '+', 0, '+'),
(1437, 377, 103, 13, 50, 10, 1, '20.0000', '+', 0, '+'),
(1438, 377, 103, 13, 51, 10, 1, '30.0000', '+', 0, '+'),
(1439, 377, 103, 13, 52, 10, 1, '40.0000', '+', 0, '+'),
(1440, 377, 103, 13, 53, 10, 1, '50.0000', '+', 0, '+'),
(1441, 377, 103, 13, 54, 10, 1, '60.0000', '+', 0, '+'),
(1442, 377, 103, 13, 55, 10, 1, '70.0000', '+', 0, '+'),
(1443, 377, 103, 13, 56, 10, 1, '80.0000', '+', 0, '+'),
(1444, 377, 103, 13, 57, 10, 1, '90.0000', '+', 0, '+'),
(1445, 377, 103, 13, 58, 10, 1, '100.0000', '+', 0, '+'),
(1446, 378, 103, 14, 59, 10, 1, '10.0000', '+', 0, '+'),
(1447, 378, 103, 14, 60, 10, 1, '20.0000', '+', 0, '+'),
(1448, 378, 103, 14, 61, 10, 1, '30.0000', '+', 0, '+'),
(1449, 378, 103, 14, 62, 10, 1, '40.0000', '+', 0, '+'),
(1450, 378, 103, 14, 63, 10, 1, '50.0000', '+', 0, '+'),
(1451, 378, 103, 14, 64, 10, 1, '60.0000', '+', 0, '+'),
(1452, 378, 103, 14, 65, 10, 1, '70.0000', '+', 0, '+'),
(1453, 378, 103, 14, 66, 10, 1, '80.0000', '+', 0, '+'),
(1454, 378, 103, 14, 67, 10, 1, '90.0000', '+', 0, '+'),
(1455, 378, 103, 14, 68, 10, 1, '100.0000', '+', 0, '+'),
(1456, 379, 103, 15, 69, 10, 1, '10.0000', '+', 0, '+'),
(1457, 379, 103, 15, 70, 10, 1, '20.0000', '+', 0, '+'),
(1458, 379, 103, 15, 71, 10, 1, '30.0000', '+', 0, '+'),
(1459, 379, 103, 15, 72, 10, 1, '40.0000', '+', 0, '+'),
(1460, 379, 103, 15, 73, 10, 1, '50.0000', '+', 0, '+'),
(1461, 379, 103, 15, 74, 10, 1, '60.0000', '+', 0, '+'),
(1462, 379, 103, 15, 75, 10, 1, '70.0000', '+', 0, '+'),
(1463, 379, 103, 15, 76, 10, 1, '80.0000', '+', 0, '+'),
(1464, 379, 103, 15, 77, 10, 1, '90.0000', '+', 0, '+'),
(1465, 379, 103, 15, 78, 10, 1, '100.0000', '+', 0, '+'),
(1466, 380, 104, 13, 49, 10, 1, '10.0000', '+', 0, '+'),
(1467, 380, 104, 13, 50, 10, 1, '20.0000', '+', 0, '+'),
(1468, 380, 104, 13, 51, 10, 1, '30.0000', '+', 0, '+'),
(1469, 380, 104, 13, 52, 10, 1, '40.0000', '+', 0, '+'),
(1470, 380, 104, 13, 53, 10, 1, '50.0000', '+', 0, '+'),
(1471, 380, 104, 13, 54, 10, 1, '60.0000', '+', 0, '+'),
(1472, 380, 104, 13, 55, 10, 1, '70.0000', '+', 0, '+'),
(1473, 380, 104, 13, 56, 10, 1, '80.0000', '+', 0, '+'),
(1474, 380, 104, 13, 57, 10, 1, '90.0000', '+', 0, '+'),
(1475, 380, 104, 13, 58, 10, 1, '100.0000', '+', 0, '+'),
(1476, 381, 104, 14, 59, 10, 1, '10.0000', '+', 0, '+'),
(1477, 381, 104, 14, 60, 10, 1, '20.0000', '+', 0, '+'),
(1478, 381, 104, 14, 61, 10, 1, '30.0000', '+', 0, '+'),
(1479, 381, 104, 14, 62, 10, 1, '40.0000', '+', 0, '+'),
(1480, 381, 104, 14, 63, 10, 1, '50.0000', '+', 0, '+'),
(1481, 381, 104, 14, 64, 10, 1, '60.0000', '+', 0, '+'),
(1482, 381, 104, 14, 65, 10, 1, '70.0000', '+', 0, '+'),
(1483, 381, 104, 14, 66, 10, 1, '80.0000', '+', 0, '+'),
(1484, 381, 104, 14, 67, 10, 1, '90.0000', '+', 0, '+'),
(1485, 381, 104, 14, 68, 10, 1, '100.0000', '+', 0, '+'),
(1486, 382, 104, 15, 69, 10, 1, '10.0000', '+', 0, '+'),
(1487, 382, 104, 15, 70, 10, 1, '20.0000', '+', 0, '+'),
(1488, 382, 104, 15, 71, 10, 1, '30.0000', '+', 0, '+'),
(1489, 382, 104, 15, 72, 10, 1, '40.0000', '+', 0, '+'),
(1490, 382, 104, 15, 73, 10, 1, '50.0000', '+', 0, '+'),
(1491, 382, 104, 15, 74, 10, 1, '60.0000', '+', 0, '+'),
(1492, 382, 104, 15, 75, 10, 1, '70.0000', '+', 0, '+'),
(1493, 382, 104, 15, 76, 10, 1, '80.0000', '+', 0, '+'),
(1494, 382, 104, 15, 77, 10, 1, '90.0000', '+', 0, '+'),
(1495, 382, 104, 15, 78, 10, 1, '100.0000', '+', 0, '+');

-- --------------------------------------------------------

--
-- Table structure for table `product_related`
--

CREATE TABLE `product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_related`
--

INSERT INTO `product_related` (`product_id`, `related_id`) VALUES
(42, 64),
(42, 96),
(42, 97),
(42, 98),
(42, 99),
(42, 100),
(42, 101),
(42, 102),
(42, 103),
(42, 104),
(64, 42),
(64, 80),
(64, 82),
(64, 83),
(64, 86),
(64, 87),
(64, 88),
(64, 89),
(80, 64),
(80, 96),
(80, 97),
(80, 98),
(80, 99),
(80, 100),
(80, 101),
(80, 102),
(80, 103),
(80, 104),
(82, 64),
(82, 96),
(82, 97),
(82, 98),
(82, 99),
(82, 100),
(82, 101),
(82, 102),
(82, 103),
(82, 104),
(83, 64),
(83, 96),
(83, 97),
(83, 98),
(83, 99),
(83, 100),
(83, 101),
(83, 102),
(83, 103),
(83, 104),
(86, 64),
(86, 96),
(86, 97),
(86, 98),
(86, 99),
(86, 100),
(86, 101),
(86, 102),
(86, 103),
(86, 104),
(87, 64),
(87, 96),
(87, 97),
(87, 98),
(87, 99),
(87, 100),
(87, 101),
(87, 102),
(87, 103),
(87, 104),
(88, 64),
(88, 96),
(88, 97),
(88, 98),
(88, 99),
(88, 100),
(88, 101),
(88, 102),
(88, 103),
(88, 104),
(89, 64),
(89, 96),
(89, 97),
(89, 98),
(89, 99),
(89, 100),
(89, 101),
(89, 102),
(89, 103),
(89, 104),
(96, 42),
(96, 80),
(96, 82),
(96, 83),
(96, 86),
(96, 87),
(96, 88),
(96, 89),
(97, 42),
(97, 80),
(97, 82),
(97, 83),
(97, 86),
(97, 87),
(97, 88),
(97, 89),
(98, 42),
(98, 80),
(98, 82),
(98, 83),
(98, 86),
(98, 87),
(98, 88),
(98, 89),
(99, 42),
(99, 80),
(99, 82),
(99, 83),
(99, 86),
(99, 87),
(99, 88),
(99, 89),
(100, 42),
(100, 80),
(100, 82),
(100, 83),
(100, 86),
(100, 87),
(100, 88),
(100, 89),
(101, 42),
(101, 80),
(101, 82),
(101, 83),
(101, 86),
(101, 87),
(101, 88),
(101, 89),
(102, 42),
(102, 80),
(102, 82),
(102, 83),
(102, 86),
(102, 87),
(102, 88),
(102, 89),
(103, 42),
(103, 80),
(103, 82),
(103, 83),
(103, 86),
(103, 87),
(103, 88),
(103, 89),
(104, 42),
(104, 80),
(104, 82),
(104, 83),
(104, 86),
(104, 87),
(104, 88),
(104, 89);

-- --------------------------------------------------------

--
-- Table structure for table `product_related_article`
--

CREATE TABLE `product_related_article` (
  `article_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_related_article`
--

INSERT INTO `product_related_article` (`article_id`, `product_id`) VALUES
(120, 64),
(120, 96),
(120, 97),
(120, 98),
(120, 99),
(120, 100),
(120, 101),
(120, 102),
(120, 103),
(120, 104),
(123, 64),
(123, 96),
(123, 97),
(123, 98),
(123, 99),
(123, 100),
(123, 101),
(123, 102),
(123, 103),
(123, 104),
(124, 64),
(124, 96),
(124, 97),
(124, 98),
(124, 99),
(124, 100),
(124, 101),
(124, 102),
(124, 103),
(124, 104),
(125, 64),
(125, 96),
(125, 97),
(125, 98),
(125, 99),
(125, 100),
(125, 101),
(125, 102),
(125, 103),
(125, 104);

-- --------------------------------------------------------

--
-- Table structure for table `product_related_mn`
--

CREATE TABLE `product_related_mn` (
  `product_id` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_related_wb`
--

CREATE TABLE `product_related_wb` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_reward`
--

CREATE TABLE `product_reward` (
  `product_reward_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_reward`
--

INSERT INTO `product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(573, 64, 2, 420),
(590, 80, 2, 420),
(591, 82, 2, 420),
(592, 83, 2, 420),
(593, 86, 2, 420),
(595, 88, 2, 420),
(596, 89, 2, 420),
(597, 87, 2, 420),
(609, 96, 2, 420),
(610, 97, 2, 420),
(611, 98, 2, 420),
(612, 99, 2, 420),
(613, 100, 2, 420),
(614, 101, 2, 420),
(615, 102, 2, 420),
(616, 103, 2, 420),
(617, 104, 2, 420),
(618, 42, 2, 420);

-- --------------------------------------------------------

--
-- Table structure for table `product_special`
--

CREATE TABLE `product_special` (
  `product_special_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_special`
--

INSERT INTO `product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(516, 64, 2, 1, '56789.0000', '0000-00-00', '0000-00-00'),
(533, 80, 2, 1, '56234.0000', '0000-00-00', '0000-00-00'),
(534, 82, 2, 1, '56765.0000', '0000-00-00', '0000-00-00'),
(535, 83, 2, 1, '12735.0000', '0000-00-00', '0000-00-00'),
(536, 86, 2, 1, '45589.0000', '0000-00-00', '0000-00-00'),
(538, 88, 2, 1, '41289.0000', '0000-00-00', '0000-00-00'),
(539, 89, 2, 1, '11189.0000', '0000-00-00', '0000-00-00'),
(540, 87, 2, 1, '37989.0000', '0000-00-00', '0000-00-00'),
(552, 96, 2, 1, '12345.0000', '0000-00-00', '0000-00-00'),
(553, 97, 2, 1, '12456.0000', '0000-00-00', '0000-00-00'),
(554, 98, 2, 1, '12567.0000', '0000-00-00', '0000-00-00'),
(555, 99, 2, 1, '12678.0000', '0000-00-00', '0000-00-00'),
(556, 100, 2, 1, '12789.0000', '0000-00-00', '0000-00-00'),
(557, 101, 2, 1, '12890.0000', '0000-00-00', '0000-00-00'),
(558, 102, 2, 1, '15678.0000', '0000-00-00', '0000-00-00'),
(559, 103, 2, 1, '14567.0000', '0000-00-00', '0000-00-00'),
(560, 104, 2, 1, '15678.0000', '0000-00-00', '0000-00-00'),
(561, 42, 2, 1, '56789.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `product_tab`
--

CREATE TABLE `product_tab` (
  `product_tab_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sort_order` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_tab`
--

INSERT INTO `product_tab` (`product_tab_id`, `product_id`, `sort_order`, `status`) VALUES
(60, 64, 0, 1),
(61, 64, 0, 1),
(62, 42, 3, 1),
(63, 42, 2, 1),
(64, 42, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_tab_desc`
--

CREATE TABLE `product_tab_desc` (
  `product_tab_id` int(11) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_tab_desc`
--

INSERT INTO `product_tab_desc` (`product_tab_id`, `heading`, `description`, `product_id`, `language_id`) VALUES
(60, '2', '&lt;p&gt;2&lt;br&gt;&lt;/p&gt;', 64, 2),
(61, '1', '&lt;p&gt;1&lt;br&gt;&lt;/p&gt;', 64, 2),
(62, 'Extra tab 3', '&lt;p&gt;lorem 3&lt;br&gt;&lt;/p&gt;', 42, 2),
(63, 'Extra tab 2', '&lt;p&gt;lorem 2&lt;br&gt;&lt;/p&gt;', 42, 2),
(64, 'Extra tab 1', '&lt;p&gt;lorem&lt;br&gt;&lt;/p&gt;', 42, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_to_benefit`
--

CREATE TABLE `product_to_benefit` (
  `product_id` int(11) NOT NULL,
  `benefit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_to_benefit`
--

INSERT INTO `product_to_benefit` (`product_id`, `benefit_id`) VALUES
(64, 41),
(64, 38),
(64, 43),
(64, 25),
(64, 39),
(64, 42),
(80, 41),
(80, 38),
(80, 43),
(80, 25),
(80, 39),
(80, 42),
(82, 41),
(82, 38),
(82, 43),
(82, 25),
(82, 39),
(82, 42),
(83, 41),
(83, 38),
(83, 43),
(83, 25),
(83, 39),
(83, 42),
(86, 41),
(86, 38),
(86, 43),
(86, 25),
(86, 39),
(86, 42),
(88, 41),
(88, 38),
(88, 43),
(88, 25),
(88, 39),
(88, 42),
(89, 41),
(89, 38),
(89, 43),
(89, 25),
(89, 39),
(89, 42),
(87, 41),
(87, 38),
(87, 43),
(87, 25),
(87, 39),
(87, 42),
(96, 41),
(96, 38),
(96, 43),
(96, 25),
(96, 39),
(96, 42),
(97, 41),
(97, 38),
(97, 43),
(97, 25),
(97, 39),
(97, 42),
(98, 41),
(98, 38),
(98, 43),
(98, 25),
(98, 39),
(98, 42),
(99, 41),
(99, 38),
(99, 43),
(99, 25),
(99, 39),
(99, 42),
(100, 41),
(100, 38),
(100, 43),
(100, 25),
(100, 39),
(100, 42),
(101, 41),
(101, 38),
(101, 43),
(101, 25),
(101, 39),
(101, 42),
(102, 41),
(102, 38),
(102, 43),
(102, 25),
(102, 39),
(102, 42),
(103, 41),
(103, 38),
(103, 43),
(103, 25),
(103, 39),
(103, 42),
(104, 41),
(104, 38),
(104, 43),
(104, 25),
(104, 39),
(104, 42),
(42, 41),
(42, 38),
(42, 43),
(42, 25),
(42, 39),
(42, 42);

-- --------------------------------------------------------

--
-- Table structure for table `product_to_category`
--

CREATE TABLE `product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `main_category` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_to_category`
--

INSERT INTO `product_to_category` (`product_id`, `category_id`, `main_category`) VALUES
(42, 17, 0),
(42, 18, 0),
(42, 20, 1),
(42, 24, 0),
(42, 25, 0),
(42, 28, 0),
(42, 29, 0),
(42, 33, 0),
(42, 34, 0),
(42, 57, 0),
(64, 17, 0),
(64, 18, 0),
(64, 20, 1),
(64, 24, 0),
(64, 25, 0),
(64, 28, 0),
(64, 29, 0),
(64, 33, 0),
(64, 34, 0),
(64, 57, 0),
(80, 17, 1),
(80, 18, 0),
(80, 20, 0),
(80, 24, 0),
(80, 25, 0),
(80, 28, 0),
(80, 29, 0),
(80, 33, 0),
(80, 34, 0),
(80, 57, 0),
(82, 17, 1),
(82, 18, 0),
(82, 20, 0),
(82, 24, 0),
(82, 25, 0),
(82, 28, 0),
(82, 29, 0),
(82, 33, 0),
(82, 34, 0),
(82, 57, 0),
(83, 17, 1),
(83, 18, 0),
(83, 20, 0),
(83, 24, 0),
(83, 25, 0),
(83, 28, 0),
(83, 29, 0),
(83, 33, 0),
(83, 34, 0),
(83, 57, 0),
(86, 17, 1),
(86, 18, 0),
(86, 20, 0),
(86, 24, 0),
(86, 25, 0),
(86, 28, 0),
(86, 29, 0),
(86, 33, 0),
(86, 34, 0),
(86, 57, 0),
(87, 17, 1),
(87, 18, 0),
(87, 20, 0),
(87, 24, 0),
(87, 25, 0),
(87, 28, 0),
(87, 29, 0),
(87, 33, 0),
(87, 34, 0),
(87, 57, 0),
(88, 17, 1),
(88, 18, 0),
(88, 20, 0),
(88, 24, 0),
(88, 25, 0),
(88, 28, 0),
(88, 29, 0),
(88, 33, 0),
(88, 34, 0),
(88, 57, 0),
(89, 17, 1),
(89, 18, 0),
(89, 20, 0),
(89, 24, 0),
(89, 25, 0),
(89, 28, 0),
(89, 29, 0),
(89, 33, 0),
(89, 34, 0),
(89, 57, 0),
(96, 17, 1),
(96, 18, 0),
(96, 20, 0),
(96, 24, 0),
(96, 25, 0),
(96, 28, 0),
(96, 29, 0),
(96, 33, 0),
(96, 34, 0),
(96, 57, 0),
(97, 17, 1),
(97, 18, 0),
(97, 20, 0),
(97, 24, 0),
(97, 25, 0),
(97, 28, 0),
(97, 29, 0),
(97, 33, 0),
(97, 34, 0),
(97, 57, 0),
(98, 17, 1),
(98, 18, 0),
(98, 20, 0),
(98, 24, 0),
(98, 25, 0),
(98, 28, 0),
(98, 29, 0),
(98, 33, 0),
(98, 34, 0),
(98, 57, 0),
(99, 17, 1),
(99, 18, 0),
(99, 20, 0),
(99, 24, 0),
(99, 25, 0),
(99, 28, 0),
(99, 29, 0),
(99, 33, 0),
(99, 34, 0),
(99, 57, 0),
(100, 17, 1),
(100, 18, 0),
(100, 20, 0),
(100, 24, 0),
(100, 25, 0),
(100, 28, 0),
(100, 29, 0),
(100, 33, 0),
(100, 34, 0),
(100, 57, 0),
(101, 17, 1),
(101, 18, 0),
(101, 20, 0),
(101, 24, 0),
(101, 25, 0),
(101, 28, 0),
(101, 29, 0),
(101, 33, 0),
(101, 34, 0),
(101, 57, 0),
(102, 17, 1),
(102, 18, 0),
(102, 20, 0),
(102, 24, 0),
(102, 25, 0),
(102, 28, 0),
(102, 29, 0),
(102, 33, 0),
(102, 34, 0),
(102, 57, 0),
(103, 17, 1),
(103, 18, 0),
(103, 20, 0),
(103, 24, 0),
(103, 25, 0),
(103, 28, 0),
(103, 29, 0),
(103, 33, 0),
(103, 34, 0),
(103, 57, 0),
(104, 17, 1),
(104, 18, 0),
(104, 20, 0),
(104, 24, 0),
(104, 25, 0),
(104, 28, 0),
(104, 29, 0),
(104, 33, 0),
(104, 34, 0),
(104, 57, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_to_download`
--

CREATE TABLE `product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_to_layout`
--

CREATE TABLE `product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_to_layout`
--

INSERT INTO `product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(42, 0, 0),
(64, 0, 0),
(80, 0, 0),
(82, 0, 0),
(83, 0, 0),
(86, 0, 0),
(87, 0, 0),
(88, 0, 0),
(89, 0, 0),
(96, 0, 0),
(97, 0, 0),
(98, 0, 0),
(99, 0, 0),
(100, 0, 0),
(101, 0, 0),
(102, 0, 0),
(103, 0, 0),
(104, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_to_sticker`
--

CREATE TABLE `product_to_sticker` (
  `product_id` int(11) NOT NULL,
  `sticker_id` int(11) NOT NULL,
  `position` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_to_sticker`
--

INSERT INTO `product_to_sticker` (`product_id`, `sticker_id`, `position`) VALUES
(42, 13, 0),
(42, 14, 1),
(42, 15, 2),
(42, 16, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_to_store`
--

CREATE TABLE `product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_to_store`
--

INSERT INTO `product_to_store` (`product_id`, `store_id`) VALUES
(42, 0),
(64, 0),
(80, 0),
(82, 0),
(83, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 0),
(100, 0),
(101, 0),
(102, 0),
(103, 0),
(104, 0);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `review_article`
--

CREATE TABLE `review_article` (
  `review_article_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review_article`
--

INSERT INTO `review_article` (`review_article_id`, `article_id`, `customer_id`, `author`, `text`, `rating`, `status`, `date_added`, `date_modified`) VALUES
(11, 123, 0, 'Sapiente Nihil', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias rem harum corporis architecto, ex corrupti beatae doloremque neque porro illo ea molestiae accusantium dignissimos earum in. Nemo blanditiis error similique?\r\nConsequatur enim perspiciatis vero doloremque nesciunt! Porro nulla deleniti inventore vel eum minima quos fugit accusamus. Obcaecati ipsam sunt consectetur dignissimos unde facere aut exercitationem hic maiores. Necessitatibus, doloremque temporibus!', 5, 1, '2018-11-01 05:59:25', '2018-11-16 13:25:54');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `setting_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(95, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(96, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(97, 0, 'shipping', 'shipping_sort_order', '3', 0),
(98, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(99, 0, 'sub_total', 'sub_total_status', '1', 0),
(100, 0, 'tax', 'tax_status', '1', 0),
(101, 0, 'total', 'total_sort_order', '9', 0),
(102, 0, 'total', 'total_status', '1', 0),
(103, 0, 'tax', 'tax_sort_order', '5', 0),
(104, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(105, 0, 'cod', 'cod_sort_order', '5', 0),
(106, 0, 'cod', 'cod_total', '0.01', 0),
(107, 0, 'cod', 'cod_order_status_id', '1', 0),
(108, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(109, 0, 'cod', 'cod_status', '1', 0),
(110, 0, 'shipping', 'shipping_status', '1', 0),
(111, 0, 'shipping', 'shipping_estimator', '1', 0),
(114, 0, 'flat', 'flat_sort_order', '1', 0),
(115, 0, 'flat', 'flat_status', '1', 0),
(116, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(117, 0, 'flat', 'flat_tax_class_id', '9', 0),
(118, 0, 'flat', 'flat_cost', '5.00', 0),
(119, 0, 'credit', 'credit_sort_order', '7', 0),
(120, 0, 'credit', 'credit_status', '1', 0),
(1527, 0, 'basic_captcha', 'basic_captcha_status', '1', 0),
(2054, 0, 'reward', 'reward_status', '1', 0),
(2055, 0, 'reward', 'reward_sort_order', '2', 0),
(2568, 0, 'configcustommenu', 'configcustommenu_custommenu', '1', 0),
(2741, 0, 'theme_default', 'theme_default_directory', 'default', 0),
(2742, 0, 'theme_default', 'theme_default_status', '1', 0),
(2743, 0, 'theme_default', 'theme_default_product_limit', '16', 0),
(2744, 0, 'theme_default', 'theme_default_product_description_length', '100', 0),
(2745, 0, 'theme_default', 'theme_default_image_subcategory_width', '609', 0),
(2746, 0, 'theme_default', 'theme_default_image_subcategory_height', '609', 0),
(2747, 0, 'theme_default', 'theme_default_image_category_width', '220', 0),
(2748, 0, 'theme_default', 'theme_default_image_category_height', '220', 0),
(2749, 0, 'theme_default', 'theme_default_image_thumb_width', '780', 0),
(2750, 0, 'theme_default', 'theme_default_image_thumb_height', '520', 0),
(2751, 0, 'theme_default', 'theme_default_image_popup_width', '1560', 0),
(2752, 0, 'theme_default', 'theme_default_image_popup_height', '1053', 0),
(2753, 0, 'theme_default', 'theme_default_image_product_width', '609', 0),
(2754, 0, 'theme_default', 'theme_default_image_product_height', '609', 0),
(2755, 0, 'theme_default', 'theme_default_image_additional_width', '780', 0),
(2756, 0, 'theme_default', 'theme_default_image_additional_height', '520', 0),
(2757, 0, 'theme_default', 'theme_default_image_related_width', '609', 0),
(2758, 0, 'theme_default', 'theme_default_image_related_height', '609', 0),
(2759, 0, 'theme_default', 'theme_default_image_cart_width', '190', 0),
(2760, 0, 'theme_default', 'theme_default_image_cart_height', '190', 0),
(2761, 0, 'theme_default', 'theme_default_image_location_width', '124', 0),
(2762, 0, 'theme_default', 'theme_default_image_location_height', '30', 0),
(2862, 0, 'configblog', 'configblog_name', 'Eos est sequi temporibus', 0),
(2863, 0, 'configblog', 'configblog_html_h1', 'Eos est sequi temporibus', 0),
(2864, 0, 'configblog', 'configblog_meta_title', 'Eos est sequi temporibus', 0),
(2865, 0, 'configblog', 'configblog_meta_description', 'Eos est sequi temporibus', 0),
(2867, 0, 'configblog', 'configblog_article_count', '1', 0),
(2868, 0, 'configblog', 'configblog_article_limit', '20', 0),
(2869, 0, 'configblog', 'configblog_article_description_length', '200', 0),
(2870, 0, 'configblog', 'configblog_limit_admin', '20', 0),
(2871, 0, 'configblog', 'configblog_blog_menu', '1', 0),
(2872, 0, 'configblog', 'configblog_article_download', '1', 0),
(2873, 0, 'configblog', 'configblog_review_status', '1', 0),
(2874, 0, 'configblog', 'configblog_review_guest', '1', 0),
(2875, 0, 'configblog', 'configblog_review_mail', '1', 0),
(2876, 0, 'configblog', 'configblog_image_category_width', '220', 0),
(2877, 0, 'configblog', 'configblog_image_category_height', '220', 0),
(2878, 0, 'configblog', 'configblog_image_article_width', '609', 0),
(2879, 0, 'configblog', 'configblog_image_article_height', '609', 0),
(2880, 0, 'configblog', 'configblog_image_related_width', '609', 0),
(2881, 0, 'configblog', 'configblog_image_related_height', '609', 0),
(2961, 0, 'config', 'config_meta_title', 'Sunrise CMS Demo', 0),
(2962, 0, 'config', 'config_meta_description', 'Sunrise CMS Demo', 0),
(2963, 0, 'config', 'config_theme', 'theme_default', 0),
(2964, 0, 'config', 'config_layout_id', '4', 0),
(2965, 0, 'config', 'config_name', 'Sunrise CMS Demo', 0),
(2966, 0, 'config', 'config_owner', 'Sunrise CMS', 0),
(2967, 0, 'config', 'config_address', 'sunrise-cms.com.ua', 0),
(2968, 0, 'config', 'config_geocode', '', 0),
(2969, 0, 'config', 'config_email', 'burakov.work@gmail.com', 0),
(2970, 0, 'config', 'config_telephone', '8 800 123 45 67', 0),
(2971, 0, 'config', 'config_fax', '', 0),
(2972, 0, 'config', 'config_image', 'catalog/logos/logo.png', 0),
(2973, 0, 'config', 'config_open', '9:00 - 18:00, 10:00 - 17:00', 0),
(2974, 0, 'config', 'config_comment', 'Sunrise CMS Comment', 0),
(2975, 0, 'config', 'config_location', '[\"1\",\"2\"]', 1),
(2976, 0, 'config', 'config_country_id', '220', 0),
(2977, 0, 'config', 'config_language', 'en-gb', 0),
(2978, 0, 'config', 'config_admin_language', 'en-gb', 0),
(2979, 0, 'config', 'config_currency', 'UAH', 0),
(2980, 0, 'config', 'config_currency_auto', '1', 0),
(2981, 0, 'config', 'config_product_count', '1', 0),
(2982, 0, 'config', 'config_limit_admin', '20', 0),
(2983, 0, 'config', 'config_review_status', '1', 0),
(2984, 0, 'config', 'config_review_guest', '1', 0),
(2985, 0, 'config', 'config_tax', '1', 0),
(2986, 0, 'config', 'config_tax_default', 'shipping', 0),
(2987, 0, 'config', 'config_tax_customer', 'shipping', 0),
(2988, 0, 'config', 'config_customer_group_id', '2', 0),
(2989, 0, 'config', 'config_customer_group_display', '[\"2\"]', 1),
(2990, 0, 'config', 'config_customer_price', '0', 0),
(2991, 0, 'config', 'config_login_attempts', '5', 0),
(2992, 0, 'config', 'config_account_id', '3', 0),
(2993, 0, 'config', 'config_invoice_prefix', 'INV-0000', 0),
(2994, 0, 'config', 'config_checkout_guest', '1', 0),
(2995, 0, 'config', 'config_checkout_id', '5', 0),
(2996, 0, 'config', 'config_order_status_id', '1', 0),
(2997, 0, 'config', 'config_processing_status', '[\"5\",\"1\",\"2\",\"12\",\"3\"]', 1),
(2998, 0, 'config', 'config_complete_status', '[\"5\",\"3\"]', 1),
(2999, 0, 'config', 'config_api_id', '1', 0),
(3000, 0, 'config', 'config_stock_display', '0', 0),
(3001, 0, 'config', 'config_stock_warning', '1', 0),
(3002, 0, 'config', 'config_stock_checkout', '0', 0),
(3003, 0, 'config', 'config_captcha', '', 0),
(3004, 0, 'config', 'config_captcha_page', '[\"register\",\"guest\",\"review\",\"contact\"]', 1),
(3005, 0, 'config', 'config_logo', 'catalog/logos/logo-small.png', 0),
(3006, 0, 'config', 'config_icon', 'catalog/logos/logo-small.png', 0),
(3007, 0, 'config', 'config_ftp_hostname', 'cms.freelance-team.su.loc', 0),
(3008, 0, 'config', 'config_ftp_port', '21', 0),
(3009, 0, 'config', 'config_ftp_username', '', 0),
(3010, 0, 'config', 'config_ftp_password', '', 0),
(3011, 0, 'config', 'config_ftp_root', '', 0),
(3012, 0, 'config', 'config_ftp_status', '0', 0),
(3013, 0, 'config', 'config_mail_protocol', 'mail', 0),
(3014, 0, 'config', 'config_mail_parameter', '', 0),
(3015, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(3016, 0, 'config', 'config_mail_smtp_username', '', 0),
(3017, 0, 'config', 'config_mail_smtp_password', '', 0),
(3018, 0, 'config', 'config_mail_smtp_port', '25', 0),
(3019, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(3020, 0, 'config', 'config_mail_alert', '[\"order\"]', 1),
(3021, 0, 'config', 'config_alert_email', '', 0),
(3022, 0, 'config', 'config_maintenance', '0', 0),
(3023, 0, 'config', 'config_seo_url', '1', 0),
(3024, 0, 'config', 'config_seo_url_include_path', '0', 0),
(3025, 0, 'config', 'config_seo_url_postfix', '.html', 0),
(3026, 0, 'config', 'config_file_max_size', '300000', 0),
(3027, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(3029, 0, 'config', 'config_secure', '1', 0),
(3030, 0, 'config', 'config_password', '1', 0),
(3031, 0, 'config', 'config_shared', '0', 0),
(3032, 0, 'config', 'config_encryption', '9v3G3hiGMkNbh8ixM0xDkgEjt14f4AFcmnultnZEZg4cNjXxPyXxz8Oqhe5RlP46LTbBuIR8XBUgViI89H6i44AsB89fNeRiCdzzoanJTD3Fhap75WyUNaYXKSyq7LGPa3IYiqFCkR24t2ssshyzGmB6J67x7pkkGtMt3NO01ocyxCAVwTjFA9lMzvQw1Oyg63sYPZ2c9cMx10NMbo69sorte4xr57wBmmzwABBA0X7KTqzsXu8zs3v6Xt3PAYAoCNPAJx1jgNfwZYB5b8F8Nbzognpl1HUUtkc9TYXz2Gb3ITDfxFreriTHPq7OPm9e4BWYfEWDKuDMtuCgzDpBiErNAWGf0b53FLwR4yDGrA5cwwWLmReSnell7taqBuqrJB58CH9rnNB7opE8Gf97RbOqGswlkli34zFfyxPYyAxXQ5wot4BnFvtwBhupXInbN7Z4NPj6gJu9DrAwGl4oroSY7Pikl2FY4poJSEx9N6RgQLIbBPeXX63PCd0chPm3QqdhHvcSCXOhiS7mnX8CQJqSOdAyjhcdbwZHsFZHbBYMy3pF3hSzEerWzrZFMa0ZKmWX7HCfgSnLEilkbeH6qfJwQ1TR8l1StUZknUKazVjLxdKuRql2SLRDrWz7kDFt1KLkDaVpERYUQqIphizA7ACpwPdL8AaaN7fIEsytBeaRw4zTqPfXA5hDKceukTtHlZwJP9bMUyjWhrAJDfT2YcjlwQELRdMohYSgFUssLmkHW8ve0PbA4bUfc7C0uw4df7yguwyR3YMseCB62UufUFQUqX9LDPftJSx84tQdNOYw2rG7bujxi3ha8x2VIMy47t4EVLslnRDV5SO4P2wtmO3Nz0zq7ybbFaLispLEnD5HeeSK8lW5iYmElKphAE3zLU133Xzsio8RSIYp8lUE9HSgJOh81S6ZFmD6UP0TIkOWNHuW1fiqQjpK7Jc5AEhO84uElNpba3h2wOs1tU6jLQULhH81TgkBFi4qc1045DW7flMJDh3FJBWx2OlTaNW1', 0),
(3033, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(3034, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(3035, 0, 'config', 'config_error_display', '1', 0),
(3036, 0, 'config', 'config_error_log', '1', 0),
(3037, 0, 'config', 'config_error_filename', 'error.log', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sticker`
--

CREATE TABLE `sticker` (
  `sticker_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sticker`
--

INSERT INTO `sticker` (`sticker_id`, `name`, `status`, `image`) VALUES
(13, 'Стикер 3', 1, ''),
(14, 'Стикер 2', 1, ''),
(15, 'Стикер 4', 1, ''),
(16, 'Стикер 1', 1, ''),
(17, 'Стикер 5', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `stock_status`
--

CREATE TABLE `stock_status` (
  `stock_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock_status`
--

INSERT INTO `stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(5, 2, 'Out Of Stock'),
(6, 2, '2-3 Days'),
(7, 2, 'In Stock'),
(8, 2, 'Pre-Order');

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `store_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tax_class`
--

CREATE TABLE `tax_class` (
  `tax_class_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tax_class`
--

INSERT INTO `tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed goods', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rate`
--

CREATE TABLE `tax_rate` (
  `tax_rate_id` int(11) NOT NULL,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tax_rate`
--

INSERT INTO `tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (20%)', '20.0000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rate_to_customer_group`
--

CREATE TABLE `tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tax_rate_to_customer_group`
--

INSERT INTO `tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tax_rule`
--

CREATE TABLE `tax_rule` (
  `tax_rule_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tax_rule`
--

INSERT INTO `tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(120, 10, 87, 'store', 0),
(121, 10, 86, 'payment', 1),
(127, 9, 87, 'shipping', 2),
(128, 9, 86, 'shipping', 1);

-- --------------------------------------------------------

--
-- Table structure for table `theme`
--

CREATE TABLE `theme` (
  `theme_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `theme` varchar(64) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `translation`
--

CREATE TABLE `translation` (
  `translation_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `upload`
--

CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `url_alias`
--

CREATE TABLE `url_alias` (
  `url_alias_id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `seomanager` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `url_alias`
--

INSERT INTO `url_alias` (`url_alias_id`, `query`, `keyword`, `seomanager`) VALUES
(862, 'common/home', '', 1),
(863, 'information/contact', 'contacts', 1),
(865, 'product/manufacturer', 'brands', 1),
(866, 'product/special', 'specials', 1),
(867, 'blog/latest', 'blog', 1),
(912, 'information_id=5', 'terms', 0),
(935, 'blog_category_id=69', 'blog-lorem-ipsum', 0),
(936, 'blog_category_id=71', 'blog-lorem-ipsum-dolor', 0),
(938, 'blog_category_id=70', 'blog-ipsum-dolor-sit', 0),
(939, 'article_id=120', 'voluptatem-corporis-qui-sequi', 0),
(940, 'article_id=123', 'fugit-assumenda-consequatur-voluptate', 0),
(941, 'article_id=124', 'perferendis-accusantium-animi', 0),
(945, 'category_id=18', 'nihil-tempora', 0),
(946, 'category_id=25', 'nulla-deleniti', 0),
(947, 'category_id=57', 'vitae-possimus', 0),
(948, 'category_id=17', 'minima-quos', 0),
(949, 'category_id=24', 'repellendus-quod', 0),
(950, 'category_id=33', 'nesciunt-corrupti', 0),
(951, 'category_id=34', 'illum-minus', 0),
(952, 'category_id=29', 'sint-nesciunt', 0),
(953, 'category_id=28', 'officiis-corrupti', 0),
(955, 'manufacturer_id=9', 'tempora', 0),
(956, 'manufacturer_id=8', 'maiores', 0),
(957, 'manufacturer_id=7', 'deleniti', 0),
(958, 'manufacturer_id=5', 'possimus', 0),
(959, 'manufacturer_id=6', 'quos', 0),
(960, 'manufacturer_id=10', 'corrupti', 0),
(963, 'article_id=125', 'aspernatur-deserunt', 0),
(964, 'product_id=42', 'product-1', 0),
(965, 'error/not_found', 'not-found', 1),
(966, 'checkout/cart', 'cart', 1),
(967, 'checkout/onepagecheckout', 'checkout', 1),
(973, 'category_id=20', 'quia-maiores', 0),
(996, 'information_id=6', 'delivery', 0),
(1001, 'information_id=3', 'privacy', 0),
(1023, 'information_id=7', 'test', 0),
(1050, 'information_id=4', 'about_us', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', 'b79b23c915622813ab835969912433a9f794ccb8', 'K5TuE7Mha', 'Main', 'Administrator', 'burakov.work@gmail.com', 'catalog/demo_users/main-administrator.jpg', '', '127.0.0.1', 1, '2018-09-21 22:04:47');

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `user_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'root', '{\"access\":[\"blog\\/article\",\"blog\\/category\",\"blog\\/review\",\"blog\\/setting\",\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/benefit\",\"design\\/custommenu\",\"design\\/layout\",\"design\\/sticker\",\"enhancement\\/ea_vqmod_manager\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/blog_sitemap\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/sitemap_pro\",\"extension\\/feed\\/yandex_market\",\"extension\\/installer\",\"extension\\/module\\/account\",\"extension\\/module\\/blocksforallcategories\",\"extension\\/module\\/blog_featured\",\"extension\\/module\\/blog_latest\",\"extension\\/module\\/blog_popular\",\"extension\\/module\\/cachemanager\",\"extension\\/module\\/custom_template\",\"extension\\/module\\/featured\",\"extension\\/module\\/featured_article\",\"extension\\/module\\/filter\",\"extension\\/module\\/html\",\"extension\\/module\\/latest\",\"extension\\/module\\/latestpercategory\",\"extension\\/module\\/popular\",\"extension\\/module\\/random\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/specialpercategory\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/liqpay\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/xshipping\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/zone\",\"marketing\\/contact\",\"marketing\\/marketing\",\"report\\/customer_reward\",\"report\\/marketing\",\"sale\\/order\",\"search\\/search\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/seomanager\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"],\"modify\":[\"blog\\/article\",\"blog\\/category\",\"blog\\/review\",\"blog\\/setting\",\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/benefit\",\"design\\/custommenu\",\"design\\/layout\",\"design\\/sticker\",\"enhancement\\/ea_vqmod_manager\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/blog_sitemap\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/sitemap_pro\",\"extension\\/feed\\/yandex_market\",\"extension\\/installer\",\"extension\\/module\\/account\",\"extension\\/module\\/blocksforallcategories\",\"extension\\/module\\/blog_featured\",\"extension\\/module\\/blog_latest\",\"extension\\/module\\/blog_popular\",\"extension\\/module\\/cachemanager\",\"extension\\/module\\/custom_template\",\"extension\\/module\\/featured\",\"extension\\/module\\/featured_article\",\"extension\\/module\\/filter\",\"extension\\/module\\/html\",\"extension\\/module\\/latest\",\"extension\\/module\\/latestpercategory\",\"extension\\/module\\/popular\",\"extension\\/module\\/random\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/specialpercategory\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/liqpay\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/xshipping\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/zone\",\"marketing\\/contact\",\"marketing\\/marketing\",\"report\\/customer_reward\",\"report\\/marketing\",\"sale\\/order\",\"search\\/search\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/seomanager\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"]}');

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

CREATE TABLE `zone` (
  `zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `zone`
--

INSERT INTO `zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M\'Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu\'a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Арагацотн', 'AGT', 1),
(181, 11, 'Арарат', 'ARR', 1),
(182, 11, 'Армавир', 'ARM', 1),
(183, 11, 'Гегаркуник', 'GEG', 1),
(184, 11, 'Котайк', 'KOT', 1),
(185, 11, 'Лори', 'LOR', 1),
(186, 11, 'Ширак', 'SHI', 1),
(187, 11, 'Сюник', 'SYU', 1),
(188, 11, 'Тавуш', 'TAV', 1),
(189, 11, 'Вайоц Дзор', 'VAY', 1),
(190, 11, 'Ереван', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Nieder&ouml;sterreich', 'NOS', 1),
(202, 14, 'Ober&ouml;sterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore\'s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Брест', 'BR', 1),
(338, 20, 'Гомель', 'HO', 1),
(339, 20, 'Минск', 'HM', 1),
(340, 20, 'Гродно', 'HR', 1),
(341, 20, 'Могилев', 'MA', 1),
(342, 20, 'Минская область', 'MI', 1),
(343, 20, 'Витебск', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liège', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George\'s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith\'s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceará', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espírito Santo', 'ES', 1),
(448, 30, 'Goiás', 'GO', 1),
(449, 30, 'Maranhão', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Paraíba', 'PB', 1),
(455, 30, 'Paraná', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'São Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M\'Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O\'Higgins', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chilena', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, 'Anhui', 'AN', 1),
(685, 44, 'Beijing', 'BE', 1),
(686, 44, 'Chongqing', 'CH', 1),
(687, 44, 'Fujian', 'FU', 1),
(688, 44, 'Gansu', 'GA', 1),
(689, 44, 'Guangdong', 'GU', 1),
(690, 44, 'Guangxi', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Hainan', 'HA', 1),
(693, 44, 'Hebei', 'HB', 1),
(694, 44, 'Heilongjiang', 'HL', 1),
(695, 44, 'Henan', 'HE', 1),
(696, 44, 'Hong Kong', 'HK', 1),
(697, 44, 'Hubei', 'HU', 1),
(698, 44, 'Hunan', 'HN', 1),
(699, 44, 'Inner Mongolia', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Jiangxi', 'JX', 1),
(702, 44, 'Jilin', 'JL', 1),
(703, 44, 'Liaoning', 'LI', 1),
(704, 44, 'Macau', 'MA', 1),
(705, 44, 'Ningxia', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Shandong', 'SA', 1),
(708, 44, 'Shanghai', 'SG', 1),
(709, 44, 'Shanxi', 'SX', 1),
(710, 44, 'Sichuan', 'SI', 1),
(711, 44, 'Tianjin', 'TI', 1),
(712, 44, 'Xinjiang', 'XI', 1),
(713, 44, 'Yunnan', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovarsko-bilogorska', 'BB', 1),
(848, 53, 'Grad Zagreb', 'GZ', 1),
(849, 53, 'Dubrovačko-neretvanska', 'DN', 1),
(850, 53, 'Istarska', 'IS', 1),
(851, 53, 'Karlovačka', 'KA', 1),
(852, 53, 'Koprivničko-križevačka', 'KK', 1),
(853, 53, 'Krapinsko-zagorska', 'KZ', 1),
(854, 53, 'Ličko-senjska', 'LS', 1),
(855, 53, 'Međimurska', 'ME', 1),
(856, 53, 'Osječko-baranjska', 'OB', 1),
(857, 53, 'Požeško-slavonska', 'PS', 1),
(858, 53, 'Primorsko-goranska', 'PG', 1),
(859, 53, 'Šibensko-kninska', 'SK', 1),
(860, 53, 'Sisačko-moslavačka', 'SM', 1),
(861, 53, 'Brodsko-posavska', 'BP', 1),
(862, 53, 'Splitsko-dalmatinska', 'SD', 1),
(863, 53, 'Varaždinska', 'VA', 1),
(864, 53, 'Virovitičko-podravska', 'VP', 1),
(865, 53, 'Vukovarsko-srijemska', 'VS', 1),
(866, 53, 'Zadarska', 'ZA', 1),
(867, 53, 'Zagrebačka', 'ZG', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '\'Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma\'iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa\'id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina\'', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina\'', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan lääni', 'AL', 1),
(1086, 72, 'Etelä-Suomen lääni', 'ES', 1),
(1087, 72, 'Itä-Suomen lääni', 'IS', 1),
(1088, 72, 'Länsi-Suomen lääni', 'LS', 1),
(1089, 72, 'Lapin lääni', 'LA', 1),
(1090, 72, 'Oulun lääni', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d\'Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-W&uuml;rttemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Th&uuml;ringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand\'Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Puducherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'BoDeTaBek', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta Raya', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1),
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1),
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta\'mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1),
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1),
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1);
INSERT INTO `zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be\'er Sheva', 'BS', 1),
(1613, 104, 'Bika\'at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '\'Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al \'Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa\'', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa\'', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma\'an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Алматинская область', 'AL', 1),
(1717, 109, 'Алматы - город республ-го значения', 'AC', 1),
(1718, 109, 'Акмолинская область', 'AM', 1),
(1719, 109, 'Актюбинская область', 'AQ', 1),
(1720, 109, 'Астана - город республ-го значения', 'AS', 1),
(1721, 109, 'Атырауская область', 'AT', 1),
(1722, 109, 'Западно-Казахстанская область', 'BA', 1),
(1723, 109, 'Байконур - город республ-го значения', 'BY', 1),
(1724, 109, 'Мангистауская область', 'MA', 1),
(1725, 109, 'Южно-Казахстанская область', 'ON', 1),
(1726, 109, 'Павлодарская область', 'PA', 1),
(1727, 109, 'Карагандинская область', 'QA', 1),
(1728, 109, 'Костанайская область', 'QO', 1),
(1729, 109, 'Кызылординская область', 'QY', 1),
(1730, 109, 'Восточно-Казахстанская область', 'SH', 1),
(1731, 109, 'Северо-Казахстанская область', 'SO', 1),
(1732, 109, 'Жамбылская область', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P\'yongan-bukto', 'PYB', 1),
(1769, 112, 'P\'yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P\'yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch\'ungch\'ong-bukto', 'CO', 1),
(1774, 113, 'Ch\'ungch\'ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch\'on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t\'ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al \'Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra\'', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale\'s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha\'s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al \'Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati\'', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'MY-01', 1),
(1972, 129, 'Kedah', 'MY-02', 1),
(1973, 129, 'Kelantan', 'MY-03', 1),
(1974, 129, 'Labuan', 'MY-15', 1),
(1975, 129, 'Melaka', 'MY-04', 1),
(1976, 129, 'Negeri Sembilan', 'MY-05', 1),
(1977, 129, 'Pahang', 'MY-06', 1),
(1978, 129, 'Perak', 'MY-08', 1),
(1979, 129, 'Perlis', 'MY-09', 1),
(1980, 129, 'Pulau Pinang', 'MY-07', 1),
(1981, 129, 'Sabah', 'MY-12', 1),
(1982, 129, 'Sarawak', 'MY-13', 1),
(1983, 129, 'Selangor', 'MY-10', 1),
(1984, 129, 'Terengganu', 'MY-11', 1),
(1985, 129, 'Kuala Lumpur', 'MY-14', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord Brabant', 'NB', 1),
(2336, 150, 'Noord Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke\'s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa\'id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Республика Хакасия', 'KK', 1),
(2722, 176, 'Забайкальский край', 'ZAB', 1),
(2723, 176, 'Чукотский АО', 'CHU', 1),
(2724, 176, 'Архангельская область', 'ARK', 1),
(2725, 176, 'Астраханская область', 'AST', 1),
(2726, 176, 'Алтайский край', 'ALT', 1),
(2727, 176, 'Белгородская область', 'BEL', 1),
(2728, 176, 'Еврейская АО', 'YEV', 1),
(2729, 176, 'Амурская область', 'AMU', 1),
(2730, 176, 'Брянская область', 'BRY', 1),
(2731, 176, 'Чувашская Республика', 'CU', 1),
(2732, 176, 'Челябинская область', 'CHE', 1),
(2733, 176, 'Карачаево-Черкесия', 'KC', 1),
(2735, 176, 'Таймырский АО', 'TDN', 1),
(2736, 176, 'Республика Калмыкия', 'KL', 1),
(2738, 176, 'Республика Алтай', 'AL', 1),
(2739, 176, 'Чеченская Республика', 'CE', 1),
(2740, 176, 'Иркутская область', 'IRK', 1),
(2741, 176, 'Ивановская область', 'IVA', 1),
(2742, 176, 'Удмуртская Республика', 'UD', 1),
(2743, 176, 'Калининградская область', 'KGD', 1),
(2744, 176, 'Калужская область', 'KLU', 1),
(2745, 176, 'Краснодарский край', 'KDA', 1),
(2746, 176, 'Республика Татарстан', 'TA', 1),
(2747, 176, 'Кемеровская область', 'KEM', 1),
(2748, 176, 'Хабаровский край', 'KHA', 1),
(2749, 176, 'Ханты-Мансийский АО - Югра', 'KHM', 1),
(2750, 176, 'Костромская область', 'KOS', 1),
(2751, 176, 'Московская область', 'MOS', 1),
(2752, 176, 'Красноярский край', 'KYA', 1),
(2753, 176, 'Коми-Пермяцкий АО', 'KOP', 1),
(2754, 176, 'Курганская область', 'KGN', 1),
(2755, 176, 'Курская область', 'KRS', 1),
(2756, 176, 'Республика Тыва', 'TY', 1),
(2757, 176, 'Липецкая область', 'LIP', 1),
(2758, 176, 'Магаданская область', 'MAG', 1),
(2759, 176, 'Республика Дагестан', 'DA', 1),
(2760, 176, 'Республика Адыгея', 'AD', 1),
(2761, 176, 'Москва', 'MOW', 1),
(2762, 176, 'Мурманская область', 'MUR', 1),
(2763, 176, 'Республика Кабардино-Балкария', 'KB', 1),
(2764, 176, 'Ненецкий АО', 'NEN', 1),
(2765, 176, 'Республика Ингушетия', 'IN', 1),
(2766, 176, 'Нижегородская область', 'NIZ', 1),
(2767, 176, 'Новгородская область', 'NGR', 1),
(2768, 176, 'Новосибирская область', 'NVS', 1),
(2769, 176, 'Омская область', 'OMS', 1),
(2770, 176, 'Орловская область', 'ORL', 1),
(2771, 176, 'Оренбургская область', 'ORE', 1),
(2772, 176, 'Корякский АО', 'KOR', 1),
(2773, 176, 'Пензенская область', 'PNZ', 1),
(2774, 176, 'Пермский край', 'PER', 1),
(2775, 176, 'Камчатский край', 'KAM', 1),
(2776, 176, 'Республика Карелия', 'KR', 1),
(2777, 176, 'Псковская область', 'PSK', 1),
(2778, 176, 'Ростовская область', 'ROS', 1),
(2779, 176, 'Рязанская область', 'RYA', 1),
(2780, 176, 'Ямало-Ненецкий АО', 'YAN', 1),
(2781, 176, 'Самарская область', 'SAM', 1),
(2782, 176, 'Республика Мордовия', 'MO', 1),
(2783, 176, 'Саратовская область', 'SAR', 1),
(2784, 176, 'Смоленская область', 'SMO', 1),
(2785, 176, 'Санкт-Петербург', 'SPE', 1),
(2786, 176, 'Ставропольский край', 'STA', 1),
(2787, 176, 'Республика Коми', 'KO', 1),
(2788, 176, 'Тамбовская область', 'TAM', 1),
(2789, 176, 'Томская область', 'TOM', 1),
(2790, 176, 'Тульская область', 'TUL', 1),
(2791, 176, 'Ленинградская область', 'LEN', 1),
(2792, 176, 'Тверская область', 'TVE', 1),
(2793, 176, 'Тюменская область', 'TYU', 1),
(2794, 176, 'Республика Башкортостан', 'BA', 1),
(2795, 176, 'Ульяновская область', 'ULY', 1),
(2796, 176, 'Республика Бурятия', 'BU', 1),
(2798, 176, 'Республика Северная Осетия', 'SE', 1),
(2799, 176, 'Владимирская область', 'VLA', 1),
(2800, 176, 'Приморский край', 'PRI', 1),
(2801, 176, 'Волгоградская область', 'VGG', 1),
(2802, 176, 'Вологодская область', 'VLG', 1),
(2803, 176, 'Воронежская область', 'VOR', 1),
(2804, 176, 'Кировская область', 'KIR', 1),
(2805, 176, 'Республика  Саха / Якутия', 'SA', 1),
(2806, 176, 'Ярославская область', 'YAR', 1),
(2807, 176, 'Свердловская область', 'SVE', 1),
(2808, 176, 'Республика Марий Эл', 'ME', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A\'ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa\'asaleleaga', 'FA', 1),
(2856, 181, 'Gaga\'emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa\'itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va\'a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '\'Asir', 'AS', 1),
(2882, 184, 'Ha\'il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand\' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand\' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3034, 199, 'A\'ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa\'iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa\'iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1),
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'G&auml;vleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'J&auml;mtland', 'Z', 1),
(3080, 203, 'J&ouml;nk&ouml;ping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, '&Ouml;rebro', 'T', 1),
(3085, 203, '&Ouml;sterg&ouml;tland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'S&ouml;dermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'V&auml;rmland', 'S', 1),
(3091, 203, 'V&auml;sterbotten', 'AC', 1),
(3092, 203, 'V&auml;sternorrland', 'Y', 1),
(3093, 203, 'V&auml;stmanland', 'U', 1),
(3094, 203, 'V&auml;stra G&ouml;taland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graub&uuml;nden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Z&uuml;rich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1);
INSERT INTO `zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1),
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1),
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1),
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t\'ou', 'NT', 1),
(3145, 206, 'P\'eng-hu', 'PH', 1),
(3146, 206, 'P\'ing-tung', 'PT', 1),
(3147, 206, 'T\'ai-chung', 'TG', 1),
(3148, 206, 'T\'ai-nan', 'TA', 1),
(3149, 206, 'T\'ai-pei county', 'TP', 1),
(3150, 206, 'T\'ai-tung', 'TT', 1),
(3151, 206, 'T\'ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T\'ai-chung', 'TH', 1),
(3157, 206, 'T\'ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T\'ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha\'apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava\'u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakır', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Черкасская область', '71', 1),
(3481, 220, 'Черниговская область', '74', 1),
(3482, 220, 'Черновицкая область', '77', 1),
(3483, 220, 'Крым', '43', 1),
(3484, 220, 'Днепропетровская область', '12', 1),
(3485, 220, 'Донецкая область', '14', 1),
(3486, 220, 'Ивано-Франковская область', '26', 1),
(3487, 220, 'Херсонская область', '65', 1),
(3488, 220, 'Хмельницкая область', '68', 1),
(3489, 220, 'Кировоградская область', '35', 1),
(3490, 220, 'Киев', '30', 1),
(3491, 220, 'Киевская область', '32', 1),
(3492, 220, 'Луганская область', '09', 1),
(3493, 220, 'Львовская область', '46', 1),
(3494, 220, 'Николаевская область', '48', 1),
(3495, 220, 'Одесская область', '51', 1),
(3496, 220, 'Полтавская область', '53', 1),
(3497, 220, 'Ровненская область', '56', 1),
(3498, 220, 'Севастополь', '40', 1),
(3499, 220, 'Сумская область', '59', 1),
(3500, 220, 'Тернопольская область', '61', 1),
(3501, 220, 'Винницкая область', '05', 1),
(3502, 220, 'Волынская область', '07', 1),
(3503, 220, 'Закарпатская область', '21', 1),
(3504, 220, 'Запорожская область', '23', 1),
(3505, 220, 'Житомирская область', '18', 1),
(3506, 221, 'Abu Zaby', 'AZ', 1),
(3507, 221, '\'Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubai', 'DU', 1),
(3511, 221, 'R\'as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg\'ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog\'iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma\'rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa\'dah', 'SD', 1),
(3805, 235, 'San\'a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta\'izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3862, 105, 'Carbonia-Iglesias', 'CI', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3895, 105, 'Medio Campidano', 'VS', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3902, 105, 'Ogliastra', 'OG', 1),
(3903, 105, 'Olbia-Tempio', 'OT', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1),
(4035, 129, 'Putrajaya', 'MY-16', 1),
(4036, 117, 'Ainaži, Salacgrīvas novads', '0661405', 1),
(4037, 117, 'Aizkraukle, Aizkraukles novads', '0320201', 1),
(4038, 117, 'Aizkraukles novads', '0320200', 1),
(4039, 117, 'Aizpute, Aizputes novads', '0640605', 1),
(4040, 117, 'Aizputes novads', '0640600', 1),
(4041, 117, 'Aknīste, Aknīstes novads', '0560805', 1),
(4042, 117, 'Aknīstes novads', '0560800', 1),
(4043, 117, 'Aloja, Alojas novads', '0661007', 1),
(4044, 117, 'Alojas novads', '0661000', 1),
(4045, 117, 'Alsungas novads', '0624200', 1),
(4046, 117, 'Alūksne, Alūksnes novads', '0360201', 1),
(4047, 117, 'Alūksnes novads', '0360200', 1),
(4048, 117, 'Amatas novads', '0424701', 1),
(4049, 117, 'Ape, Apes novads', '0360805', 1),
(4050, 117, 'Apes novads', '0360800', 1),
(4051, 117, 'Auce, Auces novads', '0460805', 1),
(4052, 117, 'Auces novads', '0460800', 1),
(4053, 117, 'Ādažu novads', '0804400', 1),
(4054, 117, 'Babītes novads', '0804900', 1),
(4055, 117, 'Baldone, Baldones novads', '0800605', 1),
(4056, 117, 'Baldones novads', '0800600', 1),
(4057, 117, 'Baloži, Ķekavas novads', '0800807', 1),
(4058, 117, 'Baltinavas novads', '0384400', 1),
(4059, 117, 'Balvi, Balvu novads', '0380201', 1),
(4060, 117, 'Balvu novads', '0380200', 1),
(4061, 117, 'Bauska, Bauskas novads', '0400201', 1),
(4062, 117, 'Bauskas novads', '0400200', 1),
(4063, 117, 'Beverīnas novads', '0964700', 1),
(4064, 117, 'Brocēni, Brocēnu novads', '0840605', 1),
(4065, 117, 'Brocēnu novads', '0840601', 1),
(4066, 117, 'Burtnieku novads', '0967101', 1),
(4067, 117, 'Carnikavas novads', '0805200', 1),
(4068, 117, 'Cesvaine, Cesvaines novads', '0700807', 1),
(4069, 117, 'Cesvaines novads', '0700800', 1),
(4070, 117, 'Cēsis, Cēsu novads', '0420201', 1),
(4071, 117, 'Cēsu novads', '0420200', 1),
(4072, 117, 'Ciblas novads', '0684901', 1),
(4073, 117, 'Dagda, Dagdas novads', '0601009', 1),
(4074, 117, 'Dagdas novads', '0601000', 1),
(4075, 117, 'Daugavpils', '0050000', 1),
(4076, 117, 'Daugavpils novads', '0440200', 1),
(4077, 117, 'Dobele, Dobeles novads', '0460201', 1),
(4078, 117, 'Dobeles novads', '0460200', 1),
(4079, 117, 'Dundagas novads', '0885100', 1),
(4080, 117, 'Durbe, Durbes novads', '0640807', 1),
(4081, 117, 'Durbes novads', '0640801', 1),
(4082, 117, 'Engures novads', '0905100', 1),
(4083, 117, 'Ērgļu novads', '0705500', 1),
(4084, 117, 'Garkalnes novads', '0806000', 1),
(4085, 117, 'Grobiņa, Grobiņas novads', '0641009', 1),
(4086, 117, 'Grobiņas novads', '0641000', 1),
(4087, 117, 'Gulbene, Gulbenes novads', '0500201', 1),
(4088, 117, 'Gulbenes novads', '0500200', 1),
(4089, 117, 'Iecavas novads', '0406400', 1),
(4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 1),
(4091, 117, 'Ikšķiles novads', '0740600', 1),
(4092, 117, 'Ilūkste, Ilūkstes novads', '0440807', 1),
(4093, 117, 'Ilūkstes novads', '0440801', 1),
(4094, 117, 'Inčukalna novads', '0801800', 1),
(4095, 117, 'Jaunjelgava, Jaunjelgavas novads', '0321007', 1),
(4096, 117, 'Jaunjelgavas novads', '0321000', 1),
(4097, 117, 'Jaunpiebalgas novads', '0425700', 1),
(4098, 117, 'Jaunpils novads', '0905700', 1),
(4099, 117, 'Jelgava', '0090000', 1),
(4100, 117, 'Jelgavas novads', '0540200', 1),
(4101, 117, 'Jēkabpils', '0110000', 1),
(4102, 117, 'Jēkabpils novads', '0560200', 1),
(4103, 117, 'Jūrmala', '0130000', 1),
(4104, 117, 'Kalnciems, Jelgavas novads', '0540211', 1),
(4105, 117, 'Kandava, Kandavas novads', '0901211', 1),
(4106, 117, 'Kandavas novads', '0901201', 1),
(4107, 117, 'Kārsava, Kārsavas novads', '0681009', 1),
(4108, 117, 'Kārsavas novads', '0681000', 1),
(4109, 117, 'Kocēnu novads ,bij. Valmieras)', '0960200', 1),
(4110, 117, 'Kokneses novads', '0326100', 1),
(4111, 117, 'Krāslava, Krāslavas novads', '0600201', 1),
(4112, 117, 'Krāslavas novads', '0600202', 1),
(4113, 117, 'Krimuldas novads', '0806900', 1),
(4114, 117, 'Krustpils novads', '0566900', 1),
(4115, 117, 'Kuldīga, Kuldīgas novads', '0620201', 1),
(4116, 117, 'Kuldīgas novads', '0620200', 1),
(4117, 117, 'Ķeguma novads', '0741001', 1),
(4118, 117, 'Ķegums, Ķeguma novads', '0741009', 1),
(4119, 117, 'Ķekavas novads', '0800800', 1),
(4120, 117, 'Lielvārde, Lielvārdes novads', '0741413', 1),
(4121, 117, 'Lielvārdes novads', '0741401', 1),
(4122, 117, 'Liepāja', '0170000', 1),
(4123, 117, 'Limbaži, Limbažu novads', '0660201', 1),
(4124, 117, 'Limbažu novads', '0660200', 1),
(4125, 117, 'Līgatne, Līgatnes novads', '0421211', 1),
(4126, 117, 'Līgatnes novads', '0421200', 1),
(4127, 117, 'Līvāni, Līvānu novads', '0761211', 1),
(4128, 117, 'Līvānu novads', '0761201', 1),
(4129, 117, 'Lubāna, Lubānas novads', '0701413', 1),
(4130, 117, 'Lubānas novads', '0701400', 1),
(4131, 117, 'Ludza, Ludzas novads', '0680201', 1),
(4132, 117, 'Ludzas novads', '0680200', 1),
(4133, 117, 'Madona, Madonas novads', '0700201', 1),
(4134, 117, 'Madonas novads', '0700200', 1),
(4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 1),
(4136, 117, 'Mazsalacas novads', '0961000', 1),
(4137, 117, 'Mālpils novads', '0807400', 1),
(4138, 117, 'Mārupes novads', '0807600', 1),
(4139, 117, 'Mērsraga novads', '0887600', 1),
(4140, 117, 'Naukšēnu novads', '0967300', 1),
(4141, 117, 'Neretas novads', '0327100', 1),
(4142, 117, 'Nīcas novads', '0647900', 1),
(4143, 117, 'Ogre, Ogres novads', '0740201', 1),
(4144, 117, 'Ogres novads', '0740202', 1),
(4145, 117, 'Olaine, Olaines novads', '0801009', 1),
(4146, 117, 'Olaines novads', '0801000', 1),
(4147, 117, 'Ozolnieku novads', '0546701', 1),
(4148, 117, 'Pārgaujas novads', '0427500', 1),
(4149, 117, 'Pāvilosta, Pāvilostas novads', '0641413', 1),
(4150, 117, 'Pāvilostas novads', '0641401', 1),
(4151, 117, 'Piltene, Ventspils novads', '0980213', 1),
(4152, 117, 'Pļaviņas, Pļaviņu novads', '0321413', 1),
(4153, 117, 'Pļaviņu novads', '0321400', 1),
(4154, 117, 'Preiļi, Preiļu novads', '0760201', 1),
(4155, 117, 'Preiļu novads', '0760202', 1),
(4156, 117, 'Priekule, Priekules novads', '0641615', 1),
(4157, 117, 'Priekules novads', '0641600', 1),
(4158, 117, 'Priekuļu novads', '0427300', 1),
(4159, 117, 'Raunas novads', '0427700', 1),
(4160, 117, 'Rēzekne', '0210000', 1),
(4161, 117, 'Rēzeknes novads', '0780200', 1),
(4162, 117, 'Riebiņu novads', '0766300', 1),
(4163, 117, 'Rīga', '0010000', 1),
(4164, 117, 'Rojas novads', '0888300', 1),
(4165, 117, 'Ropažu novads', '0808400', 1),
(4166, 117, 'Rucavas novads', '0648500', 1),
(4167, 117, 'Rugāju novads', '0387500', 1),
(4168, 117, 'Rundāles novads', '0407700', 1),
(4169, 117, 'Rūjiena, Rūjienas novads', '0961615', 1),
(4170, 117, 'Rūjienas novads', '0961600', 1),
(4171, 117, 'Sabile, Talsu novads', '0880213', 1),
(4172, 117, 'Salacgrīva, Salacgrīvas novads', '0661415', 1),
(4173, 117, 'Salacgrīvas novads', '0661400', 1),
(4174, 117, 'Salas novads', '0568700', 1),
(4175, 117, 'Salaspils novads', '0801200', 1),
(4176, 117, 'Salaspils, Salaspils novads', '0801211', 1),
(4177, 117, 'Saldus novads', '0840200', 1),
(4178, 117, 'Saldus, Saldus novads', '0840201', 1),
(4179, 117, 'Saulkrasti, Saulkrastu novads', '0801413', 1),
(4180, 117, 'Saulkrastu novads', '0801400', 1),
(4181, 117, 'Seda, Strenču novads', '0941813', 1),
(4182, 117, 'Sējas novads', '0809200', 1),
(4183, 117, 'Sigulda, Siguldas novads', '0801615', 1),
(4184, 117, 'Siguldas novads', '0801601', 1),
(4185, 117, 'Skrīveru novads', '0328200', 1),
(4186, 117, 'Skrunda, Skrundas novads', '0621209', 1),
(4187, 117, 'Skrundas novads', '0621200', 1),
(4188, 117, 'Smiltene, Smiltenes novads', '0941615', 1),
(4189, 117, 'Smiltenes novads', '0941600', 1),
(4190, 117, 'Staicele, Alojas novads', '0661017', 1),
(4191, 117, 'Stende, Talsu novads', '0880215', 1),
(4192, 117, 'Stopiņu novads', '0809600', 1),
(4193, 117, 'Strenči, Strenču novads', '0941817', 1),
(4194, 117, 'Strenču novads', '0941800', 1),
(4195, 117, 'Subate, Ilūkstes novads', '0440815', 1),
(4196, 117, 'Talsi, Talsu novads', '0880201', 1),
(4197, 117, 'Talsu novads', '0880200', 1),
(4198, 117, 'Tērvetes novads', '0468900', 1),
(4199, 117, 'Tukuma novads', '0900200', 1),
(4200, 117, 'Tukums, Tukuma novads', '0900201', 1),
(4201, 117, 'Vaiņodes novads', '0649300', 1),
(4202, 117, 'Valdemārpils, Talsu novads', '0880217', 1),
(4203, 117, 'Valka, Valkas novads', '0940201', 1),
(4204, 117, 'Valkas novads', '0940200', 1),
(4205, 117, 'Valmiera', '0250000', 1),
(4206, 117, 'Vangaži, Inčukalna novads', '0801817', 1),
(4207, 117, 'Varakļāni, Varakļānu novads', '0701817', 1),
(4208, 117, 'Varakļānu novads', '0701800', 1),
(4209, 117, 'Vārkavas novads', '0769101', 1),
(4210, 117, 'Vecpiebalgas novads', '0429300', 1),
(4211, 117, 'Vecumnieku novads', '0409500', 1),
(4212, 117, 'Ventspils', '0270000', 1),
(4213, 117, 'Ventspils novads', '0980200', 1),
(4214, 117, 'Viesīte, Viesītes novads', '0561815', 1),
(4215, 117, 'Viesītes novads', '0561800', 1),
(4216, 117, 'Viļaka, Viļakas novads', '0381615', 1),
(4217, 117, 'Viļakas novads', '0381600', 1),
(4218, 117, 'Viļāni, Viļānu novads', '0781817', 1),
(4219, 117, 'Viļānu novads', '0781800', 1),
(4220, 117, 'Zilupe, Zilupes novads', '0681817', 1),
(4221, 117, 'Zilupes novads', '0681801', 1),
(4222, 43, 'Arica y Parinacota', 'AP', 1),
(4223, 43, 'Los Rios', 'LR', 1),
(4224, 220, 'Харьковская область', '63', 1),
(4225, 118, 'Beirut', 'LB-BR', 1),
(4226, 118, 'Bekaa', 'LB-BE', 1),
(4227, 118, 'Mount Lebanon', 'LB-ML', 1),
(4228, 118, 'Nabatieh', 'LB-NB', 1),
(4229, 118, 'North', 'LB-NR', 1),
(4230, 118, 'South', 'LB-ST', 1),
(4231, 99, 'Telangana', 'TS', 1);

-- --------------------------------------------------------

--
-- Table structure for table `zone_to_geo_zone`
--

CREATE TABLE `zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `zone_to_geo_zone`
--

INSERT INTO `zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 222, 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 222, 3513, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 222, 3514, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 222, 3515, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 222, 3516, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 222, 3517, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 222, 3518, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 222, 3519, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 222, 3520, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 222, 3521, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 222, 3522, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 222, 3523, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 222, 3524, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 222, 3525, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 222, 3526, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 222, 3527, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 222, 3528, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 222, 3529, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 222, 3530, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 222, 3531, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 222, 3532, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 222, 3533, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 222, 3534, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 222, 3535, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 222, 3536, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 222, 3537, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 222, 3538, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 222, 3539, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 222, 3540, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 222, 3541, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 222, 3542, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 222, 3543, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 222, 3544, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 222, 3545, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 222, 3546, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 222, 3547, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 222, 3548, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 222, 3549, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 222, 3550, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 222, 3551, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 222, 3552, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 222, 3553, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 222, 3554, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 222, 3555, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 222, 3556, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 222, 3557, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 222, 3558, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 222, 3559, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 222, 3560, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 222, 3561, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 222, 3562, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 222, 3563, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 222, 3564, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 222, 3565, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 222, 3566, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 222, 3567, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 222, 3568, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 222, 3569, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 222, 3570, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 222, 3571, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 222, 3572, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 222, 3573, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 222, 3574, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 222, 3575, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 222, 3576, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 222, 3577, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 222, 3578, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 222, 3579, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 222, 3580, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 222, 3581, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 222, 3582, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 222, 3583, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 222, 3584, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 222, 3585, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 222, 3586, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 222, 3587, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 222, 3588, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 222, 3589, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 222, 3590, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 222, 3591, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 222, 3592, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 222, 3593, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 222, 3594, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 222, 3595, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 222, 3596, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 222, 3597, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 222, 3598, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 222, 3599, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 222, 3600, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 222, 3601, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 222, 3602, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 222, 3603, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 222, 3604, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 222, 3605, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 222, 3606, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 222, 3607, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 222, 3608, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 222, 3609, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 222, 3610, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 222, 3611, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 222, 3612, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 222, 3949, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 222, 3950, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 222, 3951, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 222, 3952, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 222, 3953, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 222, 3954, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 222, 3955, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 222, 3972, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `api`
--
ALTER TABLE `api`
  ADD PRIMARY KEY (`api_id`);

--
-- Indexes for table `api_ip`
--
ALTER TABLE `api_ip`
  ADD PRIMARY KEY (`api_ip_id`);

--
-- Indexes for table `api_session`
--
ALTER TABLE `api_session`
  ADD PRIMARY KEY (`api_session_id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `article_description`
--
ALTER TABLE `article_description`
  ADD PRIMARY KEY (`article_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `article_image`
--
ALTER TABLE `article_image`
  ADD PRIMARY KEY (`article_image_id`);

--
-- Indexes for table `article_related`
--
ALTER TABLE `article_related`
  ADD PRIMARY KEY (`article_id`,`related_id`);

--
-- Indexes for table `article_related_mn`
--
ALTER TABLE `article_related_mn`
  ADD PRIMARY KEY (`article_id`,`manufacturer_id`);

--
-- Indexes for table `article_related_product`
--
ALTER TABLE `article_related_product`
  ADD PRIMARY KEY (`article_id`,`product_id`);

--
-- Indexes for table `article_related_wb`
--
ALTER TABLE `article_related_wb`
  ADD PRIMARY KEY (`article_id`,`category_id`);

--
-- Indexes for table `article_to_blog_category`
--
ALTER TABLE `article_to_blog_category`
  ADD PRIMARY KEY (`article_id`,`blog_category_id`);

--
-- Indexes for table `article_to_download`
--
ALTER TABLE `article_to_download`
  ADD PRIMARY KEY (`article_id`,`download_id`);

--
-- Indexes for table `article_to_layout`
--
ALTER TABLE `article_to_layout`
  ADD PRIMARY KEY (`article_id`,`store_id`);

--
-- Indexes for table `article_to_store`
--
ALTER TABLE `article_to_store`
  ADD PRIMARY KEY (`article_id`,`store_id`);

--
-- Indexes for table `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Indexes for table `attribute_description`
--
ALTER TABLE `attribute_description`
  ADD PRIMARY KEY (`attribute_id`,`language_id`);

--
-- Indexes for table `attribute_group`
--
ALTER TABLE `attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`);

--
-- Indexes for table `attribute_group_description`
--
ALTER TABLE `attribute_group_description`
  ADD PRIMARY KEY (`attribute_group_id`,`language_id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `banner_image`
--
ALTER TABLE `banner_image`
  ADD PRIMARY KEY (`banner_image_id`);

--
-- Indexes for table `benefit`
--
ALTER TABLE `benefit`
  ADD PRIMARY KEY (`benefit_id`);

--
-- Indexes for table `benefit_description`
--
ALTER TABLE `benefit_description`
  ADD PRIMARY KEY (`benefit_id`,`language_id`);

--
-- Indexes for table `blog_category`
--
ALTER TABLE `blog_category`
  ADD PRIMARY KEY (`blog_category_id`);

--
-- Indexes for table `blog_category_description`
--
ALTER TABLE `blog_category_description`
  ADD PRIMARY KEY (`blog_category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `blog_category_path`
--
ALTER TABLE `blog_category_path`
  ADD PRIMARY KEY (`blog_category_id`,`path_id`);

--
-- Indexes for table `blog_category_to_layout`
--
ALTER TABLE `blog_category_to_layout`
  ADD PRIMARY KEY (`blog_category_id`,`store_id`);

--
-- Indexes for table `blog_category_to_store`
--
ALTER TABLE `blog_category_to_store`
  ADD PRIMARY KEY (`blog_category_id`,`store_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`) USING BTREE;

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `category_description`
--
ALTER TABLE `category_description`
  ADD PRIMARY KEY (`category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `category_filter`
--
ALTER TABLE `category_filter`
  ADD PRIMARY KEY (`category_id`,`filter_id`);

--
-- Indexes for table `category_path`
--
ALTER TABLE `category_path`
  ADD PRIMARY KEY (`category_id`,`path_id`);

--
-- Indexes for table `category_to_layout`
--
ALTER TABLE `category_to_layout`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Indexes for table `category_to_store`
--
ALTER TABLE `category_to_store`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customer_group`
--
ALTER TABLE `customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Indexes for table `customer_group_description`
--
ALTER TABLE `customer_group_description`
  ADD PRIMARY KEY (`customer_group_id`,`language_id`);

--
-- Indexes for table `customer_history`
--
ALTER TABLE `customer_history`
  ADD PRIMARY KEY (`customer_history_id`);

--
-- Indexes for table `customer_ip`
--
ALTER TABLE `customer_ip`
  ADD PRIMARY KEY (`customer_ip_id`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `customer_login`
--
ALTER TABLE `customer_login`
  ADD PRIMARY KEY (`customer_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `customer_reward`
--
ALTER TABLE `customer_reward`
  ADD PRIMARY KEY (`customer_reward_id`);

--
-- Indexes for table `customer_transaction`
--
ALTER TABLE `customer_transaction`
  ADD PRIMARY KEY (`customer_transaction_id`);

--
-- Indexes for table `custommenu`
--
ALTER TABLE `custommenu`
  ADD PRIMARY KEY (`custommenu_id`);

--
-- Indexes for table `custommenu_child`
--
ALTER TABLE `custommenu_child`
  ADD PRIMARY KEY (`custommenu_child_id`),
  ADD KEY `custommenu_id` (`custommenu_id`);

--
-- Indexes for table `custommenu_child_description`
--
ALTER TABLE `custommenu_child_description`
  ADD PRIMARY KEY (`custommenu_child_id`,`language_id`),
  ADD KEY `custommenu_id` (`custommenu_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `custommenu_child_to_store`
--
ALTER TABLE `custommenu_child_to_store`
  ADD PRIMARY KEY (`custommenu_child_id`,`store_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `custommenu_description`
--
ALTER TABLE `custommenu_description`
  ADD PRIMARY KEY (`custommenu_id`,`language_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `custommenu_to_store`
--
ALTER TABLE `custommenu_to_store`
  ADD PRIMARY KEY (`custommenu_id`,`store_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `custom_field`
--
ALTER TABLE `custom_field`
  ADD PRIMARY KEY (`custom_field_id`);

--
-- Indexes for table `custom_field_customer_group`
--
ALTER TABLE `custom_field_customer_group`
  ADD PRIMARY KEY (`custom_field_id`,`customer_group_id`);

--
-- Indexes for table `custom_field_description`
--
ALTER TABLE `custom_field_description`
  ADD PRIMARY KEY (`custom_field_id`,`language_id`);

--
-- Indexes for table `custom_field_value`
--
ALTER TABLE `custom_field_value`
  ADD PRIMARY KEY (`custom_field_value_id`);

--
-- Indexes for table `custom_field_value_description`
--
ALTER TABLE `custom_field_value_description`
  ADD PRIMARY KEY (`custom_field_value_id`,`language_id`);

--
-- Indexes for table `download`
--
ALTER TABLE `download`
  ADD PRIMARY KEY (`download_id`);

--
-- Indexes for table `download_description`
--
ALTER TABLE `download_description`
  ADD PRIMARY KEY (`download_id`,`language_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `extension`
--
ALTER TABLE `extension`
  ADD PRIMARY KEY (`extension_id`);

--
-- Indexes for table `filter`
--
ALTER TABLE `filter`
  ADD PRIMARY KEY (`filter_id`);

--
-- Indexes for table `filter_description`
--
ALTER TABLE `filter_description`
  ADD PRIMARY KEY (`filter_id`,`language_id`);

--
-- Indexes for table `filter_group`
--
ALTER TABLE `filter_group`
  ADD PRIMARY KEY (`filter_group_id`);

--
-- Indexes for table `filter_group_description`
--
ALTER TABLE `filter_group_description`
  ADD PRIMARY KEY (`filter_group_id`,`language_id`);

--
-- Indexes for table `geo_zone`
--
ALTER TABLE `geo_zone`
  ADD PRIMARY KEY (`geo_zone_id`);

--
-- Indexes for table `information`
--
ALTER TABLE `information`
  ADD PRIMARY KEY (`information_id`);

--
-- Indexes for table `information_description`
--
ALTER TABLE `information_description`
  ADD PRIMARY KEY (`information_id`,`language_id`);

--
-- Indexes for table `information_to_layout`
--
ALTER TABLE `information_to_layout`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Indexes for table `information_to_store`
--
ALTER TABLE `information_to_store`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `layout`
--
ALTER TABLE `layout`
  ADD PRIMARY KEY (`layout_id`);

--
-- Indexes for table `layout_module`
--
ALTER TABLE `layout_module`
  ADD PRIMARY KEY (`layout_module_id`);

--
-- Indexes for table `layout_route`
--
ALTER TABLE `layout_route`
  ADD PRIMARY KEY (`layout_route_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Indexes for table `manufacturer_description`
--
ALTER TABLE `manufacturer_description`
  ADD PRIMARY KEY (`manufacturer_id`,`language_id`);

--
-- Indexes for table `manufacturer_to_layout`
--
ALTER TABLE `manufacturer_to_layout`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Indexes for table `manufacturer_to_store`
--
ALTER TABLE `manufacturer_to_store`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Indexes for table `marketing`
--
ALTER TABLE `marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `menu_description`
--
ALTER TABLE `menu_description`
  ADD PRIMARY KEY (`menu_id`,`language_id`);

--
-- Indexes for table `menu_module`
--
ALTER TABLE `menu_module`
  ADD PRIMARY KEY (`menu_module_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `option`
--
ALTER TABLE `option`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `option_description`
--
ALTER TABLE `option_description`
  ADD PRIMARY KEY (`option_id`,`language_id`);

--
-- Indexes for table `option_value`
--
ALTER TABLE `option_value`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Indexes for table `option_value_description`
--
ALTER TABLE `option_value_description`
  ADD PRIMARY KEY (`option_value_id`,`language_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_custom_field`
--
ALTER TABLE `order_custom_field`
  ADD PRIMARY KEY (`order_custom_field_id`);

--
-- Indexes for table `order_history`
--
ALTER TABLE `order_history`
  ADD PRIMARY KEY (`order_history_id`);

--
-- Indexes for table `order_option`
--
ALTER TABLE `order_option`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`order_product_id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`order_status_id`,`language_id`);

--
-- Indexes for table `order_total`
--
ALTER TABLE `order_total`
  ADD PRIMARY KEY (`order_total_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD PRIMARY KEY (`product_id`,`attribute_id`,`language_id`);

--
-- Indexes for table `product_description`
--
ALTER TABLE `product_description`
  ADD PRIMARY KEY (`product_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `product_discount`
--
ALTER TABLE `product_discount`
  ADD PRIMARY KEY (`product_discount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_filter`
--
ALTER TABLE `product_filter`
  ADD PRIMARY KEY (`product_id`,`filter_id`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_option`
--
ALTER TABLE `product_option`
  ADD PRIMARY KEY (`product_option_id`);

--
-- Indexes for table `product_option_value`
--
ALTER TABLE `product_option_value`
  ADD PRIMARY KEY (`product_option_value_id`);

--
-- Indexes for table `product_related`
--
ALTER TABLE `product_related`
  ADD PRIMARY KEY (`product_id`,`related_id`);

--
-- Indexes for table `product_related_article`
--
ALTER TABLE `product_related_article`
  ADD PRIMARY KEY (`article_id`,`product_id`);

--
-- Indexes for table `product_reward`
--
ALTER TABLE `product_reward`
  ADD PRIMARY KEY (`product_reward_id`);

--
-- Indexes for table `product_special`
--
ALTER TABLE `product_special`
  ADD PRIMARY KEY (`product_special_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_tab`
--
ALTER TABLE `product_tab`
  ADD PRIMARY KEY (`product_tab_id`);

--
-- Indexes for table `product_to_benefit`
--
ALTER TABLE `product_to_benefit`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `benefit_id` (`benefit_id`);

--
-- Indexes for table `product_to_category`
--
ALTER TABLE `product_to_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_to_download`
--
ALTER TABLE `product_to_download`
  ADD PRIMARY KEY (`product_id`,`download_id`);

--
-- Indexes for table `product_to_layout`
--
ALTER TABLE `product_to_layout`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Indexes for table `product_to_sticker`
--
ALTER TABLE `product_to_sticker`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `sticker_id` (`sticker_id`);

--
-- Indexes for table `product_to_store`
--
ALTER TABLE `product_to_store`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `review_article`
--
ALTER TABLE `review_article`
  ADD PRIMARY KEY (`review_article_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `sticker`
--
ALTER TABLE `sticker`
  ADD PRIMARY KEY (`sticker_id`);

--
-- Indexes for table `stock_status`
--
ALTER TABLE `stock_status`
  ADD PRIMARY KEY (`stock_status_id`,`language_id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `tax_class`
--
ALTER TABLE `tax_class`
  ADD PRIMARY KEY (`tax_class_id`);

--
-- Indexes for table `tax_rate`
--
ALTER TABLE `tax_rate`
  ADD PRIMARY KEY (`tax_rate_id`);

--
-- Indexes for table `tax_rate_to_customer_group`
--
ALTER TABLE `tax_rate_to_customer_group`
  ADD PRIMARY KEY (`tax_rate_id`,`customer_group_id`);

--
-- Indexes for table `tax_rule`
--
ALTER TABLE `tax_rule`
  ADD PRIMARY KEY (`tax_rule_id`);

--
-- Indexes for table `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`theme_id`);

--
-- Indexes for table `translation`
--
ALTER TABLE `translation`
  ADD PRIMARY KEY (`translation_id`);

--
-- Indexes for table `upload`
--
ALTER TABLE `upload`
  ADD PRIMARY KEY (`upload_id`);

--
-- Indexes for table `url_alias`
--
ALTER TABLE `url_alias`
  ADD PRIMARY KEY (`url_alias_id`),
  ADD KEY `query` (`query`),
  ADD KEY `keyword` (`keyword`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`user_group_id`);

--
-- Indexes for table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indexes for table `zone_to_geo_zone`
--
ALTER TABLE `zone_to_geo_zone`
  ADD PRIMARY KEY (`zone_to_geo_zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api`
--
ALTER TABLE `api`
  MODIFY `api_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `api_ip`
--
ALTER TABLE `api_ip`
  MODIFY `api_ip_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_session`
--
ALTER TABLE `api_session`
  MODIFY `api_session_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `article_image`
--
ALTER TABLE `article_image`
  MODIFY `article_image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute`
--
ALTER TABLE `attribute`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `attribute_group`
--
ALTER TABLE `attribute_group`
  MODIFY `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `banner_image`
--
ALTER TABLE `banner_image`
  MODIFY `banner_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `benefit`
--
ALTER TABLE `benefit`
  MODIFY `benefit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `blog_category`
--
ALTER TABLE `blog_category`
  MODIFY `blog_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_group`
--
ALTER TABLE `customer_group`
  MODIFY `customer_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_history`
--
ALTER TABLE `customer_history`
  MODIFY `customer_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_ip`
--
ALTER TABLE `customer_ip`
  MODIFY `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_login`
--
ALTER TABLE `customer_login`
  MODIFY `customer_login_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_reward`
--
ALTER TABLE `customer_reward`
  MODIFY `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_transaction`
--
ALTER TABLE `customer_transaction`
  MODIFY `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custommenu`
--
ALTER TABLE `custommenu`
  MODIFY `custommenu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `custommenu_child`
--
ALTER TABLE `custommenu_child`
  MODIFY `custommenu_child_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `custom_field`
--
ALTER TABLE `custom_field`
  MODIFY `custom_field_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_field_value`
--
ALTER TABLE `custom_field_value`
  MODIFY `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `download`
--
ALTER TABLE `download`
  MODIFY `download_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extension`
--
ALTER TABLE `extension`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `filter`
--
ALTER TABLE `filter`
  MODIFY `filter_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filter_group`
--
ALTER TABLE `filter_group`
  MODIFY `filter_group_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `geo_zone`
--
ALTER TABLE `geo_zone`
  MODIFY `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `information`
--
ALTER TABLE `information`
  MODIFY `information_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `layout`
--
ALTER TABLE `layout`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `layout_module`
--
ALTER TABLE `layout_module`
  MODIFY `layout_module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT for table `layout_route`
--
ALTER TABLE `layout_route`
  MODIFY `layout_route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `marketing`
--
ALTER TABLE `marketing`
  MODIFY `marketing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `option`
--
ALTER TABLE `option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `option_value`
--
ALTER TABLE `option_value`
  MODIFY `option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_custom_field`
--
ALTER TABLE `order_custom_field`
  MODIFY `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_history`
--
ALTER TABLE `order_history`
  MODIFY `order_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_option`
--
ALTER TABLE `order_option`
  MODIFY `order_option_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `order_product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_total`
--
ALTER TABLE `order_total`
  MODIFY `order_total_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `product_discount`
--
ALTER TABLE `product_discount`
  MODIFY `product_discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=753;

--
-- AUTO_INCREMENT for table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3175;

--
-- AUTO_INCREMENT for table `product_option`
--
ALTER TABLE `product_option`
  MODIFY `product_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=383;

--
-- AUTO_INCREMENT for table `product_option_value`
--
ALTER TABLE `product_option_value`
  MODIFY `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1496;

--
-- AUTO_INCREMENT for table `product_reward`
--
ALTER TABLE `product_reward`
  MODIFY `product_reward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=619;

--
-- AUTO_INCREMENT for table `product_special`
--
ALTER TABLE `product_special`
  MODIFY `product_special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=562;

--
-- AUTO_INCREMENT for table `product_tab`
--
ALTER TABLE `product_tab`
  MODIFY `product_tab_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_article`
--
ALTER TABLE `review_article`
  MODIFY `review_article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3038;

--
-- AUTO_INCREMENT for table `sticker`
--
ALTER TABLE `sticker`
  MODIFY `sticker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `stock_status`
--
ALTER TABLE `stock_status`
  MODIFY `stock_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_class`
--
ALTER TABLE `tax_class`
  MODIFY `tax_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tax_rate`
--
ALTER TABLE `tax_rate`
  MODIFY `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `tax_rule`
--
ALTER TABLE `tax_rule`
  MODIFY `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `theme`
--
ALTER TABLE `theme`
  MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translation`
--
ALTER TABLE `translation`
  MODIFY `translation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `upload`
--
ALTER TABLE `upload`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `url_alias`
--
ALTER TABLE `url_alias`
  MODIFY `url_alias_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1051;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `zone`
--
ALTER TABLE `zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4232;

--
-- AUTO_INCREMENT for table `zone_to_geo_zone`
--
ALTER TABLE `zone_to_geo_zone`
  MODIFY `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
