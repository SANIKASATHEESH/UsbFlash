/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 5.6.17 : Database - usbchek
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`usbchek` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `usbchek`;

/*Table structure for table `filetransfer` */

DROP TABLE IF EXISTS `filetransfer`;

CREATE TABLE `filetransfer` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `directory` varchar(100) DEFAULT NULL,
  `action` varchar(100) DEFAULT 'none',
  `filename` varchar(200) DEFAULT NULL,
  `ftime` datetime DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `filetransfer` */

insert  into `filetransfer`(`fid`,`directory`,`action`,`filename`,`ftime`) values 
(2,'E:\\','ENTRY_DELETE','ml3.jpg','2021-02-22 11:03:11'),
(3,'E','ENTRY_DELETE','msk.jpg','2021-02-22 11:06:44'),
(5,'E:\\','ENTRY_DELETE','msk2.jpg','2021-02-22 11:08:04'),
(6,'E:\\','ENTRY_CREATE','ml1.jpg','2021-02-22 11:08:44'),
(8,'E:\\','ENTRY_MODIFY','ml1.jpg','2021-02-22 11:08:45'),
(9,'E:\\','ENTRY_MODIFY','ml1.jpg','2021-02-22 11:08:45');

/*Table structure for table `mydrives` */

DROP TABLE IF EXISTS `mydrives`;

CREATE TABLE `mydrives` (
  `drive_id` int(11) NOT NULL AUTO_INCREMENT,
  `drive_name` varchar(20) NOT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `dmax_space` int(11) DEFAULT '100',
  `dfree_space` int(11) DEFAULT '0',
  PRIMARY KEY (`drive_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mydrives` */

/*Table structure for table `newconnection` */

DROP TABLE IF EXISTS `newconnection`;

CREATE TABLE `newconnection` (
  `cnid` int(11) NOT NULL AUTO_INCREMENT,
  `cn_drivename` varchar(100) DEFAULT NULL,
  `cn_displayname` varchar(100) DEFAULT NULL,
  `cntype` varchar(100) DEFAULT NULL,
  `cnserial_no` varchar(200) DEFAULT NULL,
  `max_space` varchar(30) DEFAULT NULL,
  `free_space` varchar(30) DEFAULT NULL,
  `con_time` datetime DEFAULT NULL,
  `rem_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT 'connected',
  PRIMARY KEY (`cnid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `newconnection` */

insert  into `newconnection`(`cnid`,`cn_drivename`,`cn_displayname`,`cntype`,`cnserial_no`,`max_space`,`free_space`,`con_time`,`rem_time`,`status`) values 
(6,'E','USB Drive (E:)','USB Drive','-1998408750','8001609728','1451646976','2021-02-19 17:46:36','2021-02-19 17:46:36','disconnected'),
(7,'E','USB Drive (E:)','USB Drive','-1998408750','8001609728','1451646976','2021-02-19 17:53:54','2021-02-19 17:53:54','disconnected'),
(8,'E','USB Drive (E:)','USB Drive','-1998408750','8001609728','1451646976','2021-02-19 17:53:55','2021-02-19 17:53:55','disconnected'),
(9,'E','USB Drive (E:)','USB Drive','-1998408750','8001609728','1451646976','2021-02-19 17:54:07','2021-02-19 17:54:07','disconnected'),
(10,'E','USB Drive (E:)','USB Drive','-1998408750','8001609728','1451646976','2021-02-19 17:54:07','2021-02-19 17:54:07','disconnected'),
(11,'E','USB Drive (E:)','USB Drive','-1998408750','8001609728','1451646976','2021-02-19 17:56:20','2021-02-19 17:56:20','disconnected'),
(12,'E','USB Drive (E:)','USB Drive','-1998408750','8001609728','1451646976','2021-02-20 09:15:20','2021-02-22 11:05:58','disconnected'),
(13,'E','USB Drive (E:)','USB Drive','-1998408750','8001609728','1427664896','2021-02-22 10:24:17','2021-02-22 11:05:58','disconnected'),
(14,'E','USB Drive (E:)','USB Drive','-1998408750','8001609728','1427615744','2021-02-22 11:06:06','2021-02-22 11:06:06','connected');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
