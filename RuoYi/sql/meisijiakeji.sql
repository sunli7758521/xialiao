/*
Navicat MySQL Data Transfer

Source Server         : 192.168.31.83
Source Server Version : 50561
Source Host           : 192.168.31.83:3306
Source Database       : meisijiakeji

Target Server Type    : MYSQL
Target Server Version : 50561
File Encoding         : 65001

Date: 2019-06-02 17:04:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200094C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200094C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D73740002727974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', null, 'com.ruoyi.quartz.util.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F7372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720020636F6D2E72756F79692E636F6D6D6F6E2E626173652E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', null, 'com.ruoyi.quartz.util.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F7372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720020636F6D2E72756F79692E636F6D6D6F6E2E626173652E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D73740002727974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'wangluobu21557125091125', '1557125140284', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', null, '1555287070000', '-1', '5', 'PAUSED', 'CRON', '1555287068000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', null, '1555287080000', '-1', '5', 'PAUSED', 'CRON', '1555287068000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', '__TASK_CLASS_NAME__1', 'DEFAULT', null, '1557125100000', '-1', '5', 'PAUSED', 'CRON', '1557125091000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', '__TASK_CLASS_NAME__2', 'DEFAULT', null, '1557125100000', '-1', '5', 'PAUSED', 'CRON', '1557125091000', '0', null, '2', '');

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `sr_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '记录主键',
  `gk_name` varchar(50) DEFAULT NULL COMMENT '顾客名称',
  `gk_num` varchar(50) DEFAULT NULL COMMENT '顾客编号',
  `room_id` bigint(11) DEFAULT NULL COMMENT '房间主键',
  `room_time` char(5) DEFAULT '0' COMMENT '房间占用时间 0.5 -5个小时 0，1，2，3，4，5，6，7，8，9，1',
  `mrs_id` bigint(11) DEFAULT NULL COMMENT '美容师id',
  `gw_id` bigint(11) DEFAULT NULL COMMENT '顾问id',
  `si_id` bigint(11) DEFAULT NULL COMMENT '服务项id 1',
  `state` char(5) DEFAULT '0' COMMENT '0，顾问开单状态 1.物料确认状态 2.美容师确认  3 完成记录',
  `create_time` datetime DEFAULT NULL COMMENT '开单时间',
  `a` varchar(255) DEFAULT NULL COMMENT '服务配料1',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `si_id2` bigint(11) DEFAULT NULL COMMENT '服务项id 2',
  `b` varchar(255) DEFAULT NULL COMMENT '服务配料 2',
  `si_id3` bigint(11) DEFAULT NULL COMMENT '服务项id 3',
  `c` varchar(255) DEFAULT NULL COMMENT '配料3',
  `dept_id` varchar(11) DEFAULT NULL COMMENT '部门id',
  `end_time` datetime DEFAULT NULL COMMENT '美容师最后确认时间',
  `yj_time` datetime DEFAULT NULL COMMENT '预计结束时间',
  PRIMARY KEY (`sr_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='美容记录表';

-- ----------------------------
-- Records of record
-- ----------------------------

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `ro_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ro_name` varchar(50) DEFAULT NULL COMMENT '房间 名称',
  `state` char(2) DEFAULT '0' COMMENT '房间使用状态 0未使用  1  使用中',
  `create_time` datetime DEFAULT NULL COMMENT '房间创建时间',
  `dept_id` bigint(11) DEFAULT NULL COMMENT '部门的id',
  `rzy_time` char(5) DEFAULT '0' COMMENT '房间的占用时间 0.5-5',
  PRIMARY KEY (`ro_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='美容房间';

-- ----------------------------
-- Records of room
-- ----------------------------

-- ----------------------------
-- Table structure for service_ingredients
-- ----------------------------
DROP TABLE IF EXISTS `service_ingredients`;
CREATE TABLE `service_ingredients` (
  `sm_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '服务配料',
  `sm_no` varchar(50) DEFAULT NULL COMMENT '编号',
  `sm_name` varchar(50) DEFAULT NULL COMMENT '名称',
  `sm_unit` char(7) DEFAULT '0' COMMENT '产品单位  0克 1 毫升 2个  3滴 4 瓶  5 支  6 包  7对 8 贴  9 片 10 盒',
  `sm_num` int(11) DEFAULT '0' COMMENT '产品数量',
  `st_id` bigint(11) DEFAULT NULL COMMENT '服务项id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门id',
  PRIMARY KEY (`sm_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='服务项配料';

-- ----------------------------
-- Records of service_ingredients
-- ----------------------------
INSERT INTO `service_ingredients` VALUES ('1', 'A001', '油', '0', '100', '102', '2019-03-29 21:45:09', null, '105');

-- ----------------------------
-- Table structure for service_items
-- ----------------------------
DROP TABLE IF EXISTS `service_items`;
CREATE TABLE `service_items` (
  `si_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '服务项主键',
  `dept_id` varchar(255) DEFAULT NULL COMMENT '部门ids',
  `ancestors` varchar(30) DEFAULT NULL COMMENT '祖级列表',
  `si_name` varchar(50) DEFAULT NULL COMMENT '服务项名称',
  `order_num` int(4) DEFAULT NULL COMMENT '显示顺序',
  `status` char(2) DEFAULT '0' COMMENT '服务项状态（0正常 1停用）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`si_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='服务项表';

-- ----------------------------
-- Records of service_items
-- ----------------------------

-- ----------------------------
-- Table structure for st_si_record
-- ----------------------------
DROP TABLE IF EXISTS `st_si_record`;
CREATE TABLE `st_si_record` (
  `rsi_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '记录服务和配料',
  `st_id` bigint(11) DEFAULT NULL COMMENT '服务id',
  `si_id` bigint(11) DEFAULT NULL COMMENT '服务配料id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`rsi_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='服务对应下料记录';

-- ----------------------------
-- Records of st_si_record
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(11) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '媚思嘉科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-15 08:13:38');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '媚思嘉分部', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-15 08:13:27');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '运营二', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-15 08:13:38');
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('18', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('19', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('20', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('21', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('22', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('23', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('24', '8', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('25', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('26', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('100', '0', '使用中', '0', 'service_item', null, 'default', 'Y', '0', 'admin', '2019-03-26 21:18:20', '', null, '服务项状态 使用中');
INSERT INTO `sys_dict_data` VALUES ('101', '1', '禁用', '1', 'service_item', null, 'default', 'Y', '0', 'admin', '2019-03-26 21:18:59', '', null, '服务项 禁用');
INSERT INTO `sys_dict_data` VALUES ('102', '0', '克', '0', 'product_unit', null, 'default', 'Y', '0', 'admin', '2019-03-27 16:09:44', '', null, '产品单位');
INSERT INTO `sys_dict_data` VALUES ('103', '1', '毫升', '1', 'product_unit', null, 'default', 'Y', '0', 'admin', '2019-03-27 16:10:13', '', null, '产品单位');
INSERT INTO `sys_dict_data` VALUES ('104', '2', '个', '2', 'product_unit', '2', 'default', 'Y', '0', 'admin', '2019-03-27 16:10:49', '', null, '产品单位');
INSERT INTO `sys_dict_data` VALUES ('105', '3', '滴', '3', 'product_unit', null, 'default', 'Y', '0', 'admin', '2019-03-27 16:11:30', '', null, '产品单位');
INSERT INTO `sys_dict_data` VALUES ('106', '4', '甁', '4', 'product_unit', '4', 'default', 'Y', '0', 'admin', '2019-03-27 16:12:18', '', null, '产品单位');
INSERT INTO `sys_dict_data` VALUES ('107', '5', '支', '5', 'product_unit', '5', 'default', 'Y', '0', 'admin', '2019-03-27 16:12:48', '', null, '产品单位');
INSERT INTO `sys_dict_data` VALUES ('108', '6', '包', '6', 'product_unit', '6', 'default', 'Y', '0', 'admin', '2019-03-27 16:13:09', '', null, '产品单位');
INSERT INTO `sys_dict_data` VALUES ('109', '7', '对', '7', 'product_unit', '7', 'default', 'Y', '0', 'admin', '2019-03-27 16:13:29', '', null, '产品单位');
INSERT INTO `sys_dict_data` VALUES ('110', '8', '贴', '8', 'product_unit', '8', null, 'Y', '0', 'admin', '2019-03-27 16:13:49', '', null, '产品单位');
INSERT INTO `sys_dict_data` VALUES ('111', '9', '片', '9', 'product_unit', '9', 'default', 'Y', '0', 'admin', '2019-03-27 16:14:13', '', null, '产品单位');
INSERT INTO `sys_dict_data` VALUES ('112', '10', '盒', '10', 'product_unit', '10', 'default', 'Y', '0', 'admin', '2019-03-27 16:14:36', '', null, '产品单位');
INSERT INTO `sys_dict_data` VALUES ('113', '0', '0.5小时', '0', 'room_time', '', 'default', 'Y', '0', 'admin', '2019-03-28 10:49:49', 'admin', '2019-03-28 10:50:06', '房间使用0.5小时');
INSERT INTO `sys_dict_data` VALUES ('114', '1', '1小时', '1', 'room_time', null, 'default', 'Y', '0', 'admin', '2019-03-28 10:50:34', '', null, '房间使用1小时');
INSERT INTO `sys_dict_data` VALUES ('115', '2', '1.5小时', '2', 'room_time', '', 'default', 'Y', '0', 'admin', '2019-03-28 10:51:09', 'admin', '2019-03-28 10:52:47', '房间占用1.5小时');
INSERT INTO `sys_dict_data` VALUES ('116', '3', '2小时', '3', 'room_time', '', 'default', 'Y', '0', 'admin', '2019-03-28 10:51:50', 'admin', '2019-03-28 10:52:35', '房间占用2小时');
INSERT INTO `sys_dict_data` VALUES ('117', '4', '2.5小时', '4', 'room_time', null, 'default', 'Y', '0', 'admin', '2019-03-28 10:54:44', '', null, '房间占用2.5小时');
INSERT INTO `sys_dict_data` VALUES ('118', '5', '3小时', '5', 'room_time', null, 'default', 'Y', '0', 'admin', '2019-03-28 10:55:07', '', null, '房间占用3小时');
INSERT INTO `sys_dict_data` VALUES ('119', '6', '3.5小时', '6', 'room_time', null, 'default', 'Y', '0', 'admin', '2019-03-28 10:55:45', '', null, '房间占用3.5小时');
INSERT INTO `sys_dict_data` VALUES ('120', '7', '4.5小时', '7', 'room_time', null, 'default', 'Y', '0', 'admin', '2019-03-28 10:56:10', '', null, '房间占用4小时');
INSERT INTO `sys_dict_data` VALUES ('121', '8', '5小时', '8', 'room_time', null, 'default', 'Y', '0', 'admin', '2019-03-28 10:56:45', '', null, '房间占用5小时');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('6', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('8', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('9', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('100', '服务项状态', 'service_item', '0', 'admin', '2019-03-26 21:17:00', '', null, '服务项状态');
INSERT INTO `sys_dict_type` VALUES ('101', '产品单位', 'product_unit', '0', 'admin', '2019-03-27 16:07:55', '', null, '产品单位');
INSERT INTO `sys_dict_type` VALUES ('102', '房间占用时间', 'room_time', '0', 'admin', '2019-03-28 10:48:53', '', null, '房间占用时间');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(50) DEFAULT NULL COMMENT '方法参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', 'ryTask', '系统默认（无参）', 'ryNoParams', '', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('2', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(50) DEFAULT NULL COMMENT '方法参数',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-27 09:49:28');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 09:49:36');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-27 13:29:43');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 13:29:48');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-27 13:33:14');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 13:33:18');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-27 13:50:05');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 13:50:11');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-27 14:15:11');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 14:15:19');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 14:23:08');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-27 15:16:05');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 15:16:11');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-27 16:01:06');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 16:01:12');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 16:21:01');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 17:06:06');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 17:22:25');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-27 17:23:45');
INSERT INTO `sys_logininfor` VALUES ('119', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 17:23:54');
INSERT INTO `sys_logininfor` VALUES ('120', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-27 17:23:59');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 17:24:04');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-27 17:24:28');
INSERT INTO `sys_logininfor` VALUES ('123', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 17:24:36');
INSERT INTO `sys_logininfor` VALUES ('124', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-27 17:24:56');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 17:25:01');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-27 17:25:36');
INSERT INTO `sys_logininfor` VALUES ('127', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 17:25:45');
INSERT INTO `sys_logininfor` VALUES ('128', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-27 17:26:05');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 17:26:09');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-27 17:30:26');
INSERT INTO `sys_logininfor` VALUES ('131', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 17:30:31');
INSERT INTO `sys_logininfor` VALUES ('132', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-27 17:33:04');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 17:33:11');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-27 17:34:58');
INSERT INTO `sys_logininfor` VALUES ('135', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 17:35:06');
INSERT INTO `sys_logininfor` VALUES ('136', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 17:39:51');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-03-27 17:48:29');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-03-27 17:48:35');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 17:48:41');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-03-27 17:51:17');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-03-27 17:51:24');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 17:51:28');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-28 09:54:36');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-29 09:08:11');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-29 09:08:21');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-29 09:14:01');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-03-29 09:53:49');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-29 09:53:53');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-29 10:36:05');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-30 20:19:48');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-31 10:21:28');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-31 11:36:29');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-31 11:43:06');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-31 11:43:12');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-31 13:05:50');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-31 13:10:26');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-31 13:10:32');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-31 14:15:22');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-31 14:15:57');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-31 14:17:13');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-31 14:50:21');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-31 15:32:44');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-31 15:49:55');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-31 15:49:59');
INSERT INTO `sys_logininfor` VALUES ('165', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-31 15:57:16');
INSERT INTO `sys_logininfor` VALUES ('166', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-31 16:21:16');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-03-31 16:33:27');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-31 16:33:31');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-31 17:09:32');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-03-31 17:10:27');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-31 17:10:31');
INSERT INTO `sys_logininfor` VALUES ('172', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-03-31 17:51:16');
INSERT INTO `sys_logininfor` VALUES ('173', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-31 17:51:20');
INSERT INTO `sys_logininfor` VALUES ('174', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-31 20:44:35');
INSERT INTO `sys_logininfor` VALUES ('175', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-31 21:40:09');
INSERT INTO `sys_logininfor` VALUES ('176', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-01 08:31:33');
INSERT INTO `sys_logininfor` VALUES ('177', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-02 10:53:11');
INSERT INTO `sys_logininfor` VALUES ('178', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-02 10:53:14');
INSERT INTO `sys_logininfor` VALUES ('179', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-02 11:51:49');
INSERT INTO `sys_logininfor` VALUES ('180', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-02 16:58:57');
INSERT INTO `sys_logininfor` VALUES ('181', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-02 16:59:01');
INSERT INTO `sys_logininfor` VALUES ('182', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-02 18:12:49');
INSERT INTO `sys_logininfor` VALUES ('183', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 11:17:11');
INSERT INTO `sys_logininfor` VALUES ('184', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-13 13:39:50');
INSERT INTO `sys_logininfor` VALUES ('185', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-13 13:39:53');
INSERT INTO `sys_logininfor` VALUES ('186', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-13 14:05:41');
INSERT INTO `sys_logininfor` VALUES ('187', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-13 14:08:43');
INSERT INTO `sys_logininfor` VALUES ('188', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-13 14:09:53');
INSERT INTO `sys_logininfor` VALUES ('189', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-15 08:12:13');
INSERT INTO `sys_logininfor` VALUES ('190', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-15 08:12:15');
INSERT INTO `sys_logininfor` VALUES ('191', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-15 08:18:42');
INSERT INTO `sys_logininfor` VALUES ('192', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-15 08:59:02');
INSERT INTO `sys_logininfor` VALUES ('193', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-15 09:06:29');
INSERT INTO `sys_logininfor` VALUES ('194', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-15 09:06:31');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2029 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', '#', 'M', '1', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-15 08:20:31', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', '/system/dept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', 'C', '1', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-15 08:19:46', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice', 'C', '1', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-15 08:21:07', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', '#', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', 'C', '1', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-15 08:20:02', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', '/monitor/data', 'C', '1', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-15 08:20:13', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '3', '/monitor/server', 'C', '1', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-15 08:20:21', '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '表单构建', '3', '1', '/tool/build', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('114', '代码生成', '3', '2', '/tool/gen', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('115', '系统接口', '3', '3', '/tool/swagger', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '#', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '#', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '#', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '#', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '#', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '#', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '详细信息', '500', '3', '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '任务详细', '110', '6', '#', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1055', '任务导出', '110', '7', '#', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1056', '生成查询', '114', '1', '#', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1057', '生成代码', '114', '2', '#', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('2000', '服务管理', '0', '4', '#', 'M', '0', null, 'fa fa-home', 'admin', '2019-03-26 21:03:28', '', null, '');
INSERT INTO `sys_menu` VALUES ('2001', '服务项', '2000', '1', '/item/serviceItems', 'C', '0', 'item:serviceItems:view', '#', 'admin', '2019-03-26 21:06:04', 'admin', '2019-03-27 15:26:47', '');
INSERT INTO `sys_menu` VALUES ('2002', '导出服务', '2001', '1', '#', 'F', '0', 'item:serviceItems:export', '#', 'admin', '2019-03-26 21:07:22', '', null, '');
INSERT INTO `sys_menu` VALUES ('2003', '新增服务', '2001', '2', '#', 'F', '0', 'item:serviceItems:add', '#', 'admin', '2019-03-26 21:07:48', '', null, '');
INSERT INTO `sys_menu` VALUES ('2004', '修改服务', '2001', '3', '#', 'F', '0', 'item:serviceItems:edit', '#', 'admin', '2019-03-26 21:08:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('2005', '删除服务', '2001', '4', '#', 'F', '0', 'item:serviceItems:remove', '#', 'admin', '2019-03-26 21:08:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2006', '房间管理', '0', '6', '#', 'M', '0', null, 'fa fa-university', 'admin', '2019-03-27 13:17:15', '', null, '');
INSERT INTO `sys_menu` VALUES ('2007', '房间列表', '2006', '1', '/room/room', 'C', '0', 'room:room:view', '#', 'admin', '2019-03-27 13:19:22', '', null, '');
INSERT INTO `sys_menu` VALUES ('2008', '新增房间', '2007', '1', '#', 'F', '0', 'room:room:add', '#', 'admin', '2019-03-27 13:21:19', '', null, '');
INSERT INTO `sys_menu` VALUES ('2009', '修改房间', '2007', '2', '#', 'F', '0', 'room:room:edit', '#', 'admin', '2019-03-27 13:22:00', '', null, '');
INSERT INTO `sys_menu` VALUES ('2010', '删除房间', '2007', '3', '#', 'F', '0', 'room:room:remove', '#', 'admin', '2019-03-27 13:22:33', '', null, '');
INSERT INTO `sys_menu` VALUES ('2011', '导出房间', '2007', '4', '#', 'F', '0', 'room:room:export', '#', 'admin', '2019-03-27 13:23:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('2012', '服务配料', '2000', '2', '/item/serviceIngredients', 'C', '0', 'item:serviceIngredients:view', '#', 'admin', '2019-03-27 16:02:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('2013', '导出服务项配料', '2012', '1', '#', 'F', '0', 'item:serviceIngredients:export', '#', 'admin', '2019-03-27 16:02:55', '', null, '');
INSERT INTO `sys_menu` VALUES ('2014', '新增服务项配料', '2012', '2', '#', 'F', '0', 'item:serviceIngredients:add', '#', 'admin', '2019-03-27 16:03:30', '', null, '');
INSERT INTO `sys_menu` VALUES ('2015', '修改服务项配料', '2012', '3', '#', 'F', '0', 'item:serviceIngredients:edit', '#', 'admin', '2019-03-27 16:04:00', '', null, '');
INSERT INTO `sys_menu` VALUES ('2016', '删除服务项配料', '2012', '4', '#', 'F', '0', 'item:serviceIngredients:remove', '#', 'admin', '2019-03-27 16:04:27', '', null, '');
INSERT INTO `sys_menu` VALUES ('2017', '展示列表', '2007', '5', '#', 'F', '0', 'room:room:list', '#', 'admin', '2019-03-27 17:28:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('2018', '服务项列表', '2001', '5', '#', 'F', '0', 'item:serviceItems:list', '#', 'admin', '2019-03-27 17:28:55', 'admin', '2019-03-27 17:29:26', '');
INSERT INTO `sys_menu` VALUES ('2019', '服务配料列表', '2012', '5', '#', 'F', '0', 'item:serviceIngredients:list', '#', 'admin', '2019-03-27 17:30:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('2020', '统计管理', '0', '7', '#', 'M', '0', null, 'fa fa-credit-card-alt', 'admin', '2019-03-28 10:41:55', '', null, '');
INSERT INTO `sys_menu` VALUES ('2021', '消耗记录', '2020', '1', '/record/record', 'C', '0', 'record:record:view', '#', 'admin', '2019-03-28 10:43:19', '', null, '');
INSERT INTO `sys_menu` VALUES ('2022', '消耗记录列表', '2021', '1', '#', 'F', '0', 'record:record:list', '#', 'admin', '2019-03-28 10:44:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('2023', '导出消耗记录', '2021', '2', '#', 'F', '0', 'record:record:export', '#', 'admin', '2019-03-28 10:44:59', 'admin', '2019-03-28 10:47:33', '');
INSERT INTO `sys_menu` VALUES ('2024', '新增消耗记录', '2021', '3', '#', 'F', '0', 'record:record:add', '#', 'admin', '2019-03-28 10:46:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('2025', '修改消耗记录', '2021', '4', '#', 'F', '0', 'record:record:edit', '#', 'admin', '2019-03-28 10:46:46', '', null, '');
INSERT INTO `sys_menu` VALUES ('2026', '删除消耗记录', '2021', '5', '#', 'F', '0', 'record:record:remove', '#', 'admin', '2019-03-28 10:47:16', '', null, '');
INSERT INTO `sys_menu` VALUES ('2028', '配料统计', '2020', '1', '/record/stSiRecord', 'C', '0', 'record:stSiRecord:view', '#', 'admin', '2019-04-01 16:17:30', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', '1', 'admin', '总部', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"2\" ],\r\n  \"roleName\" : [ \"顾问\" ],\r\n  \"roleKey\" : [ \"consultant\" ],\r\n  \"roleSort\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"顾问角色\" ],\r\n  \"menuIds\" : [ \"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115\" ]\r\n}', '0', null, '2019-03-26 20:24:13');
INSERT INTO `sys_oper_log` VALUES ('101', '角色管理', '1', 'com.ruoyi.web.controller.system.SysRoleController.addSave()', '1', 'admin', '总部', '/system/role/add', '127.0.0.1', '内网IP', '{\r\n  \"roleName\" : [ \"美容师\" ],\r\n  \"roleKey\" : [ \"beautician\" ],\r\n  \"roleSort\" : [ \"3\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"美容师角色\" ],\r\n  \"menuIds\" : [ \"\" ]\r\n}', '0', null, '2019-03-26 20:25:03');
INSERT INTO `sys_oper_log` VALUES ('102', '角色管理', '1', 'com.ruoyi.web.controller.system.SysRoleController.addSave()', '1', 'admin', '总部', '/system/role/add', '127.0.0.1', '内网IP', '{\r\n  \"roleName\" : [ \"配料师\" ],\r\n  \"roleKey\" : [ \"ingredients\" ],\r\n  \"roleSort\" : [ \"4\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"配料师角色\" ],\r\n  \"menuIds\" : [ \"\" ]\r\n}', '0', null, '2019-03-26 20:26:11');
INSERT INTO `sys_oper_log` VALUES ('103', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', '1', 'admin', '总部', '/tool/gen/genCode/service_items', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-26 20:37:47');
INSERT INTO `sys_oper_log` VALUES ('104', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', '1', 'admin', '总部', '/tool/gen/genCode/service_items', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-26 20:41:22');
INSERT INTO `sys_oper_log` VALUES ('105', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '总部', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"服务管理\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"fa fa-home\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-26 21:03:28');
INSERT INTO `sys_oper_log` VALUES ('106', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '总部', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2000\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"服务列表\" ],\r\n  \"url\" : [ \"/item/serviceItems\" ],\r\n  \"perms\" : [ \"item:serviceItems:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-26 21:06:04');
INSERT INTO `sys_oper_log` VALUES ('107', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '总部', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2001\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"导出服务\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"item:serviceItems:export\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-26 21:07:22');
INSERT INTO `sys_oper_log` VALUES ('108', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '总部', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2001\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"新增服务\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"item:serviceItems:add\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-26 21:07:48');
INSERT INTO `sys_oper_log` VALUES ('109', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '总部', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2001\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"修改服务\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"item:serviceItems:edit\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-26 21:08:17');
INSERT INTO `sys_oper_log` VALUES ('110', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '总部', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2001\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"删除服务\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"item:serviceItems:remove\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-26 21:08:51');
INSERT INTO `sys_oper_log` VALUES ('111', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', '1', 'admin', '总部', '/system/dict/add', '127.0.0.1', '内网IP', '{\r\n  \"dictName\" : [ \"服务项状态\" ],\r\n  \"dictType\" : [ \"service_item\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"服务项状态\" ]\r\n}', '0', null, '2019-03-26 21:17:01');
INSERT INTO `sys_oper_log` VALUES ('112', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '总部', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"使用中\" ],\r\n  \"dictValue\" : [ \"0\" ],\r\n  \"dictType\" : [ \"service_item\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"0\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"服务项状态   使用中\" ]\r\n}', '0', null, '2019-03-26 21:18:20');
INSERT INTO `sys_oper_log` VALUES ('113', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '总部', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"禁用\" ],\r\n  \"dictValue\" : [ \"1\" ],\r\n  \"dictType\" : [ \"service_item\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"服务项  禁用\" ]\r\n}', '0', null, '2019-03-26 21:19:00');
INSERT INTO `sys_oper_log` VALUES ('114', '服务项', '1', 'com.ruoyi.web.controller.item.ServiceItemsController.addSave()', '1', 'admin', '总部', '/item/serviceItems/add', '127.0.0.1', '内网IP', '{\r\n  \"siName\" : [ \"A类服务而\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '1', '', '2019-03-27 08:29:34');
INSERT INTO `sys_oper_log` VALUES ('115', '服务项', '1', 'com.ruoyi.web.controller.item.ServiceItemsController.addSave()', '1', 'admin', '总部', '/item/serviceItems/add', '127.0.0.1', '内网IP', '{\r\n  \"siName\" : [ \"A类服务而\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '1', '', '2019-03-27 08:30:12');
INSERT INTO `sys_oper_log` VALUES ('116', '服务项', '1', 'com.ruoyi.web.controller.item.ServiceItemsController.addSave()', '1', 'admin', '总部', '/item/serviceItems/add', '127.0.0.1', '内网IP', '{\r\n  \"siName\" : [ \"A服务项\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '1', '', '2019-03-27 08:54:13');
INSERT INTO `sys_oper_log` VALUES ('117', '服务项', '1', 'com.ruoyi.web.controller.item.ServiceItemsController.addSave()', '1', 'admin', '总部', '/item/serviceItems/add', '127.0.0.1', '内网IP', '{\r\n  \"siName\" : [ \"1111\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '1', '', '2019-03-27 09:32:40');
INSERT INTO `sys_oper_log` VALUES ('118', '服务项', '1', 'com.ruoyi.web.controller.item.ServiceItemsController.addSave()', '1', 'admin', '总部', '/item/serviceItems/add', '127.0.0.1', '内网IP', '{\r\n  \"siName\" : [ \"1111\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '1', '', '2019-03-27 09:33:49');
INSERT INTO `sys_oper_log` VALUES ('119', '服务项', '1', 'com.ruoyi.web.controller.item.ServiceItemsController.addSave()', '1', 'admin', '总部', '/item/serviceItems/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"100\" ],\r\n  \"siName\" : [ \"收到\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 09:39:13');
INSERT INTO `sys_oper_log` VALUES ('120', '服务项', '1', 'com.ruoyi.web.controller.item.ServiceItemsController.addSave()', '1', 'admin', '总部', '/item/serviceItems/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"100\" ],\r\n  \"siName\" : [ \"去去去\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 09:40:28');
INSERT INTO `sys_oper_log` VALUES ('121', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', '1', 'admin', '研发部门', '/tool/gen/genCode/room', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-27 11:58:58');
INSERT INTO `sys_oper_log` VALUES ('122', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', '1', 'admin', '研发部门', '/tool/gen/genCode/room', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-27 12:00:54');
INSERT INTO `sys_oper_log` VALUES ('123', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"房间管理\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"6\" ],\r\n  \"icon\" : [ \"fa fa-university\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 13:17:15');
INSERT INTO `sys_oper_log` VALUES ('124', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"房间列表\" ],\r\n  \"url\" : [ \"/room/room\" ],\r\n  \"perms\" : [ \"room:room:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 13:19:22');
INSERT INTO `sys_oper_log` VALUES ('125', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2007\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"新增房间\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"room:room:add\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 13:21:19');
INSERT INTO `sys_oper_log` VALUES ('126', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2007\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"修改房间\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"room:room:edit\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 13:22:00');
INSERT INTO `sys_oper_log` VALUES ('127', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2007\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"删除房间\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"room:room:remove\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 13:22:33');
INSERT INTO `sys_oper_log` VALUES ('128', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2007\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"导出房间\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"room:room:export\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 13:23:14');
INSERT INTO `sys_oper_log` VALUES ('129', '服务项', '1', 'com.ruoyi.web.controller.item.ServiceItemsController.addSave()', '1', 'admin', '研发部门', '/item/serviceItems/add', '127.0.0.1', '内网IP', '{\r\n  \"siName\" : [ \"B\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 14:17:19');
INSERT INTO `sys_oper_log` VALUES ('130', '服务项', '2', 'com.ruoyi.web.controller.item.ServiceItemsController.editSave()', '1', 'admin', '研发部门', '/item/serviceItems/edit', '127.0.0.1', '内网IP', '{\r\n  \"siId\" : [ \"102\" ],\r\n  \"siName\" : [ \"B\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 14:17:40');
INSERT INTO `sys_oper_log` VALUES ('131', '美容房间', '1', 'com.ruoyi.web.controller.room.RoomController.addSave()', '1', 'admin', '研发部门', '/room/room/add', '127.0.0.1', '内网IP', '{\r\n  \"roName\" : [ \"红红火火\" ],\r\n  \"state\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 15:03:04');
INSERT INTO `sys_oper_log` VALUES ('132', '美容房间', '1', 'com.ruoyi.web.controller.room.RoomController.addSave()', '1', 'admin', '研发部门', '/room/room/add', '127.0.0.1', '内网IP', '{\r\n  \"roName\" : [ \"红绿\" ],\r\n  \"state\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 15:04:34');
INSERT INTO `sys_oper_log` VALUES ('133', '美容房间', '1', 'com.ruoyi.web.controller.room.RoomController.addSave()', '1', 'admin', '研发部门', '/room/room/add', '127.0.0.1', '内网IP', '{\r\n  \"roName\" : [ \"是多少\" ],\r\n  \"state\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 15:05:28');
INSERT INTO `sys_oper_log` VALUES ('134', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2001\" ],\r\n  \"parentId\" : [ \"2000\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"服务项\" ],\r\n  \"url\" : [ \"/item/serviceItems\" ],\r\n  \"perms\" : [ \"item:serviceItems:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 15:26:47');
INSERT INTO `sys_oper_log` VALUES ('135', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', '1', 'admin', '研发部门', '/tool/gen/genCode/service_ingredients', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-27 15:53:37');
INSERT INTO `sys_oper_log` VALUES ('136', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2000\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"服务配料\" ],\r\n  \"url\" : [ \"/item/serviceIngredients\" ],\r\n  \"perms\" : [ \"item:serviceIngredients:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 16:02:14');
INSERT INTO `sys_oper_log` VALUES ('137', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2012\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"导出服务项配料\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"item:serviceIngredients:export\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 16:02:55');
INSERT INTO `sys_oper_log` VALUES ('138', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2012\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"新增服务项配料\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"item:serviceIngredients:add\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 16:03:30');
INSERT INTO `sys_oper_log` VALUES ('139', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2012\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"修改服务项配料\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"item:serviceIngredients:edit\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 16:04:00');
INSERT INTO `sys_oper_log` VALUES ('140', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2012\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"删除服务项配料\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"item:serviceIngredients:remove\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 16:04:27');
INSERT INTO `sys_oper_log` VALUES ('141', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\r\n  \"dictName\" : [ \"产品单位\" ],\r\n  \"dictType\" : [ \"product_unit\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"产品单位\" ]\r\n}', '0', null, '2019-03-27 16:07:55');
INSERT INTO `sys_oper_log` VALUES ('142', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"克\" ],\r\n  \"dictValue\" : [ \"0\" ],\r\n  \"dictType\" : [ \"product_unit\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"0\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"产品单位\" ]\r\n}', '0', null, '2019-03-27 16:09:44');
INSERT INTO `sys_oper_log` VALUES ('143', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"毫升\" ],\r\n  \"dictValue\" : [ \"1\" ],\r\n  \"dictType\" : [ \"product_unit\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"产品单位\" ]\r\n}', '0', null, '2019-03-27 16:10:13');
INSERT INTO `sys_oper_log` VALUES ('144', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"个\" ],\r\n  \"dictValue\" : [ \"2\" ],\r\n  \"dictType\" : [ \"product_unit\" ],\r\n  \"cssClass\" : [ \"2\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"产品单位\" ]\r\n}', '0', null, '2019-03-27 16:10:49');
INSERT INTO `sys_oper_log` VALUES ('145', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"滴\" ],\r\n  \"dictValue\" : [ \"3\" ],\r\n  \"dictType\" : [ \"product_unit\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"3\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"产品单位\" ]\r\n}', '0', null, '2019-03-27 16:11:30');
INSERT INTO `sys_oper_log` VALUES ('146', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"甁\" ],\r\n  \"dictValue\" : [ \"4\" ],\r\n  \"dictType\" : [ \"product_unit\" ],\r\n  \"cssClass\" : [ \"4\" ],\r\n  \"dictSort\" : [ \"4\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"产品单位\" ]\r\n}', '0', null, '2019-03-27 16:12:18');
INSERT INTO `sys_oper_log` VALUES ('147', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"支\" ],\r\n  \"dictValue\" : [ \"5\" ],\r\n  \"dictType\" : [ \"product_unit\" ],\r\n  \"cssClass\" : [ \"5\" ],\r\n  \"dictSort\" : [ \"5\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"产品单位\" ]\r\n}', '0', null, '2019-03-27 16:12:49');
INSERT INTO `sys_oper_log` VALUES ('148', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"包\" ],\r\n  \"dictValue\" : [ \"6\" ],\r\n  \"dictType\" : [ \"product_unit\" ],\r\n  \"cssClass\" : [ \"6\" ],\r\n  \"dictSort\" : [ \"6\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"产品单位\" ]\r\n}', '0', null, '2019-03-27 16:13:09');
INSERT INTO `sys_oper_log` VALUES ('149', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"对\" ],\r\n  \"dictValue\" : [ \"7\" ],\r\n  \"dictType\" : [ \"product_unit\" ],\r\n  \"cssClass\" : [ \"7\" ],\r\n  \"dictSort\" : [ \"7\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"产品单位\" ]\r\n}', '0', null, '2019-03-27 16:13:29');
INSERT INTO `sys_oper_log` VALUES ('150', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"贴\" ],\r\n  \"dictValue\" : [ \"8\" ],\r\n  \"dictType\" : [ \"product_unit\" ],\r\n  \"cssClass\" : [ \"8\" ],\r\n  \"dictSort\" : [ \"8\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"产品单位\" ]\r\n}', '0', null, '2019-03-27 16:13:49');
INSERT INTO `sys_oper_log` VALUES ('151', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"片\" ],\r\n  \"dictValue\" : [ \"9\" ],\r\n  \"dictType\" : [ \"product_unit\" ],\r\n  \"cssClass\" : [ \"9\" ],\r\n  \"dictSort\" : [ \"9\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"产品单位\" ]\r\n}', '0', null, '2019-03-27 16:14:13');
INSERT INTO `sys_oper_log` VALUES ('152', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"盒\" ],\r\n  \"dictValue\" : [ \"10\" ],\r\n  \"dictType\" : [ \"product_unit\" ],\r\n  \"cssClass\" : [ \"10\" ],\r\n  \"dictSort\" : [ \"10\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"产品单位\" ]\r\n}', '0', null, '2019-03-27 16:14:36');
INSERT INTO `sys_oper_log` VALUES ('153', '服务项配料', '1', 'com.ruoyi.web.controller.item.ServiceIngredientsController.addSave()', '1', 'admin', '研发部门', '/item/serviceIngredients/add', '127.0.0.1', '内网IP', '{\r\n  \"smNo\" : [ \"A001\" ],\r\n  \"smName\" : [ \"油\" ],\r\n  \"smUnit\" : [ \"0\" ],\r\n  \"smNum\" : [ \"1\" ],\r\n  \"stId\" : [ \"100\" ],\r\n  \"createTime\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-03-27 16:28:00');
INSERT INTO `sys_oper_log` VALUES ('154', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"2\" ],\r\n  \"deptId\" : [ \"105\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"dept.deptName\" : [ \"测试部门\" ],\r\n  \"phonenumber\" : [ \"15666666666\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"loginName\" : [ \"ry\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"1\", \"2\" ],\r\n  \"remark\" : [ \"测试员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1,2\" ],\r\n  \"postIds\" : [ \"2\" ]\r\n}', '0', null, '2019-03-27 17:23:31');
INSERT INTO `sys_oper_log` VALUES ('155', '重置密码', '2', 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', '1', 'admin', '研发部门', '/system/user/resetPwd/2', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-27 17:23:34');
INSERT INTO `sys_oper_log` VALUES ('156', '重置密码', '2', 'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()', '1', 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"2\" ],\r\n  \"loginName\" : [ \"ry\" ],\r\n  \"password\" : [ \"123456\" ]\r\n}', '0', null, '2019-03-27 17:23:41');
INSERT INTO `sys_oper_log` VALUES ('157', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"1\" ],\r\n  \"roleName\" : [ \"管理员\" ],\r\n  \"roleKey\" : [ \"admin\" ],\r\n  \"roleSort\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"管理员\" ],\r\n  \"menuIds\" : [ \"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115,2000,2001,2002,2003,2004,2005,2012,2013,2014,2015,2016,2006,2007,2008,2009,2010,2011\" ]\r\n}', '0', null, '2019-03-27 17:24:19');
INSERT INTO `sys_oper_log` VALUES ('158', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"2\" ],\r\n  \"deptId\" : [ \"105\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"dept.deptName\" : [ \"测试部门\" ],\r\n  \"phonenumber\" : [ \"15666666666\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"loginName\" : [ \"ry\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"1\" ],\r\n  \"remark\" : [ \"测试员\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"1\" ],\r\n  \"postIds\" : [ \"2\" ]\r\n}', '0', null, '2019-03-27 17:25:34');
INSERT INTO `sys_oper_log` VALUES ('159', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2007\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"展示列表\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"room:room:list\" ],\r\n  \"orderNum\" : [ \"5\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 17:28:16');
INSERT INTO `sys_oper_log` VALUES ('160', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2001\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"服务项列表\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"item:serviceIngredients:list\" ],\r\n  \"orderNum\" : [ \"5\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 17:28:55');
INSERT INTO `sys_oper_log` VALUES ('161', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2018\" ],\r\n  \"parentId\" : [ \"2001\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"服务项列表\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"item:serviceItems:list\" ],\r\n  \"orderNum\" : [ \"5\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 17:29:26');
INSERT INTO `sys_oper_log` VALUES ('162', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2012\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"服务配料列表\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"item:serviceIngredients:list\" ],\r\n  \"orderNum\" : [ \"5\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 17:30:09');
INSERT INTO `sys_oper_log` VALUES ('163', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"1\" ],\r\n  \"roleName\" : [ \"管理员\" ],\r\n  \"roleKey\" : [ \"admin\" ],\r\n  \"roleSort\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"管理员\" ],\r\n  \"menuIds\" : [ \"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115,2000,2001,2002,2003,2004,2005,2018,2012,2013,2014,2015,2016,2019,2006,2007,2008,2009,2010,2011,2017\" ]\r\n}', '0', null, '2019-03-27 17:30:24');
INSERT INTO `sys_oper_log` VALUES ('164', '服务项', '1', 'com.ruoyi.web.controller.item.ServiceItemsController.addSave()', '1', 'ry', '测试部门', '/item/serviceItems/add', '127.0.0.1', '内网IP', '{\r\n  \"siName\" : [ \"B\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 17:30:56');
INSERT INTO `sys_oper_log` VALUES ('165', '服务项', '2', 'com.ruoyi.web.controller.item.ServiceItemsController.editSave()', '1', 'ry', '测试部门', '/item/serviceItems/edit', '127.0.0.1', '内网IP', '{\r\n  \"siId\" : [ \"103\" ],\r\n  \"siName\" : [ \"C\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 17:31:04');
INSERT INTO `sys_oper_log` VALUES ('166', '美容房间', '1', 'com.ruoyi.web.controller.room.RoomController.addSave()', '1', 'ry', '测试部门', '/room/room/add', '127.0.0.1', '内网IP', '{\r\n  \"roName\" : [ \"黄\" ],\r\n  \"state\" : [ \"0\" ]\r\n}', '0', null, '2019-03-27 17:32:11');
INSERT INTO `sys_oper_log` VALUES ('167', '服务项', '1', 'com.ruoyi.web.controller.item.ServiceItemsController.addSave()', '1', 'admin', '研发部门', '/item/serviceItems/add', '127.0.0.1', '内网IP', '{\r\n  \"siName\" : [ \"EB舒缓\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"status\" : [ \"\" ]\r\n}', '0', null, '2019-03-27 17:53:41');
INSERT INTO `sys_oper_log` VALUES ('168', '服务项配料', '1', 'com.ruoyi.web.controller.item.ServiceIngredientsController.addSave()', '1', 'admin', '研发部门', '/item/serviceIngredients/add', '127.0.0.1', '内网IP', '{\r\n  \"smNo\" : [ \"A002\" ],\r\n  \"smName\" : [ \"xx水\" ],\r\n  \"stId\" : [ \"0\", \"104\" ],\r\n  \"smNum\" : [ \"100\" ],\r\n  \"createTime\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-03-28 10:03:21');
INSERT INTO `sys_oper_log` VALUES ('169', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', '1', 'admin', '研发部门', '/tool/gen/genCode/record', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-28 10:36:01');
INSERT INTO `sys_oper_log` VALUES ('170', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"统计管理\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"7\" ],\r\n  \"icon\" : [ \"fa fa-credit-card-alt\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-28 10:41:55');
INSERT INTO `sys_oper_log` VALUES ('171', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2020\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"消耗记录\" ],\r\n  \"url\" : [ \"/record/record\" ],\r\n  \"perms\" : [ \"record:record:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-28 10:43:19');
INSERT INTO `sys_oper_log` VALUES ('172', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2021\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"消耗记录列表\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"record:record:list\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-28 10:44:12');
INSERT INTO `sys_oper_log` VALUES ('173', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2021\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"导出消耗记录列表\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"record:record:export\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-28 10:44:59');
INSERT INTO `sys_oper_log` VALUES ('174', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2021\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"新增消耗记录\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"record:record:add\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-28 10:46:09');
INSERT INTO `sys_oper_log` VALUES ('175', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2021\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"修改消耗记录\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"record:record:edit\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-28 10:46:46');
INSERT INTO `sys_oper_log` VALUES ('176', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2021\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"删除消耗记录\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"record:record:remove\" ],\r\n  \"orderNum\" : [ \"5\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-28 10:47:16');
INSERT INTO `sys_oper_log` VALUES ('177', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2023\" ],\r\n  \"parentId\" : [ \"2021\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"导出消耗记录\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"record:record:export\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-28 10:47:33');
INSERT INTO `sys_oper_log` VALUES ('178', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\r\n  \"dictName\" : [ \"房间占用时间\" ],\r\n  \"dictType\" : [ \"room_time\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"房间占用时间 \" ]\r\n}', '0', null, '2019-03-28 10:48:53');
INSERT INTO `sys_oper_log` VALUES ('179', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"0.5小时\" ],\r\n  \"dictValue\" : [ \"0\" ],\r\n  \"dictType\" : [ \"room_time\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"0\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-03-28 10:49:49');
INSERT INTO `sys_oper_log` VALUES ('180', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\r\n  \"dictCode\" : [ \"113\" ],\r\n  \"dictLabel\" : [ \"0.5小时\" ],\r\n  \"dictValue\" : [ \"0\" ],\r\n  \"dictType\" : [ \"room_time\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"0\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"房间使用0.5小时\" ]\r\n}', '0', null, '2019-03-28 10:50:06');
INSERT INTO `sys_oper_log` VALUES ('181', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"1小时\" ],\r\n  \"dictValue\" : [ \"1\" ],\r\n  \"dictType\" : [ \"room_time\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"房间使用1小时\" ]\r\n}', '0', null, '2019-03-28 10:50:34');
INSERT INTO `sys_oper_log` VALUES ('182', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"2小时\" ],\r\n  \"dictValue\" : [ \"2\" ],\r\n  \"dictType\" : [ \"room_time\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"房间占用2小时\" ]\r\n}', '0', null, '2019-03-28 10:51:10');
INSERT INTO `sys_oper_log` VALUES ('183', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\r\n  \"dictCode\" : [ \"115\" ],\r\n  \"dictLabel\" : [ \"2小时\" ],\r\n  \"dictValue\" : [ \"3\" ],\r\n  \"dictType\" : [ \"room_time\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"3\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"房间占用2小时\" ]\r\n}', '0', null, '2019-03-28 10:51:28');
INSERT INTO `sys_oper_log` VALUES ('184', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"1.5小时\" ],\r\n  \"dictValue\" : [ \"2\" ],\r\n  \"dictType\" : [ \"room_time\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-03-28 10:51:50');
INSERT INTO `sys_oper_log` VALUES ('185', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\r\n  \"dictCode\" : [ \"115\" ],\r\n  \"dictLabel\" : [ \"1.5小时\" ],\r\n  \"dictValue\" : [ \"2\" ],\r\n  \"dictType\" : [ \"room_time\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"房间占用2小时\" ]\r\n}', '0', null, '2019-03-28 10:52:20');
INSERT INTO `sys_oper_log` VALUES ('186', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\r\n  \"dictCode\" : [ \"116\" ],\r\n  \"dictLabel\" : [ \"2小时\" ],\r\n  \"dictValue\" : [ \"3\" ],\r\n  \"dictType\" : [ \"room_time\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"3\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"房间占用2小时\" ]\r\n}', '0', null, '2019-03-28 10:52:35');
INSERT INTO `sys_oper_log` VALUES ('187', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\r\n  \"dictCode\" : [ \"115\" ],\r\n  \"dictLabel\" : [ \"1.5小时\" ],\r\n  \"dictValue\" : [ \"2\" ],\r\n  \"dictType\" : [ \"room_time\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"房间占用1.5小时\" ]\r\n}', '0', null, '2019-03-28 10:52:47');
INSERT INTO `sys_oper_log` VALUES ('188', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"2.5小时\" ],\r\n  \"dictValue\" : [ \"4\" ],\r\n  \"dictType\" : [ \"room_time\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"4\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"房间占用2.5小时\" ]\r\n}', '0', null, '2019-03-28 10:54:44');
INSERT INTO `sys_oper_log` VALUES ('189', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"3小时\" ],\r\n  \"dictValue\" : [ \"5\" ],\r\n  \"dictType\" : [ \"room_time\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"5\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"房间占用3小时\" ]\r\n}', '0', null, '2019-03-28 10:55:07');
INSERT INTO `sys_oper_log` VALUES ('190', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"3.5小时\" ],\r\n  \"dictValue\" : [ \"6\" ],\r\n  \"dictType\" : [ \"room_time\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"6\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"房间占用3.5小时\" ]\r\n}', '0', null, '2019-03-28 10:55:45');
INSERT INTO `sys_oper_log` VALUES ('191', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"4.5小时\" ],\r\n  \"dictValue\" : [ \"7\" ],\r\n  \"dictType\" : [ \"room_time\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"7\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"房间占用4小时\" ]\r\n}', '0', null, '2019-03-28 10:56:10');
INSERT INTO `sys_oper_log` VALUES ('192', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"5小时\" ],\r\n  \"dictValue\" : [ \"8\" ],\r\n  \"dictType\" : [ \"room_time\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"8\" ],\r\n  \"listClass\" : [ \"default\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"房间占用5小时\" ]\r\n}', '0', null, '2019-03-28 10:56:45');
INSERT INTO `sys_oper_log` VALUES ('193', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.addSave()', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"105\" ],\r\n  \"userName\" : [ \"孙丽\" ],\r\n  \"deptName\" : [ \"测试部门\" ],\r\n  \"phonenumber\" : [ \"18833424134\" ],\r\n  \"email\" : [ \"sun18833424134@163.com\" ],\r\n  \"loginName\" : [ \"sunli\" ],\r\n  \"password\" : [ \"admin123\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"4\" ]\r\n}', '0', null, '2019-03-30 20:20:46');
INSERT INTO `sys_oper_log` VALUES ('194', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.addSave()', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"105\" ],\r\n  \"userName\" : [ \"孙瑞娜\" ],\r\n  \"deptName\" : [ \"测试部门\" ],\r\n  \"phonenumber\" : [ \"18132927768\" ],\r\n  \"email\" : [ \"18132927768@163.com\" ],\r\n  \"loginName\" : [ \"sunruina\" ],\r\n  \"password\" : [ \"admin123\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"role\" : [ \"100\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"100\" ],\r\n  \"postIds\" : [ \"4\" ]\r\n}', '0', null, '2019-03-30 21:12:10');
INSERT INTO `sys_oper_log` VALUES ('195', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', 'admin', '研发部门', '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"张三\" ],\r\n  \"gkNum\" : [ \"A001\" ],\r\n  \"roomId\" : [ \"1\" ],\r\n  \"roomTime\" : [ \"1\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"100\" ],\r\n  \"siId1\" : [ \"104\" ],\r\n  \"a\" : [ \"A002 , xx水 , 100 ; \" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-03-30 21:15:50');
INSERT INTO `sys_oper_log` VALUES ('196', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', 'admin', '研发部门', '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"张三\" ],\r\n  \"gkNum\" : [ \"A001\" ],\r\n  \"roomId\" : [ \"1\" ],\r\n  \"roomTime\" : [ \"1\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"100\" ],\r\n  \"siId1\" : [ \"104\" ],\r\n  \"siId2\" : [ \"104\" ],\r\n  \"siId3\" : [ \"102\" ],\r\n  \"a\" : [ \"A002 , xx水 , 100 ; \" ],\r\n  \"b\" : [ \"A002 , xx水 , 100 ; \" ],\r\n  \"c\" : [ \"A001 , 油 , 1 ; \" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-03-31 09:11:15');
INSERT INTO `sys_oper_log` VALUES ('197', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', 'admin', '研发部门', '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"张三\" ],\r\n  \"gkNum\" : [ \"A001\" ],\r\n  \"roomId\" : [ \"1\" ],\r\n  \"roomTime\" : [ \"1\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"100\" ],\r\n  \"siId1\" : [ \"104\" ],\r\n  \"siId2\" : [ \"104\" ],\r\n  \"siId3\" : [ \"104\" ],\r\n  \"a\" : [ \"A002 , xx水 , 100 ; \" ],\r\n  \"b\" : [ \"A002 , xx水 , 100 ; \" ],\r\n  \"c\" : [ \"A002 , xx水 , 100 ; \" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a\' in \'field list\'\r\n### The error may involve com.ruoyi.record.mapper.RecordMapper.insertRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into record    ( gk_name,    gk_num,    room_id,    room_time,    mrs_id,    gw_id,            create_time,                              si_id2,             si_id3,             a,             b,             c )           values ( ?,    ?,    ?,    ?,    ?,    ?,        ?,                              ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'a\' in \'field list\'', '2019-03-31 09:13:06');
INSERT INTO `sys_oper_log` VALUES ('198', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', 'admin', '研发部门', '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"张三\" ],\r\n  \"gkNum\" : [ \"A001\" ],\r\n  \"roomId\" : [ \"1\" ],\r\n  \"roomTime\" : [ \"1\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"100\" ],\r\n  \"siId1\" : [ \"104\" ],\r\n  \"siId2\" : [ \"104\" ],\r\n  \"siId3\" : [ \"104\" ],\r\n  \"a\" : [ \"A002 , xx水 , 100 ; \" ],\r\n  \"b\" : [ \"A002 , xx水 , 100 ; \" ],\r\n  \"c\" : [ \"A002 , xx水 , 100 ; \" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a\' in \'field list\'\r\n### The error may involve com.ruoyi.record.mapper.RecordMapper.insertRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into record    ( gk_name,    gk_num,    room_id,    room_time,    mrs_id,    gw_id,            create_time,                              si_id2,             si_id3,             a,             b,             c )           values ( ?,    ?,    ?,    ?,    ?,    ?,        ?,                              ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'a\' in \'field list\'', '2019-03-31 09:15:36');
INSERT INTO `sys_oper_log` VALUES ('199', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', 'admin', '研发部门', '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"张三\" ],\r\n  \"gkNum\" : [ \"A001\" ],\r\n  \"roomId\" : [ \"1\" ],\r\n  \"roomTime\" : [ \"1\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"100\" ],\r\n  \"siId1\" : [ \"104\" ],\r\n  \"siId2\" : [ \"104\" ],\r\n  \"siId3\" : [ \"104\" ],\r\n  \"a\" : [ \"A002 , xx水 , 100 ; \" ],\r\n  \"b\" : [ \"A002 , xx水 , 100 ; \" ],\r\n  \"c\" : [ \"A002 , xx水 , 100 ; \" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a\' in \'field list\'\r\n### The error may involve com.ruoyi.record.mapper.RecordMapper.insertRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into record    ( gk_name,    gk_num,    room_id,    room_time,    mrs_id,    gw_id,            create_time,                              si_id2,             si_id3,             a,             b,             c )           values ( ?,    ?,    ?,    ?,    ?,    ?,        ?,                              ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'a\' in \'field list\'', '2019-03-31 09:15:47');
INSERT INTO `sys_oper_log` VALUES ('200', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', 'admin', '研发部门', '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"张三\" ],\r\n  \"gkNum\" : [ \"A001\" ],\r\n  \"roomId\" : [ \"1\" ],\r\n  \"roomTime\" : [ \"1\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"100\" ],\r\n  \"siId\" : [ \"104\" ],\r\n  \"siId2\" : [ \"104\" ],\r\n  \"siId3\" : [ \"102\" ],\r\n  \"a\" : [ \"A002 , xx水 , 100 ; \" ],\r\n  \"b\" : [ \"A002 , xx水 , 100 ; \" ],\r\n  \"c\" : [ \"A001 , 油 , 1 ; \" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a\' in \'field list\'\r\n### The error may involve com.ruoyi.record.mapper.RecordMapper.insertRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into record    ( gk_name,    gk_num,    room_id,    room_time,    mrs_id,    gw_id,        create_time,                 si_id,             si_id2,             si_id3,             a,             b,             c )           values ( ?,    ?,    ?,    ?,    ?,    ?,        ?,                 ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'a\' in \'field list\'', '2019-03-31 09:18:06');
INSERT INTO `sys_oper_log` VALUES ('201', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', 'admin', '研发部门', '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"张三\" ],\r\n  \"gkNum\" : [ \"A001\" ],\r\n  \"roomId\" : [ \"1\" ],\r\n  \"roomTime\" : [ \"1\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"100\" ],\r\n  \"siId\" : [ \"104\" ],\r\n  \"siId2\" : [ \"104\" ],\r\n  \"siId3\" : [ \"102\" ],\r\n  \"a\" : [ \"A002 , xx水 , 100 ; \" ],\r\n  \"b\" : [ \"A002 , xx水 , 100 ; \" ],\r\n  \"c\" : [ \"A001 , 油 , 1 ; \" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-03-31 09:18:59');
INSERT INTO `sys_oper_log` VALUES ('202', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', 'admin', '研发部门', '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"李四\" ],\r\n  \"gkNum\" : [ \"A002\" ],\r\n  \"roomId\" : [ \"1\" ],\r\n  \"roomTime\" : [ \"1\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"100\" ],\r\n  \"siId\" : [ \"104\" ],\r\n  \"siId2\" : [ \"104\" ],\r\n  \"siId3\" : [ \"102\" ],\r\n  \"a\" : [ \"A002 , xx水 , 100克 ; \" ],\r\n  \"b\" : [ \"A002 , xx水 , 100克 ; \" ],\r\n  \"c\" : [ \"A001 , 油 , 1克 ; \" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-03-31 10:20:07');
INSERT INTO `sys_oper_log` VALUES ('203', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.addSave()', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"105\" ],\r\n  \"userName\" : [ \"王春游\" ],\r\n  \"deptName\" : [ \"测试部门\" ],\r\n  \"phonenumber\" : [ \"17367846245\" ],\r\n  \"email\" : [ \"17367846245@163.com\" ],\r\n  \"loginName\" : [ \"wangchunyou\" ],\r\n  \"password\" : [ \"admin123\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"101\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"101\" ],\r\n  \"postIds\" : [ \"4\" ]\r\n}', '0', null, '2019-03-31 10:23:06');
INSERT INTO `sys_oper_log` VALUES ('204', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', 'admin', '研发部门', '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"测试\" ],\r\n  \"gkNum\" : [ \"A001\" ],\r\n  \"roomId\" : [ \"1\" ],\r\n  \"roomTime\" : [ \"1\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"100\" ],\r\n  \"siId\" : [ \"104\" ],\r\n  \"siId2\" : [ \"102\" ],\r\n  \"siId3\" : [ \"104\" ],\r\n  \"a\" : [ \"A002 , xx水 , 100克 ; \" ],\r\n  \"b\" : [ \"A001 , 油 , 1克 ; \" ],\r\n  \"c\" : [ \"A002 , xx水 , 100克 ; \" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-03-31 16:39:21');
INSERT INTO `sys_oper_log` VALUES ('205', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', 'admin', '研发部门', '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"张大明\" ],\r\n  \"gkNum\" : [ \"A001\" ],\r\n  \"roomId\" : [ \"1\" ],\r\n  \"roomTime\" : [ \"1\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"100\" ],\r\n  \"siId\" : [ \"104\" ],\r\n  \"siId2\" : [ \"102\" ],\r\n  \"siId3\" : [ \"104\" ],\r\n  \"a\" : [ \"A002 , xx水 , 100克 ; \" ],\r\n  \"b\" : [ \"A001 , 油 , 1克 ; \" ],\r\n  \"c\" : [ \"A002 , xx水 , 100克 ; \" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-03-31 20:46:13');
INSERT INTO `sys_oper_log` VALUES ('206', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', 'admin', '研发部门', '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"张大明\" ],\r\n  \"gkNum\" : [ \"A001\" ],\r\n  \"roomId\" : [ \"1\" ],\r\n  \"roomTime\" : [ \"1\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"100\" ],\r\n  \"siId\" : [ \"104\" ],\r\n  \"siId2\" : [ \"102\" ],\r\n  \"siId3\" : [ \"104\" ],\r\n  \"a\" : [ \"A002 , xx水 , 100克 ; \" ],\r\n  \"b\" : [ \"A001 , 油 , 1克 ; \" ],\r\n  \"c\" : [ \"A002 , xx水 , 100克 ; \" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-03-31 20:48:39');
INSERT INTO `sys_oper_log` VALUES ('207', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', null, null, '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"啊啊啊啊\" ],\r\n  \"gkNum\" : [ \"啊啊啊\" ],\r\n  \"roomId\" : [ \"1\" ],\r\n  \"roomTime\" : [ \"1\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"100\" ],\r\n  \"siId\" : [ \"104\" ],\r\n  \"siId2\" : [ \"104\" ],\r\n  \"siId3\" : [ \"\" ],\r\n  \"a\" : [ \"A002 , xx水 , 100克 ; \" ],\r\n  \"b\" : [ \"A002 , xx水 , 100克 ; \" ],\r\n  \"c\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-03-31 20:52:34');
INSERT INTO `sys_oper_log` VALUES ('208', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', null, null, '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"111\" ],\r\n  \"gkNum\" : [ \"1111\" ],\r\n  \"roomId\" : [ \"1\" ],\r\n  \"roomTime\" : [ \"2\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"100\" ],\r\n  \"siId\" : [ \"104\" ],\r\n  \"siId2\" : [ \"104\" ],\r\n  \"siId3\" : [ \"\" ],\r\n  \"a\" : [ \"A002 , xx水 , 100克 ; \" ],\r\n  \"b\" : [ \"A002 , xx水 , 100克 ; \" ],\r\n  \"c\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-03-31 20:55:37');
INSERT INTO `sys_oper_log` VALUES ('209', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', null, null, '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"111\" ],\r\n  \"gkNum\" : [ \"1111\" ],\r\n  \"roomId\" : [ \"1\" ],\r\n  \"roomTime\" : [ \"2\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"100\" ],\r\n  \"siId\" : [ \"104\" ],\r\n  \"siId2\" : [ \"104\" ],\r\n  \"siId3\" : [ \"\" ],\r\n  \"a\" : [ \"A002 , xx水 , 100克 ; \" ],\r\n  \"b\" : [ \"A002 , xx水 , 100克 ; \" ],\r\n  \"c\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-03-31 20:56:44');
INSERT INTO `sys_oper_log` VALUES ('210', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', null, null, '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"撒大大sd\" ],\r\n  \"gkNum\" : [ \"水电费\" ],\r\n  \"roomId\" : [ \"1\" ],\r\n  \"roomTime\" : [ \"1\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"100\" ],\r\n  \"siId\" : [ \"104\" ],\r\n  \"siId2\" : [ \"104\" ],\r\n  \"siId3\" : [ \"\" ],\r\n  \"a\" : [ \"A002 , xx水 , 100克 ; \" ],\r\n  \"b\" : [ \"A002 , xx水 , 100克 ; \" ],\r\n  \"c\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-03-31 20:58:08');
INSERT INTO `sys_oper_log` VALUES ('211', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', null, null, '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"1111\" ],\r\n  \"gkNum\" : [ \"1111\" ],\r\n  \"roomId\" : [ \"1\" ],\r\n  \"roomTime\" : [ \"2\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"100\" ],\r\n  \"siId\" : [ \"104\" ],\r\n  \"siId2\" : [ \"\" ],\r\n  \"siId3\" : [ \"\" ],\r\n  \"a\" : [ \"A002 , xx水 , 100克 ; \" ],\r\n  \"b\" : [ \"\" ],\r\n  \"c\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-03-31 20:58:51');
INSERT INTO `sys_oper_log` VALUES ('212', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', null, null, '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"2222\" ],\r\n  \"gkNum\" : [ \"222\" ],\r\n  \"roomId\" : [ \"1\" ],\r\n  \"roomTime\" : [ \"3\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"100\" ],\r\n  \"siId\" : [ \"104\" ],\r\n  \"siId2\" : [ \"\" ],\r\n  \"siId3\" : [ \"\" ],\r\n  \"a\" : [ \"A002 , xx水 , 100克 ; \" ],\r\n  \"b\" : [ \"\" ],\r\n  \"c\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-03-31 21:00:53');
INSERT INTO `sys_oper_log` VALUES ('213', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', null, null, '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"3333\" ],\r\n  \"gkNum\" : [ \"3\" ],\r\n  \"roomId\" : [ \"1\" ],\r\n  \"roomTime\" : [ \"2\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"100\" ],\r\n  \"siId\" : [ \"104\" ],\r\n  \"siId2\" : [ \"\" ],\r\n  \"siId3\" : [ \"\" ],\r\n  \"a\" : [ \"A002 , xx水 , 100克 ; \" ],\r\n  \"b\" : [ \"\" ],\r\n  \"c\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-03-31 21:07:21');
INSERT INTO `sys_oper_log` VALUES ('214', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', '1', 'admin', '研发部门', '/tool/gen/genCode/st_si_record', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-04-01 10:57:42');
INSERT INTO `sys_oper_log` VALUES ('215', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', 'admin', '研发部门', '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"张三\" ],\r\n  \"gkNum\" : [ \"A001\" ],\r\n  \"roomId\" : [ \"1\" ],\r\n  \"roomTime\" : [ \"1\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"100\" ],\r\n  \"siId\" : [ \"102\" ],\r\n  \"siId2\" : [ \"\" ],\r\n  \"siId3\" : [ \"\" ],\r\n  \"a\" : [ \"A001 , 油 , 1克 ; A002 , xx水 , 100克 ; \" ],\r\n  \"b\" : [ \"\" ],\r\n  \"c\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-04-01 11:36:21');
INSERT INTO `sys_oper_log` VALUES ('216', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', 'admin', '研发部门', '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"zhansan\" ],\r\n  \"gkNum\" : [ \"\" ],\r\n  \"roomId\" : [ \"\" ],\r\n  \"roomTime\" : [ \"2\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"\" ],\r\n  \"siId\" : [ \"104\" ],\r\n  \"siId2\" : [ \"102\" ],\r\n  \"siId3\" : [ \"\" ],\r\n  \"a\" : [ \"\" ],\r\n  \"b\" : [ \"A001 , 油 , 1克 ; A002 , xx水 , 100克 ; \" ],\r\n  \"c\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '1', '', '2019-04-01 11:42:44');
INSERT INTO `sys_oper_log` VALUES ('217', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', 'admin', '研发部门', '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"战三\" ],\r\n  \"gkNum\" : [ \"A003\" ],\r\n  \"roomId\" : [ \"1\" ],\r\n  \"roomTime\" : [ \"1\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"100\" ],\r\n  \"siId\" : [ \"102\" ],\r\n  \"siId2\" : [ \"\" ],\r\n  \"siId3\" : [ \"\" ],\r\n  \"a\" : [ \"A001 , 油 , 1克 ; A002 , xx水 , 100克 ; \" ],\r\n  \"b\" : [ \"\" ],\r\n  \"c\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-04-01 11:44:44');
INSERT INTO `sys_oper_log` VALUES ('218', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', 'admin', '研发部门', '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"\" ],\r\n  \"gkNum\" : [ \"\" ],\r\n  \"roomId\" : [ \"\" ],\r\n  \"roomTime\" : [ \"\" ],\r\n  \"mrsId\" : [ \"\" ],\r\n  \"gwId\" : [ \"\" ],\r\n  \"siId\" : [ \"102\" ],\r\n  \"siId2\" : [ \"\" ],\r\n  \"siId3\" : [ \"\" ],\r\n  \"a\" : [ \"A001 , 油 , 1克 ; A002 , xx水 , 100克 ; \" ],\r\n  \"b\" : [ \"\" ],\r\n  \"c\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '1', '', '2019-04-01 11:46:05');
INSERT INTO `sys_oper_log` VALUES ('219', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', 'admin', '研发部门', '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"张三\" ],\r\n  \"gkNum\" : [ \"A001\" ],\r\n  \"roomId\" : [ \"1\" ],\r\n  \"roomTime\" : [ \"1\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"100\" ],\r\n  \"siId\" : [ \"102\" ],\r\n  \"siId2\" : [ \"\" ],\r\n  \"siId3\" : [ \"\" ],\r\n  \"a\" : [ \"A001 , 油 , 1克 ; A002 , xx水 , 100克 ; \" ],\r\n  \"b\" : [ \"\" ],\r\n  \"c\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-04-01 11:50:20');
INSERT INTO `sys_oper_log` VALUES ('220', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', 'admin', '研发部门', '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"A00\" ],\r\n  \"gkNum\" : [ \"沙发斯蒂芬\" ],\r\n  \"roomId\" : [ \"1\" ],\r\n  \"roomTime\" : [ \"1\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"100\" ],\r\n  \"siId\" : [ \"102\" ],\r\n  \"siId2\" : [ \"\" ],\r\n  \"siId3\" : [ \"\" ],\r\n  \"a\" : [ \"A001 , 油 , 1克 ; A002 , xx水 , 100克 ; \" ],\r\n  \"b\" : [ \"\" ],\r\n  \"c\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-04-01 11:52:53');
INSERT INTO `sys_oper_log` VALUES ('221', '美容记录', '1', 'com.ruoyi.web.controller.record.RecordController.addSave()', '1', 'admin', '研发部门', '/record/record/add', '127.0.0.1', '内网IP', '{\r\n  \"gkName\" : [ \"王柳\" ],\r\n  \"gkNum\" : [ \"A002\" ],\r\n  \"roomId\" : [ \"4\" ],\r\n  \"roomTime\" : [ \"1\" ],\r\n  \"mrsId\" : [ \"101\" ],\r\n  \"gwId\" : [ \"100\" ],\r\n  \"siId\" : [ \"102\" ],\r\n  \"siId2\" : [ \"\" ],\r\n  \"siId3\" : [ \"\" ],\r\n  \"a\" : [ \"A001 , 油 , 1克 ; A002 , xx水 , 100克 ; \" ],\r\n  \"b\" : [ \"\" ],\r\n  \"c\" : [ \"\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-04-01 11:53:49');
INSERT INTO `sys_oper_log` VALUES ('222', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"配料统计\" ],\r\n  \"url\" : [ \"/record/stSiRecord\" ],\r\n  \"perms\" : [ \"record:stSiRecord:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-04-01 16:16:35');
INSERT INTO `sys_oper_log` VALUES ('223', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/2027', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-04-01 16:16:44');
INSERT INTO `sys_oper_log` VALUES ('224', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2020\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"配料统计\" ],\r\n  \"url\" : [ \"/record/stSiRecord\" ],\r\n  \"perms\" : [ \"record:stSiRecord:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-04-01 16:17:30');
INSERT INTO `sys_oper_log` VALUES ('225', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.editSave()', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"100\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"parentName\" : [ \"无\" ],\r\n  \"deptName\" : [ \"媚思嘉科技\" ],\r\n  \"orderNum\" : [ \"0\" ],\r\n  \"leader\" : [ \"若依\" ],\r\n  \"phone\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '0', null, '2019-04-15 08:13:07');
INSERT INTO `sys_oper_log` VALUES ('226', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.editSave()', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"101\" ],\r\n  \"parentId\" : [ \"100\" ],\r\n  \"parentName\" : [ \"媚思嘉科技\" ],\r\n  \"deptName\" : [ \"媚思嘉分部\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"leader\" : [ \"若依\" ],\r\n  \"phone\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '0', null, '2019-04-15 08:13:27');
INSERT INTO `sys_oper_log` VALUES ('227', '部门管理', '2', 'com.ruoyi.web.controller.system.SysDeptController.editSave()', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"102\" ],\r\n  \"parentId\" : [ \"100\" ],\r\n  \"parentName\" : [ \"媚思嘉科技\" ],\r\n  \"deptName\" : [ \"运营二\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"leader\" : [ \"若依\" ],\r\n  \"phone\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '0', null, '2019-04-15 08:13:38');
INSERT INTO `sys_oper_log` VALUES ('228', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"106\" ],\r\n  \"parentId\" : [ \"1\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"参数设置\" ],\r\n  \"url\" : [ \"/system/config\" ],\r\n  \"perms\" : [ \"system:config:view\" ],\r\n  \"orderNum\" : [ \"7\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"1\" ]\r\n}', '0', null, '2019-04-15 08:19:46');
INSERT INTO `sys_oper_log` VALUES ('229', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"110\" ],\r\n  \"parentId\" : [ \"2\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"定时任务\" ],\r\n  \"url\" : [ \"/monitor/job\" ],\r\n  \"perms\" : [ \"monitor:job:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"1\" ]\r\n}', '0', null, '2019-04-15 08:20:02');
INSERT INTO `sys_oper_log` VALUES ('230', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"111\" ],\r\n  \"parentId\" : [ \"2\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"数据监控\" ],\r\n  \"url\" : [ \"/monitor/data\" ],\r\n  \"perms\" : [ \"monitor:data:view\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"1\" ]\r\n}', '0', null, '2019-04-15 08:20:13');
INSERT INTO `sys_oper_log` VALUES ('231', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"112\" ],\r\n  \"parentId\" : [ \"2\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"服务监控\" ],\r\n  \"url\" : [ \"/monitor/server\" ],\r\n  \"perms\" : [ \"monitor:server:view\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"1\" ]\r\n}', '0', null, '2019-04-15 08:20:21');
INSERT INTO `sys_oper_log` VALUES ('232', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"3\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"系统工具\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"fa fa-bars\" ],\r\n  \"visible\" : [ \"1\" ]\r\n}', '0', null, '2019-04-15 08:20:31');
INSERT INTO `sys_oper_log` VALUES ('233', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"107\" ],\r\n  \"parentId\" : [ \"1\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"通知公告\" ],\r\n  \"url\" : [ \"/system/notice\" ],\r\n  \"perms\" : [ \"system:notice:view\" ],\r\n  \"orderNum\" : [ \"8\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"1\" ]\r\n}', '0', null, '2019-04-15 08:21:07');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-27 17:30:23', '管理员');
INSERT INTO `sys_role` VALUES ('2', '顾问', 'consultant', '2', '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-26 20:24:13', '顾问角色');
INSERT INTO `sys_role` VALUES ('100', '美容师', 'beautician', '3', '1', '0', '0', 'admin', '2019-03-26 20:25:03', '', null, '美容师角色');
INSERT INTO `sys_role` VALUES ('101', '配料师', 'ingredients', '4', '1', '0', '0', 'admin', '2019-03-26 20:26:11', '', null, '配料师角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `dept_id` int(11) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '100');
INSERT INTO `sys_role_menu` VALUES ('1', '101');
INSERT INTO `sys_role_menu` VALUES ('1', '102');
INSERT INTO `sys_role_menu` VALUES ('1', '103');
INSERT INTO `sys_role_menu` VALUES ('1', '104');
INSERT INTO `sys_role_menu` VALUES ('1', '105');
INSERT INTO `sys_role_menu` VALUES ('1', '106');
INSERT INTO `sys_role_menu` VALUES ('1', '107');
INSERT INTO `sys_role_menu` VALUES ('1', '108');
INSERT INTO `sys_role_menu` VALUES ('1', '109');
INSERT INTO `sys_role_menu` VALUES ('1', '110');
INSERT INTO `sys_role_menu` VALUES ('1', '111');
INSERT INTO `sys_role_menu` VALUES ('1', '112');
INSERT INTO `sys_role_menu` VALUES ('1', '113');
INSERT INTO `sys_role_menu` VALUES ('1', '114');
INSERT INTO `sys_role_menu` VALUES ('1', '115');
INSERT INTO `sys_role_menu` VALUES ('1', '500');
INSERT INTO `sys_role_menu` VALUES ('1', '501');
INSERT INTO `sys_role_menu` VALUES ('1', '1000');
INSERT INTO `sys_role_menu` VALUES ('1', '1001');
INSERT INTO `sys_role_menu` VALUES ('1', '1002');
INSERT INTO `sys_role_menu` VALUES ('1', '1003');
INSERT INTO `sys_role_menu` VALUES ('1', '1004');
INSERT INTO `sys_role_menu` VALUES ('1', '1005');
INSERT INTO `sys_role_menu` VALUES ('1', '1006');
INSERT INTO `sys_role_menu` VALUES ('1', '1007');
INSERT INTO `sys_role_menu` VALUES ('1', '1008');
INSERT INTO `sys_role_menu` VALUES ('1', '1009');
INSERT INTO `sys_role_menu` VALUES ('1', '1010');
INSERT INTO `sys_role_menu` VALUES ('1', '1011');
INSERT INTO `sys_role_menu` VALUES ('1', '1012');
INSERT INTO `sys_role_menu` VALUES ('1', '1013');
INSERT INTO `sys_role_menu` VALUES ('1', '1014');
INSERT INTO `sys_role_menu` VALUES ('1', '1015');
INSERT INTO `sys_role_menu` VALUES ('1', '1016');
INSERT INTO `sys_role_menu` VALUES ('1', '1017');
INSERT INTO `sys_role_menu` VALUES ('1', '1018');
INSERT INTO `sys_role_menu` VALUES ('1', '1019');
INSERT INTO `sys_role_menu` VALUES ('1', '1020');
INSERT INTO `sys_role_menu` VALUES ('1', '1021');
INSERT INTO `sys_role_menu` VALUES ('1', '1022');
INSERT INTO `sys_role_menu` VALUES ('1', '1023');
INSERT INTO `sys_role_menu` VALUES ('1', '1024');
INSERT INTO `sys_role_menu` VALUES ('1', '1025');
INSERT INTO `sys_role_menu` VALUES ('1', '1026');
INSERT INTO `sys_role_menu` VALUES ('1', '1027');
INSERT INTO `sys_role_menu` VALUES ('1', '1028');
INSERT INTO `sys_role_menu` VALUES ('1', '1029');
INSERT INTO `sys_role_menu` VALUES ('1', '1030');
INSERT INTO `sys_role_menu` VALUES ('1', '1031');
INSERT INTO `sys_role_menu` VALUES ('1', '1032');
INSERT INTO `sys_role_menu` VALUES ('1', '1033');
INSERT INTO `sys_role_menu` VALUES ('1', '1034');
INSERT INTO `sys_role_menu` VALUES ('1', '1035');
INSERT INTO `sys_role_menu` VALUES ('1', '1036');
INSERT INTO `sys_role_menu` VALUES ('1', '1037');
INSERT INTO `sys_role_menu` VALUES ('1', '1038');
INSERT INTO `sys_role_menu` VALUES ('1', '1039');
INSERT INTO `sys_role_menu` VALUES ('1', '1040');
INSERT INTO `sys_role_menu` VALUES ('1', '1041');
INSERT INTO `sys_role_menu` VALUES ('1', '1042');
INSERT INTO `sys_role_menu` VALUES ('1', '1043');
INSERT INTO `sys_role_menu` VALUES ('1', '1044');
INSERT INTO `sys_role_menu` VALUES ('1', '1045');
INSERT INTO `sys_role_menu` VALUES ('1', '1046');
INSERT INTO `sys_role_menu` VALUES ('1', '1047');
INSERT INTO `sys_role_menu` VALUES ('1', '1048');
INSERT INTO `sys_role_menu` VALUES ('1', '1049');
INSERT INTO `sys_role_menu` VALUES ('1', '1050');
INSERT INTO `sys_role_menu` VALUES ('1', '1051');
INSERT INTO `sys_role_menu` VALUES ('1', '1052');
INSERT INTO `sys_role_menu` VALUES ('1', '1053');
INSERT INTO `sys_role_menu` VALUES ('1', '1054');
INSERT INTO `sys_role_menu` VALUES ('1', '1055');
INSERT INTO `sys_role_menu` VALUES ('1', '1056');
INSERT INTO `sys_role_menu` VALUES ('1', '1057');
INSERT INTO `sys_role_menu` VALUES ('1', '2000');
INSERT INTO `sys_role_menu` VALUES ('1', '2001');
INSERT INTO `sys_role_menu` VALUES ('1', '2002');
INSERT INTO `sys_role_menu` VALUES ('1', '2003');
INSERT INTO `sys_role_menu` VALUES ('1', '2004');
INSERT INTO `sys_role_menu` VALUES ('1', '2005');
INSERT INTO `sys_role_menu` VALUES ('1', '2006');
INSERT INTO `sys_role_menu` VALUES ('1', '2007');
INSERT INTO `sys_role_menu` VALUES ('1', '2008');
INSERT INTO `sys_role_menu` VALUES ('1', '2009');
INSERT INTO `sys_role_menu` VALUES ('1', '2010');
INSERT INTO `sys_role_menu` VALUES ('1', '2011');
INSERT INTO `sys_role_menu` VALUES ('1', '2012');
INSERT INTO `sys_role_menu` VALUES ('1', '2013');
INSERT INTO `sys_role_menu` VALUES ('1', '2014');
INSERT INTO `sys_role_menu` VALUES ('1', '2015');
INSERT INTO `sys_role_menu` VALUES ('1', '2016');
INSERT INTO `sys_role_menu` VALUES ('1', '2017');
INSERT INTO `sys_role_menu` VALUES ('1', '2018');
INSERT INTO `sys_role_menu` VALUES ('1', '2019');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2019-04-15 09:06:31', 'admin', '2018-03-16 11:33:00', 'ry', '2019-04-15 09:06:31', '管理员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `post_id` int(11) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');
INSERT INTO `sys_user_post` VALUES ('100', '4');
INSERT INTO `sys_user_post` VALUES ('101', '4');
INSERT INTO `sys_user_post` VALUES ('102', '4');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('100', '2');
INSERT INTO `sys_user_role` VALUES ('101', '100');
INSERT INTO `sys_user_role` VALUES ('102', '101');
