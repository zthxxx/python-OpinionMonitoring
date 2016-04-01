/*
Navicat MySQL Data Transfer

Source Server         : localhost_test
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : news_processor

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-03-30 19:57:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for newsdetails
-- ----------------------------
DROP TABLE IF EXISTS `newsdetails`;
CREATE TABLE `newsdetails` (
  `Title` varchar(255) DEFAULT '',
  `NoPunctuationTitle` varchar(255) DEFAULT '',
  `Url` varchar(255) DEFAULT '',
  `Summary` varchar(255) DEFAULT '',
  `Time` datetime DEFAULT NULL,
  `isAccident` bit(1) DEFAULT NULL,
  `UrlHash` varchar(255) NOT NULL DEFAULT '',
  `TitleHash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UrlHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of newsdetails
-- ----------------------------
INSERT INTO `newsdetails` VALUES ('精神病母亲不辞而别 自贡着急父子俩踏上寻找路', '精神病母亲不辞而别自贡着急父子俩踏上寻找路', 'http://cd.qq.com/a/20160308/054108.htm', null, '2016-03-08 14:59:51', '', '0162461a3150a50be985043d6fa8b25b', '73d7b5a56a9dd795ef5d69a9f709bb07');
INSERT INTO `newsdetails` VALUES ('南充一小偷销赃途中被失主发现 报警将其抓获(图)', '南充一小偷销赃途中被失主发现报警将其抓获', 'http://cd.qq.com/a/20160330/033207.htm', null, '2016-03-30 11:59:00', '', '01fb018469d60dcb4b15f849675871d6', '69a475e4d76bb1bdd85718bcd3b8d145');
INSERT INTO `newsdetails` VALUES ('市民质疑：自贡交警在路面上执勤时在玩手机(图)', '市民质疑自贡交警在路面上执勤时在玩手机', 'http://cd.qq.com/a/20160316/039622.htm', null, '2016-03-16 15:18:05', '', '06443dcfeace2c95946d9fb31c146eff', '6c01b530a802e17cc0e171e1228682d3');
INSERT INTO `newsdetails` VALUES ('贡井国税：“聊天模式”服务纳税人', '贡井国税聊天模式服务纳税人', 'http://zg.newssc.org/system/20160315/001869549.html', null, '2016-03-15 13:17:43', '\0', '07f720daaf0e0df09e6f4520d1209ce5', '19f77d0bd168af9709a68d88108c85e4');
INSERT INTO `newsdetails` VALUES ('女子患轻微智障绵阳走失 丈夫全城急寻妻子', '女子患轻微智障绵阳走失丈夫全城急寻妻子', 'http://cd.qq.com/a/20160330/029959.htm', null, '2016-03-30 11:16:00', '', '084527e42e453aeccc637d641137facb', '7316495bd0fb4b427cb2d3187b1c315b');
INSERT INTO `newsdetails` VALUES ('自贡一男子酒驾撞车打民警 因妨碍执行公务被刑拘', '自贡一男子酒驾撞车打民警因妨碍执行公务被刑拘', 'http://cd.qq.com/a/20160328/031294.htm', null, '2016-03-28 11:54:34', '', '085c75c0c0c9677cc55c8f7108915dfd', 'cac971d8c7a812c6e997cf7c79a10858');
INSERT INTO `newsdetails` VALUES ('四川4月1日起正式施行驾考新规 取消单边桥考试', '四川月日起正式施行驾考新规取消单边桥考试', 'http://cd.qq.com/a/20160330/044239.htm', null, '2016-03-30 15:26:00', '\0', '087a80c55a111196dbfb1f7d81f83188', '856526b2f65102b06bbdadd5d91a740f');
INSERT INTO `newsdetails` VALUES ('彭庙镇组织开展“党委书记讲党课”活动', '彭庙镇组织开展党委书记讲党课活动', 'http://zg.newssc.org/system/20160317/001871824.html', null, '2016-03-17 11:01:34', '', '089d85b462c28edde8d800374f0dddd0', 'a29db5a2a6d7a972227870f97f2deadd');
INSERT INTO `newsdetails` VALUES ('四川各市州消费者满意度：资阳最高 自贡最低', '四川各市州消费者满意度资阳最高自贡最低', 'http://cd.qq.com/a/20160314/039908.htm', null, '2016-03-14 11:38:30', '', '0917c7e9bdf6bbc4e0265f3805a7ff19', '00081419d8b057636e1b2c60620c14f5');
INSERT INTO `newsdetails` VALUES ('自贡去年贪污贿赂渎职等职务犯罪案件29件', '自贡去年贪污贿赂渎职等职务犯罪案件件', 'http://cd.qq.com/a/20160226/012236.htm', null, '2016-02-26 08:07:30', '', '093b732334efa073cf74a762dfc5fecf', 'f04de0c394e67ff7bdcde331a30226ca');
INSERT INTO `newsdetails` VALUES ('自贡童寺镇古代墓葬群启动挖掘 疑因水库蓄水被淹没', '自贡童寺镇古代墓葬群启动挖掘疑因水库蓄水被淹没', 'http://cd.qq.com/a/20160323/044075.htm', null, '2016-03-23 14:39:14', '', '0a2a7a19cc364eee450f40da929c06d5', '9262755edd626335bb1a3e98ccbf43b6');
INSERT INTO `newsdetails` VALUES ('广元公布今年食品抽检信息 3批次大米因铬超标不合格', '广元公布今年食品抽检信息批次大米因铬超标不合格', 'http://cd.qq.com/a/20160330/042899.htm', null, '2016-03-30 15:04:00', '\0', '0af0a078cdee2b6b8290c6467e7c3352', 'df3d68cd9681da00f9facf1bc54dcc24');
INSERT INTO `newsdetails` VALUES ('富顺县采取“线上+线下”模式强推网吧行业监管', '富顺县采取线上线下模式强推网吧行业监管', 'http://zg.newssc.org/system/20160317/001871816.html', null, '2016-03-17 11:00:46', '', '116cc6d823c711c70ea0e176b31a886c', '114703abc85502d8c31ab3f9fbb84de9');
INSERT INTO `newsdetails` VALUES ('成都检查傍\"华西\"医疗机构 26家美容医院广告违法', '成都检查傍华西医疗机构家美容医院广告违法', 'http://cd.qq.com/a/20160330/042754.htm', null, '2016-03-30 15:02:00', '\0', '1a347e274631cc21331073ff155166b4', '7fff7e5cd2c94b62ec2bef9768bd66f6');
INSERT INTO `newsdetails` VALUES ('“地震”来临 居民赶紧撤离 市防震减灾局开展地震应急演练', '地震来临居民赶紧撤离市防震减灾局开展地震应急演练', 'http://www.zgm.cn/html/a/2016/0329/119247.html', null, '2016-03-29 00:00:00', '\0', '1d50f74d119c7409f8d179eb4dd2a668', 'faf6d31eabf7d1bbc295463a310006f7');
INSERT INTO `newsdetails` VALUES ('自贡女孩帮聋哑母亲寻亲生父母 离散26年后团聚(图)', '自贡女孩帮聋哑母亲寻亲生父母离散年后团聚', 'http://cd.qq.com/a/20160303/021403.htm', null, '2016-03-03 09:44:20', '', '1e575690aa8789fbfc4509dbc44da429', 'fffe247b1461e9a85b456783932224f3');
INSERT INTO `newsdetails` VALUES ('组图：立春后峨眉山下大雪 银装素裹如仙境 ', '组立春后峨眉山下大雪银装素裹如仙境', 'http://cd.qq.com/a/20160330/042615.htm', null, '2016-03-30 15:00:00', '\0', '1eddee11c2c6e46f24fa32b423e988c5', '011b63c3f14dc5086ba4c4fde757d01f');
INSERT INTO `newsdetails` VALUES ('自贡72岁老父长年被儿子家暴 申请“保护令”(图)', '自贡岁老父长年被儿子家暴申请保护令', 'http://cd.qq.com/a/20160316/006208.htm', null, '2016-03-16 07:38:25', '', '20ef0fd91064f60065d18422b043ec51', 'b39c512c6e3b2bba3e7e00bfdabd89a5');
INSERT INTO `newsdetails` VALUES ('为案件寻找证据 在证据中抽丝剥茧记刑事侦查的幕后英雄贡井分局刑事科学技术室', '为案件寻找证据在证据中抽丝剥茧记刑事侦查的幕后英雄贡井分局刑事科学技术室', 'http://zg.newssc.org/system/20160330/001883741.html', null, '2016-03-30 17:33:51', '', '212424419ec60d679baf79b83fd08084', '7392025d90057d6b51a1cc8ea1625a5a');
INSERT INTO `newsdetails` VALUES ('自贡女子网恋闪婚频被家暴 女方申请人身保护令', '自贡女子网恋闪婚频被家暴女方申请人身保护令', 'http://cd.qq.com/a/20160330/011531.htm', null, '2016-03-30 07:42:29', '', '27cf390dfe40c9f5908c663258a75ae8', '4b20c78523bc24d6614f081ffcd414b8');
INSERT INTO `newsdetails` VALUES ('绵阳一男子驾驶摩托车雨天滑倒 昏厥十几秒才清醒(图)', '绵阳一男子驾驶摩托车雨天滑倒昏厥十几秒才清醒', 'http://cd.qq.com/a/20160330/032629.htm', null, '2016-03-30 11:51:00', '', '2aa6ebafa52705b3bf731b7fdfe12042', 'a5d27e753ff313d413b726eb8fac7be9');
INSERT INTO `newsdetails` VALUES ('自贡女子被抢劫和猥亵 疑犯有四次前科作案只因无聊', '自贡女子被抢劫和猥亵疑犯有四次前科作案只因无聊', 'http://cd.qq.com/a/20160325/045393.htm', null, '2016-03-25 16:17:04', '', '2aaf1069cec9c46a2670ea83be8f5abf', '8b593ec4add86bacc5c482b7962f77f7');
INSERT INTO `newsdetails` VALUES ('自贡瘾君子邀人在家吸毒 为避处罚憋尿16小时', '自贡瘾君子邀人在家吸毒为避处罚憋尿小时', 'http://cd.qq.com/a/20160311/024501.htm', null, '2016-03-11 10:22:38', '', '2bad96a46df21efbc1c5ab4c2f5ad842', '429bac2646d9a8922f5c05a075461129');
INSERT INTO `newsdetails` VALUES ('大安政委胡世荣深入派出所开展调研', '大安政委胡世荣深入派出所开展调研', 'http://zg.newssc.org/system/20160324/001878008.html', null, '2016-03-24 11:10:36', '', '2dfdd0cd384d243fd9b704732477969f', '4142b5dbac99772ee05c7f6dcf7b1fcc');
INSERT INTO `newsdetails` VALUES ('怀德镇召开2016年城乡环境综合治理会议', '怀德镇召开年城乡环境综合治理会议', 'http://zg.newssc.org/system/20160317/001871823.html', null, '2016-03-17 11:00:46', '\0', '2f8777fdefd25b000063da50a959c6db', 'e80da4b614fa47382e261fb68e5e64a2');
INSERT INTO `newsdetails` VALUES ('自贡老人申请保护令续：家暴儿子被禁接触老人(图)', '自贡老人申请保护令续家暴儿子被禁接触老人', 'http://cd.qq.com/a/20160320/007911.htm', null, '2016-03-20 08:19:25', '', '386e85ab5b019d027877367b57a94125', 'f947dea495223974df7f7b6e26d083e2');
INSERT INTO `newsdetails` VALUES ('南充年轻女子疑与婆家闹矛盾 欲跳江轻生', '南充年轻女子疑与婆家闹矛盾欲跳江轻生', 'http://cd.qq.com/a/20160330/029155.htm', null, '2016-03-30 11:06:00', '', '391beb74d3b2e2128a627b7b985dca2f', '8487df6a286b0b3a50c58f7d137a928b');
INSERT INTO `newsdetails` VALUES ('自贡教师肝癌去世捐眼角膜 曾获国务院表彰奖励(图)', '自贡教师肝癌去世捐眼角膜曾获国务院表彰奖励', 'http://cd.qq.com/a/20160303/013370.htm', null, '2016-03-03 08:10:16', '', '3c0d6085fe9b114f64b0a5bf798ee2ef', '9bdb21f3b404d8a2d39f3a134d433724');
INSERT INTO `newsdetails` VALUES ('“偷鸡摸鸭”败露 小偷锒铛入狱', '偷鸡摸鸭败露小偷锒铛入狱', 'http://www.zgm.cn/html/a/2016/0329/119245.html', null, '2016-03-29 00:00:00', '', '3e56128dcc5a3ae39d04f3794c22575c', '0d3d7e0fc62280af0d782720f14dd944');
INSERT INTO `newsdetails` VALUES ('资中一公交车行驶途中自燃 执勤交警疾速灭火', '资中一公交车行驶途中自燃执勤交警疾速灭火', 'http://cd.qq.com/a/20160330/029545.htm', null, '2016-03-30 11:11:00', '', '3f95af9bbc817e66f218fa014c716825', '15841fe476122fef3bb1e6a4f63aac69');
INSERT INTO `newsdetails` VALUES ('凉高山街召开集体廉政谈话会', '凉高山街召开集体廉政谈话会', 'http://zg.newssc.org/system/20160318/001873189.html', null, '2016-03-18 13:58:59', '', '3fc2e102b00099b96451286be2db02ce', 'd0c0f1445a9b822fa502a15171169465');
INSERT INTO `newsdetails` VALUES ('四川达州发生暴力拒捕夺枪案 一人被抓一人在逃(图)', '四川达州发生暴力拒捕夺枪案一人被抓一人在逃', 'http://cd.qq.com/a/20160330/033280.htm', null, '2016-03-30 12:00:00', '', '400685c7d414e67941703e07cb2073a7', '9067f2fea96d45377e0f2fd0a0b6574b');
INSERT INTO `newsdetails` VALUES ('共促绿色发展共建生态自贡 沿滩区开展义务植树活动', '共促绿色发展共建生态自贡沿滩区开展义务植树活动', 'http://zg.newssc.org/system/20160314/001868935.html', null, '2016-03-14 23:11:48', '', '4130a3ba8104c1293271302cc9d3c53a', 'e149ab6ca8c0d09d72817df3d672b571');
INSERT INTO `newsdetails` VALUES ('沿滩警方在“刘山樱花节”执勤活动中勇救溺水儿童', '沿滩警方在刘山樱花节执勤活动中勇救溺水儿童', 'http://zg.newssc.org/system/20160328/001881319.html', null, '2016-03-29 08:09:31', '', '41d338e4063d1361f622428201c9d5d7', '148f90ac7c06eb38441e549319cdf033');
INSERT INTO `newsdetails` VALUES ('自贡市刑事技术工作会在沿滩公安分局召开', '自贡市刑事技术工作会在沿滩公安分局召开', 'http://zg.newssc.org/system/20160317/001871728.html', null, '2016-03-17 10:37:24', '', '478f5a0ad4aba4c529ee9b1565d35f3a', 'a42283e4b42db12e5c8acdb02ce4dc1d');
INSERT INTO `newsdetails` VALUES ('自贡面包与货车雨夜相撞2死 未满周岁婴儿死亡(图)', '自贡面包与货车雨夜相撞死未满周岁婴儿死亡', 'http://cd.qq.com/a/20160324/010260.htm', null, '2016-03-24 07:50:19', '', '50b119e8bcef465c94f70449c4a267a4', 'e584c60e6c2eecc88c78fb696373ae84');
INSERT INTO `newsdetails` VALUES ('自贡普通学生变学霸被哥大录取 成奥巴马校友(图)', '自贡普通学生变学霸被哥大录取成奥巴马校友', 'http://cd.qq.com/a/20160323/013634.htm', null, '2016-03-23 07:53:34', '', '5169040afe9e2afc4faf70b1bd4b55a3', '4ddacc8a42efd94207423da7b54a9749');
INSERT INTO `newsdetails` VALUES ('自贡20名幼儿呕吐入院续：初步判定为诺如病毒感染', '自贡名幼儿呕吐入院续初步判定为诺如病毒感染', 'http://cd.qq.com/a/20160330/043267.htm', null, '2016-03-30 15:10:00', '', '52cadf9d2b3e8b79cc8e7aa3a232f8f4', '95e38fa10c895c0e74f4c5d5a7a7ec08');
INSERT INTO `newsdetails` VALUES ('自贡一大货车逃避“超限”检查 车强行冲关逃费被重罚', '自贡一大货车逃避超限检查车强行冲关逃费被重罚', 'http://cd.qq.com/a/20160330/043326.htm', null, '2016-03-30 15:11:00', '', '539f6b77e548c11b4f0862db5353d08f', '23e8e24cb5cf1348c3b04fc9574192c5');
INSERT INTO `newsdetails` VALUES ('两人在自贡ATM机上安装设备 储户8万被复制后盗取', '两人在自贡机上安装设备储户万被复制后盗取', 'http://cd.qq.com/a/20160317/024786.htm', null, '2016-03-17 10:25:28', '', '54ca6b8ff688237dbe4579e84730b128', 'bebb51ac56754b206dd34845c5f3267a');
INSERT INTO `newsdetails` VALUES ('富顺县财政局“五着力”谋划开局之年', '富顺县财政局五着力谋划开局之年', 'http://zg.newssc.org/system/20160317/001871814.html', null, '2016-03-17 10:58:39', '\0', '5b42b8c25019d9e0ed9f6279fc0b47b1', 'c932290bcea6ec6096fb7c43c0a4337d');
INSERT INTO `newsdetails` VALUES ('自贡一酒店游客被困20余分钟 脱困后打砸前台物品(图)', '自贡一酒店游客被困余分钟脱困后打砸前台物品', 'http://cd.qq.com/a/20160223/010648.htm', null, '2016-02-23 07:50:08', '', '5d56ae25a5e47cdd44e74e40387fd34c', 'dc19285eb9a28f6a0010807b5c07096d');
INSERT INTO `newsdetails` VALUES ('大安区副区长、公安分局局长吴革深入关帝村开展精准扶贫', '大安区副区长公安分局局长吴革深入关帝村开展精准扶贫', 'http://zg.newssc.org/system/20160324/001878004.html', null, '2016-03-24 11:10:42', '\0', '5d8e48e15895ec207f908fe3e6419769', 'ade6d357ce3b805473cfac5b62bdd555');
INSERT INTO `newsdetails` VALUES ('建立防控机制确保空气改善 大安区齐抓共管大气污染防治', '建立防控机制确保空气改善大安区齐抓共管大气污染防治', 'http://zg.newssc.org/system/20160322/001876261.html', null, '2016-03-23 08:08:47', '\0', '5e8b1ba2327c391da1ae031e2c44365d', '77e5c378c674556f5568671620a1ac8d');
INSERT INTO `newsdetails` VALUES ('成都清水河突现落水车辆 车主下落不明', '成都清水河突现落水车辆车主下落不明', 'http://cd.qq.com/a/20160330/051424.htm', null, '2016-03-30 17:54:00', '\0', '5eb125969c8482af70af651a08807aab', 'e8140ab0d8db04d576228ffb9b708ba0');
INSERT INTO `newsdetails` VALUES ('自贡一医院医生自制“呼吸机”抢救新生儿(图)', '自贡一医院医生自制呼吸机抢救新生儿', 'http://cd.qq.com/a/20160322/054332.htm', null, '2016-03-22 16:23:16', '', '5f88205df02cb483d9c54c93c6724d03', '34e71b3cd2302a3f3bf722ca49c5b794');
INSERT INTO `newsdetails` VALUES ('沿滩公安在“反盗窃惠民生”行动中持续发力抓获数名吸毒人员', '沿滩公安在反盗窃惠民生行动中持续发力抓获数名吸毒人员', 'http://zg.newssc.org/system/20160317/001871720.html', null, '2016-03-17 10:36:19', '', '5fa383d1b7098578297f6b4f4de183f0', '2e1e6b39ce014ed99b144e8a6cbc2e4b');
INSERT INTO `newsdetails` VALUES ('网传自贡一载学生面包车翻下河 官方：消息不实(图)', '网传自贡一载学生面包车翻下河官方消息不实', 'http://cd.qq.com/a/20160328/045332.htm', null, '2016-03-28 15:48:54', '', '60dd4c1ec1da141979b2ba7d6ac4bb37', '1bd69b51c6b5a301802f340e42754704');
INSERT INTO `newsdetails` VALUES ('大安分局民警校君被评为2015年度四川省“岗位学雷锋敬业标兵”', '大安分局民警校君被评为年度四川省岗位学雷锋敬业标兵', 'http://zg.newssc.org/system/20160324/001878013.html', null, '2016-03-24 11:13:26', '', '63b8aaa386d686fa707c2a9e6059cc48', '038e9718d09818103f121c1202d2c671');
INSERT INTO `newsdetails` VALUES ('自贡六旬老汉喜得娇妻 妻做贼偷耕牛讨好情夫', '自贡六旬老汉喜得娇妻妻做贼偷耕牛讨好情夫', 'http://cd.qq.com/a/20160329/042083.htm', null, '2016-03-29 14:39:02', '', '655353f3f1e32c0dea97a2e10360c134', 'dfcee134a5005ee9d8142f9ccfe590db');
INSERT INTO `newsdetails` VALUES ('凉山警方到自贡市沿滩公安分局考察交流工作', '凉山警方到自贡市沿滩公安分局考察交流工作', 'http://zg.newssc.org/system/20160328/001881320.html', null, '2016-03-29 08:09:31', '', '6692eb1d2ba6291c7ce04d832e973e47', '139bb1b5890fd01dd536621191f5fd43');
INSERT INTO `newsdetails` VALUES ('自贡大安一面包车与货车相撞 造成多人受伤', '自贡大安一面包车与货车相撞造成多人受伤', 'http://cd.qq.com/a/20160323/026161.htm', null, '2016-03-23 10:04:05', '', '67c5286b03f129856a32549bfe22acf9', 'bd9a113c0df7ac4b2653fc5241098c64');
INSERT INTO `newsdetails` VALUES ('黄润秋辞去四川省人大常委会副主任职务 ', '黄润秋辞去四川省人大常委会副主任职务', 'http://cd.qq.com/a/20160330/043067.htm', null, '2016-03-30 15:06:00', '\0', '6bd748ea31be78e6f162800232ba4c34', '0e4a2002b81a93a375323fb67614283d');
INSERT INTO `newsdetails` VALUES ('绵阳“猖狂”司机无证毒驾报废汽车 车内被改装成卧室 ', '绵阳猖狂司机无证毒驾报废汽车车内被改装成卧室', 'http://cd.qq.com/a/20160330/031829.htm', null, '2016-03-30 11:40:00', '', '6d28342a0757a87e6cc9217ccbdf9b66', '035a63ddbbcdfdabd62610d2b8ded491');
INSERT INTO `newsdetails` VALUES ('自井分局经侦抓获一名涉嫌信用卡诈骗的上网逃犯', '自井分局经侦抓获一名涉嫌信用卡诈骗的上网逃犯', 'http://zg.newssc.org/system/20160327/001880082.html', null, '2016-03-27 13:44:13', '', '6d363e22cb5c9a9cfbbf3f1d72770732', '74fe5eead917c42796b4197ac34ca15e');
INSERT INTO `newsdetails` VALUES ('第二届中国（广东）国际“互联网+”博览会10月开幕', '第二届中国广东国际互联网博览会月开幕', 'http://cd.qq.com/a/20160330/041788.htm', null, '2016-03-30 14:47:00', '\0', '6da54a928d5b48aef55e0864c5a5b0dc', 'a994a46a19c10a189d7419275d827f68');
INSERT INTO `newsdetails` VALUES ('自贡市公安机关圆满完成第22届灯会安保工作任务', '自贡市公安机关圆满完成第届灯会安保工作任务', 'http://zg.newssc.org/system/20160324/001877888.html', null, '2016-03-24 10:40:10', '\0', '6f7d24611d28f4b0774ca8d6f97bf3ff', '3b2a483492acab28a60e087fe46aa697');
INSERT INTO `newsdetails` VALUES ('30日绵阳平武气温提升 大地依旧被厚厚冰雪覆盖(图)', '日绵阳平武气温提升大地依旧被厚厚冰雪覆盖', 'http://cd.qq.com/a/20160330/031115.htm', null, '2016-03-30 11:30:00', '', '6fd32b44625975448ffa99ecddbb95d7', 'b65e1c656581b2d107cb55df3dd169c9');
INSERT INTO `newsdetails` VALUES ('宜宾、雅安等五地市警方到沿滩分局考察交流建设工作', '宜宾雅安等五地市警方到沿滩分局考察交流建设工作', 'http://zg.newssc.org/system/20160318/001873195.html', null, '2016-03-18 14:01:56', '\0', '72ece65ae9dcbaa2affbed9b370819f7', '0dfc9abc1c7374abce4fbab817c2cb22');
INSERT INTO `newsdetails` VALUES ('自流井分局“反盗窃、惠民生”专项治理工作显成效', '自流井分局反盗窃惠民生专项治理工作显成效', 'http://zg.newssc.org/system/20160322/001876260.html', null, '2016-03-23 08:08:47', '\0', '764e4cc5b8e425775853fb514c0fc078', 'd3994bb366bbb9218703117a36944613');
INSERT INTO `newsdetails` VALUES ('自贡男子与父亲因琐事争吵 用砖头将父亲打死', '自贡男子与父亲因琐事争吵用砖头将父亲打死', 'http://cd.qq.com/a/20160222/037541.htm', null, '2016-02-22 14:12:11', '', '76d07a3f0d607c589296327154667f3a', '446086cb83b2346e6f2b66937f8f9022');
INSERT INTO `newsdetails` VALUES ('自贡市召开自贡市公安工作会', '自贡市召开自贡市公安工作会', 'http://zg.newssc.org/system/20160317/001871943.html', null, '2016-03-17 12:01:13', '', '77904daf1d7904d644d087b70e447fe3', 'c23ebad7159a5d6a7d13990442ce5df0');
INSERT INTO `newsdetails` VALUES ('面对“电信网络诈骗” 自贡警方教你如何轻松防骗', '面对电信网络诈骗自贡警方教你如何轻松防骗', 'http://zg.newssc.org/system/20160322/001875637.html', null, '2016-03-22 11:07:57', '', '7ab6de38146b51054404cc7ec83d2bf0', 'd52f692fd4cd81d4f7b61a194b5ce509');
INSERT INTO `newsdetails` VALUES ('自贡一仓库非法储存6000余箱烟花爆竹 嫌疑人被刑拘', '自贡一仓库非法储存余箱烟花爆竹嫌疑人被刑拘', 'http://cd.qq.com/a/20160308/018468.htm', null, '2016-03-08 07:59:06', '', '7ace170167d185b8c1bd440d89bef0eb', '2a03c91160c265310daed3876d84daab');
INSERT INTO `newsdetails` VALUES ('成都一小车引擎冒烟自燃 车主前1分钟刚下车(图)', '成都一小车引擎冒烟自燃车主前分钟刚下车', 'http://cd.qq.com/a/20160330/043706.htm', null, '2016-03-30 15:17:00', '\0', '7e2d9737676176dd9b2925952ca70f7e', '9992e7c1348a557c81605966dcf924e7');
INSERT INTO `newsdetails` VALUES ('达州弑父分尸案：儿子毒杀生父 分尸焚烧(图)', '达州弑父分尸案儿子毒杀生父分尸焚烧', 'http://cd.qq.com/a/20160330/044706.htm', null, '2016-03-30 15:35:00', '', '7e7cddf39dd51de650f8e0ffbbeb5af0', '947888e8b47505ff03ed62c514f531e0');
INSERT INTO `newsdetails` VALUES ('自贡面包车坠入河中警民联手救援 被困男子身亡', '自贡面包车坠入河中警民联手救援被困男子身亡', 'http://cd.qq.com/a/20160329/043921.htm', null, '2016-03-29 15:11:55', '', '80c8aaa9a63cce378fa678a456a24723', '648acea4fd7435a60c86d250b902d167');
INSERT INTO `newsdetails` VALUES ('宜宾男子持刀割伤母亲子女后自杀 警方及时救下4人', '宜宾男子持刀割伤母亲子女后自杀警方及时救下人', 'http://cd.qq.com/a/20160330/029336.htm', null, '2016-03-30 11:08:00', '', '816298ad18baaaaaa6dbdcd3b4fcd5ad', '8314c495ad586134d1530734967701bc');
INSERT INTO `newsdetails` VALUES ('“飞贼”一个月作案39起 自贡警方三进凉山终破案', '飞贼一个月作案起自贡警方三进凉山终破案', 'http://cd.qq.com/a/20160226/012444.htm', null, '2016-02-26 08:09:41', '', '81714777959167fd2a645fc1b87bd8f2', 'f97a053a90f376e4cccb296bda42f675');
INSERT INTO `newsdetails` VALUES ('高硐派出所开展“服务进社区”活动受到辖区群众好评', '高硐派出所开展服务进社区活动受到辖区群众好评', 'http://zg.newssc.org/system/20160324/001877999.html', null, '2016-03-24 11:08:08', '\0', '84913677efd1d2ba85e4a1ededb1280c', '584caf7c7ecb5307c282e568f5ef8b34');
INSERT INTO `newsdetails` VALUES ('大安区召开实施全面两孩政策暨2016年卫生计生工作会议', '大安区召开实施全面两孩政策暨年卫生计生工作会议', 'http://zg.newssc.org/system/20160318/001873179.html', null, '2016-03-18 13:54:47', '\0', '861bcda31753b5d6e98d61ffe8ad9dc5', 'd981e12f0b2a57b7c4a4253eb07617ef');
INSERT INTO `newsdetails` VALUES ('自贡疯狂小偷两次盗窃同一家饭店 连香肠都不放过', '自贡疯狂小偷两次盗窃同一家饭店连香肠都不放过', 'http://cd.qq.com/a/20160328/026776.htm', null, '2016-03-28 11:03:21', '\0', '8712e32dbc43f5f0dadb7e9cc6248342', '93204ff6132a4d0c18cfdae7fa897d4c');
INSERT INTO `newsdetails` VALUES ('牛尾乡建山羊养殖协会 带养殖户抱团致富', '牛尾乡建山羊养殖协会带养殖户抱团致富', 'http://zg.newssc.org/system/20160324/001878020.html', null, '2016-03-24 11:13:20', '\0', '8894907fa4c729a3c40821cfa64b3ee1', 'ad9ef7b7edb91975ec4a81cc74251782');
INSERT INTO `newsdetails` VALUES ('自贡警方抓获2名假票贩子 涉伪造倒卖假灯会门票(图)', '自贡警方抓获名假票贩子涉伪造倒卖假灯会门票', 'http://cd.qq.com/a/20160225/011429.htm', null, '2016-02-25 07:53:03', '', '88adc19ce95f537eb9bbea9459339594', 'a9e3043e08514ce1248aa8f518a6ed8f');
INSERT INTO `newsdetails` VALUES ('自贡一涉嫌合同诈骗的嫌疑人 到派出所主动投案自首', '自贡一涉嫌合同诈骗的嫌疑人到派出所主动投案自首', 'http://zg.newssc.org/system/20160327/001880084.html', null, '2016-03-27 13:49:02', '', '88ca9d1b01615274483ae70727918692', '3c7bfc5a2f248acbe6812e166db6b912');
INSERT INTO `newsdetails` VALUES ('自贡一市民网络购物引纠纷 获赔2000元', '自贡一市民网络购物引纠纷获赔元', 'http://cd.qq.com/a/20160302/046689.htm', null, '2016-03-02 15:34:13', '', '8a8f9700c849f22b43b8867699dc2d23', 'ccd823e2764574a1bcf5a71d50702edc');
INSERT INTO `newsdetails` VALUES ('天降娇妻做贼  偷耕牛讨好情夫', '天降娇妻做贼偷耕牛讨好情夫', 'http://www.zgm.cn/html/a/2016/0328/119199.html', null, '2016-03-28 00:00:00', '\0', '8dbc07bb2cd88b0342b01e267e707516', 'f927187438b575de9bb9058cdc2f679c');
INSERT INTO `newsdetails` VALUES ('沿滩分局邓关所为群众排忧解难救助一名走失儿童 ', '沿滩分局邓关所为群众排忧解难救助一名走失儿童', 'http://zg.newssc.org/system/20160318/001873181.html', null, '2016-03-18 13:55:51', '', '93064a9fdb430291705f5ad472697de1', '8eef089efa3ac822325a0191bf159ba9');
INSERT INTO `newsdetails` VALUES ('只为一句承诺 祖孙三代守墓117年', '只为一句承诺祖孙三代守墓年', 'http://www.zgm.cn/html/a/2016/0329/119249.html', null, '2016-03-29 00:00:00', '', '9398a4a84454ed7a74f45e7433bf6639', 'cce77123d4d31e46131b05ddb0251837');
INSERT INTO `newsdetails` VALUES ('绵阳一报废大巴改装餐车吸引客人 交警：私改违法了(图)', '绵阳一报废大巴改装餐车吸引客人交警私改违法了', 'http://cd.qq.com/a/20160330/032412.htm', null, '2016-03-30 11:48:00', '\0', '9420330101d37ad7b97c8ecba535e4a2', '996156770e0e6d1c32c3135445916a42');
INSERT INTO `newsdetails` VALUES ('大安分局多部门联合救助一位精神异常老人', '大安分局多部门联合救助一位精神异常老人', 'http://zg.newssc.org/system/20160324/001878002.html', null, '2016-03-24 11:09:11', '', '95208c7cadca9f377fdf1eb0becb995a', 'd078ea73edb5688bd794ef43b1af68b7');
INSERT INTO `newsdetails` VALUES ('面包车冲下河 司机不幸身亡', '面包车冲下河司机不幸身亡', 'http://www.zgm.cn/html/a/2016/0328/119192.html', null, '2016-03-28 00:00:00', '', '96f9a14220a0b2c8bd2f870f8ad3f912', '4fb2431f4cd77b48a4ad856bcfc0fec4');
INSERT INTO `newsdetails` VALUES ('城乡结对  真情帮扶 社区党员干部助力脱贫攻坚', '城乡结对真情帮扶社区党员干部助力脱贫攻坚', 'http://zg.newssc.org/system/20160328/001881325.html', null, '2016-03-29 08:09:31', '\0', '9856c2942093a12419bc88f6665b0caf', 'fa875f944a51aae14e52b42a31a91571');
INSERT INTO `newsdetails` VALUES ('逃避“超限”检查 大货车强行冲关逃费', '逃避超限检查大货车强行冲关逃费', 'http://www.zgm.cn/html/a/2016/0329/119248.html', null, '2016-03-29 00:00:00', '', '98622a3e94c0bfe04004d2cfd59506b3', '76a7785f67ce9bba607323fe707f3f01');
INSERT INTO `newsdetails` VALUES ('自贡车主Q5开了半年多 首保发现轮胎品牌不一致(图)', '自贡车主开了半年多首保发现轮胎品牌不一致', 'http://cd.qq.com/a/20160225/011068.htm', null, '2016-02-25 07:46:33', '\0', '9e6e51abf37041af2c7bd2636e669b28', '7c5e212c9ff377e75aa9ca348f019ff6');
INSERT INTO `newsdetails` VALUES ('自贡灯会甩卖二手灯组 有人出10余万买走百件(图)', '自贡灯会甩卖二手灯组有人出余万买走百件', 'http://cd.qq.com/a/20160315/032567.htm', null, '2016-03-15 12:04:51', '', '9e91c927deaa1f88293498a00b5cee45', 'fa7d21a99b3ba9eeb2819867db1ad322');
INSERT INTO `newsdetails` VALUES ('陈满申请966万国家赔偿案 30日海南听证(图)', '陈满申请万国家赔偿案日海南听证', 'http://cd.qq.com/a/20160330/032883.htm', null, '2016-03-30 11:55:00', '', '9fd0e5e425321e28073bc3f0d216712f', '402dc3cc893893667924910b60d2ef24');
INSERT INTO `newsdetails` VALUES ('贡井区开展禁渔巡查  捣毁地笼网500余米', '贡井区开展禁渔巡查捣毁地笼网余米', 'http://zg.newssc.org/system/20160318/001873198.html', null, '2016-03-18 14:03:56', '', 'a54ff63bbdf89fe9f731e1b899c7f1b0', '90a8f1ae44908c4b2a521d2cb79dc0f8');
INSERT INTO `newsdetails` VALUES ('督促干部廉洁干净干事 架起党和群众沟通桥梁李清调研贡井区党风廉政建设', '督促干部廉洁干净干事架起党和群众沟通桥梁李清调研贡井区党风廉政建设', 'http://zg.newssc.org/system/20160328/001881330.html', null, '2016-03-29 08:09:31', '\0', 'a7cbf0e8965c4e511c366cc5dd9e89bf', '152c61b2414355b2a8d427d2ba9ac311');
INSERT INTO `newsdetails` VALUES ('自贡市沿滩区政协八届五次会议开幕', '自贡市沿滩区政协八届五次会议开幕', 'http://zg.newssc.org/system/20160318/001873177.html', null, '2016-03-18 13:54:39', '\0', 'a8492df4027438e167f4a49d5953744e', 'd642b35b23cc6cbdc4565a7a3acd143c');
INSERT INTO `newsdetails` VALUES ('达州通川发生暴力拒捕案 2名嫌犯抢走民警枪支', '达州通川发生暴力拒捕案名嫌犯抢走民警枪支', 'http://cd.qq.com/a/20160330/031526.htm', null, '2016-03-30 11:35:00', '', 'a91526c28138d1a5dff3ac62d3a7d00b', '7e4141ce38e537693f6ccef6f0d5553d');
INSERT INTO `newsdetails` VALUES ('从“要钱”到“要物资” 文化扶贫拔掉“穷根子”艾叶镇用文化扶贫充实了精准扶贫内涵', '从要钱到要物资文化扶贫拔掉穷根子艾叶镇用文化扶贫充实了精准扶贫内涵', 'http://zg.newssc.org/system/20160328/001881324.html', null, '2016-03-29 08:09:31', '\0', 'a9a4c8b2378055d245b8f65f2569894a', '34e5e2c3f30b0318599e4d74273915ec');
INSERT INTO `newsdetails` VALUES ('自贡40多名游客买数十万元珠宝 退货时财物两空(图)', '自贡多名游客买数十万元珠宝退货时财物两空', 'http://cd.qq.com/a/20160321/009671.htm', null, '2016-03-21 07:45:49', '\0', 'aa254fd13e7b32be52936a5b32715ec4', '262fc4f5f1c579debc70574df00dde6c');
INSERT INTO `newsdetails` VALUES ('泸州一皮卡车刹车失灵 为避免造成大事故主动撞墙(图)', '泸州一皮卡车刹车失灵为避免造成大事故主动撞墙', 'http://cd.qq.com/a/20160330/042229.htm', null, '2016-03-30 14:55:00', '', 'ac140cd2393eb045db59b6bf1c8bb9e2', 'c0e5d3ee6f2cb8df2c729c97bf1d8576');
INSERT INTO `newsdetails` VALUES ('四川公布近8年8000余件征地批文信息 可手机查询', '四川公布近年余件征地批文信息可手机查询', 'http://cd.qq.com/a/20160330/032705.htm', null, '2016-03-30 11:52:00', '\0', 'affe5729387452ea0a1f7ac56832bc7d', 'b213063b396981711138313c9e12f938');
INSERT INTO `newsdetails` VALUES ('自贡女子欲捐骨髓救9岁亲妹妹 手术在即缺救命钱(图)', '自贡女子欲捐骨髓救岁亲妹妹手术在即缺救命钱', 'http://cd.qq.com/a/20160301/010619.htm', null, '2016-03-01 07:39:22', '', 'b027ad5a22c658ef2a9ebf7cc7f215e4', '59753129611318fdf4d59385a4ea356c');
INSERT INTO `newsdetails` VALUES ('自贡女孩捐骨髓救妹妹 60万元手术治疗费成难题', '自贡女孩捐骨髓救妹妹万元手术治疗费成难题', 'http://cd.qq.com/a/20160222/040166.htm', null, '2016-02-22 14:56:06', '', 'b0d242badfb30f08adba28c610ec911e', '48b245be9ee144198d37dfb8c52e4b2e');
INSERT INTO `newsdetails` VALUES ('高新分局“反盗窃 惠民生”专项行动成果显著', '高新分局反盗窃惠民生专项行动成果显著', 'http://zg.newssc.org/system/20160330/001883737.html', null, '2016-03-30 17:30:38', '', 'b0fc57bd8f9d9311b551973cde7f5275', '76ad76312dfe8d1f044b0387c543045c');
INSERT INTO `newsdetails` VALUES ('自贡市福善镇构建精准脱贫“自奋蹄”模式', '自贡市福善镇构建精准脱贫自奋蹄模式', 'http://zg.newssc.org/system/20160318/001873176.html', null, '2016-03-18 13:53:33', '', 'b190e04646f70dd151fa5a0c95de1b1a', '18ef0c5510e0178c6ded0eee3d933550');
INSERT INTO `newsdetails` VALUES ('自贡女医生自制“山寨呼吸机” 救活新生儿', '自贡女医生自制山寨呼吸机救活新生儿', 'http://cd.qq.com/a/20160323/023383.htm', null, '2016-03-23 09:36:28', '', 'b2fd84f3f32d4a86ae0460d01991bddb', '98e687934b723d1d81ee06fe1f376845');
INSERT INTO `newsdetails` VALUES ('绵阳82岁老母亲无家可归 状告6个亲生子女(图)', '绵阳岁老母亲无家可归状告个亲生子女', 'http://cd.qq.com/a/20160330/032306.htm', null, '2016-03-30 11:46:00', '', 'b4ac7a5c5e05ffb9300df18ed87370cf', 'cb63f413ee74698d1f742db026bc07d8');
INSERT INTO `newsdetails` VALUES ('陈满申请国家赔偿首次听证结束 370万元误工费成焦点', '陈满申请国家赔偿首次听证结束万元误工费成焦点', 'http://cd.qq.com/a/20160330/042966.htm', null, '2016-03-30 15:05:00', '\0', 'b54b2be36e90643fb436c2d755e0b1fb', 'e4cef75278926d2493c59f267ad0bb3b');
INSERT INTO `newsdetails` VALUES ('大安区留守儿童“四点半课堂”正式开班', '大安区留守儿童四点半课堂正式开班', 'http://zg.newssc.org/system/20160322/001876262.html', null, '2016-03-23 08:08:47', '\0', 'b812672d1b5772d2aca6d6bd969b96c1', '51e2359aff311477923a76da421a3cc3');
INSERT INTO `newsdetails` VALUES ('《同园约20名孩子呕吐入院》续：7名患儿治愈出院 初步判定为诺如病毒感染', '同园约名孩子呕吐入院续名患儿治愈出院初步判定为诺如病毒感染', 'http://www.zgm.cn/html/a/2016/0329/119236.html', null, '2016-03-29 00:00:00', '', 'b9850bbf56482c423158d793c60b1b93', '8d281529174d856a250c0c67c27b3145');
INSERT INTO `newsdetails` VALUES ('组图：自贡交警“水桶腰”呼吁交通安全', '组自贡交警水桶腰呼吁交通安全', 'http://cd.qq.com/a/20160325/010696.htm', null, '2016-03-25 07:48:42', '\0', 'b9893e0a6cbf60a4125310bf57234f18', 'cd10670f96bb3ef471250d414f2f6e4c');
INSERT INTO `newsdetails` VALUES ('自贡七旬夫妇申请“保护令” 逆子当天再次家暴(图)', '自贡七旬夫妇申请保护令逆子当天再次家暴', 'http://cd.qq.com/a/20160318/010215.htm', null, '2016-03-18 07:51:28', '', 'bad7d12f8093328c4fd86760db69d631', '3c7171ca53bc9f462a120911d7ee1ca2');
INSERT INTO `newsdetails` VALUES ('自流井区:“四步法”诊治群众身边腐败“顽疾”', '自流井区四步法诊治群众身边腐败顽疾', 'http://zg.newssc.org/system/20160327/001880086.html', null, '2016-03-27 13:55:55', '\0', 'bc002c3b3cb1dc550048f6413d24401b', 'd6b59e453ee78d042d8fcdc5d83beee2');
INSERT INTO `newsdetails` VALUES ('富顺县举行2016年一季度重大项目集中开工暨自隆高速路连接线项目开工大会', '富顺县举行年一季度重大项目集中开工暨自隆高速路连接线项目开工大会', 'http://zg.newssc.org/system/20160322/001875653.html', null, '2016-03-22 11:11:35', '\0', 'bc10365a6cdf104936616c5877328924', 'dba2e670907b479c52e33f3d6643985e');
INSERT INTO `newsdetails` VALUES ('绵阳一鱼塘千斤鱼儿死亡 疑因排污管漏水渗入塘内(图)', '绵阳一鱼塘千斤鱼儿死亡疑因排污管漏水渗入塘内', 'http://cd.qq.com/a/20160330/032112.htm', null, '2016-03-30 11:44:00', '', 'bcb3f7823ae7af311c85b239372db675', '3799d4da1a2858e0bec1decef5340ca1');
INSERT INTO `newsdetails` VALUES ('富顺童寺镇：“五项制度”服务计生特殊困难家庭', '富顺童寺镇五项制度服务计生特殊困难家庭', 'http://zg.newssc.org/system/20160330/001883344.html', null, '2016-03-30 14:15:26', '\0', 'c00179ff0e09b3b950f56706ee6cef89', '47b0daad98435dd4c869401c1ca889d6');
INSERT INTO `newsdetails` VALUES ('自井分局经侦抓获一名涉嫌非法吸收公众存款的上网逃犯', '自井分局经侦抓获一名涉嫌非法吸收公众存款的上网逃犯', 'http://zg.newssc.org/system/20160327/001880085.html', null, '2016-03-27 13:55:55', '', 'c2d71112cfbde60ef22111abe1757a9f', 'db1c471f85e43a51521f355c26446a1c');
INSERT INTO `newsdetails` VALUES (' 富顺：“法治评书”使法治宣传形式鲜活起来', '富顺法治评书使法治宣传形式鲜活起来', 'http://zg.newssc.org/system/20160330/001883343.html', null, '2016-03-30 14:14:39', '', 'c99917fb4a4e765d689fc79de2991c10', 'f37df0ceceae4314ca387399a06f33b9');
INSERT INTO `newsdetails` VALUES ('富顺县农牧业局组织召开2016年甜橙产业技术培训会', '富顺县农牧业局组织召开年甜橙产业技术培训会', 'http://zg.newssc.org/system/20160317/001871820.html', null, '2016-03-17 11:00:46', '\0', 'cd108e43310c49de8a0f40a2b64e1189', 'b84fd089e281478d5fdad3d98c04c3be');
INSERT INTO `newsdetails` VALUES ('警车占道直行 红灯等待时压停在人行斑马线', '警车占道直行红灯等待时压停在人行斑马线', 'http://www.zgm.cn/html/a/2016/0330/119268.html', null, '2016-03-30 00:00:00', '', 'cda886f045412757c3dc3b7beaf47cf5', 'fc0722b44f371a90cd54d266bbbb915b');
INSERT INTO `newsdetails` VALUES ('“网恋”夫妻闹矛盾  被打妻子申请保护令', '网恋夫妻闹矛盾被打妻子申请保护令', 'http://www.zgm.cn/html/a/2016/0329/119246.html', null, '2016-03-29 00:00:00', '', 'cf862a9244de83baa38eba252887abe4', 'c7d368826fa3853f583b609fd39a3a61');
INSERT INTO `newsdetails` VALUES ('成都机场将迎清明客流小高峰 大理丽江机票紧俏', '成都机场将迎清明客流小高峰大理丽江机票紧俏', 'http://cd.qq.com/a/20160330/041651.htm', null, '2016-03-30 14:45:00', '\0', 'd44dd8de3b411c1e1213781bc8da5d14', '23f360f498ab2c76820ca93090b39df3');
INSERT INTO `newsdetails` VALUES ('围绕“三大目标” 实施“两大战略”沿滩区全力打造产城一体示范区', '围绕三大目标实施两大战略沿滩区全力打造产城一体示范区', 'http://zg.newssc.org/system/20160327/001880088.html', null, '2016-03-27 13:55:55', '\0', 'd6a471f97207578641546c751f9be68b', 'c3af032d3d547d50bed1949fbd98ab99');
INSERT INTO `newsdetails` VALUES ('自贡女子购物遇重复刷卡 商家以不知情为由拒退款', '自贡女子购物遇重复刷卡商家以不知情为由拒退款', 'http://cd.qq.com/a/20160225/042310.htm', null, '2016-02-25 14:45:23', '', 'd6e1446c65f11762e315183199ad1d9a', '2d6c198cc7577df353628f5c31017d0f');
INSERT INTO `newsdetails` VALUES ('成都两男子路边扔烟盒被逮捕 盒内藏有冰毒(图)', '成都两男子路边扔烟盒被逮捕盒内藏有冰毒', 'http://cd.qq.com/a/20160330/043922.htm', null, '2016-03-30 15:22:00', '', 'd8679ec8b7c20797aef137dbc1b843fe', '89641b69d2c1fe5c6587583e0ed05833');
INSERT INTO `newsdetails` VALUES ('自贡市沿滩区第十七届人民代表大会第六次会议开幕', '自贡市沿滩区第十七届人民代表大会第六次会议开幕', 'http://zg.newssc.org/system/20160318/001873191.html', null, '2016-03-18 14:01:07', '\0', 'daeeee4ee25c45ebdd45bad069d280b0', '32446c73a3f957e3c6563c89f26ab685');
INSERT INTO `newsdetails` VALUES ('自贡某房产商野蛮施工挖断天然气管 2千户居民停气', '自贡某房产商野蛮施工挖断天然气管千户居民停气', 'http://cd.qq.com/a/20160311/045716.htm', null, '2016-03-11 15:28:32', '', 'dce4f103d191a5fb02c92dc2fc5d0596', '21613d0ba11875def3e743e8a8884aeb');
INSERT INTO `newsdetails` VALUES ('自贡男子酒后壮胆意欲强奸女邻居 目前已被刑拘', '自贡男子酒后壮胆意欲强奸女邻居目前已被刑拘', 'http://cd.qq.com/a/20160219/038776.htm', null, '2016-02-19 14:34:11', '', 'dea35a0da355217e9ed34cd0be816ae8', '6294df28faa7e554198b2d52c7c83630');
INSERT INTO `newsdetails` VALUES (' “幸福人生  爱驻我家”知识讲座开讲', '幸福人生爱驻我家知识讲座开讲', 'http://zg.newssc.org/system/20160318/001873207.html', null, '2016-03-18 14:07:29', '\0', 'e3fd2d9735c03f5fe764dfb17aab9ea4', '4e726c730f41d9160a5f426eb8a1e2bf');
INSERT INTO `newsdetails` VALUES ('男子无票欲闯自贡灯会 被制止后出手打女检票员', '男子无票欲闯自贡灯会被制止后出手打女检票员', 'http://cd.qq.com/a/20160225/042405.htm', null, '2016-02-25 14:47:01', '', 'e8da2d2f7f5df014cc3dd098b0eb5cb5', 'cbd9fb5704d4e99f13d445bf406fa28f');
INSERT INTO `newsdetails` VALUES ('电子科大校友大手笔捐赠母校1亿元 用于建设众创空间', '电子科大校友大手笔捐赠母校亿元用于建设众创空间', 'http://cd.qq.com/a/20160330/033302.htm', null, '2016-03-30 12:01:00', '\0', 'e91ae5cb8ffbad60af32320e3662041d', 'c55956fcfe4400de0ae2b36fabf3bf87');
INSERT INTO `newsdetails` VALUES ('汇聚力量  引导舆论 努力推动新媒体融合发展自贡市委宣传部副部长李林、钟健调研沿滩新媒体发展现状', '汇聚力量引导舆论努力推动新媒体融合发展自贡市委宣传部副部长李林钟健调研沿滩新媒体发展现状', 'http://zg.newssc.org/system/20160321/001874656.html', null, '2016-03-21 12:01:08', '\0', 'ea523fb292d7295e90dc4df7b87580a2', 'acef7325f79065dbf458693f36afa19c');
INSERT INTO `newsdetails` VALUES ('自贡某幼儿园23个娃娃呕吐腹泻 相关部门介入调查', '自贡某幼儿园个娃娃呕吐腹泻相关部门介入调查', 'http://cd.qq.com/a/20160326/027820.htm', null, '2016-03-26 18:13:14', '', 'eb53d7ab1f49557811cf07a7ae3eb95b', 'fa340824b1f6f8cea0b85316aa7ab232');
INSERT INTO `newsdetails` VALUES ('自贡疑似发现明清时代古墓 “糯米水泥”浇筑', '自贡疑似发现明清时代古墓糯米水泥浇筑', 'http://cd.qq.com/a/20160321/010255.htm', null, '2016-03-21 07:55:14', '', 'edb827a54268709f148fdc2a24a6140d', 'fa8f1834fa2c8b4e1eb7634f066d2b49');
INSERT INTO `newsdetails` VALUES (' 大安区召开党风廉政建设主体责任集中谈话会', '大安区召开党风廉政建设主体责任集中谈话会', 'http://zg.newssc.org/system/20160322/001875657.html', null, '2016-03-22 11:11:28', '', 'ef97740ed539ce911febb030a0f2407a', 'b669cc94e4b835946772580851de31f3');
INSERT INTO `newsdetails` VALUES ('贡井区132名中小学生博弈汉字听写大赛', '贡井区名中小学生博弈汉字听写大赛', 'http://zg.newssc.org/system/20160317/001871750.html', null, '2016-03-17 10:46:34', '\0', 'f1e026c4e1644695b4bb1be4c9c245aa', '0927d95e77f1cf3f1b7d8f2332dbf30e');
INSERT INTO `newsdetails` VALUES ('自贡一名17岁男子从24楼坠亡 非事发小区住户(图)', '自贡一名岁男子从楼坠亡非事发小区住户', 'http://cd.qq.com/a/20160311/045507.htm', null, '2016-03-11 15:25:21', '', 'f249719ea643c1e522c74dbd36101399', '6eae902af3978320c8f19f7ba712c494');
INSERT INTO `newsdetails` VALUES ('大安区开展“世界防治结核病日”宣传活动', '大安区开展世界防治结核病日宣传活动', 'http://zg.newssc.org/system/20160327/001880094.html', null, '2016-03-27 16:53:22', '\0', 'f2596adb31bec50a2466cae20af88ce0', 'e5df208479dabd20239b62bd4f92af7f');
INSERT INTO `newsdetails` VALUES ('自流井区：专项监督助力脱贫攻坚见实效', '自流井区专项监督助力脱贫攻坚见实效', 'http://zg.newssc.org/system/20160327/001880087.html', null, '2016-03-27 13:55:55', '\0', 'f4fdea8e8575ccc9c6834620139a5b3d', '7d3a703e8b72cbd3c976c0f1754042b5');
INSERT INTO `newsdetails` VALUES ('老汉深夜昏迷卧公路，民警热心帮扶送回家', '老汉深夜昏迷卧公路民警热心帮扶送回家', 'http://zg.newssc.org/system/20160324/001877997.html', null, '2016-03-24 11:08:13', '', 'f54ccc84b9896dfc3043a552ee3f5fc2', '4d634449fa698afa0a11668408ba86e3');
INSERT INTO `newsdetails` VALUES ('富顺县两镇“双挂钩”项目通过市级验收', '富顺县两镇双挂钩项目通过市级验收', 'http://zg.newssc.org/system/20160324/001877885.html', null, '2016-03-24 10:38:40', '', 'f5f6e800d45827a23836eeb5a7f92f83', 'b66207e9cd4ad33d05362f8ecfa72151');
INSERT INTO `newsdetails` VALUES ('环保部通报冒用环评资质行为 自贡大邑环保局上榜', '环保部通报冒用环评资质行为自贡大邑环保局上榜', 'http://cd.qq.com/a/20160315/045402.htm', null, '2016-03-15 15:42:08', '', 'f798e8d15a94d2bf654b73ddc7d349f9', 'f53b2e6893492490413ffcfde55d0092');
INSERT INTO `newsdetails` VALUES ('自贡一刑满男子染上毒瘾 深夜抢独行女子被抓', '自贡一刑满男子染上毒瘾深夜抢独行女子被抓', 'http://cd.qq.com/a/20160329/045844.htm', null, '2016-03-29 15:39:38', '', 'f9e519b838c29f62da64610da9868c75', '05c20bbd1c3d99f05b10e5e32cd0018d');
INSERT INTO `newsdetails` VALUES ('自贡男子因女友睡后没人聊天 半夜抢劫猥亵单身女青年', '自贡男子因女友睡后没人聊天半夜抢劫猥亵单身女青年', 'http://cd.qq.com/a/20160323/047162.htm', null, '2016-03-23 15:26:22', '', 'fafeae08488683322abe781555189c36', 'db82b1f7869f6459e2a971dc80d151fc');
INSERT INTO `newsdetails` VALUES ('10岁娃掉池塘 沿滩公安施救', '岁娃掉池塘沿滩公安施救', 'http://www.zgm.cn/html/a/2016/0328/119197.html', null, '2016-03-28 00:00:00', '', 'fc5602ef7ce492e6409208b15ade8113', '61fd2b9048ea1dc87ff23d672b75b942');
INSERT INTO `newsdetails` VALUES ('自贡一幼儿园学生同吃一锅饭 一个班内多名幼儿呕吐', '自贡一幼儿园学生同吃一锅饭一个班内多名幼儿呕吐', 'http://cd.qq.com/a/20160327/006587.htm', null, '2016-03-27 07:31:46', '', 'fe051928a92e61c5cee4defe04843c15', '16a447d221259369e3dd04e4ff9c5b56');
INSERT INTO `newsdetails` VALUES ('自贡女子入住新房不到半年 电梯连连出故障', '自贡女子入住新房不到半年电梯连连出故障', 'http://cd.qq.com/a/20160312/010440.htm', null, '2016-03-12 08:34:21', '\0', 'ffa8073c727c754779bc5e5f1a641ded', '4075ce7449e1e673a235db4e263e78ff');

-- ----------------------------
-- Table structure for reportlist
-- ----------------------------
DROP TABLE IF EXISTS `reportlist`;
CREATE TABLE `reportlist` (
  `hash` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of reportlist
-- ----------------------------
INSERT INTO `reportlist` VALUES ('4a089bdd7e36ea41de2ee7eeb2894aad');
INSERT INTO `reportlist` VALUES ('f07fd4a8cb5a0581234e45779b1c3fb4');

-- ----------------------------
-- Table structure for trainset
-- ----------------------------
DROP TABLE IF EXISTS `trainset`;
CREATE TABLE `trainset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ctitle` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `nopunctitle` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `isaccident` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trainset
-- ----------------------------
INSERT INTO `trainset` VALUES ('1', '成都老工匠修葺杜甫茅屋20年 5次参与其翻新工作', '成都老工匠修葺杜甫茅屋20年 5次参与其翻新工作', '\0');
INSERT INTO `trainset` VALUES ('2', '李登菊陈文华唐坚当选四川省政协副主席', '李登菊陈文华唐坚当选四川省政协副主席', '\0');
INSERT INTO `trainset` VALUES ('3', '成都地铁10号线二期拟2019通车 全线设2座换乘站', '成都地铁10号线二期拟2019通车 全线设2座换乘站', '\0');
INSERT INTO `trainset` VALUES ('4', '成都东站开辟应急通道护送患病女孩', '成都东站开辟应急通道护送患病女孩', '\0');
INSERT INTO `trainset` VALUES ('5', '成都都市赶场惹争议 居民反感赶场人热捧', '成都都市赶场惹争议 居民反感赶场人热捧', '\0');
INSERT INTO `trainset` VALUES ('6', '春运节前最高峰或在2月5日 成都成最热门到达城市之一', '春运节前最高峰或在2月5日 成都成最热门到达城市之一', '\0');
INSERT INTO `trainset` VALUES ('7', '泸州市民杀鸡发现鸡宝 专家称价值并不高', '泸州市民杀鸡发现鸡宝 专家称价值并不高', '\0');
INSERT INTO `trainset` VALUES ('8', '四川盛世美颜雪后美景如梦如画', '四川盛世美颜雪后美景如梦如画', '\0');
INSERT INTO `trainset` VALUES ('9', '泸州家长吐槽小学寒假作业 老师因人而异', '泸州家长吐槽小学寒假作业 老师因人而异', '\0');
INSERT INTO `trainset` VALUES ('10', '31省区2015年GDP排行榜出炉 成都排全国第六', '31省区2015年GDP排行榜出炉 成都排全国第六', '\0');
INSERT INTO `trainset` VALUES ('11', '成都春节用工荒已至 理发洗车等服务纷纷涨价', '成都春节用工荒已至 理发洗车等服务纷纷涨价', '\0');
INSERT INTO `trainset` VALUES ('12', '成都同步规划建学校 今年将建成300所公办幼儿园', '成都同步规划建学校 今年将建成300所公办幼儿园', '\0');
INSERT INTO `trainset` VALUES ('13', '成都男子买车两月多却不能上户挂牌 厂家称轮胎选错', '成都男子买车两月多却不能上户挂牌 厂家称轮胎选错', '\0');
INSERT INTO `trainset` VALUES ('14', '海绵城市成都样本草坪遇雨5分钟排干', '海绵城市成都样本草坪遇雨5分钟排干', '\0');
INSERT INTO `trainset` VALUES ('15', '四川鼓励净菜上市 星级宾馆限制使用一次性用品', '四川鼓励净菜上市 星级宾馆限制使用一次性用品', '\0');
INSERT INTO `trainset` VALUES ('16', '南充挂历男孩新年心愿妈妈再爱我一次', '南充挂历男孩新年心愿妈妈再爱我一次', '\0');
INSERT INTO `trainset` VALUES ('17', '电子科大教授证实莫扎特效应 听音乐记忆力较好', '电子科大教授证实莫扎特效应 听音乐记忆力较好', '\0');
INSERT INTO `trainset` VALUES ('18', '四川纪检的2015慈不掌兵老虎苍蝇一起打', '四川纪检的2015慈不掌兵老虎苍蝇一起打', '\0');
INSERT INTO `trainset` VALUES ('19', '百万斤雷波脐橙首遇大滞销 曾卖了20年好价钱', '百万斤雷波脐橙首遇大滞销 曾卖了20年好价钱', '\0');
INSERT INTO `trainset` VALUES ('20', '金融硕士论文被曝抄袭 从标题到参考文献几乎一致', '金融硕士论文被曝抄袭 从标题到参考文献几乎一致', '\0');
INSERT INTO `trainset` VALUES ('21', '成都第三届我心中的社区好书记公益评选落幕', '成都第三届我心中的社区好书记公益评选落幕', '\0');
INSERT INTO `trainset` VALUES ('22', '区域性污染再度袭川 成德绵等14市轻度污染', '区域性污染再度袭川 成德绵等14市轻度污染', '\0');
INSERT INTO `trainset` VALUES ('23', '成都女子贪薄利 被怂恿卖淫秽光碟200张获刑1年', '成都女子贪薄利 被怂恿卖淫秽光碟200张获刑1年', '\0');
INSERT INTO `trainset` VALUES ('24', '曝高级公交车不开空调收2元 公交集团购置成本高', '曝高级公交车不开空调收2元 公交集团购置成本高', '\0');
INSERT INTO `trainset` VALUES ('25', '成都启动春节期间旅游安全检查 涉及多个相关职能部门', '成都启动春节期间旅游安全检查 涉及多个相关职能部门', '\0');
INSERT INTO `trainset` VALUES ('26', '成都将建首个地铁上盖物业 7号线崔家店修停车场', '成都将建首个地铁上盖物业 7号线崔家店修停车场', '\0');
INSERT INTO `trainset` VALUES ('27', '网友一年有292小时刷社交媒体 平均每天开微信145次', '网友一年有292小时刷社交媒体 平均每天开微信145次', '\0');
INSERT INTO `trainset` VALUES ('28', '成都今年将建85个社区养老院 每家30张床位以上', '成都今年将建85个社区养老院 每家30张床位以上', '\0');
INSERT INTO `trainset` VALUES ('29', '省十二届人大四次会议闭幕 王东明主持并讲话', '省十二届人大四次会议闭幕 王东明主持并讲话', '\0');
INSERT INTO `trainset` VALUES ('30', '200多成都客 泰国机场一日游 疑飞机故障', '200多成都客 泰国机场一日游 疑飞机故障', '\0');
INSERT INTO `trainset` VALUES ('31', '雅西高速最强降雪 路面积雪40厘米可堆雪人', '雅西高速最强降雪 路面积雪40厘米可堆雪人', '\0');
INSERT INTO `trainset` VALUES ('32', '成都女士ATM机上跨行取1000元 账上扣了钱没到手', '成都女士ATM机上跨行取1000元 账上扣了钱没到手', '\0');
INSERT INTO `trainset` VALUES ('33', '2月1起成都交警严管火车北站片区交通秩序', '2月1起成都交警严管火车北站片区交通秩序', '\0');
INSERT INTO `trainset` VALUES ('34', '遂宁业主两年前交钱买房 未见开发商修建一栋楼', '遂宁业主两年前交钱买房 未见开发商修建一栋楼', '\0');
INSERT INTO `trainset` VALUES ('35', '乐山大佛峨眉山游客持续高涨 增派官兵维护秩序', '乐山大佛峨眉山游客持续高涨 增派官兵维护秩序', '\0');
INSERT INTO `trainset` VALUES ('36', '12日起四川盆地降温降水 返程高峰需注意行车安全', '12日起四川盆地降温降水 返程高峰需注意行车安全', '\0');
INSERT INTO `trainset` VALUES ('37', '组雅西高速迎车流高峰 司机应急道扔垃圾谩骂交警', '组雅西高速迎车流高峰 司机应急道扔垃圾谩骂交警', '\0');
INSERT INTO `trainset` VALUES ('38', '假期过半成都人出行热情不减 宾馆入住率超50', '假期过半成都人出行热情不减 宾馆入住率超50', '\0');
INSERT INTO `trainset` VALUES ('39', '组春节成都汽车祈福花样多 烧黄纸洒鸡血', '组春节成都汽车祈福花样多 烧黄纸洒鸡血', '\0');
INSERT INTO `trainset` VALUES ('40', '成都一女子回婆家过年 穿衬衣吃凉拌面', '成都一女子回婆家过年 穿衬衣吃凉拌面', '\0');
INSERT INTO `trainset` VALUES ('41', '成都车主用涂改液伪造车牌 交警你咋不上天呢', '成都车主用涂改液伪造车牌 交警你咋不上天呢', '\0');
INSERT INTO `trainset` VALUES ('42', '组成都农家乐扎假桃花 游客打拥堂', '组成都农家乐扎假桃花 游客打拥堂', '\0');
INSERT INTO `trainset` VALUES ('43', '成都留守人母亲住院错过陪两个儿子', '成都留守人母亲住院错过陪两个儿子', '\0');
INSERT INTO `trainset` VALUES ('44', '川大女生为尽孝回新疆兵团农场当牛倌 日进千元', '川大女生为尽孝回新疆兵团农场当牛倌 日进千元', '\0');
INSERT INTO `trainset` VALUES ('45', '雅西高速迎车流高峰 司机应急道扔垃圾谩骂交警', '雅西高速迎车流高峰 司机应急道扔垃圾谩骂交警', '\0');
INSERT INTO `trainset` VALUES ('46', '德阳游客沙滩上打麻将 享受日光浴', '德阳游客沙滩上打麻将 享受日光浴', '\0');
INSERT INTO `trainset` VALUES ('47', '绵阳打造不夜城 网友美呆了', '绵阳打造不夜城 网友美呆了', '\0');
INSERT INTO `trainset` VALUES ('48', '四川现接吻大赛 时间最长情侣获钻戒', '四川现接吻大赛 时间最长情侣获钻戒', '\0');
INSERT INTO `trainset` VALUES ('49', '成都一店铺开业放鞭炮讨好兆头 不料遭罚200元', '成都一店铺开业放鞭炮讨好兆头 不料遭罚200元', '\0');
INSERT INTO `trainset` VALUES ('50', '广元某村寿宴不收礼之风盛行不拿父母生日赚钱', '广元某村寿宴不收礼之风盛行不拿父母生日赚钱', '\0');
INSERT INTO `trainset` VALUES ('51', '成都一住宅小区起火3人死亡', '成都一住宅小区起火3人死亡', '');
INSERT INTO `trainset` VALUES ('52', '强降雨导致广安2人死亡 巴中达州7人失踪\n', '强降雨导致广安2人死亡 巴中达州7人失踪\n', '');
INSERT INTO `trainset` VALUES ('53', '四川遭遇强降雨天气 已致4人死亡多人失踪\n', '四川遭遇强降雨天气 已致4人死亡多人失踪\n', '');
INSERT INTO `trainset` VALUES ('54', '男子成都公交上喊话不下车就杀人 引发骚动\n', '男子成都公交上喊话不下车就杀人 引发骚动\n', '');
INSERT INTO `trainset` VALUES ('55', '广安一房屋被泥石流推进4米 爷孙俩被埋遇难\n', '广安一房屋被泥石流推进4米 爷孙俩被埋遇难\n', '');
INSERT INTO `trainset` VALUES ('56', '驾驶员掏手机接电话 酿成四车连环相撞\n', '驾驶员掏手机接电话 酿成四车连环相撞\n', '');
INSERT INTO `trainset` VALUES ('57', '绵阳文化广场处某银行发生一起持刀抢劫案\n', '绵阳文化广场处某银行发生一起持刀抢劫案\n', '');
INSERT INTO `trainset` VALUES ('58', '乐山七旬老人无证驾驶 停车场内撞死10岁女孩\n', '乐山七旬老人无证驾驶 停车场内撞死10岁女孩\n', '');
INSERT INTO `trainset` VALUES ('59', '宜宾一卧室起火老人被烧死 疑使用取暖器不当\n', '宜宾一卧室起火老人被烧死 疑使用取暖器不当\n', '');
INSERT INTO `trainset` VALUES ('60', '绵阳客运车超载94 司机涉嫌危险驾驶获刑3个月\n', '绵阳客运车超载94 司机涉嫌危险驾驶获刑3个月\n', '');
INSERT INTO `trainset` VALUES ('61', '自贡临租房发生大火 71名消防官兵奋力扑救\n', '自贡临租房发生大火 71名消防官兵奋力扑救\n', '');
INSERT INTO `trainset` VALUES ('62', '西昌城区一酒店大楼起火\n', '西昌城区一酒店大楼起火\n', '');
INSERT INTO `trainset` VALUES ('63', '宜宾5名孩子误食夺命野生菌 3人中毒身亡2人正抢救\n', '宜宾5名孩子误食夺命野生菌 3人中毒身亡2人正抢救\n', '');
INSERT INTO `trainset` VALUES ('64', '京昆高速广元段一载30余吨乙醇罐车泄露 拥堵6小时\n', '京昆高速广元段一载30余吨乙醇罐车泄露 拥堵6小时\n', '');
INSERT INTO `trainset` VALUES ('65', '南充一轿车在街头自燃 起火原因不明\n', '南充一轿车在街头自燃 起火原因不明\n', '');
INSERT INTO `trainset` VALUES ('66', '连日降雪凉山受影响 前往泸沽湖两条省道双向封闭\n', '连日降雪凉山受影响 前往泸沽湖两条省道双向封闭\n', '');
INSERT INTO `trainset` VALUES ('67', '宜宾一辆铲车摔个底朝天司机被困 消防顶车救人\n', '宜宾一辆铲车摔个底朝天司机被困 消防顶车救人\n', '');
INSERT INTO `trainset` VALUES ('68', '资阳市民放烟花引发火灾 房间被烧得一片狼藉\n', '资阳市民放烟花引发火灾 房间被烧得一片狼藉\n', '');
INSERT INTO `trainset` VALUES ('69', '达州一武校校长因口角与人抓扯 被刺数刀身亡\n', '达州一武校校长因口角与人抓扯 被刺数刀身亡\n', '');
INSERT INTO `trainset` VALUES ('70', '宜宾发生离奇车祸 无人驾驶车撞3人致1人死亡\n', '宜宾发生离奇车祸 无人驾驶车撞3人致1人死亡\n', '');
INSERT INTO `trainset` VALUES ('71', '德阳一辆轿车凌晨掉进堰塘 车辆打捞上岸司机已身亡\n', '德阳一辆轿车凌晨掉进堰塘 车辆打捞上岸司机已身亡\n', '');
INSERT INTO `trainset` VALUES ('72', '南充男子陪妻练车坠入20米悬崖 妻子当场死亡\n', '南充男子陪妻练车坠入20米悬崖 妻子当场死亡\n', '');
INSERT INTO `trainset` VALUES ('73', '60岁老人在南充遇车祸身亡 尸体至今无人认领\n', '60岁老人在南充遇车祸身亡 尸体至今无人认领\n', '');
INSERT INTO `trainset` VALUES ('74', '货车成绵高速路冲过隔离带 撞上小货车致两人死亡\n', '货车成绵高速路冲过隔离带 撞上小货车致两人死亡\n', '');
INSERT INTO `trainset` VALUES ('75', '宜宾发生持刀砍人事件 凶手亲人一死三伤\n', '宜宾发生持刀砍人事件 凶手亲人一死三伤\n', '');
INSERT INTO `trainset` VALUES ('76', '南充一年轻女子坠河身亡 市民以为是玩具娃娃\n', '南充一年轻女子坠河身亡 市民以为是玩具娃娃\n', '');
INSERT INTO `trainset` VALUES ('77', '绵阳夫妻室内烤火取暖 一氧化碳中毒双双死亡\n', '绵阳夫妻室内烤火取暖 一氧化碳中毒双双死亡\n', '');
INSERT INTO `trainset` VALUES ('78', '宜宾女子手上火炮没来得及扔 车内爆炸致4人受伤\n', '宜宾女子手上火炮没来得及扔 车内爆炸致4人受伤\n', '');
INSERT INTO `trainset` VALUES ('79', '南充14岁女学生被货车撞倒当场身亡 魂断上学路\n', '南充14岁女学生被货车撞倒当场身亡 魂断上学路\n', '');
INSERT INTO `trainset` VALUES ('80', '成都某学校学生寝室内被杀 家长拉横幅讨说法\n', '成都某学校学生寝室内被杀 家长拉横幅讨说法\n', '');
INSERT INTO `trainset` VALUES ('81', '泸州一租户疏忽引发大火 现场火光冲天浓烟滚滚\n', '泸州一租户疏忽引发大火 现场火光冲天浓烟滚滚\n', '');
INSERT INTO `trainset` VALUES ('82', '内江一老人跳下西林大桥 抢救无效身亡\n', '内江一老人跳下西林大桥 抢救无效身亡\n', '');
INSERT INTO `trainset` VALUES ('83', '乐山养鸡场焚烧鸡粪引燃民房 众人合力扑救\n', '乐山养鸡场焚烧鸡粪引燃民房 众人合力扑救\n', '');
INSERT INTO `trainset` VALUES ('84', '南充一人涉嫌醉驾 发生事故造成2死3伤\n', '南充一人涉嫌醉驾 发生事故造成2死3伤\n', '');
INSERT INTO `trainset` VALUES ('85', '国内资深攀冰者四姑娘山冲坠罹难\n', '国内资深攀冰者四姑娘山冲坠罹难\n', '');
INSERT INTO `trainset` VALUES ('86', '除夕夜乐山命案致1死1伤 警方悬赏2万元缉凶\n', '除夕夜乐山命案致1死1伤 警方悬赏2万元缉凶\n', '');
INSERT INTO `trainset` VALUES ('87', '四川春运中的浪漫男子向动妹女友求婚\n', '四川春运中的浪漫男子向动妹女友求婚\n', '');
INSERT INTO `trainset` VALUES ('88', '台湾高雄强烈地震 在台南成都人亲历讲述\n', '台湾高雄强烈地震 在台南成都人亲历讲述\n', '');
INSERT INTO `trainset` VALUES ('89', '成都公交司机团年酒后开车 肇事致一人死亡\n', '成都公交司机团年酒后开车 肇事致一人死亡\n', '');
INSERT INTO `trainset` VALUES ('90', '阆中古城客栈失火 住店情侣一死一伤\n', '阆中古城客栈失火 住店情侣一死一伤\n', '');
INSERT INTO `trainset` VALUES ('91', '雅安芦山县发生41级地震 震源深度17千米\n', '雅安芦山县发生41级地震 震源深度17千米\n', '');
INSERT INTO `trainset` VALUES ('92', '自贡驴友穿越稻城亚丁 因高原反应不幸死亡\n', '自贡驴友穿越稻城亚丁 因高原反应不幸死亡\n', '');
INSERT INTO `trainset` VALUES ('93', '成都一男子街边喝农药自杀 曾在此滞留喝酒\n', '成都一男子街边喝农药自杀 曾在此滞留喝酒\n', '');
INSERT INTO `trainset` VALUES ('94', '南充一男子为帮表弟出气 被刀捅到心脏当场死亡\n', '南充一男子为帮表弟出气 被刀捅到心脏当场死亡\n', '');
INSERT INTO `trainset` VALUES ('95', '客车车门路上突然打开 川籍女子坠车被碾压致死\n', '客车车门路上突然打开 川籍女子坠车被碾压致死\n', '');
INSERT INTO `trainset` VALUES ('96', '自贡一男子怀疑母亲有外遇 放火烧房泄愤\n', '自贡一男子怀疑母亲有外遇 放火烧房泄愤\n', '');
INSERT INTO `trainset` VALUES ('97', '成都两车小擦挂引发争吵 轿车碾死拦车的哥\n', '成都两车小擦挂引发争吵 轿车碾死拦车的哥\n', '');
INSERT INTO `trainset` VALUES ('98', '眉山一服装店突发大火 火势蔓延凶猛幸无伤亡\n', '眉山一服装店突发大火 火势蔓延凶猛幸无伤亡\n', '');
INSERT INTO `trainset` VALUES ('99', '雅西高速德昌段一货车修车时被追尾 致2死1伤\n', '雅西高速德昌段一货车修车时被追尾 致2死1伤\n', '');
INSERT INTO `trainset` VALUES ('100', '乐山一摩托车卷入小货车下 驾驶员当场死亡\n', '乐山一摩托车卷入小货车下 驾驶员当场死亡\n', '');

-- ----------------------------
-- Procedure structure for InsertApieceNews
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertApieceNews`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertApieceNews`(IN NewTitle varchar(255),IN NewNoPunctuationTitle varchar(255),IN NewUrl varchar(255),IN NewSummary varchar(255),IN NewDateTime datetime,IN NewIsAccident bit,IN NewUrlHash varchar(255),IN NewTitleHash varchar(255))
BEGIN
	If NOT EXISTS (SELECT UrlHash,TitleHash FROM news_processor.newsdetails WHERE UrlHash = NewUrlHash OR TitleHash = NewTitleHash) THEN
		INSERT into news_processor.newsdetails VALUE (NewTitle,NewNoPunctuationTitle,NewUrl,NewSummary ,NewDateTime,NewIsAccident,NewUrlHash,NewTitleHash);
	END IF;
END
;;
DELIMITER ;
