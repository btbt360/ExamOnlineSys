# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.16-MariaDB)
# Database: jfinalbasedb
# Generation Time: 2016-11-14 14:42:19 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table sys_area
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_area`;

CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` double NOT NULL COMMENT '排序',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) DEFAULT NULL COMMENT '区域类型（1：国家；2：省份、直辖市；3：地市；4：区县）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';

LOCK TABLES `sys_area` WRITE;
/*!40000 ALTER TABLE `sys_area` DISABLE KEYS */;

INSERT INTO `sys_area` (`id`, `parent_id`, `parent_ids`, `name`, `sort`, `code`, `type`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`)
VALUES
	('0be5d9c7-8032-4578-b364-aa809caf7594','a326f968-1277-41b8-9c6d-0a4e89723bda','a326f968-1277-41b8-9c6d-0a4e89723bda|0be5d9c7-8032-4578-b364-aa809caf7594','赛罕区',1.15,'15200','4','9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-30 15:00:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-30 15:00:48',NULL,'1'),
	('181ac006-d15a-4b75-a1c2-ecb1f72718a9','b6088cbc-f620-4cc8-8695-8c82a2cbab84','b6088cbc-f620-4cc8-8695-8c82a2cbab84|181ac006-d15a-4b75-a1c2-ecb1f72718a9','海拉尔',1.2,'0133122','3','9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-30 14:52:54','9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-30 14:52:54','测试','1'),
	('1c924364-fd13-4d1b-9693-c5982ff9eb47','a326f968-1277-41b8-9c6d-0a4e89723bda','a326f968-1277-41b8-9c6d-0a4e89723bda|1c924364-fd13-4d1b-9693-c5982ff9eb47','赛罕区',1.16,'35132132','4','9b70e448-58e7-4a46-ac83-c408d835643d','2016-08-09 08:47:42','9b70e448-58e7-4a46-ac83-c408d835643d','2016-08-09 08:47:42',NULL,'0'),
	('223073c8-57da-40e6-be27-8463bc3a950b','a326f968-1277-41b8-9c6d-0a4e89723bda','a326f968-1277-41b8-9c6d-0a4e89723bda|223073c8-57da-40e6-be27-8463bc3a950b','赛罕区',1.14,'15200','4','9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-30 15:03:54','9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-30 15:03:54',NULL,'1'),
	('4bbd9579-c60a-481f-81e5-8186e4f06056','','','大学城',2,'15631','4','9b70e448-58e7-4a46-ac83-c408d835643d','2016-08-09 08:49:19','9b70e448-58e7-4a46-ac83-c408d835643d','2016-08-09 08:49:19',NULL,'1'),
	('76673596-c3bc-4b9d-b9e1-45d056a3926f','a326f968-1277-41b8-9c6d-0a4e89723bda','a326f968-1277-41b8-9c6d-0a4e89723bda|76673596-c3bc-4b9d-b9e1-45d056a3926f','玉泉区',1.12,'123100','4','9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-30 17:26:08','9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-30 17:26:08',NULL,'0'),
	('8586f081-146c-4cc2-8e08-e9002a52f807','a326f968-1277-41b8-9c6d-0a4e89723bda','b6088cbc-f620-4cc8-8695-8c82a2cbab84|a326f968-1277-41b8-9c6d-0a4e89723bda','市辖区',1.11,'150000','4','9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-06 16:13:56','9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-06 16:13:56',NULL,'1'),
	('a326f968-1277-41b8-9c6d-0a4e89723bda','b6088cbc-f620-4cc8-8695-8c82a2cbab84','b6088cbc-f620-4cc8-8695-8c82a2cbab84|','呼和浩特',1.1,'150000','3','9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-30 17:33:36','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-02 16:39:44',NULL,'0'),
	('b6088cbc-f620-4cc8-8695-8c82a2cbab84','','','内蒙古自治区',1,'150000','2','9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-30 17:24:22','9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-30 17:24:22',NULL,'0'),
	('bc0bb1dd-9209-485c-9861-252bb51d555c','b6088cbc-f620-4cc8-8695-8c82a2cbab84','b6088cbc-f620-4cc8-8695-8c82a2cbab84|bc0bb1dd-9209-485c-9861-252bb51d555c','巴彦淖尔市',1.3,'3541516165','3','9b70e448-58e7-4a46-ac83-c408d835643d','2016-08-09 08:48:23','9b70e448-58e7-4a46-ac83-c408d835643d','2016-08-09 08:48:23',NULL,'0'),
	('d04cad96-216f-4592-990c-eef64725a939','a326f968-1277-41b8-9c6d-0a4e89723bda','a326f968-1277-41b8-9c6d-0a4e89723bda|d04cad96-216f-4592-990c-eef64725a939','回民区',1.13,'102314','4','9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-06 15:11:27','9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-06 17:25:04','斤斤计较123122312313111','0'),
	('d6982d40-65a9-4e77-869f-66fe5a73ef90','a326f968-1277-41b8-9c6d-0a4e89723bda','a326f968-1277-41b8-9c6d-0a4e89723bda|d6982d40-65a9-4e77-869f-66fe5a73ef90','新城区',1.17,'23132131','4','9b70e448-58e7-4a46-ac83-c408d835643d','2016-08-09 08:48:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-08-09 08:48:48',NULL,'0');

/*!40000 ALTER TABLE `sys_area` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_cases
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_cases`;

CREATE TABLE `sys_cases` (
  `id` varchar(64) NOT NULL COMMENT '唯一编码 : 唯一编码',
  `subject_id` varchar(64) NOT NULL COMMENT '科目编码 : 科目编码',
  `casetitle` varchar(2000) NOT NULL COMMENT '案例题目',
  `caseanswer` varchar(2000) DEFAULT NULL COMMENT '案例答案',
  `creator_id` varchar(64) DEFAULT NULL COMMENT '创建者 : 创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间 : 创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间 : 更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注信息 : 备注',
  `isenable` int(11) NOT NULL DEFAULT '0' COMMENT '是否启用 : 0未启用\n1已启用',
  `isdel` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 : 0已删除 1未删除',
  `name` varchar(256) NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `sys_cases_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `sys_subject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='案例表';

LOCK TABLES `sys_cases` WRITE;
/*!40000 ALTER TABLE `sys_cases` DISABLE KEYS */;

INSERT INTO `sys_cases` (`id`, `subject_id`, `casetitle`, `caseanswer`, `creator_id`, `create_date`, `update_date`, `update_by`, `remark`, `isenable`, `isdel`, `name`)
VALUES
	('1e533e45-9231-43ea-8e6e-f8563721244b','ab579eaa-9f13-4f14-a885-fc7ecf4ba109','2','3','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-08 22:58:12','2016-11-08 23:00:57','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,1,'1'),
	('79e9d5a7-12e9-444a-87b5-73c2c21da577','cd84d06e-5b8c-47e9-8b44-c9c63e77e896','22223','222222223','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-20 17:49:03','2016-10-20 18:12:40','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0,'22223');

/*!40000 ALTER TABLE `sys_cases` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_dict
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `dictkey` varchar(64) DEFAULT NULL COMMENT '字典key',
  `dictvalue` varchar(100) DEFAULT NULL COMMENT '数据字典值',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `type` varchar(64) DEFAULT NULL COMMENT '数据字典类型',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  `typeinfo` varchar(255) DEFAULT NULL COMMENT '数据字典类型描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多级字典表';

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;

INSERT INTO `sys_dict` (`id`, `dictkey`, `dictvalue`, `description`, `type`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`, `typeinfo`)
VALUES
	('015a5700-0b56-45e3-9cf5-e5165a5e7fa5','35','撒拉族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('021a73a8-a5b8-43c3-9058-52df2c1d8e4e','4','藏族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('0c24756d-f50a-42f6-b5b5-9fa4c8436c8e','49','京族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','','0','民族'),
	('0cf29506-858d-4f12-8c76-e2334e456f4e','40','普米族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('0ed39298-604e-469a-9d65-d66703d05941','3','一般权限',NULL,'1001','','2016-06-30 18:00:29','9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-30 18:00:29','1','0','角色'),
	('0f064fc6-cbe7-42e1-ac7e-6bb896f02898','9','布依族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('119e70b3-9b30-458d-9ee7-67ac9c9aad77','55','珞巴族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','','0','民族'),
	('11c654db-9b2c-4948-b14e-42677332dad9','14','白族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('125a0c2f-2007-43ef-9215-a9dbe423aa47','1','中共党员',NULL,'1004','','2016-11-14 21:17:44','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-14 21:17:44','中共党员','0','政治面貌'),
	('13bb3db4-dd1d-44fd-ab83-4f79da92efc3','1','考生',NULL,'1014','','2016-11-14 21:24:06','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-14 21:24:06','考生','0','登录类型'),
	('13f00e5e-d9d5-402e-b358-593e48fc20a6','41','塔吉克族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('16a66fc3-9d26-4db9-bef2-bc846b6df248','3','地级市',NULL,'1010','','2016-07-01 17:10:09','9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-01 17:10:09',NULL,'0','区域类型'),
	('189d9d02-dc17-4787-b1bc-d516dc05ac1a','2','10-dd-b1-e8-bb-0c',NULL,'1013','','2016-11-09 09:40:39','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-09 09:40:39','座位号对应mac地址','0','mac地址'),
	('1c031a71-4ea6-4a20-aced-e5a83dc4647b','3','共青团员',NULL,'1004','','2016-11-14 21:19:19','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-14 21:19:19','共青团员','0','政治面貌'),
	('21301bc6-a9bb-4268-bbf9-6502ada75858','7','彝族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('221f0ae6-3766-444d-9ae3-f95d7b83874f','48','裕固族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','','0','民族'),
	('22959681-fd54-425f-ac85-1bc2d1cb95de','34','布朗族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('2652a6b4-36e8-4d05-9cdb-e3b151d230bb','2','蒙古族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('2f803431-5d26-48c0-a90a-a147a3c853f3','46','德昂族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','','0','民族'),
	('32a8388b-4764-43e3-9460-f885e58cdbfb','5','维吾尔族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('34cebb87-bff8-40a8-a81a-8d229adeff28','2','多选题',NULL,'1002','','2016-10-19 16:50:36','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-19 16:50:36','多选题','0','试题类型'),
	('355e913d-425f-4e55-bff5-c3b72ed6d6ac','6','苗族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('3a6463a9-2302-4509-9007-c8e257526d79','8','壮族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('3e2c2cf8-bcd6-414d-8982-9c3883e8b621','50','塔塔尔族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','','0','民族'),
	('3ea36bce-1160-4366-af79-3996444a57c5','11','满族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('3f45c915-f6c6-46a6-b2b5-03b32aab311b','32','仫佬族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('41b4d0fd-26d2-404b-9fb7-ea93938e611c','4','区县',NULL,'1010','','2016-07-01 17:10:23','9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-01 17:10:23',NULL,'0','区域类型'),
	('42b7d564-33f3-463d-a0fc-0f9b69bd5cad','30','土族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('48e0d602-eb93-4e3c-8464-4a5356e9bbc9','3','回族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('4c820d8f-487e-4541-924e-660656ee3593','19','黎族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('4d45b231-ee7b-44be-99d9-64642b2a5e28','11','管理员',NULL,'1001','','2016-06-29 17:32:33','9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-29 17:32:33','11','0','角色'),
	('4f5943f4-fd3b-4003-9615-d86f9ce17b4c','44','俄罗斯族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','','0','民族'),
	('56c61fef-b171-4b6f-b85c-3a09291de0d7','4','民革党员',NULL,'1004','','2016-11-14 21:19:38','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-14 21:19:38','民革党员','0','政治面貌'),
	('5ace504a-6c2f-4d52-91ee-b7f5c8d9081e','2','虚拟组',NULL,'1000','','2016-06-24 15:01:59','9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-24 15:01:59','虚拟组','0','机构'),
	('5f0df8a7-d629-4194-94f0-2e34f0a2de96','2','省市/自治区',NULL,'1010','','2016-07-01 17:08:46','9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-01 17:09:43',NULL,'0','区域类型'),
	('6562c5ab-a7e7-4000-b999-8b4201737862','42','怒族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('6d7f6a47-f9c9-49b5-ad6a-1417fbf84d5b','10','朝鲜族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('79438dc5-6cc0-44ab-9ce6-ffbd4ac443f5','1','日志',NULL,'1008','','2016-07-30 17:10:14','9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-30 17:10:14','222','1','学位'),
	('7b391fc2-e2b4-4dc3-9c9f-880acad3a3e9','5','群众（现称普通公民）',NULL,'1004','','2016-11-14 21:20:13','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-14 21:20:27','群众（现称普通公民）','0','政治面貌'),
	('7b6f7c37-bd3e-4235-b854-4a2e55924967','2','中共预备党员',NULL,'1004','','2016-11-14 21:19:01','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-14 21:19:01','中共预备党员','0','政治面貌'),
	('839178d7-27a2-460b-b9a4-e35e3fc30b05','25','水族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('84eb635b-e999-4ce0-b442-249baca2610e','3','管理人员',NULL,'1003','','2016-11-14 21:23:19','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-14 21:23:19','管理人员','0','人员类型'),
	('87d41656-feff-415d-b66c-f609c244c996','33','羌族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('88798a4a-89c2-4277-a006-36cefa25d784','20','傈僳族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('8d36236f-a4f6-4325-ab45-4cb3d523ddf3','4','问答题',NULL,'1002','','2016-10-19 16:51:28','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-19 16:51:28','问答题','0','试题类型'),
	('91478bb7-d8a3-4faa-b68e-0e0fbc0361ee','39','阿昌族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('924b8432-dcd8-45db-9ce0-8ef0337d4b69','21','佤族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('92ad731e-bbea-413f-8af7-817d7ae8406a','3','判断题',NULL,'1002','','2016-10-19 16:51:14','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-19 16:51:14','判断题','0','试题类型'),
	('96189bdb-0a4d-4f00-83d4-27dea221f708','45','鄂温克族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','','0','民族'),
	('9a4bc063-e47d-4017-989e-47bd062e6e12','23','高山族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('a3f997f8-c1a7-428f-9b5a-f7e5c8dd7a81','1','a8-bb-cf-07-ea-8e',NULL,'1013','','2016-11-09 09:34:52','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-09 09:40:00','座位号对应mac地址','0','mac地址'),
	('ad91383b-ed5a-4eb3-8e43-aedf0f2af63d','3','岗位',NULL,'1000','','2016-06-24 15:02:20','9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-24 15:02:20','岗位','0','机构'),
	('afaeb003-e97c-4c7a-9f90-9c5627303a67','36','毛南族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('b133d5de-e80c-4f9f-9df5-0531ad165eb3','2','考试管理员',NULL,'1014','','2016-11-14 21:23:50','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-14 21:23:50','考试管理员','0','登录类型'),
	('b30bcc07-196b-4d2c-acdd-8d1a8784568e','1','单选题',NULL,'1002','','2016-10-18 16:54:19','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-18 16:54:19','单选题','0','试题类型'),
	('b3267a2a-9690-4bba-9bbe-6fe5bf0b0762','18','傣族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('b3406b8d-f279-4e86-8b61-fea3c07a59e5','53','赫哲族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','','0','民族'),
	('b6029434-8048-46a7-abef-d607b7ef2e5c','2','技能人员',NULL,'1003','','2016-11-14 21:23:08','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-14 21:23:08','技能人员','0','人员类型'),
	('b6887852-6be1-44ef-b2d9-cccff7d970cb','12','侗族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('b9a8a5f1-1435-483c-a140-ea2bc2f917a1','38','锡伯族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('c2acf377-5c68-4dca-a2e5-17588ef8bb59','51','独龙族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','','0','民族'),
	('c86667e0-d337-4c5d-a269-053ac14dc776','47','保安族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','','0','民族'),
	('c9f71108-6aa0-475d-83ef-b1a413931998','26','东乡族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('d0410680-bf3b-4d99-8601-7193037a7614','52','鄂伦春族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','','0','民族'),
	('d0b5f294-06d0-4aa9-beaa-1bc7012180fc','1','汉族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('d16a60a5-2856-458e-91b0-71e60efdf772','1','机构',NULL,'1000','','2016-06-24 15:00:30','9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-24 15:00:30','机构','0','机构'),
	('d359a003-f07b-4a51-a6a1-c253c0933af4','5','填空题',NULL,'1002','','2016-10-19 16:51:59','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-19 16:51:59','填空题','0','试题类型'),
	('d45c80e3-9d94-4bb6-8aa0-33be9cf5a278','1','技术人员',NULL,'1003','','2016-11-14 21:22:55','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-14 21:22:55','技术人员','0','人员类型'),
	('d8324b3b-901c-4ae8-b6a8-c4b6143f2402','27','纳西族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('db067371-3757-4154-b20d-26920a5b0614','29','柯尔克孜','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('ddaa5b5b-880d-4e4d-885a-079419585380','17','哈萨克族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('ded875c5-0feb-44bc-9216-131d5889b4cd','37','仡佬族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('e01ef285-5161-4bf5-b34b-15adcfedc4e1','1','国家',NULL,'1010','','2016-07-01 17:08:27','9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-01 17:08:27',NULL,'0','区域类型'),
	('e1c0d624-8b97-4d2e-834c-e339f41263df','28','景颇族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('e1e6c92b-0d95-40ea-9056-7b9541106598','16','哈尼族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('e227ca29-159a-4f16-bc75-d469f21dbb94','31','达斡尔族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('e3145fe4-9b7e-48cb-8af4-75d8d50570b2','56','基诺族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','','0','民族'),
	('e40e2249-0c78-4c22-b8dc-52979047c08b','15','土家族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('f2a43c1c-f145-43c2-8fee-a2f5d631b7d0','43','乌孜别克','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:10:43','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:10:43','','0','民族'),
	('f3bdccce-faa4-4e93-9c2e-8ca5843720ef','24','拉祜族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('f4cd4c59-e33a-4dd9-adb0-48d393fb4d80','13','瑶族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族'),
	('f52f7e83-9c06-456d-a25d-6853ee3b1384','54','门巴族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:09:53','','0','民族'),
	('fa1e3312-e45b-4e17-bdf2-1596bc0a4e5c','22','畲族','','1005','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-07 17:07:48','','0','民族');

/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_error
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_error`;

CREATE TABLE `sys_error` (
  `id` varchar(64) NOT NULL COMMENT '唯一编码 : 唯一编码',
  `question_id` varchar(64) NOT NULL COMMENT '试题编码 : 试题编码',
  `user_id` varchar(64) NOT NULL COMMENT '用户编码 : 唯一编码',
  `creator_id` varchar(64) DEFAULT NULL COMMENT '创建者 : 创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间 : 创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间 : 更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注信息 : 备注',
  `isenable` int(11) NOT NULL DEFAULT '0' COMMENT '是否启用 : 0未启用\n1已启用',
  `isdel` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 : 0已删除 1未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `question_id` (`question_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sys_error_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `sys_questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_error_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='错题表';

LOCK TABLES `sys_error` WRITE;
/*!40000 ALTER TABLE `sys_error` DISABLE KEYS */;

INSERT INTO `sys_error` (`id`, `question_id`, `user_id`, `creator_id`, `create_date`, `update_date`, `update_by`, `remark`, `isenable`, `isdel`)
VALUES
	('592e4ddb-9834-4548-ae45-a8db0467ebc9','fc45c3c1-8ea0-4ff2-b8fd-d96477761af2','8ff16130-6c01-425d-96ac-bf7e895f83f5','8ff16130-6c01-425d-96ac-bf7e895f83f5','2016-11-03 21:44:09','2016-11-03 21:44:09','8ff16130-6c01-425d-96ac-bf7e895f83f5',NULL,1,0);

/*!40000 ALTER TABLE `sys_error` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_exam
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_exam`;

CREATE TABLE `sys_exam` (
  `id` varchar(64) NOT NULL COMMENT '唯一编码 : 唯一编码',
  `code` varchar(128) NOT NULL COMMENT '考试编码',
  `name` varchar(256) NOT NULL COMMENT '名称',
  `starttime` datetime NOT NULL COMMENT '考试开始时间 : 考试开始时间',
  `endtime` datetime NOT NULL COMMENT '考试结束时间 : 考试结束时间',
  `duration` double NOT NULL DEFAULT '0' COMMENT '考试时长',
  `address` varchar(1000) NOT NULL COMMENT '考试地点',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '考试人数',
  `invigilatenameone` varchar(128) DEFAULT NULL COMMENT '监考员一姓名',
  `invigilatenametwo` varchar(128) DEFAULT NULL COMMENT '监考员二姓名 : 监考员二姓名',
  `demand` varchar(256) DEFAULT NULL COMMENT '考试要求',
  `institution` varchar(2000) DEFAULT NULL COMMENT '考试制度',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '考试状态 : 0未开始考试\n1正在考试\n2完成考试\n3未参加考试\n4考试作弊',
  `creator_id` varchar(64) DEFAULT NULL COMMENT '创建者 : 创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间 : 创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间 : 更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注信息 : 备注',
  `isenable` int(11) NOT NULL DEFAULT '0' COMMENT '是否启用 : 0未启用\n1已启用',
  `isdel` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 : 0已删除 1未删除',
  `exampapers_id` varchar(64) NOT NULL DEFAULT '' COMMENT '试卷编码',
  `enddistancetime` int(11) NOT NULL DEFAULT '0' COMMENT '距离结束时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试表';

LOCK TABLES `sys_exam` WRITE;
/*!40000 ALTER TABLE `sys_exam` DISABLE KEYS */;

INSERT INTO `sys_exam` (`id`, `code`, `name`, `starttime`, `endtime`, `duration`, `address`, `number`, `invigilatenameone`, `invigilatenametwo`, `demand`, `institution`, `status`, `creator_id`, `create_date`, `update_date`, `update_by`, `remark`, `isenable`, `isdel`, `exampapers_id`, `enddistancetime`)
VALUES
	('28fafb16-382a-4ec3-98bd-0140cdf7cecb','1','期末考试20161028','2016-10-31 00:00:00','2016-10-31 00:00:00',25,'万德',1,'监考1','监考2','钱钱钱钱钱钱','钱钱钱钱钱钱钱钱',0,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-28 23:10:00','2016-10-31 20:31:16','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0,'a7ab3064-c63a-4bcc-901f-4a702311d4c3',0),
	('34d44059-2280-48cb-98dd-0d00cbb583b3','X0oo2','测试1','2016-10-31 15:00:00','2016-11-30 15:00:00',2,'二楼会议室',40,'赵毅','孟华','考试要求','考试制度',2,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-01-01 00:00:00','2016-01-01 00:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','考试要求',1,0,'a7ab3064-c63a-4bcc-901f-4a702311d4c3',0),
	('5ecf4a4d-c606-4451-8003-c412e7e0a5c8','KS02','考试2','2016-11-02 23:40:00','2016-11-03 23:40:00',1440,'二楼会议室',2,'监考员一','监考员二','监考员','监考员',0,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:42:19','2016-11-02 23:42:19','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0,'a7ab3064-c63a-4bcc-901f-4a702311d4c3',0),
	('6379d33a-20e7-4303-8569-f2c737c9d35a','CEKS02','测试考试2','2016-11-02 23:25:00','2016-11-03 23:25:00',1440,'二楼机房',2,'监考员一','监考员二','无','无',0,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:29:41','2016-11-02 23:29:41','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,1,'a7ab3064-c63a-4bcc-901f-4a702311d4c3',0),
	('80571a3a-9fd9-427d-97b0-bdbc07bf7e86','1031','期末考试20161031','2016-10-31 22:15:00','2016-10-31 22:55:00',40,'万德',2,'监考1','监考2','请问请问请问去','请问请问请问请问武器',0,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-31 22:13:54','2016-10-31 22:24:51','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0,'a7ab3064-c63a-4bcc-901f-4a702311d4c3',0),
	('98a8b0bb-13e5-483f-b8a3-cdd67509c7f5','KS2','考试2','2016-11-02 23:30:00','2016-11-03 23:30:00',1440,'二楼会议室',2,'监考员一','监考员二','监考员一','监考员一',0,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:31:39','2016-11-02 23:31:39','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,1,'a7ab3064-c63a-4bcc-901f-4a702311d4c3',0),
	('c98c4ae6-1c19-44d7-8bff-26f817708ad9','KS0023','应急预案考试','2016-11-09 09:55:00','2016-11-09 11:55:00',120,'二楼会议室',2,'监考员','监考员','监考员','监考员',0,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-09 09:42:52','2016-11-09 11:08:01','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0,'a7ab3064-c63a-4bcc-901f-4a702311d4c3',0);

/*!40000 ALTER TABLE `sys_exam` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_exam_answer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_exam_answer`;

CREATE TABLE `sys_exam_answer` (
  `id` varchar(64) NOT NULL COMMENT '唯一编码 : 唯一编码',
  `examinee_id` varchar(64) NOT NULL COMMENT '考生编码 : 唯一编码',
  `exam_id` varchar(64) NOT NULL COMMENT '考试编码 : 考试编码',
  `question_id` varchar(64) NOT NULL COMMENT '试题编码 : 唯一编码',
  `answerinfo` varchar(2000) NOT NULL COMMENT '答案内容',
  `answerscores` int(11) NOT NULL DEFAULT '0' COMMENT '答案分数',
  `judgetype` int(11) NOT NULL DEFAULT '0' COMMENT '判卷类型 : 0自动判卷\n1手动判卷',
  `judgepeopleid` varchar(64) DEFAULT NULL COMMENT '判卷人 : 判卷人',
  `judgepeoplename` varchar(128) DEFAULT NULL COMMENT '判卷人姓名',
  `judgetime` datetime NOT NULL COMMENT '判卷时间',
  `creator_id` varchar(64) DEFAULT NULL COMMENT '创建者 : 创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间 : 创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间 : 更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注信息 : 备注',
  `isenable` int(11) NOT NULL DEFAULT '0' COMMENT '是否启用 : 0未启用\n1已启用',
  `isdel` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 : 0已删除 1未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `exam_id` (`exam_id`),
  KEY `examinee_id` (`examinee_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `sys_exam_answer_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `sys_exam` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_exam_answer_ibfk_2` FOREIGN KEY (`examinee_id`) REFERENCES `sys_examinee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_exam_answer_ibfk_3` FOREIGN KEY (`question_id`) REFERENCES `sys_questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考生试卷答案表';

LOCK TABLES `sys_exam_answer` WRITE;
/*!40000 ALTER TABLE `sys_exam_answer` DISABLE KEYS */;

INSERT INTO `sys_exam_answer` (`id`, `examinee_id`, `exam_id`, `question_id`, `answerinfo`, `answerscores`, `judgetype`, `judgepeopleid`, `judgepeoplename`, `judgetime`, `creator_id`, `create_date`, `update_date`, `update_by`, `remark`, `isenable`, `isdel`)
VALUES
	('235f58e3-3d55-4595-a1d2-e405b79956e3','a3416194-d3c0-4d05-a9cf-b1b920fd5208','34d44059-2280-48cb-98dd-0d00cbb583b3','d3d674d9-dd49-4664-9d50-6e38e867dec0','A',0,1,'9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-11-02 16:38:49','8ff16130-6c01-425d-96ac-bf7e895f83f5','2016-11-02 16:31:20','2016-11-02 16:38:49','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('7ef1fe30-a039-4ea5-b190-fd526afaaa37','a3416194-d3c0-4d05-a9cf-b1b920fd5208','34d44059-2280-48cb-98dd-0d00cbb583b3','d56a3744-02c2-4426-95c6-4bdefdb3f095','0',2,1,'9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-11-02 16:38:49','8ff16130-6c01-425d-96ac-bf7e895f83f5','2016-11-02 16:31:16','2016-11-02 16:38:49','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('bcebcfd4-5a47-4dd6-a216-2d051a15afd6','a3416194-d3c0-4d05-a9cf-b1b920fd5208','34d44059-2280-48cb-98dd-0d00cbb583b3','fc45c3c1-8ea0-4ff2-b8fd-d96477761af2','A',0,1,'9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-11-02 16:38:49','8ff16130-6c01-425d-96ac-bf7e895f83f5','2016-11-02 16:31:23','2016-11-02 16:38:49','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0);

/*!40000 ALTER TABLE `sys_exam_answer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_examinee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_examinee`;

CREATE TABLE `sys_examinee` (
  `id` varchar(64) NOT NULL COMMENT '唯一编码 : 唯一编码',
  `exampapers_id` varchar(64) NOT NULL COMMENT '试卷编码 : 试卷编码',
  `exam_id` varchar(64) NOT NULL COMMENT '考试编码 : 考试编码',
  `user_id` varchar(64) NOT NULL COMMENT '用户编码',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '考生状态 : 0未开始考试\n1正在考试\n2完成考试\n3未参加考试\n4考试作弊',
  `fingerprint` varchar(2000) NOT NULL COMMENT '指纹编码',
  `ticketcode` varchar(1000) NOT NULL COMMENT '准考证编码 : 准考证编码',
  `seatno` int(11) NOT NULL COMMENT '座位号',
  `macaddress` varchar(128) NOT NULL COMMENT 'mac地址',
  `ipaddress` varchar(128) NOT NULL COMMENT 'ip地址',
  `totalscore` int(11) NOT NULL DEFAULT '0' COMMENT '总成绩',
  `scoreslevel` int(11) NOT NULL DEFAULT '0' COMMENT '成绩水平 : 0未合格\n1已合格\n2优秀',
  `creator_id` varchar(64) DEFAULT NULL COMMENT '创建者 : 创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间 : 创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间 : 更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注信息 : 备注',
  `isenable` int(11) NOT NULL DEFAULT '0' COMMENT '是否启用 : 0未启用\n1已启用',
  `isdel` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 : 0已删除 1未删除',
  `sculpturepath` varchar(100) NOT NULL DEFAULT '' COMMENT '头像地址',
  `examineename` varchar(100) NOT NULL DEFAULT '' COMMENT '考生姓名',
  `isfinishjudge` int(2) NOT NULL DEFAULT '0' COMMENT '是否判卷完成 0 未完成 1已完成',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `exam_id` (`exam_id`),
  KEY `exampapers_id` (`exampapers_id`),
  CONSTRAINT `sys_examinee_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `sys_exam` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_examinee_ibfk_2` FOREIGN KEY (`exampapers_id`) REFERENCES `sys_exampapers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考生表';

LOCK TABLES `sys_examinee` WRITE;
/*!40000 ALTER TABLE `sys_examinee` DISABLE KEYS */;

INSERT INTO `sys_examinee` (`id`, `exampapers_id`, `exam_id`, `user_id`, `status`, `fingerprint`, `ticketcode`, `seatno`, `macaddress`, `ipaddress`, `totalscore`, `scoreslevel`, `creator_id`, `create_date`, `update_date`, `update_by`, `remark`, `isenable`, `isdel`, `sculpturepath`, `examineename`, `isfinishjudge`)
VALUES
	('2f8192fe-e957-4ee8-9f06-4607f9ad6e16','a7ab3064-c63a-4bcc-901f-4a702311d4c3','5ecf4a4d-c606-4451-8003-c412e7e0a5c8','f56dac65-7d42-444e-97b6-4c4d7fefa295',0,'','',1,'','',0,0,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:42:19','2016-11-02 23:42:19','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0,'','李四',0),
	('7e27e3ea-2fde-4071-9f3e-44a123998a6d','a7ab3064-c63a-4bcc-901f-4a702311d4c3','c98c4ae6-1c19-44d7-8bff-26f817708ad9','8ff16130-6c01-425d-96ac-bf7e895f83f5',0,'','',1,'a8-bb-cf-07-ea-8e','',0,0,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-09 11:08:01','2016-11-09 11:08:01','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0,'','王世伦',0),
	('a3416194-d3c0-4d05-a9cf-b1b920fd5208','daae9711-b52a-4711-865f-1293219217b5','34d44059-2280-48cb-98dd-0d00cbb583b3','8ff16130-6c01-425d-96ac-bf7e895f83f5',2,'','Ek9029',1,'','',2,0,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-01-01 00:00:00','2016-11-02 16:38:49','9b70e448-58e7-4a46-ac83-c408d835643d','',1,0,'/ExamOnlineSys/userfiles/images/c05f42f9jw1eglmwqjwgjj2074074glo.jpg','王世伦',1),
	('a3d5d63d-e0f1-4204-afb2-62bef8ca279f','a7ab3064-c63a-4bcc-901f-4a702311d4c3','c98c4ae6-1c19-44d7-8bff-26f817708ad9','f56dac65-7d42-444e-97b6-4c4d7fefa295',0,'','',2,'10-dd-b1-e8-bb-0c','',0,0,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-09 11:08:01','2016-11-09 11:08:01','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0,'','李四',0),
	('e7bcdd59-e3eb-42ff-8f86-dc3dbf13a675','a7ab3064-c63a-4bcc-901f-4a702311d4c3','5ecf4a4d-c606-4451-8003-c412e7e0a5c8','8ff16130-6c01-425d-96ac-bf7e895f83f5',0,'','',2,'','',0,0,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:42:19','2016-11-02 23:42:19','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0,'','王世伦',0);

/*!40000 ALTER TABLE `sys_examinee` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_exampapers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_exampapers`;

CREATE TABLE `sys_exampapers` (
  `id` varchar(64) NOT NULL COMMENT '唯一编码 : 唯一编码',
  `code` varchar(128) NOT NULL COMMENT '试卷编码 : 试卷编码',
  `name` varchar(256) NOT NULL COMMENT '名称',
  `sumscore` int(11) NOT NULL DEFAULT '0' COMMENT '试卷总分',
  `usecount` int(11) NOT NULL DEFAULT '0' COMMENT '试卷使用次数',
  `sumquestion` int(11) NOT NULL DEFAULT '0' COMMENT '试卷总题数 : 试卷总题数',
  `creator_id` varchar(64) DEFAULT NULL COMMENT '创建者 : 创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间 : 创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间 : 更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注信息 : 备注',
  `isenable` int(11) NOT NULL DEFAULT '0' COMMENT '是否启用 : 0未启用\n1已启用',
  `isdel` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 : 0已删除 1未删除',
  `endfinish` int(2) NOT NULL DEFAULT '0' COMMENT '抽题是否完成：0未完成 1完成',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='试卷表';

LOCK TABLES `sys_exampapers` WRITE;
/*!40000 ALTER TABLE `sys_exampapers` DISABLE KEYS */;

INSERT INTO `sys_exampapers` (`id`, `code`, `name`, `sumscore`, `usecount`, `sumquestion`, `creator_id`, `create_date`, `update_date`, `update_by`, `remark`, `isenable`, `isdel`, `endfinish`)
VALUES
	('a7ab3064-c63a-4bcc-901f-4a702311d4c3','AQPX001','考试1',100,0,3,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-25 19:21:57','2016-11-02 23:15:59','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0,1),
	('daae9711-b52a-4711-865f-1293219217b5','sj0001','技术考试',100,1,20,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-01-01 00:00:00','2016-10-28 11:03:07','9b70e448-58e7-4a46-ac83-c408d835643d','',1,0,1);

/*!40000 ALTER TABLE `sys_exampapers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_exampapers_qtypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_exampapers_qtypes`;

CREATE TABLE `sys_exampapers_qtypes` (
  `id` varchar(64) NOT NULL COMMENT '唯一编码 : 唯一编码',
  `typename` varchar(128) NOT NULL COMMENT '类型名称',
  `sumtotal` int(11) NOT NULL DEFAULT '0' COMMENT '类型试题总数',
  `sumscores` int(11) NOT NULL COMMENT '类型试题总分数',
  `exampapers_id` varchar(64) NOT NULL COMMENT '试卷编码 : 试卷编码',
  `type_id` int(11) NOT NULL COMMENT '类型编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `exampapers_id` (`exampapers_id`),
  CONSTRAINT `sys_exampapers_qtypes_ibfk_1` FOREIGN KEY (`exampapers_id`) REFERENCES `sys_exampapers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='试卷题型表';

LOCK TABLES `sys_exampapers_qtypes` WRITE;
/*!40000 ALTER TABLE `sys_exampapers_qtypes` DISABLE KEYS */;

INSERT INTO `sys_exampapers_qtypes` (`id`, `typename`, `sumtotal`, `sumscores`, `exampapers_id`, `type_id`)
VALUES
	('0c62cf53-296d-4d4e-8eac-4070709dba37','判断题',1,20,'a7ab3064-c63a-4bcc-901f-4a702311d4c3',3),
	('404524f2-8810-43a6-8054-27058d427174','单选题',2,80,'a7ab3064-c63a-4bcc-901f-4a702311d4c3',1),
	('6ad37e5f-758d-4030-ab91-c0021961dad4','单选题',2,20,'daae9711-b52a-4711-865f-1293219217b5',1),
	('ca12bcc1-e779-491a-861c-cdd3752a1ac4','问答题',1,20,'daae9711-b52a-4711-865f-1293219217b5',4),
	('eb4fef72-7422-4906-a2d3-9aa148f9c5fd','判断题',1,20,'daae9711-b52a-4711-865f-1293219217b5',3);

/*!40000 ALTER TABLE `sys_exampapers_qtypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_exampapers_question
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_exampapers_question`;

CREATE TABLE `sys_exampapers_question` (
  `id` varchar(64) NOT NULL COMMENT '唯一编码 : 唯一编码',
  `exampapers_id` varchar(64) NOT NULL COMMENT '试卷编码 : 试卷编码',
  `question_id` varchar(64) NOT NULL COMMENT '试题编码 : 试题编码',
  `scores` int(11) NOT NULL DEFAULT '0' COMMENT '单题分数',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '试题排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `exampapers_id` (`exampapers_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `sys_exampapers_question_ibfk_1` FOREIGN KEY (`exampapers_id`) REFERENCES `sys_exampapers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_exampapers_question_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `sys_questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='试卷试题对照表';

LOCK TABLES `sys_exampapers_question` WRITE;
/*!40000 ALTER TABLE `sys_exampapers_question` DISABLE KEYS */;

INSERT INTO `sys_exampapers_question` (`id`, `exampapers_id`, `question_id`, `scores`, `sort`)
VALUES
	('045e194d-0fde-465e-8f80-0bcbf907296d','a7ab3064-c63a-4bcc-901f-4a702311d4c3','0632db29-9c93-4019-992e-a014c774fcc1',40,0),
	('1a0e3aaf-4bb6-45ad-872a-72ca3c86e0cd','a7ab3064-c63a-4bcc-901f-4a702311d4c3','fc45c3c1-8ea0-4ff2-b8fd-d96477761af2',40,2),
	('3e9e468c-aa89-478e-bec6-de323278037b','daae9711-b52a-4711-865f-1293219217b5','168f489a-4f6c-4bd2-a7b6-f3207d8ed111',20,4),
	('5280d09a-6e7e-4e8f-bcd2-0eadc9fcefcf','a7ab3064-c63a-4bcc-901f-4a702311d4c3','d3d674d9-dd49-4664-9d50-6e38e867dec0',40,1),
	('6e498116-6690-4272-b84b-37b06c0d5bd3','daae9711-b52a-4711-865f-1293219217b5','d56a3744-02c2-4426-95c6-4bdefdb3f095',20,5),
	('871b3b7f-6e6a-433a-a6ca-6f77857ef387','daae9711-b52a-4711-865f-1293219217b5','d3d674d9-dd49-4664-9d50-6e38e867dec0',10,2),
	('a0cafa5c-b931-44f2-9e4d-7178cc178f2d','a7ab3064-c63a-4bcc-901f-4a702311d4c3','d56a3744-02c2-4426-95c6-4bdefdb3f095',20,3),
	('dedcfdf1-a644-4fac-b5fb-bcbbf9ab6685','daae9711-b52a-4711-865f-1293219217b5','fc45c3c1-8ea0-4ff2-b8fd-d96477761af2',10,3);

/*!40000 ALTER TABLE `sys_exampapers_question` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_exercise
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_exercise`;

CREATE TABLE `sys_exercise` (
  `id` varchar(64) NOT NULL COMMENT '唯一编码 : 唯一编码',
  `user_id` varchar(64) NOT NULL COMMENT '用户编码 : 用户编码',
  `subject_id` varchar(64) NOT NULL COMMENT '科目编码',
  `itembank_id` varchar(64) NOT NULL COMMENT '题库编码',
  `sumcount` int(11) NOT NULL DEFAULT '0' COMMENT '练习总数',
  `alreadycount` int(11) NOT NULL DEFAULT '0' COMMENT '已完成总数 : 已完成总数',
  `name` varchar(256) NOT NULL COMMENT '名称',
  `creator_id` varchar(64) DEFAULT NULL COMMENT '创建者 : 创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间 : 创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间 : 更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注信息 : 备注',
  `isenable` int(11) NOT NULL DEFAULT '0' COMMENT '是否启用 : 0未启用\n1已启用',
  `isdel` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 : 0已删除 1未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sys_exercise_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='练习表 : 练习表';

LOCK TABLES `sys_exercise` WRITE;
/*!40000 ALTER TABLE `sys_exercise` DISABLE KEYS */;

INSERT INTO `sys_exercise` (`id`, `user_id`, `subject_id`, `itembank_id`, `sumcount`, `alreadycount`, `name`, `creator_id`, `create_date`, `update_date`, `update_by`, `remark`, `isenable`, `isdel`)
VALUES
	('07ee68cc-a63e-4daf-808f-2abbf2a0dba7','9b70e448-58e7-4a46-ac83-c408d835643d','ab579eaa-9f13-4f14-a885-fc7ecf4ba109','11441fa2-dd82-4cc0-8a21-342e773515d4',0,0,'来信','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-08 22:39:06','2016-11-08 22:39:49','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('cdf4898f-0078-4929-bd8a-7916388072e8','8ff16130-6c01-425d-96ac-bf7e895f83f5','cd84d06e-5b8c-47e9-8b44-c9c63e77e896','1cb3b61d-9851-40e9-8c88-799735c59dae',3,0,'练习1','8ff16130-6c01-425d-96ac-bf7e895f83f5','2016-11-02 15:12:58','2016-11-02 15:12:58','8ff16130-6c01-425d-96ac-bf7e895f83f5','11111',1,0);

/*!40000 ALTER TABLE `sys_exercise` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_exercise_question
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_exercise_question`;

CREATE TABLE `sys_exercise_question` (
  `id` varchar(64) NOT NULL COMMENT '唯一编码 : 唯一编码',
  `exercise_id` varchar(64) NOT NULL COMMENT '练习编码 : 练习编码',
  `question_id` varchar(64) NOT NULL COMMENT '试题编码 : 试题编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `exercise_id` (`exercise_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `sys_exercise_question_ibfk_1` FOREIGN KEY (`exercise_id`) REFERENCES `sys_exercise` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_exercise_question_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `sys_questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='练习试题对照表';



# Dump of table sys_folder
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_folder`;

CREATE TABLE `sys_folder` (
  `id` varchar(64) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `filepath` varchar(256) DEFAULT NULL,
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sys_itembank
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_itembank`;

CREATE TABLE `sys_itembank` (
  `id` varchar(64) NOT NULL COMMENT '唯一编码 : 唯一编码',
  `subject_id` varchar(64) NOT NULL COMMENT '科目编码 : 科目编码',
  `sumtotal` int(11) NOT NULL DEFAULT '0' COMMENT '总题数 : 总题数',
  `checknum` int(11) NOT NULL DEFAULT '0' COMMENT '选择次数 : 选择次数',
  `questiontype` int(11) NOT NULL DEFAULT '0' COMMENT '试题类型',
  `name` varchar(256) NOT NULL COMMENT '名称',
  `creator_id` varchar(64) DEFAULT NULL COMMENT '创建者 : 创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间 : 创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间 : 更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注信息 : 备注',
  `isenable` int(11) NOT NULL DEFAULT '0' COMMENT '是否启用 : 0未启用\n1已启用',
  `isdel` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 : 0已删除 1未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `sys_itembank_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `sys_subject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='题库表';

LOCK TABLES `sys_itembank` WRITE;
/*!40000 ALTER TABLE `sys_itembank` DISABLE KEYS */;

INSERT INTO `sys_itembank` (`id`, `subject_id`, `sumtotal`, `checknum`, `questiontype`, `name`, `creator_id`, `create_date`, `update_date`, `update_by`, `remark`, `isenable`, `isdel`)
VALUES
	('11441fa2-dd82-4cc0-8a21-342e773515d4','ab579eaa-9f13-4f14-a885-fc7ecf4ba109',0,0,2,'题库2','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-19 16:52:44','2016-10-19 16:52:44','9b70e448-58e7-4a46-ac83-c408d835643d','题库2',1,0),
	('1cb3b61d-9851-40e9-8c88-799735c59dae','ab579eaa-9f13-4f14-a885-fc7ecf4ba109',7,0,1,'题库1','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-18 16:54:48','2016-10-20 18:12:21','9b70e448-58e7-4a46-ac83-c408d835643d','题库1',1,0),
	('424705a8-0db5-4d7e-a505-7a654eabe9c5','ab579eaa-9f13-4f14-a885-fc7ecf4ba109',1,0,5,'题库5','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-19 16:53:34','2016-10-19 16:53:34','9b70e448-58e7-4a46-ac83-c408d835643d','题库5',1,0),
	('aae282ba-eafe-45b0-a2c6-ee321ef965f5','ab579eaa-9f13-4f14-a885-fc7ecf4ba109',1,0,4,'题库4','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-19 16:53:16','2016-10-19 16:53:16','9b70e448-58e7-4a46-ac83-c408d835643d','题库4',1,0),
	('afae0945-4b7d-42ad-aca8-34cfba41c9a4','ab579eaa-9f13-4f14-a885-fc7ecf4ba109',0,0,1,'题库7','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-27 09:29:55','2016-10-27 09:29:55','9b70e448-58e7-4a46-ac83-c408d835643d','题库7',1,0),
	('c5e83e76-08a8-427b-b2c7-85ef3ccf5d47','ab579eaa-9f13-4f14-a885-fc7ecf4ba109',1,0,3,'题库3','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-19 16:52:59','2016-10-19 16:52:59','9b70e448-58e7-4a46-ac83-c408d835643d','题库3',1,0),
	('fac9ad4c-e1e9-4ed2-a561-a56bf8973fad','cd84d06e-5b8c-47e9-8b44-c9c63e77e896',0,0,1,'题库8','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-08 23:52:19','2016-11-08 23:52:19','9b70e448-58e7-4a46-ac83-c408d835643d','题库8',1,0);

/*!40000 ALTER TABLE `sys_itembank` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(64) DEFAULT '1' COMMENT '日志类型（1:登录、2:登出...）数据字典存取',
  `title` varchar(500) DEFAULT NULL,
  `content` varchar(2000) NOT NULL,
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `operatorname` varchar(20) NOT NULL,
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;

INSERT INTO `sys_log` (`id`, `type`, `title`, `content`, `create_by`, `operatorname`, `create_date`)
VALUES
	('04a6b47c-cafe-42a3-9c2b-8a83099470e6','7','机构删除','陈钢在2016-10-12 09:28:35操作了机构删除功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-12 09:28:35'),
	('05192a11-7f80-469f-a611-e87080be930f','3','用户密码修改','陈钢在2016-10-01 21:51:25操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-01 21:51:25'),
	('0554c02e-5348-44bb-9bac-b298b4a2e9ee','7','用户删除','陈钢在2016-08-30 11:24:19操作了用户删除功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-08-30 11:24:19'),
	('063de5ca-1300-471c-a22c-c4962e4647a7','3','用户密码修改','陈钢在2016-10-01 22:19:52操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-01 22:19:52'),
	('06f4d8cc-866e-4f72-b68e-50c6f505afb7','3','用户密码修改','陈钢在2016-10-01 22:19:16操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-01 22:19:16'),
	('07ed59e4-36ea-471a-a26e-bc48f9a30bba','3','用户密码修改','陈钢在2016-10-01 21:50:48操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-01 21:50:48'),
	('127e732e-b49b-4066-9eb0-8c758586c4ab','3','用户密码修改','陈钢在2016-10-01 22:18:04操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-01 22:18:04'),
	('13fe65f7-2c0a-47c7-946f-64ce6664084b','7','用户删除','陈钢在2016-08-30 11:24:12操作了用户删除功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-08-30 11:24:12'),
	('1428b52c-feb1-46aa-a8bf-9e1b9fb09e27','3','用户密码修改','陈钢在2016-10-01 22:20:22操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-01 22:20:22'),
	('14dcb417-e12e-4b80-8c9f-41435e485ebc','6','角色修改','陈钢在2016-10-18 17:35:17操作了角色修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-18 17:35:17'),
	('1a66c9af-0b08-4768-bd44-37bbf09757cc','3','用户密码修改','陈钢在2016-10-02 16:33:44操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-02 16:33:44'),
	('1b17c07b-de06-49f0-893c-19e6a9372626','5','数据字典添加','管理员在2016-11-09 09:40:39操作了数据字典添加功能','9b70e448-58e7-4a46-ac83-c408d835643d','管理员','2016-11-09 09:40:39'),
	('25381bee-c2c2-466f-ba5f-fd0861ebdc63','1','用户登录','陈钢在2016-08-24 11:41:54操作了用户登录功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-08-24 11:41:54'),
	('2ad2d170-0007-42bd-9573-b5c2f3e05fe1','3','用户密码修改','陈钢在2016-10-01 22:07:29操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-01 22:07:29'),
	('2be7a86f-1190-4448-a660-4b5817fb6823','5','数据字典添加','陈钢在2016-10-19 16:51:14操作了数据字典添加功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-19 16:51:14'),
	('2d573747-7ef4-4a28-9871-6da452436193','3','用户密码修改','陈钢在2016-10-06 18:06:21操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-06 18:06:21'),
	('2df8b146-0f1f-48ec-a71f-eea096a6fda2','5','数据字典添加','管理员在2016-11-14 21:19:38操作了数据字典添加功能','9b70e448-58e7-4a46-ac83-c408d835643d','管理员','2016-11-14 21:19:38'),
	('2fdb8b51-c014-4749-9469-19b288dbc6fa','3','用户密码修改','陈钢在2016-10-12 09:41:50操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-12 09:41:50'),
	('323b9845-d0d7-4fe2-abf6-1647a0edd029','3','用户密码修改','陈钢在2016-10-01 22:16:17操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-01 22:16:17'),
	('3827ba84-8f57-4eaa-8f74-2a4acea6abc2','6','用户修改','李四在2016-11-14 22:31:25操作了用户修改功能','f56dac65-7d42-444e-97b6-4c4d7fefa295','李四','2016-11-14 22:31:25'),
	('480312e8-6a70-44b7-83c6-35fbb3aa46c8','1','用户登录','陈钢在2016-08-24 11:37:26操作了用户登录功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-08-24 11:37:26'),
	('4ad2d6d5-8359-429d-a303-428fb782bf6f','3','用户密码修改','陈钢在2016-10-01 22:19:43操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-01 22:19:43'),
	('4bb1f7e6-4a82-4f58-a44a-1a829499cf3f','3','用户密码修改','陈钢在2016-10-26 09:22:20操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-26 09:22:20'),
	('4bbe7515-64f7-4ef6-8296-4233bd5e2b8f','6','用户修改','管理员在2016-11-14 21:29:16操作了用户修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','管理员','2016-11-14 21:29:16'),
	('4db79704-5d64-407b-9110-4b3742b5f466','3','用户密码修改','陈钢在2016-10-01 22:18:22操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-01 22:18:22'),
	('4ec4b6e8-265f-4c47-9059-421b85dc2409','6','用户修改','李四在2016-11-14 22:29:16操作了用户修改功能','f56dac65-7d42-444e-97b6-4c4d7fefa295','李四','2016-11-14 22:29:16'),
	('53a4d852-c41b-4f03-88aa-5ae63e138271','5','数据字典添加','陈钢在2016-10-19 16:50:36操作了数据字典添加功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-19 16:50:36'),
	('53c7ce1b-69ea-4d12-905b-b05b8e7541c3','7','用户删除','陈钢在2016-08-30 11:24:28操作了用户删除功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-08-30 11:24:28'),
	('548fc777-de5c-4f51-b67a-c90a29f6ab98','7','用户删除','陈钢在2016-08-30 11:24:37操作了用户删除功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-08-30 11:24:37'),
	('5988707b-7911-4554-bfa4-c09c67f2a48e','5','数据字典添加','管理员在2016-11-14 21:19:01操作了数据字典添加功能','9b70e448-58e7-4a46-ac83-c408d835643d','管理员','2016-11-14 21:19:01'),
	('5c4620af-8d81-496d-84b5-e20bd7fd9c92','6','角色修改','陈钢在2016-10-12 09:40:44操作了角色修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-12 09:40:44'),
	('5cfe9e6a-5bac-4b32-8f44-2dee03b55e65','5','数据字典添加','管理员在2016-11-14 21:23:19操作了数据字典添加功能','9b70e448-58e7-4a46-ac83-c408d835643d','管理员','2016-11-14 21:23:19'),
	('5d0755c5-bf7c-46bd-9c19-6b4eb72a9618','6','数据字典修改','管理员在2016-11-14 21:20:27操作了数据字典修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','管理员','2016-11-14 21:20:27'),
	('6989eb23-e881-4f15-8f06-e38c38fa1f8a','3','用户密码修改','王世伦在2016-10-12 16:27:30操作了用户密码修改功能','8ff16130-6c01-425d-96ac-bf7e895f83f5','王世伦','2016-10-12 16:27:30'),
	('6b05bf6d-a646-4f8d-9bb1-3feec11ff238','5','数据字典添加','陈钢在2016-10-19 16:51:28操作了数据字典添加功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-19 16:51:28'),
	('6bc4b988-decf-4a59-b49d-39fa482e0982','3','用户密码修改','王世伦在2016-10-12 16:18:16操作了用户密码修改功能','8ff16130-6c01-425d-96ac-bf7e895f83f5','王世伦','2016-10-12 16:18:16'),
	('6d70b4b4-18fb-4062-a43b-324371dc774a','3','用户密码修改','陈钢在2016-10-01 21:56:56操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-01 21:56:56'),
	('6db8cc8d-f567-4273-bdd6-1ef7c87a9d22','7','用户删除','陈钢在2016-08-30 11:24:25操作了用户删除功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-08-30 11:24:25'),
	('6db961eb-edeb-4742-8c46-7a76f0135807','3','用户密码修改','陈钢在2016-10-12 09:40:07操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-12 09:40:07'),
	('708d5026-9c39-4bbb-8be9-2ff846034929','5','用户添加','陈钢在2016-11-02 23:14:08操作了用户添加功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-11-02 23:14:08'),
	('730e9071-b5e6-4a8d-b6dd-68e55939bffb','3','用户密码修改','陈钢在2016-10-02 17:02:49操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-02 17:02:49'),
	('7487d4e9-a26f-4c74-87c8-0fff6c296bc4','2','用户注销','陈钢在2016-08-24 11:17:58操作了用户注销功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-08-24 11:17:58'),
	('77f5cc40-7a88-410e-9168-ec2d32b2f293','6','用户修改','陈钢在2016-11-02 23:14:22操作了用户修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-11-02 23:14:22'),
	('7a8b446d-0fab-4faa-a521-aec6d8b8ad4f','3','用户密码修改','王世伦在2016-10-12 16:25:13操作了用户密码修改功能','8ff16130-6c01-425d-96ac-bf7e895f83f5','王世伦','2016-10-12 16:25:13'),
	('7b64f7be-a230-4e0d-a40c-5b97716aee9d','5','数据字典添加','管理员在2016-11-14 21:22:55操作了数据字典添加功能','9b70e448-58e7-4a46-ac83-c408d835643d','管理员','2016-11-14 21:22:55'),
	('7e10eb15-3edf-45b0-af1e-e633ff315924','6','地区修改','陈钢在2016-10-02 16:39:44操作了地区修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-02 16:39:44'),
	('7ea6ed43-e6f4-4d70-a562-f1f67ad6b84e','6','数据字典修改','陈钢在2016-10-19 16:48:51操作了数据字典修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-19 16:48:51'),
	('81de3064-2faa-4c61-8888-a1f54a3b2d31','7','角色删除','陈钢在2016-08-30 11:23:40操作了角色删除功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-08-30 11:23:40'),
	('832d8cf9-5a11-47c0-8bcd-d578c06cfb8b','5','角色添加','管理员在2016-11-09 09:35:55操作了角色添加功能','9b70e448-58e7-4a46-ac83-c408d835643d','管理员','2016-11-09 09:35:55'),
	('84c366f4-7428-4bf8-b30c-e78f45238898','3','用户密码修改','陈钢在2016-10-01 23:04:53操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-01 23:04:53'),
	('86628bff-5520-48e8-9f2f-551522c59d8b','3','用户密码修改','陈钢在2016-11-01 09:51:24操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-11-01 09:51:24'),
	('8668ae30-8043-4888-bf36-645f039239e8','1','用户登录','陈钢在2016-08-24 11:48:49操作了用户登录功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-08-24 11:48:49'),
	('8718a772-5d91-4e3d-b527-7acc10d11f24','7','用户删除','陈钢在2016-08-30 11:24:23操作了用户删除功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-08-30 11:24:23'),
	('8bf89d4a-c9d9-4886-be9a-85f58ff2a27f','3','用户密码修改','陈钢在2016-10-02 17:03:13操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-02 17:03:13'),
	('91f344e7-de5e-4011-a14d-c083c4050eec','3','用户密码修改','王世伦在2016-10-12 16:26:53操作了用户密码修改功能','8ff16130-6c01-425d-96ac-bf7e895f83f5','王世伦','2016-10-12 16:26:53'),
	('91f72670-c8d2-4caa-ba43-8d82c584555e','5','数据字典添加','管理员在2016-11-14 21:24:06操作了数据字典添加功能','9b70e448-58e7-4a46-ac83-c408d835643d','管理员','2016-11-14 21:24:06'),
	('9492d6b3-19ce-4652-bfbf-609e279d72db','3','用户密码修改','王世伦在2016-10-12 16:26:44操作了用户密码修改功能','8ff16130-6c01-425d-96ac-bf7e895f83f5','王世伦','2016-10-12 16:26:44'),
	('94d411d5-141c-4a62-9057-3deac40e9cc0','1','用户登录','陈钢在2016-08-24 11:08:58操作了用户登录功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-08-24 11:08:58'),
	('9589a6c5-c14d-4d29-8cf0-926d662da851','3','用户密码修改','陈钢在2016-10-31 00:21:47操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-31 00:21:47'),
	('979e911b-9f82-495a-a09f-bb1353f1e7c5','6','角色修改','陈钢在2016-10-13 17:16:34操作了角色修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-13 17:16:34'),
	('998b8453-8683-4267-8b12-a191d4db1f12','3','用户密码修改','王世伦在2016-10-12 16:26:53操作了用户密码修改功能','8ff16130-6c01-425d-96ac-bf7e895f83f5','王世伦','2016-10-12 16:26:53'),
	('9bc62691-eb4f-4d68-8540-3a6d4b7f7283','6','角色修改','陈钢在2016-10-01 22:15:54操作了角色修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-01 22:15:54'),
	('9dca05f3-793d-4424-988a-86d0bb234aea','2','用户注销','陈钢在2016-08-24 11:08:52操作了用户注销功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-08-24 11:08:52'),
	('9e2cb676-8761-44ba-b4b7-9da5abb39ebe','3','用户密码修改','陈钢在2016-10-01 22:18:13操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-01 22:18:13'),
	('a18ed5e8-a1b8-4558-83dc-b3e83c58374c','3','用户密码修改','陈钢在2016-10-01 21:52:04操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-01 21:52:04'),
	('a2021159-c292-400d-9b5e-cb98c8b3f79e','3','用户密码修改','陈钢在2016-10-01 22:17:27操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-01 22:17:27'),
	('a22d6820-be4c-4335-aff3-aa52c91661c4','5','机构添加','陈钢在2016-08-24 11:17:43操作了机构添加功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-08-24 11:17:43'),
	('a270e544-7641-484d-a62d-218009aa3387','6','角色修改','陈钢在2016-10-12 09:30:15操作了角色修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-12 09:30:15'),
	('a84150fd-8166-4764-a363-88c649bf8ac3','6','用户修改','管理员在2016-11-14 21:43:57操作了用户修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','管理员','2016-11-14 21:43:57'),
	('aa753fb9-5a42-4f3d-acd8-d3fce001b5a6','5','数据字典添加','管理员在2016-11-14 21:23:50操作了数据字典添加功能','9b70e448-58e7-4a46-ac83-c408d835643d','管理员','2016-11-14 21:23:50'),
	('ada1b792-0f3c-4799-a104-58e2903475a8','7','角色删除','陈钢在2016-08-30 11:23:42操作了角色删除功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-08-30 11:23:42'),
	('b04ddb84-ece5-451f-8ee6-dc46f071cf22','3','用户密码修改','陈钢在2016-10-01 22:19:15操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-01 22:19:15'),
	('b0a62b4f-a536-436b-b22e-7f66bd3b263e','7','用户删除','陈钢在2016-08-30 11:24:35操作了用户删除功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-08-30 11:24:35'),
	('b141be0b-adaf-4011-b399-4071531b199f','5','数据字典添加','管理员在2016-11-09 09:34:52操作了数据字典添加功能','9b70e448-58e7-4a46-ac83-c408d835643d','管理员','2016-11-09 09:34:52'),
	('b2845ef9-fcf6-430a-8acc-9e6a1e908e1d','6','数据字典修改','管理员在2016-11-09 09:40:00操作了数据字典修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','管理员','2016-11-09 09:40:00'),
	('b641db83-5d9b-4ad0-9e46-77f0dacd2387','3','用户密码修改','陈钢在2016-10-31 00:21:31操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-31 00:21:31'),
	('b78b62be-4ca8-49e8-b6f3-370429d968fd','3','用户密码修改','陈钢在2016-10-01 22:12:16操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-01 22:12:16'),
	('bd182e13-c321-4b24-8282-1693c34a4307','1','用户登录','陈钢在2016-08-24 11:40:22操作了用户登录功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-08-24 11:40:22'),
	('bd699800-26cc-42a3-8e1d-a38af841dfc9','7','用户删除','陈钢在2016-10-12 16:16:32操作了用户删除功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-12 16:16:32'),
	('be693dc9-7547-4c37-a271-569c3d048253','5','用户添加','陈钢在2016-10-09 17:52:05操作了用户添加功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-09 17:52:05'),
	('bfc4a242-33b1-451a-b499-5a75f065fa43','12','角色导出','陈钢在2016-10-02 16:33:55操作了角色导出功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-02 16:33:55'),
	('c1c5e4a4-2e53-4cb0-b46a-ce671ed58bd5','7','用户删除','陈钢在2016-08-30 11:24:31操作了用户删除功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-08-30 11:24:31'),
	('c3b358e0-fcd6-467b-8290-7aec48be4249','1','用户登录','陈钢在2016-08-24 11:18:05操作了用户登录功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-08-24 11:18:05'),
	('c9b08ebf-05ee-4021-b366-fd2ddacaa1ec','5','数据字典添加','陈钢在2016-10-19 16:51:59操作了数据字典添加功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-19 16:51:59'),
	('ca3ec0b5-9e5c-4d01-b4a8-e43305a2ee03','7','用户删除','陈钢在2016-08-30 11:24:33操作了用户删除功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-08-30 11:24:33'),
	('cae2e3b8-ea40-4c00-804f-2234008f42a2','5','数据字典添加','管理员在2016-11-14 21:19:19操作了数据字典添加功能','9b70e448-58e7-4a46-ac83-c408d835643d','管理员','2016-11-14 21:19:19'),
	('cb5115d8-0889-4fc7-92d4-c5b12aa0a945','6','角色修改','陈钢在2016-10-12 16:30:19操作了角色修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-12 16:30:19'),
	('ccb15fcf-261b-4674-8637-97218f39554d','6','角色修改','陈钢在2016-10-12 09:34:39操作了角色修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-12 09:34:39'),
	('cd228de9-83ac-476f-ae95-1b497494688a','3','用户密码修改','陈钢在2016-10-12 09:41:51操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-12 09:41:51'),
	('d033c597-91df-4cf9-a526-b00aab2634a2','6','角色修改','陈钢在2016-10-12 09:41:31操作了角色修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-12 09:41:31'),
	('d34290b4-1953-45e4-a862-befbafe29e51','5','数据字典添加','管理员在2016-11-14 21:20:13操作了数据字典添加功能','9b70e448-58e7-4a46-ac83-c408d835643d','管理员','2016-11-14 21:20:13'),
	('d3a4e90b-598c-4cb5-b42a-b9aeffa9d913','5','数据字典添加','管理员在2016-11-14 21:23:08操作了数据字典添加功能','9b70e448-58e7-4a46-ac83-c408d835643d','管理员','2016-11-14 21:23:08'),
	('d765ef8e-8d1a-4dc3-bebb-52115525fcfc','3','用户密码修改','王世伦在2016-10-12 16:27:30操作了用户密码修改功能','8ff16130-6c01-425d-96ac-bf7e895f83f5','王世伦','2016-10-12 16:27:30'),
	('d9baf2d0-f999-4913-8a9d-98401e8a8da9','7','用户删除','陈钢在2016-08-30 11:24:15操作了用户删除功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-08-30 11:24:15'),
	('dcfc7572-11a2-4f0d-ba70-b398fec9862c','5','数据字典添加','陈钢在2016-10-18 16:54:19操作了数据字典添加功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-18 16:54:19'),
	('e0444d4a-c049-4f12-8f77-5eae70069a01','3','用户密码修改','陈钢在2016-10-01 22:20:06操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-01 22:20:06'),
	('e1f6e309-7aeb-4221-9424-b938c87f4289','1','用户登录','陈钢在2016-08-24 11:29:30操作了用户登录功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-08-24 11:29:30'),
	('e89b5875-3b58-4df0-9598-ed1ce7fdf168','7','数据字典删除','陈钢在2016-08-30 11:31:12操作了数据字典删除功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-08-30 11:31:12'),
	('ea9f51c9-1dd9-4f57-ae55-cb997b161acf','3','用户密码修改','王世伦在2016-10-12 16:27:16操作了用户密码修改功能','8ff16130-6c01-425d-96ac-bf7e895f83f5','王世伦','2016-10-12 16:27:16'),
	('eb254f0f-4f7d-432a-a957-f672e7640568','5','数据字典添加','管理员在2016-11-14 21:17:44操作了数据字典添加功能','9b70e448-58e7-4a46-ac83-c408d835643d','管理员','2016-11-14 21:17:44'),
	('ed4961a5-5952-474d-ae8e-89555040b6cb','3','用户密码修改','陈钢在2016-10-01 21:43:53操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-01 21:43:53'),
	('eda93d53-6c74-4179-bece-123d747ac6be','3','用户密码修改','陈钢在2016-10-12 16:14:51操作了用户密码修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-12 16:14:51'),
	('f4229dd0-ad83-4452-9410-37b16209ee76','6','用户修改','陈钢在2016-10-09 17:50:38操作了用户修改功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-09 17:50:38'),
	('f835fbd4-75cb-4d89-b56d-874a8c5deef1','5','用户添加','陈钢在2016-10-12 16:17:44操作了用户添加功能','9b70e448-58e7-4a46-ac83-c408d835643d','陈钢','2016-10-12 16:17:44');

/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` double NOT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标（mainFrame、 _blank、_self、_parent、_top）',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示（1：显示；0：不显示）',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;

INSERT INTO `sys_menu` (`id`, `parent_id`, `parent_ids`, `name`, `sort`, `href`, `target`, `icon`, `is_show`, `permission`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`)
VALUES
	('2ce26f7d-2813-4ee0-8c6f-46ab66fcd34e','be58f3a0-6065-4086-8b5e-abf41a7151cd','be58f3a0-6065-4086-8b5e-abf41a7151cd','我的密码修改',1.2,'/user/addpass',NULL,NULL,'1','user:addpass','9b70e448-58e7-4a46-ac83-c408d835643d','0000-00-00 00:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 08:59:59',NULL,'0'),
	('3207af45-5511-4980-8aab-6b3d6dffb8b7','cbc3dd45-a212-4b74-af69-e1d157e6eb1d','cbc3dd45-a212-4b74-af69-e1d157e6eb1d|3207af45-5511-4980-8aab-6b3d6dffb8b7','参加考试',3.01,'/examinee/addJoinExam',NULL,NULL,'1','joinexam','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:02:39','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-01 09:44:59',NULL,'0'),
	('32fb3800-8354-4473-baf2-257747715db1','','','系统管理',10,'＃',NULL,NULL,'1','sys','9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-07 08:45:40','9b70e448-58e7-4a46-ac83-c408d835643d','2016-08-30 11:19:09',NULL,'0'),
	('32fb3800-8354-4473-baf2-25774771qwb1','32fb3800-8354-4473-baf2-257747715db1','32fb3800-8354-4473-baf2-257747715db1|','系统设置',10.5,'/dict/add',NULL,NULL,'1','dict:add','9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-07 11:28:36','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:23:02',NULL,'0'),
	('3d8295dc-93da-41bc-842b-594b780491ac','','','监控管理',5,'#',NULL,NULL,'1','monitoring','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:07:49','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:07:49',NULL,'0'),
	('4ac0c3cd-62e7-4a3e-a0e0-78b1f2e0bde3','32fb3800-8354-4473-baf2-257747715db1','','用户管理',10.4,'/user/add',NULL,NULL,'1','user:add','9b70e448-58e7-4a46-ac83-c408d835643d','0000-00-00 00:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-08-30 11:20:23',NULL,'0'),
	('57eb0ae0-6294-4642-bfee-a061b7410eef','','','我的练习',4,'#',NULL,NULL,'1','mypractise','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:05:13','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:05:13',NULL,'0'),
	('59a15d85-fe3a-4766-bd29-91a12976ca11','d7a4acfe-5687-4cf1-bc12-6def965b5eec','d7a4acfe-5687-4cf1-bc12-6def965b5eec|59a15d85-fe3a-4766-bd29-91a12976ca11','案例管理',7.04,'/case/add',NULL,NULL,'1','cases:add','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:20:30','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-18 16:47:43',NULL,'0'),
	('6664601d-6c49-4da5-8a07-e4be09735a91','86bf129a-ce2d-4dd1-82fd-51a9e9f4c1d5','86bf129a-ce2d-4dd1-82fd-51a9e9f4c1d5|6664601d-6c49-4da5-8a07-e4be09735a91','考试成绩按部门统计',8.02,'/statistics/dapartmentCount',NULL,NULL,'1','examscoresparts','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-13 17:13:07','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 15:28:43',NULL,'0'),
	('680eec23-f42f-4ef4-a7c1-640718ad92f4','8986d7fe-de73-4467-bb39-96d0422fac4b','8986d7fe-de73-4467-bb39-96d0422fac4b|680eec23-f42f-4ef4-a7c1-640718ad92f4','人工复评',6.02,'/achievement/add',NULL,NULL,'1','artificial','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:11:14','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-01 17:17:53',NULL,'0'),
	('6d6ce90b-1030-4e19-9a3e-85dddc63ce80','32fb3800-8354-4473-baf2-257747715db1','32fb3800-8354-4473-baf2-257747715db1|','角色管理',10.1,'/role/add',NULL,NULL,'1','role:add','9b70e448-58e7-4a46-ac83-c408d835643d','0000-00-00 00:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-08-30 11:19:29',NULL,'0'),
	('7fb63e8e-731c-4fa0-8fcb-4c86df5953d8','d7a4acfe-5687-4cf1-bc12-6def965b5eec','d7a4acfe-5687-4cf1-bc12-6def965b5eec|7fb63e8e-731c-4fa0-8fcb-4c86df5953d8','试题管理',7.03,'/questions/add',NULL,NULL,'1','questions:add','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:21:01','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-18 16:50:48',NULL,'0'),
	('86bf129a-ce2d-4dd1-82fd-51a9e9f4c1d5','','','统计分析',8,'#',NULL,NULL,'1','analysis','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-13 17:10:48','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-13 17:10:48',NULL,'0'),
	('8986d7fe-de73-4467-bb39-96d0422fac4b','','','考试管理',6,'#',NULL,NULL,'1','exammanage','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:09:30','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:09:30','考试管理','0'),
	('a1f56cee-bb70-49d5-a0d6-285e3a43d0f9','be58f3a0-6065-4086-8b5e-abf41a7151cd','f766bb48-1396-41e5-b137-fe24a2bf8d6b|a1f56cee-bb70-49d5-a0d6-285e3a43d0f9','邮件发送',1.31,'/file/addmailinfo',NULL,NULL,'1','file:addmailinfo','9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-06 18:11:38','9b70e448-58e7-4a46-ac83-c408d835643d','2016-08-30 11:19:00','邮件发送','0'),
	('aa3a660e-91df-446d-9d28-0a088072427a','86bf129a-ce2d-4dd1-82fd-51a9e9f4c1d5','86bf129a-ce2d-4dd1-82fd-51a9e9f4c1d5|aa3a660e-91df-446d-9d28-0a088072427a','考试成绩统计',8.01,'/statistics/examineeCount',NULL,NULL,'1','examscorestotal','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-13 17:12:26','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 15:29:06',NULL,'0'),
	('ad052487-d282-4c33-8fc4-783a86a1de46','cbc3dd45-a212-4b74-af69-e1d157e6eb1d','cbc3dd45-a212-4b74-af69-e1d157e6eb1d|ad052487-d282-4c33-8fc4-783a86a1de46','我的错题',3.03,'/errorsubject/adderror',NULL,NULL,'1','myerrorq','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:04:33','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 19:03:29',NULL,'0'),
	('ad09fe84-fa17-4d53-a3a3-a1cb12f0b2e0','8986d7fe-de73-4467-bb39-96d0422fac4b','8986d7fe-de73-4467-bb39-96d0422fac4b|ad09fe84-fa17-4d53-a3a3-a1cb12f0b2e0','试卷管理',6.03,'/exampapers/add',NULL,NULL,'1','papersmanage','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:18:05','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-25 17:19:45',NULL,'0'),
	('b0582881-0eed-4b7f-870b-594cdf87d1e3','57eb0ae0-6294-4642-bfee-a061b7410eef','57eb0ae0-6294-4642-bfee-a061b7410eef|b0582881-0eed-4b7f-870b-594cdf87d1e3','错题练习',4.02,'/errorsubject/errorpritics',NULL,NULL,'1','errorexercise','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:06:47','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:19',NULL,'0'),
	('badcdb66-9d0d-49c4-93bd-98d133db4513','32fb3800-8354-4473-baf2-257747715db1','32fb3800-8354-4473-baf2-257747715db1|','模块管理',10.3,'/menu/add',NULL,NULL,'1','menu:add','9b70e448-58e7-4a46-ac83-c408d835643d','0000-00-00 00:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:29:25',NULL,'0'),
	('be58f3a0-6065-4086-8b5e-abf41a7151cd','','','我的信息',1,'＃',NULL,NULL,'1','myface','9b70e448-58e7-4a46-ac83-c408d835643d','0000-00-00 00:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 08:59:06',NULL,'0'),
	('c2ed7881-76e3-44d4-ab1d-c3a942dc306a','32fb3800-8354-4473-baf2-257747715db1','32fb3800-8354-4473-baf2-257747715db1|','组织机构管理',10.6,'/office/add',NULL,NULL,'1','office:add','9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-07 11:28:36','9b70e448-58e7-4a46-ac83-c408d835643d','2016-08-30 11:20:40',NULL,'0'),
	('caa32364-c4fd-4b5a-9d46-4ee6dd28a66e','6d6ce90b-1030-4e19-9a3e-85dddc63ce80','32fb3800-8354-4473-baf2-257747715db1|6d6ce90b-1030-4e19-9a3e-85dddc63ce80|','角色添加',10.11,'/role/addroleinfo',NULL,NULL,'2','role:addroleinfo','9b70e448-58e7-4a46-ac83-c408d835643d','0000-00-00 00:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-02 17:22:51',NULL,'0'),
	('cbc3dd45-a212-4b74-af69-e1d157e6eb1d','','','我的考试',3,'#',NULL,NULL,'1','myexam','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:01:22','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:01:22',NULL,'0'),
	('ce645e4c-9b72-4f5c-aecd-dfeeaac0044c','86bf129a-ce2d-4dd1-82fd-51a9e9f4c1d5','86bf129a-ce2d-4dd1-82fd-51a9e9f4c1d5|ce645e4c-9b72-4f5c-aecd-dfeeaac0044c','试题错误率统计',8.04,'/statistics/errorrateCount',NULL,NULL,'1','questionerrortotal','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-13 17:15:37','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 15:29:42',NULL,'0'),
	('d6c0cb62-a443-4957-8f23-9867764ca595','86bf129a-ce2d-4dd1-82fd-51a9e9f4c1d5','','考试成绩按岗位统计',8.03,'/statistics/postCount',NULL,NULL,'1','examscoresposts','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-13 17:13:25','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 15:29:27',NULL,'0'),
	('d7a4acfe-5687-4cf1-bc12-6def965b5eec','','','资源管理',7,'#',NULL,NULL,'1','resource','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:19:16','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:19:16',NULL,'0'),
	('d9ed9269-ebac-4c6a-8853-6aad031242db','57eb0ae0-6294-4642-bfee-a061b7410eef','57eb0ae0-6294-4642-bfee-a061b7410eef|d9ed9269-ebac-4c6a-8853-6aad031242db','练习管理',4.01,'/exercise/addExercise',NULL,NULL,'1','exercisemanage','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:05:57','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-25 21:46:52',NULL,'0'),
	('dbc26b0f-f865-410a-9f31-181eb481dc21','32fb3800-8354-4473-baf2-257747715db1','32fb3800-8354-4473-baf2-257747715db1|','日志管理',10.6,'/log/add',NULL,NULL,'1','log:add','9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-30 17:58:27','9b70e448-58e7-4a46-ac83-c408d835643d','2016-08-30 11:28:55',NULL,'0'),
	('dd999ea4-7c50-465e-9cd6-8bb7a442982e','d7a4acfe-5687-4cf1-bc12-6def965b5eec','d7a4acfe-5687-4cf1-bc12-6def965b5eec|dd999ea4-7c50-465e-9cd6-8bb7a442982e','题库管理',7.02,'/item/add',NULL,NULL,'1','itembank:add','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:19:51','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-18 16:49:30',NULL,'0'),
	('e0b3d08c-8018-4075-856d-ddad933b25af','8986d7fe-de73-4467-bb39-96d0422fac4b','8986d7fe-de73-4467-bb39-96d0422fac4b|e0b3d08c-8018-4075-856d-ddad933b25af','考试安排',6.01,'/exam/addExam',NULL,NULL,'1','examarrangement','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:10:15','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-25 09:15:42',NULL,'0'),
	('e86c9f73-9a8d-4198-91f7-15ad27f79f22','86bf129a-ce2d-4dd1-82fd-51a9e9f4c1d5','86bf129a-ce2d-4dd1-82fd-51a9e9f4c1d5|e86c9f73-9a8d-4198-91f7-15ad27f79f22','考试统计',8.05,'/statistics/examCount',NULL,NULL,'1','examtotals','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-13 17:15:59','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 15:29:56',NULL,'0'),
	('e9ed4a79-0291-4ff9-8594-52bed769ac39','32fb3800-8354-4473-baf2-257747715db1','32fb3800-8354-4473-baf2-257747715db1|','地区管理',10.2,'/area/add',NULL,NULL,'1','area:add','9b70e448-58e7-4a46-ac83-c408d835643d','0000-00-00 00:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-08-30 11:19:56',NULL,'0'),
	('ebf5a648-6579-4b1b-b337-1e2e8f8f7a60','d7a4acfe-5687-4cf1-bc12-6def965b5eec','d7a4acfe-5687-4cf1-bc12-6def965b5eec|ebf5a648-6579-4b1b-b337-1e2e8f8f7a60','科目管理',7.01,'/subject/addsub',NULL,NULL,'1','itemmanage','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 16:29:22','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 16:29:22',NULL,'0'),
	('ee419286-9932-4c66-999d-fe35b1705651','3d8295dc-93da-41bc-842b-594b780491ac','3d8295dc-93da-41bc-842b-594b780491ac|ee419286-9932-4c66-999d-fe35b1705651','在线考试监控',5.01,'/invigilate/add',NULL,NULL,'1','monitoringonline','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:08:22','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-23 22:19:06',NULL,'0'),
	('f766bb48-1396-41e5-b137-fe24a2bf8d6b','be58f3a0-6065-4086-8b5e-abf41a7151cd','be58f3a0-6065-4086-8b5e-abf41a7151cd|f766bb48-1396-41e5-b137-fe24a2bf8d6b','文件管理',1.3,'/file/add',NULL,NULL,'1','file:add','9b70e448-58e7-4a46-ac83-c408d835643d','0000-00-00 00:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-08-30 11:18:45',NULL,'0'),
	('f9ce3125-1bf0-4dbb-9305-ea829ddf5a01','cbc3dd45-a212-4b74-af69-e1d157e6eb1d','cbc3dd45-a212-4b74-af69-e1d157e6eb1d|f9ce3125-1bf0-4dbb-9305-ea829ddf5a01','我的成绩',3.02,'/achievement/addExamRecordList',NULL,NULL,'1','myachievement','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:03:55','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 14:48:18',NULL,'0'),
	('fe2aa5d7-8563-4b28-8422-7b48050b558f','be58f3a0-6065-4086-8b5e-abf41a7151cd','be58f3a0-6065-4086-8b5e-abf41a7151cd|','个人基本信息',1.1,'/user/addInfo',NULL,NULL,'1','user:adding','9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-11 09:28:39','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 08:59:47',NULL,'0');

/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_office
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_office`;

CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` double NOT NULL COMMENT '排序',
  `area_id` varchar(64) NOT NULL COMMENT '归属区域',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) NOT NULL DEFAULT '' COMMENT '机构类型（1：机构；2：岗位；3：虚拟组）',
  `grade` char(1) NOT NULL COMMENT '机构等级（1：一级；2：二级；3：三级；4：四级）',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) DEFAULT NULL COMMENT '传真',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) DEFAULT NULL,
  `PRIMARY_PERSON` varchar(64) DEFAULT NULL,
  `DEPUTY_PERSON` varchar(64) DEFAULT NULL,
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `area_id` (`area_id`),
  CONSTRAINT `sys_office_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `sys_area` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

LOCK TABLES `sys_office` WRITE;
/*!40000 ALTER TABLE `sys_office` DISABLE KEYS */;

INSERT INTO `sys_office` (`id`, `parent_id`, `parent_ids`, `name`, `sort`, `area_id`, `code`, `type`, `grade`, `address`, `zip_code`, `master`, `phone`, `fax`, `email`, `USEABLE`, `PRIMARY_PERSON`, `DEPUTY_PERSON`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`)
VALUES
	('03ea5abf-3a1e-45db-af00-216a07e6404c','9324dac8-a51b-4f35-8d7c-4b7787db3d89','9324dac8-a51b-4f35-8d7c-4b7787db3d89','回民区',1.1,'a326f968-1277-41b8-9c6d-0a4e89723bda','11000','1','2','回民区',NULL,'123',NULL,NULL,NULL,'1',NULL,NULL,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-01 23:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-08-01 16:01:43',NULL,'0'),
	('07a54bac-a9d6-412b-a029-ca2f223efc3d','','|07a54bac-a9d6-412b-a029-ca2f223efc3d','日志',3,'b6088cbc-f620-4cc8-8695-8c82a2cbab84','111112rrr','1','0',NULL,NULL,'测试','111',NULL,NULL,NULL,NULL,NULL,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-25 10:14:04','9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-25 10:14:23',NULL,'1'),
	('13b64a68-3a9d-4949-9f98-e5240bef83a4','03ea5abf-3a1e-45db-af00-216a07e6404c','03ea5abf-3a1e-45db-af00-216a07e6404c|13b64a68-3a9d-4949-9f98-e5240bef83a4','调查组',1.14,'a326f968-1277-41b8-9c6d-0a4e89723bda','19099992','1','0',NULL,NULL,'1111',NULL,NULL,NULL,NULL,NULL,NULL,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-28 09:43:29','9b70e448-58e7-4a46-ac83-c408d835643d','2016-08-01 16:03:31',NULL,'1'),
	('195ec520-8cdb-4ffe-ad65-d404ce594296','','|195ec520-8cdb-4ffe-ad65-d404ce594296','包头',2,'a326f968-1277-41b8-9c6d-0a4e89723bda','10000','1','0',NULL,NULL,'王三平','15034942952',NULL,'15034942952@139.com',NULL,NULL,NULL,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-27 15:44:40','9b70e448-58e7-4a46-ac83-c408d835643d','2016-08-03 09:01:53','15034942952@139.com','0'),
	('22ab6d38-7fde-42a1-943a-13a820de3062','','9324dac8-a51b-4f35-8d7c-4b7787db3d89','回中',1.11,'a326f968-1277-41b8-9c6d-0a4e89723bda','11100','1','3','回中',NULL,'zxc',NULL,NULL,NULL,NULL,NULL,NULL,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-01 23:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-08-01 15:53:52',NULL,'0'),
	('256b1c80-348f-4eb3-95aa-7133bf0433ef','d8f671d2-ec1e-41b6-9af4-8687b3d09279','d8f671d2-ec1e-41b6-9af4-8687b3d09279|256b1c80-348f-4eb3-95aa-7133bf0433ef','测试',20.01,'d04cad96-216f-4592-990c-eef64725a939','111111','1','0',NULL,NULL,'得到',NULL,NULL,NULL,NULL,NULL,NULL,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-30 15:23:49','9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-30 15:23:49',NULL,'1'),
	('2867b872-5cb6-49f7-9873-72f029674152','','03ea5abf-3a1e-45db-af00-216a07e6404c|2867b872-5cb6-49f7-9873-72f029674152','32中',1.13,'a326f968-1277-41b8-9c6d-0a4e89723bda','32333','1','0',NULL,NULL,'1234',NULL,NULL,NULL,NULL,NULL,NULL,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-28 09:40:12','9b70e448-58e7-4a46-ac83-c408d835643d','2016-08-01 16:02:38',NULL,'1'),
	('2ded19c3-6bc1-4dc1-9f5d-5950d73a252b','9324dac8-a51b-4f35-8d7c-4b7787db3d89','9324dac8-a51b-4f35-8d7c-4b7787db3d89|2ded19c3-6bc1-4dc1-9f5d-5950d73a252b','赛罕区',1.4,'a326f968-1277-41b8-9c6d-0a4e89723bda','13400','1','0',NULL,NULL,'李逵','1890990909',NULL,'1890990909@189.com',NULL,NULL,NULL,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-27 16:18:37','9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-27 16:18:37','1890990909@189.com','1'),
	('2e8075a4-6441-41f4-9383-8d7826a1dc64','9324dac8-a51b-4f35-8d7c-4b7787db3d89','9324dac8-a51b-4f35-8d7c-4b7787db3d89','新城区',1.3,'a326f968-1277-41b8-9c6d-0a4e89723bda','13000','1','2','新城区',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-01 23:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-01 23:00:00',NULL,'1'),
	('33b4c27a-0110-4d5d-a1a9-ad8857548014','','9324dac8-a51b-4f35-8d7c-4b7787db3d89|33b4c27a-0110-4d5d-a1a9-ad8857548014','调查组',1.5,'a326f968-1277-41b8-9c6d-0a4e89723bda','1909999','1','0','调查组',NULL,'调查组','调查组',NULL,'调查组',NULL,NULL,NULL,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-28 09:31:55','9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-30 15:24:36','调查组','0'),
	('623c486d-589d-4686-a5e6-9dfc0b22d644','13b64a68-3a9d-4949-9f98-e5240bef83a4','13b64a68-3a9d-4949-9f98-e5240bef83a4|623c486d-589d-4686-a5e6-9dfc0b22d644','科长',1.141,'a326f968-1277-41b8-9c6d-0a4e89723bda','32333','3','0',NULL,NULL,'科长',NULL,NULL,NULL,NULL,NULL,NULL,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-28 09:49:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-28 09:48:34',NULL,'1'),
	('9324dac8-a51b-4f35-8d7c-4b7787db3d89','','','呼和浩特市',1,'a326f968-1277-41b8-9c6d-0a4e89723bda','10000','1','1','呼和浩特市',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-01 23:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-27 17:32:17',NULL,'0'),
	('d3a925b5-14bb-4c4d-add9-5dbbf2c2ba71','','|d3a925b5-14bb-4c4d-add9-5dbbf2c2ba71','1',4,'','11','1','0',NULL,NULL,'11',NULL,NULL,NULL,NULL,NULL,NULL,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-08-24 11:17:43','9b70e448-58e7-4a46-ac83-c408d835643d','2016-08-24 11:17:43',NULL,'1'),
	('dc71dd6e-1d51-40ff-8f49-cf12dec92304','2867b872-5cb6-49f7-9873-72f029674152','2867b872-5cb6-49f7-9873-72f029674152|dc71dd6e-1d51-40ff-8f49-cf12dec92304','产品部门',1.131,'a326f968-1277-41b8-9c6d-0a4e89723bda','9088','1','0',NULL,NULL,'产品部门',NULL,NULL,NULL,NULL,NULL,NULL,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-06 11:14:04','9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-06 11:14:04',NULL,'1'),
	('f43ae468-a3a5-4850-ab9c-f0d024a23996','9324dac8-a51b-4f35-8d7c-4b7787db3d89','9324dac8-a51b-4f35-8d7c-4b7787db3d89','玉泉区',1.2,'a326f968-1277-41b8-9c6d-0a4e89723bda','12000','1','2','玉泉区',NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-01 23:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-01 23:00:00',NULL,'1');

/*!40000 ALTER TABLE `sys_office` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_office_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_office_user`;

CREATE TABLE `sys_office_user` (
  `user_id` varchar(64) NOT NULL COMMENT '编号',
  `office_id` varchar(64) NOT NULL COMMENT '编号',
  PRIMARY KEY (`user_id`,`office_id`),
  KEY `office_id` (`office_id`),
  CONSTRAINT `sys_office_user_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `sys_office` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_office_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_office_user` WRITE;
/*!40000 ALTER TABLE `sys_office_user` DISABLE KEYS */;

INSERT INTO `sys_office_user` (`user_id`, `office_id`)
VALUES
	('8ff16130-6c01-425d-96ac-bf7e895f83f5','017fe8f5-97ec-40e3-ad75-6829336ad71a'),
	('8ff16130-6c01-425d-96ac-bf7e895f83f5','03ea5abf-3a1e-45db-af00-216a07e6404c'),
	('9b70e448-58e7-4a46-ac83-c408d835643d','017fe8f5-97ec-40e3-ad75-6829336ad71a'),
	('f56dac65-7d42-444e-97b6-4c4d7fefa295','017fe8f5-97ec-40e3-ad75-6829336ad71a'),
	('f56dac65-7d42-444e-97b6-4c4d7fefa295','03ea5abf-3a1e-45db-af00-216a07e6404c');

/*!40000 ALTER TABLE `sys_office_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_questionoptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_questionoptions`;

CREATE TABLE `sys_questionoptions` (
  `id` varchar(64) NOT NULL COMMENT '唯一编码 : 唯一编码',
  `questions_id` varchar(64) NOT NULL COMMENT '试题编码 : 试题编码',
  `code` varchar(2) NOT NULL COMMENT '选项编码 : 例如A B C D',
  `contant` varchar(2000) NOT NULL COMMENT '选项内容 : 选项内容',
  `creator_id` varchar(64) DEFAULT NULL COMMENT '创建者 : 创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间 : 创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间 : 更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注信息 : 备注',
  `isenable` int(11) NOT NULL DEFAULT '0' COMMENT '是否启用 : 0未启用\n1已启用',
  `isdel` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 : 0已删除 1未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `questions_id` (`questions_id`),
  CONSTRAINT `sys_questionoptions_ibfk_1` FOREIGN KEY (`questions_id`) REFERENCES `sys_questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='试题选项表';

LOCK TABLES `sys_questionoptions` WRITE;
/*!40000 ALTER TABLE `sys_questionoptions` DISABLE KEYS */;

INSERT INTO `sys_questionoptions` (`id`, `questions_id`, `code`, `contant`, `creator_id`, `create_date`, `update_date`, `update_by`, `remark`, `isenable`, `isdel`)
VALUES
	('03343d9e-13da-48a7-a6f5-476c050a3e49','0632db29-9c93-4019-992e-a014c774fcc1','A','A','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-08 23:20:53','2016-11-08 23:20:53','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('0a6beb83-e396-434d-ab11-e568fd6b754d','3ae418f2-9498-431d-a7f3-00e08dad7b39','D','被强制解除合同','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-13 22:15:24','2016-11-13 22:15:24','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('0cdff5c9-db9c-4317-ba74-1f7da510cd07','b2fa2049-6e5d-4d56-b805-a1768877c43a','B','只能在合同当事人之间发生','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-13 22:15:24','2016-11-13 22:15:24','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('29abab63-cd8b-43d3-9e8a-5a0c9cfcf03b','3ae418f2-9498-431d-a7f3-00e08dad7b39','C','赔偿损失','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-13 22:15:24','2016-11-13 22:15:24','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('2f52612e-55ba-486f-9d07-63182c639a7d','0632db29-9c93-4019-992e-a014c774fcc1','C','C','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-08 23:20:53','2016-11-08 23:20:53','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('31fe303f-71cc-4d6c-a8d2-1c603e637418','139639c8-5bad-4a10-8fad-1d7382d78bbb','B','必要要件和充分要件','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-13 22:15:24','2016-11-13 22:15:24','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('3823c096-ad0b-4f06-a874-45f78174ee71','b2fa2049-6e5d-4d56-b805-a1768877c43a','A','既包括合同订立阶段的缔约过失责任，也包括当事人没有履行合同义务的责任','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-13 22:15:24','2016-11-13 22:15:24','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('4cc0c9bd-82ae-4c2d-ab59-e209919de51a','139639c8-5bad-4a10-8fad-1d7382d78bbb','A','一般构成要件和特殊构成要件','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-13 22:15:24','2016-11-13 22:15:24','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('5036d0cf-7ad5-4de8-813b-8f6b03c2a6ae','ec531cea-412b-4373-9cc7-2390ee40cab6','D','直接责任','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-13 22:15:24','2016-11-13 22:15:24','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('536895dc-c2cc-40c0-8e2b-c69f16b11af7','3ae418f2-9498-431d-a7f3-00e08dad7b39','B','采取补救措施','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-13 22:15:24','2016-11-13 22:15:24','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('54882460-afcd-4134-8f26-f072b6c11f6d','fc45c3c1-8ea0-4ff2-b8fd-d96477761af2','B','违法行为','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-18 16:51:37','2016-10-18 16:51:37','9b70e448-58e7-4a46-ac83-c408d835643d','',1,0),
	('674a7c7e-2257-4d0c-88b9-5412987c6775','ec531cea-412b-4373-9cc7-2390ee40cab6','B','民事责任','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-13 22:15:24','2016-11-13 22:15:24','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('7c97ceaa-464b-485b-9b82-8e37bf6931ef','b2fa2049-6e5d-4d56-b805-a1768877c43a','D','只能由法律规定，不能由当事人约定','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-13 22:15:24','2016-11-13 22:15:24','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('81ed3103-6ec1-4472-9ad4-a861ea890372','d3d674d9-dd49-4664-9d50-6e38e867dec0','D','dddddddddd','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-20 18:13:02','2016-10-20 18:13:02','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('83689182-39c9-41b0-aa35-acbc0db5898e','fc45c3c1-8ea0-4ff2-b8fd-d96477761af2','A','违章行为','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-18 16:51:37','2016-10-18 16:51:37','9b70e448-58e7-4a46-ac83-c408d835643d','',1,0),
	('83b696a3-5194-4fd4-a232-44af1b69b0f1','d3d674d9-dd49-4664-9d50-6e38e867dec0','C','ccccccccccc','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-20 18:13:02','2016-10-20 18:13:02','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('9128da9d-5522-48e8-b9ce-cc6f0a531894','0632db29-9c93-4019-992e-a014c774fcc1','B','B','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-08 23:20:53','2016-11-08 23:20:53','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('94c9e094-3374-4dff-bf0e-1cb768ab94fe','139639c8-5bad-4a10-8fad-1d7382d78bbb','C','普通要件和特殊要件','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-13 22:15:24','2016-11-13 22:15:24','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('a5336ff5-3c5b-4d01-9139-8b42c7bffc05','fc45c3c1-8ea0-4ff2-b8fd-d96477761af2','D','违规行为','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-18 16:51:37','2016-10-18 16:51:37','9b70e448-58e7-4a46-ac83-c408d835643d','',1,0),
	('a9e052a8-18fd-4aba-86c6-2dd7c318c5a5','d3d674d9-dd49-4664-9d50-6e38e867dec0','A','aaaaaaaaaa','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-20 18:13:02','2016-10-20 18:13:02','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('acf86ae1-9d99-4a00-883f-2dd18da3a741','ec531cea-412b-4373-9cc7-2390ee40cab6','C','经济责任','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-13 22:15:24','2016-11-13 22:15:24','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('c35bce4b-a835-4055-99cb-30d49249a10a','d3d674d9-dd49-4664-9d50-6e38e867dec0','B','bbbbbbbbbb','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-20 18:13:02','2016-10-20 18:13:02','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('c767deb9-5249-430a-a9ff-f85512674759','fc45c3c1-8ea0-4ff2-b8fd-d96477761af2','C','过失行为','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-18 16:51:37','2016-10-18 16:51:37','9b70e448-58e7-4a46-ac83-c408d835643d','',1,0),
	('cd9c50b5-058b-4321-a297-b85d6fa6f14f','b2fa2049-6e5d-4d56-b805-a1768877c43a','C','以制裁性为其基本目的','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-13 22:15:24','2016-11-13 22:15:24','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('d49df996-443b-4c67-a09b-ed7979772f9c','139639c8-5bad-4a10-8fad-1d7382d78bbb','D','共同要件和个别要件','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-13 22:15:24','2016-11-13 22:15:24','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('ed26f4a4-28ed-4847-bad4-b14f8b255bf3','3ae418f2-9498-431d-a7f3-00e08dad7b39','A','继续履行','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-13 22:15:24','2016-11-13 22:15:24','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('f05b63f7-ec30-4060-be46-e5dc29e070a8','ec531cea-412b-4373-9cc7-2390ee40cab6','A','刑事责任','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-13 22:15:24','2016-11-13 22:15:24','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0);

/*!40000 ALTER TABLE `sys_questionoptions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_questions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_questions`;

CREATE TABLE `sys_questions` (
  `id` varchar(64) NOT NULL COMMENT '唯一编码 : 唯一编码',
  `subject_id` varchar(64) NOT NULL DEFAULT '' COMMENT '科目编码',
  `itembank_id` varchar(64) NOT NULL COMMENT '题库编码 : 唯一编码',
  `code` varchar(64) NOT NULL COMMENT '试题编码',
  `name` varchar(256) DEFAULT '' COMMENT '名称',
  `title` varchar(4000) NOT NULL COMMENT '试题标题 : 试题标题',
  `info` varchar(2000) DEFAULT NULL COMMENT '试题描述',
  `questiontype` int(11) NOT NULL DEFAULT '0' COMMENT '试题类型 : 0单选、1多选、2判断、3问答、4填空、5阅读理解、6打字题、7组合\n',
  `questionanswer` varchar(2000) NOT NULL COMMENT '试题答案',
  `questionanswerinfo` varchar(2000) DEFAULT NULL COMMENT '试题解答',
  `creator_id` varchar(64) DEFAULT NULL COMMENT '创建者 : 创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间 : 创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间 : 更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注信息 : 备注',
  `isenable` int(11) NOT NULL DEFAULT '0' COMMENT '是否启用 : 0未启用\n1已启用',
  `isdel` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 : 0已删除 1未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `itembank_id` (`itembank_id`),
  CONSTRAINT `sys_questions_ibfk_1` FOREIGN KEY (`itembank_id`) REFERENCES `sys_itembank` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='试题表题头表';

LOCK TABLES `sys_questions` WRITE;
/*!40000 ALTER TABLE `sys_questions` DISABLE KEYS */;

INSERT INTO `sys_questions` (`id`, `subject_id`, `itembank_id`, `code`, `name`, `title`, `info`, `questiontype`, `questionanswer`, `questionanswerinfo`, `creator_id`, `create_date`, `update_date`, `update_by`, `remark`, `isenable`, `isdel`)
VALUES
	('0632db29-9c93-4019-992e-a014c774fcc1','ab579eaa-9f13-4f14-a885-fc7ecf4ba109','afae0945-4b7d-42ad-aca8-34cfba41c9a4','填空题','填空题','<p>填空题填空题填空题填空题填空题填空题________填空题填空题填空题填空题________填空题填空题填空题_______填空题填空题填空题填空题</p>\r\n','填空题填空题填空题填空题填空题',1,'A','填空题填空题填空题填空题填空题填空题','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-21 09:38:05','2016-11-08 23:20:53','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('139639c8-5bad-4a10-8fad-1d7382d78bbb','ab579eaa-9f13-4f14-a885-fc7ecf4ba109','1cb3b61d-9851-40e9-8c88-799735c59dae','DAX-1479046524335-4010','','违约责任的构成要件可以分为（　　）','选择题',1,'A','以下哪些属于违约责任的构成要件（　　）','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-13 22:15:24','2016-11-13 22:15:24','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('168f489a-4f6c-4bd2-a7b6-f3207d8ed111','ab579eaa-9f13-4f14-a885-fc7ecf4ba109','aae282ba-eafe-45b0-a2c6-ee321ef965f5','问答题','问答题','<p>问答题问答题问答题问答题问答题问答题</p>','问答题问答题问答题问答题',4,'问答题问答题问答题问答题','问答题问答题问答题问答题','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-21 09:37:03','2016-10-21 09:37:03','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('36cccfe4-2fcc-495e-a631-0a828e386e97','ab579eaa-9f13-4f14-a885-fc7ecf4ba109','1cb3b61d-9851-40e9-8c88-799735c59dae','6666666666','6666666666','<p>6666666666</p><p><img alt=\"\" src=\"/ExamOnlineSys/userfiles/images/c05f42f9jw1eglmwqjwgjj2074074glo.jpg\" style=\"height:256px; width:256px\" /></p>','6666666666',1,'A','6666666666','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-20 17:04:13','2016-10-20 17:18:59','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('3ae418f2-9498-431d-a7f3-00e08dad7b39','ab579eaa-9f13-4f14-a885-fc7ecf4ba109','1cb3b61d-9851-40e9-8c88-799735c59dae','DAX-1479046524318-1695','','当事人一方不履行合同义务或者履行合同义务不符合约定的，应当承担（　　）等违约责任。','选择题',1,'B','当事人一方不履行合同义务或者履行合同义务不符合约定的，应当承担（　　）等违约责任。','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-13 22:15:24','2016-11-13 22:15:24','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('b2fa2049-6e5d-4d56-b805-a1768877c43a','ab579eaa-9f13-4f14-a885-fc7ecf4ba109','1cb3b61d-9851-40e9-8c88-799735c59dae','DAX-1479046524300-7467','','违约责任具有的特点是（　　）','选择题',1,'B','既包括合同订立阶段的缔约过失责任，也包括当事人没有履行合同义务的责任','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-13 22:15:24','2016-11-13 22:15:24','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('d3d674d9-dd49-4664-9d50-6e38e867dec0','ab579eaa-9f13-4f14-a885-fc7ecf4ba109','1cb3b61d-9851-40e9-8c88-799735c59dae','222222','222222','<p><img alt=\"\" src=\"/ExamOnlineSys/userfiles/images/c05f42f9jw1eglmwqjwgjj2074074glo.jpg\" style=\"height:256px; width:256px\" />我是谁</p>\r\n','c',1,'C','C','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-20 17:22:49','2016-10-20 18:13:02','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('d56a3744-02c2-4426-95c6-4bdefdb3f095','ab579eaa-9f13-4f14-a885-fc7ecf4ba109','c5e83e76-08a8-427b-b2c7-85ef3ccf5d47','判断题','判断题','<p>判断题判断题判断题判断题判断题</p>','判断题判断题判断题判断题',3,'0','判断题判断题判断题判断题判断题','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-21 09:32:41','2016-10-21 09:32:41','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('ec531cea-412b-4373-9cc7-2390ee40cab6','ab579eaa-9f13-4f14-a885-fc7ecf4ba109','1cb3b61d-9851-40e9-8c88-799735c59dae','DAX-1479046524254-7257','','机动车驾驶人违法驾驶造成重大交通事故构成犯罪的，依法追究什么责任？','选择题',1,'A','《道路交通安全法》第一百零一条：违反道路交通安全法律、法规的规定，发生重大交通事故，构成犯罪的，依法追究刑事责任，并由公安机关交通管理部门吊销机动车驾驶证。','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-13 22:15:24','2016-11-13 22:15:24','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('fc45c3c1-8ea0-4ff2-b8fd-d96477761af2','ab579eaa-9f13-4f14-a885-fc7ecf4ba109','1cb3b61d-9851-40e9-8c88-799735c59dae','dx0001','','驾驶机动车在道路上违反道路交通安全法的行为，属于什么行为？','驾驶机动车在道路上违反道路交通安全法的行为，属于什么行为？',1,'B','“违反道路交通安全法”，违反法律法规即为违法行为。官方已无违章/违规的说法。','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-18 16:54:48','2016-10-18 16:54:48','9b70e448-58e7-4a46-ac83-c408d835643d','',1,0);

/*!40000 ALTER TABLE `sys_questions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_right
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_right`;

CREATE TABLE `sys_right` (
  `id` varchar(64) NOT NULL,
  `resourcesid` varchar(64) DEFAULT NULL,
  `resourcestype` int(11) DEFAULT '0' COMMENT '1.菜单 2表视图功能 3 文件夹',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  `resourcesname` varchar(100) NOT NULL DEFAULT '',
  `permission` varchar(64) DEFAULT NULL COMMENT '权限标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单 sys_role_menu_file';

LOCK TABLES `sys_right` WRITE;
/*!40000 ALTER TABLE `sys_right` DISABLE KEYS */;

INSERT INTO `sys_right` (`id`, `resourcesid`, `resourcestype`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`, `resourcesname`, `permission`)
VALUES
	('0175a43c-9e91-4cd8-83cc-d1d0200f317b','caa32364-c4fd-4b5a-9d46-4ee6dd28a66e',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-01-01 00:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22','','0','角色添加','role:addroleinfo'),
	('051d4712-1e31-4c6b-97b9-10e4121390d7','86bf129a-ce2d-4dd1-82fd-51a9e9f4c1d5',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-13 17:16:05','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','统计分析','analysis'),
	('082310c7-d307-4159-af1c-232048e4b3d9','ebf5a648-6579-4b1b-b337-1e2e8f8f7a60',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 16:29:55','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','科目管理','itemmanage'),
	('096aa185-3780-450e-ac89-14ad8fa372f3','e86c9f73-9a8d-4198-91f7-15ad27f79f22',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-13 17:16:05','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','考试统计','examtotals'),
	('0b19e2b7-612a-4337-b0cd-a5d990cdb61a','d9ed9269-ebac-4c6a-8853-6aad031242db',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:29:33','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','练习管理','exercisemanage'),
	('0f17f755-310e-484c-b11d-36d77605be4a','cbc3dd45-a212-4b74-af69-e1d157e6eb1d',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:29:33','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','我的考试','myexam'),
	('1d7eeac1-78cb-428b-8d7a-1f8f4f16837a','6d6ce90b-1030-4e19-9a3e-85dddc63ce80',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-01-01 00:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22','','0','角色管理','role:add'),
	('1feeed6b-70b4-493b-9d30-a4a526feb137','6664601d-6c49-4da5-8a07-e4be09735a91',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-13 17:16:05','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','考试成绩按部门统计','examscoresparts'),
	('20e2f1f9-6635-4701-a7fb-228c97e40832','a1f56cee-bb70-49d5-a0d6-285e3a43d0f9',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-07-06 18:11:43','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','邮件发送','file:addmailinfo'),
	('39760dc4-14ab-4209-bb84-fb3a5e08d3b3','59a15d85-fe3a-4766-bd29-91a12976ca11',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:29:33','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','案例管理','cases:add'),
	('53795ce3-44bb-4722-8c2f-ab8744077cec','f9ce3125-1bf0-4dbb-9305-ea829ddf5a01',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:29:33','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','我的成绩','myachievement'),
	('56d2cdfc-63fe-411b-aedd-c92c08348dc2','c2ed7881-76e3-44d4-ab1d-c3a942dc306a',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-01-01 00:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22','','0','组织机构管理','office:add'),
	('5d89d027-5a43-43dc-81d2-55582a2b49ee','e0b3d08c-8018-4075-856d-ddad933b25af',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:29:33','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','考试安排','examarrangement'),
	('69b8f436-ac77-414f-8210-1e4a9277cb85','e9ed4a79-0291-4ff9-8594-52bed769ac39',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-01-01 00:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22','','0','地区管理','area:add'),
	('6b05dd7a-8fcd-447e-abcd-a1c6befe1e58','3d8295dc-93da-41bc-842b-594b780491ac',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:29:33','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','监控管理','monitoring'),
	('6c9229a5-5b48-4da7-9bf1-f33284ceba24','7fb63e8e-731c-4fa0-8fcb-4c86df5953d8',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:29:33','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','试题管理','questions:add'),
	('6e0e9028-4e38-40d1-8c5b-1e7a76fd3945','4ac0c3cd-62e7-4a3e-a0e0-78b1f2e0bde3',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-01-01 00:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22','','0','用户管理','user:add'),
	('73b5075c-3316-4b47-b50b-e42f819e308c','ee419286-9932-4c66-999d-fe35b1705651',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:29:33','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','在线考试监控','monitoringonline'),
	('74a47279-afcb-4901-bde6-5eb3ef1b8c20','ce645e4c-9b72-4f5c-aecd-dfeeaac0044c',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-13 17:16:05','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','试题错误率统计','questionerrortotal'),
	('7c968cf8-4609-478a-abbe-2266c8cc2761','d6c0cb62-a443-4957-8f23-9867764ca595',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-13 17:16:05','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','考试成绩按岗位统计','examscoresposts'),
	('7f97db56-50c7-485f-a75c-330eb0cd125f','8986d7fe-de73-4467-bb39-96d0422fac4b',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:29:33','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','考试管理','exammanage'),
	('80be0a73-b56e-47b4-90da-1fe11dffe58f','fe2aa5d7-8563-4b28-8422-7b48050b558f',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-01-01 00:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22','','0','个人基本信息','user:adding'),
	('80ca1ae9-b020-4314-a5bd-631ad5ef683e','32fb3800-8354-4473-baf2-25774771qwb1',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-01-01 00:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22','','0','系统设置','dict:add'),
	('906f64bf-8897-4f6a-b2cd-92a222bf3d63','ad09fe84-fa17-4d53-a3a3-a1cb12f0b2e0',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:29:33','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','试卷管理','papersmanage'),
	('9afeb7c9-85e6-4830-88e0-8236c126e1f1','dd999ea4-7c50-465e-9cd6-8bb7a442982e',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:29:33','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','题库管理','itembank:add'),
	('a7d309a4-421f-4df1-88b9-3a171bced3b7','57eb0ae0-6294-4642-bfee-a061b7410eef',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:29:33','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','我的练习','mypractise'),
	('ad7c3833-f900-4751-ac2b-38df9119e465','be58f3a0-6065-4086-8b5e-abf41a7151cd',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-01-01 00:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22','','0','我的信息','myface'),
	('bae5dab5-153a-4dfb-93a2-80c830e088c8','2ce26f7d-2813-4ee0-8c6f-46ab66fcd34e',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-01-01 00:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22','','0','我的密码修改','user:addpass'),
	('be22d3b6-ecb9-4ad4-bdab-a419206d020a','f766bb48-1396-41e5-b137-fe24a2bf8d6b',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-01-01 00:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','文件管理','file:add'),
	('c20145e5-39cb-469f-bb9f-0d1c499fcf1f','32fb3800-8354-4473-baf2-257747715db1',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-01-01 00:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22','','0','系统管理','sys'),
	('cfa9415c-5adc-403d-8f6c-6e1153e8d2d7','b0582881-0eed-4b7f-870b-594cdf87d1e3',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:29:33','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','错题练习','errorexercise'),
	('d5d6e48b-1637-48fe-82d5-c32e48c66285','680eec23-f42f-4ef4-a7c1-640718ad92f4',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:29:33','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','人工复评','artificial'),
	('d79b1179-265d-4f24-b50a-854b5f67902c','badcdb66-9d0d-49c4-93bd-98d133db4513',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-01-01 00:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22','','0','模块管理','menu:add'),
	('d8ea49bc-5111-4f67-a468-d663871d8a03','d7a4acfe-5687-4cf1-bc12-6def965b5eec',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:29:33','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','资源管理','resource'),
	('ebfa1e07-4cb9-4e92-9ce7-1453f4223163','dbc26b0f-f865-410a-9f31-181eb481dc21',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-30 18:00:26','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','日志管理','log:add'),
	('ee5c0f59-eefa-4dd6-9665-47d9af5e07bf','3207af45-5511-4980-8aab-6b3d6dffb8b7',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:29:33','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','参加考试','joinexam'),
	('fb5c7d66-6284-489a-b631-1312d39273a1','aa3a660e-91df-446d-9d28-0a088072427a',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-13 17:16:05','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','考试成绩统计','examscorestotal'),
	('feb0893f-d2e3-4e65-b976-c3a402ac5988','ad052487-d282-4c33-8fc4-783a86a1de46',1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 09:29:33','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:02:22',NULL,'0','我的错题','myerrorq');

/*!40000 ALTER TABLE `sys_right` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围（0：所有数据；1：所在公司及以下数据；2：所在公司数据；3：所在部门及以下数据；4：所在部门数据；8：仅本人数据；9：按明细设置）',
  `is_sys` varchar(64) DEFAULT NULL,
  `useable` varchar(64) DEFAULT NULL,
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;

INSERT INTO `sys_role` (`id`, `office_id`, `name`, `enname`, `role_type`, `data_scope`, `is_sys`, `useable`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`)
VALUES
	('017fe8f5-97ec-40e3-ad75-6829336ad71a',NULL,'管理员','','11','1','0','1','9b70e448-58e7-4a46-ac83-c408d835643d','2016-06-20 18:14:04','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-18 17:35:17','管理员','0'),
	('4d37644b-2deb-415d-ba3e-6b340dd4e8f2',NULL,'mac','','11','1','0','1','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-09 09:35:55','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-09 09:35:55',NULL,'0');

/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role_office
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role_office`;

CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`),
  KEY `office_id` (`office_id`),
  CONSTRAINT `sys_role_office_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `sys_office` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_role_office_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-机构';



# Dump of table sys_role_right
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role_right`;

CREATE TABLE `sys_role_right` (
  `role_id` varchar(64) NOT NULL COMMENT '编号',
  `right_id` varchar(64) NOT NULL,
  PRIMARY KEY (`role_id`,`right_id`),
  KEY `right_id` (`right_id`),
  CONSTRAINT `sys_role_right_ibfk_1` FOREIGN KEY (`right_id`) REFERENCES `sys_right` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_role_right_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_role_right` WRITE;
/*!40000 ALTER TABLE `sys_role_right` DISABLE KEYS */;

INSERT INTO `sys_role_right` (`role_id`, `right_id`)
VALUES
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','0175a43c-9e91-4cd8-83cc-d1d0200f317b'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','051d4712-1e31-4c6b-97b9-10e4121390d7'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','082310c7-d307-4159-af1c-232048e4b3d9'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','096aa185-3780-450e-ac89-14ad8fa372f3'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','0b19e2b7-612a-4337-b0cd-a5d990cdb61a'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','0f17f755-310e-484c-b11d-36d77605be4a'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','1d7eeac1-78cb-428b-8d7a-1f8f4f16837a'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','1feeed6b-70b4-493b-9d30-a4a526feb137'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','39760dc4-14ab-4209-bb84-fb3a5e08d3b3'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','53795ce3-44bb-4722-8c2f-ab8744077cec'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','56d2cdfc-63fe-411b-aedd-c92c08348dc2'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','5d89d027-5a43-43dc-81d2-55582a2b49ee'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','69b8f436-ac77-414f-8210-1e4a9277cb85'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','6b05dd7a-8fcd-447e-abcd-a1c6befe1e58'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','6c9229a5-5b48-4da7-9bf1-f33284ceba24'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','6e0e9028-4e38-40d1-8c5b-1e7a76fd3945'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','73b5075c-3316-4b47-b50b-e42f819e308c'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','74a47279-afcb-4901-bde6-5eb3ef1b8c20'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','7c968cf8-4609-478a-abbe-2266c8cc2761'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','7f97db56-50c7-485f-a75c-330eb0cd125f'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','80ca1ae9-b020-4314-a5bd-631ad5ef683e'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','906f64bf-8897-4f6a-b2cd-92a222bf3d63'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','9afeb7c9-85e6-4830-88e0-8236c126e1f1'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','a7d309a4-421f-4df1-88b9-3a171bced3b7'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','c20145e5-39cb-469f-bb9f-0d1c499fcf1f'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','cfa9415c-5adc-403d-8f6c-6e1153e8d2d7'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','d5d6e48b-1637-48fe-82d5-c32e48c66285'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','d79b1179-265d-4f24-b50a-854b5f67902c'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','d8ea49bc-5111-4f67-a468-d663871d8a03'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','ebfa1e07-4cb9-4e92-9ce7-1453f4223163'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','ee5c0f59-eefa-4dd6-9665-47d9af5e07bf'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','fb5c7d66-6284-489a-b631-1312d39273a1'),
	('017fe8f5-97ec-40e3-ad75-6829336ad71a','feb0893f-d2e3-4e65-b976-c3a402ac5988'),
	('4d37644b-2deb-415d-ba3e-6b340dd4e8f2','051d4712-1e31-4c6b-97b9-10e4121390d7'),
	('4d37644b-2deb-415d-ba3e-6b340dd4e8f2','096aa185-3780-450e-ac89-14ad8fa372f3'),
	('4d37644b-2deb-415d-ba3e-6b340dd4e8f2','0f17f755-310e-484c-b11d-36d77605be4a'),
	('4d37644b-2deb-415d-ba3e-6b340dd4e8f2','1feeed6b-70b4-493b-9d30-a4a526feb137'),
	('4d37644b-2deb-415d-ba3e-6b340dd4e8f2','74a47279-afcb-4901-bde6-5eb3ef1b8c20'),
	('4d37644b-2deb-415d-ba3e-6b340dd4e8f2','7c968cf8-4609-478a-abbe-2266c8cc2761'),
	('4d37644b-2deb-415d-ba3e-6b340dd4e8f2','fb5c7d66-6284-489a-b631-1312d39273a1');

/*!40000 ALTER TABLE `sys_role_right` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_subject
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_subject`;

CREATE TABLE `sys_subject` (
  `id` varchar(64) NOT NULL COMMENT '唯一编码 : 唯一编码',
  `info` varchar(1000) DEFAULT NULL COMMENT '科目描述',
  `code` varchar(64) NOT NULL COMMENT '科目编码',
  `name` varchar(256) NOT NULL COMMENT '名称 : 名称',
  `parentid` varchar(64) DEFAULT NULL COMMENT '父级编码 : 父级编码',
  `parentpath` varchar(2000) DEFAULT NULL COMMENT '所有父级编码路径',
  `sort` double DEFAULT '0' COMMENT '排序 : 排序',
  `creator_id` varchar(64) DEFAULT NULL COMMENT '创建者 : 创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间 : 创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间 : 更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注信息 : 备注',
  `isenable` int(11) NOT NULL DEFAULT '0' COMMENT '是否启用 : 0未启用\n1已启用',
  `isdel` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 : 0已删除 1未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目表';

LOCK TABLES `sys_subject` WRITE;
/*!40000 ALTER TABLE `sys_subject` DISABLE KEYS */;

INSERT INTO `sys_subject` (`id`, `info`, `code`, `name`, `parentid`, `parentpath`, `sort`, `creator_id`, `create_date`, `update_date`, `update_by`, `remark`, `isenable`, `isdel`)
VALUES
	('ab579eaa-9f13-4f14-a885-fc7ecf4ba109','lxc练习册','lxc','练习册','cd84d06e-5b8c-47e9-8b44-c9c63e77e896','cd84d06e-5b8c-47e9-8b44-c9c63e77e896|ab579eaa-9f13-4f14-a885-fc7ecf4ba109',1.01,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-08 18:18:06','2016-11-08 18:18:07','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0),
	('cd84d06e-5b8c-47e9-8b44-c9c63e77e896','语文22','yw001','语文','',NULL,1,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-18 16:51:37','2016-10-20 18:13:30','9b70e448-58e7-4a46-ac83-c408d835643d',NULL,1,0);

/*!40000 ALTER TABLE `sys_subject` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_textbook
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_textbook`;

CREATE TABLE `sys_textbook` (
  `id` varchar(64) NOT NULL COMMENT '唯一编码 : 唯一编码',
  `subject_id` varchar(64) NOT NULL COMMENT '科目编码 : 科目编码',
  `creator_id` varchar(64) DEFAULT NULL COMMENT '创建者 : 创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间 : 创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间 : 更新时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注信息 : 备注',
  `isenable` int(11) NOT NULL DEFAULT '0' COMMENT '是否启用 : 0未启用\n1已启用',
  `isdel` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 : 0已删除 1未删除',
  `code` varchar(128) NOT NULL COMMENT '教材编码',
  `issuedate` date NOT NULL COMMENT '发布日期',
  `editorinchief` varchar(256) DEFAULT NULL COMMENT '主编名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `sys_textbook_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `sys_subject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教材表';



# Dump of table sys_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `login_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `cardno` varchar(32) NOT NULL COMMENT '身份证号码',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `user_type` int(11) NOT NULL DEFAULT '0' COMMENT '1.技能人员\n2.技术人员\n3.管理人员',
  `login_type` int(11) NOT NULL DEFAULT '0' COMMENT '0 考生\n1 系统管理员\n2 考试管理员',
  `photo` varchar(1000) DEFAULT NULL,
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) DEFAULT NULL,
  `fingerprintone` varchar(2000) DEFAULT NULL,
  `fingerprinttwo` varchar(2000) DEFAULT NULL COMMENT '用户指纹二',
  `isonline` int(11) NOT NULL DEFAULT '0' COMMENT '0未在线\n1已在线',
  `sex` int(11) NOT NULL DEFAULT '0' COMMENT '0男1女',
  `nation` int(11) NOT NULL DEFAULT '0',
  `birthdate` date DEFAULT NULL,
  `yearling` int(11) NOT NULL DEFAULT '0',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  `duty` varchar(64) DEFAULT NULL,
  `rankcadre` varchar(64) DEFAULT NULL,
  `craftsmansys` varchar(128) DEFAULT NULL,
  `researchsys` varchar(128) DEFAULT NULL,
  `poisonousgz` varchar(128) DEFAULT NULL,
  `othermonthly` int(11) DEFAULT '0',
  `restpost` date DEFAULT NULL,
  `retiredate` date DEFAULT NULL,
  `nativeplace` varchar(128) DEFAULT NULL,
  `worktime` date DEFAULT NULL,
  `ruspaceflight` date DEFAULT NULL,
  `rucampaing` date DEFAULT NULL,
  `seniority` varchar(64) DEFAULT NULL,
  `laterdegree` varchar(128) DEFAULT NULL COMMENT '后取学位',
  `graduate` varchar(128) DEFAULT NULL,
  `graduatelater` varchar(128) DEFAULT NULL,
  `latereducation` varchar(128) DEFAULT NULL,
  `latergraduationdate` date DEFAULT NULL,
  `graduatedate` date DEFAULT NULL,
  `major` varchar(128) DEFAULT NULL,
  `degree` varchar(128) DEFAULT NULL,
  `politicsstatus` int(11) DEFAULT '0',
  `rupartydate` date DEFAULT NULL,
  `technicalleave` varchar(128) DEFAULT NULL,
  `evaluatedate` date DEFAULT NULL,
  `employdate` date DEFAULT NULL,
  `specialty` varchar(128) DEFAULT NULL,
  `authenticatework` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;

INSERT INTO `sys_user` (`id`, `login_name`, `password`, `no`, `name`, `email`, `phone`, `cardno`, `mobile`, `user_type`, `login_type`, `photo`, `login_ip`, `login_date`, `login_flag`, `fingerprintone`, `fingerprinttwo`, `isonline`, `sex`, `nation`, `birthdate`, `yearling`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`, `duty`, `rankcadre`, `craftsmansys`, `researchsys`, `poisonousgz`, `othermonthly`, `restpost`, `retiredate`, `nativeplace`, `worktime`, `ruspaceflight`, `rucampaing`, `seniority`, `laterdegree`, `graduate`, `graduatelater`, `latereducation`, `latergraduationdate`, `graduatedate`, `major`, `degree`, `politicsstatus`, `rupartydate`, `technicalleave`, `evaluatedate`, `employdate`, `specialty`, `authenticatework`)
VALUES
	('8ff16130-6c01-425d-96ac-bf7e895f83f5','wsl','JipBPiOSVW7laA5qEXEtxT921olQBkpRS0YDKpNjWiU=','000000','王世伦','wsl@126.com','3811630','150102198512197892','15034942952',2,0,NULL,NULL,NULL,'1',NULL,NULL,1,0,0,'0000-00-00',0,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-12 16:17:44','9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:14:22',NULL,'0',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'0',NULL,NULL,NULL,NULL),
	('9b70e448-58e7-4a46-ac83-c408d835643d','admin','4yl9RZ6rTkywSVtu2b2jkPl5XuCY8xUScfYzDSTaplc=','01','管理员','chengang1986_2006@126.com','15034942952','','15034942952',1,1,NULL,NULL,'2016-01-01 00:00:00','1',NULL,NULL,1,0,0,'0000-00-00',0,'','2016-01-01 00:00:00','9b70e448-58e7-4a46-ac83-c408d835643d','2016-10-09 17:50:38','备注123222','0',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'0',NULL,NULL,NULL,NULL),
	('f56dac65-7d42-444e-97b6-4c4d7fefa295','lisi','r6doJUmWLBwZvthUe+XcE2GuDKbjk1q24iQakQymDI8=','000000','李四','lisi@126.com','13190541111','131905411111111','13190541111',1,1,NULL,NULL,NULL,'1',NULL,NULL,1,0,25,'2016-11-01',32,'9b70e448-58e7-4a46-ac83-c408d835643d','2016-11-02 23:14:08','f56dac65-7d42-444e-97b6-4c4d7fefa295','2016-11-14 22:31:25','1','0','职务','干部级别','工艺师系统','研究师系统','有毒有害工种',2222,'2016-11-05','2016-11-06','籍贯','2016-11-07','2016-11-08','2016-11-09','学历','后取学位','毕业院校','后取学位毕业院校','后取学历','2016-11-11','2016-11-10','所学专业','学位',1,'2016-11-02','sdd','2016-11-03','2016-11-04','专业','鉴定工种');

/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;

INSERT INTO `sys_user_role` (`user_id`, `role_id`)
VALUES
	('8ff16130-6c01-425d-96ac-bf7e895f83f5','017fe8f5-97ec-40e3-ad75-6829336ad71a'),
	('9b70e448-58e7-4a46-ac83-c408d835643d','017fe8f5-97ec-40e3-ad75-6829336ad71a'),
	('f56dac65-7d42-444e-97b6-4c4d7fefa295','017fe8f5-97ec-40e3-ad75-6829336ad71a');

/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
