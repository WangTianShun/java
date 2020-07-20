/*
Navicat MySQL Data Transfer

Source Server         : wts_jsp
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : gym

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2020-05-13 14:56:27
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO admin VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for `card`
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
  `card_id` int(11) NOT NULL AUTO_INCREMENT,
  `card_no` varchar(20) NOT NULL,
  `card_grade` varchar(20) NOT NULL,
  `card_begin` date NOT NULL,
  `card_end` date NOT NULL,
  `card_account` double NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`card_id`),
  KEY `FKl4gbym62l738id056y12rt6q6` (`user_id`),
  CONSTRAINT `FKl4gbym62l738id056y12rt6q6` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of card
-- ----------------------------
INSERT INTO card VALUES ('2', '2', '白银会员', '2020-03-01', '2020-03-07', '12', '18');
INSERT INTO card VALUES ('3', '3', '白银会员', '2020-03-07', '2020-03-31', '3', '13');

-- ----------------------------
-- Table structure for `coach`
-- ----------------------------
DROP TABLE IF EXISTS `coach`;
CREATE TABLE `coach` (
  `coach_id` int(11) NOT NULL AUTO_INCREMENT,
  `coach_name` varchar(20) NOT NULL,
  `coach_gender` varchar(20) NOT NULL,
  `coach_grade` varchar(20) NOT NULL,
  `coach_phone` varchar(20) NOT NULL,
  `coach_email` varchar(20) NOT NULL,
  `coach_entry` date NOT NULL,
  `coach_no` varchar(20) NOT NULL,
  `coach_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`coach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coach
-- ----------------------------
INSERT INTO coach VALUES ('1', '大壮', '男', '初级教练', '18896736055', '563540326@qq.com', '2020-02-01', '1', 'coachs/coach1.png');
INSERT INTO coach VALUES ('2', '壮壮', '男', '初级教练', '18896736055', '563540326@qq.com', '2020-02-02', '2', 'coachs/coach3.png');
INSERT INTO coach VALUES ('3', '钱文', '女', '初级教练', '18896736055', '563540326@qq.com', '2020-02-07', '3', 'coachs/coach2.png');
INSERT INTO coach VALUES ('4', '张三', '女', '中级教练', '18896736055', '563540326@qq.com', '2020-02-22', '4', 'coachs/coach5.png');
INSERT INTO coach VALUES ('5', '李四', '男', '中级教练', '13584320829', '563540326@qq.com', '2020-03-01', '5', 'coachs/coach4.png');
INSERT INTO coach VALUES ('6', '王五', '男', '中级教练', '18896736055', '563540326@qq.com', '2020-03-08', '6', 'coachs/coach6.png');
INSERT INTO coach VALUES ('8', '赵亚', '男', '中级教练', '13584320829', '563540326@qq.com', '2020-03-02', '7', 'coachs/coach7.png');
INSERT INTO coach VALUES ('9', '孙权', '男', '高级教练', '13921793417', '563540326@qq.com', '2020-03-01', '8', 'coachs/coach8.png');
INSERT INTO coach VALUES ('10', '王依依', '女', '初级教练', '13584320829', '563540326@qq.com', '2020-03-01', '9', 'coachs/coach9.png');
INSERT INTO coach VALUES ('11', '张子枫', '男', '高级教练', '13584320829', '563540326@qq.com', '2020-03-01', '10', 'coachs/coach10.png');
INSERT INTO coach VALUES ('12', '王子枫', '女', '中级教练', '13921793417', '563540326@qq.com', '2020-04-04', '11', 'coachs/coach2.png');
INSERT INTO coach VALUES ('13', '隔壁老樊', '男', '初级教练', '13921793417', '563540326@qq.com', '2020-04-01', '12', 'coachs/coach8.png');

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(20) NOT NULL,
  `course_type` varchar(20) NOT NULL,
  `course_cost` double NOT NULL,
  `course_time` varchar(20) NOT NULL,
  `course_count` int(11) NOT NULL,
  `course_info` varchar(255) NOT NULL,
  `coach_id` int(11) NOT NULL,
  `course_no` varchar(20) NOT NULL,
  `course_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `FK2q0hborxuhg47aryws9woqlf1` (`coach_id`),
  CONSTRAINT `FK2q0hborxuhg47aryws9woqlf1` FOREIGN KEY (`coach_id`) REFERENCES `coach` (`coach_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO course VALUES ('1', '瑜伽', '有氧', '200', '18：00-20：00', '3', '瑜伽：（英文：Yoga，印地语：योग）印度梵语“yug”或“yuj”而来，其含意为“一致”、“结合”或“和谐”。瑜伽源于古印度，是古印度六大哲学派别中的一系，探寻“梵我合一”的道理与方法。而现代人所称的瑜伽则主要是一系列的修身养心方法。', '3', '101', 'equips/course_yujia.png');
INSERT INTO course VALUES ('2', '游泳', '有氧', '100', '周末14：00-16：00', '20', '游泳(Swimming )，是人在水的浮力作用下产生向上漂浮，凭借浮力通过肢体有规律的运动，使身体在水中有规律运动的技能。', '1', '102', 'equips/course_youyong.png');
INSERT INTO course VALUES ('3', '搏击操', '有氧', '300', '每天 10：00-12：00', '30', '搏击操，是一种有氧操，是Aerobics的又一创新，它结合了拳击、泰拳、跆拳道、散手、太极的基本动作，遵循健美操最新编排方法，在强有力的音乐节拍下完成的一种身体锻炼方式。', '5', '103', 'equips/course_boji.png');
INSERT INTO course VALUES ('4', '莱美课程', '有氧', '300', '每天 10：00-12：00', '30', '莱美运动项目由一批顶级教练员、舞蹈设计师、运动生理学专家组成的开发小组研究设计，提供一整套针对锻炼者生理以及心理的训练。', '4', '104', 'courses/course_laimei.png');
INSERT INTO course VALUES ('5', '动感单车', '有氧', '200', '每天18：00-20：00', '20', '动感单车，英文名字（SPINNING），是由美国私人教练兼极限运动员JOHNNYG于二十世纪八十年代首创，是一种结合了音乐、视觉效果等独特的充满活力的室内自行车训练课程。', '6', '105', 'courses/course_danche.png');
INSERT INTO course VALUES ('6', '跆拳道', '无氧', '300', '每天 18：00-20：00', '30', '跆拳道（韩文：태권도，英文：Taekwondo），是现代奥运会正式比赛项目之一，是一种主要使用手及脚进行格斗或对抗的运动。', '2', '106', 'courses/course_taiquandao.png');
INSERT INTO course VALUES ('7', 'BODYPUMP', '有氧', '200', '周末14：00-16：00', '20', 'BODYPUMP 杠铃操是一项比较快速的瘦身运动，它是把杠铃和健身操进行了组合，可以塑造魅力体型，可以使你身心受益的运动。', '2', '108', 'courses/course_pudypump.png');
INSERT INTO course VALUES ('8', 'BODYATTACK', '无氧', '200', '周末16：00-18：00', '20', 'BODYATTACK 燃烧高热量的健身课程。动作既适合初学者，又能满足运动达人的需求，让你沉浸在运动的快乐中。', '5', '109', 'courses/course_bodyattack.png');
INSERT INTO course VALUES ('9', 'BODYJAM', '无氧', '200', '周末 10：00-12：00', '20', 'BODYJAM 音乐与舞蹈的绝佳融合趣味性强、让人疯狂上瘾的舞蹈训练课程，无需舞蹈基础，任何人都能获得派对体验。', '6', '1010', 'courses/course_bodyjam.png');
INSERT INTO course VALUES ('10', '单车', '有氧', '200', '20：00-22：00', '30', ' 30分钟高强度间歇单车训练课程，更快更有效地超越你的目标。\r\n', '1', '107', 'courses/course_cycle.png');
INSERT INTO course VALUES ('11', 'GRIT', '有氧', '300', '周末10：00-12：00', '30', 'LES MILLS GRIT ATHLETIC，30分钟高强度间歇训练课程，以增强式训练法为基础，打造运动员般的体能。', '4', '1011', 'equips/course_grit.png');

-- ----------------------------
-- Table structure for `equip`
-- ----------------------------
DROP TABLE IF EXISTS `equip`;
CREATE TABLE `equip` (
  `equip_id` int(11) NOT NULL AUTO_INCREMENT,
  `equip_name` varchar(20) NOT NULL,
  `equip_type` varchar(20) NOT NULL,
  `equip_count` int(11) NOT NULL,
  `equip_company` varchar(255) NOT NULL,
  `equip_purchase` date NOT NULL,
  `equip_state` varchar(20) NOT NULL,
  `equip_no` varchar(20) NOT NULL,
  `equip_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`equip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of equip
-- ----------------------------
INSERT INTO equip VALUES ('25', '电脑程式电动跑台', '有氧健身器材', '10', '菲特健身俱乐部', '2020-03-01', '良好', '1101', 'equips/oxygen_run1.png');
INSERT INTO equip VALUES ('26', '电动跑台', '有氧健身器材', '10', '兰博', '2020-03-01', '良好', '1102', 'equips/oxygen_run2.png');
INSERT INTO equip VALUES ('27', '电动跑步机', '有氧健身器材', '10', '菲特健身俱乐部', '2020-03-01', '良好', '1103', 'equips/oxygen_run3.png');
INSERT INTO equip VALUES ('28', '老人跑步机', '有氧健身器材', '10', '菲特健身俱乐部', '2020-03-01', '良好', '1104', 'equips/oxygen_run4.png');
INSERT INTO equip VALUES ('29', '跑步机', '有氧健身器材', '10', '兰博', '2020-03-01', '良好', '1105', 'equips/oxygen_run5.png');
INSERT INTO equip VALUES ('30', '直立式单车', '有氧健身器材', '10', '兰博', '2020-03-07', '良好', '1106', 'equips/oxygen_single1.png');
INSERT INTO equip VALUES ('31', '靠背式单车', '有氧健身器材', '10', '菲特健身俱乐部', '2020-03-01', '良好', '1107', 'equips/oxygen_single2.png');
INSERT INTO equip VALUES ('32', '室内单车', '有氧健身器材', '10', '兰博', '2020-03-01', '良好', '1108', 'equips/oxygen_single3.png');
INSERT INTO equip VALUES ('33', '动感单车', '有氧健身器材', '10', '兰博', '2020-03-01', '良好', '1109', 'equips/oxygen_dong1.png');
INSERT INTO equip VALUES ('34', '碳纤维室内竞速单车', '有氧健身器材', '10', '兰博', '2020-03-01', '良好', '11010', 'equips/oxygen_dong2.png');
INSERT INTO equip VALUES ('35', '碳纤维运动款单车', '有氧健身器材', '5', '菲特健身俱乐部', '2020-03-05', '良好', '11011', 'equips/oxygen_dong3.png');
INSERT INTO equip VALUES ('36', '电脑程式立式脚踏车', '有氧健身器材', '5', '力健美俱乐部', '2020-03-06', '良好', '11012', 'equips/oxygen_foot1.png');
INSERT INTO equip VALUES ('37', '电脑程式靠背式脚踏车', '有氧健身器材', '5', '菲特健身俱乐部', '2020-03-01', '良好', '11013', 'equips/oxygen_foot2.png');
INSERT INTO equip VALUES ('38', '直立健身车', '有氧健身器材', '2', '兰博', '2020-03-01', '良好', '11014', 'equips/oxygen_foot3.png');
INSERT INTO equip VALUES ('39', '磁控直立式脚踏车', '有氧健身器材', '10', '兰博', '2020-03-01', '良好', '11015', 'equips/oxygen_foot4.png');
INSERT INTO equip VALUES ('40', '磁控靠背式脚踏车', '有氧健身器材', '5', '兰博', '2020-03-08', '良好', '11016', 'equips/oxygen_foot6.png');
INSERT INTO equip VALUES ('41', '发电磁控靠背式脚踏车', '有氧健身器材', '5', '兰博', '2020-03-01', '良好', '11017', 'equips/oxygen_foot7.png');
INSERT INTO equip VALUES ('42', '美国康赛划船机', '有氧健身器材', '2', '菲特健身俱乐部', '2020-03-08', '良好', '11018', 'equips/oxygen_hua1.png');
INSERT INTO equip VALUES ('43', '划船器', '有氧健身器材', '2', '兰博', '2020-03-13', '良好', '11019', 'equips/oxygen_hua2.png');
INSERT INTO equip VALUES ('44', '登山机', '有氧健身器材', '5', '力健美俱乐部', '2020-03-01', '良好', '11020', 'equips/oxygen_deng1.png');
INSERT INTO equip VALUES ('45', '可调式腹肌椅', '自由力量训练器材', '5', '力健美俱乐部', '2020-02-01', '良好', '1201', 'equips/free_chair1.png');
INSERT INTO equip VALUES ('46', '可调式下斜腹肌椅', '自由力量训练器材', '5', '菲特健身俱乐部', '2020-03-01', '良好', '1202', 'equips/free_muscle1.png');
INSERT INTO equip VALUES ('47', '奥林匹克上斜腹肌椅', '自由力量训练器材', '5', '菲特健身俱乐部', '2020-03-21', '良好', '1203', 'equips/free_up1.png');
INSERT INTO equip VALUES ('48', '杠铃', '自由力量训练器材', '2', '兰博', '2020-03-01', '良好', '1204', 'equips/free_yaling1.png');
INSERT INTO equip VALUES ('49', '高拉训练机', '力量训练器材', '5', '菲特健身俱乐部', '2020-03-20', '良好', '1301', 'equips/li1.png');
INSERT INTO equip VALUES ('50', '多项推举训练机', '力量训练器材', '5', '菲特健身俱乐部', '2020-03-01', '良好', '1302', 'equips/li2.png');
INSERT INTO equip VALUES ('51', '腿部伸展训练机', '力量训练器材', '5', '兰博', '2020-03-01', '良好', '1303', 'equips/li3.png');
INSERT INTO equip VALUES ('52', '胸部推举训练机', '力量训练器材', '2', '力健美俱乐部', '2020-03-01', '良好', '1304', 'equips/li4.png');
INSERT INTO equip VALUES ('53', '臀肌训练机', '力量训练器材', '2', '力健美俱乐部', '2020-03-01', '良好', '1305', 'equips/li5.png');
INSERT INTO equip VALUES ('54', '俯卧式曲腿训练器', '力量训练器材', '2', '兰博', '2020-03-01', '良好', '1306', 'equips/li6.png');
INSERT INTO equip VALUES ('55', '腹肌/背肌训练机', '力量训练器材', '5', '菲特健身俱乐部', '2020-03-01', '良好', '1307', 'equips/li7.png');
INSERT INTO equip VALUES ('56', '蹬腿/小腿双功能训练机', '力量训练器材', '2', '菲特健身俱乐部', '2020-03-01', '良好', '1308', 'equips/li8.png');
INSERT INTO equip VALUES ('57', '45度角大腿训练器', '力量训练器材', '2', '菲特健身俱乐部', '2020-03-08', '损坏', '1309', 'equips/li9.png');
INSERT INTO equip VALUES ('58', '下拉训练器', '力量训练器材', '2', '菲特健身俱乐部', '2020-03-01', '良好', '1310', 'equips/li10.png');
INSERT INTO equip VALUES ('59', '五站式综合功能训练机', '力量训练器材', '5', '菲特健身俱乐部', '2020-03-01', '良好', '1311', 'equips/li11.png');
INSERT INTO equip VALUES ('60', '大腿训练器', '力量训练器材', '5', '兰博', '2020-04-01', '良好', '1312', 'equips/li9.png');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_title` varchar(255) NOT NULL,
  `news_time` date DEFAULT NULL,
  `news_content` text,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO news VALUES ('4', '冬天健身小卫士', '2020-03-08', '冬季运动的五点建议冬季活动量小，所以建议可以拿出闲暇时间来锻炼，但是冬季寒冷，锻炼时一定要多加留心，中医指出，冬季锻炼要注意五点：1.做准备活动。这是因为：冬季气温低，有些人，特别是老年人，四肢末端的血液循环变慢，韧带的弹性、伸展性和关节的伸展性较低，如果不做准备活动，容易引起运动中的伤害事故。冬季运动强身健体 养生保健的5点建议2. 别迎风呼吸。这是因为：冬季气候寒冷，在运动过程中，人体吸入大量的冷空气，对呼吸，消化等器官产生不良刺激，会诱发和加重呼吸和消化等器官方面的疾病。3. 动作忌猛、硬。这是因为：冬季气候寒冷，在运动过程中，动作猛，硬，易引起高血压、动脉硬化、脊椎骨质增生等疾病症状。4. 别戴口罩锻炼。冬季气候寒冷，有些人，特别是老年人因为怕冷、怕感冒而戴口罩锻炼，甚至戴口罩长跑，这是很不科学的做法。这是因为：口罩把鼻子挡住，不利于锻炼时通气量增加的需要，阻碍呼吸的顺利进行，影响氧气吸入，使人产生憋气、胸闷、心跳加快等不适感。5. 晨练后不要吃过烫食物。这是因为：冬季气候寒冷，在锻炼结束后，马上吃过烫食物，容易发生吐血、便血等病症。');
INSERT INTO news VALUES ('8', '运动健身后如何消除疲劳', '2020-03-01', '运动后先做一些放松活动，如先慢走200～300米或慢跑2～3分钟后，躺在海棉垫或藤垫上休息片刻，平躺时脚放置的位置应略高于头，这样有利于下肢血液回流到心脏。切不可躺在有水气的地上，避免受凉。然后做5～10分钟的伸展操，拉伸主要的肌肉群，如肩背部、腰腹部、上臂、大腿、小腿等。\r\n\r\n运动后按摩是消除疲劳的重要手段。按摩的主要手法有抖动、点穴、揉捏、叩打、推摩等。首先是抖动四肢，主要是放松肘、膝关节以及四肢肌肉群；揉捏叩打时，先推摩大肌肉，后推摩小肌肉，一侧推摩后，再推摩另一侧。也可互相进行全身推摩。\r\n\r\n在运动后进行洗浴，不仅可以清洁皮肤，使心情愉悦，还可以促进血液循环，加速体内代谢废物的排出，促进疲劳的消除。但不要运动一结束就冲向浴室洗澡，这很容易影响身体的血液循环，增加心脏的负担。尤其是蒸气浴和桑拿浴，如果训练后立刻使用很容易出现头晕等现象。\r\n\r\n注意营养物质的补充，保证运动中消耗的能源物质及时恢复，多食碱性食物如新鲜蔬菜、瓜果、豆制品、乳类和含有丰富蛋白质与维生素的动物肝脏等。这些食物经过人体消化吸收后，可以迅速地使血液酸度降低，中和平衡达到弱碱性，从而消除疲劳。\r\n\r\n睡眠是消除疲劳最有效的手段。要按时睡眠，养成良好的生活习惯。保证有足够的睡眠时间和睡眠质量。');
INSERT INTO news VALUES ('9', '不可轻视的健身误区', '2020-03-01', '误解1：跑步是好的健身方法\r\n\r\n没有哪一种健身方法是好的，对青少年来说，尽可能选择自己喜欢的运动。追求好，可能是想取得效果快。求快也是一种误解，取得健身效果需要时间和耐心。\r\n\r\n误解2：如果你不是每天1小时、每周5天锻炼，做什么都白做\r\n\r\n不要相信这种偏激的理论。事实是，即每天坚持锻炼一点点时间也会有很多益处。研究表明，每周两三次半小时的行走就能明显减低心脏病发病率、降低血压、缓解压力以及增强精力和免疫力。\r\n\r\n误解3：只要你小心注意，锻炼前不做热身运动也可以\r\n\r\n大错特错！训练前、后轻柔地伸拉及放松肌肉能防止多种严重运动损伤的发生。\r\n\r\n误解4：节食就能减肥\r\n\r\n并非如此。超过90%的靠节食减轻体重的人会反弹。节食只是暂时少吃，并未改变作的饮食习惯。应建立科学的饮食习惯，并要记住真正能减轻体重的是长期的体育锻炼。');
INSERT INTO news VALUES ('10', '空腹有氧训练', '2020-03-01', '以下是针对空腹有氧训练的专业建议：\r\n\r\n（1）选择清晨作为空腹有氧训练的时间，经历了8小时的睡眠后，此时的你处于完全空腹状态。\r\n\r\n（2）空腹有氧训练前，不要摄入任何富含碳水化合物的食物，包括水果、全谷物和糖等。\r\n\r\n（3）空腹有氧训练前，摄入10~20克乳清蛋白（粉）或5~10克支链氨基酸（BCAAs）可以防止肌肉分解。如果没有条件，可以食用3~5个蛋清。不推荐单独喝牛奶，因为牛奶中含有的碳水化合物过多。来自日本的研究表明，支链氨基酸可以增强有氧运动的燃脂效率。\r\n\r\n（4）在空腹有氧训练前半小时补充200~300毫升水。\r\n\r\n（5）空腹有氧训练时，每15分钟饮用150~300毫升水。');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_time` date NOT NULL,
  `orders_money` double NOT NULL,
  `orders_state` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`orders_id`),
  KEY `FKel9kyl84ego2otj2accfd8mr7` (`user_id`),
  KEY `FK1fks7gjdwcpi0clubcofi727l` (`course_id`),
  CONSTRAINT `FK1fks7gjdwcpi0clubcofi727l` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `FKel9kyl84ego2otj2accfd8mr7` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO orders VALUES ('22', '2020-03-01', '300', '预定', '13', '3');
INSERT INTO orders VALUES ('23', '2020-03-01', '300', '预定', '13', '4');
INSERT INTO orders VALUES ('28', '2020-04-25', '100', '已付款', '18', '2');
INSERT INTO orders VALUES ('32', '2020-04-26', '300', '已付款', '18', '4');
INSERT INTO orders VALUES ('35', '2020-04-26', '200', '已付款', '18', '1');
INSERT INTO orders VALUES ('36', '2020-04-26', '200', '预订', '18', '5');
INSERT INTO orders VALUES ('37', '2020-04-27', '200', '预订', '18', '1');
INSERT INTO orders VALUES ('38', '2020-04-27', '300', '预订', '18', '4');

-- ----------------------------
-- Table structure for `reception`
-- ----------------------------
DROP TABLE IF EXISTS `reception`;
CREATE TABLE `reception` (
  `reception_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`reception_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reception
-- ----------------------------
INSERT INTO reception VALUES ('2', 'ZB1018122', '123456', '王天顺', '男', '18896736055');
INSERT INTO reception VALUES ('4', 'zhangguorong', '123456', '张国荣', '男', '18896736055');
INSERT INTO reception VALUES ('5', 'zhourunfa', '123456', '周润发', '男', '18896736055');
INSERT INTO reception VALUES ('6', 'gaoyuanyuan', '123456', '高圆圆', '女', '18896736055');
INSERT INTO reception VALUES ('7', 'liushishi', '123456', '刘诗诗', '女', '18896736055');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `birth` date NOT NULL,
  `phone` varchar(20) NOT NULL,
  `identity` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO user VALUES ('13', 'wts123456', '123456', '王天顺', '男', '2020-02-23', '18896736055', '32032219951112361x', '563540326@qq.com');
INSERT INTO user VALUES ('18', 'ZB1018122', '123456', '王天顺', '男', '2020-03-13', '18896736055', '32032219951112361x', '563540326@qq.com');
INSERT INTO user VALUES ('19', 'zhangsan', '123456', '王天顺', '男', '2020-03-01', '18896736055', '32032219951112361x', '563540326@qq.com');
INSERT INTO user VALUES ('20', 'ZB1018140', '123456', '小丸子', '女', '2020-03-01', '13584320829', '32032219951112361x', '563540326@qq.com');
