-- phpMyAdmin SQL Dump
-- version 4.0.10.9
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016-10-11 15:20:59
-- 服务器版本: 5.1.73
-- PHP 版本: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `icgoo-v72`
--

-- --------------------------------------------------------

--
-- 表的结构 `accounts_contact`
--

CREATE TABLE IF NOT EXISTS `accounts_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role_id` varchar(30) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(75) NOT NULL,
  `notes` longtext NOT NULL,
  `create_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `accounts_contact_84566833` (`role_id`),
  KEY `accounts_contact_26b2345e` (`organization_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `accounts_contactorganization`
--

CREATE TABLE IF NOT EXISTS `accounts_contactorganization` (
  `key` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `accounts_contactorganizationrole`
--

CREATE TABLE IF NOT EXISTS `accounts_contactorganizationrole` (
  `key` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `accounts_contactrole`
--

CREATE TABLE IF NOT EXISTS `accounts_contactrole` (
  `key` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `accounts_organization`
--

CREATE TABLE IF NOT EXISTS `accounts_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `type_id` varchar(30) DEFAULT NULL,
  `role_id` varchar(30) DEFAULT NULL,
  `create_date` date NOT NULL,
  `notes` longtext,
  PRIMARY KEY (`id`),
  KEY `accounts_organization_94757cae` (`type_id`),
  KEY `accounts_organization_84566833` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `accounts_phonenumber`
--

CREATE TABLE IF NOT EXISTS `accounts_phonenumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_phonenumber_6d82f13d` (`contact_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `accounts_registercode`
--

CREATE TABLE IF NOT EXISTS `accounts_registercode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `code` varchar(8) NOT NULL,
  `used` tinyint(1) NOT NULL,
  `send_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

--
-- 转存表中的数据 `accounts_registercode`
--

INSERT INTO `accounts_registercode` (`id`, `username`, `code`, `used`, `send_time`) VALUES
(9, '13410320008', 'z3Oy', 1, '2016-01-13 11:25:21'),
(8, '18681468047', 'nCaH', 0, '2016-01-06 17:54:07'),
(7, 'xingsongyan@dzji.com', '0gzv', 0, '2016-01-05 12:00:59'),
(10, '', 'iywE', 0, '2016-09-09 15:26:28'),
(13, 'hezhenzhen@dzji.com', '1Zwd', 1, '2016-03-21 15:49:59'),
(12, '13689546078', 'RqLc', 1, '2016-01-13 15:57:25'),
(14, '18720989420', 'eHvq', 1, '2016-03-28 13:53:03'),
(15, '18617092081', 'r4mY', 1, '2016-06-06 18:09:53'),
(16, 'icgoo', 'BDAy', 0, '2016-09-19 11:05:33'),
(17, 'tanglisha@dzji.com', '7cxm', 0, '2016-07-05 17:37:21'),
(18, '18617092081', 'Lpjy', 1, '2016-09-19 11:10:56'),
(19, '18617092082', 'bJ0I', 0, '2016-09-08 17:59:46'),
(20, '18617092088', 'D37v', 0, '2016-09-13 15:10:13'),
(21, '18671092081', 'wCSv', 0, '2016-09-08 13:30:51'),
(22, '18647092081', 'wVV9', 0, '2016-09-08 13:38:04'),
(23, '15484865441', '8pvT', 0, '2016-09-08 17:22:23'),
(24, '15484865411', 'hVTc', 0, '2016-09-08 17:40:26'),
(25, '18617092087', 'dA0e', 0, '2016-09-08 17:57:59'),
(26, '13689546078', 'QMmv', 1, '2016-09-19 10:44:18'),
(27, '15486248624', 'Kfdd', 0, '2016-09-13 13:41:08'),
(28, '18817092088', 'Yybo', 0, '2016-09-13 15:11:15'),
(29, '13689546078', '4XaS', 1, '2016-09-19 10:48:57'),
(30, '13689546078', 'u9IM', 1, '2016-09-19 11:13:30'),
(31, '13689546078', '5Wjz', 1, '2016-09-19 11:14:40'),
(32, '18617092081', '9kbC', 1, '2016-09-19 13:32:13'),
(33, '18617092081', 'cr0L', 1, '2016-09-19 13:41:11'),
(34, '18617092081', '2gxg', 1, '2016-09-19 14:55:27'),
(35, '18617092081', 'J5ks', 1, '2016-09-19 14:57:15'),
(36, '18617092081', 'dkc0', 1, '2016-09-19 15:01:43'),
(37, '18617092081', 'lk93', 1, '2016-09-19 15:03:27'),
(38, '13923257853', 'Vg46', 1, '2016-09-19 17:01:02'),
(39, '13689546078', 'RdaA', 0, '2016-09-22 11:00:08'),
(40, '13923257853', 'BLPJ', 1, '2016-09-22 16:38:03'),
(41, '18617092081', 'g2Wh', 1, '2016-09-23 13:29:35'),
(42, '18617092081', 'VRGB', 1, '2016-09-23 15:29:50'),
(43, '18617092081', 'LfzY', 1, '2016-09-23 15:36:00'),
(44, '18617092081', 'yNb6', 1, '2016-09-23 15:38:22'),
(45, '18617092081', '0U0d', 1, '2016-09-23 15:40:43'),
(46, '18617092081', 'o1iL', 1, '2016-09-23 15:46:12'),
(47, '13923257853', 'aPJI', 1, '2016-09-28 18:46:04'),
(48, '13923257853', '0WrF', 1, '2016-09-29 16:57:34'),
(49, '13923257853', 'vBs6', 1, '2016-09-30 16:09:47'),
(50, '18617092081', 'i99W', 1, '2016-10-09 09:18:24'),
(51, '18617092081', 'UBHr', 1, '2016-10-09 09:28:23'),
(52, '18617092081', 'Sjxm', 1, '2016-10-09 13:47:56');

-- --------------------------------------------------------

--
-- 表的结构 `accounts_useraddressinfo`
--

CREATE TABLE IF NOT EXISTS `accounts_useraddressinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(200) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `isdefault` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_useraddressinfo_e8701ad4` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `accounts_userextrainfo`
--

CREATE TABLE IF NOT EXISTS `accounts_userextrainfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jy_partner_id` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=134 ;

--
-- 转存表中的数据 `accounts_userextrainfo`
--

INSERT INTO `accounts_userextrainfo` (`id`, `jy_partner_id`, `user_id`) VALUES
(5, '36619', 16),
(4, '24589', 17),
(6, '34759', 18),
(7, '24589', 1),
(8, '29407', 667),
(9, NULL, 666),
(10, NULL, 671),
(11, NULL, 672),
(12, NULL, 673),
(13, NULL, 674),
(14, NULL, 675),
(15, NULL, 669),
(16, NULL, 677),
(17, NULL, 678),
(18, NULL, 679),
(19, NULL, 680),
(20, NULL, 681),
(21, NULL, 682),
(22, '29407', 683),
(23, NULL, 684),
(24, NULL, 685),
(25, NULL, 686),
(26, NULL, 687),
(27, NULL, 15),
(28, NULL, 689),
(29, NULL, 690),
(30, NULL, 691),
(31, NULL, 692),
(32, NULL, 693),
(33, NULL, 19),
(34, NULL, 696),
(35, NULL, 697),
(36, NULL, 698),
(37, NULL, 699),
(38, NULL, 700),
(39, NULL, 701),
(40, NULL, 702),
(41, NULL, 703),
(42, NULL, 704),
(43, NULL, 705),
(44, NULL, 706),
(45, NULL, 707),
(46, NULL, 708),
(47, NULL, 709),
(48, NULL, 710),
(49, NULL, 711),
(50, NULL, 712),
(51, NULL, 713),
(52, NULL, 714),
(53, NULL, 715),
(54, NULL, 716),
(55, NULL, 717),
(56, NULL, 718),
(57, NULL, 719),
(58, NULL, 720),
(59, NULL, 721),
(60, NULL, 722),
(61, NULL, 723),
(62, NULL, 724),
(63, NULL, 725),
(64, NULL, 726),
(65, NULL, 727),
(66, NULL, 728),
(67, NULL, 729),
(68, NULL, 730),
(69, NULL, 731),
(70, NULL, 732),
(71, NULL, 733),
(72, NULL, 734),
(73, NULL, 735),
(74, NULL, 736),
(75, NULL, 737),
(76, NULL, 738),
(77, NULL, 739),
(78, NULL, 740),
(79, NULL, 741),
(80, NULL, 742),
(81, NULL, 743),
(82, NULL, 744),
(83, NULL, 745),
(84, NULL, 746),
(85, NULL, 747),
(86, NULL, 748),
(87, NULL, 749),
(88, NULL, 750),
(89, NULL, 751),
(90, NULL, 752),
(91, NULL, 753),
(92, NULL, 754),
(93, NULL, 755),
(94, NULL, 756),
(95, NULL, 757),
(96, NULL, 758),
(97, NULL, 759),
(98, NULL, 760),
(99, NULL, 761),
(100, NULL, 762),
(101, NULL, 763),
(102, NULL, 764),
(103, NULL, 765),
(104, NULL, 766),
(105, NULL, 767),
(106, NULL, 768),
(107, NULL, 769),
(108, NULL, 770),
(109, NULL, 771),
(110, NULL, 772),
(111, NULL, 773),
(112, NULL, 774),
(113, NULL, 775),
(114, NULL, 776),
(115, NULL, 777),
(116, NULL, 778),
(117, NULL, 779),
(118, NULL, 780),
(119, NULL, 781),
(120, NULL, 782),
(121, NULL, 783),
(122, NULL, 784),
(123, NULL, 785),
(124, NULL, 786),
(125, NULL, 787),
(126, NULL, 788),
(127, NULL, 789),
(128, NULL, 790),
(129, NULL, 791),
(130, NULL, 792),
(131, NULL, 793),
(132, NULL, 794),
(133, NULL, 795);

-- --------------------------------------------------------

--
-- 表的结构 `accounts_userregisterinfo`
--

CREATE TABLE IF NOT EXISTS `accounts_userregisterinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(25) DEFAULT NULL,
  `company_name` varchar(200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `area_code` varchar(10) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `extensionnumber` varchar(10) DEFAULT NULL,
  `file_path` varchar(100) DEFAULT NULL,
  `saler` varchar(20) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `is_changed` tinyint(4) NOT NULL DEFAULT '0',
  `saler_reviewed` tinyint(4) NOT NULL DEFAULT '0',
  `update` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=139 ;

--
-- 转存表中的数据 `accounts_userregisterinfo`
--

INSERT INTO `accounts_userregisterinfo` (`id`, `user_id`, `type`, `company_name`, `phone`, `area_code`, `telephone`, `extensionnumber`, `file_path`, `saler`, `note`, `is_changed`, `saler_reviewed`, `update`) VALUES
(1, 17, 'company', '深圳市凌旭科技有限公司  ', '13689546078', '0755', '1212121', '08', 'C:\\fakepath\\reg.zip', NULL, '这个客户是东哥的', 0, 1, NULL),
(17, 1, 'company', '深圳凌旭科技有限公司', NULL, '', '', '', '合同的上传和下载.psd', NULL, '这个客户是方翔的', 0, 1, NULL),
(18, 678, 'company', '吹牛比公司', '18617092081', '', '', '', NULL, NULL, NULL, 0, 0, NULL),
(19, 19, 'personal', '１１１１１１１１１１１１１１１１１２２２２２２２', '18617092081', '', '', '', NULL, NULL, '备注', 0, 1, NULL),
(20, 18, 'personal', '１２１２１２方式打发啊啊啊啊啊啊啊啊啊啊啊啊啊', '18617092081', '', '', '', NULL, NULL, '备注', 0, 1, NULL),
(21, 16, 'personal', '创新在线发的', '18617092081', '', '', '', NULL, NULL, '备注', 0, 1, NULL),
(22, 15, 'personal', '苹果发的萨芬', '18617092081', '', '', '', NULL, NULL, '备注', 0, 1, NULL),
(23, 683, 'company', '北京创新在线深圳市分公司', '18617092081', '0755', '12121', '8', NULL, NULL, '备注1', 0, 1, 'done'),
(24, 666, 'company', '深圳', '１２３４５', NULL, NULL, NULL, NULL, NULL, '备注', 0, 1, NULL),
(25, 667, 'company', '11111111111111111111111111111', NULL, NULL, NULL, NULL, NULL, NULL, '备注', 0, 1, NULL),
(26, 669, 'company', '华为科技技术有限公司1', '888888', '0755', '12345', '0823', NULL, '吴姣', '备注', 0, 0, NULL),
(27, 21, 'company', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL),
(134, 791, 'company', '深圳华为科技有限公司', '13923257853', '0755', '12345678', '08', '001.png', '芦强', '备注', 0, 1, NULL),
(135, 792, 'personal', '186170988', '18617092088', '', '', '', '', NULL, NULL, 0, 0, 'no'),
(136, 793, 'personal', '186170988', '18617092087', '', '', '', '', NULL, NULL, 0, 0, 'no'),
(137, 794, 'personal', '186170988', '18617092086', '', '', '', '', NULL, NULL, 0, 0, 'no'),
(138, 795, 'personal', '', '18617092080', '', '', '', '', '王姗姗', NULL, 0, 0, 'no');

-- --------------------------------------------------------

--
-- 表的结构 `ad_ad`
--

CREATE TABLE IF NOT EXISTS `ad_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `ad_ad`
--

INSERT INTO `ad_ad` (`id`, `url`, `title`, `content`) VALUES
(2, '11', '今天刮台风了！', '<p style="text-indent:2em;"><span style="font-size:24px;">喜大普奔！！<strong><span style="color:#337FE5;">经典</span></strong></span>卷土重来！还在为经典芯片的逝去感到不便和伤怀吗？还在为从前的辉煌淋涕落泪吗？？<span style="font-size:24px;">Rochester带领经典王者归来！</span></p><p style="text-indent:2em;"><span style="font-size:18px;">近期，Rochester带领经典芯片<span style="color:#E53333;"><strong>TMS320、ADSP-2100、MC68020</strong></span>和<strong><span style="color:#E53333;">MC68040</span></strong>重出江湖，看廉颇虽老，宝刀依旧削铁如泥！</span></p><p style="text-indent:2em;"><span style="font-size:18px;"><span style="font-size:14px;"></span><br/></span></p><p style="text-indent:2em;">\r\n	据悉，罗彻斯特电子新获得原厂授权生产TI和ADI停产的DSP和Motorola的经典32位MCU。作为罗彻斯特电子中国区首家也是最具实力的授权代理商：ICGOO在线商城，为您提供最优质的订货服务，详情请咨询全国销售热线：400-660-6568。</p><p style="text-indent:2em;"><br/></p><p style="text-indent:2em;">\r\n	罗彻斯特电子有限公司创建于1981年，总部位于美国，在亚洲有上海、新加坡和日本3个办事处。是全球唯一一家提供授权停产元器件的制造商，生产超过\r\n20000种原厂已停产的半导体元器件；拥有超过100亿的晶圆祼片和超过50亿的原厂现货库存，为客户提供停产元器件产品的“后市场”服务的制造商。</p><p style="text-indent:2em;"><br/></p><p style="text-align:center;text-indent:2em;"><img src="http://www.etime.net.cn/upload/news/image/20160614/20160614162909_17537.jpg" alt=""/></p><p style="text-align:center;text-indent:2em;"><br/></p><p style="text-indent:2em;">\r\n	此次罗彻斯特电子获得德州仪器（TI）和ADI授权，可持续支持生产以延长TI和ADI的数位讯号处理器（DSP）系列在指定设备上的产品生命周期。</p><p style="text-align:center;text-indent:2em;"><img src="http://www.etime.net.cn/upload/news/image/20160614/20160614162931_88040.png" alt=""/></p><p><br/></p>'),
(3, '12', '撒地方', '<p style="TEXT-INDENT: 2em">今年是贯彻习近平主席改革强军战略，推动国防和军队改革向纵深发展的关键之年，是新体制下推动\r\n部队全面建设和军事斗争准备深入发展的开局之年。习主席告诫全军，“新军事革命为我们提供了千载难逢的机遇，我们必须到中流击水，不改不行，改慢了也不\r\n行。这是我们回避不了的一场大考，军队一定要向党和人民、向历史交出一份合格答卷”。</p><p style="TEXT-INDENT: 2em">在中国人民解放军建军89周年之际，央视推出系列报道《强军之路》,为您揭示党的十八大以来，\r\n我军如何聚焦强军目标，围绕政治建军、改革强军、依法治军，开启强军兴军的新征程。今天为您播出第一集《立根固本筑牢改革强军的“魂”》。89年来人民军\r\n队百折不挠、从胜利走向胜利，一条颠扑不破的真理就是——坚定不移听党话、跟党走，是我军的军魂，永远不能变，永远不能丢。面对今天改革强军的召唤，全军\r\n官兵把坚决听党指挥、绝对忠诚可靠作为最高行为准则，沿着中国特色强军之路阔步前行。</p><p style="TEXT-INDENT: 2em">1927年9月，江西永新一个名叫三湾的小村庄，见证了刚刚诞生不久的人民军队的脱胎换骨。永载史册的“三湾改编”，留下了“党指挥枪”“支部建在连上”等开天辟地的治军方略。</p><p style="text-align:center;"><img alt="贯彻习近平主席改革强军战略 立根固本铸牢改革强军之魂" src="http://inews.gtimg.com/newsapp_bt/0/453631025/640" height="300" width="400"/></p><p><br/></p>'),
(4, 'clause', 'ICGOO相关服务条款', '<style type="text/css">body{\r\n    -moz-user-select: none;\r\n    -webkit-user-select: none;\r\n    -ms-user-select: none;\r\n    -khtml-user-select: none;\r\n    user-select: none; \r\n  }\r\n  h3{font-family:simsun}\r\n  .header{min-height:0}\r\n  .container{margin-bottom:70px}</style><p style="margin-bottom: 0;line-height: 150%;orphans: 2;widows: 2"><span style="font-size: 12px;font-size:12px">欢迎来到</span><span style="font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span><span style="font-size: 12px;font-size:12px">商城！感谢您对</span><span style="font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span><span style="font-size: 12px;font-size:12px">商城的信任和支持！</span></p><p style="margin-bottom: 0;line-height: 150%;orphans: 2;widows: 2"><span style="font-size: 16px;font-size:16px"><span style="color: rgb(0, 0, 0); font-size: 12px;">本协议详述您在</span><span style="font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span><span style="font-size: 12px;">商城（网址：</span><span style="font-family: 宋体,SimSun; font-size: 12px;">www.icgoo.net</span><span style="font-size: 12px;">）使用我们的服务所须遵守的条款和条件</span><span style="font-size: 12px;font-size:12px">。 </span><span style="color: rgb(0, 0, 0); font-size: 12px;">请您仔细阅读本注册协议，您点击</span></span><span style="font-family:Calibri, sans-serif"><span style="font-size: 16px;font-size:16px"><span style="color: rgb(0, 0, 0); font-family: 宋体,SimSun; font-size: 12px;">&quot;</span><span style="font-size: 12px;font-size:12px">同意</span></span><span style="font-family: 宋体,SimSun; font-size: 12px;">&quot;</span><span style="font-size: 12px;">按钮后，本协议即构成对双方有约束力的法律文件。</span></span></p><p style="margin-bottom: 0;line-height: 150%;orphans: 2;widows: 2"><span style="color: rgb(255, 0, 0); font-size: 12px;">一、接受条款</span></p><p style="margin-bottom: 0;line-height: 150%;orphans: 2;widows: 2"><span style="font-family: 宋体,SimSun; font-size: 12px;">1.</span><span style="font-size: 12px;">本协议内容包括协议正文及所有</span><span style="font-family:Calibri, sans-serif"><span style="font-size: 16px;font-size:16px"><span style="color: rgb(0, 0, 0); font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span><span style="font-size: 12px;font-size:12px">商城</span></span><span style="font-size: 12px;font-size:12px">已经发布或将来可能发布的各类规则。所有规则为协议不可分割的一部分，与协议正文具有同等法律效力。</span></span></p><p style="margin-bottom: 0;line-height: 150%;orphans: 2;widows: 2"><span style="font-family: 宋体,SimSun; font-size: 12px;">2.</span><span style="font-size: 12px;">以任何方式进入</span><span style="font-family:Calibri, sans-serif"><span style="font-size: 16px;font-size:16px"><span style="color: rgb(0, 0, 0); font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span><span style="font-size: 12px;font-size:12px">商城</span></span><span style="font-size: 12px;font-size:12px">并使用服务即表示您已经阅读、同意并接受本用户协议和隐私声明中所含的所有条款和条件</span><span style="font-family: 宋体,SimSun; font-size: 12px;">(</span></span><span style="font-size: 12px;">以下合称“条款”</span><span style="font-family: 宋体,SimSun; font-size: 12px;">)</span><span style="font-size: 12px;">，并表示您已与北京创新在线电子产品销售有限公司签订了该服务条款协议</span><span style="font-family: 宋体,SimSun; font-size: 12px;">.</span></p><p style="margin-bottom: 0;line-height: 150%;orphans: 2;widows: 2"><span style="font-family: Calibri,sans-serif; font-size: 16px;"><span style="font-family: 宋体,SimSun; font-size: 12px;">3.</span><span style="color: rgb(0, 0, 0); font-family: 宋体,SimSun; font-size: 12px;"> ICGOO</span></span><span style="font-size: 16px;font-size:16px"><span style="color: rgb(0, 0, 0); font-size: 12px;">商城可随时自行全权决定更改本条款内容，</span><span style="font-size: 12px;font-size:12px">并以网站公告的形式进行更新，所有协议内容在发布之日后自动生效。如您不同意该修订，您必须终止您与</span></span><span style="font-family:Calibri, sans-serif"><span style="font-size: 16px;font-size:16px"><span style="color: rgb(0, 0, 0); font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span><span style="font-size: 12px;font-size:12px">商城</span></span><span style="font-size: 12px;font-size:12px">的用户关系。如您继续使用本站服务，则将视为您已接受经修订的“条款”，当您与</span><span style="font-size: 16px;font-size:16px"><span style="color: rgb(0, 0, 0); font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span><span style="font-size: 12px;font-size:12px">商城</span></span><span style="font-size: 12px;font-size:12px">发生争议时，应以最新的“条款”为准。</span></span></p><p style="margin-bottom: 0;line-height: 150%;orphans: 2;widows: 2"><span style="font-family: Calibri,sans-serif; font-size: 16px;"><span style="font-family: 宋体,SimSun; font-size: 12px;">4. </span><span style="color: rgb(0, 0, 0); font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span></span><span style="font-size: 16px;font-size:16px"><span style="color: rgb(0, 0, 0); font-size: 12px;">商城</span><span style="font-size: 12px;font-size:12px">有权利通过包括终止账户、禁止此用户再次注册或法律诉讼等方式执行本用户协议，如您对协议中的内容有疑问，请联系我们。 &nbsp; </span></span></p><p style="margin-bottom: 0;line-height: 150%;orphans: 2;widows: 2"><span style="color: rgb(255, 0, 0); font-size: 12px;">二、用户注册</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-family: 宋体,SimSun; font-size: 12px;">1.</span><span style="font-size: 12px;font-size:12px">用户资格： </span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-size: 12px;font-size:12px">本网站只接受</span><span style="font-family: 宋体,SimSun; font-size: 12px;">18</span><span style="font-size: 12px;font-size:12px">周岁以上用户，用户应当是具备完全民事权利能力和与所从事的民事行为相适应的行为能力的自然人、法人或其他组织。如您不合资格，请不要使用我们的服务，否则您及您的监护人应承担因此而导致的一切后果。如您代表公司或其他法律主体在</span><span style="font-family:Calibri, sans-serif"><span style="color: rgb(0, 0, 0); font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span><span style="font-size: 12px;font-size:12px">商城</span></span><span style="font-size: 12px;font-size:12px">网站登记，则您声明和保证，您有权使该公司或该法律主体受本协议“条款”的约束。 </span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-family: 宋体,SimSun; font-size: 12px;">2.</span><span style="font-size: 12px;font-size:12px">资料填写： </span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-size: 12px;font-size:12px">为确保交易的正常进行，用户向</span><span style="font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span><span style="font-size: 12px;font-size:12px">商城供真实、有效的个人资料，如个人资料有任何变动，必须及时通知</span><span style="font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span><span style="font-size: 12px;font-size:12px">商城更新。 </span><span style="font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span><span style="font-size: 12px;font-size:12px">商城拥有通过邮件、短信电话等形式，向在本站注册、购物用户、收货人发送订单信息、促销活动等告知信息的权利。</span></p><p style="margin-bottom: 0;line-height: 150%;orphans: 2;widows: 2"><span style="color: rgb(255, 0, 0); font-size: 12px;">三、 隐私保护</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span><span style="font-size: 12px;font-size:12px">商城设有适用于所有用户并纳入用户协议的隐私声明。您应当在注册时阅读并接受隐私声明以使用</span><span style="font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span><span style="font-size: 12px;font-size:12px">商城网站，且您在作为</span><span style="font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span><span style="font-size: 12px;font-size:12px">商城用户期间将继续受其规定（及</span><span style="font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span><span style="font-size: 12px;font-size:12px">商城对隐私声明作出的任何修订）的约束。 </span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-family: 宋体,SimSun; font-size: 12px;">1.</span><span style="font-size: 12px;font-size:12px">个人数据资料</span><span style="font-family: 宋体,SimSun; font-size: 12px;">,</span><span style="font-size: 12px;font-size:12px">真实姓名、地址、电子邮箱和联系电话等用户信息，订货信息、收货信息、汇款信息、开票信息等交易信息。在未经您同意之前，</span><span style="font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span><span style="font-size: 12px;font-size:12px">商城不会将您的任何信息用于其它目的。</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-family: 宋体,SimSun; font-size: 12px;">2.</span><span style="font-size: 12px;font-size:12px">当政府司法机关依照法定程序要求本网站披露个人资料时，我们将根据执法单位之要求或为公共安全之目的提供个人资料。在此情况下之任何披露，</span><span style="font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span><span style="font-size: 12px;font-size:12px">不承担任何责任。</span></p><p style="margin-bottom: 0;line-height: 150%;orphans: 2;widows: 2"><span style="color: rgb(255, 0, 0); font-size: 12px;">四、商品信息</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span><span style="font-size: 12px;font-size:12px">商城将尽可能地保证所有的信息及数据真实、有效，如遇厂商价格调整及供货数量变化， </span><span style="font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span><span style="font-size: 12px;font-size:12px">将有权利单方面修改本网站上显示的信息及价格。由于网站上商品信息的数量极其庞大，虽然本站会尽最大努力保证您所浏览商品信息的准确性,但由于众所周知的互联网技术因素等客观原因存在，本站网页显示的信息可能会有一定的滞后性或差错，对此情形希望您知悉并理解。</span></p><p style="margin-bottom: 0;line-height: 150%;orphans: 2;widows: 2"><span style="color: rgb(255, 0, 0); font-size: 12px;">五、用户使用</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-family: 宋体,SimSun; font-size: 12px;">1. ICGOO</span><span style="font-size: 12px;font-size:12px">商城可为您提供大量的库存信息，您只需通过型号查询功能，即可获得如</span><span style="font-family: 宋体,SimSun; font-size: 12px;">&quot;</span><span style="font-size: 12px;font-size:12px">厂商、批号、数量、价格、 货期</span><span style="font-family: 宋体,SimSun; font-size: 12px;">&quot;</span><span style="font-size: 12px;font-size:12px">等信息。但您必须保证合理使用所得的任何数据信息，不得作为与</span><span style="font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span><span style="font-size: 12px;font-size:12px">商城有竞争关系的同行业网站的数据来源。</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-family: 宋体,SimSun; font-size: 12px;">2.</span><span style="font-size: 12px;font-size:12px">询价： </span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-size: 12px;font-size:12px">在您询价操作时，请您仔细填写您所购商品的名称、数量、型号、交货方式、期望交期等信息，如您所填信息不完整，</span><span style="font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span><span style="font-size: 12px;font-size:12px">商城无法反馈有效的报价单，</span><span style="font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span><span style="font-size: 12px;font-size:12px">商城将不承担任何责任；</span><span style="font-family: 宋体,SimSun; font-size: 12px;">ICGOO</span><span style="font-size: 12px;font-size:12px">商城所反馈的报价单，仅供您做购买决策参考依据，由于市场变化及各种以合理商业难以控制的因素的影响，本站无法保证您所购买的商品与最终购买价格一致（报价单的有效期限为一天）。</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-size: 12px;font-size:12px">为一天）。</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-size: 12px; font-family: 宋体,SimSun;">3.</span><span style="font-size: 12px;font-size:12px">订单：</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-size: 12px;font-size:12px">在您下订单时，请您仔细确认所购商品的名称、价格、数量、型号、规格、尺寸、货期、交货方式、期望交期、联系地址、电话、收货人等信息。当您收到</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">I CGOO</span></span><span style="font-size: 12px;font-size:12px">商城正式确认的合同后，则合同关系已经生效，客户必须可获得</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">I CGOO</span></span><span style="font-size: 12px;font-size:12px">商城书面同意的情况下方可取消</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城已接受的订单，否则视为违约，则您须像</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">I CGOO</span></span><span style="font-size: 12px;font-size:12px">商城支付合理的取消费或补货费（涵盖</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">I CGOO</span></span><span style="font-size: 12px;font-size:12px">商城发生的一切费用及作出的承诺）。您在与</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城达成采购协议后，需要及时预付全款，</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城在收到您的汇款后，订单即刻生效。</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-size: 12px; font-family: 宋体,SimSun;">4.</span><span style="font-size: 12px;font-size:12px">支付</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-size: 12px;font-size:12px">客户应于产品装运前就货款、运费、包装费、保险费及其他费用（如有）根据</span><span style="font-family:Calibri, sans-serif"><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span></span><span style="font-size: 12px;font-size:12px">商城的要求，采用电汇或其他电子资金转账方式付至</span><span style="font-family:Calibri, sans-serif"><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span></span><span style="font-size: 12px;font-size:12px">商城的银行账户，从而进行预付。客户下订单之后，</span><span style="font-family:Calibri, sans-serif"><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span></span><span style="font-size: 12px;font-size:12px">商城将以电子邮件方式向客户发送形式发送合同，其中包含</span><span style="font-family:Calibri, sans-serif"><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span></span><span style="font-size: 12px;font-size:12px">商城的银行信息和产品总价。</span><span style="font-family:Calibri, sans-serif"><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span></span><span style="font-size: 12px;font-size:12px">商城将为客户的预付订单保留产品存货</span><span style="font-family:Calibri, sans-serif"><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">24</span></span></span><span style="font-size: 12px;font-size:12px">小时，待确认收到资金。如未收到资金，则客户的预付订单将在</span><span style="font-family:Calibri, sans-serif"><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">1</span></span></span><span style="font-size: 12px;font-size:12px">个工作日后被取消。电汇或电子资金转账支付所产生的所有银行收费将由客户承担。</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-size: 12px;font-size:12px">所有订单均应经</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城进行信用批准，</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城可试具体情况对客户的信用条款进行变更，经审核的高信用用户可申请升级为月结用户。</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-size: 12px;font-size:12px">增值税和相关税收或其他收费适用于所有与</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城订立的订单，并且这些税收全部由客户承担，其包含在</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城向客户开具的发票中。</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-size: 12px; font-family: 宋体,SimSun;">5.</span><span style="font-size: 12px;font-size:12px">配送</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城中提供的交货时间，是指从订单确定之后起，在正常的库存状况下，按照常规的发货，收货流程而所需花费的时间，仅供参考，不作为您确定到货具体时间的依据。</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城尽可能为您提供较为准确的发货信息，如遇如下情况造成订单延迟或无法配送等，</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城不承担延迟配送的责任：</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-size: 12px;font-size:12px">（</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">1</span></span><span style="font-size: 12px;font-size:12px">）用户提供的信息错误、地址不详细等原因导致的；</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-size: 12px;font-size:12px">（</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">2</span></span><span style="font-size: 12px;font-size:12px">）货物送达后无人签收，导致无法配送或延迟配送的；</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-size: 12px;font-size:12px">（</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">3</span></span><span style="font-size: 12px;font-size:12px">）厂家生产周期推迟；</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-size: 12px;font-size:12px">（</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">4</span></span><span style="font-size: 12px;font-size:12px">）不可抗力因素导致的，例如：自然灾害、交通戒严、突发战争等。</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城按照生效订单约定，发货至指定的收货地址与收货人。如客户希望变更生效订单中的收货地点和收货人，应当提前 </span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">1 </span></span><span style="font-size: 12px;font-size:12px">日向</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城申请，同时客户需承担由此产生的一切费用，并承担因此而导致迟延交货的风险、损失和责任。</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">6.</span></span><span style="font-size: 12px;font-size:12px">包装</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-size: 12px;font-size:12px">除客户在订单中对产品包装有特别指定外，</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城提供适合产品运输和储存要求的有效原包装状态向客户发货。</span></p><p style="margin-bottom: 0;line-height: 150%;orphans: 2;widows: 2"><span style="color:#ff0000"><span style="font-size: 13px;font-size:12px">六、售后服务与质量保证</span></span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">1.</span></span><span style="font-size: 12px;font-size:12px">详见售后服务</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">2.</span></span><span style="font-size: 12px;font-size:12px">质量保证 </span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城与您签订的采购协议，即已达成货品质量保证的承诺。请您务必在收到货后的一周之内完成收货、验货。 若有质量问题，请您在</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">30</span></span><span style="font-size: 12px;font-size:12px">天内出示由权威机构得出的检测报告或提交使用检测反馈报告，经</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城与供货商或原厂确认， 并认定存在质量问题，</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城会协助您完成退货或者换货。若您在</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">30</span></span><span style="font-size: 12px;font-size:12px">天内对产品质量无任何异议，将默认为产品质量符合您的使用要求。</span></p><p style="margin-bottom: 0;line-height: 150%;orphans: 2;widows: 2"><span style="color:#ff0000"><span style="font-size: 13px;font-size:12px">七、服务终止</span></span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城有权根据自己的判断对您提出服务终止，而不需要事先通知您。如：您未及时与</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">客服人员确认订单；您未及时提供汇款信息等。</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城的数据发生变更，如：产品停产、产品禁运、库存数量减少，价格提高等情况，即便在与您签订采购协议后，也可根据当前情况的变化而做出服务终止的决定。</span></p><p style="margin-bottom: 0;line-height: 150%;orphans: 2;widows: 2"><span style="color:#ff0000"><span style="font-size: 13px;font-size:12px">八、知识产权声明</span></span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城上所有的数据信息、图片、文字、标识，均属深圳市创新恒远科技有限公司所有。未经本网站同意， 您不得将本网站的所有信息以任何方式展示、使用或作其他处理，也不得向他人表明您有权展示、使用或其他有权处理本网站所有信息的行为。</span></p><p style="margin-bottom: 0;line-height: 150%;orphans: 2;widows: 2"><span style="color: rgb(255, 0, 0); font-size: 12px;">九、免责声明</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">1.</span></span><span style="font-size: 12px;font-size:12px">由于用户将个人密码告知他人或与他人共享注册账户，由此导致的任何个人资料泄露，</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城不负任何责任。</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">2.</span></span><span style="font-size: 12px;font-size:12px">虽然</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城致力于给用户更好的使用体验，有义务确保网站的正常运行，但访问者应在使用网站服务时自行承担风险，</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城不做任何形式的保证，不保证网站内容满足用户的要求，不保证网站服务不中断。因网络状况、通信线路等任何技术原因而导致用户不能正常访问</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城或有关的信息、记录等丢失， </span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城不承担任何法律责任。</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">3.</span></span><span style="font-size: 12px;font-size:12px">任何由于黑客攻击、计算机病毒侵人或发作、因政府管制而造成的暂时性关闭等影响网络正常经营的不可抗力而造成的个人资料泄露、丢失、被盗用或被窜改等，</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城不负任何责任。</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">4. </span></span><span style="font-size: 12px;font-size:12px">本网站之声明以及其修改权、更新权及最终解释权均属北京创新在线电子产品销售有限公司所有。</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-size: 12px;font-size:12px;color: rgb(255, 0, 0);">十、其它</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-size: 12px;font-size:12px">本协议在所有方面均受中华人民共和国法律管辖。本网站所有用户均不可撤销地受</span><span style="font-family:宋体, SimSun"><span style="font-size: 12px;font-size:12px">ICGOO</span></span><span style="font-size: 12px;font-size:12px">商城持有人所在地的法院及上级法</span></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-size: 12px;font-size:12px"></span></p><style type="text/css">p { margin-bottom: 0.25cm; direction: ltr; color: rgb(0, 0, 0); line-height: 120%; text-align: justify; }p.western { font-family: "Calibri",sans-serif; font-size: 10pt; }p.cjk { font-family: "宋体","SimSun"; font-size: 10pt; }p.ctl { font-family: "Calibri",sans-serif; font-size: 12pt; }</style><p style="margin-bottom: 0;line-height: 150%"><span style="font-size: 12px;font-size:12px">院的管辖。本协议的规定是可分割的，如本协议任何规定被裁定为无效或不可执行，该规定可被删除而其余条款应予以执行。</span><br/></p><p style="margin-bottom: 0;line-height: 150%"><span style="font-size: 12px;font-size:12px"></span></p><style type="text/css">p { margin-bottom: 0.25cm; direction: ltr; color: rgb(0, 0, 0); line-height: 120%; text-align: justify; }p.western { font-family: "Calibri",sans-serif; font-size: 10pt; }p.cjk { font-family: "宋体","SimSun"; font-size: 10pt; }p.ctl { font-family: "Calibri",sans-serif; font-size: 12pt; }</style><p style="text-align: right;"><span style="display:inline-block;width:80px;height:30px;line-height:30px;background:#c00;color:#fff;text-align:center;font-size:12px;font-family:simsun;cursor:pointer" onclick="javascript:window.close();">关闭本页</span></p>');

-- --------------------------------------------------------

--
-- 表的结构 `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=127 ;

--
-- 转存表中的数据 `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add web config', 7, 'add_webconfig'),
(20, 'Can change web config', 7, 'change_webconfig'),
(21, 'Can delete web config', 7, 'delete_webconfig'),
(102, 'Can delete weixin user', 34, 'delete_weixinuser'),
(101, 'Can change weixin user', 34, 'change_weixinuser'),
(100, 'Can add weixin user', 34, 'add_weixinuser'),
(25, 'Can add shopping cart', 9, 'add_shoppingcart'),
(26, 'Can change shopping cart', 9, 'change_shoppingcart'),
(27, 'Can delete shopping cart', 9, 'delete_shoppingcart'),
(28, 'Can add supplier', 10, 'add_supplier'),
(29, 'Can change supplier', 10, 'change_supplier'),
(30, 'Can delete supplier', 10, 'delete_supplier'),
(31, 'Can add pictures', 11, 'add_pictures'),
(32, 'Can change pictures', 11, 'change_pictures'),
(33, 'Can delete pictures', 11, 'delete_pictures'),
(107, 'Can change long setting', 36, 'change_longsetting'),
(106, 'Can add long setting', 36, 'add_longsetting'),
(105, 'Can delete setting', 35, 'delete_setting'),
(104, 'Can change setting', 35, 'change_setting'),
(103, 'Can add setting', 35, 'add_setting'),
(44, 'Can change captcha store', 15, 'change_captchastore'),
(43, 'Can add captcha store', 15, 'add_captchastore'),
(45, 'Can delete captcha store', 15, 'delete_captchastore'),
(46, 'Can add site', 16, 'add_site'),
(47, 'Can change site', 16, 'change_site'),
(48, 'Can delete site', 16, 'delete_site'),
(49, 'Can add pictures', 17, 'add_pictures'),
(50, 'Can change pictures', 17, 'change_pictures'),
(51, 'Can delete pictures', 17, 'delete_pictures'),
(52, 'Can add keys', 18, 'add_keys'),
(53, 'Can change keys', 18, 'change_keys'),
(54, 'Can delete keys', 18, 'delete_keys'),
(55, 'Can add supplier', 19, 'add_supplier'),
(56, 'Can change supplier', 19, 'change_supplier'),
(57, 'Can delete supplier', 19, 'delete_supplier'),
(58, 'Can add product', 20, 'add_product'),
(59, 'Can change product', 20, 'change_product'),
(60, 'Can delete product', 20, 'delete_product'),
(61, 'Can add history info base', 21, 'add_historyinfobase'),
(62, 'Can change history info base', 21, 'change_historyinfobase'),
(63, 'Can delete history info base', 21, 'delete_historyinfobase'),
(64, 'Can add history info change', 22, 'add_historyinfochange'),
(65, 'Can change history info change', 22, 'change_historyinfochange'),
(66, 'Can delete history info change', 22, 'delete_historyinfochange'),
(67, 'Can add collection', 23, 'add_collection'),
(68, 'Can change collection', 23, 'change_collection'),
(69, 'Can delete collection', 23, 'delete_collection'),
(70, 'Can add EtimeNewsCate', 24, 'add_etimenewscate'),
(71, 'Can change EtimeNewsCate', 24, 'change_etimenewscate'),
(72, 'Can delete EtimeNewsCate', 24, 'delete_etimenewscate'),
(73, 'Can add EtimeNews', 25, 'add_etimenews'),
(74, 'Can change EtimeNews', 25, 'change_etimenews'),
(75, 'Can delete EtimeNews', 25, 'delete_etimenews'),
(76, 'Can add picture', 26, 'add_picture'),
(77, 'Can change picture', 26, 'change_picture'),
(78, 'Can delete picture', 26, 'delete_picture'),
(79, 'Can add AnchorText', 27, 'add_anchortext'),
(80, 'Can change AnchorText', 27, 'change_anchortext'),
(81, 'Can delete AnchorText', 27, 'delete_anchortext'),
(82, 'Can add contact role', 28, 'add_contactrole'),
(83, 'Can change contact role', 28, 'change_contactrole'),
(84, 'Can delete contact role', 28, 'delete_contactrole'),
(85, 'Can add contact organization', 29, 'add_contactorganization'),
(86, 'Can change contact organization', 29, 'change_contactorganization'),
(87, 'Can delete contact organization', 29, 'delete_contactorganization'),
(88, 'Can add contact organization role', 30, 'add_contactorganizationrole'),
(89, 'Can change contact organization role', 30, 'change_contactorganizationrole'),
(90, 'Can delete contact organization role', 30, 'delete_contactorganizationrole'),
(91, 'Can add organization', 31, 'add_organization'),
(92, 'Can change organization', 31, 'change_organization'),
(93, 'Can delete organization', 31, 'delete_organization'),
(94, 'Can add contact', 32, 'add_contact'),
(95, 'Can change contact', 32, 'change_contact'),
(96, 'Can delete contact', 32, 'delete_contact'),
(97, 'Can add phone number', 33, 'add_phonenumber'),
(98, 'Can change phone number', 33, 'change_phonenumber'),
(99, 'Can delete phone number', 33, 'delete_phonenumber'),
(108, 'Can delete long setting', 36, 'delete_longsetting'),
(109, 'Can add register code', 37, 'add_registercode'),
(110, 'Can change register code', 37, 'change_registercode'),
(111, 'Can delete register code', 37, 'delete_registercode'),
(112, 'Can add user extra info', 38, 'add_userextrainfo'),
(113, 'Can change user extra info', 38, 'change_userextrainfo'),
(114, 'Can delete user extra info', 38, 'delete_userextrainfo'),
(115, 'Can add user address info', 39, 'add_useraddressinfo'),
(116, 'Can change user address info', 39, 'change_useraddressinfo'),
(117, 'Can delete user address info', 39, 'delete_useraddressinfo'),
(118, 'Can add descript', 40, 'add_descript'),
(119, 'Can change descript', 40, 'change_descript'),
(120, 'Can delete descript', 40, 'delete_descript'),
(121, 'Can add user register info', 43, 'add_userregisterinfo'),
(122, 'Can change user register info', 43, 'change_userregisterinfo'),
(123, 'Can delete user register info', 43, 'delete_userregisterinfo'),
(124, 'Can add ad', 42, 'add_ad'),
(125, 'Can change ad', 42, 'change_ad'),
(126, 'Can delete ad', 42, 'delete_ad');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=796 ;

--
-- 转存表中的数据 `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(669, 'pbkdf2_sha256$20000$tNGjN34BbbBk$MTb7uvRjYPZ0+NEVQxNr6WwhRVuyRbbG6GquEBPTdZc=', NULL, 1, 'icgooa', '梁', '                            朝伟', '1234@qq.com', 0, 0, '2016-06-07 00:00:00'),
(16, 'pbkdf2_sha256$20000$LlcUJYf2YtxW$6FZxzeGETlTe///HbqfhDjsyzy+KgSzTBC/Y3clbJO0=', '2016-06-27 09:20:46', 1, '13410320008', '刘', '  德华', '1234567891@qq.com', 0, 1, '2016-01-13 11:25:21'),
(15, 'pbkdf2_sha256$20000$3PCVtUl3x38M$7nyxJGg3mZ8mN1NM2SHbvcsz4QTSk4i2/3Nl4RS6dl4=', '2016-01-06 14:52:48', 0, 'xingsongyan@dzji.com', '刘', '  sdfsdf龙华', '', 0, 1, '2016-01-05 10:28:00'),
(17, 'pbkdf2_sha256$20000$SQZ36dTUeHa9$caBc5e3jEuKFWTrC10Yw3M0IjzW8q9Wwk9bYD/qUfR4=', '2016-10-11 14:00:09', 0, '13689546078', 's', '       dfsdf', '', 0, 1, '2016-01-13 15:57:25'),
(18, 'pbkdf2_sha256$20000$YPxN5ixWFLWH$DmXAtkjuQngxvdUtY/YbdQS+99fNiZi9FOz9EGImjVI=', '2016-03-22 11:25:44', 0, 'hezhenzhen@dzji.com', '２', '    ３２３２３fsdf', '', 0, 1, '2016-03-21 15:49:59'),
(19, 'pbkdf2_sha256$20000$nvU0JG4jJVHD$IaydITy34xmJUajVHQBWi9kQFkF42UpyB5s84Telraw=', NULL, 0, 'test1', 'f', '  dsf', '', 0, 1, '2016-03-21 17:06:10'),
(666, 'aa', NULL, 0, 'test3', 'd', '  ssd233', '', 0, 1, '2016-03-21 17:27:55'),
(667, 'pbkdf2_sha256$20000$tuoxVk1RgacV$imql15gpf4iRGwEweUMIub6UN6EdDIGeiuKTyERDaz4=', '2016-06-17 15:07:15', 0, '18720989420', 'd', ' sfdsf', '', 0, 1, '2016-03-28 13:53:03'),
(683, 'pbkdf2_sha256$20000$R4a7L21Rm296$I/1HjL4jmJyPqk58fxUWbIktkIIdEBJXdGO1CPJ+u/Q=', '2016-10-09 16:30:25', 0, '18617092081', 's', '  df sdf', 'liulonghua@dzji.com', 0, 1, '2016-09-23 15:46:12'),
(1, 'pbkdf2_sha256$20000$FMGZoBND9hd8$bBwLeiOA1FYp5E5pq9SyacQB4eBpuufNzZlVGdiFb4U=', '2016-10-11 11:02:16', 1, 'icgoo', '李', '小姐', '', 1, 1, '2016-06-07 14:02:00'),
(792, 'pbkdf2_sha256$20000$bIXAULXoy8yD$7NnamZ89XtTNp9fxeLIXKP81cfZ+5NxXOV/U9Lnm6eY=', NULL, 0, '18617092088', 'Allen', 'Zhang', '', 0, 0, '2016-10-10 15:45:21'),
(791, 'pbkdf2_sha256$20000$PPUYirMffg5I$Qcpu7p677/JHIgrRLaS6/rMLVFHJfnGtjVrBqFJTrmg=', NULL, 0, '13923257853', '张', '    学友', '123456@qq.com', 0, 0, '2016-09-30 16:09:47'),
(793, 'pbkdf2_sha256$20000$8mwjyFBkQKku$N4ydxDz4NvyO+m+kdEAE6pzQWij/WCvi6xI+8PUbQ6A=', NULL, 0, '18617092087', 'Allen', 'Zhang', '', 0, 0, '2016-10-10 15:46:46'),
(794, 'pbkdf2_sha256$20000$AiOuVe6zfCvZ$i6d85PiEy1vNszcz1QxUhirBP95VzcpeRLeTSrVrHPg=', NULL, 0, '18617092086', 'Allen', 'Zhang', '', 0, 0, '2016-10-10 15:58:05'),
(795, 'pbkdf2_sha256$20000$fO06E6Hz10io$L7FSlGKROkz969tfFkLDu41hqmcFOHAlimY5aXPkeQM=', NULL, 0, '18617092080', 'Allen', 'Zhang', '', 0, 0, '2016-10-10 15:59:05');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=289 ;

--
-- 转存表中的数据 `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(192, 669, 108),
(191, 669, 107),
(190, 669, 106),
(189, 669, 105),
(188, 669, 104),
(187, 669, 103),
(186, 669, 102),
(185, 669, 101),
(184, 669, 100),
(183, 669, 99),
(182, 669, 98),
(181, 669, 97),
(180, 669, 96),
(179, 669, 95),
(178, 669, 94),
(177, 669, 93),
(176, 669, 92),
(175, 669, 91),
(174, 669, 90),
(173, 669, 89),
(172, 669, 88),
(171, 669, 87),
(170, 669, 86),
(169, 669, 85),
(168, 669, 84),
(167, 669, 83),
(166, 669, 82),
(165, 669, 81),
(164, 669, 80),
(163, 669, 79),
(162, 669, 78),
(161, 669, 77),
(160, 669, 76),
(159, 669, 75),
(158, 669, 74),
(157, 669, 73),
(156, 669, 72),
(155, 669, 71),
(154, 669, 70),
(153, 669, 69),
(152, 669, 68),
(151, 669, 67),
(150, 669, 66),
(149, 669, 65),
(148, 669, 64),
(147, 669, 63),
(146, 669, 62),
(145, 669, 61),
(144, 669, 60),
(143, 669, 59),
(142, 669, 58),
(141, 669, 57),
(140, 669, 56),
(139, 669, 55),
(138, 669, 54),
(137, 669, 53),
(136, 669, 52),
(135, 669, 51),
(134, 669, 50),
(133, 669, 49),
(132, 669, 48),
(131, 669, 47),
(130, 669, 46),
(129, 669, 45),
(128, 669, 44),
(127, 669, 43),
(126, 669, 33),
(125, 669, 32),
(124, 669, 31),
(123, 669, 30),
(122, 669, 29),
(121, 669, 28),
(120, 669, 27),
(119, 669, 26),
(118, 669, 25),
(117, 669, 21),
(116, 669, 20),
(115, 669, 19),
(114, 669, 18),
(113, 669, 17),
(112, 669, 16),
(111, 669, 15),
(110, 669, 14),
(109, 669, 13),
(108, 669, 12),
(107, 669, 11),
(106, 669, 10),
(105, 669, 9),
(104, 669, 8),
(103, 669, 7),
(102, 669, 6),
(101, 669, 5),
(100, 669, 4),
(99, 669, 3),
(98, 669, 2),
(97, 669, 1),
(193, 670, 1),
(194, 670, 2),
(195, 670, 3),
(196, 670, 4),
(197, 670, 5),
(198, 670, 6),
(199, 670, 7),
(200, 670, 8),
(201, 670, 9),
(202, 670, 10),
(203, 670, 11),
(204, 670, 12),
(205, 670, 13),
(206, 670, 14),
(207, 670, 15),
(208, 670, 16),
(209, 670, 17),
(210, 670, 18),
(211, 670, 19),
(212, 670, 20),
(213, 670, 21),
(214, 670, 25),
(215, 670, 26),
(216, 670, 27),
(217, 670, 28),
(218, 670, 29),
(219, 670, 30),
(220, 670, 31),
(221, 670, 32),
(222, 670, 33),
(223, 670, 43),
(224, 670, 44),
(225, 670, 45),
(226, 670, 46),
(227, 670, 47),
(228, 670, 48),
(229, 670, 49),
(230, 670, 50),
(231, 670, 51),
(232, 670, 52),
(233, 670, 53),
(234, 670, 54),
(235, 670, 55),
(236, 670, 56),
(237, 670, 57),
(238, 670, 58),
(239, 670, 59),
(240, 670, 60),
(241, 670, 61),
(242, 670, 62),
(243, 670, 63),
(244, 670, 64),
(245, 670, 65),
(246, 670, 66),
(247, 670, 67),
(248, 670, 68),
(249, 670, 69),
(250, 670, 70),
(251, 670, 71),
(252, 670, 72),
(253, 670, 73),
(254, 670, 74),
(255, 670, 75),
(256, 670, 76),
(257, 670, 77),
(258, 670, 78),
(259, 670, 79),
(260, 670, 80),
(261, 670, 81),
(262, 670, 82),
(263, 670, 83),
(264, 670, 84),
(265, 670, 85),
(266, 670, 86),
(267, 670, 87),
(268, 670, 88),
(269, 670, 89),
(270, 670, 90),
(271, 670, 91),
(272, 670, 92),
(273, 670, 93),
(274, 670, 94),
(275, 670, 95),
(276, 670, 96),
(277, 670, 97),
(278, 670, 98),
(279, 670, 99),
(280, 670, 100),
(281, 670, 101),
(282, 670, 102),
(283, 670, 103),
(284, 670, 104),
(285, 670, 105),
(286, 670, 106),
(287, 670, 107),
(288, 670, 108);

-- --------------------------------------------------------

--
-- 表的结构 `captcha_captchastore`
--

CREATE TABLE IF NOT EXISTS `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7322 ;

-- --------------------------------------------------------

--
-- 表的结构 `carts_shoppingcart`
--

CREATE TABLE IF NOT EXISTS `carts_shoppingcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creat_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `refresh_time` datetime NOT NULL,
  `qty` int(11) NOT NULL,
  `icg_partno` varchar(37) NOT NULL,
  `partno` varchar(50) NOT NULL,
  `mfr` varchar(50) NOT NULL,
  `supplier` varchar(20) NOT NULL,
  `min_qty` int(11) NOT NULL,
  `mult` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `stock_new` int(11) NOT NULL,
  `price_calc` longtext NOT NULL,
  `price_calc_new` longtext NOT NULL,
  `price_change` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `can_refresh` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `other` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_shoppingcart_011786cd` (`icg_partno`),
  KEY `carts_shoppingcart_e8701ad4` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `carts_shoppingcart`
--

INSERT INTO `carts_shoppingcart` (`id`, `creat_time`, `modify_time`, `refresh_time`, `qty`, `icg_partno`, `partno`, `mfr`, `supplier`, `min_qty`, `mult`, `stock`, `stock_new`, `price_calc`, `price_calc_new`, `price_change`, `status`, `can_refresh`, `user_id`, `other`) VALUES
(1, '2015-10-26 17:18:59', '2015-10-26 17:18:59', '2015-10-26 17:18:59', 500, 'b2943ff44678f6e4afee412fddc5e0e4', 'lm124d', '', 'digikey', 2500, 2500, 0, 0, '(lp1\n(dp2\nVprice_hkhkd\np3\nF4.9699999999999998\nsVprice_dlrmb\np4\nF4.7800000000000002\nsVprice_hkrmb\np5\nF4.0800000000000001\nsVprice_hkusd\np6\nF0.63690000000000002\nsVquantity\np7\nI2500\nsa(dp8\nVprice_hkhkd\np9\nF4.7199999999999998\nsVprice_dlrmb\np10\nF4.54\nsVprice_hkrmb\np11\nF3.8700000000000001\nsVprice_hkusd\np12\nF0.60509999999999997\nsVquantity\np13\nI5000\nsa(dp14\nVprice_hkhkd\np15\nF4.54\nsVprice_dlrmb\np16\nF4.3700000000000001\nsVprice_hkrmb\np17\nF3.73\nsVprice_hkusd\np18\nF0.58230000000000004\nsVquantity\np19\nI12500\nsa(dp20\nVprice_hkhkd\np21\nF4.4000000000000004\nsVprice_dlrmb\np22\nF4.2300000000000004\nsVprice_hkrmb\np23\nF3.6099999999999999\nsVprice_hkusd\np24\nF0.56410000000000005\nsVquantity\np25\nI25000\nsa(dp26\nVprice_hkhkd\np27\nF4.2599999999999998\nsVprice_dlrmb\np28\nF4.0899999999999999\nsVprice_hkrmb\np29\nF3.4900000000000002\nsVprice_hkusd\np30\nF0.54590000000000005\nsVquantity\np31\nI62500\nsa.', '', 0, 0, 1, 1, ''),
(2, '2015-10-26 17:18:59', '2015-10-26 17:18:59', '2015-10-26 17:18:59', 500, 'b2943ff44678f6e4afee412fddc5e0e4', 'lm124d', 'aaa', 'mosuer', 2500, 2500, 0, 0, '(lp1\n(dp2\nVprice_hkhkd\np3\nF4.9699999999999998\nsVprice_dlrmb\np4\nF4.7800000000000002\nsVprice_hkrmb\np5\nF4.0800000000000001\nsVprice_hkusd\np6\nF0.63690000000000002\nsVquantity\np7\nI2500\nsa(dp8\nVprice_hkhkd\np9\nF4.7199999999999998\nsVprice_dlrmb\np10\nF4.54\nsVprice_hkrmb\np11\nF3.8700000000000001\nsVprice_hkusd\np12\nF0.60509999999999997\nsVquantity\np13\nI5000\nsa(dp14\nVprice_hkhkd\np15\nF4.54\nsVprice_dlrmb\np16\nF4.3700000000000001\nsVprice_hkrmb\np17\nF3.73\nsVprice_hkusd\np18\nF0.58230000000000004\nsVquantity\np19\nI12500\nsa(dp20\nVprice_hkhkd\np21\nF4.4000000000000004\nsVprice_dlrmb\np22\nF4.2300000000000004\nsVprice_hkrmb\np23\nF3.6099999999999999\nsVprice_hkusd\np24\nF0.56410000000000005\nsVquantity\np25\nI25000\nsa(dp26\nVprice_hkhkd\np27\nF4.2599999999999998\nsVprice_dlrmb\np28\nF4.0899999999999999\nsVprice_hkrmb\np29\nF3.4900000000000002\nsVprice_hkusd\np30\nF0.54590000000000005\nsVquantity\np31\nI62500\nsa.', '', 0, 0, 1, 1, ''),
(3, '2015-10-26 17:18:59', '2015-10-26 17:18:59', '2015-10-24 17:18:59', 500, 'b2943ff44678f6e4afee412fddc5e0e4', 'lm124d', '', 'digikey', 2500, 2500, 0, 0, '(lp1\n(dp2\nVprice_hkhkd\np3\nF4.9699999999999998\nsVprice_dlrmb\np4\nF4.7800000000000002\nsVprice_hkrmb\np5\nF4.0800000000000001\nsVprice_hkusd\np6\nF0.63690000000000002\nsVquantity\np7\nI2500\nsa(dp8\nVprice_hkhkd\np9\nF4.7199999999999998\nsVprice_dlrmb\np10\nF4.54\nsVprice_hkrmb\np11\nF3.8700000000000001\nsVprice_hkusd\np12\nF0.60509999999999997\nsVquantity\np13\nI5000\nsa(dp14\nVprice_hkhkd\np15\nF4.54\nsVprice_dlrmb\np16\nF4.3700000000000001\nsVprice_hkrmb\np17\nF3.73\nsVprice_hkusd\np18\nF0.58230000000000004\nsVquantity\np19\nI12500\nsa(dp20\nVprice_hkhkd\np21\nF4.4000000000000004\nsVprice_dlrmb\np22\nF4.2300000000000004\nsVprice_hkrmb\np23\nF3.6099999999999999\nsVprice_hkusd\np24\nF0.56410000000000005\nsVquantity\np25\nI25000\nsa(dp26\nVprice_hkhkd\np27\nF4.2599999999999998\nsVprice_dlrmb\np28\nF4.0899999999999999\nsVprice_hkrmb\np29\nF3.4900000000000002\nsVprice_hkusd\np30\nF0.54590000000000005\nsVquantity\np31\nI62500\nsa.', '', 0, 0, 1, 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=262 ;

--
-- 转存表中的数据 `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2015-10-21 07:19:33', '1', 'WebConfig object', 1, '', 7, 1),
(2, '2015-10-21 07:19:46', '2', 'WebConfig object', 1, '', 7, 1),
(3, '2015-10-21 07:19:59', '3', 'WebConfig object', 1, '', 7, 1),
(4, '2015-10-21 08:08:00', '4', '注意!!!', 1, '', 7, 1),
(5, '2015-10-21 08:08:15', '1', 'DC_API_URL', 2, '已修改 value 。', 7, 1),
(6, '2015-10-23 18:08:10', '5', 'JY_API_URL', 1, '', 7, 1),
(7, '2015-10-23 18:11:25', '5', 'JY_API_URL', 3, '', 7, 1),
(8, '2015-11-02 19:33:43', '1', 'DC_API_URL', 2, '已修改 value 。', 7, 1),
(9, '2015-11-02 19:38:23', '1', 'DC_API_URL', 2, '已修改 value 。', 7, 1),
(10, '2015-11-03 13:39:39', '1', 'DC_API_URL', 2, '已修改 value 。', 7, 1),
(11, '2015-11-03 13:40:52', '1', 'DC_API_URL', 2, '已修改 value 。', 7, 1),
(12, '2015-11-26 17:55:19', '1', 'Supplier object', 1, '', 10, 1),
(13, '2015-11-26 18:00:32', '1', 'Supplier object', 2, '已修改 logo 。', 10, 1),
(14, '2015-11-26 18:26:37', '2', 'Supplier object', 1, '', 10, 1),
(15, '2015-11-26 18:35:23', '3', 'Supplier object', 1, '', 10, 1),
(16, '2015-11-26 18:35:57', '4', 'Supplier object', 1, '', 10, 1),
(17, '2015-11-30 11:46:28', '8', 'Supplier object', 2, '已修改 desc，info 和 logo 。', 10, 1),
(18, '2015-11-30 11:48:11', '13', 'Supplier object', 2, '已修改 desc，info 和 logo 。', 10, 1),
(19, '2015-11-30 11:48:24', '8', 'Supplier object', 2, '已修改 desc 。', 10, 1),
(20, '2015-11-30 11:48:47', '21', 'Supplier object', 2, '已修改 desc，info 和 logo 。', 10, 1),
(21, '2015-11-30 11:49:05', '20', 'Supplier object', 2, '已修改 desc，info 和 logo 。', 10, 1),
(22, '2015-11-30 11:49:27', '19', 'Supplier object', 2, '已修改 desc，info 和 logo 。', 10, 1),
(23, '2015-11-30 11:49:43', '18', 'Supplier object', 2, '已修改 desc，info 和 logo 。', 10, 1),
(24, '2015-11-30 11:49:57', '17', 'Supplier object', 2, '已修改 desc，info 和 logo 。', 10, 1),
(25, '2015-11-30 11:50:12', '16', 'Supplier object', 2, '已修改 desc，info 和 logo 。', 10, 1),
(26, '2015-11-30 11:50:26', '15', 'Supplier object', 2, '已修改 desc，info 和 logo 。', 10, 1),
(27, '2015-11-30 11:50:43', '14', 'Supplier object', 2, '已修改 desc，info 和 logo 。', 10, 1),
(28, '2015-11-30 11:51:00', '12', 'Supplier object', 2, '已修改 desc，info 和 logo 。', 10, 1),
(29, '2015-11-30 11:51:18', '10', 'Supplier object', 2, '已修改 desc，info 和 logo 。', 10, 1),
(30, '2015-11-30 11:51:43', '4', 'Supplier object', 2, '已修改 desc 和 info 。', 10, 1),
(31, '2015-11-30 11:51:54', '3', 'Supplier object', 2, '已修改 desc 和 info 。', 10, 1),
(32, '2015-11-30 11:52:06', '2', 'Supplier object', 2, '已修改 desc 和 info 。', 10, 1),
(33, '2015-11-30 11:53:15', '2', 'Supplier object', 2, '已修改 desc 。', 10, 1),
(34, '2015-11-30 14:09:39', '7', 'Supplier object', 2, '已修改 desc，info 和 logo 。', 10, 1),
(35, '2015-11-30 14:10:21', '11', 'Supplier object', 2, '已修改 desc，info 和 logo 。', 10, 1),
(36, '2015-11-30 14:12:40', '9', 'Supplier object', 2, '已修改 desc，info 和 logo 。', 10, 1),
(37, '2015-11-30 14:16:41', '22', 'Supplier object', 2, '已修改 desc，info 和 logo 。', 10, 1),
(38, '2015-11-30 17:18:30', '5', 'JY_API_URL', 2, '已修改 value 。', 7, 1),
(39, '2015-11-30 17:19:06', '6', 'JY_USER', 1, '', 7, 1),
(40, '2015-11-30 17:19:23', '7', 'JY_PSWD', 1, '', 7, 1),
(41, '2015-12-03 17:09:39', '1', 'Pictures object', 1, '', 11, 1),
(42, '2015-12-03 17:10:00', '1', 'Pictures object', 2, '已修改 position 。', 11, 1),
(43, '2015-12-03 17:15:29', '2', 'Pictures object', 1, '', 11, 1),
(44, '2015-12-03 17:15:40', '1', 'Pictures object', 2, '已修改 position 。', 11, 1),
(45, '2015-12-03 17:49:39', '2', 'Pictures object', 2, '已修改 name，explain，href 和 imgpath 。', 11, 1),
(46, '2015-12-03 17:49:58', '1', 'Pictures object', 2, '已修改 name，imgpath 和 show_id 。', 11, 1),
(47, '2015-12-03 17:50:23', '3', 'Pictures object', 1, '', 11, 1),
(48, '2015-12-03 17:50:41', '2', 'Pictures object', 2, '已修改 imgpath 。', 11, 1),
(49, '2015-12-03 17:53:37', '1', 'Pictures object', 2, '已修改 imgpath 。', 11, 1),
(50, '2015-12-04 10:40:52', '18', 'Supplier object', 2, '已修改 desc 和 logo 。', 10, 1),
(51, '2015-12-04 15:45:34', '5', 'Supplier object', 2, '已修改 desc，info 和 logo 。', 10, 1),
(52, '2015-12-04 16:49:52', '3', 'Pictures object', 2, '已修改 imgpath 。', 11, 1),
(53, '2015-12-04 16:50:01', '2', 'Pictures object', 2, '已修改 imgpath 。', 11, 1),
(54, '2015-12-04 16:50:10', '1', 'Pictures object', 2, '已修改 imgpath 。', 11, 1),
(55, '2015-12-04 16:51:27', '3', 'Pictures object', 2, '已修改 imgpath 。', 11, 1),
(56, '2015-12-04 16:51:37', '2', 'Pictures object', 2, '已修改 imgpath 。', 11, 1),
(57, '2015-12-04 16:51:46', '1', 'Pictures object', 2, '已修改 imgpath 。', 11, 1),
(58, '2015-12-04 17:13:43', '4', 'Pictures object', 1, '', 11, 1),
(59, '2015-12-04 17:14:04', '5', 'Pictures object', 1, '', 11, 1),
(60, '2015-12-04 17:14:51', '1', 'Pictures object', 2, '已修改 show 。', 11, 1),
(61, '2015-12-07 13:58:17', '21', 'Supplier object', 2, '已修改 is_active 。', 10, 1),
(62, '2015-12-08 17:59:52', '17', 'Supplier object', 2, '已修改 desc 和 info 。', 10, 1),
(63, '2015-12-08 18:00:01', '11', 'Supplier object', 2, '已修改 desc 和 info 。', 10, 1),
(64, '2015-12-11 10:08:09', '14', 'lidong', 1, '', 4, 1),
(65, '2015-12-11 10:08:11', '14', 'lidong', 2, '已修改 first_name，is_staff 和 is_superuser 。', 4, 1),
(66, '2015-12-16 09:20:25', '18', 'Supplier object', 2, '已修改 is_active 。', 10, 1),
(67, '2015-12-16 09:20:34', '17', 'Supplier object', 2, '已修改 is_active 。', 10, 1),
(68, '2015-12-16 09:20:45', '11', 'Supplier object', 2, '已修改 is_active 。', 10, 1),
(69, '2015-12-16 09:21:04', '23', 'Supplier object', 1, '', 10, 1),
(70, '2015-12-24 14:04:45', '6', 'Pictures object', 1, '', 11, 1),
(71, '2015-12-28 09:33:14', '6', 'Pictures object', 2, '已修改 show 。', 11, 1),
(72, '2015-12-28 10:12:16', '7', 'Pictures object', 1, '', 11, 1),
(73, '2015-12-30 15:19:52', '8', 'Pictures object', 1, '', 11, 1),
(74, '2015-12-30 15:20:02', '8', 'Pictures object', 2, '已修改 show 。', 11, 1),
(75, '2015-12-30 15:20:58', '8', 'Pictures object', 2, '已修改 imgpath 。', 11, 1),
(76, '2015-12-30 15:33:26', '8', 'Pictures object', 2, '已修改 show 。', 11, 1),
(77, '2015-12-30 15:39:00', '8', 'Pictures object', 2, '已修改 show 。', 11, 1),
(78, '2016-01-05 17:22:32', '1', 'interface', 1, '', 3, 1),
(79, '2016-01-05 17:23:00', '15', 'xingsongyan@dzji.com', 2, '已修改 groups 和 last_login 。', 4, 1),
(80, '2016-01-05 17:27:09', '15', 'xingsongyan@dzji.com', 2, '已修改 groups 。', 4, 1),
(81, '2016-01-05 17:48:39', '1', 'interface', 3, '', 3, 1),
(82, '2016-01-07 18:17:04', '24', 'Supplier object', 1, '', 10, 1),
(83, '2016-01-13 11:14:20', '8', 'JY_API_URL_NEW', 1, '', 7, 1),
(84, '2016-01-13 11:14:43', '9', 'JY_USER_NEW', 1, '', 7, 1),
(85, '2016-01-13 11:14:56', '10', 'JY_PSWD_NEW', 1, '', 7, 1),
(86, '2016-01-13 11:15:59', '9', 'JY_USER_NEW', 2, '已修改 value 。', 7, 1),
(87, '2016-01-13 11:16:16', '10', 'JY_PSWD_NEW', 2, '已修改 value 。', 7, 1),
(88, '2016-01-14 10:05:16', '9', 'Pictures object', 1, '', 11, 1),
(89, '2016-01-14 10:08:33', '3', 'Pictures object', 2, '已修改 href 。', 11, 1),
(90, '2016-01-14 10:09:36', '3', 'Pictures object', 2, '已修改 href 。', 11, 1),
(91, '2016-01-14 10:10:31', '9', 'Pictures object', 2, '已修改 href 。', 11, 1),
(92, '2016-01-14 10:11:09', '3', 'Pictures object', 2, '已修改 show 。', 11, 1),
(93, '2016-01-22 09:25:40', '8', 'Pictures object', 2, '已修改 show 。', 11, 1),
(94, '2016-01-22 09:25:46', '7', 'Pictures object', 2, '已修改 show 。', 11, 1),
(95, '2016-02-15 11:50:55', '3', 'Pictures object', 2, '已修改 show 。', 11, 1),
(96, '2016-02-15 15:14:42', '1', 'Pictures object', 2, '已修改 show 。', 11, 1),
(97, '2016-02-15 15:15:36', '2', 'Pictures object', 2, '已修改 show_id 。', 11, 1),
(98, '2016-03-02 11:50:24', '8', 'JY_API_URL_NEW', 2, '已修改 value 。', 7, 1),
(99, '2016-03-02 13:17:39', '8', 'JY_API_URL_NEW', 2, '已修改 value 。', 7, 1),
(100, '2016-03-02 13:20:53', '8', 'JY_API_URL_NEW', 2, '已修改 value 。', 7, 1),
(101, '2016-03-02 13:24:52', '8', 'JY_API_URL_NEW', 2, '已修改 value 。', 7, 1),
(102, '2016-03-07 10:37:29', '8', 'JY_API_URL_NEW', 2, '已修改 value 。', 7, 1),
(103, '2016-03-21 15:53:46', '5', 'JY_API_URL', 2, '已修改 value 。', 7, 1),
(104, '2016-03-21 15:54:02', '8', 'JY_API_URL_NEW', 2, '已修改 value 。', 7, 1),
(105, '2016-03-21 16:25:14', '8', 'JY_API_URL_NEW', 2, '已修改 value 。', 7, 1),
(106, '2016-03-21 17:04:26', '8', 'JY_API_URL_NEW', 2, '已修改 value 。', 7, 1),
(107, '2016-03-22 11:23:19', '8', 'JY_API_URL_NEW', 2, '已修改 value 。', 7, 1),
(108, '2016-03-22 11:25:37', '8', 'JY_API_URL_NEW', 2, '已修改 value 。', 7, 1),
(109, '2016-03-28 14:29:50', '8', 'JY_API_URL_NEW', 2, '已修改 value 。', 7, 1),
(110, '2016-03-30 14:38:04', '8', 'JY_API_URL_NEW', 2, '已修改 value 。', 7, 1),
(111, '2016-04-06 17:32:17', '8', 'JY_API_URL_NEW', 2, '已修改 value 。', 7, 1),
(112, '2016-04-06 17:38:10', '8', 'JY_API_URL_NEW', 2, '已修改 value 。', 7, 1),
(113, '2016-04-22 15:41:08', '1', 'DC_API_URL', 2, '已修改 value 。', 7, 1),
(114, '2016-06-07 14:03:16', '669', 'icgoo', 2, '已修改 password 。', 4, 670),
(115, '2016-06-07 14:05:53', '669', 'icgoo', 2, '已修改 password 。', 4, 670),
(116, '2016-06-07 14:07:52', '669', 'icgoo', 2, '已修改 password 。', 4, 670),
(117, '2016-06-07 14:09:54', '669', 'icgoo', 2, '已修改 password 。', 4, 670),
(118, '2016-06-07 14:10:26', '669', 'icgoo', 2, '已修改 user_permissions 。', 4, 670),
(119, '2016-06-07 14:12:40', '669', 'icgooa', 2, '已修改 username 。', 4, 670),
(120, '2016-06-07 14:13:01', '670', 'icgoo', 2, '已修改 username，email，user_permissions 和 last_login 。', 4, 670),
(121, '2016-06-07 14:15:56', '17', '13689546078', 2, '已修改 password 。', 4, 670),
(122, '2016-06-07 14:20:28', '17', '13689546078', 2, '已修改 password 。', 4, 670),
(123, '2016-06-12 10:37:15', '7', 'Pictures object', 2, '已修改 show 。', 11, 670),
(124, '2016-06-12 10:37:39', '7', 'Pictures object', 2, '已修改 imgpath 。', 11, 670),
(125, '2016-06-12 16:15:05', '7', 'Pictures object', 2, '已修改 imgpath 。', 11, 670),
(126, '2016-06-12 16:16:15', '7', 'Pictures object', 2, '已修改 imgpath 。', 11, 670),
(127, '2016-06-12 16:16:26', '7', 'Pictures object', 2, '已修改 show 。', 11, 670),
(128, '2016-06-13 09:05:09', '7', 'Pictures object', 2, '已修改 show 。', 11, 670),
(129, '2016-06-14 09:42:18', '10', 'Pictures object', 1, '', 11, 670),
(130, '2016-06-14 09:44:43', '11', 'Pictures object', 1, '', 11, 670),
(131, '2016-06-14 09:47:51', '11', 'Pictures object', 2, '已修改 href 。', 11, 670),
(132, '2016-06-14 09:48:24', '11', 'Pictures object', 2, '已修改 href 。', 11, 670),
(133, '2016-06-14 09:48:35', '10', 'Pictures object', 2, '已修改 href 。', 11, 670),
(134, '2016-06-14 10:20:40', '7', 'Pictures object', 2, '已修改 show 。', 11, 670),
(135, '2016-06-14 10:24:45', '7', 'Pictures object', 2, '已修改 showdate 。', 11, 670),
(136, '2016-06-14 10:56:13', '7', 'Pictures object', 2, '已修改 showdate 。', 11, 670),
(137, '2016-06-14 11:06:00', '7', 'Pictures object', 2, '已修改 showdate 和 hidedate 。', 11, 670),
(138, '2016-06-14 13:07:46', '7', 'Pictures object', 2, '已修改 hidedate 。', 11, 670),
(139, '2016-06-14 13:08:29', '7', 'Pictures object', 2, '已修改 showdate 。', 11, 670),
(140, '2016-06-14 13:10:34', '7', 'Pictures object', 2, '已修改 showdate，hidedate 和 show 。', 11, 670),
(141, '2016-06-14 13:19:07', '7', 'Pictures object', 2, '已修改 showdate，hidedate 和 show 。', 11, 670),
(142, '2016-06-14 13:47:24', '8', 'Pictures object', 2, '已修改 show 。', 11, 670),
(143, '2016-06-14 13:58:08', '7', 'Pictures object', 2, '已修改 showdate 和 hidedate 。', 11, 670),
(144, '2016-06-14 14:30:24', '8', 'Pictures object', 2, '已修改 show 。', 11, 670),
(145, '2016-06-14 14:47:05', '7', 'Pictures object', 2, '已修改 showdate 和 hidedate 。', 11, 670),
(146, '2016-06-14 14:53:13', '7', 'Pictures object', 2, '已修改 showdate 和 hidedate 。', 11, 670),
(147, '2016-06-14 15:21:52', '7', 'Pictures object', 2, '已修改 showdate 和 hidedate 。', 11, 670),
(148, '2016-06-14 15:26:30', '11', 'Pictures object', 2, '已修改 showdate 和 hidedate 。', 11, 670),
(149, '2016-06-14 15:28:07', '10', 'Pictures object', 2, '已修改 showdate 和 hidedate 。', 11, 670),
(150, '2016-06-14 15:35:59', '6', 'Pictures object', 2, '已修改 showdate 和 hidedate 。', 11, 670),
(151, '2016-06-14 15:36:17', '6', 'Pictures object', 2, '已修改 hidedate 。', 11, 670),
(152, '2016-06-14 15:39:32', '7', 'Pictures object', 2, '已修改 hidedate 。', 11, 670),
(153, '2016-06-14 15:39:54', '3', 'Pictures object', 2, '已修改 showdate 和 hidedate 。', 11, 670),
(154, '2016-06-14 15:54:13', '3', 'Pictures object', 2, '已修改 hidedate 。', 11, 670),
(155, '2016-06-14 16:51:04', '7', 'Pictures object', 2, '已修改 showdate 和 hidedate 。', 11, 670),
(156, '2016-06-15 09:53:57', '10', 'Pictures object', 2, '已修改 show_id 。', 11, 670),
(157, '2016-06-15 09:54:03', '11', 'Pictures object', 2, '已修改 show_id 。', 11, 670),
(158, '2016-06-15 09:55:25', '10', 'Pictures object', 2, '已修改 show_id 。', 11, 670),
(159, '2016-06-15 09:55:36', '3', 'Pictures object', 2, '已修改 show_id 。', 11, 670),
(160, '2016-06-15 10:41:44', '11', 'Pictures object', 2, '没有字段被修改。', 11, 670),
(161, '2016-06-15 11:03:26', '7', 'Pictures object', 2, '已修改 hidedate 。', 11, 670),
(162, '2016-06-15 11:04:44', '7', 'Pictures object', 2, '已修改 hidedate 。', 11, 670),
(163, '2016-06-15 11:05:14', '7', 'Pictures object', 2, '已修改 showdate 和 hidedate 。', 11, 670),
(164, '2016-06-15 11:24:34', '10', 'Pictures object', 2, '没有字段被修改。', 11, 670),
(165, '2016-06-15 11:25:15', '12', 'Pictures object', 1, '', 11, 670),
(166, '2016-06-15 11:26:06', '12', 'Pictures object', 2, '已修改 name 。', 11, 670),
(167, '2016-06-15 11:26:29', '12', 'Pictures object', 2, '没有字段被修改。', 11, 670),
(168, '2016-06-15 11:27:17', '12', 'Pictures object', 2, '已修改 show 。', 11, 670),
(169, '2016-06-15 11:28:02', '12', 'Pictures object', 2, '已修改 show 。', 11, 670),
(170, '2016-06-15 11:28:24', '12', 'Pictures object', 3, '', 11, 670),
(171, '2016-06-16 14:17:09', '7', 'Pictures object', 2, '已修改 showdate 和 hidedate 。', 11, 670),
(172, '2016-06-17 18:32:22', '7', 'Pictures object', 2, '已修改 showdate，hidedate 和 imgpath 。', 11, 670),
(173, '2016-06-23 14:30:08', '11', 'CN_CT_API', 1, '', 7, 670),
(174, '2016-06-23 14:30:40', '12', 'CN_CT_USER', 1, '', 7, 670),
(175, '2016-06-23 14:31:24', '13', 'CN_CT_PSWD', 1, '', 7, 670),
(176, '2016-06-30 11:32:36', '8', 'Pictures object', 2, '已修改 showdate 和 hidedate 。', 11, 670),
(177, '2016-06-30 15:41:19', '8', 'Pictures object', 2, '已修改 hidedate 。', 11, 670),
(178, '2016-07-05 16:51:06', '0', 'Descript object', 1, '', 40, 670),
(179, '2016-07-05 16:52:31', '0', '售后服务电话', 2, '已修改 title 。', 40, 670),
(180, '2016-07-05 16:55:28', '0', 'Descript object', 2, '已修改 title 。', 40, 670),
(181, '2016-07-05 16:56:33', '0', '呵呵', 2, '已修改 title 。', 40, 670),
(182, '2016-07-05 16:59:13', '0', '售后服务电话', 2, '已修改 title 。', 40, 670),
(183, '2016-07-05 17:06:02', '0', '售后服务电话', 2, '已修改 content 。', 40, 670),
(184, '2016-07-05 18:34:26', '2', '全国销售热线', 1, '', 40, 670),
(185, '2016-07-06 08:55:58', '1', '售后服务电话', 2, '已修改 content 。', 40, 670),
(186, '2016-07-08 16:55:57', '5', 'JY_API_URL', 2, '已修改 value 。', 7, 670),
(187, '2016-07-15 17:07:21', '1', '/hehe/ -- test', 1, '', 41, 670),
(188, '2016-07-15 17:09:36', '1', '/hehe/ -- test', 2, '已修改 content 。', 41, 670),
(189, '2016-07-15 17:29:18', '2', 'http:0.0.0.0:8080', 1, '', 16, 670),
(190, '2016-07-15 17:29:33', '1', '/hehe/ -- test', 2, '已修改 sites 。', 41, 670),
(191, '2016-07-15 17:30:33', '2', 'http:0.0.0.0:8080/', 2, '已修改 domain 。', 16, 670),
(192, '2016-07-15 17:31:06', '1', '/hehe/ -- test', 2, '没有字段被修改。', 41, 670),
(193, '2016-07-15 17:38:27', '1', '/hehe/ -- test', 2, '已修改 sites 。', 41, 670),
(194, '2016-07-15 17:40:38', '2', 'http:0.0.0.0:8080/flatpage/', 2, '已修改 domain 。', 16, 670),
(195, '2016-07-15 17:40:53', '1', '/hehe/ -- test', 2, '已修改 sites 。', 41, 670),
(196, '2016-07-15 17:56:47', '2', 'http:0.0.0.0:8080/flatpage/', 3, '', 16, 670),
(197, '2016-07-15 17:57:04', '3', 'localhost', 1, '', 16, 670),
(198, '2016-07-15 17:57:32', '1', '/hehe/ -- test', 2, '已修改 sites 。', 41, 670),
(199, '2016-07-15 17:59:32', '3', 'localhost:8080', 2, '已修改 domain 。', 16, 670),
(200, '2016-07-15 18:24:08', '3', 'localhost:8080/flatpage', 2, '已修改 domain 。', 16, 670),
(201, '2016-07-15 18:26:16', '3', 'localhost:8080/flatpages', 2, '已修改 domain 。', 16, 670),
(202, '2016-07-18 14:35:53', '1', '/hehe/ -- test', 2, '没有字段被修改。', 41, 670),
(203, '2016-07-18 14:37:00', '4', '127.0.0.1:8080', 1, '', 16, 670),
(204, '2016-07-18 14:37:27', '4', '127.0.0.1:8080/fp/', 2, '已修改 domain 。', 16, 670),
(205, '2016-07-18 14:37:33', '4', '127.0.0.1:8080/fp', 2, '已修改 domain 。', 16, 670),
(206, '2016-07-18 14:37:43', '1', '/hehe/ -- test', 2, '已修改 sites 。', 41, 670),
(207, '2016-07-18 14:41:13', '4', '127.0.0.1:8080/fp', 3, '', 16, 670),
(208, '2016-07-18 14:42:56', '1', '/hehe/ -- test', 2, '已修改 sites 和 template_name 。', 41, 670),
(209, '2016-07-18 14:46:58', '1', '/hehe/ -- test', 2, '已修改 template_name 。', 41, 670),
(210, '2016-07-18 14:50:31', '1', '/hehe/ -- test', 2, '已修改 sites 。', 41, 670),
(211, '2016-07-18 14:57:30', '1', '/hehe/ -- test', 2, '已修改 sites 。', 41, 670),
(212, '2016-07-18 14:58:38', '1', '/a/b/c/ -- testaaa', 2, '已修改 url，title 和 content 。', 41, 670),
(213, '2016-07-18 15:01:47', '1', '/fk/ -- testaaa', 2, '已修改 url 和 content 。', 41, 670),
(214, '2016-07-18 15:02:16', '1', '/fk/ -- testaaa', 2, '已修改 content 。', 41, 670),
(215, '2016-07-18 15:04:16', '1', '/fk/ -- testaaa', 2, '已修改 content 。', 41, 670),
(216, '2016-07-18 15:07:50', '1', '/fk/ -- testaaa', 2, '已修改 content 。', 41, 670),
(217, '2016-07-18 15:11:53', '2', '/fkk/ -- 3', 1, '', 41, 670),
(218, '2016-07-18 15:13:12', '1', 'www.icgoo.net', 2, '已修改 domain 和 name 。', 16, 670),
(219, '2016-07-18 15:27:55', '1', '/fk/ -- testaaa', 2, '已修改 template_name 。', 41, 670),
(220, '2016-07-18 15:28:15', '2', '/fkk/ -- 3', 2, '已修改 template_name 。', 41, 670),
(221, '2016-07-21 18:12:17', '11', 'CN_CT_API', 2, '已修改 value 。', 7, 670),
(222, '2016-07-21 18:37:30', '11', 'CN_CT_API', 2, '已修改 value 。', 7, 670),
(223, '2016-07-21 18:38:16', '11', 'CN_CT_API', 2, '已修改 value 。', 7, 670),
(224, '2016-07-21 18:39:30', '11', 'CN_CT_API', 2, '已修改 value 。', 7, 670),
(225, '2016-08-01 16:10:31', '3', 'localhost:8080/', 2, '已修改 domain 。', 16, 670),
(226, '2016-08-01 16:11:02', '3', 'localhost:8080', 2, '已修改 domain 。', 16, 670),
(227, '2016-08-02 14:03:41', '1', 'Ad object', 1, '', 42, 670),
(228, '2016-08-02 14:13:00', '2', 'Ad object', 1, '', 42, 670),
(229, '2016-08-02 14:26:51', '2', 'Ad object', 2, '已修改 content 。', 42, 670),
(230, '2016-08-02 14:55:43', '2', 'Ad object', 2, '已修改 content 。', 42, 670),
(231, '2016-08-02 14:56:19', '2', 'Ad object', 2, '已修改 content 。', 42, 670),
(232, '2016-08-02 16:05:19', '2', '今天刮台风了！', 2, '已修改 content 。', 42, 670),
(233, '2016-08-02 16:06:03', '3', '撒地方', 1, '', 42, 670),
(234, '2016-08-02 16:06:22', '3', '撒地方', 2, '已修改 url 和 content 。', 42, 670),
(235, '2016-08-02 16:09:07', '3', '撒地方', 2, '已修改 content 。', 42, 670),
(236, '2016-08-03 14:12:10', '2', '今天刮台风了！', 2, '已修改 content 。', 42, 670),
(237, '2016-09-18 17:45:57', '14', 'JY_HOST', 1, '', 7, 670),
(238, '2016-09-23 09:29:25', '4', 'ICGOO相关服务条款', 1, '', 42, 1),
(239, '2016-09-23 09:32:53', '4', 'ICGOO相关服务条款', 2, '已修改 content 。', 42, 1),
(240, '2016-09-23 09:44:16', '4', 'ICGOO相关服务条款', 2, '已修改 content 。', 42, 1),
(241, '2016-09-23 09:49:20', '4', 'ICGOO相关服务条款', 2, '已修改 content 。', 42, 1),
(242, '2016-09-23 09:51:41', '4', 'ICGOO相关服务条款', 2, '没有字段被修改。', 42, 1),
(243, '2016-09-23 10:29:10', '4', 'ICGOO相关服务条款', 2, '没有字段被修改。', 42, 1),
(244, '2016-09-23 10:29:39', '4', 'ICGOO相关服务条款', 2, '已修改 content 。', 42, 1),
(245, '2016-09-23 10:31:07', '4', 'ICGOO相关服务条款', 2, '没有字段被修改。', 42, 1),
(246, '2016-09-23 10:35:09', '4', 'ICGOO相关服务条款', 2, '没有字段被修改。', 42, 1),
(247, '2016-09-23 10:35:55', '4', 'ICGOO相关服务条款', 2, '没有字段被修改。', 42, 1),
(248, '2016-09-23 10:38:20', '4', 'ICGOO相关服务条款', 2, '已修改 content 。', 42, 1),
(249, '2016-09-23 10:39:26', '4', 'ICGOO相关服务条款', 2, '没有字段被修改。', 42, 1),
(250, '2016-09-23 10:40:28', '4', 'ICGOO相关服务条款', 2, '没有字段被修改。', 42, 1),
(251, '2016-09-23 11:50:22', '4', 'ICGOO相关服务条款', 2, '没有字段被修改。', 42, 1),
(252, '2016-09-23 11:51:48', '4', 'ICGOO相关服务条款', 2, '已修改 content 。', 42, 1),
(253, '2016-09-23 12:01:16', '4', 'ICGOO相关服务条款', 2, '没有字段被修改。', 42, 1),
(254, '2016-09-23 13:03:57', '4', 'ICGOO相关服务条款', 2, '没有字段被修改。', 42, 1),
(255, '2016-09-23 13:10:24', '4', 'ICGOO相关服务条款', 2, '已修改 content 。', 42, 1),
(256, '2016-09-23 13:10:46', '4', 'ICGOO相关服务条款', 2, '已修改 content 。', 42, 1),
(257, '2016-09-23 13:12:25', '4', 'ICGOO相关服务条款', 2, '没有字段被修改。', 42, 1),
(258, '2016-09-23 13:14:15', '4', 'ICGOO相关服务条款', 2, '没有字段被修改。', 42, 1),
(259, '2016-09-23 13:14:53', '4', 'ICGOO相关服务条款', 2, '已修改 content 。', 42, 1),
(260, '2016-09-23 13:16:52', '4', 'ICGOO相关服务条款', 2, '已修改 content 。', 42, 1),
(261, '2016-09-23 13:21:19', '4', 'ICGOO相关服务条款', 2, '已修改 content 。', 42, 1);

-- --------------------------------------------------------

--
-- 表的结构 `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- 转存表中的数据 `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'webconfig', 'webconfig'),
(34, 'wap', 'weixinuser'),
(9, 'carts', 'shoppingcart'),
(10, 'search', 'supplier'),
(11, 'main', 'pictures'),
(36, 'livesettings', 'longsetting'),
(35, 'livesettings', 'setting'),
(15, 'captcha', 'captchastore'),
(16, 'sites', 'site'),
(17, 'home', 'pictures'),
(18, 'product', 'keys'),
(19, 'product', 'supplier'),
(20, 'product', 'product'),
(21, 'product', 'historyinfobase'),
(22, 'product', 'historyinfochange'),
(23, 'product', 'collection'),
(24, 'news', 'etimenewscate'),
(25, 'news', 'etimenews'),
(26, 'news', 'picture'),
(27, 'news', 'anchortext'),
(28, 'accounts', 'contactrole'),
(29, 'accounts', 'contactorganization'),
(30, 'accounts', 'contactorganizationrole'),
(31, 'accounts', 'organization'),
(32, 'accounts', 'contact'),
(33, 'accounts', 'phonenumber'),
(37, 'accounts', 'registercode'),
(38, 'accounts', 'userextrainfo'),
(39, 'accounts', 'useraddressinfo'),
(40, 'main', 'descript'),
(41, 'flatpages', 'flatpage'),
(42, 'ad', 'ad'),
(43, 'accounts', 'userregisterinfo');

-- --------------------------------------------------------

--
-- 表的结构 `django_flatpage`
--

CREATE TABLE IF NOT EXISTS `django_flatpage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `enable_comments` tinyint(1) NOT NULL,
  `template_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NOT NULL,
  `registration_required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `django_flatpage`
--

INSERT INTO `django_flatpage` (`id`, `url`, `title`, `content`, `enable_comments`, `template_name`, `registration_required`) VALUES
(1, '/fk/', 'testaaa', '<h5 class="artical_title">王者归来！Rochester新获原厂授权生产四款停产料:</h5>\r\n<h4>TMS320、ADSP-2100、MC68020和MC68040</h4>\r\n<div class="articalText">\r\n    <p style="text-indent:2em;">\r\n	<span style="font-size:24px;">喜大普奔！！<strong><span style="color:#337FE5;">经典</span></strong></span>卷土重来！还在为经典芯片的逝去感到不便和伤怀吗？还在为从前的辉煌淋涕落泪吗？？<span style="font-size:24px;">Rochester带领经典王者归来！</span>\r\n</p>\r\n<p style="text-indent:2em;">\r\n	<span style="font-size:18px;">近期，Rochester带领经典芯片<span style="color:#E53333;"><strong>TMS320、ADSP-2100、MC68020</strong></span>和<strong><span style="color:#E53333;">MC68040</span></strong>重出江湖，看廉颇虽老，宝刀依旧削铁如泥！</span>\r\n</p>\r\n<p style="text-indent:2em;">\r\n	<span style="font-size:18px;"><span style="font-size:14px;"></span><br>\r\n</span>\r\n</p>\r\n<p style="text-indent:2em;">\r\n	据悉，罗彻斯特电子新获得原厂授权生产TI和ADI停产的DSP和Motorola的经典32位MCU。作为罗彻斯特电子中国区首家也是最具实力的授权代理商：ICGOO在线商城，为您提供最优质的订货服务，详情请咨询全国销售热线：400-660-6568。\r\n</p>\r\n<p style="text-indent:2em;">\r\n	<br>\r\n</p>\r\n<p style="text-indent:2em;">\r\n	罗彻斯特电子有限公司创建于1981年，总部位于美国，在亚洲有上海、新加坡和日本3个办事处。是全球唯一一家提供授权停产元器件的制造商，生产超过20000种原厂已停产的半导体元器件；拥有超过100亿的晶圆祼片和超过50亿的原厂现货库存，为客户提供停产元器件产品的“后市场”服务的制造商。\r\n</p>\r\n<p style="text-indent:2em;">\r\n	<br>\r\n</p>\r\n<p style="text-align:center;text-indent:2em;">\r\n	<img src="http://www.etime.net.cn/upload/news/image/20160614/20160614162909_17537.jpg" alt="">\r\n</p>\r\n<p style="text-align:center;text-indent:2em;">\r\n	<br>\r\n</p>\r\n<p style="text-indent:2em;">\r\n	此次罗彻斯特电子获得德州仪器（TI）和ADI授权，可持续支持生产以延长TI和ADI的数位讯号处理器（DSP）系列在指定设备上的产品生命周期。\r\n</p>\r\n<p style="text-align:center;text-indent:2em;">\r\n	<img src="http://www.etime.net.cn/upload/news/image/20160614/20160614162931_88040.png" alt="">\r\n</p>\r\n<p style="text-indent:2em;">\r\n	<br>\r\n</p>\r\n<p style="text-align:center;text-indent:2em;">\r\n	<img src="http://www.etime.net.cn/upload/news/image/20160614/20160614162942_41394.png" alt="">\r\n</p>\r\n<p class="p0" style="margin-bottom:0pt;margin-top:0pt;text-align:center;">\r\n	德州仪器（<span style="font-family:''Times New Roman'';">TI</span><span style="font-family:宋体;">）的</span><span style="font-family:''Times New Roman'';">DSP----TMS320</span><span style="font-family:宋体;">系列列表</span><o:p></o:p>\r\n</p>\r\n<p class="p0" style="margin-bottom:0pt;margin-top:0pt;text-align:center;">\r\n	<br>\r\n</p>\r\n<p class="p0" style="margin-bottom:0pt;margin-top:0pt;text-align:center;">\r\n	<span style="font-family:宋体;"><img src="http://www.etime.net.cn/upload/news/image/20160714/20160714165834_55072.jpg" alt=""><br>\r\n</span>\r\n</p>\r\n<p class="p0" style="margin-bottom:0pt;margin-top:0pt;text-align:center;">\r\n	ADI的DSP----ADSP-2101系列（部分）列表\r\n</p>\r\n<p class="p0" style="margin-bottom:0pt;margin-top:0pt;text-align:center;">\r\n	<br>\r\n</p>\r\n<p style="text-indent:2em;">\r\n	除DSP外，同时获得NXP/Freescale授权生产32 位微处理器：MC68020和MC68040系列。\r\n</p>\r\n<p style="text-indent:2em;">\r\n	<br>\r\n</p>\r\n<p style="text-align:center;text-indent:2em;">\r\n	<img src="http://www.etime.net.cn/upload/news/image/20160614/20160614163005_48673.png" alt="">\r\n</p>\r\n<p style="text-align:center;text-indent:2em;">\r\n	<br>\r\n</p>\r\n<p style="text-indent:2em;">\r\n	MC68020系列是Motorola（摩托罗拉）于1984 年推出的一款经典32 位微处理器, 直到今天仍然被广泛应用在许多产品, 包括在2015 年的电影“史蒂夫 乔布斯”里占重要地位的苹果Macintosh II, 以及许多其他消费和工业类产品。罗彻斯特电子于2016年重新引入, 这是首次从Motorola引入完整的32 位MC68000微处理器。\r\n</p>\r\n<p style="text-indent:2em;">\r\n	<br>\r\n</p>\r\n<p style="text-align:center;text-indent:2em;">\r\n	<img src="http://www.etime.net.cn/upload/news/image/20160614/20160614163055_10785.png" alt="">\r\n</p>\r\n<p style="text-align:center;text-indent:2em;">\r\n	MC68020系列型号数据\r\n</p>\r\n<p style="text-align:center;text-indent:2em;">\r\n	<br>\r\n</p>\r\n<p style="text-align:center;text-indent:2em;">\r\n	<img src="http://www.etime.net.cn/upload/news/image/20160614/20160614163130_88756.png" alt="">\r\n</p>\r\n<p style="text-align:center;text-indent:2em;">\r\n	<br>\r\n</p>\r\n<p style="text-indent:2em;">\r\n	MC68040系列是Motorola（摩托罗拉）于1990年推出MC68030系列的改进产品，这款32 位微处理器可兼容, 高性能的M68000系列第四代32 位微处理器，它们整合兼容MC68030 的整数单元和两个独立的缓存。MC68040 包含双、独立、页码需求内存管理单元（MMUs）指令,以及数据流访问、独立的4-kbyte 指令和数据缓存。MC68040 包含一个兼容MC68881/MC68882 的浮点单元（FPU）。\r\n</p>\r\n<p style="text-indent:2em;">\r\n	<br>\r\n</p>\r\n<p style="text-align:center;text-indent:2em;">\r\n	<img src="http://www.etime.net.cn/upload/news/image/20160614/20160614163149_90156.png" alt="">\r\n</p>\r\n<p style="text-align:center;text-indent:2em;">\r\n	MC68040系列型号数据\r\n</p>\r\n<p style="text-align:center;text-indent:2em;">\r\n	<br>\r\n</p>\r\n<p style="text-indent:2em;">\r\n	ICGOO.NET作为Rochester中国区首家也是最具实力的授权代理商，为您提供最优质的订货服务，详情请咨询<a style="text-decoration:underline" href="http://www.icgoo.net/">ICGOO.NET</a>.\r\n</p>\r\n            </div>', 0, '', 0),
(2, '/fkk/', '3', '33333', 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `django_flatpage_sites`
--

CREATE TABLE IF NOT EXISTS `django_flatpage_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `flatpage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `django_flatpage_sites`
--

INSERT INTO `django_flatpage_sites` (`id`, `site_id`, `flatpage_id`) VALUES
(22, 3, 2),
(21, 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- 转存表中的数据 `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2015-10-15 09:19:55'),
(2, 'auth', '0001_initial', '2015-10-15 09:19:55'),
(3, 'admin', '0001_initial', '2015-10-15 09:19:55'),
(4, 'contenttypes', '0002_remove_content_type_name', '2015-10-15 09:19:55'),
(5, 'auth', '0002_alter_permission_name_max_length', '2015-10-15 09:19:55'),
(6, 'auth', '0003_alter_user_email_max_length', '2015-10-15 09:19:55'),
(7, 'auth', '0004_alter_user_username_opts', '2015-10-15 09:19:55'),
(8, 'auth', '0005_alter_user_last_login_null', '2015-10-15 09:19:55'),
(9, 'auth', '0006_require_contenttypes_0002', '2015-10-15 09:19:55'),
(10, 'sessions', '0001_initial', '2015-10-15 09:19:55'),
(11, 'webconfig', '0001_initial', '2015-10-16 05:42:50'),
(12, 'webconfig', '0002_auto_20151021_1542', '2015-10-21 07:42:38'),
(13, 'accounts', '0001_initial', '2015-10-21 18:56:58'),
(14, 'carts', '0001_initial', '2015-10-23 16:43:47'),
(15, 'carts', '0002_shoppingcart_other', '2015-10-23 16:54:29'),
(16, 'accounts', '0002_auto_20151125_0950', '2015-11-25 09:51:21'),
(17, 'carts', '0003_auto_20151125_0950', '2015-11-25 09:51:21'),
(18, 'webconfig', '0003_auto_20151125_0950', '2015-11-25 09:51:21'),
(19, 'search', '0001_initial', '2015-11-26 17:51:45'),
(20, 'search', '0002_auto_20151126_1757', '2015-11-26 17:57:30'),
(21, 'search', '0003_auto_20151126_1759', '2015-11-26 17:59:54'),
(22, 'main', '0001_initial', '2015-12-03 17:07:56'),
(23, 'search', '0004_auto_20151203_1707', '2015-12-03 17:07:56'),
(24, 'main', '0002_auto_20151204_1710', '2015-12-04 17:10:25'),
(25, 'accounts', '0002_auto_20160105_1011', '2016-01-05 10:11:24'),
(26, 'webconfig', '0003_auto_20160105_1011', '2016-01-05 10:11:24'),
(27, 'accounts', '0002_auto_20160321_1656', '2016-03-21 16:59:48'),
(28, 'webconfig', '0003_auto_20160321_1656', '2016-03-21 16:59:48'),
(29, 'accounts', '0003_auto_20160321_1721', '2016-03-21 17:21:46'),
(30, 'captcha', '0001_initial', '2016-03-29 09:55:29'),
(31, 'sites', '0001_initial', '2016-04-12 05:05:35'),
(32, 'main', '0002_remove_pictures_hidedate', '2016-06-12 18:35:29'),
(33, 'main', '0003_pictures_hidedate', '2016-06-12 18:35:29'),
(34, 'main', '0004_remove_pictures_hidedate', '2016-06-12 18:35:29'),
(35, 'main', '0005_pictures_hidedate', '2016-06-12 18:35:29');

-- --------------------------------------------------------

--
-- 表的结构 `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('l2e4n5w8g22hvtwkufn75qtun5scogs7', 'MWIzNDJhNmZjMmYxNjg4M2NmN2I2OTQ1M2EzMmZjMTAzZjFlZjY1Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjllNGE0ZjU2ZDUyMGE5NjhiMGIyZTAyOWRhZTFhZWExMmM5NTE1MDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2015-11-05 14:23:19'),
('xg3b62hxwo63blyyaqmnghv55ijrnufz', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2015-12-18 17:11:49'),
('3tnjrglnxfm0t00euem9a39ud460kdxw', 'MWIzNDJhNmZjMmYxNjg4M2NmN2I2OTQ1M2EzMmZjMTAzZjFlZjY1Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjllNGE0ZjU2ZDUyMGE5NjhiMGIyZTAyOWRhZTFhZWExMmM5NTE1MDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2015-12-10 17:51:59'),
('65v5uzhdmemyoo2us00ottuoe08a3cbo', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2015-12-18 16:49:15'),
('rvqpyf3ucht19uufjgtusxqjd9iudhwm', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2015-12-23 09:07:28'),
('w14582eqln5zyidc1mmmzejwod6mq8ts', 'MWIzNDJhNmZjMmYxNjg4M2NmN2I2OTQ1M2EzMmZjMTAzZjFlZjY1Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjllNGE0ZjU2ZDUyMGE5NjhiMGIyZTAyOWRhZTFhZWExMmM5NTE1MDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2015-12-14 17:17:54'),
('kwnng85dzmc3e72b9kg4v752h4z6o05l', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2015-12-18 12:01:31'),
('9sgs8okz1h5xowwptlme0brbcyrobpe8', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2015-12-18 15:45:11'),
('e9d0b4p56yu56or0eycp5y01h5z9ta8f', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2015-12-21 13:57:53'),
('88v839jrip3qffbaj45s3s1ys3mgm921', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2015-12-22 17:59:40'),
('s58bb8vqxhm4z8xi4vr2asbsqmb3wdf5', 'MTkwODllYjM0ZjY5OWQ1OGNhZjg2OTdlZDA4NzU2ZDRmYmEwYmViZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI4Zjc1MTIxM2E1Y2I0ZWFhZTMyMDgzOTBjYmRjN2ZhYjA5ZmMxNzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-01-27 11:27:34'),
('g7z91smxv9yhi4e9qzgyxlkffudapgrh', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-01-11 09:32:57'),
('m5tt1x19id9pefci62bumkvif1s3cbra', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-01-13 15:17:55'),
('crlvwvsu4lraeuis24bgbn0r9kx6xhcs', 'ZTdjNzM1YzA0NTQ3ZmQ0YTJjMGMwMzVjNDg0ZTcxMWI4MWEzNDBlMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImU1MjNiMTEzOTFhYzg1ODU0ODE0YTVjMzY5NzgwYTk4YjZjYzIzMTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNSJ9', '2016-01-19 16:42:18'),
('hynjplw3fyoycdhlhfywn200amrl34sf', 'ZTdjNzM1YzA0NTQ3ZmQ0YTJjMGMwMzVjNDg0ZTcxMWI4MWEzNDBlMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImU1MjNiMTEzOTFhYzg1ODU0ODE0YTVjMzY5NzgwYTk4YjZjYzIzMTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNSJ9', '2016-01-19 16:45:04'),
('wf5cqep1zewg79wsucg5ryup15qb68x0', 'ZTdjNzM1YzA0NTQ3ZmQ0YTJjMGMwMzVjNDg0ZTcxMWI4MWEzNDBlMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImU1MjNiMTEzOTFhYzg1ODU0ODE0YTVjMzY5NzgwYTk4YjZjYzIzMTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNSJ9', '2016-01-19 16:46:03'),
('u1rm7aaqvfio4xicnke865xhm6tkuxmz', 'ZTdjNzM1YzA0NTQ3ZmQ0YTJjMGMwMzVjNDg0ZTcxMWI4MWEzNDBlMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImU1MjNiMTEzOTFhYzg1ODU0ODE0YTVjMzY5NzgwYTk4YjZjYzIzMTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNSJ9', '2016-01-19 16:46:22'),
('hlx45arrez37gru700j45a38jamtphy0', 'ZTdjNzM1YzA0NTQ3ZmQ0YTJjMGMwMzVjNDg0ZTcxMWI4MWEzNDBlMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImU1MjNiMTEzOTFhYzg1ODU0ODE0YTVjMzY5NzgwYTk4YjZjYzIzMTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNSJ9', '2016-01-19 16:46:27'),
('pyv1i73vta4sfgsihx20cw96ho38ba8j', 'ZTdjNzM1YzA0NTQ3ZmQ0YTJjMGMwMzVjNDg0ZTcxMWI4MWEzNDBlMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImU1MjNiMTEzOTFhYzg1ODU0ODE0YTVjMzY5NzgwYTk4YjZjYzIzMTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNSJ9', '2016-01-19 16:47:28'),
('tr5xaangh5llbi3nz2687rfj1ej9k2il', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-01-19 17:02:12'),
('oa2dlgu33q22p2l5x4cubsiull293h3x', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-01-19 17:03:58'),
('we3by2x365cjredfh59ufayd7lrbwzoa', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-01-19 17:04:07'),
('hqvbtweqpfd0g7u14zc3jbs840fdmhsy', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-01-21 18:16:24'),
('jbcc8h34rsx7o1msy4qou05mil7dl273', 'MTkwODllYjM0ZjY5OWQ1OGNhZjg2OTdlZDA4NzU2ZDRmYmEwYmViZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI4Zjc1MTIxM2E1Y2I0ZWFhZTMyMDgzOTBjYmRjN2ZhYjA5ZmMxNzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-01-27 11:58:06'),
('t6v39pfdxn3b5h2tebaqmlggo3i10b4z', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-01-27 11:59:03'),
('5jjj66hjy7q3tf2vhnmg718m6mlacf4o', 'MTkwODllYjM0ZjY5OWQ1OGNhZjg2OTdlZDA4NzU2ZDRmYmEwYmViZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI4Zjc1MTIxM2E1Y2I0ZWFhZTMyMDgzOTBjYmRjN2ZhYjA5ZmMxNzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-01-27 13:49:16'),
('36pym5pkfazdo13sgdmrt623gs6brave', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-01-27 15:34:38'),
('vkliwi03nnjj8uotvbt8asd6pjvdbczj', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-01-27 17:14:36'),
('1wsrnpajc15x0mtt9wvwzbm0c25nlruk', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-02-12 09:33:16'),
('dlyaexstut34yhbvec5nug633bcreyet', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-01-29 09:22:05'),
('gieqersf5dbx95w5u8cciqwfvxm06axe', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-01-29 15:40:50'),
('1amvehz10agrpih43kpa0tjobthu4gyf', 'ODZkNWEwNjk3MmRlMmNhMjk5NWE3YWE4ZDNjNzlhYjRlNDAzMjFiYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-01-29 17:56:35'),
('ogqyccykfp1oybhrntp75qiibimvq5yo', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-02-29 11:49:57'),
('jnbwd05a4wri38x3q9ysx44i7f5repk4', 'NDgyNzY3ZDAyMzIwNmIzZjViMjk3NTEyNWEzZDgzMTc0MmY1YzJjNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjFlMjA0NWY3MzViYzM4ZDI1MTZkZTQ2ZGRhMDEzZmJiZDA2NDg3OTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-03-04 09:07:20'),
('sukcy0o0khzo94mazumwfphs8ugjaby0', 'MzM3ZDE0NmE1NWI1MzI2MmY0NTQxMzc4Mjk2ZGNmN2ZkMTg4YjU5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxN2Q5NTUyNzA5OTVmYjRjMGQ3ODJmYWI5YjM5NWNlOGVmYjlkNjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-03-04 17:43:30'),
('59rwd2qhgqsnxp0e19rqmh8ls544tu3j', 'MzM3ZDE0NmE1NWI1MzI2MmY0NTQxMzc4Mjk2ZGNmN2ZkMTg4YjU5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxN2Q5NTUyNzA5OTVmYjRjMGQ3ODJmYWI5YjM5NWNlOGVmYjlkNjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-03-07 09:07:40'),
('7jtx8jkjumf87leavlwxb9bcvry5qoc0', 'MzM3ZDE0NmE1NWI1MzI2MmY0NTQxMzc4Mjk2ZGNmN2ZkMTg4YjU5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxN2Q5NTUyNzA5OTVmYjRjMGQ3ODJmYWI5YjM5NWNlOGVmYjlkNjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-03-07 11:07:53'),
('e2oti2yegdvmf18x421wj68n2uhpjtdx', 'MzM3ZDE0NmE1NWI1MzI2MmY0NTQxMzc4Mjk2ZGNmN2ZkMTg4YjU5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxN2Q5NTUyNzA5OTVmYjRjMGQ3ODJmYWI5YjM5NWNlOGVmYjlkNjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-03-07 15:59:11'),
('0wsdcp802vtk7ve5xcmnsn7s2zl7k1jt', 'MzM3ZDE0NmE1NWI1MzI2MmY0NTQxMzc4Mjk2ZGNmN2ZkMTg4YjU5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxN2Q5NTUyNzA5OTVmYjRjMGQ3ODJmYWI5YjM5NWNlOGVmYjlkNjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-03-08 13:09:57'),
('wjvfuhl8mvcmrbgc16ee2gjqmkv0yp7s', 'MzM3ZDE0NmE1NWI1MzI2MmY0NTQxMzc4Mjk2ZGNmN2ZkMTg4YjU5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxN2Q5NTUyNzA5OTVmYjRjMGQ3ODJmYWI5YjM5NWNlOGVmYjlkNjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-03-08 13:26:16'),
('zoa94sdjmjkchngbpvikz4pki4tuy39o', 'MzM3ZDE0NmE1NWI1MzI2MmY0NTQxMzc4Mjk2ZGNmN2ZkMTg4YjU5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxN2Q5NTUyNzA5OTVmYjRjMGQ3ODJmYWI5YjM5NWNlOGVmYjlkNjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-03-08 14:49:06'),
('5ixfa18raac65vxlkrmnrfnvt7lj36ce', 'MzM3ZDE0NmE1NWI1MzI2MmY0NTQxMzc4Mjk2ZGNmN2ZkMTg4YjU5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxN2Q5NTUyNzA5OTVmYjRjMGQ3ODJmYWI5YjM5NWNlOGVmYjlkNjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-03-09 09:11:19'),
('bx8q1j1jjsimni9zadti0efh6amxm5nl', 'MzM3ZDE0NmE1NWI1MzI2MmY0NTQxMzc4Mjk2ZGNmN2ZkMTg4YjU5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxN2Q5NTUyNzA5OTVmYjRjMGQ3ODJmYWI5YjM5NWNlOGVmYjlkNjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-03-09 17:55:50'),
('osey17lqwbjw8w5nxhajsp4ulgg9aqvj', 'MzM3ZDE0NmE1NWI1MzI2MmY0NTQxMzc4Mjk2ZGNmN2ZkMTg4YjU5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxN2Q5NTUyNzA5OTVmYjRjMGQ3ODJmYWI5YjM5NWNlOGVmYjlkNjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-03-09 18:07:57'),
('br5kriw19l9998lfzqki89g8wh9f6xxj', 'MzM3ZDE0NmE1NWI1MzI2MmY0NTQxMzc4Mjk2ZGNmN2ZkMTg4YjU5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxN2Q5NTUyNzA5OTVmYjRjMGQ3ODJmYWI5YjM5NWNlOGVmYjlkNjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-03-10 17:58:57'),
('gn5op50j4047xxrgxyh816aumi8yzq8l', 'MzM3ZDE0NmE1NWI1MzI2MmY0NTQxMzc4Mjk2ZGNmN2ZkMTg4YjU5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxN2Q5NTUyNzA5OTVmYjRjMGQ3ODJmYWI5YjM5NWNlOGVmYjlkNjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-03-11 11:00:14'),
('1l3mvp75ybevvqngt0wqrtrp5teb9p6h', 'MzM3ZDE0NmE1NWI1MzI2MmY0NTQxMzc4Mjk2ZGNmN2ZkMTg4YjU5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxN2Q5NTUyNzA5OTVmYjRjMGQ3ODJmYWI5YjM5NWNlOGVmYjlkNjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-03-11 13:31:50'),
('i0f90kfdlu4gh6724uadw8ms9kted7v8', 'MzM3ZDE0NmE1NWI1MzI2MmY0NTQxMzc4Mjk2ZGNmN2ZkMTg4YjU5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxN2Q5NTUyNzA5OTVmYjRjMGQ3ODJmYWI5YjM5NWNlOGVmYjlkNjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-03-11 16:21:30'),
('wufxx3u7ylhjgkv6gdqxlcp1qyuopftt', 'MzM3ZDE0NmE1NWI1MzI2MmY0NTQxMzc4Mjk2ZGNmN2ZkMTg4YjU5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxN2Q5NTUyNzA5OTVmYjRjMGQ3ODJmYWI5YjM5NWNlOGVmYjlkNjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-03-11 17:55:09'),
('er6znkjmfas2ddfdyrygpzec11bg3zti', 'MzM3ZDE0NmE1NWI1MzI2MmY0NTQxMzc4Mjk2ZGNmN2ZkMTg4YjU5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxN2Q5NTUyNzA5OTVmYjRjMGQ3ODJmYWI5YjM5NWNlOGVmYjlkNjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-03-14 09:56:56'),
('yah48b2e76rq9hc41c37fdk4x4tcsemx', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-03-14 09:59:13'),
('7hkzboyp9m6if5x0xyagqy113af0ujl2', 'MzM3ZDE0NmE1NWI1MzI2MmY0NTQxMzc4Mjk2ZGNmN2ZkMTg4YjU5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxN2Q5NTUyNzA5OTVmYjRjMGQ3ODJmYWI5YjM5NWNlOGVmYjlkNjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-03-15 14:12:24'),
('zirvovz3lr0nmo529vq9viu99dako8ux', 'MzM3ZDE0NmE1NWI1MzI2MmY0NTQxMzc4Mjk2ZGNmN2ZkMTg4YjU5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxN2Q5NTUyNzA5OTVmYjRjMGQ3ODJmYWI5YjM5NWNlOGVmYjlkNjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-03-15 15:20:34'),
('2342m4apt8oytnfyh46mmk9ctcq34s0c', 'MzM3ZDE0NmE1NWI1MzI2MmY0NTQxMzc4Mjk2ZGNmN2ZkMTg4YjU5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxN2Q5NTUyNzA5OTVmYjRjMGQ3ODJmYWI5YjM5NWNlOGVmYjlkNjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-03-15 15:45:38'),
('pbcf67vl1oj30pphopuh5vww9lwlg97a', 'MTkwODllYjM0ZjY5OWQ1OGNhZjg2OTdlZDA4NzU2ZDRmYmEwYmViZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI4Zjc1MTIxM2E1Y2I0ZWFhZTMyMDgzOTBjYmRjN2ZhYjA5ZmMxNzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-03-16 16:59:16'),
('v1hrw3hrkegme4fbdiph19qmfo6yycwa', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-03-16 13:14:59'),
('665xxiu6fn4pjdh0uxat0tmup28j15te', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-03-16 15:06:32'),
('rmmapeymbrd2bwzk41mf3swcnn5grwij', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-03-16 15:10:17'),
('byt0egt4c0h8w8ubafunwxvcuzal3k5h', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-03-16 15:11:49'),
('36anqfnlegmsc7nxg80lo9080v5yiu4g', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-03-18 09:18:16'),
('k18uwakecue3lmvxt0zgzqbddsku30ct', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-03-21 09:26:43'),
('a6eig83d1equmy0myv3wu80rzrv8xy3g', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-03-21 10:37:10'),
('1znbs0mm72bejanhl5qccq4tyn4bjzcc', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-03-21 10:37:38'),
('wx0y4doc6xbxmjspfc8fwzfy0t3x83hz', 'MTkwODllYjM0ZjY5OWQ1OGNhZjg2OTdlZDA4NzU2ZDRmYmEwYmViZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI4Zjc1MTIxM2E1Y2I0ZWFhZTMyMDgzOTBjYmRjN2ZhYjA5ZmMxNzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-03-25 11:46:21'),
('nbg7swhuhgyvr7zf49pffnfaow9tpvkl', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-03-23 17:54:44'),
('nld5e4iooldccaapsi46oybehajxcs32', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-03-24 10:45:54'),
('1lupagx8tm4dja159vhjfju09q83ca0u', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-03-28 15:56:43'),
('xn83e2txo78bt3kq4k7jfbdt3m5iuask', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-03-28 15:57:39'),
('0avdv0f5jgrqaq4dhu0zqex3m7h6l0bv', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-06 09:32:24'),
('xp24f61d179u6scrjkotu5cpy34byyse', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-04 16:08:00'),
('3sd11vqrhkjzq22yvhp2gnqzlnn7io2v', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-04 16:08:09'),
('8ewed6pwgb3qlsef29ux6x10r256hz0t', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-04 16:09:11'),
('kivee43rjma4559ow9rkfbdg5r6qw9kc', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-04 16:51:29'),
('lqbwk9697aso7r4tgvdwuc2g4gna8igz', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-05 11:49:25'),
('3zjkd3nohi6ubs6nif7op6uckfhho1cj', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-05 11:49:51'),
('lrqaauqt34gmc1ta2zsj5tmr24tqhk85', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-06 09:34:54'),
('6wupxy6ke1vz8jqoup8i3d116icwufef', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-06 11:02:14'),
('fv4qqri7usxy4xbyzues7dyua54r8vuy', 'MzM3ZDE0NmE1NWI1MzI2MmY0NTQxMzc4Mjk2ZGNmN2ZkMTg4YjU5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxN2Q5NTUyNzA5OTVmYjRjMGQ3ODJmYWI5YjM5NWNlOGVmYjlkNjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-04-07 11:21:50'),
('349ecu28ba7e2gg11lhxjasplq7b5wv5', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-13 14:41:46'),
('0q3r6zbixflqmzcaodcof3yhranbirny', 'MTkwODllYjM0ZjY5OWQ1OGNhZjg2OTdlZDA4NzU2ZDRmYmEwYmViZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI4Zjc1MTIxM2E1Y2I0ZWFhZTMyMDgzOTBjYmRjN2ZhYjA5ZmMxNzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-04-11 13:42:26'),
('71i9gywejtcmjbbqmdaw4ri1r49j6sfh', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-13 10:40:44'),
('2wy31v6j88lvffejh3g1n13596c8louj', 'N2EwOGQxZDNlOWIyMDNjM2M5ZGEyMjAzMDUzMzZhNTk4Njc3YWM3ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjVmNzFhZTFmMmI1YjgyYzExYzgzYTZhYzY3NGZlMzBmNzIxMmE3NDciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NjcifQ==', '2016-04-11 14:32:34'),
('zao37xxzkhnt1s03ufwxmysyuki6lo41', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-11 14:29:32'),
('ao7h1b9l27qbyvll9oty287jikckzdhj', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-12 13:53:48'),
('09jtrc8vw1ju09iobw8g7c9zruwvdkmz', 'N2EwOGQxZDNlOWIyMDNjM2M5ZGEyMjAzMDUzMzZhNTk4Njc3YWM3ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjVmNzFhZTFmMmI1YjgyYzExYzgzYTZhYzY3NGZlMzBmNzIxMmE3NDciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NjcifQ==', '2016-04-20 14:27:22'),
('e1d41zcj9f9mvc8m14dopjg60y7v0bem', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-20 17:36:17'),
('eit5zwnzvlr8osxgoqlmcqwfsklz0s4g', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-04 18:16:18'),
('xai77iwp6vgmoq7fef9ffugdpm12xez2', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-22 11:38:26'),
('phm3uiiwxf8bm1e91f8a8toefvb8ggz3', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-26 11:18:22'),
('v71deiq6ytby0xd7nqkvdelvnd3nyvx4', 'MGFjZTEwZmZlZWIxOGIzMGFjYmFkYmFlZmM2NzVlZjNhZjM3N2ZjZDp7Im9wZW5JRCI6Im83S0hvdDVuc0RpT3hJIGY2b21ZMWM2dk1xWFNvIiwibG9naW5fdXNlciI6IjEzNDEwMzIwMDA4In0=', '2016-04-26 04:02:06'),
('h8n524srmdz1kh5z9douekbrh1fxrisi', 'MGFjZTEwZmZlZWIxOGIzMGFjYmFkYmFlZmM2NzVlZjNhZjM3N2ZjZDp7Im9wZW5JRCI6Im83S0hvdDVuc0RpT3hJIGY2b21ZMWM2dk1xWFNvIiwibG9naW5fdXNlciI6IjEzNDEwMzIwMDA4In0=', '2016-04-26 05:30:54'),
('f7vnbpy52axtfdsuul3m2uchp5rax6z0', 'MGFjZTEwZmZlZWIxOGIzMGFjYmFkYmFlZmM2NzVlZjNhZjM3N2ZjZDp7Im9wZW5JRCI6Im83S0hvdDVuc0RpT3hJIGY2b21ZMWM2dk1xWFNvIiwibG9naW5fdXNlciI6IjEzNDEwMzIwMDA4In0=', '2016-04-27 01:23:42'),
('0j8bitbvz8fth7x449e5bvprmb4hn1fk', 'YTFiZTg5MjM1N2RiMmRmYzcwOTMyZDY4NzllOTNiMmZjY2VmNjNiMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2lkIjoiMTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2016-04-28 10:51:53'),
('j9qvq50mmvfwv0cxomjbu3qssms3mamf', 'NzNjY2UzZjIxMTE3ZWIyZDRiMjE5YTc0NTA3NWU2NzVlNjU5Y2I5Mzp7Im9wZW5JRCI6Im83S0hvdDVuc0RpT3hJIGY2b21ZMWM2dk1xWFNvIiwibG9naW5fdXNlciI6IjEzNDEwMzIwMDA4In0=', '2016-04-28 10:04:16'),
('0e1om65tuku9t6jh3zyv3bnk1h0uyw0c', 'NzNjY2UzZjIxMTE3ZWIyZDRiMjE5YTc0NTA3NWU2NzVlNjU5Y2I5Mzp7Im9wZW5JRCI6Im83S0hvdDVuc0RpT3hJIGY2b21ZMWM2dk1xWFNvIiwibG9naW5fdXNlciI6IjEzNDEwMzIwMDA4In0=', '2016-04-28 10:09:07'),
('s6j2mall6dd7ey1paaawovz79j0klb45', 'OTY5MTI4ZDZmODE5NGJiMDc3NGZlMDgzODk3NWE1NThhMzJhZjZkNTp7Il9hdXRoX3VzZXJfaGFzaCI6IjkzNjc1YWVhYTMxMzA5NTE1OTk3MDQyMTA0OTZjOTU2ZDFhNTJiNjMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-04-28 11:15:00'),
('up75cva7ib9g8ysh7x9q6qniagrrun1i', 'NmU2MTlkNWZjOTg0YjRjY2FhZTNlMGMxOGU4NGNlOWNhNzE4MmE2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjkzNjc1YWVhYTMxMzA5NTE1OTk3MDQyMTA0OTZjOTU2ZDFhNTJiNjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-29 01:32:27'),
('jisr2fy6x8jf8p1dtlnnoupvctrafry5', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-06 08:20:32'),
('yq33jr43qcg546tiizec34x3s2h6aivz', 'NmU2MTlkNWZjOTg0YjRjY2FhZTNlMGMxOGU4NGNlOWNhNzE4MmE2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjkzNjc1YWVhYTMxMzA5NTE1OTk3MDQyMTA0OTZjOTU2ZDFhNTJiNjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-29 03:07:17'),
('x9v32voh1cm11v7giob7npnrtpjywhhw', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-04-29 06:39:56'),
('54ew5qywzjrqsjwalet4ht6ysa01avwh', 'NmU2MTlkNWZjOTg0YjRjY2FhZTNlMGMxOGU4NGNlOWNhNzE4MmE2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjkzNjc1YWVhYTMxMzA5NTE1OTk3MDQyMTA0OTZjOTU2ZDFhNTJiNjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-04-29 07:00:47'),
('dz0vq1f5d0rnsgzot3owyw2brit76pyj', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-02 16:57:32'),
('ovzl2p29ug4xhgxj8hzeolopy8gosi77', 'NmU2MTlkNWZjOTg0YjRjY2FhZTNlMGMxOGU4NGNlOWNhNzE4MmE2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjkzNjc1YWVhYTMxMzA5NTE1OTk3MDQyMTA0OTZjOTU2ZDFhNTJiNjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-03 09:26:01'),
('80rr6wuj99hp9bdxsu6dmk62jgj5tnww', 'NmU2MTlkNWZjOTg0YjRjY2FhZTNlMGMxOGU4NGNlOWNhNzE4MmE2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjkzNjc1YWVhYTMxMzA5NTE1OTk3MDQyMTA0OTZjOTU2ZDFhNTJiNjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-04 07:41:46'),
('qdahe7frvke4eecetd9wa8rng1b6v0ai', 'N2EwOGQxZDNlOWIyMDNjM2M5ZGEyMjAzMDUzMzZhNTk4Njc3YWM3ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjVmNzFhZTFmMmI1YjgyYzExYzgzYTZhYzY3NGZlMzBmNzIxMmE3NDciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NjcifQ==', '2016-05-04 11:00:36'),
('ror76k0bjq07v2whsj77urxhhamb4ei6', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-05 05:49:10'),
('bxjfqjf2vsxvtjmpdkwtv9bdge8av0hi', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-19 18:44:25'),
('9n0ilm1x71hqocteq8cnv4h1zhvbl15x', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-05 07:29:31'),
('mdqbdxzg2oefs64slgw894qclv4ytq9y', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-05 08:53:55'),
('ye8qsrolgwsn17n28ihxhe80ghqrnjtv', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-06 00:31:53'),
('6sgj250h0yduu12k5lt6ubuan3u07owl', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-06 01:45:53'),
('coxe8qykmosvhu5f3ytm7bwiz8kt27ve', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-06 02:17:28'),
('s1o6p6mb35ydurekip85wq1zqgl09ych', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-06 03:34:40'),
('7v99ic4t52h2t1cyoodz97ghv6pkucuh', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-06 03:35:56'),
('8zo9yrmeatfm6j7zmhk5r1v8k2mfg2d4', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-06 03:50:17'),
('sazyw6c9mhf1q6zlrp8rdsr17g7s2fag', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-06 05:36:32'),
('n2hbnx1ae8ifjtzcrami5idmtcrfvrbi', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-06 06:12:11'),
('vunn078h1psxync4am0ha8sphwzeji1y', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-06 06:26:16'),
('f9edhxkd009u7r5rvkufg1i5k9u9amd2', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-06 15:35:28'),
('41m9uqsad32sqqy9wv4jj0vm82tkgimd', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-06 07:20:26'),
('wauj4ur8qvwske8o7ier8lflb76d5nsx', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-06 08:36:22'),
('2k5o5m1p4qh91mi5ylsftlamkv02ij3m', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-09 08:49:03'),
('h4206r5zpmz1uxg4bh71ygc9fekyvx0j', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-09 10:31:51'),
('40f68f5s7yihk83objh1bn6n8e51iwev', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-09 08:58:04'),
('fk33m39cbcaho8bhkk3onnginhvu2hq4', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-10 01:09:10'),
('ttt8cxem38x5tz4y3ye60jp4l6gn908d', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-10 02:36:59'),
('5l0f1hzx3fhat82gspdpesso27djrqpg', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-10 11:18:50'),
('hq1s6urvsgd6a2m402gutn32c5kwtloz', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-10 03:25:37'),
('bqcigakn9s08op899t5maix48h6a4sta', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-10 03:38:29'),
('ofalqvw9aypv88k37xtcc1ggtz007kol', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-10 03:54:36'),
('ofqij6kqv1dl661vcmcay31upjamytd2', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-10 06:04:13'),
('awkvlp83qzz7xj3qv7jwbhq4sjto0y27', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-10 06:25:48'),
('wa7msz45a8jev0nm72t8gt0254rmjno7', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-10 06:40:50'),
('wjj0fw70cz425p50qz2m4ueinxvd0obx', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-10 07:27:39'),
('txsggw2fe71qylcd45fb406fnol85k5w', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-10 08:14:57'),
('mth8fs2nut4dzsyjb5l94eu7xrfodanf', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-10 08:42:30'),
('3zc35ot5c43llq35xpks565uy943xt90', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-10 08:43:44'),
('fgf60rhy033jamd4vpp9x9q9ggyy4vzh', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-10 08:45:38'),
('0tpuiynwsc9x99srw2898t438dddo6li', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-10 08:48:41'),
('ekkhe6gq37nakscs7uvfcl9924l0z7lm', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-10 17:21:06'),
('zypgsa6yd6noodctqhv3mlojl0nod2kd', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-11 00:51:03'),
('ce2a38timaa3ps8sx7pzo2xpjz4aqw8o', 'NmU2MTlkNWZjOTg0YjRjY2FhZTNlMGMxOGU4NGNlOWNhNzE4MmE2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjkzNjc1YWVhYTMxMzA5NTE1OTk3MDQyMTA0OTZjOTU2ZDFhNTJiNjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-11 09:35:30'),
('zdamygtesa2u0u8pw3qbjxztdo0yy578', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-11 05:49:09'),
('qb3favg0qlyyiypfis4s91x0g62eg598', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-11 17:48:10'),
('ig6l9oru18i8ecrn6y0152rexsekbj6l', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-12 06:23:08'),
('c70d0ixck4fw2sv7p4s8gerfaenec0lx', 'MzUzYWQ5ZDRjZmJjZmNjMDhjM2Q2ZDY5ZTNiNmZmODIwNjQ0Y2Y1Mzp7fQ==', '2016-05-12 09:06:45'),
('ykfq8cklm4cbs0grwjtn43cubyokzyqq', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-13 08:59:06'),
('ygkljumjv6rha3dn82lhj1en24dnpyb2', 'NmU2MTlkNWZjOTg0YjRjY2FhZTNlMGMxOGU4NGNlOWNhNzE4MmE2Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjkzNjc1YWVhYTMxMzA5NTE1OTk3MDQyMTA0OTZjOTU2ZDFhNTJiNjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-13 02:16:38'),
('zc4lvmw0insjxy6vq1xfhaklj3bgzw31', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-13 14:22:28'),
('2oflfknckw6o26hwjuebm9b3h6pxyeyv', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-17 00:28:31'),
('dlggqa6fjlr9m1yqf8q2jzxz8m571i3s', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-19 10:31:15'),
('mkxcdlp505vtmx22jmq0r5z1fmuquarg', 'ODZkNWEwNjk3MmRlMmNhMjk5NWE3YWE4ZDNjNzlhYjRlNDAzMjFiYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-05-23 09:59:10'),
('va1z549jy6tztv18u2j0mmwuk48ipqbi', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-19 10:30:14'),
('e6urgt0op7hpvzagrsn4zeb8mss64dj7', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-19 18:42:39'),
('vbezjuis4b3msga9rrkjbd5scr9ktdm7', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-24 15:25:06'),
('l06l99dtgordt0ttv3tf7w5kdplinux2', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-24 15:25:13'),
('fgxetvux2u71gkhl19vwgecf0g7lrfdo', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-25 09:21:38'),
('c48ebvkcfjzayrlal4lgacnsegh5bros', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-25 14:07:39'),
('4vpym9ifegbri55q5e83wcd9smofcpij', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-27 13:47:52'),
('0yvrnni0oxvzhh6tmkarwcu9mpxye072', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-26 16:58:04');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('10ivcutv5igtpayg0lwnr7h5qpynslv1', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-27 09:42:54'),
('d1dr8ldeycnc9h14l5yst3uhkh679yda', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-27 03:58:15'),
('dhhd2s41g4dk7z2j8fx2ny587wcbv0bf', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-30 09:13:56'),
('ugl7p4qir4mkdwcir5tj1tlpbowc9wvd', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-30 10:32:48'),
('hj4qmiy4u78qxp5tvt6dqn7cebxj6rzk', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-30 10:42:42'),
('mo2fm2if51s6rsfbps034v4phx0lqnmv', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-30 13:05:36'),
('2qqagvyro1dcwzac7zfva03rtt1iy398', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-30 13:59:49'),
('jw3e4ldqztsk3cg2xm566yw1i8p073tf', 'ODZkNWEwNjk3MmRlMmNhMjk5NWE3YWE4ZDNjNzlhYjRlNDAzMjFiYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-05-30 14:50:42'),
('ibm7irs3f5ummva2e3290ues1lsiu8ot', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-30 16:21:22'),
('iy76f1vut4g8ykzf0lwrllbu1ye4hxz6', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-30 18:31:50'),
('c4u4s9xr6agtp8e7s8saieickxk0nunh', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-31 13:30:56'),
('z9o332szp827m7joms4ctiuq8ufoy2cl', 'ZWIxMWRiZjhjODA4MTYzYjlkYTUzMDAzNTVmNmFmNjNmNjQ4NzA0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyODlkM2FmN2MwMzExOGEzNTkxNGJkMjcyMjM0NDA1YmFiOTU0NTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-05-31 03:28:21'),
('p0kg1hyy5n8eb3xjqr2gr9880fwv6ju8', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-31 15:10:20'),
('jpzbgf5c93ki8lub8hfq75e89s5f2m8s', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-01 09:00:14'),
('64a18t0az7vyx9wlhuc6d4tdjqi1ozrf', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-01 09:13:49'),
('ipxk8rja97o368xjbq3v8u0jdsw408lc', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-02 13:07:50'),
('o7fpki6gw99il0ff55flmj41ibsiun0g', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-06 15:06:11'),
('qlmzlf0q3xn8ec9a3j7umoif4ld1lhhb', 'MThiYWI5Yzc0YmQwNGNlYjdiMGVmNGViY2FiYmUzYzcyNmQ2ZjVkYjp7ImxvZ2luX2Zyb20iOiJodHRwOi8vMC4wLjAuMDo4MDgwLyJ9', '2016-06-02 13:35:58'),
('9a0e40gso4l34ptux6uqu82p5ip0n7q1', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-03 16:51:09'),
('bmhybf6jn3q4liear0wu89n0puxej4cc', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-02 15:11:59'),
('3ptbalamsww7j7p4hmoettbr4uzsf52t', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-06 15:00:02'),
('3arsdnqwyev9mwebj3goull64rrehtsw', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-06 11:15:52'),
('w1vcldk4r9jd42fadqsl6xr78rmeppre', 'NjExYzVlZDM1OTVmNDAwMGRjYmY3YzM0ZGI0Y2Q3ZWM1NTdhMWE3YTp7Il9hdXRoX3VzZXJfaGFzaCI6ImY1YmM4MDM4MWYyNjk3ZDc5ODJjMWQ4MmU4YmJmZWMwMWE1ZTMzMjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-21 14:18:53'),
('3m8agvbpw869gy79w1tj1g8q2a4pmmo8', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-06 16:07:21'),
('3ct7bchj4gl22x3ybflw4jnq4o2dcrxh', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-07 09:17:47'),
('00gr14exrea4y0kyh5aeyvzok8jd7uxf', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-07 09:37:12'),
('9qyqf11voq1oyzf4zk47ks0n0szvwjbw', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-08 16:51:02'),
('b55krdazddiwv4v545d7wb73203sxty0', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-09 09:06:16'),
('7ssnzb89obst9lyfuqg344zry8r6dbkw', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-09 09:59:56'),
('6esx9p6crrpkejkbo1864fqgxvzw8keo', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-09 18:03:00'),
('tui3tm60rws8rlslt5nhm3imfrpl5zbo', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-09 18:09:13'),
('oetqh038qwo3dq4oydgcbczko9xpng9p', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-09 18:25:01'),
('6fb9bmuno998hmwi61s707zwd782ty56', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-10 18:26:23'),
('hrfddm17hcn5grysovln2eka108y4bed', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-13 09:13:50'),
('bj4sztiyxfwhqaolit3yhfok9pwe9xhu', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-13 09:52:52'),
('p7we3i8mu3hudwagmrgtrzdfcn03a3ag', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-13 10:20:02'),
('y16fp2nxrxqidurumwjoi4echuogilqz', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-13 14:19:44'),
('zycyjup6u4u4iu10rdjouq27rmjf34zj', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-13 14:44:15'),
('n6mqe2sscqcrxnadztel2fnvraelacwu', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-13 15:14:55'),
('fofjtakgkeclg4m3k9102vwk1yxg9291', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-13 16:28:01'),
('wjqzdxw7l9gbk6j0rinzmr38il9ss5b5', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-16 14:34:36'),
('w7rjrafc8g2o5pxjvp9zu5pkwqo1x5v1', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-15 13:51:11'),
('r4o6c7165c1n0wdgi9k86ufixsluneyc', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-16 15:06:46'),
('tltrrnr8lpqujk3812uddq9eywbh11a9', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-16 15:27:21'),
('ec2a8jdwfctsgn7xvowpoub6veuyq6f5', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-17 15:18:18'),
('srt6d0atgus52z96zbpzmzaj8kk4qsqy', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-20 10:36:28'),
('dzf14r73unh2igyud64lfrgjb5r1z7cw', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-20 10:36:34'),
('ckhyb8ipmk9fk86ozbpisoe5jaidp1zt', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-20 11:01:23'),
('f7292nt46a8e22wo4mi34ctrfwcr71wt', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-20 13:52:41'),
('8wt6ojv585j1sov81zqfcbclplpcrrk0', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-20 16:34:56'),
('6rrrxu0zk26wdscngpqcksyky5ebeezv', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-21 15:25:47'),
('a0641489bptm5hlk8f1zc9baz1rwd2n0', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-22 10:00:35'),
('cfxet10rn93dnznckfeybzjzvcwmvjhv', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-21 09:44:56'),
('i6r4dp8v69r993s6qttglstlco2stmps', 'ODZkNWEwNjk3MmRlMmNhMjk5NWE3YWE4ZDNjNzlhYjRlNDAzMjFiYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-06-21 09:52:08'),
('vav5ejcx80c4d4z7w7iszczwoym2hb10', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-21 10:57:27'),
('nutcmfipt4lsqrybt3h0fnbs2tgir4kd', 'YjMwM2NkZjk4YmExOTkyYzQyZWJiNWU3ZmU2OTBmYWQzMmViNWIzMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMGJhNzQzOGEwYTZkYzg1OTQ2NTY4MzE3ZDkzMTBmOGJjMDZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-21 11:20:19'),
('206g6fgz96rdjfmryrfsej2alzhu1mqy', 'YzBmMTRjNWM2OWRjYjRhYTQ0ZTk4Mzk1MDYzOGVlZDgwOWVlZDM1Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU3NjhkZTdjNDI5ODY1MWRjZmEzNDJhYWVhMTc4ZTY2NjMwNGJlY2MiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-06-21 13:54:01'),
('r38ote83dtpwep2wsv4c6l7e1mrc74ig', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-21 14:22:27'),
('k4l0dahcisfv9ir0836amytli3r7hxjh', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-21 15:48:36'),
('a7aeelntj11x25nno2puvtozvdvtqbhw', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-21 15:53:01'),
('uo8a3pji0y2iz4zmyhaspsrucqkuj58e', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-21 16:46:45'),
('56gffnabwigiu0xaxpl42o1m5bhh305g', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-21 16:51:06'),
('wr3k5zyqeaafrc2yrhbxf1rbdfahmsse', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-22 09:54:35'),
('zjciturtlnjzvaem8xslfi07w3tqjjao', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-22 08:46:23'),
('3216oo0uhdgbvrd76zrfrg1jefwv8xzp', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-22 09:28:26'),
('v6r3vvy9397dy90l7lyfzh0kqutqjvce', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-22 10:03:49'),
('2pv9pl0koyhl97sxcbbcgwk4x813fa98', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-22 11:15:43'),
('fvocg9jey9fdaqvwssb8453y5neeuhbe', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-22 11:24:25'),
('qy0rnwxncayjhmbdpdlvetrcc700o24a', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-22 11:29:13'),
('60kswqtm7nabzhn8t7v64adgvg30dvup', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-22 14:54:26'),
('p5cyau467j4lpsud85wf3mpnmbrmpd7u', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-22 15:39:14'),
('j6fzkzkqwrp713kzux1k49ktij6jt3zy', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-22 15:54:46'),
('fgfhoadwejkgdwd94bhthe9xa74ulxce', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-22 17:34:31'),
('liva8vhvkxggtbztr2l2pusnkuex48sb', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-22 18:01:41'),
('fh6cjjmgqmkvkw7kjbe5zqkqr93ysqcf', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-22 18:01:46'),
('u8gy5bi9p2pzzcdsktug1ed894ty3q8h', 'ZmM2OTViYTJmNmRhZTE3OTI2NzhjMTExMzAxOGU4MjRhMWNhYmVmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzNjJlZTg1YzRiOTE3YTA0ZTQ1NjMwNmNhZDkzZGQwZjM3ZGIyM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NzAifQ==', '2016-06-26 10:24:58'),
('t6vitt6i97h423d4ssxbkr3xjab7ky0e', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-26 10:49:59'),
('den6cltioaplkpfdglbfa8rx1rpfwr03', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-26 11:09:27'),
('i6r1xa7pocysj37nphka1xpqhtr2ld9c', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-26 15:45:51'),
('zs8zoe3urlhl8k3k6867unousm0kx912', 'ZmM2OTViYTJmNmRhZTE3OTI2NzhjMTExMzAxOGU4MjRhMWNhYmVmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzNjJlZTg1YzRiOTE3YTA0ZTQ1NjMwNmNhZDkzZGQwZjM3ZGIyM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NzAifQ==', '2016-06-26 16:03:40'),
('6enmnwajurry9f798m14lpkpp1ncfgv2', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-27 10:32:41'),
('x34p45mmemrnfr58787blcaeaa83x5s6', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-27 13:42:59'),
('8uo3ro31c5yjby8q0jgfupiwfp1yzdie', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-27 14:50:52'),
('v1xbivrkde2kz6sumpjltblh4n1xmz9h', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-27 15:55:46'),
('u8s2jr52odofmf6zvvgj1zzca0y3mhsr', 'ZmM2OTViYTJmNmRhZTE3OTI2NzhjMTExMzAxOGU4MjRhMWNhYmVmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzNjJlZTg1YzRiOTE3YTA0ZTQ1NjMwNmNhZDkzZGQwZjM3ZGIyM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NzAifQ==', '2016-06-28 09:37:17'),
('1bw034dqhgtm21chbzoz1x88dgiskb2k', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-28 13:30:38'),
('nk8sb7bycgpiw2y4gsxgz1kauptpfnop', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-28 14:05:50'),
('ya4bmggn455rwtn9t5wqvc0sfg9y9dfs', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-28 16:30:00'),
('7nn823wb66bcnc3jaso9261ghkmpg8t3', 'ZmM2OTViYTJmNmRhZTE3OTI2NzhjMTExMzAxOGU4MjRhMWNhYmVmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzNjJlZTg1YzRiOTE3YTA0ZTQ1NjMwNmNhZDkzZGQwZjM3ZGIyM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NzAifQ==', '2016-06-28 16:48:14'),
('ptzdvwoqeffxtjp44eeo5bvfzn6gw90q', 'Mjg3YTkzNTZkNzMyOGI1YzA1ZWM0NTc3NDg5NDk1OWQ1MzczYTM3Mjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2lkIjoiMTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2016-06-28 17:56:05'),
('t8faf13xgsze7dnghzrqx3qqdtxulc0u', 'ZmM2OTViYTJmNmRhZTE3OTI2NzhjMTExMzAxOGU4MjRhMWNhYmVmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzNjJlZTg1YzRiOTE3YTA0ZTQ1NjMwNmNhZDkzZGQwZjM3ZGIyM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NzAifQ==', '2016-06-30 14:16:46'),
('u9f0l0ssu27l2ldsg9fub3z4a0ic5ryw', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-29 11:03:23'),
('0buc1gjicqd0xlha625xupzoanxt8uum', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-30 13:35:47'),
('eshonhanv198lhsumxfg2reaxlred3ns', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-30 14:47:42'),
('so74rg3hqtdrknrhp4mido3df2cb769l', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-30 14:55:51'),
('3i9zuotk3vaskn6p9nb7vs0f3ym8s7xe', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-30 14:59:12'),
('t6nvt8s7zsvp3nx379uthrkmrok66lf5', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-30 15:54:17'),
('32sfvucnfc7fmt6d8n456kutca092v4j', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-30 17:12:25'),
('1nnw5k3zin9n89zlkijtkjmj68f0803p', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-06-30 17:46:36'),
('geng883ez2l621a02yftjvesj755zrkj', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-01 09:13:59'),
('6ahkyffgny3obgi7hql9rxc772qi4nhb', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-07 10:42:07'),
('6e3zphm6t2bopzaqv8hx4nyadz5hiqts', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-01 15:05:16'),
('g1295fpiv9xa53nfxts1676jcbpu3wwh', 'N2EwOGQxZDNlOWIyMDNjM2M5ZGEyMjAzMDUzMzZhNTk4Njc3YWM3ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjVmNzFhZTFmMmI1YjgyYzExYzgzYTZhYzY3NGZlMzBmNzIxMmE3NDciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NjcifQ==', '2016-07-01 15:07:15'),
('0r3nv998mf7vc245usw6bcbwifertyl8', 'ZmM2OTViYTJmNmRhZTE3OTI2NzhjMTExMzAxOGU4MjRhMWNhYmVmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzNjJlZTg1YzRiOTE3YTA0ZTQ1NjMwNmNhZDkzZGQwZjM3ZGIyM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NzAifQ==', '2016-07-01 18:30:27'),
('989cylfegrk1bghdfcbuzborw9pd7uww', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-04 16:56:26'),
('e3dnj91o8k71z1h5mptps0sn87jutavj', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-04 17:07:38'),
('7v6zvqa39t087cva12dbv4eh4wezwrec', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-04 17:09:29'),
('s20bmkf2pvjvwj0f4ablttzzgqfn89qn', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-04 17:11:56'),
('028gagn5t2rij1lo0an8h1hjs6753k8d', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-04 17:13:46'),
('0ovad4tl4f38zw06fc96gdfpga229hp9', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-04 17:19:41'),
('fn0eth3kzl5qwx8k0n8wogpp4z1vgnie', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-04 17:26:36'),
('ri4d97pyevsob52ixd5od67q63senpmx', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-05 08:33:46'),
('r1ryzgnmzyvfg584x1cxubchirkgfs8n', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-05 08:57:24'),
('ttulwjunxvcvznawu51430x82n0skysm', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-05 09:07:32'),
('izp57icsdgpodkpwgfvetq4lm3hkkcmw', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-05 09:59:43'),
('33v5mxw57sagtmc06yygl43nl2rt88kk', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-06 09:06:52'),
('u2k77t4zxt4j38fd0qdtwvul5wzj8ido', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-06 09:08:41'),
('jh5z5685biss6vyre91uoanpzmr094xv', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-06 09:09:45'),
('870xvuszovrqvnug2gv2dswfjx8g5l8q', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-06 09:12:00'),
('xdu8v2ewafwn5tosq802hmd2h2mqraqf', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-06 09:14:47'),
('aq0l12ofkogrq1ob028ocvwx6ad112yt', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-06 09:15:05'),
('dvmlucbwqebdd6ebbeqgvshnjy5rv04n', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-06 09:16:26'),
('86b85f8hfxoo6ota28sh8ohoczvehcwt', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-06 09:23:43'),
('4slufq5vv1dsffj4petdzvytfkuof85d', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-06 09:24:47'),
('dijy2n2k3cq85t4php26qj4cy8xyewsw', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-06 09:26:47'),
('vmdzjnop1hntjfjnurd51l2ukfmjgqoa', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-06 09:27:27'),
('risbpcolicryws1cu73cskw375r0eocw', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-06 09:34:35'),
('nvn8i9y9jyq6strea0d9bji767xpmsnr', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-06 09:30:58'),
('ry2rmlehcwznykbpbsul1rv5p2w5nps8', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-06 09:35:01'),
('1fwfs6yriur4ny6p476y57e5nrpju9bp', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-06 09:35:56'),
('k8bmxoqgoyi2qli8xgu91t6vo3xur0g4', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-06 18:37:02'),
('xyzkmdsz0cu6172ovisp55l1oh66mwx7', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-06 18:40:14'),
('aape4tfllryje7l65aqiuecycphhzke4', 'ZmM2OTViYTJmNmRhZTE3OTI2NzhjMTExMzAxOGU4MjRhMWNhYmVmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzNjJlZTg1YzRiOTE3YTA0ZTQ1NjMwNmNhZDkzZGQwZjM3ZGIyM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NzAifQ==', '2016-07-07 14:02:18'),
('0nwks0sef8nhkywt5amzyvbqm4tc7cbq', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-07 18:26:50'),
('0i3q17ux0ioct544bz2j7xyl485zsrbn', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-08 09:08:16'),
('9slbsndfyjsswdyb3ywgks0h0qkv8akm', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-12 14:47:43'),
('0ufp2reff1zo8l9qzuuz71v0s4ai0tl0', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-08 18:08:30'),
('d594acyexllq9zutxg4hn78n09rx9lgo', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-11 13:33:40'),
('frzo4aotl3nug8rtryuc7vkm2hx9dmek', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-11 14:33:37'),
('871qc8agavsgw94c8rh3axxjjpko66ne', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-11 15:51:14'),
('i7n7egfmmxwsalu0ci91sg3hq3dw7a77', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-11 16:51:50'),
('pap1woxk7ukq5r6u96yra145q64z20p8', 'NzFiZGVkNjI3MjFlYWQzMjMzYjhlYjUwMzY0ZTY4ODNlMjYzYjQ0ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRjYWUwNTc2NWY3YTBjN2Q2NTY1MjJjNGFkODY1NTUyZGY4MTdhNWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9', '2016-07-11 09:20:46'),
('n0kes75hj3cds57hh7qca871xrchjr0r', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-12 16:21:51'),
('omt0pdtt41jxdldtvqp1kkoray9ekkl3', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-13 11:29:31'),
('fkc5sgzjjnc4bis1k5s65fo43u4n4g87', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-13 16:37:44'),
('3wvajego6appd0hatsn6bsqqq0qjmjqd', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-13 17:10:40'),
('gy9klh8ssfsy56i1mnxa76btx1gu81e4', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-14 09:14:05'),
('vaac438pvxo2k42xuewhuc0wr2oi2vg0', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-15 13:07:32'),
('hxsm21cdtxp6is23kjij269lcds6akb4', 'Mjg3YTkzNTZkNzMyOGI1YzA1ZWM0NTc3NDg5NDk1OWQ1MzczYTM3Mjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2lkIjoiMTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2016-07-14 14:41:46'),
('9azutk8oirmu3gc5dm1ramc8qvrcsrm0', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-14 17:37:11'),
('85tc37exiqjt0z3vyvnr6ys9ew6c7jpm', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-26 17:08:34'),
('f7tzclxkvcbnqizv9uwuing3unewyvq8', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-15 14:57:14'),
('nwg8o9vwd0jo9dlcm774sh3xo0w8lwqz', 'Mjg3YTkzNTZkNzMyOGI1YzA1ZWM0NTc3NDg5NDk1OWQ1MzczYTM3Mjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2lkIjoiMTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2016-07-15 15:59:29'),
('zo609etswfl4jadfmrftacqwz7vdob4i', 'ODNlNjgxNTI2MDdmN2ZmZTdmZDYzMThjOGJiYWYxM2YzMGMxYjE0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc4YzNlOGI2M2I1ODdhNTAwYjZmNjcxZmY0ZDBkMTE4YTlkOTE4OWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-19 16:02:59'),
('v583up803jizqypo63eo9gu9yw01fi8q', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-26 16:56:35'),
('f6jalhou88s4qhdo63u7jh22g8v5ccmf', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-22 17:37:58'),
('9aytddy2lzby6gz1ti3aspycdvby7gih', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-25 09:13:00'),
('79prgb8wqene8fyr4zcbaagyoiaudxxp', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-25 17:18:41');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('80werpvxyy19fra2moq5wmgojdu4p5fc', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-27 10:11:57'),
('kh491vijpuw16ivtencsl6kxv3lexs0x', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-28 15:36:28'),
('ai3k1z5o2ir88kg1m9p3f0olheb755ng', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-28 16:21:39'),
('juk0fwy4f0pyc6wydvmhyhf1ac7rx2o7', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-29 13:30:00'),
('y6xht6n74uc4p9hdrydkzjklz7wgmar6', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-29 13:32:30'),
('rxfanxhfaeh0ap7k0djg530yzznx5v3f', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-07-29 13:44:42'),
('ko4g0iox9udled8wal8gnie2tdqmezvx', 'ZmM2OTViYTJmNmRhZTE3OTI2NzhjMTExMzAxOGU4MjRhMWNhYmVmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzNjJlZTg1YzRiOTE3YTA0ZTQ1NjMwNmNhZDkzZGQwZjM3ZGIyM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NzAifQ==', '2016-07-29 14:40:13'),
('54v1r045df7fyg05fncknk6cloibrfg4', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-02 13:09:47'),
('shs1mt1qjbd56qpw14tc21bc68tihbw0', 'ZmM2OTViYTJmNmRhZTE3OTI2NzhjMTExMzAxOGU4MjRhMWNhYmVmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzNjJlZTg1YzRiOTE3YTA0ZTQ1NjMwNmNhZDkzZGQwZjM3ZGIyM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NzAifQ==', '2016-08-01 14:31:05'),
('gh52wnfndlfhbtdj0dwusuj2g62yayd0', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-02 13:06:03'),
('sulimjz28k1z3dizuk8o5aoe4zktm1yo', 'ZmM2OTViYTJmNmRhZTE3OTI2NzhjMTExMzAxOGU4MjRhMWNhYmVmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzNjJlZTg1YzRiOTE3YTA0ZTQ1NjMwNmNhZDkzZGQwZjM3ZGIyM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NzAifQ==', '2016-08-02 13:24:33'),
('95cgb4n5a8vb7wfzsxtnynj7m6idupky', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-03 17:47:21'),
('5mewvha4q41wx62s74sw84axymtu649w', 'ZmM2OTViYTJmNmRhZTE3OTI2NzhjMTExMzAxOGU4MjRhMWNhYmVmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzNjJlZTg1YzRiOTE3YTA0ZTQ1NjMwNmNhZDkzZGQwZjM3ZGIyM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NzAifQ==', '2016-08-03 18:36:54'),
('uy7lri9jz0g6hsffc6kih2i0oau9d2sk', 'ZmM2OTViYTJmNmRhZTE3OTI2NzhjMTExMzAxOGU4MjRhMWNhYmVmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzNjJlZTg1YzRiOTE3YTA0ZTQ1NjMwNmNhZDkzZGQwZjM3ZGIyM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NzAifQ==', '2016-08-04 17:15:13'),
('fdnhl88uwhmcw3dde79ncnoo2z65sxk9', 'ZmM2OTViYTJmNmRhZTE3OTI2NzhjMTExMzAxOGU4MjRhMWNhYmVmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzNjJlZTg1YzRiOTE3YTA0ZTQ1NjMwNmNhZDkzZGQwZjM3ZGIyM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NzAifQ==', '2016-08-05 15:43:27'),
('290lfvqdrj0pgqjuo7tmfi6fsb5qvbqr', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-08 10:49:12'),
('eovatv3sn6tu2xl8acp97l0yv7nmuixj', 'ZmM2OTViYTJmNmRhZTE3OTI2NzhjMTExMzAxOGU4MjRhMWNhYmVmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzNjJlZTg1YzRiOTE3YTA0ZTQ1NjMwNmNhZDkzZGQwZjM3ZGIyM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NzAifQ==', '2016-08-09 13:19:25'),
('7jf0o4ikagbabju8lbxu9i4u152h6axp', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-19 15:23:45'),
('sl2rqisxb96pt41ihyljsy5gbc7uplbu', 'ZmM2OTViYTJmNmRhZTE3OTI2NzhjMTExMzAxOGU4MjRhMWNhYmVmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzNjJlZTg1YzRiOTE3YTA0ZTQ1NjMwNmNhZDkzZGQwZjM3ZGIyM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NzAifQ==', '2016-08-17 14:10:33'),
('d5wqsm4ppxso56h7ask4wwihx9ffe2xm', 'ZmM2OTViYTJmNmRhZTE3OTI2NzhjMTExMzAxOGU4MjRhMWNhYmVmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzNjJlZTg1YzRiOTE3YTA0ZTQ1NjMwNmNhZDkzZGQwZjM3ZGIyM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NzAifQ==', '2016-08-17 14:18:15'),
('70zqh2w9f1z41xm9ytfonax8japbfwo4', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-30 10:30:31'),
('tijsty8b6bqpkfik20d2yont0b9h35hz', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-18 13:45:14'),
('06pm6swzkj8yj8y5jszr1kljbnklz1kw', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-18 16:06:33'),
('s610tbayd8xan3lqivuap0ujzxqleu39', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-18 16:38:45'),
('1nim6402nwxfj2x4vun5lifmn5e8zlim', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-19 09:49:31'),
('tn7drcokw8mlyzirhhh5k00ewhihtv50', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-19 11:09:53'),
('a384xmwta2p5ine5vy2paf38c0wgtlev', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-19 11:10:30'),
('44zpselptsiki01y29wosiel7d8qaitv', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-19 11:33:04'),
('niahucnxezbnuss5bxcy3njhpw2zcyu9', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-19 11:39:33'),
('aopzu3ovxvbrgs7qx5day0dmv9bxbgw4', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-19 11:43:00'),
('3b9bq0biarfdlfiteg546cztj8v5z4b7', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-19 11:54:14'),
('3jbo0nwoqwp87nq6jcfcpqiofmf5pc9x', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-19 14:15:59'),
('h8lnkuitb3wah1tqre9ouk5qc1cz1ypz', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-22 15:10:20'),
('fd5xv6ds7k51oqhk2jqvbtmmkpc69k42', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-22 15:29:48'),
('e0390chcszofijeqj0jiv5m558c0q15w', 'ZmM2OTViYTJmNmRhZTE3OTI2NzhjMTExMzAxOGU4MjRhMWNhYmVmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzNjJlZTg1YzRiOTE3YTA0ZTQ1NjMwNmNhZDkzZGQwZjM3ZGIyM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NzAifQ==', '2016-08-22 16:11:57'),
('bqu8zsa7x99vrqg43d23oxn3gsh9amm3', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-22 16:20:08'),
('jgfj45da7yrcvpwqwvu3ncacrhee77eq', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-23 13:38:41'),
('ky35h4akhao7r0qymcbcxw3l97nragf7', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-23 14:13:34'),
('pfi8x5xkbilpq6h9r3u4jda5i8cj5hiw', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-23 16:18:39'),
('li3c8f8x2agb9aewws7vn5f72giw20zu', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-24 17:56:59'),
('ov92smadax9ejz7es78epqpz6w7dessu', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-24 15:59:10'),
('uf9gixkuxz8jua46xzr3zmsjqlw4bfkk', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-25 08:40:35'),
('vpg01tzn0catc8740kozw2t8734f3fy6', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-25 08:51:14'),
('3xdonpaco4edv8afvs4bs5k32srhh74a', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-25 08:54:28'),
('ztamzl3wig85bkdv54wvbyf8xyt0jv9l', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-25 10:05:19'),
('uegydnyhqt2fi6t8jpztf8pbwbd1rhvp', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-25 17:53:19'),
('eweri5a0mxm7oo2f699d8o95xuc1f7sm', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-25 17:57:29'),
('qnxhxm4c7jrc01i65tf3ifskpfkvm23l', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-26 13:04:21'),
('c5rhu7t9ewtgvghy429tckk7lrg1baav', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-26 14:55:39'),
('gjrgb0r504elur63vdqga7qny8nyxpue', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-26 17:36:32'),
('ld8wu37xfaxuizjtckgvdboj7zxnxgtt', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-29 15:22:45'),
('sls8x352j53l6d4dlgc18ffqwez22fao', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-29 10:47:28'),
('gmxiie54q197h4wnmh67hldh7o9t7974', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-30 11:44:43'),
('l5qgugetjgr6migcypgt7zqf7nlmd33h', 'MDU4YTFkYmVlNzhiNzY2YjZmYmM0ZjU0MmQyNGRlOWMzZmU3NmYzYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2lkIjoiMTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2016-08-29 13:03:24'),
('eapf3s5hj0fgz63wuj43s8q1rxz9m2i2', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-29 18:20:55'),
('i4elmm0szlzhifczaon6p0p4v30h0f6z', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-08-30 18:13:06'),
('56fuecv7pti7tchosrjumntgersamidy', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-01 09:49:12'),
('pqk58yfai5cnkh60rqkrtbhhpmi0l4dt', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-01 14:36:03'),
('z8x5c8siv1llqckutbrouxh182rdvgtk', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-01 15:15:41'),
('1alcc66zot6vja509z0217ugozwit6zk', 'ZmM2OTViYTJmNmRhZTE3OTI2NzhjMTExMzAxOGU4MjRhMWNhYmVmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzNjJlZTg1YzRiOTE3YTA0ZTQ1NjMwNmNhZDkzZGQwZjM3ZGIyM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NzAifQ==', '2016-09-02 08:52:31'),
('yhxd8azzczuybsr7cvnv4bpgdr8euo3k', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-02 11:09:11'),
('2nuie16w72xi1ed6v2ljhd6ucku4u37a', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-05 15:05:31'),
('ant9hu04il2s224pa8ud96dh9btkb5ei', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-05 09:06:51'),
('hqp7jfi4gm1c6cdhlc4u4dqpgk7udsz0', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-05 10:25:31'),
('yfvplmk3ut09im9g7k4io38pl2hzy7or', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-07 09:12:11'),
('rme8oi2knaekat6lr3mcqh64bokwuwey', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-21 13:39:17'),
('06x9y5dctn28icbos23okn488d8tsor8', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-09 08:25:49'),
('whnran0fvjndg9o3706ligwjtnonbvt8', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-09 10:18:58'),
('c2xc72lciocq1r205tses0sjgqg31qcn', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-12 17:41:13'),
('6k9lka0wqg1qrv8pptu680hsum5fn4kf', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-13 09:57:16'),
('rhsynu9b164chhtwev4aqgosulbxea0q', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-13 14:11:29'),
('qyiujhsqrolbcj3y8bef9lupd6nywlc1', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-13 14:23:11'),
('oc7vyge56a95muqc6k14o9zlp8uh34fr', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-13 16:00:46'),
('qiipctqxvxqam2662fj9x81k1c16l0hd', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-14 11:59:49'),
('cg5ec10cm9c2wzgzch4xpoxmwarxjqd0', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-21 13:47:59'),
('jsgfqg83ilk342wkni23irhfa8er32ca', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-15 14:53:42'),
('22znfplhycjicjdhx8veklw9pqwqubxp', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-15 17:30:45'),
('49qopn6qlzss0po0rztn8p74kiwcellf', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-16 10:20:29'),
('c6aivfruooa0bw7cac1m5cf9y3kpj6fp', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-16 10:27:24'),
('rpon3w0re764sap0thk2tlov6qqb81so', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-16 10:32:50'),
('3gqe430e61kk1o86h679192ovn0o7y84', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-21 15:00:27'),
('qnvpiz9j6a69qs71tffwl7n4wb9ufdqv', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-21 15:37:37'),
('wjbf8urr6wgl63fl0z7w0egqgl34uqbg', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-02 15:08:04'),
('x8c2a1fr2ctn1spqicmlcxbgumf9q5l0', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-21 16:13:50'),
('nkobis6rc74kjfjelqbtr9e0ggn54qlo', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-04 14:06:39'),
('ff13fv8xh76eughcomzur7gqinuxtex5', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-02 15:10:47'),
('qfzs3lvu8qzhm1ochk7o9x6i699dngs2', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-04 14:03:11'),
('6871im2t0682mrthkmxcibhr58d58g4l', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-09-23 13:19:23'),
('sm7w2icobnjpwwf61q7xmvlxzkmmktkb', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-02 15:38:05'),
('5cj09rgonbp3fqift3vifyu46tj51cmb', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-02 16:16:15'),
('5k9ycb4wd30awkksknjvuzg71g9oqt1n', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-02 16:26:12'),
('hivafmppu1rugq2okctxashcklgfcpnh', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-02 16:42:51'),
('q2zf0b1i9u55niulvtpws4v03sip9fln', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-03 14:04:39'),
('ac74p33mekdzc7mdnebdh4nm82fxr0b7', 'ZmM2OTViYTJmNmRhZTE3OTI2NzhjMTExMzAxOGU4MjRhMWNhYmVmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUzNjJlZTg1YzRiOTE3YTA0ZTQ1NjMwNmNhZDkzZGQwZjM3ZGIyM2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NzAifQ==', '2016-10-02 17:11:48'),
('lu0cmbegbfw4gl5b5ppp6n71yqb9r4m4', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-02 18:18:21'),
('ygikxb9w2c1fyz4ofqjmzkhs9kkn5xgr', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-10 14:46:05'),
('s26lxtcvfesmvbdvp7zelp2c9cdvx8ug', 'MjhhMTUzM2ViMWU3MDQwOGUyMzgzMjcwM2UyMmMzZGQ0OGJmMWM5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0NTU4NzgzMTQ3ZDJlZGFjMTIwMTQ5NTVkYWU4OTViMzkyMDFjZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-03 09:05:20'),
('xminwhptzensgokcibkbouchifo9zo4c', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-03 11:19:06'),
('xdfvav0ttmeq7pz5jzuiwzhaeja52anx', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-04 15:39:00'),
('kdyxf4ij3pixj25kudfh4bed7bo2vkh3', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-03 16:40:38'),
('qbixofyyjhcggxgmfz6efux6dh6uu4ti', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-05 10:53:29'),
('empnh5b82bvbusyy4w2md83h3ie4en0r', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-05 11:39:34'),
('x7ggtrt12hmfoda6eum1mg3j3edyozao', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-06 15:00:34'),
('tokdr58skbi7gujttf96aqiiz10opi4e', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-06 10:59:11'),
('ilyau5aco18y0k78lqrqu8ryt48io8ln', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-06 15:01:17'),
('b0y37e3eswunlh26xwb9ju3ca61ec3o5', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-07 11:06:37'),
('fe88pvoe2ybvqbmmsr5p9uwhf3sibxo3', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-06 16:39:00'),
('9cvwqaic4scmajrwpt5xx6spu1v95oa8', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-06 16:42:28'),
('g1h17kxydqp4f43vslmrxdalff1785uv', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-12 10:09:21'),
('g5ulkc0k9hu9glbqa0klwr1t84p3kw93', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-10 09:40:07'),
('n1zlsvvqxv2lg2bfebl0yjpudi6uhhgh', 'YTYyZDhiOGM5NjgzYjQ5OTA2MjIyMDY1ZmNhN2MxOTNjMTI2Nzg0ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjhiMmU1NDllMzNiYjk3MDY3ZjU1YjVjYWYyNDNiOTMxNjZjYTllNWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2ODMifQ==', '2016-10-23 16:20:26'),
('8phann1bv63hisst21v46jhcgnozb6wi', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-14 16:11:55'),
('g4q1m6gvz2o20ic7t1wiveauia0u22iu', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-22 18:04:34'),
('c0pzy4uz8lcxudl83vscgv3b9kt6o307', 'YTYyZDhiOGM5NjgzYjQ5OTA2MjIyMDY1ZmNhN2MxOTNjMTI2Nzg0ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjhiMmU1NDllMzNiYjk3MDY3ZjU1YjVjYWYyNDNiOTMxNjZjYTllNWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2ODMifQ==', '2016-10-23 13:49:52'),
('qve86jvxaw2t8pdurl5s9rt92mb7soap', 'YTYyZDhiOGM5NjgzYjQ5OTA2MjIyMDY1ZmNhN2MxOTNjMTI2Nzg0ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjhiMmU1NDllMzNiYjk3MDY3ZjU1YjVjYWYyNDNiOTMxNjZjYTllNWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2ODMifQ==', '2016-10-23 16:30:25'),
('5ljq1t105q7e6urqqck5x7zjiwcbc6e3', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-24 16:34:41'),
('5eb6vewt5qib9cbzdp8b1pblk95hm4tu', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-25 11:13:21'),
('14rd1mr73sf9owcbmgc1vm86yahs17k4', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-24 17:00:55'),
('4hd0tzkxvq5iqsfdngtnpi08o5c409mb', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-24 17:08:14'),
('r7sm1l95t3usjgumv3nkxfof2lvq1epz', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-24 17:08:59'),
('g4pf08y9s627ofph838wfsc9l8hwe553', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-24 17:09:43'),
('s3r5phbqxn2g92xnf4m4f6pyoozdg42q', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-24 17:10:32'),
('ctn7aeu7ie4p8zhm2ovxy0liudulij5r', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-24 17:11:21'),
('tcsxqgvkwaj048i85zgf1q0nekxygyze', 'ODc4OTU0ZGYzNzE0OWQ2Y2Q4NzY2Y2VlMWU5YzNkMWYyOWI3YWEwMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhOTFiMzY1YTE1Nzc0NThmMGI3MTMwY2Y4OGEwZmI4YjZjNTE4MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9', '2016-10-25 14:00:09');

-- --------------------------------------------------------

--
-- 表的结构 `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'www.icgoo.net', 'icgoo'),
(3, 'localhost:8080', 'localhost');

-- --------------------------------------------------------

--
-- 表的结构 `etime_news`
--

CREATE TABLE IF NOT EXISTS `etime_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catid_id` int(11) NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` longtext NOT NULL,
  `date` datetime NOT NULL,
  `show_date` datetime NOT NULL,
  `viewnum` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `display_order` int(11) NOT NULL,
  `small_pic` varchar(100) NOT NULL,
  `desp` varchar(100) DEFAULT NULL,
  `tags` varchar(255) NOT NULL,
  `is_edit` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `etime_news_91715116` (`catid_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `etime_news_cate`
--

CREATE TABLE IF NOT EXISTS `etime_news_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `livesettings_longsetting`
--

CREATE TABLE IF NOT EXISTS `livesettings_longsetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `group` varchar(100) NOT NULL,
  `key` varchar(100) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`,`group`,`key`),
  KEY `livesettings_longsetting_9365d6e7` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `livesettings_setting`
--

CREATE TABLE IF NOT EXISTS `livesettings_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `group` varchar(100) NOT NULL,
  `key` varchar(100) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`,`group`,`key`),
  KEY `livesettings_setting_9365d6e7` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `main_descript`
--

CREATE TABLE IF NOT EXISTS `main_descript` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 NOT NULL,
  `content` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `main_descript`
--

INSERT INTO `main_descript` (`id`, `title`, `content`) VALUES
(1, '售后服务电话', '0316-5126630'),
(2, '全国销售热线', '400-660-6568');

-- --------------------------------------------------------

--
-- 表的结构 `main_pictures`
--

CREATE TABLE IF NOT EXISTS `main_pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `showdate` datetime DEFAULT NULL COMMENT '图片显示时间',
  `name` varchar(100) NOT NULL,
  `position` varchar(10) NOT NULL,
  `explain` varchar(100) NOT NULL,
  `href` varchar(200) NOT NULL,
  `uploaddate` date NOT NULL,
  `show` tinyint(1) NOT NULL,
  `imgpath` varchar(200) NOT NULL,
  `show_id` int(11) NOT NULL,
  `hidedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `main_pictures`
--

INSERT INTO `main_pictures` (`id`, `showdate`, `name`, `position`, `explain`, `href`, `uploaddate`, `show`, `imgpath`, `show_id`, `hidedate`) VALUES
(1, NULL, 'banner2', 'center', '#', '#', '2015-12-03', 0, 'http://media.icgoo.net/v7static/img/banner/ad3.png', 2, NULL),
(2, NULL, 'banner1', 'center', '#', '#', '2015-12-03', 0, 'http://media.icgoo.net/v7static/img/banner/ad2.png', 5, NULL),
(3, '2016-06-14 15:39:00', 'banner3', 'center', '#', 'http://www.qq.com/', '2015-12-03', 1, 'http://media.icgoo.net/v7static/img/banner/ad1.png', 2, '2088-08-28 15:40:00'),
(4, NULL, 'rad1', 'small', '#', '#', '2015-12-04', 1, 'http://media.icgoo.net/v7static/img/banner/small/rad1.png', 1, NULL),
(5, NULL, 'rad2', 'small', '#', '#', '2015-12-04', 1, 'http://media.icgoo.net/v7static/img/banner/small/rad3.png', 2, NULL),
(6, '2016-06-14 15:35:00', 'tops', 'top', ' ', '#', '2015-12-24', 0, 'http://media.icgoo.net/v7static/img/banner/top/adv_top.jpg', 1, '2016-06-14 15:37:00'),
(7, '2016-06-17 18:32:00', 'logo', 'logo', ' ', ' ', '2015-12-28', 0, ' http://media.icgoo.net/v7static/img/icgoo.jpg', 1, '2016-06-18 00:00:00'),
(8, '2016-06-30 11:32:00', '2016元旦通知', 'top', '/', '/', '2015-12-30', 0, 'ICGOO商城将于元旦期间（1月1日-1月3日）放假三天。在此期间商城会为您提供不间断服务。祝您元旦快乐，幸福康泰。', 999, '2016-06-30 15:41:00'),
(9, NULL, 'ad1_roch.png', 'center', 'rochester_introduce', 'http://127.0.0.1:8080/supplier/rochester/', '2016-01-14', 0, 'http://media.icgoo.net/v7static/img/banner/ad1_roch.png', 999, NULL),
(10, '2016-06-14 00:00:00', 'banner4', 'center', '#', '#', '2016-06-14', 1, 'http://media.icgoo.net/v7static/img/banner/ad-20160613.png', 3, '2088-08-28 00:00:00'),
(11, '2016-06-14 00:00:00', 'banner5', 'center', '#', '#', '2016-06-14', 1, 'http://media.icgoo.net/v7static/img/banner/ad-bosch.png', 1, '2088-08-28 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `news_anchortext`
--

CREATE TABLE IF NOT EXISTS `news_anchortext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(100) NOT NULL,
  `url` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `news_picture`
--

CREATE TABLE IF NOT EXISTS `news_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pic` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pictures`
--

CREATE TABLE IF NOT EXISTS `pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(100) NOT NULL,
  `p_position` varchar(10) NOT NULL,
  `p_explain` varchar(100) NOT NULL,
  `p_href` varchar(200) NOT NULL,
  `p_uploaddate` date NOT NULL,
  `p_show` tinyint(1) NOT NULL,
  `p_img` varchar(200) NOT NULL,
  `show_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `product_collection`
--

CREATE TABLE IF NOT EXISTS `product_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_collection_e8701ad4` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `product_historyinfobase`
--

CREATE TABLE IF NOT EXISTS `product_historyinfobase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partno` varchar(50) NOT NULL,
  `supplier` varchar(20) NOT NULL,
  `counts` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `product_historyinfochange`
--

CREATE TABLE IF NOT EXISTS `product_historyinfochange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL,
  `price` varchar(20) NOT NULL,
  `price_info` varchar(200) NOT NULL,
  `mfr` varchar(50) NOT NULL,
  `package` varchar(50) NOT NULL,
  `in_stock` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `source_IP` varchar(200) NOT NULL,
  `source_html` longtext NOT NULL,
  `base_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_historyinfochange_078dce83` (`base_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `product_keys`
--

CREATE TABLE IF NOT EXISTS `product_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partno` varchar(100) NOT NULL,
  `sup_ids` varchar(20) NOT NULL,
  `prod_id` varchar(512) NOT NULL,
  `prod_other_id` varchar(512) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `partno` (`partno`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `product_product`
--

CREATE TABLE IF NOT EXISTS `product_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `icgoo_num` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `prod_supplier`
--

CREATE TABLE IF NOT EXISTS `prod_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `delivery_hk` varchar(100) DEFAULT NULL,
  `delivery_dl` varchar(100) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `from_database` tinyint(1) NOT NULL,
  `display` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `search_supplier`
--

CREATE TABLE IF NOT EXISTS `search_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(50) NOT NULL,
  `info` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `logo` varchar(50) NOT NULL,
  `is_good` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `search_supplier_name_71cdf4115cb7fa74_uniq` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- 转存表中的数据 `search_supplier`
--

INSERT INTO `search_supplier` (`id`, `name`, `desc`, `info`, `is_active`, `logo`, `is_good`) VALUES
(1, 'mouser', '一片起订，这就是Mouser，一个被众多小批量客户及设计工程师偏爱的供应商!', '现货库存，价优质好！', 1, 'mouser.jpg', 1),
(2, 'digikey', '全球成长最快的电子元器件经销商之一', ' ', 1, 'digikey.jpg', 1),
(3, 'rochester', ' ', ' ', 1, 'roch.jpg', 1),
(4, 'element14', ' ', ' ', 1, 'element14.jpg', 1),
(5, 'hot', ' ', ' ', 1, 'hot.jpg', 0),
(6, 'amp', '', '', 0, '', 0),
(7, 'am2', 'one of the world''s largest distributors of semicon', ' ', 1, 'am2.jpg', 0),
(8, 'chip1stop', '电子元器件、半导体的分销商', '  ', 1, 'chip1stop.jpg', 0),
(9, 'oem', ' ', ' ', 1, 'icgoo.jpg', 0),
(10, 'future', ' ', ' ', 1, 'future.jpg', 0),
(11, 'element14_sh', ' ', '  ', 0, 'element14.jpg', 0),
(12, 'online', ' ', ' ', 1, 'online.jpg', 0),
(13, 'arrow', ' ', ' ', 1, 'arrow.jpg', 0),
(14, 'verical', ' ', ' ', 1, 'verical.jpg', 0),
(15, 'heilind', ' ', ' ', 1, 'heilind.jpg', 0),
(16, 'tti', ' ', ' ', 1, 'tti.jpg', 0),
(17, 'rs_china', ' ', '  ', 0, 'rs_china.jpg', 0),
(18, 'rs_hk', ' ', ' ', 0, 'rs_china.jpg', 0),
(19, 'avnet', ' ', ' ', 1, 'avnet.jpg', 0),
(20, 'questcomp', ' ', ' ', 1, 'questcomp.jpg', 0),
(21, 'waldom', ' ', '  ', 0, 'waldom.jpg', 0),
(22, 'rochester_hot', ' ', ' ', 1, 'roch.jpg', 0),
(23, 'rs', ' ', ' ', 1, 'rs_china.jpg', 0),
(24, 'peigenesis', ' ', ' ', 1, 'peigenesis.jpg', 0),
(25, 'fenghuagaoke', 'fenghuagaoke', '', 1, 'fenghuagaoke.png', 0);

-- --------------------------------------------------------

--
-- 表的结构 `webconfig_webconfig`
--

CREATE TABLE IF NOT EXISTS `webconfig_webconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) NOT NULL,
  `value` varchar(500) NOT NULL,
  `pub_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `webconfig_webconfig_key_2336e1175f73bfe5_uniq` (`key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `webconfig_webconfig`
--

INSERT INTO `webconfig_webconfig` (`id`, `key`, `value`, `pub_date`) VALUES
(1, 'DC_API_URL', 'http://ali.icgoo.net:40081/api', '2015-10-21 07:19:00'),
(2, 'DC_USER', 'icgoo', '2015-10-21 07:19:00'),
(3, 'DC_PSWD', 'sm2906', '2015-10-21 07:19:00'),
(4, '注意!!!', 'url类的值最后结尾不要有 /      !!!!', '2015-10-21 08:07:00'),
(5, 'JY_API_URL', 'http://192.168.2.203/api', '2015-10-23 18:08:00'),
(6, 'JY_USER', 'jiayou3', '2015-11-30 17:19:00'),
(7, 'JY_PSWD', '!@#123', '2015-11-30 17:19:00'),
(8, 'JY_API_URL_NEW', 'http://192.168.2.203/api_icgoo', '2016-01-13 11:14:00'),
(9, 'JY_USER_NEW', 'jiayou3', '2016-01-13 11:14:00'),
(10, 'JY_PSWD_NEW', '!@#123', '2016-01-13 11:14:00'),
(14, 'JY_HOST', '192.168.2.203', '2016-09-18 17:45:00'),
(11, 'CN_CT_API', 'http://192.168.2.43:40070/data', '2016-06-23 14:30:00'),
(12, 'CN_CT_USER', 'icgoo', '2016-06-23 14:30:00'),
(13, 'CN_CT_PSWD', 'sm2906', '2016-06-23 14:31:00');

-- --------------------------------------------------------

--
-- 表的结构 `weixin_user`
--

CREATE TABLE IF NOT EXISTS `weixin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(128) NOT NULL,
  `user_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `weixin_user`
--

INSERT INTO `weixin_user` (`id`, `openid`, `user_id`, `active`) VALUES
(1, 'o7KHot5nsDiOxI f6omY1c6vMqXSo', 16, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
