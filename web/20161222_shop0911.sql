-- MySQL dump 10.13  Distrib 5.5.38, for Win32 (x86)
--
-- Host: localhost    Database: shop0911
-- ------------------------------------------------------
-- Server version	5.5.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `php41_attribute`
--

DROP TABLE IF EXISTS `php41_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `php41_attribute` (
  `attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `attr_name` varchar(32) NOT NULL COMMENT '属性名称',
  `type_id` smallint(5) unsigned NOT NULL COMMENT '对应类型id',
  `attr_is_sel` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:唯一 1:多选',
  `attr_write_mod` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:手工  1:下拉列表选择',
  `attr_sel_opt` varchar(100) NOT NULL DEFAULT '' COMMENT '多选情况被选取的项目信息，多个值彼此使用,逗号分隔',
  PRIMARY KEY (`attr_id`),
  KEY `type_id` (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='商品属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `php41_attribute`
--

LOCK TABLES `php41_attribute` WRITE;
/*!40000 ALTER TABLE `php41_attribute` DISABLE KEYS */;
INSERT INTO `php41_attribute` VALUES (2,'网络制式',2,0,0,''),(3,'尺寸体积',2,0,0,''),(4,'长度',2,0,0,''),(5,'操作系统',2,1,1,'android,ios,windows,塞班'),(6,'颜色',2,1,1,'蓝色,绿色,白色,粉色,金色,黑色'),(7,'笔记本尺寸',5,1,1,'11,12,13,14,15'),(9,'处理器类型',5,1,1,'i3,i5,i7'),(10,'内存',5,1,1,'4g,8g,16g'),(11,'颜色',5,1,1,'红色,白色,黑色,灰色');
/*!40000 ALTER TABLE `php41_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `php41_auth`
--

DROP TABLE IF EXISTS `php41_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `php41_auth` (
  `auth_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `auth_name` varchar(20) NOT NULL COMMENT '名称',
  `auth_pid` smallint(6) unsigned NOT NULL COMMENT '父id',
  `auth_c` varchar(32) NOT NULL DEFAULT '' COMMENT '模块',
  `auth_a` varchar(32) NOT NULL DEFAULT '' COMMENT '操作方法',
  `auth_path` varchar(32) NOT NULL DEFAULT '' COMMENT '全路径',
  `auth_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '基别',
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `php41_auth`
--

LOCK TABLES `php41_auth` WRITE;
/*!40000 ALTER TABLE `php41_auth` DISABLE KEYS */;
INSERT INTO `php41_auth` VALUES (101,'商品管理',0,'','','101',0),(102,'订单管理',0,'','','102',0),(103,'权限管理',0,'','','103',0),(104,'商品列表',101,'Goods','showlist','101-104',1),(105,'添加商品',101,'Goods','tianjia','101-105',1),(106,'商品分类',101,'Category','showlist','101-106',1),(107,'订单列表',102,'Order','showlist','102-107',1),(108,'查询订单',102,'Order','look','102-108',1),(109,'订单打印',102,'Order','dayin','102-109',1),(110,'管理员列表',103,'Admin','showlist','103-110',1),(111,'角色列表',103,'Role','showlist','103-111',1),(112,'权限列表',103,'Auth','showlist','103-112',1),(114,'会员管理',0,'','','114',0),(115,'会员列表',114,'User','showlist','114-115',1),(116,'商品类型',101,'Type','showlist','101-116',1);
/*!40000 ALTER TABLE `php41_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `php41_category`
--

DROP TABLE IF EXISTS `php41_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `php41_category` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `cat_name` varchar(32) NOT NULL COMMENT '分类名称',
  `cat_pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `cat_path` varchar(32) NOT NULL DEFAULT '' COMMENT '全路径',
  `cat_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '等级',
  PRIMARY KEY (`cat_id`),
  KEY `cat_pid` (`cat_pid`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='商品分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `php41_category`
--

LOCK TABLES `php41_category` WRITE;
/*!40000 ALTER TABLE `php41_category` DISABLE KEYS */;
INSERT INTO `php41_category` VALUES (1,'数字商品',0,'1',0),(2,'家用电器',0,'2',0),(3,'手机数码',0,'3',0),(4,'电脑办公',0,'4',0),(5,'家具厨具',0,'5',0),(6,'服装鞋帽',0,'6',0),(7,'电子书',1,'1-7',1),(8,'数字音乐',1,'1-8',1),(9,'音像',1,'1-9',1),(10,'大家电',2,'2-10',1),(11,'生活电器',2,'2-11',1),(12,'免费',7,'1-7-12',2),(13,'小说',7,'1-7-13',2),(14,'文学',7,'1-7-14',2),(15,'经营',7,'1-7-15',2),(16,'电视',10,'2-10-16',2),(17,'空调',10,'2-10-17',2),(18,'冰箱',10,'2-10-18',2),(19,'饮水机',11,'2-11-19',2),(20,'空气净化器',11,'2-11-20',2),(21,'国产手机',3,'3-21',1),(22,'外国手机',3,'3-22',1),(23,'曲面手机',22,'3-22-23',2),(24,'大屏手机',22,'3-22-24',2),(25,'老年机',21,'3-21-25',2);
/*!40000 ALTER TABLE `php41_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `php41_goods`
--

DROP TABLE IF EXISTS `php41_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `php41_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_name` varchar(256) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价格',
  `goods_shop_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本店价格',
  `goods_number` smallint(6) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `goods_weight` smallint(6) NOT NULL DEFAULT '0' COMMENT '商品重量',
  `cat_id` mediumint(9) NOT NULL DEFAULT '0' COMMENT '商品分类',
  `brand_id` mediumint(9) NOT NULL DEFAULT '0' COMMENT '商品品牌',
  `type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '类型id',
  `goods_big_logo` char(100) NOT NULL DEFAULT '' COMMENT '商品大图片',
  `goods_small_logo` char(100) NOT NULL DEFAULT '' COMMENT '商品缩略图',
  `goods_introduce` text COMMENT '商品介绍',
  `is_sale` enum('上架','下架') NOT NULL DEFAULT '上架' COMMENT '上架，下架',
  `is_qiang` enum('不抢','抢') NOT NULL DEFAULT '不抢' COMMENT '是否抢购',
  `is_rec` enum('推荐','不推荐') NOT NULL DEFAULT '不推荐' COMMENT '推荐与否',
  `is_hot` enum('热销','不热销') NOT NULL DEFAULT '不热销' COMMENT '热销与否',
  `is_new` enum('新品','不新品') NOT NULL DEFAULT '不新品' COMMENT '新品与否',
  `add_time` int(11) NOT NULL COMMENT '添加信息时间',
  `upd_time` int(11) NOT NULL COMMENT '修改信息时间',
  `is_del` enum('删除','不删除') NOT NULL DEFAULT '不删除' COMMENT '删除与否',
  PRIMARY KEY (`goods_id`),
  KEY `goods_shop_price` (`goods_shop_price`),
  KEY `goods_price` (`goods_price`),
  KEY `cat_id` (`cat_id`),
  KEY `brand_id` (`brand_id`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `php41_goods`
--

LOCK TABLES `php41_goods` WRITE;
/*!40000 ALTER TABLE `php41_goods` DISABLE KEYS */;
INSERT INTO `php41_goods` VALUES (1,'htc_one',2000.00,0.00,1,102,0,0,0,'','','&lt;p&gt;z\\ddddddddddddd&lt;br/&gt;&lt;/p&gt;','上架','不抢','不推荐','不热销','不新品',1481517330,1481517330,'不删除'),(2,'htc_two&lt;h1&gt;welcome&lt;/h1&gt;',2001.00,0.00,1,103,0,0,0,'','','&lt;p&gt;asdddddddddddddddd&lt;br/&gt;&lt;/p&gt;','上架','不抢','不推荐','不热销','不新品',1481517388,1481517388,'不删除'),(3,'',0.00,0.00,1,0,0,0,0,'','',NULL,'上架','不抢','不推荐','不热销','不新品',1481518321,1481518321,'不删除'),(4,'',0.00,0.00,1,0,0,0,0,'','',NULL,'上架','不抢','不推荐','不热销','不新品',1481518380,1481518380,'不删除'),(6,'htc_four',2332.00,0.00,1,32767,0,0,0,'','','<p>this is good<br/></p>','上架','不抢','不推荐','不热销','不新品',1481520656,1481520656,'不删除'),(7,'htc_five',2344.00,0.00,1,23,0,0,0,'','','<p>this is very good <br/></p>','上架','不抢','不推荐','不热销','不新品',1481520772,1481520772,'不删除'),(8,'nokia_one',2344.00,0.00,1,132,0,0,0,'','','<p>sadd</p><p>dd<br/></p><p></p>','上架','不抢','不推荐','不热销','不新品',1481521241,1481521241,'不删除'),(9,'sy',142.00,0.00,1,142,0,0,0,'','','<p>41<br/></p>','上架','不抢','不推荐','不热销','不新品',1481522968,1481522968,'不删除'),(10,'qe',32.00,0.00,1,3423,0,0,0,'','','<p>sfd</p><p><br/></p><p></p>','上架','不抢','不推荐','不热销','不新品',1481523929,1481523929,'不删除'),(11,'32e',123132.00,0.00,1,312,0,0,0,'','','<p>wfeaf</p>}<p>wwf<br/></p><p></p>','上架','不抢','不推荐','不热销','不新品',1481529541,1481529541,'不删除'),(12,'23e4',321.00,0.00,1,0,0,0,0,'./Common/Uploads/2016-12-22/585b8d739c801.jpg','./Common/Uploads/2016-12-22/small_585b8d739c801.jpg','&lt;p&gt;sdfff&lt;/p&gt;&lt;p&gt;ffff&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;','上架','不抢','不推荐','不热销','新品',1481529620,1482394995,'不删除'),(13,'qwe',312.00,0.00,1,0,0,0,0,'./Common/Uploads/2016-12-22/585b795e1e043.jpg','./Common/Uploads/2016-12-22/small_585b795e1e043.jpg','&lt;p&gt;sda&lt;br/&gt;&lt;/p&gt;','上架','不抢','推荐','不热销','新品',1481537462,1482389854,'不删除'),(14,'321',132.00,0.00,1,23,0,0,0,'','','dasssss<br />','上架','不抢','不推荐','不热销','不新品',1481537505,1481537505,'删除'),(15,'24',324.00,0.00,1,34,0,0,0,'','','sfda\\ffsd<br />','上架','不抢','不推荐','不热销','不新品',1481537623,1481537623,'删除'),(16,'43',543.00,0.00,1,43,0,0,0,'','','','上架','不抢','不推荐','不热销','不新品',0,1481537781,'删除'),(17,'231',2000.00,0.00,1,0,0,0,0,'./Common/Uploads/584ea3d928a14.jpg','','','上架','不抢','不推荐','不热销','不新品',1481548761,1481548761,'删除'),(18,'34442',1231.00,0.00,1,0,0,0,0,'./Common/Uploads/584ea588ed556.jpg','','','上架','不抢','不推荐','不热销','不新品',1481549192,1481549192,'删除'),(19,'321',423.00,0.00,1,0,0,0,0,'./Common/Uploads/2016-12-22/585b7919860a1.jpg','./Common/Uploads/2016-12-22/small_585b7919860a1.jpg','','上架','不抢','推荐','不热销','新品',1481609253,1482389785,'不删除'),(20,'43',2424.00,0.00,1,0,0,0,0,'./Common/Uploads/2016-12-22/585b79037f625.jpg','./Common/Uploads/2016-12-22/small_585b79037f625.jpg','','上架','抢','不推荐','热销','不新品',1481609547,1482389825,'不删除'),(21,'234',312.00,0.00,1,0,0,0,0,'./Common/Uploads/2016-12-22/585b78f1b5944.jpg','./Common/Uploads/2016-12-22/small_585b78f1b5944.jpg','','上架','抢','不推荐','热销','不新品',1481609671,1482389837,'不删除'),(22,'34442',423.00,0.00,1,0,0,0,0,'./Common/Uploads/2016-12-22/585b78e343da0.jpg','./Common/Uploads/2016-12-22/small_585b78e343da0.jpg','','上架','不抢','推荐','热销','不新品',1481611342,1482389731,'不删除'),(23,'23442',2424.00,0.00,1,0,0,0,0,'./Common/Uploads/2016-12-13/584f9aaa6305b.jpg','./Common/Uploads/2016-12-13/small_584f9aaa6305b.jpg','','上架','不抢','不推荐','不热销','不新品',1481611946,1481611946,'删除'),(24,'231',312.00,0.00,1,0,21,0,0,'./Common/Uploads/2016-12-13/584fab3de5147.jpg','./Common/Uploads/2016-12-13/small_584fab3de5147.jpg','','上架','抢','推荐','热销','新品',1481616189,1482389622,'不删除'),(25,'wq',0.00,0.00,1,0,0,0,0,'./Common/Uploads/2016-12-13/584fac0e102a8.jpg','./Common/Uploads/2016-12-13/small_584fac0e102a8.jpg','','上架','不抢','不推荐','不热销','不新品',1481616398,1481616398,'删除'),(26,'32',32.00,0.00,1,0,0,0,0,'./Common/Uploads/2016-12-13/584ff96a57644.jpg','./Common/Uploads/2016-12-13/small_584ff96a57644.jpg','','上架','不抢','不推荐','不热销','不新品',1481618086,1481695343,'删除'),(27,'samsung4342',3440.00,0.00,1,0,0,0,0,'./Common/Uploads/2016-12-14/5850c66a2dfbf.jpg','./Common/Uploads/2016-12-14/small_5850c66a2dfbf.jpg','&lt;p&gt;samun&lt;span style=&quot;font-size:24px;color:rgb(192,0,0);&quot;&gt;g is ok ok &lt;img src=&quot;/ueditor/php/upload/image/20161213/1481634504114937.jpg&quot; title=&quot;1481634504114937.jpg&quot; alt=&quot;sy_62331342149.jpg&quot; style=&quot;width: 340px; height: 226px;&quot; width=&quot;340&quot; height=&quot;226&quot;/&gt;ok&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;','上架','不抢','不推荐','不热销','不新品',1481632902,1481688682,'删除'),(28,'',0.00,0.00,1,0,0,0,0,'','','','上架','不抢','不推荐','不热销','不新品',1481891117,1481891117,'删除'),(29,'changhong',1200.00,0.00,1,0,7,0,0,'./Common/Uploads/2016-12-18/58564719dfedc.jpg','./Common/Uploads/2016-12-18/small_58564719dfedc.jpg','&lt;p&gt;dwEDDDDDDDDDDDDDDDDDDD&lt;/p&gt;','上架','抢','不推荐','热销','不新品',1482049305,1482389611,'不删除'),(30,'sansung',2100.00,0.00,1,0,0,0,0,'./Common/Uploads/2016-12-18/585660629c409.jpg','./Common/Uploads/2016-12-18/small_585660629c409.jpg','','上架','抢','不推荐','热销','不新品',1482055778,1482389603,'不删除'),(31,'华为01',1234.00,0.00,1,0,3,0,0,'./Common/Uploads/2016-12-21/585a7bba4c20a.jpg','./Common/Uploads/2016-12-21/small_585a7bba4c20a.jpg','','上架','不抢','不推荐','不热销','不新品',1482124937,1482324922,'删除'),(32,'华为02',2200.00,0.00,1,0,14,0,0,'./Common/Uploads/2016-12-22/585b71ae1fd50.jpg','./Common/Uploads/2016-12-22/small_585b71ae1fd50.jpg','','上架','抢','推荐','热销','不新品',1482387884,1482389707,'不删除'),(33,'华为03',2300.00,0.00,1,103,21,0,0,'./Common/Uploads/2016-12-22/585b728cb2404.jpg','./Common/Uploads/2016-12-22/small_585b728cb2404.jpg','','上架','抢','推荐','不热销','不新品',1482388108,1482388108,'不删除');
/*!40000 ALTER TABLE `php41_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `php41_goods_attr`
--

DROP TABLE IF EXISTS `php41_goods_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `php41_goods_attr` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品id',
  `attr_id` mediumint(8) unsigned NOT NULL COMMENT '属性id',
  `attr_value` varchar(64) NOT NULL DEFAULT '' COMMENT '属性对应的值',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `attr_id` (`attr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='商品-属性关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `php41_goods_attr`
--

LOCK TABLES `php41_goods_attr` WRITE;
/*!40000 ALTER TABLE `php41_goods_attr` DISABLE KEYS */;
INSERT INTO `php41_goods_attr` VALUES (22,30,5,'android'),(21,30,5,'ios'),(20,30,5,'windows'),(19,30,4,'12'),(18,30,3,'12'),(17,30,2,'4g'),(23,30,6,'蓝色'),(24,30,6,'绿色');
/*!40000 ALTER TABLE `php41_goods_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `php41_goods_cat`
--

DROP TABLE IF EXISTS `php41_goods_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `php41_goods_cat` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品id',
  `cat_id` mediumint(8) unsigned NOT NULL COMMENT '分类id',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='商品-分类，关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `php41_goods_cat`
--

LOCK TABLES `php41_goods_cat` WRITE;
/*!40000 ALTER TABLE `php41_goods_cat` DISABLE KEYS */;
INSERT INTO `php41_goods_cat` VALUES (22,31,21),(21,31,25),(26,30,23),(25,30,22),(27,29,12),(28,24,25);
/*!40000 ALTER TABLE `php41_goods_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `php41_goods_pics`
--

DROP TABLE IF EXISTS `php41_goods_pics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `php41_goods_pics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品id',
  `pics_big` char(100) NOT NULL COMMENT '相册原图',
  `pics_small` char(100) NOT NULL COMMENT '相册缩略图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='商品相册表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `php41_goods_pics`
--

LOCK TABLES `php41_goods_pics` WRITE;
/*!40000 ALTER TABLE `php41_goods_pics` DISABLE KEYS */;
INSERT INTO `php41_goods_pics` VALUES (4,26,'./Common/Pics/2016-12-14/5850d1bfdbd4d.jpg','./Common/Pics/2016-12-14/small_5850d1bfdbd4d.jpg'),(5,26,'./Common/Pics/2016-12-14/5850d1bfdd0d5.jpg','./Common/Pics/2016-12-14/small_5850d1bfdd0d5.jpg'),(7,26,'./Common/Pics/2016-12-14/5850df46e8e27.jpg','./Common/Pics/2016-12-14/small_5850df46e8e27.jpg'),(8,26,'./Common/Pics/2016-12-14/5850df46ea1b0.jpg','./Common/Pics/2016-12-14/small_5850df46ea1b0.jpg'),(9,26,'./Common/Pics/2016-12-14/5850e06fa30da.jpg','./Common/Pics/2016-12-14/small_5850e06fa30da.jpg');
/*!40000 ALTER TABLE `php41_goods_pics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `php41_manager`
--

DROP TABLE IF EXISTS `php41_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `php41_manager` (
  `mg_id` int(11) NOT NULL AUTO_INCREMENT,
  `mg_name` varchar(32) NOT NULL,
  `mg_pwd` varchar(32) NOT NULL,
  `mg_time` int(10) unsigned NOT NULL COMMENT '时间',
  `mg_role_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
  PRIMARY KEY (`mg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `php41_manager`
--

LOCK TABLES `php41_manager` WRITE;
/*!40000 ALTER TABLE `php41_manager` DISABLE KEYS */;
INSERT INTO `php41_manager` VALUES (1,'tom','123456',1323212345,50),(2,'xiaoming','123456',1312345324,51),(3,'admin','123456',1323456543,0);
/*!40000 ALTER TABLE `php41_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `php41_role`
--

DROP TABLE IF EXISTS `php41_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `php41_role` (
  `role_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL COMMENT '角色名称',
  `role_auth_ids` varchar(128) NOT NULL DEFAULT '' COMMENT '权限ids,1,2,5',
  `role_auth_ac` text COMMENT '模块-操作',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `php41_role`
--

LOCK TABLES `php41_role` WRITE;
/*!40000 ALTER TABLE `php41_role` DISABLE KEYS */;
INSERT INTO `php41_role` VALUES (50,'主管','101,104','Goods-showlist'),(51,'经理','101,105,106,102,107,108,109','Goods-tianjia,Goods-category,Order-showlist,Order-look,Order-dayin');
/*!40000 ALTER TABLE `php41_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `php41_type`
--

DROP TABLE IF EXISTS `php41_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `php41_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `type_name` varchar(32) NOT NULL COMMENT '类型名称',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='商品类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `php41_type`
--

LOCK TABLES `php41_type` WRITE;
/*!40000 ALTER TABLE `php41_type` DISABLE KEYS */;
INSERT INTO `php41_type` VALUES (1,'收集'),(2,'手机'),(3,'音乐'),(4,'电影'),(5,'电脑'),(6,'相机'),(7,'摄像机'),(8,'化妆品');
/*!40000 ALTER TABLE `php41_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `php41_user`
--

DROP TABLE IF EXISTS `php41_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `php41_user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_name` varchar(32) NOT NULL COMMENT '会员名称',
  `user_email` varchar(64) NOT NULL DEFAULT '' COMMENT '邮箱',
  `user_pwd` char(32) NOT NULL COMMENT '密码',
  `user_sex` enum('男','女','保密') NOT NULL DEFAULT '男' COMMENT '性别',
  `user_weight` smallint(6) NOT NULL DEFAULT '0' COMMENT '体重',
  `user_height` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '身高',
  `user_logo` varchar(128) NOT NULL DEFAULT '' COMMENT '头像',
  `user_tel` char(11) NOT NULL DEFAULT '' COMMENT '手机',
  `user_identify` char(18) NOT NULL DEFAULT '' COMMENT '身份号码',
  `user_check` enum('0','1') NOT NULL DEFAULT '0' COMMENT '是否激活, 0:未激活  1:已激活',
  `user_check_code` char(32) NOT NULL DEFAULT '' COMMENT '邮箱验证激活码',
  `add_time` int(11) NOT NULL COMMENT '注册时间',
  `is_del` enum('0','1') NOT NULL DEFAULT '0' COMMENT '是否删除, 0:正常  1:被删除',
  PRIMARY KEY (`user_id`),
  KEY `user_name` (`user_name`),
  KEY `user_tel` (`user_tel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `php41_user`
--

LOCK TABLES `php41_user` WRITE;
/*!40000 ALTER TABLE `php41_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `php41_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-22 19:52:23
