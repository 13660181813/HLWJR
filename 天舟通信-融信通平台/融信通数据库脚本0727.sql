/*
Navicat MySQL Data Transfer

Source Server         : 192.168.106.72
Source Server Version : 100312
Source Host           : 192.168.106.72:3306
Source Database       : SAFENUMBER

Target Server Type    : MYSQL
Target Server Version : 40099
File Encoding         : 65001

Date: 2022-07-27 09:20:55
*/

SET FOREIGN_KEY_CHECKS=0;


-- ----------------------------
-- Table structure for ALL_BUSINESS_BIND_COUNT
-- ----------------------------
DROP TABLE IF EXISTS `ALL_BUSINESS_BIND_COUNT`;
CREATE TABLE `ALL_BUSINESS_BIND_COUNT` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`start_time`  date NOT NULL ,
`unitid`  varchar(64) NULL DEFAULT '' ,
`customer`  varchar(64) NULL DEFAULT '' ,
`bind_num`  int(11) NULL DEFAULT 0 ,
`unbind_num`  int(11) NULL DEFAULT 0 ,
`delay_num`  int(11) NULL DEFAULT 0 ,
`thaw_num`  int(11) NULL DEFAULT 0 ,
`change_num`  int(11) NULL DEFAULT 0 ,
`revoke_num`  int(11) NULL DEFAULT 0 ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for ARC_95013
-- ----------------------------
DROP TABLE IF EXISTS `ARC_95013`;
CREATE TABLE `ARC_95013` (
`id`  bigint(32) NOT NULL AUTO_INCREMENT ,
`call_id`  varchar(128) NOT NULL ,
`unitid`  varchar(16) NOT NULL ,
`no_a`  varchar(32) NULL DEFAULT '' ,
`no_x`  varchar(20) NULL DEFAULT '' ,
`no_b`  varchar(32) NULL DEFAULT '' ,
`start_time`  datetime NOT NULL ,
`ring_time`  datetime NULL DEFAULT '' ,
`answer_time`  datetime NULL DEFAULT '' ,
`release_time`  datetime NULL DEFAULT '' ,
`release_dir`  varchar(16) NULL DEFAULT '' ,
`release_cause`  varchar(32) NULL DEFAULT '' ,
`duration`  int(11) NULL DEFAULT '' ,
`leg`  char(2) NULL DEFAULT '' ,
`recording_file`  varchar(255) NULL DEFAULT '' ,
`voicemail_file`  varchar(255) NULL DEFAULT '' ,
`interface_result`  varchar(4) NULL DEFAULT '' ,
`sip_result`  varchar(32) NULL DEFAULT '' ,
`request_id`  varchar(128) NULL DEFAULT '' ,
`calltype`  varchar(16) NULL DEFAULT '' ,
`subid`  varchar(64) NULL DEFAULT '' ,
`no_y`  varchar(20) NULL DEFAULT '' ,
`recording_url`  varchar(255) NULL DEFAULT '' ,
`del_flag`  int(11) NULL DEFAULT 0 ,
PRIMARY KEY (`id`, `start_time`),
INDEX `index1` (`no_x`),
INDEX `index2` (`start_time`)
)
TYPE=InnoDB
COMMENT='话单表'

;

-- ----------------------------
-- Table structure for BILLING_MANAGEMENT_LIST
-- ----------------------------
DROP TABLE IF EXISTS `BILLING_MANAGEMENT_LIST`;
CREATE TABLE `BILLING_MANAGEMENT_LIST` (
`id`  varchar(50) NOT NULL ,
`reserve1`  varchar(100) NULL DEFAULT '' ,
`unitId`  varchar(20) NULL DEFAULT '' ,
`yearMonth`  varchar(20) NULL DEFAULT '' ,
`billName`  varchar(50) NULL DEFAULT '' ,
`uploadTime`  datetime NOT NULL ,
`createUser`  varchar(64) NOT NULL ,
PRIMARY KEY (`id`, `uploadTime`),
INDEX `bill_list` (`uploadTime`, `unitId`, `createUser`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for C_CALL_AB
-- ----------------------------
DROP TABLE IF EXISTS `C_CALL_AB`;
CREATE TABLE `C_CALL_AB` (
`id`  bigint(32) NOT NULL AUTO_INCREMENT ,
`call_date`  datetime NOT NULL ,
`unitid`  varchar(16) NOT NULL ,
`lega_phone`  varchar(64) NOT NULL ,
`lega_uid`  varchar(20) NOT NULL ,
`legb_phone`  varchar(64) NOT NULL ,
`legb_uid`  varchar(20) NOT NULL ,
`opuser`  varchar(64) NOT NULL ,
`remarks`  varchar(100) NULL DEFAULT '' ,
`ext1`  varchar(64) NULL DEFAULT '' ,
`ext2`  varchar(64) NULL DEFAULT '' ,
`ext3`  varchar(64) NULL DEFAULT '' ,
`ext4`  varchar(64) NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for C_UNIT_OP_LOG
-- ----------------------------
DROP TABLE IF EXISTS `C_UNIT_OP_LOG`;
CREATE TABLE `C_UNIT_OP_LOG` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`username`  varchar(50) NULL DEFAULT '' ,
`operation`  varchar(50) NULL DEFAULT '' ,
`method`  varchar(200) NULL DEFAULT '' ,
`params`  varchar(5000) NULL DEFAULT '' ,
`ip`  varchar(64) NULL DEFAULT '' ,
`create_date`  datetime NULL DEFAULT '' ,
`unitid`  varchar(20) NULL DEFAULT '' ,
`result_code`  int(3) NULL DEFAULT '' ,
`msg`  varchar(255) NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB
COMMENT='企业用户操作日志'

;

-- ----------------------------
-- Table structure for C_UNIT_ROLE_MENU
-- ----------------------------
DROP TABLE IF EXISTS `C_UNIT_ROLE_MENU`;
CREATE TABLE `C_UNIT_ROLE_MENU` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`role_id`  bigint(20) NULL DEFAULT '' ,
`menu_id`  bigint(20) NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB
COMMENT='企业角色资源表'

;

-- ----------------------------
-- Table structure for C_UNIT_USER
-- ----------------------------
DROP TABLE IF EXISTS `C_UNIT_USER`;
CREATE TABLE `C_UNIT_USER` (
`user_id`  bigint(64) NOT NULL AUTO_INCREMENT ,
`username`  varchar(64) NOT NULL ,
`password`  varchar(128) NOT NULL ,
`is_active`  bit(1) NULL DEFAULT 0 ,
`unitid`  bigint(20) NOT NULL ,
`mobile`  varchar(16) NULL DEFAULT '' ,
`create_time`  datetime NOT NULL ,
`create_user_id`  bigint(20) NULL DEFAULT '' ,
`email`  varchar(32) NULL DEFAULT '' ,
`last_login_time`  datetime NULL DEFAULT '' ,
`name`  varchar(64) NULL DEFAULT '' ,
PRIMARY KEY (`user_id`),
UNIQUE INDEX `username` (`username`)
)
TYPE=InnoDB
COMMENT='安全号平台企业用户'

;

-- ----------------------------
-- Table structure for C_UNIT_USER_ROLE
-- ----------------------------
DROP TABLE IF EXISTS `C_UNIT_USER_ROLE`;
CREATE TABLE `C_UNIT_USER_ROLE` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`user_id`  bigint(20) NULL DEFAULT '' ,
`role_id`  bigint(20) NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB
COMMENT='企业用户角色关系表'

;

-- ----------------------------
-- Table structure for checksums
-- ----------------------------
DROP TABLE IF EXISTS `checksums`;
CREATE TABLE `checksums` (
`db`  char(64) NOT NULL ,
`tbl`  char(64) NOT NULL ,
`chunk`  int(11) NOT NULL ,
`chunk_time`  float NULL DEFAULT '' ,
`chunk_index`  varchar(200) NULL DEFAULT '' ,
`lower_boundary`  text NULL ,
`upper_boundary`  text NULL ,
`this_crc`  char(40) NOT NULL ,
`this_cnt`  int(11) NOT NULL ,
`master_crc`  char(40) NULL DEFAULT '' ,
`master_cnt`  int(11) NULL DEFAULT '' ,
`ts`  timestamp NOT NULL DEFAULT current_timestamp() ,
PRIMARY KEY (`db`, `tbl`, `chunk`),
INDEX `ts_db_tbl` (`ts`, `db`, `tbl`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for OP_LOG
-- ----------------------------
DROP TABLE IF EXISTS `OP_LOG`;
CREATE TABLE `OP_LOG` (
`logid`  bigint(10) NOT NULL AUTO_INCREMENT ,
`userid`  varchar(50) NOT NULL ,
`logintime`  varchar(50) NOT NULL ,
`type`  varchar(32) NOT NULL ,
`loginip`  varchar(32) NOT NULL ,
`city`  varchar(32) NULL DEFAULT '' ,
`typename`  varchar(255) NULL DEFAULT '' ,
PRIMARY KEY (`logid`)
)
TYPE=InnoDB
COMMENT='运维平台系统登录日志表（暂无用）'

;

-- ----------------------------
-- Table structure for PLAT_AreaCodeList
-- ----------------------------
DROP TABLE IF EXISTS `PLAT_AreaCodeList`;
CREATE TABLE `PLAT_AreaCodeList` (
`AreaCode`  varchar(6) NULL DEFAULT '' ,
`ProvinceName`  varchar(20) NULL DEFAULT '' ,
`CityName`  varchar(20) NULL DEFAULT '' ,
`PhoneLen`  smallint(6) NULL DEFAULT '' ,
`AreaID`  int(11) NULL DEFAULT '' ,
`AreaSpecial`  smallint(6) NULL DEFAULT '' ,
`LinkAreaID`  int(11) NULL DEFAULT '' 
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for plat_areaphonelist
-- ----------------------------
DROP TABLE IF EXISTS `plat_areaphonelist`;
CREATE TABLE `plat_areaphonelist` (
`Phone`  varchar(10) NULL DEFAULT '' ,
`ProvinceName`  varchar(10) NULL DEFAULT '' ,
`AreaCode`  varchar(10) NULL DEFAULT '' ,
`CityName`  varchar(10) NULL DEFAULT '' ,
`AreaID`  int(4) NULL DEFAULT '' ,
`LinkAreaID`  int(4) NULL DEFAULT '' ,
INDEX `index` (`Phone`),
INDEX `ind_pro_pho` (`ProvinceName`, `Phone`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for reply_cdr
-- ----------------------------
DROP TABLE IF EXISTS `reply_cdr`;
CREATE TABLE `reply_cdr` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`phone`  varchar(32) NOT NULL DEFAULT '' ,
`sms_id`  varchar(32) NOT NULL DEFAULT '' ,
`msg`  varchar(255) NOT NULL DEFAULT '' ,
`msgid`  bigint(20) UNSIGNED NOT NULL DEFAULT 0 ,
`channel_name`  varchar(32) NOT NULL DEFAULT '' ,
`receive_time`  datetime NULL DEFAULT '' ,
PRIMARY KEY (`id`),
INDEX `IX_receive_time` (`receive_time`),
INDEX `IX_reply_phone` (`phone`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for sms_cdr
-- ----------------------------
DROP TABLE IF EXISTS `sms_cdr`;
CREATE TABLE `sms_cdr` (
`seqid`  bigint(20) UNSIGNED NOT NULL ,
`partner_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`user_id`  varchar(32) NOT NULL DEFAULT '' ,
`sms_id`  varchar(32) NOT NULL DEFAULT '' ,
`app_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`submit_time`  datetime NULL DEFAULT '' ,
`submitresponse_time`  datetime NULL DEFAULT '' ,
`submitack_timeout`  datetime NULL DEFAULT '' ,
`msg`  varchar(255) NOT NULL DEFAULT '' ,
`channel_name`  varchar(32) NOT NULL DEFAULT '' ,
`receiver`  varchar(32) NOT NULL DEFAULT '' ,
`channel_sms_id`  varchar(32) NOT NULL DEFAULT '' ,
`msgid`  varchar(64) NOT NULL DEFAULT '' ,
`request_result`  varchar(16) NOT NULL DEFAULT '' ,
`submit_result`  varchar(16) NOT NULL DEFAULT '' ,
`report`  varchar(64) NOT NULL DEFAULT '' ,
`report_time`  datetime NULL DEFAULT '' ,
`feeid`  varchar(64) NOT NULL DEFAULT '' ,
`request_time`  datetime NULL DEFAULT '' ,
`addition`  varchar(255) NOT NULL DEFAULT '' ,
`com_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`sm_status`  varchar(64) NOT NULL DEFAULT '' ,
`route_count`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`seqno`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`failresult`  varchar(64) NOT NULL DEFAULT '' ,
PRIMARY KEY (`seqid`),
INDEX `idx_sub_result` (`submit_result`),
INDEX `idx_sm_status` (`sm_status`),
INDEX `idx_report_time` (`report_time`),
INDEX `IX_PartnerID` (`partner_id`, `channel_name`),
INDEX `IX_Submit_Time` (`submit_time`),
INDEX `IX_receiver` (`receiver`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for sms_cdr_202107
-- ----------------------------
DROP TABLE IF EXISTS `sms_cdr_202107`;
CREATE TABLE `sms_cdr_202107` (
`seqid`  bigint(20) UNSIGNED NOT NULL ,
`partner_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`user_id`  varchar(32) NOT NULL DEFAULT '' ,
`sms_id`  varchar(32) NOT NULL DEFAULT '' ,
`app_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`submit_time`  datetime NULL DEFAULT '' ,
`submitresponse_time`  datetime NULL DEFAULT '' ,
`submitack_timeout`  datetime NULL DEFAULT '' ,
`msg`  varchar(255) NOT NULL DEFAULT '' ,
`channel_name`  varchar(32) NOT NULL DEFAULT '' ,
`receiver`  varchar(32) NOT NULL DEFAULT '' ,
`channel_sms_id`  varchar(32) NOT NULL DEFAULT '' ,
`msgid`  varchar(64) NOT NULL DEFAULT '' ,
`request_result`  varchar(16) NOT NULL DEFAULT '' ,
`submit_result`  varchar(16) NOT NULL DEFAULT '' ,
`report`  varchar(64) NOT NULL DEFAULT '' ,
`report_time`  datetime NULL DEFAULT '' ,
`feeid`  varchar(64) NOT NULL DEFAULT '' ,
`request_time`  datetime NULL DEFAULT '' ,
`addition`  varchar(255) NOT NULL DEFAULT '' ,
`com_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`sm_status`  varchar(64) NOT NULL DEFAULT '' ,
`route_count`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`seqno`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`failresult`  varchar(64) NOT NULL DEFAULT '' ,
PRIMARY KEY (`seqid`),
INDEX `idx_sub_result` (`submit_result`),
INDEX `idx_sm_status` (`sm_status`),
INDEX `idx_report_time` (`report_time`),
INDEX `IX_PartnerID` (`partner_id`, `channel_name`),
INDEX `IX_Submit_Time` (`submit_time`),
INDEX `IX_receiver` (`receiver`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for SYS_APPLICATION
-- ----------------------------
DROP TABLE IF EXISTS `SYS_APPLICATION`;
CREATE TABLE `SYS_APPLICATION` (
`APP_KEY`  varchar(64) NOT NULL ,
`API_URL`  varchar(256) NULL DEFAULT '' ,
`APP_NAME`  varchar(64) NOT NULL ,
`APP_SECRET`  varchar(128) NOT NULL ,
`APP_TYPE`  varchar(4) NOT NULL ,
`CREATE_TIME`  datetime NOT NULL ,
`CREATE_USER`  bigint(20) NOT NULL ,
`LAST_STATUS_TIME`  datetime NOT NULL ,
`LOG_INFO`  varchar(4096) NULL DEFAULT '' ,
`STATUS`  varchar(255) NOT NULL ,
PRIMARY KEY (`APP_KEY`),
UNIQUE INDEX `APP_KEY` (`APP_KEY`)
)
TYPE=MyISAM
COMMENT='业务开户信息表'

;

-- ----------------------------
-- Table structure for SYS_BILLLOG
-- ----------------------------
DROP TABLE IF EXISTS `SYS_BILLLOG`;
CREATE TABLE `SYS_BILLLOG` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`unitId`  varchar(50) NULL DEFAULT '' ,
`optContent`  varchar(255) NULL DEFAULT '' ,
`operaTime`  timestamp NULL DEFAULT '' ,
`operaUser`  varchar(30) NULL DEFAULT '' ,
`operaIP`  varchar(20) NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for SYS_BILLSET
-- ----------------------------
DROP TABLE IF EXISTS `SYS_BILLSET`;
CREATE TABLE `SYS_BILLSET` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`unitId`  varchar(20) NULL DEFAULT '' ,
`countUnit`  varchar(20) NULL DEFAULT '' ,
`axbS`  decimal(11,3) NULL DEFAULT '' ,
`axbSS`  decimal(11,3) NULL DEFAULT '' ,
`CALLS`  decimal(11,3) NULL DEFAULT '' ,
`ASS`  decimal(11,3) NULL DEFAULT '' ,
`BS`  decimal(11,3) NULL DEFAULT '' ,
`BSS`  decimal(11,3) NULL DEFAULT '' ,
`postS`  decimal(11,3) NULL DEFAULT '' ,
`postSS`  decimal(11,3) NULL DEFAULT '' ,
`safeNumUnit`  varchar(50) NULL DEFAULT '' ,
`safeNumprice`  decimal(11,3) NULL DEFAULT '' ,
`postUnit`  varchar(50) NULL DEFAULT '' ,
`postPrice`  decimal(11,3) NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for SYS_CONFIG
-- ----------------------------
DROP TABLE IF EXISTS `SYS_CONFIG`;
CREATE TABLE `SYS_CONFIG` (
`OID`  decimal(19,0) NOT NULL ,
`PARAM_CODE`  text NOT NULL ,
`PARAM_NAME`  text NOT NULL ,
`PARAM_VALUE`  text NULL ,
`REMARK`  text NULL ,
PRIMARY KEY (`OID`)
)
TYPE=MyISAM

;

-- ----------------------------
-- Table structure for SYS_DATA_CLEAR
-- ----------------------------
DROP TABLE IF EXISTS `SYS_DATA_CLEAR`;
CREATE TABLE `SYS_DATA_CLEAR` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`end_time`  datetime NULL DEFAULT '' ,
`sequenceid`  varchar(255) NOT NULL ,
`start_time`  datetime NULL DEFAULT '' ,
`success_count`  varchar(255) NOT NULL ,
`table_name`  varchar(30) NOT NULL ,
`user_id`  varchar(11) NOT NULL ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for SYS_MENU
-- ----------------------------
DROP TABLE IF EXISTS `SYS_MENU`;
CREATE TABLE `SYS_MENU` (
`menu_id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`parent_id`  bigint(20) NULL DEFAULT '' ,
`name`  varchar(50) NULL DEFAULT '' ,
`url`  varchar(200) NULL DEFAULT '' ,
`perms`  varchar(500) NULL DEFAULT '' ,
`type`  int(11) NULL DEFAULT '' ,
`icon`  varchar(50) NULL DEFAULT '' ,
`order_num`  int(11) NULL DEFAULT '' ,
PRIMARY KEY (`menu_id`)
)
TYPE=InnoDB
COMMENT='安全号应用菜单资源表'

;

-- ----------------------------
-- Table structure for SYS_ORGANIZATION
-- ----------------------------
DROP TABLE IF EXISTS `SYS_ORGANIZATION`;
CREATE TABLE `SYS_ORGANIZATION` (
`CODE`  varchar(255) NOT NULL ,
`LEVEL`  int(11) NOT NULL ,
`MAP_CODE`  varchar(255) NULL DEFAULT '' ,
`NAME`  varchar(32) NOT NULL ,
PRIMARY KEY (`CODE`)
)
TYPE=MyISAM

;

-- ----------------------------
-- Table structure for SYS_PRIVILEGE
-- ----------------------------
DROP TABLE IF EXISTS `SYS_PRIVILEGE`;
CREATE TABLE `SYS_PRIVILEGE` (
`oid`  bigint(20) NOT NULL AUTO_INCREMENT ,
`code`  varchar(16) NOT NULL ,
`pid`  bigint(20) NOT NULL ,
`remark`  varchar(256) NOT NULL ,
PRIMARY KEY (`oid`),
UNIQUE INDEX `CODE` (`code`)
)
TYPE=MyISAM
AUTO_INCREMENT=2040

;

-- ----------------------------
-- Table structure for SYS_ROLE
-- ----------------------------
DROP TABLE IF EXISTS `SYS_ROLE`;
CREATE TABLE `SYS_ROLE` (
`OID`  bigint(20) NOT NULL AUTO_INCREMENT ,
`CREATE_TIME`  datetime NOT NULL ,
`CREATE_USER`  bigint(20) NOT NULL ,
`NAME`  varchar(32) NOT NULL ,
`PRIVILEGES`  varchar(2048) NULL DEFAULT '' ,
`REMARK`  varchar(1024) NULL DEFAULT '' ,
PRIMARY KEY (`OID`)
)
TYPE=MyISAM
AUTO_INCREMENT=78

;

-- ----------------------------
-- Table structure for SYS_USER
-- ----------------------------
DROP TABLE IF EXISTS `SYS_USER`;
CREATE TABLE `SYS_USER` (
`OID`  bigint(20) NOT NULL ,
`CREATE_TIME`  datetime NOT NULL ,
`CREATE_USER`  bigint(20) NOT NULL ,
`EMAIL`  varchar(32) NULL DEFAULT '' ,
`IS_ACTIVE`  bit(1) NOT NULL ,
`LAST_LOGIN_TIME`  datetime NULL DEFAULT '' ,
`MOBILE`  varchar(16) NULL DEFAULT '' ,
`ORG_CODE`  varchar(1024) NOT NULL ,
`PIN_YIN`  varchar(64) NULL DEFAULT '' ,
`USER_ID`  varchar(64) NOT NULL ,
`USER_NAME`  varchar(64) NULL DEFAULT '' ,
`USER_PWD`  varchar(128) NOT NULL ,
`USER_TYPE`  varchar(16) NOT NULL ,
`ID`  bigint(20) NOT NULL AUTO_INCREMENT ,
PRIMARY KEY (`ID`),
UNIQUE INDEX `USER_ID` (`USER_ID`, `OID`)
)
TYPE=MyISAM
AUTO_INCREMENT=418

;

-- ----------------------------
-- Table structure for SYS_USER_ROLE
-- ----------------------------
DROP TABLE IF EXISTS `SYS_USER_ROLE`;
CREATE TABLE `SYS_USER_ROLE` (
`OID`  bigint(20) NOT NULL AUTO_INCREMENT ,
`ROLE_ID`  bigint(20) NOT NULL ,
`USER_ID`  bigint(20) NOT NULL ,
PRIMARY KEY (`OID`)
)
TYPE=MyISAM
AUTO_INCREMENT=459

;

-- ----------------------------
-- Table structure for SYS_WEB_MENU
-- ----------------------------
DROP TABLE IF EXISTS `SYS_WEB_MENU`;
CREATE TABLE `SYS_WEB_MENU` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`cmd_id`  varchar(30) NULL DEFAULT '' ,
`text`  varchar(255) NULL DEFAULT '' ,
`parentId`  int(10) NULL DEFAULT '' ,
`tabId`  int(10) NULL DEFAULT '' ,
`isLeaf`  int(10) NULL DEFAULT '' ,
`isButton`  int(10) NULL DEFAULT '' ,
`iconCls`  varchar(30) NULL DEFAULT '' ,
`order`  int(10) NULL DEFAULT '' ,
`sequence`  varchar(50) NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for SYS_WEB_PRIVILEGE
-- ----------------------------
DROP TABLE IF EXISTS `SYS_WEB_PRIVILEGE`;
CREATE TABLE `SYS_WEB_PRIVILEGE` (
`oid`  int(20) NOT NULL AUTO_INCREMENT ,
`role_id`  int(11) NULL DEFAULT '' ,
`tree_id`  int(10) NULL DEFAULT '' ,
`tab_id`  int(10) NULL DEFAULT '' ,
`menu_id`  int(11) NULL DEFAULT '' ,
`menu_text`  varchar(30) NULL DEFAULT '' ,
`hasPrivilege`  int(20) NULL DEFAULT '' ,
`role_type`  int(20) NULL DEFAULT '' ,
`condi`  varchar(255) NULL DEFAULT '' ,
PRIMARY KEY (`oid`)
)
TYPE=MyISAM
AUTO_INCREMENT=2337

;

-- ----------------------------
-- Table structure for SYS_WEB_ROLE
-- ----------------------------
DROP TABLE IF EXISTS `SYS_WEB_ROLE`;
CREATE TABLE `SYS_WEB_ROLE` (
`role_id`  int(11) NOT NULL AUTO_INCREMENT ,
`role_name`  varchar(255) NULL DEFAULT '' ,
`role_type`  varchar(255) NULL DEFAULT '' ,
`description`  varchar(255) NULL DEFAULT '' ,
PRIMARY KEY (`role_id`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for SYS_WEB_ROLETABLE
-- ----------------------------
DROP TABLE IF EXISTS `SYS_WEB_ROLETABLE`;
CREATE TABLE `SYS_WEB_ROLETABLE` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`tree_id`  int(10) NULL DEFAULT '' ,
`tab_id`  int(10) NULL DEFAULT '' ,
`tabName`  varchar(255) NULL DEFAULT '' ,
`dataTable`  varchar(255) NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for SYS_WEB_TREE
-- ----------------------------
DROP TABLE IF EXISTS `SYS_WEB_TREE`;
CREATE TABLE `SYS_WEB_TREE` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`tree_id`  int(11) NULL DEFAULT '' ,
`role_id`  int(11) NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_BATCHWORKHIS
-- ----------------------------
DROP TABLE IF EXISTS `T_BATCHWORKHIS`;
CREATE TABLE `T_BATCHWORKHIS` (
`batchworkid`  varchar(36) NOT NULL ,
`addtime`  datetime NULL DEFAULT current_timestamp() ,
`method`  varchar(32) NULL DEFAULT '' ,
`unitid`  varchar(16) NULL DEFAULT '' ,
`uidtype`  varchar(8) NULL DEFAULT '' ,
`srcfile`  varchar(255) NULL DEFAULT '' ,
`state`  smallint(6) NULL DEFAULT '' ,
`destfile`  varchar(255) NULL DEFAULT '' ,
`totalcount`  int(11) NULL DEFAULT '' ,
`successcount`  int(11) NULL DEFAULT '' ,
`failcount`  int(11) NULL DEFAULT '' ,
`opmodule`  varchar(16) NULL DEFAULT '' ,
`opuser`  varchar(64) NULL DEFAULT '' ,
PRIMARY KEY (`batchworkid`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for t_bindingnumber
-- ----------------------------
DROP TABLE IF EXISTS `t_bindingnumber`;
CREATE TABLE `t_bindingnumber` (
`subid`  int(11) NOT NULL AUTO_INCREMENT ,
`tela`  varchar(200) NOT NULL ,
`telx`  varchar(200) NULL DEFAULT '' ,
`telb`  varchar(200) NULL DEFAULT '' ,
`bindingtime`  datetime NULL DEFAULT '' ,
`expiration`  datetime NULL DEFAULT '' ,
`effectivetime`  varchar(50) NULL DEFAULT '' ,
`operator`  varchar(50) NULL DEFAULT '' ,
`createtime`  datetime NULL DEFAULT '' ,
`updatetime`  datetime NULL DEFAULT '' ,
`SecurityNumber`  varchar(50) NULL DEFAULT '' ,
PRIMARY KEY (`subid`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_BLACKLIST
-- ----------------------------
DROP TABLE IF EXISTS `T_BLACKLIST`;
CREATE TABLE `T_BLACKLIST` (
`blacklistid`  bigint(32) NOT NULL AUTO_INCREMENT ,
`uidnumber`  varchar(32) NULL DEFAULT '' ,
`regphone`  varchar(32) NULL DEFAULT '' ,
`uidtype`  varchar(1) NULL DEFAULT '0' ,
`status`  int(1) NULL DEFAULT '' ,
`unitid`  varchar(16) NULL DEFAULT '' ,
`optime`  datetime NULL DEFAULT '' ,
`opcontent`  varchar(200) NULL DEFAULT '' ,
`optype`  varchar(64) NULL DEFAULT '' ,
`opmodule`  varchar(16) NULL DEFAULT '' ,
`opuser`  varchar(64) NULL DEFAULT '' ,
`expired_time`  datetime NULL DEFAULT '' ,
`subid`  varchar(36) NOT NULL ,
`reason`  varchar(50) NULL DEFAULT '' ,
PRIMARY KEY (`blacklistid`)
)
TYPE=InnoDB
COMMENT='黑名单列表'

;

-- ----------------------------
-- Table structure for T_CALL_WEEK_STATS
-- ----------------------------
DROP TABLE IF EXISTS `T_CALL_WEEK_STATS`;
CREATE TABLE `T_CALL_WEEK_STATS` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`call_time`  varchar(8) NULL DEFAULT '' ,
`bind_success_count`  double(12,3) NULL DEFAULT 0.000 ,
`call_count`  double(12,3) NULL DEFAULT 0.000 ,
`call_success_count`  double(12,3) NULL DEFAULT 0.000 ,
`six_seconds`  double(12,3) NULL DEFAULT 0.000 ,
`sixty_seconds`  double(12,3) NULL DEFAULT 0.000 ,
`connection_rate`  varchar(12) NULL DEFAULT '' ,
`ring_rate`  varchar(12) NULL DEFAULT '' ,
`short_word_rate`  varchar(12) NULL DEFAULT '' ,
`mean_call_minutes`  double(12,3) NULL DEFAULT 0.000 ,
`addtime`  datetime NULL DEFAULT '' ,
`unitid`  varchar(16) NOT NULL ,
`unitname`  varchar(128) NULL DEFAULT '' ,
`type`  int(1) NULL DEFAULT 1 ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB
COMMENT='周话单统计'

;

-- ----------------------------
-- Table structure for T_CALLCONTROL_LOG
-- ----------------------------
DROP TABLE IF EXISTS `T_CALLCONTROL_LOG`;
CREATE TABLE `T_CALLCONTROL_LOG` (
`seqid`  varchar(64) NOT NULL ,
`callid`  varchar(64) NOT NULL ,
`unitid`  varchar(16) NOT NULL ,
`iftype`  varchar(8) NOT NULL ,
`no_a`  varchar(32) NULL DEFAULT '' ,
`no_x`  varchar(32) NULL DEFAULT '' ,
`no_b`  varchar(32) NULL DEFAULT '' ,
`no_y`  varchar(32) NULL DEFAULT '' ,
`resultcode`  varchar(8) NOT NULL ,
`errorcode`  varchar(8) NULL DEFAULT '' ,
`errormsg`  varchar(255) NULL DEFAULT '' ,
`requesturl`  text NOT NULL ,
`responseurl`  text NOT NULL ,
`requestip`  varchar(16) NOT NULL ,
`addtime`  datetime NOT NULL ,
`starttime`  datetime NOT NULL ,
`endtime`  datetime NULL DEFAULT '' ,
`e_time`  int(32) NOT NULL ,
PRIMARY KEY (`seqid`),
INDEX `iftype` (`unitid`, `iftype`),
INDEX `IX_T_CALLCONTROL_LOG_Starttime` (`starttime`, `unitid`)
)
TYPE=InnoDB
COMMENT='呼叫控制、呼叫鉴权接口、双向呼接口日志'

;

-- ----------------------------
-- Table structure for T_CallStatistics
-- ----------------------------
DROP TABLE IF EXISTS `T_CallStatistics`;
CREATE TABLE `T_CallStatistics` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`day`  varchar(20) NOT NULL ,
`unitId`  varchar(16) NOT NULL ,
`call_count`  bigint(32) NULL DEFAULT 0 ,
`call_people_count`  bigint(32) NULL DEFAULT 0 ,
`called_people_count`  bigint(32) NULL DEFAULT 0 ,
`called_count`  bigint(32) NULL DEFAULT 0 ,
`called_success_count`  bigint(32) NULL DEFAULT 0 ,
`called_per_count`  decimal(12,3) NULL DEFAULT 0.000 ,
`duration`  bigint(32) NULL DEFAULT 0 ,
`duration_per`  decimal(12,3) NULL DEFAULT 0.000 ,
`duration_minute`  decimal(12,3) NULL DEFAULT 0.000 ,
`ringingRate`  decimal(12,3) NULL DEFAULT 0.000 ,
`billRate`  decimal(12,3) NULL DEFAULT 0.000 ,
`callRate`  decimal(12,3) NULL DEFAULT 0.000 ,
`addtime`  datetime NULL DEFAULT '' ,
`call_sum`  bigint(35) NULL DEFAULT '' ,
`call_sum_sixty`  bigint(35) NULL DEFAULT 0 ,
`ring_rate_increase`  decimal(12,3) NULL DEFAULT 0.000 ,
`connected_rate_increase`  decimal(12,3) NULL DEFAULT 0.000 ,
`called_twice_count`  bigint(32) NULL DEFAULT 0 ,
`bind_real_count`  bigint(32) NULL DEFAULT 0 ,
`bind_increase`  decimal(12,3) NULL DEFAULT 0.000 ,
`called_num_count`  bigint(32) NULL DEFAULT 0 ,
`leg`  char(2) NULL DEFAULT '' ,
PRIMARY KEY (`id`),
INDEX `ind_day` (`day`, `unitId`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_ConfigLog
-- ----------------------------
DROP TABLE IF EXISTS `T_ConfigLog`;
CREATE TABLE `T_ConfigLog` (
`ID`  bigint(20) NOT NULL AUTO_INCREMENT ,
`name`  varchar(30) NULL DEFAULT '' ,
`uidnumber`  varchar(32) NULL DEFAULT '' ,
`unitcount`  varchar(32) NULL DEFAULT '' ,
`addtime`  varchar(50) NULL DEFAULT '' ,
`IP`  varchar(32) NULL DEFAULT '' ,
`operator`  varchar(32) NULL DEFAULT '' ,
`state`  int(11) NULL DEFAULT '' ,
`type`  int(11) NULL DEFAULT '' ,
`addtimes`  varchar(255) NULL DEFAULT '' ,
PRIMARY KEY (`ID`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_DATAMANAGE_LOG
-- ----------------------------
DROP TABLE IF EXISTS `T_DATAMANAGE_LOG`;
CREATE TABLE `T_DATAMANAGE_LOG` (
`seqid`  varchar(64) NOT NULL ,
`unitid`  varchar(16) NOT NULL ,
`iftype`  varchar(8) NOT NULL ,
`regphone`  varchar(32) NOT NULL ,
`uidnumber`  varchar(32) NOT NULL ,
`otherphone`  varchar(32) NULL DEFAULT '' ,
`uidtype`  varchar(8) NULL DEFAULT '' ,
`uuidinpartner`  varchar(64) NULL DEFAULT '' ,
`batchworkid`  varchar(64) NULL DEFAULT '' ,
`resultcode`  varchar(8) NULL DEFAULT '' ,
`errorcode`  varchar(8) NULL DEFAULT '' ,
`errormsg`  varchar(255) NULL DEFAULT '' ,
`requesturl`  text NOT NULL ,
`responseurl`  text NOT NULL ,
`requestIP`  varchar(16) NOT NULL ,
`opuser`  varchar(32) NULL DEFAULT '' ,
`regmodule`  varchar(32) NULL DEFAULT '' ,
`addtime`  datetime NOT NULL ,
`starttime`  datetime NOT NULL ,
`endtime`  datetime NOT NULL ,
`e_time`  int(12) NOT NULL ,
PRIMARY KEY (`seqid`),
INDEX `iftype` (`iftype`, `unitid`),
INDEX `IX_T_DATAMANAGE_LOG_Starttime` (`starttime`, `unitid`)
)
TYPE=InnoDB
COMMENT='绑定、解绑、延期接口日志'

;

-- ----------------------------
-- Table structure for T_EXCEPTION_CALL
-- ----------------------------
DROP TABLE IF EXISTS `T_EXCEPTION_CALL`;
CREATE TABLE `T_EXCEPTION_CALL` (
`id`  bigint(32) NOT NULL AUTO_INCREMENT ,
`call_id`  varchar(128) NOT NULL ,
`unitid`  varchar(16) NOT NULL ,
`no_a`  varchar(32) NULL DEFAULT '' ,
`no_x`  varchar(20) NULL DEFAULT '' ,
`no_b`  varchar(32) NULL DEFAULT '' ,
`addtime`  datetime NULL DEFAULT '' ,
`exception_code`  varchar(4) NULL DEFAULT '' ,
`description`  varchar(128) NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_ExpireOperationLog
-- ----------------------------
DROP TABLE IF EXISTS `T_ExpireOperationLog`;
CREATE TABLE `T_ExpireOperationLog` (
`ID`  bigint(20) NOT NULL AUTO_INCREMENT ,
`unitid`  varchar(16) NULL DEFAULT '' ,
`unitname`  varchar(128) NULL DEFAULT '' ,
`uidnumber`  varchar(32) NULL DEFAULT '' ,
`phone`  varchar(32) NULL DEFAULT '' ,
`expiretime`  datetime NULL DEFAULT '' ,
`state`  int(11) NULL DEFAULT '' ,
`addtime`  datetime NULL DEFAULT '' ,
`IP`  varchar(32) NULL DEFAULT '' ,
`operator`  varchar(32) NULL DEFAULT '' ,
`uidtype`  varchar(8) NULL DEFAULT '' ,
PRIMARY KEY (`ID`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_FreezingOperationLog
-- ----------------------------
DROP TABLE IF EXISTS `T_FreezingOperationLog`;
CREATE TABLE `T_FreezingOperationLog` (
`ID`  bigint(20) NOT NULL AUTO_INCREMENT ,
`unitid`  varchar(16) NULL DEFAULT '' ,
`unitname`  varchar(128) NULL DEFAULT '' ,
`uidnumber`  varchar(32) NULL DEFAULT '' ,
`phone`  varchar(32) NULL DEFAULT '' ,
`freezingstarttime`  datetime NULL DEFAULT '' ,
`freezingendtime`  datetime NULL DEFAULT '' ,
`state`  int(11) NULL DEFAULT '' ,
`addtime`  datetime NULL DEFAULT '' ,
`IP`  varchar(32) NULL DEFAULT '' ,
`operator`  varchar(32) NULL DEFAULT '' ,
`uidtype`  varchar(8) NULL DEFAULT '' ,
`operType`  int(1) NULL DEFAULT 0 ,
PRIMARY KEY (`ID`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_LASTCALLER
-- ----------------------------
DROP TABLE IF EXISTS `T_LASTCALLER`;
CREATE TABLE `T_LASTCALLER` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`unitid`  varchar(16) NOT NULL ,
`uidnumber`  varchar(20) NOT NULL ,
`lastcalled`  varchar(32) NOT NULL ,
`lastcaller`  varchar(32) NULL DEFAULT '' ,
`calldatetime`  datetime NULL DEFAULT '' ,
`displaycode`  varchar(32) NOT NULL DEFAULT '' ,
PRIMARY KEY (`id`),
INDEX `ind_unitid_uid` (`unitid`, `uidnumber`),
INDEX `ind_called_unitid_uid` (`lastcalled`, `unitid`, `uidnumber`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_ORDER_LOG
-- ----------------------------
DROP TABLE IF EXISTS `T_ORDER_LOG`;
CREATE TABLE `T_ORDER_LOG` (
`id`  varchar(36) NOT NULL ,
`addtime`  datetime NULL DEFAULT '' ,
`unitid`  varchar(16) NULL DEFAULT '' ,
`srcfile`  varchar(255) NULL DEFAULT '' ,
`state`  smallint(6) NULL DEFAULT '' ,
`destfile`  varchar(255) NULL DEFAULT '' ,
`totalcount`  int(11) NULL DEFAULT '' ,
`noreg`  int(11) NULL DEFAULT '' ,
`nocall`  int(11) NULL DEFAULT '' ,
`norec`  int(11) NULL DEFAULT '' ,
`isrec`  int(11) NULL DEFAULT '' ,
`opmodule`  varchar(16) NULL DEFAULT '' ,
`opuser`  varchar(64) NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_PARAMDICT
-- ----------------------------
DROP TABLE IF EXISTS `T_PARAMDICT`;
CREATE TABLE `T_PARAMDICT` (
`paramkey`  varchar(64) NOT NULL ,
`paramname`  varchar(64) NULL DEFAULT '' ,
`descript`  varchar(256) NULL DEFAULT '' ,
`paramType`  varchar(30) NULL DEFAULT '' ,
`paramGroup`  varchar(30) NULL DEFAULT '' ,
`valueset`  varchar(256) NULL DEFAULT '' ,
`addtime`  date NULL DEFAULT '' ,
`operator`  varchar(32) NULL DEFAULT '' ,
`parentid`  varchar(16) NULL DEFAULT '' ,
PRIMARY KEY (`paramkey`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_PARAMTYPE
-- ----------------------------
DROP TABLE IF EXISTS `T_PARAMTYPE`;
CREATE TABLE `T_PARAMTYPE` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`businessKey`  varchar(30) NULL DEFAULT '' ,
`code`  varchar(50) NULL DEFAULT '' ,
`desc`  varchar(100) NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_PLAY_LOG
-- ----------------------------
DROP TABLE IF EXISTS `T_PLAY_LOG`;
CREATE TABLE `T_PLAY_LOG` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`unitid`  varchar(16) NOT NULL ,
`request_id`  varchar(128) NOT NULL ,
`request_time`  datetime NOT NULL ,
`caller`  varchar(32) NULL DEFAULT '' ,
`callee`  varchar(32) NULL DEFAULT '' ,
`callback`  varchar(32) NULL DEFAULT '' ,
`loop_cnt`  smallint(6) NULL DEFAULT '' ,
`rate`  smallint(6) NULL DEFAULT '' ,
`play_file`  varchar(255) NULL DEFAULT '' ,
`play_template`  smallint(6) NULL DEFAULT '' ,
`play_params`  varchar(255) NULL DEFAULT '' ,
`state`  smallint(6) NULL DEFAULT '' ,
`uuid_in_partner`  varchar(128) NULL DEFAULT '' ,
`service_in_partner`  varchar(64) NULL DEFAULT '' ,
`user_data`  varchar(255) NULL DEFAULT '' ,
PRIMARY KEY (`id`, `request_time`),
INDEX `idx_request` (`unitid`, `request_id`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_PLAY_NUMBER
-- ----------------------------
DROP TABLE IF EXISTS `T_PLAY_NUMBER`;
CREATE TABLE `T_PLAY_NUMBER` (
`unitid`  varchar(16) NOT NULL ,
`operator`  varchar(32) NULL DEFAULT '' ,
`groupname`  varchar(64) NOT NULL DEFAULT '' ,
`number`  varchar(64) NOT NULL DEFAULT '' ,
`level`  int(1) NOT NULL ,
`sequenceid`  bigint(32) NOT NULL AUTO_INCREMENT ,
`addtime`  datetime NULL DEFAULT '' ,
PRIMARY KEY (`sequenceid`)
)
TYPE=InnoDB
COMMENT='语音通知号码'

;

-- ----------------------------
-- Table structure for T_PLAY_TEMPLATE
-- ----------------------------
DROP TABLE IF EXISTS `T_PLAY_TEMPLATE`;
CREATE TABLE `T_PLAY_TEMPLATE` (
`unitid`  varchar(16) NOT NULL ,
`template_id`  bigint(20) NOT NULL ,
`operator`  varchar(32) NULL DEFAULT '' ,
`content`  varchar(512) NULL DEFAULT '' ,
`sequenceid`  bigint(32) NOT NULL AUTO_INCREMENT ,
`addtime`  datetime NULL DEFAULT '' ,
PRIMARY KEY (`sequenceid`),
INDEX `template_id` (`template_id`)
)
TYPE=InnoDB
COMMENT='语音通知模板'

;

-- ----------------------------
-- Table structure for T_REGINFO
-- ----------------------------
DROP TABLE IF EXISTS `T_REGINFO`;
CREATE TABLE `T_REGINFO` (
`uidnumber`  varchar(32) NULL DEFAULT '' ,
`regphone`  varchar(32) NULL DEFAULT '' ,
`subid`  bigint(16) NOT NULL AUTO_INCREMENT ,
`regtime`  datetime NULL DEFAULT '' ,
`regmodule`  varchar(16) NULL DEFAULT '' ,
`uidtype`  varchar(8) NULL DEFAULT '' ,
`callrestrict`  varchar(8) NULL DEFAULT '' ,
`callrecording`  varchar(4) NULL DEFAULT '' ,
`anucode`  varchar(64) NULL DEFAULT '' ,
`calldisplay`  varchar(16) NULL DEFAULT '' ,
`productid`  int(11) NULL DEFAULT '' ,
`name`  varchar(32) NULL DEFAULT '' ,
`cardtype`  varchar(32) NULL DEFAULT '' ,
`cardno`  varchar(32) NULL DEFAULT '' ,
`calldisplaynouid`  varchar(16) NULL DEFAULT '' ,
`unitid`  varchar(16) NULL DEFAULT '' ,
`expiretime`  datetime NULL DEFAULT '' ,
`uuidinpartner`  varchar(64) NULL DEFAULT '' ,
`batchworkid`  varchar(36) NULL DEFAULT '' ,
`opuser`  varchar(64) NULL DEFAULT '' ,
`bnucode`  varchar(64) NULL DEFAULT '' ,
PRIMARY KEY (`subid`),
INDEX `ind_reginfo_batchworkid` (`batchworkid`),
INDEX `ind_reginfo_uuidinpartner` (`uuidinpartner`),
INDEX `ind_reginfo_uidnumber` (`uidnumber`),
INDEX `ind_reginfo_regphone` (`regphone`),
INDEX `ind_reginfo_unitid` (`unitid`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_REGINFO_20210323
-- ----------------------------
DROP TABLE IF EXISTS `T_REGINFO_20210323`;
CREATE TABLE `T_REGINFO_20210323` (
`uidnumber`  varchar(16) NULL DEFAULT '' ,
`regphone`  varchar(32) NULL DEFAULT '' ,
`subid`  bigint(16) NOT NULL AUTO_INCREMENT ,
`regtime`  datetime NULL DEFAULT '' ,
`regmodule`  varchar(16) NULL DEFAULT '' ,
`uidtype`  varchar(8) NULL DEFAULT '' ,
`callrestrict`  varchar(8) NULL DEFAULT '' ,
`callrecording`  varchar(4) NULL DEFAULT '' ,
`anucode`  varchar(64) NULL DEFAULT '' ,
`calldisplay`  varchar(16) NULL DEFAULT '' ,
`productid`  int(11) NULL DEFAULT '' ,
`name`  varchar(32) NULL DEFAULT '' ,
`cardtype`  varchar(32) NULL DEFAULT '' ,
`cardno`  varchar(32) NULL DEFAULT '' ,
`calldisplaynouid`  varchar(16) NULL DEFAULT '' ,
`unitid`  varchar(16) NULL DEFAULT '' ,
`expiretime`  datetime NULL DEFAULT '' ,
`uuidinpartner`  varchar(64) NULL DEFAULT '' ,
`batchworkid`  varchar(36) NULL DEFAULT '' ,
`opuser`  varchar(64) NULL DEFAULT '' ,
`bnucode`  varchar(64) NULL DEFAULT '' ,
PRIMARY KEY (`subid`),
INDEX `ind_reginfo_batchworkid` (`batchworkid`),
INDEX `ind_reginfo_uuidinpartner` (`uuidinpartner`),
INDEX `ind_reginfo_uidnumber` (`uidnumber`),
INDEX `ind_reginfo_regphone` (`regphone`),
INDEX `ind_reginfo_unitid` (`unitid`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_REGINFO_EX
-- ----------------------------
DROP TABLE IF EXISTS `T_REGINFO_EX`;
CREATE TABLE `T_REGINFO_EX` (
`subid`  bigint(20) NOT NULL ,
`othermss`  varchar(255) NULL DEFAULT '' ,
PRIMARY KEY (`subid`),
INDEX `othermss` (`othermss`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_REGINFOHIS
-- ----------------------------
DROP TABLE IF EXISTS `T_REGINFOHIS`;
CREATE TABLE `T_REGINFOHIS` (
`hisid`  bigint(16) NOT NULL AUTO_INCREMENT ,
`addtime`  datetime NULL DEFAULT '' ,
`opuidtype`  char(1) NULL DEFAULT '' ,
`uidnumber`  varchar(32) NULL DEFAULT '' ,
`regphone`  varchar(32) NULL DEFAULT '' ,
`subid`  bigint(16) NULL DEFAULT '' ,
`regtime`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`regmodule`  varchar(16) NULL DEFAULT '' ,
`uidtype`  varchar(8) NULL DEFAULT '' ,
`callrestrict`  varchar(8) NULL DEFAULT '' ,
`callrecording`  varchar(4) NULL DEFAULT '' ,
`anucode`  varchar(64) NULL DEFAULT '' ,
`calldisplay`  varchar(16) NULL DEFAULT '' ,
`productid`  int(11) NULL DEFAULT '' ,
`name`  varchar(32) NULL DEFAULT '' ,
`cardtype`  varchar(32) NULL DEFAULT '' ,
`cardno`  varchar(32) NULL DEFAULT '' ,
`calldisplaynouid`  varchar(32) NULL DEFAULT '' ,
`unitid`  varchar(64) NULL DEFAULT '' ,
`expiretime`  datetime NULL DEFAULT '' ,
`logid`  bigint(10) NULL DEFAULT '' ,
`uuidinpartner`  varchar(64) NULL DEFAULT '' ,
`batchworkid`  varchar(36) NULL DEFAULT '' ,
`opuser`  varchar(64) NULL DEFAULT '' ,
`bnucode`  varchar(64) NULL DEFAULT '' ,
PRIMARY KEY (`hisid`, `regtime`),
INDEX `ind_uidnumber` (`uidnumber`),
INDEX `ind_regphone` (`regphone`),
INDEX `ind_uuidinpartner` (`uuidinpartner`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_RETURNED_ORDER
-- ----------------------------
DROP TABLE IF EXISTS `T_RETURNED_ORDER`;
CREATE TABLE `T_RETURNED_ORDER` (
`id`  bigint(16) NOT NULL AUTO_INCREMENT ,
`uuidinpartner`  varchar(64) NULL DEFAULT '' ,
`uidnumber`  varchar(32) NULL DEFAULT '' ,
`regphone`  varchar(32) NULL DEFAULT '' ,
`call_state`  int(1) NULL DEFAULT '' ,
`regtime`  datetime NULL DEFAULT '' ,
`batchworkid`  varchar(36) NULL DEFAULT '' ,
`create_time`  datetime NULL DEFAULT '' ,
`unitid`  varchar(16) NULL DEFAULT '' ,
`opuser`  varchar(64) NULL DEFAULT '' ,
PRIMARY KEY (`id`),
INDEX `create_time` (`create_time`)
)
TYPE=InnoDB
COMMENT='退单查询结果明细'

;

-- ----------------------------
-- Table structure for T_SECTION_HIS
-- ----------------------------
DROP TABLE IF EXISTS `T_SECTION_HIS`;
CREATE TABLE `T_SECTION_HIS` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`addTime`  datetime NULL DEFAULT '' ,
`beginuid`  varchar(255) NULL DEFAULT '' ,
`emplayNumber`  int(11) NULL DEFAULT '' ,
`enduid`  varchar(255) NULL DEFAULT '' ,
`operator`  varchar(255) NULL DEFAULT '' ,
`state`  int(11) NULL DEFAULT '' ,
`unitid`  varchar(255) NULL DEFAULT '' ,
`numType`  int(1) NULL DEFAULT '' ,
PRIMARY KEY (`id`),
UNIQUE INDEX `id` (`id`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_SMS_LOG
-- ----------------------------
DROP TABLE IF EXISTS `T_SMS_LOG`;
CREATE TABLE `T_SMS_LOG` (
`id`  bigint(32) NOT NULL AUTO_INCREMENT ,
`sms_id`  varchar(128) NULL DEFAULT '' ,
`send_unit`  varchar(16) NULL DEFAULT '' ,
`receive_unit`  varchar(255) NULL DEFAULT '' ,
`no_a`  varchar(32) NULL DEFAULT '' ,
`no_x`  varchar(20) NULL DEFAULT '' ,
`no_b`  varchar(32) NULL DEFAULT '' ,
`content`  varchar(1000) NULL DEFAULT '' ,
`sms_status`  int(1) NULL DEFAULT '' ,
`add_time`  datetime NOT NULL ,
`seqid`  varchar(36) NULL DEFAULT '' ,
`call_id`  varchar(128) NULL DEFAULT '' ,
`fee_id`  varchar(64) NULL DEFAULT '' ,
`sms_type`  int(1) NULL DEFAULT '' ,
PRIMARY KEY (`id`, `add_time`),
INDEX `index1` (`no_x`),
INDEX `index2` (`add_time`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_SMS_PARAMS
-- ----------------------------
DROP TABLE IF EXISTS `T_SMS_PARAMS`;
CREATE TABLE `T_SMS_PARAMS` (
`id`  bigint(32) NOT NULL AUTO_INCREMENT ,
`request_url`  varchar(255) NOT NULL ,
`partner_id`  varchar(16) NOT NULL ,
`sms_id`  varchar(128) NOT NULL ,
`user_id`  varchar(128) NOT NULL ,
`unitid`  varchar(16) NOT NULL ,
`add_time`  datetime NOT NULL ,
`opuser`  varchar(32) NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_SMS_TEMPLATE
-- ----------------------------
DROP TABLE IF EXISTS `T_SMS_TEMPLATE`;
CREATE TABLE `T_SMS_TEMPLATE` (
`unitid`  varchar(16) NOT NULL ,
`template_id`  bigint(20) NOT NULL ,
`operator`  varchar(32) NULL DEFAULT '' ,
`content`  varchar(512) NULL DEFAULT '' ,
`sequenceid`  bigint(32) NOT NULL AUTO_INCREMENT ,
`addtime`  datetime NULL DEFAULT '' ,
`delay`  int(6) NULL DEFAULT '' ,
`usertype`  int(10) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`sequenceid`),
INDEX `template_id` (`template_id`)
)
TYPE=InnoDB
COMMENT='短信内容模板'

;

-- ----------------------------
-- Table structure for T_TAGHISTORY
-- ----------------------------
DROP TABLE IF EXISTS `T_TAGHISTORY`;
CREATE TABLE `T_TAGHISTORY` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`tag_number`  varchar(50) NULL DEFAULT '' ,
`tag_name`  varchar(50) NULL DEFAULT '' ,
`tag_publication`  varchar(50) NULL DEFAULT '' ,
`operationTime`  datetime NULL DEFAULT '' ,
`tag_type`  varchar(30) NULL DEFAULT '' ,
`operator`  varchar(30) NULL DEFAULT '' ,
`tag_success`  varchar(20) NULL DEFAULT '' ,
`tag_sum`  varchar(20) NULL DEFAULT '' ,
`hisUid`  varchar(249) NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_TAGNUMBER
-- ----------------------------
DROP TABLE IF EXISTS `T_TAGNUMBER`;
CREATE TABLE `T_TAGNUMBER` (
`id`  int(12) NOT NULL AUTO_INCREMENT ,
`number`  varchar(30) NULL DEFAULT '' ,
`tagName`  varchar(30) NULL DEFAULT '' ,
`tagIconUrl`  varchar(200) NULL DEFAULT '' ,
`publication`  varchar(30) NULL DEFAULT '' ,
`tagType`  varchar(30) NULL DEFAULT '' ,
`tagProvince`  varchar(10) NULL DEFAULT '' ,
`tagCity`  varchar(10) NULL DEFAULT '' ,
`numberTip`  varchar(30) NULL DEFAULT '' ,
`webSite`  varchar(255) NULL DEFAULT '' ,
`tagAddress`  varchar(50) NULL DEFAULT '' ,
`operator`  varchar(30) NULL DEFAULT '' ,
`operatorTime`  datetime NULL DEFAULT '' ,
`tagUid`  varchar(255) NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_TBILLSUM
-- ----------------------------
DROP TABLE IF EXISTS `T_TBILLSUM`;
CREATE TABLE `T_TBILLSUM` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`day`  varchar(20) NULL DEFAULT '' ,
`unitId`  varchar(50) NULL DEFAULT '' ,
`AXBCall`  int(10) NULL DEFAULT '' ,
`AXBPrice`  decimal(10,3) NULL DEFAULT '' ,
`AXBSum`  decimal(10,2) NULL DEFAULT '' ,
`ACall`  int(10) NULL DEFAULT '' ,
`APrice`  decimal(10,3) NULL DEFAULT '' ,
`ASum`  decimal(10,2) NULL DEFAULT '' ,
`BCall`  int(10) NULL DEFAULT '' ,
`BPrice`  decimal(10,3) NULL DEFAULT '' ,
`BSum`  decimal(10,2) NULL DEFAULT '' ,
`PCall`  int(10) NULL DEFAULT '' ,
`PPrice`  decimal(10,3) NULL DEFAULT '' ,
`PSum`  decimal(10,2) NULL DEFAULT '' ,
`PartSum`  decimal(10,2) NULL DEFAULT '' ,
`safeNumCall`  int(10) NULL DEFAULT '' ,
`safeNumPrice`  decimal(10,3) NULL DEFAULT '' ,
`safeNumSum`  decimal(10,2) NULL DEFAULT '' ,
`postCall`  int(10) NULL DEFAULT '' ,
`postPrice`  decimal(10,3) NULL DEFAULT '' ,
`postSum`  decimal(10,2) NULL DEFAULT '' ,
`monthSum`  decimal(10,2) NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_TBINDBILL
-- ----------------------------
DROP TABLE IF EXISTS `T_TBINDBILL`;
CREATE TABLE `T_TBINDBILL` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`day`  varchar(20) NULL DEFAULT '' ,
`unitId`  varchar(20) NULL DEFAULT '' ,
`numType`  varchar(20) NULL DEFAULT '' ,
`successC`  int(10) NULL DEFAULT '' ,
`successPrice`  decimal(10,3) NULL DEFAULT '' ,
`successSum`  decimal(10,2) NULL DEFAULT '' ,
`partnerC`  int(11) NULL DEFAULT '' ,
`partnerPrice`  decimal(10,3) NULL DEFAULT '' ,
`partnerSum`  decimal(10,2) NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_TCALLBILL
-- ----------------------------
DROP TABLE IF EXISTS `T_TCALLBILL`;
CREATE TABLE `T_TCALLBILL` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`day`  varchar(100) NULL DEFAULT '' ,
`unitId`  varchar(100) NULL DEFAULT '' ,
`callType`  varchar(100) NULL DEFAULT '' ,
`countCall`  int(10) NULL DEFAULT '' ,
`countAnswer`  int(10) NULL DEFAULT '' ,
`SType`  varchar(11) NULL DEFAULT '' ,
`SPrice`  decimal(20,3) NULL DEFAULT '' ,
`STotal`  decimal(10,2) NULL DEFAULT '' ,
`SSType`  varchar(20) NULL DEFAULT '' ,
`SSPrice`  decimal(15,3) NULL DEFAULT '' ,
`SSTotal`  decimal(10,2) NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_TCALLDIAL
-- ----------------------------
DROP TABLE IF EXISTS `T_TCALLDIAL`;
CREATE TABLE `T_TCALLDIAL` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
`binding_day`  varchar(50) NULL DEFAULT '' ,
`day`  varchar(50) NULL DEFAULT '' ,
`unitId`  varchar(20) NULL DEFAULT '' ,
`call_tel_count`  int(20) NULL DEFAULT '' ,
`call_fail_tel`  int(20) NULL DEFAULT '' ,
`will_call_num`  int(20) NULL DEFAULT '' ,
`call_count`  int(20) NULL DEFAULT '' ,
`Ringing_count`  int(20) NULL DEFAULT '' ,
`bind_success_count`  int(20) NULL DEFAULT '' ,
`success_count`  int(20) NULL DEFAULT '' ,
`fail_count`  int(20) NULL DEFAULT '' ,
`fail_tel_call`  int(20) NULL DEFAULT '' ,
`call_time_count`  int(20) NULL DEFAULT '' ,
`call_time_avg`  int(15) NULL DEFAULT '' ,
`call_sum`  int(20) NULL DEFAULT '' ,
`call_sums`  int(20) NULL DEFAULT '' ,
`addtime`  datetime NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB

;


-- ----------------------------
-- Table structure for T_TNUMBERFLAG
-- ----------------------------
DROP TABLE IF EXISTS `T_TNUMBERFLAG`;
CREATE TABLE `T_TNUMBERFLAG` (
`id`  int(12) NOT NULL AUTO_INCREMENT ,
`phone`  varchar(30) NULL DEFAULT '' ,
`name`  varchar(30) NULL DEFAULT '' ,
`markerType`  varchar(50) NULL DEFAULT '' ,
`logo`  varchar(200) NULL DEFAULT '' ,
`t_user`  varchar(200) NULL DEFAULT '' ,
`category`  varchar(200) NULL DEFAULT '' ,
`tagProvince`  varchar(10) NULL DEFAULT '' ,
`tagCity`  varchar(10) NULL DEFAULT '' ,
`webSite`  varchar(255) NULL DEFAULT '' ,
`company`  varchar(50) NULL DEFAULT '' ,
`t_group`  varchar(50) NULL DEFAULT '' ,
`operator`  varchar(30) NULL DEFAULT '' ,
`operatorTime`  datetime NULL DEFAULT '' ,
`tagUid`  varchar(255) NULL DEFAULT '' ,
`typeOff`  varchar(20) NOT NULL ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_UIDLIST
-- ----------------------------
DROP TABLE IF EXISTS `T_UIDLIST`;
CREATE TABLE `T_UIDLIST` (
`uidnumber`  varchar(20) NOT NULL ,
`state`  int(11) NULL DEFAULT '' ,
`unitid`  varchar(16) NULL DEFAULT '' ,
`operator`  varchar(32) NULL DEFAULT '' ,
`addtime`  varchar(20) NULL DEFAULT '' ,
`uidtype`  varchar(8) NULL DEFAULT '' ,
`modifiedtime`  datetime NULL DEFAULT '' ,
PRIMARY KEY (`uidnumber`),
INDEX `ind_state_modi` (`state`, `modifiedtime`, `unitid`),
INDEX `ind_unid_uid` (`unitid`, `uidnumber`, `state`),
INDEX `ind_unid_st_uidtype` (`unitid`, `state`, `uidtype`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_UIDLIST_RESERVED
-- ----------------------------
DROP TABLE IF EXISTS `T_UIDLIST_RESERVED`;
CREATE TABLE `T_UIDLIST_RESERVED` (
`sequenceid`  int(11) NOT NULL AUTO_INCREMENT ,
`uidnumber`  varchar(20) NOT NULL ,
`state`  int(11) NULL DEFAULT '' ,
`unitid`  varchar(16) NULL DEFAULT '' ,
`operator`  varchar(32) NULL DEFAULT '' ,
`addtime`  varchar(20) NULL DEFAULT '' ,
`uidtype`  varchar(8) NULL DEFAULT '' ,
`modifiedtime`  datetime NULL DEFAULT '' ,
`reusetime`  datetime NULL DEFAULT '' ,
`regphone`  varchar(32) NULL DEFAULT '' ,
PRIMARY KEY (`sequenceid`),
INDEX `ind_unid_uid` (`unitid`, `uidnumber`),
INDEX `ind_reusetime` (`reusetime`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_UIDPHONE
-- ----------------------------
DROP TABLE IF EXISTS `T_UIDPHONE`;
CREATE TABLE `T_UIDPHONE` (
`subid`  bigint(16) NULL DEFAULT '' ,
`uidnumber`  varchar(32) NULL DEFAULT '' ,
`phone`  varchar(32) NULL DEFAULT '' ,
`phonegrade`  int(11) NULL DEFAULT '' ,
`regtime`  datetime NULL DEFAULT '' ,
`sequenceid`  bigint(16) NOT NULL AUTO_INCREMENT ,
`unitid`  varchar(16) NULL DEFAULT '' ,
`uidtype`  varchar(8) NULL DEFAULT '' ,
PRIMARY KEY (`sequenceid`),
INDEX `ind_unitid_uid_phone` (`unitid`, `uidnumber`, `phone`),
INDEX `ind_uidphone_ups` (`subid`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_UIDPHONE_20210323
-- ----------------------------
DROP TABLE IF EXISTS `T_UIDPHONE_20210323`;
CREATE TABLE `T_UIDPHONE_20210323` (
`subid`  bigint(16) NULL DEFAULT '' ,
`uidnumber`  varchar(16) NULL DEFAULT '' ,
`phone`  varchar(32) NULL DEFAULT '' ,
`phonegrade`  int(11) NULL DEFAULT '' ,
`regtime`  datetime NULL DEFAULT '' ,
`sequenceid`  bigint(16) NOT NULL AUTO_INCREMENT ,
`unitid`  varchar(16) NULL DEFAULT '' ,
`uidtype`  varchar(8) NULL DEFAULT '' ,
PRIMARY KEY (`sequenceid`),
INDEX `ind_unitid_uid_phone` (`unitid`, `uidnumber`, `phone`),
INDEX `ind_uidphone_ups` (`subid`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_UIDPHONEHIS
-- ----------------------------
DROP TABLE IF EXISTS `T_UIDPHONEHIS`;
CREATE TABLE `T_UIDPHONEHIS` (
`hisid`  bigint(16) NOT NULL AUTO_INCREMENT ,
`addtime`  datetime NULL DEFAULT '' ,
`opuidtype`  char(1) NULL DEFAULT '' ,
`subid`  varchar(16) NULL DEFAULT '' ,
`uidnumber`  varchar(32) NULL DEFAULT '' ,
`phone`  varchar(32) NULL DEFAULT '' ,
`phonegrade`  int(11) NULL DEFAULT '' ,
`regtime`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ,
`sequenceid`  varchar(32) NULL DEFAULT '' ,
`unitid`  varchar(16) NULL DEFAULT '' ,
PRIMARY KEY (`hisid`, `regtime`),
INDEX `ind_subid_opuidtype` (`subid`, `opuidtype`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_UidStateStatistics
-- ----------------------------
DROP TABLE IF EXISTS `T_UidStateStatistics`;
CREATE TABLE `T_UidStateStatistics` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`day`  varchar(10) NULL DEFAULT '' ,
`unitId`  varchar(16) NULL DEFAULT '' ,
`uidType`  char(1) NULL DEFAULT '' ,
`number_day_count`  bigint(32) NULL DEFAULT 0 ,
`number_count`  bigint(32) NULL DEFAULT 0 ,
`number`  bigint(32) NULL DEFAULT 0 ,
`recoverNum_day_count`  bigint(32) NULL DEFAULT 0 ,
`recoverNum_count`  bigint(32) NULL DEFAULT 0 ,
`recoverNum_time`  bigint(255) NULL DEFAULT 0 ,
`usedNum_day_count`  bigint(32) NULL DEFAULT 0 ,
`unusedNum_day_count`  bigint(32) NULL DEFAULT 0 ,
`freezNum_day_count`  bigint(32) NULL DEFAULT 0 ,
`totalNum_day_count`  bigint(32) NULL DEFAULT 0 ,
`addtime`  datetime NULL DEFAULT '' ,
PRIMARY KEY (`id`),
INDEX `ind_dayuu` (`day`, `unitId`, `uidType`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_UidStatistics
-- ----------------------------
DROP TABLE IF EXISTS `T_UidStatistics`;
CREATE TABLE `T_UidStatistics` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`day`  varchar(10) NOT NULL ,
`unitId`  varchar(16) NOT NULL ,
`uidType`  int(1) NOT NULL ,
`bindingNum_day_count`  bigint(32) NULL DEFAULT 0 ,
`bindingNum_day`  bigint(32) NULL DEFAULT 0 ,
`removeNum_day_count`  bigint(32) NULL DEFAULT 0 ,
`removeNum_day`  bigint(32) NULL DEFAULT 0 ,
`freezNum_day_count`  bigint(32) NULL DEFAULT 0 ,
`reservedNum_day_count`  bigint(32) NULL DEFAULT 0 ,
`boundNum_count`  bigint(32) NULL DEFAULT 0 ,
`boundNum`  bigint(32) NULL DEFAULT 0 ,
`removedNum_count`  bigint(32) NULL DEFAULT 0 ,
`removedNum`  bigint(32) NULL DEFAULT 0 ,
`freezNum_count`  bigint(32) NULL DEFAULT 0 ,
`addtime`  datetime NULL DEFAULT '' ,
`bindTotal_day_count`  varchar(20) NULL DEFAULT '0' ,
`bindFail_day_count`  varchar(20) NULL DEFAULT '0' ,
PRIMARY KEY (`id`),
INDEX `ind_day_uu` (`day`, `unitId`, `uidType`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_UNIT
-- ----------------------------
DROP TABLE IF EXISTS `T_UNIT`;
CREATE TABLE `T_UNIT` (
`unitid`  varchar(16) NOT NULL ,
`unitname`  varchar(128) NULL DEFAULT '' ,
`unittype`  varchar(32) NULL DEFAULT '' ,
`unitkey`  varchar(64) NULL DEFAULT '' ,
`unitadd`  varchar(128) NULL DEFAULT '' ,
`unittel`  varchar(64) NULL DEFAULT '' ,
`unitmobile`  varchar(64) NULL DEFAULT '' ,
`unitcontact`  varchar(64) NULL DEFAULT '' ,
`parentid`  varchar(16) NULL DEFAULT '' ,
`addtime`  datetime NULL DEFAULT '' ,
`operator`  varchar(32) NULL DEFAULT '' ,
`unituidnumber`  varchar(16) NULL DEFAULT '' ,
`addtimes`  varchar(255) NULL DEFAULT '' ,
`safeNumberUser`  varchar(255) NULL DEFAULT '' ,
PRIMARY KEY (`unitid`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_UNIT_UIDSECTION
-- ----------------------------
DROP TABLE IF EXISTS `T_UNIT_UIDSECTION`;
CREATE TABLE `T_UNIT_UIDSECTION` (
`sequenceid`  bigint(20) NOT NULL AUTO_INCREMENT ,
`unitid`  varchar(16) NOT NULL ,
`beginuid`  varchar(12) NOT NULL ,
`enduid`  varchar(12) NOT NULL ,
`countuid`  int(11) NOT NULL ,
`starttime`  date NULL DEFAULT '' ,
`endtime`  date NULL DEFAULT '' ,
`numType`  int(1) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`sequenceid`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for T_UNITPARAM
-- ----------------------------
DROP TABLE IF EXISTS `T_UNITPARAM`;
CREATE TABLE `T_UNITPARAM` (
`unitid`  varchar(16) NULL DEFAULT '' ,
`paramkey`  varchar(64) NULL DEFAULT '' ,
`paramvalue`  varchar(256) NULL DEFAULT '' ,
`addtime`  datetime NULL DEFAULT '' ,
`operator`  varchar(32) NULL DEFAULT '' ,
`sequenceid`  bigint(32) NOT NULL AUTO_INCREMENT ,
`parentid`  varchar(16) NULL DEFAULT '' ,
PRIMARY KEY (`sequenceid`),
INDEX `ind_uid_key` (`unitid`, `paramkey`)
)
TYPE=InnoDB

;

-- ----------------------------
-- Table structure for UNIT_OP_LOG
-- ----------------------------
DROP TABLE IF EXISTS `UNIT_OP_LOG`;
CREATE TABLE `UNIT_OP_LOG` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`username`  varchar(50) NULL DEFAULT '' ,
`operation`  varchar(50) NULL DEFAULT '' ,
`method`  varchar(200) NULL DEFAULT '' ,
`params`  varchar(5000) NULL DEFAULT '' ,
`ip`  varchar(64) NULL DEFAULT '' ,
`create_date`  datetime NULL DEFAULT '' ,
`unitid`  varchar(20) NULL DEFAULT '' ,
`result_code`  int(3) NULL DEFAULT '' ,
`msg`  varchar(255) NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB
COMMENT='企业用户操作日志'

;

-- ----------------------------
-- Table structure for UNIT_ROLE
-- ----------------------------
DROP TABLE IF EXISTS `UNIT_ROLE`;
CREATE TABLE `UNIT_ROLE` (
`role_id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`role_name`  varchar(100) NULL DEFAULT '' ,
`create_user_id`  bigint(20) NULL DEFAULT '' ,
`create_time`  datetime NULL DEFAULT '' ,
`remark`  varchar(100) NULL DEFAULT '' ,
PRIMARY KEY (`role_id`)
)
TYPE=InnoDB
COMMENT='企业角色表'

;

-- ----------------------------
-- Table structure for UNIT_ROLE_MENU
-- ----------------------------
DROP TABLE IF EXISTS `UNIT_ROLE_MENU`;
CREATE TABLE `UNIT_ROLE_MENU` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`role_id`  bigint(20) NULL DEFAULT '' ,
`menu_id`  bigint(20) NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB
COMMENT='企业角色资源表'

;

-- ----------------------------
-- Table structure for UNIT_USER_ROLE
-- ----------------------------
DROP TABLE IF EXISTS `UNIT_USER_ROLE`;
CREATE TABLE `UNIT_USER_ROLE` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`user_id`  bigint(20) NULL DEFAULT '' ,
`role_id`  bigint(20) NULL DEFAULT '' ,
PRIMARY KEY (`id`)
)
TYPE=InnoDB
COMMENT='企业用户角色关系表'

;


-- ----------------------------
-- Auto increment value for ALL_BUSINESS_BIND_COUNT
-- ----------------------------
ALTER TABLE `ALL_BUSINESS_BIND_COUNT` AUTO_INCREMENT=2740;

-- ----------------------------
-- Auto increment value for ARC_95013
-- ----------------------------
ALTER TABLE `ARC_95013` AUTO_INCREMENT=156400590;

-- ----------------------------
-- Auto increment value for C_CALL_AB
-- ----------------------------
ALTER TABLE `C_CALL_AB` AUTO_INCREMENT=55;

-- ----------------------------
-- Auto increment value for C_UNIT_OP_LOG
-- ----------------------------
ALTER TABLE `C_UNIT_OP_LOG` AUTO_INCREMENT=3890;

-- ----------------------------
-- Auto increment value for C_UNIT_ROLE_MENU
-- ----------------------------
ALTER TABLE `C_UNIT_ROLE_MENU` AUTO_INCREMENT=1798;

-- ----------------------------
-- Auto increment value for C_UNIT_USER
-- ----------------------------
ALTER TABLE `C_UNIT_USER` AUTO_INCREMENT=84;

-- ----------------------------
-- Auto increment value for C_UNIT_USER_ROLE
-- ----------------------------
ALTER TABLE `C_UNIT_USER_ROLE` AUTO_INCREMENT=84;

-- ----------------------------
-- Auto increment value for OP_LOG
-- ----------------------------
ALTER TABLE `OP_LOG` AUTO_INCREMENT=416;

-- ----------------------------
-- Auto increment value for reply_cdr
-- ----------------------------
ALTER TABLE `reply_cdr` AUTO_INCREMENT=148264;

-- ----------------------------
-- Auto increment value for SYS_BILLLOG
-- ----------------------------
ALTER TABLE `SYS_BILLLOG` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for SYS_BILLSET
-- ----------------------------
ALTER TABLE `SYS_BILLSET` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for SYS_DATA_CLEAR
-- ----------------------------
ALTER TABLE `SYS_DATA_CLEAR` AUTO_INCREMENT=4094;

-- ----------------------------
-- Auto increment value for SYS_MENU
-- ----------------------------
ALTER TABLE `SYS_MENU` AUTO_INCREMENT=134;

-- ----------------------------
-- Auto increment value for SYS_PRIVILEGE
-- ----------------------------
ALTER TABLE `SYS_PRIVILEGE` AUTO_INCREMENT=2040;

-- ----------------------------
-- Auto increment value for SYS_ROLE
-- ----------------------------
ALTER TABLE `SYS_ROLE` AUTO_INCREMENT=78;

-- ----------------------------
-- Auto increment value for SYS_USER
-- ----------------------------
ALTER TABLE `SYS_USER` AUTO_INCREMENT=418;

-- ----------------------------
-- Auto increment value for SYS_USER_ROLE
-- ----------------------------
ALTER TABLE `SYS_USER_ROLE` AUTO_INCREMENT=459;

-- ----------------------------
-- Auto increment value for SYS_WEB_MENU
-- ----------------------------
ALTER TABLE `SYS_WEB_MENU` AUTO_INCREMENT=110;

-- ----------------------------
-- Auto increment value for SYS_WEB_PRIVILEGE
-- ----------------------------
ALTER TABLE `SYS_WEB_PRIVILEGE` AUTO_INCREMENT=2337;

-- ----------------------------
-- Auto increment value for SYS_WEB_ROLE
-- ----------------------------
ALTER TABLE `SYS_WEB_ROLE` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for SYS_WEB_ROLETABLE
-- ----------------------------
ALTER TABLE `SYS_WEB_ROLETABLE` AUTO_INCREMENT=21;

-- ----------------------------
-- Auto increment value for SYS_WEB_TREE
-- ----------------------------
ALTER TABLE `SYS_WEB_TREE` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for t_bindingnumber
-- ----------------------------
ALTER TABLE `t_bindingnumber` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for T_BLACKLIST
-- ----------------------------
ALTER TABLE `T_BLACKLIST` AUTO_INCREMENT=1410065716;

-- ----------------------------
-- Auto increment value for T_CALL_WEEK_STATS
-- ----------------------------
ALTER TABLE `T_CALL_WEEK_STATS` AUTO_INCREMENT=789871;

-- ----------------------------
-- Auto increment value for T_CallStatistics
-- ----------------------------
ALTER TABLE `T_CallStatistics` AUTO_INCREMENT=31889;

-- ----------------------------
-- Auto increment value for T_ConfigLog
-- ----------------------------
ALTER TABLE `T_ConfigLog` AUTO_INCREMENT=1410116466;

-- ----------------------------
-- Auto increment value for T_EXCEPTION_CALL
-- ----------------------------
ALTER TABLE `T_EXCEPTION_CALL` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for T_ExpireOperationLog
-- ----------------------------
ALTER TABLE `T_ExpireOperationLog` AUTO_INCREMENT=1413144827;

-- ----------------------------
-- Auto increment value for T_FreezingOperationLog
-- ----------------------------
ALTER TABLE `T_FreezingOperationLog` AUTO_INCREMENT=1416255432;

-- ----------------------------
-- Auto increment value for T_LASTCALLER
-- ----------------------------
ALTER TABLE `T_LASTCALLER` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for T_PARAMTYPE
-- ----------------------------
ALTER TABLE `T_PARAMTYPE` AUTO_INCREMENT=49;

-- ----------------------------
-- Auto increment value for T_PLAY_LOG
-- ----------------------------
ALTER TABLE `T_PLAY_LOG` AUTO_INCREMENT=309;

-- ----------------------------
-- Auto increment value for T_PLAY_NUMBER
-- ----------------------------
ALTER TABLE `T_PLAY_NUMBER` AUTO_INCREMENT=374;

-- ----------------------------
-- Auto increment value for T_PLAY_TEMPLATE
-- ----------------------------
ALTER TABLE `T_PLAY_TEMPLATE` AUTO_INCREMENT=189;

-- ----------------------------
-- Auto increment value for T_REGINFO
-- ----------------------------
ALTER TABLE `T_REGINFO` AUTO_INCREMENT=1410878025;

-- ----------------------------
-- Auto increment value for T_REGINFO_20210323
-- ----------------------------
ALTER TABLE `T_REGINFO_20210323` AUTO_INCREMENT=87440680;

-- ----------------------------
-- Auto increment value for T_REGINFOHIS
-- ----------------------------
ALTER TABLE `T_REGINFOHIS` AUTO_INCREMENT=1438545217;

-- ----------------------------
-- Auto increment value for T_RETURNED_ORDER
-- ----------------------------
ALTER TABLE `T_RETURNED_ORDER` AUTO_INCREMENT=1410065410;

-- ----------------------------
-- Auto increment value for T_SECTION_HIS
-- ----------------------------
ALTER TABLE `T_SECTION_HIS` AUTO_INCREMENT=684;

-- ----------------------------
-- Auto increment value for T_SMS_LOG
-- ----------------------------
ALTER TABLE `T_SMS_LOG` AUTO_INCREMENT=60;

-- ----------------------------
-- Auto increment value for T_SMS_PARAMS
-- ----------------------------
ALTER TABLE `T_SMS_PARAMS` AUTO_INCREMENT=9;

-- ----------------------------
-- Auto increment value for T_SMS_TEMPLATE
-- ----------------------------
ALTER TABLE `T_SMS_TEMPLATE` AUTO_INCREMENT=12;

-- ----------------------------
-- Auto increment value for T_TAGHISTORY
-- ----------------------------
ALTER TABLE `T_TAGHISTORY` AUTO_INCREMENT=11;

-- ----------------------------
-- Auto increment value for T_TAGNUMBER
-- ----------------------------
ALTER TABLE `T_TAGNUMBER` AUTO_INCREMENT=1405006;

-- ----------------------------
-- Auto increment value for T_TBILLSUM
-- ----------------------------
ALTER TABLE `T_TBILLSUM` AUTO_INCREMENT=1793;

-- ----------------------------
-- Auto increment value for T_TBINDBILL
-- ----------------------------
ALTER TABLE `T_TBINDBILL` AUTO_INCREMENT=2175;

-- ----------------------------
-- Auto increment value for T_TCALLBILL
-- ----------------------------
ALTER TABLE `T_TCALLBILL` AUTO_INCREMENT=3166;

-- ----------------------------
-- Auto increment value for T_TCALLDIAL
-- ----------------------------
ALTER TABLE `T_TCALLDIAL` AUTO_INCREMENT=72797;

-- ----------------------------
-- Auto increment value for T_TNUMBERFLAG
-- ----------------------------
ALTER TABLE `T_TNUMBERFLAG` AUTO_INCREMENT=1585903;

-- ----------------------------
-- Auto increment value for T_UIDLIST_RESERVED
-- ----------------------------
ALTER TABLE `T_UIDLIST_RESERVED` AUTO_INCREMENT=16647576;

-- ----------------------------
-- Auto increment value for T_UIDPHONE
-- ----------------------------
ALTER TABLE `T_UIDPHONE` AUTO_INCREMENT=1410553319;

-- ----------------------------
-- Auto increment value for T_UIDPHONE_20210323
-- ----------------------------
ALTER TABLE `T_UIDPHONE_20210323` AUTO_INCREMENT=46996873;

-- ----------------------------
-- Auto increment value for T_UIDPHONEHIS
-- ----------------------------
ALTER TABLE `T_UIDPHONEHIS` AUTO_INCREMENT=1424357065;

-- ----------------------------
-- Auto increment value for T_UidStateStatistics
-- ----------------------------
ALTER TABLE `T_UidStateStatistics` AUTO_INCREMENT=60064;

-- ----------------------------
-- Auto increment value for T_UidStatistics
-- ----------------------------
ALTER TABLE `T_UidStatistics` AUTO_INCREMENT=33608;

-- ----------------------------
-- Auto increment value for T_UNIT_UIDSECTION
-- ----------------------------
ALTER TABLE `T_UNIT_UIDSECTION` AUTO_INCREMENT=622;

-- ----------------------------
-- Auto increment value for T_UNITPARAM
-- ----------------------------
ALTER TABLE `T_UNITPARAM` AUTO_INCREMENT=2696;

-- ----------------------------
-- Auto increment value for UNIT_OP_LOG
-- ----------------------------
ALTER TABLE `UNIT_OP_LOG` AUTO_INCREMENT=11322;

-- ----------------------------
-- Auto increment value for UNIT_ROLE
-- ----------------------------
ALTER TABLE `UNIT_ROLE` AUTO_INCREMENT=60;

-- ----------------------------
-- Auto increment value for UNIT_ROLE_MENU
-- ----------------------------
ALTER TABLE `UNIT_ROLE_MENU` AUTO_INCREMENT=4002;

-- ----------------------------
-- Auto increment value for UNIT_USER_ROLE
-- ----------------------------
ALTER TABLE `UNIT_USER_ROLE` AUTO_INCREMENT=340;
