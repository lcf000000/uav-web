/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : uavdata

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-01-28 14:02:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for downlog
-- ----------------------------
DROP TABLE IF EXISTS `downlog`;
CREATE TABLE `downlog` (
  `DWLOG_ID` bigint(11) NOT NULL,
  `DWLOG_DATE` datetime DEFAULT NULL,
  `USER_ID` bigint(11) NOT NULL,
  `DATA_ID` bigint(11) NOT NULL,
  PRIMARY KEY (`DWLOG_ID`),
  UNIQUE KEY `dlid_UNIQUE` (`DWLOG_ID`),
  KEY `fk_DownLog_User_idx` (`USER_ID`),
  KEY `fk_DOWNLOG_UAVDATA1_idx` (`DATA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of downlog
-- ----------------------------

-- ----------------------------
-- Table structure for info
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info` (
  `INFO_ID` bigint(11) NOT NULL AUTO_INCREMENT,
  `INFO_LOC` int(10) unsigned zerofill DEFAULT NULL,
  `INFO_NAME` varchar(45) DEFAULT NULL,
  `INFO_TITLE` varchar(45) DEFAULT NULL,
  `INFO_AUTHOR` varchar(45) DEFAULT NULL,
  `INFO_DATE` varchar(45) DEFAULT NULL,
  `INFO_CONTENT1` longtext,
  `INFO_CONTENT2` longtext,
  `INFO_CONTENT3` longtext,
  PRIMARY KEY (`INFO_ID`),
  UNIQUE KEY `iid_UNIQUE` (`INFO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info
-- ----------------------------
INSERT INTO `info` VALUES ('1', '0000000004', 'test', 'Welcome to UAV-DATASET Benchmark!', 'Pengfei Zhu', '2017-12-26', 'ew months ago, we found ridiculously cheap plane tickets for Boston and off we went. It was our first visit to the city and, believe it or not, Stockholm in February was more pleasant than Boston in March. It probably has a lot to do with the fact that we arrived completely unprepared. That I, in my converse and thin jacket, did not end up with pneumonia is honestly not even fair.', null, null);
INSERT INTO `info` VALUES ('15', '0000000001', 'WelcomeIndex', 'Welcome', 'Chenfeng Liu', '2017-12-27', '&lt;h1&gt;&lt;div style=&quot;text-align: center;&quot;&gt;&lt;u&gt;Welcome to UAVChallenge: The UAV-DATASET Benchmark!&lt;/u&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;br&gt;&lt;/div&gt;&lt;/h1&gt;&lt;h2&gt;&lt;/h2&gt;&lt;h3 style=&quot;text-align: center;&quot;&gt;The computer vision community has relied on several centralized benchmarks for performance evaluation of numerous tasks including object detection, pedestrian detection, 3D reconstruction, optical flow, single-object short-term tracking, and stereo estimation.Despite potential pitfalls of such benchmarks, they have proved to be extremely helpful to advance the state-of-the-art in the respective research fields. Interestingly, there has been rather limited work on the standardization of multiple target tracking evaluation.With this benchmark we would like to pave the way for a unified framework towards more meaningful quantification of multi-target tracking.&lt;/h3&gt;&lt;h1&gt;&lt;div style=&quot;text-align: center;&quot;&gt;&lt;/div&gt;&lt;div style=&quot;text-align: center;&quot;&gt;&lt;br&gt;&lt;/div&gt;&lt;div style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/UAV-Data/upfile/1514876281477TA4.png&quot; style=&quot;max-width:100%;&quot;&gt;&lt;br&gt;&lt;/div&gt;&lt;/h1&gt;&lt;h1&gt;&lt;div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;/div&gt;&lt;div&gt;&lt;u&gt;What do we provide?&lt;/u&gt;&lt;/div&gt;&lt;div&gt;&lt;h3&gt;We have created a framework for the fair evaluation of multiple people tracking algorithms. In this framework we provide:&lt;/h3&gt;&lt;/div&gt;&lt;ul&gt;&lt;li&gt;&lt;h3&gt;A large collection of datasets, some already in use and some new challenging sequences!&lt;/h3&gt;&lt;/li&gt;&lt;li&gt;&lt;h3&gt;Detections for all the sequences.&lt;/h3&gt;&lt;/li&gt;&lt;li&gt;&lt;h3&gt;A common evaluation tool providing several measures, from recall to precision to running time.&lt;br&gt;&lt;/h3&gt;&lt;h3&gt;An easy way to compare the performance of state-of-the-art tracking methods.&lt;/h3&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/h1&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;iframe width=&quot;1120&quot; height=&quot;630&quot; src=&quot;https://www.youtube.com/embed/MhQKe-aERsU&quot; frameborder=&quot;0&quot; gesture=&quot;media&quot; allow=&quot;encrypted-media&quot; allowfullscreen=&quot;&quot;&gt;&lt;/iframe&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;/div&gt;&lt;h1&gt;&lt;font color=&quot;#000000&quot;&gt;&lt;u&gt;News&lt;/u&gt;&lt;/font&gt;&lt;/h1&gt;&lt;ul&gt;&lt;li&gt;&lt;h3&gt;Feb 14, 2017: A new detection challenge is online: MOT17Det&lt;/h3&gt;&lt;/li&gt;&lt;li&gt;&lt;h3&gt;Feb 10, 2017: A new challenge is online: PETS2017&lt;/h3&gt;&lt;/li&gt;&lt;li&gt;&lt;h3&gt;Jan 24, 2017: We are part of the new VideoNet initiative.&lt;/h3&gt;&lt;/li&gt;&lt;li&gt;&lt;h3&gt;Jan 07, 2017: There will be two MOTChallenge related workshops at CVPR 2017&lt;/h3&gt;&lt;/li&gt;&lt;/ul&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;', null, null);
INSERT INTO `info` VALUES ('17', '0000000003', 'adsfdsaf', 'dasf', 'dsafdsaf', '2017-12-29', '&lt;h1&gt;asdfdasfdsfd&lt;/h1&gt;', null, null);
INSERT INTO `info` VALUES ('18', '0000000002', 'sadsadsad', 'sadsad', 'sadsad', '2018-01-02', '<h1><b>sadsadsad</b></h1>', null, null);
INSERT INTO `info` VALUES ('21', '0000000005', 'dasfadsf', 'dasf', 'daf', '2018-01-02', null, null, null);
INSERT INTO `info` VALUES ('22', '0000000007', 'adsfdasf', 'adf', 'dasf', '2018-01-02', '&lt;h1&gt;dasfdafsadsf&lt;/h1&gt;', null, null);

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `MANAGER_ID` bigint(11) NOT NULL,
  `MANAGER_UNAME` varchar(45) DEFAULT NULL,
  `MANAGER_PASS` varchar(45) DEFAULT NULL,
  `MANAGER_NAME` varchar(45) DEFAULT NULL,
  `MANAGER_RIGHT` int(11) unsigned zerofill DEFAULT NULL,
  `MANAGER_REGDATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MANAGER_ID`),
  UNIQUE KEY `mid_UNIQUE` (`MANAGER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', 'lcf', '123', 'admin', '00000000005', '2017-9-14');

-- ----------------------------
-- Table structure for result
-- ----------------------------
DROP TABLE IF EXISTS `result`;
CREATE TABLE `result` (
  `RESULT_ID` bigint(11) NOT NULL,
  `RESULT_DATE` datetime DEFAULT NULL,
  `DATA_ID` bigint(11) NOT NULL,
  `USER_ID` bigint(11) NOT NULL,
  `RESULT_CODE` varchar(45) DEFAULT NULL,
  `RESULT_SUBJECT1` double DEFAULT NULL,
  `RESULT_SUBJECT2` double DEFAULT NULL,
  `RESULT_SUBJECT3` double DEFAULT NULL,
  `RESULT_SUBJECT4` double DEFAULT NULL,
  `RESULT_SUBJECT5` double DEFAULT NULL,
  `RESULT_SUBJECT6` double DEFAULT NULL,
  `RESULT_SUBJECT7` double DEFAULT NULL,
  `RESULT_SUBJECT8` double DEFAULT NULL,
  `RESULT_SUBJECT9` double DEFAULT NULL,
  `RESULT_SUBJECT10` double DEFAULT NULL,
  `RESULT_SUBJECT11` double DEFAULT NULL,
  `RESULT_SUBJECT12` double DEFAULT NULL,
  `RESULT_SUBJECT13` double DEFAULT NULL,
  `RESULT_SUBJECT14` double DEFAULT NULL,
  `RESULT_SUBJECT15` double DEFAULT NULL,
  PRIMARY KEY (`RESULT_ID`),
  KEY `fk_RESULT_UAVDATA1_idx` (`DATA_ID`),
  KEY `fk_RESULT_USER1_idx` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of result
-- ----------------------------

-- ----------------------------
-- Table structure for uavdata
-- ----------------------------
DROP TABLE IF EXISTS `uavdata`;
CREATE TABLE `uavdata` (
  `DATA_ID` bigint(11) NOT NULL,
  `DATA_NAME` varchar(45) DEFAULT NULL,
  `DATA_CONTENT` longtext,
  `DATA_DESCRIBE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DATA_ID`),
  UNIQUE KEY `did_UNIQUE` (`DATA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uavdata
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `USER_ID` bigint(11) NOT NULL AUTO_INCREMENT,
  `USER_UNAME` varchar(45) DEFAULT NULL,
  `USER_PASS` varchar(45) DEFAULT NULL,
  `USER_NAME` varchar(45) DEFAULT NULL,
  `USER_COUNTRY` varchar(45) DEFAULT NULL,
  `USER_ORG` varchar(45) DEFAULT '0',
  `USER_REGDATE` varchar(45) DEFAULT NULL,
  `USER_EMAIL` varchar(45) DEFAULT NULL,
  `USER_RIGHT` int(10) unsigned zerofill DEFAULT '0000000000',
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `uid_UNIQUE` (`USER_ID`),
  UNIQUE KEY `uname_UNIQUE` (`USER_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'liuchenfeng', '36637lcf', '刘琛峰', 'CHINA', 'TJU', '2017-9-11', 'lcf000000@outlook.com', '0000000003');
INSERT INTO `user` VALUES ('2', 'wuhaotian', '12345', '吴昊天', 'CHINA', 'TJU', '2017-3-21', '1162307082@qq.com', '0000000001');
INSERT INTO `user` VALUES ('3', 'mawenya', 'mawenya123', '马文亚', 'CHINA', 'TJU', '2017-4-16', 'mawenya@tju.edu.cn', '0000000001');
INSERT INTO `user` VALUES ('4', 'zhupengfei', '546461321', '朱鹏飞', 'CHINA', 'TJU', '2017-8-25', 'zhupengfei@tju.edu.cn', '0000000001');
INSERT INTO `user` VALUES ('5', 'nieqinqin', 'nqq151566', '聂琴琴', 'CHINA', 'TJU', '2017-7-5', 'www.jianyoufeng@qq.com', '0000000001');
INSERT INTO `user` VALUES ('6', 'wanglianjie', 'asdadwda', '汪廉洁', 'CHINA', 'TJU', '2017-2-16', 'wanglianjie@tju.edu.cn', '0000000001');
INSERT INTO `user` VALUES ('7', 'niusijia', 'asd51351', '牛思佳', 'CHINA', 'TJU', '2017-4-10', 'niusijia@tju.edu.cn', '0000000001');
INSERT INTO `user` VALUES ('8', 'chenghao', 'jfsgsh62', '程昊', 'CHINA', 'TJU', '2017-7-5', 'chenghao@tju.edu.cn', '0000000001');
INSERT INTO `user` VALUES ('9', 'huqi', 'df1234b4', '胡琪', 'CHINA', 'TJU', '2017-2-24', 'huqi@tju.edu.cn', '0000000001');
INSERT INTO `user` VALUES ('10', 'qiren', '324brh4b', '齐忍', 'CHINA', 'TJU', '2017-5-3', 'qiren@tju.edu.cn', '0000000001');
INSERT INTO `user` VALUES ('11', 'gaoke', 'ejh43dff9', '高科', 'CHINA', 'TJU', '2017-6-5', 'gaoke@tju.edu.cn', '0000000001');
INSERT INTO `user` VALUES ('12', 'xuqian', '6sdf74nk', '徐倩', 'CHINA', 'TJU', '2017-6-3', 'xuqian@tju.edu.cn', '0000000001');
INSERT INTO `user` VALUES ('13', 'liuxiaoyu', 'awdn3r05', '刘肖宇', 'CHINA', 'TJU', '2017-3-5', 'liuxiaoyu@tju.edu.cn', '0000000001');
INSERT INTO `user` VALUES ('14', 'sdasdfd', 'dafdfasfdsa', '大伟', 'US', 'GA', '2017-6-3', 'dghgghdh@re.com', '0000000001');
INSERT INTO `user` VALUES ('15', 'heythyt', 'htrtrh', 'gdrssth', 'HK', 'FB', '2017-3-5', 'DSAFD@re.com', '0000000001');
INSERT INTO `user` VALUES ('16', 'ehyethyt', 'nrhy', 'shntrn', 'HY', 'AF', '2017-7-5', 'gsfg@vgbg.com', '0000000001');
INSERT INTO `user` VALUES ('17', 'ehyth', 'rthhrt', 'rtsfds43hn', 'MJ', 'AFDAF', '2017-3-5', 'DSFAsfdg@re.com', '0000000001');
INSERT INTO `user` VALUES ('18', 'ehyyt', 'ytjju', 'htt', 'BTR', 'AFDAF', '2017-2-24', 'sfggfs@re.com', '0000000001');
INSERT INTO `user` VALUES ('19', 'bfgbfdsb', 'hsthsrr', 'tshrhtsb', 'TRK', 'ADFS', '2017-7-5', 'dhn@re.com', '0000000001');
INSERT INTO `user` VALUES ('20', 'qerrqenhu', 'yyjjy', 'thtsh', 'BW', 'YRF', '2017-2-24', 'dnhfxh@re.com', '0000000001');
INSERT INTO `user` VALUES ('21', 'rewvytj', 'ysssj', 'sth', 'GSH', '0AF', '2017-3-5', 'dngbf@re.com', '0000000001');
INSERT INTO `user` VALUES ('22', 'wergtrbhwr', 'fnhfsh', 'uykm', 'FH', 'FH', '2017-2-24', 'tgm@re.com', '0000000001');
INSERT INTO `user` VALUES ('23', 'vwrnbhtmr', 'yrsnh', 'mi34mi', 'OIY', 'FHJ', '2017-3-5', 'sgbfzgfz@re.com', '0000000001');
INSERT INTO `user` VALUES ('24', 'wtgrytn', 'ysynsyn', 'uyk', 'GSB', '0AF', '2017-7-5', 'jndj@re.com', '0000000001');
INSERT INTO `user` VALUES ('25', 'srhtbryhn', 'nhfnysn', 'mud', 'AGD', 'FH', '2017-7-5', 'ydnhgnj@re.com', '0000000001');
INSERT INTO `user` VALUES ('26', 'tehtrhr', 'ytjntyn', 'dm', 'GFS', 'LOIYG', '2017-2-24', 'kmois@re.com', '0000000001');
INSERT INTO `user` VALUES ('27', 'htetrh', 'ysrnyn', 'dmy', 'MIU', 'QEWR', '2017-7-5', 'htdgtruj@re.com', '0000000001');
INSERT INTO `user` VALUES ('32', 'usernamefas', 'dasklfdslg', '好啊好啊', 'CJA', 'ANLKF', '2017-09-23', 'ckasdnfjk@fdsaij.com', '0000000002');
INSERT INTO `user` VALUES ('33', 'adfdasgfd', 'gfagfad', 'afgfda', 'afdgfdgfd', 'fdagfd', '2017-09-23', 'afdgfdagfad', '0000000002');
INSERT INTO `user` VALUES ('34', 'adfdasf', 'dasgfdag', 'fdgfdagfd', 'afgfdagfdga', 'gafdgfd', '2017-09-23', 'fadgfdag', '0000000002');
INSERT INTO `user` VALUES ('37', 'dafdasffdsafdsa', 'dasfdsafds', 'adsfdsafdsaf', 'asdfdasfdsa', 'dsafdsa', '2017-09-23', 'fdsafffdasf', '0000000002');
INSERT INTO `user` VALUES ('38', 'fdgafdgfdagf', 'afdgfdgfd', 'gafdgfdgafd', 'afgfddg', 'gafdgafdg', '2017-09-23', 'afgafdgfdg', '0000000002');
INSERT INTO `user` VALUES ('39', 'adsfdasf', 'dafdasfdf', '粉色', 'f e', 'afdads', '2017-09-23', 'faesf', '0000000002');
INSERT INTO `user` VALUES ('47', 'adsfdsf', 'dasfadsf', 'adsfdasffda', null, 'dasffdasadsf', '2017-09-23', 'dasffdasafd', '0000000002');
INSERT INTO `user` VALUES ('49', 'adf', 'dsafdasf', 'sdaf', 'dasfdasf', 'asdf', '2017-12-29', 'dsafasdf', '0000000002');
INSERT INTO `user` VALUES ('52', 'sdaf', 'dsaf', 'dsaf', 'dsaf', 'fdsa', '2017-12-29', 'afds', '0000000000');
INSERT INTO `user` VALUES ('53', 'dagfd', 'gfdag', 'fdagfad', 'fagfdag', 'gfad', '2018-01-04', 'gafdgfadg', '0000000002');
INSERT INTO `user` VALUES ('54', 'dsafdsa', 'fdsaf', 'dsafds', 'dsafsdfdasf', 'afdsa', '2018-01-04', 'fdsafdasfdsaf', '0000000001');
INSERT INTO `user` VALUES ('60', 'dsafdasf', '123456', 'dsfadsaf', 'dsa', 'dsaas', '2018-01-04', 'lcf000000@gmail.com', '0000000000');
INSERT INTO `user` VALUES ('61', 'dsafdsafdsa', '123456', 'dfads', 'fdas', 'dfsafds', '2018-01-04', 'lcf000000@gmail.com', '0000000000');
