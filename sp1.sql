DROP TABLE IF EXISTS `banner`;
-- 导出  表 mq_db.banner 结构
CREATE TABLE IF NOT EXISTS `banner` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `src` varchar(500) NOT NULL,
  `href` varchar(500) NOT NULL,
  `xh` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
