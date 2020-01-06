/*
 Navicat Premium Data Transfer

 Source Server         : mysql1
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : commu

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 04/01/2019 22:52:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_activity
-- ----------------------------
DROP TABLE IF EXISTS `t_activity`;
CREATE TABLE `t_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公益活动表',
  `acode` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '活动代码',
  `atitle` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '活动标题',
  `atype` int(11) DEFAULT NULL COMMENT '活动类型（字典）',
  `hascount` int(11) DEFAULT '0' COMMENT '已报名人数',
  `acount` int(11) DEFAULT NULL COMMENT '活动最大人数',
  `apply_endtime` datetime DEFAULT NULL COMMENT '报名结束时间',
  `starttime` datetime DEFAULT NULL COMMENT '开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '结束时间',
  `pay` tinyint(1) DEFAULT NULL COMMENT '是否付费',
  `apply_fee` float DEFAULT NULL COMMENT '活动费用',
  `site` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '活动地点',
  `transport` int(11) DEFAULT NULL COMMENT '交通方式(字典)',
  `content` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '活动内容',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注\r\n',
  `createtime` date DEFAULT NULL COMMENT '发布时间',
  `createby` int(11) DEFAULT NULL COMMENT '创建人',
  `status` int(11) DEFAULT NULL COMMENT '活动状态（字典）',
  `picture` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '活动图片（每个活动一张图片前期）',
  `ban` tinyint(1) DEFAULT NULL COMMENT '是否被禁止，0未1被禁止',
  `report` tinyint(1) DEFAULT '0' COMMENT '是否被举报，0未1被举报',
  `onestar_count` int(11) DEFAULT '0' COMMENT '一星评价数',
  `twostar_count` int(11) DEFAULT '0' COMMENT '二星评价数',
  `threestar_count` int(11) DEFAULT '0' COMMENT '三星评价数',
  `fourstar_count` int(11) DEFAULT '0' COMMENT '四星评价数',
  `fivestar_count` int(11) DEFAULT '0' COMMENT '五星评价数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `acode` (`acode`) USING BTREE,
  KEY `createby` (`createby`) USING BTREE,
  KEY `FK7bofi3u3yxj403b2l7vnkij2u` (`transport`),
  KEY `FKn5pauu9vqcfynd9nb8kgvoatj` (`atype`),
  CONSTRAINT `FK7bofi3u3yxj403b2l7vnkij2u` FOREIGN KEY (`transport`) REFERENCES `t_dictionary` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FKgphnp8tfe7k4tdfhkf76ga68n` FOREIGN KEY (`createby`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FKn5pauu9vqcfynd9nb8kgvoatj` FOREIGN KEY (`atype`) REFERENCES `t_dictionary` (`id`) ON DELETE SET NULL,
  CONSTRAINT `t_activity_ibfk_1` FOREIGN KEY (`createby`) REFERENCES `t_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_activity
-- ----------------------------
BEGIN;
INSERT INTO `t_activity` VALUES (1, '0c403fa4-1b99-49b0-ae7b-bb23baf3e4ae', '关爱老人', 2, 1, 11, '2018-12-31 13:00:00', '2018-12-31 13:00:02', '2018-12-31 13:00:04', 0, 0, '11', 17, 'we are famliy!!!!阿斯达是大', '', '2018-12-31', NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `t_activity` VALUES (8, NULL, '活动标题', 2, 2, 10, NULL, NULL, NULL, 0, NULL, NULL, 17, NULL, NULL, NULL, 13, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (9, '6e76310f-3c86-4549-9186-01b5593ecd4d', '村长救援队', 2, 1, 11, '2019-01-01 15:32:21', '2019-01-01 15:32:23', '2019-01-01 15:32:26', 0, 0, '青青草原', 17, NULL, NULL, '2019-01-01', 4, 8, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (10, '6c8d412e-6cb1-4f98-a743-2dd81b11af5e', '你有多公益', 2, 11, 111, '2018-12-24 23:13:10', '2019-01-01 15:43:23', '2019-01-01 15:43:25', 0, 0, '山东啊', 17, NULL, NULL, '2019-01-01', 4, 8, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (13, 'cfacbcdd-1492-4961-a986-1fb827d73f80', '村长的第N个公益活动', 2, 1, 12, '2018-12-23 19:40:29', '2019-01-01 15:54:03', '2019-01-01 15:54:04', 0, 0, '阿斯达', 17, '阿斯达是大所多aaaa', '', '2019-01-01', 4, NULL, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `t_activity` VALUES (21, 'bcb75cef-8447-430c-9683-f5e02d215b52', '萨达撒', 3, 1, 12, '2019-01-01 16:48:44', '2019-01-01 16:48:47', '2019-01-01 16:49:02', 0, 0, '阿斯达是', 17, '规范化股份过户', '', '2019-01-01', 4, NULL, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `t_activity` VALUES (24, '21d93594-213a-47e8-859d-4c36fc8432e7', '我是村长', 4, 11, 111, '2019-01-01 20:58:40', '2019-01-01 20:58:42', '2019-01-01 20:58:44', 0, 0, '安达市', 16, '撒大声地', '阿斯达是大所', '2019-01-01', 4, 8, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `t_activity` VALUES (25, '3aa5a64a-a46f-40a0-8226-72e2b61a2e5f', '我是村长', 4, 11, 111, '2019-01-01 20:58:40', '2019-01-01 20:58:42', '2019-01-01 20:58:44', 0, 0, '安达市', 16, '撒大声地', '阿斯达是大所', '2019-01-01', 4, 8, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `t_activity` VALUES (26, '4fa31bd2-a02d-4c07-848d-4a590d1d5a44', '村长的哈哈哈', 3, 1, 11, '2018-12-24 22:56:41', '2019-01-01 21:51:27', '2019-01-01 21:51:29', 0, 0, '火星', 19, '阿斯达是大阿斯达是大撒多', '阿斯顿撒大撒所多', '2019-01-01', 4, 8, NULL, 0, 0, 0, 0, 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论信息表',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `createtime` date DEFAULT NULL COMMENT '评论时间',
  `logger` int(11) DEFAULT NULL,
  `beforeUser` int(11) DEFAULT NULL,
  `afterUser` int(11) DEFAULT NULL,
  `lid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKdwwhq2v9ifq6ni9r8k3lfvgvv` (`logger`),
  KEY `FKmm1b06vkfs7pnohsptl6vvxq7` (`beforeUser`),
  KEY `FKbxyln6pl4rtusjweyb2yqmfts` (`afterUser`),
  KEY `FKkilyq059uqoul2nyiwcwg49wu` (`lid`),
  KEY `FK7xnqg94g577a1bntjrux9adeo` (`userid`),
  KEY `FKcldi488ek0uym5lnsquaumytj` (`uid`),
  CONSTRAINT `FK7xnqg94g577a1bntjrux9adeo` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FKbxyln6pl4rtusjweyb2yqmfts` FOREIGN KEY (`afterUser`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FKcldi488ek0uym5lnsquaumytj` FOREIGN KEY (`uid`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FKdwwhq2v9ifq6ni9r8k3lfvgvv` FOREIGN KEY (`logger`) REFERENCES `t_logger` (`id`),
  CONSTRAINT `FKkilyq059uqoul2nyiwcwg49wu` FOREIGN KEY (`lid`) REFERENCES `t_logger` (`id`),
  CONSTRAINT `FKmm1b06vkfs7pnohsptl6vvxq7` FOREIGN KEY (`beforeUser`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
BEGIN;
INSERT INTO `t_comment` VALUES (1, '我是一条不起眼的评论！！！', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_comment` VALUES (2, '我是一条不起眼的评论！！！', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_comment` VALUES (3, '我是一条不起眼的评论！！！', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_comment` VALUES (4, '我是一条不起眼的评论！！！', NULL, 3, 4, 1, NULL, NULL, NULL);
INSERT INTO `t_comment` VALUES (5, '我是一条不起眼的评论！！！', NULL, 3, 4, 1, NULL, NULL, NULL);
INSERT INTO `t_comment` VALUES (6, '我是一条不起眼的评论！！！', NULL, 3, 4, 1, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `t_dictionary`;
CREATE TABLE `t_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '数据字典表',
  `typename` varchar(50) DEFAULT NULL COMMENT '数据类型名称',
  `parentid` int(11) DEFAULT NULL COMMENT '父类型ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_dictionary
-- ----------------------------
BEGIN;
INSERT INTO `t_dictionary` VALUES (1, '活动类型', 0);
INSERT INTO `t_dictionary` VALUES (2, '扶贫', 1);
INSERT INTO `t_dictionary` VALUES (3, '养老院', 1);
INSERT INTO `t_dictionary` VALUES (4, '支教', 1);
INSERT INTO `t_dictionary` VALUES (5, '下乡', 1);
INSERT INTO `t_dictionary` VALUES (6, '活动状态', 0);
INSERT INTO `t_dictionary` VALUES (8, '招募中', 6);
INSERT INTO `t_dictionary` VALUES (9, '招募完毕', 6);
INSERT INTO `t_dictionary` VALUES (10, '进行中', 6);
INSERT INTO `t_dictionary` VALUES (11, '成功结束', 6);
INSERT INTO `t_dictionary` VALUES (12, '取消', 6);
INSERT INTO `t_dictionary` VALUES (13, '禁停', 6);
INSERT INTO `t_dictionary` VALUES (14, '交通方式', 0);
INSERT INTO `t_dictionary` VALUES (15, '步行', 14);
INSERT INTO `t_dictionary` VALUES (16, '大巴', 14);
INSERT INTO `t_dictionary` VALUES (17, '自驾', 14);
INSERT INTO `t_dictionary` VALUES (18, '火车', 14);
INSERT INTO `t_dictionary` VALUES (19, '飞机', 14);
INSERT INTO `t_dictionary` VALUES (20, '轮渡', 14);
INSERT INTO `t_dictionary` VALUES (21, '骑行', 14);
COMMIT;

-- ----------------------------
-- Table structure for t_logger
-- ----------------------------
DROP TABLE IF EXISTS `t_logger`;
CREATE TABLE `t_logger` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动日志信息表',
  `title` varchar(50) DEFAULT NULL COMMENT '日志标题',
  `video` varchar(255) DEFAULT NULL COMMENT '日志视频（可无）',
  `picture` varchar(255) DEFAULT NULL COMMENT '日志图片（可无）',
  `content` varchar(255) DEFAULT NULL COMMENT '日志内容',
  `createtime` date DEFAULT NULL COMMENT '发布时间',
  `dianzan` int(11) DEFAULT NULL COMMENT '点赞数',
  `status` int(1) DEFAULT NULL COMMENT '日志状态，0正常，1被举报，2被禁评，3被封禁',
  `userid` int(11) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid` (`userid`),
  KEY `aid` (`aid`),
  CONSTRAINT `t_logger_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `t_logger_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `t_activity` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_logger
-- ----------------------------
BEGIN;
INSERT INTO `t_logger` VALUES (3, '我是一篇感人的日志', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_logger` VALUES (6, '我是一篇感人的日志', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_starcomment
-- ----------------------------
DROP TABLE IF EXISTS `t_starcomment`;
CREATE TABLE `t_starcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动评级表',
  `usercode` varchar(50) DEFAULT NULL COMMENT '对活动评级的用户',
  `acode` varchar(50) DEFAULT NULL COMMENT '被评级的活动',
  `starcount` int(1) DEFAULT NULL COMMENT '被评的的星级',
  `userid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `usercode` (`usercode`) USING BTREE,
  KEY `acode` (`acode`) USING BTREE,
  CONSTRAINT `t_starcomment_ibfk_1` FOREIGN KEY (`usercode`) REFERENCES `t_user` (`usercode`) ON UPDATE CASCADE,
  CONSTRAINT `t_starcomment_ibfk_2` FOREIGN KEY (`acode`) REFERENCES `t_activity` (`acode`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表',
  `usercode` varchar(50) DEFAULT NULL COMMENT '用户账号',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `level` float(32,1) DEFAULT NULL COMMENT '等级（后期使用）',
  `birth` date DEFAULT NULL COMMENT '生日',
  `phone` bigint(20) DEFAULT NULL COMMENT '电话',
  `emp` varchar(20) DEFAULT NULL COMMENT '职业',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `status` int(1) DEFAULT NULL COMMENT '状态（0已激活，1未激活,2被举报，3被封停）',
  `gender` int(1) DEFAULT NULL COMMENT '性别（0表示男，1表示女）',
  `createtime` date DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `usercode` (`usercode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_user
-- ----------------------------
BEGIN;
INSERT INTO `t_user` VALUES (1, '123456', '赵四', '123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (2, NULL, '赵本山', '123456', '1739781578@qq.com', 10000.0, '2018-12-13', 17561841398, '村长', '青岛大学', 0, 1, '2018-12-26');
INSERT INTO `t_user` VALUES (4, NULL, '村长', '123456', '1739781578@qq.com', 10000.0, '2018-12-13', 17561841398, '村长', '青岛大学', 0, 1, '2018-12-26');
INSERT INTO `t_user` VALUES (13, NULL, '岳云鹏', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_user_activity
-- ----------------------------
DROP TABLE IF EXISTS `t_user_activity`;
CREATE TABLE `t_user_activity` (
  `userid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`aid`),
  KEY `FKdmceus206t4sidqnv5kceo3bs` (`aid`),
  CONSTRAINT `FKb3pe94os1jfrc3nh56gy4kkt6` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FKdmceus206t4sidqnv5kceo3bs` FOREIGN KEY (`aid`) REFERENCES `t_activity` (`id`),
  CONSTRAINT `t_user_activity_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `t_user_activity_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `t_activity` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_user_activity
-- ----------------------------
BEGIN;
INSERT INTO `t_user_activity` VALUES (4, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
