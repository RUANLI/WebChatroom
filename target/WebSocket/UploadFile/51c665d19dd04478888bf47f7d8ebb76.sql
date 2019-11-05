/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : frist_work

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2019-10-17 18:34:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(190) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('DefaultQuartzScheduler', 'cronTrigger', 'group1', '* * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerFactoryBean', '1', '1', '* * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerFactoryBean', '2', '2', '* * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerFactoryBean', '3', '3', '* * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerFactoryBean', '3', '4', '* * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerFactoryBean', '家里', '百度', '0/3 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerFactoryBean', '食堂', '百度', '0/2 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `INSTANCE_NAME` varchar(190) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(190) DEFAULT NULL,
  `JOB_GROUP` varchar(190) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(190) NOT NULL,
  `JOB_GROUP` varchar(190) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('DefaultQuartzScheduler', 'cronJob', 'group1', null, 'com.soft.quartz.test.EatJob', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C77080000001000000001740005636F756E747400033331367800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerFactoryBean', '1', '1', null, 'com.soft.quartz.test.EatJob', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400046461746170740005636F756E7474000236307800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerFactoryBean', '2', '2', null, 'com.soft.quartz.test.CodeingJob', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400046461746174000FE6B58BE8AF95E58699E4BBA3E7A081740005636F756E74740001307800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerFactoryBean', '3', '3', null, 'com.soft.quartz.test.CodeingJob', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400046461746174000FE6B58BE8AF95E8A7A6E58F91E599A8740005636F756E74740001307800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerFactoryBean', '4', '4', null, 'com.soft.quartz.test.CodeingJob', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400046461746174000CE9878DE5A48DE6B58BE8AF95740005636F756E74740001307800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerFactoryBean', '一号', '百度', null, 'com.soft.quartz.test.EatJob', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C77080000001000000001740005636F756E747400033631367800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerFactoryBean', '二号', '百度', null, 'com.soft.quartz.test.SleepJob', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C77080000001000000001740005636F756E74740001307800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(190) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `JOB_NAME` varchar(190) NOT NULL,
  `JOB_GROUP` varchar(190) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('DefaultQuartzScheduler', 'cronTrigger', 'group1', 'cronJob', 'group1', null, '1571297059000', '1571297058000', '5', 'WAITING', 'CRON', '1571296743000', '0', null, '0', '');
INSERT INTO `qrtz_triggers` VALUES ('schedulerFactoryBean', '1', '1', '1', '1', null, '1571299164000', '1571299163000', '5', 'PAUSED', 'CRON', '1571299104000', '0', null, '0', '');
INSERT INTO `qrtz_triggers` VALUES ('schedulerFactoryBean', '2', '2', '2', '2', null, '1571306223000', '1571306222000', '5', 'PAUSED', 'CRON', '1571299194000', '0', null, '0', '');
INSERT INTO `qrtz_triggers` VALUES ('schedulerFactoryBean', '3', '3', '3', '3', null, '1571306203000', '1571306202000', '5', 'PAUSED', 'CRON', '1571299511000', '0', null, '0', '');
INSERT INTO `qrtz_triggers` VALUES ('schedulerFactoryBean', '3', '4', '4', '4', null, '1571306210000', '1571306209000', '5', 'PAUSED', 'CRON', '1571299548000', '0', null, '0', '');
INSERT INTO `qrtz_triggers` VALUES ('schedulerFactoryBean', '家里', '百度', '二号', '百度', null, '1571298579000', '1571298576000', '5', 'PAUSED', 'CRON', '1571297972000', '0', null, '0', '');
INSERT INTO `qrtz_triggers` VALUES ('schedulerFactoryBean', '食堂', '百度', '一号', '百度', null, '1571306200000', '1571306198000', '5', 'PAUSED', 'CRON', '1571297838000', '0', null, '0', '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `CONFIG_ID` varchar(36) NOT NULL COMMENT '主键',
  `CONFIG_TITLE` varchar(30) NOT NULL COMMENT '标题',
  `CONFIG_CODE` varchar(30) NOT NULL COMMENT '代码',
  `CONFIG_VALUE` varchar(256) NOT NULL COMMENT '值',
  `CONFIG_STAUTS` char(1) NOT NULL COMMENT '状态 1:启用 0:禁用',
  `CONFIG_NOTE` varchar(200) DEFAULT NULL COMMENT '备注',
  `ADD_TIME` datetime NOT NULL COMMENT '添加时间',
  `ADD_USER` varchar(36) NOT NULL COMMENT '添加人',
  `IS_OPEN` char(1) NOT NULL COMMENT '是否对外开放 1:开放 0:关闭',
  `SYS_ORG_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CONFIG_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统全局配置';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('333d4f11-3625-40df-9cdb-69c7b81b5671', '协会电话2', '04', '0371 - 6393 6007', '1', null, '2019-09-19 17:24:41', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '1', 'ff6a1b79-0c93-40ec-a5ce-65d44008774e');
INSERT INTO `sys_config` VALUES ('382d9860-32c4-4168-8628-76a35552fa04', '协会电话1', '03', '0371 - 6393 0800', '1', null, '2019-09-19 17:20:33', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '1', 'ff6a1b79-0c93-40ec-a5ce-65d44008774e');
INSERT INTO `sys_config` VALUES ('6349f3b0-56c1-4d63-9a1b-b354ba885e32', '协会传真', '05', '0371 - 6393 0800', '1', null, '2019-09-19 17:20:48', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '1', 'ff6a1b79-0c93-40ec-a5ce-65d44008774e');
INSERT INTO `sys_config` VALUES ('79ecb318-a015-48a3-be34-3f4421c6b5a9', '协会地址省市', '01', '河南省郑州市', '1', null, '2019-09-19 17:19:37', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '1', 'ff6a1b79-0c93-40ec-a5ce-65d44008774e');
INSERT INTO `sys_config` VALUES ('876a9649-1083-4bd1-a4a3-2bc965356938', '协会Email', '06', 'contact@16812223.com', '1', null, '2019-09-19 17:21:28', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '1', 'ff6a1b79-0c93-40ec-a5ce-65d44008774e');
INSERT INTO `sys_config` VALUES ('98f6462a-a469-49e5-8f7b-e21869817e99', '协会具体地址', '02', '金水区优胜南路一号矿业大厦', '1', null, '2019-09-19 17:20:03', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '1', 'ff6a1b79-0c93-40ec-a5ce-65d44008774e');
INSERT INTO `sys_config` VALUES ('c8dc1a33-e135-41eb-a96f-5487fe5af093', '协会经纬度(逗号分隔)', '07', '113.666894,34.772318', '1', null, '2019-09-19 18:04:52', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '1', 'ff6a1b79-0c93-40ec-a5ce-65d44008774e');

-- ----------------------------
-- Table structure for sys_country
-- ----------------------------
DROP TABLE IF EXISTS `sys_country`;
CREATE TABLE `sys_country` (
  `ID` varchar(36) NOT NULL,
  `COUNTRY_NAME` varchar(200) NOT NULL COMMENT '地区名称',
  `COUNTRY_CODE` varchar(10) DEFAULT NULL COMMENT '地区编码',
  `SCHEMA` varchar(50) DEFAULT NULL COMMENT '实例',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_country
-- ----------------------------
INSERT INTO `sys_country` VALUES ('2914519F-846B-4824-B853-A143E3987B4B', '登封', '004', 'hnfmsys_dengfeng');
INSERT INTO `sys_country` VALUES ('2914519F-846B-4824-B853-G143E3987B4B', '巩义', '010', 'hnfmsys_gongyi');
INSERT INTO `sys_country` VALUES ('2914519F-846B-4824-B853-S143E3987B4B', '郏县', '009', 'hnfmsys_jiaxian');
INSERT INTO `sys_country` VALUES ('2914519F-846B-4824-B853-Y143E3987B4B', '叶县', '011', 'hnfmsys_yexian');
INSERT INTO `sys_country` VALUES ('39CE9FB8-D7DB-5DEB-E053-0C00010A6AEB', '渑池', '001', 'hnfmsys_mc');
INSERT INTO `sys_country` VALUES ('39CE9FB8-D7DC-5DEB-E053-0C00010A6AEB', '陕县', '002', 'hnfmsys_shanxian');
INSERT INTO `sys_country` VALUES ('39CE9FB8-D7DD-5DEB-E053-0C00010A6AEB', '新安', '003', 'hnfmsys_xinan');
INSERT INTO `sys_country` VALUES ('39CE9FB8-D7DF-5DEB-E053-0C00010A6AEB', '禹州', '006', 'hnfmsys_yuzhou');
INSERT INTO `sys_country` VALUES ('537D4C4D-0156-7384-E053-0B00010AAA8E', '汝州', '006', 'hnfmsys_ruzhou');
INSERT INTO `sys_country` VALUES ('5638775D-975D-2911-E053-0B00010AA017', '灵宝', '008', 'hnfmsys_lingbao');

-- ----------------------------
-- Table structure for sys_dictinfo
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictinfo`;
CREATE TABLE `sys_dictinfo` (
  `SYS_DICTINFO_ID` varchar(36) NOT NULL,
  `SYS_DICTKIND_ID` varchar(36) NOT NULL,
  `SYS_DICTINFO_CODE` varchar(128) NOT NULL,
  `SYS_DICTINFO_NAME` varchar(128) NOT NULL,
  `SYS_DICTINFO_NOTE` varchar(128) DEFAULT NULL,
  `SYS_DICTINFO_STATUS` char(1) NOT NULL,
  `SYS_DICTINFO_ORDER` int(11) DEFAULT NULL,
  `ADD_USER` varchar(36) NOT NULL,
  `ADD_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`SYS_DICTINFO_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统字典信息';

-- ----------------------------
-- Records of sys_dictinfo
-- ----------------------------
INSERT INTO `sys_dictinfo` VALUES ('09a1a12a-c5f0-4cd0-b4e0-7ed2b8dbff1b', '35b845fd-86e2-4c32-8b80-3013772c561d', '02', '求购', null, '1', '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-16 19:12:27');
INSERT INTO `sys_dictinfo` VALUES ('12e2273a-0ea6-4361-8bb7-e2dee23735d9', '4b015ec4-1a7e-4487-afce-2f57cbd8512d', '0', '副会长单位', '副会长单位', '1', '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-21 17:18:10');
INSERT INTO `sys_dictinfo` VALUES ('192c94f0-b3e5-49f0-8488-cb6ab97c54d5', 'dd078797-a29b-41f1-950c-aaa4eb8885a9', '1', '待运行', null, '1', '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-10-14 10:16:20');
INSERT INTO `sys_dictinfo` VALUES ('20a7d921-5c2b-4c7f-809d-0bbf611cfcd1', '539c23b3-eeda-4ebc-89e1-ce5559b0909a', '4', '4', '4', '1', '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-20 13:17:28');
INSERT INTO `sys_dictinfo` VALUES ('20bd0da6-9de5-4400-8d89-145716adf0b7', '826fc6dc-6e22-4fa1-8408-4ddcfffa8d91', '4', '筛选列表', '筛选列表', '1', '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-20 09:39:44');
INSERT INTO `sys_dictinfo` VALUES ('27c1d8b3-d76d-4a98-ba9e-16ade3fde6af', 'c3987991-da8b-4f6c-b8d7-08fad7082a01', '0', '未轮播', null, '1', '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-24 19:14:06');
INSERT INTO `sys_dictinfo` VALUES ('285a8e7d-7852-4ac6-be68-ecae068fbef5', '82a5a830-b42a-4ae1-8996-8591fca44e1b', '1', '首页顶部', null, '1', '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-05 15:04:27');
INSERT INTO `sys_dictinfo` VALUES ('2a73d9af-f100-41c2-a2c2-d402d1f8b3db', '75b19bed-aa79-4600-a5a8-a1bbb07ac91e', '1', '国', '国', '1', '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-06-20 18:34:34');
INSERT INTO `sys_dictinfo` VALUES ('2bdeb738-cd62-47ea-a0f9-390f703190aa', '40e26d2f-9779-48c7-bb4e-6f07d6343ba0', '1', '是', '是', '1', '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:20:18');
INSERT INTO `sys_dictinfo` VALUES ('2e32369d-f6f3-40ea-b826-4058b127fd10', 'b77a31cc-6069-4681-a999-ebfeab6bc689', '3', '按钮', '按钮', '1', '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:21:55');
INSERT INTO `sys_dictinfo` VALUES ('3579504d-4454-42d6-af31-e4a64684576d', 'bbf83eb7-b19b-4642-9f2d-aafe3ed85717', '01', '地产', null, '1', '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-16 19:13:33');
INSERT INTO `sys_dictinfo` VALUES ('36b78415-189b-4e83-800d-30b5ec0ada66', '826fc6dc-6e22-4fa1-8408-4ddcfffa8d91', '5', '无图无标题列表', '无图无标题列表', '1', '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-20 10:19:23');
INSERT INTO `sys_dictinfo` VALUES ('387a979f-5b0a-44ee-9151-84b261d1795e', '826fc6dc-6e22-4fa1-8408-4ddcfffa8d91', '3', '有图列表', '有图列表', '1', '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-19 20:30:27');
INSERT INTO `sys_dictinfo` VALUES ('3d3e1ecd-6e70-4f3f-b350-38e222517e1c', '539c23b3-eeda-4ebc-89e1-ce5559b0909a', '3', '3', '3', '1', '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-20 13:17:21');
INSERT INTO `sys_dictinfo` VALUES ('471dcf0b-57db-41c8-bd20-c0b11762bcaf', '28f0d936-370b-4000-969a-2b30d1b4a600', '0', '隐藏', '隐藏', '1', '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:22:25');
INSERT INTO `sys_dictinfo` VALUES ('4b53bdde-daea-4986-8bfa-3c80e6e3fe8f', '82a5a830-b42a-4ae1-8996-8591fca44e1b', '3', '首页底部', null, '1', '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-05 15:11:18');
INSERT INTO `sys_dictinfo` VALUES ('508fefc3-b0c9-4529-bfec-cb810187e30c', '9b728160-2a48-4885-a9f5-22c1f7607313', 'com.soft.quartz.test.CodeingJob', '写代码', null, '1', '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-10-16 17:22:09');
INSERT INTO `sys_dictinfo` VALUES ('5131ab01-f68a-4fd9-9cb9-5ca57beff2bc', '76009436-75ea-401b-8a0f-83246b841370', '2', 'Varchar', '字符串', '1', '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-24 17:09:15');
INSERT INTO `sys_dictinfo` VALUES ('51a8f02a-644e-444d-8fce-387e8969d8a4', 'b77a31cc-6069-4681-a999-ebfeab6bc689', '1', '菜单', '菜单', '1', '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:21:29');
INSERT INTO `sys_dictinfo` VALUES ('55067ce9-bef0-48a1-966e-e583a77b73fc', '2a21de4f-6469-4342-a05e-5fd7da8246e3', '2', '女', '女', '1', '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:19:58');
INSERT INTO `sys_dictinfo` VALUES ('564b37d8-8732-495a-90ee-ec139f37caf6', '28f0d936-370b-4000-969a-2b30d1b4a600', '1', '显示', '显示', '1', '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:22:15');
INSERT INTO `sys_dictinfo` VALUES ('67bff044-0071-4f0b-a427-4c7c9f4a54d1', '539c23b3-eeda-4ebc-89e1-ce5559b0909a', '2', '2', '2', '1', '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-20 13:17:13');
INSERT INTO `sys_dictinfo` VALUES ('6a3ebefa-5653-46f3-97cf-adb2185a1384', '76009436-75ea-401b-8a0f-83246b841370', '1', 'Number', '数字', '1', '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-24 17:08:51');
INSERT INTO `sys_dictinfo` VALUES ('72b3ec0d-27e5-4115-b4b6-6adff6325b0a', '83d6d74d-a8b4-4159-9034-cd5193e633da', '1', '全局者', '全局者', '1', '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-07-25 17:34:15');
INSERT INTO `sys_dictinfo` VALUES ('7731fa47-c647-470a-b0d6-9b4aebcb9c46', '1c80b4db-0437-4d5f-ac62-c00b362e5b65', '0', '禁用', '禁用', '1', '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:21:02');
INSERT INTO `sys_dictinfo` VALUES ('83112ca1-b87e-403d-abfb-4d440558ae36', 'dd078797-a29b-41f1-950c-aaa4eb8885a9', '2', '运行中', null, '1', '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-10-14 10:16:51');
INSERT INTO `sys_dictinfo` VALUES ('8f431bcd-fd34-4767-bff1-595077548599', 'cf77592b-3ab7-489d-a6dc-8d2457363767', '1', 'IN', 'IN', '1', '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-24 18:00:14');
INSERT INTO `sys_dictinfo` VALUES ('91260b8b-e55c-4622-bacc-76c82c7ff518', 'b77a31cc-6069-4681-a999-ebfeab6bc689', '2', '叶子', '叶子', '1', '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:21:43');
INSERT INTO `sys_dictinfo` VALUES ('92f63c24-708b-41fb-a0c0-69a25a9f409d', '539c23b3-eeda-4ebc-89e1-ce5559b0909a', '1', '1', '1', '1', '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-20 13:17:06');
INSERT INTO `sys_dictinfo` VALUES ('984fd149-82df-4b13-84bd-e7ef953a17c7', '83d6d74d-a8b4-4159-9034-cd5193e633da', '0', '私有者', '私有者', '1', '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-07-25 17:34:28');
INSERT INTO `sys_dictinfo` VALUES ('984fdc96-5e16-4fbc-8f1b-6ab862237f1d', 'd1d16370-88ed-4470-846a-99b15f0b7be1', '0', '关闭', '关闭', '1', '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:46:52');
INSERT INTO `sys_dictinfo` VALUES ('9d5fff39-a98e-4701-af2c-eee4a1fd4470', '1c80b4db-0437-4d5f-ac62-c00b362e5b65', '1', '启用', '启用', '1', '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:20:53');
INSERT INTO `sys_dictinfo` VALUES ('9fd86fb2-e97a-4d71-9e52-ac14c9460f45', '35b845fd-86e2-4c32-8b80-3013772c561d', '01', '供应', null, '1', '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-16 19:12:16');
INSERT INTO `sys_dictinfo` VALUES ('a178119e-6b5d-4263-b315-00055a17f444', '35b845fd-86e2-4c32-8b80-3013772c561d', '05', '招商', null, '1', '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-16 19:13:08');
INSERT INTO `sys_dictinfo` VALUES ('a63a4347-08db-42e4-be8d-33b7c08d2823', 'cf77592b-3ab7-489d-a6dc-8d2457363767', '2', 'OUT', 'OUT', '1', '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-24 18:00:25');
INSERT INTO `sys_dictinfo` VALUES ('a9f4c5b2-3168-4026-9552-aa8e127e35e1', '826fc6dc-6e22-4fa1-8408-4ddcfffa8d91', '1', '单片文章', '单片文章', '1', '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-19 20:30:03');
INSERT INTO `sys_dictinfo` VALUES ('aa39ee0f-3111-4388-970a-cbb8188be22f', '35b845fd-86e2-4c32-8b80-3013772c561d', '03', '代理', null, '1', '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-16 19:12:41');
INSERT INTO `sys_dictinfo` VALUES ('b2015c9e-dd61-4e2e-bda2-7b4118bc8d94', '9b728160-2a48-4885-a9f5-22c1f7607313', 'com.soft.quartz.test.EatJob', '吃饭', null, '1', '0', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-10-16 17:21:07');
INSERT INTO `sys_dictinfo` VALUES ('be8c6299-f77e-4944-b925-a02077c3ca0d', '76009436-75ea-401b-8a0f-83246b841370', '3', 'Cursor', '游标', '1', '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-24 17:09:44');
INSERT INTO `sys_dictinfo` VALUES ('bfb0a629-50e4-46ea-9e21-124fd550af0b', 'c3987991-da8b-4f6c-b8d7-08fad7082a01', '1', '轮播', null, '1', '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-24 19:14:28');
INSERT INTO `sys_dictinfo` VALUES ('c84730c0-e73a-4e90-9c41-62498645c56d', 'bbf83eb7-b19b-4642-9f2d-aafe3ed85717', '02', '互联网', null, '1', '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-16 19:13:42');
INSERT INTO `sys_dictinfo` VALUES ('cd9476a7-5c0d-4941-8ec8-b98a0a7ee3f7', '9b728160-2a48-4885-a9f5-22c1f7607313', 'com.soft.quartz.test.SleepJob', '睡觉', null, '1', '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-10-16 17:22:00');
INSERT INTO `sys_dictinfo` VALUES ('ce6c5746-a258-41d2-9b0f-f932cc039094', '4b015ec4-1a7e-4487-afce-2f57cbd8512d', '1', '会员单位', '会员单位', '1', '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-21 17:18:25');
INSERT INTO `sys_dictinfo` VALUES ('da693c99-8952-412f-8ca5-c2d7024bb921', 'd1d16370-88ed-4470-846a-99b15f0b7be1', '1', '开放', '开放', '1', '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:46:44');
INSERT INTO `sys_dictinfo` VALUES ('db8e58b7-7d43-4b76-92d9-f98beb4e4310', '75b19bed-aa79-4600-a5a8-a1bbb07ac91e', '3', '市', '市', '1', '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:53:36');
INSERT INTO `sys_dictinfo` VALUES ('e2f07c0e-15e2-4ca2-8e00-5c8342f60dd5', '2a21de4f-6469-4342-a05e-5fd7da8246e3', '1', '男', '男', '1', '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:19:50');
INSERT INTO `sys_dictinfo` VALUES ('e7ab95b3-184b-4569-a8bd-fc054b70c70d', '826fc6dc-6e22-4fa1-8408-4ddcfffa8d91', '2', '无图有标题列表', '无图有标题列表', '1', '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-19 20:30:17');
INSERT INTO `sys_dictinfo` VALUES ('eabd0c70-ee2d-4ccc-a24d-6e0985d3918a', '826fc6dc-6e22-4fa1-8408-4ddcfffa8d91', '6', '会员单位', null, '1', '6', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-20 17:56:45');
INSERT INTO `sys_dictinfo` VALUES ('ebad4e5a-d30d-4af0-abec-7d4c4abfdde6', '75b19bed-aa79-4600-a5a8-a1bbb07ac91e', '4', '县|区', '县|区', '1', '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:53:59');
INSERT INTO `sys_dictinfo` VALUES ('ecda4dab-69d1-4ae9-a4f4-c3345d48842a', '82a5a830-b42a-4ae1-8996-8591fca44e1b', '2', '首页中部', null, '1', '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-05 15:11:02');
INSERT INTO `sys_dictinfo` VALUES ('eebebc6f-5c36-4654-82b4-0127952ba63f', 'dd078797-a29b-41f1-950c-aaa4eb8885a9', '0', '失效', null, '1', '0', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-10-14 10:15:56');
INSERT INTO `sys_dictinfo` VALUES ('efdf2cff-cd01-446b-9456-ffc115de3f5f', 'dd078797-a29b-41f1-950c-aaa4eb8885a9', '3', '运行失败', null, '1', '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-10-14 10:17:12');
INSERT INTO `sys_dictinfo` VALUES ('f005989d-1ab4-46bf-a6c9-1d7af8e5faba', '40e26d2f-9779-48c7-bb4e-6f07d6343ba0', '0', '否', '否', '1', '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:20:27');
INSERT INTO `sys_dictinfo` VALUES ('f31ac827-d949-4488-aa05-5c9156576418', '75b19bed-aa79-4600-a5a8-a1bbb07ac91e', '2', '省', '省', '1', '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:53:06');
INSERT INTO `sys_dictinfo` VALUES ('fbfdcc94-1742-452a-b924-41cd1ef75220', '35b845fd-86e2-4c32-8b80-3013772c561d', '04', '合作', null, '1', '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-16 19:12:52');

-- ----------------------------
-- Table structure for sys_dictinfo_copy
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictinfo_copy`;
CREATE TABLE `sys_dictinfo_copy` (
  `SYS_DICTINFO_ID` varchar(36) NOT NULL,
  `SYS_DICTKIND_ID` varchar(36) NOT NULL,
  `SYS_DICTINFO_CODE` varchar(128) NOT NULL,
  `SYS_DICTINFO_NAME` varchar(128) NOT NULL,
  `SYS_DICTINFO_NOTE` varchar(128) DEFAULT NULL,
  `SYS_DICTINFO_STATUS` char(1) NOT NULL,
  `SYS_DICTINFO_ORDER` int(11) DEFAULT NULL,
  `ADD_USER` varchar(36) NOT NULL,
  `ADD_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`SYS_DICTINFO_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统字典信息';


-- ----------------------------
-- Table structure for sys_dictkind
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictkind`;
CREATE TABLE `sys_dictkind` (
  `SYS_DICTKIND_ID` varchar(36) NOT NULL,
  `SYS_DICTKIND_FID` varchar(36) NOT NULL,
  `SYS_DICTKIND_NAME` varchar(128) NOT NULL,
  `SYS_DICTKIND_STAUTS` char(1) NOT NULL,
  `SYS_DICTKIND_SEQ` varchar(2048) DEFAULT NULL,
  `SYS_DICTKIND_ISNODE` char(1) NOT NULL COMMENT '是否叶子节点0代表终点. 1 代表节点',
  `SYS_DICTKIND_ORDER` int(11) DEFAULT NULL,
  `SYS_DICTKIND_NOTE` varchar(200) DEFAULT NULL,
  `ZJM` varchar(50) DEFAULT NULL,
  `ADD_USER` varchar(36) NOT NULL,
  `ADD_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`SYS_DICTKIND_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统字典分类';

-- ----------------------------
-- Records of sys_dictkind
-- ----------------------------
INSERT INTO `sys_dictkind` VALUES ('127adf7e-f5a5-482a-a227-9603125b40bf', '5ed40449-3c32-4559-ad6f-6910f5ed3212', '协会资讯', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.127adf7e-f5a5-482a-a227-9603125b40bf.', '1', '1', 'news_association1.html', 'XKZX', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-11 15:44:54');
INSERT INTO `sys_dictkind` VALUES ('134697ce-8dd7-4727-8ad6-f2fe13476697', '5ed40449-3c32-4559-ad6f-6910f5ed3212', '行业动态', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.134697ce-8dd7-4727-8ad6-f2fe13476697.', '1', '2', 'news_industry1.html', 'XYDT', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-11 15:45:05');
INSERT INTO `sys_dictkind` VALUES ('1c80b4db-0437-4d5f-ac62-c00b362e5b65', '8dd72e57-2dba-4c00-9c4c-abdb15fa5823', '标识', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.8dd72e57-2dba-4c00-9c4c-abdb15fa5823.1c80b4db-0437-4d5f-ac62-c00b362e5b65.', '0', '3', '标识', 'BS', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:15:41');
INSERT INTO `sys_dictkind` VALUES ('21c459a0-4f1b-4ba4-98aa-5f6fe87c1903', '5ed40449-3c32-4559-ad6f-6910f5ed3211', '国家政策', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.21c459a0-4f1b-4ba4-98aa-5f6fe87c1903.', '1', '1', 'policy_country1.html', 'GJZC', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-11 15:45:44');
INSERT INTO `sys_dictkind` VALUES ('248c0d11-bb46-4999-87d9-a6c88c884f66', '5ed40449-3c32-4559-ad6f-6910f5ed3216', '入会申请书', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.248c0d11-bb46-4999-87d9-a6c88c884f66.', '1', '1', 'downloadBook.html', 'RKSQS', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-11 15:48:02');
INSERT INTO `sys_dictkind` VALUES ('25cc9953-d935-49cd-9d6d-72b7f7c09908', '5ed40449-3c32-4559-ad6f-6910f5ed3211', '行业政策', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.25cc9953-d935-49cd-9d6d-72b7f7c09908.', '1', '2', 'policy_industr1.html', 'XYZC', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-11 15:45:53');
INSERT INTO `sys_dictkind` VALUES ('28f0d936-370b-4000-969a-2b30d1b4a600', '4ca95912-07d1-441a-aa37-32efb56c4c4d', '按钮显隐', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.4ca95912-07d1-441a-aa37-32efb56c4c4d.28f0d936-370b-4000-969a-2b30d1b4a600.', '0', '2', '按钮显隐', 'ANXY', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:14:56');
INSERT INTO `sys_dictkind` VALUES ('2a21de4f-6469-4342-a05e-5fd7da8246e3', '8dd72e57-2dba-4c00-9c4c-abdb15fa5823', '性别', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.8dd72e57-2dba-4c00-9c4c-abdb15fa5823.2a21de4f-6469-4342-a05e-5fd7da8246e3.', '0', '1', '性别', 'XB', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:13:22');
INSERT INTO `sys_dictkind` VALUES ('35b845fd-86e2-4c32-8b80-3013772c561d', '49db275c-47ec-4b83-bc7e-2acc63ed719c', '供求分类', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.49db275c-47ec-4b83-bc7e-2acc63ed719c.35b845fd-86e2-4c32-8b80-3013772c561d.', '0', '2', null, 'GQFL', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-16 19:10:44');
INSERT INTO `sys_dictkind` VALUES ('40e26d2f-9779-48c7-bb4e-6f07d6343ba0', '8dd72e57-2dba-4c00-9c4c-abdb15fa5823', '是否', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.8dd72e57-2dba-4c00-9c4c-abdb15fa5823.40e26d2f-9779-48c7-bb4e-6f07d6343ba0.', '0', '2', '是否', 'SP', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:13:42');
INSERT INTO `sys_dictkind` VALUES ('49db275c-47ec-4b83-bc7e-2acc63ed719c', '5ed40449-3c32-4559-ad6f-6910f5ed321d', '业务系统字典', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.49db275c-47ec-4b83-bc7e-2acc63ed719c.', '1', '5', '业务系统字典', 'YWXTZD', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-09 20:05:19');
INSERT INTO `sys_dictkind` VALUES ('4b015ec4-1a7e-4487-afce-2f57cbd8512d', '49db275c-47ec-4b83-bc7e-2acc63ed719c', '单位类型', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.49db275c-47ec-4b83-bc7e-2acc63ed719c.4b015ec4-1a7e-4487-afce-2f57cbd8512d.', '0', '6', '单位类型', 'SWLX', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-21 17:17:08');
INSERT INTO `sys_dictkind` VALUES ('4ca95912-07d1-441a-aa37-32efb56c4c4d', '5ed40449-3c32-4559-ad6f-6910f5ed321d', '权限字典', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.4ca95912-07d1-441a-aa37-32efb56c4c4d.', '1', '2', '权限字典', 'QXZD', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:11:39');
INSERT INTO `sys_dictkind` VALUES ('517f9b9c-a084-4989-b83f-51d69ae886ee', '5ed40449-3c32-4559-ad6f-6910f5ed3215', '会员单位', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.517f9b9c-a084-4989-b83f-51d69ae886ee.', '1', '5', 'memberEnterprise1.html', 'KYQY', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-11 15:47:38');
INSERT INTO `sys_dictkind` VALUES ('539c23b3-eeda-4ebc-89e1-ce5559b0909a', '49db275c-47ec-4b83-bc7e-2acc63ed719c', '首页文章显示位置', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.49db275c-47ec-4b83-bc7e-2acc63ed719c.539c23b3-eeda-4ebc-89e1-ce5559b0909a.', '0', '5', null, 'SYWZXSWZ', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-20 13:16:34');
INSERT INTO `sys_dictkind` VALUES ('5ed40449-3c32-4559-ad6f-6910f5ed3211', '1', '政策法规', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.', '1', '103', 'policy_country1.html', 'QTMK', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:10:38');
INSERT INTO `sys_dictkind` VALUES ('5ed40449-3c32-4559-ad6f-6910f5ed3212', '1', '新闻资讯', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.', '1', '102', 'news_association1.html', 'QTMK', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:10:38');
INSERT INTO `sys_dictkind` VALUES ('5ed40449-3c32-4559-ad6f-6910f5ed3213', '1', '关于协会', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.', '1', '101', 'aboutAssociation.html', 'QTMK', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:10:38');
INSERT INTO `sys_dictkind` VALUES ('5ed40449-3c32-4559-ad6f-6910f5ed3215', '1', '会员服务', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.', '1', '104', 'enterFlow.html', 'QTMK', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:10:38');
INSERT INTO `sys_dictkind` VALUES ('5ed40449-3c32-4559-ad6f-6910f5ed3216', '1', '下载中心', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.', '1', '105', 'downloadBook.html', 'QTMK', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:10:38');
INSERT INTO `sys_dictkind` VALUES ('5ed40449-3c32-4559-ad6f-6910f5ed321d', '0', '字典分类', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.', '1', '100', '字典分类', 'ZDFL', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:10:38');
INSERT INTO `sys_dictkind` VALUES ('5ed40449-3c32-4559-ad6f-6910f5ed321e', '1', '网站首页', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.', '1', '100', 'index.html', 'QTMK', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:10:38');
INSERT INTO `sys_dictkind` VALUES ('705a201f-70d4-4737-9a9d-482406880e95', '5ed40449-3c32-4559-ad6f-6910f5ed3215', '入会流程', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.705a201f-70d4-4737-9a9d-482406880e95.', '1', '1', 'enterFlow.html', 'RKLC', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-11 15:46:23');
INSERT INTO `sys_dictkind` VALUES ('75b19bed-aa79-4600-a5a8-a1bbb07ac91e', '8dd72e57-2dba-4c00-9c4c-abdb15fa5823', '行政级别', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.8dd72e57-2dba-4c00-9c4c-abdb15fa5823.75b19bed-aa79-4600-a5a8-a1bbb07ac91e.', '0', '5', '行政级别', 'XZJB', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:51:21');
INSERT INTO `sys_dictkind` VALUES ('76009436-75ea-401b-8a0f-83246b841370', '26dcc28b-293c-43c9-b876-734fb17910c2', '参数类型', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.26dcc28b-293c-43c9-b876-734fb17910c2.76009436-75ea-401b-8a0f-83246b841370.', '0', '1', '存储过程参数类型', 'SSLX', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-24 17:07:59');
INSERT INTO `sys_dictkind` VALUES ('826fc6dc-6e22-4fa1-8408-4ddcfffa8d91', '49db275c-47ec-4b83-bc7e-2acc63ed719c', '文章类型', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.49db275c-47ec-4b83-bc7e-2acc63ed719c.826fc6dc-6e22-4fa1-8408-4ddcfffa8d91.', '0', '4', '文章类型', 'WZLX', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-19 20:29:48');
INSERT INTO `sys_dictkind` VALUES ('82a5a830-b42a-4ae1-8996-8591fca44e1b', '49db275c-47ec-4b83-bc7e-2acc63ed719c', '图片显示位置', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.49db275c-47ec-4b83-bc7e-2acc63ed719c.82a5a830-b42a-4ae1-8996-8591fca44e1b.', '0', '1', null, 'TPXSWZ', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-05 15:03:06');
INSERT INTO `sys_dictkind` VALUES ('83d6d74d-a8b4-4159-9034-cd5193e633da', '4ca95912-07d1-441a-aa37-32efb56c4c4d', '用户身份', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.4ca95912-07d1-441a-aa37-32efb56c4c4d.83d6d74d-a8b4-4159-9034-cd5193e633da.', '0', '1', '用户身份', 'YHSF', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-07-25 17:33:55');
INSERT INTO `sys_dictkind` VALUES ('8dd72e57-2dba-4c00-9c4c-abdb15fa5823', '5ed40449-3c32-4559-ad6f-6910f5ed321d', '公共字典', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.8dd72e57-2dba-4c00-9c4c-abdb15fa5823.', '1', '1', '公共字典', 'GGZD', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:11:06');
INSERT INTO `sys_dictkind` VALUES ('9b728160-2a48-4885-a9f5-22c1f7607313', '49db275c-47ec-4b83-bc7e-2acc63ed719c', '任务类型', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.49db275c-47ec-4b83-bc7e-2acc63ed719c.9b728160-2a48-4885-a9f5-22c1f7607313.', '0', '9', 'quartz\n', 'RWLX', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-10-16 17:19:46');
INSERT INTO `sys_dictkind` VALUES ('9c350178-7373-44d7-a839-1d48a2cb2325', '5ed40449-3c32-4559-ad6f-6910f5ed3213', '协会章程', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.9c350178-7373-44d7-a839-1d48a2cb2325.', '1', '2', 'aboutAssoArticle.html', 'XKZC', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-11 15:44:21');
INSERT INTO `sys_dictkind` VALUES ('aed5e045-ccdc-4358-922a-c8e43ac33327', '5ed40449-3c32-4559-ad6f-6910f5ed3215', '产品名录', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.aed5e045-ccdc-4358-922a-c8e43ac33327.', '1', '3', 'productlist1.html', 'CPML', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-11 15:47:08');
INSERT INTO `sys_dictkind` VALUES ('b77a31cc-6069-4681-a999-ebfeab6bc689', '4ca95912-07d1-441a-aa37-32efb56c4c4d', '菜单类型', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.4ca95912-07d1-441a-aa37-32efb56c4c4d.b77a31cc-6069-4681-a999-ebfeab6bc689.', '0', '1', '菜单类型', 'CSLX', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:12:47');
INSERT INTO `sys_dictkind` VALUES ('b8ad0bdd-a069-430c-babb-9746601b038c', '5ed40449-3c32-4559-ad6f-6910f5ed3216', '资料汇编', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.b8ad0bdd-a069-430c-babb-9746601b038c.', '1', '2', 'webdatalist1.html', 'ZLHB', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-11 15:48:18');
INSERT INTO `sys_dictkind` VALUES ('bbf83eb7-b19b-4642-9f2d-aafe3ed85717', '49db275c-47ec-4b83-bc7e-2acc63ed719c', '行业类别', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.49db275c-47ec-4b83-bc7e-2acc63ed719c.bbf83eb7-b19b-4642-9f2d-aafe3ed85717.', '0', '3', null, 'XYLB', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-16 19:11:09');
INSERT INTO `sys_dictkind` VALUES ('c3987991-da8b-4f6c-b8d7-08fad7082a01', '49db275c-47ec-4b83-bc7e-2acc63ed719c', '轮播属性', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.49db275c-47ec-4b83-bc7e-2acc63ed719c.c3987991-da8b-4f6c-b8d7-08fad7082a01.', '0', '7', null, 'LBZX', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-24 19:10:50');
INSERT INTO `sys_dictkind` VALUES ('ce9b3cfa-1590-4f9c-9386-360595bd0e48', '5ed40449-3c32-4559-ad6f-6910f5ed3215', '企业风采', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.ce9b3cfa-1590-4f9c-9386-360595bd0e48.', '1', '4', 'enterpriseList1.html', 'QYFC', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-11 15:47:27');
INSERT INTO `sys_dictkind` VALUES ('cf77592b-3ab7-489d-a6dc-8d2457363767', '26dcc28b-293c-43c9-b876-734fb17910c2', '参数种类', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.26dcc28b-293c-43c9-b876-734fb17910c2.cf77592b-3ab7-489d-a6dc-8d2457363767.', '0', '2', '参数种类', 'SSZL', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-24 17:59:56');
INSERT INTO `sys_dictkind` VALUES ('d1d16370-88ed-4470-846a-99b15f0b7be1', '8dd72e57-2dba-4c00-9c4c-abdb15fa5823', '开放|关闭', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.8dd72e57-2dba-4c00-9c4c-abdb15fa5823.d1d16370-88ed-4470-846a-99b15f0b7be1.', '0', '4', '开放|关闭', 'KF|GB', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-04 18:43:23');
INSERT INTO `sys_dictkind` VALUES ('d1fa45a0-18f4-4a89-8b30-ccc350b3fef3', '5ed40449-3c32-4559-ad6f-6910f5ed3213', '组织机构', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.d1fa45a0-18f4-4a89-8b30-ccc350b3fef3.', '1', '3', 'orglist1.html', 'ZZJG', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-11 15:44:36');
INSERT INTO `sys_dictkind` VALUES ('d6e62806-982c-4e0d-a9c3-8fb026d57f28', '5ed40449-3c32-4559-ad6f-6910f5ed3213', '协会简介', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.d6e62806-982c-4e0d-a9c3-8fb026d57f28.', '1', '1', 'aboutAssociation.html', 'XKJJ', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-11 15:43:59');
INSERT INTO `sys_dictkind` VALUES ('dd078797-a29b-41f1-950c-aaa4eb8885a9', '49db275c-47ec-4b83-bc7e-2acc63ed719c', '任务运行状态', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.49db275c-47ec-4b83-bc7e-2acc63ed719c.dd078797-a29b-41f1-950c-aaa4eb8885a9.', '0', '8', 'quartz\n', 'RWYXZT', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-10-14 10:14:39');
INSERT INTO `sys_dictkind` VALUES ('deb45385-af03-44f4-a449-20ad32ad56fb', '5ed40449-3c32-4559-ad6f-6910f5ed3212', '国外动态', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.deb45385-af03-44f4-a449-20ad32ad56fb.', '1', '3', 'news_abroad1.html', 'GWDT', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-11 15:45:25');
INSERT INTO `sys_dictkind` VALUES ('e991bcfb-b7c8-4b7b-9091-fd86bb10511c', '5ed40449-3c32-4559-ad6f-6910f5ed3212', '通知公告', '1', '0.5ed40449-3c32-4559-ad6f-6910f5ed321d.e991bcfb-b7c8-4b7b-9091-fd86bb10511c.', '1', '4', 'noticelist1.html', 'TZGG', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-16 17:42:18');

-- ----------------------------
-- Table structure for sys_log_login
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_login`;
CREATE TABLE `sys_log_login` (
  `LOGIN_ID` varchar(36) NOT NULL,
  `ADD_USER` varchar(36) NOT NULL COMMENT '操作人',
  `ADD_TIME` datetime NOT NULL COMMENT '操作时间',
  `LOGIN_START_TIME` datetime DEFAULT NULL COMMENT '登陆开始时间',
  `LOGIN_TIMER` bigint(11) DEFAULT NULL COMMENT '登陆的分钟数',
  `LOGIN_END_TIME` datetime DEFAULT NULL COMMENT '登陆结束时间',
  `IS_NORMAL_LOGIN` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '是否正常登陆 1：正常 0：非正常',
  `IS_NORMAL_EXIT` char(1) DEFAULT NULL COMMENT '是否正常退出 1：正常 0：非正常',
  `BROSWER_TYPE` varchar(255) DEFAULT NULL COMMENT '浏览器类型',
  `REQUEST_IP` varchar(255) NOT NULL COMMENT '请求的IP地址',
  `SYS_ORG_ID` varchar(36) NOT NULL COMMENT '机构ID',
  PRIMARY KEY (`LOGIN_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户登录日志';



-- ----------------------------
-- Table structure for sys_log_work
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_work`;
CREATE TABLE `sys_log_work` (
  `LOG_WORK_ID` varchar(36) NOT NULL COMMENT '主键',
  `M_ID` varchar(36) NOT NULL COMMENT '菜单ID',
  `B_ID` varchar(36) DEFAULT NULL COMMENT '操作按钮名称',
  `ADD_TIME` datetime NOT NULL COMMENT '操作时间',
  `SYS_USER_ID` varchar(36) NOT NULL COMMENT '操作人',
  `BROSWER_TYPE` varchar(255) DEFAULT NULL COMMENT '浏览器类型',
  `REQUEST_IP` varchar(255) NOT NULL COMMENT '请求的IP地址',
  `SYS_ORG_ID` varchar(36) NOT NULL COMMENT '机构ID',
  PRIMARY KEY (`LOG_WORK_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户操作日志';

-- ----------------------------
-- Records of sys_log_work
-- ----------------------------


-- ----------------------------
-- Table structure for sys_module
-- ----------------------------
DROP TABLE IF EXISTS `sys_module`;
CREATE TABLE `sys_module` (
  `SYS_MODULE_ID` varchar(36) NOT NULL COMMENT '主键',
  `SYS_MODULE_FID` varchar(36) NOT NULL COMMENT 'FID',
  `SYS_MODULE_NAME` varchar(60) NOT NULL COMMENT '模块名称',
  `SYS_MODULE_URL` varchar(120) DEFAULT NULL COMMENT 'URL',
  `SYS_MODULE_LEVEL` int(11) DEFAULT NULL COMMENT '级别',
  `SYS_MODULE_STATUS` char(1) NOT NULL COMMENT '状态 ：1：正常  0：禁用',
  `SYS_MODULE_TYPE` char(1) NOT NULL COMMENT '权限类型： 1：父权限  2：叶子  3：按钮',
  `SYS_MODULE_SEQ` varchar(2048) DEFAULT NULL COMMENT '序列',
  `ICON` varchar(200) DEFAULT NULL COMMENT '图标',
  `IMG` varchar(100) DEFAULT NULL,
  `YNSHOW` char(1) NOT NULL COMMENT '是否显示 1:显示 0:隐藏',
  `MODULE_GROUP` varchar(36) DEFAULT NULL COMMENT '功能分组',
  `SYS_MODULE_ORDER` int(11) NOT NULL COMMENT '排序',
  `ADD_USER` varchar(36) DEFAULT NULL COMMENT '添加人',
  `ADD_TIME` datetime DEFAULT NULL COMMENT '添加时间',
  `SYS_MODULE_NOTES` varchar(200) DEFAULT NULL COMMENT '备注',
  `IS_DELETE` char(1) NOT NULL COMMENT '0:未删除 1：删除',
  PRIMARY KEY (`SYS_MODULE_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_module
-- ----------------------------
INSERT INTO `sys_module` VALUES ('00bb7d14-2985-4d62-9c0a-69b814e49706', '0', '权限管理', '', '1', '1', '1', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.', 'power.png', 'power_hover.png', '1', null, '102', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('01a2d231-c241-4ff0-931e-666cff101fcf', '7f20949b-eecb-432b-8105-6a1d0b607b29', '入场管理', '/kyt/station/truckAdmissionIndex.action', '2', '1', '2', '0.7f20949b-eecb-432b-8105-6a1d0b607b29.01a2d231-c241-4ff0-931e-666cff101fcf.', null, null, '1', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-07-19 13:57:08', null, '1');
INSERT INTO `sys_module` VALUES ('02a2446c-bfef-4598-8e5a-2bd7cb723b81', '45f24b60-e190-4e3c-bcb9-1c494876030a', '资金流水', '/kyt/money/boc_trade_record/index.action', '2', '1', '2', '0.45f24b60-e190-4e3c-bcb9-1c494876030a.02a2446c-bfef-4598-8e5a-2bd7cb723b81.', 'money.liushui.png', 'money.liushui.hover.png', '1', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-10-01 11:25:58', null, '1');
INSERT INTO `sys_module` VALUES ('0340480f-ccb0-4906-a125-6e5a78b21903', '6e800af7-bb56-4d2c-bbfc-06669b4b553c', '启用', 'myrobj.enable(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.6e800af7-bb56-4d2c-bbfc-06669b4b553c.0340480f-ccb0-4906-a125-6e5a78b21903.', 'icon_ok', null, '0', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('04651d61-4c58-4c5b-baa9-a3d04b141f8f', 'a00a20ad-d82e-4011-907f-60f6f04c083d', 'APP类型', '/kyt/app/app_type/index.action', '2', '1', '2', '0.a00a20ad-d82e-4011-907f-60f6f04c083d.04651d61-4c58-4c5b-baa9-a3d04b141f8f.', null, null, '1', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-08-09 16:00:25', null, '1');
INSERT INTO `sys_module` VALUES ('05156177-deef-4324-be24-0f06cfb8625d', '0e1c8d31-41aa-43ce-be50-2683869e5ba5', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.0e1c8d31-41aa-43ce-be50-2683869e5ba5.05156177-deef-4324-be24-0f06cfb8625d.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-01-08 21:15:49', null, '1');
INSERT INTO `sys_module` VALUES ('06101e80-d1b8-4e62-a569-db6ff109ac00', 'd1f6b85f-bf12-4f8e-a35a-234767b4905c', '新增', 'myrobj.add(this);', '3', '1', '3', '0.1467624b-4be5-47b9-87a3-57a229e52193.d1f6b85f-bf12-4f8e-a35a-234767b4905c.06101e80-d1b8-4e62-a569-db6ff109ac00.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-19 19:49:15', '新增', '0');
INSERT INTO `sys_module` VALUES ('073c8332-f892-42ae-a302-545cf8ec0f0d', '45f24b60-e190-4e3c-bcb9-1c494876030a', '预申报管理', '/kyt/enterprise/contract_info/index.action', '2', '0', '2', '0.45f24b60-e190-4e3c-bcb9-1c494876030a.073c8332-f892-42ae-a302-545cf8ec0f0d.', null, null, '1', null, '6', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-01-23 13:46:54', null, '1');
INSERT INTO `sys_module` VALUES ('0809b43a-1084-4e89-8942-2e9ef04c190a', 'd1f6b85f-bf12-4f8e-a35a-234767b4905c', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.1467624b-4be5-47b9-87a3-57a229e52193.d1f6b85f-bf12-4f8e-a35a-234767b4905c.0809b43a-1084-4e89-8942-2e9ef04c190a.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-19 19:49:15', '编辑', '0');
INSERT INTO `sys_module` VALUES ('08354cf4-3827-4c01-9398-9adfcdbd09d1', '1467624b-4be5-47b9-87a3-57a229e52193', '网站文章', '/sand/news/index.action', '2', '0', '2', '0.1467624b-4be5-47b9-87a3-57a229e52193.08354cf4-3827-4c01-9398-9adfcdbd09d1.', null, null, '1', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-20 11:07:29', null, '0');
INSERT INTO `sys_module` VALUES ('088160a1-04af-461d-b53e-454297e40371', '4ece9939-d07d-4934-9f00-797c673b8927', '求购矿石审批', '/trade/ore/ore_purchase/index.action', '2', '1', '2', '0.4ece9939-d07d-4934-9f00-797c673b8927.088160a1-04af-461d-b53e-454297e40371.', 'check.png', 'check.h.png', '1', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-06-21 09:30:03', null, '1');
INSERT INTO `sys_module` VALUES ('0abe41e2-8734-49ce-a7b9-7a14c36235d8', '2a3fcaf2-4eb1-44ce-96b6-427009c33666', '矿银通版本', '/kyt/pos_app_version/index.action', '2', '1', '2', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.0abe41e2-8734-49ce-a7b9-7a14c36235d8.', 'version.png', 'version.h.png', '1', null, '7', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-06-14 16:22:19', null, '1');
INSERT INTO `sys_module` VALUES ('0c0aaf77-33e1-41d2-8412-fd5af5cb4384', 'c5e41dd5-cebe-47ed-bbe0-db08e6e4b9aa', '删除', 'myrobj.del(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.c5e41dd5-cebe-47ed-bbe0-db08e6e4b9aa.0c0aaf77-33e1-41d2-8412-fd5af5cb4384.', 'icon_delete', null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('0c9d4877-a76c-4ca0-9ff5-8382f2e30a3b', 'd7f3a719-0089-4c74-91d3-57f24d9ede7d', '打开', 'myrobj.enable(this);', '3', '1', '3', '0.486f4cc1-d2c2-4a8f-ae13-4e8132bb6e5e.d7f3a719-0089-4c74-91d3-57f24d9ede7d.0c9d4877-a76c-4ca0-9ff5-8382f2e30a3b.', 'icon_ok', null, '0', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-05-15 18:21:27', '启用', '1');
INSERT INTO `sys_module` VALUES ('0d522582-addb-4609-9b74-58b04345005a', '148cd40a-9fa8-4e6b-a558-23a6cce505c8', '新增', 'myrobj.add(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.148cd40a-9fa8-4e6b-a558-23a6cce505c8.0d522582-addb-4609-9b74-58b04345005a.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('0dda10b7-0b60-4772-ac4b-83db5dfde6d3', '9bb7497b-b149-41aa-a3b4-5fa2033fe391', '矿产调用', null, '2', '1', '2', '0.9bb7497b-b149-41aa-a3b4-5fa2033fe391.0dda10b7-0b60-4772-ac4b-83db5dfde6d3.', null, null, '1', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 09:40:56', null, '1');
INSERT INTO `sys_module` VALUES ('0e1c8d31-41aa-43ce-be50-2683869e5ba5', 'be46cf51-8498-472a-bcb9-56c6a5cafbf3', '充值管理', '/kyt/taxe/infund/index.action', '2', '1', '2', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.0e1c8d31-41aa-43ce-be50-2683869e5ba5.', 'xxcz.png', 'xxcz.h.png', '1', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-12-26 10:56:43', null, '1');
INSERT INTO `sys_module` VALUES ('0e1ef0cb-ff57-4e06-9694-57f2727645a9', 'c5e41dd5-cebe-47ed-bbe0-db08e6e4b9aa', '禁用', 'myrobj.disable(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.c5e41dd5-cebe-47ed-bbe0-db08e6e4b9aa.0e1ef0cb-ff57-4e06-9694-57f2727645a9.', 'icon_no', null, '0', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('0ec61e86-eb5e-4f09-b6af-d1da9ec3a5e8', 'd1f6b85f-bf12-4f8e-a35a-234767b4905c', '删除', 'myrobj.del(this);', '3', '1', '3', '0.1467624b-4be5-47b9-87a3-57a229e52193.d1f6b85f-bf12-4f8e-a35a-234767b4905c.0ec61e86-eb5e-4f09-b6af-d1da9ec3a5e8.', 'icon_delete', null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-19 19:49:15', '删除', '0');
INSERT INTO `sys_module` VALUES ('0ec75e1e-985e-4302-b48d-dd564be7c8d1', 'eaf2657f-5da3-4fe3-8e0b-19a9afe057a9', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.eaf2657f-5da3-4fe3-8e0b-19a9afe057a9.0ec75e1e-985e-4302-b48d-dd564be7c8d1.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-08 19:42:53', '编辑', '1');
INSERT INTO `sys_module` VALUES ('0ef0453a-4dd8-407c-ab38-58893d5804f1', 'fe7f4487-3641-4377-be59-fd1a6e3b655c', '接口配置', '/api/config/api_config/index.action', '2', '1', '2', '0.fe7f4487-3641-4377-be59-fd1a6e3b655c.0ef0453a-4dd8-407c-ab38-58893d5804f1.', null, null, '1', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '1');
INSERT INTO `sys_module` VALUES ('0fa7b99841ef4d7784fdffd724d9f436', '9b0282da-002e-4f64-af74-97845a8ee785', '操作日志', '/base/logs/sys_log_work/index.action', '2', '1', '2', '0.9b0282da-002e-4f64-af74-97845a8ee785.0fa7b99841ef4d7784fdffd724d9f436.', 'oper.png', 'oper_hover.png', '1', '1', '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('12f3b540-aff7-4e93-bf79-f820d44fc9a0', '587b3f56-2db2-465e-8808-1dd2bbe06965', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.587b3f56-2db2-465e-8808-1dd2bbe06965.12f3b540-aff7-4e93-bf79-f820d44fc9a0.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('1448a246-9d08-424b-9cbb-e7f3fd038cae', '6370a00a-0649-4134-a055-f66b56d9b2d7', '转账', null, '2', '1', '2', '0.6370a00a-0649-4134-a055-f66b56d9b2d7.1448a246-9d08-424b-9cbb-e7f3fd038cae.', null, null, '1', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 09:39:10', null, '1');
INSERT INTO `sys_module` VALUES ('1467624b-4be5-47b9-87a3-57a229e52193', '0', '任务调度', null, '1', '1', '1', '0.1467624b-4be5-47b9-87a3-57a229e52193.', null, null, '1', null, '104', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-08-30 14:46:38', null, '0');
INSERT INTO `sys_module` VALUES ('148cd40a-9fa8-4e6b-a558-23a6cce505c8', 'ca8d2480-ce46-42a6-9592-2ce221f84c30', '区域管理', '/base/baseinfo/sys_region/index.action', '2', '1', '2', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.148cd40a-9fa8-4e6b-a558-23a6cce505c8.', 'area.png', 'area_hover.png', '1', '2', '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('149097be-62fe-4146-8a50-e9870fef2b72', '94f811ca-12f5-4edf-8112-acd1a34a686f', '密码重置', 'myrobj.resetPass(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.94f811ca-12f5-4edf-8112-acd1a34a686f.149097be-62fe-4146-8a50-e9870fef2b72.', 'icon_circle', null, '0', null, '8', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('14eeaad7-0c9c-43d5-a727-12143c6f2b0c', '938afb0a-0185-4383-9857-eadea7fc5aad', '新增', 'myrobj.add(this);', '3', '0', '3', '0.1467624b-4be5-47b9-87a3-57a229e52193.938afb0a-0185-4383-9857-eadea7fc5aad.14eeaad7-0c9c-43d5-a727-12143c6f2b0c.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-23 15:55:37', '新增', '0');
INSERT INTO `sys_module` VALUES ('15ae5998-f8d0-4d89-b506-529b4cfc6d0f', '9b0282da-002e-4f64-af74-97845a8ee785', '登录日志', '/base/logs/sys_log_login/index.action', '2', '1', '2', '0.9b0282da-002e-4f64-af74-97845a8ee785.15ae5998-f8d0-4d89-b506-529b4cfc6d0f.', 'login.png', 'login_hover.png', '1', '1', '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('166d5cac-f2ba-4a13-bcfb-eef4f9fb6edc', '938afb0a-0185-4383-9857-eadea7fc5aad', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.1467624b-4be5-47b9-87a3-57a229e52193.938afb0a-0185-4383-9857-eadea7fc5aad.166d5cac-f2ba-4a13-bcfb-eef4f9fb6edc.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-23 15:55:38', '编辑', '0');
INSERT INTO `sys_module` VALUES ('1783a0e7-015b-4bb9-9b2f-b760d7bf2af3', '6309944e-46d7-41a0-be5c-feb2431b8f8f', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.fe7f4487-3641-4377-be59-fd1a6e3b655c.6309944e-46d7-41a0-be5c-feb2431b8f8f.1783a0e7-015b-4bb9-9b2f-b760d7bf2af3.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '1');
INSERT INTO `sys_module` VALUES ('1895263a-b4dd-4afd-bf40-e207d31c7468', '442e1bc9-3015-4a20-8a86-041f82f65fe0', '启用', 'myrobj.publish(this);', '3', '1', '3', '0.1467624b-4be5-47b9-87a3-57a229e52193.442e1bc9-3015-4a20-8a86-041f82f65fe0.1895263a-b4dd-4afd-bf40-e207d31c7468.', 'icon_on', null, '0', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-22 17:44:09', '启用', '0');
INSERT INTO `sys_module` VALUES ('19e5f3d8-841a-4389-b25c-30a1c805ad23', '94f811ca-12f5-4edf-8112-acd1a34a686f', '启用', 'myrobj.enable(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.94f811ca-12f5-4edf-8112-acd1a34a686f.19e5f3d8-841a-4389-b25c-30a1c805ad23.', 'icon_ok', null, '0', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('1a547ab5-4bde-4a16-a353-4e9631647b9b', '1467624b-4be5-47b9-87a3-57a229e52193', '文章管理', '/sand/tb_dictinfo/index.action', '2', '1', '2', '0.1467624b-4be5-47b9-87a3-57a229e52193.1a547ab5-4bde-4a16-a353-4e9631647b9b.', null, null, '1', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-08-30 14:49:43', null, '1');
INSERT INTO `sys_module` VALUES ('1b11ea96-80ca-4594-a341-3ed01aa5b672', '9bb7497b-b149-41aa-a3b4-5fa2033fe391', '税单查询', null, '2', '1', '2', '0.9bb7497b-b149-41aa-a3b4-5fa2033fe391.1b11ea96-80ca-4594-a341-3ed01aa5b672.', null, null, '1', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 09:41:57', null, '1');
INSERT INTO `sys_module` VALUES ('1b13df57-83be-49c6-a3b5-18cf8011eeb8', '2a1407a5-1824-4eb5-bc1b-d9a6a4ce7f26', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.2a1407a5-1824-4eb5-bc1b-d9a6a4ce7f26.1b13df57-83be-49c6-a3b5-18cf8011eeb8.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('1b3586aa-f17f-4b70-aa3f-d840c19eb8eb', '0', 'APP管理', null, '1', '1', '1', '0.1b3586aa-f17f-4b70-aa3f-d840c19eb8eb.', 'app.png', 'app.h.png', '1', null, '400', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-07-17 18:18:07', null, '1');
INSERT INTO `sys_module` VALUES ('1b8c2673-8670-425b-acfb-e76f29084f11', '57f4169c-4afa-4205-bad8-bdfc93589737', '删除', 'myrobj.del(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.57f4169c-4afa-4205-bad8-bdfc93589737.1b8c2673-8670-425b-acfb-e76f29084f11.', 'icon_delete', null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('1bd5e3de-1fde-4d9a-8868-4fe28e9d228d', 'c8ace64b-cc83-42ba-84c2-a700e1211210', '员工管理', '/demo/demo/worker/index.action', '2', '1', '2', '0.c8ace64b-cc83-42ba-84c2-a700e1211210.1bd5e3de-1fde-4d9a-8868-4fe28e9d228d.', '', null, '1', '1', '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('1cb6254a-9b09-44ca-865e-e997f059b32d', '6e800af7-bb56-4d2c-bbfc-06669b4b553c', '分配模块', 'myrobj.setModule(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.6e800af7-bb56-4d2c-bbfc-06669b4b553c.1cb6254a-9b09-44ca-865e-e997f059b32d.', 'icon_set', null, '0', null, '6', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('1d1cdd6a-dca4-47f0-8f78-69346212923f', 'c157693e-f0e6-4e30-bd55-c6c5a5c2fbb0', '删除', 'myrobj.del(this);', '3', '1', '3', '0.486f4cc1-d2c2-4a8f-ae13-4e8132bb6e5e.c157693e-f0e6-4e30-bd55-c6c5a5c2fbb0.1d1cdd6a-dca4-47f0-8f78-69346212923f.', 'icon_delete', null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-10-25 13:43:28', '删除', '1');
INSERT INTO `sys_module` VALUES ('1f2d76f8-a9e2-4e0e-875b-e5d583658add', '638a6ba1-5182-425c-9c0d-b7bb9beaf3ab', '企业资质认证', '/finance/cert/finance_cert/index.action', '2', '1', '2', '0.638a6ba1-5182-425c-9c0d-b7bb9beaf3ab.1f2d76f8-a9e2-4e0e-875b-e5d583658add.', 'enter_cert.png', 'enter_cert.h.png', '1', null, '301', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-06-21 16:20:46', null, '1');
INSERT INTO `sys_module` VALUES ('1f8c2816-442b-43b8-820a-8a6410705074', '45f24b60-e190-4e3c-bcb9-1c494876030a', 'POS机明细', '/kyt/posaction/pos_trade/index.action', '2', '1', '2', '0.45f24b60-e190-4e3c-bcb9-1c494876030a.1f8c2816-442b-43b8-820a-8a6410705074.', 'pos.png', 'pos.hover.png', '1', null, '8', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-08 15:54:31', null, '1');
INSERT INTO `sys_module` VALUES ('1ffb653a-fb74-414f-b93e-29597fa51e04', '4ece9939-d07d-4934-9f00-797c673b8927', '现货矿石审批', '/trade/ore/ore_spot/index.action', '2', '1', '2', '0.4ece9939-d07d-4934-9f00-797c673b8927.1ffb653a-fb74-414f-b93e-29597fa51e04.', 'check.png', 'check.h.png', '1', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-07-04 10:42:26', null, '1');
INSERT INTO `sys_module` VALUES ('204c706b-b59a-47e8-b3a1-c296d8e1b458', 'be46cf51-8498-472a-bcb9-56c6a5cafbf3', '税费结转', '/kyt/taxe/tax_bill/index.action', '2', '1', '2', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.204c706b-b59a-47e8-b3a1-c296d8e1b458.', 'tax_jz.png', 'tax_jz.h.png', '1', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-09 17:14:51', null, '1');
INSERT INTO `sys_module` VALUES ('2105aa1a-4cf7-4adc-846f-39592a9ae2d5', 'd1aa459e-b49d-4c34-a49b-981e4b0f1074', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.d1aa459e-b49d-4c34-a49b-981e4b0f1074.2105aa1a-4cf7-4adc-846f-39592a9ae2d5.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-01-10 10:54:32', '编辑', '1');
INSERT INTO `sys_module` VALUES ('210f9333-de18-4add-bab9-86e73f7686a0', 'fd7d03b6-24de-491d-8438-e516a2ae0596', '审核', 'myrobj.check(this);', '3', '1', '3', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.fd7d03b6-24de-491d-8438-e516a2ae0596.210f9333-de18-4add-bab9-86e73f7686a0.', 'icon_edit', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-07-26 12:00:52', null, '1');
INSERT INTO `sys_module` VALUES ('236d5279-6ec5-47ed-ba02-8a8316a07c6e', '00bb7d14-2985-4d62-9c0a-69b814e49706', '部门管理', '/base/power/sys_dept/index.action', '2', '1', '2', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.236d5279-6ec5-47ed-ba02-8a8316a07c6e.', 'dept.png', 'dept_hover.png', '1', '1', '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('23cf2bf6-989e-4c67-89f4-48dddf76e9e2', '204c706b-b59a-47e8-b3a1-c296d8e1b458', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.204c706b-b59a-47e8-b3a1-c296d8e1b458.23cf2bf6-989e-4c67-89f4-48dddf76e9e2.', null, null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-09 17:16:24', null, '1');
INSERT INTO `sys_module` VALUES ('23ed8d12-2243-4a75-8aae-124f1e04c987', '587b3f56-2db2-465e-8808-1dd2bbe06965', '删除', 'myrobj.del(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.587b3f56-2db2-465e-8808-1dd2bbe06965.23ed8d12-2243-4a75-8aae-124f1e04c987.', 'icon_delete', null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('27c6f83a-7208-4132-af04-9b0d5b52769f', '57f4169c-4afa-4205-bad8-bdfc93589737', '禁用', 'myrobj.disable(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.57f4169c-4afa-4205-bad8-bdfc93589737.27c6f83a-7208-4132-af04-9b0d5b52769f.', 'icon_no', null, '0', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('2a1407a5-1824-4eb5-bc1b-d9a6a4ce7f26', 'ca8d2480-ce46-42a6-9592-2ce221f84c30', '全局配置', '/base/baseinfo/sys_config/index.action', '2', '1', '2', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.2a1407a5-1824-4eb5-bc1b-d9a6a4ce7f26.', 'gloal.png', 'gloal_hover.png', '1', '3', '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('2a3fcaf2-4eb1-44ce-96b6-427009c33666', '0', '基础信息', null, '1', '1', '1', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.', 'base.png', 'base.hover.png', '1', null, '111', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-01-08 21:04:50', null, '1');
INSERT INTO `sys_module` VALUES ('2ba7be3c-ea68-44f5-85e5-a80325d358aa', 'eaf2657f-5da3-4fe3-8e0b-19a9afe057a9', '新增', 'myrobj.add(this);', '3', '1', '3', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.eaf2657f-5da3-4fe3-8e0b-19a9afe057a9.2ba7be3c-ea68-44f5-85e5-a80325d358aa.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-08 19:42:53', '新增', '1');
INSERT INTO `sys_module` VALUES ('2bf3a668-e1d9-428b-a1e7-b29d5f9190eb', 'be46cf51-8498-472a-bcb9-56c6a5cafbf3', '充值明细', '/kyt/taxe/infund/officeIndex.action', '2', '1', '2', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.2bf3a668-e1d9-428b-a1e7-b29d5f9190eb.', 'cz_detail.png', 'cz_detail.h.png', '1', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-05-16 15:52:29', null, '1');
INSERT INTO `sys_module` VALUES ('2ddf7846-305f-47ed-a9b7-0d531c4f456f', '76d16d0e-4f2d-4845-8dfb-a40afeda11db', '禁用', 'myrobj.disable(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.76d16d0e-4f2d-4845-8dfb-a40afeda11db.2ddf7846-305f-47ed-a9b7-0d531c4f456f.', 'icon_no', null, '0', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('2e072859-6fc8-4420-9819-67a52f5a1a0a', '71db02c9-0f5d-4f44-95b1-8493dfb5d4f3', '删除', 'myrobj.del(this);', '3', '1', '3', '0.9cd9cb24-dab0-45e1-9636-2fc06309e0cb.71db02c9-0f5d-4f44-95b1-8493dfb5d4f3.2e072859-6fc8-4420-9819-67a52f5a1a0a.', null, null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 15:54:13', null, '1');
INSERT INTO `sys_module` VALUES ('2fbe8c54-3665-4359-a824-dee62a078bf2', '2a1407a5-1824-4eb5-bc1b-d9a6a4ce7f26', '禁用', 'myrobj.disable(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.2a1407a5-1824-4eb5-bc1b-d9a6a4ce7f26.2fbe8c54-3665-4359-a824-dee62a078bf2.', 'icon_no', null, '0', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('3124a721-2d68-4443-839c-aa96b64d40e9', '2a3fcaf2-4eb1-44ce-96b6-427009c33666', '区域管理', '/kyt/sys/county_info/index.action', '2', '1', '2', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.3124a721-2d68-4443-839c-aa96b64d40e9.', 'area.png', 'area_hover.png', '1', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-26 17:03:40', null, '1');
INSERT INTO `sys_module` VALUES ('313f49ba-7592-4bcb-bddb-cc9dfc245053', '45f24b60-e190-4e3c-bcb9-1c494876030a', '预申报限制', '/kyt/sys/county_info/index.action', '2', '0', '2', '0.45f24b60-e190-4e3c-bcb9-1c494876030a.313f49ba-7592-4bcb-bddb-cc9dfc245053.', null, null, '1', null, '7', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-01-23 13:47:11', null, '1');
INSERT INTO `sys_module` VALUES ('31a1ac0b-53d3-43a8-94bb-d1986772f92b', '236d5279-6ec5-47ed-ba02-8a8316a07c6e', '启用', 'myrobj.enable(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.236d5279-6ec5-47ed-ba02-8a8316a07c6e.31a1ac0b-53d3-43a8-94bb-d1986772f92b.', 'icon_ok', null, '0', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('3231087c-ddb2-4ee2-b673-198d583e0682', 'afb82e9a-3241-4b0f-89b8-213cf1ea4506', '激活', 'myrobj.activate(this);', '3', '1', '3', '0.8acbf7e2-9ff6-419a-a1ad-cc12a9424e90.afb82e9a-3241-4b0f-89b8-213cf1ea4506.3231087c-ddb2-4ee2-b673-198d583e0682.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-12-19 16:49:05', null, '1');
INSERT INTO `sys_module` VALUES ('325f7e39-e9bf-4445-99bb-c9b23b5fc0a8', 'c5e41dd5-cebe-47ed-bbe0-db08e6e4b9aa', '启用', 'myrobj.enable(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.c5e41dd5-cebe-47ed-bbe0-db08e6e4b9aa.325f7e39-e9bf-4445-99bb-c9b23b5fc0a8.', 'icon_ok', null, '0', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('34b0db13-801d-4f91-ab7e-074efefe180e', '938afb0a-0185-4383-9857-eadea7fc5aad', '禁用', 'myrobj.disable(this);', '3', '1', '3', '0.1467624b-4be5-47b9-87a3-57a229e52193.938afb0a-0185-4383-9857-eadea7fc5aad.34b0db13-801d-4f91-ab7e-074efefe180e.', 'icon_off', null, '0', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-23 15:55:38', '禁用', '1');
INSERT INTO `sys_module` VALUES ('36f2e6ed-ad2f-4263-beb3-5695a851b3a3', '76d16d0e-4f2d-4845-8dfb-a40afeda11db', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.76d16d0e-4f2d-4845-8dfb-a40afeda11db.36f2e6ed-ad2f-4263-beb3-5695a851b3a3.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('375acfce-aa4a-4781-9e85-74842114db8a', '442e1bc9-3015-4a20-8a86-041f82f65fe0', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.1467624b-4be5-47b9-87a3-57a229e52193.442e1bc9-3015-4a20-8a86-041f82f65fe0.375acfce-aa4a-4781-9e85-74842114db8a.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-22 17:44:09', '编辑', '0');
INSERT INTO `sys_module` VALUES ('37775448-34bb-4e4b-843d-fbd7d5e10242', '7f20949b-eecb-432b-8105-6a1d0b607b29', '皮重变更权限', '/kyt/station/userlevel/index.action', '2', '1', '2', '0.7f20949b-eecb-432b-8105-6a1d0b607b29.37775448-34bb-4e4b-843d-fbd7d5e10242.', null, null, '1', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-07-23 17:01:57', null, '1');
INSERT INTO `sys_module` VALUES ('3826bacc-4ad9-4cf7-8a04-adf6dec0e77b', 'ad06432b-ca75-4a78-b973-390b01b5cbd3', '企业资料', null, '2', '1', '2', '0.ad06432b-ca75-4a78-b973-390b01b5cbd3.3826bacc-4ad9-4cf7-8a04-adf6dec0e77b.', null, null, '1', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 09:34:11', null, '1');
INSERT INTO `sys_module` VALUES ('388ecee7-aa56-4d86-a9fe-7e38d41dd198', '9bb7497b-b149-41aa-a3b4-5fa2033fe391', '合同管理', null, '2', '1', '2', '0.9bb7497b-b149-41aa-a3b4-5fa2033fe391.388ecee7-aa56-4d86-a9fe-7e38d41dd198.', null, null, '1', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 09:40:34', null, '1');
INSERT INTO `sys_module` VALUES ('38a9a3f4-c1e6-429d-be34-9666f4e9dcb7', 'd1aa459e-b49d-4c34-a49b-981e4b0f1074', '禁用', 'myrobj.disable(this);', '3', '1', '3', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.d1aa459e-b49d-4c34-a49b-981e4b0f1074.38a9a3f4-c1e6-429d-be34-9666f4e9dcb7.', 'icon_no', null, '0', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-01-10 10:54:32', '禁用', '1');
INSERT INTO `sys_module` VALUES ('3bbd7b2a-ac05-4e6c-bf62-f58818351f9d', 'd1b3e6e7-8fa5-4af5-8e27-4c13ba4c7404', '删除', 'myrobj.del(this);', '3', '1', '3', '0.c8ace64b-cc83-42ba-84c2-a700e1211210.d1b3e6e7-8fa5-4af5-8e27-4c13ba4c7404.3bbd7b2a-ac05-4e6c-bf62-f58818351f9d.', 'icon_delete', null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('3cd7a26e-e287-4e0b-80ff-3ce6177a84d9', '0ef0453a-4dd8-407c-ab38-58893d5804f1', '启用', 'myrobj.enable(this);', '3', '1', '3', '0.fe7f4487-3641-4377-be59-fd1a6e3b655c.0ef0453a-4dd8-407c-ab38-58893d5804f1.3cd7a26e-e287-4e0b-80ff-3ce6177a84d9.', 'icon_ok', null, '0', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '1');
INSERT INTO `sys_module` VALUES ('3cfbadc8-7d41-4c71-b764-1c95f1d78481', '6370a00a-0649-4134-a055-f66b56d9b2d7', '充值', null, '2', '1', '2', '0.6370a00a-0649-4134-a055-f66b56d9b2d7.3cfbadc8-7d41-4c71-b764-1c95f1d78481.', null, null, '1', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 09:38:55', null, '1');
INSERT INTO `sys_module` VALUES ('3df57e80-6185-4fc8-84af-ab6fef304612', '6309944e-46d7-41a0-be5c-feb2431b8f8f', '新增', 'myrobj.add(this);', '3', '1', '3', '0.fe7f4487-3641-4377-be59-fd1a6e3b655c.6309944e-46d7-41a0-be5c-feb2431b8f8f.3df57e80-6185-4fc8-84af-ab6fef304612.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '1');
INSERT INTO `sys_module` VALUES ('3e0a8684-c82e-427b-8151-4ab128450cdb', 'ca503395-2f6f-4b57-9373-306d46889535', '新增', 'myrobj.add(this);', '3', '1', '3', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.ca503395-2f6f-4b57-9373-306d46889535.3e0a8684-c82e-427b-8151-4ab128450cdb.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-08-27 10:32:06', '新增', '1');
INSERT INTO `sys_module` VALUES ('3e1aacef-f610-4b4e-afa0-d18eec8bceb6', 'b93492b6-ee47-4938-a904-8be86a2abd03', '新增', 'myrobj.add(this);', '3', '1', '3', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.b93492b6-ee47-4938-a904-8be86a2abd03.3e1aacef-f610-4b4e-afa0-d18eec8bceb6.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-09 20:23:30', '新增', '1');
INSERT INTO `sys_module` VALUES ('3fa59b51-3c47-4a01-a3f6-4e9cb240d78b', 'd1aa459e-b49d-4c34-a49b-981e4b0f1074', '启用', 'myrobj.enable(this);', '3', '1', '3', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.d1aa459e-b49d-4c34-a49b-981e4b0f1074.3fa59b51-3c47-4a01-a3f6-4e9cb240d78b.', 'icon_ok', null, '0', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-01-10 10:54:32', '启用', '1');
INSERT INTO `sys_module` VALUES ('409255c7-8023-4374-ba97-2c3f3a6ba9a5', '204c706b-b59a-47e8-b3a1-c296d8e1b458', '少量税费结转单', 'myrobj.manualAdd(this);', '3', '1', '3', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.204c706b-b59a-47e8-b3a1-c296d8e1b458.409255c7-8023-4374-ba97-2c3f3a6ba9a5.', 'icon_add', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-05-16 16:02:43', null, '1');
INSERT INTO `sys_module` VALUES ('42ba818c-ac15-4aba-b777-239b45a794b4', '1467624b-4be5-47b9-87a3-57a229e52193', '测试', null, '2', '1', '1', '0.1467624b-4be5-47b9-87a3-57a229e52193.42ba818c-ac15-4aba-b777-239b45a794b4.', null, null, '1', null, '106', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-10-12 19:55:38', null, '1');
INSERT INTO `sys_module` VALUES ('442e1bc9-3015-4a20-8a86-041f82f65fe0', '1467624b-4be5-47b9-87a3-57a229e52193', '友情链接', '/sand/url/index.action', '2', '0', '2', '0.1467624b-4be5-47b9-87a3-57a229e52193.442e1bc9-3015-4a20-8a86-041f82f65fe0.', null, null, '1', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-17 10:38:34', null, '0');
INSERT INTO `sys_module` VALUES ('443de6d4-8ba4-46c8-a0de-6da059f408e3', 'af3beb81-8b1e-4857-a738-ca5223864aa8', '新增', 'myrobj.add(this);', '3', '1', '3', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.af3beb81-8b1e-4857-a738-ca5223864aa8.443de6d4-8ba4-46c8-a0de-6da059f408e3.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-07-08 10:30:16', '新增', '1');
INSERT INTO `sys_module` VALUES ('455ddcf7-6d43-4aa4-a287-4123ef77281d', '0', '预申报管理', null, '1', '1', '1', '0.455ddcf7-6d43-4aa4-a287-4123ef77281d.', 'declare.png', 'declare.h.png', '1', null, '208', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-05-16 15:39:25', null, '1');
INSERT INTO `sys_module` VALUES ('45f24b60-e190-4e3c-bcb9-1c494876030a', '0', '资金管理', null, '1', '1', '1', '0.45f24b60-e190-4e3c-bcb9-1c494876030a.', 'money.png', 'money.hover.png', '1', null, '112', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-06 19:18:45', null, '1');
INSERT INTO `sys_module` VALUES ('4733120b-ff14-4c71-9d49-6068300d75d5', '9bb7497b-b149-41aa-a3b4-5fa2033fe391', '常用车辆管理', null, '2', '1', '2', '0.9bb7497b-b149-41aa-a3b4-5fa2033fe391.4733120b-ff14-4c71-9d49-6068300d75d5.', null, null, '1', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 09:41:43', null, '1');
INSERT INTO `sys_module` VALUES ('47c6e290-1327-4931-9323-b2ed9302544a', '638a6ba1-5182-425c-9c0d-b7bb9beaf3ab', '融资资质审核', '/finance/cert/finance_cert_agree/index.action', '2', '1', '2', '0.638a6ba1-5182-425c-9c0d-b7bb9beaf3ab.47c6e290-1327-4931-9323-b2ed9302544a.', 'check.png', 'check.h.png', '1', null, '302', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-06-26 14:27:08', null, '1');
INSERT INTO `sys_module` VALUES ('482029f4-c151-4e03-86ee-4daf30d83cf4', '57f4169c-4afa-4205-bad8-bdfc93589737', '启用', 'myrobj.enable(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.57f4169c-4afa-4205-bad8-bdfc93589737.482029f4-c151-4e03-86ee-4daf30d83cf4.', 'icon_ok', null, '0', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('486f4cc1-d2c2-4a8f-ae13-4e8132bb6e5e', '0', '系统设置', '', '1', '1', '1', '0.486f4cc1-d2c2-4a8f-ae13-4e8132bb6e5e.', 'sys.config.png', 'sys.config.hover.png', '1', null, '110', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-10-25 13:40:58', null, '1');
INSERT INTO `sys_module` VALUES ('4c17bb76-ce45-4490-995a-f7407fcb7309', '0', '通知管理', null, '1', '1', '1', '0.4c17bb76-ce45-4490-995a-f7407fcb7309.', 'notice.png', 'notice.hover.png', '1', null, '105', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '1');
INSERT INTO `sys_module` VALUES ('4ca88c2c-db1e-466c-930c-5a0c7113b76d', '08354cf4-3827-4c01-9398-9adfcdbd09d1', '启用', 'myrobj.enable(this);', '3', '1', '3', '0.1467624b-4be5-47b9-87a3-57a229e52193.08354cf4-3827-4c01-9398-9adfcdbd09d1.4ca88c2c-db1e-466c-930c-5a0c7113b76d.', 'icon_on', null, '0', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-20 11:08:08', '启用', '0');
INSERT INTO `sys_module` VALUES ('4e3c8616-8573-48cd-b1e7-ddd38c2352ea', '7f20949b-eecb-432b-8105-6a1d0b607b29', '过站异常信息', '/kyt/station/userlevel/passStationExceptionIndex.action', '2', '1', '2', '0.7f20949b-eecb-432b-8105-6a1d0b607b29.4e3c8616-8573-48cd-b1e7-ddd38c2352ea.', null, null, '1', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-08-07 14:16:06', null, '1');
INSERT INTO `sys_module` VALUES ('4ece9939-d07d-4934-9f00-797c673b8927', '0', '矿石审批', null, '1', '1', '1', '0.4ece9939-d07d-4934-9f00-797c673b8927.', 'kuang.png', 'kuang.h.png', '1', null, '209', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-06-21 09:26:46', null, '1');
INSERT INTO `sys_module` VALUES ('4f7dbabd-b1de-4ab7-a65d-4fc04ab27140', '9c1e5930-4291-43b5-a110-4ed3072e988f', '审核', 'myrobj.edit(this);', '3', '1', '3', '0.455ddcf7-6d43-4aa4-a287-4123ef77281d.9c1e5930-4291-43b5-a110-4ed3072e988f.4f7dbabd-b1de-4ab7-a65d-4fc04ab27140.', 'icon_edit', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-05-16 15:42:57', null, '1');
INSERT INTO `sys_module` VALUES ('4fad864b-624a-4324-ba61-830adb5b8db4', 'd7f3a719-0089-4c74-91d3-57f24d9ede7d', '关闭', 'myrobj.disable(this);', '3', '1', '3', '0.486f4cc1-d2c2-4a8f-ae13-4e8132bb6e5e.d7f3a719-0089-4c74-91d3-57f24d9ede7d.4fad864b-624a-4324-ba61-830adb5b8db4.', 'icon_no', null, '0', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-05-15 18:21:27', '禁用', '1');
INSERT INTO `sys_module` VALUES ('5001a0f2-2a07-45a7-8a5a-39532faec4a9', '45f24b60-e190-4e3c-bcb9-1c494876030a', '网银充值管理', '/kyt/fund/fund_turnover/index.action', '2', '1', '2', '0.45f24b60-e190-4e3c-bcb9-1c494876030a.5001a0f2-2a07-45a7-8a5a-39532faec4a9.', 'transfer.png', 'transfer.h.png', '1', null, '6', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-07-19 14:56:16', null, '1');
INSERT INTO `sys_module` VALUES ('502aa3a9-b02a-4ded-bc78-c25e7c6fb73b', '0ef0453a-4dd8-407c-ab38-58893d5804f1', '新增', 'myrobj.add(this);', '3', '1', '3', '0.fe7f4487-3641-4377-be59-fd1a6e3b655c.0ef0453a-4dd8-407c-ab38-58893d5804f1.502aa3a9-b02a-4ded-bc78-c25e7c6fb73b.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '1');
INSERT INTO `sys_module` VALUES ('50c45621-90b8-4ddc-94b9-11ad145df227', '2a1407a5-1824-4eb5-bc1b-d9a6a4ce7f26', '关闭', 'myrobj.disableopen(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.2a1407a5-1824-4eb5-bc1b-d9a6a4ce7f26.50c45621-90b8-4ddc-94b9-11ad145df227.', 'icon_lock', null, '0', null, '7', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('5124b901-dd76-4970-a42f-caff6803dc0e', '45f24b60-e190-4e3c-bcb9-1c494876030a', '待开户清单', '/kyt/enterprise/open_acnt/index.action', '2', '0', '2', '0.45f24b60-e190-4e3c-bcb9-1c494876030a.5124b901-dd76-4970-a42f-caff6803dc0e.', null, null, '1', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-01-08 21:07:52', null, '1');
INSERT INTO `sys_module` VALUES ('51a53c4b-7453-4127-8001-2da26609e011', '073c8332-f892-42ae-a302-545cf8ec0f0d', '审核', 'myrobj.edit(this);', '3', '1', '3', '0.45f24b60-e190-4e3c-bcb9-1c494876030a.073c8332-f892-42ae-a302-545cf8ec0f0d.51a53c4b-7453-4127-8001-2da26609e011.', 'icon_edit', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-01-23 13:47:40', null, '1');
INSERT INTO `sys_module` VALUES ('53481f5e-5983-49e6-adad-a1a46bb3c8ae', '938afb0a-0185-4383-9857-eadea7fc5aad', '删除', 'myrobj.del(this);', '3', '1', '3', '0.1467624b-4be5-47b9-87a3-57a229e52193.938afb0a-0185-4383-9857-eadea7fc5aad.53481f5e-5983-49e6-adad-a1a46bb3c8ae.', 'icon_delete', null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-23 15:55:38', '删除', '0');
INSERT INTO `sys_module` VALUES ('5355c330-467e-4f02-9ed1-0fc5dd97dbd6', '1467624b-4be5-47b9-87a3-57a229e52193', '个性定制', '/sand/webdata/index.action', '2', '1', '2', '0.1467624b-4be5-47b9-87a3-57a229e52193.5355c330-467e-4f02-9ed1-0fc5dd97dbd6.', null, null, '1', null, '6', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-17 14:33:32', null, '1');
INSERT INTO `sys_module` VALUES ('535cbb77-1deb-4e86-815c-8f0c970bea70', '45f24b60-e190-4e3c-bcb9-1c494876030a', '资金结算', '/kyt/fund/fund_settle/index.action', '2', '0', '2', '0.45f24b60-e190-4e3c-bcb9-1c494876030a.535cbb77-1deb-4e86-815c-8f0c970bea70.', null, null, '1', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-10-22 16:43:50', null, '1');
INSERT INTO `sys_module` VALUES ('5590bc02-f4c3-4934-9eb7-91c5b2b2c05b', 'ffd65eaa-4096-43d5-8a74-c95086b0a1e7', '账户更名', '/kyt/account/tax_name_change_log/index.action', '2', '1', '2', '0.ffd65eaa-4096-43d5-8a74-c95086b0a1e7.5590bc02-f4c3-4934-9eb7-91c5b2b2c05b.', 'rename.png', 'rename.h.png', '1', null, '7', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-05-16 15:49:06', null, '1');
INSERT INTO `sys_module` VALUES ('562e25ff-4caf-4f9c-abe5-0f498b936d88', '587b3f56-2db2-465e-8808-1dd2bbe06965', '启用', 'myrobj.enable(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.587b3f56-2db2-465e-8808-1dd2bbe06965.562e25ff-4caf-4f9c-abe5-0f498b936d88.', 'icon_ok', null, '0', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('571a903b-5484-4334-ab32-7dc8371be013', 'ffd65eaa-4096-43d5-8a74-c95086b0a1e7', '更名提交', '/kyt/account/tax_name_change_log/headIndex.action', '2', '1', '2', '0.ffd65eaa-4096-43d5-8a74-c95086b0a1e7.571a903b-5484-4334-ab32-7dc8371be013.', 'submit.png', 'submit.h.png', '1', null, '8', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-05-16 15:49:33', null, '1');
INSERT INTO `sys_module` VALUES ('5782e1af-fa28-496c-80c1-8a0fee3a5a4d', '94f811ca-12f5-4edf-8112-acd1a34a686f', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.94f811ca-12f5-4edf-8112-acd1a34a686f.5782e1af-fa28-496c-80c1-8a0fee3a5a4d.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('57a462e8-14fc-437d-9be3-4d866f4455d3', 'ffd65eaa-4096-43d5-8a74-c95086b0a1e7', '备用账户', '/kyt/account/bank_acnt/index.action', '2', '1', '2', '0.ffd65eaa-4096-43d5-8a74-c95086b0a1e7.57a462e8-14fc-437d-9be3-4d866f4455d3.', 'bei.png', 'bei.h.png', '1', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-15 21:44:58', null, '1');
INSERT INTO `sys_module` VALUES ('57f4169c-4afa-4205-bad8-bdfc93589737', 'ca8d2480-ce46-42a6-9592-2ce221f84c30', '模块配置', '/base/power/sys_module/index.action', '2', '1', '2', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.57f4169c-4afa-4205-bad8-bdfc93589737.', 'module.png', 'module_hover.png', '1', '4', '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('587b3f56-2db2-465e-8808-1dd2bbe06965', 'ca8d2480-ce46-42a6-9592-2ce221f84c30', '字典参数', '/base/baseinfo/sys_dictinfo/index.action', '2', '1', '2', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.587b3f56-2db2-465e-8808-1dd2bbe06965.', 'dictinfo.png', 'dictinfo_hover.png', '1', '1', '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('5887a5b6-4b59-4b45-8515-b8e579303b10', '0ef0453a-4dd8-407c-ab38-58893d5804f1', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.fe7f4487-3641-4377-be59-fd1a6e3b655c.0ef0453a-4dd8-407c-ab38-58893d5804f1.5887a5b6-4b59-4b45-8515-b8e579303b10.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '1');
INSERT INTO `sys_module` VALUES ('5917609a-14b9-4d4c-b600-816023ae45e4', '94f811ca-12f5-4edf-8112-acd1a34a686f', '新增', 'myrobj.add(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.94f811ca-12f5-4edf-8112-acd1a34a686f.5917609a-14b9-4d4c-b600-816023ae45e4.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('5a9bcd64-e6fb-47ce-8f78-244189512e36', '76d16d0e-4f2d-4845-8dfb-a40afeda11db', '删除', 'myrobj.del(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.76d16d0e-4f2d-4845-8dfb-a40afeda11db.5a9bcd64-e6fb-47ce-8f78-244189512e36.', 'icon_delete', null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('5af615eb-2af2-4198-b108-833258b25afb', '6e800af7-bb56-4d2c-bbfc-06669b4b553c', '清除模块', 'myrobj.clearModule(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.6e800af7-bb56-4d2c-bbfc-06669b4b553c.5af615eb-2af2-4198-b108-833258b25afb.', 'icon_clear', null, '0', null, '7', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('5be5e96a-c834-42f4-9ccb-459452c062d9', '204c706b-b59a-47e8-b3a1-c296d8e1b458', '手工结转单', 'myrobj.manualAdd(this);', '3', '1', '3', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.204c706b-b59a-47e8-b3a1-c296d8e1b458.5be5e96a-c834-42f4-9ccb-459452c062d9.', null, null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-09 17:16:03', null, '1');
INSERT INTO `sys_module` VALUES ('5bf3bfa9-9b5b-45c2-9638-0fd78ec960a4', 'c157693e-f0e6-4e30-bd55-c6c5a5c2fbb0', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.486f4cc1-d2c2-4a8f-ae13-4e8132bb6e5e.c157693e-f0e6-4e30-bd55-c6c5a5c2fbb0.5bf3bfa9-9b5b-45c2-9638-0fd78ec960a4.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-10-25 13:43:28', '编辑', '1');
INSERT INTO `sys_module` VALUES ('5dffa914-21c9-484e-b6e7-43fd21bea835', 'd1b3e6e7-8fa5-4af5-8e27-4c13ba4c7404', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.c8ace64b-cc83-42ba-84c2-a700e1211210.d1b3e6e7-8fa5-4af5-8e27-4c13ba4c7404.5dffa914-21c9-484e-b6e7-43fd21bea835.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('5f4f4ce2-51e6-4af6-99a7-1a25a0e55886', '148cd40a-9fa8-4e6b-a558-23a6cce505c8', '启用', 'myrobj.enable(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.148cd40a-9fa8-4e6b-a558-23a6cce505c8.5f4f4ce2-51e6-4af6-99a7-1a25a0e55886.', 'icon_ok', null, '0', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('5fcfd567-f056-4e8c-b71b-2a9e0fc12bfe', '587b3f56-2db2-465e-8808-1dd2bbe06965', '新增', 'myrobj.add(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.587b3f56-2db2-465e-8808-1dd2bbe06965.5fcfd567-f056-4e8c-b71b-2a9e0fc12bfe.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('61b0d859-0f4a-4483-acd6-56ecbed56985', '204c706b-b59a-47e8-b3a1-c296d8e1b458', '批量税费结转单', 'myrobj.add(this);', '3', '1', '3', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.204c706b-b59a-47e8-b3a1-c296d8e1b458.61b0d859-0f4a-4483-acd6-56ecbed56985.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-05-16 16:02:23', null, '1');
INSERT INTO `sys_module` VALUES ('61feaf56-b9c5-4839-889e-f2ffdda2d60a', '1467624b-4be5-47b9-87a3-57a229e52193', '测试', null, '2', '1', '1', '0.1467624b-4be5-47b9-87a3-57a229e52193.61feaf56-b9c5-4839-889e-f2ffdda2d60a.', null, null, '1', null, '106', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-10-12 19:55:57', null, '1');
INSERT INTO `sys_module` VALUES ('6309944e-46d7-41a0-be5c-feb2431b8f8f', 'fe7f4487-3641-4377-be59-fd1a6e3b655c', '参数配置', '/api/config/api_param_config/index.action', '2', '1', '2', '0.fe7f4487-3641-4377-be59-fd1a6e3b655c.6309944e-46d7-41a0-be5c-feb2431b8f8f.', null, null, '1', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '1');
INSERT INTO `sys_module` VALUES ('6370a00a-0649-4134-a055-f66b56d9b2d7', '0', '资金管理', null, '1', '1', '1', '0.6370a00a-0649-4134-a055-f66b56d9b2d7.', null, null, '0', null, '302', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 09:38:33', null, '1');
INSERT INTO `sys_module` VALUES ('638a6ba1-5182-425c-9c0d-b7bb9beaf3ab', '0', '融资', null, '1', '1', '1', '0.638a6ba1-5182-425c-9c0d-b7bb9beaf3ab.', 'financing.png', 'financing.h.png', '1', null, '300', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-06-21 16:08:24', null, '1');
INSERT INTO `sys_module` VALUES ('65cb6236-f40b-4242-aeb6-acb71637239f', '08354cf4-3827-4c01-9398-9adfcdbd09d1', '删除', 'myrobj.del(this);', '3', '1', '3', '0.1467624b-4be5-47b9-87a3-57a229e52193.08354cf4-3827-4c01-9398-9adfcdbd09d1.65cb6236-f40b-4242-aeb6-acb71637239f.', 'icon_delete', null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-20 11:08:08', '删除', '0');
INSERT INTO `sys_module` VALUES ('66367f86-ecb8-4cd8-92cb-fdb89404f1e8', 'fd7d03b6-24de-491d-8438-e516a2ae0596', '查看', 'myrobj.view(this);', '3', '1', '3', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.fd7d03b6-24de-491d-8438-e516a2ae0596.66367f86-ecb8-4cd8-92cb-fdb89404f1e8.', 'icon_view', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-07-26 12:01:30', null, '1');
INSERT INTO `sys_module` VALUES ('6637c834-cf1e-4480-b311-091bab4078d7', 'af3beb81-8b1e-4857-a738-ca5223864aa8', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.af3beb81-8b1e-4857-a738-ca5223864aa8.6637c834-cf1e-4480-b311-091bab4078d7.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-07-08 10:30:16', '编辑', '1');
INSERT INTO `sys_module` VALUES ('67090043-b508-4e6b-9a05-600e61bb0f8a', '45f24b60-e190-4e3c-bcb9-1c494876030a', '充值记录', '/kyt/fund/infund_record/index.action', '2', '1', '2', '0.45f24b60-e190-4e3c-bcb9-1c494876030a.67090043-b508-4e6b-9a05-600e61bb0f8a.', null, null, '1', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-06 19:19:09', null, '1');
INSERT INTO `sys_module` VALUES ('67198f2d-e63c-40cf-8a4f-c1f14b54a0bf', '08354cf4-3827-4c01-9398-9adfcdbd09d1', '新增', 'myrobj.add(this);', '3', '1', '3', '0.1467624b-4be5-47b9-87a3-57a229e52193.08354cf4-3827-4c01-9398-9adfcdbd09d1.67198f2d-e63c-40cf-8a4f-c1f14b54a0bf.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-20 11:08:08', '新增', '0');
INSERT INTO `sys_module` VALUES ('68fd14e4-9f0b-40fb-9c70-543df245d5c4', '80ccfe6a-4cf5-4a52-a419-fa13d9f3a4ce', '审批', '/trade/ore/ore_spot/index.action', '2', '1', '2', '0.80ccfe6a-4cf5-4a52-a419-fa13d9f3a4ce.68fd14e4-9f0b-40fb-9c70-543df245d5c4.', 'check.png', 'check.h.png', '1', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-06-21 09:30:39', null, '1');
INSERT INTO `sys_module` VALUES ('692cd3fe-6ebb-4e38-ad8a-f8c6e3591a3d', '90d53381-c5e5-47be-a16c-bdc29be6402b', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.486f4cc1-d2c2-4a8f-ae13-4e8132bb6e5e.90d53381-c5e5-47be-a16c-bdc29be6402b.692cd3fe-6ebb-4e38-ad8a-f8c6e3591a3d.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-10-25 13:42:01', '编辑', '1');
INSERT INTO `sys_module` VALUES ('6b30cb1b-48f5-490f-8fab-4913a2030068', 'ffd65eaa-4096-43d5-8a74-c95086b0a1e7', '账户生效', '/kyt/account/account_submit/headofficeTakeEffectIndex.action', '2', '1', '2', '0.ffd65eaa-4096-43d5-8a74-c95086b0a1e7.6b30cb1b-48f5-490f-8fab-4913a2030068.', 'take.png', 'take.h.png', '1', null, '6', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-05-16 15:46:12', null, '1');
INSERT INTO `sys_module` VALUES ('6d987854-37a8-421e-a223-46041143a1b2', '57f4169c-4afa-4205-bad8-bdfc93589737', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.57f4169c-4afa-4205-bad8-bdfc93589737.6d987854-37a8-421e-a223-46041143a1b2.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('6e800af7-bb56-4d2c-bbfc-06669b4b553c', '00bb7d14-2985-4d62-9c0a-69b814e49706', '角色管理', '/base/power/sys_role/index.action', '2', '1', '2', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.6e800af7-bb56-4d2c-bbfc-06669b4b553c.', 'role.png', 'role_hover.png', '1', '2', '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('717b52b1-269a-43d9-8e05-cbc110eefd67', 'ee461328-9813-45ca-98ca-6888c753e99d', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.ee461328-9813-45ca-98ca-6888c753e99d.717b52b1-269a-43d9-8e05-cbc110eefd67.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 15:22:44', '编辑', '1');
INSERT INTO `sys_module` VALUES ('71db02c9-0f5d-4f44-95b1-8493dfb5d4f3', '9cd9cb24-dab0-45e1-9636-2fc06309e0cb', '角色管理', '/base/power/tb_role/index.action', '2', '1', '2', '0.9cd9cb24-dab0-45e1-9636-2fc06309e0cb.71db02c9-0f5d-4f44-95b1-8493dfb5d4f3.', null, null, '1', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 15:42:28', null, '1');
INSERT INTO `sys_module` VALUES ('7480789d-1bbe-4daf-b633-06fd6b810fee', '76d16d0e-4f2d-4845-8dfb-a40afeda11db', '启用', 'myrobj.enable(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.76d16d0e-4f2d-4845-8dfb-a40afeda11db.7480789d-1bbe-4daf-b633-06fd6b810fee.', 'icon_ok', null, '0', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('75294566-b47f-48b4-87d4-e8204da0192f', '204c706b-b59a-47e8-b3a1-c296d8e1b458', '自动结转', 'myrobj.add(this);', '3', '1', '3', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.204c706b-b59a-47e8-b3a1-c296d8e1b458.75294566-b47f-48b4-87d4-e8204da0192f.', null, null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-09 17:15:29', null, '1');
INSERT INTO `sys_module` VALUES ('76d16d0e-4f2d-4845-8dfb-a40afeda11db', 'ca8d2480-ce46-42a6-9592-2ce221f84c30', '字典分类', '/base/baseinfo/sys_dictkind/index.action', '2', '1', '2', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.76d16d0e-4f2d-4845-8dfb-a40afeda11db.', 'dictkind.png', 'dictkind_hover.png', '1', '1', '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('76e26e08-9a88-4fb5-aa70-b8f7acbfdabb', 'a10b2874-e4cf-4eaf-9a01-1e00c4542555', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.1467624b-4be5-47b9-87a3-57a229e52193.a10b2874-e4cf-4eaf-9a01-1e00c4542555.76e26e08-9a88-4fb5-aa70-b8f7acbfdabb.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-22 17:48:20', '编辑', '0');
INSERT INTO `sys_module` VALUES ('7708880c-1d24-4024-aa93-2043be71f1f4', '204c706b-b59a-47e8-b3a1-c296d8e1b458', '提交', 'myrobj.editState(this);', '3', '1', '3', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.204c706b-b59a-47e8-b3a1-c296d8e1b458.7708880c-1d24-4024-aa93-2043be71f1f4.', null, null, '0', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-09 17:16:45', null, '1');
INSERT INTO `sys_module` VALUES ('78ceec3e-4e66-43ef-bfd5-6eacc79aedcb', '0', '测试', null, '1', '1', '1', '0.78ceec3e-4e66-43ef-bfd5-6eacc79aedcb.', null, null, '1', null, '105', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-10-12 19:56:42', null, '1');
INSERT INTO `sys_module` VALUES ('79bf3851-bd65-4e3b-b464-b5c77f5d5ae5', '0e1c8d31-41aa-43ce-be50-2683869e5ba5', '删除', 'myrobj.del(this);', '3', '1', '3', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.0e1c8d31-41aa-43ce-be50-2683869e5ba5.79bf3851-bd65-4e3b-b464-b5c77f5d5ae5.', 'icon_delete', null, '0', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-12 15:52:17', null, '1');
INSERT INTO `sys_module` VALUES ('79c1c01b-7c06-4f93-b1d6-7b36c7c9d181', 'ca503395-2f6f-4b57-9373-306d46889535', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.ca503395-2f6f-4b57-9373-306d46889535.79c1c01b-7c06-4f93-b1d6-7b36c7c9d181.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-08-27 10:32:06', '编辑', '1');
INSERT INTO `sys_module` VALUES ('7b5dd347-4d95-4696-9852-8a4ee93a16fe', 'be46cf51-8498-472a-bcb9-56c6a5cafbf3', '充值审核', '/kyt/taxe/infund/checkIndex.action', '2', '1', '2', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.7b5dd347-4d95-4696-9852-8a4ee93a16fe.', 'check.png', 'check.h.png', '1', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-05-16 15:52:09', null, '1');
INSERT INTO `sys_module` VALUES ('7c0b10d8-eecc-4a77-b77e-3cebb9403acd', 'd1f6b85f-bf12-4f8e-a35a-234767b4905c', '禁用', 'myrobj.disable(this);', '3', '1', '3', '0.1467624b-4be5-47b9-87a3-57a229e52193.d1f6b85f-bf12-4f8e-a35a-234767b4905c.7c0b10d8-eecc-4a77-b77e-3cebb9403acd.', 'icon_off', null, '0', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-19 19:49:15', '禁用', '0');
INSERT INTO `sys_module` VALUES ('7d76d94a-d9de-466f-ad12-794335a09ff7', '1467624b-4be5-47b9-87a3-57a229e52193', '测试--', '/kyt/index/index_imgs/index.action', '2', '1', '2', '0.1467624b-4be5-47b9-87a3-57a229e52193.7d76d94a-d9de-466f-ad12-794335a09ff7.', null, null, '1', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-06 17:30:31', null, '1');
INSERT INTO `sys_module` VALUES ('7db46eae-cc32-4989-9770-967d6d704b64', 'ffd65eaa-4096-43d5-8a74-c95086b0a1e7', '更名', '/kyt/account/tax_name_change_log/bankIndex.action', '2', '1', '2', '0.ffd65eaa-4096-43d5-8a74-c95086b0a1e7.7db46eae-cc32-4989-9770-967d6d704b64.', 'rename.png', 'rename.h.png', '1', null, '9', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-05-16 15:50:31', null, '1');
INSERT INTO `sys_module` VALUES ('7f20949b-eecb-432b-8105-6a1d0b607b29', '0', '计量站', null, '1', '1', '1', '0.7f20949b-eecb-432b-8105-6a1d0b607b29.', 'sys_config.png', 'sys_config_hover.png', '1', null, '401', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-07-19 13:55:46', null, '1');
INSERT INTO `sys_module` VALUES ('80ccfe6a-4cf5-4a52-a419-fa13d9f3a4ce', '0', '现货矿石', null, '1', '1', '1', '0.80ccfe6a-4cf5-4a52-a419-fa13d9f3a4ce.', null, null, '1', null, '210', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-06-21 09:29:14', null, '1');
INSERT INTO `sys_module` VALUES ('819fb772-614d-460a-95c0-4bd490f910a3', '0e1c8d31-41aa-43ce-be50-2683869e5ba5', '审核', 'myrobj.audit(this);', '3', '1', '3', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.0e1c8d31-41aa-43ce-be50-2683869e5ba5.819fb772-614d-460a-95c0-4bd490f910a3.', 'icon_edit', null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-12-26 10:59:29', null, '1');
INSERT INTO `sys_module` VALUES ('82a06b86-aa88-42f6-b697-3e2079408c33', 'a10b2874-e4cf-4eaf-9a01-1e00c4542555', '启用', 'myrobj.publish(this);', '3', '1', '3', '0.1467624b-4be5-47b9-87a3-57a229e52193.a10b2874-e4cf-4eaf-9a01-1e00c4542555.82a06b86-aa88-42f6-b697-3e2079408c33.', 'icon_on', null, '0', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-22 17:48:20', '启用', '0');
INSERT INTO `sys_module` VALUES ('82b65f6d-8af6-4358-b8ee-2a1c2ea66d11', '1f2d76f8-a9e2-4e0e-875b-e5d583658add', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.638a6ba1-5182-425c-9c0d-b7bb9beaf3ab.1f2d76f8-a9e2-4e0e-875b-e5d583658add.82b65f6d-8af6-4358-b8ee-2a1c2ea66d11.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-06-21 16:22:11', '编辑', '1');
INSERT INTO `sys_module` VALUES ('8363bc43-dbf2-409a-b181-c770418de556', '71db02c9-0f5d-4f44-95b1-8493dfb5d4f3', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.9cd9cb24-dab0-45e1-9636-2fc06309e0cb.71db02c9-0f5d-4f44-95b1-8493dfb5d4f3.8363bc43-dbf2-409a-b181-c770418de556.', null, null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 15:54:05', null, '1');
INSERT INTO `sys_module` VALUES ('83afba04-3f31-4c5a-ab65-e76872eb0408', 'ad06432b-ca75-4a78-b973-390b01b5cbd3', '二级企业-用户管理', null, '2', '1', '2', '0.ad06432b-ca75-4a78-b973-390b01b5cbd3.83afba04-3f31-4c5a-ab65-e76872eb0408.', null, null, '1', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 09:47:49', null, '1');
INSERT INTO `sys_module` VALUES ('83f84cd4-3cbf-4b5c-8e9f-fdc0393f98d7', '8acbf7e2-9ff6-419a-a1ad-cc12a9424e90', '地区矿种', '/kyt/enterprise/ore_info/index.action', '2', '1', '2', '0.8acbf7e2-9ff6-419a-a1ad-cc12a9424e90.83f84cd4-3cbf-4b5c-8e9f-fdc0393f98d7.', null, null, '1', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-19 18:39:05', null, '1');
INSERT INTO `sys_module` VALUES ('855020e4-4661-4b1e-ac27-1d2476bb2e0f', 'fe7f4487-3641-4377-be59-fd1a6e3b655c', '接口调用日志', '/api/invoke/api_invoke_log/index.action', '2', '1', '1', '0.fe7f4487-3641-4377-be59-fd1a6e3b655c.855020e4-4661-4b1e-ac27-1d2476bb2e0f.', null, null, '1', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '1');
INSERT INTO `sys_module` VALUES ('8640a088-e3d7-41ad-92a8-ff3249822593', 'ffd65eaa-4096-43d5-8a74-c95086b0a1e7', '审核开户', '/kyt/account/account_check/index.action', '2', '1', '2', '0.ffd65eaa-4096-43d5-8a74-c95086b0a1e7.8640a088-e3d7-41ad-92a8-ff3249822593.', 'check.png', 'check.h.png', '1', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-26 17:04:43', null, '1');
INSERT INTO `sys_module` VALUES ('875992bf-ee1e-416d-a5bf-139398d81946', '4c17bb76-ce45-4490-995a-f7407fcb7309', '公告', '/kyt/notice/notice/index.action', '2', '1', '2', '0.4c17bb76-ce45-4490-995a-f7407fcb7309.875992bf-ee1e-416d-a5bf-139398d81946.', 'msg.png', 'msg.hover.png', '1', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '1');
INSERT INTO `sys_module` VALUES ('8acbf7e2-9ff6-419a-a1ad-cc12a9424e90', '0', '企业信息', null, '1', '1', '1', '0.8acbf7e2-9ff6-419a-a1ad-cc12a9424e90.', null, null, '1', null, '201', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-12 19:16:00', null, '1');
INSERT INTO `sys_module` VALUES ('8bfe2a23-8a66-4003-9b4a-95f396c84d0e', '236d5279-6ec5-47ed-ba02-8a8316a07c6e', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.236d5279-6ec5-47ed-ba02-8a8316a07c6e.8bfe2a23-8a66-4003-9b4a-95f396c84d0e.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('8d7f8003-30df-4e75-976f-b471ac092260', 'c5e41dd5-cebe-47ed-bbe0-db08e6e4b9aa', '新增', 'myrobj.add(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.c5e41dd5-cebe-47ed-bbe0-db08e6e4b9aa.8d7f8003-30df-4e75-976f-b471ac092260.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('8e2aaad1-e4b6-469d-ac3f-905e9bbe3f42', '8acbf7e2-9ff6-419a-a1ad-cc12a9424e90', '开户申请', '/kyt/enterprise/open_acnt/index.action', '2', '1', '2', '0.8acbf7e2-9ff6-419a-a1ad-cc12a9424e90.8e2aaad1-e4b6-469d-ac3f-905e9bbe3f42.', null, null, '1', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-11-07 16:01:37', null, '1');
INSERT INTO `sys_module` VALUES ('8e4db1f3-edf5-4228-9788-8267a7bb1fba', 'ffd65eaa-4096-43d5-8a74-c95086b0a1e7', '未关联账户处理', '/kyt/account/account_norelate/index.action', '2', '1', '2', '0.ffd65eaa-4096-43d5-8a74-c95086b0a1e7.8e4db1f3-edf5-4228-9788-8267a7bb1fba.', null, null, '1', null, '100', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-07-05 17:05:09', null, '1');
INSERT INTO `sys_module` VALUES ('8ee3f88d-fade-4c65-85a1-59cad2d0d3f7', 'ad06432b-ca75-4a78-b973-390b01b5cbd3', '二级企业-企业管理', null, '2', '1', '2', '0.ad06432b-ca75-4a78-b973-390b01b5cbd3.8ee3f88d-fade-4c65-85a1-59cad2d0d3f7.', null, null, '1', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 09:35:16', null, '1');
INSERT INTO `sys_module` VALUES ('8ffea0cf-9655-491f-a128-4c81494a9672', 'd1aa459e-b49d-4c34-a49b-981e4b0f1074', '新增', 'myrobj.add(this);', '3', '1', '3', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.d1aa459e-b49d-4c34-a49b-981e4b0f1074.8ffea0cf-9655-491f-a128-4c81494a9672.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-01-10 10:54:32', '新增', '1');
INSERT INTO `sys_module` VALUES ('90d53381-c5e5-47be-a16c-bdc29be6402b', '486f4cc1-d2c2-4a8f-ae13-4e8132bb6e5e', '常用配置', '/kyt/sys/config/index.action', '2', '1', '2', '0.486f4cc1-d2c2-4a8f-ae13-4e8132bb6e5e.90d53381-c5e5-47be-a16c-bdc29be6402b.', 'cy.config.png', 'cy.config.hover.png', '1', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-10-25 13:41:42', null, '1');
INSERT INTO `sys_module` VALUES ('926d2916-f18e-4506-a110-718c28fbe988', '236d5279-6ec5-47ed-ba02-8a8316a07c6e', '新增', 'myrobj.add(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.236d5279-6ec5-47ed-ba02-8a8316a07c6e.926d2916-f18e-4506-a110-718c28fbe988.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('938afb0a-0185-4383-9857-eadea7fc5aad', '1467624b-4be5-47b9-87a3-57a229e52193', '网站图片', '/sand/module_img/index.action', '2', '0', '2', '0.1467624b-4be5-47b9-87a3-57a229e52193.938afb0a-0185-4383-9857-eadea7fc5aad.', null, null, '1', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-05 14:52:43', null, '0');
INSERT INTO `sys_module` VALUES ('943540fc-bea7-4777-b519-d19135c26dc1', 'a00a20ad-d82e-4011-907f-60f6f04c083d', '充值方式', '/kyt/common/data_dict/index.action?type=DT_INFUNDTYPE', '2', '1', '2', '0.a00a20ad-d82e-4011-907f-60f6f04c083d.943540fc-bea7-4777-b519-d19135c26dc1.', 'invest.png', 'invest.hover.png', '1', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-06-14 16:31:16', null, '1');
INSERT INTO `sys_module` VALUES ('94f811ca-12f5-4edf-8112-acd1a34a686f', '00bb7d14-2985-4d62-9c0a-69b814e49706', '用户管理', '/base/power/sys_user/index.action', '2', '1', '2', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.94f811ca-12f5-4edf-8112-acd1a34a686f.', 'user.png', 'user_hover.png', '1', '3', '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('96014254-b841-44ba-984d-a6767b1169a4', '587b3f56-2db2-465e-8808-1dd2bbe06965', '禁用', 'myrobj.disable(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.587b3f56-2db2-465e-8808-1dd2bbe06965.96014254-b841-44ba-984d-a6767b1169a4.', 'icon_no', null, '0', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('96e3a098-0200-42a4-a37c-32693711c7ec', 'ffd65eaa-4096-43d5-8a74-c95086b0a1e7', '申请开户', '/kyt/account/apply_account/index.action', '2', '1', '2', '0.ffd65eaa-4096-43d5-8a74-c95086b0a1e7.96e3a098-0200-42a4-a37c-32693711c7ec.', 'apply.png', 'apply.h.png', '1', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-26 17:04:22', null, '1');
INSERT INTO `sys_module` VALUES ('972bd33f-a0eb-40d1-bf92-a9e8681d99d2', '148cd40a-9fa8-4e6b-a558-23a6cce505c8', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.148cd40a-9fa8-4e6b-a558-23a6cce505c8.972bd33f-a0eb-40d1-bf92-a9e8681d99d2.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('99ce6e68-2559-4590-83ba-0f918f7a9b22', '45f24b60-e190-4e3c-bcb9-1c494876030a', '企业账户', '/kyt/enterprise/enterpriseinfo/index.action', '2', '0', '2', '0.45f24b60-e190-4e3c-bcb9-1c494876030a.99ce6e68-2559-4590-83ba-0f918f7a9b22.', null, null, '1', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-01-16 16:49:10', null, '1');
INSERT INTO `sys_module` VALUES ('9b0282da-002e-4f64-af74-97845a8ee785', '0', '系统日志', '', '1', '1', '1', '0.9b0282da-002e-4f64-af74-97845a8ee785.', 'log.png', 'log_hover.png', '1', null, '103', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('9bb7497b-b149-41aa-a3b4-5fa2033fe391', '0', '矿云通', null, '1', '1', '1', '0.9bb7497b-b149-41aa-a3b4-5fa2033fe391.', null, null, '0', null, '303', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 09:40:13', null, '1');
INSERT INTO `sys_module` VALUES ('9bbc0837-1804-4dfc-9f34-cd039dfaa966', '938afb0a-0185-4383-9857-eadea7fc5aad', '发布', 'myrobj.enable(this);', '3', '1', '3', '0.1467624b-4be5-47b9-87a3-57a229e52193.938afb0a-0185-4383-9857-eadea7fc5aad.9bbc0837-1804-4dfc-9f34-cd039dfaa966.', 'icon_ok', null, '0', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-23 15:55:38', '启用', '0');
INSERT INTO `sys_module` VALUES ('9c1e5930-4291-43b5-a110-4ed3072e988f', '455ddcf7-6d43-4aa4-a287-4123ef77281d', '预申报审核', '/kyt/enterprise/contract_info/index.action', '2', '1', '2', '0.455ddcf7-6d43-4aa4-a287-4123ef77281d.9c1e5930-4291-43b5-a110-4ed3072e988f.', 'check.png', 'check.h.png', '1', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-05-16 15:39:56', null, '1');
INSERT INTO `sys_module` VALUES ('9cd9cb24-dab0-45e1-9636-2fc06309e0cb', '0', '前台权限', null, '1', '1', '1', '0.9cd9cb24-dab0-45e1-9636-2fc06309e0cb.', null, null, '1', null, '104', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 15:41:59', null, '1');
INSERT INTO `sys_module` VALUES ('9e76dcaa-9a07-4017-a9e5-21af54ba8cee', 'c157693e-f0e6-4e30-bd55-c6c5a5c2fbb0', '新增', 'myrobj.add(this);', '3', '1', '3', '0.486f4cc1-d2c2-4a8f-ae13-4e8132bb6e5e.c157693e-f0e6-4e30-bd55-c6c5a5c2fbb0.9e76dcaa-9a07-4017-a9e5-21af54ba8cee.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-10-25 13:43:28', '新增', '1');
INSERT INTO `sys_module` VALUES ('9fbdc48e-8105-4815-86bc-4681be09f5c8', 'eaf2657f-5da3-4fe3-8e0b-19a9afe057a9', '删除', 'myrobj.del(this);', '3', '1', '3', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.eaf2657f-5da3-4fe3-8e0b-19a9afe057a9.9fbdc48e-8105-4815-86bc-4681be09f5c8.', 'icon_delete', null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-08 19:42:53', '删除', '1');
INSERT INTO `sys_module` VALUES ('9fc23170-ccac-436a-a4fd-ef61a61bbf60', '0ef0453a-4dd8-407c-ab38-58893d5804f1', '禁用', 'myrobj.disable(this);', '3', '1', '3', '0.fe7f4487-3641-4377-be59-fd1a6e3b655c.0ef0453a-4dd8-407c-ab38-58893d5804f1.9fc23170-ccac-436a-a4fd-ef61a61bbf60.', 'icon_no', null, '0', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '1');
INSERT INTO `sys_module` VALUES ('a00a20ad-d82e-4011-907f-60f6f04c083d', '0', '字典管理', null, '1', '1', '1', '0.a00a20ad-d82e-4011-907f-60f6f04c083d.', 'dict.m.png', 'dict.m.hover.png', '1', null, '106', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-06-14 16:30:38', null, '1');
INSERT INTO `sys_module` VALUES ('a0bed77d-1a86-4cd5-811e-04b88fb51946', '148cd40a-9fa8-4e6b-a558-23a6cce505c8', '删除', 'myrobj.del(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.148cd40a-9fa8-4e6b-a558-23a6cce505c8.a0bed77d-1a86-4cd5-811e-04b88fb51946.', 'icon_delete', null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('a10b2874-e4cf-4eaf-9a01-1e00c4542555', '1467624b-4be5-47b9-87a3-57a229e52193', '协会信息', '/sand/associationinfo/index.action', '2', '0', '2', '0.1467624b-4be5-47b9-87a3-57a229e52193.a10b2874-e4cf-4eaf-9a01-1e00c4542555.', null, null, '1', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-20 15:36:17', null, '0');
INSERT INTO `sys_module` VALUES ('a150c9aa-91d1-4924-b79d-526745d84da3', '204c706b-b59a-47e8-b3a1-c296d8e1b458', '查看', 'myrobj.view(this);', '3', '1', '3', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.204c706b-b59a-47e8-b3a1-c296d8e1b458.a150c9aa-91d1-4924-b79d-526745d84da3.', null, null, '0', null, '7', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-09 17:17:33', null, '1');
INSERT INTO `sys_module` VALUES ('a2fa55d7-4607-4a07-8099-26c2684aa3ea', '0e1c8d31-41aa-43ce-be50-2683869e5ba5', '新增充值登记', 'myrobj.add(this);', '3', '1', '3', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.0e1c8d31-41aa-43ce-be50-2683869e5ba5.a2fa55d7-4607-4a07-8099-26c2684aa3ea.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-05-16 16:01:14', null, '1');
INSERT INTO `sys_module` VALUES ('a37b987d-eb33-49a3-a964-4b8cdb37f3a5', '442e1bc9-3015-4a20-8a86-041f82f65fe0', '删除', 'myrobj.del(this);', '3', '1', '3', '0.1467624b-4be5-47b9-87a3-57a229e52193.442e1bc9-3015-4a20-8a86-041f82f65fe0.a37b987d-eb33-49a3-a964-4b8cdb37f3a5.', 'icon_delete', null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-22 17:44:09', '删除', '0');
INSERT INTO `sys_module` VALUES ('a45d1486-1594-4e96-a6ff-ed2ee0a172c1', '6370a00a-0649-4134-a055-f66b56d9b2d7', '资金明细', null, '2', '1', '2', '0.6370a00a-0649-4134-a055-f66b56d9b2d7.a45d1486-1594-4e96-a6ff-ed2ee0a172c1.', null, null, '1', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 09:39:25', null, '1');
INSERT INTO `sys_module` VALUES ('a5b235da-9991-47da-8117-5abfbd5e9cad', '1b3586aa-f17f-4b70-aa3f-d840c19eb8eb', '注册车辆审核', '/kyt/sys/oracle_truck_info/index.action', '2', '1', '2', '0.1b3586aa-f17f-4b70-aa3f-d840c19eb8eb.a5b235da-9991-47da-8117-5abfbd5e9cad.', null, null, '1', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-08-27 09:09:33', null, '1');
INSERT INTO `sys_module` VALUES ('a635b76e-1d57-4cbc-923e-a58129588857', '2a3fcaf2-4eb1-44ce-96b6-427009c33666', '线下充值', '/kyt/stat/finance_offline/index.action', '2', '1', '2', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.a635b76e-1d57-4cbc-923e-a58129588857.', 'xxcz.png', 'xxcz.h.png', '1', null, '9', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-06-14 16:23:48', null, '1');
INSERT INTO `sys_module` VALUES ('a7fddc91-1f97-4582-8543-5b5b9a257e09', 'ad06432b-ca75-4a78-b973-390b01b5cbd3', '平台消息', null, '2', '1', '2', '0.ad06432b-ca75-4a78-b973-390b01b5cbd3.a7fddc91-1f97-4582-8543-5b5b9a257e09.', null, null, '1', null, '6', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 09:35:35', null, '1');
INSERT INTO `sys_module` VALUES ('ac1203f4-104c-4437-8b5e-352585c11a6c', '90d53381-c5e5-47be-a16c-bdc29be6402b', '新增', 'myrobj.add(this);', '3', '1', '3', '0.486f4cc1-d2c2-4a8f-ae13-4e8132bb6e5e.90d53381-c5e5-47be-a16c-bdc29be6402b.ac1203f4-104c-4437-8b5e-352585c11a6c.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-10-25 13:42:01', '新增', '1');
INSERT INTO `sys_module` VALUES ('acf34a42-ddf0-4675-bd78-75f295000ebc', '638a6ba1-5182-425c-9c0d-b7bb9beaf3ab', '融资订单', '/finance/order/finance_repay_order/index.action', '2', '1', '2', '0.638a6ba1-5182-425c-9c0d-b7bb9beaf3ab.acf34a42-ddf0-4675-bd78-75f295000ebc.', 'finance_order.png', 'finance_order.h.png', '1', null, '303', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-07-01 14:56:19', null, '1');
INSERT INTO `sys_module` VALUES ('ad06432b-ca75-4a78-b973-390b01b5cbd3', '0', '用户中心', null, '1', '1', '1', '0.ad06432b-ca75-4a78-b973-390b01b5cbd3.', null, null, '0', null, '301', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 09:32:05', null, '1');
INSERT INTO `sys_module` VALUES ('ad210a22-787d-4fe9-b18e-45615c4ec723', '8acbf7e2-9ff6-419a-a1ad-cc12a9424e90', '企业信息', '/kyt/enterprise/enterpriseinfo/index.action', '2', '1', '2', '0.8acbf7e2-9ff6-419a-a1ad-cc12a9424e90.ad210a22-787d-4fe9-b18e-45615c4ec723.', null, null, '1', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-12 19:19:25', null, '1');
INSERT INTO `sys_module` VALUES ('adf9112a-d19d-43d0-a8a2-2626e2f1e359', '6e800af7-bb56-4d2c-bbfc-06669b4b553c', '新增', 'myrobj.add(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.6e800af7-bb56-4d2c-bbfc-06669b4b553c.adf9112a-d19d-43d0-a8a2-2626e2f1e359.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('aeff08fd-dd2e-45a3-b364-5818c55a1f59', 'ffd65eaa-4096-43d5-8a74-c95086b0a1e7', '账户查询', '/kyt/account/account_query/index.action', '2', '1', '2', '0.ffd65eaa-4096-43d5-8a74-c95086b0a1e7.aeff08fd-dd2e-45a3-b364-5818c55a1f59.', 'search.png', 'search.h.png', '1', null, '10', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-05-16 15:49:52', null, '1');
INSERT INTO `sys_module` VALUES ('af3beb81-8b1e-4857-a738-ca5223864aa8', '2a3fcaf2-4eb1-44ce-96b6-427009c33666', '企业矿种管理', '/kyt/enterprise/enterpriseinfo/index.action', '2', '1', '2', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.af3beb81-8b1e-4857-a738-ca5223864aa8.', null, null, '1', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-01-08 21:06:10', null, '1');
INSERT INTO `sys_module` VALUES ('afb82e9a-3241-4b0f-89b8-213cf1ea4506', '8acbf7e2-9ff6-419a-a1ad-cc12a9424e90', '用户管理', '/kyt/user/user_info/index.action', '2', '1', '2', '0.8acbf7e2-9ff6-419a-a1ad-cc12a9424e90.afb82e9a-3241-4b0f-89b8-213cf1ea4506.', null, null, '1', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-10-27 19:40:25', null, '1');
INSERT INTO `sys_module` VALUES ('b06eb678-0e2e-46f5-b83f-5a764fd07b59', '71db02c9-0f5d-4f44-95b1-8493dfb5d4f3', '新增', 'myrobj.add(this);', '3', '1', '3', '0.9cd9cb24-dab0-45e1-9636-2fc06309e0cb.71db02c9-0f5d-4f44-95b1-8493dfb5d4f3.b06eb678-0e2e-46f5-b83f-5a764fd07b59.', null, null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 15:53:56', null, '1');
INSERT INTO `sys_module` VALUES ('b0c923c0-0295-488e-9c3d-781169046fa7', '455ddcf7-6d43-4aa4-a287-4123ef77281d', '预申报限制', '/kyt/user/user_info/index.action', '2', '1', '2', '0.455ddcf7-6d43-4aa4-a287-4123ef77281d.b0c923c0-0295-488e-9c3d-781169046fa7.', 'limit.png', 'limit.h.png', '1', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-05-16 15:40:15', null, '1');
INSERT INTO `sys_module` VALUES ('b0dd5671-07be-4a20-8d7b-88b97c202285', 'b0c923c0-0295-488e-9c3d-781169046fa7', '不需要预申报', 'myrobj.no(this);', '3', '1', '3', '0.455ddcf7-6d43-4aa4-a287-4123ef77281d.b0c923c0-0295-488e-9c3d-781169046fa7.b0dd5671-07be-4a20-8d7b-88b97c202285.', 'icon_no', null, '1', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-05-16 15:43:50', null, '1');
INSERT INTO `sys_module` VALUES ('b2e839e3-cec6-437b-846d-98bb3333e2b3', '71db02c9-0f5d-4f44-95b1-8493dfb5d4f3', '清除模块', 'myrobj.clearModule(this);', '3', '1', '3', '0.9cd9cb24-dab0-45e1-9636-2fc06309e0cb.71db02c9-0f5d-4f44-95b1-8493dfb5d4f3.b2e839e3-cec6-437b-846d-98bb3333e2b3.', null, null, '0', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 15:54:56', null, '1');
INSERT INTO `sys_module` VALUES ('b49ff894-ae62-42e5-9a32-8b6d0df49cd9', 'be46cf51-8498-472a-bcb9-56c6a5cafbf3', '税款转出', '/kyt/taxe/infund/taxOutIndex.action', '2', '1', '2', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.b49ff894-ae62-42e5-9a32-8b6d0df49cd9.', null, null, '1', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-12-26 10:57:05', null, '1');
INSERT INTO `sys_module` VALUES ('b4c45550-f53c-4548-9842-c298cc4636bb', '9cd9cb24-dab0-45e1-9636-2fc06309e0cb', '模块管理', '/base/power/tb_module/index.action', '2', '1', '2', '0.9cd9cb24-dab0-45e1-9636-2fc06309e0cb.b4c45550-f53c-4548-9842-c298cc4636bb.', null, null, '1', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-10-01 11:28:57', null, '1');
INSERT INTO `sys_module` VALUES ('b54ce815-81fc-4e41-b878-463565b0f25c', '0e1c8d31-41aa-43ce-be50-2683869e5ba5', '作废', 'myrobj.cancellation(this);', '3', '1', '3', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.0e1c8d31-41aa-43ce-be50-2683869e5ba5.b54ce815-81fc-4e41-b878-463565b0f25c.', 'icon_edit', null, '0', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-12-26 10:59:50', null, '1');
INSERT INTO `sys_module` VALUES ('b5bb7f4f-b95a-45d8-bd79-f65ee99205ee', 'd1b3e6e7-8fa5-4af5-8e27-4c13ba4c7404', '禁用', 'myrobj.disable(this);', '3', '1', '3', '0.c8ace64b-cc83-42ba-84c2-a700e1211210.d1b3e6e7-8fa5-4af5-8e27-4c13ba4c7404.b5bb7f4f-b95a-45d8-bd79-f65ee99205ee.', 'icon_no', null, '0', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('b6797b25-3f44-4276-8f60-b36b1e6da7de', 'af3beb81-8b1e-4857-a738-ca5223864aa8', '启用', 'myrobj.enable(this);', '3', '1', '3', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.af3beb81-8b1e-4857-a738-ca5223864aa8.b6797b25-3f44-4276-8f60-b36b1e6da7de.', 'icon_on', null, '0', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-07-08 10:30:16', '启用', '1');
INSERT INTO `sys_module` VALUES ('b75a4189-3954-42be-aa42-940acb7acbcb', 'ee461328-9813-45ca-98ca-6888c753e99d', '删除', 'myrobj.del(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.ee461328-9813-45ca-98ca-6888c753e99d.b75a4189-3954-42be-aa42-940acb7acbcb.', 'icon_delete', null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 15:22:44', '删除', '1');
INSERT INTO `sys_module` VALUES ('b93492b6-ee47-4938-a904-8be86a2abd03', '2a3fcaf2-4eb1-44ce-96b6-427009c33666', '财税账户', '/kyt/sys/bank_info/index.action', '2', '1', '2', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.b93492b6-ee47-4938-a904-8be86a2abd03.', 'account.png', 'account.h.png', '1', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-01-08 21:05:19', null, '1');
INSERT INTO `sys_module` VALUES ('ba840bbe-872c-4a73-8eae-594d9a737597', '2a3fcaf2-4eb1-44ce-96b6-427009c33666', '车辆信息', '/kyt/sys/truck_info/index.action', '2', '1', '2', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.ba840bbe-872c-4a73-8eae-594d9a737597.', 'car.png', 'car.h.png', '1', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-06-14 16:21:19', null, '1');
INSERT INTO `sys_module` VALUES ('bceffd0f-1456-45f5-8220-54d6622df2d3', '2a1407a5-1824-4eb5-bc1b-d9a6a4ce7f26', '新增', 'myrobj.add(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.2a1407a5-1824-4eb5-bc1b-d9a6a4ce7f26.bceffd0f-1456-45f5-8220-54d6622df2d3.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('bd33e3dd-706c-41ef-bc1c-8c1712bf50e2', 'ad06432b-ca75-4a78-b973-390b01b5cbd3', '账户安全', null, '2', '1', '2', '0.ad06432b-ca75-4a78-b973-390b01b5cbd3.bd33e3dd-706c-41ef-bc1c-8c1712bf50e2.', null, null, '1', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 09:34:32', null, '1');
INSERT INTO `sys_module` VALUES ('bdc4ccaf-1ac9-4c5a-b5e3-fa830dc65250', '0', '前台权限', '/base/power/sys_module/index.action', '1', '1', '1', '0.bdc4ccaf-1ac9-4c5a-b5e3-fa830dc65250.', null, null, '1', null, '301', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 15:41:24', null, '1');
INSERT INTO `sys_module` VALUES ('be46cf51-8498-472a-bcb9-56c6a5cafbf3', '0', '税费管理', null, '1', '1', '1', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.', 'tax.png', 'tax.h.png', '1', null, '206', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-12-26 10:56:21', null, '1');
INSERT INTO `sys_module` VALUES ('bf7d3f7a-bc9f-4da2-838b-678f4f67dbea', '1467624b-4be5-47b9-87a3-57a229e52193', '系统公告', '/sand/notice/index.action', '2', '0', '2', '0.1467624b-4be5-47b9-87a3-57a229e52193.bf7d3f7a-bc9f-4da2-838b-678f4f67dbea.', null, null, '1', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-06 09:24:52', null, '0');
INSERT INTO `sys_module` VALUES ('c157693e-f0e6-4e30-bd55-c6c5a5c2fbb0', '486f4cc1-d2c2-4a8f-ae13-4e8132bb6e5e', '银行账户', '/kyt/sys/bank_info/index.action', '2', '1', '2', '0.486f4cc1-d2c2-4a8f-ae13-4e8132bb6e5e.c157693e-f0e6-4e30-bd55-c6c5a5c2fbb0.', null, null, '1', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-10-25 13:42:30', null, '1');
INSERT INTO `sys_module` VALUES ('c18d5f73-a070-4d48-860e-de0d88f3e643', '638a6ba1-5182-425c-9c0d-b7bb9beaf3ab', '保证金维护', '/finance/cert/finance_cert/marginIndex.action', '2', '1', '2', '0.638a6ba1-5182-425c-9c0d-b7bb9beaf3ab.c18d5f73-a070-4d48-860e-de0d88f3e643.', 'jin.png', 'jin.h.png', '1', null, '304', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-07-02 10:34:03', null, '1');
INSERT INTO `sys_module` VALUES ('c1cd7d7e-3385-48d5-bb98-4316100b67b1', '236d5279-6ec5-47ed-ba02-8a8316a07c6e', '删除', 'myrobj.del(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.236d5279-6ec5-47ed-ba02-8a8316a07c6e.c1cd7d7e-3385-48d5-bb98-4316100b67b1.', 'icon_delete', null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('c1ff6b2f-0499-43a5-b36a-b417183bedbd', '6e800af7-bb56-4d2c-bbfc-06669b4b553c', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.6e800af7-bb56-4d2c-bbfc-06669b4b553c.c1ff6b2f-0499-43a5-b36a-b417183bedbd.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('c21c8a78-67e4-4c96-a26f-9b5c6c8c63e0', '1b3586aa-f17f-4b70-aa3f-d840c19eb8eb', '皮重变更审核', '/kyt/sys/oracle_truck_info/indexTruckTareChange.action', '2', '1', '2', '0.1b3586aa-f17f-4b70-aa3f-d840c19eb8eb.c21c8a78-67e4-4c96-a26f-9b5c6c8c63e0.', null, null, '1', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-08-19 14:57:53', null, '1');
INSERT INTO `sys_module` VALUES ('c35ea3e8-2095-4e4b-81b2-82ec8655ba07', 'ffd65eaa-4096-43d5-8a74-c95086b0a1e7', '开户', '/kyt/account/account_submit/bankIndex.action', '2', '1', '2', '0.ffd65eaa-4096-43d5-8a74-c95086b0a1e7.c35ea3e8-2095-4e4b-81b2-82ec8655ba07.', 'open_account.png', 'open_account.h.png', '1', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-26 17:05:20', null, '1');
INSERT INTO `sys_module` VALUES ('c5ab9945-7c53-45ae-ae76-2e6d13410c9d', 'd1aa459e-b49d-4c34-a49b-981e4b0f1074', '删除', 'myrobj.del(this);', '3', '1', '3', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.d1aa459e-b49d-4c34-a49b-981e4b0f1074.c5ab9945-7c53-45ae-ae76-2e6d13410c9d.', 'icon_delete', null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-01-10 10:54:32', '删除', '1');
INSERT INTO `sys_module` VALUES ('c5e41dd5-cebe-47ed-bbe0-db08e6e4b9aa', '00bb7d14-2985-4d62-9c0a-69b814e49706', '机构管理', '/base/power/sys_organization/index.action', '2', '1', '2', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.c5e41dd5-cebe-47ed-bbe0-db08e6e4b9aa.', 'orgain.png', 'orgain_hover.png', '1', '1', '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('c6a43c4e-1cd1-4549-bb5e-a19004349558', 'c8ace64b-cc83-42ba-84c2-a700e1211210', '绩效管理', '/demo/demo/source/index.action', '2', '1', '2', '0.c8ace64b-cc83-42ba-84c2-a700e1211210.c6a43c4e-1cd1-4549-bb5e-a19004349558.', null, null, '1', '1', '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('c7694a1f-7064-432c-972e-19c633b275ee', '2a3fcaf2-4eb1-44ce-96b6-427009c33666', '地区矿种', '/kyt/enterprise/ore_info/index.action', '2', '1', '2', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.c7694a1f-7064-432c-972e-19c633b275ee.', 'ore.png', 'ore.h.png', '1', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-01-08 21:06:33', null, '1');
INSERT INTO `sys_module` VALUES ('c8ace64b-cc83-42ba-84c2-a700e1211210', '0', '开发资源', '', '1', '1', '1', '0.c8ace64b-cc83-42ba-84c2-a700e1211210.', '', null, '1', null, '100', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('c8fc4288-f931-48b4-be41-8908867e29d9', '94f811ca-12f5-4edf-8112-acd1a34a686f', '禁用', 'myrobj.disable(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.94f811ca-12f5-4edf-8112-acd1a34a686f.c8fc4288-f931-48b4-be41-8908867e29d9.', 'icon_no', null, '0', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('c94f2e8b-6f49-4014-833f-d14c8c5ecfd0', '8ee3f88d-fade-4c65-85a1-59cad2d0d3f7', '用户管理', null, '3', '1', '3', '0.ad06432b-ca75-4a78-b973-390b01b5cbd3.8ee3f88d-fade-4c65-85a1-59cad2d0d3f7.c94f2e8b-6f49-4014-833f-d14c8c5ecfd0.', null, null, '1', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 09:37:07', null, '1');
INSERT INTO `sys_module` VALUES ('ca503395-2f6f-4b57-9373-306d46889535', 'be46cf51-8498-472a-bcb9-56c6a5cafbf3', '退税管理', '/kyt/taxe/tax_bill_refund/index.action', '2', '1', '2', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.ca503395-2f6f-4b57-9373-306d46889535.', null, null, '1', null, '8', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-08-27 10:31:53', null, '1');
INSERT INTO `sys_module` VALUES ('ca8d2480-ce46-42a6-9592-2ce221f84c30', '0', '系统配置', '', '1', '1', '1', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.', 'sys_config.png', 'sys_config_hover.png', '1', null, '101', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('cb9cfccc-c011-4420-b0cb-a86e5f37a3c0', 'ee461328-9813-45ca-98ca-6888c753e99d', '新增', 'myrobj.add(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.ee461328-9813-45ca-98ca-6888c753e99d.cb9cfccc-c011-4420-b0cb-a86e5f37a3c0.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 15:22:43', '新增', '1');
INSERT INTO `sys_module` VALUES ('cee1a668-062a-4cd0-a3b8-0b6656ab628d', '8acbf7e2-9ff6-419a-a1ad-cc12a9424e90', '企业余额', '/kyt/enterprise/balance/index.action', '2', '1', '1', '0.8acbf7e2-9ff6-419a-a1ad-cc12a9424e90.cee1a668-062a-4cd0-a3b8-0b6656ab628d.', null, null, '1', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-12-15 18:31:00', null, '1');
INSERT INTO `sys_module` VALUES ('d01ac853-e884-4200-840a-94deba42d9d4', 'b93492b6-ee47-4938-a904-8be86a2abd03', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.b93492b6-ee47-4938-a904-8be86a2abd03.d01ac853-e884-4200-840a-94deba42d9d4.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-09 20:23:30', '编辑', '1');
INSERT INTO `sys_module` VALUES ('d03bc641-e0d0-4861-8549-c93a719641d6', '94f811ca-12f5-4edf-8112-acd1a34a686f', '删除', 'myrobj.del(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.94f811ca-12f5-4edf-8112-acd1a34a686f.d03bc641-e0d0-4861-8549-c93a719641d6.', 'icon_delete', null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('d100c3bb-89e9-439b-ad68-4d5b227ad7a9', '148cd40a-9fa8-4e6b-a558-23a6cce505c8', '禁用', 'myrobj.disable(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.148cd40a-9fa8-4e6b-a558-23a6cce505c8.d100c3bb-89e9-439b-ad68-4d5b227ad7a9.', 'icon_no', null, '0', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('d14c9b3a-390e-41c1-81e5-e08ea9568e59', '71db02c9-0f5d-4f44-95b1-8493dfb5d4f3', '分配模块', 'myrobj.setModule(this);', '3', '1', '3', '0.9cd9cb24-dab0-45e1-9636-2fc06309e0cb.71db02c9-0f5d-4f44-95b1-8493dfb5d4f3.d14c9b3a-390e-41c1-81e5-e08ea9568e59.', null, null, '0', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 15:54:26', null, '1');
INSERT INTO `sys_module` VALUES ('d1aa459e-b49d-4c34-a49b-981e4b0f1074', '2a3fcaf2-4eb1-44ce-96b6-427009c33666', '短信提醒', '/kyt/sys/sms_remind/index.action', '2', '1', '2', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.d1aa459e-b49d-4c34-a49b-981e4b0f1074.', 'short.msg.png', 'short.msg.h.png', '1', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-01-08 21:05:42', null, '1');
INSERT INTO `sys_module` VALUES ('d1b3e6e7-8fa5-4af5-8e27-4c13ba4c7404', 'c8ace64b-cc83-42ba-84c2-a700e1211210', '图标索引', '/demo/simple/icon_html/index.action', '2', '1', '2', '0.c8ace64b-cc83-42ba-84c2-a700e1211210.d1b3e6e7-8fa5-4af5-8e27-4c13ba4c7404.', '', null, '1', '1', '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('d1f6b85f-bf12-4f8e-a35a-234767b4905c', '1467624b-4be5-47b9-87a3-57a229e52193', '可视化', '/jqq/quartzview/quartz_view/index.action', '2', '1', '2', '0.1467624b-4be5-47b9-87a3-57a229e52193.d1f6b85f-bf12-4f8e-a35a-234767b4905c.', null, null, '1', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-08-30 14:49:12', null, '0');
INSERT INTO `sys_module` VALUES ('d2cb9b37-f0d4-472a-899e-8920145bb85a', '204c706b-b59a-47e8-b3a1-c296d8e1b458', '执行', 'myrobj.execute(this);', '3', '1', '3', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.204c706b-b59a-47e8-b3a1-c296d8e1b458.d2cb9b37-f0d4-472a-899e-8920145bb85a.', null, null, '0', null, '6', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-09 17:17:18', null, '1');
INSERT INTO `sys_module` VALUES ('d344b00f-b47d-4adc-a8ec-80b145a6816c', '57f4169c-4afa-4205-bad8-bdfc93589737', '新增', 'myrobj.add(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.57f4169c-4afa-4205-bad8-bdfc93589737.d344b00f-b47d-4adc-a8ec-80b145a6816c.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('d4e87dc5-7e1f-4ea8-af52-ea1307221157', '9bb7497b-b149-41aa-a3b4-5fa2033fe391', '过站信息查询', null, '2', '1', '2', '0.9bb7497b-b149-41aa-a3b4-5fa2033fe391.d4e87dc5-7e1f-4ea8-af52-ea1307221157.', null, null, '1', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 09:41:23', null, '1');
INSERT INTO `sys_module` VALUES ('d64cb280-471f-4905-8b74-1f664793e897', '94f811ca-12f5-4edf-8112-acd1a34a686f', '分配角色', 'myrobj.view_role(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.94f811ca-12f5-4edf-8112-acd1a34a686f.d64cb280-471f-4905-8b74-1f664793e897.', 'icon_set', null, '0', null, '6', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('d7b77636-ecf2-4b7a-b422-6b8bddb574c3', 'd1b3e6e7-8fa5-4af5-8e27-4c13ba4c7404', '启用', 'myrobj.enable(this);', '3', '1', '3', '0.c8ace64b-cc83-42ba-84c2-a700e1211210.d1b3e6e7-8fa5-4af5-8e27-4c13ba4c7404.d7b77636-ecf2-4b7a-b422-6b8bddb574c3.', 'icon_ok', null, '0', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('d7f3a719-0089-4c74-91d3-57f24d9ede7d', '486f4cc1-d2c2-4a8f-ae13-4e8132bb6e5e', '系统开关', '/kyt/common/switch/index.action', '2', '1', '2', '0.486f4cc1-d2c2-4a8f-ae13-4e8132bb6e5e.d7f3a719-0089-4c74-91d3-57f24d9ede7d.', 'on.off.png', 'on.off.hover.png', '1', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-01-23 14:30:07', null, '1');
INSERT INTO `sys_module` VALUES ('d8375151-5a41-4c80-b8b4-8d5323fe91d0', '2a1407a5-1824-4eb5-bc1b-d9a6a4ce7f26', '开放', 'myrobj.enableopen(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.2a1407a5-1824-4eb5-bc1b-d9a6a4ce7f26.d8375151-5a41-4c80-b8b4-8d5323fe91d0.', 'icon_lightOn', null, '0', null, '6', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('d8c95eb5-bae8-4654-8ba6-33f5e9f67ed6', '08354cf4-3827-4c01-9398-9adfcdbd09d1', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.1467624b-4be5-47b9-87a3-57a229e52193.08354cf4-3827-4c01-9398-9adfcdbd09d1.d8c95eb5-bae8-4654-8ba6-33f5e9f67ed6.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-20 11:08:08', '编辑', '0');
INSERT INTO `sys_module` VALUES ('d9d127aa-c9ea-4826-9990-7fdb46c64ad9', '90d53381-c5e5-47be-a16c-bdc29be6402b', '删除', 'myrobj.del(this);', '3', '1', '3', '0.486f4cc1-d2c2-4a8f-ae13-4e8132bb6e5e.90d53381-c5e5-47be-a16c-bdc29be6402b.d9d127aa-c9ea-4826-9990-7fdb46c64ad9.', 'icon_delete', null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-10-25 13:42:01', '删除', '1');
INSERT INTO `sys_module` VALUES ('da1483b7-fdc4-43c0-9d0f-dfde56a6fb20', '236d5279-6ec5-47ed-ba02-8a8316a07c6e', '禁用', 'myrobj.disable(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.236d5279-6ec5-47ed-ba02-8a8316a07c6e.da1483b7-fdc4-43c0-9d0f-dfde56a6fb20.', 'icon_no', null, '0', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('da618033-f402-4a72-a0d0-5e609bed4599', '0ef0453a-4dd8-407c-ab38-58893d5804f1', '删除', 'myrobj.del(this);', '3', '1', '3', '0.fe7f4487-3641-4377-be59-fd1a6e3b655c.0ef0453a-4dd8-407c-ab38-58893d5804f1.da618033-f402-4a72-a0d0-5e609bed4599.', 'icon_delete', null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '1');
INSERT INTO `sys_module` VALUES ('db3f9ef1-53eb-4d79-b1b6-1aaa9c0206ac', 'b0c923c0-0295-488e-9c3d-781169046fa7', '需要预申报', 'myrobj.yes(this);', '3', '1', '3', '0.455ddcf7-6d43-4aa4-a287-4123ef77281d.b0c923c0-0295-488e-9c3d-781169046fa7.db3f9ef1-53eb-4d79-b1b6-1aaa9c0206ac.', 'icon_ok', null, '1', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-05-16 15:43:29', null, '1');
INSERT INTO `sys_module` VALUES ('de3db495-063c-4000-8862-160fab0feff7', '2a1407a5-1824-4eb5-bc1b-d9a6a4ce7f26', '删除', 'myrobj.del(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.2a1407a5-1824-4eb5-bc1b-d9a6a4ce7f26.de3db495-063c-4000-8862-160fab0feff7.', 'icon_delete', null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('e02e7d26-efa9-4b33-87d0-ccc065f172ac', 'c5e41dd5-cebe-47ed-bbe0-db08e6e4b9aa', '编辑', 'myrobj.edit(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.c5e41dd5-cebe-47ed-bbe0-db08e6e4b9aa.e02e7d26-efa9-4b33-87d0-ccc065f172ac.', 'icon_edit', null, '0', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('e0e26cf7-8187-493a-bdff-5a7abe4805c2', 'af3beb81-8b1e-4857-a738-ca5223864aa8', '禁用', 'myrobj.disable(this);', '3', '1', '3', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.af3beb81-8b1e-4857-a738-ca5223864aa8.e0e26cf7-8187-493a-bdff-5a7abe4805c2.', 'icon_off', null, '0', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-07-08 10:30:16', '禁用', '1');
INSERT INTO `sys_module` VALUES ('e25750b3-8798-4c6e-ab62-48a693f8d04a', '08354cf4-3827-4c01-9398-9adfcdbd09d1', '置顶', 'myrobj.editTop(this);', '3', '1', '3', '0.1467624b-4be5-47b9-87a3-57a229e52193.08354cf4-3827-4c01-9398-9adfcdbd09d1.e25750b3-8798-4c6e-ab62-48a693f8d04a.', null, null, '0', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-21 17:47:23', null, '0');
INSERT INTO `sys_module` VALUES ('e3d2b6a7-2757-4c32-8ecd-a7bec95a42e0', '442e1bc9-3015-4a20-8a86-041f82f65fe0', '新增', 'myrobj.add(this);', '3', '1', '3', '0.1467624b-4be5-47b9-87a3-57a229e52193.442e1bc9-3015-4a20-8a86-041f82f65fe0.e3d2b6a7-2757-4c32-8ecd-a7bec95a42e0.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-22 17:44:09', '新增', '0');
INSERT INTO `sys_module` VALUES ('e4b16a80-0a23-4a87-93ed-84acec242a69', '45f24b60-e190-4e3c-bcb9-1c494876030a', '账户管理', '/kyt/user/user_info/index.action', '2', '0', '2', '0.45f24b60-e190-4e3c-bcb9-1c494876030a.e4b16a80-0a23-4a87-93ed-84acec242a69.', null, null, '1', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-01-08 21:07:16', null, '1');
INSERT INTO `sys_module` VALUES ('e8194f86-f230-4a81-9d3c-80b4ef7b09c6', '6370a00a-0649-4134-a055-f66b56d9b2d7', '余额', null, '2', '1', '2', '0.6370a00a-0649-4134-a055-f66b56d9b2d7.e8194f86-f230-4a81-9d3c-80b4ef7b09c6.', null, null, '1', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 09:38:46', null, '1');
INSERT INTO `sys_module` VALUES ('e820a7db-8088-44eb-80cb-719896b7c957', 'ffd65eaa-4096-43d5-8a74-c95086b0a1e7', '提交开户', '/kyt/account/account_submit/headofficeIndex.action', '2', '1', '2', '0.ffd65eaa-4096-43d5-8a74-c95086b0a1e7.e820a7db-8088-44eb-80cb-719896b7c957.', 'submit.png', 'submit.h.png', '1', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-26 17:04:58', null, '1');
INSERT INTO `sys_module` VALUES ('eaf2657f-5da3-4fe3-8e0b-19a9afe057a9', '2a3fcaf2-4eb1-44ce-96b6-427009c33666', 'POS机管理', '/kyt/common/country_data_dict/index.action', '2', '1', '2', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.eaf2657f-5da3-4fe3-8e0b-19a9afe057a9.', 'pos.png', 'pos.hover.png', '1', null, '6', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-01-08 21:24:41', null, '1');
INSERT INTO `sys_module` VALUES ('eb98cccf-ea79-417f-87d1-50988e956f10', '7f20949b-eecb-432b-8105-6a1d0b607b29', '异常退税', '/kyt/station/backTaxIndex.action', '2', '1', '2', '0.7f20949b-eecb-432b-8105-6a1d0b607b29.eb98cccf-ea79-417f-87d1-50988e956f10.', null, null, '1', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-07-19 13:56:54', null, '1');
INSERT INTO `sys_module` VALUES ('ebb819c2-729c-4588-b2c7-43371e0072bd', '2a1407a5-1824-4eb5-bc1b-d9a6a4ce7f26', '启用', 'myrobj.enable(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.2a1407a5-1824-4eb5-bc1b-d9a6a4ce7f26.ebb819c2-729c-4588-b2c7-43371e0072bd.', 'icon_ok', null, '0', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('ebebe271-7745-4204-907b-4aa933b8119d', '204c706b-b59a-47e8-b3a1-c296d8e1b458', '复核', 'myrobj.review(this);', '3', '1', '3', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.204c706b-b59a-47e8-b3a1-c296d8e1b458.ebebe271-7745-4204-907b-4aa933b8119d.', null, null, '0', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-09 17:17:04', null, '1');
INSERT INTO `sys_module` VALUES ('edc4552e-d6d1-4dea-9569-de697d795e44', '76d16d0e-4f2d-4845-8dfb-a40afeda11db', '新增', 'myrobj.add(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.76d16d0e-4f2d-4845-8dfb-a40afeda11db.edc4552e-d6d1-4dea-9569-de697d795e44.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('f307977b30924295995226c57e9755fd', 'd1b3e6e7-8fa5-4af5-8e27-4c13ba4c7404', '新增', 'myrobj.add(this);', '3', '1', '3', '0.c8ace64b-cc83-42ba-84c2-a700e1211210.d1b3e6e7-8fa5-4af5-8e27-4c13ba4c7404.f307977b30924295995226c57e9755fd.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('f373acce-ce37-4f90-a138-2de8b85577b7', '8acbf7e2-9ff6-419a-a1ad-cc12a9424e90', '预申报管理', '/kyt/enterprise/contract_info/index.action', '2', '1', '2', '0.8acbf7e2-9ff6-419a-a1ad-cc12a9424e90.f373acce-ce37-4f90-a138-2de8b85577b7.', null, null, '1', null, '7', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-12-26 23:13:01', null, '1');
INSERT INTO `sys_module` VALUES ('f3b0386a-720d-4a43-8c65-51b804ec9c21', 'd1f6b85f-bf12-4f8e-a35a-234767b4905c', '启用', 'myrobj.enable(this);', '3', '1', '3', '0.1467624b-4be5-47b9-87a3-57a229e52193.d1f6b85f-bf12-4f8e-a35a-234767b4905c.f3b0386a-720d-4a43-8c65-51b804ec9c21.', 'icon_on', null, '0', null, '4', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-19 19:49:15', '启用', '0');
INSERT INTO `sys_module` VALUES ('f649cacb-f167-4744-94d2-1beb7a4b15a2', '2a3fcaf2-4eb1-44ce-96b6-427009c33666', '地区信息', '/kyt/stat/finance_area_info/index.action', '2', '1', '2', '0.2a3fcaf2-4eb1-44ce-96b6-427009c33666.f649cacb-f167-4744-94d2-1beb7a4b15a2.', 'area.m.png', 'area.m.h.png', '1', null, '8', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-05-16 15:58:33', null, '1');
INSERT INTO `sys_module` VALUES ('f6f4963d-d13d-47fe-baa2-3deace47021e', '0e1c8d31-41aa-43ce-be50-2683869e5ba5', '登记', 'myrobj.add(this);', '3', '1', '3', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.0e1c8d31-41aa-43ce-be50-2683869e5ba5.f6f4963d-d13d-47fe-baa2-3deace47021e.', 'icon_add', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-12-26 10:58:55', null, '1');
INSERT INTO `sys_module` VALUES ('f75b54f7-2895-42e3-bd64-1136dabec7bd', 'be46cf51-8498-472a-bcb9-56c6a5cafbf3', '结转执行', '/kyt/taxe/tax_bill_exe/index.action', '2', '1', '2', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.f75b54f7-2895-42e3-bd64-1136dabec7bd.', 'carry.png', 'carry.h.png', '1', null, '6', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-05-16 15:54:53', null, '1');
INSERT INTO `sys_module` VALUES ('f86d5f3c-def4-4ade-8fa9-4b8f173fc836', 'be46cf51-8498-472a-bcb9-56c6a5cafbf3', '结转复核', '/kyt/taxe/tax_bill_check/index.action', '2', '1', '2', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.f86d5f3c-def4-4ade-8fa9-4b8f173fc836.', 'f_check.png', 'f_check.h.png', '1', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-05-16 15:53:40', null, '1');
INSERT INTO `sys_module` VALUES ('f962cd7b-6269-4f44-bf07-36b44945c81d', '6e800af7-bb56-4d2c-bbfc-06669b4b553c', '删除', 'myrobj.del(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.6e800af7-bb56-4d2c-bbfc-06669b4b553c.f962cd7b-6269-4f44-bf07-36b44945c81d.', 'icon_delete', null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('fa08fff2-deb1-4512-b0bc-f1412702dca8', 'c8ace64b-cc83-42ba-84c2-a700e1211210', '按钮图标', '/demo/simple/icon_button/index.action', '2', '1', '2', '0.c8ace64b-cc83-42ba-84c2-a700e1211210.fa08fff2-deb1-4512-b0bc-f1412702dca8.', null, null, '1', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-06-14 21:12:07', null, '0');
INSERT INTO `sys_module` VALUES ('fa0b5600-ab31-4ff8-8667-378996f0306e', '6e800af7-bb56-4d2c-bbfc-06669b4b553c', '禁用', 'myrobj.disable(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.6e800af7-bb56-4d2c-bbfc-06669b4b553c.fa0b5600-ab31-4ff8-8667-378996f0306e.', 'icon_no', null, '0', null, '5', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('fa5c2b2c-9d43-4a5f-8fc8-bd359bfb8bff', '6309944e-46d7-41a0-be5c-feb2431b8f8f', '删除', 'myrobj.del(this);', '3', '1', '3', '0.fe7f4487-3641-4377-be59-fd1a6e3b655c.6309944e-46d7-41a0-be5c-feb2431b8f8f.fa5c2b2c-9d43-4a5f-8fc8-bd359bfb8bff.', 'icon_delete', null, '0', null, '3', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '1');
INSERT INTO `sys_module` VALUES ('fb1eeab5-a3a9-453e-be9a-668d57df8d21', 'f373acce-ce37-4f90-a138-2de8b85577b7', '审核', 'myrobj.edit(this);', '3', '1', '3', '0.8acbf7e2-9ff6-419a-a1ad-cc12a9424e90.f373acce-ce37-4f90-a138-2de8b85577b7.fb1eeab5-a3a9-453e-be9a-668d57df8d21.', 'icon_edit', null, '0', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-12-26 23:14:38', null, '1');
INSERT INTO `sys_module` VALUES ('fbbc8587-e2af-4e9e-9fb4-898a9d72782d', 'ad06432b-ca75-4a78-b973-390b01b5cbd3', '企业用户', null, '2', '1', '2', '0.ad06432b-ca75-4a78-b973-390b01b5cbd3.fbbc8587-e2af-4e9e-9fb4-898a9d72782d.', null, null, '1', null, '2', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 09:34:55', null, '1');
INSERT INTO `sys_module` VALUES ('fd0a7a1a-d824-4a3a-8a0f-e6ac5f063a89', '57f4169c-4afa-4205-bad8-bdfc93589737', '生成按钮', 'myrobj.createBtn(this);', '3', '1', '3', '0.ca8d2480-ce46-42a6-9592-2ce221f84c30.57f4169c-4afa-4205-bad8-bdfc93589737.fd0a7a1a-d824-4a3a-8a0f-e6ac5f063a89.', null, null, '0', null, '6', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-30 13:50:12', null, '0');
INSERT INTO `sys_module` VALUES ('fd7cb3ef-c010-4a23-b76a-0cf601a15e92', '94f811ca-12f5-4edf-8112-acd1a34a686f', '清除角色', 'myrobj.clearUserRole(this);', '3', '1', '3', '0.00bb7d14-2985-4d62-9c0a-69b814e49706.94f811ca-12f5-4edf-8112-acd1a34a686f.fd7cb3ef-c010-4a23-b76a-0cf601a15e92.', 'icon_clear', null, '0', null, '7', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '0');
INSERT INTO `sys_module` VALUES ('fd7d03b6-24de-491d-8438-e516a2ae0596', 'be46cf51-8498-472a-bcb9-56c6a5cafbf3', '网银充值管理', '/kyt/fund/fund_turnover/index.action', '2', '1', '2', '0.be46cf51-8498-472a-bcb9-56c6a5cafbf3.fd7d03b6-24de-491d-8438-e516a2ae0596.', null, null, '1', null, '7', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-07-24 18:11:58', null, '1');
INSERT INTO `sys_module` VALUES ('fe1451c1-4c72-4a99-861c-4704dec33d31', '8ee3f88d-fade-4c65-85a1-59cad2d0d3f7', '企业管理', null, '3', '1', '3', '0.ad06432b-ca75-4a78-b973-390b01b5cbd3.8ee3f88d-fade-4c65-85a1-59cad2d0d3f7.fe1451c1-4c72-4a99-861c-4704dec33d31.', null, null, '1', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-09-18 09:36:48', null, '1');
INSERT INTO `sys_module` VALUES ('fe7f4487-3641-4377-be59-fd1a6e3b655c', '0', '接口管理', null, '1', '1', '1', '0.fe7f4487-3641-4377-be59-fd1a6e3b655c.', null, null, '1', null, '104', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-08-08 08:08:08', null, '1');
INSERT INTO `sys_module` VALUES ('ff1e61f1-3825-477e-ac81-787204d64bad', '1b3586aa-f17f-4b70-aa3f-d840c19eb8eb', 'APP版本管理', '/kyt/app/app_version/index.action', '2', '1', '2', '0.1b3586aa-f17f-4b70-aa3f-d840c19eb8eb.ff1e61f1-3825-477e-ac81-787204d64bad.', 'version.png', 'version.h.png', '1', null, '1', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-07-17 18:24:30', null, '1');
INSERT INTO `sys_module` VALUES ('ffd65eaa-4096-43d5-8a74-c95086b0a1e7', '0', '账户管理', null, '1', '1', '1', '0.ffd65eaa-4096-43d5-8a74-c95086b0a1e7.', 'account.png', 'account.h.png', '1', null, '207', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-15 21:44:08', null, '1');

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `SYS_ORG_ID` varchar(36) NOT NULL COMMENT '省',
  `SYS_ORG_FID` varchar(36) NOT NULL COMMENT 'FID',
  `PROVINCE_ID` varchar(36) DEFAULT NULL COMMENT '省',
  `CITY_ID` varchar(36) DEFAULT NULL COMMENT '市',
  `COUNTY_ID` varchar(36) DEFAULT NULL COMMENT '县',
  `SYS_ORG_TYPE` char(1) NOT NULL COMMENT '类型：1：机构 2：部门',
  `SYS_ORG_NAME` varchar(200) NOT NULL COMMENT '公司|部门名称',
  `SYS_ORG_SHORTNAME` varchar(200) DEFAULT NULL COMMENT '机构简称',
  `SYS_ORG_LEGAL_PERSON` varchar(20) DEFAULT NULL COMMENT '机构法人|部门主管',
  `SYS_ORG_WEBSITE` varchar(200) DEFAULT NULL COMMENT '网站地址',
  `SYS_ORG_ADDRESS` varchar(200) DEFAULT NULL COMMENT '机构地址',
  `SYS_ORG_STAUTS` char(1) NOT NULL COMMENT '机构状态 1：启用 0：禁用',
  `SYS_ORG_LEVEL` int(11) DEFAULT NULL COMMENT '级别',
  `SYS_ORG_SEQ` varchar(2048) DEFAULT NULL COMMENT '序列',
  `SYS_ORG_ORDER` bigint(20) DEFAULT NULL COMMENT '排序',
  `SYS_ORG_NOTE` varchar(200) DEFAULT NULL COMMENT '备注',
  `SYS_ORG_ISNODE` char(1) DEFAULT NULL COMMENT '是否节点 1：节点 0：非节点',
  `PERSON_SEX` char(1) DEFAULT NULL COMMENT '性别',
  `PERSON_BIRTHDAY` date DEFAULT NULL COMMENT '生日',
  `PERSON_MOBILE` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `PERSON_IPONE` varchar(20) DEFAULT NULL COMMENT '固话号码',
  `PERSON_WORK_IPHONE` varchar(20) DEFAULT NULL COMMENT '工作电话',
  `PERSON_EMAIL` varchar(255) DEFAULT NULL COMMENT '邮箱地址',
  `PERSON_QQ` varchar(255) DEFAULT NULL COMMENT 'QQ',
  `PERSON_ADDRESS` varchar(200) DEFAULT NULL COMMENT '住址',
  `ADD_USER` varchar(36) NOT NULL COMMENT '添加人',
  `ADD_TIME` datetime NOT NULL COMMENT '添加时间',
  `ZJM` varchar(200) DEFAULT NULL COMMENT '助记码',
  `SCHOOL_LEVEL` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '学校等级(0.学前教育、1.小学教育、2.初中教育、3.高中教育 4.大学教育)',
  PRIMARY KEY (`SYS_ORG_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='组织机构管理';

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization` VALUES ('0636cfce-a0a1-4f3e-9487-dad6ebb1d260', 'ff6a1b79-0c93-40ec-a5ce-65d44008774e', null, null, null, '2', '绝对权力', null, '龙二', null, null, '1', '2', '0.ff6a1b79-0c93-40ec-a5ce-65d44008774e.0636cfce-a0a1-4f3e-9487-dad6ebb1d260.', '1', null, '0', '1', null, '', '', null, null, null, null, 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-03 12:45:44', null, '');
INSERT INTO `sys_organization` VALUES ('491912246f7a427cb57978ed9844ff4f', '0', '237641', '237642', '238106', '1', '河南铝粘土矿产品批发市场', 'hnfmkyw', '肖博', null, '河南省矿山管理办公室', '1', '1', '0.491912246f7a427cb57978ed9844ff4f.', null, null, '1', '1', null, '18903833705', null, null, null, null, null, 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-12 15:38:31', 'HNLZTKCPPFSC', null);
INSERT INTO `sys_organization` VALUES ('595f313f-ecfd-4f5e-a87b-5e33621b5177', '491912246f7a427cb57978ed9844ff4f', null, null, null, '2', '市县交易中心', null, null, null, null, '1', '2', '0.491912246f7a427cb57978ed9844ff4f.595f313f-ecfd-4f5e-a87b-5e33621b5177.', '2', null, '0', '1', null, null, null, null, null, null, null, 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-12-15 18:28:21', null, null);
INSERT INTO `sys_organization` VALUES ('5a82c3a3cded45d79480dc019ee16515', '491912246f7a427cb57978ed9844ff4f', null, null, null, '2', '矿办', null, '张三', null, null, '1', '2', '0.491912246f7a427cb57978ed9844ff4f.5a82c3a3cded45d79480dc019ee16515.', '1', null, '0', '1', null, '13545564854', null, null, null, null, null, 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-07-12 15:40:11', null, null);
INSERT INTO `sys_organization` VALUES ('ff6a1b79-0c93-40ec-a5ce-65d44008774e', '0', '237641', '237642', '238106', '1', '超级管理员', '牧羊人', '龙二', '', '河南省郑州市绿地新都会', '1', '1', '0.ff6a1b79-0c93-40ec-a5ce-65d44008774e.', null, '牧羊人管理团队', '1', '1', '2017-04-11', '13211111111', '0371-6666666', '0371-666666', '888@888.com', '666666', '', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2017-04-18 21:50:55', 'CJGLY', '');

-- ----------------------------
-- Table structure for sys_region
-- ----------------------------
DROP TABLE IF EXISTS `sys_region`;
CREATE TABLE `sys_region` (
  `REGION_ID` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `NAME` varchar(255) NOT NULL COMMENT '名称',
  `PID` int(20) NOT NULL COMMENT '父ID',
  `SORTS` int(20) DEFAULT NULL COMMENT '排序',
  `LEVEL` int(20) DEFAULT NULL COMMENT '级别',
  `LONGCODE` varchar(255) NOT NULL COMMENT '完整代码',
  `CODE` varchar(255) NOT NULL COMMENT '代码',
  `STAUTS` char(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`REGION_ID`) USING BTREE,
  KEY `名称` (`NAME`) USING BTREE,
  KEY `PID` (`PID`) USING BTREE,
  KEY `LEVEL` (`LEVEL`) USING BTREE,
  KEY `STAUTS` (`STAUTS`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=767482 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='行政区域管理';

-- ----------------------------
-- Records of sys_region
-- ----------------------------
-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `SYS_ROLE_ID` varchar(36) NOT NULL COMMENT '主键',
  `SYS_ROLE_NAME` varchar(80) NOT NULL COMMENT '角色名称',
  `SYS_ROLE_TYPE` char(1) DEFAULT NULL COMMENT '1、私有型角色 2全局型角色',
  `SYS_ROLE_STATUS` char(1) NOT NULL COMMENT '1：正常 0：禁用',
  `SYS_MODULE_FLAG` char(1) NOT NULL COMMENT '是否分配权限(0：无 1：已分配)',
  `SYS_ROLE_NOTES` varchar(200) DEFAULT NULL COMMENT '备注',
  `ADD_USER` varchar(36) NOT NULL COMMENT '添加人',
  `ADD_TIME` datetime NOT NULL COMMENT '添加时间',
  `SYS_ORG_ID` varchar(36) NOT NULL COMMENT '归属组织机构',
  PRIMARY KEY (`SYS_ROLE_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('17b48774-eb76-4b90-b7fa-120789f97552', '市县管理员', '2', '1', '1', '市县管理员', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-01-24 15:18:14', '491912246f7a427cb57978ed9844ff4f');
INSERT INTO `sys_role` VALUES ('2f4e4a2f-7077-4745-a161-643397a9f00a', '办公室人员', '2', '1', '1', null, 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-09-23 12:14:14', '491912246f7a427cb57978ed9844ff4f');
INSERT INTO `sys_role` VALUES ('3965b59f-ade2-4b1a-9d3a-27e5e4d883bc', '市县工作员', '2', '1', '1', '市县工作员', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-12-15 18:29:46', '491912246f7a427cb57978ed9844ff4f');
INSERT INTO `sys_role` VALUES ('9e0f00ce-3843-4b66-865a-ea0470ec037f', '甲伟', '2', '1', '1', '甲伟使用', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-03-09 17:24:28', '491912246f7a427cb57978ed9844ff4f');
INSERT INTO `sys_role` VALUES ('a813e4ca-5bb2-4656-82b6-d704eab1932f', '省办管理员', '2', '1', '1', '省办管理员', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-01-09 10:55:01', '491912246f7a427cb57978ed9844ff4f');
INSERT INTO `sys_role` VALUES ('a8ffdc0e-81fb-408f-8831-f953b30b2193', '超级管理员', '2', '1', '1', '牧羊人开发团队', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2017-04-19 09:40:33', 'ff6a1b79-0c93-40ec-a5ce-65d44008774e');
INSERT INTO `sys_role` VALUES ('d0386d7d-7772-42ee-bbec-ee1f94ae9fe0', '省办工作员', '2', '1', '1', '省办工作人员', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-01-16 15:17:45', '491912246f7a427cb57978ed9844ff4f');
INSERT INTO `sys_role` VALUES ('ea57f1b5-dbc2-485b-b949-0d28feac51b6', '系统管理员', '2', '1', '1', '系统管理员', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2018-10-24 15:09:58', '491912246f7a427cb57978ed9844ff4f');

-- ----------------------------
-- Table structure for sys_role_module
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_module`;
CREATE TABLE `sys_role_module` (
  `ROLE_MODULE_ID` varchar(36) NOT NULL COMMENT '主键',
  `SYS_ROLE_ID` varchar(36) NOT NULL COMMENT '角色ID',
  `SYS_MODULE_ID` varchar(36) NOT NULL COMMENT '模块ID',
  `SYS_ROLE_MODULE_STATUS` char(1) DEFAULT NULL COMMENT '1：正常  0：禁用',
  `SYS_ROLE_MODULE_ISOPER` char(1) DEFAULT NULL COMMENT '1：可操作  0：不可操作',
  `SYS_ROLE_MODULE_ISAUTH` char(1) DEFAULT NULL COMMENT '1：可授权  0：不可授权',
  PRIMARY KEY (`ROLE_MODULE_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role_module
-- ----------------------------
INSERT INTO `sys_role_module` VALUES ('03149a08-76e3-42dd-8c48-6a3001e525ea', '2f4e4a2f-7077-4745-a161-643397a9f00a', '82a06b86-aa88-42f6-b697-3e2079408c33', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('05875e0a-4372-432e-8fe2-a05d1e1533b9', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'c5e41dd5-cebe-47ed-bbe0-db08e6e4b9aa', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('078287b6-dd7e-4125-815e-b1f4f0b15b77', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '15ae5998-f8d0-4d89-b506-529b4cfc6d0f', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('07f45fff-55e3-49ac-a77b-7970a93159ef', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '67198f2d-e63c-40cf-8a4f-c1f14b54a0bf', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('088c347f-236f-48cd-872e-18d404aaa034', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'd344b00f-b47d-4adc-a8ec-80b145a6816c', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('09718d65-01ef-4838-a1fe-482628b3b4f3', '2f4e4a2f-7077-4745-a161-643397a9f00a', '08354cf4-3827-4c01-9398-9adfcdbd09d1', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('0a9e6a63-7de8-432a-ba18-a1dccc4ae127', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'c6a43c4e-1cd1-4549-bb5e-a19004349558', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('0c45558f-cf4b-41b8-9817-303fb9ffa881', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '8d7f8003-30df-4e75-976f-b471ac092260', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('0d74c76a-af38-4ac2-9558-7925bece44c7', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '76e26e08-9a88-4fb5-aa70-b8f7acbfdabb', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('0de4842d-13f1-4b98-b279-65f4d01a34af', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '5917609a-14b9-4d4c-b600-816023ae45e4', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('1252a003-5783-4e89-989c-5e9cc9342428', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '972bd33f-a0eb-40d1-bf92-a9e8681d99d2', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('14390fa8-f371-4a1e-aca8-21f287fb148c', '2f4e4a2f-7077-4745-a161-643397a9f00a', '0ec61e86-eb5e-4f09-b6af-d1da9ec3a5e8', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('14f5b58b-c04d-443f-bb95-1667309c7a81', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '938afb0a-0185-4383-9857-eadea7fc5aad', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('177e1abc-1b53-4131-8c0d-9b75aba3f788', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'b5bb7f4f-b95a-45d8-bd79-f65ee99205ee', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('19e7fc0b-a43f-4c03-827b-24350e9104c9', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '31a1ac0b-53d3-43a8-94bb-d1986772f92b', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('19ef513f-ec33-43de-ab36-245b3e96e410', '9e0f00ce-3843-4b66-865a-ea0470ec037f', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('1a19c0ae-b3f1-4c54-9d49-8cd359168f10', '2f4e4a2f-7077-4745-a161-643397a9f00a', '0809b43a-1084-4e89-8942-2e9ef04c190a', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('1a3d6409-e830-4d8f-b18e-1ed7b2f1f453', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'd1f6b85f-bf12-4f8e-a35a-234767b4905c', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('1c7ee750-bc1a-4e72-91e2-674b488042e3', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '2ddf7846-305f-47ed-a9b7-0d531c4f456f', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('1d7db83f-d99f-4ea9-88e9-c9a0a884410f', 'ea57f1b5-dbc2-485b-b949-0d28feac51b6', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('1da6cbd9-d2c6-46fc-b560-1379cd5048b2', '2f4e4a2f-7077-4745-a161-643397a9f00a', 'e3d2b6a7-2757-4c32-8ecd-a7bec95a42e0', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('1e703951-8803-401c-9719-ba5778d9721f', 'ea57f1b5-dbc2-485b-b949-0d28feac51b6', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('1ebe5819-e7bd-41a5-a18f-a199263b8b26', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'bceffd0f-1456-45f5-8220-54d6622df2d3', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('2142b516-6456-477b-a09a-c3e946ceeb49', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '7480789d-1bbe-4daf-b633-06fd6b810fee', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('24d440d0-6b11-44fe-9964-f3ccf860b936', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '23ed8d12-2243-4a75-8aae-124f1e04c987', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('25c85b74-d63c-4530-adc2-7ef7398b47ad', '9e0f00ce-3843-4b66-865a-ea0470ec037f', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('26bf0e8a-9ce6-464a-aba6-2070e80acf30', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '12f3b540-aff7-4e93-bf79-f820d44fc9a0', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('27cf0d7e-a75a-4fb7-ba03-5e307b0f06da', '9e0f00ce-3843-4b66-865a-ea0470ec037f', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('287a10e9-9d7e-47c3-a083-3f970da6b58a', 'ea57f1b5-dbc2-485b-b949-0d28feac51b6', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('2a0eba2c-eacf-4bbb-949e-52faf2d765ab', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '6d987854-37a8-421e-a223-46041143a1b2', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('2a1410a5-01d9-48ee-9256-5c38c910389d', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'd1b3e6e7-8fa5-4af5-8e27-4c13ba4c7404', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('2a1e3137-ead7-4b26-8f6e-ceaf10b07bcb', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'fa0b5600-ab31-4ff8-8667-378996f0306e', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('2c9fdd34-6432-46c3-88e5-bca77faa7aa2', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '5f4f4ce2-51e6-4af6-99a7-1a25a0e55886', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('2e883813-094a-486a-b065-b0f1a1106545', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '149097be-62fe-4146-8a50-e9870fef2b72', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('330270fa-2a47-44a2-aaa4-3542672780c2', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '14eeaad7-0c9c-43d5-a727-12143c6f2b0c', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('373d4d51-44b1-4310-acda-d1c6d41d2224', 'ea57f1b5-dbc2-485b-b949-0d28feac51b6', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('39a61e07-8fee-42ea-8ad1-be4dcaf77906', '2f4e4a2f-7077-4745-a161-643397a9f00a', '442e1bc9-3015-4a20-8a86-041f82f65fe0', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('39b04f1f-aced-473e-9fb6-b438e518d089', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '1bd5e3de-1fde-4d9a-8868-4fe28e9d228d', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('3ad717d9-8336-41a8-83b8-4755a66d8054', '2f4e4a2f-7077-4745-a161-643397a9f00a', 'bf7d3f7a-bc9f-4da2-838b-678f4f67dbea', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('3b0b265f-9eaf-4b93-8937-0383ef34f7bd', 'ea57f1b5-dbc2-485b-b949-0d28feac51b6', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('3c4c8213-f6d7-49f2-8b6d-8e6b1d4eda47', '9e0f00ce-3843-4b66-865a-ea0470ec037f', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('3ed4c065-542b-4de4-8427-016e16cc753a', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '5a9bcd64-e6fb-47ce-8f78-244189512e36', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('3f5be931-d1b9-4a5d-b014-065d81cfdc5d', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '926d2916-f18e-4506-a110-718c28fbe988', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('3f7f26b8-a748-4b39-9f37-db76a9dd83e7', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'd8375151-5a41-4c80-b8b4-8d5323fe91d0', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('4006d2b6-e25d-4825-b24b-3c54831944a2', '2f4e4a2f-7077-4745-a161-643397a9f00a', '76e26e08-9a88-4fb5-aa70-b8f7acbfdabb', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('4139d1c1-30c8-480e-b901-3295c52b2c12', '9e0f00ce-3843-4b66-865a-ea0470ec037f', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('414834e5-0cd3-4f2c-b7bf-d20dcc37a6fd', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '5fcfd567-f056-4e8c-b71b-2a9e0fc12bfe', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('48d41832-4737-4f6d-8084-da7f1d1e25ec', '9e0f00ce-3843-4b66-865a-ea0470ec037f', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('493b4cde-b640-4b35-9f1d-1632b5c3b2dc', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'ebb819c2-729c-4588-b2c7-43371e0072bd', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('4d995857-2d9f-4630-a254-4db54c0d2454', 'ea57f1b5-dbc2-485b-b949-0d28feac51b6', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('4de30fed-a0c4-4ef1-97a1-4989a39342df', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'e25750b3-8798-4c6e-ab62-48a693f8d04a', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('4e77023c-da90-4d6f-85da-24ddca15dfdb', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '0ec61e86-eb5e-4f09-b6af-d1da9ec3a5e8', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('5029b277-9079-47f3-a96f-6be5e60d6922', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'd8c95eb5-bae8-4654-8ba6-33f5e9f67ed6', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('50376023-de54-429f-881c-80dcde65c823', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'd100c3bb-89e9-439b-ad68-4d5b227ad7a9', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('50a13718-672e-4bae-965b-f982bee2f274', 'ea57f1b5-dbc2-485b-b949-0d28feac51b6', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('5285ac59-5d95-4f8b-b507-52a95cdfa961', '2f4e4a2f-7077-4745-a161-643397a9f00a', '7c0b10d8-eecc-4a77-b77e-3cebb9403acd', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('53bda915-3394-4df5-a5a4-0053f245acab', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '0fa7b99841ef4d7784fdffd724d9f436', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('567bd6a8-f234-4200-a750-30ebd77691d0', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'de3db495-063c-4000-8862-160fab0feff7', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('56af809d-b3be-4d44-b47c-aaa3e6379aba', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'da1483b7-fdc4-43c0-9d0f-dfde56a6fb20', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('59646c0c-d49f-43b6-91db-e47c038c38bb', 'ea57f1b5-dbc2-485b-b949-0d28feac51b6', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('59e63e0d-4498-433e-b912-746d044f4038', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'bf7d3f7a-bc9f-4da2-838b-678f4f67dbea', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('6454f555-67f3-49c1-bce8-ab255bf39a91', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'f307977b30924295995226c57e9755fd', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('654ffca8-dc6b-4faa-9618-3fd8c089b4c9', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '96014254-b841-44ba-984d-a6767b1169a4', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('667f7f64-91ac-4fc8-a017-145e10598f1a', '9e0f00ce-3843-4b66-865a-ea0470ec037f', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('66e05c9c-d5ac-40b8-8bf0-111147519460', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '8bfe2a23-8a66-4003-9b4a-95f396c84d0e', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('6994c532-32fe-4d97-85f9-1ee832101cc1', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '0809b43a-1084-4e89-8942-2e9ef04c190a', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('6a1bc6f3-2d22-4eb1-b054-f06cec81a046', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '50c45621-90b8-4ddc-94b9-11ad145df227', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('6c26bbfa-a3e3-4358-92a6-2cfd3e5157b9', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '236d5279-6ec5-47ed-ba02-8a8316a07c6e', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('6c46ff3e-241f-495b-bfbd-aad72d9c5e9b', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '587b3f56-2db2-465e-8808-1dd2bbe06965', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('6e37182b-3d89-415b-9be5-64d5521300c2', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'fa08fff2-deb1-4512-b0bc-f1412702dca8', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('6fb70802-8817-46d0-9a26-6c03ffc67ebf', 'ea57f1b5-dbc2-485b-b949-0d28feac51b6', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('720e0915-54fb-4b7a-82b3-a5c9761bb061', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '5782e1af-fa28-496c-80c1-8a0fee3a5a4d', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('74e0d4bc-ebd6-468c-be98-14392b244de1', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '65cb6236-f40b-4242-aeb6-acb71637239f', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('793acb2b-0eb2-4eaf-88fb-79a16fc31568', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '53481f5e-5983-49e6-adad-a1a46bb3c8ae', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('79a72281-0508-45a3-8373-f40ba6c459cf', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '94f811ca-12f5-4edf-8112-acd1a34a686f', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('7a9fa735-6044-4da6-b9de-b3147880f7a5', '2f4e4a2f-7077-4745-a161-643397a9f00a', '375acfce-aa4a-4781-9e85-74842114db8a', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('7b10027f-25a3-4310-9a16-6cb56199b3f5', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '442e1bc9-3015-4a20-8a86-041f82f65fe0', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('7caecef9-be38-423a-8602-b63dbd48f3de', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'a0bed77d-1a86-4cd5-811e-04b88fb51946', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('7e0ee90f-06c3-4a17-9688-259b690c3a91', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '0d522582-addb-4609-9b74-58b04345005a', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('82e686ac-2926-40e2-8aa2-ed2fa13ca912', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'e02e7d26-efa9-4b33-87d0-ccc065f172ac', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('83af0acd-915a-41e5-9da2-af546abb75b3', '2f4e4a2f-7077-4745-a161-643397a9f00a', 'd1f6b85f-bf12-4f8e-a35a-234767b4905c', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('8692db04-5388-455a-ac56-83465df155a8', 'ea57f1b5-dbc2-485b-b949-0d28feac51b6', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('88ce0104-0ea4-46ef-be96-46845684861f', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '27c6f83a-7208-4132-af04-9b0d5b52769f', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('8a19df72-7a9b-4a6d-9049-1906e5ed7ffa', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '0c0aaf77-33e1-41d2-8412-fd5af5cb4384', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('8a398600-8b49-4162-8dc2-ffbe55c4480c', '2f4e4a2f-7077-4745-a161-643397a9f00a', '1895263a-b4dd-4afd-bf40-e207d31c7468', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('8aaeadf6-a1d5-4892-bbc8-ca3c23da75a7', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '325f7e39-e9bf-4445-99bb-c9b23b5fc0a8', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('8ba13448-13b8-47f6-aea9-027398b1a286', '9e0f00ce-3843-4b66-865a-ea0470ec037f', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('8d08d322-6428-45c0-991c-76e280762ff0', '2f4e4a2f-7077-4745-a161-643397a9f00a', '938afb0a-0185-4383-9857-eadea7fc5aad', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('8e2729ad-227c-44b6-bf9b-0adb81ab4f26', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '1b13df57-83be-49c6-a3b5-18cf8011eeb8', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('8e5df8b7-2921-4a1c-b181-6120672a7455', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '5dffa914-21c9-484e-b6e7-43fd21bea835', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('8f0fab94-20bc-440d-9a47-b7ab9e4e4e9b', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'd7b77636-ecf2-4b7a-b422-6b8bddb574c3', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('913f6142-324d-424d-82ef-fac190a2e536', '2f4e4a2f-7077-4745-a161-643397a9f00a', '1467624b-4be5-47b9-87a3-57a229e52193', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('9191e74e-901c-449b-911e-33c31e8e5f72', '9e0f00ce-3843-4b66-865a-ea0470ec037f', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('920799cb-5e11-4008-aac8-e4d24d3c672a', '2f4e4a2f-7077-4745-a161-643397a9f00a', '65cb6236-f40b-4242-aeb6-acb71637239f', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('9258d622-f49e-44fa-b4d1-109c1ca8e6ee', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'a10b2874-e4cf-4eaf-9a01-1e00c4542555', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('929d1dfa-4bb1-4135-8b94-795e0cb550c6', '2f4e4a2f-7077-4745-a161-643397a9f00a', '06101e80-d1b8-4e62-a569-db6ff109ac00', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('931eb014-3883-49db-a3bb-4c42013e6d2d', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '1467624b-4be5-47b9-87a3-57a229e52193', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('96154aa8-4d08-4d31-af32-74d2e396f715', '2f4e4a2f-7077-4745-a161-643397a9f00a', 'e25750b3-8798-4c6e-ab62-48a693f8d04a', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('9670d4a2-ef87-45e7-84fb-1f34eb101a06', '9e0f00ce-3843-4b66-865a-ea0470ec037f', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('98588d1b-7bb0-4910-ae0e-e58b0ca8a578', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '0e1ef0cb-ff57-4e06-9694-57f2727645a9', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('9b366180-bae3-4ed9-ae47-fe4bd5d4e56b', '2f4e4a2f-7077-4745-a161-643397a9f00a', 'a10b2874-e4cf-4eaf-9a01-1e00c4542555', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('9dd512e5-2d51-4be5-8b26-af1a741afbee', '9e0f00ce-3843-4b66-865a-ea0470ec037f', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('9f04cf1c-da7f-4510-a618-945a4c3e349e', 'ea57f1b5-dbc2-485b-b949-0d28feac51b6', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('9fd954a8-5c60-4cf5-818f-b18458873910', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'adf9112a-d19d-43d0-a8a2-2626e2f1e359', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('9ff24417-4ba1-4c1a-9763-cfc0a1550dfe', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'c8fc4288-f931-48b4-be41-8908867e29d9', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('a0c87edb-7377-40a7-8f73-0e7524026e0d', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '2a1407a5-1824-4eb5-bc1b-d9a6a4ce7f26', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('a25fb3df-e61c-4a1a-abb8-8b2a3c7f9af5', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'edc4552e-d6d1-4dea-9569-de697d795e44', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('a2b807db-8c5b-485f-9736-518eecc325a2', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '3bbd7b2a-ac05-4e6c-bf62-f58818351f9d', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('a47ea3d1-978c-4c70-9bd2-b3a58ce638f0', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '2fbe8c54-3665-4359-a824-dee62a078bf2', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('a51f6748-c05a-422c-bdcc-47316655061e', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '166d5cac-f2ba-4a13-bcfb-eef4f9fb6edc', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('a7a50c47-c245-438d-a6bd-d7e7b1b7a0a8', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'e3d2b6a7-2757-4c32-8ecd-a7bec95a42e0', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('ab04d922-4457-40ff-932f-672852ecc113', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '19e5f3d8-841a-4389-b25c-30a1c805ad23', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('ad04b794-697a-4a21-b457-1d90d770c7a0', '2f4e4a2f-7077-4745-a161-643397a9f00a', '4ca88c2c-db1e-466c-930c-5a0c7113b76d', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('b034cc95-2984-4269-8a35-477e34b33ae6', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'd64cb280-471f-4905-8b74-1f664793e897', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('b0d99a5c-841f-49b9-ba17-9bfad59a32ba', '9e0f00ce-3843-4b66-865a-ea0470ec037f', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('b12dd2f6-f7eb-4fb0-af69-2fcbd5c624c7', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '57f4169c-4afa-4205-bad8-bdfc93589737', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('b4352588-16ab-4eec-87e1-28d634057a46', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '00bb7d14-2985-4d62-9c0a-69b814e49706', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('b5d88a3d-e2ce-4114-a4ad-5f41a260a13a', '2f4e4a2f-7077-4745-a161-643397a9f00a', 'd8c95eb5-bae8-4654-8ba6-33f5e9f67ed6', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('b60625cc-2b82-424d-9c81-8b36960adcb3', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '4ca88c2c-db1e-466c-930c-5a0c7113b76d', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('b61166a8-49cd-46b2-929f-bb628b27f6f9', '2f4e4a2f-7077-4745-a161-643397a9f00a', 'f3b0386a-720d-4a43-8c65-51b804ec9c21', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('b62f071c-63b7-4b17-924d-e229d31a1f86', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'c1cd7d7e-3385-48d5-bb98-4316100b67b1', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('b68dd4af-cd2a-47d6-bc28-c6789382a315', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'ca8d2480-ce46-42a6-9592-2ce221f84c30', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('b6b25dbb-9824-4923-8001-338251c90170', '9e0f00ce-3843-4b66-865a-ea0470ec037f', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('b77ca0b8-f777-4548-a469-65885d88b086', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '1b8c2673-8670-425b-acfb-e76f29084f11', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('b77eb6e8-6307-4709-bfcf-533992976a45', '2f4e4a2f-7077-4745-a161-643397a9f00a', '67198f2d-e63c-40cf-8a4f-c1f14b54a0bf', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('ba42d21e-087d-4e7a-a560-31bce8b7e038', 'ea57f1b5-dbc2-485b-b949-0d28feac51b6', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('ba4ccf4b-d71a-491b-b6f0-20f377bb655d', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '76d16d0e-4f2d-4845-8dfb-a40afeda11db', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('bc566459-102b-49de-8ffa-6069c8846bdb', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'fd0a7a1a-d824-4a3a-8a0f-e6ac5f063a89', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('bdcd4951-5f87-4dda-9da9-578a0bb9b634', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '08354cf4-3827-4c01-9398-9adfcdbd09d1', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('bdf86852-9be9-4b18-83e4-fbe59d5fed06', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '562e25ff-4caf-4f9c-abe5-0f498b936d88', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('bfdde035-1ac4-48d8-aa91-19749eb08cea', '9e0f00ce-3843-4b66-865a-ea0470ec037f', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('c0d3c9e9-54f9-4da5-98bb-70e2f0a12b36', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '1cb6254a-9b09-44ca-865e-e997f059b32d', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('c1484294-f7c7-4ee0-8a6c-d78b67d43efe', '9e0f00ce-3843-4b66-865a-ea0470ec037f', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('c18bc75c-eb4d-40e5-a0b7-b89326cf5a37', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '9bbc0837-1804-4dfc-9f34-cd039dfaa966', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('c2611925-efdd-468a-b5ea-0b8521cbba7a', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'f962cd7b-6269-4f44-bf07-36b44945c81d', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('c336d9d7-d82b-42b7-acdb-a16c9a9cc210', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'a37b987d-eb33-49a3-a964-4b8cdb37f3a5', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('c379996c-1742-4c25-b5a3-cef2e19364a3', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '0340480f-ccb0-4906-a125-6e5a78b21903', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('c5001a26-beb2-4845-90e5-8f91661a42a3', 'ea57f1b5-dbc2-485b-b949-0d28feac51b6', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('c808e2b8-b26e-4e9f-a1e3-399949359c4a', '9e0f00ce-3843-4b66-865a-ea0470ec037f', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('c8500078-2ab7-4529-bce0-fc4b2bba67ca', '2f4e4a2f-7077-4745-a161-643397a9f00a', 'a37b987d-eb33-49a3-a964-4b8cdb37f3a5', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('ca9a631f-0311-42e6-939c-3082567712f4', '9e0f00ce-3843-4b66-865a-ea0470ec037f', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('cbb1bd23-adb4-4488-90c5-23a91ba05e9d', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '82a06b86-aa88-42f6-b697-3e2079408c33', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('cbdaca02-467b-4ff8-84ce-db9731734142', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '7c0b10d8-eecc-4a77-b77e-3cebb9403acd', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('cd88c461-192d-47fe-ae17-b5805b16aed1', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '5af615eb-2af2-4198-b108-833258b25afb', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('ce46e5bb-b7af-4139-bd34-0a7ac13b2757', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '375acfce-aa4a-4781-9e85-74842114db8a', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('d0374927-a317-4fcf-b08f-bce17ebc82a0', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '06101e80-d1b8-4e62-a569-db6ff109ac00', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('d1fdbf6e-42e0-4861-905a-186db52fbbb1', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'f3b0386a-720d-4a43-8c65-51b804ec9c21', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('d7072d69-2b59-48f2-a61f-38f02ee23d53', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '148cd40a-9fa8-4e6b-a558-23a6cce505c8', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('d9acf693-2470-4715-bfed-4882374af378', '9e0f00ce-3843-4b66-865a-ea0470ec037f', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('e5033388-7f86-4e82-a5ab-363ce30ebeef', '9e0f00ce-3843-4b66-865a-ea0470ec037f', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('e5d8fdd5-c1ab-45d2-90c8-b81bcb5dddd8', '9e0f00ce-3843-4b66-865a-ea0470ec037f', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('e7c4ca20-026b-446b-b832-bc73b4bc0178', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'c8ace64b-cc83-42ba-84c2-a700e1211210', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('e8ff1fb3-3d5d-44ae-b23f-0885809aefed', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '1895263a-b4dd-4afd-bf40-e207d31c7468', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('e9bdb3c0-0bc2-4ba0-b35b-41cbd8622879', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'd03bc641-e0d0-4861-8549-c93a719641d6', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('ea75789f-ddcb-4f9b-9083-fbf8e363658b', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '482029f4-c151-4e03-86ee-4daf30d83cf4', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('eaa26269-f1e1-4ae6-8446-07be0b311b7f', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '6e800af7-bb56-4d2c-bbfc-06669b4b553c', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('ef37036d-c077-4924-a7e5-3b9166c17511', '9e0f00ce-3843-4b66-865a-ea0470ec037f', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('f03e78b3-b1b6-4dfa-8f97-7feabc2a715b', '9e0f00ce-3843-4b66-865a-ea0470ec037f', 'undefined', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('f11c2a19-cc8f-450a-a52e-14305a713ecc', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '9b0282da-002e-4f64-af74-97845a8ee785', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('f51acfcc-f9db-4cd9-98ed-cd3e89cce605', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', '36f2e6ed-ad2f-4263-beb3-5695a851b3a3', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('f9d40200-045e-4853-b9e7-b185da25727c', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'fd7cb3ef-c010-4a23-b76a-0cf601a15e92', '1', '1', '0');
INSERT INTO `sys_role_module` VALUES ('fdd7aba9-1fc3-494b-9b0b-cf53968f9bc1', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'c1ff6b2f-0499-43a5-b36a-b417183bedbd', '1', '1', '0');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `SYS_USER_ID` varchar(36) NOT NULL COMMENT '用户主键',
  `SYS_ORG_ID` varchar(36) NOT NULL COMMENT '用户归属的当前机构ID，县ID',
  `SYS_DEPT_ID` varchar(36) NOT NULL COMMENT '部门ID',
  `IS_HAVE_ROLE` char(1) NOT NULL COMMENT '是否拥有角色 1：已拥有 0：未拥有',
  `SYS_USER_NAME` varchar(40) NOT NULL COMMENT '用户名称',
  `SYS_USER_NICKNAME` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `SYS_USER_SEX` char(1) DEFAULT NULL COMMENT '性别',
  `SYS_USER_CODE` varchar(40) NOT NULL COMMENT '账号',
  `SYS_USER_PASS` varchar(50) NOT NULL COMMENT '密码',
  `SYS_USER_STATUS` char(1) NOT NULL COMMENT '状态 0禁用，1启用',
  `SYS_USER_MOBILE` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `SYS_USER_IPONE` varchar(20) DEFAULT NULL COMMENT '固话号码',
  `SYS_WORK_IPHONE` varchar(20) DEFAULT NULL COMMENT '工作电话',
  `SYS_USER_EMAIL` varchar(255) DEFAULT NULL,
  `SYS_USER_QQ` varchar(255) DEFAULT NULL,
  `SYS_USER_BIRTHDAY` date DEFAULT NULL COMMENT '生日',
  `SYS_USER_ADDRESS` varchar(200) DEFAULT NULL COMMENT '住址',
  `SYS_USER_IDENTITY` char(1) DEFAULT NULL COMMENT '用户身份 1:全局者 0：私有者',
  `SYS_ORG_RULE` varchar(512) DEFAULT NULL COMMENT '所管理的辖区，以县为单位',
  `HEAD_PORTRAIT_ID` varchar(200) DEFAULT NULL COMMENT '头像文件ID',
  `ZJM` varchar(30) DEFAULT NULL COMMENT '助记码',
  `ADD_TIME` datetime NOT NULL COMMENT '添加时间',
  `ADD_USER` varchar(36) NOT NULL,
  `SYS_USER_NOTE` varchar(200) DEFAULT NULL,
  `LAST_LOGIN_TIME` datetime DEFAULT NULL COMMENT '最近登录时间',
  `LOGIN_COUNT` int(20) DEFAULT NULL COMMENT '登录次数',
  `COUNTRY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`SYS_USER_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('5efe64da-9d78-458c-9781-04d3a025dda4', '491912246f7a427cb57978ed9844ff4f', '5a82c3a3cded45d79480dc019ee16515', '1', '孟瑾', null, '2', 'mengjin', 'D17BD20567BC486E', '1', '13211112222', null, null, null, null, null, null, null, null, null, 'MJ', '2019-09-23 12:13:28', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '孟瑾', '2019-09-23 12:15:30', '3', null);
INSERT INTO `sys_user` VALUES ('9e7a8c91-ce10-446d-8bbf-002f09e7f8ed', '491912246f7a427cb57978ed9844ff4f', '5a82c3a3cded45d79480dc019ee16515', '1', '付腾', null, '1', 'futeng', '87C2957AF74061E7', '1', null, null, null, null, null, null, null, null, null, null, 'FT', '2019-03-15 14:50:29', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', null, '2019-08-08 17:05:01', '97', null);
INSERT INTO `sys_user` VALUES ('ccc85866-24d3-11e7-ac0e-54ee750aa974', 'ff6a1b79-0c93-40ec-a5ce-65d44008774e', '0636cfce-a0a1-4f3e-9487-dad6ebb1d260', '0', '超级管理员', '超级管理员', '1', 'super', '39ECF49C43B294C0', '1', '13213223477', null, null, null, null, null, null, '1', null, null, 'CJGLY', '2017-04-20 23:43:25', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '1', '2019-10-17 18:08:55', '2111', null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `USER_ROLE_ID` varchar(36) NOT NULL,
  `SYS_ROLE_ID` varchar(36) NOT NULL COMMENT '角色ID',
  `SYS_USER_ID` varchar(36) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`USER_ROLE_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('', '3965b59f-ade2-4b1a-9d3a-27e5e4d883bc', 'c6d1d30b-d1f6-4d92-8550-b68836cab715');
INSERT INTO `sys_user_role` VALUES ('03d0406c-ce8c-4b4b-819b-000e452d20f8', '3965b59f-ade2-4b1a-9d3a-27e5e4d883bc', '15357844-50d1-41ce-837a-5db72ebd6fd8');
INSERT INTO `sys_user_role` VALUES ('09a67e18-54e5-4e3c-895f-9bc8159ca855', '3965b59f-ade2-4b1a-9d3a-27e5e4d883bc', 'fe4cb240-d6e9-4aec-bc47-2537eac7616b');
INSERT INTO `sys_user_role` VALUES ('0be5daf4-1c19-48b0-a97a-95237deeb839', 'd0386d7d-7772-42ee-bbec-ee1f94ae9fe0', '5d76ebce-2585-4536-9bcb-94424678f797');
INSERT INTO `sys_user_role` VALUES ('0e65d29a-b857-490f-b346-9498ceb99c8e', '3965b59f-ade2-4b1a-9d3a-27e5e4d883bc', 'cc03be4c-877c-4794-bf57-0958f9fb09b8');
INSERT INTO `sys_user_role` VALUES ('135fda2c-bec2-44c7-9716-76aeb7219722', 'a8ffdc0e-81fb-408f-8831-f953b30b2193', 'ccc85866-24d3-11e7-ac0e-54ee750aa974');
INSERT INTO `sys_user_role` VALUES ('1cb5d975-fed6-4bb2-a73e-b8c1fb17da3a', '9e0f00ce-3843-4b66-865a-ea0470ec037f', '2f7116cf-d46e-4074-a5d6-6230cfe826e9');
INSERT INTO `sys_user_role` VALUES ('28cec0ad-09df-4532-87ce-42b7a51fec8f', '3965b59f-ade2-4b1a-9d3a-27e5e4d883bc', '5294b67b-c0e8-41b8-b21f-123196844b80');
INSERT INTO `sys_user_role` VALUES ('3f4415c1-9804-4513-bfbc-77d4c1788a78', 'a813e4ca-5bb2-4656-82b6-d704eab1932f', 'e6c4bbc7-7422-4887-b008-de6ab4c9d656');
INSERT INTO `sys_user_role` VALUES ('461b76a1-d061-4499-b97b-4445dd5e2be6', '9e0f00ce-3843-4b66-865a-ea0470ec037f', '9e7a8c91-ce10-446d-8bbf-002f09e7f8ed');
INSERT INTO `sys_user_role` VALUES ('6b89021c-5452-4e29-86e5-e2e598d4857f', '3965b59f-ade2-4b1a-9d3a-27e5e4d883bc', '621b7ed4-c6c2-4372-8ad6-39f25ed2f94e');
INSERT INTO `sys_user_role` VALUES ('6d66487a-82e2-474f-bb38-8626f55ed2c0', 'a813e4ca-5bb2-4656-82b6-d704eab1932f', '71955222-4d81-4265-af95-a2330f113310');
INSERT INTO `sys_user_role` VALUES ('75be7127-e890-43a5-a8bc-b3cfb4153909', '3965b59f-ade2-4b1a-9d3a-27e5e4d883bc', '5ecbee0f-6a03-4e3d-be7a-4add86e5d125');
INSERT INTO `sys_user_role` VALUES ('809ba7fd-8aa7-4925-8abe-b2fecf0ca3dc', 'a813e4ca-5bb2-4656-82b6-d704eab1932f', '7e13cd05-d158-4557-9a6c-89ec5a619101');
INSERT INTO `sys_user_role` VALUES ('85581712-46b7-4007-aa85-93f0964ad99e', 'a813e4ca-5bb2-4656-82b6-d704eab1932f', 'f79cf5c2-3a77-49a5-9d9a-440f13864c8c');
INSERT INTO `sys_user_role` VALUES ('8c85ec77-b4d2-4214-846d-97164b959a6d', '3965b59f-ade2-4b1a-9d3a-27e5e4d883bc', '4a9d029f-238d-4fc9-a1c0-dc7282a2e43d');
INSERT INTO `sys_user_role` VALUES ('95878854-3bdb-47b8-a392-830b07e42c88', '3965b59f-ade2-4b1a-9d3a-27e5e4d883bc', '033e6bcd-a868-468b-b8f7-60b49f6a457c');
INSERT INTO `sys_user_role` VALUES ('95aaa70c-116e-4ed0-8830-9d74aa9eb5ea', '2f4e4a2f-7077-4745-a161-643397a9f00a', '5efe64da-9d78-458c-9781-04d3a025dda4');
INSERT INTO `sys_user_role` VALUES ('a011ac86-afaa-44f8-9d58-8ad1722cf9fe', '3965b59f-ade2-4b1a-9d3a-27e5e4d883bc', '54c43564-6b3f-4950-8206-ac4983ac6b63');
INSERT INTO `sys_user_role` VALUES ('a229cb62-fa8d-4734-8e20-a4bfb5ba8111', 'ea57f1b5-dbc2-485b-b949-0d28feac51b6', '8380b8bfce35424db7fb59faa3b8f633');
INSERT INTO `sys_user_role` VALUES ('ab0fe9d4-13b9-4188-8d1a-845816bcf551', '9e0f00ce-3843-4b66-865a-ea0470ec037f', '7f3d63f3-9125-44a2-95d3-8930ddc5def6');
INSERT INTO `sys_user_role` VALUES ('b1ca6fa3-6893-4700-9346-f98b0c62727d', '3965b59f-ade2-4b1a-9d3a-27e5e4d883bc', '637ac510-9162-4299-b9f9-b6e3937d400e');
INSERT INTO `sys_user_role` VALUES ('b7d4b3ea-43e1-4761-8011-4c72907228a8', '3965b59f-ade2-4b1a-9d3a-27e5e4d883bc', 'f86b6d66-5369-4e58-b125-ccc966d85667');
INSERT INTO `sys_user_role` VALUES ('da7306f2-a83c-4f77-b545-87a0181a7e1e', '3965b59f-ade2-4b1a-9d3a-27e5e4d883bc', 'fca733c1-8c73-4c28-bd34-d2dd5751b0dc');
INSERT INTO `sys_user_role` VALUES ('def3f3bb-5124-4fd0-805f-5daad211f03d', '3965b59f-ade2-4b1a-9d3a-27e5e4d883bc', '643eff5a-d78c-4a2a-ac1e-595d302edcd3');

-- ----------------------------
-- Table structure for t_timer_manage
-- ----------------------------
DROP TABLE IF EXISTS `t_timer_manage`;
CREATE TABLE `t_timer_manage` (
  `TIMER_ID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '定时任务ID',
  `TIMER_JOB_NAME` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '定时器名称',
  `TIMER_GROUP` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '定时器组名称',
  `TIMER_TRIGGER_NAME` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器名称',
  `TIMER_CRON_EXPRESSION` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `TIMER_TARGET_OBJECT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务类名(全路径)',
  `TIMER_METHOD_NAME` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类名对应的方法名',
  `TIMER_START_TIME` datetime DEFAULT NULL COMMENT '开始执行时间',
  `TIMER_END_TIME` datetime DEFAULT NULL COMMENT '结束执行时间',
  `TIMER_STATUS` int(2) NOT NULL COMMENT '定时器运行状态（1、运行中 ，2、待运行，3、运行失败，0、失效）',
  `TIMER_DESCRIPTION` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '定时器详细描述',
  `CREATE_USER_ID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_USER_ID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `STATUS` int(1) NOT NULL COMMENT '任务启用状态',
  `EXTEND3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备用字段',
  `EXTEND4` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备用字段',
  `EXTEND5` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`TIMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时器管理表';

-- ----------------------------
-- Records of t_timer_manage
-- ----------------------------
INSERT INTO `t_timer_manage` VALUES ('3a05e51e-1130-4189-b1da-cd3c9168ad9a', '1', '1', '1', '* * * * * ?', 'com.soft.quartz.test.EatJob', null, null, null, '2', '测试一下写代码', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-10-17 15:58:24', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-10-17 15:58:46', '0', null, null, null);
INSERT INTO `t_timer_manage` VALUES ('48688fea-204f-4ea9-94cd-b4178e40d4be', '2', '2', '2', '* * * * * ?', 'com.soft.quartz.test.CodeingJob', null, null, null, '2', '测试写代码', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-10-17 15:59:55', null, null, '0', null, null, null);
INSERT INTO `t_timer_manage` VALUES ('63ad6987-a17f-4ab3-820c-09037ad7158e', '4', '4', '3', '* * * * * ?', 'com.soft.quartz.test.CodeingJob', null, null, null, '2', '重复测试', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-10-17 16:05:38', null, null, '0', null, null, null);
INSERT INTO `t_timer_manage` VALUES ('bee37e99-087c-45ab-9fd9-8d91d131dcf4', '二号', '百度', '家里', '0/3 * * * * ?', 'com.soft.quartz.test.SleepJob', null, null, null, '2', '睡觉', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-10-17 15:39:32', null, null, '0', null, null, null);
INSERT INTO `t_timer_manage` VALUES ('dfaa0b58-7c07-4acd-899f-674975afe59e', '3', '3', '3', '* * * * * ?', 'com.soft.quartz.test.CodeingJob', null, null, null, '2', '测试触发器', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-10-17 16:04:53', null, null, '0', null, null, null);
INSERT INTO `t_timer_manage` VALUES ('edfcb67b-4a23-4c51-baf9-5abd8db93986', '一号', '百度', '食堂', '0/2 * * * * ?', 'com.soft.quartz.test.EatJob', null, null, null, '2', '吃饭', 'ccc85866-24d3-11e7-ac0e-54ee750aa974', '2019-10-17 15:37:18', null, null, '0', null, null, null);
DROP TRIGGER IF EXISTS `mm`;
DELIMITER ;;
CREATE TRIGGER `mm` AFTER INSERT ON `sys_country` FOR EACH ROW insert into kyt_middle_ware.sys_country values (new.ID,new.COUNTRY_NAME,new.COUNTRY_CODE,new.`SCHEMA`)
;;
DELIMITER ;
