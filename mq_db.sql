-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.8-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 mq_db.baseinfo 结构
CREATE TABLE IF NOT EXISTS `baseinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT '0',
  `remark` varchar(100) DEFAULT '0',
  `value` varchar(5000) DEFAULT '0',
  `xh` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- 正在导出表  mq_db.baseinfo 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `baseinfo` DISABLE KEYS */;
INSERT INTO `baseinfo` (`id`, `code`, `remark`, `value`, `xh`) VALUES
	(1, 'hot_email', '热线-联系邮箱', '123123123@qq.com', 99),
	(2, 'hot_linkman', '热线-联系人', '王某某\r\n', 2),
	(3, 'hot_telphone', '热线-联系电话', '023-8888888', 0),
	(4, 'index_about', '首页右下角-公司概况', '<p>1111重庆米润科技有限公司,成立于2014年3月，注册资金300万元,公司位于渝北区黄山大道中段55号附2号（麒麟D座）</p>\r\n<p>集产、学、研为一体科技型企业，公司现有职工56人，大专以上学历人员48人，外聘专家教授2人。公司主营业务：节能技术，与节能服务。</p>\r\n<p>公司与重庆大学、解放军后勤工程学院等院校已签订长期产学研合作模式，在智能家居产品开发领域实现技术共享，并且在检测设备、实验仪器、项目应用等方面实现资源共享。</p>\r\n', 0),
	(5, 'about', '公司概况', '<p>重庆米润科技有限公司，是一家专著于物联网和云计算领域，专业从事智能家居、智能楼宇、智能社区等方案的软硬件研发的高科技企业。改变是一种态度。改变是一种趋势。改变是一种胸怀。改变是一种能力。改变行业现状，成为行业领军者。改变消费者的生活，让世界更美好</p>', 0),
	(7, 'index_about_biaoyu', '首页右下角-标语', '我们坚持“简单就是智慧”111', 0),
	(8, 'foot_hottel', '页脚-热线', '400-8008810，023-9999292', 0);
/*!40000 ALTER TABLE `baseinfo` ENABLE KEYS */;


-- 导出  表 mq_db.modeltype 结构
CREATE TABLE IF NOT EXISTS `modeltype` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` int(10) NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL DEFAULT '0',
  `remark` varchar(2000) NOT NULL DEFAULT '0',
  `imgurl1` varchar(500) NOT NULL DEFAULT '0',
  `xh` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- 正在导出表  mq_db.modeltype 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `modeltype` DISABLE KEYS */;
INSERT INTO `modeltype` (`id`, `type`, `title`, `remark`, `imgurl1`, `xh`) VALUES
	(1, 1, '米润动态1', '<p><span style="color:rgb(255, 0, 0)">0sdfsdfsdfsdfsfd</span></p>\r\n\r\n<p><span style="color:rgb(255, 0, 0)">sdfsdfsdfsdf</span></p>\r\n', 'userImage/thumbnail/69132f48-3e16-4d1f-a248-6bd789436e16_233x137.png', 5),
	(2, 1, '行业资讯1', '0', '0', 4),
	(3, 1, '媒体报道1', '0', '0', 3),
	(4, 2, '产品类别1', '<p><img alt="" src="userImage/type/30a72c63-fe74-4195-99f5-4908609be7b5.jpg" style="height:38px; width:50px" />sdfsdfsdfsdfdsf</p>\r\n', 'userImage/thumbnail/f4de6443-b0ab-4cb3-9996-7bd316ad9160_233x137.jpg', 9),
	(6, 2, '产品类别2', '', 'userImage/thumbnail/10619896-775b-4b87-bdfd-effd6e4e724f_233x137.jpg', 8),
	(7, 2, '产品类别3', '', 'userImage/thumbnail/50eeb286-be6b-4c6d-8844-ef5873f16317_233x137.jpg', 7),
	(8, 2, '产品类别4', '', 'userImage/thumbnail/dda8a9af-67e7-412e-91a9-dc0ef5647dff_233x137.jpg', 6);
/*!40000 ALTER TABLE `modeltype` ENABLE KEYS */;


-- 导出  表 mq_db.news 结构
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `type` int(11) NOT NULL,
  `author` varchar(50) NOT NULL,
  `createtime` datetime NOT NULL,
  `content` varchar(5000) NOT NULL,
  `imgurl1` varchar(500) NOT NULL,
  `newsorder` int(11) NOT NULL,
  `delflag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- 正在导出表  mq_db.news 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` (`id`, `title`, `type`, `author`, `createtime`, `content`, `imgurl1`, `newsorder`, `delflag`) VALUES
	(25, 'ccc', 2, 'cccc', '2014-08-13 17:58:53', '<p>dsdfsdf</p>\r\n', '', 1, 0),
	(27, 'abc', 1, '', '2014-08-14 08:09:57', '<p>123123</p>\r\n', '', 0, 0),
	(28, '测试缩略图', 1, '', '2014-08-14 16:48:32', '<p>sdfsdfdsfsdf</p>\r\n\r\n<p>sdfdsdfsd</p>\r\n\r\n<p>f</p>\r\n\r\n<p>sdf<img alt="" src="userImage/news/0834604a-07f5-4328-871f-322bd2155d10.jpg" style="height:75px; width:100px" /></p>\r\n\r\n<p>sd</p>\r\n\r\n<p>fsdfsd</p>\r\n\r\n<p>f</p>\r\n\r\n<p>sf</p>\r\n', 'userImage/thumbnail/73d7002c-07b7-41fe-8eb4-2a1cd4a8e581_138x89.jpg', 5, 0),
	(29, 'abc', 2, '', '2014-08-14 08:10:44', '<p>adfsdf</p>\r\n', '', 3, 0),
	(31, 'test', 2, '', '2014-08-14 08:20:10', '<p>adf</p>\r\n', '', 4, 0),
	(32, 'vvv', 2, '', '2014-08-14 09:06:25', '<p>sdfsdf</p>\r\n', '', 2, 0),
	(33, 'vvv', 3, 'aaa', '2014-08-14 09:10:17', '<p>aaa</p>\r\n', '', 0, 0),
	(34, 'aadfas', 1, '', '2014-08-14 10:01:40', '<p>sdfsdf</p>\r\n', '', 0, 0),
	(35, 'sdfsdf', 1, '', '2014-08-14 10:01:45', '<p>sdfsdf</p>\r\n', '', 0, 0);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;


-- 导出  表 mq_db.productdetail 结构
CREATE TABLE IF NOT EXISTS `productdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) NOT NULL DEFAULT '0',
  `xh` int(11) NOT NULL DEFAULT '0',
  `content` varchar(5000) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- 正在导出表  mq_db.productdetail 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `productdetail` DISABLE KEYS */;
INSERT INTO `productdetail` (`id`, `productid`, `xh`, `content`) VALUES
	(1, 6, 0, '<p>第二页</p>\r\n'),
	(2, 6, 1, '<p>第一页</p>\r\n'),
	(9, 9, 0, '<p>产品1内容第一页<img alt="" src="userImage/products/7d7db023-2129-479e-a727-d602ed5db8f9.jpg" style="height:150px; width:200px" /></p>\r\n'),
	(10, 9, 0, '<p>产品1内容第二页&nbsp;&nbsp; 冲冲冲冲冲冲冲冲冲</p>\r\n');
/*!40000 ALTER TABLE `productdetail` ENABLE KEYS */;


-- 导出  表 mq_db.products 结构
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0',
  `title` varchar(500) NOT NULL DEFAULT '0',
  `imgurl1` varchar(500) NOT NULL DEFAULT '0',
  `imgurl2` varchar(500) NOT NULL DEFAULT '0',
  `remark` varchar(500) NOT NULL DEFAULT '0',
  `xh` int(11) NOT NULL DEFAULT '0',
  `isindextop` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- 正在导出表  mq_db.products 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `type`, `title`, `imgurl1`, `imgurl2`, `remark`, `xh`, `isindextop`) VALUES
	(1, 6, 'a', 'b', 'c', 'd阿斯蒂芬斯蒂芬水电费水电费速度发速度发随碟附送到放水电费速度发舒服', 1, 1),
	(2, 6, 'b', 'userImage/thumbnail/7f15303c-da3a-4838-8b2e-ad865ae654c9_78x78.jpg', 'userImage/thumbnail/34633c27-543c-49b0-abe3-3d34977003df_194x142.jpg', 'bbbb', 0, 1),
	(3, 6, 'ccccc', '', '', 'ccccc', 0, 1),
	(6, 6, 'dsfsdf', '', '', 'dsfsdfsdf', 0, 1),
	(9, 4, '产品1', '', '', '<p>产品1简介</p>\r\n', 0, NULL),
	(10, 4, 'dfsdfsdf', '', '', '', 0, NULL),
	(11, 6, 'dfasf', '', '', '<p>sdfdsf</p>\r\n', 0, NULL),
	(12, 6, 'tttttttt', '', '', '', 0, NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;


-- 导出  表 mq_db.serviceinfo 结构
CREATE TABLE IF NOT EXISTS `serviceinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `telphone` varchar(50) NOT NULL DEFAULT '0',
  `xh` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 正在导出表  mq_db.serviceinfo 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `serviceinfo` DISABLE KEYS */;
INSERT INTO `serviceinfo` (`id`, `name`, `telphone`, `xh`) VALUES
	(2, 'aa', '21312', 111),
	(3, 'bbb', '123123', 2),
	(4, 'ccccc', '1231231', 3);
/*!40000 ALTER TABLE `serviceinfo` ENABLE KEYS */;


-- 导出  表 mq_db.tment 结构
CREATE TABLE IF NOT EXISTS `tment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `xh` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  mq_db.tment 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `tment` DISABLE KEYS */;
INSERT INTO `tment` (`id`, `title`, `content`, `xh`) VALUES
	(1, 'xxxxx', '<p>yyyyy</p>\r\n', 0);
/*!40000 ALTER TABLE `tment` ENABLE KEYS */;


-- 导出  表 mq_db.usertable 结构
CREATE TABLE IF NOT EXISTS `usertable` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  mq_db.usertable 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `usertable` DISABLE KEYS */;
INSERT INTO `usertable` (`id`, `name`, `pwd`, `role`) VALUES
	(1, 'admin', '111', '1');
/*!40000 ALTER TABLE `usertable` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
