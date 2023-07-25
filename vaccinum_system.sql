/*
 Navicat Premium Data Transfer

 Source Server         : mysql5.7
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : vaccinum_system

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 14/06/2023 08:25:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for appointable_list
-- ----------------------------
DROP TABLE IF EXISTS `appointable_list`;
CREATE TABLE `appointable_list`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `vaccinum_id` bigint(20) NULL DEFAULT NULL COMMENT '接种疫苗',
  `nums` int(11) NULL DEFAULT NULL COMMENT '可接种数量（剩余）',
  `app_num` int(11) NOT NULL COMMENT '已经预约数量',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接种地点',
  `app_date` date NULL DEFAULT NULL COMMENT '预约日期',
  `post_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '可预约疫苗列表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of appointable_list
-- ----------------------------
INSERT INTO `appointable_list` VALUES (1, 1, 100, 0, '奥体中心', '2023-04-15', '2023-04-11 09:19:47');

-- ----------------------------
-- Table structure for appointment
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '预约人',
  `vaccinum_id` bigint(20) NULL DEFAULT NULL COMMENT '接种疫苗',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接种地点',
  `app_date` date NULL DEFAULT NULL COMMENT '预约日期',
  `post_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(11) NULL DEFAULT NULL COMMENT '接种状态-0未接种-1完成接种',
  `doc_id` bigint(20) NULL DEFAULT NULL COMMENT '医护人员id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '疫苗预约' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of appointment
-- ----------------------------

-- ----------------------------
-- Table structure for health_info
-- ----------------------------
DROP TABLE IF EXISTS `health_info`;
CREATE TABLE `health_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `symptom` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '症状',
  `temperature` float NULL DEFAULT NULL COMMENT '体温',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '健康情况' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of health_info
-- ----------------------------

-- ----------------------------
-- Table structure for nuclein
-- ----------------------------
DROP TABLE IF EXISTS `nuclein`;
CREATE TABLE `nuclein`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '核酸编号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型-0大规模-常规',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测试地点',
  `mechanism` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测试机构',
  `create_time` datetime NULL DEFAULT NULL COMMENT '测试时间',
  `result` int(11) NULL DEFAULT NULL COMMENT '测试结果-0阴性-1阳性',
  `result_time` datetime NULL DEFAULT NULL COMMENT '结果时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '核酸' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of nuclein
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `phone` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `role` int(11) NULL DEFAULT 1 COMMENT '角色 - 0（管理员） - 1（用户） - 2（医护）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '12345678901', '123', 'http://localhost:8080/vaccinum/av1.png', 0);
INSERT INTO `user` VALUES (2, 'zhangsan', '12345678903', '123', 'http://localhost:8080/vaccinum/av2.png', 1);
INSERT INTO `user` VALUES (3, 'lisi', '12345679806', '123', 'http://localhost:8080/vaccinum/av3.png', 2);
INSERT INTO `user` VALUES (4, '王五', '12345678905', '123456', 'http://localhost:8080/vaccinum/av4.png', 1);
INSERT INTO `user` VALUES (5, '张三', '12345678911', '123456', NULL, 1);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `sex` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `job` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `status` int(11) NULL DEFAULT 0 COMMENT '用户通行码-0绿码-1黄码-2红码',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (2, '456379865132485', '752963252@qq.com', '男', 45, NULL, 2);
INSERT INTO `user_info` VALUES (3, '123465789651', '5689562@qq.com', '男', 16, NULL, 1);
INSERT INTO `user_info` VALUES (4, '45632498651320', '78946513@qq.com', '男', 36, NULL, 0);
INSERT INTO `user_info` VALUES (5, '798465132798465', '8563512@qq.com', '男', 58, '', 0);

-- ----------------------------
-- Table structure for vaccinum
-- ----------------------------
DROP TABLE IF EXISTS `vaccinum`;
CREATE TABLE `vaccinum`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '疫苗名称',
  `type` int(11) NULL DEFAULT NULL COMMENT '疫苗类型',
  `target` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目标人群',
  `effect` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作用',
  `adv_reactions` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不良反应',
  `producer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生产厂家',
  `create_time` date NULL DEFAULT NULL COMMENT '生产日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '疫苗' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vaccinum
-- ----------------------------
INSERT INTO `vaccinum` VALUES (1, '科兴疫苗', 1, '10~70岁的受众', '抵抗新冠病毒、预防', '会食欲不振', '生药科技公司', '2023-04-03');
INSERT INTO `vaccinum` VALUES (2, '甲流疫苗I', 2, '10~50岁人群', '预防甲流', '无', '生物医药科技', '2023-03-27');
INSERT INTO `vaccinum` VALUES (3, '九价疫苗', 3, '18~25岁女性', '预防人乳头瘤病毒', '无', '生物医药科技', '2023-03-14');
INSERT INTO `vaccinum` VALUES (4, '脊髓灰质炎疫苗', 4, '4~15岁儿童', '可有效地预防脊髓灰质炎(小儿麻痹症)', '无', '生物医药科技', '2023-03-14');
INSERT INTO `vaccinum` VALUES (5, '百白破制剂', 4, '4~15岁儿童', '可同时预防百日咳、白喉和破伤风', '无', '生物医药科技', '2023-03-14');
INSERT INTO `vaccinum` VALUES (6, '百白破制剂(新)', 10, '18~55岁人权', '预防百白', '无', '生药科技', '2023-04-21');
INSERT INTO `vaccinum` VALUES (7, '科兴流感', 1, '18~55岁人群', '抵抗流感', '无', '科兴', '2023-05-10');

-- ----------------------------
-- Table structure for vaccinum_type
-- ----------------------------
DROP TABLE IF EXISTS `vaccinum_type`;
CREATE TABLE `vaccinum_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '疫苗类型',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '疫苗类型' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vaccinum_type
-- ----------------------------
INSERT INTO `vaccinum_type` VALUES (1, '新冠病毒', '北京生物、科兴');
INSERT INTO `vaccinum_type` VALUES (2, '甲流', '预防甲流');
INSERT INTO `vaccinum_type` VALUES (3, '人乳头瘤病毒', '预防人乳头瘤病毒');
INSERT INTO `vaccinum_type` VALUES (4, '基础疫苗免疫用', '基础免疫用疫苗包括卡介苗、脊髓灰质炎疫苗、百白破三联疫苗和麻疹疫苗');
INSERT INTO `vaccinum_type` VALUES (5, '乙脑疫苗', '用于预防流行性乙型脑炎(简称乙脑)');
INSERT INTO `vaccinum_type` VALUES (6, '乙肝疫苗', '用以预防乙型肝炎');
INSERT INTO `vaccinum_type` VALUES (7, '狂犬疫苗', '用于狂犬病的预防');
INSERT INTO `vaccinum_type` VALUES (8, '出血热疫苗', '用于预防流行性出血热');
INSERT INTO `vaccinum_type` VALUES (10, '天花疫苗', '预防天花');
INSERT INTO `vaccinum_type` VALUES (11, 'aaa', 'bbb');
INSERT INTO `vaccinum_type` VALUES (12, 'abc', 'aaa');
INSERT INTO `vaccinum_type` VALUES (13, '123', '123');
INSERT INTO `vaccinum_type` VALUES (15, '人乳头瘤病毒1', '预防人乳头瘤病毒');

SET FOREIGN_KEY_CHECKS = 1;
