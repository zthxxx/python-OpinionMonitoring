/*
Navicat MySQL Data Transfer

Source Server         : localhost_test
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : news_processor

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2016-03-11 11:09:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for newsdetails
-- ----------------------------
DROP TABLE IF EXISTS `newsdetails`;
CREATE TABLE `newsdetails` (
  `title` varchar(255) character set utf8 collate utf8_unicode_ci default '',
  `nopuntitle` varchar(255) character set utf8 collate utf8_unicode_ci default '',
  `url` varchar(255) character set utf8 collate utf8_unicode_ci default '',
  `summary` varchar(255) character set utf8 collate utf8_unicode_ci default '',
  `time` datetime default NULL,
  `isaccident` int(11) default NULL,
  `hash` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of newsdetails
-- ----------------------------
INSERT INTO `newsdetails` VALUES ('拉拉阿拉', '拉拉阿拉', 'www.aaa.com', '拉拉阿拉', '2012-01-01 12:11:11', '1', 'baa7a52965b99778f38ef37f235e9053');

-- ----------------------------
-- Table structure for trainset
-- ----------------------------
DROP TABLE IF EXISTS `trainset`;
CREATE TABLE `trainset` (
  `id` int(11) NOT NULL auto_increment,
  `ctitle` varchar(255) character set utf8 collate utf8_unicode_ci default '',
  `nopunctitle` varchar(255) character set utf8 collate utf8_unicode_ci default '',
  `isaccident` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trainset
-- ----------------------------
INSERT INTO `trainset` VALUES ('1', '成都老工匠修葺杜甫茅屋20年 5次参与其翻新工作', '成都老工匠修葺杜甫茅屋20年 5次参与其翻新工作', '0');
INSERT INTO `trainset` VALUES ('2', '李登菊陈文华唐坚当选四川省政协副主席', '李登菊陈文华唐坚当选四川省政协副主席', '0');
INSERT INTO `trainset` VALUES ('3', '成都地铁10号线二期拟2019通车 全线设2座换乘站', '成都地铁10号线二期拟2019通车 全线设2座换乘站', '0');
INSERT INTO `trainset` VALUES ('4', '成都东站开辟应急通道护送患病女孩', '成都东站开辟应急通道护送患病女孩', '0');
INSERT INTO `trainset` VALUES ('5', '成都都市赶场惹争议 居民反感赶场人热捧', '成都都市赶场惹争议 居民反感赶场人热捧', '0');
INSERT INTO `trainset` VALUES ('6', '春运节前最高峰或在2月5日 成都成最热门到达城市之一', '春运节前最高峰或在2月5日 成都成最热门到达城市之一', '0');
INSERT INTO `trainset` VALUES ('7', '泸州市民杀鸡发现鸡宝 专家称价值并不高', '泸州市民杀鸡发现鸡宝 专家称价值并不高', '0');
INSERT INTO `trainset` VALUES ('8', '四川盛世美颜雪后美景如梦如画', '四川盛世美颜雪后美景如梦如画', '0');
INSERT INTO `trainset` VALUES ('9', '泸州家长吐槽小学寒假作业 老师因人而异', '泸州家长吐槽小学寒假作业 老师因人而异', '0');
INSERT INTO `trainset` VALUES ('10', '31省区2015年GDP排行榜出炉 成都排全国第六', '31省区2015年GDP排行榜出炉 成都排全国第六', '0');
INSERT INTO `trainset` VALUES ('11', '成都春节用工荒已至 理发洗车等服务纷纷涨价', '成都春节用工荒已至 理发洗车等服务纷纷涨价', '0');
INSERT INTO `trainset` VALUES ('12', '成都同步规划建学校 今年将建成300所公办幼儿园', '成都同步规划建学校 今年将建成300所公办幼儿园', '0');
INSERT INTO `trainset` VALUES ('13', '成都男子买车两月多却不能上户挂牌 厂家称轮胎选错', '成都男子买车两月多却不能上户挂牌 厂家称轮胎选错', '0');
INSERT INTO `trainset` VALUES ('14', '海绵城市成都样本草坪遇雨5分钟排干', '海绵城市成都样本草坪遇雨5分钟排干', '0');
INSERT INTO `trainset` VALUES ('15', '四川鼓励净菜上市 星级宾馆限制使用一次性用品', '四川鼓励净菜上市 星级宾馆限制使用一次性用品', '0');
INSERT INTO `trainset` VALUES ('16', '南充挂历男孩新年心愿妈妈再爱我一次', '南充挂历男孩新年心愿妈妈再爱我一次', '0');
INSERT INTO `trainset` VALUES ('17', '电子科大教授证实莫扎特效应 听音乐记忆力较好', '电子科大教授证实莫扎特效应 听音乐记忆力较好', '0');
INSERT INTO `trainset` VALUES ('18', '四川纪检的2015慈不掌兵老虎苍蝇一起打', '四川纪检的2015慈不掌兵老虎苍蝇一起打', '0');
INSERT INTO `trainset` VALUES ('19', '百万斤雷波脐橙首遇大滞销 曾卖了20年好价钱', '百万斤雷波脐橙首遇大滞销 曾卖了20年好价钱', '0');
INSERT INTO `trainset` VALUES ('20', '金融硕士论文被曝抄袭 从标题到参考文献几乎一致', '金融硕士论文被曝抄袭 从标题到参考文献几乎一致', '0');
INSERT INTO `trainset` VALUES ('21', '成都第三届我心中的社区好书记公益评选落幕', '成都第三届我心中的社区好书记公益评选落幕', '0');
INSERT INTO `trainset` VALUES ('22', '区域性污染再度袭川 成德绵等14市轻度污染', '区域性污染再度袭川 成德绵等14市轻度污染', '0');
INSERT INTO `trainset` VALUES ('23', '成都女子贪薄利 被怂恿卖淫秽光碟200张获刑1年', '成都女子贪薄利 被怂恿卖淫秽光碟200张获刑1年', '0');
INSERT INTO `trainset` VALUES ('24', '曝高级公交车不开空调收2元 公交集团购置成本高', '曝高级公交车不开空调收2元 公交集团购置成本高', '0');
INSERT INTO `trainset` VALUES ('25', '成都启动春节期间旅游安全检查 涉及多个相关职能部门', '成都启动春节期间旅游安全检查 涉及多个相关职能部门', '0');
INSERT INTO `trainset` VALUES ('26', '成都将建首个地铁上盖物业 7号线崔家店修停车场', '成都将建首个地铁上盖物业 7号线崔家店修停车场', '0');
INSERT INTO `trainset` VALUES ('27', '网友一年有292小时刷社交媒体 平均每天开微信145次', '网友一年有292小时刷社交媒体 平均每天开微信145次', '0');
INSERT INTO `trainset` VALUES ('28', '成都今年将建85个社区养老院 每家30张床位以上', '成都今年将建85个社区养老院 每家30张床位以上', '0');
INSERT INTO `trainset` VALUES ('29', '省十二届人大四次会议闭幕 王东明主持并讲话', '省十二届人大四次会议闭幕 王东明主持并讲话', '0');
INSERT INTO `trainset` VALUES ('30', '200多成都客 泰国机场一日游 疑飞机故障', '200多成都客 泰国机场一日游 疑飞机故障', '0');
INSERT INTO `trainset` VALUES ('31', '雅西高速最强降雪 路面积雪40厘米可堆雪人', '雅西高速最强降雪 路面积雪40厘米可堆雪人', '0');
INSERT INTO `trainset` VALUES ('32', '成都女士ATM机上跨行取1000元 账上扣了钱没到手', '成都女士ATM机上跨行取1000元 账上扣了钱没到手', '0');
INSERT INTO `trainset` VALUES ('33', '2月1起成都交警严管火车北站片区交通秩序', '2月1起成都交警严管火车北站片区交通秩序', '0');
INSERT INTO `trainset` VALUES ('34', '遂宁业主两年前交钱买房 未见开发商修建一栋楼', '遂宁业主两年前交钱买房 未见开发商修建一栋楼', '0');
INSERT INTO `trainset` VALUES ('35', '乐山大佛峨眉山游客持续高涨 增派官兵维护秩序', '乐山大佛峨眉山游客持续高涨 增派官兵维护秩序', '0');
INSERT INTO `trainset` VALUES ('36', '12日起四川盆地降温降水 返程高峰需注意行车安全', '12日起四川盆地降温降水 返程高峰需注意行车安全', '0');
INSERT INTO `trainset` VALUES ('37', '组雅西高速迎车流高峰 司机应急道扔垃圾谩骂交警', '组雅西高速迎车流高峰 司机应急道扔垃圾谩骂交警', '0');
INSERT INTO `trainset` VALUES ('38', '假期过半成都人出行热情不减 宾馆入住率超50', '假期过半成都人出行热情不减 宾馆入住率超50', '0');
INSERT INTO `trainset` VALUES ('39', '组春节成都汽车祈福花样多 烧黄纸洒鸡血', '组春节成都汽车祈福花样多 烧黄纸洒鸡血', '0');
INSERT INTO `trainset` VALUES ('40', '成都一女子回婆家过年 穿衬衣吃凉拌面', '成都一女子回婆家过年 穿衬衣吃凉拌面', '0');
INSERT INTO `trainset` VALUES ('41', '成都车主用涂改液伪造车牌 交警你咋不上天呢', '成都车主用涂改液伪造车牌 交警你咋不上天呢', '0');
INSERT INTO `trainset` VALUES ('42', '组成都农家乐扎假桃花 游客打拥堂', '组成都农家乐扎假桃花 游客打拥堂', '0');
INSERT INTO `trainset` VALUES ('43', '成都留守人母亲住院错过陪两个儿子', '成都留守人母亲住院错过陪两个儿子', '0');
INSERT INTO `trainset` VALUES ('44', '川大女生为尽孝回新疆兵团农场当牛倌 日进千元', '川大女生为尽孝回新疆兵团农场当牛倌 日进千元', '0');
INSERT INTO `trainset` VALUES ('45', '雅西高速迎车流高峰 司机应急道扔垃圾谩骂交警', '雅西高速迎车流高峰 司机应急道扔垃圾谩骂交警', '0');
INSERT INTO `trainset` VALUES ('46', '德阳游客沙滩上打麻将 享受日光浴', '德阳游客沙滩上打麻将 享受日光浴', '0');
INSERT INTO `trainset` VALUES ('47', '绵阳打造不夜城 网友美呆了', '绵阳打造不夜城 网友美呆了', '0');
INSERT INTO `trainset` VALUES ('48', '四川现接吻大赛 时间最长情侣获钻戒', '四川现接吻大赛 时间最长情侣获钻戒', '0');
INSERT INTO `trainset` VALUES ('49', '成都一店铺开业放鞭炮讨好兆头 不料遭罚200元', '成都一店铺开业放鞭炮讨好兆头 不料遭罚200元', '0');
INSERT INTO `trainset` VALUES ('50', '广元某村寿宴不收礼之风盛行不拿父母生日赚钱', '广元某村寿宴不收礼之风盛行不拿父母生日赚钱', '0');
INSERT INTO `trainset` VALUES ('52', '强降雨导致广安2人死亡 巴中达州7人失踪\n', '强降雨导致广安2人死亡 巴中达州7人失踪\n', '1');
INSERT INTO `trainset` VALUES ('53', '四川遭遇强降雨天气 已致4人死亡多人失踪\n', '四川遭遇强降雨天气 已致4人死亡多人失踪\n', '1');
INSERT INTO `trainset` VALUES ('54', '男子成都公交上喊话不下车就杀人 引发骚动\n', '男子成都公交上喊话不下车就杀人 引发骚动\n', '1');
INSERT INTO `trainset` VALUES ('55', '广安一房屋被泥石流推进4米 爷孙俩被埋遇难\n', '广安一房屋被泥石流推进4米 爷孙俩被埋遇难\n', '1');
INSERT INTO `trainset` VALUES ('56', '驾驶员掏手机接电话 酿成四车连环相撞\n', '驾驶员掏手机接电话 酿成四车连环相撞\n', '1');
INSERT INTO `trainset` VALUES ('57', '绵阳文化广场处某银行发生一起持刀抢劫案\n', '绵阳文化广场处某银行发生一起持刀抢劫案\n', '1');
INSERT INTO `trainset` VALUES ('58', '乐山七旬老人无证驾驶 停车场内撞死10岁女孩\n', '乐山七旬老人无证驾驶 停车场内撞死10岁女孩\n', '1');
INSERT INTO `trainset` VALUES ('59', '宜宾一卧室起火老人被烧死 疑使用取暖器不当\n', '宜宾一卧室起火老人被烧死 疑使用取暖器不当\n', '1');
INSERT INTO `trainset` VALUES ('60', '绵阳客运车超载94 司机涉嫌危险驾驶获刑3个月\n', '绵阳客运车超载94 司机涉嫌危险驾驶获刑3个月\n', '1');
INSERT INTO `trainset` VALUES ('61', '自贡临租房发生大火 71名消防官兵奋力扑救\n', '自贡临租房发生大火 71名消防官兵奋力扑救\n', '1');
INSERT INTO `trainset` VALUES ('62', '西昌城区一酒店大楼起火\n', '西昌城区一酒店大楼起火\n', '1');
INSERT INTO `trainset` VALUES ('63', '宜宾5名孩子误食夺命野生菌 3人中毒身亡2人正抢救\n', '宜宾5名孩子误食夺命野生菌 3人中毒身亡2人正抢救\n', '1');
INSERT INTO `trainset` VALUES ('64', '京昆高速广元段一载30余吨乙醇罐车泄露 拥堵6小时\n', '京昆高速广元段一载30余吨乙醇罐车泄露 拥堵6小时\n', '1');
INSERT INTO `trainset` VALUES ('65', '南充一轿车在街头自燃 起火原因不明\n', '南充一轿车在街头自燃 起火原因不明\n', '1');
INSERT INTO `trainset` VALUES ('66', '连日降雪凉山受影响 前往泸沽湖两条省道双向封闭\n', '连日降雪凉山受影响 前往泸沽湖两条省道双向封闭\n', '1');
INSERT INTO `trainset` VALUES ('67', '宜宾一辆铲车摔个底朝天司机被困 消防顶车救人\n', '宜宾一辆铲车摔个底朝天司机被困 消防顶车救人\n', '1');
INSERT INTO `trainset` VALUES ('68', '资阳市民放烟花引发火灾 房间被烧得一片狼藉\n', '资阳市民放烟花引发火灾 房间被烧得一片狼藉\n', '1');
INSERT INTO `trainset` VALUES ('69', '达州一武校校长因口角与人抓扯 被刺数刀身亡\n', '达州一武校校长因口角与人抓扯 被刺数刀身亡\n', '1');
INSERT INTO `trainset` VALUES ('70', '宜宾发生离奇车祸 无人驾驶车撞3人致1人死亡\n', '宜宾发生离奇车祸 无人驾驶车撞3人致1人死亡\n', '1');
INSERT INTO `trainset` VALUES ('71', '德阳一辆轿车凌晨掉进堰塘 车辆打捞上岸司机已身亡\n', '德阳一辆轿车凌晨掉进堰塘 车辆打捞上岸司机已身亡\n', '1');
INSERT INTO `trainset` VALUES ('72', '南充男子陪妻练车坠入20米悬崖 妻子当场死亡\n', '南充男子陪妻练车坠入20米悬崖 妻子当场死亡\n', '1');
INSERT INTO `trainset` VALUES ('73', '60岁老人在南充遇车祸身亡 尸体至今无人认领\n', '60岁老人在南充遇车祸身亡 尸体至今无人认领\n', '1');
INSERT INTO `trainset` VALUES ('74', '货车成绵高速路冲过隔离带 撞上小货车致两人死亡\n', '货车成绵高速路冲过隔离带 撞上小货车致两人死亡\n', '1');
INSERT INTO `trainset` VALUES ('75', '宜宾发生持刀砍人事件 凶手亲人一死三伤\n', '宜宾发生持刀砍人事件 凶手亲人一死三伤\n', '1');
INSERT INTO `trainset` VALUES ('76', '南充一年轻女子坠河身亡 市民以为是玩具娃娃\n', '南充一年轻女子坠河身亡 市民以为是玩具娃娃\n', '1');
INSERT INTO `trainset` VALUES ('77', '绵阳夫妻室内烤火取暖 一氧化碳中毒双双死亡\n', '绵阳夫妻室内烤火取暖 一氧化碳中毒双双死亡\n', '1');
INSERT INTO `trainset` VALUES ('78', '宜宾女子手上火炮没来得及扔 车内爆炸致4人受伤\n', '宜宾女子手上火炮没来得及扔 车内爆炸致4人受伤\n', '1');
INSERT INTO `trainset` VALUES ('79', '南充14岁女学生被货车撞倒当场身亡 魂断上学路\n', '南充14岁女学生被货车撞倒当场身亡 魂断上学路\n', '1');
INSERT INTO `trainset` VALUES ('80', '成都某学校学生寝室内被杀 家长拉横幅讨说法\n', '成都某学校学生寝室内被杀 家长拉横幅讨说法\n', '1');
INSERT INTO `trainset` VALUES ('81', '泸州一租户疏忽引发大火 现场火光冲天浓烟滚滚\n', '泸州一租户疏忽引发大火 现场火光冲天浓烟滚滚\n', '1');
INSERT INTO `trainset` VALUES ('82', '内江一老人跳下西林大桥 抢救无效身亡\n', '内江一老人跳下西林大桥 抢救无效身亡\n', '1');
INSERT INTO `trainset` VALUES ('83', '乐山养鸡场焚烧鸡粪引燃民房 众人合力扑救\n', '乐山养鸡场焚烧鸡粪引燃民房 众人合力扑救\n', '1');
INSERT INTO `trainset` VALUES ('84', '南充一人涉嫌醉驾 发生事故造成2死3伤\n', '南充一人涉嫌醉驾 发生事故造成2死3伤\n', '1');
INSERT INTO `trainset` VALUES ('85', '国内资深攀冰者四姑娘山冲坠罹难\n', '国内资深攀冰者四姑娘山冲坠罹难\n', '1');
INSERT INTO `trainset` VALUES ('86', '除夕夜乐山命案致1死1伤 警方悬赏2万元缉凶\n', '除夕夜乐山命案致1死1伤 警方悬赏2万元缉凶\n', '1');
INSERT INTO `trainset` VALUES ('87', '四川春运中的浪漫男子向动妹女友求婚\n', '四川春运中的浪漫男子向动妹女友求婚\n', '1');
INSERT INTO `trainset` VALUES ('88', '台湾高雄强烈地震 在台南成都人亲历讲述\n', '台湾高雄强烈地震 在台南成都人亲历讲述\n', '1');
INSERT INTO `trainset` VALUES ('89', '成都公交司机团年酒后开车 肇事致一人死亡\n', '成都公交司机团年酒后开车 肇事致一人死亡\n', '1');
INSERT INTO `trainset` VALUES ('90', '阆中古城客栈失火 住店情侣一死一伤\n', '阆中古城客栈失火 住店情侣一死一伤\n', '1');
INSERT INTO `trainset` VALUES ('91', '雅安芦山县发生41级地震 震源深度17千米\n', '雅安芦山县发生41级地震 震源深度17千米\n', '1');
INSERT INTO `trainset` VALUES ('92', '自贡驴友穿越稻城亚丁 因高原反应不幸死亡\n', '自贡驴友穿越稻城亚丁 因高原反应不幸死亡\n', '1');
INSERT INTO `trainset` VALUES ('93', '成都一男子街边喝农药自杀 曾在此滞留喝酒\n', '成都一男子街边喝农药自杀 曾在此滞留喝酒\n', '1');
INSERT INTO `trainset` VALUES ('94', '南充一男子为帮表弟出气 被刀捅到心脏当场死亡\n', '南充一男子为帮表弟出气 被刀捅到心脏当场死亡\n', '1');
INSERT INTO `trainset` VALUES ('95', '客车车门路上突然打开 川籍女子坠车被碾压致死\n', '客车车门路上突然打开 川籍女子坠车被碾压致死\n', '1');
INSERT INTO `trainset` VALUES ('96', '自贡一男子怀疑母亲有外遇 放火烧房泄愤\n', '自贡一男子怀疑母亲有外遇 放火烧房泄愤\n', '1');
INSERT INTO `trainset` VALUES ('97', '成都两车小擦挂引发争吵 轿车碾死拦车的哥\n', '成都两车小擦挂引发争吵 轿车碾死拦车的哥\n', '1');
INSERT INTO `trainset` VALUES ('98', '眉山一服装店突发大火 火势蔓延凶猛幸无伤亡\n', '眉山一服装店突发大火 火势蔓延凶猛幸无伤亡\n', '1');
INSERT INTO `trainset` VALUES ('99', '雅西高速德昌段一货车修车时被追尾 致2死1伤\n', '雅西高速德昌段一货车修车时被追尾 致2死1伤\n', '1');
INSERT INTO `trainset` VALUES ('100', '乐山一摩托车卷入小货车下 驾驶员当场死亡\n', '乐山一摩托车卷入小货车下 驾驶员当场死亡\n', '1');
INSERT INTO `trainset` VALUES ('101', '成都一住宅小区起火3人死亡', '成都一住宅小区起火3人死亡', '1');
