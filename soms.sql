/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : soms

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 29/04/2019 09:34:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_username` varchar(64) DEFAULT NULL COMMENT '管理员用户名',
  `admin_password` varchar(64) DEFAULT NULL COMMENT '管理员密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN;
INSERT INTO `admin` VALUES (1, 'somsadmin', 'somsadmin');
COMMIT;

-- ----------------------------
-- Table structure for doctor_info
-- ----------------------------
DROP TABLE IF EXISTS `doctor_info`;
CREATE TABLE `doctor_info` (
  `doctor_id` varchar(64) NOT NULL COMMENT '医生id',
  `doctor_name` varchar(64) NOT NULL COMMENT '医生姓名',
  `doctor_sex` int(11) NOT NULL COMMENT '医生性别',
  `doctor_username` varchar(64) NOT NULL COMMENT '医生登陆账号',
  `doctor_password` varchar(64) NOT NULL COMMENT '医生登陆密码',
  `doctor_notes` varchar(64) NOT NULL COMMENT '擅长行业',
  `createtime` timestamp NOT NULL COMMENT '医生创建时间',
  `updatetime` timestamp NOT NULL COMMENT '医生更新时间',
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of doctor_info
-- ----------------------------
BEGIN;
INSERT INTO `doctor_info` VALUES ('1', '李四', 1, 'lisidoctor', 'lisidoctor', '擅长xxsss', '2019-04-22 21:38:31', '2019-04-24 04:14:11');
INSERT INTO `doctor_info` VALUES ('7379461556194545986', '历史', 1, 'history123', 'history', '萨达', '2019-04-25 07:15:46', '2019-04-25 07:16:11');
COMMIT;

-- ----------------------------
-- Table structure for drug_category
-- ----------------------------
DROP TABLE IF EXISTS `drug_category`;
CREATE TABLE `drug_category` (
  `drug_category_id` varchar(64) NOT NULL,
  `drug_category_name` varchar(64) NOT NULL,
  `drug_category_type` varchar(64) NOT NULL,
  `createtime` timestamp NOT NULL,
  `updatetime` timestamp NOT NULL,
  PRIMARY KEY (`drug_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of drug_category
-- ----------------------------
BEGIN;
INSERT INTO `drug_category` VALUES ('1', '感冒用药', '1', '2019-04-19 17:41:03', '2019-04-19 17:41:07');
INSERT INTO `drug_category` VALUES ('2', '肠胃用药', '2', '2019-04-19 17:41:29', '2019-04-19 17:41:38');
INSERT INTO `drug_category` VALUES ('3', '呼吸道用药', '3', '2019-04-19 17:42:04', '2019-04-19 17:42:06');
INSERT INTO `drug_category` VALUES ('4', '营养保健', '4', '2019-04-19 17:42:29', '2019-04-19 17:42:33');
INSERT INTO `drug_category` VALUES ('5', '皮肤用药', '5', '2019-04-19 17:42:50', '2019-04-19 17:42:54');
INSERT INTO `drug_category` VALUES ('6', '五官科用药', '6', '2019-04-19 17:43:11', '2019-04-19 17:43:15');
INSERT INTO `drug_category` VALUES ('7', '其他', '7', '2019-04-19 17:43:37', '2019-04-19 17:43:41');
COMMIT;

-- ----------------------------
-- Table structure for drug_info
-- ----------------------------
DROP TABLE IF EXISTS `drug_info`;
CREATE TABLE `drug_info` (
  `drug_id` varchar(64) NOT NULL,
  `drug_info_name` varchar(32) NOT NULL COMMENT '药品名称',
  `drug_info_quenity` int(11) NOT NULL COMMENT '药品数量',
  `drug_info_statue` int(11) NOT NULL COMMENT '药品状态',
  `drug_info_type` varchar(32) NOT NULL COMMENT '药品类别',
  `drug_info_price` decimal(8,2) NOT NULL COMMENT '当前价格,单位分',
  `drug_info_description` varchar(64) NOT NULL COMMENT '药品描述',
  `createtime` timestamp NOT NULL,
  `updatetime` timestamp NOT NULL,
  PRIMARY KEY (`drug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of drug_info
-- ----------------------------
BEGIN;
INSERT INTO `drug_info` VALUES ('1', '维威清火片', 998, 2, '1', 16.50, '主治功能：清热泻火，通便。用于咽喉肿痛，牙痛，头目眩晕，口鼻生疮，风火目赤，大便不通', '2019-04-19 17:47:00', '2019-04-26 22:37:02');
INSERT INTO `drug_info` VALUES ('10', '慢严舒柠复方青橄榄利咽含片', 999, 2, '3', 22.00, '滋阴清热、利咽解毒。适用于咽部灼热，疼痛，咽干不适。', '2019-04-20 08:17:33', '2019-04-20 08:17:36');
INSERT INTO `drug_info` VALUES ('11', '999咽炎片', 999, 2, '3', 28.00, '养阴润肺，镇咳止痒，清热解毒，清利咽喉，用于慢性咽炎引起咽痒，咽干，刺激性咳嗽', '2019-04-20 08:19:08', '2019-04-20 08:19:13');
INSERT INTO `drug_info` VALUES ('12', '葛仙翁喉康散', 999, 2, '3', 19.80, '清热解毒，消炎止痛。用于各种咽喉疾患，如急性、慢性咽炎，喉炎，扁桃体炎，口腔溃疡', '2019-04-20 08:22:32', '2019-04-20 08:22:36');
INSERT INTO `drug_info` VALUES ('13', '养生堂天然维生素E软胶囊', 999, 2, '4', 128.00, '延缓衰老，可用于预防流产、不孕症、早产等的辅助治疗。美容润肤，防晒祛斑，白皙肌肤。调理内分泌，保持皮肤水油平衡', '2019-04-20 08:29:59', '2019-04-20 08:30:03');
INSERT INTO `drug_info` VALUES ('14', '罗汉果破壁饮片', 999, 2, '4', 129.00, '治疗肺热燥咳，咽痛失音，肠燥便秘，有显著疗效', '2019-04-20 08:32:39', '2019-04-20 08:32:44');
INSERT INTO `drug_info` VALUES ('15', '天麻破壁饮片', 999, 2, '4', 160.00, '具有熄风止痉，平抑肝阳，祛购通络。用于小儿惊风，癫痫抽搐，破伤风，头痛眩晕，手足不遂，肢体麻木，风湿痹痛', '2019-04-20 08:37:12', '2019-04-20 08:37:17');
INSERT INTO `drug_info` VALUES ('16', '999红糖姜茶', 999, 2, '4', 40.00, '预防风寒感冒、除胃寒，暖胃、治痛经暖宫等多种功效', '2019-04-20 08:39:56', '2019-04-20 08:40:01');
INSERT INTO `drug_info` VALUES ('2', '刻康感冒退烧片', 995, 2, '1', 22.00, ' 清热散风，解表。用于内热外感风寒引起的四肢酸懒，发烧怕冷，鼻流清涕，咳嗽咽痒。', '2019-04-20 00:13:28', '2019-04-20 00:13:30');
INSERT INTO `drug_info` VALUES ('2136161556338541961', '123', 999, 1, '1', 16.50, '123', '2019-04-26 23:15:42', '2019-04-26 23:15:42');
INSERT INTO `drug_info` VALUES ('3', '999板蓝根颗粒(袋装)', 996, 2, '1', 23.50, '清热解毒，凉血利咽。用于肺胃热盛所致的咽喉肿痛、口咽干燥；急性扁桃体炎见上述证候者。', '2019-04-20 00:30:34', '2019-04-20 00:30:38');
INSERT INTO `drug_info` VALUES ('4', '白云山清开灵胶囊', 996, 2, '1', 14.90, '清热解毒，镇静安神。本品用于外感风热所致发热，烦躁不安，咽喉肿痛;及上呼吸道感染、病毒性感冒、急性咽炎见上述证候者。', '2019-04-20 00:42:08', '2019-04-20 00:42:12');
INSERT INTO `drug_info` VALUES ('5', '康恩贝肠炎宁', 998, 2, '2', 39.79, '清热利湿，行气。用于大肠湿热所致的泄泻，症见大便泄泻、腹痛腹胀；急慢性胃肠炎、腹泻、小儿消化不良见上述证候者。', '2019-04-20 00:45:19', '2019-04-20 00:45:22');
INSERT INTO `drug_info` VALUES ('6', '葵花胃康灵胶囊', 999, 2, '2', 30.00, '柔肝和胃，散瘀，缓急止痛。用于肝胃不和、瘀血阻络所致的胃脘疼痛、连及两胁、嗳气、泛酸；慢性胃炎见上述证候者。', '2019-04-20 00:46:46', '2019-04-20 00:46:50');
INSERT INTO `drug_info` VALUES ('7', '陈李济补脾益肠丸', 999, 2, '2', 15.00, '补中益气，健脾和胃，涩肠止泻。主治脾虚泄泻证。用于治疗腹泻腹痛，腹胀肠鸣，粘液血便或阳虚便秘等症。', '2019-04-20 00:48:45', '2019-04-20 00:48:49');
INSERT INTO `drug_info` VALUES ('8', '思密达蒙脱石散', 999, 2, '2', 25.00, '成人及儿童急、慢性腹泻。用于食道、胃、十二指肠疾病引起的相关疼痛症状的辅助治疗，但本品不作解痉剂使用。', '2019-04-20 00:50:06', '2019-04-20 00:50:10');
INSERT INTO `drug_info` VALUES ('9', '纳必通盐酸氨溴索口服溶液', 999, 2, '3', 24.20, '适用于急，慢性呼吸道疾病（如急，慢性支气管炎，支气管哮喘，支气管扩张，肺结核等）引起的痰液粘稠，咳痰困难', '2019-04-20 08:16:12', '2019-04-20 08:16:16');
COMMIT;

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `order_detail_id` varchar(64) NOT NULL COMMENT 'order_detail表主键',
  `order_master_id` varchar(64) NOT NULL COMMENT 'order_master表主键',
  `drug_id` varchar(32) NOT NULL COMMENT '药品主键',
  `drug_name` varchar(32) NOT NULL COMMENT '药品名称',
  `order_detail_price` decimal(8,2) NOT NULL COMMENT '当前价格,单位分',
  `drug_quentily` int(11) NOT NULL COMMENT '药品数量',
  `order_detail_status` int(11) NOT NULL COMMENT '订单状态',
  `createtime` timestamp NOT NULL,
  `updatetime` timestamp NOT NULL,
  PRIMARY KEY (`order_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
BEGIN;
INSERT INTO `order_detail` VALUES ('2788681556500494023', 'fd9832d5-df99-4482-aeb0-75cfff0f36fa-2019-04-29', '1', '维威清火片', 16.50, 1, 1, '2019-04-28 20:14:54', '2019-04-28 20:14:54');
COMMIT;

-- ----------------------------
-- Table structure for order_master
-- ----------------------------
DROP TABLE IF EXISTS `order_master`;
CREATE TABLE `order_master` (
  `order_master_id` varchar(64) NOT NULL,
  `doctor_id` varchar(32) NOT NULL COMMENT '医生主键',
  `user_id` varchar(32) NOT NULL,
  `order_price` decimal(8,2) DEFAULT NULL COMMENT '订单总价',
  `pay_status` int(11) DEFAULT NULL COMMENT '支付状态',
  `order_notes` varchar(128) DEFAULT NULL COMMENT '医嘱',
  `order_description` varchar(64) NOT NULL COMMENT '症状描述',
  `order_time` timestamp NOT NULL,
  `order_status` int(11) NOT NULL COMMENT '订单状态',
  `order_status_toup` int(11) DEFAULT NULL COMMENT '订单报销状态',
  `createtime` timestamp NOT NULL,
  `updatetime` timestamp NOT NULL,
  PRIMARY KEY (`order_master_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of order_master
-- ----------------------------
BEGIN;
INSERT INTO `order_master` VALUES ('fd9832d5-df99-4482-aeb0-75cfff0f36fa-2019-04-29', '1', '1', 16.50, 2, '1', '感冒发烧12', '2019-04-28 19:00:00', 3, NULL, '2019-04-28 20:14:12', '2019-04-28 20:14:12');
COMMIT;

-- ----------------------------
-- Table structure for symptom
-- ----------------------------
DROP TABLE IF EXISTS `symptom`;
CREATE TABLE `symptom` (
  `symptom_id` int(11) NOT NULL AUTO_INCREMENT,
  `notes_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`symptom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of symptom
-- ----------------------------
BEGIN;
INSERT INTO `symptom` VALUES (1, '感冒发烧');
INSERT INTO `symptom` VALUES (2, '头晕');
COMMIT;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` varchar(64) NOT NULL,
  `user_name` varchar(64) NOT NULL COMMENT '学生姓名',
  `user_sex` int(11) NOT NULL COMMENT '学生性别',
  `user_password` varchar(64) NOT NULL COMMENT '学生登陆密码',
  `user_username` varchar(64) NOT NULL COMMENT '学生登陆用户名',
  `user_statue` int(11) NOT NULL COMMENT '学生信息确认',
  `user_dept` varchar(32) NOT NULL COMMENT '学生系部',
  `user_class` varchar(32) NOT NULL COMMENT '学生班级',
  `user_phone` varchar(32) NOT NULL COMMENT '学生电话',
  `user_img` varchar(64) NOT NULL COMMENT '学生照片',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_info
-- ----------------------------
BEGIN;
INSERT INTO `user_info` VALUES ('1', '张某某', 1, '123456', '123456', 1, '计算机科学与技术', '15软件工程1班', '12313131', '1');
INSERT INTO `user_info` VALUES ('2741281556195460762', '李某某', 1, '123456', 'limoumou', 1, '软件工程系123', 'sda', 'sda', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
