/*
 Navicat Premium Data Transfer

 Source Server         : yang
 Source Server Type    : MySQL
 Source Server Version : 50703
 Source Host           : localhost:3306
 Source Schema         : weather_quartz

 Target Server Type    : MySQL
 Target Server Version : 50703
 File Encoding         : 65001

 Date: 29/10/2019 19:34:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RenrenScheduler', 'DESKTOP-R9MPTJB1572348551786', 1572348842479, 15000);

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device`  (
  `device_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '设备号',
  `device_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '设备名',
  `device_site` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '安装地点',
  `device_cla` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '设备类型',
  `observation_cla` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '监控类型',
  `device_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '设备状态',
  `CPU_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'CPU占比',
  `device_img` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '设备图',
  PRIMARY KEY (`device_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES (1, '摄像机一号', '学府路', '鱼眼摄像头', '对天观察', '1', '95', '<img style=\"width:60px;height:40px\" src=\"/renren-admin/statics/鱼眼摄像头.jpg\" />');
INSERT INTO `device` VALUES (2, '摄像机二号', '景华路', '普通摄像头', '对地观察', '0', '90', '<img style=\"width:60px;height:40px\" src=\"/renren-admin/statics/普通1.jpg\" />');

-- ----------------------------
-- Table structure for result
-- ----------------------------
DROP TABLE IF EXISTS `result`;
CREATE TABLE `result`  (
  `result_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '结果编号',
  `site_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '设备号',
  `cameraid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '摄相机编号',
  `modeltype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '识别模型',
  `date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '采集日期',
  `resultcla` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '识别分类',
  `cloud` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '云相关',
  `resultscore` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '识别得分',
  `img` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '原照片',
  `imgpath` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '照片绝对路径',
  `verify` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '人工审核',
  `thumbnail` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '缩略图',
  PRIMARY KEY (`result_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '识别结果' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for result_half
-- ----------------------------
DROP TABLE IF EXISTS `result_half`;
CREATE TABLE `result_half`  (
  `resultidk` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '结果编号',
  `siteidk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '设备号',
  `cameraidk` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '摄像机编号',
  `modeltypek` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '识别模型',
  `datek` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '采集日期',
  `resultclak` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '识别分类',
  `ice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '雾（雨）凇相关',
  `resultscorek` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '识别得分',
  `imgk` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '原照片',
  `imgpathk` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '照片绝对路径',
  `verifyk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '人工审核',
  `thumbnailk` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '缩略图',
  PRIMARY KEY (`resultidk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for result_land
-- ----------------------------
DROP TABLE IF EXISTS `result_land`;
CREATE TABLE `result_land`  (
  `resultidd` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `siteidd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '设备号',
  `cameraidd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '摄相机编号',
  `modeltyped` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '识别模型',
  `dated` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '采集日期',
  `resultclad` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '识别分类',
  `snow` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '雪相关',
  `resultscored` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '识别得分',
  `imgd` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '原照片',
  `imgpathd` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '照片绝对路径',
  `verifyd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '人工审核',
  `thumbnaild` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '缩略图',
  PRIMARY KEY (`resultidd`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log`  (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `param_key`(`param_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '云存储配置信息');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, 0, '人人开源集团', 0, 0);
INSERT INTO `sys_dept` VALUES (2, 1, '长沙分公司', 1, 0);
INSERT INTO `sys_dept` VALUES (3, 1, '上海分公司', 2, 0);
INSERT INTO `sys_dept` VALUES (4, 3, '技术部', 0, 0);
INSERT INTO `sys_dept` VALUES (5, 3, '销售部', 1, 0);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典名称',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典类型',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典码',
  `value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典值',
  `order_num` int(11) DEFAULT 0 COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT 0 COMMENT '删除标记  -1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type`(`type`, `code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, '性别', 'sex', '0', '女', 0, NULL, 0);
INSERT INTO `sys_dict` VALUES (2, '性别', 'sex', '1', '男', 1, NULL, 0);
INSERT INTO `sys_dict` VALUES (3, '性别', 'sex', '2', '未知', 3, NULL, 0);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1,\"roleName\":\"cuit\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55],\"deptIdList\":[],\"createTime\":\"Jul 3, 2019 10:52:52 PM\"}', 2420, '0:0:0:0:0:0:0:1', '2019-07-03 22:52:53');
INSERT INTO `sys_log` VALUES (2, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":2,\"roleName\":\"cuit\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55],\"deptIdList\":[],\"createTime\":\"Jul 3, 2019 10:52:53 PM\"}', 45, '0:0:0:0:0:0:0:1', '2019-07-03 22:52:53');
INSERT INTO `sys_log` VALUES (3, 'admin', '删除角色', 'io.renren.modules.sys.controller.SysRoleController.delete()', '[2]', 16, '0:0:0:0:0:0:0:1', '2019-07-03 22:53:01');
INSERT INTO `sys_log` VALUES (4, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":2,\"username\":\"cuit\",\"password\":\"999f183765f58cccda25456d8f696ca2f48d9825dfbf26eedf6eb4028e171d09\",\"salt\":\"SAlMLI4T8RaUra8U5ZKc\",\"email\":\"760236741@qq.com\",\"mobile\":\"18382330814\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Jul 3, 2019 10:53:44 PM\",\"deptId\":4,\"deptName\":\"技术部\"}', 2312, '0:0:0:0:0:0:0:1', '2019-07-03 22:53:45');
INSERT INTO `sys_log` VALUES (5, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":2,\"roleName\":\"111\",\"deptId\":2,\"deptName\":\"长沙分公司\",\"menuIdList\":[41,42,43,44,45],\"deptIdList\":[3],\"createTime\":\"Aug 9, 2019 9:22:23 AM\"}', 69, '0:0:0:0:0:0:0:1', '2019-08-09 09:22:25');
INSERT INTO `sys_log` VALUES (6, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"cuit\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,41,42,43,44,45,51,52,53,54,55,56,46,47,48,49,50,57,58,59,60,61,62,63,64,65,66],\"deptIdList\":[],\"createTime\":\"Jul 3, 2019 10:52:53 PM\"}', 148, '0:0:0:0:0:0:0:1', '2019-08-11 14:53:49');
INSERT INTO `sys_log` VALUES (7, 'admin', '删除定时任务', 'io.renren.modules.job.controller.ScheduleJobController.delete()', '[3,4,5]', 151, '0:0:0:0:0:0:0:1', '2019-09-21 13:19:55');
INSERT INTO `sys_log` VALUES (8, 'admin', '修改定时任务', 'io.renren.modules.job.controller.ScheduleJobController.update()', '{\"jobId\":1,\"beanName\":\"testTask\",\"params\":\"yanglei\",\"cronExpression\":\"0 0/1 * * * ?\",\"status\":0,\"remark\":\"参数测试\",\"createTime\":\"Aug 20, 2019 9:42:53 AM\"}', 113, '0:0:0:0:0:0:0:1', '2019-09-21 13:20:10');
INSERT INTO `sys_log` VALUES (9, 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[1]', 14, '0:0:0:0:0:0:0:1', '2019-09-21 13:20:16');
INSERT INTO `sys_log` VALUES (10, 'admin', '保存定时任务', 'io.renren.modules.job.controller.ScheduleJobController.save()', '{\"jobId\":1,\"beanName\":\"testTask\",\"params\":\"renren\",\"cronExpression\":\"0 0/30 * * * ?\",\"remark\":\"1\"}', 99, '0:0:0:0:0:0:0:1', '2019-09-24 20:42:54');
INSERT INTO `sys_log` VALUES (11, 'admin', '恢复定时任务', 'io.renren.modules.job.controller.ScheduleJobController.resume()', '[1]', 32, '0:0:0:0:0:0:0:1', '2019-09-24 20:42:58');
INSERT INTO `sys_log` VALUES (12, 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[1]', 373, '127.0.0.1', '2019-09-24 20:48:37');
INSERT INTO `sys_log` VALUES (13, 'admin', '保存定时任务', 'io.renren.modules.job.controller.ScheduleJobController.save()', '{\"jobId\":1,\"beanName\":\"jiexi\",\"params\":\"yanglei\",\"cronExpression\":\"0 0/1 * * * ?\"}', 101, '0:0:0:0:0:0:0:1', '2019-09-25 16:09:09');
INSERT INTO `sys_log` VALUES (14, 'admin', '恢复定时任务', 'io.renren.modules.job.controller.ScheduleJobController.resume()', '[1]', 31, '0:0:0:0:0:0:0:1', '2019-09-25 16:09:18');
INSERT INTO `sys_log` VALUES (15, 'admin', '删除定时任务', 'io.renren.modules.job.controller.ScheduleJobController.delete()', '[1]', 12, '0:0:0:0:0:0:0:1', '2019-09-25 16:11:01');
INSERT INTO `sys_log` VALUES (16, 'admin', '保存定时任务', 'io.renren.modules.job.controller.ScheduleJobController.save()', '{\"jobId\":2,\"beanName\":\"testTask\",\"params\":\"renren\",\"cronExpression\":\"0 0/30 * * * ?\"}', 3, '0:0:0:0:0:0:0:1', '2019-09-25 16:11:13');
INSERT INTO `sys_log` VALUES (17, 'admin', '恢复定时任务', 'io.renren.modules.job.controller.ScheduleJobController.resume()', '[2]', 7, '0:0:0:0:0:0:0:1', '2019-09-25 16:11:19');
INSERT INTO `sys_log` VALUES (18, 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[2]', 27, '0:0:0:0:0:0:0:1', '2019-09-25 16:35:07');
INSERT INTO `sys_log` VALUES (19, 'admin', '保存定时任务', 'io.renren.modules.job.controller.ScheduleJobController.save()', '{\"jobId\":3,\"beanName\":\"jiexi\",\"params\":\"yanglei\",\"cronExpression\":\"0 0/1 * * * ?\"}', 128, '0:0:0:0:0:0:0:1', '2019-09-25 16:35:38');
INSERT INTO `sys_log` VALUES (20, 'admin', '恢复定时任务', 'io.renren.modules.job.controller.ScheduleJobController.resume()', '[3]', 13, '0:0:0:0:0:0:0:1', '2019-09-25 16:35:43');
INSERT INTO `sys_log` VALUES (21, 'admin', '暂停定时任务', 'io.renren.modules.job.controller.ScheduleJobController.pause()', '[3]', 6, '0:0:0:0:0:0:0:1', '2019-09-25 16:36:31');
INSERT INTO `sys_log` VALUES (22, 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[3]', 125, '0:0:0:0:0:0:0:1', '2019-09-25 16:40:44');
INSERT INTO `sys_log` VALUES (23, 'admin', '恢复定时任务', 'io.renren.modules.job.controller.ScheduleJobController.resume()', '[3]', 16, '0:0:0:0:0:0:0:1', '2019-09-25 16:40:59');
INSERT INTO `sys_log` VALUES (24, 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[2]', 26, '0:0:0:0:0:0:0:1', '2019-09-25 16:51:02');
INSERT INTO `sys_log` VALUES (25, 'admin', '修改定时任务', 'io.renren.modules.job.controller.ScheduleJobController.update()', '{\"jobId\":3,\"beanName\":\"jiexi1\",\"params\":\"yanglei\",\"cronExpression\":\"0 0/1 * * * ?\",\"status\":0}', 115, '0:0:0:0:0:0:0:1', '2019-09-25 16:51:16');
INSERT INTO `sys_log` VALUES (26, 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[3]', 12, '0:0:0:0:0:0:0:1', '2019-09-25 16:51:25');
INSERT INTO `sys_log` VALUES (27, 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[3]', 319, '0:0:0:0:0:0:0:1', '2019-09-25 17:14:54');
INSERT INTO `sys_log` VALUES (28, 'admin', '保存定时任务', 'io.renren.modules.job.controller.ScheduleJobController.save()', '{\"jobId\":4,\"beanName\":\"testTask\",\"params\":\"renren\",\"cronExpression\":\"0 0/30 * * * ?\"}', 97, '0:0:0:0:0:0:0:1', '2019-09-25 19:07:39');
INSERT INTO `sys_log` VALUES (29, 'admin', '恢复定时任务', 'io.renren.modules.job.controller.ScheduleJobController.resume()', '[4]', 28, '0:0:0:0:0:0:0:1', '2019-09-25 19:07:43');
INSERT INTO `sys_log` VALUES (30, 'admin', '恢复定时任务', 'io.renren.modules.job.controller.ScheduleJobController.resume()', '[4]', 10, '0:0:0:0:0:0:0:1', '2019-09-25 19:08:22');
INSERT INTO `sys_log` VALUES (31, 'admin', '保存定时任务', 'io.renren.modules.job.controller.ScheduleJobController.save()', '{\"jobId\":5,\"beanName\":\"testTask\",\"params\":\"renren\",\"cronExpression\":\"0 0/30 * * * ?\"}', 90, '0:0:0:0:0:0:0:1', '2019-09-25 19:11:27');
INSERT INTO `sys_log` VALUES (32, 'admin', '恢复定时任务', 'io.renren.modules.job.controller.ScheduleJobController.resume()', '[5]', 24, '0:0:0:0:0:0:0:1', '2019-09-25 19:11:33');
INSERT INTO `sys_log` VALUES (33, 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[5]', 40, '0:0:0:0:0:0:0:1', '2019-09-25 19:12:57');
INSERT INTO `sys_log` VALUES (34, 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[5]', 295, '0:0:0:0:0:0:0:1', '2019-09-25 19:50:53');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '其他设置', NULL, NULL, 0, 'fa fa-cog', 0);
INSERT INTO `sys_menu` VALUES (2, 1, '管理员管理', 'modules/sys/user.html', NULL, 1, 'fa fa-user', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'modules/sys/role.html', NULL, 1, 'fa fa-user-secret', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'modules/sys/menu.html', NULL, 1, 'fa fa-th-list', 3);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', 'druid/sql.html', NULL, 1, 'fa fa-bug', 4);
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务', 'modules/job/schedule.html', NULL, 1, 'fa fa-tasks', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:perms', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:perms', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'fa fa-sun-o', 6);
INSERT INTO `sys_menu` VALUES (29, 1, '系统日志', 'modules/sys/log.html', 'sys:log:list', 1, 'fa fa-file-text-o', 7);
INSERT INTO `sys_menu` VALUES (30, 1, '文件上传', 'modules/oss/oss.html', 'sys:oss:all', 1, 'fa fa-file-image-o', 6);
INSERT INTO `sys_menu` VALUES (31, 1, '部门管理', 'modules/sys/dept.html', NULL, 1, 'fa fa-file-code-o', 1);
INSERT INTO `sys_menu` VALUES (32, 31, '查看', NULL, 'sys:dept:list,sys:dept:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (33, 31, '新增', NULL, 'sys:dept:save,sys:dept:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (34, 31, '修改', NULL, 'sys:dept:update,sys:dept:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (35, 31, '删除', NULL, 'sys:dept:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (36, 1, '字典管理', 'modules/sys/dict.html', NULL, 1, 'fa fa-bookmark-o', 6);
INSERT INTO `sys_menu` VALUES (37, 36, '查看', NULL, 'sys:dict:list,sys:dict:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (38, 36, '新增', NULL, 'sys:dict:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (39, 36, '修改', NULL, 'sys:dict:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (40, 36, '删除', NULL, 'sys:dict:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (41, 1, '设备管理', 'modules/sys/device.html', NULL, 1, 'fa fa-file-code-o', 6);
INSERT INTO `sys_menu` VALUES (42, 41, '查看', NULL, 'sys:device:list,sys:device:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (43, 41, '新增', NULL, 'sys:device:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (44, 41, '修改', NULL, 'sys:device:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (45, 41, '删除', NULL, 'sys:device:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (46, 56, '对天识别', 'modules/sys/result.html', NULL, 1, 'fa fa-file-code-o', 6);
INSERT INTO `sys_menu` VALUES (47, 46, '查看', NULL, 'sys:result:list,sys:result:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (48, 46, '新增', NULL, 'sys:result:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (49, 46, '修改', NULL, 'sys:result:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (50, 46, '删除', NULL, 'sys:result:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (51, 1, '软件版本', 'modules/sys/version.html', NULL, 1, 'fa fa-file-code-o', 6);
INSERT INTO `sys_menu` VALUES (52, 51, '查看', NULL, 'sys:version:list,sys:version:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (53, 51, '新增', NULL, 'sys:version:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (54, 51, '修改', NULL, 'sys:version:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (55, 51, '删除', NULL, 'sys:version:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (56, 0, '识别结果', NULL, NULL, 0, 'fa fa-th-list', NULL);
INSERT INTO `sys_menu` VALUES (57, 56, '半空识别', 'modules/sys/resulthalf.html', NULL, 1, 'fa fa-file-code-o', 6);
INSERT INTO `sys_menu` VALUES (58, 57, '查看', NULL, 'sys:resulthalf:list,sys:resulthalf:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (59, 57, '新增', NULL, 'sys:resulthalf:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (60, 57, '修改', NULL, 'sys:resulthalf:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (61, 57, '删除', NULL, 'sys:resulthalf:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (62, 56, '对地识别', 'modules/sys/resultland.html', NULL, 1, 'fa fa-file-code-o', 6);
INSERT INTO `sys_menu` VALUES (63, 62, '查看', NULL, 'sys:resultland:list,sys:resultland:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (64, 62, '新增', NULL, 'sys:resultland:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (65, 62, '修改', NULL, 'sys:resultland:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (66, 62, '删除', NULL, 'sys:resultland:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (67, 1, '识别结果', 'modules/sys/result.html', NULL, 1, 'fa fa-file-code-o', 6);
INSERT INTO `sys_menu` VALUES (68, 67, '查看', NULL, 'sys:result:list,sys:result:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (69, 67, '新增', NULL, 'sys:result:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (70, 67, '修改', NULL, 'sys:result:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (71, 67, '删除', NULL, 'sys:result:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (72, 0, '参数设置', 'modules/sys/transconfig.html', NULL, 1, 'fa fa-bug', 6);
INSERT INTO `sys_menu` VALUES (73, 72, '查看', NULL, 'sys:transconfig:list,sys:transconfig:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (74, 72, '新增', NULL, 'sys:transconfig:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (75, 72, '修改', NULL, 'sys:transconfig:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (76, 72, '删除', NULL, 'sys:transconfig:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (77, 0, '数据分析', 'modules/sys/chart.html', NULL, 1, 'fa fa-sun-o', 6);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件上传' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'cuit', NULL, 4, '2019-07-03 22:52:53');
INSERT INTO `sys_role` VALUES (2, '111', NULL, 2, '2019-08-09 09:22:23');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与部门对应关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (1, 2, 3);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (17, 2, 41);
INSERT INTO `sys_role_menu` VALUES (18, 2, 42);
INSERT INTO `sys_role_menu` VALUES (19, 2, 43);
INSERT INTO `sys_role_menu` VALUES (20, 2, 44);
INSERT INTO `sys_role_menu` VALUES (21, 2, 45);
INSERT INTO `sys_role_menu` VALUES (22, 1, 1);
INSERT INTO `sys_role_menu` VALUES (23, 1, 41);
INSERT INTO `sys_role_menu` VALUES (24, 1, 42);
INSERT INTO `sys_role_menu` VALUES (25, 1, 43);
INSERT INTO `sys_role_menu` VALUES (26, 1, 44);
INSERT INTO `sys_role_menu` VALUES (27, 1, 45);
INSERT INTO `sys_role_menu` VALUES (28, 1, 51);
INSERT INTO `sys_role_menu` VALUES (29, 1, 52);
INSERT INTO `sys_role_menu` VALUES (30, 1, 53);
INSERT INTO `sys_role_menu` VALUES (31, 1, 54);
INSERT INTO `sys_role_menu` VALUES (32, 1, 55);
INSERT INTO `sys_role_menu` VALUES (33, 1, 56);
INSERT INTO `sys_role_menu` VALUES (34, 1, 46);
INSERT INTO `sys_role_menu` VALUES (35, 1, 47);
INSERT INTO `sys_role_menu` VALUES (36, 1, 48);
INSERT INTO `sys_role_menu` VALUES (37, 1, 49);
INSERT INTO `sys_role_menu` VALUES (38, 1, 50);
INSERT INTO `sys_role_menu` VALUES (39, 1, 57);
INSERT INTO `sys_role_menu` VALUES (40, 1, 58);
INSERT INTO `sys_role_menu` VALUES (41, 1, 59);
INSERT INTO `sys_role_menu` VALUES (42, 1, 60);
INSERT INTO `sys_role_menu` VALUES (43, 1, 61);
INSERT INTO `sys_role_menu` VALUES (44, 1, 62);
INSERT INTO `sys_role_menu` VALUES (45, 1, 63);
INSERT INTO `sys_role_menu` VALUES (46, 1, 64);
INSERT INTO `sys_role_menu` VALUES (47, 1, 65);
INSERT INTO `sys_role_menu` VALUES (48, 1, 66);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'e1153123d7d180ceeb820d577ff119876678732a68eef4e6ffc0b1f06a01f91b', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13500000001', 1, 1, '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES (2, 'cuit', '999f183765f58cccda25456d8f696ca2f48d9825dfbf26eedf6eb4028e171d09', 'SAlMLI4T8RaUra8U5ZKc', '760236741@qq.com', '18382330814', 1, 4, '2019-07-03 22:53:45');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 2, 1);

-- ----------------------------
-- Table structure for trans_config
-- ----------------------------
DROP TABLE IF EXISTS `trans_config`;
CREATE TABLE `trans_config`  (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `device` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备',
  `gap_seond_for_capture` int(11) NOT NULL COMMENT '采集间隔时间',
  `imagesize_for_upload` int(11) NOT NULL COMMENT '压缩包文件数',
  `snapshot_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '摄像头抓图地址',
  `ota_system_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'ota升级包',
  `test1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '预留位',
  `test2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '预留位',
  `test3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '预留位',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of trans_config
-- ----------------------------
INSERT INTO `trans_config` VALUES (1, '001', 40, 90, NULL, NULL, '79561', NULL, NULL);

-- ----------------------------
-- Table structure for version
-- ----------------------------
DROP TABLE IF EXISTS `version`;
CREATE TABLE `version`  (
  `software_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '软件编号',
  `software_site` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '观察站点名称',
  `software_cla` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '软件类型',
  `software_now` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '当前最新版本',
  `whether_new` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否最新',
  `update_online` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '在线更新',
  PRIMARY KEY (`software_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 403 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '软件版本' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of version
-- ----------------------------
INSERT INTO `version` VALUES (101, '站点一号', '看天APP', 'V1.1.1', '已更新11', 'http://111.67.199.85/apk_update/WeatherMonitor-sign_v2.apk');
INSERT INTO `version` VALUES (201, '站点一号', '看地APP', 'V1.1.2', '未更新', '暂未开放');
INSERT INTO `version` VALUES (301, '站点一号', '半空APP', 'V1.1.3', '已更新', '暂未开发');
INSERT INTO `version` VALUES (401, '站点一号', '通信APP', 'V1.2.1', '未更新', 'http://111.67.199.85/apk_update/CommunicationSoft-sign_v2.apk');
INSERT INTO `version` VALUES (402, '站点一号', '控制管理', '1.0', '否', 'http://111.67.199.85/apk_update/ControlManager-sign_v2.apk');

SET FOREIGN_KEY_CHECKS = 1;
