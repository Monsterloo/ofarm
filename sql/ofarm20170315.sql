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

insert  into `category`(`id`,`cid`,`cname`,`parentid`,`state`,`isParent`) values ('0602f9c8055711e794f328cfe95897da','0602f9e8055711e794f328cfe95897da','酒茶冲饮','ae3fe6b3055411e794f328cfe95897da','1','false'),('06298c0b055611e794f328cfe95897da','06298c30055611e794f328cfe95897da','水果','8d47ae65055411e794f328cfe95897da','1','false'),('14f4745a055711e794f328cfe95897da','14f47472055711e794f328cfe95897da','肉类水产加工','ae3fe6b3055411e794f328cfe95897da','1','false'),('16cd621e055611e794f328cfe95897da','16cd624f055611e794f328cfe95897da','蔬菜','8d47ae65055411e794f328cfe95897da','1','false'),('2c90b5a75ad0adcd015ad0add7e20000','saaas','test','0','1','true'),('2d4d44ca055711e794f328cfe95897da','2d4d44ef055711e794f328cfe95897da','蔬果加工','ae3fe6b3055411e794f328cfe95897da','1','false'),('34382d35055711e794f328cfe95897da','34382d56055711e794f328cfe95897da','肉蛋奶','ae3fe6b3055411e794f328cfe95897da','1','false'),('4fce9ca9055711e794f328cfe95897da','4fce9cd3055711e794f328cfe95897da','农资','cb6a5d51055411e794f328cfe95897da','1','false'),('56d0784a055711e794f328cfe95897da','56d0786b055711e794f328cfe95897da','农机','cb6a5d51055411e794f328cfe95897da','1','false'),('7711eedc055611e794f328cfe95897da','7711eefd055611e794f328cfe95897da','特种类','9bd015ec055411e794f328cfe95897da','1','false'),('8a1fad7d055611e794f328cfe95897da','8a1fad9e055611e794f328cfe95897da','禽畜类','9bd015ec055411e794f328cfe95897da','1','false'),('8d47ae2f055411e794f328cfe95897da','8d47ae65055411e794f328cfe95897da','水果蔬菜','0','1','true'),('9338f77a055611e794f328cfe95897da','9338f793055611e794f328cfe95897da','水产类','9bd015ec055411e794f328cfe95897da','1','false'),('9bd015b2055411e794f328cfe95897da','9bd015ec055411e794f328cfe95897da','畜牧水产','0','1','true'),('a2e96c0a055411e794f328cfe95897da','a2e96c3f055411e794f328cfe95897da','粮油米面','0','1','true'),('a8356815055611e794f328cfe95897da','a835683a055611e794f328cfe95897da','繁育种苗','9bd015ec055411e794f328cfe95897da','1','false'),('ae3fe67e055411e794f328cfe95897da','ae3fe6b3055411e794f328cfe95897da','农副加工','0','1','true'),('cb6a5d1b055411e794f328cfe95897da','cb6a5d51055411e794f328cfe95897da','农资农机','0','1','true'),('cfe2e02e055611e794f328cfe95897da','cfe2e067055611e794f328cfe95897da','五谷杂粮','a2e96c3f055411e794f328cfe95897da','1','false'),('d6d645b5055611e794f328cfe95897da','d6d645cd055611e794f328cfe95897da','食用油','a2e96c3f055411e794f328cfe95897da','1','false'),('e20458c8055611e794f328cfe95897da','e20458e4055611e794f328cfe95897da','调味品','a2e96c3f055411e794f328cfe95897da','1','false');

/*Table structure for table `category_one` */

DROP TABLE IF EXISTS `category_one`;

CREATE TABLE `category_one` (
  `id` varchar(32) NOT NULL,
  `cid` varchar(32) DEFAULT NULL,
  `cname` varchar(40) DEFAULT NULL,
  `parentid` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `category_one` */

insert  into `category_one`(`id`,`cid`,`cname`,`parentid`) values ('0602f9c8055711e794f328cfe95897da','0602f9e8055711e794f328cfe95897da','酒茶冲饮','ae3fe6b3055411e794f328cfe95897da'),('06298c0b055611e794f328cfe95897da','06298c30055611e794f328cfe95897da','水果','8d47ae65055411e794f328cfe95897da'),('14f4745a055711e794f328cfe95897da','14f47472055711e794f328cfe95897da','肉类水产加工','ae3fe6b3055411e794f328cfe95897da'),('16cd621e055611e794f328cfe95897da','16cd624f055611e794f328cfe95897da','蔬菜','8d47ae65055411e794f328cfe95897da'),('2d4d44ca055711e794f328cfe95897da','2d4d44ef055711e794f328cfe95897da','蔬果加工','ae3fe6b3055411e794f328cfe95897da'),('34382d35055711e794f328cfe95897da','34382d56055711e794f328cfe95897da','肉蛋奶','ae3fe6b3055411e794f328cfe95897da'),('4fce9ca9055711e794f328cfe95897da','4fce9cd3055711e794f328cfe95897da','农资','cb6a5d51055411e794f328cfe95897da'),('56d0784a055711e794f328cfe95897da','56d0786b055711e794f328cfe95897da','农机','cb6a5d51055411e794f328cfe95897da'),('7711eedc055611e794f328cfe95897da','7711eefd055611e794f328cfe95897da','特种类','9bd015ec055411e794f328cfe95897da'),('8a1fad7d055611e794f328cfe95897da','8a1fad9e055611e794f328cfe95897da','禽畜类','9bd015ec055411e794f328cfe95897da'),('8d47ae2f055411e794f328cfe95897da','8d47ae65055411e794f328cfe95897da','水果蔬菜','0'),('9338f77a055611e794f328cfe95897da','9338f793055611e794f328cfe95897da','水产类','9bd015ec055411e794f328cfe95897da'),('9bd015b2055411e794f328cfe95897da','9bd015ec055411e794f328cfe95897da','畜牧水产','0'),('a2e96c0a055411e794f328cfe95897da','a2e96c3f055411e794f328cfe95897da','粮油米面','0'),('a8356815055611e794f328cfe95897da','a835683a055611e794f328cfe95897da','繁育种苗','9bd015ec055411e794f328cfe95897da'),('ae3fe67e055411e794f328cfe95897da','ae3fe6b3055411e794f328cfe95897da','农副加工','0'),('cb6a5d1b055411e794f328cfe95897da','cb6a5d51055411e794f328cfe95897da','农资农机','0'),('cfe2e02e055611e794f328cfe95897da','cfe2e067055611e794f328cfe95897da','五谷杂粮','a2e96c3f055411e794f328cfe95897da'),('d6d645b5055611e794f328cfe95897da','d6d645cd055611e794f328cfe95897da','食用油','a2e96c3f055411e794f328cfe95897da'),('e20458c8055611e794f328cfe95897da','e20458e4055611e794f328cfe95897da','调味品','a2e96c3f055411e794f328cfe95897da');

/*Table structure for table `category_two` */

DROP TABLE IF EXISTS `category_two`;

CREATE TABLE `category_two` (
  `id` varchar(32) NOT NULL,
  `cid` varchar(32) DEFAULT NULL,
  `cname` varchar(40) DEFAULT NULL,
  `parentid` varchar(40) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `isParent` varchar(10) DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `category_two` */

insert  into `category_two`(`id`,`cid`,`cname`,`parentid`,`state`,`isParent`) values ('0602f9c8055711e794f328cfe95897da','0602f9e8055711e794f328cfe95897da','酒茶冲饮','ae3fe6b3055411e794f328cfe95897da','1','false'),('06298c0b055611e794f328cfe95897da','06298c30055611e794f328cfe95897da','水果','8d47ae65055411e794f328cfe95897da','1','false'),('14f4745a055711e794f328cfe95897da','14f47472055711e794f328cfe95897da','肉类水产加工','ae3fe6b3055411e794f328cfe95897da','1','false'),('16cd621e055611e794f328cfe95897da','16cd624f055611e794f328cfe95897da','蔬菜','8d47ae65055411e794f328cfe95897da','1','false'),('2c90b5a75ad0adcd015ad0add7e20000','saaas','test','0','1','true'),('2d4d44ca055711e794f328cfe95897da','2d4d44ef055711e794f328cfe95897da','蔬果加工','ae3fe6b3055411e794f328cfe95897da','1','false'),('34382d35055711e794f328cfe95897da','34382d56055711e794f328cfe95897da','肉蛋奶','ae3fe6b3055411e794f328cfe95897da','1','false'),('4fce9ca9055711e794f328cfe95897da','4fce9cd3055711e794f328cfe95897da','农资','cb6a5d51055411e794f328cfe95897da','1','false'),('56d0784a055711e794f328cfe95897da','56d0786b055711e794f328cfe95897da','农机','cb6a5d51055411e794f328cfe95897da','1','false'),('7711eedc055611e794f328cfe95897da','7711eefd055611e794f328cfe95897da','特种类','9bd015ec055411e794f328cfe95897da','1','false'),('8a1fad7d055611e794f328cfe95897da','8a1fad9e055611e794f328cfe95897da','禽畜类','9bd015ec055411e794f328cfe95897da','1','false'),('8d47ae2f055411e794f328cfe95897da','8d47ae65055411e794f328cfe95897da','水果蔬菜','0','1','true'),('9338f77a055611e794f328cfe95897da','9338f793055611e794f328cfe95897da','水产类','9bd015ec055411e794f328cfe95897da','1','false'),('9bd015b2055411e794f328cfe95897da','9bd015ec055411e794f328cfe95897da','畜牧水产','0','1','true'),('a2e96c0a055411e794f328cfe95897da','a2e96c3f055411e794f328cfe95897da','粮油米面','0','1','true'),('a8356815055611e794f328cfe95897da','a835683a055611e794f328cfe95897da','繁育种苗','9bd015ec055411e794f328cfe95897da','1','false'),('ae3fe67e055411e794f328cfe95897da','ae3fe6b3055411e794f328cfe95897da','农副加工','0','1','true'),('cb6a5d1b055411e794f328cfe95897da','cb6a5d51055411e794f328cfe95897da','农资农机','0','1','true'),('cfe2e02e055611e794f328cfe95897da','cfe2e067055611e794f328cfe95897da','五谷杂粮','a2e96c3f055411e794f328cfe95897da','1','false'),('d6d645b5055611e794f328cfe95897da','d6d645cd055611e794f328cfe95897da','食用油','a2e96c3f055411e794f328cfe95897da','1','false'),('e20458c8055611e794f328cfe95897da','e20458e4055611e794f328cfe95897da','调味品','a2e96c3f055411e794f328cfe95897da','1','false');

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

insert  into `sys_admin`(`id`,`loginname`,`password`,`phone`,`email`,`createtime`,`roletype`,`state`) values ('2c90b5a75acb6543015acb66d08e0000','hahaha','123456','12345678900','fda@sina.com','2017-03-14 13:59:57','2','1'),('402882355a5e4b28015a5e4b2d9f0000','admin','123456','12345678910','496937493@qq.com','2017-02-21 09:31:09','1','1'),('402882355a5e5e1c015a5e5e20650000','lulu','123456','12345678910','496937493@qq.com','2017-02-21 09:51:47','1','1'),('402882355a5e5f39015a5e5f3dac0000','test0','123456','12345678910','0@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f3e360001','test1','123456','12345678910','1@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f3e7e0002','test2','123456','12345678910','2@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f3eb00003','test3','123456','12345678910','3@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f3ec30004','test4','123456','12345678910','4@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f3ed90005','test5','123456','12345678910','test5@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f3f060006','test6','123456','12345678910','test6@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f3f1b0007','test7','123456','11111111111','test777777@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f3f5b0008','test8','123456','12345678910','8@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f3f840009','test9','123456','12345678910','9@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f3fa2000a','test10','123456','12345678910','10@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f3fc0000b','test11','123456','12345678910','11@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f3fe5000c','test12','123456','12345678910','12@qq.com','2017-02-21 09:53:04','2','1'),('402882355a5e5f39015a5e5f4001000d','test13','123456','12345678910','13@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f402f000e','test14','123456','12345678910','14@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f4056000f','test15','123456','12345678910','15@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f407f0010','test16','123456','12345678910','16@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f409b0011','test17','123456','12345678910','17@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f40ae0012','test18','123456','12345678910','18@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f40ff0013','test19','123456','12345678910','19@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f41230014','test20','123456','12345678910','20@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f413d0015','test21','123456','12345678910','21@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f415c0016','test22','123456','12345678910','22@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f418e0017','test23','123456','12345678910','23@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f41ab0018','test24','123456','12345678910','24@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f41c80019','test25','123456','12345678910','25@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f41e4001a','test26','123456','12345678910','26@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f4202001b','test27','123456','12345678910','27@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f4229001c','test28','123456','12345678910','28@qq.com','2017-02-21 09:53:05','2','1'),('402882355a5e5f39015a5e5f4246001d','test29','123456','12345678910','29@qq.com','2017-02-21 09:53:05','2','1'),('402882355a82cb64015a82cce6e80000','aaaaa','123456','12345678910','wqerwe@qq.com','2017-02-28 11:39:10','2','1'),('402882355a835941015a835b2c870000','aaaaaa','123456','13245678912','asdasd@qweq.com','2017-02-28 14:14:34','2','1'),('402882355a835941015a835f835a0001','asdffas','123456789','12345678911','asdasd@qq.com','2017-02-28 14:19:19','2','1'),('402882355a835941015a835feb9f0002','tstte','123456','12345678911','dasdwq!@sdaf.com','2017-02-28 14:19:45','2','1');

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

insert  into `sys_role`(`id`,`roletype`,`rolename`) values ('402882355a5e54ea015a5e54f03b0000','1','超级管理员'),('402882355a5e54ea015a5e54f1470001','2','普通管理员');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
