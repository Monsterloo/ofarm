/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.6.19 : Database - ofarm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ofarm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ofarm`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` varchar(32) NOT NULL,
  `cid` varchar(32) DEFAULT NULL,
  `cname` varchar(40) DEFAULT NULL,
  `parentid` varchar(40) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `isParent` varchar(10) DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`cid`,`cname`,`parentid`,`state`,`isParent`) values ('402881e95b37e5ca015b37e5e80f0000','402881e95b37e5ca015b37e5e80f0000','酒茶冲饮','402881e95b37e724015b37e739210004','1','false'),('402881e95b37e724015b37e737f40000','402881e95b37e724015b37e737f40000','水产类','402881e95b37e724015b37e738db0001','1','false'),('402881e95b37e724015b37e738db0001','402881e95b37e724015b37e738db0001','畜牧水产','0','1','true'),('402881e95b37e724015b37e738ee0002','402881e95b37e724015b37e738ee0002','粮油米面','0','1','true'),('402881e95b37e724015b37e739020003','402881e95b37e724015b37e739020003','繁育种苗','402881e95b37e724015b37e738db0001','1','false'),('402881e95b37e724015b37e739210004','402881e95b37e724015b37e739210004','农副加工','0','1','true'),('402881e95b37e724015b37e739310005','402881e95b37e724015b37e739310005','农资农机','0','1','true'),('402881e95b37e724015b37e739490006','402881e95b37e724015b37e739490006','五谷杂粮','402881e95b37e724015b37e738ee0002','1','false'),('402881e95b37e724015b37e739640007','402881e95b37e724015b37e739640007','食用油','402881e95b37e724015b37e738ee0002','1','false'),('402881e95b37e724015b37e7397b0008','402881e95b37e724015b37e7397b0008','水果蔬菜','0','1','true'),('402881e95b37e724015b37e7398f0009','402881e95b37e724015b37e7398f0009','禽畜类','402881e95b37e724015b37e738db0001','1','false'),('402881e95b37e724015b37e739a4000a','402881e95b37e724015b37e739a4000a','水果','402881e95b37e724015b37e7397b0008','1','false'),('402881e95b37e724015b37e739bd000b','402881e95b37e724015b37e739bd000b','肉类水产加工','402881e95b37e724015b37e739210004','1','false'),('402881e95b37e724015b37e739ce000c','402881e95b37e724015b37e739ce000c','蔬菜','402881e95b37e724015b37e7397b0008','1','false'),('402881e95b37e724015b37e739df000d','402881e95b37e724015b37e739df000d','蔬果加工','402881e95b37e724015b37e739210004','1','false'),('402881e95b37e724015b37e739f4000e','402881e95b37e724015b37e739f4000e','肉蛋奶','402881e95b37e724015b37e739210004','1','false'),('402881e95b37e724015b37e73a0f000f','402881e95b37e724015b37e73a0f000f','农资','402881e95b37e724015b37e739310005','1','false'),('402881e95b37e724015b37e73a270010','402881e95b37e724015b37e73a270010','农机','402881e95b37e724015b37e739310005','1','false'),('402881e95b37e724015b37e73a3e0011','402881e95b37e724015b37e73a3e0011','特种类','402881e95b37e724015b37e738db0001','1','false'),('402881e95b37e724015b37e73a580012','402881e95b37e724015b37e73a580012','调味品','402881e95b37e724015b37e738ee0002','1','false');

/*Table structure for table `category_data` */

DROP TABLE IF EXISTS `category_data`;

CREATE TABLE `category_data` (
  `id` varchar(32) NOT NULL,
  `cid` varchar(32) DEFAULT NULL,
  `cname` varchar(40) DEFAULT NULL,
  `parentid` varchar(40) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `isParent` varchar(10) DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `category_data` */

insert  into `category_data`(`id`,`cid`,`cname`,`parentid`,`state`,`isParent`) values ('402881e95b37e5ca015b37e5e80f0000','402881e95b37e5ca015b37e5e80f0000','酒茶冲饮','402881e95b37e724015b37e739210004','1','false'),('402881e95b37e724015b37e737f40000','402881e95b37e724015b37e737f40000','水产类','402881e95b37e724015b37e738db0001','1','false'),('402881e95b37e724015b37e738db0001','402881e95b37e724015b37e738db0001','畜牧水产','0','1','true'),('402881e95b37e724015b37e738ee0002','402881e95b37e724015b37e738ee0002','粮油米面','0','1','true'),('402881e95b37e724015b37e739020003','402881e95b37e724015b37e739020003','繁育种苗','402881e95b37e724015b37e738db0001','1','false'),('402881e95b37e724015b37e739210004','402881e95b37e724015b37e739210004','农副加工','0','1','true'),('402881e95b37e724015b37e739310005','402881e95b37e724015b37e739310005','农资农机','0','1','true'),('402881e95b37e724015b37e739490006','402881e95b37e724015b37e739490006','五谷杂粮','402881e95b37e724015b37e738ee0002','1','false'),('402881e95b37e724015b37e739640007','402881e95b37e724015b37e739640007','食用油','402881e95b37e724015b37e738ee0002','1','false'),('402881e95b37e724015b37e7397b0008','402881e95b37e724015b37e7397b0008','水果蔬菜','0','1','true'),('402881e95b37e724015b37e7398f0009','402881e95b37e724015b37e7398f0009','禽畜类','402881e95b37e724015b37e738db0001','1','false'),('402881e95b37e724015b37e739a4000a','402881e95b37e724015b37e739a4000a','水果','402881e95b37e724015b37e7397b0008','1','false'),('402881e95b37e724015b37e739bd000b','402881e95b37e724015b37e739bd000b','肉类水产加工','402881e95b37e724015b37e739210004','1','false'),('402881e95b37e724015b37e739ce000c','402881e95b37e724015b37e739ce000c','蔬菜','402881e95b37e724015b37e7397b0008','1','false'),('402881e95b37e724015b37e739df000d','402881e95b37e724015b37e739df000d','蔬果加工','402881e95b37e724015b37e739210004','1','false'),('402881e95b37e724015b37e739f4000e','402881e95b37e724015b37e739f4000e','肉蛋奶','402881e95b37e724015b37e739210004','1','false'),('402881e95b37e724015b37e73a0f000f','402881e95b37e724015b37e73a0f000f','农资','402881e95b37e724015b37e739310005','1','false'),('402881e95b37e724015b37e73a270010','402881e95b37e724015b37e73a270010','农机','402881e95b37e724015b37e739310005','1','false'),('402881e95b37e724015b37e73a3e0011','402881e95b37e724015b37e73a3e0011','特种类','402881e95b37e724015b37e738db0001','1','false'),('402881e95b37e724015b37e73a580012','402881e95b37e724015b37e73a580012','调味品','402881e95b37e724015b37e738ee0002','1','false');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `nid` varchar(32) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `publisher` varchar(50) DEFAULT NULL,
  `content` text,
  `state` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `FK_news_admin` (`publisher`),
  CONSTRAINT `FK_news_admin` FOREIGN KEY (`publisher`) REFERENCES `sys_admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `news` */

/*Table structure for table `orderdetail` */

DROP TABLE IF EXISTS `orderdetail`;

CREATE TABLE `orderdetail` (
  `odid` varchar(32) NOT NULL,
  `oid` varchar(32) DEFAULT NULL,
  `pid` varchar(32) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`odid`),
  KEY `FK_orderdetail_orders` (`oid`),
  KEY `FK_orderdetail_product` (`pid`),
  CONSTRAINT `FK_orderdetail_orders` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_orderdetail_product` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orderdetail` */

insert  into `orderdetail`(`odid`,`oid`,`pid`,`number`) values ('2c90b5a75b5c510a015b5c52fdf70001','2c90b5a75b5c510a015b5c52fdcd0000','2c90b5a75b4644a5015b464658ce0000',232),('ff8080815b8ae6fb015b8ae921860001','ff8080815b8ae6fb015b8ae921740000','402881ec5b52006a015b5207c9000000',23),('ff8080815b8ae6fb015b8ae921870002','ff8080815b8ae6fb015b8ae921740000','2c90b5a75b3d5bd2015b3d6c33d30003',1),('ff8080815b8ae6fb015b8ae921880003','ff8080815b8ae6fb015b8ae921740000','2c90b5a75b3d5bd2015b3d6e2b020005',1);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `oid` varchar(32) NOT NULL,
  `admin` varchar(50) DEFAULT NULL COMMENT '操作人',
  `customername` varchar(10) DEFAULT NULL COMMENT '客户名字',
  `customeraddress` varchar(50) DEFAULT NULL COMMENT '客户地址',
  `customerphone` varchar(20) DEFAULT NULL COMMENT '客户电话',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `note` varchar(100) DEFAULT NULL COMMENT '备注',
  `state` varchar(2) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`oid`),
  KEY `FK_orders_admin` (`admin`),
  CONSTRAINT `FK_orders_admin` FOREIGN KEY (`admin`) REFERENCES `sys_admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`oid`,`admin`,`customername`,`customeraddress`,`customerphone`,`createtime`,`note`,`state`) values ('2c90b5a75b5c510a015b5c52fdcd0000','402882355a5e4b28015a5e4b2d9f0000','test','testtest','13131313131','2017-04-11 17:23:14','testtest','1'),('ff8080815b8ae6fb015b8ae921740000','402882355a5e4b28015a5e4b2d9f0000','肌肉豪','丁香C611','13131313131','2017-04-20 18:29:45','肌肉豪肌肉豪','1');

/*Table structure for table `performance` */

DROP TABLE IF EXISTS `performance`;

CREATE TABLE `performance` (
  `id` varchar(32) NOT NULL,
  `admin` varchar(32) DEFAULT NULL,
  `monthbase` float DEFAULT NULL,
  `monthwork` float DEFAULT NULL,
  `punishment` float DEFAULT NULL,
  `notetime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_performance_admin` (`admin`),
  CONSTRAINT `FK_performance_admin` FOREIGN KEY (`admin`) REFERENCES `sys_admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `performance` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `pid` varchar(32) NOT NULL,
  `pcategory` varchar(32) DEFAULT NULL COMMENT '产品类别',
  `pname` varchar(20) DEFAULT NULL COMMENT '产品名字',
  `price` double DEFAULT '0',
  `punit` varchar(5) DEFAULT NULL COMMENT '产品单位',
  `origin` varchar(20) DEFAULT NULL COMMENT '产品产地',
  `inventory` int(11) DEFAULT '0' COMMENT '存货数',
  `pimg` varchar(150) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `state` varchar(2) DEFAULT '1',
  PRIMARY KEY (`pid`),
  KEY `FK_product_category` (`pcategory`),
  CONSTRAINT `FK_product_category` FOREIGN KEY (`pcategory`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`pid`,`pcategory`,`pname`,`price`,`punit`,`origin`,`inventory`,`pimg`,`createtime`,`state`) values ('2c90b5a75b3bd87a015b3bd886060000','402881e95b37e724015b37e739a4000a','test1',22,'千克','广东省广州2',302,'../upload/20170407160800.jpg','2017-04-05 10:01:37','1'),('2c90b5a75b3bd87a015b3bd886ef0001','402881e95b37e724015b37e73a270010','拖拉机鸡鸡',233,'2332','323232',32323,'../upload/20170409172645.jpg','2017-04-05 10:01:37','1'),('2c90b5a75b3bd87a015b3bd886fe0002','402881e95b37e724015b37e737f40000','test3',4,'千克','广东省广州',10,'../upload/20170409172707.jpg','2017-04-05 10:01:37','1'),('2c90b5a75b3bd87a015b3bd887100003','402881e95b37e724015b37e737f40000','test4',6,'顿','广东省广州',23,'../upload/20170407103747.jpg','2017-04-05 10:01:37','1'),('2c90b5a75b3bd87a015b3bd887200004','402881e95b37e724015b37e739f4000e','test5',5,'克','广东省广州',54,'../upload/20170407103747.jpg','2017-04-05 10:01:37','1'),('2c90b5a75b3d5bd2015b3d5ca16a0000','402881e95b37e724015b37e737f40000','水产品test',2.22,'千克','ABCDEF',222,'../upload/20170407103747.jpg','2017-04-05 17:05:32','1'),('2c90b5a75b3d5bd2015b3d6995370001','402881e95b37e724015b37e739020003','这是一棵树',998,'棵','ABCDEFG',222,'../upload/20170407103747.jpg','2017-04-05 17:19:41','1'),('2c90b5a75b3d5bd2015b3d6aa9680002','402881e95b37e724015b37e739490006','这是一粒谷',0.01,'粒','QWERDF',121,'../upload/20170407103747.jpg','2017-04-05 17:20:52','1'),('2c90b5a75b3d5bd2015b3d6c33d30003','402881e95b37e724015b37e73a580012','这是一颗糖',9.62,'袋','糖糖糖糖糖',22,'../upload/20170407103747.jpg','2017-04-05 17:22:33','1'),('2c90b5a75b3d5bd2015b3d6d69e20004','402881e95b37e724015b37e7398f0009','这是一只火鸡',250,'只','就在火鸡岛',21,'../upload/20170407103747.jpg','2017-04-05 17:23:52','1'),('2c90b5a75b3d5bd2015b3d6e2b020005','402881e95b37e724015b37e73a3e0011','这是一只特种鸡',666,'只','opoppo',16,'../upload/20170407103747.jpg','2017-04-05 17:24:41','1'),('2c90b5a75b42760a015b4277fa950000','402881e95b37e5ca015b37e5e80f0000','这是一片茶叶',1,'片','广东省韶关市',22,'../upload/20170407103747.jpg','2017-04-06 16:53:30','1'),('2c90b5a75b4287e3015b428d7dd50000','402881e95b37e724015b37e739f4000e','这是一个蛋蛋',20000,'顿','来自复活节岛',22,'../upload/20170407103747.jpg','2017-04-06 17:17:00','1'),('2c90b5a75b4287e3015b428e51510001','402881e95b37e724015b37e73a0f000f','df飞洒是否',22,'发','威锋网而非',223,'../upload/20170407162751.jpg','2017-04-06 17:17:54','1'),('2c90b5a75b429dcf015b42a3b6710001','402881e95b37e724015b37e737f40000','testimg',23,'test','在山的那边,海的那边',243,'../upload/2c90b5a75b429dcf015b42a3b6710001.jpg','2017-04-06 17:41:17','1'),('2c90b5a75b4644a5015b464658ce0000','402881e95b37e724015b37e739f4000e','这是一桶奶',233,'桶','草地上的某只牛',233,'../upload/20170407103747.jpg','2017-04-07 10:37:47','1'),('2c90b5a75b465235015b4654ff380000','402881e95b37e724015b37e739020003','发撒旦发射',22,'棵','哈哈哈哈哈',44,'../upload/20170407105347.jpg','2017-04-07 10:53:47','1'),('2c90b5a75b477366015b478e07190000','402881e95b37e724015b37e739020003','收复失地',332,'块','323232',323,'../upload/20170407163535.jpg','2017-04-07 16:35:41','1'),('402881ec5b52006a015b5207c9000000','402881e95b37e724015b37e739df000d','这是蔬菜',22,'棵','哈哈哈哈哈',33,'../upload/20170409172453.jpg','2017-04-09 17:24:53','1');

/*Table structure for table `sys_admin` */

DROP TABLE IF EXISTS `sys_admin`;

CREATE TABLE `sys_admin` (
  `id` varchar(32) NOT NULL COMMENT 'Ψһid��ʶ',
  `loginname` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `roletype` varchar(10) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL COMMENT '״̬',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_admin` */

insert  into `sys_admin`(`id`,`loginname`,`password`,`phone`,`email`,`createtime`,`roletype`,`state`) values ('2c90b5a75acb6543015acb66d08e0000','hahaha','123456','12345678900','fda@sina.com','2017-03-14 13:59:57','3','1'),('402882355a5e4b28015a5e4b2d9f0000','admin','123456','12345678900','123132@qq.com','2017-02-21 09:31:09','1','1'),('402882355a5e5e1c015a5e5e20650000','lulu','123456','12345678910','496937493@qq.com','2017-02-21 09:51:47','1','1'),('402882355a5e5f39015a5e5f3dac0000','test0','123456','12345678910','0@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f3e360001','test1','123456','12345678910','1@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f3e7e0002','test2','123456','12345678910','2@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f3eb00003','test3','123456','12345678910','3@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f3ec30004','test4','123456','12345678910','4@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f3ed90005','test5','123456','12345678910','test5@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f3f1b0007','test7','123456','11111111111','test7777777777@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f3f5b0008','test8','123456','12345678910','8@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f3f840009','test9','123456','12345678910','9@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f3fa2000a','test10','123456','12345678910','10@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f3fc0000b','test11','123456','12345678910','11@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f3fe5000c','test12','123456','12345678910','12@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f4001000d','test13','123456','12345678910','13@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f402f000e','test14','123456','12345678910','14@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f4056000f','test15','123456','12345678910','15@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f407f0010','test16','123456','12345678910','16@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f409b0011','test17','123456','12345678910','17@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f40ae0012','test18','123456','12345678910','18@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f40ff0013','test19','123456','12345678910','19@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f41230014','test20','123456','12345678910','20@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f413d0015','test21','123456','12345678910','21@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f415c0016','test22','123456','12345678910','22@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f418e0017','test23','123456','12345678910','23@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f41ab0018','test24','123456','12345678910','24@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f41c80019','test25','123456','12345678910','25@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f41e4001a','test26','123456','12345678910','26@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f4202001b','test27','123456','12345678910','27@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f4229001c','test28','123456','12345678910','28@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f4246001d','test29','123456','12345678910','29@qq.com','2017-02-21 09:53:05','2','1'),('402882355a82cb64015a82cce6e80000','aaaaa','123456','12345678910','wqerwe@qq.com','2017-02-28 11:39:10','2','1'),('402882355a835941015a835b2c870000','aaaaaa','123456','13245678912','asdasd@qweq.com','2017-02-28 14:14:34','2','1'),('402882355a835941015a835f835a0001','asdffas','123456789','12345678911','asdasd@qq.com','2017-02-28 14:19:19','2','1'),('402882355a835941015a835feb9f0002','tstte','123456','12345678911','dasdwq!@sdaf.com','2017-02-28 14:19:45','2','1');

/*Table structure for table `sys_loginlog` */

DROP TABLE IF EXISTS `sys_loginlog`;

CREATE TABLE `sys_loginlog` (
  `id` varchar(32) NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `loginname` varchar(50) DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_loginlog` */

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` varchar(32) NOT NULL,
  `roletype` varchar(2) DEFAULT NULL,
  `rolename` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`roletype`,`rolename`) values ('2adf90200dfa11e7867028cfe95897da','1','管理员'),('402882355a5e54ea015a5e54f03b0000','2','产品员工'),('402882355a5e54ea015a5e54f1470001','3','人事员工');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
