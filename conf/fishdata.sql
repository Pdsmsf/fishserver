/*
Navicat MySQL Data Transfer

Source Server         : 211.152.2.23
Source Server Version : 50173
Source Host           : 211.152.2.23:3306
Source Database       : fish

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-01-05 12:42:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for access
-- ----------------------------
DROP TABLE IF EXISTS `access`;
CREATE TABLE `access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `pid` smallint(6) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for active
-- ----------------------------
DROP TABLE IF EXISTS `active`;
CREATE TABLE `active` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'è‡ªå¢žid',
  `server_id` tinyint(2) DEFAULT NULL COMMENT 'æœåŠ¡å™¨id',
  `label_id` tinyint(5) DEFAULT NULL COMMENT 'æ ‡ç­¾id',
  `title` varchar(32) DEFAULT NULL COMMENT 'æ ‡é¢˜',
  `type` int(10) DEFAULT NULL COMMENT 'æ´»åŠ¨ç±»åž‹',
  `condition` int(10) DEFAULT NULL COMMENT 'å®Œæˆæ¡ä»¶',
  `number` int(10) DEFAULT NULL COMMENT 'å®Œæˆæ•°é‡',
  `area` int(10) DEFAULT NULL COMMENT 'æ´»åŠ¨åŒºåŸŸ',
  `icon` varchar(70) DEFAULT NULL COMMENT 'æ ‡é¢˜å›¾æ ‡',
  `image` varchar(70) DEFAULT NULL COMMENT 'æ´»åŠ¨å›¾ç‰‡',
  `status` tinyint(1) DEFAULT '1' COMMENT 'è¿›åº¦æ¡1:æ˜¾ç¤º 0:ä¸æ˜¾ç¤º',
  `start` date DEFAULT NULL COMMENT 'å¼€å§‹æ—¶é—´',
  `stop` date DEFAULT NULL COMMENT 'ç»“æŸæ—¶é—´',
  `tool_id` varchar(32) DEFAULT NULL COMMENT 'é“å…·id(æ‰€æœ‰é“å…·idé›†åˆ)',
  `tool_num` varchar(32) DEFAULT NULL COMMENT 'é“å…·æ•°é‡(æ•°é‡é›†åˆ)',
  `tool_info` text COMMENT 'é“å…·ä¿¡æ¯',
  `create_person` varchar(32) DEFAULT NULL COMMENT 'æ“ä½œäºº',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for catch
-- ----------------------------
DROP TABLE IF EXISTS `catch`;
CREATE TABLE `catch` (
  `id` tinyint(2) NOT NULL AUTO_INCREMENT COMMENT 'è‡ªå¢žid',
  `number` varchar(32) DEFAULT NULL COMMENT 'æ•èŽ·ç³»æ•°',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for code
-- ----------------------------
DROP TABLE IF EXISTS `code`;
CREATE TABLE `code` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'è‡ªå¢žid',
  `server_id` tinyint(2) DEFAULT NULL COMMENT 'æœåŠ¡å™¨id',
  `type_id` tinyint(2) DEFAULT NULL COMMENT 'ä½¿ç”¨ç±»åž‹1:æ™®é€š 2:ä¸‡ç”¨',
  `number` varchar(5) DEFAULT NULL COMMENT 'å…‘æ¢ç ç¼–å·',
  `code_name` varchar(32) DEFAULT NULL COMMENT 'å…‘æ¢ç åç§°',
  `code` varchar(32) DEFAULT NULL COMMENT 'å…‘æ¢ç ',
  `code_num` int(10) DEFAULT NULL COMMENT 'å…‘æ¢ç æ•°é‡',
  `used_num` int(10) DEFAULT NULL COMMENT 'ä½¿ç”¨æ¬¡æ•°',
  `tool_info` text COMMENT 'é“å…·å‘æ”¾ä¿¡æ¯',
  `create_person` varchar(32) DEFAULT NULL COMMENT 'åˆ›å»ºäºº',
  `create_time` int(11) DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `start_time` varchar(32) DEFAULT NULL COMMENT 'å¼€å§‹æ—¶é—´',
  `stop_time` varchar(32) DEFAULT NULL COMMENT 'ç»“æŸæ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for email
-- ----------------------------
DROP TABLE IF EXISTS `email`;
CREATE TABLE `email` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'è‡ªå¢žid',
  `server_id` tinyint(2) DEFAULT NULL COMMENT 'æœåŠ¡å™¨id',
  `title` varchar(20) NOT NULL COMMENT 'é‚®ä»¶æ ‡é¢˜',
  `content` varchar(255) NOT NULL COMMENT 'é‚®ä»¶æ­£æ–‡',
  `flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:æ™®é€šé‚®ä»¶ 1:é“å…·é‚®ä»¶',
  `target` varchar(20) NOT NULL DEFAULT 'all' COMMENT 'æŽ¥å—å¯¹è±¡ all single',
  `user_id` int(10) DEFAULT NULL COMMENT 'æŽ¥æ”¶äººidï¼ˆæŒ‡å®šæ‰æœ‰ï¼‰',
  `send_person` varchar(10) DEFAULT NULL COMMENT 'å‘é€äºº',
  `email_date` date DEFAULT NULL COMMENT 'é‚®ä»¶åˆ›å»ºæ—¥æœŸ',
  `send_time` int(11) DEFAULT NULL COMMENT 'å‘é€æ—¶é—´(åˆ›å»ºæ—¶é—´)',
  `tool_id` varchar(32) DEFAULT NULL COMMENT 'é“å…·id(æ‰€æœ‰é“å…·idçš„é›†åˆ)',
  `tool_num` varchar(32) DEFAULT NULL COMMENT 'é“å…·æ•°(æ‰€æœ‰é“å…·æ•°é›†åˆ)',
  `tool_info` text COMMENT 'é“å…·å‘æ”¾ä¿¡æ¯',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'å‘é€çŠ¶æ€0:å¤±è´¥ 1:æˆåŠŸ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for exchange
-- ----------------------------
DROP TABLE IF EXISTS `exchange`;
CREATE TABLE `exchange` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'è‡ªå¢žid',
  `server_id` int(2) DEFAULT NULL COMMENT 'æœåŠ¡å™¨id',
  `label` varchar(5) DEFAULT NULL COMMENT 'æ ‡ç­¾id',
  `goods_name` varchar(32) DEFAULT NULL COMMENT 'ç‰©å“id',
  `price` decimal(10,2) DEFAULT NULL COMMENT 'ç‰©å“ä»·æ ¼',
  `image` varchar(70) DEFAULT NULL COMMENT 'å›¾ç‰‡è·¯å¾„',
  `start` varchar(32) DEFAULT NULL COMMENT 'å¼€å§‹æ—¶é—´',
  `stop` varchar(32) DEFAULT NULL COMMENT 'ç»“æŸæ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for exchange_record
-- ----------------------------
DROP TABLE IF EXISTS `exchange_record`;
CREATE TABLE `exchange_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'è‡ªå¢žid',
  `server_id` int(2) DEFAULT NULL COMMENT 'æœåŠ¡å™¨id',
  `goods_name` varchar(32) DEFAULT NULL COMMENT 'å®žç‰©åç§°',
  `price` int(10) DEFAULT NULL COMMENT 'å®žç‰©ä»·æ ¼',
  `user_name` varchar(32) DEFAULT NULL COMMENT 'çŽ©å®¶åç§°',
  `phone` varchar(32) DEFAULT NULL COMMENT 'çŽ©å®¶æ‰‹æœºå·',
  `status` int(11) DEFAULT '3' COMMENT '-1:å‘è´§å¤±è´¥0:å‡†å¤‡å‘è´§1:å·²å‘è´§2:å·²æ”¶è´§3:æ— ',
  `time` date DEFAULT NULL COMMENT 'å…‘æ¢æ—¶é—´',
  `remark` text COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for function
-- ----------------------------
DROP TABLE IF EXISTS `function`;
CREATE TABLE `function` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'è‡ªå¢žid',
  `server_id` tinyint(2) DEFAULT NULL COMMENT 'æœåŠ¡å™¨id',
  `fight` tinyint(1) DEFAULT NULL COMMENT 'çº¦æˆ˜æŒ‰é”® 1:å¼€ 0:å…³',
  `give` tinyint(1) DEFAULT NULL COMMENT 'èµ é€æŒ‰é”® 1:å¼€ 0:å…³',
  `guide` tinyint(1) DEFAULT NULL COMMENT 'å¥½è¯„å¼•å¯¼æŒ‰é”® 1å¼€0å…³',
  `share` tinyint(1) DEFAULT NULL COMMENT 'åˆ†äº«æŒ‰é”® 1:å¼€ 0:å…³',
  `reword` tinyint(1) DEFAULT NULL COMMENT 'åˆ†äº«å¥–åŠ± 1:å¼€ 0:å…³',
  `share_one` tinyint(1) DEFAULT NULL COMMENT 'åˆ†äº«æ¸ é“1  1:å¼€ 0:å…³',
  `share_two` tinyint(1) DEFAULT NULL COMMENT 'åˆ†äº«æ¸ é“2  1:å¼€ 0:å…³',
  `share_three` tinyint(1) DEFAULT NULL COMMENT 'åˆ†äº«æ¸ é“3  1:å¼€ 0:å…³',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for game_notice
-- ----------------------------
DROP TABLE IF EXISTS `game_notice`;
CREATE TABLE `game_notice` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'è‡ªå¢žid',
  `server_id` tinyint(2) DEFAULT NULL COMMENT 'æœåŠ¡å™¨id',
  `title` varchar(32) DEFAULT NULL COMMENT 'æ ‡é¢˜',
  `content` text COMMENT 'å†…å®¹',
  `image` varchar(70) DEFAULT NULL COMMENT 'æ–‡ä»¶è·¯åŠ²',
  `create_time` int(11) DEFAULT NULL COMMENT 'åˆ›å»ºæ—¥æœŸ',
  `create_person` varchar(32) DEFAULT NULL COMMENT 'åˆ›å»ºäºº',
  `start_time` date DEFAULT NULL COMMENT 'å¼€å§‹æ—¶é—´',
  `stop_time` date DEFAULT NULL COMMENT 'ç»“æŸæ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `title` varchar(50) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` mediumint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'è‡ªå¢žid',
  `name` varchar(32) DEFAULT NULL COMMENT 'æ ‡ç­¾åç§°',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'è‡ªå¢žid',
  `user_id` tinyint(3) DEFAULT NULL COMMENT 'è´¦å·id',
  `date` date DEFAULT NULL COMMENT 'æ—¥æœŸ',
  `status` tinyint(1) DEFAULT NULL COMMENT 'çŠ¶æ€1:ç¡®å®š 0:å–æ¶ˆ 6:å·²å¤„ç†',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for node
-- ----------------------------
DROP TABLE IF EXISTS `node`;
CREATE TABLE `node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `group_id` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'è‡ªå¢žid',
  `server_id` tinyint(2) DEFAULT NULL COMMENT 'æœåŠ¡å™¨id',
  `content` text COMMENT 'é€šå‘Šå†…å®¹',
  `create_time` int(11) DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´æˆ³',
  `create_person` varchar(32) DEFAULT NULL COMMENT 'åˆ›å»ºäºº',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for profit
-- ----------------------------
DROP TABLE IF EXISTS `profit`;
CREATE TABLE `profit` (
  `id` int(13) NOT NULL AUTO_INCREMENT COMMENT 'è‡ªå¢žid',
  `server_id` tinyint(5) DEFAULT NULL COMMENT 'æœåŠ¡å™¨id',
  `scene_id` int(11) DEFAULT NULL COMMENT 'åœºæ¬¡id',
  `profit` int(11) DEFAULT NULL COMMENT 'ç›ˆåˆ©å€¼',
  `date` date DEFAULT NULL COMMENT 'æ—¥æœŸ',
  `time` varchar(32) DEFAULT NULL COMMENT 'æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for recharge
-- ----------------------------
DROP TABLE IF EXISTS `recharge`;
CREATE TABLE `recharge` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'è‡ªå¢žid',
  `server_id` tinyint(2) DEFAULT NULL COMMENT 'æœåŠ¡å™¨id',
  `order_id` varchar(50) DEFAULT '' COMMENT 'è®¢å•å·',
  `user_id` varchar(50) DEFAULT '' COMMENT 'çŽ©å®¶id',
  `amount` int(50) DEFAULT NULL COMMENT 'å……å€¼é‡‘é¢',
  `recharge_date` date DEFAULT NULL COMMENT 'å……å€¼æ—¥æœŸ',
  `status` tinyint(1) DEFAULT NULL COMMENT 'å……å€¼çŠ¶æ€1:æˆåŠŸ0:å¤±è´¥',
  `remark` varchar(32) DEFAULT '' COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for recharge2
-- ----------------------------
DROP TABLE IF EXISTS `recharge2`;
CREATE TABLE `recharge2` (
  `account` varchar(50) DEFAULT NULL,
  `source` varchar(50) DEFAULT NULL,
  `trade_no` varchar(50) NOT NULL,
  `amount` varchar(50) NOT NULL,
  `partner` varchar(50) DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`trade_no`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `ename` varchar(5) DEFAULT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `ename` (`ename`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for scene
-- ----------------------------
DROP TABLE IF EXISTS `scene`;
CREATE TABLE `scene` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'è‡ªå¢žid',
  `server_id` tinyint(2) DEFAULT NULL COMMENT 'æœåŠ¡å™¨id',
  `name` varchar(32) DEFAULT NULL COMMENT 'åœºæ¬¡åç§°',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for scene_record
-- ----------------------------
DROP TABLE IF EXISTS `scene_record`;
CREATE TABLE `scene_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'è‡ªå¢žid',
  `server_id` tinyint(2) DEFAULT NULL COMMENT 'æœåŠ¡å™¨id',
  `scene_id` int(10) DEFAULT NULL COMMENT 'åœºæ¬¡id',
  `scene_num` tinyint(2) DEFAULT NULL COMMENT 'åœºæ¬¡äººæ•°',
  `get_value` int(10) DEFAULT NULL COMMENT 'ç›ˆåˆ©å€¼',
  `normalState` int(5) DEFAULT NULL COMMENT 'æ­£å¸¸çŠ¶æ€çš„æˆ¿é—´æ•°',
  `killState` int(5) DEFAULT NULL COMMENT 'æ€åˆ†çŠ¶æ€çš„æˆ¿é—´æ•°',
  `eliminateState` int(5) DEFAULT NULL COMMENT 'æ¶ˆåˆ†çŠ¶æ€çš„æˆ¿é—´æ”¶',
  `catch` decimal(10,2) DEFAULT NULL COMMENT 'æ•èŽ·ç³»æ•°',
  `record_time` int(13) DEFAULT NULL COMMENT 'è®°å½•æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for server
-- ----------------------------
DROP TABLE IF EXISTS `server`;
CREATE TABLE `server` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT COMMENT 'è‡ªå¢žid',
  `name` varchar(32) DEFAULT NULL COMMENT 'æœåŠ¡å™¨åç§°',
  `ip` varchar(32) DEFAULT NULL COMMENT 'æœåŠ¡å™¨IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for status_record
-- ----------------------------
DROP TABLE IF EXISTS `status_record`;
CREATE TABLE `status_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'è‡ªå¢žid',
  `server_id` int(1) DEFAULT NULL COMMENT 'æœåŠ¡å™¨id',
  `account` int(10) DEFAULT NULL COMMENT 'çŽ©å®¶id',
  `content` text COMMENT 'å°åœæˆ–è§£å°åŽŸå› ',
  `hours` int(10) DEFAULT NULL COMMENT 'å°åœæ—¶é—´ï¼ˆå°æ—¶ï¼‰',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´',
  `flag` tinyint(1) DEFAULT NULL COMMENT '1:å°åœ 2:è§£å°',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_login
-- ----------------------------
DROP TABLE IF EXISTS `t_login`;
CREATE TABLE `t_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'è‡ªå¢žid',
  `account` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'è´¦æˆ·',
  `source` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'ç™»å½•IP',
  `login_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'ç™»å½•æ—¶é—´',
  `logout_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'é€€å‡ºæ—¶é—´',
  `gold0` int(11) DEFAULT NULL COMMENT 'ç™»é™†æ—¶é‡‘å¸',
  `gold1` int(11) DEFAULT NULL COMMENT 'é€€å‡ºæ—¶é‡‘å¸',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1742 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `account` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'è´¦æˆ·',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'æ˜µç§°',
  `level` int(5) DEFAULT NULL COMMENT 'ç­‰çº§',
  `vipLv` int(5) DEFAULT NULL COMMENT 'vipç­‰çº§',
  `gold` int(20) DEFAULT '0' COMMENT 'é‡‘å¸',
  `gem` int(10) DEFAULT '0' COMMENT 'é’»çŸ³',
  `bullion` int(10) DEFAULT NULL COMMENT 'é‡‘æ¡',
  `money` int(10) unsigned DEFAULT NULL COMMENT 'å……å€¼é¢',
  `bronzeBox` int(5) unsigned DEFAULT NULL COMMENT 'é’é“œå®ç®±',
  `silverBox` int(5) unsigned DEFAULT '0' COMMENT 'ç™½é“¶å®ç®±',
  `goldBox` int(5) DEFAULT NULL COMMENT 'é»„é‡‘å®ç®±',
  `platinumBox` int(5) DEFAULT NULL COMMENT 'ç™½é‡‘å®ç®±',
  `gemBox` int(5) DEFAULT NULL COMMENT 'é’»çŸ³å®ç®±',
  `isSign` tinyint(2) DEFAULT NULL COMMENT 'æ˜¯å¦ç­¾åˆ°',
  `dayNum` int(10) DEFAULT NULL,
  `totalTime` float(10,4) DEFAULT NULL,
  `bigMatchInfo` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'å¤§å¥–èµ›æ–°æ‰‹åœºæ•°æ®',
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `acc` varchar(50) CHARACTER SET utf8 DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tool
-- ----------------------------
DROP TABLE IF EXISTS `tool`;
CREATE TABLE `tool` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'è‡ªå¢žid',
  `type` int(3) DEFAULT NULL COMMENT 'ç±»åž‹ 1:å®žç‰© 2:è¯è´¹ 3:å‚èµ›åˆ¸ 4:å®ç®±',
  `name` varchar(10) NOT NULL COMMENT 'é“å…·åç§°',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1406 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tool_provide
-- ----------------------------
DROP TABLE IF EXISTS `tool_provide`;
CREATE TABLE `tool_provide` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'è‡ªå¢žid',
  `server_id` tinyint(2) DEFAULT NULL COMMENT 'æœåŠ¡å™¨id',
  `target` varchar(32) DEFAULT NULL COMMENT 'ç”¨æˆ·ç±»åž‹ all single',
  `user_id` int(10) DEFAULT NULL COMMENT 'ç”¨æˆ·id',
  `tool_id` int(5) DEFAULT NULL COMMENT 'é“å…·id',
  `tool_num` int(10) DEFAULT NULL COMMENT 'é“å…·æ•°é‡',
  `channel` varchar(32) DEFAULT NULL COMMENT 'å‘é€é€”å¾„',
  `time` date DEFAULT NULL COMMENT 'å‘æ”¾æ—¶é—´',
  `person` varchar(32) DEFAULT NULL COMMENT 'æ“ä½œäºº',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'è‡ªå¢žid',
  `account` varchar(64) NOT NULL COMMENT 'è´¦å·',
  `nickname` varchar(50) NOT NULL COMMENT 'æ˜µç§°',
  `password` char(32) NOT NULL COMMENT 'å¯†ç ',
  `bind_account` varchar(50) NOT NULL COMMENT 'ç»‘å®šè´¦å·',
  `last_login_time` int(11) unsigned DEFAULT '0' COMMENT 'æœ€åŽç™»å½•æ—¶é—´',
  `last_login_ip` varchar(40) DEFAULT NULL COMMENT 'æœ€åŽç™»é™†ip',
  `login_count` mediumint(8) unsigned DEFAULT '0' COMMENT 'ç™»é™†æ¬¡æ•°',
  `verify` varchar(32) DEFAULT NULL COMMENT 'éªŒè¯ç ',
  `email` varchar(50) NOT NULL COMMENT 'é‚®ç®±',
  `remark` varchar(255) NOT NULL COMMENT 'å¤‡æ³¨',
  `create_time` int(11) unsigned NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_time` int(11) unsigned NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `status` tinyint(1) DEFAULT '0' COMMENT 'çŠ¶æ€',
  `type_id` tinyint(2) unsigned DEFAULT '0' COMMENT 'ç±»åž‹id',
  `info` text NOT NULL COMMENT 'ä¿¡æ¯',
  `email_num` int(2) DEFAULT '0' COMMENT 'å‘é‚®ä»¶æ•°',
  `session` int(3) DEFAULT NULL COMMENT 'sessionä¿¡æ¯',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for userGoldChange
-- ----------------------------
DROP TABLE IF EXISTS `userGoldChange`;
CREATE TABLE `userGoldChange` (
  `account` varchar(50) NOT NULL,
  `gold` int(20) DEFAULT NULL,
  `gem` int(20) DEFAULT NULL,
  `bullion` int(20) DEFAULT NULL,
  `box` int(10) DEFAULT NULL,
  PRIMARY KEY (`account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Procedure structure for insertLogin
-- ----------------------------
DROP PROCEDURE IF EXISTS `insertLogin`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertLogin`(IN inacc varchar(50), IN insource varchar(50))
BEGIN
INSERT INTO t_login(`acc`,`source`,`login_time`,`logout_time`)VALUES(inacc, insource, now(), 0);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for updateLogout
-- ----------------------------
DROP PROCEDURE IF EXISTS `updateLogout`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateLogout`(IN acc bigint(20))
BEGIN
	UPDATE t_login SET logout_time = NOW() WHERE t_login.id = id;
END
;;
DELIMITER ;
