/*
Navicat MySQL Data Transfer

Source Server         : test1
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : jsppic

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-12-10 16:09:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` bigint(20) DEFAULT NULL,
  `name` longtext COLLATE utf8_unicode_ci,
  `sex` longtext COLLATE utf8_unicode_ci,
  `email` longtext COLLATE utf8_unicode_ci,
  `title` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `data` longtext COLLATE utf8_unicode_ci,
  `hit` bigint(20) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('0', 'sa', 'man', '11', '11', '111', '2017-05-26 08:54:00', '1', '1');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(10) DEFAULT '1',
  `reply` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `people` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('21', '夜空中最亮的星', '2017-06-15 16:45:18', 'upload/-1601d202f3c93e7f.jpg', 'sa');
INSERT INTO `picture` VALUES ('23', '《有你》', '2017-06-13 18:37:27', 'upload/1497350144453.jpeg', 'Ellien');
INSERT INTO `picture` VALUES ('24', '邂逅武汉', '2017-06-13 18:41:37', 'upload/1497350418598.jpeg', 'Ellien');
INSERT INTO `picture` VALUES ('26', '22', '2017-06-30 12:00:42', 'upload/24281144_001034052000_2.jpg', 'sa');
INSERT INTO `picture` VALUES ('27', '11', '2017-06-17 12:28:50', 'upload/222.jpg', '陈星星');

-- ----------------------------
-- Table structure for replayms
-- ----------------------------
DROP TABLE IF EXISTS `replayms`;
CREATE TABLE `replayms` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hit` int(255) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of replayms
-- ----------------------------
INSERT INTO `replayms` VALUES ('1', 'sa', '66666666666666666666666666', '2017-05-26 09:01:54', '55', '5');
INSERT INTO `replayms` VALUES ('15', '陈星星', '呵呵', '2017-06-13 18:10:32', '6', '0');
INSERT INTO `replayms` VALUES ('19', '陈星星', '哈哈', '2017-06-13 19:05:05', '13', '0');
INSERT INTO `replayms` VALUES ('20', '陈星星', '路过.....', '2017-06-13 19:46:24', '13', '2');
INSERT INTO `replayms` VALUES ('21', 'admin', '(๑•ั็ω•็ั๑)', '2017-06-14 15:15:41', '6', '1');
INSERT INTO `replayms` VALUES ('23', 'sa', '5', '2017-06-15 01:17:55', '15', '0');
INSERT INTO `replayms` VALUES ('24', 'sa', 'tt', '2017-06-15 15:47:47', '16', '0');
INSERT INTO `replayms` VALUES ('31', '星星', '。。。。。。', '2017-06-15 17:33:08', '13', '0');
INSERT INTO `replayms` VALUES ('32', 'sa', '66666', '2017-06-17 14:09:12', '5', '0');
INSERT INTO `replayms` VALUES ('36', 'sa', '66666', '2017-06-23 19:29:11', '13', '0');
INSERT INTO `replayms` VALUES ('37', 'sa', '6666', '2017-06-30 11:59:59', '18', '0');
INSERT INTO `replayms` VALUES ('38', '陈星星', '666', '2017-07-21 09:48:16', '18', '0');
INSERT INTO `replayms` VALUES ('39', '陈星星', '111', '2017-07-21 09:48:34', '18', '0');
INSERT INTO `replayms` VALUES ('40', '陈星星', '5555', '2017-07-21 11:22:16', '18', '0');
INSERT INTO `replayms` VALUES ('41', 'admin', '444', '2017-11-21 15:02:47', '18', '0');

-- ----------------------------
-- Table structure for share
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` varchar(9184) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `likess` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of share
-- ----------------------------
INSERT INTO `share` VALUES ('5', '陈星星', '华东交通大学软件 学院十佳歌手', '自己就是这么水，想想那天都想笑！！！！多经历一点也好，更快的让自己成长吧！！', '2017-06-10 21:09:21', 'upload/-1601d202f3c93e7f.jpg', '43');
INSERT INTO `share` VALUES ('6', 'sa', '解不开的星杰', '我知道你的梦，我知道你的痛，我知道我们感受都相同!', '2017-06-13 13:50:44', 'upload/timg-1.jpg', '6');
INSERT INTO `share` VALUES ('13', 'Ellien', '思接千载，以古圣先贤为伴；神驰九州，与当今豪杰为朋', '《美在交大》第二季“发现花椒”之四部曲《书声郎朗读花椒》、《诗人济济吟花椒》、《成语连连找花椒》、《挥毫泼墨写花椒》，让我们每个花椒人，思接千载，以古圣先贤为伴；神驰九州，与当今豪杰为朋。<a href=\"https://uni.mp.qq.com/article?id=324d2f2a-4ffd-11e7-841a-545200926338&school_id=200786140&_wv=2147483649&msg_id=sgrp-37150190-4ffd-11e7-b8bd-febeb7d5836c\">查看原文</a>', '2017-06-13 18:48:04', 'upload/640.jpg', '9');
INSERT INTO `share` VALUES ('14', '陈星星', '朱丹为什么会遭遇雪藏？', '说到各大电视台的主持一姐，可能很多人会想到央视的董卿，湖南台的谢娜，还有就是浙江卫视的朱丹。相信很多80、90后都曾记得这么一档节目《我爱记歌词》，那就应该也记得朱丹。朱丹和华少因为这档节目而名声大噪随后也迅速红遍主持圈。浙江卫视的力量慢慢强大，逐渐开发新的节目，邀请外援为电视台助力，比如周立波。周立波和朱丹理念不合，并且只能留一个，这是朱丹离开最主要的原因。还有一个原因就是浙江卫视重视程度不足令朱丹心灰意冷，浙江卫视可能对朱丹有意见，力捧新欢伊一，冷落朱丹。', '2017-06-15 00:48:44', 'upload/216f0011d4b91367355a.jpg', '3');
INSERT INTO `share` VALUES ('15', '陈星星', '搞笑我们是认真的', '精选段子\n<br>1\n小时候我每次犯错，父亲都会狠狠打我一顿，而我妈都在旁边一边替我求情，一边流着眼泪心疼我...记得有一次，我被狠狠的“修理”一顿后，半夜起来上厕所，路过爸妈门口，听到我妈跟我爸说“怎么样，打的手疼不疼？要么下次买个棍子打吧！？”那一刻，心都碎了！<br>\n2<br>\n酒桌上，老李给老张敬酒老张：“这个酒今天我不能喝”老李：“为什么？”老张：“我是处女座加强迫症，周一喝一品坊，周二喝二锅头，周四喝四特酒。周五喝五粮液，周六喝金六福”老李：“今天呢”老张：“今天，周三，没有我喝的酒”', '2017-06-15 01:01:10', 'upload/26f0000337f3b3bd421b.gif', '3');
INSERT INTO `share` VALUES ('16', 'sa', '笑一笑没什么大不了', '一个朋友，淘宝用户名是“我爹”，每次快递员给他送货的时候总是很为难：“你是…我爹吗？”“你是我爹吧，下楼取快递。”“是…我爹…吧，这有你的快递…”后来……快递员:喂你好，你叫我爹对吧？朋友:你……是？快递员:你是不是叫我爹？朋友:你是谁？快递员:我问你叫我爹对不对？朋友:你到底干啥？快递员:你要是叫我爹我就把快递给你送过去。<br>\n刚刚买东西的时候，应付7块钱，摸摸口袋，有一张10块和一张5块的。给了老板10块钱，找我3块，看着手中8块钱，一时迷糊：“老板，我这里正好有7块零钱！”估计那货也在神游，默默拿过我递过去的7块钱，然后把刚刚那张10块的还给我，回来的路上越想越觉得不妥……', '2017-06-15 09:29:09', 'upload/20130630003221904.jpg', '7');
INSERT INTO `share` VALUES ('17', 'sa', '乘风破浪会有时，直挂云帆济沧海', '人生在世，“奋斗”二字。作为一个顶天立地的人，你要无怨无悔地走完自己的人生历程。怎样才能充实地走完这段历程，这是一个值得思考的问题。是碌碌无为，虚度韶华？还是踏踏实实，拼搏奋斗？这取决于自己。', '2017-06-17 14:07:48', 'upload/safe_image.jpg', '5');
INSERT INTO `share` VALUES ('18', 'sa', '笑一笑没有什么大不了', 'never give up!', '2017-06-29 09:23:38', 'upload/-7d7ee2a3fe5c3fff.gif', '3');

-- ----------------------------
-- Table structure for sttell
-- ----------------------------
DROP TABLE IF EXISTS `sttell`;
CREATE TABLE `sttell` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `text` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `people` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `hit` int(10) DEFAULT '0',
  `state` int(20) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sttell
-- ----------------------------
INSERT INTO `sttell` VALUES ('2', '这已经是第四个版本了！！', 'admin', '2017-06-13 13:23:23', '10', '1');
INSERT INTO `sttell` VALUES ('8', '此系统已经完成通过邮箱找回密码功能了！！！@ ', 'admin', '2017-06-13 18:13:34', '2', '1');
INSERT INTO `sttell` VALUES ('9', '系统已经完成了移动端的设计！！！', 'admin', '2017-06-15 00:39:44', '4', '1');

-- ----------------------------
-- Table structure for toshowpic
-- ----------------------------
DROP TABLE IF EXISTS `toshowpic`;
CREATE TABLE `toshowpic` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `people` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `style` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of toshowpic
-- ----------------------------
INSERT INTO `toshowpic` VALUES ('31', 'sa', 'upload/-1601d202f3c93e7f.jpg', '夜空中最亮的星');
INSERT INTO `toshowpic` VALUES ('32', 'sa', 'upload/timg-1.jpg', '夜空中最亮的星');
INSERT INTO `toshowpic` VALUES ('43', 'Ellien', 'upload/640.jpg', 'null');
INSERT INTO `toshowpic` VALUES ('44', '陈星星', 'upload/235106-14050Q2542837.jpg', '星星');
INSERT INTO `toshowpic` VALUES ('45', '陈星星', 'upload/09fa513d269759ee85c624e5b8fb43166d22df0e.jpg', '星星');
INSERT INTO `toshowpic` VALUES ('46', '陈星星', 'upload/216f0011d4b91367355a.jpg', 'null');
INSERT INTO `toshowpic` VALUES ('47', '陈星星', 'upload/26f0000337f3b3bd421b.gif', 'null');
INSERT INTO `toshowpic` VALUES ('49', 'sa', 'upload/235106-14050Q2542837.jpg', '夜空中最亮的星');
INSERT INTO `toshowpic` VALUES ('50', 'sa', 'upload/24281144_001034052000_2.jpg', '夜空中最亮的星');
INSERT INTO `toshowpic` VALUES ('51', 'sa', 'upload/41h58PICVmv.jpg', '夜空中最亮的星');
INSERT INTO `toshowpic` VALUES ('52', 'sa', 'upload/09fa513d269759ee85c624e5b8fb43166d22df0e.jpg', '夜空中最亮的星');
INSERT INTO `toshowpic` VALUES ('53', 'sa', 'upload/20130630003221904.jpg', '夜空中最亮的星');
INSERT INTO `toshowpic` VALUES ('54', 'sa', 'upload/1497508532834350222969.jpg', '夜空中最亮的星');
INSERT INTO `toshowpic` VALUES ('55', 'sa', 'upload/Screenshot_2017-06-14-23-12-30-43.png', '夜空中最亮的星');
INSERT INTO `toshowpic` VALUES ('56', 'sa', 'upload/IMG20170614143452.jpg', '夜空中最亮的星');
INSERT INTO `toshowpic` VALUES ('58', 'sa', 'upload/timg.jpg', '夜空中最亮的星');
INSERT INTO `toshowpic` VALUES ('59', 'sa', 'upload/09fa513d269759ee85c624e5b8fb43166d22df0e.jpg', '22');
INSERT INTO `toshowpic` VALUES ('60', 'sa', 'upload/safe_image.jpg', 'null');
INSERT INTO `toshowpic` VALUES ('61', 'sa', 'upload/Screenshot_2017-06-17-13-42-13-51.png', '22');
INSERT INTO `toshowpic` VALUES ('65', 'sa', 'upload/hdImg_f3d33c1164c8b7b3b1000f4eb47b2e3b1498203028151.jpg', '22');
INSERT INTO `toshowpic` VALUES ('66', 'sa', 'upload/-7d7ee2a3fe5c3fff.gif', '22');
INSERT INTO `toshowpic` VALUES ('67', 'sa', 'upload/1498795258423-155061175.jpg', '22');
INSERT INTO `toshowpic` VALUES ('68', '陈星星', 'upload/1500502936079.jpeg', '11');
INSERT INTO `toshowpic` VALUES ('69', '陈星星', 'upload/1500772173416.jpeg', '11');
INSERT INTO `toshowpic` VALUES ('70', '陈星星', 'upload/u=3208106414,4051610412&fm=26&gp=0.png', '11');
INSERT INTO `toshowpic` VALUES ('71', '陈星星', 'upload/U7357P28T3D4110310F326DT20140312151306.jpg', '11');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qq` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `style` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `statu` int(255) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('7', 'admin', '147258369', '18379643981', '1527072011', '1527072012@qq.com', '2017-05-29 17:44:05', 'admin', 'upload/u=676642173,3846669981&fm=26&gp=0.jpg', '0');
INSERT INTO `user` VALUES ('8', 'sa', '147258369', '18379643981', '1527072012', '3562499648@qq.com', '2017-05-29 17:59:04', 'user', 'upload/1497830782934.gif', '0');
INSERT INTO `user` VALUES ('10', 'lzc', '123456', '15879032098', '1426284306', '1419284306@qq.com', '2017-05-29 18:51:41', 'user', 'upload/default.png', '0');
INSERT INTO `user` VALUES ('13', 'Ellien', '19970110', '15797638379', '3075956276', '3075956276@qq.com', '2017-06-04 07:32:57', 'user', 'upload/1497435205252.jpg', '0');
INSERT INTO `user` VALUES ('15', '陈星星', '123456', '18379643981', '1527072012', '1527072012@qq.com', '2017-06-10 17:36:20', 'user', 'upload/IMG20170525160040_222mh1495700079645.jpg', '1');
INSERT INTO `user` VALUES ('16', '星星', '147258369', '18379643981', '1527072012', '1527072012@qq.com', '2017-06-15 17:31:04', 'user', 'upload/235106-14050Q2542837.jpg', '1');
INSERT INTO `user` VALUES ('17', '饶满秀', '123456', '13647909270', '1527072012', '1527072012@qq.com', '2017-08-07 18:46:11', 'user', 'upload/xxxx.jpg', '1');

-- ----------------------------
-- Table structure for userxtmessage
-- ----------------------------
DROP TABLE IF EXISTS `userxtmessage`;
CREATE TABLE `userxtmessage` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `style` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of userxtmessage
-- ----------------------------
INSERT INTO `userxtmessage` VALUES ('21', 'admin', '59.53.174.175', '2017-05-29 17:49:45', 'admin');
INSERT INTO `userxtmessage` VALUES ('22', 'admin', '59.53.174.175', '2017-05-29 17:50:22', 'admin');
INSERT INTO `userxtmessage` VALUES ('24', 'admin', '59.53.174.175', '2017-05-29 17:53:02', 'admin');
INSERT INTO `userxtmessage` VALUES ('25', 'sa', '59.53.174.175', '2017-05-29 17:59:20', 'admin');
INSERT INTO `userxtmessage` VALUES ('27', '陈星星', '59.53.174.175', '2017-05-29 18:10:32', 'admin');
INSERT INTO `userxtmessage` VALUES ('28', 'lzc', '223.104.10.167', '2017-05-29 18:52:09', 'admin');
INSERT INTO `userxtmessage` VALUES ('29', '123', '223.104.170.218', '2017-05-31 08:32:50', 'admin');
INSERT INTO `userxtmessage` VALUES ('30', '123', '223.104.170.218', '2017-05-31 08:32:50', 'admin');
INSERT INTO `userxtmessage` VALUES ('31', '123', '223.104.170.218', '2017-05-31 08:32:50', 'admin');
INSERT INTO `userxtmessage` VALUES ('32', '123', '223.104.170.218', '2017-05-31 08:32:50', 'admin');
INSERT INTO `userxtmessage` VALUES ('34', '123', '223.104.170.218', '2017-05-31 08:32:51', 'admin');
INSERT INTO `userxtmessage` VALUES ('35', '123', '223.104.170.218', '2017-05-31 08:32:51', 'admin');
INSERT INTO `userxtmessage` VALUES ('38', '123', '223.104.170.218', '2017-05-31 08:32:51', 'admin');
INSERT INTO `userxtmessage` VALUES ('39', '123', '223.104.170.218', '2017-05-31 08:32:51', 'admin');
INSERT INTO `userxtmessage` VALUES ('42', 'admin', '59.53.174.175', '2017-05-31 15:59:41', 'admin');
INSERT INTO `userxtmessage` VALUES ('43', 'admin', '223.104.10.97', '2017-06-02 10:15:16', 'admin');
INSERT INTO `userxtmessage` VALUES ('45', 'lzc', '59.53.174.175', '2017-06-03 01:01:56', 'admin');
INSERT INTO `userxtmessage` VALUES ('46', 'lzc', '59.53.174.175', '2017-06-03 01:06:21', 'admin');
INSERT INTO `userxtmessage` VALUES ('47', 'admin', '59.53.174.175', '2017-06-03 01:09:32', 'admin');
INSERT INTO `userxtmessage` VALUES ('48', 'admin', '223.104.10.97', '2017-06-03 01:12:39', 'admin');
INSERT INTO `userxtmessage` VALUES ('49', 'lzc', '223.104.10.97', '2017-06-03 01:15:30', 'admin');
INSERT INTO `userxtmessage` VALUES ('50', '666', '223.104.10.97', '2017-06-03 14:55:29', 'admin');
INSERT INTO `userxtmessage` VALUES ('52', 'admin', '59.53.174.175', '2017-06-03 15:24:46', 'admin');
INSERT INTO `userxtmessage` VALUES ('53', 'admin', '223.104.10.97', '2017-06-04 00:13:15', 'admin');
INSERT INTO `userxtmessage` VALUES ('54', 'admin', '223.104.10.97', '2017-06-04 00:22:17', 'admin');
INSERT INTO `userxtmessage` VALUES ('55', 'admin', '59.53.174.175', '2017-06-04 01:54:47', 'admin');
INSERT INTO `userxtmessage` VALUES ('56', 'admin', '59.53.174.175', '2017-06-04 07:44:47', 'admin');
INSERT INTO `userxtmessage` VALUES ('57', 'Ellien', '59.53.174.240', '2017-06-04 08:28:00', 'admin');
INSERT INTO `userxtmessage` VALUES ('58', 'admin', '223.104.10.97', '2017-06-04 20:36:09', 'admin');
INSERT INTO `userxtmessage` VALUES ('59', 'admin', '223.104.10.97', '2017-06-05 14:05:23', 'admin');
INSERT INTO `userxtmessage` VALUES ('60', 'admin', '223.104.10.97', '2017-06-05 14:09:31', 'admin');
INSERT INTO `userxtmessage` VALUES ('61', 'admin', '223.104.10.97', '2017-06-05 17:04:41', 'admin');
INSERT INTO `userxtmessage` VALUES ('62', 'admin', '59.53.174.175', '2017-06-06 14:22:33', 'admin');
INSERT INTO `userxtmessage` VALUES ('63', 'admin', '223.104.10.97', '2017-06-06 22:38:34', 'admin');
INSERT INTO `userxtmessage` VALUES ('64', 'sa', '59.53.174.175', '2017-06-09 00:56:19', 'admin');
INSERT INTO `userxtmessage` VALUES ('65', 'sa', '59.53.174.175', '2017-06-10 14:42:04', 'admin');
INSERT INTO `userxtmessage` VALUES ('66', 'admin', '223.104.10.97', '2017-06-10 15:02:27', 'admin');
INSERT INTO `userxtmessage` VALUES ('68', 'admin', '223.104.10.97', '2017-06-10 15:27:54', 'admin');
INSERT INTO `userxtmessage` VALUES ('70', 'admin', '223.104.10.97', '2017-06-10 15:34:35', 'admin');
INSERT INTO `userxtmessage` VALUES ('71', 'sa', '223.104.170.73', '2017-06-10 15:49:51', 'admin');
INSERT INTO `userxtmessage` VALUES ('72', 'sa', '223.104.170.73', '2017-06-10 16:03:53', 'admin');
INSERT INTO `userxtmessage` VALUES ('73', 'sa', '223.104.170.73', '2017-06-10 16:06:38', 'admin');
INSERT INTO `userxtmessage` VALUES ('74', 'sa', '223.104.170.73', '2017-06-10 16:11:37', 'admin');
INSERT INTO `userxtmessage` VALUES ('75', 'sa', '223.104.170.73', '2017-06-10 16:23:21', 'admin');
INSERT INTO `userxtmessage` VALUES ('76', 'admin', '223.104.170.73', '2017-06-10 16:28:11', 'admin');
INSERT INTO `userxtmessage` VALUES ('77', 'sa', '223.104.170.73', '2017-06-10 16:36:35', 'admin');
INSERT INTO `userxtmessage` VALUES ('78', 'admin', '223.104.170.73', '2017-06-10 16:49:40', 'admin');
INSERT INTO `userxtmessage` VALUES ('79', 'admin', '223.104.170.73', '2017-06-10 16:52:06', 'admin');
INSERT INTO `userxtmessage` VALUES ('80', 'admin', '223.104.170.73', '2017-06-10 16:55:47', 'admin');
INSERT INTO `userxtmessage` VALUES ('81', 'admin', '223.104.170.73', '2017-06-10 16:55:48', 'admin');
INSERT INTO `userxtmessage` VALUES ('82', 'admin', '223.104.170.73', '2017-06-10 17:09:10', 'admin');
INSERT INTO `userxtmessage` VALUES ('83', 'admin', '223.104.170.73', '2017-06-10 17:14:22', 'admin');
INSERT INTO `userxtmessage` VALUES ('84', 'admin', '223.104.170.73', '2017-06-10 17:15:23', 'admin');
INSERT INTO `userxtmessage` VALUES ('85', 'admin', '223.104.170.73', '2017-06-10 17:15:23', 'admin');
INSERT INTO `userxtmessage` VALUES ('86', 'admin', '223.104.170.73', '2017-06-10 17:15:36', 'admin');
INSERT INTO `userxtmessage` VALUES ('87', 'admin', '223.104.170.73', '2017-06-10 17:16:17', 'admin');
INSERT INTO `userxtmessage` VALUES ('88', 'admin', '223.104.170.73', '2017-06-10 17:22:49', 'admin');
INSERT INTO `userxtmessage` VALUES ('89', 'admin', '223.104.170.73', '2017-06-10 17:23:53', 'admin');
INSERT INTO `userxtmessage` VALUES ('90', 'admin', '223.104.170.73', '2017-06-10 17:25:45', 'admin');
INSERT INTO `userxtmessage` VALUES ('91', 'admin', '223.104.170.73', '2017-06-10 17:27:12', 'admin');
INSERT INTO `userxtmessage` VALUES ('92', 'sa', '223.104.170.73', '2017-06-10 17:28:00', 'admin');
INSERT INTO `userxtmessage` VALUES ('93', 'admin', '223.104.170.73', '2017-06-10 17:34:24', 'admin');
INSERT INTO `userxtmessage` VALUES ('94', '陈星星', '223.104.170.73', '2017-06-10 17:36:40', 'admin');
INSERT INTO `userxtmessage` VALUES ('95', '陈星星', '59.53.174.175', '2017-06-10 17:41:07', 'admin');
INSERT INTO `userxtmessage` VALUES ('96', 'admin', '223.104.170.73', '2017-06-10 17:47:31', 'admin');
INSERT INTO `userxtmessage` VALUES ('97', '陈星星', '59.53.174.175', '2017-06-10 18:27:39', 'admin');
INSERT INTO `userxtmessage` VALUES ('98', 'admin', '59.53.174.175', '2017-06-10 18:30:29', 'admin');
INSERT INTO `userxtmessage` VALUES ('99', '陈星星', '59.53.174.175', '2017-06-10 18:31:26', 'admin');
INSERT INTO `userxtmessage` VALUES ('100', '陈星星', '59.53.174.175', '2017-06-10 18:54:24', 'admin');
INSERT INTO `userxtmessage` VALUES ('101', '陈星星', '59.53.174.175', '2017-06-10 19:03:21', 'admin');
INSERT INTO `userxtmessage` VALUES ('102', '陈星星', '59.53.174.175', '2017-06-10 19:05:21', 'admin');
INSERT INTO `userxtmessage` VALUES ('103', '陈星星', '59.53.174.175', '2017-06-10 19:06:03', 'admin');
INSERT INTO `userxtmessage` VALUES ('104', '陈星星', '59.53.174.175', '2017-06-10 19:19:50', 'admin');
INSERT INTO `userxtmessage` VALUES ('105', '陈星星', '59.53.174.175', '2017-06-10 19:21:27', 'admin');
INSERT INTO `userxtmessage` VALUES ('106', '陈星星', '59.53.174.175', '2017-06-10 19:41:27', 'admin');
INSERT INTO `userxtmessage` VALUES ('107', '陈星星', '59.53.174.175', '2017-06-10 19:44:48', 'admin');
INSERT INTO `userxtmessage` VALUES ('108', 'lzc', '59.53.174.177', '2017-06-10 19:57:17', 'admin');
INSERT INTO `userxtmessage` VALUES ('109', 'sa', '59.53.174.175', '2017-06-10 20:10:15', 'admin');
INSERT INTO `userxtmessage` VALUES ('110', 'lzc', '59.53.174.177', '2017-06-10 20:10:54', 'admin');
INSERT INTO `userxtmessage` VALUES ('111', 'admin', '59.53.174.177', '2017-06-10 20:12:17', 'admin');
INSERT INTO `userxtmessage` VALUES ('112', 'sa', '59.53.174.175', '2017-06-10 20:16:15', 'admin');
INSERT INTO `userxtmessage` VALUES ('113', 'sa', '59.53.174.175', '2017-06-10 20:21:19', 'admin');
INSERT INTO `userxtmessage` VALUES ('114', 'sa', '59.53.174.175', '2017-06-10 20:37:11', 'admin');
INSERT INTO `userxtmessage` VALUES ('115', 'sa', '59.53.174.175', '2017-06-10 20:37:13', 'admin');
INSERT INTO `userxtmessage` VALUES ('116', 'sa', '59.53.174.175', '2017-06-10 20:37:12', 'admin');
INSERT INTO `userxtmessage` VALUES ('117', 'sa', '59.53.174.175', '2017-06-10 20:37:13', 'admin');
INSERT INTO `userxtmessage` VALUES ('118', 'sa', '59.53.174.175', '2017-06-10 20:37:13', 'admin');
INSERT INTO `userxtmessage` VALUES ('119', 'sa', '59.53.174.175', '2017-06-10 20:37:09', 'admin');
INSERT INTO `userxtmessage` VALUES ('120', 'sa', '59.53.174.175', '2017-06-10 20:37:15', 'admin');
INSERT INTO `userxtmessage` VALUES ('121', 'sa', '59.53.174.175', '2017-06-10 20:37:15', 'admin');
INSERT INTO `userxtmessage` VALUES ('122', 'sa', '59.53.174.175', '2017-06-10 20:37:15', 'admin');
INSERT INTO `userxtmessage` VALUES ('123', 'sa', '59.53.174.175', '2017-06-10 20:39:07', 'admin');
INSERT INTO `userxtmessage` VALUES ('124', '陈星星', '59.53.174.175', '2017-06-10 20:46:37', 'admin');
INSERT INTO `userxtmessage` VALUES ('125', '陈星星', '59.53.174.175', '2017-06-10 20:59:33', 'admin');
INSERT INTO `userxtmessage` VALUES ('126', '陈星星', '59.53.174.175', '2017-06-10 21:14:03', 'admin');
INSERT INTO `userxtmessage` VALUES ('127', '陈星星', '59.53.174.175', '2017-06-10 21:14:08', 'admin');
INSERT INTO `userxtmessage` VALUES ('128', '陈星星', '59.53.174.175', '2017-06-10 21:14:15', 'admin');
INSERT INTO `userxtmessage` VALUES ('129', 'admin', '59.53.174.175', '2017-06-10 21:18:34', 'admin');
INSERT INTO `userxtmessage` VALUES ('130', '陈星星', '223.104.170.73', '2017-06-10 21:57:45', 'admin');
INSERT INTO `userxtmessage` VALUES ('131', 'admin', '223.104.170.73', '2017-06-10 22:11:12', 'admin');
INSERT INTO `userxtmessage` VALUES ('132', 'admin', '59.53.174.177', '2017-06-11 15:23:59', 'admin');
INSERT INTO `userxtmessage` VALUES ('133', 'admin', '59.53.174.177', '2017-06-11 18:46:18', 'admin');
INSERT INTO `userxtmessage` VALUES ('134', 'sa', '59.53.174.175', '2017-06-12 15:36:41', 'admin');
INSERT INTO `userxtmessage` VALUES ('135', 'admin', '59.53.174.175', '2017-06-12 15:42:49', 'admin');
INSERT INTO `userxtmessage` VALUES ('136', 'admin', '59.53.174.177', '2017-06-12 19:24:34', 'admin');
INSERT INTO `userxtmessage` VALUES ('137', 'admin', '59.53.174.177', '2017-06-12 19:30:33', 'admin');
INSERT INTO `userxtmessage` VALUES ('138', 'admin', '59.53.174.177', '2017-06-12 19:54:24', 'admin');
INSERT INTO `userxtmessage` VALUES ('139', 'sa', '59.53.174.175', '2017-06-13 10:20:55', 'admin');
INSERT INTO `userxtmessage` VALUES ('140', 'sa', '59.53.174.175', '2017-06-13 10:55:32', 'admin');
INSERT INTO `userxtmessage` VALUES ('141', 'sa', '59.53.174.175', '2017-06-13 13:17:10', 'admin');
INSERT INTO `userxtmessage` VALUES ('142', 'sa', '59.53.174.175', '2017-06-13 13:19:53', 'admin');
INSERT INTO `userxtmessage` VALUES ('143', 'sa', '59.53.174.175', '2017-06-13 13:20:12', 'admin');
INSERT INTO `userxtmessage` VALUES ('144', 'admin', '59.53.174.175', '2017-06-13 13:21:23', 'admin');
INSERT INTO `userxtmessage` VALUES ('145', 'sa', '59.53.174.175', '2017-06-13 13:22:10', 'admin');
INSERT INTO `userxtmessage` VALUES ('146', 'sa', '223.104.170.73', '2017-06-13 13:47:07', 'admin');
INSERT INTO `userxtmessage` VALUES ('147', 'sa', '59.53.174.175', '2017-06-13 13:58:30', 'admin');
INSERT INTO `userxtmessage` VALUES ('148', 'admin', '59.53.174.175', '2017-06-13 14:00:51', 'admin');
INSERT INTO `userxtmessage` VALUES ('149', 'admin', '59.53.174.175', '2017-06-13 14:02:28', 'admin');
INSERT INTO `userxtmessage` VALUES ('150', 'sa', '59.53.174.175', '2017-06-13 14:03:19', 'admin');
INSERT INTO `userxtmessage` VALUES ('151', 'sa', '59.53.174.175', '2017-06-13 14:10:01', 'admin');
INSERT INTO `userxtmessage` VALUES ('152', 'sa', '223.104.170.73', '2017-06-13 14:13:19', 'admin');
INSERT INTO `userxtmessage` VALUES ('153', 'sa', '59.53.174.175', '2017-06-13 14:17:17', 'admin');
INSERT INTO `userxtmessage` VALUES ('154', 'sa', '59.53.174.175', '2017-06-13 14:18:08', 'admin');
INSERT INTO `userxtmessage` VALUES ('155', 'admin', '59.53.174.175', '2017-06-13 14:20:23', 'admin');
INSERT INTO `userxtmessage` VALUES ('156', 'admin', '59.53.174.175', '2017-06-13 14:38:44', 'admin');
INSERT INTO `userxtmessage` VALUES ('157', 'sa', '59.53.174.175', '2017-06-13 14:41:19', 'admin');
INSERT INTO `userxtmessage` VALUES ('158', 'sa', '59.53.174.175', '2017-06-13 14:52:05', 'admin');
INSERT INTO `userxtmessage` VALUES ('159', 'sa', '59.53.174.175', '2017-06-13 14:53:23', 'admin');
INSERT INTO `userxtmessage` VALUES ('160', 'sa', '59.53.174.175', '2017-06-13 14:53:53', 'admin');
INSERT INTO `userxtmessage` VALUES ('161', 'sa', '59.53.174.175', '2017-06-13 14:57:27', 'admin');
INSERT INTO `userxtmessage` VALUES ('162', 'sa', '59.53.174.175', '2017-06-13 15:06:07', 'admin');
INSERT INTO `userxtmessage` VALUES ('163', 'admin', '59.53.174.175', '2017-06-13 15:15:54', 'admin');
INSERT INTO `userxtmessage` VALUES ('164', 'admin', '59.53.174.175', '2017-06-13 15:15:54', 'admin');
INSERT INTO `userxtmessage` VALUES ('165', 'admin', '59.53.174.175', '2017-06-13 15:15:54', 'admin');
INSERT INTO `userxtmessage` VALUES ('166', 'admin', '59.53.174.175', '2017-06-13 15:16:10', 'admin');
INSERT INTO `userxtmessage` VALUES ('167', 'admin', '59.53.174.175', '2017-06-13 15:17:04', 'admin');
INSERT INTO `userxtmessage` VALUES ('168', 'admin', '59.53.174.175', '2017-06-13 15:17:07', 'admin');
INSERT INTO `userxtmessage` VALUES ('169', '陈星星', '59.53.174.177', '2017-06-13 18:07:37', 'admin');
INSERT INTO `userxtmessage` VALUES ('170', 'admin', '59.53.174.177', '2017-06-13 18:11:35', 'admin');
INSERT INTO `userxtmessage` VALUES ('171', 'sa', '59.53.174.177', '2017-06-13 18:14:33', 'admin');
INSERT INTO `userxtmessage` VALUES ('172', 'sa', '59.53.174.177', '2017-06-13 18:15:33', 'admin');
INSERT INTO `userxtmessage` VALUES ('173', '陈星星', '59.53.174.177', '2017-06-13 18:19:28', 'admin');
INSERT INTO `userxtmessage` VALUES ('174', 'admin', '59.53.174.177', '2017-06-13 18:20:24', 'admin');
INSERT INTO `userxtmessage` VALUES ('175', '陈星星', '59.53.174.177', '2017-06-13 18:30:10', 'admin');
INSERT INTO `userxtmessage` VALUES ('176', 'Ellien', '59.53.174.177', '2017-06-13 18:33:07', 'admin');
INSERT INTO `userxtmessage` VALUES ('177', 'Ellien', '59.53.174.177', '2017-06-13 18:33:33', 'admin');
INSERT INTO `userxtmessage` VALUES ('178', '陈星星', '59.53.174.177', '2017-06-13 19:04:39', 'admin');
INSERT INTO `userxtmessage` VALUES ('179', 'admin', '223.104.170.73', '2017-06-13 19:08:27', 'admin');
INSERT INTO `userxtmessage` VALUES ('180', 'sa', '223.104.170.73', '2017-06-13 19:09:20', 'admin');
INSERT INTO `userxtmessage` VALUES ('181', 'sa', '117.44.185.188', '2017-06-13 19:09:56', 'admin');
INSERT INTO `userxtmessage` VALUES ('182', 'admin', '117.44.185.188', '2017-06-13 19:12:55', 'admin');
INSERT INTO `userxtmessage` VALUES ('183', 'admin', '223.104.170.73', '2017-06-13 19:25:39', 'admin');
INSERT INTO `userxtmessage` VALUES ('184', 'sa', '223.104.170.73', '2017-06-13 19:26:49', 'admin');
INSERT INTO `userxtmessage` VALUES ('185', '陈星星', '223.104.170.73', '2017-06-13 19:45:24', 'admin');
INSERT INTO `userxtmessage` VALUES ('186', 'admin', '223.104.170.73', '2017-06-14 15:12:28', 'admin');
INSERT INTO `userxtmessage` VALUES ('187', 'sa', '223.104.170.73', '2017-06-14 21:01:38', 'admin');
INSERT INTO `userxtmessage` VALUES ('188', '陈星星', '59.53.174.175', '2017-06-14 21:25:00', 'admin');
INSERT INTO `userxtmessage` VALUES ('189', 'admin', '59.53.174.175', '2017-06-14 22:04:23', 'admin');
INSERT INTO `userxtmessage` VALUES ('190', 'sa', '223.104.170.73', '2017-06-14 22:15:25', 'admin');
INSERT INTO `userxtmessage` VALUES ('191', '陈星星', '223.104.170.73', '2017-06-14 22:22:02', 'admin');
INSERT INTO `userxtmessage` VALUES ('192', 'sa', '223.104.170.73', '2017-06-14 22:36:53', 'admin');
INSERT INTO `userxtmessage` VALUES ('193', 'sa', '223.104.170.73', '2017-06-14 22:47:16', 'admin');
INSERT INTO `userxtmessage` VALUES ('194', 'admin', '59.53.174.175', '2017-06-14 23:13:36', 'admin');
INSERT INTO `userxtmessage` VALUES ('195', '陈星星', '59.53.174.175', '2017-06-14 23:13:55', 'admin');
INSERT INTO `userxtmessage` VALUES ('196', 'Ellien', '171.34.223.3', '2017-06-14 23:42:04', 'admin');
INSERT INTO `userxtmessage` VALUES ('197', 'Ellien', '171.34.223.3', '2017-06-14 23:55:21', 'admin');
INSERT INTO `userxtmessage` VALUES ('198', 'sa', '223.104.170.73', '2017-06-15 00:08:47', 'admin');
INSERT INTO `userxtmessage` VALUES ('199', 'admin', '59.53.174.175', '2017-06-15 00:19:16', 'admin');
INSERT INTO `userxtmessage` VALUES ('200', 'sa', '223.104.170.73', '2017-06-15 00:26:02', 'admin');
INSERT INTO `userxtmessage` VALUES ('201', 'sa', '223.104.170.73', '2017-06-15 00:30:04', 'admin');
INSERT INTO `userxtmessage` VALUES ('202', 'sa', '223.104.170.73', '2017-06-15 00:35:05', 'admin');
INSERT INTO `userxtmessage` VALUES ('203', 'admin', '59.53.174.175', '2017-06-15 00:38:17', 'admin');
INSERT INTO `userxtmessage` VALUES ('204', '陈星星', '59.53.174.175', '2017-06-15 00:47:49', 'admin');
INSERT INTO `userxtmessage` VALUES ('205', 'Ellien', '171.34.223.3', '2017-06-15 07:45:37', 'admin');
INSERT INTO `userxtmessage` VALUES ('206', 'sa', '223.104.170.73', '2017-06-15 09:14:12', 'admin');
INSERT INTO `userxtmessage` VALUES ('207', 'sa', '223.104.170.73', '2017-06-15 09:31:33', 'admin');
INSERT INTO `userxtmessage` VALUES ('208', 'sa', '223.104.170.73', '2017-06-15 09:32:48', 'admin');
INSERT INTO `userxtmessage` VALUES ('209', 'sa', '223.104.170.73', '2017-06-15 13:28:19', 'admin');
INSERT INTO `userxtmessage` VALUES ('210', 'sa', '223.104.170.73', '2017-06-15 13:28:21', 'admin');
INSERT INTO `userxtmessage` VALUES ('211', 'sa', '223.104.170.73', '2017-06-15 13:28:32', 'admin');
INSERT INTO `userxtmessage` VALUES ('212', 'sa', '223.104.170.73', '2017-06-15 13:32:38', 'admin');
INSERT INTO `userxtmessage` VALUES ('213', 'sa', '223.104.170.73', '2017-06-15 13:51:34', 'admin');
INSERT INTO `userxtmessage` VALUES ('214', 'sa', '223.104.170.73', '2017-06-15 14:01:10', 'admin');
INSERT INTO `userxtmessage` VALUES ('215', '陈星星', '59.53.174.175', '2017-06-15 14:15:32', 'admin');
INSERT INTO `userxtmessage` VALUES ('216', 'sa', '223.104.170.73', '2017-06-15 14:16:44', 'admin');
INSERT INTO `userxtmessage` VALUES ('217', '陈星星', '59.53.174.175', '2017-06-15 14:17:24', 'admin');
INSERT INTO `userxtmessage` VALUES ('218', 'sa', '223.104.170.73', '2017-06-15 14:32:49', 'admin');
INSERT INTO `userxtmessage` VALUES ('219', '陈星星', '59.53.174.175', '2017-06-15 14:41:36', 'admin');
INSERT INTO `userxtmessage` VALUES ('220', 'sa', '223.104.170.73', '2017-06-15 15:14:59', 'admin');
INSERT INTO `userxtmessage` VALUES ('221', 'sa', '223.104.170.73', '2017-06-15 15:15:06', 'admin');
INSERT INTO `userxtmessage` VALUES ('222', 'sa', '223.104.170.73', '2017-06-15 15:15:06', 'admin');
INSERT INTO `userxtmessage` VALUES ('223', '陈星星', '59.53.174.175', '2017-06-15 15:23:35', 'admin');
INSERT INTO `userxtmessage` VALUES ('224', '陈星星', '59.53.174.175', '2017-06-15 15:32:28', 'admin');
INSERT INTO `userxtmessage` VALUES ('225', '陈星星', '59.53.174.175', '2017-06-15 15:57:48', 'admin');
INSERT INTO `userxtmessage` VALUES ('226', 'sa', '223.104.170.73', '2017-06-15 17:27:47', 'admin');
INSERT INTO `userxtmessage` VALUES ('227', '星星', '223.104.170.73', '2017-06-15 17:31:33', 'admin');
INSERT INTO `userxtmessage` VALUES ('228', 'sa', '223.104.170.73', '2017-06-15 17:51:32', 'admin');
INSERT INTO `userxtmessage` VALUES ('229', 'Ellien', '59.53.174.241', '2017-06-17 09:16:12', 'admin');
INSERT INTO `userxtmessage` VALUES ('230', '陈星星', '59.53.174.241', '2017-06-17 10:29:32', 'admin');
INSERT INTO `userxtmessage` VALUES ('231', '陈星星', '59.53.174.177', '2017-06-17 12:17:13', 'admin');
INSERT INTO `userxtmessage` VALUES ('232', '陈星星', '59.53.174.177', '2017-06-17 12:25:47', 'admin');
INSERT INTO `userxtmessage` VALUES ('233', 'admin', '59.53.174.177', '2017-06-17 12:42:18', 'admin');
INSERT INTO `userxtmessage` VALUES ('234', 'sa', '59.53.174.177', '2017-06-17 13:06:32', 'admin');
INSERT INTO `userxtmessage` VALUES ('235', 'admin', '59.53.174.177', '2017-06-17 13:11:07', 'admin');
INSERT INTO `userxtmessage` VALUES ('236', 'sa', '223.104.170.238', '2017-06-17 14:03:12', 'admin');
INSERT INTO `userxtmessage` VALUES ('237', 'sa', '223.104.170.238', '2017-06-17 14:10:01', 'admin');
INSERT INTO `userxtmessage` VALUES ('238', 'admin', '59.53.174.177', '2017-06-17 14:56:12', 'admin');
INSERT INTO `userxtmessage` VALUES ('239', 'admin', '59.53.174.177', '2017-06-17 15:30:36', 'admin');
INSERT INTO `userxtmessage` VALUES ('240', 'sa', '59.53.174.177', '2017-06-17 16:32:14', 'admin');
INSERT INTO `userxtmessage` VALUES ('241', 'sa', '59.53.174.175', '2017-06-18 12:30:51', 'admin');
INSERT INTO `userxtmessage` VALUES ('242', 'admin', '59.53.174.175', '2017-06-18 12:37:41', 'admin');
INSERT INTO `userxtmessage` VALUES ('243', 'sa', '59.53.174.177', '2017-06-18 16:40:13', 'admin');
INSERT INTO `userxtmessage` VALUES ('244', 'admin', '59.53.174.177', '2017-06-18 17:04:50', 'admin');
INSERT INTO `userxtmessage` VALUES ('245', 'sa', '223.104.170.88', '2017-06-19 08:37:14', 'admin');
INSERT INTO `userxtmessage` VALUES ('246', 'sa', '223.104.170.88', '2017-06-19 08:45:42', 'admin');
INSERT INTO `userxtmessage` VALUES ('247', 'sa', '223.104.170.88', '2017-06-19 08:56:17', 'admin');
INSERT INTO `userxtmessage` VALUES ('248', 'sa', '223.104.170.88', '2017-06-19 09:13:16', 'admin');
INSERT INTO `userxtmessage` VALUES ('249', 'sa', '223.104.170.88', '2017-06-21 02:08:27', 'admin');
INSERT INTO `userxtmessage` VALUES ('250', 'sa', '223.104.170.88', '2017-06-21 11:57:39', 'admin');
INSERT INTO `userxtmessage` VALUES ('251', 'sa', '223.104.170.88', '2017-06-21 21:19:11', 'admin');
INSERT INTO `userxtmessage` VALUES ('252', 'admin', '59.52.222.152', '2017-06-21 21:33:26', 'admin');
INSERT INTO `userxtmessage` VALUES ('253', 'sa', '223.104.170.248', '2017-06-23 19:27:33', 'admin');
INSERT INTO `userxtmessage` VALUES ('254', '陈星星', '223.104.170.248', '2017-06-23 19:33:48', 'admin');
INSERT INTO `userxtmessage` VALUES ('255', 'sa', '223.104.170.248', '2017-06-23 19:36:18', 'admin');
INSERT INTO `userxtmessage` VALUES ('256', 'sa', '223.104.170.248', '2017-06-23 19:38:20', 'admin');
INSERT INTO `userxtmessage` VALUES ('257', 'sa', '223.104.170.248', '2017-06-23 19:42:11', 'admin');
INSERT INTO `userxtmessage` VALUES ('258', 'sa', '223.104.170.248', '2017-06-23 19:42:40', 'admin');
INSERT INTO `userxtmessage` VALUES ('259', 'sa', '223.104.10.181', '2017-06-29 09:16:51', 'admin');
INSERT INTO `userxtmessage` VALUES ('260', 'sa', '223.104.10.181', '2017-06-30 11:59:23', 'admin');
INSERT INTO `userxtmessage` VALUES ('261', 'sa', '223.104.10.181', '2017-06-30 12:00:27', 'admin');
INSERT INTO `userxtmessage` VALUES ('262', '陈星星', '110.87.71.20', '2017-07-05 12:21:38', 'admin');
INSERT INTO `userxtmessage` VALUES ('263', '陈星星', '110.87.71.20', '2017-07-05 12:21:58', 'admin');
INSERT INTO `userxtmessage` VALUES ('264', '陈星星', '223.104.174.162', '2017-07-21 09:47:11', 'admin');
INSERT INTO `userxtmessage` VALUES ('265', '陈星星', '223.104.174.126', '2017-07-21 11:20:06', 'admin');
INSERT INTO `userxtmessage` VALUES ('266', '陈星星', '39.169.112.25', '2017-07-25 20:24:23', 'admin');
INSERT INTO `userxtmessage` VALUES ('267', '饶满秀', '39.169.97.65', '2017-08-07 18:46:33', 'admin');
INSERT INTO `userxtmessage` VALUES ('268', '饶满秀', '39.169.97.65', '2017-08-07 18:48:03', 'admin');
INSERT INTO `userxtmessage` VALUES ('269', '饶满秀', '39.169.97.65', '2017-08-07 18:48:13', 'admin');
INSERT INTO `userxtmessage` VALUES ('270', 'admin', '223.104.31.198', '2017-08-22 00:48:12', 'admin');
INSERT INTO `userxtmessage` VALUES ('271', '饶满秀', '223.104.10.155', '2017-09-23 22:20:17', 'admin');
INSERT INTO `userxtmessage` VALUES ('272', 'sa', '223.104.170.179', '2017-09-25 22:11:05', 'admin');
INSERT INTO `userxtmessage` VALUES ('273', 'admin', '223.104.170.179', '2017-09-25 22:33:49', 'admin');
INSERT INTO `userxtmessage` VALUES ('274', 'sa', '223.104.170.179', '2017-09-25 22:35:59', 'admin');
INSERT INTO `userxtmessage` VALUES ('275', 'sa', '223.104.170.179', '2017-09-25 22:37:47', 'admin');
INSERT INTO `userxtmessage` VALUES ('276', '饶满秀', '223.104.170.179', '2017-09-25 22:40:51', 'admin');
INSERT INTO `userxtmessage` VALUES ('277', 'admin', '202.101.209.97', '2017-10-10 14:44:48', 'admin');
INSERT INTO `userxtmessage` VALUES ('278', 'admin', '202.101.209.108', '2017-11-20 20:25:58', 'admin');
INSERT INTO `userxtmessage` VALUES ('279', 'admin', '220.175.138.30', '2017-11-20 20:49:52', 'admin');
INSERT INTO `userxtmessage` VALUES ('280', 'admin', '220.175.138.30', '2017-11-20 22:12:07', 'admin');
INSERT INTO `userxtmessage` VALUES ('281', 'admin', '39.178.146.99', '2017-11-20 23:32:58', 'admin');
INSERT INTO `userxtmessage` VALUES ('282', 'admin', '223.104.170.98', '2017-11-21 14:53:09', 'admin');
INSERT INTO `userxtmessage` VALUES ('283', 'admin', '223.104.170.98', '2017-11-21 15:01:24', 'admin');
INSERT INTO `userxtmessage` VALUES ('284', 'admin', '223.104.170.98', '2017-11-22 14:43:54', 'admin');
