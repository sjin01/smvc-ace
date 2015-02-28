/*
Navicat MySQL Data Transfer

Source Server         : linli inner DB
Source Server Version : 50613
Source Host           : 192.168.2.211:3306
Source Database       : eduz100

Target Server Type    : MYSQL
Target Server Version : 50613
File Encoding         : 65001

Date: 2015-02-28 09:12:55
*/


SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ac_app`
-- ----------------------------
DROP TABLE IF EXISTS `ac_app`;
CREATE TABLE `ac_app` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '应用系统id',
  `APPNAME` varchar(256) COLLATE utf8_bin NOT NULL COMMENT '应用系统名称',
  `APPCODE` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '应用系统代码',
  `STATUS` varchar(2) COLLATE utf8_bin DEFAULT '0' COMMENT '应用系统状态',
  `APPURL` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'app对应服务器的URL',
  `MEMO` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `INDEX_AC_APP_1` (`APPCODE`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='应用系统';

-- ----------------------------
-- Records of ac_app
-- ----------------------------
INSERT INTO `ac_app` VALUES ('1', '临澧区县平台', '临澧区县平台', '0', 'http://localhost:8080/eduz100', '临澧区县平台');

-- ----------------------------
-- Table structure for `ac_dict`
-- ----------------------------
DROP TABLE IF EXISTS `ac_dict`;
CREATE TABLE `ac_dict` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典ID',
  `TYPEID` int(11) NOT NULL COMMENT '字典类别ID',
  `TNAME` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '字典项名称',
  `TVALUE` varchar(256) COLLATE utf8_bin NOT NULL COMMENT '字典项目值',
  `SORTID` int(11) NOT NULL DEFAULT '0' COMMENT '排序编号，即显示的顺序',
  `MEMO` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

-- ----------------------------
-- Records of ac_dict
-- ----------------------------
INSERT INTO `ac_dict` VALUES ('1', '2', '运行中', '0', '0', null);
INSERT INTO `ac_dict` VALUES ('2', '2', '已经停止', '1', '1', null);
INSERT INTO `ac_dict` VALUES ('3', '4', '正常', '1', '0', null);
INSERT INTO `ac_dict` VALUES ('4', '4', '冻结', '2', '1', null);
INSERT INTO `ac_dict` VALUES ('5', '5', '普通节点', '0', '0', null);
INSERT INTO `ac_dict` VALUES ('6', '5', '菜单', '1', '1', null);
INSERT INTO `ac_dict` VALUES ('7', '5', '功能', '2', '2', null);

-- ----------------------------
-- Table structure for `ac_dict_type`
-- ----------------------------
DROP TABLE IF EXISTS `ac_dict_type`;
CREATE TABLE `ac_dict_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典类别ID',
  `TNAME` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '字典类别名称',
  `TCODE` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '字典类别代码',
  `SORTID` int(11) NOT NULL DEFAULT '0' COMMENT '排序编号，即显示的顺序',
  `MEMO` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `INDEX_1` (`TCODE`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典类别表';

-- ----------------------------
-- Records of ac_dict_type
-- ----------------------------
INSERT INTO `ac_dict_type` VALUES ('5', '功能类型', 'func_type', '0', null);
INSERT INTO `ac_dict_type` VALUES ('2', '应用状态', 'app_status', '0', null);
INSERT INTO `ac_dict_type` VALUES ('4', '操作员状态', 'operator_status', '0', null);

-- ----------------------------
-- Table structure for `ac_func`
-- ----------------------------
DROP TABLE IF EXISTS `ac_func`;
CREATE TABLE `ac_func` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '功能id',
  `FUNCNAME` varchar(512) COLLATE utf8_bin NOT NULL COMMENT '功能名称',
  `FUNCCODE` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '功能代码 ，用于识别一个功能',
  `FUNCACTION` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '功能动作，对应URL',
  `FUNCICON` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '功能图标',
  `FUNCTYPE` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '功能类型：0 普通节点 ， 1 菜单， 2 功能',
  `FUNCSEQ` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '功能序列，如1-2-3',
  `SORTID` int(11) DEFAULT '0' COMMENT '排序编号，即显示的顺序',
  `PARENTID` int(11) DEFAULT NULL COMMENT '父功能ID',
  `APPID` int(11) NOT NULL COMMENT '应用系统id',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `INDEX_AC_FUNC_1` (`FUNCCODE`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='功能信息表';

-- ----------------------------
-- Records of ac_func
-- ----------------------------
INSERT INTO `ac_func` VALUES ('10', '系统管理', 'xitongguanli', '', 'fa-tachometer', '0', '6-10', '99', '6', '1');
INSERT INTO `ac_func` VALUES ('6', '区县平台', 'quxianpingtai', '', 'fa-desktop', '0', '6', '0', null, '1');
INSERT INTO `ac_func` VALUES ('13', '应用管理', 'yingyongguanli', '/sys/application', 'fa-caret-right', '1', '6-10-13', '1', '10', '1');
INSERT INTO `ac_func` VALUES ('15', '功能菜单管理', 'gongnengcaidanguanli', '/sys/func', 'fa-caret-right', '1', '6-10-15', '2', '10', '1');
INSERT INTO `ac_func` VALUES ('17', '机构管理', 'jigouguanli', '/sys/organization', 'fa-caret-right', '1', '6-10-17', '3', '10', '1');
INSERT INTO `ac_func` VALUES ('19', '角色管理', 'jueseguanli', '/sys/role', 'fa-caret-right', '1', '6-10-19', '4', '10', '1');
INSERT INTO `ac_func` VALUES ('20', '用户管理', 'yonghuguanli', '/sys/operator', 'fa-caret-right', '1', '6-10-20', '5', '10', '1');
INSERT INTO `ac_func` VALUES ('27', '内部邮箱', 'neibuyouxiang', '', 'fa-envelope-o', '0', '6-27', '4', '6', '1');
INSERT INTO `ac_func` VALUES ('30', '通知', 'tongzhi', '', 'fa-bell-o', '0', '6-30', '2', '6', '1');
INSERT INTO `ac_func` VALUES ('33', '查看', 'tongzhiliebiao', '/oa/notification/display', 'fa fa-caret-right', '1', '6-30-33', '2', '30', '1');
INSERT INTO `ac_func` VALUES ('32', '管理', 'tongzhiguanli', '/oa/notification', 'fa fa-caret-right', '1', '6-30-32', '1', '30', '1');
INSERT INTO `ac_func` VALUES ('51', '新增或编辑', 'saveoredit', '/oa/addressBook/addOrEdit', 'fa-desktop', '2', '6-49-50-51', '1', '50', '1');
INSERT INTO `ac_func` VALUES ('50', '通讯薄', 'addressBookList', '/oa/addressBook', 'fa-caret-right', '1', '6-49-50', '1', '49', '1');
INSERT INTO `ac_func` VALUES ('49', '通讯录', 'tongxilu', '', 'fa-book', '0', '6-49', '5', '6', '1');
INSERT INTO `ac_func` VALUES ('61', '数据填报任务', 'shujuliebiao', '/data/person', '', '1', '6-59-61', '9', '59', '1');
INSERT INTO `ac_func` VALUES ('62', '个人设置', 'userprofile', '/userprofile', 'fa-cog', '0', '6-62', '98', '6', '1');
INSERT INTO `ac_func` VALUES ('60', '发起数据收集', 'dingyibiaozhun', '/data/collect', 'fa-crosshairs', '1', '6-59-60', '8', '59', '1');
INSERT INTO `ac_func` VALUES ('59', '数据收集', 'shujushouji', '', 'fa-building-o', '0', '6-59', '7', '6', '1');
INSERT INTO `ac_func` VALUES ('94', '添加用户', 'tianjiayonghu', '/sys/operator/detail', 'fa fa-caret-right', '2', '6-10-20-94', '1', '20', '1');
INSERT INTO `ac_func` VALUES ('64', '公文', 'publicword', '/oa/officialdocument', 'fa-folder-open-o', '0', '6-64', '3', '6', '1');
INSERT INTO `ac_func` VALUES ('66', '我要批阅', 'reviewod', '/oa/officialdocument', 'fa-caret-right', '1', '6-64-66', '2', '64', '1');
INSERT INTO `ac_func` VALUES ('65', '我要发文', 'newod', '/oa/officialdocument/release', 'fa-caret-right', '1', '6-64-65', '1', '64', '1');
INSERT INTO `ac_func` VALUES ('67', '草稿箱', 'tempod', '/oa/officialdocument/draft', 'fa-caret-right', '1', '6-64-67', '4', '64', '1');
INSERT INTO `ac_func` VALUES ('68', '跟踪列表', 'monitorod', '/oa/officialdocument/monitor', 'fa-caret-right', '1', '6-64-68', '3', '64', '1');
INSERT INTO `ac_func` VALUES ('69', '档案柜', 'recordod', '/oa/officialdocument/record', 'fa fa-caret-right', '1', '6-64-69', '6', '64', '1');
INSERT INTO `ac_func` VALUES ('81', '博客公文', 'bkgw', '127.0.0.1/BKGW', 'fa-graduation-cap', '1', '6-64-81', '5', '64', '1');
INSERT INTO `ac_func` VALUES ('75', '草稿箱', 'oa_mail_draft', '/oa/email/inbox?flag=draft', 'fa fa-caret-right', '1', '6-27-75', '3', '27', '1');
INSERT INTO `ac_func` VALUES ('73', '收件箱', 'oa_mail_receive', '/oa/email/inbox?flag=inbox', 'fa fa-caret-right', '1', '6-27-73', '2', '27', '1');
INSERT INTO `ac_func` VALUES ('74', '发件箱', 'oa_mail_send', '/oa/email/inbox?flag=sent', 'fa fa-caret-right', '1', '6-27-74', '2', '27', '1');
INSERT INTO `ac_func` VALUES ('76', '写邮件', 'oa_mail_write', '/oa/email/inbox?flag=write', 'fa-envelope-o', '1', '6-27-76', '1', '27', '1');
INSERT INTO `ac_func` VALUES ('77', '个人信息', 'personal', '/userprofile/tab_info', 'fa-user', '1', '6-62-77', '1', '62', '1');
INSERT INTO `ac_func` VALUES ('78', '公章管理', 'sealmanager', '/userprofile/tab_sealmanager', 'fa-pencil', '1', '6-62-78', '2', '62', '1');
INSERT INTO `ac_func` VALUES ('79', '设置', 'settings', '/userprofile/tab_settings', 'fa-cog', '1', '6-62-79', '3', '62', '1');
INSERT INTO `ac_func` VALUES ('89', '通讯记录', 'tongxunjilu', '/oa/chat', 'fa-comment-o', '1', '6-49-89', '2', '49', '1');

-- ----------------------------
-- Table structure for `ac_funcgroup`
-- ----------------------------
DROP TABLE IF EXISTS `ac_funcgroup`;
CREATE TABLE `ac_funcgroup` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '功能分组id',
  `FUNCGROUPNAME` varchar(256) COLLATE utf8_bin NOT NULL COMMENT '功能分组名称',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='功能分组';

-- ----------------------------
-- Records of ac_funcgroup
-- ----------------------------

-- ----------------------------
-- Table structure for `ac_loginlog`
-- ----------------------------
DROP TABLE IF EXISTS `ac_loginlog`;
CREATE TABLE `ac_loginlog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '登录日志id',
  `USERNAME` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '操作员姓名',
  `USERCODE` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '登录帐号',
  `OPERID` int(11) DEFAULT NULL COMMENT '操作员id',
  `LOGINTIME` datetime NOT NULL COMMENT '登入时间',
  `LOGOUTTIME` datetime DEFAULT NULL COMMENT '登出时间',
  `LOGIP` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='登录日志表';

-- ----------------------------
-- Records of ac_loginlog
-- ----------------------------

-- ----------------------------
-- Table structure for `ac_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ac_menu`;
CREATE TABLE `ac_menu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单 id',
  `APPID` int(11) NOT NULL COMMENT '应用系统id',
  `MENUNAME` varchar(512) COLLATE utf8_bin NOT NULL COMMENT '菜单名称',
  `PARENTID` int(11) NOT NULL COMMENT '父菜单id, 根菜单的父菜单id为 0',
  `MENUSEQ` varchar(256) COLLATE utf8_bin NOT NULL COMMENT '菜单序号   各级父菜单编号 通过 - 连接起来\r\n            比如   0-111-3332\r\n            根菜单序号就是自己的id号 ',
  `SORTID` int(11) NOT NULL DEFAULT '0' COMMENT '排序编号，即显示的顺序',
  `FUNCID` int(11) DEFAULT NULL COMMENT '对应功能id  可以为null ，表示未挂钩功能',
  `MENUICON` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单图标',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单表';

-- ----------------------------
-- Records of ac_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `ac_operator`
-- ----------------------------
DROP TABLE IF EXISTS `ac_operator`;
CREATE TABLE `ac_operator` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作员id',
  `USERCODE` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '登录帐号',
  `USERNAME` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '操作员姓名',
  `PASSWORD` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '密码, 加密后的',
  `STATUS` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '操作员状态 1 正常  2 冻结',
  `AUTHMODE` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '认证模式 1： 本地认证  2：LDAP',
  `BINDUSERCODE` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '绑定用户代码，用于LDAP模式，使用另外的代码登录LDAP',
  `TELNUMBER` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '联系电话',
  `EMAIL` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '电子邮件',
  `CREATER` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者姓名',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `BELONGORGID` int(11) DEFAULT '0' COMMENT '所属机构id',
  `IMGURL` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '个人头像地址',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `INDEX_OPER_1` (`USERCODE`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='操作员表';

-- ----------------------------
-- Records of ac_operator
-- ----------------------------
INSERT INTO `ac_operator` VALUES ('1', 'admin', '超级管理员', '4ef08f21a8dcf6ce17ce01c3a8588e53', '1', '1', null, '15576652266', 'admin@qq.com', null, null, '0', '/eos/image/jpeg/20150128/59779c0fa6dd0a5bff10b913f539a8a9.jpg');
INSERT INTO `ac_operator` VALUES ('2', 'tom', '汤姆', '4ef08f21a8dcf6ce17ce01c3a8588e53', '1', '1', null, '15576652266', '', null, null, '0', '/eos/image/jpeg/20150128/59779c0fa6dd0a5bff10b913f539a8a9.jpg');
INSERT INTO `ac_operator` VALUES ('3', 'jerry', '杰瑞', '4ef08f21a8dcf6ce17ce01c3a8588e53', '1', '1', null, '', '', null, null, '52', null);
INSERT INTO `ac_operator` VALUES ('4', 'tangxiaolin', '唐小林', '4ef08f21a8dcf6ce17ce01c3a8588e53', '1', '1', null, '18711083379', '694666820@qq.co', null, null, '0', '/eos/image/gif/20150211/1b782a97a9f3a43107d75e6d93c3abdc.gif');
INSERT INTO `ac_operator` VALUES ('7', 'liumei', '刘美', '4ef08f21a8dcf6ce17ce01c3a8588e53', '1', '1', null, '15616869959', '694686820@qq.com', null, null, '0', null);
INSERT INTO `ac_operator` VALUES ('6', 'jiangjie', '蒋杰', '4ef08f21a8dcf6ce17ce01c3a8588e53', '1', '1', null, '', '', null, null, '0', '/eos/image/gif/20150130/c9828b0c154307c64bd58c440f598d61.gif');
INSERT INTO `ac_operator` VALUES ('8', 'cc', '张小西', '4ef08f21a8dcf6ce17ce01c3a8588e53', '1', '1', null, '', '', null, null, '15', null);
INSERT INTO `ac_operator` VALUES ('11', 'testing', '测试', '4ef08f21a8dcf6ce17ce01c3a8588e53', '1', '1', null, '111111111411', '1@1', null, null, '0', null);
INSERT INTO `ac_operator` VALUES ('10', '179977619@qq.com', '聪哥', 'zRYjsoA0SGA6YsCEfKEjBQ==', '1', '1', null, null, null, null, null, '0', null);
INSERT INTO `ac_operator` VALUES ('12', '1', '1', '592dbbcee7bd7fa10525d9b66ddffc3f', '1', '1', null, '', '', null, null, '0', null);
INSERT INTO `ac_operator` VALUES ('18', '2', '2', '4ef08f21a8dcf6ce17ce01c3a8588e53', '1', '1', null, '3214', '', null, null, '59', null);
INSERT INTO `ac_operator` VALUES ('17', 'xiaozhang', '校长', '4ef08f21a8dcf6ce17ce01c3a8588e53', '1', '1', null, '', '', null, null, '0', null);
INSERT INTO `ac_operator` VALUES ('19', '3', '3', '4ef08f21a8dcf6ce17ce01c3a8588e53', '1', '1', null, '', '', null, null, '275', null);
INSERT INTO `ac_operator` VALUES ('20', 'ttttest', 'ttttest', '4ef08f21a8dcf6ce17ce01c3a8588e53', '1', '1', null, '', '', null, null, '277', null);
INSERT INTO `ac_operator` VALUES ('26', '23', '23', '4ef08f21a8dcf6ce17ce01c3a8588e53', '1', '1', null, '', '', null, null, '0', null);
INSERT INTO `ac_operator` VALUES ('27', '32', '543', '4ef08f21a8dcf6ce17ce01c3a8588e53', '1', '1', null, '', '', null, null, '0', null);
INSERT INTO `ac_operator` VALUES ('31', 'tangxiao', '唐小', '4ef08f21a8dcf6ce17ce01c3a8588e53', '1', '1', null, '', '', null, null, '0', null);

-- ----------------------------
-- Table structure for `ac_operlog`
-- ----------------------------
DROP TABLE IF EXISTS `ac_operlog`;
CREATE TABLE `ac_operlog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作日志id',
  `OPERID` int(11) DEFAULT NULL COMMENT '操作员id',
  `USERCODE` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '登录帐号',
  `USERNAME` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '操作员姓名 ( 冗余存放 )',
  `LOGTIME` datetime NOT NULL COMMENT '操作时间',
  `LOGCONTENT` longtext COLLATE utf8_bin COMMENT '操作内容',
  `LOGIP` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='操作日志';

-- ----------------------------
-- Records of ac_operlog
-- ----------------------------

-- ----------------------------
-- Table structure for `ac_oper_func`
-- ----------------------------
DROP TABLE IF EXISTS `ac_oper_func`;
CREATE TABLE `ac_oper_func` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `OPERID` int(11) NOT NULL COMMENT '操作员id',
  `FUNCID` int(11) NOT NULL COMMENT '对应功能id  可以为null ，表示未挂钩功能',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='操作员对应功能表';

-- ----------------------------
-- Records of ac_oper_func
-- ----------------------------

-- ----------------------------
-- Table structure for `ac_oper_org_relation`
-- ----------------------------
DROP TABLE IF EXISTS `ac_oper_org_relation`;
CREATE TABLE `ac_oper_org_relation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `OPERID` int(11) NOT NULL COMMENT '操作员ID',
  `ORGID` int(11) NOT NULL COMMENT '机构ID',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='操作员 - 所属机构关系表（多对多关系）';

-- ----------------------------
-- Records of ac_oper_org_relation
-- ----------------------------
INSERT INTO `ac_oper_org_relation` VALUES ('132', '17', '13');
INSERT INTO `ac_oper_org_relation` VALUES ('2', '3', '52');
INSERT INTO `ac_oper_org_relation` VALUES ('123', '4', '9');
INSERT INTO `ac_oper_org_relation` VALUES ('122', '4', '36');
INSERT INTO `ac_oper_org_relation` VALUES ('121', '4', '35');
INSERT INTO `ac_oper_org_relation` VALUES ('120', '4', '34');
INSERT INTO `ac_oper_org_relation` VALUES ('119', '4', '16');
INSERT INTO `ac_oper_org_relation` VALUES ('66', '8', '15');
INSERT INTO `ac_oper_org_relation` VALUES ('115', '7', '52');
INSERT INTO `ac_oper_org_relation` VALUES ('114', '7', '38');
INSERT INTO `ac_oper_org_relation` VALUES ('113', '7', '37');
INSERT INTO `ac_oper_org_relation` VALUES ('112', '7', '35');
INSERT INTO `ac_oper_org_relation` VALUES ('118', '4', '15');
INSERT INTO `ac_oper_org_relation` VALUES ('111', '7', '28');
INSERT INTO `ac_oper_org_relation` VALUES ('110', '7', '33');
INSERT INTO `ac_oper_org_relation` VALUES ('67', '8', '54');
INSERT INTO `ac_oper_org_relation` VALUES ('109', '7', '21');
INSERT INTO `ac_oper_org_relation` VALUES ('108', '7', '31');
INSERT INTO `ac_oper_org_relation` VALUES ('131', '17', '31');
INSERT INTO `ac_oper_org_relation` VALUES ('130', '17', '32');
INSERT INTO `ac_oper_org_relation` VALUES ('139', '2', '9');
INSERT INTO `ac_oper_org_relation` VALUES ('138', '2', '8');
INSERT INTO `ac_oper_org_relation` VALUES ('90', '6', '37');
INSERT INTO `ac_oper_org_relation` VALUES ('91', '6', '38');
INSERT INTO `ac_oper_org_relation` VALUES ('117', '4', '33');
INSERT INTO `ac_oper_org_relation` VALUES ('116', '4', '13');
INSERT INTO `ac_oper_org_relation` VALUES ('27', '1', '9');
INSERT INTO `ac_oper_org_relation` VALUES ('89', '6', '9');
INSERT INTO `ac_oper_org_relation` VALUES ('124', '4', '37');
INSERT INTO `ac_oper_org_relation` VALUES ('125', '4', '38');
INSERT INTO `ac_oper_org_relation` VALUES ('126', '11', '274');
INSERT INTO `ac_oper_org_relation` VALUES ('127', '11', '14');
INSERT INTO `ac_oper_org_relation` VALUES ('133', '17', '15');
INSERT INTO `ac_oper_org_relation` VALUES ('134', '17', '16');
INSERT INTO `ac_oper_org_relation` VALUES ('135', '18', '261');
INSERT INTO `ac_oper_org_relation` VALUES ('136', '18', '262');
INSERT INTO `ac_oper_org_relation` VALUES ('137', '20', '277');
INSERT INTO `ac_oper_org_relation` VALUES ('140', '2', '37');

-- ----------------------------
-- Table structure for `ac_oper_role`
-- ----------------------------
DROP TABLE IF EXISTS `ac_oper_role`;
CREATE TABLE `ac_oper_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `OPERID` int(11) NOT NULL COMMENT '操作员id',
  `ROLEID` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='操作员对应角色';

-- ----------------------------
-- Records of ac_oper_role
-- ----------------------------
INSERT INTO `ac_oper_role` VALUES ('12', '6', '31');
INSERT INTO `ac_oper_role` VALUES ('11', '3', '31');
INSERT INTO `ac_oper_role` VALUES ('10', '2', '31');
INSERT INTO `ac_oper_role` VALUES ('42', '4', '30');
INSERT INTO `ac_oper_role` VALUES ('15', '7', '31');
INSERT INTO `ac_oper_role` VALUES ('41', '4', '31');
INSERT INTO `ac_oper_role` VALUES ('13', '6', '30');
INSERT INTO `ac_oper_role` VALUES ('22', '8', '31');
INSERT INTO `ac_oper_role` VALUES ('44', '18', '30');
INSERT INTO `ac_oper_role` VALUES ('43', '17', '30');
INSERT INTO `ac_oper_role` VALUES ('33', '12', '31');
INSERT INTO `ac_oper_role` VALUES ('32', '11', '31');
INSERT INTO `ac_oper_role` VALUES ('45', '19', '30');
INSERT INTO `ac_oper_role` VALUES ('46', '20', '34');
INSERT INTO `ac_oper_role` VALUES ('47', '20', '31');
INSERT INTO `ac_oper_role` VALUES ('48', '20', '30');

-- ----------------------------
-- Table structure for `ac_org`
-- ----------------------------
DROP TABLE IF EXISTS `ac_org`;
CREATE TABLE `ac_org` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '组织机构ID',
  `ORGNAME` varchar(256) COLLATE utf8_bin NOT NULL COMMENT '组织机构名称',
  `ORGFULLNAME` varchar(1024) COLLATE utf8_bin NOT NULL COMMENT '机构全称',
  `PARENTID` int(11) DEFAULT NULL COMMENT '父机构ID 0 表示自己是根机构',
  `ORGSEQ` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '机构id序号 是各级父节点ID+横杆拼接的字符串\r\n            0-12-333\r\n            根机构本字段为0',
  `SORTID` int(11) DEFAULT '0' COMMENT '排序编号，即显示的顺序',
  `BELONGORGID` int(11) DEFAULT '0' COMMENT '所属机构id',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=279 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='组织机构表';

-- ----------------------------
-- Records of ac_org
-- ----------------------------
INSERT INTO `ac_org` VALUES ('13', '校长室', '校长室', '8', '8-13', '1', '0');
INSERT INTO `ac_org` VALUES ('38', '太阳雨', '人事股', '37', '8-37-38', '0', '0');
INSERT INTO `ac_org` VALUES ('262', '二年级组', '二年级组', '59', '8-59-262', '2', '59');
INSERT INTO `ac_org` VALUES ('37', '人事股', '人事股', '8', '8-37', '9', '0');
INSERT INTO `ac_org` VALUES ('9', '信息中心', '信息中心', '8', '8-9', '1', '0');
INSERT INTO `ac_org` VALUES ('8', '临澧教育局', '临澧教育局', '0', '8', '1', '0');
INSERT INTO `ac_org` VALUES ('14', '德育处', '德育处《德育》', '13', '8-13-14', '1', '0');
INSERT INTO `ac_org` VALUES ('15', '教导处', '教导处', '13', '8-13-15', '2', '15');
INSERT INTO `ac_org` VALUES ('16', '总务处', '总务处', '13', '8-13-16', '3', '0');
INSERT INTO `ac_org` VALUES ('17', '年级组', '年级组', '14', '8-13-14-17', '1', '0');
INSERT INTO `ac_org` VALUES ('24', '中队', '中队', '21', '8-13-14-21-24', '1', '0');
INSERT INTO `ac_org` VALUES ('23', '班级', '班级', '17', '8-13-14-17-23', '1', '0');
INSERT INTO `ac_org` VALUES ('22', '卫生室', '卫生室', '14', '8-13-14-22', '3', '0');
INSERT INTO `ac_org` VALUES ('21', '大队部', '大队部', '14', '8-13-14-21', '2', '0');
INSERT INTO `ac_org` VALUES ('25', '教研组', '教研组', '15', '8-13-15-25', '1', '15');
INSERT INTO `ac_org` VALUES ('26', '科研室', '科研室', '15', '8-13-15-26', '2', '15');
INSERT INTO `ac_org` VALUES ('27', '打印室', '打印室', '15', '8-13-15-27', '3', '15');
INSERT INTO `ac_org` VALUES ('28', '图书馆', '图书馆', '15', '8-13-15-28', '4', '15');
INSERT INTO `ac_org` VALUES ('29', '备课组', '备课组', '25', '8-13-15-25-29', '1', '15');
INSERT INTO `ac_org` VALUES ('32', '教代会', '教代会', '8', '8-32', '0', '0');
INSERT INTO `ac_org` VALUES ('31', '工会', '工会', '8', '8-31', '0', '0');
INSERT INTO `ac_org` VALUES ('33', '总务处', '总务处', '13', '8-13-33', '1', '0');
INSERT INTO `ac_org` VALUES ('34', '保管员', '保管员', '16', '8-13-16-34', '2', '0');
INSERT INTO `ac_org` VALUES ('35', '会计', '会计', '16', '8-13-16-35', '3', '0');
INSERT INTO `ac_org` VALUES ('36', '外勤人员', '外勤人员', '16', '8-13-16-36', '3', '0');
INSERT INTO `ac_org` VALUES ('59', '第二完小', '第二完小', '8', '8-59', '53', '59');
INSERT INTO `ac_org` VALUES ('54', '一年级组', '一年级组', '52', '8-52-54', '4', '52');
INSERT INTO `ac_org` VALUES ('53', 'XXX学校教务处', 'XXX学校教务处', '52', '8-52-53', '53', '52');
INSERT INTO `ac_org` VALUES ('52', '第一完小', '第一完全小学', '8', '8-52', '52', '52');
INSERT INTO `ac_org` VALUES ('267', '学工会', 'xuegonghui ', '31', '8-31-267', '1', '0');
INSERT INTO `ac_org` VALUES ('277', 'TTT', 'TTT', '8', '8-277', '1', '277');
INSERT INTO `ac_org` VALUES ('278', '55', '55', '8', '8-278', '5', '0');
INSERT INTO `ac_org` VALUES ('276', '湖南涉外', '湖南涉外', '8', '8-276', '21', '0');
INSERT INTO `ac_org` VALUES ('274', '机构', '机构', '32', '8-32-274', '1', '0');
INSERT INTO `ac_org` VALUES ('263', '三年级组', '三年级组', '59', '8-59-263', '3', '59');
INSERT INTO `ac_org` VALUES ('261', '一年级组', '一年级组', '59', '8-59-261', '1', '59');
INSERT INTO `ac_org` VALUES ('275', '金鹰小学', '金鹰小学', '8', '8-275', '2', '275');
INSERT INTO `ac_org` VALUES ('255', '机构', '机构', '23', '8-13-14-17-23-255', '1', '0');
INSERT INTO `ac_org` VALUES ('254', '机构', '机构', '253', '8-13-14-17-23-253-254', '1', '0');
INSERT INTO `ac_org` VALUES ('253', '机构', '机构', '23', '8-13-14-17-23-253', '1', '0');

-- ----------------------------
-- Table structure for `ac_org_func`
-- ----------------------------
DROP TABLE IF EXISTS `ac_org_func`;
CREATE TABLE `ac_org_func` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ORGID` int(11) NOT NULL COMMENT '机构ID',
  `FUNCID` int(11) NOT NULL COMMENT 'FUNCID',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='机构对应功能表';

-- ----------------------------
-- Records of ac_org_func
-- ----------------------------
INSERT INTO `ac_org_func` VALUES ('71', '58', '62');
INSERT INTO `ac_org_func` VALUES ('70', '58', '61');
INSERT INTO `ac_org_func` VALUES ('69', '58', '60');
INSERT INTO `ac_org_func` VALUES ('68', '58', '59');
INSERT INTO `ac_org_func` VALUES ('67', '58', '51');
INSERT INTO `ac_org_func` VALUES ('66', '58', '50');
INSERT INTO `ac_org_func` VALUES ('65', '58', '49');
INSERT INTO `ac_org_func` VALUES ('64', '58', '28');
INSERT INTO `ac_org_func` VALUES ('63', '58', '27');
INSERT INTO `ac_org_func` VALUES ('62', '58', '29');
INSERT INTO `ac_org_func` VALUES ('61', '58', '33');
INSERT INTO `ac_org_func` VALUES ('60', '58', '32');
INSERT INTO `ac_org_func` VALUES ('59', '58', '30');
INSERT INTO `ac_org_func` VALUES ('58', '58', '6');
INSERT INTO `ac_org_func` VALUES ('15', '52', '6');
INSERT INTO `ac_org_func` VALUES ('16', '52', '30');
INSERT INTO `ac_org_func` VALUES ('17', '52', '32');
INSERT INTO `ac_org_func` VALUES ('18', '52', '33');
INSERT INTO `ac_org_func` VALUES ('19', '52', '29');
INSERT INTO `ac_org_func` VALUES ('20', '52', '27');
INSERT INTO `ac_org_func` VALUES ('21', '52', '28');
INSERT INTO `ac_org_func` VALUES ('22', '52', '49');
INSERT INTO `ac_org_func` VALUES ('23', '52', '50');
INSERT INTO `ac_org_func` VALUES ('24', '52', '51');
INSERT INTO `ac_org_func` VALUES ('25', '52', '59');
INSERT INTO `ac_org_func` VALUES ('26', '52', '60');
INSERT INTO `ac_org_func` VALUES ('27', '52', '61');
INSERT INTO `ac_org_func` VALUES ('28', '52', '62');
INSERT INTO `ac_org_func` VALUES ('107', '277', '94');
INSERT INTO `ac_org_func` VALUES ('106', '277', '20');
INSERT INTO `ac_org_func` VALUES ('105', '277', '19');
INSERT INTO `ac_org_func` VALUES ('57', '57', '6');
INSERT INTO `ac_org_func` VALUES ('56', '57', '30');
INSERT INTO `ac_org_func` VALUES ('55', '57', '32');
INSERT INTO `ac_org_func` VALUES ('54', '57', '33');
INSERT INTO `ac_org_func` VALUES ('53', '13', '33');
INSERT INTO `ac_org_func` VALUES ('52', '13', '32');
INSERT INTO `ac_org_func` VALUES ('51', '13', '30');
INSERT INTO `ac_org_func` VALUES ('50', '13', '6');
INSERT INTO `ac_org_func` VALUES ('104', '277', '17');
INSERT INTO `ac_org_func` VALUES ('103', '277', '15');
INSERT INTO `ac_org_func` VALUES ('102', '277', '13');
INSERT INTO `ac_org_func` VALUES ('101', '277', '10');
INSERT INTO `ac_org_func` VALUES ('100', '277', '6');
INSERT INTO `ac_org_func` VALUES ('99', '32', '33');
INSERT INTO `ac_org_func` VALUES ('98', '32', '32');
INSERT INTO `ac_org_func` VALUES ('97', '32', '30');
INSERT INTO `ac_org_func` VALUES ('96', '32', '6');

-- ----------------------------
-- Table structure for `ac_role`
-- ----------------------------
DROP TABLE IF EXISTS `ac_role`;
CREATE TABLE `ac_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `ROLECODE` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '角色代码',
  `ROLENAME` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `BELONGORGID` int(11) DEFAULT '0' COMMENT '所属机构id',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `INDEX_AC_ROLE_1` (`ROLECODE`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色信息表';

-- ----------------------------
-- Records of ac_role
-- ----------------------------
INSERT INTO `ac_role` VALUES ('34', '测试角色', '测试角色', '15');
INSERT INTO `ac_role` VALUES ('31', '享有基本功能：通知、公文、邮箱、通讯等', '基本用户', '0');
INSERT INTO `ac_role` VALUES ('30', '这个角色可以进行用户权限一块的管理', '系统管理员', '0');

-- ----------------------------
-- Table structure for `ac_role_func`
-- ----------------------------
DROP TABLE IF EXISTS `ac_role_func`;
CREATE TABLE `ac_role_func` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ROLEID` int(11) NOT NULL COMMENT '角色id',
  `FUNCID` int(11) NOT NULL COMMENT '对应功能id  可以为null ，表示未挂钩功能',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=421 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色对应功能表';

-- ----------------------------
-- Records of ac_role_func
-- ----------------------------
INSERT INTO `ac_role_func` VALUES ('419', '31', '78');
INSERT INTO `ac_role_func` VALUES ('418', '31', '77');
INSERT INTO `ac_role_func` VALUES ('417', '31', '62');
INSERT INTO `ac_role_func` VALUES ('416', '31', '61');
INSERT INTO `ac_role_func` VALUES ('415', '31', '60');
INSERT INTO `ac_role_func` VALUES ('414', '31', '59');
INSERT INTO `ac_role_func` VALUES ('413', '31', '89');
INSERT INTO `ac_role_func` VALUES ('412', '31', '51');
INSERT INTO `ac_role_func` VALUES ('411', '31', '50');
INSERT INTO `ac_role_func` VALUES ('410', '31', '49');
INSERT INTO `ac_role_func` VALUES ('409', '31', '75');
INSERT INTO `ac_role_func` VALUES ('408', '31', '74');
INSERT INTO `ac_role_func` VALUES ('407', '31', '73');
INSERT INTO `ac_role_func` VALUES ('406', '31', '76');
INSERT INTO `ac_role_func` VALUES ('405', '31', '27');
INSERT INTO `ac_role_func` VALUES ('404', '31', '69');
INSERT INTO `ac_role_func` VALUES ('403', '31', '67');
INSERT INTO `ac_role_func` VALUES ('402', '31', '68');
INSERT INTO `ac_role_func` VALUES ('401', '31', '66');
INSERT INTO `ac_role_func` VALUES ('400', '31', '65');
INSERT INTO `ac_role_func` VALUES ('399', '31', '64');
INSERT INTO `ac_role_func` VALUES ('398', '31', '33');
INSERT INTO `ac_role_func` VALUES ('397', '31', '32');
INSERT INTO `ac_role_func` VALUES ('396', '31', '30');
INSERT INTO `ac_role_func` VALUES ('395', '31', '6');
INSERT INTO `ac_role_func` VALUES ('420', '31', '79');
INSERT INTO `ac_role_func` VALUES ('394', '30', '94');
INSERT INTO `ac_role_func` VALUES ('393', '30', '20');
INSERT INTO `ac_role_func` VALUES ('392', '30', '10');
INSERT INTO `ac_role_func` VALUES ('391', '30', '6');

-- ----------------------------
-- Table structure for `newtable`
-- ----------------------------
DROP TABLE IF EXISTS `newtable`;
CREATE TABLE `newtable` (
  `id` int(11) NOT NULL,
  `addresser` int(11) DEFAULT NULL,
  `addressername` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `recipient` int(11) DEFAULT NULL,
  `recipientname` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `content` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of newtable
-- ----------------------------

-- ----------------------------
-- Table structure for `t_data_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_data_info`;
CREATE TABLE `t_data_info` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEMPINFOID` int(11) DEFAULT NULL,
  `USERID` int(11) DEFAULT NULL,
  `ORGID` int(11) DEFAULT NULL,
  `CREATEDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='收集的数据主表';

-- ----------------------------
-- Records of t_data_info
-- ----------------------------
INSERT INTO `t_data_info` VALUES ('4', '3', '1', '11', '2015-01-22 16:04:25');
INSERT INTO `t_data_info` VALUES ('6', '4', '1', '11', '2015-02-02 15:51:20');
INSERT INTO `t_data_info` VALUES ('9', '8', '1', '11', '2015-02-03 08:38:47');
INSERT INTO `t_data_info` VALUES ('15', '5', '1', '11', '2015-02-05 10:31:16');
INSERT INTO `t_data_info` VALUES ('18', '28', '1', '11', '2015-02-05 11:47:56');
INSERT INTO `t_data_info` VALUES ('19', '22', '1', '11', '2015-02-05 11:48:11');
INSERT INTO `t_data_info` VALUES ('22', '14', '1', '9', '2015-02-05 12:49:43');
INSERT INTO `t_data_info` VALUES ('23', '14', '7', '9', '2015-02-05 12:50:15');
INSERT INTO `t_data_info` VALUES ('24', '24', '7', '9', '2015-02-05 12:59:46');
INSERT INTO `t_data_info` VALUES ('25', '4', '4', '11', '2015-02-05 13:50:38');
INSERT INTO `t_data_info` VALUES ('26', '36', '1', '11', '2015-02-05 16:15:09');
INSERT INTO `t_data_info` VALUES ('27', '33', '4', '9', '2015-02-05 16:50:53');
INSERT INTO `t_data_info` VALUES ('28', '36', '4', '11', '2015-02-05 16:51:32');
INSERT INTO `t_data_info` VALUES ('29', '102', '7', '9', '2015-02-09 10:33:02');
INSERT INTO `t_data_info` VALUES ('30', '102', '2', '9', '2015-02-09 10:34:35');
INSERT INTO `t_data_info` VALUES ('31', '103', '7', '9', '2015-02-09 10:38:09');
INSERT INTO `t_data_info` VALUES ('32', '103', '2', '9', '2015-02-09 10:46:06');
INSERT INTO `t_data_info` VALUES ('33', '103', '4', '9', '2015-02-09 10:46:34');
INSERT INTO `t_data_info` VALUES ('34', '104', '3', '15', '2015-02-09 10:55:39');
INSERT INTO `t_data_info` VALUES ('35', '115', '4', '9', '2015-02-10 10:36:37');
INSERT INTO `t_data_info` VALUES ('36', '115', '4', '9', '2015-02-10 10:36:47');
INSERT INTO `t_data_info` VALUES ('37', '114', '4', '9', '2015-02-10 10:37:22');
INSERT INTO `t_data_info` VALUES ('38', '113', '4', '37', '2015-02-10 10:37:36');
INSERT INTO `t_data_info` VALUES ('39', '100', '4', '9', '2015-02-10 10:37:46');
INSERT INTO `t_data_info` VALUES ('40', '78', '4', '36', '2015-02-10 10:37:57');
INSERT INTO `t_data_info` VALUES ('41', '118', '7', '9', '2015-02-10 10:40:02');
INSERT INTO `t_data_info` VALUES ('42', '118', '2', '9', '2015-02-10 10:45:26');
INSERT INTO `t_data_info` VALUES ('43', '79', '7', '52', '2015-02-10 15:56:57');
INSERT INTO `t_data_info` VALUES ('44', '123', '4', '52', '2015-02-11 13:41:21');
INSERT INTO `t_data_info` VALUES ('45', '124', '7', '52', '2015-02-11 13:44:16');

-- ----------------------------
-- Table structure for `t_data_info_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_data_info_detail`;
CREATE TABLE `t_data_info_detail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `INFOID` int(11) DEFAULT NULL,
  `TEMPDETAILID` char(10) COLLATE utf8_bin DEFAULT NULL,
  `DETAIL` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='收集的数据内容';

-- ----------------------------
-- Records of t_data_info_detail
-- ----------------------------
INSERT INTO `t_data_info_detail` VALUES ('55', '4', '8', '90');
INSERT INTO `t_data_info_detail` VALUES ('56', '4', '9', '91');
INSERT INTO `t_data_info_detail` VALUES ('57', '4', '10', '92');
INSERT INTO `t_data_info_detail` VALUES ('58', '4', '11', '93');
INSERT INTO `t_data_info_detail` VALUES ('59', '4', '12', '94');
INSERT INTO `t_data_info_detail` VALUES ('60', '4', '13', '95');
INSERT INTO `t_data_info_detail` VALUES ('61', '4', '14', '96');
INSERT INTO `t_data_info_detail` VALUES ('62', '4', '15', '97');
INSERT INTO `t_data_info_detail` VALUES ('63', '4', '16', '98');
INSERT INTO `t_data_info_detail` VALUES ('64', '4', '17', '99');
INSERT INTO `t_data_info_detail` VALUES ('65', '6', '18', '将反馈水井坊的经费的快速路附近');
INSERT INTO `t_data_info_detail` VALUES ('68', '9', '28', '1');
INSERT INTO `t_data_info_detail` VALUES ('69', '9', '29', '2');
INSERT INTO `t_data_info_detail` VALUES ('75', '15', '19', '水电费');
INSERT INTO `t_data_info_detail` VALUES ('76', '15', '20', null);
INSERT INTO `t_data_info_detail` VALUES ('77', '15', '21', null);
INSERT INTO `t_data_info_detail` VALUES ('79', '18', '58', '水电费');
INSERT INTO `t_data_info_detail` VALUES ('80', '18', '59', null);
INSERT INTO `t_data_info_detail` VALUES ('81', '18', '60', null);
INSERT INTO `t_data_info_detail` VALUES ('82', '19', '50', '刚回家');
INSERT INTO `t_data_info_detail` VALUES ('83', '19', '51', null);
INSERT INTO `t_data_info_detail` VALUES ('84', '19', '52', null);
INSERT INTO `t_data_info_detail` VALUES ('87', '22', '38', '问');
INSERT INTO `t_data_info_detail` VALUES ('88', '23', '38', '让他');
INSERT INTO `t_data_info_detail` VALUES ('89', '24', '54', '78');
INSERT INTO `t_data_info_detail` VALUES ('93', '25', '18', '的佛挡杀佛双方都的佛挡杀佛双方都的佛挡杀佛双方都的佛挡杀佛双方都');
INSERT INTO `t_data_info_detail` VALUES ('94', '26', '71', '11');
INSERT INTO `t_data_info_detail` VALUES ('95', '26', '70', '22');
INSERT INTO `t_data_info_detail` VALUES ('96', '26', '69', '33');
INSERT INTO `t_data_info_detail` VALUES ('99', '27', '65', '还钱第三方水电费是水电费收水电费 付水电费像开放式的减肥还钱第三');
INSERT INTO `t_data_info_detail` VALUES ('100', '28', '71', '饭店水水水水谁谁谁水水水水水水水水水水水水水水水水水水水水水水水');
INSERT INTO `t_data_info_detail` VALUES ('101', '28', '70', '你好手机地方考虑到水井坊你好手机地方考虑到水井坊你好手机地方考虑');
INSERT INTO `t_data_info_detail` VALUES ('102', '28', '69', '第三方水水水水谁谁谁水水水水谁谁谁水水水水水水水水水水水水水水水');
INSERT INTO `t_data_info_detail` VALUES ('108', '29', '178', '都是');
INSERT INTO `t_data_info_detail` VALUES ('109', '29', '177', '舍得发');
INSERT INTO `t_data_info_detail` VALUES ('110', '29', '176', '水电费');
INSERT INTO `t_data_info_detail` VALUES ('111', '29', '175', '是');
INSERT INTO `t_data_info_detail` VALUES ('112', '29', '174', '是');
INSERT INTO `t_data_info_detail` VALUES ('118', '30', '178', '123');
INSERT INTO `t_data_info_detail` VALUES ('119', '30', '177', null);
INSERT INTO `t_data_info_detail` VALUES ('120', '30', '176', '342432');
INSERT INTO `t_data_info_detail` VALUES ('121', '30', '175', null);
INSERT INTO `t_data_info_detail` VALUES ('122', '30', '174', '3424');
INSERT INTO `t_data_info_detail` VALUES ('143', '31', '188', '23');
INSERT INTO `t_data_info_detail` VALUES ('144', '31', '187', '123');
INSERT INTO `t_data_info_detail` VALUES ('145', '31', '186', '321');
INSERT INTO `t_data_info_detail` VALUES ('146', '31', '185', '32');
INSERT INTO `t_data_info_detail` VALUES ('147', '31', '184', '231');
INSERT INTO `t_data_info_detail` VALUES ('148', '31', '183', '321');
INSERT INTO `t_data_info_detail` VALUES ('149', '31', '182', '321');
INSERT INTO `t_data_info_detail` VALUES ('150', '31', '181', '的');
INSERT INTO `t_data_info_detail` VALUES ('151', '31', '180', '321');
INSERT INTO `t_data_info_detail` VALUES ('152', '31', '179', '321');
INSERT INTO `t_data_info_detail` VALUES ('163', '32', '188', null);
INSERT INTO `t_data_info_detail` VALUES ('164', '32', '187', null);
INSERT INTO `t_data_info_detail` VALUES ('165', '32', '186', null);
INSERT INTO `t_data_info_detail` VALUES ('166', '32', '185', '123');
INSERT INTO `t_data_info_detail` VALUES ('167', '32', '184', null);
INSERT INTO `t_data_info_detail` VALUES ('168', '32', '183', null);
INSERT INTO `t_data_info_detail` VALUES ('169', '32', '182', null);
INSERT INTO `t_data_info_detail` VALUES ('170', '32', '181', null);
INSERT INTO `t_data_info_detail` VALUES ('171', '32', '180', null);
INSERT INTO `t_data_info_detail` VALUES ('172', '32', '179', null);
INSERT INTO `t_data_info_detail` VALUES ('173', '33', '188', null);
INSERT INTO `t_data_info_detail` VALUES ('174', '33', '187', null);
INSERT INTO `t_data_info_detail` VALUES ('175', '33', '186', null);
INSERT INTO `t_data_info_detail` VALUES ('176', '33', '185', '321');
INSERT INTO `t_data_info_detail` VALUES ('177', '33', '184', null);
INSERT INTO `t_data_info_detail` VALUES ('178', '33', '183', null);
INSERT INTO `t_data_info_detail` VALUES ('179', '33', '182', null);
INSERT INTO `t_data_info_detail` VALUES ('180', '33', '181', null);
INSERT INTO `t_data_info_detail` VALUES ('181', '33', '180', null);
INSERT INTO `t_data_info_detail` VALUES ('182', '33', '179', null);
INSERT INTO `t_data_info_detail` VALUES ('183', '34', '198', null);
INSERT INTO `t_data_info_detail` VALUES ('184', '34', '197', '123');
INSERT INTO `t_data_info_detail` VALUES ('185', '34', '196', null);
INSERT INTO `t_data_info_detail` VALUES ('186', '34', '195', null);
INSERT INTO `t_data_info_detail` VALUES ('187', '34', '194', null);
INSERT INTO `t_data_info_detail` VALUES ('188', '34', '193', null);
INSERT INTO `t_data_info_detail` VALUES ('189', '34', '192', null);
INSERT INTO `t_data_info_detail` VALUES ('190', '34', '191', null);
INSERT INTO `t_data_info_detail` VALUES ('191', '34', '190', null);
INSERT INTO `t_data_info_detail` VALUES ('192', '34', '189', null);
INSERT INTO `t_data_info_detail` VALUES ('193', '36', '216', '1');
INSERT INTO `t_data_info_detail` VALUES ('194', '37', '215', '123');
INSERT INTO `t_data_info_detail` VALUES ('195', '39', '171', '32');
INSERT INTO `t_data_info_detail` VALUES ('196', '40', '136', '123');
INSERT INTO `t_data_info_detail` VALUES ('197', '43', '137', '2');
INSERT INTO `t_data_info_detail` VALUES ('198', '44', '229', '1');
INSERT INTO `t_data_info_detail` VALUES ('199', '45', '230', '2');

-- ----------------------------
-- Table structure for `t_data_info_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_data_info_user`;
CREATE TABLE `t_data_info_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEMPINFOID` int(11) DEFAULT NULL,
  `USERID` int(11) DEFAULT NULL,
  `ORGID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=497 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='需要填写内容用户表';

-- ----------------------------
-- Records of t_data_info_user
-- ----------------------------
INSERT INTO `t_data_info_user` VALUES ('38', '3', '1', '11');
INSERT INTO `t_data_info_user` VALUES ('92', '4', '5', '23');
INSERT INTO `t_data_info_user` VALUES ('93', '4', '5', '17');
INSERT INTO `t_data_info_user` VALUES ('94', '4', '5', '24');
INSERT INTO `t_data_info_user` VALUES ('95', '4', '5', '21');
INSERT INTO `t_data_info_user` VALUES ('96', '4', '5', '22');
INSERT INTO `t_data_info_user` VALUES ('97', '4', '5', '14');
INSERT INTO `t_data_info_user` VALUES ('98', '4', '5', '29');
INSERT INTO `t_data_info_user` VALUES ('99', '4', '5', '25');
INSERT INTO `t_data_info_user` VALUES ('100', '4', '5', '26');
INSERT INTO `t_data_info_user` VALUES ('101', '4', '4', '15');
INSERT INTO `t_data_info_user` VALUES ('102', '4', '5', '15');
INSERT INTO `t_data_info_user` VALUES ('103', '4', '4', '16');
INSERT INTO `t_data_info_user` VALUES ('104', '4', '5', '16');
INSERT INTO `t_data_info_user` VALUES ('105', '4', '4', '33');
INSERT INTO `t_data_info_user` VALUES ('106', '4', '5', '33');
INSERT INTO `t_data_info_user` VALUES ('107', '4', '4', '13');
INSERT INTO `t_data_info_user` VALUES ('108', '4', '5', '13');
INSERT INTO `t_data_info_user` VALUES ('109', '5', '1', '11');
INSERT INTO `t_data_info_user` VALUES ('110', '5', '4', '9');
INSERT INTO `t_data_info_user` VALUES ('111', '5', '6', '9');
INSERT INTO `t_data_info_user` VALUES ('112', '5', '7', '9');
INSERT INTO `t_data_info_user` VALUES ('113', '6', '1', '11');
INSERT INTO `t_data_info_user` VALUES ('114', '6', '4', '9');
INSERT INTO `t_data_info_user` VALUES ('115', '6', '6', '9');
INSERT INTO `t_data_info_user` VALUES ('116', '6', '7', '9');
INSERT INTO `t_data_info_user` VALUES ('117', '7', '4', '15');
INSERT INTO `t_data_info_user` VALUES ('118', '7', '7', '15');
INSERT INTO `t_data_info_user` VALUES ('119', '7', '4', '16');
INSERT INTO `t_data_info_user` VALUES ('120', '7', '4', '33');
INSERT INTO `t_data_info_user` VALUES ('121', '7', '4', '13');
INSERT INTO `t_data_info_user` VALUES ('122', '8', '4', '15');
INSERT INTO `t_data_info_user` VALUES ('123', '8', '7', '15');
INSERT INTO `t_data_info_user` VALUES ('124', '8', '4', '16');
INSERT INTO `t_data_info_user` VALUES ('125', '8', '4', '33');
INSERT INTO `t_data_info_user` VALUES ('126', '8', '4', '13');
INSERT INTO `t_data_info_user` VALUES ('127', '9', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('128', '10', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('129', '11', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('130', '12', '3', '52');
INSERT INTO `t_data_info_user` VALUES ('131', '12', '7', '52');
INSERT INTO `t_data_info_user` VALUES ('132', '12', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('133', '13', '3', '52');
INSERT INTO `t_data_info_user` VALUES ('134', '13', '7', '52');
INSERT INTO `t_data_info_user` VALUES ('135', '13', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('136', '14', '1', '11');
INSERT INTO `t_data_info_user` VALUES ('137', '14', '4', '11');
INSERT INTO `t_data_info_user` VALUES ('138', '14', '4', '9');
INSERT INTO `t_data_info_user` VALUES ('139', '14', '6', '9');
INSERT INTO `t_data_info_user` VALUES ('140', '14', '7', '21');
INSERT INTO `t_data_info_user` VALUES ('141', '14', '7', '28');
INSERT INTO `t_data_info_user` VALUES ('142', '14', '4', '15');
INSERT INTO `t_data_info_user` VALUES ('143', '14', '7', '35');
INSERT INTO `t_data_info_user` VALUES ('144', '14', '4', '16');
INSERT INTO `t_data_info_user` VALUES ('145', '14', '4', '33');
INSERT INTO `t_data_info_user` VALUES ('146', '14', '7', '33');
INSERT INTO `t_data_info_user` VALUES ('147', '14', '4', '13');
INSERT INTO `t_data_info_user` VALUES ('148', '14', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('149', '14', '3', '52');
INSERT INTO `t_data_info_user` VALUES ('150', '14', '7', '52');
INSERT INTO `t_data_info_user` VALUES ('151', '14', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('152', '17', '3', '52');
INSERT INTO `t_data_info_user` VALUES ('153', '17', '7', '52');
INSERT INTO `t_data_info_user` VALUES ('154', '17', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('155', '18', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('156', '19', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('157', '20', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('158', '22', '1', '11');
INSERT INTO `t_data_info_user` VALUES ('159', '22', '4', '11');
INSERT INTO `t_data_info_user` VALUES ('160', '22', '4', '9');
INSERT INTO `t_data_info_user` VALUES ('161', '22', '6', '9');
INSERT INTO `t_data_info_user` VALUES ('162', '23', '3', '52');
INSERT INTO `t_data_info_user` VALUES ('163', '23', '7', '52');
INSERT INTO `t_data_info_user` VALUES ('164', '23', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('165', '24', '3', '52');
INSERT INTO `t_data_info_user` VALUES ('166', '24', '7', '52');
INSERT INTO `t_data_info_user` VALUES ('167', '24', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('168', '25', '3', '52');
INSERT INTO `t_data_info_user` VALUES ('169', '25', '7', '52');
INSERT INTO `t_data_info_user` VALUES ('170', '25', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('171', '26', '3', '52');
INSERT INTO `t_data_info_user` VALUES ('172', '26', '7', '52');
INSERT INTO `t_data_info_user` VALUES ('173', '27', '3', '52');
INSERT INTO `t_data_info_user` VALUES ('174', '27', '7', '52');
INSERT INTO `t_data_info_user` VALUES ('175', '27', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('176', '28', '1', '11');
INSERT INTO `t_data_info_user` VALUES ('177', '28', '4', '11');
INSERT INTO `t_data_info_user` VALUES ('178', '28', '4', '9');
INSERT INTO `t_data_info_user` VALUES ('179', '28', '6', '9');
INSERT INTO `t_data_info_user` VALUES ('180', '29', '3', '52');
INSERT INTO `t_data_info_user` VALUES ('181', '29', '7', '52');
INSERT INTO `t_data_info_user` VALUES ('182', '30', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('183', '33', '4', '33');
INSERT INTO `t_data_info_user` VALUES ('184', '35', '3', '52');
INSERT INTO `t_data_info_user` VALUES ('185', '35', '7', '52');
INSERT INTO `t_data_info_user` VALUES ('186', '36', '1', '11');
INSERT INTO `t_data_info_user` VALUES ('187', '36', '4', '11');
INSERT INTO `t_data_info_user` VALUES ('188', '36', '4', '9');
INSERT INTO `t_data_info_user` VALUES ('189', '36', '6', '9');
INSERT INTO `t_data_info_user` VALUES ('190', '36', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('191', '37', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('192', '38', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('193', '39', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('194', '40', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('195', '41', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('196', '42', '8', '54');
INSERT INTO `t_data_info_user` VALUES ('197', '42', '3', '52');
INSERT INTO `t_data_info_user` VALUES ('198', '42', '7', '52');
INSERT INTO `t_data_info_user` VALUES ('199', '43', '8', '54');
INSERT INTO `t_data_info_user` VALUES ('200', '43', '3', '52');
INSERT INTO `t_data_info_user` VALUES ('201', '43', '7', '52');
INSERT INTO `t_data_info_user` VALUES ('202', '44', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('203', '45', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('204', '46', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('205', '47', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('206', '48', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('207', '49', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('208', '50', '7', '21');
INSERT INTO `t_data_info_user` VALUES ('209', '50', '7', '28');
INSERT INTO `t_data_info_user` VALUES ('210', '50', '4', '15');
INSERT INTO `t_data_info_user` VALUES ('211', '50', '8', '15');
INSERT INTO `t_data_info_user` VALUES ('212', '50', '7', '35');
INSERT INTO `t_data_info_user` VALUES ('213', '50', '4', '16');
INSERT INTO `t_data_info_user` VALUES ('214', '50', '4', '33');
INSERT INTO `t_data_info_user` VALUES ('215', '50', '7', '33');
INSERT INTO `t_data_info_user` VALUES ('216', '50', '4', '13');
INSERT INTO `t_data_info_user` VALUES ('217', '51', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('218', '51', '1', '11');
INSERT INTO `t_data_info_user` VALUES ('219', '51', '4', '11');
INSERT INTO `t_data_info_user` VALUES ('220', '51', '4', '9');
INSERT INTO `t_data_info_user` VALUES ('221', '51', '6', '9');
INSERT INTO `t_data_info_user` VALUES ('222', '52', '1', '11');
INSERT INTO `t_data_info_user` VALUES ('223', '52', '4', '11');
INSERT INTO `t_data_info_user` VALUES ('224', '52', '4', '9');
INSERT INTO `t_data_info_user` VALUES ('225', '52', '6', '9');
INSERT INTO `t_data_info_user` VALUES ('226', '53', '7', '21');
INSERT INTO `t_data_info_user` VALUES ('227', '53', '7', '28');
INSERT INTO `t_data_info_user` VALUES ('228', '53', '4', '15');
INSERT INTO `t_data_info_user` VALUES ('229', '53', '8', '15');
INSERT INTO `t_data_info_user` VALUES ('230', '53', '7', '35');
INSERT INTO `t_data_info_user` VALUES ('231', '53', '4', '16');
INSERT INTO `t_data_info_user` VALUES ('232', '53', '4', '33');
INSERT INTO `t_data_info_user` VALUES ('233', '53', '7', '33');
INSERT INTO `t_data_info_user` VALUES ('234', '53', '4', '13');
INSERT INTO `t_data_info_user` VALUES ('235', '53', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('236', '53', '8', '54');
INSERT INTO `t_data_info_user` VALUES ('237', '53', '3', '52');
INSERT INTO `t_data_info_user` VALUES ('238', '53', '7', '52');
INSERT INTO `t_data_info_user` VALUES ('239', '53', '1', '11');
INSERT INTO `t_data_info_user` VALUES ('240', '53', '4', '11');
INSERT INTO `t_data_info_user` VALUES ('241', '53', '4', '9');
INSERT INTO `t_data_info_user` VALUES ('242', '53', '6', '9');
INSERT INTO `t_data_info_user` VALUES ('243', '53', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('244', '54', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('245', '55', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('246', '56', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('247', '57', '2', '-1');
INSERT INTO `t_data_info_user` VALUES ('248', '58', '4', '-1');
INSERT INTO `t_data_info_user` VALUES ('249', '59', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('250', '60', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('251', '61', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('252', '62', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('253', '63', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('254', '64', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('255', '65', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('256', '66', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('257', '67', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('258', '68', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('259', '69', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('260', '70', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('261', '71', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('262', '72', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('263', '73', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('264', '74', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('265', '75', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('266', '76', '7', '21');
INSERT INTO `t_data_info_user` VALUES ('267', '76', '7', '28');
INSERT INTO `t_data_info_user` VALUES ('268', '76', '4', '15');
INSERT INTO `t_data_info_user` VALUES ('269', '76', '8', '15');
INSERT INTO `t_data_info_user` VALUES ('270', '76', '4', '34');
INSERT INTO `t_data_info_user` VALUES ('271', '76', '4', '35');
INSERT INTO `t_data_info_user` VALUES ('272', '76', '7', '35');
INSERT INTO `t_data_info_user` VALUES ('273', '76', '4', '36');
INSERT INTO `t_data_info_user` VALUES ('274', '76', '4', '16');
INSERT INTO `t_data_info_user` VALUES ('275', '76', '4', '33');
INSERT INTO `t_data_info_user` VALUES ('276', '76', '7', '33');
INSERT INTO `t_data_info_user` VALUES ('277', '76', '4', '13');
INSERT INTO `t_data_info_user` VALUES ('278', '76', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('279', '77', '2', '38');
INSERT INTO `t_data_info_user` VALUES ('280', '77', '6', '38');
INSERT INTO `t_data_info_user` VALUES ('281', '77', '7', '38');
INSERT INTO `t_data_info_user` VALUES ('282', '77', '2', '37');
INSERT INTO `t_data_info_user` VALUES ('283', '77', '6', '37');
INSERT INTO `t_data_info_user` VALUES ('284', '77', '7', '37');
INSERT INTO `t_data_info_user` VALUES ('285', '77', '2', '-1');
INSERT INTO `t_data_info_user` VALUES ('286', '78', '7', '21');
INSERT INTO `t_data_info_user` VALUES ('287', '78', '7', '28');
INSERT INTO `t_data_info_user` VALUES ('288', '78', '4', '15');
INSERT INTO `t_data_info_user` VALUES ('289', '78', '8', '15');
INSERT INTO `t_data_info_user` VALUES ('290', '78', '4', '34');
INSERT INTO `t_data_info_user` VALUES ('291', '78', '4', '35');
INSERT INTO `t_data_info_user` VALUES ('292', '78', '7', '35');
INSERT INTO `t_data_info_user` VALUES ('293', '78', '4', '36');
INSERT INTO `t_data_info_user` VALUES ('294', '78', '4', '16');
INSERT INTO `t_data_info_user` VALUES ('295', '78', '4', '33');
INSERT INTO `t_data_info_user` VALUES ('296', '78', '7', '33');
INSERT INTO `t_data_info_user` VALUES ('297', '78', '4', '13');
INSERT INTO `t_data_info_user` VALUES ('298', '78', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('299', '78', '2', '38');
INSERT INTO `t_data_info_user` VALUES ('300', '78', '6', '38');
INSERT INTO `t_data_info_user` VALUES ('301', '78', '7', '38');
INSERT INTO `t_data_info_user` VALUES ('302', '78', '2', '37');
INSERT INTO `t_data_info_user` VALUES ('303', '78', '6', '37');
INSERT INTO `t_data_info_user` VALUES ('304', '78', '7', '37');
INSERT INTO `t_data_info_user` VALUES ('305', '78', '8', '54');
INSERT INTO `t_data_info_user` VALUES ('306', '78', '3', '52');
INSERT INTO `t_data_info_user` VALUES ('307', '78', '7', '52');
INSERT INTO `t_data_info_user` VALUES ('308', '78', '1', '9');
INSERT INTO `t_data_info_user` VALUES ('309', '78', '2', '9');
INSERT INTO `t_data_info_user` VALUES ('310', '78', '4', '9');
INSERT INTO `t_data_info_user` VALUES ('311', '78', '6', '9');
INSERT INTO `t_data_info_user` VALUES ('312', '78', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('313', '79', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('314', '80', '1', '9');
INSERT INTO `t_data_info_user` VALUES ('315', '80', '2', '9');
INSERT INTO `t_data_info_user` VALUES ('316', '80', '4', '9');
INSERT INTO `t_data_info_user` VALUES ('317', '80', '6', '9');
INSERT INTO `t_data_info_user` VALUES ('318', '81', '8', '54');
INSERT INTO `t_data_info_user` VALUES ('319', '81', '3', '52');
INSERT INTO `t_data_info_user` VALUES ('320', '81', '7', '52');
INSERT INTO `t_data_info_user` VALUES ('321', '86', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('322', '87', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('323', '88', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('324', '89', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('325', '90', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('326', '91', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('327', '92', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('328', '93', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('329', '94', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('330', '95', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('331', '96', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('332', '97', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('333', '98', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('334', '99', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('335', '100', '2', '38');
INSERT INTO `t_data_info_user` VALUES ('336', '100', '4', '38');
INSERT INTO `t_data_info_user` VALUES ('337', '100', '6', '38');
INSERT INTO `t_data_info_user` VALUES ('338', '100', '7', '38');
INSERT INTO `t_data_info_user` VALUES ('339', '100', '2', '37');
INSERT INTO `t_data_info_user` VALUES ('340', '100', '4', '37');
INSERT INTO `t_data_info_user` VALUES ('341', '100', '6', '37');
INSERT INTO `t_data_info_user` VALUES ('342', '100', '7', '37');
INSERT INTO `t_data_info_user` VALUES ('343', '101', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('344', '102', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('345', '102', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('346', '103', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('347', '103', '4', '37');
INSERT INTO `t_data_info_user` VALUES ('348', '103', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('349', '104', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('350', '104', '3', '52');
INSERT INTO `t_data_info_user` VALUES ('351', '104', '7', '52');
INSERT INTO `t_data_info_user` VALUES ('352', '105', '2', '-1');
INSERT INTO `t_data_info_user` VALUES ('353', '106', '4', '13');
INSERT INTO `t_data_info_user` VALUES ('354', '107', '2', '38');
INSERT INTO `t_data_info_user` VALUES ('355', '107', '4', '38');
INSERT INTO `t_data_info_user` VALUES ('356', '107', '6', '38');
INSERT INTO `t_data_info_user` VALUES ('357', '107', '7', '38');
INSERT INTO `t_data_info_user` VALUES ('358', '107', '2', '37');
INSERT INTO `t_data_info_user` VALUES ('359', '107', '4', '37');
INSERT INTO `t_data_info_user` VALUES ('360', '107', '6', '37');
INSERT INTO `t_data_info_user` VALUES ('361', '107', '7', '37');
INSERT INTO `t_data_info_user` VALUES ('362', '108', '1', '9');
INSERT INTO `t_data_info_user` VALUES ('363', '108', '2', '9');
INSERT INTO `t_data_info_user` VALUES ('364', '108', '4', '9');
INSERT INTO `t_data_info_user` VALUES ('365', '108', '6', '9');
INSERT INTO `t_data_info_user` VALUES ('366', '108', '2', '-1');
INSERT INTO `t_data_info_user` VALUES ('367', '109', '2', '-1');
INSERT INTO `t_data_info_user` VALUES ('368', '110', '2', '-1');
INSERT INTO `t_data_info_user` VALUES ('369', '111', '2', '-1');
INSERT INTO `t_data_info_user` VALUES ('370', '112', '2', '-1');
INSERT INTO `t_data_info_user` VALUES ('371', '113', '2', '38');
INSERT INTO `t_data_info_user` VALUES ('372', '113', '4', '38');
INSERT INTO `t_data_info_user` VALUES ('373', '113', '6', '38');
INSERT INTO `t_data_info_user` VALUES ('374', '113', '7', '38');
INSERT INTO `t_data_info_user` VALUES ('375', '113', '2', '37');
INSERT INTO `t_data_info_user` VALUES ('376', '113', '4', '37');
INSERT INTO `t_data_info_user` VALUES ('377', '113', '6', '37');
INSERT INTO `t_data_info_user` VALUES ('378', '113', '7', '37');
INSERT INTO `t_data_info_user` VALUES ('379', '114', '7', '21');
INSERT INTO `t_data_info_user` VALUES ('380', '114', '11', '14');
INSERT INTO `t_data_info_user` VALUES ('381', '114', '7', '28');
INSERT INTO `t_data_info_user` VALUES ('382', '114', '4', '15');
INSERT INTO `t_data_info_user` VALUES ('383', '114', '8', '15');
INSERT INTO `t_data_info_user` VALUES ('384', '114', '4', '34');
INSERT INTO `t_data_info_user` VALUES ('385', '114', '4', '35');
INSERT INTO `t_data_info_user` VALUES ('386', '114', '7', '35');
INSERT INTO `t_data_info_user` VALUES ('387', '114', '4', '36');
INSERT INTO `t_data_info_user` VALUES ('388', '114', '4', '16');
INSERT INTO `t_data_info_user` VALUES ('389', '114', '4', '33');
INSERT INTO `t_data_info_user` VALUES ('390', '114', '7', '33');
INSERT INTO `t_data_info_user` VALUES ('391', '114', '4', '13');
INSERT INTO `t_data_info_user` VALUES ('392', '114', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('393', '114', '11', '274');
INSERT INTO `t_data_info_user` VALUES ('394', '114', '2', '38');
INSERT INTO `t_data_info_user` VALUES ('395', '114', '4', '38');
INSERT INTO `t_data_info_user` VALUES ('396', '114', '6', '38');
INSERT INTO `t_data_info_user` VALUES ('397', '114', '7', '38');
INSERT INTO `t_data_info_user` VALUES ('398', '114', '2', '37');
INSERT INTO `t_data_info_user` VALUES ('399', '114', '4', '37');
INSERT INTO `t_data_info_user` VALUES ('400', '114', '6', '37');
INSERT INTO `t_data_info_user` VALUES ('401', '114', '7', '37');
INSERT INTO `t_data_info_user` VALUES ('402', '114', '8', '54');
INSERT INTO `t_data_info_user` VALUES ('403', '114', '3', '52');
INSERT INTO `t_data_info_user` VALUES ('404', '114', '7', '52');
INSERT INTO `t_data_info_user` VALUES ('405', '114', '1', '9');
INSERT INTO `t_data_info_user` VALUES ('406', '114', '2', '9');
INSERT INTO `t_data_info_user` VALUES ('407', '114', '4', '9');
INSERT INTO `t_data_info_user` VALUES ('408', '114', '6', '9');
INSERT INTO `t_data_info_user` VALUES ('409', '114', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('410', '115', '2', '38');
INSERT INTO `t_data_info_user` VALUES ('411', '115', '4', '38');
INSERT INTO `t_data_info_user` VALUES ('412', '115', '6', '38');
INSERT INTO `t_data_info_user` VALUES ('413', '115', '7', '38');
INSERT INTO `t_data_info_user` VALUES ('414', '115', '2', '37');
INSERT INTO `t_data_info_user` VALUES ('415', '115', '4', '37');
INSERT INTO `t_data_info_user` VALUES ('416', '115', '6', '37');
INSERT INTO `t_data_info_user` VALUES ('417', '115', '7', '37');
INSERT INTO `t_data_info_user` VALUES ('418', '116', '8', '54');
INSERT INTO `t_data_info_user` VALUES ('419', '116', '3', '52');
INSERT INTO `t_data_info_user` VALUES ('420', '116', '7', '52');
INSERT INTO `t_data_info_user` VALUES ('421', '117', '2', '-1');
INSERT INTO `t_data_info_user` VALUES ('422', '118', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('423', '118', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('424', '119', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('425', '119', '2', '-1');
INSERT INTO `t_data_info_user` VALUES ('426', '120', '1', '9');
INSERT INTO `t_data_info_user` VALUES ('427', '120', '2', '9');
INSERT INTO `t_data_info_user` VALUES ('428', '120', '4', '9');
INSERT INTO `t_data_info_user` VALUES ('429', '120', '6', '9');
INSERT INTO `t_data_info_user` VALUES ('430', '120', '2', '8');
INSERT INTO `t_data_info_user` VALUES ('431', '121', '4', '38');
INSERT INTO `t_data_info_user` VALUES ('432', '121', '6', '38');
INSERT INTO `t_data_info_user` VALUES ('433', '121', '7', '38');
INSERT INTO `t_data_info_user` VALUES ('434', '121', '4', '37');
INSERT INTO `t_data_info_user` VALUES ('435', '121', '6', '37');
INSERT INTO `t_data_info_user` VALUES ('436', '121', '7', '37');
INSERT INTO `t_data_info_user` VALUES ('437', '121', '1', '9');
INSERT INTO `t_data_info_user` VALUES ('438', '121', '2', '9');
INSERT INTO `t_data_info_user` VALUES ('439', '121', '4', '9');
INSERT INTO `t_data_info_user` VALUES ('440', '121', '6', '9');
INSERT INTO `t_data_info_user` VALUES ('441', '122', '7', '31');
INSERT INTO `t_data_info_user` VALUES ('442', '123', '4', '37');
INSERT INTO `t_data_info_user` VALUES ('443', '124', '4', '38');
INSERT INTO `t_data_info_user` VALUES ('444', '124', '6', '38');
INSERT INTO `t_data_info_user` VALUES ('445', '124', '7', '38');
INSERT INTO `t_data_info_user` VALUES ('446', '124', '4', '37');
INSERT INTO `t_data_info_user` VALUES ('447', '124', '6', '37');
INSERT INTO `t_data_info_user` VALUES ('448', '124', '7', '37');
INSERT INTO `t_data_info_user` VALUES ('449', '125', '4', '38');
INSERT INTO `t_data_info_user` VALUES ('450', '125', '6', '38');
INSERT INTO `t_data_info_user` VALUES ('451', '125', '7', '38');
INSERT INTO `t_data_info_user` VALUES ('452', '125', '4', '37');
INSERT INTO `t_data_info_user` VALUES ('453', '125', '6', '37');
INSERT INTO `t_data_info_user` VALUES ('454', '125', '7', '37');
INSERT INTO `t_data_info_user` VALUES ('455', '126', '8', '54');
INSERT INTO `t_data_info_user` VALUES ('456', '126', '3', '52');
INSERT INTO `t_data_info_user` VALUES ('457', '126', '7', '52');
INSERT INTO `t_data_info_user` VALUES ('458', '126', '18', '261');
INSERT INTO `t_data_info_user` VALUES ('459', '126', '18', '262');
INSERT INTO `t_data_info_user` VALUES ('460', '127', '4', '38');
INSERT INTO `t_data_info_user` VALUES ('461', '127', '6', '38');
INSERT INTO `t_data_info_user` VALUES ('462', '127', '7', '38');
INSERT INTO `t_data_info_user` VALUES ('463', '127', '2', '37');
INSERT INTO `t_data_info_user` VALUES ('464', '127', '4', '37');
INSERT INTO `t_data_info_user` VALUES ('465', '127', '6', '37');
INSERT INTO `t_data_info_user` VALUES ('466', '127', '7', '37');
INSERT INTO `t_data_info_user` VALUES ('467', '128', '4', '38');
INSERT INTO `t_data_info_user` VALUES ('468', '128', '6', '38');
INSERT INTO `t_data_info_user` VALUES ('469', '128', '7', '38');
INSERT INTO `t_data_info_user` VALUES ('470', '128', '2', '37');
INSERT INTO `t_data_info_user` VALUES ('471', '128', '4', '37');
INSERT INTO `t_data_info_user` VALUES ('472', '128', '6', '37');
INSERT INTO `t_data_info_user` VALUES ('473', '128', '7', '37');
INSERT INTO `t_data_info_user` VALUES ('474', '128', '18', '261');
INSERT INTO `t_data_info_user` VALUES ('475', '128', '18', '262');
INSERT INTO `t_data_info_user` VALUES ('476', '129', '4', '38');
INSERT INTO `t_data_info_user` VALUES ('477', '129', '6', '38');
INSERT INTO `t_data_info_user` VALUES ('478', '129', '7', '38');
INSERT INTO `t_data_info_user` VALUES ('479', '129', '2', '37');
INSERT INTO `t_data_info_user` VALUES ('480', '129', '4', '37');
INSERT INTO `t_data_info_user` VALUES ('481', '129', '6', '37');
INSERT INTO `t_data_info_user` VALUES ('482', '129', '7', '37');
INSERT INTO `t_data_info_user` VALUES ('483', '130', '4', '38');
INSERT INTO `t_data_info_user` VALUES ('484', '130', '6', '38');
INSERT INTO `t_data_info_user` VALUES ('485', '130', '7', '38');
INSERT INTO `t_data_info_user` VALUES ('486', '130', '2', '37');
INSERT INTO `t_data_info_user` VALUES ('487', '130', '4', '37');
INSERT INTO `t_data_info_user` VALUES ('488', '130', '6', '37');
INSERT INTO `t_data_info_user` VALUES ('489', '130', '7', '37');
INSERT INTO `t_data_info_user` VALUES ('490', '131', '4', '38');
INSERT INTO `t_data_info_user` VALUES ('491', '131', '6', '38');
INSERT INTO `t_data_info_user` VALUES ('492', '131', '7', '38');
INSERT INTO `t_data_info_user` VALUES ('493', '131', '2', '37');
INSERT INTO `t_data_info_user` VALUES ('494', '131', '4', '37');
INSERT INTO `t_data_info_user` VALUES ('495', '131', '6', '37');
INSERT INTO `t_data_info_user` VALUES ('496', '131', '7', '37');

-- ----------------------------
-- Table structure for `t_data_temp_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_data_temp_info`;
CREATE TABLE `t_data_temp_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `orgid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_data_temp_info
-- ----------------------------
INSERT INTO `t_data_temp_info` VALUES ('3', '成绩列表', '请务必填写完成', '2015-01-16 10:35:44', '1', '11');
INSERT INTO `t_data_temp_info` VALUES ('4', 'ces', 'dfdfdf', '2015-01-29 11:29:35', '1', '11');
INSERT INTO `t_data_temp_info` VALUES ('5', '测试', '撒地方', '2015-01-30 16:33:12', '1', '11');
INSERT INTO `t_data_temp_info` VALUES ('6', '测试数据', '这只是测试数据', '2015-01-30 16:46:35', '1', '11');
INSERT INTO `t_data_temp_info` VALUES ('7', 'test', 'testtest', '2015-01-30 16:47:40', '1', '11');
INSERT INTO `t_data_temp_info` VALUES ('8', 'ie测试', 'ie测试ie测试', '2015-01-30 16:48:48', '1', '11');
INSERT INTO `t_data_temp_info` VALUES ('9', '       ', '1', '2015-02-05 09:43:29', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('10', '舍得', '都是', '2015-02-05 09:47:49', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('11', '舍得', '舍得', '2015-02-05 09:48:00', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('12', '舍得', '双方都', '2015-02-05 09:48:11', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('13', '水电费', '水电费', '2015-02-05 09:48:27', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('14', '房顶上', '  都是', '2015-02-05 09:48:37', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('15', '法第四十', '是的', '2015-02-05 09:48:54', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('16', '1', '1', '2015-02-05 09:49:01', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('17', '23', '水电费', '2015-02-05 09:58:52', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('18', '房顶上', '是 ', '2015-02-05 09:59:00', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('19', '435', '额', '2015-02-05 10:01:27', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('20', '1', '2', '2015-02-05 10:01:59', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('21', '佛挡杀佛', '双方都', '2015-02-05 10:02:25', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('22', 'dfsfhjgf', 'fgh', '2015-02-05 10:01:11', '1', '11');
INSERT INTO `t_data_temp_info` VALUES ('23', '45', '4', '2015-02-05 10:02:43', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('24', '3', '43', '2015-02-05 10:02:52', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('25', '54', '54', '2015-02-05 10:03:03', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('26', '345', '534', '2015-02-05 10:03:15', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('27', '水电费', '是的', '2015-02-05 10:04:40', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('28', '更何况回归', '就', '2015-02-05 10:03:19', '1', '11');
INSERT INTO `t_data_temp_info` VALUES ('29', '饿', '发的是', '2015-02-05 10:04:50', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('30', '房顶上', '1', '2015-02-05 10:07:47', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('31', '防水袋防水袋防水袋防水袋防水袋防水袋', '1', '2015-02-05 10:08:34', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('32', '否定了开始减肥就', '是', '2015-02-05 10:12:12', '4', '16');
INSERT INTO `t_data_temp_info` VALUES ('33', '付借款的', '是的', '2015-02-05 10:21:18', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('34', '开始', '开始', '2015-02-05 10:25:01', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('35', 'ceshi ', 'sdfs', '2015-02-05 11:27:59', '1', '11');
INSERT INTO `t_data_temp_info` VALUES ('36', '顺序测试', '123', '2015-02-05 15:35:43', '1', '11');
INSERT INTO `t_data_temp_info` VALUES ('37', '           ', 'a', '2015-02-05 16:34:23', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('38', '         ', '1', '2015-02-05 16:34:47', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('39', '防水袋房顶上', '都是', '2015-02-05 16:36:26', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('40', '付水电费', '都是', '2015-02-05 16:37:21', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('41', '最丰盛的', '水电费', '2015-02-05 16:41:19', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('42', '地方', '是的', '2015-02-05 16:41:31', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('43', '第一完小', '十多个', '2015-02-05 16:49:50', '1', '11');
INSERT INTO `t_data_temp_info` VALUES ('44', '公会机构', '公会机构', '2015-02-05 16:51:18', '1', '11');
INSERT INTO `t_data_temp_info` VALUES ('45', '小宁测试', '小宁测试', '2015-02-05 16:51:47', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('46', '2', '3', '2015-02-05 16:53:32', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('47', '附件', '水电费', '2015-02-05 16:54:13', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('48', '4要', '泛光灯', '2015-02-05 16:54:24', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('49', '就开始就', '房顶上', '2015-02-05 16:54:41', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('50', '的士费', '的士费', '2015-02-05 16:54:48', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('51', '即可', '地方', '2015-02-05 16:55:04', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('52', '即可', '是否', '2015-02-05 16:55:18', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('53', '低功耗', '的风格', '2015-02-05 16:58:06', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('54', '是的', '豆沙方糕', '2015-02-05 16:59:40', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('55', 'fdsf d', 'dfs', '2015-02-06 08:52:31', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('56', '双方都水电费水电费', '是', '2015-02-06 08:52:49', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('57', '11', '34534256345645', '2015-02-06 14:29:47', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('58', '345', 'dgr', '2015-02-06 14:33:56', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('59', '123', '234', '2015-02-06 14:35:11', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('60', '567', '与', '2015-02-06 14:35:23', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('61', '67867', 'rtd', '2015-02-06 14:35:43', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('62', 'ytu', 'bm', '2015-02-06 14:35:57', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('63', 'fjksdfj ', 'dfs ', '2015-02-06 14:36:51', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('64', '678', '456', '2015-02-06 14:38:27', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('65', '56765', '为', '2015-02-06 14:41:08', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('66', '通天塔', '而非', '2015-02-06 14:44:13', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('67', '09', '8906', '2015-02-06 14:45:31', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('68', '998', '体育', '2015-02-06 14:46:16', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('69', 'try他人与', '日体育', '2015-02-06 14:46:41', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('70', '哦90', '哦90', '2015-02-06 14:47:21', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('71', 'u8', '更多', '2015-02-06 14:48:00', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('72', '5643n ', 'df ', '2015-02-06 14:50:37', '7', '52');
INSERT INTO `t_data_temp_info` VALUES ('73', '456', 'ert ', '2015-02-06 14:51:04', '7', '52');
INSERT INTO `t_data_temp_info` VALUES ('74', 'fgyrt', 'ty ', '2015-02-06 14:53:05', '7', '52');
INSERT INTO `t_data_temp_info` VALUES ('75', '个梵蒂冈', '电饭锅', '2015-02-06 15:24:04', '4', '36');
INSERT INTO `t_data_temp_info` VALUES ('76', '第三方让他忽然', '范德萨发给', '2015-02-06 15:24:30', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('77', '和回复该回复', '附近时口袋里放假', '2015-02-06 15:25:04', '4', '36');
INSERT INTO `t_data_temp_info` VALUES ('78', '123', '尔', '2015-02-06 15:25:36', '4', '36');
INSERT INTO `t_data_temp_info` VALUES ('79', '123345', 'f ', '2015-02-06 15:35:24', '7', '52');
INSERT INTO `t_data_temp_info` VALUES ('80', 'fsdf', 'dsf', '2015-02-06 16:41:39', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('81', '鼎折覆餗', '房顶上', '2015-02-06 16:43:24', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('82', '678', ' 就', '2015-02-06 17:10:58', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('84', '噶', '三个', '2015-02-06 17:11:22', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('85', '是的发生', 'd发给', '2015-02-06 17:17:28', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('86', '很健康', '环境', '2015-02-06 17:19:13', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('87', '是东风公司', '十多个', '2015-02-06 17:20:52', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('88', '附件', '的发挥', '2015-02-06 17:21:07', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('89', 'fgsdh ', 'dfj ', '2015-02-06 17:21:22', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('90', 'drtu ', 'dfgh ', '2015-02-06 17:21:36', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('91', 'fktyu ', 'gfjk ', '2015-02-06 17:21:51', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('92', 'gfjgft ', 'ghjg', '2015-02-06 17:22:10', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('93', '457676', 'gfjf t', '2015-02-06 17:23:23', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('94', 'nmfgtjtd', 'fghjtdy', '2015-02-06 17:23:35', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('95', 'm,trjm', 'fdghf', '2015-02-06 17:23:55', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('96', 'ml;dfsjop', 'fj ', '2015-02-06 17:24:21', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('97', 'yuiy', 'ghfm ', '2015-02-06 17:24:32', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('98', '测试12', '防水袋', '2015-02-09 08:48:24', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('99', '测试1', '的说法', '2015-02-09 10:30:15', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('100', '12423', null, '2015-02-09 10:30:28', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('101', 'gregrg', '发送鬼地方个谁发发送鬼地方个谁发发送鬼地方个谁发发送鬼地方个谁发', '2015-02-09 10:31:03', '4', '36');
INSERT INTO `t_data_temp_info` VALUES ('102', '数据收集测试', '123', '2015-02-09 10:31:50', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('103', '数据收集2', '测试啊', '2015-02-09 10:35:42', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('104', '数据收集3', '填写数据收集任务啦', '2015-02-09 10:54:49', '4', '15');
INSERT INTO `t_data_temp_info` VALUES ('105', 'fsd ', '考虑防水袋飞机失联可点击发考虑防水袋飞机失联可点击发考虑防水袋飞', '2015-02-09 13:55:00', '4', '36');
INSERT INTO `t_data_temp_info` VALUES ('106', '第四', '第四', '2015-02-09 13:57:18', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('107', '测试', '佛挡杀佛地方', '2015-02-09 13:58:00', '4', '35');
INSERT INTO `t_data_temp_info` VALUES ('108', '法规', 'Greg', '2015-02-09 13:59:39', '4', '35');
INSERT INTO `t_data_temp_info` VALUES ('109', '1', null, '2015-02-09 15:40:25', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('110', '1', null, '2015-02-09 15:41:04', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('111', '   3', null, '2015-02-10 09:33:18', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('112', '4', null, '2015-02-10 09:33:34', '1', '9');
INSERT INTO `t_data_temp_info` VALUES ('113', 'rewcc', null, '2015-02-10 10:30:15', '6', '37');
INSERT INTO `t_data_temp_info` VALUES ('114', 'ger吧ger吧ger吧ger吧ger吧ger吧ger吧ger吧ger吧ger吧ger吧ger吧ger吧ger吧', null, '2015-02-10 10:31:07', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('115', '尔', null, '2015-02-10 10:31:27', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('116', '投入和', '梵蒂冈', '2015-02-10 10:31:35', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('117', '12423', null, '2015-02-10 10:36:06', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('118', '测试数据收集状态', null, '2015-02-10 10:39:21', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('119', '测试没有填写手机号码的人员发送数据收集短信', null, '2015-02-10 10:50:04', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('120', '112', null, '2015-02-10 15:34:51', '4', '36');
INSERT INTO `t_data_temp_info` VALUES ('121', '435', null, '2015-02-10 15:35:06', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('122', 'erte', null, '2015-02-10 15:35:21', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('123', '下午', null, '2015-02-10 15:59:15', '7', '52');
INSERT INTO `t_data_temp_info` VALUES ('124', '213', '32', '2015-02-11 13:43:52', '7', '52');
INSERT INTO `t_data_temp_info` VALUES ('125', '下午好', '是', '2015-02-11 15:03:37', '4', '35');
INSERT INTO `t_data_temp_info` VALUES ('126', '测试', null, '2015-02-14 15:03:04', '2', '9');
INSERT INTO `t_data_temp_info` VALUES ('127', '123', null, '2015-02-14 15:03:51', '2', '9');
INSERT INTO `t_data_temp_info` VALUES ('128', '12', '12', '2015-02-14 15:06:48', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('129', '123', null, '2015-02-27 11:02:21', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('130', '2334', null, '2015-02-27 11:11:42', '4', '9');
INSERT INTO `t_data_temp_info` VALUES ('131', '新年好', null, '2015-02-27 11:15:53', '2', '9');

-- ----------------------------
-- Table structure for `t_data_temp_info_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_data_temp_info_detail`;
CREATE TABLE `t_data_temp_info_detail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEMPINFOID` int(11) DEFAULT NULL,
  `DETAIL` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='自定义收集数据内容';

-- ----------------------------
-- Records of t_data_temp_info_detail
-- ----------------------------
INSERT INTO `t_data_temp_info_detail` VALUES ('8', '3', '语文');
INSERT INTO `t_data_temp_info_detail` VALUES ('9', '3', '数学');
INSERT INTO `t_data_temp_info_detail` VALUES ('10', '3', '英语');
INSERT INTO `t_data_temp_info_detail` VALUES ('11', '3', '物理');
INSERT INTO `t_data_temp_info_detail` VALUES ('12', '3', '化学');
INSERT INTO `t_data_temp_info_detail` VALUES ('13', '3', '生物');
INSERT INTO `t_data_temp_info_detail` VALUES ('14', '3', '历史');
INSERT INTO `t_data_temp_info_detail` VALUES ('15', '3', '地理');
INSERT INTO `t_data_temp_info_detail` VALUES ('16', '3', '政治');
INSERT INTO `t_data_temp_info_detail` VALUES ('17', '3', '音乐');
INSERT INTO `t_data_temp_info_detail` VALUES ('18', '4', 'ddf');
INSERT INTO `t_data_temp_info_detail` VALUES ('19', '5', '测试1');
INSERT INTO `t_data_temp_info_detail` VALUES ('20', '5', '测试2');
INSERT INTO `t_data_temp_info_detail` VALUES ('21', '5', '测试3');
INSERT INTO `t_data_temp_info_detail` VALUES ('22', '6', '测试数据1');
INSERT INTO `t_data_temp_info_detail` VALUES ('23', '6', '测试数据2');
INSERT INTO `t_data_temp_info_detail` VALUES ('24', '6', '测试数据3');
INSERT INTO `t_data_temp_info_detail` VALUES ('25', '7', 'test1');
INSERT INTO `t_data_temp_info_detail` VALUES ('26', '7', 'test2');
INSERT INTO `t_data_temp_info_detail` VALUES ('27', '7', 'test3');
INSERT INTO `t_data_temp_info_detail` VALUES ('28', '8', 'ie测试1');
INSERT INTO `t_data_temp_info_detail` VALUES ('29', '8', 'ie测试2');
INSERT INTO `t_data_temp_info_detail` VALUES ('30', '9', '1');
INSERT INTO `t_data_temp_info_detail` VALUES ('31', '10', '舍得');
INSERT INTO `t_data_temp_info_detail` VALUES ('32', '11', '舍得');
INSERT INTO `t_data_temp_info_detail` VALUES ('33', '12', '水电费');
INSERT INTO `t_data_temp_info_detail` VALUES ('34', '13', '是的');
INSERT INTO `t_data_temp_info_detail` VALUES ('35', '13', '水电费');
INSERT INTO `t_data_temp_info_detail` VALUES ('36', '13', '水电费');
INSERT INTO `t_data_temp_info_detail` VALUES ('37', '13', '双方都');
INSERT INTO `t_data_temp_info_detail` VALUES ('38', '14', '是的发');
INSERT INTO `t_data_temp_info_detail` VALUES ('39', '15', '是的发');
INSERT INTO `t_data_temp_info_detail` VALUES ('40', '16', '1');
INSERT INTO `t_data_temp_info_detail` VALUES ('41', '17', '佛挡杀佛');
INSERT INTO `t_data_temp_info_detail` VALUES ('42', '18', '是的');
INSERT INTO `t_data_temp_info_detail` VALUES ('43', '19', '543');
INSERT INTO `t_data_temp_info_detail` VALUES ('44', '19', '543');
INSERT INTO `t_data_temp_info_detail` VALUES ('45', '19', '3');
INSERT INTO `t_data_temp_info_detail` VALUES ('46', '19', '54');
INSERT INTO `t_data_temp_info_detail` VALUES ('47', '20', '1');
INSERT INTO `t_data_temp_info_detail` VALUES ('48', '20', '2');
INSERT INTO `t_data_temp_info_detail` VALUES ('49', '21', '水电费');
INSERT INTO `t_data_temp_info_detail` VALUES ('50', '22', 'fgh');
INSERT INTO `t_data_temp_info_detail` VALUES ('51', '22', null);
INSERT INTO `t_data_temp_info_detail` VALUES ('52', '22', 'gfj');
INSERT INTO `t_data_temp_info_detail` VALUES ('53', '23', '4');
INSERT INTO `t_data_temp_info_detail` VALUES ('54', '24', '34');
INSERT INTO `t_data_temp_info_detail` VALUES ('55', '25', '54');
INSERT INTO `t_data_temp_info_detail` VALUES ('56', '26', '534');
INSERT INTO `t_data_temp_info_detail` VALUES ('57', '27', '水电费');
INSERT INTO `t_data_temp_info_detail` VALUES ('58', '28', '根据');
INSERT INTO `t_data_temp_info_detail` VALUES ('59', '28', null);
INSERT INTO `t_data_temp_info_detail` VALUES ('60', '28', null);
INSERT INTO `t_data_temp_info_detail` VALUES ('61', '29', '是的');
INSERT INTO `t_data_temp_info_detail` VALUES ('62', '30', '是的费昆仑山点击发送的境况里的水经费水井是的费昆仑山点击发送的境况里的水经费水井坊考虑到发是的费昆仑山点击发送的境况里的水经费水井坊考虑到发是的费昆仑山点击发送的境况里的水经费水井坊考虑到发是的费昆仑山点击发送的境况里的水经费水井坊考虑到发是的费昆仑山点击发送的境况里的水经费水井坊考虑到发坊考虑到发');
INSERT INTO `t_data_temp_info_detail` VALUES ('63', '30', '是的费昆仑山点击发送的境况里的水经费水井坊考虑是的费昆仑山点击发送的境况里的水经费水井坊考虑到发sss是到发sss是');
INSERT INTO `t_data_temp_info_detail` VALUES ('64', '32', '脑袋上快放假');
INSERT INTO `t_data_temp_info_detail` VALUES ('65', '33', '是的发');
INSERT INTO `t_data_temp_info_detail` VALUES ('66', '34', '开始');
INSERT INTO `t_data_temp_info_detail` VALUES ('67', '35', '1');
INSERT INTO `t_data_temp_info_detail` VALUES ('68', '35', '2');
INSERT INTO `t_data_temp_info_detail` VALUES ('69', '36', '3');
INSERT INTO `t_data_temp_info_detail` VALUES ('70', '36', '2');
INSERT INTO `t_data_temp_info_detail` VALUES ('71', '36', '1');
INSERT INTO `t_data_temp_info_detail` VALUES ('72', '37', 'a');
INSERT INTO `t_data_temp_info_detail` VALUES ('73', '38', '1');
INSERT INTO `t_data_temp_info_detail` VALUES ('74', '41', '水电费');
INSERT INTO `t_data_temp_info_detail` VALUES ('75', '42', '是地方');
INSERT INTO `t_data_temp_info_detail` VALUES ('76', '43', '第二完小');
INSERT INTO `t_data_temp_info_detail` VALUES ('77', '43', '第一完小');
INSERT INTO `t_data_temp_info_detail` VALUES ('78', '44', '公会机构');
INSERT INTO `t_data_temp_info_detail` VALUES ('79', '44', '公会机构');
INSERT INTO `t_data_temp_info_detail` VALUES ('80', '45', '小宁测试');
INSERT INTO `t_data_temp_info_detail` VALUES ('81', '46', '3');
INSERT INTO `t_data_temp_info_detail` VALUES ('82', '47', '水电费');
INSERT INTO `t_data_temp_info_detail` VALUES ('83', '48', '发动');
INSERT INTO `t_data_temp_info_detail` VALUES ('84', '49', '地方税');
INSERT INTO `t_data_temp_info_detail` VALUES ('85', '50', '地方');
INSERT INTO `t_data_temp_info_detail` VALUES ('86', '51', '电饭锅');
INSERT INTO `t_data_temp_info_detail` VALUES ('87', '52', '付水电费');
INSERT INTO `t_data_temp_info_detail` VALUES ('88', '53', null);
INSERT INTO `t_data_temp_info_detail` VALUES ('89', '53', '风光好');
INSERT INTO `t_data_temp_info_detail` VALUES ('90', '54', '订购');
INSERT INTO `t_data_temp_info_detail` VALUES ('91', '54', '的股份');
INSERT INTO `t_data_temp_info_detail` VALUES ('92', '55', 'fdsfsdf');
INSERT INTO `t_data_temp_info_detail` VALUES ('93', '56', '的士费');
INSERT INTO `t_data_temp_info_detail` VALUES ('94', '57', '34');
INSERT INTO `t_data_temp_info_detail` VALUES ('95', '57', '123');
INSERT INTO `t_data_temp_info_detail` VALUES ('96', '58', 'k');
INSERT INTO `t_data_temp_info_detail` VALUES ('97', '58', 'h');
INSERT INTO `t_data_temp_info_detail` VALUES ('98', '58', 'rthy');
INSERT INTO `t_data_temp_info_detail` VALUES ('99', '58', '345');
INSERT INTO `t_data_temp_info_detail` VALUES ('100', '59', '234');
INSERT INTO `t_data_temp_info_detail` VALUES ('101', '60', 'try');
INSERT INTO `t_data_temp_info_detail` VALUES ('102', '61', 'dfgd');
INSERT INTO `t_data_temp_info_detail` VALUES ('103', '62', 'nbm');
INSERT INTO `t_data_temp_info_detail` VALUES ('104', '62', 'tyu');
INSERT INTO `t_data_temp_info_detail` VALUES ('105', '63', 'fds f');
INSERT INTO `t_data_temp_info_detail` VALUES ('106', '63', 'fsdf ');
INSERT INTO `t_data_temp_info_detail` VALUES ('107', '64', '789');
INSERT INTO `t_data_temp_info_detail` VALUES ('108', '64', '567');
INSERT INTO `t_data_temp_info_detail` VALUES ('109', '65', '567');
INSERT INTO `t_data_temp_info_detail` VALUES ('110', '65', '567');
INSERT INTO `t_data_temp_info_detail` VALUES ('111', '66', '123 ');
INSERT INTO `t_data_temp_info_detail` VALUES ('112', '66', '他');
INSERT INTO `t_data_temp_info_detail` VALUES ('113', '67', '90');
INSERT INTO `t_data_temp_info_detail` VALUES ('114', '67', '09');
INSERT INTO `t_data_temp_info_detail` VALUES ('115', '68', '97');
INSERT INTO `t_data_temp_info_detail` VALUES ('116', '68', '998');
INSERT INTO `t_data_temp_info_detail` VALUES ('117', '69', '日体育');
INSERT INTO `t_data_temp_info_detail` VALUES ('118', '69', '体育');
INSERT INTO `t_data_temp_info_detail` VALUES ('119', '70', '哦9012');
INSERT INTO `t_data_temp_info_detail` VALUES ('120', '70', '哦90');
INSERT INTO `t_data_temp_info_detail` VALUES ('121', '71', '56');
INSERT INTO `t_data_temp_info_detail` VALUES ('122', '71', 'u8');
INSERT INTO `t_data_temp_info_detail` VALUES ('123', '72', '语文');
INSERT INTO `t_data_temp_info_detail` VALUES ('124', '72', '456 ');
INSERT INTO `t_data_temp_info_detail` VALUES ('125', '73', 'rte');
INSERT INTO `t_data_temp_info_detail` VALUES ('126', '74', 'rty');
INSERT INTO `t_data_temp_info_detail` VALUES ('127', '75', '梵蒂冈');
INSERT INTO `t_data_temp_info_detail` VALUES ('128', '75', '梵蒂冈');
INSERT INTO `t_data_temp_info_detail` VALUES ('129', '76', '就看电视剧');
INSERT INTO `t_data_temp_info_detail` VALUES ('130', '76', '热天');
INSERT INTO `t_data_temp_info_detail` VALUES ('131', '77', '常年卡萨丁v好');
INSERT INTO `t_data_temp_info_detail` VALUES ('132', '77', '快快健康');
INSERT INTO `t_data_temp_info_detail` VALUES ('133', '77', '如图一');
INSERT INTO `t_data_temp_info_detail` VALUES ('134', '78', '765');
INSERT INTO `t_data_temp_info_detail` VALUES ('135', '78', '345');
INSERT INTO `t_data_temp_info_detail` VALUES ('136', '78', '321');
INSERT INTO `t_data_temp_info_detail` VALUES ('137', '79', '23445');
INSERT INTO `t_data_temp_info_detail` VALUES ('138', '79', '234');
INSERT INTO `t_data_temp_info_detail` VALUES ('139', '80', 'fsdfsdf');
INSERT INTO `t_data_temp_info_detail` VALUES ('140', '80', 'fdsf');
INSERT INTO `t_data_temp_info_detail` VALUES ('141', '81', '他羊肉汤有');
INSERT INTO `t_data_temp_info_detail` VALUES ('142', '81', '腾地方刚');
INSERT INTO `t_data_temp_info_detail` VALUES ('143', '81', '袋f防水袋f');
INSERT INTO `t_data_temp_info_detail` VALUES ('144', '86', '更换即可');
INSERT INTO `t_data_temp_info_detail` VALUES ('145', '87', '的双方各和');
INSERT INTO `t_data_temp_info_detail` VALUES ('146', '88', '地方');
INSERT INTO `t_data_temp_info_detail` VALUES ('147', '89', 'fghj');
INSERT INTO `t_data_temp_info_detail` VALUES ('148', '90', 'fdh ');
INSERT INTO `t_data_temp_info_detail` VALUES ('149', '90', 'dfj ');
INSERT INTO `t_data_temp_info_detail` VALUES ('150', '91', 'dsrts ');
INSERT INTO `t_data_temp_info_detail` VALUES ('151', '91', 'ghkfy ');
INSERT INTO `t_data_temp_info_detail` VALUES ('152', '92', 'dsdfgd');
INSERT INTO `t_data_temp_info_detail` VALUES ('153', '92', 'dfshdtty ');
INSERT INTO `t_data_temp_info_detail` VALUES ('154', '93', 'ykyf ');
INSERT INTO `t_data_temp_info_detail` VALUES ('155', '93', 'rth ');
INSERT INTO `t_data_temp_info_detail` VALUES ('156', '94', 'sertd');
INSERT INTO `t_data_temp_info_detail` VALUES ('157', '94', 'ghmtdy');
INSERT INTO `t_data_temp_info_detail` VALUES ('158', '95', 'nkftr');
INSERT INTO `t_data_temp_info_detail` VALUES ('159', '95', 'dfjodfjo');
INSERT INTO `t_data_temp_info_detail` VALUES ('160', '96', 'gfjf');
INSERT INTO `t_data_temp_info_detail` VALUES ('161', '96', 'ghj ');
INSERT INTO `t_data_temp_info_detail` VALUES ('162', '97', 'bnmg');
INSERT INTO `t_data_temp_info_detail` VALUES ('163', '97', 'nbgf');
INSERT INTO `t_data_temp_info_detail` VALUES ('164', '98', '方式等方式');
INSERT INTO `t_data_temp_info_detail` VALUES ('165', '98', '额外认为');
INSERT INTO `t_data_temp_info_detail` VALUES ('166', '99', 'sd ');
INSERT INTO `t_data_temp_info_detail` VALUES ('167', '99', '的说法');
INSERT INTO `t_data_temp_info_detail` VALUES ('168', '99', '都是发');
INSERT INTO `t_data_temp_info_detail` VALUES ('169', '100', 'rerewrw');
INSERT INTO `t_data_temp_info_detail` VALUES ('170', '100', 'werewr');
INSERT INTO `t_data_temp_info_detail` VALUES ('171', '100', 'fsdfsfsdf');
INSERT INTO `t_data_temp_info_detail` VALUES ('172', '101', 'gerggre对方是否gerggre对方是否gerggre对方是');
INSERT INTO `t_data_temp_info_detail` VALUES ('173', '101', 'gerggre对方是否gerggre对方是否gerggre对方是');
INSERT INTO `t_data_temp_info_detail` VALUES ('174', '102', '5');
INSERT INTO `t_data_temp_info_detail` VALUES ('175', '102', '4');
INSERT INTO `t_data_temp_info_detail` VALUES ('176', '102', '3');
INSERT INTO `t_data_temp_info_detail` VALUES ('177', '102', '2');
INSERT INTO `t_data_temp_info_detail` VALUES ('178', '102', '1');
INSERT INTO `t_data_temp_info_detail` VALUES ('179', '103', '10');
INSERT INTO `t_data_temp_info_detail` VALUES ('180', '103', '9');
INSERT INTO `t_data_temp_info_detail` VALUES ('181', '103', '8');
INSERT INTO `t_data_temp_info_detail` VALUES ('182', '103', '7');
INSERT INTO `t_data_temp_info_detail` VALUES ('183', '103', '6');
INSERT INTO `t_data_temp_info_detail` VALUES ('184', '103', '5');
INSERT INTO `t_data_temp_info_detail` VALUES ('185', '103', '4');
INSERT INTO `t_data_temp_info_detail` VALUES ('186', '103', '3');
INSERT INTO `t_data_temp_info_detail` VALUES ('187', '103', '2');
INSERT INTO `t_data_temp_info_detail` VALUES ('188', '103', '1');
INSERT INTO `t_data_temp_info_detail` VALUES ('189', '104', '10');
INSERT INTO `t_data_temp_info_detail` VALUES ('190', '104', '9');
INSERT INTO `t_data_temp_info_detail` VALUES ('191', '104', '8');
INSERT INTO `t_data_temp_info_detail` VALUES ('192', '104', '7');
INSERT INTO `t_data_temp_info_detail` VALUES ('193', '104', '6');
INSERT INTO `t_data_temp_info_detail` VALUES ('194', '104', '5');
INSERT INTO `t_data_temp_info_detail` VALUES ('195', '104', '4');
INSERT INTO `t_data_temp_info_detail` VALUES ('196', '104', '3');
INSERT INTO `t_data_temp_info_detail` VALUES ('197', '104', '2');
INSERT INTO `t_data_temp_info_detail` VALUES ('198', '104', '1');
INSERT INTO `t_data_temp_info_detail` VALUES ('199', '105', 'rtret');
INSERT INTO `t_data_temp_info_detail` VALUES ('200', '105', 'greg ');
INSERT INTO `t_data_temp_info_detail` VALUES ('201', '105', 'sdf ');
INSERT INTO `t_data_temp_info_detail` VALUES ('202', '106', '第四');
INSERT INTO `t_data_temp_info_detail` VALUES ('203', '107', '测试');
INSERT INTO `t_data_temp_info_detail` VALUES ('204', '108', '3');
INSERT INTO `t_data_temp_info_detail` VALUES ('205', '108', '2');
INSERT INTO `t_data_temp_info_detail` VALUES ('206', '108', '1');
INSERT INTO `t_data_temp_info_detail` VALUES ('207', '109', '12');
INSERT INTO `t_data_temp_info_detail` VALUES ('208', '110', '10');
INSERT INTO `t_data_temp_info_detail` VALUES ('209', '111', '1');
INSERT INTO `t_data_temp_info_detail` VALUES ('210', '112', '4');
INSERT INTO `t_data_temp_info_detail` VALUES ('211', '113', '热污染痴痴缠缠');
INSERT INTO `t_data_temp_info_detail` VALUES ('212', '114', '4');
INSERT INTO `t_data_temp_info_detail` VALUES ('213', '114', '3');
INSERT INTO `t_data_temp_info_detail` VALUES ('214', '114', '2');
INSERT INTO `t_data_temp_info_detail` VALUES ('215', '114', '1');
INSERT INTO `t_data_temp_info_detail` VALUES ('216', '115', '儿童');
INSERT INTO `t_data_temp_info_detail` VALUES ('217', '116', '梵蒂冈');
INSERT INTO `t_data_temp_info_detail` VALUES ('218', '117', '1');
INSERT INTO `t_data_temp_info_detail` VALUES ('219', '118', '测试数据收集状态');
INSERT INTO `t_data_temp_info_detail` VALUES ('220', '119', '测试');
INSERT INTO `t_data_temp_info_detail` VALUES ('221', '120', '212');
INSERT INTO `t_data_temp_info_detail` VALUES ('222', '121', '32');
INSERT INTO `t_data_temp_info_detail` VALUES ('223', '121', '323');
INSERT INTO `t_data_temp_info_detail` VALUES ('224', '121', '434');
INSERT INTO `t_data_temp_info_detail` VALUES ('225', '121', 't45t5');
INSERT INTO `t_data_temp_info_detail` VALUES ('226', '122', 'rte');
INSERT INTO `t_data_temp_info_detail` VALUES ('227', '122', 'ret');
INSERT INTO `t_data_temp_info_detail` VALUES ('228', '122', 'rtetrter');
INSERT INTO `t_data_temp_info_detail` VALUES ('229', '123', '下午');
INSERT INTO `t_data_temp_info_detail` VALUES ('230', '124', '321');
INSERT INTO `t_data_temp_info_detail` VALUES ('231', '125', '下午好');
INSERT INTO `t_data_temp_info_detail` VALUES ('232', '126', '测试');
INSERT INTO `t_data_temp_info_detail` VALUES ('233', '127', '1');
INSERT INTO `t_data_temp_info_detail` VALUES ('234', '128', '12');
INSERT INTO `t_data_temp_info_detail` VALUES ('235', '129', '212');
INSERT INTO `t_data_temp_info_detail` VALUES ('236', '129', '323');
INSERT INTO `t_data_temp_info_detail` VALUES ('237', '130', '4324');
INSERT INTO `t_data_temp_info_detail` VALUES ('238', '130', '3244');
INSERT INTO `t_data_temp_info_detail` VALUES ('239', '130', '454');
INSERT INTO `t_data_temp_info_detail` VALUES ('240', '131', '4324');

-- ----------------------------
-- Table structure for `t_oa_address_book`
-- ----------------------------
DROP TABLE IF EXISTS `t_oa_address_book`;
CREATE TABLE `t_oa_address_book` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键（ID）',
  `OWNER` int(11) DEFAULT NULL COMMENT '拥有者',
  `OPERID` int(11) DEFAULT NULL COMMENT '操作员表ID',
  `NAME` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `EMAIL` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '个人邮箱',
  `PHONE` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '个人电话',
  `OFFICEPHONE` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '办公电话',
  `QQ` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT 'QQ帐号',
  `BIRTHDAY` date DEFAULT NULL COMMENT '生日',
  `ORGID` int(11) DEFAULT NULL COMMENT '组织机构ID',
  `COMPANY` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '公司',
  `DEPARTMENT` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '部门',
  `POSITION` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '职位',
  `REMARK` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通讯薄';

-- ----------------------------
-- Records of t_oa_address_book
-- ----------------------------
INSERT INTO `t_oa_address_book` VALUES ('8', '1011', null, '弗拉德科夫弗拉德', '', '15367853354', '', '', null, null, null, null, null, '');
INSERT INTO `t_oa_address_book` VALUES ('9', '1011', null, '123fsdfs', 'SD@qq.com', '15711083378', '15711083378', '694666820', '2015-01-30', null, null, null, null, '');
INSERT INTO `t_oa_address_book` VALUES ('10', '1011', null, '135', '', '15367850805', '', '', null, null, null, null, null, '');
INSERT INTO `t_oa_address_book` VALUES ('11', '1011', null, '135', '', '15367850805', '', '', null, null, null, null, null, '');
INSERT INTO `t_oa_address_book` VALUES ('12', '1011', null, '135', '', '15367850805', '', '', null, null, null, null, null, '');
INSERT INTO `t_oa_address_book` VALUES ('13', '1011', null, '将地方开始', '694666858@qq.com3244444444444444444444444449444', '13565564563', '0731-8765432', '6897655454', '2015-01-12', null, null, null, null, '');
INSERT INTO `t_oa_address_book` VALUES ('15', '6', null, '张三', '', '15576652255', '', '', null, null, null, null, null, '');
INSERT INTO `t_oa_address_book` VALUES ('17', '7', null, '张三', 'www.xiaolin19900502@163.comfgdfgdgdfgdfgffyyyfffffffffffffffffffffffffffffffffffffffffy', '13567876543', '', '3845798347594375', '2015-02-10', null, null, null, null, '');
INSERT INTO `t_oa_address_book` VALUES ('18', '7', null, '王军', 'www.junlin19900809@163.com', '13545676554', '0731-87655432', '8987654323', '2014-11-11', null, null, null, null, '测试通讯录');
INSERT INTO `t_oa_address_book` VALUES ('19', '7', null, '王军', '', '13545676554', '0731-38438643', '', null, null, null, null, null, '');
INSERT INTO `t_oa_address_book` VALUES ('22', '7', null, '王五', '', '18711083379', '', '', null, null, null, null, null, '');
INSERT INTO `t_oa_address_book` VALUES ('23', '7', null, '的2', '', '18854674444', '', '', null, null, null, null, null, '');
INSERT INTO `t_oa_address_book` VALUES ('24', '7', null, '189', '', '18965433678', '', '', null, null, null, null, null, '');
INSERT INTO `t_oa_address_book` VALUES ('27', '8', '1', '超级管理员', 'admin@qq.com', '155 7665 2266', null, null, null, null, null, null, null, null);
INSERT INTO `t_oa_address_book` VALUES ('32', '2', '7', '刘美', '694686820@qq.com', '135 6787 6543', null, null, null, null, null, null, null, null);
INSERT INTO `t_oa_address_book` VALUES ('33', '2', '4', '唐小林', '694666820@qq.com', '187 1108 3379', null, null, null, null, null, null, null, null);
INSERT INTO `t_oa_address_book` VALUES ('34', '2', '1', '超级管理员', 'admin@qq.com', '155 7665 2266', null, null, null, null, null, null, null, null);
INSERT INTO `t_oa_address_book` VALUES ('43', '7', '4', '唐小林', '694666820@qq.com', '187 1108 3379', null, null, null, null, null, null, null, null);
INSERT INTO `t_oa_address_book` VALUES ('47', '7', '2', '汤姆', '', '15576652266', null, null, null, null, null, null, null, null);
INSERT INTO `t_oa_address_book` VALUES ('48', '1', '4', '唐小林', '694666820@qq.co', '18711083379', null, null, null, null, null, null, null, null);
INSERT INTO `t_oa_address_book` VALUES ('53', '7', '1', '超级管理员', 'admin@qq.com', '15576652266', null, null, null, null, null, null, null, null);
INSERT INTO `t_oa_address_book` VALUES ('56', '4', '1', '超级管理员', 'admin@qq.com', '15576652266', null, null, null, null, null, null, null, null);
INSERT INTO `t_oa_address_book` VALUES ('58', '4', '2', '汤姆', '', '15576652266', null, null, null, null, null, null, null, null);
INSERT INTO `t_oa_address_book` VALUES ('61', '1', '2', '汤姆', '', '15576652266', null, null, null, null, null, null, null, null);
INSERT INTO `t_oa_address_book` VALUES ('63', '4', '3', '杰瑞', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `t_oa_address_book` VALUES ('75', '1', '7', '刘美', '694686820@qq.com', '15616869959', null, null, null, null, null, null, null, null);
INSERT INTO `t_oa_address_book` VALUES ('78', '4', '12', '1', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `t_oa_address_book` VALUES ('80', '2', '11', '测试', '1@1', '111111111411', null, null, null, null, null, null, null, null);
INSERT INTO `t_oa_address_book` VALUES ('82', '4', '10', '聪哥', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_oa_address_book` VALUES ('84', '1', '27', '543', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `t_oa_address_book` VALUES ('85', '1', '29', '2skljfklsdjlllllllll', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `t_oa_address_book` VALUES ('87', '4', '7', '刘美', '694686820@qq.com', '15616869959', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `t_oa_mail`
-- ----------------------------
DROP TABLE IF EXISTS `t_oa_mail`;
CREATE TABLE `t_oa_mail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT` text COLLATE utf8_bin,
  `CREATEDATE` datetime DEFAULT NULL,
  `SENDDATE` datetime DEFAULT NULL,
  `SENDSTATUS` int(11) DEFAULT NULL COMMENT '0：未发送；1：已发送；2：发送失败',
  `USERID` int(11) DEFAULT NULL,
  `ORGID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='邮件主表';

-- ----------------------------
-- Records of t_oa_mail
-- ----------------------------
INSERT INTO `t_oa_mail` VALUES ('1', '1', 0x31, '2015-02-27 08:58:26', '2015-02-27 08:58:26', '0', '1', null);
INSERT INTO `t_oa_mail` VALUES ('2', '2', 0x32, '2015-02-27 09:00:14', '2015-02-27 09:00:14', '0', '1', null);
INSERT INTO `t_oa_mail` VALUES ('3', '3', 0x33, '2015-02-27 09:00:36', '2015-02-27 09:00:36', '0', '1', null);
INSERT INTO `t_oa_mail` VALUES ('4', '4', 0x34, '2015-02-27 09:00:49', '2015-02-27 09:00:49', '0', '1', null);
INSERT INTO `t_oa_mail` VALUES ('5', '5', 0x35, '2015-02-27 09:01:02', '2015-02-27 09:01:02', '0', '1', null);
INSERT INTO `t_oa_mail` VALUES ('6', '11', 0x3131, '2015-02-27 09:32:56', '2015-02-27 09:32:56', '0', '1', null);
INSERT INTO `t_oa_mail` VALUES ('7', '22', 0x3232, '2015-02-27 09:33:30', '2015-02-27 09:33:30', '0', '1', null);
INSERT INTO `t_oa_mail` VALUES ('8', '11', 0x3131, '2015-02-27 09:37:58', '2015-02-27 09:37:58', '0', '1', null);
INSERT INTO `t_oa_mail` VALUES ('9', '123', 0x313233, '2015-02-27 09:39:06', '2015-02-27 09:39:06', '0', '1', null);
INSERT INTO `t_oa_mail` VALUES ('10', '333', 0x3333, '2015-02-27 09:47:09', '2015-02-27 09:47:09', '0', '1', null);
INSERT INTO `t_oa_mail` VALUES ('11', '11', 0x3131, '2015-02-27 09:51:08', '2015-02-27 09:51:08', '0', '2', null);
INSERT INTO `t_oa_mail` VALUES ('12', '555', 0x353535, '2015-02-27 09:52:44', '2015-02-27 09:52:44', '0', '1', null);
INSERT INTO `t_oa_mail` VALUES ('13', 'aa', 0x6161, '2015-02-27 09:53:29', '2015-02-27 09:53:29', '0', '7', null);
INSERT INTO `t_oa_mail` VALUES ('14', '666', 0x3636, '2015-02-27 10:02:43', '2015-02-27 10:02:43', '0', '1', null);
INSERT INTO `t_oa_mail` VALUES ('15', '123', 0x313233, '2015-02-27 10:18:32', '2015-02-27 10:18:32', '0', '1', null);
INSERT INTO `t_oa_mail` VALUES ('16', '1213', 0x313233, '2015-02-27 10:18:55', '2015-02-27 10:18:55', '0', '1', null);
INSERT INTO `t_oa_mail` VALUES ('17', '123123', 0x313233, '2015-02-27 10:19:12', '2015-02-27 10:19:12', '0', '1', null);
INSERT INTO `t_oa_mail` VALUES ('18', '666', 0x363636, '2015-02-27 10:33:47', '2015-02-27 10:33:47', '0', '1', null);
INSERT INTO `t_oa_mail` VALUES ('19', '333', 0x333333, '2015-02-27 10:34:47', '2015-02-27 10:34:47', '0', '1', null);
INSERT INTO `t_oa_mail` VALUES ('20', '123', 0x313233, '2015-02-27 10:53:29', '2015-02-27 10:53:29', '0', '2', null);
INSERT INTO `t_oa_mail` VALUES ('21', '你好', 0xE59388E59388, '2015-02-27 11:03:33', '2015-02-27 11:03:33', '0', '2', null);
INSERT INTO `t_oa_mail` VALUES ('22', '附件测试', 0xE99984E4BBB6E6B58BE8AF95, '2015-02-27 11:05:26', '2015-02-27 11:05:26', '0', '7', null);
INSERT INTO `t_oa_mail` VALUES ('23', '23', 0x3C703E34333C2F703E0A, '2015-02-27 11:06:22', '2015-02-27 11:06:22', '0', '4', null);
INSERT INTO `t_oa_mail` VALUES ('24', '回复', 0x3C703EE8AEA2E8B4AD3C2F703E0A, '2015-02-27 11:06:31', '2015-02-27 11:06:31', '0', '4', null);
INSERT INTO `t_oa_mail` VALUES ('25', 'fdd', 0x3C703EE79A84E5A3ABE8B4B93C2F703E0A, '2015-02-27 11:06:59', '2015-02-27 11:06:59', '0', '4', null);
INSERT INTO `t_oa_mail` VALUES ('26', '问', 0xE68891, '2015-02-27 11:07:18', '2015-02-27 11:07:18', '0', '4', null);
INSERT INTO `t_oa_mail` VALUES ('27', '的', 0x3C703EE79A843C2F703E0A, '2015-02-27 11:08:26', '2015-02-27 11:08:26', '0', '7', null);

-- ----------------------------
-- Table structure for `t_oa_mail_box`
-- ----------------------------
DROP TABLE IF EXISTS `t_oa_mail_box`;
CREATE TABLE `t_oa_mail_box` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MAILID` int(11) DEFAULT NULL COMMENT '邮件关联属性',
  `USERID` int(11) DEFAULT NULL COMMENT '用户关联属性',
  `BOXTYPE` int(11) DEFAULT NULL COMMENT '0：草稿箱；\r\n            1：发件箱；（可以重新发送）\r\n            2：收件箱；（可以做回复的操作）\r\n            3：已删除；（无法恢复，但可以查看）\r\n            4：彻底删除；（用户在邮箱中看不到）',
  `READSTATE` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户邮箱管理：发件箱、收件箱等';

-- ----------------------------
-- Records of t_oa_mail_box
-- ----------------------------
INSERT INTO `t_oa_mail_box` VALUES ('1', '1', '1', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('2', '1', '2', '2', '1');
INSERT INTO `t_oa_mail_box` VALUES ('3', '2', '1', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('4', '2', '2', '2', '1');
INSERT INTO `t_oa_mail_box` VALUES ('5', '3', '1', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('6', '3', '2', '2', '1');
INSERT INTO `t_oa_mail_box` VALUES ('7', '4', '1', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('8', '4', '2', '2', '1');
INSERT INTO `t_oa_mail_box` VALUES ('9', '5', '1', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('10', '5', '2', '2', '1');
INSERT INTO `t_oa_mail_box` VALUES ('11', '6', '1', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('12', '6', '2', '2', '1');
INSERT INTO `t_oa_mail_box` VALUES ('13', '7', '1', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('14', '7', '2', '2', '1');
INSERT INTO `t_oa_mail_box` VALUES ('15', '8', '1', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('16', '8', '2', '2', '1');
INSERT INTO `t_oa_mail_box` VALUES ('17', '9', '1', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('18', '9', '2', '2', '1');
INSERT INTO `t_oa_mail_box` VALUES ('19', '10', '1', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('20', '10', '2', '2', '1');
INSERT INTO `t_oa_mail_box` VALUES ('21', '11', '2', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('22', '11', '7', '2', '1');
INSERT INTO `t_oa_mail_box` VALUES ('23', '12', '1', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('24', '12', '2', '2', '1');
INSERT INTO `t_oa_mail_box` VALUES ('25', '13', '7', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('26', '13', '2', '2', '1');
INSERT INTO `t_oa_mail_box` VALUES ('27', '14', '1', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('28', '14', '2', '2', '1');
INSERT INTO `t_oa_mail_box` VALUES ('29', '15', '1', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('30', '15', '2', '2', '1');
INSERT INTO `t_oa_mail_box` VALUES ('31', '16', '1', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('32', '16', '2', '2', '1');
INSERT INTO `t_oa_mail_box` VALUES ('33', '17', '1', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('34', '17', '2', '2', '1');
INSERT INTO `t_oa_mail_box` VALUES ('35', '18', '1', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('36', '18', '2', '2', '0');
INSERT INTO `t_oa_mail_box` VALUES ('37', '19', '1', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('38', '19', '2', '2', '1');
INSERT INTO `t_oa_mail_box` VALUES ('39', '20', '2', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('40', '20', '7', '2', '1');
INSERT INTO `t_oa_mail_box` VALUES ('41', '21', '2', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('42', '21', '1', '2', '0');
INSERT INTO `t_oa_mail_box` VALUES ('43', '22', '7', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('44', '22', '1', '2', '1');
INSERT INTO `t_oa_mail_box` VALUES ('45', '23', '4', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('46', '23', '7', '2', '1');
INSERT INTO `t_oa_mail_box` VALUES ('47', '24', '4', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('48', '24', '7', '2', '1');
INSERT INTO `t_oa_mail_box` VALUES ('49', '25', '4', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('50', '25', '1', '2', '0');
INSERT INTO `t_oa_mail_box` VALUES ('51', '26', '4', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('52', '26', '7', '2', '1');
INSERT INTO `t_oa_mail_box` VALUES ('53', '27', '7', '1', '0');
INSERT INTO `t_oa_mail_box` VALUES ('54', '27', '1', '2', '0');

-- ----------------------------
-- Table structure for `t_oa_mail_file`
-- ----------------------------
DROP TABLE IF EXISTS `t_oa_mail_file`;
CREATE TABLE `t_oa_mail_file` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MAILID` int(11) DEFAULT NULL,
  `FILEPATH` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `SUFFIX` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `SIZE` double DEFAULT NULL,
  `FILENAME` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='邮件附件';

-- ----------------------------
-- Records of t_oa_mail_file
-- ----------------------------
INSERT INTO `t_oa_mail_file` VALUES ('1', '22', 'http://192.168.2.211:9000/eos/application/octet-stream/20150227/dc723b859dec1526568ad581aec334d5.ini', 'ini', '1', 'desktop.ini');

-- ----------------------------
-- Table structure for `t_oa_mail_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_oa_mail_user`;
CREATE TABLE `t_oa_mail_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MAILID` int(11) DEFAULT NULL COMMENT '邮件关联属性',
  `USERID` int(11) DEFAULT NULL COMMENT '用户关联属性',
  `TYPE` int(11) DEFAULT NULL COMMENT '1：接收人（发送给）；2：被抄送人（抄送给）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='邮件接收人： 记录一封邮件发送给谁，抄送给谁';

-- ----------------------------
-- Records of t_oa_mail_user
-- ----------------------------
INSERT INTO `t_oa_mail_user` VALUES ('1', '1', '2', '1');
INSERT INTO `t_oa_mail_user` VALUES ('2', '2', '2', '1');
INSERT INTO `t_oa_mail_user` VALUES ('3', '3', '2', '1');
INSERT INTO `t_oa_mail_user` VALUES ('4', '4', '2', '1');
INSERT INTO `t_oa_mail_user` VALUES ('5', '5', '2', '1');
INSERT INTO `t_oa_mail_user` VALUES ('6', '6', '2', '1');
INSERT INTO `t_oa_mail_user` VALUES ('7', '7', '2', '1');
INSERT INTO `t_oa_mail_user` VALUES ('8', '8', '2', '1');
INSERT INTO `t_oa_mail_user` VALUES ('9', '9', '2', '1');
INSERT INTO `t_oa_mail_user` VALUES ('10', '10', '2', '1');
INSERT INTO `t_oa_mail_user` VALUES ('11', '11', '7', '1');
INSERT INTO `t_oa_mail_user` VALUES ('12', '12', '2', '1');
INSERT INTO `t_oa_mail_user` VALUES ('13', '13', '2', '1');
INSERT INTO `t_oa_mail_user` VALUES ('14', '14', '2', '1');
INSERT INTO `t_oa_mail_user` VALUES ('15', '15', '2', '1');
INSERT INTO `t_oa_mail_user` VALUES ('16', '16', '2', '1');
INSERT INTO `t_oa_mail_user` VALUES ('17', '17', '2', '1');
INSERT INTO `t_oa_mail_user` VALUES ('18', '18', '2', '1');
INSERT INTO `t_oa_mail_user` VALUES ('19', '19', '2', '1');
INSERT INTO `t_oa_mail_user` VALUES ('20', '20', '7', '1');
INSERT INTO `t_oa_mail_user` VALUES ('21', '21', '1', '1');
INSERT INTO `t_oa_mail_user` VALUES ('22', '22', '1', '1');
INSERT INTO `t_oa_mail_user` VALUES ('23', '23', '7', '1');
INSERT INTO `t_oa_mail_user` VALUES ('24', '24', '7', '1');
INSERT INTO `t_oa_mail_user` VALUES ('25', '25', '1', '1');
INSERT INTO `t_oa_mail_user` VALUES ('26', '26', '7', '1');
INSERT INTO `t_oa_mail_user` VALUES ('27', '27', '1', '1');

-- ----------------------------
-- Table structure for `t_oa_message`
-- ----------------------------
DROP TABLE IF EXISTS `t_oa_message`;
CREATE TABLE `t_oa_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADDRESSER` int(11) DEFAULT NULL,
  `ADDRESSERSTATUS` int(11) DEFAULT NULL COMMENT '发送人状态 1 未删除 0 删除',
  `ADDRESSERORGID` int(11) DEFAULT NULL,
  `RECIPIENT` int(11) DEFAULT NULL,
  `RECIPIENTSTATUS` int(11) DEFAULT NULL COMMENT '接收人状态 1 未删除 0 删除',
  `RECIPIENTORGID` int(11) DEFAULT NULL,
  `DATE` datetime DEFAULT NULL,
  `CONTENT` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `READFLAG` int(11) DEFAULT NULL COMMENT '0：未读；1：已读',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=560 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_oa_message
-- ----------------------------
INSERT INTO `t_oa_message` VALUES ('1', '1', null, null, '2', null, null, '2014-12-27 16:18:02', '111', '1');
INSERT INTO `t_oa_message` VALUES ('2', '1', null, null, '2', null, null, '2014-12-27 16:18:22', '2222', '1');
INSERT INTO `t_oa_message` VALUES ('3', '1', null, null, '2', null, null, '2014-12-27 16:32:25', '3333', '1');
INSERT INTO `t_oa_message` VALUES ('4', '1', null, null, '2', null, null, '2014-12-27 16:32:33', '44444', '1');
INSERT INTO `t_oa_message` VALUES ('5', '2', null, null, '1', null, null, '2014-12-27 16:33:31', '4444', '1');
INSERT INTO `t_oa_message` VALUES ('6', '2', null, null, '1', null, null, '2014-12-27 16:34:05', '555', '1');
INSERT INTO `t_oa_message` VALUES ('7', '1', null, null, '2', null, null, '2014-12-27 16:34:11', '66666', '1');
INSERT INTO `t_oa_message` VALUES ('8', '2', null, null, '1', null, null, '2014-12-27 16:36:46', '5555555555555', '1');
INSERT INTO `t_oa_message` VALUES ('9', '1', null, null, '2', null, null, '2014-12-27 16:51:52', '.....', '1');
INSERT INTO `t_oa_message` VALUES ('10', '2', null, null, '1', null, null, '2014-12-27 16:57:21', 'dd', '1');
INSERT INTO `t_oa_message` VALUES ('11', '1', null, null, '4', null, null, '2014-12-29 09:11:17', 'ddddd', '1');
INSERT INTO `t_oa_message` VALUES ('12', '1', null, null, '1010', null, null, '2014-12-29 09:11:29', '测试聊天', '0');
INSERT INTO `t_oa_message` VALUES ('13', '1', null, null, '2', null, null, '2014-12-29 13:47:39', 'eeeee', '1');
INSERT INTO `t_oa_message` VALUES ('14', '1', null, null, '2', null, null, '2014-12-29 13:47:57', 'aaaaaa', '1');
INSERT INTO `t_oa_message` VALUES ('15', '1', null, null, '1005', null, null, '2014-12-29 13:49:21', 'sdgfsd', '0');
INSERT INTO `t_oa_message` VALUES ('16', '1', null, null, '2', null, null, '2014-12-29 13:59:13', 'yyy', '1');
INSERT INTO `t_oa_message` VALUES ('17', '2', null, null, '1', null, null, '2014-12-29 14:00:28', '小伙子', '1');
INSERT INTO `t_oa_message` VALUES ('18', '2', null, null, '1', null, null, '2014-12-29 14:01:11', '能收到消息吧', '1');
INSERT INTO `t_oa_message` VALUES ('19', '2', null, null, '1', null, null, '2014-12-29 14:02:07', '你真SB', '1');
INSERT INTO `t_oa_message` VALUES ('20', '1', null, null, '2', null, null, '2014-12-29 14:00:59', '收到', '1');
INSERT INTO `t_oa_message` VALUES ('21', '1', null, null, '2', null, null, '2014-12-29 14:01:04', '逗比', '1');
INSERT INTO `t_oa_message` VALUES ('22', '2', null, null, '1', null, null, '2014-12-29 14:02:25', '这么快？', '1');
INSERT INTO `t_oa_message` VALUES ('23', '1', null, null, '2', null, null, '2014-12-29 14:01:45', '外网估计就没这么快了', '1');
INSERT INTO `t_oa_message` VALUES ('24', '2', null, null, '1', null, null, '2014-12-29 14:03:05', '一样的', '1');
INSERT INTO `t_oa_message` VALUES ('25', '2', null, null, '1', null, null, '2014-12-29 14:03:16', '这个跟内外肉没有多少关系', '1');
INSERT INTO `t_oa_message` VALUES ('26', '1', null, null, '2', null, null, '2014-12-29 14:02:24', '索德斯', '1');
INSERT INTO `t_oa_message` VALUES ('27', '2', null, null, '1', null, null, '2014-12-29 14:03:36', '收消息我都是延时2秒才收的', '1');
INSERT INTO `t_oa_message` VALUES ('28', '1', null, null, '2', null, null, '2014-12-29 14:02:40', '两秒啦', '1');
INSERT INTO `t_oa_message` VALUES ('29', '2', null, null, '1', null, null, '2014-12-29 14:04:12', '看下特殊字符是什么效果', '1');
INSERT INTO `t_oa_message` VALUES ('30', '2', null, null, '1', null, null, '2014-12-29 14:04:17', '！·', '1');
INSERT INTO `t_oa_message` VALUES ('31', '1', null, null, '2', null, null, '2014-12-29 14:03:14', '！', '1');
INSERT INTO `t_oa_message` VALUES ('32', '2', null, null, '1', null, null, '2014-12-29 14:04:35', '!@', '1');
INSERT INTO `t_oa_message` VALUES ('33', '2', null, null, '1', null, null, '2014-12-29 14:04:43', '正常不', '1');
INSERT INTO `t_oa_message` VALUES ('34', '1', null, null, '2', null, null, '2014-12-29 14:03:39', '正常', '1');
INSERT INTO `t_oa_message` VALUES ('35', '1', null, null, '2', null, null, '2014-12-29 14:03:52', '！@', '1');
INSERT INTO `t_oa_message` VALUES ('36', '2', null, null, '1', null, null, '2014-12-29 14:05:12', '正常个毛线少了一长截', '1');
INSERT INTO `t_oa_message` VALUES ('37', '1', null, null, '2', null, null, '2014-12-29 14:04:00', '<>', '1');
INSERT INTO `t_oa_message` VALUES ('38', '1', null, null, '2', null, null, '2014-12-29 14:04:24', '!@', '1');
INSERT INTO `t_oa_message` VALUES ('39', '2', null, null, '1', null, null, '2014-12-29 14:07:14', '!@', '1');
INSERT INTO `t_oa_message` VALUES ('40', '1', null, null, '2', null, null, '2014-12-29 14:06:10', '!@', '1');
INSERT INTO `t_oa_message` VALUES ('41', '1', null, null, '2', null, null, '2014-12-29 14:06:21', '还是少了？', '1');
INSERT INTO `t_oa_message` VALUES ('42', '1', null, null, '2', null, null, '2014-12-29 14:06:45', '邱大妈跌', '1');
INSERT INTO `t_oa_message` VALUES ('43', '2', null, null, '1', null, null, '2014-12-29 14:08:36', '特殊字符要处理还有显示也要处理这里可能得用副文本编辑才行', '1');
INSERT INTO `t_oa_message` VALUES ('44', '2', null, null, '1', null, null, '2014-12-29 14:15:28', '!@', '1');
INSERT INTO `t_oa_message` VALUES ('45', '2', null, null, '1', null, null, '2014-12-29 14:21:54', 'ww', '1');
INSERT INTO `t_oa_message` VALUES ('46', '2', null, null, '1', null, null, '2014-12-29 14:21:55', 'eee', '1');
INSERT INTO `t_oa_message` VALUES ('47', '2', null, null, '1', null, null, '2014-12-29 14:21:56', 'eeee', '1');
INSERT INTO `t_oa_message` VALUES ('48', '2', null, null, '1', null, null, '2014-12-29 14:21:58', 'eeerw', '1');
INSERT INTO `t_oa_message` VALUES ('49', '2', null, null, '1', null, null, '2014-12-29 14:22:00', 'wqwrqwr', '1');
INSERT INTO `t_oa_message` VALUES ('50', '2', null, null, '1', null, null, '2014-12-29 14:22:03', 'qweqweqweqw', '1');
INSERT INTO `t_oa_message` VALUES ('51', '1', null, null, '2', null, null, '2014-12-29 14:26:54', '1', '1');
INSERT INTO `t_oa_message` VALUES ('52', '1', null, null, '2', null, null, '2014-12-29 14:26:55', '2', '1');
INSERT INTO `t_oa_message` VALUES ('53', '1', null, null, '2', null, null, '2014-12-29 14:26:56', '3', '1');
INSERT INTO `t_oa_message` VALUES ('54', '1', null, null, '2', null, null, '2014-12-29 14:26:58', '4', '1');
INSERT INTO `t_oa_message` VALUES ('55', '1', null, null, '2', null, null, '2014-12-29 14:26:59', '5', '1');
INSERT INTO `t_oa_message` VALUES ('56', '1', null, null, '2', null, null, '2014-12-29 14:27:01', '6', '1');
INSERT INTO `t_oa_message` VALUES ('57', '1', null, null, '2', null, null, '2014-12-29 14:27:02', '7', '1');
INSERT INTO `t_oa_message` VALUES ('58', '1', null, null, '2', null, null, '2014-12-29 14:27:03', '8', '1');
INSERT INTO `t_oa_message` VALUES ('59', '2', null, null, '1', null, null, '2014-12-29 14:28:32', '1', '1');
INSERT INTO `t_oa_message` VALUES ('60', '2', null, null, '1', null, null, '2014-12-29 14:28:33', '', '1');
INSERT INTO `t_oa_message` VALUES ('61', '2', null, null, '1', null, null, '2014-12-29 14:28:37', '3', '1');
INSERT INTO `t_oa_message` VALUES ('62', '2', null, null, '1', null, null, '2014-12-29 14:28:38', '4', '1');
INSERT INTO `t_oa_message` VALUES ('63', '2', null, null, '1', null, null, '2014-12-29 14:28:39', '5', '1');
INSERT INTO `t_oa_message` VALUES ('64', '2', null, null, '1', null, null, '2014-12-29 14:28:41', '6', '1');
INSERT INTO `t_oa_message` VALUES ('65', '2', null, null, '1', null, null, '2014-12-29 14:28:43', '7', '1');
INSERT INTO `t_oa_message` VALUES ('66', '1', null, null, '2', null, null, '2014-12-29 14:40:52', '我', '1');
INSERT INTO `t_oa_message` VALUES ('67', '1', null, null, '2', null, null, '2014-12-29 14:40:55', '人', '1');
INSERT INTO `t_oa_message` VALUES ('68', '1', null, null, '2', null, null, '2014-12-29 14:40:57', '有', '1');
INSERT INTO `t_oa_message` VALUES ('69', '1', null, null, '2', null, null, '2014-12-29 14:41:00', '和', '1');
INSERT INTO `t_oa_message` VALUES ('70', '1', null, null, '2', null, null, '2014-12-29 14:41:02', '主', '1');
INSERT INTO `t_oa_message` VALUES ('71', '1', null, null, '2', null, null, '2014-12-29 14:41:04', '产', '1');
INSERT INTO `t_oa_message` VALUES ('72', '1', null, null, '2', null, null, '2014-12-29 14:41:07', '不', '1');
INSERT INTO `t_oa_message` VALUES ('73', '1', null, null, '2', null, null, '2014-12-29 14:41:10', '为', '1');
INSERT INTO `t_oa_message` VALUES ('74', '1', null, null, '2', null, null, '2014-12-29 14:41:12', '这', '1');
INSERT INTO `t_oa_message` VALUES ('75', '2', null, null, '1', null, null, '2014-12-29 14:44:06', '我', '1');
INSERT INTO `t_oa_message` VALUES ('76', '2', null, null, '1', null, null, '2014-12-29 14:44:09', '人', '1');
INSERT INTO `t_oa_message` VALUES ('77', '2', null, null, '1', null, null, '2014-12-29 14:44:11', '有', '1');
INSERT INTO `t_oa_message` VALUES ('78', '2', null, null, '1', null, null, '2014-12-29 14:44:13', '的', '1');
INSERT INTO `t_oa_message` VALUES ('79', '2', null, null, '1', null, null, '2014-12-29 14:44:15', '和', '1');
INSERT INTO `t_oa_message` VALUES ('80', '2', null, null, '1', null, null, '2014-12-29 14:44:17', '主', '1');
INSERT INTO `t_oa_message` VALUES ('81', '2', null, null, '1', null, null, '2014-12-29 14:44:19', '产', '1');
INSERT INTO `t_oa_message` VALUES ('82', '2', null, null, '1', null, null, '2014-12-29 14:44:21', '不', '1');
INSERT INTO `t_oa_message` VALUES ('83', '2', null, null, '1', null, null, '2014-12-29 14:44:23', '为', '1');
INSERT INTO `t_oa_message` VALUES ('84', '2', null, null, '1', null, null, '2014-12-29 14:44:26', '这', '1');
INSERT INTO `t_oa_message` VALUES ('85', '1', null, null, '2', null, null, '2014-12-29 14:51:22', '我', '1');
INSERT INTO `t_oa_message` VALUES ('86', '1', null, null, '2', null, null, '2014-12-29 14:51:24', '人', '1');
INSERT INTO `t_oa_message` VALUES ('87', '1', null, null, '2', null, null, '2014-12-29 14:51:26', '有', '1');
INSERT INTO `t_oa_message` VALUES ('88', '1', null, null, '2', null, null, '2014-12-29 14:51:29', '的', '1');
INSERT INTO `t_oa_message` VALUES ('89', '1', null, null, '2', null, null, '2014-12-29 14:51:31', '和', '1');
INSERT INTO `t_oa_message` VALUES ('90', '1', null, null, '2', null, null, '2014-12-29 14:51:33', '主', '1');
INSERT INTO `t_oa_message` VALUES ('91', '1', null, null, '2', null, null, '2014-12-29 14:51:34', '产', '1');
INSERT INTO `t_oa_message` VALUES ('92', '1', null, null, '2', null, null, '2014-12-29 14:51:36', '不', '1');
INSERT INTO `t_oa_message` VALUES ('93', '2', null, null, '1', null, null, '2014-12-29 14:53:11', 'q', '1');
INSERT INTO `t_oa_message` VALUES ('94', '2', null, null, '1', null, null, '2014-12-29 14:53:13', 'w', '1');
INSERT INTO `t_oa_message` VALUES ('95', '2', null, null, '1', null, null, '2014-12-29 14:53:14', 'e', '1');
INSERT INTO `t_oa_message` VALUES ('96', '2', null, null, '1', null, null, '2014-12-29 14:53:16', 'r', '1');
INSERT INTO `t_oa_message` VALUES ('97', '2', null, null, '1', null, null, '2014-12-29 14:53:17', 't', '1');
INSERT INTO `t_oa_message` VALUES ('98', '2', null, null, '1', null, null, '2014-12-29 14:53:20', 'y', '1');
INSERT INTO `t_oa_message` VALUES ('99', '2', null, null, '1', null, null, '2014-12-29 14:53:21', 'u', '1');
INSERT INTO `t_oa_message` VALUES ('100', '2', null, null, '1', null, null, '2014-12-29 15:02:49', '1', '1');
INSERT INTO `t_oa_message` VALUES ('101', '2', null, null, '1', null, null, '2014-12-29 15:02:50', '2', '1');
INSERT INTO `t_oa_message` VALUES ('102', '2', null, null, '1', null, null, '2014-12-29 15:02:51', '3', '1');
INSERT INTO `t_oa_message` VALUES ('103', '2', null, null, '1', null, null, '2014-12-29 15:02:52', '4', '1');
INSERT INTO `t_oa_message` VALUES ('104', '2', null, null, '1', null, null, '2014-12-29 15:02:54', '5', '1');
INSERT INTO `t_oa_message` VALUES ('105', '2', null, null, '1', null, null, '2014-12-29 15:02:55', '6', '1');
INSERT INTO `t_oa_message` VALUES ('106', '2', null, null, '1', null, null, '2014-12-29 15:02:57', '7', '1');
INSERT INTO `t_oa_message` VALUES ('107', '2', null, null, '1', null, null, '2014-12-29 15:07:22', '1', '1');
INSERT INTO `t_oa_message` VALUES ('108', '2', null, null, '1', null, null, '2014-12-29 15:07:23', '2', '1');
INSERT INTO `t_oa_message` VALUES ('109', '2', null, null, '1', null, null, '2014-12-29 15:07:25', '3', '1');
INSERT INTO `t_oa_message` VALUES ('110', '2', null, null, '1', null, null, '2014-12-29 15:07:26', '4', '1');
INSERT INTO `t_oa_message` VALUES ('111', '2', null, null, '1', null, null, '2014-12-29 15:07:27', '5', '1');
INSERT INTO `t_oa_message` VALUES ('112', '2', null, null, '1', null, null, '2014-12-29 15:07:28', '6', '1');
INSERT INTO `t_oa_message` VALUES ('113', '1', null, null, '2', null, null, '2014-12-29 15:09:20', '1', '1');
INSERT INTO `t_oa_message` VALUES ('114', '1', null, null, '2', null, null, '2014-12-29 15:09:21', '2', '1');
INSERT INTO `t_oa_message` VALUES ('115', '1', null, null, '2', null, null, '2014-12-29 15:09:22', '3', '1');
INSERT INTO `t_oa_message` VALUES ('116', '1', null, null, '2', null, null, '2014-12-29 15:09:23', '4', '1');
INSERT INTO `t_oa_message` VALUES ('117', '1', null, null, '2', null, null, '2014-12-29 15:09:25', '5', '1');
INSERT INTO `t_oa_message` VALUES ('118', '1', null, null, '2', null, null, '2014-12-29 15:09:26', '6', '1');
INSERT INTO `t_oa_message` VALUES ('119', '1', null, null, '2', null, null, '2014-12-29 15:10:20', 'admin发的  1', '1');
INSERT INTO `t_oa_message` VALUES ('120', '1', null, null, '2', null, null, '2014-12-29 15:10:23', 'admin发的 2', '1');
INSERT INTO `t_oa_message` VALUES ('121', '1', null, null, '2', null, null, '2014-12-29 15:10:27', 'admin发的  3', '1');
INSERT INTO `t_oa_message` VALUES ('122', '1', null, null, '2', null, null, '2014-12-29 15:10:31', 'admin发的 4', '1');
INSERT INTO `t_oa_message` VALUES ('123', '1', null, null, '2', null, null, '2014-12-29 15:10:35', 'admin发的  5', '1');
INSERT INTO `t_oa_message` VALUES ('124', '1', null, null, '2', null, null, '2014-12-29 15:10:40', 'admin发的 6', '1');
INSERT INTO `t_oa_message` VALUES ('125', '2', null, null, '1', null, null, '2014-12-29 15:23:01', 'tang 发的1', '1');
INSERT INTO `t_oa_message` VALUES ('126', '1', null, null, '2', null, null, '2014-12-29 15:23:17', 'admin发的  7', '1');
INSERT INTO `t_oa_message` VALUES ('127', '2', null, null, '1', null, null, '2014-12-29 15:23:29', 'tang 发的2', '1');
INSERT INTO `t_oa_message` VALUES ('128', '2', null, null, '1', null, null, '2014-12-29 15:23:33', 'tang 发的 3', '1');
INSERT INTO `t_oa_message` VALUES ('129', '2', null, null, '1', null, null, '2014-12-29 15:23:49', 'tang 发的 4', '1');
INSERT INTO `t_oa_message` VALUES ('130', '2', null, null, '1', null, null, '2014-12-29 15:24:24', 'tang 发的5', '1');
INSERT INTO `t_oa_message` VALUES ('131', '2', null, null, '1', null, null, '2014-12-29 15:24:46', 'tang 发的6', '1');
INSERT INTO `t_oa_message` VALUES ('132', '2', null, null, '1', null, null, '2014-12-29 15:25:20', 'tang 发的7', '1');
INSERT INTO `t_oa_message` VALUES ('133', '2', null, null, '1', null, null, '2014-12-29 15:25:52', 'tang 发的 8', '1');
INSERT INTO `t_oa_message` VALUES ('134', '2', null, null, '1', null, null, '2014-12-29 15:27:16', 'tang 发的 9', '1');
INSERT INTO `t_oa_message` VALUES ('135', '2', null, null, '1', null, null, '2014-12-29 15:27:48', 'tang 发1', '1');
INSERT INTO `t_oa_message` VALUES ('136', '1', null, null, '2', null, null, '2014-12-29 15:27:57', 'sssss', '1');
INSERT INTO `t_oa_message` VALUES ('137', '2', null, null, '1', null, null, '2014-12-29 15:28:07', 'tang 发2', '1');
INSERT INTO `t_oa_message` VALUES ('138', '2', null, null, '1', null, null, '2014-12-29 16:22:05', 'tang 发3', '1');
INSERT INTO `t_oa_message` VALUES ('139', '2', null, null, '1', null, null, '2014-12-29 16:22:42', 'tang 发4', '1');
INSERT INTO `t_oa_message` VALUES ('140', '2', null, null, '1', null, null, '2014-12-29 16:23:08', 'tang 发5', '1');
INSERT INTO `t_oa_message` VALUES ('141', '2', null, null, '1', null, null, '2014-12-29 16:23:43', 'tang 发6', '1');
INSERT INTO `t_oa_message` VALUES ('142', '1', null, null, '2', null, null, '2014-12-29 16:24:02', 'admin 发的7', '1');
INSERT INTO `t_oa_message` VALUES ('143', '2', null, null, '1', null, null, '2014-12-29 16:24:56', 'tang 发的8', '1');
INSERT INTO `t_oa_message` VALUES ('144', '1', null, null, '2', null, null, '2014-12-29 16:25:59', 'admin 发的9', '1');
INSERT INTO `t_oa_message` VALUES ('145', '2', null, null, '1', null, null, '2014-12-30 11:12:06', '您好', '1');
INSERT INTO `t_oa_message` VALUES ('146', '1', null, null, '2', null, null, '2014-12-30 11:12:27', '123', '1');
INSERT INTO `t_oa_message` VALUES ('147', '1', null, null, '2', null, null, '2014-12-30 11:13:02', '321', '1');
INSERT INTO `t_oa_message` VALUES ('148', '2', null, null, '1', null, null, '2014-12-30 11:13:08', '知道了', '1');
INSERT INTO `t_oa_message` VALUES ('149', '1', null, null, '2', null, null, '2014-12-30 11:14:48', '您好', '1');
INSERT INTO `t_oa_message` VALUES ('150', '2', null, null, '1', null, null, '2014-12-30 11:15:15', '广东省发送到', '1');
INSERT INTO `t_oa_message` VALUES ('151', '1', null, null, '2', null, null, '2014-12-31 15:56:51', '12434', '1');
INSERT INTO `t_oa_message` VALUES ('152', '2', null, null, '1', null, null, '2014-12-31 15:57:28', '11111', '1');
INSERT INTO `t_oa_message` VALUES ('153', '1', null, null, '2', null, null, '2014-12-31 15:57:34', '222222', '1');
INSERT INTO `t_oa_message` VALUES ('154', '2', null, null, '1006', null, null, '2015-01-07 09:42:13', 'asdasd', '0');
INSERT INTO `t_oa_message` VALUES ('155', '2', null, null, '1', null, null, '2015-01-20 15:24:02', '尊敬的超级管理员用户：您的公文：08978765432，已被驳回，请登录系统查看。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('156', '2', null, null, '1', null, null, '2015-01-20 15:24:48', '8756543', '1');
INSERT INTO `t_oa_message` VALUES ('157', '1', null, null, '1005', null, null, '2015-01-20 15:48:20', 'dfdf', '0');
INSERT INTO `t_oa_message` VALUES ('158', '1', null, null, '1005', null, null, '2015-01-20 15:48:24', '付水电费', '0');
INSERT INTO `t_oa_message` VALUES ('159', '1007', null, null, '1005', null, null, '2015-01-20 15:49:35', '', '0');
INSERT INTO `t_oa_message` VALUES ('160', '1007', null, null, '1005', null, null, '2015-01-20 15:49:36', '', '0');
INSERT INTO `t_oa_message` VALUES ('161', '1007', null, null, '1005', null, null, '2015-01-20 15:49:40', '', '0');
INSERT INTO `t_oa_message` VALUES ('162', '1007', null, null, '1005', null, null, '2015-01-20 15:49:40', '', '0');
INSERT INTO `t_oa_message` VALUES ('163', '1007', null, null, '1005', null, null, '2015-01-20 15:49:40', '', '0');
INSERT INTO `t_oa_message` VALUES ('164', '1007', null, null, '1005', null, null, '2015-01-20 15:49:41', '', '0');
INSERT INTO `t_oa_message` VALUES ('165', '1', null, null, '1', null, null, '2015-01-21 10:08:43', '尊敬的超级管理员用户：有公文：08978765432，签发至您，需要您签收。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('166', '1', null, null, '2', null, null, '2015-01-21 10:08:43', '尊敬的阿汤用户：有公文：08978765432，签发至您，需要您签收。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('167', '1', null, null, '1', null, null, '2015-01-21 10:09:00', '尊敬的超级管理员用户：有公文：08978765432，签发至您，需要您签收。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('168', '1', null, null, '2', null, null, '2015-01-21 10:09:00', '尊敬的阿汤用户：有公文：08978765432，签发至您，需要您签收。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('169', '1', null, null, '1', null, null, '2015-01-21 10:12:45', '尊敬的超级管理员用户：有公文：08978765432，签发至您，需要您签收。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('170', '1', null, null, '2', null, null, '2015-01-21 10:12:45', '尊敬的阿汤用户：有公文：08978765432，签发至您，需要您签收。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('171', '1007', null, null, '1011', null, null, '2015-01-22 09:20:09', '尊敬的唐小林用户：有新的公文：Good morning，提交给您等待审批。【临澧县教育系统OA平台】', '0');
INSERT INTO `t_oa_message` VALUES ('172', '1011', null, null, '1007', null, null, '2015-01-22 09:21:18', '尊敬的刘美用户：您的公文：Good morning，已被驳回，请登录系统查看。【临澧县教育系统OA平台】', '0');
INSERT INTO `t_oa_message` VALUES ('173', '1007', null, null, '1011', null, null, '2015-01-22 09:22:03', '尊敬的唐小林用户：公文：Good morning，已经过修改，并重新提交，等待您审批。【临澧县教育系统OA平台】', '0');
INSERT INTO `t_oa_message` VALUES ('174', '1011', null, null, '1007', null, null, '2015-01-22 09:22:44', '尊敬的刘美用户：您的公文：Good morning，已被驳回，请登录系统查看。【临澧县教育系统OA平台】', '0');
INSERT INTO `t_oa_message` VALUES ('175', '1', null, null, '2', null, null, '2015-01-23 10:13:46', '', '1');
INSERT INTO `t_oa_message` VALUES ('176', '1', null, null, '1012', null, null, '2015-01-23 10:14:20', '', '0');
INSERT INTO `t_oa_message` VALUES ('177', '2', null, null, '1', null, null, '2015-01-26 10:57:40', '尊敬的超级管理员用户：有新的公文：未命名123123123123123，提交给您等待审批。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('178', '5', null, null, '4', null, null, '2015-01-28 09:54:50', '尊敬的唐小林用户：有新的公文：测试，提交给您等待审批。【临澧县教育系统OA平台】', '0');
INSERT INTO `t_oa_message` VALUES ('179', '1', null, null, null, null, null, '2015-01-28 16:21:01', 'sgsdf', '0');
INSERT INTO `t_oa_message` VALUES ('180', '1', null, null, '2', null, null, '2015-01-28 16:56:56', '速度快了罚款了水电费', '1');
INSERT INTO `t_oa_message` VALUES ('181', '1', null, null, '2', null, null, '2015-01-29 09:08:21', '', '1');
INSERT INTO `t_oa_message` VALUES ('182', '1', null, null, '2', null, null, '2015-01-29 10:14:53', '的减肥规划局', '1');
INSERT INTO `t_oa_message` VALUES ('183', '1', null, null, '4', null, null, '2015-01-29 10:25:46', '123', '1');
INSERT INTO `t_oa_message` VALUES ('184', '1', null, null, '4', null, null, '2015-01-29 10:32:44', '00', '1');
INSERT INTO `t_oa_message` VALUES ('185', '1', null, null, '4', null, null, '2015-01-29 10:33:37', '567567', '1');
INSERT INTO `t_oa_message` VALUES ('186', '1', null, null, '4', null, null, '2015-01-29 10:35:57', '00', '1');
INSERT INTO `t_oa_message` VALUES ('187', '1', null, null, '4', null, null, '2015-01-29 10:36:46', '676678678', '1');
INSERT INTO `t_oa_message` VALUES ('188', '1', null, null, '4', null, null, '2015-01-29 10:41:09', '90876543', '1');
INSERT INTO `t_oa_message` VALUES ('189', '1', null, null, '4', null, null, '2015-01-29 11:40:07', '456', '1');
INSERT INTO `t_oa_message` VALUES ('190', '1', null, null, '2', null, null, '2015-01-29 11:42:21', '', '1');
INSERT INTO `t_oa_message` VALUES ('191', '1', null, null, '2', null, null, '2015-01-29 11:42:26', '', '1');
INSERT INTO `t_oa_message` VALUES ('192', '1', null, null, '6', null, null, '2015-01-29 11:59:56', 'sad', '1');
INSERT INTO `t_oa_message` VALUES ('193', '2', null, null, '4', null, null, '2015-01-29 14:11:21', '9876543', '1');
INSERT INTO `t_oa_message` VALUES ('194', '2', null, null, '1', null, null, '2015-01-29 14:12:08', '1212', '1');
INSERT INTO `t_oa_message` VALUES ('195', '2', null, null, '6', null, null, '2015-01-29 14:12:21', '123123', '1');
INSERT INTO `t_oa_message` VALUES ('196', '2', null, null, '6', null, null, '2015-01-30 14:50:54', '尊敬的蒋杰用户：您发起的公文：测试1-30，已经通过审批。可以进行下一步操作啦！【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('197', '6', null, null, '6', null, null, '2015-01-30 15:23:48', '尊敬的蒋杰用户：有公文：测试123h，签发至您，需要您签收。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('198', '6', null, null, '7', null, null, '2015-01-30 15:23:48', '尊敬的刘美用户：有公文：测试123h，签发至您，需要您签收。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('199', '1', null, null, '7', null, null, '2015-02-02 11:14:14', '消息推送测试', '1');
INSERT INTO `t_oa_message` VALUES ('200', '1', null, null, '2', null, null, '2015-02-02 13:40:41', 'dd', '1');
INSERT INTO `t_oa_message` VALUES ('201', '1', null, null, '2', null, null, '2015-02-02 13:41:55', 'ddd', '1');
INSERT INTO `t_oa_message` VALUES ('202', '1', null, null, '2', null, null, '2015-02-02 13:43:25', 'sssss', '1');
INSERT INTO `t_oa_message` VALUES ('203', '1', null, null, '2', null, null, '2015-02-02 13:46:21', 'ddddd', '1');
INSERT INTO `t_oa_message` VALUES ('204', '1', null, null, '2', null, null, '2015-02-02 13:49:45', '啊啊啊', '1');
INSERT INTO `t_oa_message` VALUES ('205', '1', null, null, '2', null, null, '2015-02-02 13:50:03', '爱爱', '1');
INSERT INTO `t_oa_message` VALUES ('206', '1', null, null, '2', null, null, '2015-02-02 13:51:52', '搞好', '1');
INSERT INTO `t_oa_message` VALUES ('207', '1', null, null, '2', null, null, '2015-02-02 13:55:38', '那你', '1');
INSERT INTO `t_oa_message` VALUES ('208', '1', null, null, '2', null, null, '2015-02-02 13:57:16', '奶奶', '1');
INSERT INTO `t_oa_message` VALUES ('209', '1', null, null, '2', null, null, '2015-02-02 13:59:31', '那你呢', '1');
INSERT INTO `t_oa_message` VALUES ('210', '1', null, null, '2', null, null, '2015-02-02 14:00:49', '密码', '1');
INSERT INTO `t_oa_message` VALUES ('211', '1', null, null, '2', null, null, '2015-02-02 15:23:39', 'dddddd', '1');
INSERT INTO `t_oa_message` VALUES ('212', '1', null, null, '2', null, null, '2015-02-02 15:31:29', 'sadfsadfasfd', '1');
INSERT INTO `t_oa_message` VALUES ('213', '2', null, null, '1', null, null, '2015-02-02 16:50:29', '', '1');
INSERT INTO `t_oa_message` VALUES ('214', '2', null, null, '1', null, null, '2015-02-02 16:50:38', '撒旦法撒旦法', '1');
INSERT INTO `t_oa_message` VALUES ('215', '1', null, null, '2', null, null, '2015-02-02 16:51:18', '', '1');
INSERT INTO `t_oa_message` VALUES ('216', '2', null, null, '1', null, null, '2015-02-02 16:51:36', '阿迪发顺丰', '1');
INSERT INTO `t_oa_message` VALUES ('217', '2', null, null, '1', null, null, '2015-02-02 16:52:19', '', '1');
INSERT INTO `t_oa_message` VALUES ('218', '2', null, null, '6', null, null, '2015-02-02 16:52:26', '', '1');
INSERT INTO `t_oa_message` VALUES ('219', '2', null, null, '1', null, null, '2015-02-02 16:52:46', '123123', '1');
INSERT INTO `t_oa_message` VALUES ('220', '1', null, null, '2', null, null, '2015-02-02 16:56:19', '123456', '1');
INSERT INTO `t_oa_message` VALUES ('221', '1', null, null, '2', null, null, '2015-02-02 16:58:14', 'adfasdfs', '1');
INSERT INTO `t_oa_message` VALUES ('222', '4', null, null, '7', null, null, '2015-02-03 09:19:34', '尊敬的刘美用户：您的公文：测试公文，已被驳回，请登录系统查看。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('223', '4', null, null, '2', null, null, '2015-02-03 09:42:26', '尊敬的汤姆用户：有新的公文：测试公文，提交给您等待审批。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('224', '2', null, null, '7', null, null, '2015-02-03 09:44:48', '尊敬的刘美用户：您发起的公文：测试公文，已经通过审批。可以进行下一步操作啦！【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('225', '7', null, null, '4', null, null, '2015-02-03 09:45:46', '尊敬的唐小林用户：有公文：测试公文，签发至您，需要您签收。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('226', '4', null, null, '7', null, null, '2015-02-03 09:51:50', '的士费', '1');
INSERT INTO `t_oa_message` VALUES ('227', '4', null, null, '7', null, null, '2015-02-03 09:53:42', '', '1');
INSERT INTO `t_oa_message` VALUES ('228', '4', null, null, '7', null, null, '2015-02-03 09:53:46', '佛挡杀佛', '1');
INSERT INTO `t_oa_message` VALUES ('229', '7', null, null, '4', null, null, '2015-02-03 10:08:34', '尊敬的唐小林用户：您发起的公文：测试都是，已经通过审批。可以进行下一步操作啦！【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('230', '7', null, null, '4', null, null, '2015-02-03 10:31:07', '尊敬的唐小林用户：您发起的公文：12，已经通过审批。可以进行下一步操作啦！【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('231', '4', null, null, '7', null, null, '2015-02-03 10:57:17', '尊敬的刘美用户：有新的公文：测试公文时效性，提交给您等待审批。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('232', '4', null, null, '7', null, null, '2015-02-03 11:26:44', '', '1');
INSERT INTO `t_oa_message` VALUES ('233', '4', null, null, '7', null, null, '2015-02-03 11:27:15', '', '1');
INSERT INTO `t_oa_message` VALUES ('234', '7', null, null, '4', null, null, '2015-02-03 11:33:54', '', '1');
INSERT INTO `t_oa_message` VALUES ('235', '7', null, null, '4', null, null, '2015-02-03 11:34:03', '', '1');
INSERT INTO `t_oa_message` VALUES ('236', '4', null, null, '7', null, null, '2015-02-03 11:38:29', '的士费', '1');
INSERT INTO `t_oa_message` VALUES ('237', '4', null, null, '7', null, null, '2015-02-03 11:39:06', '发', '1');
INSERT INTO `t_oa_message` VALUES ('238', '6', null, null, '2', null, null, '2015-02-04 09:40:55', '尊敬的汤姆用户：您签发的公文：987654321，已经全部签收。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('239', '2', null, null, '6', null, null, '2015-02-04 09:59:26', '尊敬的蒋杰用户：有公文：876767，签发至您，需要您签收。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('240', '6', null, null, '2', null, null, '2015-02-04 09:59:40', '尊敬的汤姆用户：您签发的公文：876767，已经全部签收。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('241', '6', null, null, '2', null, null, '2015-02-04 10:30:41', '成员列表中对话，发送较多内容时，对方没有收到成员列表中对话，发送较多内容时，对方没有收到成员列表中对话，发送较多内容时，对方没有收到成员列表中对话，发送较多内容时，对方没有收到成员列表中对话，发送较多内容时，对方没有收到成员列表中对话，发送较多内容时，对方没有收到成员列表中对话，发送较多内容时，对方没有收到成员列表中对话，发送较多内容时，对方没有收到成员列表中对话，发送较多内容时，对方没有收到成员列表中对话，发送较多内容时，对方没有收到成员列表中对话，发送较多内容时，对方没有收到成员列表中对话，发送较多内容', '1');
INSERT INTO `t_oa_message` VALUES ('242', '2', null, null, '1', null, null, '2015-02-04 10:32:32', '0987654', '1');
INSERT INTO `t_oa_message` VALUES ('243', '2', null, null, '1', null, null, '2015-02-04 10:33:13', '������', '1');
INSERT INTO `t_oa_message` VALUES ('244', '7', null, null, '6', null, null, '2015-02-04 10:43:12', '', '1');
INSERT INTO `t_oa_message` VALUES ('245', '1', null, null, '2', null, null, '2015-02-04 10:46:46', 'ddddddddddddddd', '1');
INSERT INTO `t_oa_message` VALUES ('246', '2', null, null, '6', null, null, '2015-02-04 10:50:43', '火火火', '1');
INSERT INTO `t_oa_message` VALUES ('247', '2', null, null, '1', null, null, '2015-02-04 10:53:46', '木木木木木木木木木森', '1');
INSERT INTO `t_oa_message` VALUES ('248', '1', null, null, '2', null, null, '2015-02-04 11:00:26', 'dddddddddd', '1');
INSERT INTO `t_oa_message` VALUES ('249', '1', null, null, '2', null, null, '2015-02-04 11:02:55', 'dddddddddddd', '1');
INSERT INTO `t_oa_message` VALUES ('250', '1', null, null, '2', null, null, '2015-02-04 11:07:38', '', '1');
INSERT INTO `t_oa_message` VALUES ('251', '1', null, null, '2', null, null, '2015-02-04 11:17:51', 'ddddddd', '1');
INSERT INTO `t_oa_message` VALUES ('252', '1', null, null, '2', null, null, '2015-02-04 11:36:24', 'ddddddddddddd', '1');
INSERT INTO `t_oa_message` VALUES ('253', '1', null, null, '2', null, null, '2015-02-04 11:37:04', 'dddddddddddd', '1');
INSERT INTO `t_oa_message` VALUES ('254', '2', null, null, '1', null, null, '2015-02-04 11:40:41', 'dddddddd', '1');
INSERT INTO `t_oa_message` VALUES ('255', '1', null, null, '2', null, null, '2015-02-04 11:41:01', 'ddddddddddddddddddd', '1');
INSERT INTO `t_oa_message` VALUES ('256', '2', null, null, '1', null, null, '2015-02-04 11:42:41', '测试消息推送问题', '1');
INSERT INTO `t_oa_message` VALUES ('257', '7', null, null, '4', null, null, '2015-02-04 11:45:37', '尊敬的唐小林用户：有新的公文：测试公文短信，提交给您等待审批。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('258', '1', null, null, '6', null, null, '2015-02-04 14:38:16', '', '1');
INSERT INTO `t_oa_message` VALUES ('259', '1', null, null, '7', null, null, '2015-02-04 14:52:36', '', '1');
INSERT INTO `t_oa_message` VALUES ('260', '6', null, null, '7', null, null, '2015-02-04 14:59:40', '321', '1');
INSERT INTO `t_oa_message` VALUES ('261', '6', null, null, '7', null, null, '2015-02-04 15:27:06', '97876', '1');
INSERT INTO `t_oa_message` VALUES ('262', '4', null, null, '4', null, null, '2015-02-04 15:27:18', '尊敬的唐小林用户：有新的公文：都是，提交给您等待审批。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('263', '6', null, null, '7', null, null, '2015-02-04 15:29:00', '878', '1');
INSERT INTO `t_oa_message` VALUES ('264', '6', null, null, '7', null, null, '2015-02-04 15:34:22', '00', '1');
INSERT INTO `t_oa_message` VALUES ('265', '6', null, null, '7', null, null, '2015-02-04 15:35:43', '1111', '1');
INSERT INTO `t_oa_message` VALUES ('266', '4', null, null, '7', null, null, '2015-02-04 15:39:01', '', '1');
INSERT INTO `t_oa_message` VALUES ('267', '6', null, null, '7', null, null, '2015-02-04 15:55:18', '0-0-0', '1');
INSERT INTO `t_oa_message` VALUES ('268', '6', null, null, '7', null, null, '2015-02-04 15:57:12', '765432', '1');
INSERT INTO `t_oa_message` VALUES ('269', '1', null, null, '7', null, null, '2015-02-05 10:05:13', 'dddd', '1');
INSERT INTO `t_oa_message` VALUES ('270', '1', null, null, '7', null, null, '2015-02-05 10:05:23', 'ddd', '1');
INSERT INTO `t_oa_message` VALUES ('271', '1', null, null, '6', null, null, '2015-02-05 13:57:16', 'hha ', '1');
INSERT INTO `t_oa_message` VALUES ('272', '1', null, null, '4', null, null, '2015-02-05 13:57:26', 'fds ', '1');
INSERT INTO `t_oa_message` VALUES ('273', '1', null, null, '6', null, null, '2015-02-05 16:34:23', 'hello', '1');
INSERT INTO `t_oa_message` VALUES ('274', '1', null, null, '2', null, null, '2015-02-06 11:42:46', 'ddddddddd', '1');
INSERT INTO `t_oa_message` VALUES ('275', '7', null, null, '4', null, null, '2015-02-06 11:53:20', '1', '1');
INSERT INTO `t_oa_message` VALUES ('276', '7', null, null, '4', null, null, '2015-02-06 11:53:25', '324', '1');
INSERT INTO `t_oa_message` VALUES ('277', '7', null, null, '4', null, null, '2015-02-06 11:53:29', '尔额外', '1');
INSERT INTO `t_oa_message` VALUES ('278', '7', null, null, '4', null, null, '2015-02-06 11:57:39', '返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康返回时考虑非健康', '1');
INSERT INTO `t_oa_message` VALUES ('279', '7', null, null, '1', null, null, '2015-02-06 14:01:07', 'tttest', '1');
INSERT INTO `t_oa_message` VALUES ('280', '4', null, null, '7', null, null, '2015-02-06 14:29:01', '尊敬的刘美用户：您发起的公文：测试公文文件上传，已经通过审批。可以进行下一步操作啦！【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('281', '7', null, null, '4', null, null, '2015-02-06 14:30:23', '尊敬的唐小林用户：有新的公文：56，提交给您等待审批。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('282', '4', null, null, '7', null, null, '2015-02-06 15:21:47', '佛挡杀佛', '1');
INSERT INTO `t_oa_message` VALUES ('283', '4', null, null, '7', null, null, '2015-02-06 15:21:50', '方式等方式发', '1');
INSERT INTO `t_oa_message` VALUES ('284', '4', null, null, '7', null, null, '2015-02-06 15:21:52', '付水电费是', '1');
INSERT INTO `t_oa_message` VALUES ('285', '4', null, null, '7', null, null, '2015-02-06 15:22:32', '付水电费', '1');
INSERT INTO `t_oa_message` VALUES ('286', '4', null, null, '7', null, null, '2015-02-06 15:22:34', '谁东方闪电', '1');
INSERT INTO `t_oa_message` VALUES ('287', '4', null, null, '7', null, null, '2015-02-06 15:22:36', '水电费', '1');
INSERT INTO `t_oa_message` VALUES ('288', '4', null, null, '2', null, null, '2015-02-06 15:22:41', '热源', '1');
INSERT INTO `t_oa_message` VALUES ('289', '4', null, null, '2', null, null, '2015-02-06 15:22:43', '和羊肉汤有', '1');
INSERT INTO `t_oa_message` VALUES ('290', '4', null, null, '2', null, null, '2015-02-06 15:22:44', '儿童', '1');
INSERT INTO `t_oa_message` VALUES ('291', '2', null, null, '7', null, null, '2015-02-06 15:22:59', '和乳头也', '1');
INSERT INTO `t_oa_message` VALUES ('292', '2', null, null, '7', null, null, '2015-02-06 15:23:01', '如图和羊肉汤有', '1');
INSERT INTO `t_oa_message` VALUES ('293', '2', null, null, '7', null, null, '2015-02-06 15:23:03', '汉语', '1');
INSERT INTO `t_oa_message` VALUES ('294', '6', null, null, '7', null, null, '2015-02-06 15:23:14', '红人堂', '1');
INSERT INTO `t_oa_message` VALUES ('295', '6', null, null, '7', null, null, '2015-02-06 15:23:16', '鸡同鸭讲他', '1');
INSERT INTO `t_oa_message` VALUES ('296', '6', null, null, '7', null, null, '2015-02-06 15:23:18', '如图一', '1');
INSERT INTO `t_oa_message` VALUES ('297', '2', null, null, '4', null, null, '2015-02-09 09:08:49', '尊敬的唐小林用户：有新的公文：测试2，提交给您等待审批。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('298', '4', null, null, '2', null, null, '2015-02-09 09:10:07', '尊敬的汤姆用户：您发起的公文：测试2，已经通过审批。可以进行下一步操作啦！【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('299', '7', null, null, '4', null, null, '2015-02-09 09:11:55', '尊敬的唐小林用户：有新的公文：测试3，提交给您等待审批。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('300', '4', null, null, '7', null, null, '2015-02-09 09:12:30', '尊敬的刘美用户：您的公文：测试3，已被驳回，请登录系统查看。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('301', '4', null, null, '7', null, null, '2015-02-09 09:19:42', '尊敬的刘美用户：您的公文：测试3，已被驳回，请登录系统查看。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('302', '7', null, null, '4', null, null, '2015-02-09 09:20:08', '尊敬的唐小林用户：公文：测试3，已经过修改，并重新提交，等待您审批。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('303', '4', null, null, '9', null, null, '2015-02-09 14:42:38', '肥嘟嘟', '0');
INSERT INTO `t_oa_message` VALUES ('304', '4', null, null, '9', null, null, '2015-02-09 14:42:41', '个人个人', '0');
INSERT INTO `t_oa_message` VALUES ('305', '4', null, null, '9', null, null, '2015-02-09 14:42:43', '乳头和投入', '0');
INSERT INTO `t_oa_message` VALUES ('306', '7', null, null, '4', null, null, '2015-02-09 14:43:18', '你好啊', '1');
INSERT INTO `t_oa_message` VALUES ('307', '7', null, null, '4', null, null, '2015-02-09 14:43:28', '当然啦', '1');
INSERT INTO `t_oa_message` VALUES ('308', '7', null, null, '4', null, null, '2015-02-09 14:43:31', '是范德萨', '1');
INSERT INTO `t_oa_message` VALUES ('309', '4', null, null, '7', null, null, '2015-02-09 14:44:26', 'V型规范的第三个方式发', '1');
INSERT INTO `t_oa_message` VALUES ('310', '4', null, null, '7', null, null, '2015-02-09 14:44:28', '付水电费 ', '1');
INSERT INTO `t_oa_message` VALUES ('311', '1', null, null, '10', null, null, '2015-02-10 09:21:47', '规划局考虑', '0');
INSERT INTO `t_oa_message` VALUES ('312', '4', null, null, '7', null, null, '2015-02-10 09:46:05', '尊敬的刘美用户：有公文：公文测试22，签发至您，需要您签收。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('313', '4', null, null, '6', null, null, '2015-02-10 09:46:05', '尊敬的蒋杰用户：有公文：公文测试22，签发至您，需要您签收。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('314', '4', null, null, '4', null, null, '2015-02-10 09:46:05', '尊敬的唐小林用户：有公文：公文测试22，签发至您，需要您签收。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('315', '4', null, null, '2', null, null, '2015-02-10 09:46:05', '尊敬的汤姆用户：有公文：公文测试22，签发至您，需要您签收。【临澧县教育系统OA平台】', '1');
INSERT INTO `t_oa_message` VALUES ('316', '7', null, null, '4', null, null, '2015-02-10 09:47:18', '时代复分', '1');
INSERT INTO `t_oa_message` VALUES ('317', '4', null, null, '11', null, null, '2015-02-10 13:55:31', 'fdsfsdkfjdslkf��ˮ���ˬ��ˮ��fdsfsdkfjdslkf��ˮ���ˬ��ˮ��fdsfsdkfjdslkf��ˮ���ˬ��ˮ��fdsfsdkfjdslkf��ˮ���ˬ��ˮ��fdsfsdkfjdslkf��ˮ���ˬ��ˮ��fdsfsdkfjdslkf��ˮ���ˬ��ˮ��fdsfsdkfjdslkf��ˮ���ˬ��ˮ��fdsfsdkfjdslkf��ˮ���ˬ��ˮ��fdsfsdkfjdslkf��ˮ���ˬ��ˮ��fdsfsdkfjdslkf��ˮ���ˬ��ˮ��fdsfsdkfjdslkf��ˮ���ˬ��ˮ��', '0');
INSERT INTO `t_oa_message` VALUES ('318', '2', null, null, '1', null, null, '2015-02-10 14:04:32', 'ddddddd', '1');
INSERT INTO `t_oa_message` VALUES ('319', '2', null, null, '1', null, null, '2015-02-10 14:16:15', 'ddsadfadfads', '1');
INSERT INTO `t_oa_message` VALUES ('320', '2', null, null, '1', null, null, '2015-02-10 14:18:41', 'adfasdf', '1');
INSERT INTO `t_oa_message` VALUES ('321', '2', null, null, '1', null, null, '2015-02-10 14:37:30', 'adsfsadf', '1');
INSERT INTO `t_oa_message` VALUES ('322', '2', null, null, '4', null, null, '2015-02-10 14:47:13', '1', '1');
INSERT INTO `t_oa_message` VALUES ('323', '2', null, null, '4', null, null, '2015-02-10 14:47:14', '2', '1');
INSERT INTO `t_oa_message` VALUES ('324', '2', null, null, '4', null, null, '2015-02-10 14:47:16', '3', '1');
INSERT INTO `t_oa_message` VALUES ('325', '7', null, null, '4', null, null, '2015-02-10 14:47:25', '4', '1');
INSERT INTO `t_oa_message` VALUES ('326', '7', null, null, '4', null, null, '2015-02-10 14:47:27', '5', '1');
INSERT INTO `t_oa_message` VALUES ('327', '7', null, null, '4', null, null, '2015-02-10 14:47:28', '6', '1');
INSERT INTO `t_oa_message` VALUES ('328', '6', null, null, '4', null, null, '2015-02-10 14:47:40', '7', '1');
INSERT INTO `t_oa_message` VALUES ('329', '6', null, null, '4', null, null, '2015-02-10 14:47:41', '8', '1');
INSERT INTO `t_oa_message` VALUES ('330', '6', null, null, '4', null, null, '2015-02-10 14:47:42', '9', '1');
INSERT INTO `t_oa_message` VALUES ('331', '7', null, null, '4', null, null, '2015-02-10 14:48:54', '11', '1');
INSERT INTO `t_oa_message` VALUES ('332', '7', null, null, '4', null, null, '2015-02-10 14:49:44', '12', '1');
INSERT INTO `t_oa_message` VALUES ('333', '7', null, null, '4', null, null, '2015-02-10 14:49:47', '13', '1');
INSERT INTO `t_oa_message` VALUES ('334', '7', null, null, '4', null, null, '2015-02-10 14:49:59', '14', '1');
INSERT INTO `t_oa_message` VALUES ('335', '7', null, null, '4', null, null, '2015-02-10 14:50:06', '15', '1');
INSERT INTO `t_oa_message` VALUES ('336', '7', null, null, '4', null, null, '2015-02-10 14:50:13', '16', '1');
INSERT INTO `t_oa_message` VALUES ('337', '7', null, null, '4', null, null, '2015-02-10 14:50:30', '17', '1');
INSERT INTO `t_oa_message` VALUES ('338', '7', null, null, '4', null, null, '2015-02-10 14:50:32', '18', '1');
INSERT INTO `t_oa_message` VALUES ('339', '7', null, null, '4', null, null, '2015-02-10 14:50:37', '21', '1');
INSERT INTO `t_oa_message` VALUES ('340', '7', null, null, '4', null, null, '2015-02-10 14:51:08', 'f', '1');
INSERT INTO `t_oa_message` VALUES ('341', '7', null, null, '4', null, null, '2015-02-10 14:51:09', 'd', '1');
INSERT INTO `t_oa_message` VALUES ('342', '7', null, null, '4', null, null, '2015-02-10 14:51:10', 's', '1');
INSERT INTO `t_oa_message` VALUES ('343', '7', null, null, '4', null, null, '2015-02-10 14:51:11', 'd', '1');
INSERT INTO `t_oa_message` VALUES ('344', '4', null, null, '7', null, null, '2015-02-10 15:08:00', '你好啊', '1');
INSERT INTO `t_oa_message` VALUES ('345', '4', null, null, '7', null, null, '2015-02-10 15:08:04', '你真好', '1');
INSERT INTO `t_oa_message` VALUES ('346', '4', null, null, '7', null, null, '2015-02-10 15:08:08', '你非常好', '1');
INSERT INTO `t_oa_message` VALUES ('347', '2', null, null, '4', null, null, '2015-02-10 15:08:25', '更好', '1');
INSERT INTO `t_oa_message` VALUES ('348', '2', null, null, '4', null, null, '2015-02-10 15:08:30', '更好啊', '1');
INSERT INTO `t_oa_message` VALUES ('349', '2', null, null, '4', null, null, '2015-02-10 15:08:34', '更好啊啊', '1');
INSERT INTO `t_oa_message` VALUES ('350', '1', null, null, '7', null, null, '2015-02-10 15:08:51', '非常好', '1');
INSERT INTO `t_oa_message` VALUES ('351', '1', null, null, '7', null, null, '2015-02-10 15:08:55', '非常好好', '1');
INSERT INTO `t_oa_message` VALUES ('352', '1', null, null, '7', null, null, '2015-02-10 15:08:59', '非常好好好', '1');
INSERT INTO `t_oa_message` VALUES ('353', '3', null, null, '7', null, null, '2015-02-10 15:09:55', '佛挡杀佛', '1');
INSERT INTO `t_oa_message` VALUES ('354', '3', null, null, '7', null, null, '2015-02-10 15:09:56', '的士费', '1');
INSERT INTO `t_oa_message` VALUES ('355', '3', null, null, '7', null, null, '2015-02-10 15:09:58', '水电费', '1');
INSERT INTO `t_oa_message` VALUES ('356', '3', null, null, '7', null, null, '2015-02-10 15:09:59', '水电费', '1');
INSERT INTO `t_oa_message` VALUES ('357', '12', null, null, '7', null, null, '2015-02-10 15:10:14', '213', '1');
INSERT INTO `t_oa_message` VALUES ('358', '12', null, null, '7', null, null, '2015-02-10 15:10:15', '12', '1');
INSERT INTO `t_oa_message` VALUES ('359', '12', null, null, '7', null, null, '2015-02-10 15:10:16', '213', '1');
INSERT INTO `t_oa_message` VALUES ('360', '3', null, null, '7', null, null, '2015-02-10 15:10:34', 'dsf', '1');
INSERT INTO `t_oa_message` VALUES ('361', '3', null, null, '7', null, null, '2015-02-10 15:10:35', 'gdsgf', '1');
INSERT INTO `t_oa_message` VALUES ('362', '3', null, null, '7', null, null, '2015-02-10 15:10:36', 'fdsf', '1');
INSERT INTO `t_oa_message` VALUES ('363', '7', null, null, '2', null, null, '2015-02-10 15:11:40', '123', '1');
INSERT INTO `t_oa_message` VALUES ('364', '12', null, null, '4', null, null, '2015-02-10 15:47:46', '1', '1');
INSERT INTO `t_oa_message` VALUES ('365', '12', null, null, '4', null, null, '2015-02-10 15:47:47', '2', '1');
INSERT INTO `t_oa_message` VALUES ('366', '12', null, null, '4', null, null, '2015-02-10 15:47:48', '3', '1');
INSERT INTO `t_oa_message` VALUES ('367', '1', null, null, '2', null, null, '2015-02-10 16:27:55', 'sdf', '1');
INSERT INTO `t_oa_message` VALUES ('368', '1', null, null, '2', null, null, '2015-02-10 16:27:58', 'sdf', '1');
INSERT INTO `t_oa_message` VALUES ('369', '1', null, null, '2', null, null, '2015-02-10 16:28:15', 'ddd', '1');
INSERT INTO `t_oa_message` VALUES ('370', '1', null, null, '2', null, null, '2015-02-10 16:28:17', '1', '1');
INSERT INTO `t_oa_message` VALUES ('371', '1', null, null, '2', null, null, '2015-02-10 16:28:19', '22', '1');
INSERT INTO `t_oa_message` VALUES ('372', '1', null, null, '2', null, null, '2015-02-10 16:28:20', '33', '1');
INSERT INTO `t_oa_message` VALUES ('373', '1', null, null, '2', null, null, '2015-02-10 16:28:29', '33', '1');
INSERT INTO `t_oa_message` VALUES ('374', '1', null, null, '2', null, null, '2015-02-10 16:28:30', '44', '1');
INSERT INTO `t_oa_message` VALUES ('375', '1', null, null, '2', null, null, '2015-02-10 16:28:32', '55', '1');
INSERT INTO `t_oa_message` VALUES ('376', '1', null, null, '2', null, null, '2015-02-10 16:28:33', '66', '1');
INSERT INTO `t_oa_message` VALUES ('377', '2', null, null, '1', null, null, '2015-02-11 10:25:01', 'adfsdf', '1');
INSERT INTO `t_oa_message` VALUES ('378', '1', null, null, '2', null, null, '2015-02-11 10:29:57', 'eeee', '1');
INSERT INTO `t_oa_message` VALUES ('379', '2', null, null, '4', null, null, '2015-02-11 10:31:44', '的士费', '1');
INSERT INTO `t_oa_message` VALUES ('380', '2', null, null, '4', null, null, '2015-02-11 10:31:46', '的士费', '1');
INSERT INTO `t_oa_message` VALUES ('381', '4', null, null, '2', null, null, '2015-02-11 10:35:37', '方法', '1');
INSERT INTO `t_oa_message` VALUES ('382', '4', null, null, '2', null, null, '2015-02-11 10:35:39', 'Greg', '1');
INSERT INTO `t_oa_message` VALUES ('383', '2', null, null, '1', null, null, '2015-02-11 10:40:36', 'adsfasdf', '1');
INSERT INTO `t_oa_message` VALUES ('384', '4', null, null, '4', null, null, '2015-02-11 11:08:44', '时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地方快时间地d方快', '1');
INSERT INTO `t_oa_message` VALUES ('385', '1', null, null, '2', null, null, '2015-02-11 11:11:49', '1234567', '1');
INSERT INTO `t_oa_message` VALUES ('386', '2', null, null, '1', null, null, '2015-02-11 11:15:27', 'eeeeeeeeeeeeeee', '1');
INSERT INTO `t_oa_message` VALUES ('387', '4', null, null, '7', null, null, '2015-02-11 11:51:30', 'dsf ', '1');
INSERT INTO `t_oa_message` VALUES ('388', '7', null, null, '4', null, null, '2015-02-11 11:51:56', '将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑山发将费昆仑', '1');
INSERT INTO `t_oa_message` VALUES ('389', '7', null, null, '4', null, null, '2015-02-11 11:52:29', '佛挡杀佛', '1');
INSERT INTO `t_oa_message` VALUES ('390', '7', null, null, '4', null, null, '2015-02-11 11:52:33', '梵蒂冈地方刚', '1');
INSERT INTO `t_oa_message` VALUES ('391', '2', null, null, '4', null, null, '2015-02-11 11:52:47', '的士费', '1');
INSERT INTO `t_oa_message` VALUES ('392', '2', null, null, '4', null, null, '2015-02-11 11:52:48', 'GRE个', '1');
INSERT INTO `t_oa_message` VALUES ('393', '2', null, null, '4', null, null, '2015-02-11 11:52:50', '广泛而f', '1');
INSERT INTO `t_oa_message` VALUES ('394', '3', null, null, '4', null, null, '2015-02-11 11:53:23', 'fdsf ', '1');
INSERT INTO `t_oa_message` VALUES ('395', '4', null, null, '7', null, null, '2015-02-11 11:54:27', 'jfklsdjf ', '1');
INSERT INTO `t_oa_message` VALUES ('396', '4', null, null, '7', null, null, '2015-02-11 11:54:28', 'geg ', '1');
INSERT INTO `t_oa_message` VALUES ('397', '4', null, null, '7', null, null, '2015-02-11 11:54:30', 'ewrf ', '1');
INSERT INTO `t_oa_message` VALUES ('398', '1', null, null, '2', null, null, '2015-02-11 13:28:11', '22222222222222222222222222', '1');
INSERT INTO `t_oa_message` VALUES ('399', '1', null, null, '2', null, null, '2015-02-11 13:28:33', '333333333333333333333333333', '1');
INSERT INTO `t_oa_message` VALUES ('400', '2', null, null, '1', null, null, '2015-02-11 13:28:54', '4444444444444444444444444444', '1');
INSERT INTO `t_oa_message` VALUES ('401', '1', null, null, '2', null, null, '2015-02-11 13:29:17', '55555555555555555555555', '1');
INSERT INTO `t_oa_message` VALUES ('402', '2', null, null, '1', null, null, '2015-02-11 13:29:42', '66666666666666666666', '1');
INSERT INTO `t_oa_message` VALUES ('403', '4', null, null, '7', null, null, '2015-02-11 13:39:42', '你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防水袋经费看你好发防', '1');
INSERT INTO `t_oa_message` VALUES ('404', '7', null, null, '4', null, null, '2015-02-11 13:40:45', '快捷方式路口凉快放暑假的就流口水觉得发记录看电视剧放两块将两块路口第三方反反复复反反复复反反复复快捷方式路口凉快放暑假的就流口水觉得发记录看电视剧放两块将两块路口第三方反反复复反反复复反反复复快捷方式路口凉快放暑假的就流口水觉得发记录看电视剧放两块将两块路口第三方反反复复反反复复反反复复快捷方式路口凉快放暑假的就流口水觉得发记录看电视剧放两块将两块路口第三方反反复复反反复复反反复复快捷方式路口凉快放暑假的就流口水觉得发记录看电视剧放两块将两块路口第三方反反复复反反复复反反复复快捷方式路口凉快放暑假的就流口水', '1');
INSERT INTO `t_oa_message` VALUES ('405', '4', null, null, '7', null, null, '2015-02-11 14:34:43', '佛挡杀佛', '1');
INSERT INTO `t_oa_message` VALUES ('406', '4', null, null, '7', null, null, '2015-02-11 14:34:44', '佛挡杀佛', '1');
INSERT INTO `t_oa_message` VALUES ('407', '4', null, null, '7', null, null, '2015-02-11 14:34:48', '防水袋', '1');
INSERT INTO `t_oa_message` VALUES ('408', '7', null, null, '4', null, null, '2015-02-11 14:35:27', '房顶上', '1');
INSERT INTO `t_oa_message` VALUES ('409', '7', null, null, '4', null, null, '2015-02-11 14:35:31', '发给', '1');
INSERT INTO `t_oa_message` VALUES ('410', '7', null, null, '4', null, null, '2015-02-11 15:24:16', '水电工', '1');
INSERT INTO `t_oa_message` VALUES ('411', '7', null, null, '4', null, null, '2015-02-11 15:24:21', '地方税', '1');
INSERT INTO `t_oa_message` VALUES ('412', '2', null, null, '7', null, null, '2015-02-13 10:30:24', 'dddddddddd', '1');
INSERT INTO `t_oa_message` VALUES ('413', '1', null, null, '2', null, null, '2015-02-13 11:23:16', 'dddddddddddddd', '1');
INSERT INTO `t_oa_message` VALUES ('414', '1', null, null, '2', null, null, '2015-02-13 11:23:32', 'ddddddddddddddddd', '1');
INSERT INTO `t_oa_message` VALUES ('415', '1', null, null, '2', null, null, '2015-02-13 11:46:12', '111111111111', '1');
INSERT INTO `t_oa_message` VALUES ('416', '1', null, null, '2', null, null, '2015-02-13 11:52:24', 'fiy ge fen', '1');
INSERT INTO `t_oa_message` VALUES ('417', '2', null, null, '1', null, null, '2015-02-13 11:52:45', 'q bn fiy wh owv ', '1');
INSERT INTO `t_oa_message` VALUES ('418', '2', null, null, '1', null, null, '2015-02-13 11:54:23', 'ddddddddddddddddddd', '1');
INSERT INTO `t_oa_message` VALUES ('419', '1', null, null, '2', null, null, '2015-02-13 11:54:44', 'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', '1');
INSERT INTO `t_oa_message` VALUES ('420', '1', null, null, '2', null, null, '2015-02-13 11:55:55', '等发达省份', '1');
INSERT INTO `t_oa_message` VALUES ('421', '1', null, null, '2', null, null, '2015-02-13 11:56:52', 'ddd', '1');
INSERT INTO `t_oa_message` VALUES ('422', '1', null, null, '2', null, null, '2015-02-13 11:57:15', '萨法', '1');
INSERT INTO `t_oa_message` VALUES ('423', '2', null, null, '1', null, null, '2015-02-13 11:57:30', '是打发是否', '1');
INSERT INTO `t_oa_message` VALUES ('424', '2', null, null, '1', null, null, '2015-02-13 11:58:07', '撒旦发射发送地方', '1');
INSERT INTO `t_oa_message` VALUES ('425', '1', null, null, '2', null, null, '2015-02-13 11:58:32', '适当放松发送发撒旦防撒', '1');
INSERT INTO `t_oa_message` VALUES ('426', '1', null, null, '2', null, null, '2015-02-13 13:46:19', '三三四四', '1');
INSERT INTO `t_oa_message` VALUES ('427', '2', null, null, '1', null, null, '2015-02-13 13:48:05', '哒哒哒', '1');
INSERT INTO `t_oa_message` VALUES ('428', '2', null, null, '1', null, null, '2015-02-13 13:48:20', '达到顶点', '1');
INSERT INTO `t_oa_message` VALUES ('429', '2', null, null, '1', null, null, '2015-02-13 13:48:40', '地地道道的', '1');
INSERT INTO `t_oa_message` VALUES ('430', '2', null, null, '1', null, null, '2015-02-13 13:48:57', '少时诵诗书', '1');
INSERT INTO `t_oa_message` VALUES ('431', '2', null, null, '1', null, null, '2015-02-13 13:49:30', '的放松发送', '1');
INSERT INTO `t_oa_message` VALUES ('432', '2', null, null, '1', null, null, '2015-02-13 13:54:37', '反反复复', '1');
INSERT INTO `t_oa_message` VALUES ('433', '1', null, null, '2', null, null, '2015-02-13 13:55:19', '三三四四', '1');
INSERT INTO `t_oa_message` VALUES ('434', '2', null, null, '1', null, null, '2015-02-13 13:55:30', '撒旦防撒', '1');
INSERT INTO `t_oa_message` VALUES ('435', '2', null, null, '1', null, null, '2015-02-13 13:55:41', '撒发射', '1');
INSERT INTO `t_oa_message` VALUES ('436', '4', null, null, '7', null, null, '2015-02-13 13:56:19', 'fsdfsdf ', '1');
INSERT INTO `t_oa_message` VALUES ('437', '4', null, null, '3', null, null, '2015-02-13 13:56:45', '下午好', '0');
INSERT INTO `t_oa_message` VALUES ('438', '4', null, null, '3', null, null, '2015-02-13 13:56:56', '防水袋防水袋', '0');
INSERT INTO `t_oa_message` VALUES ('439', '4', null, null, '3', null, null, '2015-02-13 14:00:20', '合肥合肥', '0');
INSERT INTO `t_oa_message` VALUES ('440', '4', null, null, '12', null, null, '2015-02-13 14:01:24', '规范的', '0');
INSERT INTO `t_oa_message` VALUES ('441', '2', null, null, '4', null, null, '2015-02-13 14:02:53', 'xiawuhao', '1');
INSERT INTO `t_oa_message` VALUES ('442', '4', null, null, '2', null, null, '2015-02-13 14:03:34', '福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李开复福建省李', '1');
INSERT INTO `t_oa_message` VALUES ('443', '2', null, null, '1', null, null, '2015-02-13 14:03:58', '撒旦发撒旦防', '1');
INSERT INTO `t_oa_message` VALUES ('444', '2', null, null, '1', null, null, '2015-02-13 14:04:17', '撒旦发撒旦发射大方', '1');
INSERT INTO `t_oa_message` VALUES ('445', '2', null, null, '1', null, null, '2015-02-13 14:04:34', '闪电似的', '1');
INSERT INTO `t_oa_message` VALUES ('446', '4', null, null, '7', null, null, '2015-02-14 11:45:47', 'fsdf', '1');
INSERT INTO `t_oa_message` VALUES ('447', '4', null, null, '7', null, null, '2015-02-14 11:45:52', 's', '1');
INSERT INTO `t_oa_message` VALUES ('448', '7', null, null, '4', null, null, '2015-02-14 11:46:10', '343', '1');
INSERT INTO `t_oa_message` VALUES ('449', '4', null, null, '7', null, null, '2015-02-14 11:46:19', 'hrth', '1');
INSERT INTO `t_oa_message` VALUES ('450', '7', null, null, '4', null, null, '2015-02-14 11:46:50', 'fsdf', '1');
INSERT INTO `t_oa_message` VALUES ('451', '7', null, null, '4', null, null, '2015-02-14 11:46:51', 'fdsf', '1');
INSERT INTO `t_oa_message` VALUES ('452', '7', null, null, '4', null, null, '2015-02-14 11:46:52', 'fsdf', '1');
INSERT INTO `t_oa_message` VALUES ('453', '2', null, null, '4', null, null, '2015-02-14 11:47:01', 'gher', '1');
INSERT INTO `t_oa_message` VALUES ('454', '2', null, null, '4', null, null, '2015-02-14 11:47:02', 'tret', '1');
INSERT INTO `t_oa_message` VALUES ('455', '2', null, null, '4', null, null, '2015-02-14 11:47:03', 'tret', '1');
INSERT INTO `t_oa_message` VALUES ('456', '6', null, null, '4', null, null, '2015-02-14 11:47:12', '1', '1');
INSERT INTO `t_oa_message` VALUES ('457', '6', null, null, '4', null, null, '2015-02-14 11:47:13', '3', '1');
INSERT INTO `t_oa_message` VALUES ('458', '6', null, null, '4', null, null, '2015-02-14 11:47:15', '5', '1');
INSERT INTO `t_oa_message` VALUES ('459', '4', null, null, '6', null, null, '2015-02-14 14:16:18', '解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是解放路快解放都是', '1');
INSERT INTO `t_oa_message` VALUES ('460', '4', null, null, '4', null, null, '2015-02-14 14:17:57', '21', '1');
INSERT INTO `t_oa_message` VALUES ('461', '4', null, null, '12', null, null, '2015-02-14 14:18:57', '的士费', '0');
INSERT INTO `t_oa_message` VALUES ('462', '4', null, null, '12', null, null, '2015-02-14 14:19:07', '324234', '0');
INSERT INTO `t_oa_message` VALUES ('463', '4', null, null, '10', null, null, '2015-02-14 14:19:20', '付水电费', '0');
INSERT INTO `t_oa_message` VALUES ('464', '4', null, null, '4', null, null, '2015-02-14 14:48:01', '12', '1');
INSERT INTO `t_oa_message` VALUES ('465', '4', null, null, '6', null, null, '2015-02-14 14:48:01', '12', '1');
INSERT INTO `t_oa_message` VALUES ('466', '4', null, null, '7', null, null, '2015-02-14 14:48:01', '12', '1');
INSERT INTO `t_oa_message` VALUES ('467', '4', null, null, '4', null, null, '2015-02-14 15:07:02', '12', '1');
INSERT INTO `t_oa_message` VALUES ('468', '4', null, null, '6', null, null, '2015-02-14 15:07:02', '12', '1');
INSERT INTO `t_oa_message` VALUES ('469', '4', null, null, '7', null, null, '2015-02-14 15:07:02', '12', '1');
INSERT INTO `t_oa_message` VALUES ('470', '6', null, null, '2', null, null, '2015-02-14 15:08:41', '测试', '1');
INSERT INTO `t_oa_message` VALUES ('471', '6', null, null, '6', null, null, '2015-02-14 15:08:41', '测试', '1');
INSERT INTO `t_oa_message` VALUES ('472', '6', null, null, '7', null, null, '2015-02-14 15:08:41', '测试', '1');
INSERT INTO `t_oa_message` VALUES ('473', '7', null, null, '4', null, null, '2015-02-14 15:25:20', '防晒服', '1');
INSERT INTO `t_oa_message` VALUES ('474', '4', null, null, '7', null, null, '2015-02-14 15:25:30', '方式等方式水电费', '1');
INSERT INTO `t_oa_message` VALUES ('475', '4', null, null, '2', null, null, '2015-02-14 15:26:21', '发送提醒啦', '1');
INSERT INTO `t_oa_message` VALUES ('476', '4', null, null, '4', null, null, '2015-02-14 15:26:21', '发送提醒啦', '1');
INSERT INTO `t_oa_message` VALUES ('477', '4', null, null, '6', null, null, '2015-02-14 15:26:21', '发送提醒啦', '1');
INSERT INTO `t_oa_message` VALUES ('478', '4', null, null, '7', null, null, '2015-02-14 15:26:21', '发送提醒啦', '1');
INSERT INTO `t_oa_message` VALUES ('479', '4', null, null, '18', null, null, '2015-02-14 15:26:21', '发送提醒啦', '0');
INSERT INTO `t_oa_message` VALUES ('480', '6', null, null, '2', null, null, '2015-02-14 15:27:43', '11111111', '1');
INSERT INTO `t_oa_message` VALUES ('481', '6', null, null, '6', null, null, '2015-02-14 15:27:43', '11111111', '1');
INSERT INTO `t_oa_message` VALUES ('482', '6', null, null, '7', null, null, '2015-02-14 15:27:43', '11111111', '1');
INSERT INTO `t_oa_message` VALUES ('483', '6', null, null, '2', null, null, '2015-02-14 15:28:01', '2222222222', '1');
INSERT INTO `t_oa_message` VALUES ('484', '6', null, null, '6', null, null, '2015-02-14 15:28:01', '2222222222', '1');
INSERT INTO `t_oa_message` VALUES ('485', '6', null, null, '7', null, null, '2015-02-14 15:28:01', '2222222222', '1');
INSERT INTO `t_oa_message` VALUES ('486', '7', null, null, '4', null, null, '2015-02-14 15:32:06', '好好好', '1');
INSERT INTO `t_oa_message` VALUES ('487', '4', null, null, '7', null, null, '2015-02-14 15:32:36', 'I快i', '1');
INSERT INTO `t_oa_message` VALUES ('488', '1', null, null, '6', null, null, '2015-02-15 08:53:34', 'wwwwwwwwwwwww', '0');
INSERT INTO `t_oa_message` VALUES ('489', '1', null, null, '2', null, null, '2015-02-15 10:04:40', 'saadfsdfsdf', '1');
INSERT INTO `t_oa_message` VALUES ('490', '1', null, null, '2', null, null, '2015-02-15 10:04:52', 'sadfsadfasdfas', '1');
INSERT INTO `t_oa_message` VALUES ('491', '1', null, null, '2', null, null, '2015-02-15 10:05:10', 'acccxxxxxxxxxxxxxx', '1');
INSERT INTO `t_oa_message` VALUES ('492', '1', null, null, '2', null, null, '2015-02-15 10:05:29', 'ydddddddd', '1');
INSERT INTO `t_oa_message` VALUES ('493', '1', null, null, '2', null, null, '2015-02-15 10:05:56', 'dddddd', '1');
INSERT INTO `t_oa_message` VALUES ('494', '1', null, null, '2', null, null, '2015-02-15 10:06:45', 'd', '1');
INSERT INTO `t_oa_message` VALUES ('495', '1', null, null, '2', null, null, '2015-02-15 10:06:51', 'd', '1');
INSERT INTO `t_oa_message` VALUES ('496', '1', null, null, '2', null, null, '2015-02-15 10:06:55', 'd', '1');
INSERT INTO `t_oa_message` VALUES ('497', '1', null, null, '2', null, null, '2015-02-15 10:06:56', 'dd', '1');
INSERT INTO `t_oa_message` VALUES ('498', '1', null, null, '2', null, null, '2015-02-15 10:06:56', 'ddd', '1');
INSERT INTO `t_oa_message` VALUES ('499', '1', null, null, '2', null, null, '2015-02-15 10:06:56', 'dddd', '1');
INSERT INTO `t_oa_message` VALUES ('500', '1', null, null, '2', null, null, '2015-02-15 10:06:56', 'ddddd', '1');
INSERT INTO `t_oa_message` VALUES ('501', '1', null, null, '2', null, null, '2015-02-15 10:06:56', 'dddddd', '1');
INSERT INTO `t_oa_message` VALUES ('502', '1', null, null, '2', null, null, '2015-02-15 10:07:17', 'o', '1');
INSERT INTO `t_oa_message` VALUES ('503', '1', null, null, '2', null, null, '2015-02-15 10:16:08', 'uuuuuuuuuuuuuuuuuu', '1');
INSERT INTO `t_oa_message` VALUES ('504', '1', null, null, '7', null, null, '2015-02-15 10:22:27', 'dddd', '1');
INSERT INTO `t_oa_message` VALUES ('505', '1', null, null, '11', null, null, '2015-02-15 10:21:37', '估分', '0');
INSERT INTO `t_oa_message` VALUES ('506', '1', null, null, '11', null, null, '2015-02-15 10:21:52', '杠杠滴', '0');
INSERT INTO `t_oa_message` VALUES ('507', '4', null, null, '7', null, null, '2015-02-15 11:38:54', '佛挡杀佛', '1');
INSERT INTO `t_oa_message` VALUES ('508', '4', null, null, '7', null, null, '2015-02-15 11:39:03', '22', '1');
INSERT INTO `t_oa_message` VALUES ('509', '4', null, null, '2', null, null, '2015-02-15 11:39:09', '435', '1');
INSERT INTO `t_oa_message` VALUES ('510', '4', null, null, '6', null, null, '2015-02-15 11:39:14', '324324', '1');
INSERT INTO `t_oa_message` VALUES ('511', '4', null, null, '7', null, null, '2015-02-15 11:55:00', '1', '1');
INSERT INTO `t_oa_message` VALUES ('512', '4', null, null, '7', null, null, '2015-02-15 11:55:05', '23', '1');
INSERT INTO `t_oa_message` VALUES ('513', '4', null, null, '7', null, null, '2015-02-15 11:55:07', '432453', '1');
INSERT INTO `t_oa_message` VALUES ('514', '4', null, null, '7', null, null, '2015-02-15 11:55:08', '6546', '1');
INSERT INTO `t_oa_message` VALUES ('515', '4', null, null, '10', null, null, '2015-02-15 11:55:22', 'dsff', '0');
INSERT INTO `t_oa_message` VALUES ('516', '4', null, null, '10', null, null, '2015-02-15 11:55:24', 'hrth ', '0');
INSERT INTO `t_oa_message` VALUES ('517', '4', null, null, '10', null, null, '2015-02-15 11:55:26', '1', '0');
INSERT INTO `t_oa_message` VALUES ('518', '2', null, null, '7', null, null, '2015-02-27 10:55:11', 'sfa', '1');
INSERT INTO `t_oa_message` VALUES ('519', '7', null, null, '2', null, null, '2015-02-27 10:55:23', '搜索', '1');
INSERT INTO `t_oa_message` VALUES ('520', '2', null, null, '7', null, null, '2015-02-27 10:55:30', 'asf', '1');
INSERT INTO `t_oa_message` VALUES ('521', '7', null, null, '1', null, null, '2015-02-27 10:59:59', '1', '1');
INSERT INTO `t_oa_message` VALUES ('522', '7', null, null, '1', null, null, '2015-02-27 11:00:20', '11', '1');
INSERT INTO `t_oa_message` VALUES ('523', '7', null, null, '1', null, null, '2015-02-27 11:00:22', '111', '1');
INSERT INTO `t_oa_message` VALUES ('524', '7', null, null, '1', null, null, '2015-02-27 11:00:24', '11111', '1');
INSERT INTO `t_oa_message` VALUES ('525', '7', null, null, '1', null, null, '2015-02-27 11:00:25', '11', '1');
INSERT INTO `t_oa_message` VALUES ('526', '7', null, null, '1', null, null, '2015-02-27 11:00:27', '1111', '1');
INSERT INTO `t_oa_message` VALUES ('527', '7', null, null, '1', null, null, '2015-02-27 11:00:28', '1111', '1');
INSERT INTO `t_oa_message` VALUES ('528', '7', null, null, '1', null, null, '2015-02-27 11:00:30', '11111', '1');
INSERT INTO `t_oa_message` VALUES ('529', '7', null, null, '1', null, null, '2015-02-27 11:00:32', '123', '1');
INSERT INTO `t_oa_message` VALUES ('530', '7', null, null, '1', null, null, '2015-02-27 11:00:33', '213124', '1');
INSERT INTO `t_oa_message` VALUES ('531', '7', null, null, '1', null, null, '2015-02-27 11:00:35', '123123', '1');
INSERT INTO `t_oa_message` VALUES ('532', '7', null, null, '1', null, null, '2015-02-27 11:00:36', '1231', '1');
INSERT INTO `t_oa_message` VALUES ('533', '7', null, null, '1', null, null, '2015-02-27 11:00:37', '12', '1');
INSERT INTO `t_oa_message` VALUES ('534', '7', null, null, '1', null, null, '2015-02-27 11:00:40', '1212', '1');
INSERT INTO `t_oa_message` VALUES ('535', '7', null, null, '1', null, null, '2015-02-27 11:00:42', '1212', '1');
INSERT INTO `t_oa_message` VALUES ('536', '7', null, null, '1', null, null, '2015-02-27 11:00:43', '1212', '1');
INSERT INTO `t_oa_message` VALUES ('537', '7', null, null, '1', null, null, '2015-02-27 11:00:45', '121212', '1');
INSERT INTO `t_oa_message` VALUES ('538', '7', null, null, '1', null, null, '2015-02-27 11:01:25', '121', '0');
INSERT INTO `t_oa_message` VALUES ('539', '7', null, null, '1', null, null, '2015-02-27 11:01:26', '121', '0');
INSERT INTO `t_oa_message` VALUES ('540', '7', null, null, '1', null, null, '2015-02-27 11:01:28', '213123', '0');
INSERT INTO `t_oa_message` VALUES ('541', '7', null, null, '1', null, null, '2015-02-27 11:01:29', '123', '0');
INSERT INTO `t_oa_message` VALUES ('542', '7', null, null, '1', null, null, '2015-02-27 11:01:30', '434', '0');
INSERT INTO `t_oa_message` VALUES ('543', '7', null, null, '1', null, null, '2015-02-27 11:01:32', '45', '0');
INSERT INTO `t_oa_message` VALUES ('544', '7', null, null, '1', null, null, '2015-02-27 11:01:33', '656', '0');
INSERT INTO `t_oa_message` VALUES ('545', '7', null, null, '1', null, null, '2015-02-27 11:01:58', '111', '0');
INSERT INTO `t_oa_message` VALUES ('546', '7', null, null, '1', null, null, '2015-02-27 11:02:15', '大幅度', '0');
INSERT INTO `t_oa_message` VALUES ('547', '4', null, null, '2', null, null, '2015-02-27 11:11:59', '你好', '1');
INSERT INTO `t_oa_message` VALUES ('548', '4', null, null, '4', null, null, '2015-02-27 11:11:59', '你好', '1');
INSERT INTO `t_oa_message` VALUES ('549', '4', null, null, '6', null, null, '2015-02-27 11:11:59', '你好', '1');
INSERT INTO `t_oa_message` VALUES ('550', '4', null, null, '7', null, null, '2015-02-27 11:11:59', '你好', '1');
INSERT INTO `t_oa_message` VALUES ('551', '4', null, null, '2', null, null, '2015-02-27 11:13:38', '454545', '1');
INSERT INTO `t_oa_message` VALUES ('552', '4', null, null, '4', null, null, '2015-02-27 11:13:38', '454545', '1');
INSERT INTO `t_oa_message` VALUES ('553', '4', null, null, '6', null, null, '2015-02-27 11:13:38', '454545', '0');
INSERT INTO `t_oa_message` VALUES ('554', '4', null, null, '7', null, null, '2015-02-27 11:13:38', '454545', '1');
INSERT INTO `t_oa_message` VALUES ('555', '2', null, null, '2', null, null, '2015-02-27 11:16:05', '大家都好', '1');
INSERT INTO `t_oa_message` VALUES ('556', '2', null, null, '4', null, null, '2015-02-27 11:16:05', '大家都好', '1');
INSERT INTO `t_oa_message` VALUES ('557', '2', null, null, '6', null, null, '2015-02-27 11:16:05', '大家都好', '0');
INSERT INTO `t_oa_message` VALUES ('558', '2', null, null, '7', null, null, '2015-02-27 11:16:05', '大家都好', '1');
INSERT INTO `t_oa_message` VALUES ('559', '4', null, null, '3', null, null, '2015-02-27 16:34:54', '1', '0');

-- ----------------------------
-- Table structure for `t_oa_message_one`
-- ----------------------------
DROP TABLE IF EXISTS `t_oa_message_one`;
CREATE TABLE `t_oa_message_one` (
  `id` int(11) NOT NULL,
  `addresser` int(11) DEFAULT NULL,
  `addressername` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `recipient` int(11) DEFAULT NULL,
  `recipientname` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `content` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_oa_message_one
-- ----------------------------
INSERT INTO `t_oa_message_one` VALUES ('273', '1', '超级管理员', '6', '蒋杰', 'hello', '2015-02-05 16:34:23');
INSERT INTO `t_oa_message_one` VALUES ('352', '1', '超级管理员', '7', '刘美', '非常好好好', '2015-02-10 15:08:59');
INSERT INTO `t_oa_message_one` VALUES ('412', '2', '汤姆', '7', '刘美', 'dddddddddd', '2015-02-13 10:30:24');
INSERT INTO `t_oa_message_one` VALUES ('435', '2', '汤姆', '1', '超级管理员', '撒发射', '2015-02-13 13:55:41');
INSERT INTO `t_oa_message_one` VALUES ('272', '1', '超级管理员', '4', '唐小林', 'fds ', '2015-02-05 13:57:26');
INSERT INTO `t_oa_message_one` VALUES ('455', '2', '汤姆', '4', '唐小林', 'tret', '2015-02-14 11:47:03');
INSERT INTO `t_oa_message_one` VALUES ('439', '4', '唐小林', '3', '杰瑞', '合肥合肥', '2015-02-13 14:00:20');
INSERT INTO `t_oa_message_one` VALUES ('440', '4', '唐小林', '12', '1', '规范的', '2015-02-13 14:01:24');

-- ----------------------------
-- Table structure for `t_oa_notification`
-- ----------------------------
DROP TABLE IF EXISTS `t_oa_notification`;
CREATE TABLE `t_oa_notification` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` int(11) DEFAULT NULL,
  `ORGID` int(11) DEFAULT NULL,
  `CONTENT` longtext COLLATE utf8_bin,
  `VIEWFLAG` int(11) DEFAULT NULL COMMENT '0：不展示到门户；1：展示到门户',
  `TIMES` datetime DEFAULT NULL,
  `TITLE` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '通知标题',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_oa_notification
-- ----------------------------
INSERT INTO `t_oa_notification` VALUES ('40', '2', '13', 0xE5928CE4BB96E5A5B9E4B88EE4BB96E5AEB9E69893E4BB8E56E8A1A8E58D95, '1', '2014-12-26 13:44:59', '和他她');
INSERT INTO `t_oa_notification` VALUES ('41', '2', '13', 0xE982A3E4B988E8BF9CE8A784E88C83E58C96E58F91E59CB0E696B9, '1', '2014-12-26 13:46:05', '那么');
INSERT INTO `t_oa_notification` VALUES ('43', '2', '8', 0xE8BF99E698AFE5928CE6B58BE8AF95E69C89E585B3E79A84E4B880E4BA9BE58C97E88DA3, '1', '2014-12-29 16:06:17', '这是');
INSERT INTO `t_oa_notification` VALUES ('44', '2', '13', 0x2020202020202020202020202020202020202020202020206464640D0A2020202020202020202020202020202020202020, '0', '2015-01-09 11:06:55', 'dd');
INSERT INTO `t_oa_notification` VALUES ('48', '1011', '32', 0xE6B58BE8AF95E4BFA1E681AF, '1', '2015-01-19 09:42:43', '测试信息');
INSERT INTO `t_oa_notification` VALUES ('49', '1011', '32', 0xE6B58BE8AF95, '1', '2015-01-19 09:46:35', '测试');
INSERT INTO `t_oa_notification` VALUES ('50', '1011', '17', 0xE882AFE5AE9AE5958A, '1', '2015-01-19 10:13:55', '肯定啊');
INSERT INTO `t_oa_notification` VALUES ('51', '1007', '15', 0xE697A9E4B88AE5A5BD, '1', '2015-01-22 09:05:03', '早上');
INSERT INTO `t_oa_notification` VALUES ('54', '1', '11', 0xE5B7AEE588ABE58C96E9A38EE6A0BCE58D97E4BAACE79A84E9A38EE6A0BCE591A2, '1', '2015-01-22 14:31:50', '差别');
INSERT INTO `t_oa_notification` VALUES ('55', '1', '11', 0xE5AE9DE8B4B5E79A84E4BBACE5A4A7E4B88DE4BA86E79A84E9A38EE6A0BCE5928C, '1', '2015-01-22 14:54:51', '的们');
INSERT INTO `t_oa_notification` VALUES ('56', '1', '11', 0xE79A84E58D8EE6B6A6E696B9E5A4A9E794BBE6889FE584BFE7ABA5E5928C, '1', '2015-01-22 14:57:33', '风格和法国');
INSERT INTO `t_oa_notification` VALUES ('57', '1', '11', 0xE8BF99E698AFE6B58BE8AF95E9809AE79FA5E8BF99E698AFE6B58BE8AF95E9809AE79FA5E8BF99E698AFE6B58BE8AF95E9809AE79FA5E8BF99E698AFE6B58BE8AF95E9809AE79FA5, '0', '2015-01-23 10:36:17', '这是测试通知');
INSERT INTO `t_oa_notification` VALUES ('58', '1', '11', 0xE8BF99E698AFE4B8AAE696B0E79A84E9809AE79FA5, '1', '2015-01-23 10:51:00', '通知');
INSERT INTO `t_oa_notification` VALUES ('65', '1', '11', 0xE788BDE882A4E6B0B4E79A84E8AFA5E59CB0E59D97E4BCB0E8AEA1E698AF, '1', '2015-01-23 11:30:16', '新的额');
INSERT INTO `t_oa_notification` VALUES ('66', null, null, null, '0', '2015-01-28 10:45:26', '防水袋');
INSERT INTO `t_oa_notification` VALUES ('67', '4', '13', 0x33, '1', '2015-01-28 10:46:37', '3');
INSERT INTO `t_oa_notification` VALUES ('71', '1', '11', 0x3C703EE585B3E4BA8EE58AA0E5BCBAE4BB80E4B988E4BB80E4B988E79A84E9809AE79FA53C2F703E0D0A0D0A3C703E266E6273703B20266E6273703BE5908CE5BF97E4BBACEFBC8CE68EA5E4B88BE69DA520266E6273703BE4BDA0E4BBACE8A681E6B3A8E6848FE982A3E4BB80E4B988EFBC8CE8BF98E69C89E982A3E4BB80E4B98820E698AFE590A720266E6273703B3C2F703E0D0A0D0A3C703EE5B0B1E8BF99E6A0B7E590A720266E6273703BE5A4A7E5AEB6E8B0A8E8AEB03C2F703E0D0A2C3C703EE585B3E4BA8EE58AA0E5BCBAE4BB80E4B988E4BB80E4B988E79A84E9809AE79FA53C2F703E0D0A0D0A3C703E266E6273703B20266E6273703BE5908CE5BF97E4BBACEFBC8CE68EA5E4B88BE69DA520266E6273703BE4BDA0E4BBACE8A681E6B3A8E6848FE982A3E4BB80E4B988EFBC8CE8BF98E69C89E982A3E4BB80E4B98820E698AFE590A720266E6273703B3C2F703E0D0A0D0A3C703EE5B0B1E8BF99E6A0B7E590A720266E6273703BE5A4A7E5AEB6E8B0A8E8AEB03C2F703E0D0A, '1', '2015-01-29 14:59:24', '测试测试111');
INSERT INTO `t_oa_notification` VALUES ('73', null, null, null, '1', '2015-01-29 15:06:12', '通知标题: 他');
INSERT INTO `t_oa_notification` VALUES ('74', '1', '11', 0x3C703EE59BBEE7898720266E6273703B3C7374726F6E673EE69DA5E6B58BE8AF95E4B880E9818D203C2F7374726F6E673E266E6273703B20E591BCE591BCE591BC3C2F703E0D0A0D0A3C703E3C696D67207372633D22626C6F623A687474702533412F2F6C6F63616C686F7374253341383038382F39623530346131372D396466612D346662392D616531332D64383737666431653839343422202F3E3C212D2D2020202020202020202020203C74657874617265612069643D22636F6E74656E7422206E616D653D22636F6E74656E742220636C6173733D22666F726D2D636F6E74726F6C206C696D6974656422206D61786C656E6774683D223531322220726F77733D2235220D0A202020202020202020202020202020202020202020206F6E626C75723D22636865636B4C656E287468697329223E2D2D3E3C2F703E0D0A, '1', '2015-01-29 16:07:51', '来测试一遍 ');
INSERT INTO `t_oa_notification` VALUES ('75', '1', '11', 0x3C703E266E6273703B20266E6273703BE8BF99E698AFE59CA8E6B58BE8AF95E59BBEE78987E4B88AE4BCA0E592A73C2F703E0D0A0D0A3C703E266E6273703B3C2F703E0D0A0D0A3C703E3C696D6720616C743D2222207372633D22687474703A2F2F3139322E3136382E322E3231313A393030302F656F732F6170706C69636174696F6E2F6F637465742D73747265616D2F32303135303132392F35393737396330666136646430613562666631306239313366353339613861392E6A706722207374796C653D2277696474683A2031333970783B206865696768743A2031343870783B22202F3EE698AFE79A84E9A38EE6A0BCE5B0B1E698AFE6BBB4E6ACA7E88FB2E585893C212D2D2020202020202020202020203C74657874617265612069643D22636F6E74656E7422206E616D653D22636F6E74656E742220636C6173733D22666F726D2D636F6E74726F6C206C696D6974656422206D61786C656E6774683D223531322220726F77733D2235220D0A202020202020202020202020202020202020202020206F6E626C75723D22636865636B4C656E287468697329223E2D2D3E3C2F703E0D0A0D0A3C703EE698AFE79A84E9A38EE6A0BCE5B086E998BFE696AFE9A1BFE9A39EE8BF87E69DA53C2F703E0D0A, '1', '2015-01-29 16:21:11', '上传图片');
INSERT INTO `t_oa_notification` VALUES ('76', '1', '11', 0x3C703E3C696D6720616C743D2222207372633D22687474703A2F2F3139322E3136382E322E3231313A393030302F656F732F6170706C69636174696F6E2F6F637465742D73747265616D2F32303135303132392F32303739356163623139396435613339653463663466376132643663393739362E706E6722207374796C653D2277696474683A2032323070783B206865696768743A2032323070783B22202F3E61646173646173646173646173646173646173643C212D2D2020202020202020202020203C74657874617265612069643D22636F6E74656E7422206E616D653D22636F6E74656E742220636C6173733D22666F726D2D636F6E74726F6C206C696D6974656422206D61786C656E6774683D223531322220726F77733D2235220D0A202020202020202020202020202020202020202020206F6E626C75723D22636865636B4C656E287468697329223E2D2D3E3C2F703E0D0A0D0A3C703E6173646173646173643C2F703E0D0A0D0A3C703E61736461736461736461733C2F703E0D0A, '0', '2015-01-29 16:23:16', 'hkjhgfdsa');
INSERT INTO `t_oa_notification` VALUES ('78', '4', '33', 0x3C703EE6B58BE8AF95E9809AE79FA53C2F703E0D0A, '1', '2015-01-30 11:16:34', '测试通知');
INSERT INTO `t_oa_notification` VALUES ('79', '4', '33', 0x3C703EE6B58BE8AF95E9809AE79FA53C2F703E0D0A, '1', '2015-01-30 11:23:33', '测试通知');
INSERT INTO `t_oa_notification` VALUES ('80', '4', '33', 0x3C703EE6B58BE8AF95E9809AE79FA53C2F703E0D0A, '1', '2015-01-30 11:23:35', '测试通知');
INSERT INTO `t_oa_notification` VALUES ('81', '4', '15', 0x3C703EE6B58BE8AF953C2F703E0D0A, '1', '2015-01-30 11:42:25', '测试');
INSERT INTO `t_oa_notification` VALUES ('82', '4', null, 0x3C703E313C2F703E0D0A, '1', '2015-01-30 11:46:08', '1');
INSERT INTO `t_oa_notification` VALUES ('83', null, null, null, '0', '2015-01-30 11:48:28', '3');
INSERT INTO `t_oa_notification` VALUES ('86', '1', '11', 0x3C703EE4B8AAE794B5E9A5ADE994857364683C2F703E0D0A0D0A3C703EE79A84E9A38EE6A0BCE794B3E8BEBEE882A13C7374726F6E673EE59088E98082E79A843C2F7374726F6E673E3C2F703E0D0A, '1', '2015-01-30 11:51:10', '提示测试');
INSERT INTO `t_oa_notification` VALUES ('87', null, null, null, '1', '2015-01-30 13:48:16', '测试5');
INSERT INTO `t_oa_notification` VALUES ('88', null, null, null, '0', '2015-01-30 13:48:52', '测试6');
INSERT INTO `t_oa_notification` VALUES ('89', null, null, null, '0', '2015-01-30 13:49:12', '测试7');
INSERT INTO `t_oa_notification` VALUES ('90', null, null, null, '0', '2015-01-30 13:49:59', '测试8');
INSERT INTO `t_oa_notification` VALUES ('92', '4', '33', 0x3C703EE6B58BE8AF9531313C2F703E0D0A, '1', '2015-01-30 13:55:46', '测试11');
INSERT INTO `t_oa_notification` VALUES ('96', '4', '9', 0x3C703E6664733C2F703E0D0A, '1', '2015-01-30 13:58:15', 'fds');
INSERT INTO `t_oa_notification` VALUES ('97', '4', '15', 0x3C703E64733C2F703E0D0A, '1', '2015-01-30 13:58:31', 'd');
INSERT INTO `t_oa_notification` VALUES ('98', '4', '15', 0x3C703E673C2F703E0D0A, '1', '2015-01-30 13:59:30', 'g');
INSERT INTO `t_oa_notification` VALUES ('99', '4', '15', 0x3C703E723C2F703E0D0A, '1', '2015-01-30 14:00:22', 'r');
INSERT INTO `t_oa_notification` VALUES ('100', '4', '13', 0x3C703EE688BFE9A1B6E4B88A3C2F703E0D0A, '1', '2015-01-30 14:02:04', '付定金');
INSERT INTO `t_oa_notification` VALUES ('101', '7', '15', 0x3C703EE4B88BE58D88E5A5BD3C2F703E0D0A, '1', '2015-01-30 14:09:27', '下午好');
INSERT INTO `t_oa_notification` VALUES ('102', '4', '15', 0x3C703E34353C2F703E0D0A, '0', '2015-01-30 14:11:46', '45');
INSERT INTO `t_oa_notification` VALUES ('103', '4', '15', 0x3C703E35343C2F703E0D0A, '1', '2015-01-30 14:12:08', '54');
INSERT INTO `t_oa_notification` VALUES ('113', '2', '8', 0x3C703E312D3330E6B58BE8AF95E794A87E312D3330E6B58BE8AF95E794A87E312D3330E6B58BE8AF95E794A87E312D3330E6B58BE8AF95E794A87E312D3330E6B58BE8AF95E794A87E312D3330E6B58BE8AF95E794A87E312D3330E6B58BE8AF95E794A87E312D3330E6B58BE8AF95E794A87E312D3330E6B58BE8AF95E794A87E312D3330E6B58BE8AF95E794A87E312D3330E6B58BE8AF95E794A87E312D3330E6B58BE8AF95E794A87E312D3330E6B58BE8AF95E794A87E312D3330E6B58BE8AF95E794A87E3C696D6720616C743D2222207372633D22687474703A2F2F3139322E3136382E322E3231313A393030302F656F732F6170706C69636174696F6E2F6F637465742D73747265616D2F32303135303133302F32303739356163623139396435613339653463663466376132643663393739362E706E6722207374796C653D2277696474683A2032323070783B206865696768743A2032323070783B22202F3E3C2F703E0D0A, '0', '2015-01-30 15:34:00', '1-30测试用~');
INSERT INTO `t_oa_notification` VALUES ('114', '4', '33', 0x3C703EE5AFB9E696B93C696D6720616C743D2222207372633D22687474703A2F2F3139322E3136382E322E3231313A393030302F656F732F6170706C69636174696F6E2F6F637465742D73747265616D2F32303135303230322F65613934656561623430356436636163353139643137373463363664666438312E6A706722207374796C653D2277696474683A2038323370783B206865696768743A2035353070783B22202F3E3C2F703E0D0A, '1', '2015-02-02 10:53:13', '测试');
INSERT INTO `t_oa_notification` VALUES ('115', '4', '13', 0x3C703E313C2F703E0D0A, '1', '2015-02-02 10:55:26', '1');
INSERT INTO `t_oa_notification` VALUES ('116', '4', null, 0x3C68313E3C696D6720616C743D226C6175676822206865696768743D22323322207372633D22687474703A2F2F3139322E3136382E322E3231312F6564757A3130302F7374617469632F706C7567696E732F636B656469746F722F706C7567696E732F736D696C65792F696D616765732F74656574685F736D696C652E706E6722207469746C653D226C61756768222077696474683D22323322202F3E3C696D6720616C743D226D61696C22206865696768743D22323322207372633D22687474703A2F2F3139322E3136382E322E3231312F6564757A3130302F7374617469632F706C7567696E732F636B656469746F722F706C7567696E732F736D696C65792F696D616765732F656E76656C6F70652E706E6722207469746C653D226D61696C222077696474683D22323322202F3E3C696D6720616C743D22636865656B7922206865696768743D22323322207372633D22687474703A2F2F3139322E3136382E322E3231312F6564757A3130302F7374617469632F706C7567696E732F636B656469746F722F706C7567696E732F736D696C65792F696D616765732F746F6E6775655F736D696C652E706E6722207469746C653D22636865656B79222077696474683D22323322202F3EE688BFE9A1B6E4B88AE4BD9BE68CA1E69D80E4BD9B3C2F68313E0D0A0D0A3C646976207374796C653D22706167652D627265616B2D61667465723A20616C77617973223E3C7370616E207374796C653D22646973706C61793A206E6F6E653B223E266E6273703B3C2F7370616E3E3C2F6469763E0D0A0D0A3C703E266E6273703B3C2F703E0D0A, '1', '2015-02-02 11:05:26', 'f爽肤水东方闪电');
INSERT INTO `t_oa_notification` VALUES ('117', '4', null, 0x3C703E73643C2F703E0D0A, '1', '2015-02-02 11:08:23', 's');
INSERT INTO `t_oa_notification` VALUES ('118', '4', null, 0x3C703EE688BFE9A1B6E4B88A3C2F703E0D0A, '1', '2015-02-02 11:13:23', 't欧诺个只');
INSERT INTO `t_oa_notification` VALUES ('119', '4', '33', 0x3C703EE6B58BE8AF95E9809AE79FA5E4BB98E6B0B4E794B5E8B4B9E998B2E6B0B4E8A28B3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE688BFE9A1B6E4B88AE6B0B4E794B5E8B4B9E58F8CE696B9E983BDE7ACACE4B889E696B9266C6471756F3B3C696D6720616C743D2262726F6B656E20686561727422206865696768743D22323322207372633D22687474703A2F2F3139322E3136382E322E3231312F6564757A3130302F7374617469632F706C7567696E732F636B656469746F722F706C7567696E732F736D696C65792F696D616765732F62726F6B656E5F68656172742E706E6722207469746C653D2262726F6B656E206865617274222077696474683D22323322202F3E3C696D6720616C743D226E6F22206865696768743D22323322207372633D22687474703A2F2F3139322E3136382E322E3231312F6564757A3130302F7374617469632F706C7567696E732F636B656469746F722F706C7567696E732F736D696C65792F696D616765732F7468756D62735F646F776E2E706E6722207469746C653D226E6F222077696474683D22323322202F3E3C696D6720616C743D22646576696C22206865696768743D22323322207372633D22687474703A2F2F3139322E3136382E322E3231312F6564757A3130302F7374617469632F706C7567696E732F636B656469746F722F706C7567696E732F736D696C65792F696D616765732F646576696C5F736D696C652E706E6722207469746C653D22646576696C222077696474683D22323322202F3E3C2F7370616E3E3C2F703E0D0A0D0A3C646976207374796C653D22706167652D627265616B2D61667465723A20616C77617973223E3C7370616E207374796C653D22646973706C61793A206E6F6E653B223E266E6273703B3C2F7370616E3E3C2F6469763E0D0A0D0A3C703E266E6273703B3C2F703E0D0A, '1', '2015-02-02 11:15:45', '测试通知');
INSERT INTO `t_oa_notification` VALUES ('120', '4', '33', 0x3C756C207374796C653D226C6973742D7374796C652D747970653A7371756172653B223E0D0A093C6C69207374796C653D226D617267696E2D6C6566743A20343070783B223E0D0A093C68313E3C7370616E207374796C653D22666F6E742D73697A653A373270783B223EE9809AE79FA5E6B58BE8AF95313C2F7370616E3E3C2F68313E0D0A093C2F6C693E0D0A3C2F756C3E0D0A, '1', '2015-02-02 11:18:33', '通知测试1');
INSERT INTO `t_oa_notification` VALUES ('121', '7', '9', 0x3C703EE4B8ADE58D88E5A5BD3C2F703E0D0A, '1', '2015-02-02 11:34:58', '中午好');
INSERT INTO `t_oa_notification` VALUES ('122', '4', '33', 0x3C703E64732064667320266E6273703B20E58F91E79A843C2F703E0D0A, '1', '2015-02-02 11:56:48', '经费打开');
INSERT INTO `t_oa_notification` VALUES ('123', '4', '33', 0x3C703EE59CB0E696B93C2F703E0D0A, '1', '2015-02-02 11:57:58', '手机');
INSERT INTO `t_oa_notification` VALUES ('124', '7', '9', 0x3C703EE6B58BE8AF95E6898BE69CBAE79FADE4BFA13C2F703E0D0A, '1', '2015-02-02 13:43:56', '测试手机短信');
INSERT INTO `t_oa_notification` VALUES ('125', '7', '9', 0x3C703EE6B58BE8AF95E6898BE69CBAE79FADE4BFA13C2F703E0D0A, '1', '2015-02-02 13:44:06', '测试手机短信');
INSERT INTO `t_oa_notification` VALUES ('126', '7', '9', 0x3C703EE6B58BE8AF95E6898BE69CBAE79FADE4BFA13C2F703E0D0A, '1', '2015-02-02 13:44:53', '测试手机短信');
INSERT INTO `t_oa_notification` VALUES ('127', '7', '9', 0x3C703EE6B58BE8AF95E6898BE69CBAE79FADE4BFA13C2F703E0D0A, '1', '2015-02-02 13:45:07', '测试手机短信');
INSERT INTO `t_oa_notification` VALUES ('128', '7', '9', 0x3C703EE6B58BE8AF95E6898BE69CBAE79FADE4BFA13C2F703E0D0A, '1', '2015-02-02 13:45:31', '测试手机短信');
INSERT INTO `t_oa_notification` VALUES ('129', '4', '15', 0x3C703EE79A84E5A3ABE8B4B93C2F703E0D0A, '1', '2015-02-02 13:56:50', '打开');
INSERT INTO `t_oa_notification` VALUES ('130', '4', '16', 0x3C703EE696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B1803C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B180E696B9E5BC8FE69DA5E5BC80E58F91E5BBBAE8AEBEE5B1803C2F7370616E3E3C2F703E0D0A, '1', '2015-02-02 13:59:05', '测试通知内容过多，查看详情时是否有问题');
INSERT INTO `t_oa_notification` VALUES ('131', '7', null, 0x3C703E6664733C2F703E0D0A, '1', '2015-02-02 14:44:24', 'dk');
INSERT INTO `t_oa_notification` VALUES ('132', '7', null, 0x3C703E6664733C2F703E0D0A, '1', '2015-02-02 14:44:29', 'dk');
INSERT INTO `t_oa_notification` VALUES ('133', '7', null, 0x3C703E6664733C2F703E0D0A, '1', '2015-02-02 14:44:32', 'dk');
INSERT INTO `t_oa_notification` VALUES ('134', '7', null, 0x3C703E6664733C2F703E0D0A, '1', '2015-02-02 14:45:21', 'dk');
INSERT INTO `t_oa_notification` VALUES ('135', '7', null, 0x3C703E6664733C2F703E0D0A, '1', '2015-02-02 14:45:26', 'dk');
INSERT INTO `t_oa_notification` VALUES ('136', '4', '16', 0x3C703EE6B0B4E794B5E8B4B93C2F703E0D0A, '1', '2015-02-02 15:11:16', '发的');
INSERT INTO `t_oa_notification` VALUES ('138', '4', '16', 0x3C703E31323C2F703E0D0A, '1', '2015-02-02 15:11:40', '12');
INSERT INTO `t_oa_notification` VALUES ('139', '4', '15', 0x3C703E3334323C2F703E0D0A, '1', '2015-02-02 15:11:55', '21');
INSERT INTO `t_oa_notification` VALUES ('140', '4', '15', 0x3C703E3334323C2F703E0D0A, '1', '2015-02-02 15:12:02', '21');
INSERT INTO `t_oa_notification` VALUES ('141', '4', '15', 0x3C703E3334323C2F703E0D0A, '1', '2015-02-02 15:12:24', '21');
INSERT INTO `t_oa_notification` VALUES ('143', '4', '15', 0x3C703E333C2F703E0D0A, '1', '2015-02-02 16:04:15', '3');
INSERT INTO `t_oa_notification` VALUES ('144', '4', '15', 0x3C703E343C2F703E0D0A, '1', '2015-02-02 16:04:28', '4');
INSERT INTO `t_oa_notification` VALUES ('147', '4', '16', 0x3C703E323C2F703E0A, '1', '2015-02-04 09:45:23', '2');
INSERT INTO `t_oa_notification` VALUES ('148', '1', '11', 0x3C703E31323331323331333C2F703E0A, '1', '2015-02-04 10:02:41', '123123');
INSERT INTO `t_oa_notification` VALUES ('149', '1', '11', 0x3C703E6466676868683C2F703E0A, '1', '2015-02-04 10:05:16', 'ddfghhh');
INSERT INTO `t_oa_notification` VALUES ('150', '1', '11', 0x3C703EE8A784E58892E5B180E5AE98E696B9EFBC8CE8B8A9E6B2B9E997A83C2F703E0A, '1', '2015-02-04 10:14:40', '9678678');
INSERT INTO `t_oa_notification` VALUES ('151', '7', '59', 0x3C703E323C2F703E0A, '1', '2015-02-04 14:19:40', 'd');
INSERT INTO `t_oa_notification` VALUES ('152', '7', '59', 0x3C703EE79A843C2F703E0A, '1', '2015-02-04 14:27:53', '的');
INSERT INTO `t_oa_notification` VALUES ('153', '7', '52', 0x3C703E313C2F703E0A, '1', '2015-02-04 14:29:22', '1');
INSERT INTO `t_oa_notification` VALUES ('154', '4', '9', 0x3C703E353C2F703E0A, '1', '2015-02-04 15:34:57', '5');
INSERT INTO `t_oa_notification` VALUES ('155', '1', '11', 0x3C703E6C6173746C6173746C6173746C6173746C6173746C6173746C6173743C2F703E0A, '1', '2015-02-04 15:55:15', 'last');
INSERT INTO `t_oa_notification` VALUES ('156', '1', '11', 0x3C703EE5B7B2E8AFBBE69CAAE8AFBBE5B7B2E8AFBBE69CAAE8AFBBE5B7B2E8AFBBE69CAAE8AFBBE5B7B2E8AFBBE69CAAE8AFBB3C2F703E0A, '1', '2015-02-05 14:12:18', '已读未读');
INSERT INTO `t_oa_notification` VALUES ('157', '4', '9', 0x3C703EE698AFE79A84E58F91E98081E79A843C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E5A4A7E5B985E5BAA6E6B0B4E794B5E8B4B9E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A843C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A84E698AFE79A84E58F91E98081E79A843C2F7370616E3E3C2F703E0A, '1', '2015-02-06 11:00:16', '房顶上');
INSERT INTO `t_oa_notification` VALUES ('158', '4', '9', 0x3C703EE99984E8BF91E8B7AFE58FA3E6B0B4E4BA95E59D8A3C2F703E0A, '1', '2015-02-06 11:03:40', '经费金额管理会计');
INSERT INTO `t_oa_notification` VALUES ('159', '4', '9', 0x3C703EE6B58BE8AF95E698AFE590A6E694B6E588B0E9809AE79FA53C2F703E0A, '1', '2015-02-06 11:07:06', '测试是否收到通知');
INSERT INTO `t_oa_notification` VALUES ('160', '4', '9', 0x3C703E63657368693C2F703E0A, '1', '2015-02-06 11:09:00', 'ceshi');
INSERT INTO `t_oa_notification` VALUES ('161', '4', '9', 0x3C703EE998B2E6B0B4E8A28BE698AF3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AFE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C7370616E207374796C653D226C696E652D6865696768743A2032302E3739393939393233373036303570783B223EE998B2E6B0B4E8A28BE698AF3C2F7370616E3E3C2F703E0A, '1', '2015-02-06 11:16:51', '通知内容');
INSERT INTO `t_oa_notification` VALUES ('162', '4', '9', 0x3C703E736466266E6273703B3C2F703E0A, '1', '2015-02-06 11:25:55', 'fsdf ');
INSERT INTO `t_oa_notification` VALUES ('163', '4', '9', 0x3C703E736466266E6273703B3C2F703E0A, '1', '2015-02-06 11:26:07', 'dsf ');
INSERT INTO `t_oa_notification` VALUES ('164', '1', '11', 0x3C703E313233313233313233E998BFE8BEBEE5A4A7E58EA6E79A843C2F703E0A, '1', '2015-02-06 11:44:43', '阿达大厦的');
INSERT INTO `t_oa_notification` VALUES ('165', '7', '52', 0x3C703E33323C2F703E0A, '1', '2015-02-06 11:50:37', '23');
INSERT INTO `t_oa_notification` VALUES ('166', '7', '52', 0x3C703EE6B58BE8AF953133353C2F703E0A, '1', '2015-02-06 11:52:02', '测试135');
INSERT INTO `t_oa_notification` VALUES ('167', '7', '52', 0x3C703EE6B0B4E794B5E8B4B93C2F703E0A, '1', '2015-02-06 11:55:42', '对方是否');
INSERT INTO `t_oa_notification` VALUES ('168', '4', '9', 0x3C703EE4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B93C2F703E0A, '1', '2015-02-06 14:53:27', '付款了水电费付款了水电费付款了水电费付款了水电费');
INSERT INTO `t_oa_notification` VALUES ('169', '4', '9', 0x3C703EE4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B9E4BB98E6ACBEE4BA86E6B0B4E794B5E8B4B93C2F703E0A, '1', '2015-02-06 14:53:48', '付款了水电费付款了水电费付款了水电费付款了水电费');
INSERT INTO `t_oa_notification` VALUES ('170', '7', '52', 0x3C703EE9809AE79FA5E79FADE4BFA13C2F703E0A, '1', '2015-02-06 14:58:14', '通知短信');
INSERT INTO `t_oa_notification` VALUES ('171', '7', '52', 0x3C703E6475616E78696E3C2F703E0A, '1', '2015-02-06 15:01:52', 'duanxin');
INSERT INTO `t_oa_notification` VALUES ('172', '7', '52', 0x3C703EE6B58BE8AF95E79FADE4BFA1E9809AE79FA53C2F703E0A, '1', '2015-02-06 15:31:58', '测试短信通知');
INSERT INTO `t_oa_notification` VALUES ('173', '4', '35', 0x3C703EE6B0B4E794B5E8B4B93C2F703E0A, '1', '2015-02-06 15:51:06', '等所发生的');
INSERT INTO `t_oa_notification` VALUES ('174', '4', '9', 0x3C703EE6B0B4E794B5E8B4B93C2F703E0A, '1', '2015-02-06 15:51:52', '付水电费');
INSERT INTO `t_oa_notification` VALUES ('175', '7', '52', 0x3C703EE79FADE4BFA1E6B58BE8AF95E79FADE4BFA1E6B58BE8AF95E79FADE4BFA1E6B58BE8AF953C2F703E0A, '1', '2015-02-06 15:52:01', '短信测试');
INSERT INTO `t_oa_notification` VALUES ('176', '7', '52', 0x3C703EE79FADE4BFA1E6B58BE8AF95E79FADE4BFA1E6B58BE8AF95E79FADE4BFA1E6B58BE8AF953C2F703E0A, '1', '2015-02-06 15:55:09', '短信测试');
INSERT INTO `t_oa_notification` VALUES ('177', '7', '52', 0x3C703EE79FADE4BFA1E6B58BE8AF95E79FADE4BFA1E6B58BE8AF95E79FADE4BFA1E6B58BE8AF953C2F703E0A, '1', '2015-02-06 15:56:36', '短信测试');
INSERT INTO `t_oa_notification` VALUES ('178', '1', '9', 0x3C703EE79FADE4BFA1E79FADE4BFA1E79FADE4BFA1E79FADE4BFA1E79FADE4BFA1E79FADE4BFA1E79FADE4BFA1E79FADE4BFA13C2F703E0A, '1', '2015-02-06 15:59:36', '短信短信');
INSERT INTO `t_oa_notification` VALUES ('179', '1', '9', 0x3C703E64736768266E6273703B3C2F703E0A, '1', '2015-02-06 16:02:54', 'sdg ');
INSERT INTO `t_oa_notification` VALUES ('180', '1', '9', 0x3C703E64666768266E6273703B3C2F703E0A, '1', '2015-02-06 16:03:58', 'er ');
INSERT INTO `t_oa_notification` VALUES ('181', '1', '9', 0x3C703E666768266E6273703B3C2F703E0A, '1', '2015-02-06 16:05:36', 'sdg ');
INSERT INTO `t_oa_notification` VALUES ('182', '1', '9', 0x3C703E6464643C2F703E0A, '1', '2015-02-06 16:08:27', 'ddd');
INSERT INTO `t_oa_notification` VALUES ('183', '1', '9', 0x3C703E64646464783C2F703E0A, '1', '2015-02-06 16:09:49', 'ddddx');
INSERT INTO `t_oa_notification` VALUES ('184', '1', '9', 0x3C703EE79FADE4BFA1E58F91E98081E79FADE4BFA1E58F91E98081E79FADE4BFA1E58F91E980813C2F703E0A, '1', '2015-02-06 16:12:07', '短信发送');
INSERT INTO `t_oa_notification` VALUES ('185', '4', '9', 0x3C703EE6B0B4E794B5E8B4B93C2F703E0A, '1', '2015-02-06 16:19:22', '9999999999999999999');
INSERT INTO `t_oa_notification` VALUES ('186', '4', '9', 0x3C703E38383838383838383838383838383838383838383C2F703E0A, '1', '2015-02-06 16:19:48', '88888888888888888888');
INSERT INTO `t_oa_notification` VALUES ('187', '4', '9', 0x3C703E6473666768266E6273703B3C2F703E0A, '1', '2015-02-06 16:25:22', 'ety ');
INSERT INTO `t_oa_notification` VALUES ('188', '4', '9', 0x3C703E6473666768266E6273703B3C2F703E0A, '1', '2015-02-06 16:25:42', 'ety ');
INSERT INTO `t_oa_notification` VALUES ('189', '4', '9', 0x3C703E6473666768266E6273703B3C2F703E0A, '1', '2015-02-06 16:25:52', 'ety ');
INSERT INTO `t_oa_notification` VALUES ('190', '4', '9', 0x3C703E7364682073643C2F703E0A, '1', '2015-02-06 16:26:39', 'dfsh ');
INSERT INTO `t_oa_notification` VALUES ('191', '4', '9', 0x3C703EE8A784E58892E5B180E5AE98E696B93C2F703E0A, '1', '2015-02-06 16:33:06', '偶遇');
INSERT INTO `t_oa_notification` VALUES ('192', '4', '9', 0x3C703EE8A784E58892E5B180E5AE98E696B93C2F703E0A, '1', '2015-02-06 16:34:42', '偶遇');
INSERT INTO `t_oa_notification` VALUES ('193', '4', '9', 0x3C703EE8A784E58892E5B180E5AE98E696B93C2F703E0A, '1', '2015-02-06 16:35:35', '偶遇规范化');
INSERT INTO `t_oa_notification` VALUES ('194', '4', '9', 0x3C703EE9809AE79FA53C2F703E0A, '1', '2015-02-06 16:39:19', '通知');
INSERT INTO `t_oa_notification` VALUES ('195', '4', '9', 0x3C703EE5AFB9E696B9E698AFE590A63C2F703E0A, '1', '2015-02-06 16:39:34', '佛挡杀佛');
INSERT INTO `t_oa_notification` VALUES ('196', '4', '34', 0x3C703E67657265777220773C2F703E0A, '1', '2015-02-06 16:41:22', 'kdsj ');
INSERT INTO `t_oa_notification` VALUES ('197', '4', '9', 0x3C703EE6B58BE8AF95E9809AE79FA53C2F703E0A, '1', '2015-02-09 08:55:35', '测试通知');
INSERT INTO `t_oa_notification` VALUES ('198', '2', '8', 0x3C703EE6B58BE8AF95E9809AE79FA5323C2F703E0A, '1', '2015-02-09 08:57:18', '测试通知2');
INSERT INTO `t_oa_notification` VALUES ('199', '1', '9', 0x3C703EE58F91E58F91E58F913C2F703E0A, '1', '2015-02-09 09:22:14', '发发发');
INSERT INTO `t_oa_notification` VALUES ('200', '7', '52', 0x3C703EE7BB9961646D696EE79A84E9809AE79FA5E7BB9961646D696EE79A84E9809AE79FA53C2F703E0A, '1', '2015-02-09 09:29:18', '给admin的通知');
INSERT INTO `t_oa_notification` VALUES ('201', '4', '9', 0x3C703E313C2F703E0A, '1', '2015-02-09 09:33:09', '1');
INSERT INTO `t_oa_notification` VALUES ('202', '4', '34', 0x3C703E323C2F703E0A, '1', '2015-02-10 08:55:43', '21');
INSERT INTO `t_oa_notification` VALUES ('203', '4', '35', 0x3C703E33343C2F703E0A, '1', '2015-02-10 08:56:12', '43');
INSERT INTO `t_oa_notification` VALUES ('204', '1', '9', 0x3C703EE59084E4BD8DE8AFB7E6B3A8E6848FEFBC8CE78EB0E59CA8E8BF9BE8A18CE7B3BBE7BB9FE79A84E58D87E7BAA73C6272202F3E0A266E6273703B3C2F703E0A, '1', '2015-02-10 09:54:51', '临澧升级');
INSERT INTO `t_oa_notification` VALUES ('206', '2', '9', 0x3C703EE6B58BE8AF95E7BB99E5A49AE4BABAE58F91E98081E9809AE79FA53C2F703E0A, '1', '2015-02-10 10:28:57', '测试给多人发送通知');
INSERT INTO `t_oa_notification` VALUES ('209', '7', '37', 0x3C703EE9809AE79FA5413C2F703E0A, '1', '2015-02-10 14:14:52', '通知A');
INSERT INTO `t_oa_notification` VALUES ('210', '4', '9', 0x3C703EE58F91E98081E9809AE79FA53C2F703E0A, '1', '2015-02-10 14:58:49', '发送通知');
INSERT INTO `t_oa_notification` VALUES ('211', '1', '9', 0x3C703E737364663C2F703E0A, '1', '2015-02-10 16:31:57', 'sdsdfdd');
INSERT INTO `t_oa_notification` VALUES ('212', '7', '37', 0x3C703E31E6B58BE8AF95E9809AE79FA53C2F703E0A, '1', '2015-02-10 16:34:46', '1测试通知');
INSERT INTO `t_oa_notification` VALUES ('213', '7', '37', 0x3C703E32E6B58BE8AF95E9809AE79FA53C2F703E0A, '1', '2015-02-10 16:35:45', '2测试通知');
INSERT INTO `t_oa_notification` VALUES ('214', '7', '37', 0x3C703E32E6B58BE8AF95E9809AE79FA53C2F703E0A, '1', '2015-02-10 16:35:45', '2测试通知');
INSERT INTO `t_oa_notification` VALUES ('215', '4', '35', 0x3C703E3233333C2F703E0A, '1', '2015-02-10 16:44:18', '21');
INSERT INTO `t_oa_notification` VALUES ('216', '7', '52', 0x3C703EE8B685E7BAA7E7AEA1E79086E5919820E4BDA0E79C8BE588B0E4BA86E590A73C2F703E0A, '1', '2015-02-10 16:49:51', '超级管理员');
INSERT INTO `t_oa_notification` VALUES ('217', '4', '34', 0x3C703EE6B58BE8AF95E9809AE79FA53C2F703E0A, '1', '2015-02-11 10:29:01', '测试通知');
INSERT INTO `t_oa_notification` VALUES ('218', '4', '9', 0x3C703EE6B58BE8AF95E9809AE79FA5323C2F703E0A, '1', '2015-02-11 10:29:31', '测试通知2');
INSERT INTO `t_oa_notification` VALUES ('219', '1', '9', 0x3C703EE58F91E79A843C2F703E0A, '1', '2015-02-11 11:00:15', '库房里谁地方库房里谁地方库房里谁地方库房里谁地方库房里谁地方库房里谁地方库房里谁地方库房里谁地方地方税水电费库房里谁地方房顶上你');
INSERT INTO `t_oa_notification` VALUES ('220', '4', '9', 0x3C703E33323C2F703E0A, '1', '2015-02-11 11:44:01', '32');
INSERT INTO `t_oa_notification` VALUES ('221', '4', '9', 0x3C703E7364266E6273703B3C2F703E0A, '1', '2015-02-11 11:44:41', 'gsd');
INSERT INTO `t_oa_notification` VALUES ('223', '4', '9', 0x3C703E64663C2F703E0A, '1', '2015-02-11 11:49:16', 'df');
INSERT INTO `t_oa_notification` VALUES ('224', '4', '34', 0x3C703EE9809AE79FA5E6B58BE8AF953C2F703E0A, '1', '2015-02-11 16:26:54', '通知测试');
INSERT INTO `t_oa_notification` VALUES ('225', '1', '9', 0x3C703E64673C2F703E0A, '1', '2015-02-12 16:59:30', 'ss');
INSERT INTO `t_oa_notification` VALUES ('226', '4', '9', 0x3C703E3233343C2F703E0A, '1', '2015-02-13 09:37:40', '3');
INSERT INTO `t_oa_notification` VALUES ('227', '7', '38', 0x3C703EE9809AE79FA5E6B58BE8AF95413C2F703E0A, '1', '2015-02-14 14:25:33', '通知测试A');
INSERT INTO `t_oa_notification` VALUES ('228', '7', '37', 0x3C703EE9809AE79FA5E6B58BE8AF95413C2F703E0A, '1', '2015-02-14 14:26:34', '通知测试A');
INSERT INTO `t_oa_notification` VALUES ('229', '4', '9', 0x3C703E31323C2F703E0A, '1', '2015-02-14 14:29:19', '12');
INSERT INTO `t_oa_notification` VALUES ('230', '7', '52', 0x3C703E323C2F703E0A, '1', '2015-02-14 14:31:10', '2');
INSERT INTO `t_oa_notification` VALUES ('231', '7', '52', 0x3C703E313C2F703E0A, '1', '2015-02-14 14:31:21', '1');
INSERT INTO `t_oa_notification` VALUES ('233', '7', '37', 0x3C703EE5958AE5958AE5958A3C2F703E0A, '1', '2015-02-14 14:35:20', '你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你');
INSERT INTO `t_oa_notification` VALUES ('234', '7', '37', 0x3C703E443C2F703E0A, '1', '2015-02-14 14:36:48', 'D');
INSERT INTO `t_oa_notification` VALUES ('235', '7', '52', 0x3C703E433C2F703E0A, '1', '2015-02-14 14:37:07', 'C');
INSERT INTO `t_oa_notification` VALUES ('236', '7', '52', 0x3C703E423C2F703E0A, '1', '2015-02-14 14:37:20', 'B');
INSERT INTO `t_oa_notification` VALUES ('237', '7', '38', 0x3C703E413C2F703E0A, '1', '2015-02-14 14:37:35', 'A');
INSERT INTO `t_oa_notification` VALUES ('238', '7', '52', 0x3C703EE698AF3C2F703E0A, '1', '2015-02-14 14:40:27', '就是就是水电费就是就是水电费就是就是水电费就是就是水电费就是就是水电费就是就是水电费就是就是水电费就是就是水电费就是就是水电费就');
INSERT INTO `t_oa_notification` VALUES ('239', '7', '52', 0x3C703E41413C2F703E0A, '1', '2015-02-14 14:45:23', 'AA');
INSERT INTO `t_oa_notification` VALUES ('240', '7', '52', 0x3C703E41413C2F703E0A, '1', '2015-02-14 14:45:52', 'AA');
INSERT INTO `t_oa_notification` VALUES ('241', '7', '52', 0x3C703E41413C2F703E0A, '1', '2015-02-14 14:46:06', 'AA');
INSERT INTO `t_oa_notification` VALUES ('242', '7', '52', 0x3C703E42423C2F703E0A, '1', '2015-02-14 14:46:47', 'BB');
INSERT INTO `t_oa_notification` VALUES ('243', '7', '52', 0x3C703E42423C2F703E0A, '1', '2015-02-14 14:47:02', 'BB');
INSERT INTO `t_oa_notification` VALUES ('244', '4', '9', 0x3C703E43433C2F703E0A, '1', '2015-02-14 14:58:53', 'CC');
INSERT INTO `t_oa_notification` VALUES ('245', '2', '9', 0x3C703E44443C2F703E0A, '1', '2015-02-14 15:01:42', 'DD');
INSERT INTO `t_oa_notification` VALUES ('246', '1', '9', 0x3C703E736466676767673C2F703E0A, '1', '2015-02-27 09:06:39', 'sdfg');
INSERT INTO `t_oa_notification` VALUES ('247', '4', '9', 0x3C703E3332343C2F703E0A, '1', '2015-02-27 11:03:14', '12');

-- ----------------------------
-- Table structure for `t_oa_notification_file`
-- ----------------------------
DROP TABLE IF EXISTS `t_oa_notification_file`;
CREATE TABLE `t_oa_notification_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileurl` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `filetype` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `filename` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `filesize` double DEFAULT NULL,
  `notid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_oa_notification_file
-- ----------------------------

-- ----------------------------
-- Table structure for `t_oa_notification_history`
-- ----------------------------
DROP TABLE IF EXISTS `t_oa_notification_history`;
CREATE TABLE `t_oa_notification_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RECIPIENT` int(11) DEFAULT NULL COMMENT '接受者id',
  `DATE` datetime DEFAULT NULL COMMENT '发送日期',
  `NOTIFICATIONID` int(11) DEFAULT NULL COMMENT '通知id',
  `ISREAD` int(1) DEFAULT NULL COMMENT '是否已读(0:未读 1:已读)',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=587 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_oa_notification_history
-- ----------------------------
INSERT INTO `t_oa_notification_history` VALUES ('10', '1', '2014-12-25 17:00:14', '3', '0');
INSERT INTO `t_oa_notification_history` VALUES ('13', '1', '2014-12-26 13:46:05', '41', '1');
INSERT INTO `t_oa_notification_history` VALUES ('15', '2', '2015-01-19 09:22:25', '46', '0');
INSERT INTO `t_oa_notification_history` VALUES ('17', '2', '2015-01-19 09:46:35', '49', '1');
INSERT INTO `t_oa_notification_history` VALUES ('18', '1', '2015-01-22 14:32:56', '54', '1');
INSERT INTO `t_oa_notification_history` VALUES ('19', '2', '2015-01-22 14:32:56', '54', '1');
INSERT INTO `t_oa_notification_history` VALUES ('20', '4', '2015-01-22 14:32:56', '54', '1');
INSERT INTO `t_oa_notification_history` VALUES ('21', '1003', '2015-01-22 14:32:56', '54', '0');
INSERT INTO `t_oa_notification_history` VALUES ('22', '1004', '2015-01-22 14:32:56', '54', '0');
INSERT INTO `t_oa_notification_history` VALUES ('23', '1005', '2015-01-22 14:32:56', '54', '0');
INSERT INTO `t_oa_notification_history` VALUES ('24', '1007', '2015-01-22 14:32:56', '54', '0');
INSERT INTO `t_oa_notification_history` VALUES ('25', '1008', '2015-01-22 14:32:56', '54', '0');
INSERT INTO `t_oa_notification_history` VALUES ('26', '1009', '2015-01-22 14:32:56', '54', '0');
INSERT INTO `t_oa_notification_history` VALUES ('27', '1011', '2015-01-22 14:32:56', '54', '1');
INSERT INTO `t_oa_notification_history` VALUES ('28', '1013', '2015-01-22 14:32:56', '54', '0');
INSERT INTO `t_oa_notification_history` VALUES ('33', '1', '2015-01-22 14:56:03', '55', '1');
INSERT INTO `t_oa_notification_history` VALUES ('34', '2', '2015-01-22 14:56:03', '55', '1');
INSERT INTO `t_oa_notification_history` VALUES ('35', '1007', '2015-01-22 14:56:03', '55', '0');
INSERT INTO `t_oa_notification_history` VALUES ('36', '1008', '2015-01-22 14:56:03', '55', '0');
INSERT INTO `t_oa_notification_history` VALUES ('37', '1011', '2015-01-22 14:56:03', '55', '1');
INSERT INTO `t_oa_notification_history` VALUES ('38', '1013', '2015-01-22 14:56:03', '55', '0');
INSERT INTO `t_oa_notification_history` VALUES ('40', '1', '2015-01-22 14:58:35', '56', '1');
INSERT INTO `t_oa_notification_history` VALUES ('41', '2', '2015-01-22 14:58:35', '56', '1');
INSERT INTO `t_oa_notification_history` VALUES ('42', '1007', '2015-01-22 14:58:35', '56', '0');
INSERT INTO `t_oa_notification_history` VALUES ('43', '1008', '2015-01-22 14:58:35', '56', '0');
INSERT INTO `t_oa_notification_history` VALUES ('44', '1011', '2015-01-22 14:58:35', '56', '1');
INSERT INTO `t_oa_notification_history` VALUES ('45', '1013', '2015-01-22 14:58:35', '56', '0');
INSERT INTO `t_oa_notification_history` VALUES ('47', '1', '2015-01-23 10:37:24', '57', '1');
INSERT INTO `t_oa_notification_history` VALUES ('48', '2', '2015-01-23 10:37:24', '57', '1');
INSERT INTO `t_oa_notification_history` VALUES ('49', '4', '2015-01-23 10:37:24', '57', '1');
INSERT INTO `t_oa_notification_history` VALUES ('50', '1003', '2015-01-23 10:37:24', '57', '0');
INSERT INTO `t_oa_notification_history` VALUES ('51', '1004', '2015-01-23 10:37:24', '57', '0');
INSERT INTO `t_oa_notification_history` VALUES ('52', '1005', '2015-01-23 10:37:24', '57', '0');
INSERT INTO `t_oa_notification_history` VALUES ('53', '1007', '2015-01-23 10:37:24', '57', '0');
INSERT INTO `t_oa_notification_history` VALUES ('54', '1008', '2015-01-23 10:37:24', '57', '0');
INSERT INTO `t_oa_notification_history` VALUES ('55', '1009', '2015-01-23 10:37:24', '57', '0');
INSERT INTO `t_oa_notification_history` VALUES ('56', '1011', '2015-01-23 10:37:24', '57', '1');
INSERT INTO `t_oa_notification_history` VALUES ('57', '1013', '2015-01-23 10:37:24', '57', '0');
INSERT INTO `t_oa_notification_history` VALUES ('62', '1', '2015-01-23 10:52:10', '58', '1');
INSERT INTO `t_oa_notification_history` VALUES ('63', '2', '2015-01-23 10:52:10', '58', '1');
INSERT INTO `t_oa_notification_history` VALUES ('64', '4', '2015-01-23 10:52:10', '58', '1');
INSERT INTO `t_oa_notification_history` VALUES ('65', '1003', '2015-01-23 10:52:10', '58', '0');
INSERT INTO `t_oa_notification_history` VALUES ('66', '1004', '2015-01-23 10:52:10', '58', '0');
INSERT INTO `t_oa_notification_history` VALUES ('67', '1005', '2015-01-23 10:52:10', '58', '0');
INSERT INTO `t_oa_notification_history` VALUES ('68', '1007', '2015-01-23 10:52:10', '58', '0');
INSERT INTO `t_oa_notification_history` VALUES ('69', '1008', '2015-01-23 10:52:10', '58', '0');
INSERT INTO `t_oa_notification_history` VALUES ('70', '1009', '2015-01-23 10:52:10', '58', '0');
INSERT INTO `t_oa_notification_history` VALUES ('71', '1011', '2015-01-23 10:52:10', '58', '1');
INSERT INTO `t_oa_notification_history` VALUES ('72', '1013', '2015-01-23 10:52:10', '58', '0');
INSERT INTO `t_oa_notification_history` VALUES ('77', '2', '2015-01-23 10:56:11', '59', '0');
INSERT INTO `t_oa_notification_history` VALUES ('78', '4', '2015-01-23 10:56:11', '59', '0');
INSERT INTO `t_oa_notification_history` VALUES ('79', '1007', '2015-01-23 10:56:11', '59', '0');
INSERT INTO `t_oa_notification_history` VALUES ('80', '1', '2015-01-23 10:58:13', '60', '0');
INSERT INTO `t_oa_notification_history` VALUES ('81', '2', '2015-01-23 10:58:13', '60', '0');
INSERT INTO `t_oa_notification_history` VALUES ('82', '4', '2015-01-23 10:58:13', '60', '0');
INSERT INTO `t_oa_notification_history` VALUES ('83', '1003', '2015-01-23 10:58:13', '60', '0');
INSERT INTO `t_oa_notification_history` VALUES ('84', '1004', '2015-01-23 10:58:13', '60', '0');
INSERT INTO `t_oa_notification_history` VALUES ('85', '1005', '2015-01-23 10:58:13', '60', '0');
INSERT INTO `t_oa_notification_history` VALUES ('86', '1007', '2015-01-23 10:58:13', '60', '0');
INSERT INTO `t_oa_notification_history` VALUES ('87', '1008', '2015-01-23 10:58:13', '60', '0');
INSERT INTO `t_oa_notification_history` VALUES ('88', '1009', '2015-01-23 10:58:13', '60', '0');
INSERT INTO `t_oa_notification_history` VALUES ('89', '1011', '2015-01-23 10:58:13', '60', '0');
INSERT INTO `t_oa_notification_history` VALUES ('90', '1013', '2015-01-23 10:58:13', '60', '0');
INSERT INTO `t_oa_notification_history` VALUES ('95', '2', '2015-01-23 11:00:14', '61', '0');
INSERT INTO `t_oa_notification_history` VALUES ('96', '4', '2015-01-23 11:00:14', '61', '0');
INSERT INTO `t_oa_notification_history` VALUES ('97', '1007', '2015-01-23 11:00:14', '61', '0');
INSERT INTO `t_oa_notification_history` VALUES ('98', '2', '2015-01-23 11:05:36', '62', '0');
INSERT INTO `t_oa_notification_history` VALUES ('99', '4', '2015-01-23 11:05:36', '62', '0');
INSERT INTO `t_oa_notification_history` VALUES ('100', '1007', '2015-01-23 11:05:36', '62', '0');
INSERT INTO `t_oa_notification_history` VALUES ('101', '2', '2015-01-23 11:22:38', '63', '0');
INSERT INTO `t_oa_notification_history` VALUES ('102', '4', '2015-01-23 11:22:38', '63', '0');
INSERT INTO `t_oa_notification_history` VALUES ('103', '1007', '2015-01-23 11:22:38', '63', '0');
INSERT INTO `t_oa_notification_history` VALUES ('104', '2', '2015-01-23 11:26:31', '64', '0');
INSERT INTO `t_oa_notification_history` VALUES ('105', '4', '2015-01-23 11:26:31', '64', '0');
INSERT INTO `t_oa_notification_history` VALUES ('106', '1007', '2015-01-23 11:26:31', '64', '0');
INSERT INTO `t_oa_notification_history` VALUES ('107', '2', '2015-01-23 11:31:19', '65', '1');
INSERT INTO `t_oa_notification_history` VALUES ('108', '4', '2015-01-23 11:31:19', '65', '1');
INSERT INTO `t_oa_notification_history` VALUES ('109', '1007', '2015-01-23 11:31:19', '65', '0');
INSERT INTO `t_oa_notification_history` VALUES ('110', '5', '2015-01-28 10:45:26', '66', '0');
INSERT INTO `t_oa_notification_history` VALUES ('111', '5', '2015-01-28 10:46:37', '67', '0');
INSERT INTO `t_oa_notification_history` VALUES ('112', '1', '2015-01-29 14:54:50', '68', '1');
INSERT INTO `t_oa_notification_history` VALUES ('113', '4', '2015-01-29 14:54:50', '68', '0');
INSERT INTO `t_oa_notification_history` VALUES ('114', '6', '2015-01-29 14:54:50', '68', '0');
INSERT INTO `t_oa_notification_history` VALUES ('115', '1', '2015-01-29 14:56:53', '69', '1');
INSERT INTO `t_oa_notification_history` VALUES ('116', '4', '2015-01-29 14:56:53', '69', '0');
INSERT INTO `t_oa_notification_history` VALUES ('117', '6', '2015-01-29 14:56:53', '69', '0');
INSERT INTO `t_oa_notification_history` VALUES ('118', '1', '2015-01-29 14:58:51', '70', '1');
INSERT INTO `t_oa_notification_history` VALUES ('119', '1', '2015-01-29 15:00:32', '71', '1');
INSERT INTO `t_oa_notification_history` VALUES ('120', '4', '2015-01-29 15:00:32', '71', '1');
INSERT INTO `t_oa_notification_history` VALUES ('121', '6', '2015-01-29 15:00:32', '71', '0');
INSERT INTO `t_oa_notification_history` VALUES ('122', '1', '2015-01-29 15:06:21', '72', '1');
INSERT INTO `t_oa_notification_history` VALUES ('123', '4', '2015-01-29 15:06:21', '72', '0');
INSERT INTO `t_oa_notification_history` VALUES ('124', '6', '2015-01-29 15:06:21', '72', '0');
INSERT INTO `t_oa_notification_history` VALUES ('125', '1', '2015-01-29 15:07:19', '73', '1');
INSERT INTO `t_oa_notification_history` VALUES ('126', '4', '2015-01-29 15:07:19', '73', '1');
INSERT INTO `t_oa_notification_history` VALUES ('127', '6', '2015-01-29 15:07:19', '73', '0');
INSERT INTO `t_oa_notification_history` VALUES ('128', '1', '2015-01-29 16:08:58', '74', '1');
INSERT INTO `t_oa_notification_history` VALUES ('129', '4', '2015-01-29 16:08:58', '74', '1');
INSERT INTO `t_oa_notification_history` VALUES ('130', '6', '2015-01-29 16:08:58', '74', '0');
INSERT INTO `t_oa_notification_history` VALUES ('131', '1', '2015-01-29 16:22:18', '75', '1');
INSERT INTO `t_oa_notification_history` VALUES ('132', '4', '2015-01-29 16:22:18', '75', '1');
INSERT INTO `t_oa_notification_history` VALUES ('133', '6', '2015-01-29 16:22:18', '75', '0');
INSERT INTO `t_oa_notification_history` VALUES ('134', '1', '2015-01-29 16:24:23', '76', '1');
INSERT INTO `t_oa_notification_history` VALUES ('135', '2', '2015-01-29 16:24:23', '76', '1');
INSERT INTO `t_oa_notification_history` VALUES ('136', '3', '2015-01-29 16:24:23', '76', '0');
INSERT INTO `t_oa_notification_history` VALUES ('137', '4', '2015-01-29 16:24:23', '76', '1');
INSERT INTO `t_oa_notification_history` VALUES ('138', '6', '2015-01-29 16:24:23', '76', '1');
INSERT INTO `t_oa_notification_history` VALUES ('141', '4', '2015-01-30 11:42:25', '81', '1');
INSERT INTO `t_oa_notification_history` VALUES ('142', '7', '2015-01-30 11:42:25', '81', '1');
INSERT INTO `t_oa_notification_history` VALUES ('144', '7', '2015-01-30 11:48:28', '83', '1');
INSERT INTO `t_oa_notification_history` VALUES ('145', '1', '2015-01-30 11:51:15', '84', '0');
INSERT INTO `t_oa_notification_history` VALUES ('146', '4', '2015-01-30 11:51:15', '84', '0');
INSERT INTO `t_oa_notification_history` VALUES ('147', '6', '2015-01-30 11:51:15', '84', '0');
INSERT INTO `t_oa_notification_history` VALUES ('148', '7', '2015-01-30 11:51:15', '84', '0');
INSERT INTO `t_oa_notification_history` VALUES ('152', '1', '2015-01-30 11:51:38', '85', '0');
INSERT INTO `t_oa_notification_history` VALUES ('153', '4', '2015-01-30 11:51:38', '85', '0');
INSERT INTO `t_oa_notification_history` VALUES ('154', '6', '2015-01-30 11:51:38', '85', '0');
INSERT INTO `t_oa_notification_history` VALUES ('155', '7', '2015-01-30 11:51:38', '85', '0');
INSERT INTO `t_oa_notification_history` VALUES ('159', '1', '2015-01-30 11:52:19', '86', '1');
INSERT INTO `t_oa_notification_history` VALUES ('160', '4', '2015-01-30 11:52:19', '86', '1');
INSERT INTO `t_oa_notification_history` VALUES ('161', '6', '2015-01-30 11:52:19', '86', '1');
INSERT INTO `t_oa_notification_history` VALUES ('162', '7', '2015-01-30 11:52:19', '86', '1');
INSERT INTO `t_oa_notification_history` VALUES ('166', '7', '2015-01-30 13:48:16', '87', '1');
INSERT INTO `t_oa_notification_history` VALUES ('167', '7', '2015-01-30 13:48:52', '88', '1');
INSERT INTO `t_oa_notification_history` VALUES ('168', '7', '2015-01-30 13:49:12', '89', '1');
INSERT INTO `t_oa_notification_history` VALUES ('169', '7', '2015-01-30 13:49:59', '90', '1');
INSERT INTO `t_oa_notification_history` VALUES ('170', '7', '2015-01-30 13:55:19', '91', '0');
INSERT INTO `t_oa_notification_history` VALUES ('171', '7', '2015-01-30 13:55:46', '92', '1');
INSERT INTO `t_oa_notification_history` VALUES ('172', '7', '2015-01-30 13:56:08', '93', '0');
INSERT INTO `t_oa_notification_history` VALUES ('173', '7', '2015-01-30 13:56:35', '94', '0');
INSERT INTO `t_oa_notification_history` VALUES ('174', '7', '2015-01-30 13:57:35', '95', '0');
INSERT INTO `t_oa_notification_history` VALUES ('175', '7', '2015-01-30 13:58:15', '96', '1');
INSERT INTO `t_oa_notification_history` VALUES ('176', '7', '2015-01-30 13:59:30', '98', '1');
INSERT INTO `t_oa_notification_history` VALUES ('177', '7', '2015-01-30 14:00:22', '99', '1');
INSERT INTO `t_oa_notification_history` VALUES ('178', '7', '2015-01-30 14:02:04', '100', '1');
INSERT INTO `t_oa_notification_history` VALUES ('179', '7', '2015-01-30 14:09:27', '101', '1');
INSERT INTO `t_oa_notification_history` VALUES ('180', '7', '2015-01-30 14:11:46', '102', '1');
INSERT INTO `t_oa_notification_history` VALUES ('181', '7', '2015-01-30 14:12:08', '103', '1');
INSERT INTO `t_oa_notification_history` VALUES ('182', '7', '2015-01-30 14:21:09', '105', '1');
INSERT INTO `t_oa_notification_history` VALUES ('183', '7', '2015-01-30 14:21:30', '106', '1');
INSERT INTO `t_oa_notification_history` VALUES ('184', '7', '2015-01-30 14:21:56', '107', '1');
INSERT INTO `t_oa_notification_history` VALUES ('185', '7', '2015-01-30 14:22:03', '108', '1');
INSERT INTO `t_oa_notification_history` VALUES ('186', '7', '2015-01-30 14:23:02', '109', '1');
INSERT INTO `t_oa_notification_history` VALUES ('187', '7', '2015-01-30 14:23:11', '110', '1');
INSERT INTO `t_oa_notification_history` VALUES ('188', '7', '2015-01-30 14:23:18', '111', '1');
INSERT INTO `t_oa_notification_history` VALUES ('189', '7', '2015-01-30 15:03:40', '112', '0');
INSERT INTO `t_oa_notification_history` VALUES ('190', '1', '2015-01-30 15:34:00', '113', '1');
INSERT INTO `t_oa_notification_history` VALUES ('191', '3', '2015-01-30 15:34:00', '113', '0');
INSERT INTO `t_oa_notification_history` VALUES ('192', '4', '2015-01-30 15:34:00', '113', '1');
INSERT INTO `t_oa_notification_history` VALUES ('193', '6', '2015-01-30 15:34:00', '113', '0');
INSERT INTO `t_oa_notification_history` VALUES ('194', '7', '2015-01-30 15:34:00', '113', '1');
INSERT INTO `t_oa_notification_history` VALUES ('197', '7', '2015-02-02 10:53:13', '114', '1');
INSERT INTO `t_oa_notification_history` VALUES ('198', '7', '2015-02-02 10:55:26', '115', '1');
INSERT INTO `t_oa_notification_history` VALUES ('199', '9', '2015-02-02 11:13:23', '118', '1');
INSERT INTO `t_oa_notification_history` VALUES ('200', '7', '2015-02-02 11:15:45', '119', '1');
INSERT INTO `t_oa_notification_history` VALUES ('201', '7', '2015-02-02 11:18:33', '120', '1');
INSERT INTO `t_oa_notification_history` VALUES ('202', '1', '2015-02-02 11:34:58', '121', '1');
INSERT INTO `t_oa_notification_history` VALUES ('203', '2', '2015-02-02 11:34:58', '121', '1');
INSERT INTO `t_oa_notification_history` VALUES ('204', '3', '2015-02-02 11:34:58', '121', '0');
INSERT INTO `t_oa_notification_history` VALUES ('205', '4', '2015-02-02 11:34:58', '121', '1');
INSERT INTO `t_oa_notification_history` VALUES ('206', '6', '2015-02-02 11:34:58', '121', '0');
INSERT INTO `t_oa_notification_history` VALUES ('207', '7', '2015-02-02 11:34:58', '121', '1');
INSERT INTO `t_oa_notification_history` VALUES ('209', '7', '2015-02-02 11:56:48', '122', '1');
INSERT INTO `t_oa_notification_history` VALUES ('210', '7', '2015-02-02 11:57:58', '123', '1');
INSERT INTO `t_oa_notification_history` VALUES ('211', '1', '2015-02-02 13:43:56', '124', '0');
INSERT INTO `t_oa_notification_history` VALUES ('212', '4', '2015-02-02 13:43:56', '124', '1');
INSERT INTO `t_oa_notification_history` VALUES ('214', '1', '2015-02-02 13:44:06', '125', '0');
INSERT INTO `t_oa_notification_history` VALUES ('215', '4', '2015-02-02 13:44:06', '125', '1');
INSERT INTO `t_oa_notification_history` VALUES ('217', '1', '2015-02-02 13:44:53', '126', '0');
INSERT INTO `t_oa_notification_history` VALUES ('218', '4', '2015-02-02 13:44:53', '126', '1');
INSERT INTO `t_oa_notification_history` VALUES ('220', '1', '2015-02-02 13:45:07', '127', '0');
INSERT INTO `t_oa_notification_history` VALUES ('221', '4', '2015-02-02 13:45:07', '127', '1');
INSERT INTO `t_oa_notification_history` VALUES ('223', '1', '2015-02-02 13:45:31', '128', '0');
INSERT INTO `t_oa_notification_history` VALUES ('224', '4', '2015-02-02 13:45:31', '128', '1');
INSERT INTO `t_oa_notification_history` VALUES ('226', '7', '2015-02-02 13:56:50', '129', '1');
INSERT INTO `t_oa_notification_history` VALUES ('227', '7', '2015-02-02 13:59:05', '130', '1');
INSERT INTO `t_oa_notification_history` VALUES ('228', '4', '2015-02-02 15:11:40', '138', '1');
INSERT INTO `t_oa_notification_history` VALUES ('229', '7', '2015-02-02 15:11:40', '138', '1');
INSERT INTO `t_oa_notification_history` VALUES ('232', '7', '2015-02-02 16:04:15', '143', '1');
INSERT INTO `t_oa_notification_history` VALUES ('233', '7', '2015-02-02 16:04:28', '144', '1');
INSERT INTO `t_oa_notification_history` VALUES ('238', '31', '2015-02-04 09:45:23', '147', '0');
INSERT INTO `t_oa_notification_history` VALUES ('239', '9', '2015-02-04 10:02:41', '148', '0');
INSERT INTO `t_oa_notification_history` VALUES ('240', '11', '2015-02-04 10:02:41', '148', '0');
INSERT INTO `t_oa_notification_history` VALUES ('242', '8', '2015-02-04 10:05:16', '149', '0');
INSERT INTO `t_oa_notification_history` VALUES ('243', '9', '2015-02-04 10:05:16', '149', '0');
INSERT INTO `t_oa_notification_history` VALUES ('244', '11', '2015-02-04 10:05:16', '149', '0');
INSERT INTO `t_oa_notification_history` VALUES ('245', '13', '2015-02-04 10:05:16', '149', '0');
INSERT INTO `t_oa_notification_history` VALUES ('246', '15', '2015-02-04 10:05:16', '149', '0');
INSERT INTO `t_oa_notification_history` VALUES ('247', '16', '2015-02-04 10:05:16', '149', '0');
INSERT INTO `t_oa_notification_history` VALUES ('248', '21', '2015-02-04 10:05:16', '149', '0');
INSERT INTO `t_oa_notification_history` VALUES ('249', '31', '2015-02-04 10:05:16', '149', '0');
INSERT INTO `t_oa_notification_history` VALUES ('250', '33', '2015-02-04 10:05:16', '149', '0');
INSERT INTO `t_oa_notification_history` VALUES ('251', '35', '2015-02-04 10:05:16', '149', '0');
INSERT INTO `t_oa_notification_history` VALUES ('252', '52', '2015-02-04 10:05:16', '149', '0');
INSERT INTO `t_oa_notification_history` VALUES ('253', '59', '2015-02-04 10:05:16', '149', '0');
INSERT INTO `t_oa_notification_history` VALUES ('257', '9', '2015-02-04 10:14:40', '150', '0');
INSERT INTO `t_oa_notification_history` VALUES ('258', '11', '2015-02-04 10:14:40', '150', '0');
INSERT INTO `t_oa_notification_history` VALUES ('260', '33', '2015-02-04 14:19:40', '151', '0');
INSERT INTO `t_oa_notification_history` VALUES ('261', '33', '2015-02-04 14:27:53', '152', '0');
INSERT INTO `t_oa_notification_history` VALUES ('262', '9', '2015-02-04 14:29:22', '153', '0');
INSERT INTO `t_oa_notification_history` VALUES ('263', '11', '2015-02-04 14:29:22', '153', '0');
INSERT INTO `t_oa_notification_history` VALUES ('264', '13', '2015-02-04 14:29:22', '153', '0');
INSERT INTO `t_oa_notification_history` VALUES ('265', '15', '2015-02-04 14:29:22', '153', '0');
INSERT INTO `t_oa_notification_history` VALUES ('266', '16', '2015-02-04 14:29:22', '153', '0');
INSERT INTO `t_oa_notification_history` VALUES ('267', '21', '2015-02-04 14:29:22', '153', '0');
INSERT INTO `t_oa_notification_history` VALUES ('268', '31', '2015-02-04 14:29:22', '153', '0');
INSERT INTO `t_oa_notification_history` VALUES ('269', '33', '2015-02-04 14:29:22', '153', '0');
INSERT INTO `t_oa_notification_history` VALUES ('270', '35', '2015-02-04 14:29:22', '153', '0');
INSERT INTO `t_oa_notification_history` VALUES ('271', '52', '2015-02-04 14:29:22', '153', '0');
INSERT INTO `t_oa_notification_history` VALUES ('277', '31', '2015-02-04 15:34:57', '154', '0');
INSERT INTO `t_oa_notification_history` VALUES ('278', '9', '2015-02-04 15:56:36', '155', '0');
INSERT INTO `t_oa_notification_history` VALUES ('279', '11', '2015-02-04 15:56:36', '155', '0');
INSERT INTO `t_oa_notification_history` VALUES ('281', '9', '2015-02-05 14:13:39', '156', '0');
INSERT INTO `t_oa_notification_history` VALUES ('282', '11', '2015-02-05 14:13:39', '156', '0');
INSERT INTO `t_oa_notification_history` VALUES ('284', '31', '2015-02-06 11:00:16', '157', '0');
INSERT INTO `t_oa_notification_history` VALUES ('285', '37', '2015-02-06 11:03:40', '158', '0');
INSERT INTO `t_oa_notification_history` VALUES ('286', '38', '2015-02-06 11:03:40', '158', '0');
INSERT INTO `t_oa_notification_history` VALUES ('288', '37', '2015-02-06 11:07:06', '159', '0');
INSERT INTO `t_oa_notification_history` VALUES ('289', '38', '2015-02-06 11:07:06', '159', '0');
INSERT INTO `t_oa_notification_history` VALUES ('291', '37', '2015-02-06 11:09:00', '160', '0');
INSERT INTO `t_oa_notification_history` VALUES ('292', '38', '2015-02-06 11:09:00', '160', '0');
INSERT INTO `t_oa_notification_history` VALUES ('294', '37', '2015-02-06 11:16:51', '161', '0');
INSERT INTO `t_oa_notification_history` VALUES ('295', '38', '2015-02-06 11:16:51', '161', '0');
INSERT INTO `t_oa_notification_history` VALUES ('297', '31', '2015-02-06 11:25:55', '162', '0');
INSERT INTO `t_oa_notification_history` VALUES ('298', '31', '2015-02-06 11:26:06', '163', '0');
INSERT INTO `t_oa_notification_history` VALUES ('299', '9', '2015-02-06 11:44:42', '164', '0');
INSERT INTO `t_oa_notification_history` VALUES ('300', '11', '2015-02-06 11:44:42', '164', '0');
INSERT INTO `t_oa_notification_history` VALUES ('302', '31', '2015-02-06 11:50:37', '165', '0');
INSERT INTO `t_oa_notification_history` VALUES ('303', '8', '2015-02-06 11:52:02', '166', '0');
INSERT INTO `t_oa_notification_history` VALUES ('304', '9', '2015-02-06 11:52:02', '166', '0');
INSERT INTO `t_oa_notification_history` VALUES ('305', '13', '2015-02-06 11:52:02', '166', '0');
INSERT INTO `t_oa_notification_history` VALUES ('306', '15', '2015-02-06 11:52:02', '166', '0');
INSERT INTO `t_oa_notification_history` VALUES ('307', '16', '2015-02-06 11:52:02', '166', '0');
INSERT INTO `t_oa_notification_history` VALUES ('308', '21', '2015-02-06 11:52:02', '166', '0');
INSERT INTO `t_oa_notification_history` VALUES ('309', '31', '2015-02-06 11:52:02', '166', '0');
INSERT INTO `t_oa_notification_history` VALUES ('310', '33', '2015-02-06 11:52:02', '166', '0');
INSERT INTO `t_oa_notification_history` VALUES ('311', '35', '2015-02-06 11:52:02', '166', '0');
INSERT INTO `t_oa_notification_history` VALUES ('312', '37', '2015-02-06 11:52:02', '166', '0');
INSERT INTO `t_oa_notification_history` VALUES ('313', '38', '2015-02-06 11:52:02', '166', '0');
INSERT INTO `t_oa_notification_history` VALUES ('314', '52', '2015-02-06 11:52:02', '166', '0');
INSERT INTO `t_oa_notification_history` VALUES ('318', '31', '2015-02-06 11:55:41', '167', '0');
INSERT INTO `t_oa_notification_history` VALUES ('319', '37', '2015-02-06 14:54:51', '168', '0');
INSERT INTO `t_oa_notification_history` VALUES ('320', '38', '2015-02-06 14:54:51', '168', '0');
INSERT INTO `t_oa_notification_history` VALUES ('322', '37', '2015-02-06 14:55:11', '169', '0');
INSERT INTO `t_oa_notification_history` VALUES ('323', '38', '2015-02-06 14:55:11', '169', '0');
INSERT INTO `t_oa_notification_history` VALUES ('325', '16', '2015-02-06 14:58:13', '170', '0');
INSERT INTO `t_oa_notification_history` VALUES ('326', '34', '2015-02-06 14:58:13', '170', '0');
INSERT INTO `t_oa_notification_history` VALUES ('327', '35', '2015-02-06 14:58:13', '170', '0');
INSERT INTO `t_oa_notification_history` VALUES ('328', '36', '2015-02-06 14:58:13', '170', '0');
INSERT INTO `t_oa_notification_history` VALUES ('332', '16', '2015-02-06 15:01:51', '171', '0');
INSERT INTO `t_oa_notification_history` VALUES ('333', '33', '2015-02-06 15:01:51', '171', '0');
INSERT INTO `t_oa_notification_history` VALUES ('334', '34', '2015-02-06 15:01:51', '171', '0');
INSERT INTO `t_oa_notification_history` VALUES ('335', '35', '2015-02-06 15:01:51', '171', '0');
INSERT INTO `t_oa_notification_history` VALUES ('336', '36', '2015-02-06 15:01:51', '171', '0');
INSERT INTO `t_oa_notification_history` VALUES ('339', '16', '2015-02-06 15:31:57', '172', '0');
INSERT INTO `t_oa_notification_history` VALUES ('340', '34', '2015-02-06 15:31:57', '172', '0');
INSERT INTO `t_oa_notification_history` VALUES ('341', '35', '2015-02-06 15:31:57', '172', '0');
INSERT INTO `t_oa_notification_history` VALUES ('342', '36', '2015-02-06 15:31:57', '172', '0');
INSERT INTO `t_oa_notification_history` VALUES ('346', '21', '2015-02-06 15:51:06', '173', '0');
INSERT INTO `t_oa_notification_history` VALUES ('347', '31', '2015-02-06 15:51:06', '173', '0');
INSERT INTO `t_oa_notification_history` VALUES ('349', '31', '2015-02-06 15:51:51', '174', '0');
INSERT INTO `t_oa_notification_history` VALUES ('350', '33', '2015-02-06 15:53:25', '175', '0');
INSERT INTO `t_oa_notification_history` VALUES ('351', '33', '2015-02-06 15:56:33', '176', '0');
INSERT INTO `t_oa_notification_history` VALUES ('352', '33', '2015-02-06 15:58:00', '177', '0');
INSERT INTO `t_oa_notification_history` VALUES ('353', '33', '2015-02-06 15:59:35', '178', '0');
INSERT INTO `t_oa_notification_history` VALUES ('354', '33', '2015-02-06 16:04:18', '179', '0');
INSERT INTO `t_oa_notification_history` VALUES ('355', '33', '2015-02-06 16:05:22', '180', '0');
INSERT INTO `t_oa_notification_history` VALUES ('356', '33', '2015-02-06 16:07:00', '181', '0');
INSERT INTO `t_oa_notification_history` VALUES ('357', '33', '2015-02-06 16:09:51', '182', '0');
INSERT INTO `t_oa_notification_history` VALUES ('358', '33', '2015-02-06 16:11:13', '183', '0');
INSERT INTO `t_oa_notification_history` VALUES ('359', '33', '2015-02-06 16:13:31', '184', '0');
INSERT INTO `t_oa_notification_history` VALUES ('360', '16', '2015-02-06 16:19:22', '185', '0');
INSERT INTO `t_oa_notification_history` VALUES ('361', '34', '2015-02-06 16:19:22', '185', '0');
INSERT INTO `t_oa_notification_history` VALUES ('362', '35', '2015-02-06 16:19:22', '185', '0');
INSERT INTO `t_oa_notification_history` VALUES ('363', '36', '2015-02-06 16:19:22', '185', '0');
INSERT INTO `t_oa_notification_history` VALUES ('367', '31', '2015-02-06 16:19:47', '186', '0');
INSERT INTO `t_oa_notification_history` VALUES ('368', '31', '2015-02-06 16:28:03', '190', '0');
INSERT INTO `t_oa_notification_history` VALUES ('369', '37', '2015-02-06 16:39:19', '194', '0');
INSERT INTO `t_oa_notification_history` VALUES ('370', '38', '2015-02-06 16:39:19', '194', '0');
INSERT INTO `t_oa_notification_history` VALUES ('372', '9', '2015-02-06 16:39:33', '195', '0');
INSERT INTO `t_oa_notification_history` VALUES ('373', '15', '2015-02-06 16:41:21', '196', '0');
INSERT INTO `t_oa_notification_history` VALUES ('374', '37', '2015-02-09 08:55:34', '197', '0');
INSERT INTO `t_oa_notification_history` VALUES ('375', '38', '2015-02-09 08:55:34', '197', '0');
INSERT INTO `t_oa_notification_history` VALUES ('377', '37', '2015-02-09 08:57:18', '198', '0');
INSERT INTO `t_oa_notification_history` VALUES ('378', '38', '2015-02-09 08:57:18', '198', '0');
INSERT INTO `t_oa_notification_history` VALUES ('380', '9', '2015-02-09 09:23:44', '199', '0');
INSERT INTO `t_oa_notification_history` VALUES ('381', '9', '2015-02-09 09:30:48', '200', '0');
INSERT INTO `t_oa_notification_history` VALUES ('382', '37', '2015-02-09 09:33:09', '201', '0');
INSERT INTO `t_oa_notification_history` VALUES ('383', '38', '2015-02-09 09:33:09', '201', '0');
INSERT INTO `t_oa_notification_history` VALUES ('385', '31', '2015-02-10 08:55:43', '202', '0');
INSERT INTO `t_oa_notification_history` VALUES ('386', '37', '2015-02-10 08:56:12', '203', '0');
INSERT INTO `t_oa_notification_history` VALUES ('387', '38', '2015-02-10 08:56:12', '203', '0');
INSERT INTO `t_oa_notification_history` VALUES ('389', '274', '2015-02-10 09:54:51', '204', '0');
INSERT INTO `t_oa_notification_history` VALUES ('391', '37', '2015-02-10 10:28:56', '206', '0');
INSERT INTO `t_oa_notification_history` VALUES ('392', '38', '2015-02-10 10:28:56', '206', '0');
INSERT INTO `t_oa_notification_history` VALUES ('396', '13', '2015-02-10 14:14:51', '209', '0');
INSERT INTO `t_oa_notification_history` VALUES ('397', '14', '2015-02-10 14:14:51', '209', '0');
INSERT INTO `t_oa_notification_history` VALUES ('398', '15', '2015-02-10 14:14:51', '209', '0');
INSERT INTO `t_oa_notification_history` VALUES ('399', '16', '2015-02-10 14:14:51', '209', '0');
INSERT INTO `t_oa_notification_history` VALUES ('400', '21', '2015-02-10 14:14:51', '209', '0');
INSERT INTO `t_oa_notification_history` VALUES ('401', '33', '2015-02-10 14:14:51', '209', '0');
INSERT INTO `t_oa_notification_history` VALUES ('402', '34', '2015-02-10 14:14:51', '209', '0');
INSERT INTO `t_oa_notification_history` VALUES ('403', '35', '2015-02-10 14:14:51', '209', '0');
INSERT INTO `t_oa_notification_history` VALUES ('404', '36', '2015-02-10 14:14:51', '209', '0');
INSERT INTO `t_oa_notification_history` VALUES ('405', '37', '2015-02-10 14:14:51', '209', '0');
INSERT INTO `t_oa_notification_history` VALUES ('406', '38', '2015-02-10 14:14:51', '209', '0');
INSERT INTO `t_oa_notification_history` VALUES ('411', '31', '2015-02-10 14:58:49', '210', '0');
INSERT INTO `t_oa_notification_history` VALUES ('412', '8', '2015-02-10 16:31:57', '211', '0');
INSERT INTO `t_oa_notification_history` VALUES ('413', '9', '2015-02-10 16:31:57', '211', '0');
INSERT INTO `t_oa_notification_history` VALUES ('414', '13', '2015-02-10 16:31:57', '211', '0');
INSERT INTO `t_oa_notification_history` VALUES ('415', '14', '2015-02-10 16:31:57', '211', '0');
INSERT INTO `t_oa_notification_history` VALUES ('416', '15', '2015-02-10 16:31:57', '211', '0');
INSERT INTO `t_oa_notification_history` VALUES ('417', '16', '2015-02-10 16:31:57', '211', '0');
INSERT INTO `t_oa_notification_history` VALUES ('418', '21', '2015-02-10 16:31:57', '211', '0');
INSERT INTO `t_oa_notification_history` VALUES ('419', '31', '2015-02-10 16:31:57', '211', '0');
INSERT INTO `t_oa_notification_history` VALUES ('420', '33', '2015-02-10 16:31:57', '211', '0');
INSERT INTO `t_oa_notification_history` VALUES ('421', '34', '2015-02-10 16:31:57', '211', '0');
INSERT INTO `t_oa_notification_history` VALUES ('422', '35', '2015-02-10 16:31:57', '211', '0');
INSERT INTO `t_oa_notification_history` VALUES ('423', '36', '2015-02-10 16:31:57', '211', '0');
INSERT INTO `t_oa_notification_history` VALUES ('424', '37', '2015-02-10 16:31:57', '211', '0');
INSERT INTO `t_oa_notification_history` VALUES ('425', '38', '2015-02-10 16:31:57', '211', '0');
INSERT INTO `t_oa_notification_history` VALUES ('426', '52', '2015-02-10 16:31:57', '211', '0');
INSERT INTO `t_oa_notification_history` VALUES ('427', '274', '2015-02-10 16:31:57', '211', '0');
INSERT INTO `t_oa_notification_history` VALUES ('443', '37', '2015-02-10 16:34:46', '212', '0');
INSERT INTO `t_oa_notification_history` VALUES ('444', '38', '2015-02-10 16:34:46', '212', '0');
INSERT INTO `t_oa_notification_history` VALUES ('446', '37', '2015-02-10 16:35:44', '213', '0');
INSERT INTO `t_oa_notification_history` VALUES ('447', '38', '2015-02-10 16:35:44', '213', '0');
INSERT INTO `t_oa_notification_history` VALUES ('449', '37', '2015-02-10 16:35:45', '214', '0');
INSERT INTO `t_oa_notification_history` VALUES ('450', '38', '2015-02-10 16:35:45', '214', '0');
INSERT INTO `t_oa_notification_history` VALUES ('452', '37', '2015-02-10 16:44:22', '215', '0');
INSERT INTO `t_oa_notification_history` VALUES ('453', '38', '2015-02-10 16:44:22', '215', '0');
INSERT INTO `t_oa_notification_history` VALUES ('455', '9', '2015-02-10 16:49:50', '216', '0');
INSERT INTO `t_oa_notification_history` VALUES ('456', '31', '2015-02-11 10:29:01', '217', '0');
INSERT INTO `t_oa_notification_history` VALUES ('457', '31', '2015-02-11 10:29:31', '218', '0');
INSERT INTO `t_oa_notification_history` VALUES ('458', '31', '2015-02-11 11:00:14', '219', '0');
INSERT INTO `t_oa_notification_history` VALUES ('459', '31', '2015-02-11 11:44:00', '220', '0');
INSERT INTO `t_oa_notification_history` VALUES ('460', '31', '2015-02-11 11:44:40', '221', '0');
INSERT INTO `t_oa_notification_history` VALUES ('462', '31', '2015-02-11 11:49:16', '223', '0');
INSERT INTO `t_oa_notification_history` VALUES ('463', '37', '2015-02-11 16:26:54', '224', '0');
INSERT INTO `t_oa_notification_history` VALUES ('464', '38', '2015-02-11 16:26:54', '224', '0');
INSERT INTO `t_oa_notification_history` VALUES ('466', '8', '2015-02-12 16:59:30', '225', '0');
INSERT INTO `t_oa_notification_history` VALUES ('467', '9', '2015-02-12 16:59:30', '225', '0');
INSERT INTO `t_oa_notification_history` VALUES ('468', '13', '2015-02-12 16:59:30', '225', '0');
INSERT INTO `t_oa_notification_history` VALUES ('469', '14', '2015-02-12 16:59:30', '225', '0');
INSERT INTO `t_oa_notification_history` VALUES ('470', '15', '2015-02-12 16:59:30', '225', '0');
INSERT INTO `t_oa_notification_history` VALUES ('471', '16', '2015-02-12 16:59:30', '225', '0');
INSERT INTO `t_oa_notification_history` VALUES ('472', '21', '2015-02-12 16:59:30', '225', '0');
INSERT INTO `t_oa_notification_history` VALUES ('473', '31', '2015-02-12 16:59:30', '225', '0');
INSERT INTO `t_oa_notification_history` VALUES ('474', '33', '2015-02-12 16:59:30', '225', '0');
INSERT INTO `t_oa_notification_history` VALUES ('475', '34', '2015-02-12 16:59:30', '225', '0');
INSERT INTO `t_oa_notification_history` VALUES ('476', '35', '2015-02-12 16:59:30', '225', '0');
INSERT INTO `t_oa_notification_history` VALUES ('477', '36', '2015-02-12 16:59:30', '225', '0');
INSERT INTO `t_oa_notification_history` VALUES ('478', '37', '2015-02-12 16:59:30', '225', '0');
INSERT INTO `t_oa_notification_history` VALUES ('479', '38', '2015-02-12 16:59:30', '225', '0');
INSERT INTO `t_oa_notification_history` VALUES ('480', '52', '2015-02-12 16:59:30', '225', '0');
INSERT INTO `t_oa_notification_history` VALUES ('481', '274', '2015-02-12 16:59:30', '225', '0');
INSERT INTO `t_oa_notification_history` VALUES ('482', '13', '2015-02-13 09:37:39', '226', '0');
INSERT INTO `t_oa_notification_history` VALUES ('483', '14', '2015-02-13 09:37:39', '226', '0');
INSERT INTO `t_oa_notification_history` VALUES ('484', '15', '2015-02-13 09:37:39', '226', '0');
INSERT INTO `t_oa_notification_history` VALUES ('485', '16', '2015-02-13 09:37:39', '226', '0');
INSERT INTO `t_oa_notification_history` VALUES ('486', '21', '2015-02-13 09:37:39', '226', '0');
INSERT INTO `t_oa_notification_history` VALUES ('487', '31', '2015-02-13 09:37:39', '226', '0');
INSERT INTO `t_oa_notification_history` VALUES ('488', '33', '2015-02-13 09:37:39', '226', '0');
INSERT INTO `t_oa_notification_history` VALUES ('489', '34', '2015-02-13 09:37:39', '226', '0');
INSERT INTO `t_oa_notification_history` VALUES ('490', '35', '2015-02-13 09:37:39', '226', '0');
INSERT INTO `t_oa_notification_history` VALUES ('491', '36', '2015-02-13 09:37:39', '226', '0');
INSERT INTO `t_oa_notification_history` VALUES ('497', '37', '2015-02-14 14:25:32', '227', '0');
INSERT INTO `t_oa_notification_history` VALUES ('498', '38', '2015-02-14 14:25:32', '227', '0');
INSERT INTO `t_oa_notification_history` VALUES ('500', '37', '2015-02-14 14:26:33', '228', '0');
INSERT INTO `t_oa_notification_history` VALUES ('501', '38', '2015-02-14 14:26:33', '228', '0');
INSERT INTO `t_oa_notification_history` VALUES ('503', '37', '2015-02-14 14:29:19', '229', '0');
INSERT INTO `t_oa_notification_history` VALUES ('504', '38', '2015-02-14 14:29:19', '229', '0');
INSERT INTO `t_oa_notification_history` VALUES ('506', '37', '2015-02-14 14:31:10', '230', '0');
INSERT INTO `t_oa_notification_history` VALUES ('507', '38', '2015-02-14 14:31:10', '230', '0');
INSERT INTO `t_oa_notification_history` VALUES ('509', '37', '2015-02-14 14:31:21', '231', '0');
INSERT INTO `t_oa_notification_history` VALUES ('510', '38', '2015-02-14 14:31:21', '231', '0');
INSERT INTO `t_oa_notification_history` VALUES ('515', '37', '2015-02-14 14:35:19', '233', '0');
INSERT INTO `t_oa_notification_history` VALUES ('516', '38', '2015-02-14 14:35:19', '233', '0');
INSERT INTO `t_oa_notification_history` VALUES ('518', '37', '2015-02-14 14:36:47', '234', '0');
INSERT INTO `t_oa_notification_history` VALUES ('519', '38', '2015-02-14 14:36:47', '234', '0');
INSERT INTO `t_oa_notification_history` VALUES ('521', '37', '2015-02-14 14:37:06', '235', '0');
INSERT INTO `t_oa_notification_history` VALUES ('522', '38', '2015-02-14 14:37:06', '235', '0');
INSERT INTO `t_oa_notification_history` VALUES ('524', '37', '2015-02-14 14:37:19', '236', '0');
INSERT INTO `t_oa_notification_history` VALUES ('525', '38', '2015-02-14 14:37:19', '236', '0');
INSERT INTO `t_oa_notification_history` VALUES ('527', '37', '2015-02-14 14:37:34', '237', '0');
INSERT INTO `t_oa_notification_history` VALUES ('528', '38', '2015-02-14 14:37:34', '237', '0');
INSERT INTO `t_oa_notification_history` VALUES ('530', '37', '2015-02-14 14:40:26', '238', '0');
INSERT INTO `t_oa_notification_history` VALUES ('531', '38', '2015-02-14 14:40:26', '238', '0');
INSERT INTO `t_oa_notification_history` VALUES ('533', '37', '2015-02-14 14:45:22', '239', '0');
INSERT INTO `t_oa_notification_history` VALUES ('534', '38', '2015-02-14 14:45:22', '239', '0');
INSERT INTO `t_oa_notification_history` VALUES ('536', '37', '2015-02-14 14:45:52', '240', '0');
INSERT INTO `t_oa_notification_history` VALUES ('537', '38', '2015-02-14 14:45:52', '240', '0');
INSERT INTO `t_oa_notification_history` VALUES ('539', '37', '2015-02-14 14:46:06', '241', '0');
INSERT INTO `t_oa_notification_history` VALUES ('540', '38', '2015-02-14 14:46:06', '241', '0');
INSERT INTO `t_oa_notification_history` VALUES ('542', '37', '2015-02-14 14:46:47', '242', '0');
INSERT INTO `t_oa_notification_history` VALUES ('543', '38', '2015-02-14 14:46:47', '242', '0');
INSERT INTO `t_oa_notification_history` VALUES ('545', '37', '2015-02-14 14:47:01', '243', '0');
INSERT INTO `t_oa_notification_history` VALUES ('546', '38', '2015-02-14 14:47:01', '243', '0');
INSERT INTO `t_oa_notification_history` VALUES ('548', '37', '2015-02-14 14:58:53', '244', '0');
INSERT INTO `t_oa_notification_history` VALUES ('549', '38', '2015-02-14 14:58:53', '244', '0');
INSERT INTO `t_oa_notification_history` VALUES ('551', '37', '2015-02-14 15:01:41', '245', '0');
INSERT INTO `t_oa_notification_history` VALUES ('552', '38', '2015-02-14 15:01:41', '245', '0');
INSERT INTO `t_oa_notification_history` VALUES ('553', '8', '2015-02-27 09:06:38', '246', '0');
INSERT INTO `t_oa_notification_history` VALUES ('554', '9', '2015-02-27 09:06:38', '246', '0');
INSERT INTO `t_oa_notification_history` VALUES ('555', '13', '2015-02-27 09:06:38', '246', '0');
INSERT INTO `t_oa_notification_history` VALUES ('556', '14', '2015-02-27 09:06:38', '246', '0');
INSERT INTO `t_oa_notification_history` VALUES ('557', '15', '2015-02-27 09:06:38', '246', '0');
INSERT INTO `t_oa_notification_history` VALUES ('558', '16', '2015-02-27 09:06:38', '246', '0');
INSERT INTO `t_oa_notification_history` VALUES ('559', '21', '2015-02-27 09:06:38', '246', '0');
INSERT INTO `t_oa_notification_history` VALUES ('560', '31', '2015-02-27 09:06:38', '246', '0');
INSERT INTO `t_oa_notification_history` VALUES ('561', '32', '2015-02-27 09:06:38', '246', '0');
INSERT INTO `t_oa_notification_history` VALUES ('562', '33', '2015-02-27 09:06:38', '246', '0');
INSERT INTO `t_oa_notification_history` VALUES ('563', '34', '2015-02-27 09:06:38', '246', '0');
INSERT INTO `t_oa_notification_history` VALUES ('564', '35', '2015-02-27 09:06:38', '246', '0');
INSERT INTO `t_oa_notification_history` VALUES ('565', '36', '2015-02-27 09:06:38', '246', '0');
INSERT INTO `t_oa_notification_history` VALUES ('566', '37', '2015-02-27 09:06:38', '246', '0');
INSERT INTO `t_oa_notification_history` VALUES ('567', '38', '2015-02-27 09:06:38', '246', '0');
INSERT INTO `t_oa_notification_history` VALUES ('568', '52', '2015-02-27 09:06:38', '246', '0');
INSERT INTO `t_oa_notification_history` VALUES ('569', '274', '2015-02-27 09:06:38', '246', '0');
INSERT INTO `t_oa_notification_history` VALUES ('570', '277', '2015-02-27 09:06:38', '246', '0');
INSERT INTO `t_oa_notification_history` VALUES ('584', '37', '2015-02-27 11:03:14', '247', '0');
INSERT INTO `t_oa_notification_history` VALUES ('585', '38', '2015-02-27 11:03:14', '247', '0');

-- ----------------------------
-- Table structure for `t_oa_notification_read`
-- ----------------------------
DROP TABLE IF EXISTS `t_oa_notification_read`;
CREATE TABLE `t_oa_notification_read` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `readuserid` int(11) DEFAULT NULL,
  `notid` int(11) DEFAULT NULL,
  `readtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_oa_notification_read
-- ----------------------------
INSERT INTO `t_oa_notification_read` VALUES ('84', '4', '138', '2015-02-04 09:45:38');
INSERT INTO `t_oa_notification_read` VALUES ('75', '7', '123', '2015-02-03 14:33:12');
INSERT INTO `t_oa_notification_read` VALUES ('76', '7', '122', '2015-02-03 14:33:24');
INSERT INTO `t_oa_notification_read` VALUES ('77', '7', '120', '2015-02-03 14:33:34');
INSERT INTO `t_oa_notification_read` VALUES ('78', '7', '119', '2015-02-03 14:33:58');
INSERT INTO `t_oa_notification_read` VALUES ('83', '4', '147', '2015-02-04 09:45:31');
INSERT INTO `t_oa_notification_read` VALUES ('80', '4', '143', '2015-02-04 08:32:03');
INSERT INTO `t_oa_notification_read` VALUES ('81', '4', '144', '2015-02-04 08:32:13');
INSERT INTO `t_oa_notification_read` VALUES ('121', '1', '156', '2015-02-06 09:31:31');
INSERT INTO `t_oa_notification_read` VALUES ('85', '4', '130', '2015-02-04 09:45:44');
INSERT INTO `t_oa_notification_read` VALUES ('86', '4', '103', '2015-02-04 09:45:58');
INSERT INTO `t_oa_notification_read` VALUES ('87', '4', '126', '2015-02-04 09:46:14');
INSERT INTO `t_oa_notification_read` VALUES ('88', '4', '78', '2015-02-04 09:46:37');
INSERT INTO `t_oa_notification_read` VALUES ('89', '4', '129', '2015-02-04 09:46:56');
INSERT INTO `t_oa_notification_read` VALUES ('90', '4', '96', '2015-02-04 09:47:08');
INSERT INTO `t_oa_notification_read` VALUES ('91', '4', '79', '2015-02-04 09:47:20');
INSERT INTO `t_oa_notification_read` VALUES ('92', '1', '149', '2015-02-04 10:46:21');
INSERT INTO `t_oa_notification_read` VALUES ('93', '7', '114', '2015-02-04 12:00:25');
INSERT INTO `t_oa_notification_read` VALUES ('94', '1', '65', '2015-02-04 14:22:16');
INSERT INTO `t_oa_notification_read` VALUES ('95', '1', '86', '2015-02-04 14:22:20');
INSERT INTO `t_oa_notification_read` VALUES ('96', '7', '153', '2015-02-04 14:29:30');
INSERT INTO `t_oa_notification_read` VALUES ('97', '4', '148', '2015-02-04 15:03:27');
INSERT INTO `t_oa_notification_read` VALUES ('98', '4', '121', '2015-02-04 15:08:57');
INSERT INTO `t_oa_notification_read` VALUES ('99', '4', '150', '2015-02-04 15:09:03');
INSERT INTO `t_oa_notification_read` VALUES ('100', '1', '74', '2015-02-04 16:06:07');
INSERT INTO `t_oa_notification_read` VALUES ('101', '1', '75', '2015-02-04 16:52:01');
INSERT INTO `t_oa_notification_read` VALUES ('102', '4', '155', '2015-02-05 08:43:47');
INSERT INTO `t_oa_notification_read` VALUES ('103', '4', '154', '2015-02-05 09:33:07');
INSERT INTO `t_oa_notification_read` VALUES ('104', '1', '57', '2015-02-05 10:50:43');
INSERT INTO `t_oa_notification_read` VALUES ('105', '2', '113', '2015-02-05 13:39:47');
INSERT INTO `t_oa_notification_read` VALUES ('106', '4', '141', '2015-02-05 13:44:37');
INSERT INTO `t_oa_notification_read` VALUES ('107', '1', '71', '2015-02-05 13:59:48');
INSERT INTO `t_oa_notification_read` VALUES ('108', '4', '140', '2015-02-05 14:09:03');
INSERT INTO `t_oa_notification_read` VALUES ('120', '1', '156', '2015-02-06 09:29:46');
INSERT INTO `t_oa_notification_read` VALUES ('122', '4', '157', '2015-02-06 11:00:20');
INSERT INTO `t_oa_notification_read` VALUES ('123', '2', '159', '2015-02-06 11:07:35');
INSERT INTO `t_oa_notification_read` VALUES ('124', '4', '161', '2015-02-06 11:16:59');
INSERT INTO `t_oa_notification_read` VALUES ('125', '4', '163', '2015-02-06 11:27:47');
INSERT INTO `t_oa_notification_read` VALUES ('126', '7', '160', '2015-02-06 11:32:57');
INSERT INTO `t_oa_notification_read` VALUES ('127', '7', '165', '2015-02-06 11:51:11');
INSERT INTO `t_oa_notification_read` VALUES ('128', '7', '167', '2015-02-06 11:55:46');
INSERT INTO `t_oa_notification_read` VALUES ('129', '4', '164', '2015-02-06 12:00:08');
INSERT INTO `t_oa_notification_read` VALUES ('130', '4', '162', '2015-02-06 13:35:52');
INSERT INTO `t_oa_notification_read` VALUES ('131', '7', '170', '2015-02-06 15:00:33');
INSERT INTO `t_oa_notification_read` VALUES ('132', '4', '171', '2015-02-06 15:02:48');
INSERT INTO `t_oa_notification_read` VALUES ('133', '4', '172', '2015-02-06 15:35:26');
INSERT INTO `t_oa_notification_read` VALUES ('134', '7', '166', '2015-02-06 16:14:56');
INSERT INTO `t_oa_notification_read` VALUES ('135', '4', '185', '2015-02-06 16:19:26');
INSERT INTO `t_oa_notification_read` VALUES ('136', '4', '190', '2015-02-06 16:28:58');
INSERT INTO `t_oa_notification_read` VALUES ('137', '4', '186', '2015-02-06 16:29:04');
INSERT INTO `t_oa_notification_read` VALUES ('138', '4', '184', '2015-02-06 16:35:39');
INSERT INTO `t_oa_notification_read` VALUES ('139', '4', '183', '2015-02-06 16:35:42');
INSERT INTO `t_oa_notification_read` VALUES ('140', '1', '195', '2015-02-06 16:42:56');
INSERT INTO `t_oa_notification_read` VALUES ('141', '4', '196', '2015-02-06 16:46:20');
INSERT INTO `t_oa_notification_read` VALUES ('142', '4', '180', '2015-02-06 16:58:13');
INSERT INTO `t_oa_notification_read` VALUES ('143', '7', '177', '2015-02-09 09:25:49');
INSERT INTO `t_oa_notification_read` VALUES ('144', '4', '197', '2015-02-09 09:27:40');
INSERT INTO `t_oa_notification_read` VALUES ('145', '7', '194', '2015-02-09 09:29:13');
INSERT INTO `t_oa_notification_read` VALUES ('146', '7', '201', '2015-02-09 09:33:26');
INSERT INTO `t_oa_notification_read` VALUES ('147', '4', '200', '2015-02-09 09:33:55');
INSERT INTO `t_oa_notification_read` VALUES ('148', '1', '118', '2015-02-09 09:49:20');
INSERT INTO `t_oa_notification_read` VALUES ('149', '4', '199', '2015-02-09 11:45:49');
INSERT INTO `t_oa_notification_read` VALUES ('150', '4', '198', '2015-02-09 11:45:53');
INSERT INTO `t_oa_notification_read` VALUES ('151', '1', '181', '2015-02-09 16:05:35');
INSERT INTO `t_oa_notification_read` VALUES ('152', '4', '203', '2015-02-10 08:56:20');
INSERT INTO `t_oa_notification_read` VALUES ('153', '11', '204', '2015-02-10 09:55:37');
INSERT INTO `t_oa_notification_read` VALUES ('155', '7', '206', '2015-02-10 11:48:13');
INSERT INTO `t_oa_notification_read` VALUES ('156', '7', '202', '2015-02-10 14:12:05');
INSERT INTO `t_oa_notification_read` VALUES ('157', '4', '151', '2015-02-10 14:55:51');
INSERT INTO `t_oa_notification_read` VALUES ('158', '4', '152', '2015-02-10 14:56:03');
INSERT INTO `t_oa_notification_read` VALUES ('159', '4', '178', '2015-02-10 14:56:06');
INSERT INTO `t_oa_notification_read` VALUES ('160', '7', '158', '2015-02-10 15:36:19');
INSERT INTO `t_oa_notification_read` VALUES ('161', '4', '209', '2015-02-10 15:53:29');
INSERT INTO `t_oa_notification_read` VALUES ('162', '7', '210', '2015-02-10 15:53:58');
INSERT INTO `t_oa_notification_read` VALUES ('163', '4', '211', '2015-02-10 16:38:18');
INSERT INTO `t_oa_notification_read` VALUES ('164', '4', '213', '2015-02-10 16:39:32');
INSERT INTO `t_oa_notification_read` VALUES ('165', '4', '212', '2015-02-10 16:39:34');
INSERT INTO `t_oa_notification_read` VALUES ('166', '4', '214', '2015-02-10 16:39:35');
INSERT INTO `t_oa_notification_read` VALUES ('167', '7', '173', '2015-02-10 16:40:20');
INSERT INTO `t_oa_notification_read` VALUES ('168', '7', '174', '2015-02-10 16:43:04');
INSERT INTO `t_oa_notification_read` VALUES ('169', '1', '216', '2015-02-10 16:50:12');
INSERT INTO `t_oa_notification_read` VALUES ('170', '7', '175', '2015-02-10 16:52:02');
INSERT INTO `t_oa_notification_read` VALUES ('171', '7', '101', '2015-02-10 16:52:10');
INSERT INTO `t_oa_notification_read` VALUES ('172', '4', '215', '2015-02-10 16:56:43');
INSERT INTO `t_oa_notification_read` VALUES ('173', '7', '219', '2015-02-11 11:42:30');
INSERT INTO `t_oa_notification_read` VALUES ('174', '7', '220', '2015-02-11 11:44:20');
INSERT INTO `t_oa_notification_read` VALUES ('175', '7', '221', '2015-02-11 11:46:32');
INSERT INTO `t_oa_notification_read` VALUES ('176', '7', '218', '2015-02-11 11:47:27');
INSERT INTO `t_oa_notification_read` VALUES ('181', '4', '225', '2015-02-14 09:07:56');
INSERT INTO `t_oa_notification_read` VALUES ('178', '7', '223', '2015-02-11 11:50:16');
INSERT INTO `t_oa_notification_read` VALUES ('179', '4', '224', '2015-02-11 16:27:00');
INSERT INTO `t_oa_notification_read` VALUES ('180', '4', '217', '2015-02-13 09:44:44');
INSERT INTO `t_oa_notification_read` VALUES ('182', '4', '226', '2015-02-14 09:08:01');
INSERT INTO `t_oa_notification_read` VALUES ('183', '4', '169', '2015-02-14 10:27:17');
INSERT INTO `t_oa_notification_read` VALUES ('184', '4', '228', '2015-02-14 14:27:13');
INSERT INTO `t_oa_notification_read` VALUES ('185', '4', '227', '2015-02-14 14:27:15');
INSERT INTO `t_oa_notification_read` VALUES ('186', '4', '231', '2015-02-14 14:35:39');
INSERT INTO `t_oa_notification_read` VALUES ('203', '4', '246', '2015-02-27 09:55:12');
INSERT INTO `t_oa_notification_read` VALUES ('188', '4', '233', '2015-02-14 14:35:47');
INSERT INTO `t_oa_notification_read` VALUES ('189', '4', '230', '2015-02-14 14:35:50');
INSERT INTO `t_oa_notification_read` VALUES ('190', '4', '229', '2015-02-14 14:35:51');
INSERT INTO `t_oa_notification_read` VALUES ('191', '7', '236', '2015-02-14 14:40:29');
INSERT INTO `t_oa_notification_read` VALUES ('192', '7', '237', '2015-02-14 14:40:31');
INSERT INTO `t_oa_notification_read` VALUES ('193', '7', '238', '2015-02-14 14:45:30');
INSERT INTO `t_oa_notification_read` VALUES ('194', '7', '239', '2015-02-14 14:45:31');
INSERT INTO `t_oa_notification_read` VALUES ('195', '7', '235', '2015-02-14 14:45:32');
INSERT INTO `t_oa_notification_read` VALUES ('196', '7', '234', '2015-02-14 14:45:33');
INSERT INTO `t_oa_notification_read` VALUES ('197', '4', '240', '2015-02-14 14:46:20');
INSERT INTO `t_oa_notification_read` VALUES ('198', '4', '241', '2015-02-14 14:46:21');
INSERT INTO `t_oa_notification_read` VALUES ('199', '7', '243', '2015-02-14 14:52:55');
INSERT INTO `t_oa_notification_read` VALUES ('200', '7', '242', '2015-02-14 14:52:56');
INSERT INTO `t_oa_notification_read` VALUES ('201', '4', '244', '2015-02-14 14:59:04');
INSERT INTO `t_oa_notification_read` VALUES ('202', '7', '245', '2015-02-14 15:15:44');
INSERT INTO `t_oa_notification_read` VALUES ('204', '7', '247', '2015-02-27 11:09:43');

-- ----------------------------
-- Table structure for `t_oa_officialdocument`
-- ----------------------------
DROP TABLE IF EXISTS `t_oa_officialdocument`;
CREATE TABLE `t_oa_officialdocument` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DRAFTUSERID` int(11) DEFAULT NULL COMMENT '起草人',
  `DRAFTORGID` int(11) DEFAULT NULL COMMENT '起草人组织机构',
  `CREATEDATE` datetime DEFAULT NULL COMMENT '创建这个公文记录的时间， 或者第一次保存草稿的时间；',
  `COMMITDATE` datetime DEFAULT NULL COMMENT '流程正式开始的时间',
  `TITLE` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '主题',
  `CONTENT` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `IMPORTANTLEVEL` int(11) DEFAULT NULL COMMENT '重要等级 取值范围：1-5',
  `TIMELINESSFLAG` int(11) DEFAULT NULL COMMENT '0：不具有时效性；1：具有时效性',
  `LASTDATE` datetime DEFAULT NULL COMMENT '最后时间：具有时效性的最后通牒',
  `STATUS` int(11) DEFAULT NULL COMMENT '0：草稿；\r\n            1：待审批；\r\n            2：已审批；（待签发）\r\n            3：已签发；（待签收）\r\n            4：已签收；\r\n            5：被打回；\r\n            ',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='公文主表';

-- ----------------------------
-- Records of t_oa_officialdocument
-- ----------------------------
INSERT INTO `t_oa_officialdocument` VALUES ('45', '1', '12', '2014-12-26 11:44:37', '2014-12-26 11:44:37', '超级测试', '超级测试', '1', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('46', '1', '11', '2014-12-27 17:30:25', '2014-12-27 17:30:25', 'fdas', 'dfsa', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('47', '1', '11', '2014-12-30 10:18:34', '2014-12-30 10:18:34', '框架', '快见面', '1', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('49', '1', '11', '2014-12-31 11:14:39', '2014-12-31 11:14:39', '草稿1', '草稿1草稿1草稿1草稿1草稿1草稿1草稿1草稿1草稿1草稿1草稿1', '3', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('50', '1', '11', '2014-12-31 11:23:35', '2014-12-31 11:23:35', '测试移交树结构bug', '测试移交树结构bug测试移交树结构bug测试移交树结构bug测试移交树结构bug测试移交树结构bug测试移交树结构bug测试移交树结构bug测试移交树结构bug测试移交树结构bug测试移交树结构bug测试移交树结构bug测试移交树结构bug', '5', '1', '2015-01-24 00:00:00', '1');
INSERT INTO `t_oa_officialdocument` VALUES ('51', '1003', '23', '2014-12-31 11:43:22', '2014-12-31 11:43:22', 'asdasd', 'asdasdasd', '1', '0', null, '5');
INSERT INTO `t_oa_officialdocument` VALUES ('52', '2', '26', '2014-12-31 11:51:11', '2014-12-31 11:51:11', '123123', '12312312', '1', '0', null, '3');
INSERT INTO `t_oa_officialdocument` VALUES ('53', '2', '26', '2014-12-31 11:52:18', '2014-12-31 11:52:18', '987654321', '8765432', '1', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('54', '2', '26', '2014-12-31 11:53:58', '2014-12-31 11:53:58', 'llllll', '2312', '1', '0', null, '3');
INSERT INTO `t_oa_officialdocument` VALUES ('55', '2', '26', '2014-12-31 11:56:40', '2014-12-31 11:56:40', '876767', '8768678\r\nasdasdasdasdadas\\asd\r\nasdasdasdada', '3', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('56', '1', '11', '2014-12-31 16:01:06', '2014-12-31 16:01:06', '未命名', '123123', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('57', '1', '11', '2014-12-31 16:05:31', '2014-12-31 16:05:31', '12312312', '3123123123', '4', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('59', '1', '11', '2015-01-05 09:37:29', '2015-01-05 09:37:29', 'ceset yi ge qicao ', '123', '4', '1', '2015-01-14 00:00:00', '1');
INSERT INTO `t_oa_officialdocument` VALUES ('60', '1', '11', '2015-01-05 09:57:35', '2015-01-05 09:57:35', '78654', '765432', '1', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('63', '1', '11', '2015-01-08 11:38:39', '2015-01-08 11:38:39', '000000000000', '0000000000000000', '5', '0', null, '3');
INSERT INTO `t_oa_officialdocument` VALUES ('65', '1', '11', '2015-01-09 17:09:39', '2015-01-09 17:09:39', 'testetse', 'sdfgsdf', '1', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('66', '1', '11', '2015-01-15 16:21:29', '2015-01-15 16:21:29', '08978765432', '98765432', '3', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('67', '2', '26', '2015-01-15 16:24:19', '2015-01-15 16:24:19', 'ghgfh', 'fgdfg9087654322123123', '3', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('68', '7', '26', '2015-01-15 16:53:09', '2015-01-15 16:57:28', '都是', '是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否弗兰克股份为几个人个将高考了个是否', '-1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('69', '7', '29', '2015-01-15 16:58:39', '2015-01-15 16:58:39', '的', ' 都是', '9', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('70', '7', '24', '2015-01-16 09:59:50', '2015-01-16 09:59:50', 'dfs', '将光棍节', '3', '1', '2015-01-15 00:00:00', '1');
INSERT INTO `t_oa_officialdocument` VALUES ('71', '7', '26', '2015-01-16 10:02:36', '2015-01-16 10:02:36', 'hg', 'jj佛挡杀佛', '1', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('72', '7', '26', '2015-01-16 10:24:39', '2015-01-16 10:24:39', '刘美', '发送', '4', '1', '2015-01-07 00:00:00', '1');
INSERT INTO `t_oa_officialdocument` VALUES ('73', '7', '16', '2015-01-16 10:26:53', '2015-01-16 10:26:53', 'Liume', '梵蒂冈', '1', '1', '2015-01-05 00:00:00', '3');
INSERT INTO `t_oa_officialdocument` VALUES ('74', '7', '22', '2015-01-16 10:46:56', '2015-01-16 10:46:56', '发的', '付水电费', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('75', '7', '26', '2015-01-16 10:54:07', '2015-01-16 10:54:07', '测试能否看到压缩包格式的文件', 'sdffd', '1', '0', null, '5');
INSERT INTO `t_oa_officialdocument` VALUES ('76', '7', '29', '2015-01-16 10:57:24', '2015-01-16 10:57:24', '都是', '水电费', '1', '0', null, '5');
INSERT INTO `t_oa_officialdocument` VALUES ('77', '7', '26', '2015-01-16 10:59:07', '2015-01-16 10:59:07', '是的', '的士费', '1', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('78', '7', '26', '2015-01-16 11:00:33', '2015-01-16 11:00:33', '水电费', '水电费', '1', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('81', '2', '26', '2015-01-16 14:18:28', '2015-01-16 14:18:28', '对双方都', '水电费', '1', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('82', '2', '26', '2015-01-16 14:28:14', '2015-01-16 14:28:14', '公文', '啊', '1', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('83', '1', '11', '2015-01-19 15:06:42', '2015-01-19 15:06:42', '0-987654', '98765432', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('84', '1', '11', '2015-01-19 15:09:52', '2015-01-19 15:09:52', '675432', '`13245678', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('85', '1', '11', '2015-01-19 15:10:17', '2015-01-19 15:10:17', '675432', '`13245678', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('86', '1', '11', '2015-01-19 15:18:00', '2015-01-19 15:18:00', '675432', '`13245678', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('87', '1', '11', '2015-01-19 15:20:30', '2015-01-19 15:20:30', '675432', '`13245678', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('88', '1', '11', '2015-01-19 15:33:58', '2015-01-19 15:33:58', '675432', '`13245678', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('89', '1', '11', '2015-01-20 10:01:39', '2015-01-20 10:01:39', '0987654', '0-98765432', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('90', '7', '29', '2015-01-21 10:37:12', '2015-01-21 10:37:12', 'Hello', '你好', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('91', '7', '29', '2015-01-21 10:43:07', '2015-01-21 10:43:07', 'test  test ', 'test', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('93', '7', '35', '2015-01-21 15:03:16', '2015-01-21 15:03:16', '放大镜首付款', '地方是飒飒发发水电费', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('94', '7', '29', '2015-01-21 15:51:13', '2015-01-21 15:51:13', '文件', '文件', '1', '0', null, '2');
INSERT INTO `t_oa_officialdocument` VALUES ('96', '7', '11', '2015-01-22 09:12:33', '2015-01-22 09:12:33', '早上好', '上班啦', '4', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('97', '7', '15', '2015-01-22 09:20:09', '2015-01-22 09:20:09', 'Good morning', '很好', '3', '1', '2015-01-23 00:00:00', '5');
INSERT INTO `t_oa_officialdocument` VALUES ('98', '1', '11', '2015-01-23 11:09:57', '2015-01-23 11:09:57', '098765432```l', '0987654', '1', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('101', '2', '15', '2015-01-26 10:54:14', '2015-01-26 10:57:40', '未命名123123123123123', '123123123123123123123', '5', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('103', '4', '16', '2015-01-28 09:38:44', '2015-02-03 11:09:04', '未命名', '1', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('104', '4', '13', '2015-01-28 09:53:47', '2015-01-28 09:53:47', '测试', '测试', '1', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('105', '4', '33', '2015-01-30 10:28:06', '2015-01-30 10:28:06', '测试', '测试', '1', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('106', '4', '33', '2015-01-30 10:37:19', '2015-01-30 10:37:19', 'ceshi', 'ceshi', '1', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('107', '6', '9', '2015-01-30 14:41:35', '2015-01-30 14:42:16', '测试1-30', '盛通1-30，测试用', '2', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('108', '6', '9', '2015-01-30 15:18:59', '2015-01-30 15:19:19', '测试123h', '测试123测试123', '3', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('110', '7', '52', '2015-02-03 08:58:13', '2015-02-03 08:58:13', '测试通知', '测试通知', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('111', '7', '59', '2015-02-03 09:09:11', '2015-02-03 09:09:11', '测试公文', '测试公文', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('112', '7', '59', '2015-02-03 09:16:14', '2015-02-03 09:16:14', '测试公文', '继续测试公文', '3', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('113', '4', '15', '2015-02-03 09:59:59', '2015-02-03 09:59:59', '测试都是', '对方水电费', '1', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('114', '4', '16', '2015-02-03 10:18:21', '2015-02-03 10:18:21', '34', '43', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('115', '4', '15', '2015-02-03 10:26:05', '2015-02-03 10:26:05', '12', '45', '3', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('116', '4', '16', '2015-02-03 10:57:17', '2015-02-03 10:57:17', '测试公文时效性', '测试公文时效性', '1', '1', '2015-02-03 00:00:00', '2');
INSERT INTO `t_oa_officialdocument` VALUES ('120', '7', '52', '2015-02-04 09:40:26', '2015-02-04 09:40:26', '测试盖章', '测试盖章', '1', '0', null, '2');
INSERT INTO `t_oa_officialdocument` VALUES ('121', '4', '9', '2015-02-04 09:55:19', '2015-02-04 09:55:19', 'ceshi公章', 'ceshi公章', '3', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('122', '7', '59', '2015-02-04 10:45:27', '2015-02-04 10:45:27', '测试短信通道', '测试短信通道', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('123', '7', '59', '2015-02-04 11:35:06', '2015-02-04 11:35:06', '测试短信', '测试短信', '2', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('124', '7', '52', '2015-02-04 11:45:37', '2015-02-04 11:45:37', '测试公文短信', '测试公文短信', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('126', '7', '35', '2015-02-04 14:03:36', '2015-02-04 14:03:36', '55555666666', '弄个长一点的东西来玩玩，试试。弄个长一点的东西来玩玩，试试。弄个长一点的东西来玩玩，试试。弄个长一点的东西来玩玩，试试。弄个长一点的东西来玩玩，试试。弄个长一点的东西来玩玩，试试。弄个长一点的东西来玩玩，试试。弄个长一点的东西来玩玩，试试。弄个长一点的东西来玩玩，试试。弄个长一点的东西来玩玩，试试。弄个长一点的东西来玩玩，试试。弄个长一点的东西来玩玩，试试。弄个长一点的东西来玩玩，试试。弄个长一点的东西来玩玩，试试。弄个长一点的东西来玩玩，试试。弄个长一点的东西来玩玩，试试。弄个长一点的东西来玩玩，试试。弄个长一点的东西来玩玩，试试。弄个长一点的东西来玩玩，试试。弄个长一点的东西来玩玩，试试。弄个长一点的东西来玩玩，试试。', '4', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('127', '7', '59', '2015-02-04 14:03:33', '2015-02-04 14:03:33', '2323', '23232', '3', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('128', '7', '59', '2015-02-04 14:05:12', '2015-02-04 14:05:12', '55', '5555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555', '2', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('129', '7', '52', '2015-02-04 14:05:59', '2015-02-04 14:05:59', '你好', 'fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费放水电费等fs付水电费', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('130', '7', '59', '2015-02-04 14:10:12', '2015-02-04 14:10:12', '方式发送到方式发送到方式发送到方式发送到方式发送到方式发送到方式发送到方式发送到方式发送到方式发送到', '试试', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('133', '4', '9', '2015-02-04 15:09:40', '2015-02-04 15:09:40', '设定', '55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555', '2', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('134', '4', '9', '2015-02-04 15:10:18', '2015-02-04 15:10:18', '的', '55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('135', '4', '16', '2015-02-04 15:27:18', '2015-02-04 15:27:18', '都是', '55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('136', '7', '52', '2015-02-05 09:26:26', '2015-02-05 09:26:26', '34', '34', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('137', '4', '9', '2015-02-05 11:14:08', '2015-02-05 11:14:08', '测试首页显示公文', '测试首页显示公文', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('138', '7', '52', '2015-02-05 11:44:48', '2015-02-05 11:44:48', '测试公章显示权限', '测试公章显示权限', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('139', '4', '9', '2015-02-05 11:46:32', '2015-02-05 11:46:32', '测试公章', '测试公章', '1', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('140', '4', '9', '2015-02-05 11:53:57', '2015-02-05 11:53:57', '1', '1', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('141', '7', '35', '2015-02-05 11:56:19', '2015-02-05 11:56:19', '1', '1', '1', '0', null, '2');
INSERT INTO `t_oa_officialdocument` VALUES ('143', '4', '9', '2015-02-06 11:42:48', '2015-02-06 11:42:48', '审批', '审批', '1', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('144', '7', '38', '2015-02-06 14:18:52', '2015-02-06 14:18:52', '测试公文文件上传', '测试公文文件上传', '1', '0', null, '2');
INSERT INTO `t_oa_officialdocument` VALUES ('145', '7', '38', '2015-02-06 14:30:23', '2015-02-06 14:30:23', '56', '56', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('146', '1', '9', '2015-02-06 14:33:05', '2015-02-06 14:33:05', '9087654', '89765432', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('147', '7', '38', '2015-02-06 14:58:48', '2015-02-06 14:58:48', '测试公文短信', '测试公文短信', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('148', '7', '52', '2015-02-06 15:32:24', '2015-02-06 15:32:24', '我要发文', '我要发文', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('150', '2', '9', '2015-02-09 09:01:31', '2015-02-09 09:01:31', '测试手机通知提醒', '测试手机通知提醒', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('151', '2', '8', '2015-02-09 09:07:37', '2015-02-09 09:07:37', '测试公文短信', '测试公文短信', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('152', '2', '8', '2015-02-09 09:08:49', '2015-02-09 09:08:49', '测试2', '测试2', '1', '0', null, '2');
INSERT INTO `t_oa_officialdocument` VALUES ('153', '7', '52', '2015-02-09 09:11:55', '2015-02-09 09:11:55', '测试3', '测试3', '1', '0', null, '2');
INSERT INTO `t_oa_officialdocument` VALUES ('154', '1', '9', '2015-02-09 14:08:36', '2015-02-09 14:08:36', '98765432', '876543', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('155', '1', '9', '2015-02-09 14:35:05', '2015-02-09 14:35:05', ',,m,m,m,m,m,m,', ',,m,m,m,m,m,m,', '1', '1', '2015-02-28 00:00:00', '3');
INSERT INTO `t_oa_officialdocument` VALUES ('156', '4', '36', '2015-02-09 15:12:50', '2015-02-09 15:12:50', '123', '是', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('157', '3', '52', '2015-02-09 15:37:06', '2015-02-09 15:37:06', 'lll', 'llllll', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('158', '1', '9', '2015-02-09 15:43:10', null, '未命名', null, '1', '0', null, '0');
INSERT INTO `t_oa_officialdocument` VALUES ('159', '4', null, '2015-02-09 16:28:05', null, '未命名', null, '1', '0', null, '0');
INSERT INTO `t_oa_officialdocument` VALUES ('160', '4', null, '2015-02-09 16:28:19', null, '未命名', null, '1', '0', null, '0');
INSERT INTO `t_oa_officialdocument` VALUES ('161', '4', null, '2015-02-09 16:28:32', null, '未命名', null, '1', '0', null, '0');
INSERT INTO `t_oa_officialdocument` VALUES ('162', '4', null, '2015-02-09 16:29:07', null, '未命名', null, '1', '0', null, '0');
INSERT INTO `t_oa_officialdocument` VALUES ('163', '1', '9', '2015-02-09 16:39:15', '2015-02-09 16:39:15', '12312312312312mm', '098765', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('164', '4', '9', '2015-02-10 09:10:06', '2015-02-10 09:10:06', '87', '87', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('165', '4', '9', '2015-02-10 09:11:09', '2015-02-10 09:11:09', '76', '76', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('166', '7', '38', '2015-02-10 09:23:10', '2015-02-10 09:23:10', '测试88', '88', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('167', '7', '52', '2015-02-10 09:23:46', '2015-02-10 09:23:46', '66', '66', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('168', '4', '33', '2015-02-10 09:25:17', '2015-02-10 09:25:17', '00', '00', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('169', '4', '36', '2015-02-10 09:43:28', '2015-02-10 09:43:28', '公文测试22', '公文测试22，重新提交', '3', '0', null, '3');
INSERT INTO `t_oa_officialdocument` VALUES ('170', '4', '9', '2015-02-10 11:04:32', '2015-02-10 11:04:32', '发布公文，一直操作至直接签收', '发布公文，一直操作至直接签收', '1', '0', null, '4');
INSERT INTO `t_oa_officialdocument` VALUES ('171', '1', '9', '2015-02-10 11:06:17', '2015-02-10 11:06:21', '测试上传书库01234567890123456789012345678901234567890123', '测试', '2', '0', null, '2');
INSERT INTO `t_oa_officialdocument` VALUES ('172', '7', '52', '2015-02-10 11:23:07', '2015-02-10 11:23:07', '测试盖章', '测试盖章', '1', '0', null, '2');
INSERT INTO `t_oa_officialdocument` VALUES ('173', '4', '36', '2015-02-10 15:34:24', '2015-02-10 15:34:24', '54', '43', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('174', '1', '9', '2015-02-10 16:19:57', '2015-02-10 16:19:57', 'test', 'sdfg', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('175', '1', '9', '2015-02-10 16:20:32', '2015-02-10 16:20:32', 'test', 'test', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('176', '1', '9', '2015-02-10 16:22:31', '2015-02-10 16:22:31', 'test', 'sss', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('177', '4', '9', '2015-02-10 16:45:57', '2015-02-10 16:45:57', '1324', '432', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('178', '7', '38', '2015-02-11 11:23:08', '2015-02-11 11:23:08', '几十块了地方几十块了地方几十块了地方几十块了地方几十块了地方几十块了地方几十块了地方几十块了地方几十', '是', '1', '0', null, '1');
INSERT INTO `t_oa_officialdocument` VALUES ('179', '7', '38', '2015-02-11 16:28:17', '2015-02-11 16:28:17', '测试公文', '测试公文', '1', '0', null, '1');

-- ----------------------------
-- Table structure for `t_oa_officialdocument_deliver`
-- ----------------------------
DROP TABLE IF EXISTS `t_oa_officialdocument_deliver`;
CREATE TABLE `t_oa_officialdocument_deliver` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OFFICIALDOCUMENTID` int(11) DEFAULT NULL COMMENT '公文关联属性',
  `USERID` int(11) DEFAULT NULL COMMENT '操作人',
  `ORGID` int(11) DEFAULT NULL COMMENT '操作人组织机构',
  `DELIVERID` int(11) DEFAULT NULL COMMENT '单位或人的id',
  `DELIVERTYPE` int(11) DEFAULT NULL COMMENT '1：直接转交给人；2：转交给部门（组织机构）',
  `DELIVERDATE` datetime DEFAULT NULL,
  `CHANGEFLAG` int(11) DEFAULT NULL COMMENT '0：未变更状态（操作人认为无权处理，直接转手）；\r\n            1：变更了状态（操作人已对公文进行了某种处理）；',
  `CHANGESTATUS` int(11) DEFAULT NULL COMMENT '0：草稿；\r\n            1：待审批；\r\n            2：已审批；\r\n            3：已签发；\r\n            4：已签收；\r\n            5：被打回；\r\n            6：重新提交',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=365 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='公文流转记录表';

-- ----------------------------
-- Records of t_oa_officialdocument_deliver
-- ----------------------------
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('34', '45', '1', '12', '12', '2', '2014-12-26 11:43:49', '0', '0');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('35', '45', '1', '12', '12', '2', '2014-12-26 11:43:56', '0', '0');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('36', '45', '1', '12', '12', '2', '2014-12-26 11:44:37', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('37', '45', '1', '12', '1003', '1', '2014-12-26 15:21:05', '0', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('38', '45', '1003', '13', '1', '1', '2014-12-27 15:30:47', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('39', '45', '1003', '23', '3', '1', '2014-12-27 15:34:39', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('41', '45', '1003', '23', '4', '1', '2014-12-27 15:34:39', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('44', '45', '1003', '23', '2', '1', '2014-12-27 15:34:39', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('45', '45', '2', '26', '2', '1', '2014-12-27 16:08:05', '0', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('46', '46', '1', '11', '1010', '1', '2014-12-27 17:30:15', '0', '0');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('47', '46', '1', '11', '1010', '1', '2014-12-27 17:30:25', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('48', '47', '1', '11', '2', '1', '2014-12-30 10:18:34', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('49', '47', '2', '26', '1', '1', '2014-12-30 10:23:11', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('50', '47', '1', '11', '1', '1', '2014-12-30 10:29:17', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('51', '47', '1', '11', '2', '1', '2014-12-30 10:29:17', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('52', '47', '1', '11', '1', '1', '2014-12-30 10:29:30', '0', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('53', '49', '1', '11', '13', '2', '2014-12-31 11:12:46', '0', '0');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('54', '49', '1', '11', '13', '2', '2014-12-31 11:14:39', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('55', '49', '2', '26', '1', '1', '2014-12-31 11:18:48', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('56', '50', '1', '11', '13', '2', '2014-12-31 11:23:35', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('57', '50', '2', '26', '1003', '1', '2014-12-31 11:29:47', '0', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('58', '50', '1003', '23', '1', '1', '2014-12-31 11:34:49', '1', '5');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('60', '51', '1003', '23', '2', '1', '2014-12-31 11:43:22', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('61', '51', '2', '26', '1003', '1', '2014-12-31 11:43:36', '1', '5');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('62', '52', '2', '26', '1003', '1', '2014-12-31 11:51:11', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('63', '52', '1003', '23', '2', '1', '2014-12-31 11:51:42', '1', '5');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('64', '53', '2', '26', '1003', '1', '2014-12-31 11:52:18', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('65', '53', '1003', '23', '2', '1', '2014-12-31 11:52:42', '1', '5');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('66', '54', '2', '26', '1003', '1', '2014-12-31 11:53:58', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('67', '54', '1003', '23', '2', '1', '2014-12-31 11:54:09', '1', '5');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('68', '55', '2', '26', '1003', '1', '2014-12-31 11:56:40', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('69', '55', '1003', '23', '2', '1', '2014-12-31 11:56:54', '1', '5');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('71', '56', '1', '11', '2', '1', '2014-12-31 15:06:40', '0', '0');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('72', '56', '1', '11', '31', '2', '2014-12-31 16:01:06', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('73', '57', '1', '11', '32', '2', '2014-12-31 16:01:29', '0', '0');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('74', '57', '1', '11', '1003', '1', '2014-12-31 16:05:10', '0', '0');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('75', '57', '1', '11', '1003', '1', '2014-12-31 16:05:31', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('76', '57', '1003', '23', '2', '1', '2014-12-31 16:11:25', '0', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('77', '57', '2', '26', '17', '2', '2014-12-31 16:12:30', '0', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('78', '59', '1', '11', '13', '2', '2015-01-04 09:09:42', '0', '0');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('79', '59', '1', '11', '2', '1', '2015-01-04 11:38:43', '0', '0');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('80', '59', '1', '11', '2', '1', '2015-01-04 11:44:44', '0', '0');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('81', '59', '1', '11', '2', '1', '2015-01-04 11:44:57', '0', '0');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('82', '59', '1', '11', '13', '2', '2015-01-04 11:45:33', '0', '0');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('83', '59', '1', '11', '2', '1', '2015-01-04 11:46:03', '0', '0');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('84', '59', '1', '11', '1003', '1', '2015-01-04 11:54:09', '0', '0');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('85', '59', '1', '11', '1003', '1', '2015-01-05 09:24:30', '0', '0');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('86', '59', '1', '11', '1003', '1', '2015-01-05 09:28:19', '0', '0');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('87', '59', '1', '11', '1003', '1', '2015-01-05 09:37:29', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('88', '60', '1', '11', '32', '2', '2015-01-05 09:57:35', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('91', '50', '1', '11', '1003', '1', '2015-01-05 15:15:51', '1', '6');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('92', null, '1', '11', '1', '1', '2015-01-05 15:57:20', '0', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('93', null, '1', '11', '1', '1', '2015-01-05 15:59:05', '0', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('94', '49', '1', '11', '1', '1', '2015-01-05 16:03:54', '0', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('95', '49', '1', '11', '1', '1', '2015-01-05 16:04:04', '0', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('96', '49', '1', '11', '1', '1', '2015-01-05 16:13:51', '1', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('97', '60', '2', '26', '1', '1', '2015-01-05 16:17:28', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('98', '60', '1', '11', '1', '1', '2015-01-07 08:50:38', '1', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('101', '52', '2', '26', '1', '1', '2015-01-07 10:25:36', '1', '6');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('102', '52', '1', '11', '2', '1', '2015-01-07 10:26:12', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('104', '52', '2', '37', '1003', '1', '2015-01-08 09:13:20', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('105', '54', '2', '26', '1003', '1', '2015-01-08 09:27:38', '1', '6');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('106', '54', '1003', '13', '2', '1', '2015-01-08 09:28:11', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('107', '54', '2', '13', '2', '1', '2015-01-08 09:45:54', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('108', '54', '2', '13', '1004', '1', '2015-01-08 09:45:54', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('110', '63', '1', '11', '2', '1', '2015-01-08 11:38:39', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('111', '63', '2', '26', '1', '1', '2015-01-08 11:39:05', '1', '5');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('112', '63', '1', '11', '2', '1', '2015-01-08 11:39:45', '1', '6');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('113', '63', '2', '8', '1', '1', '2015-01-08 11:40:08', '1', '5');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('114', '47', '1', '11', '1', '11', '2015-01-08 11:59:56', '1', '7');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('115', '63', '1', '11', '2', '1', '2015-01-08 13:46:18', '1', '6');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('116', '63', '2', '13', '1', '1', '2015-01-08 13:46:41', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('117', '63', '1', '11', '1003', '1', '2015-01-08 13:47:42', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('118', '63', '1', '11', '2', '1', '2015-01-08 13:47:42', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('119', '63', '2', '13', '2', '1', '2015-01-08 14:30:38', '0', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('120', '45', '1', '12', '1', '12', '2015-01-09 16:31:32', '1', '7');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('121', '45', '1', '12', '1', '12', '2015-01-09 16:33:57', '1', '7');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('122', '45', '1', '12', '1', '12', '2015-01-09 16:34:43', '1', '7');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('123', '45', '1', '12', '1', '12', '2015-01-09 16:36:28', '1', '7');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('124', '65', '1', '11', '2', '1', '2015-01-09 17:09:39', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('125', '66', '1', '11', '2', '1', '2015-01-15 16:21:29', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('126', '67', '2', '26', '1', '1', '2015-01-15 16:24:19', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('127', '68', '1011', '26', '38', '2', '2015-01-15 16:57:28', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('128', '69', '1011', '29', '38', '2', '2015-01-15 16:58:39', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('129', '70', '1011', '24', '1004', '1', '2015-01-16 09:59:50', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('130', '71', '1011', '26', '1011', '1', '2015-01-16 10:02:36', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('131', '71', '1011', '22', '1011', '1', '2015-01-16 10:03:08', '1', '5');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('132', '71', '1011', '26', '1011', '1', '2015-01-16 10:03:29', '1', '6');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('133', '71', '1011', '8', '1011', '1', '2015-01-16 10:03:51', '1', '5');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('134', '71', '1011', '26', '1011', '1', '2015-01-16 10:04:15', '1', '6');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('135', '71', '1011', '29', '1011', '1', '2015-01-16 10:04:31', '0', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('136', '71', '1011', '26', '1011', '1', '2015-01-16 10:04:46', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('137', '71', '1011', '26', '1011', '26', '2015-01-16 10:18:32', '1', '7');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('138', '72', '1011', '26', '1011', '1', '2015-01-16 10:24:39', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('139', '73', '1011', '16', '1007', '1', '2015-01-16 10:26:53', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('140', '73', '1007', '29', '1011', '1', '2015-01-16 10:27:24', '1', '5');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('141', '73', '1011', '16', '1007', '1', '2015-01-16 10:27:57', '1', '6');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('142', '73', '1007', '29', '1011', '1', '2015-01-16 10:31:07', '0', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('143', '73', '1011', '31', '1011', '1', '2015-01-16 10:31:28', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('144', '74', '1011', '22', '2', '1', '2015-01-16 10:46:56', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('145', '75', '1011', '26', '2', '1', '2015-01-16 10:54:07', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('146', '76', '1011', '29', '2', '1', '2015-01-16 10:57:24', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('147', '77', '1011', '26', '2', '1', '2015-01-16 10:59:07', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('148', '78', '1011', '26', '2', '1', '2015-01-16 11:00:33', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('149', '81', '2', '26', '1011', '1', '2015-01-16 14:18:28', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('150', '81', '1011', '26', '1011', '1', '2015-01-16 14:19:12', '0', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('151', '81', '1011', '29', '2', '1', '2015-01-16 14:19:23', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('152', '81', '2', '26', '2', '1', '2015-01-16 14:21:29', '0', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('153', '81', '2', '26', '2', '26', '2015-01-16 14:22:56', '1', '7');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('154', '82', '2', '26', '1011', '1', '2015-01-16 14:28:14', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('155', '82', '1011', '29', '2', '1', '2015-01-16 14:28:47', '0', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('156', '82', '2', '13', '2', '1', '2015-01-16 14:29:11', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('157', '82', '2', '9', '2', '1', '2015-01-16 14:30:31', '1', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('158', '77', '2', '9', '1011', '1', '2015-01-16 14:32:25', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('159', '77', '1011', '26', '1011', '1', '2015-01-16 14:39:25', '1', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('160', '78', '2', '11', '1011', '1', '2015-01-16 14:48:09', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('161', '78', '1011', '26', '1011', '1', '2015-01-16 14:48:47', '1', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('162', '83', '1', '11', '1004', '1', '2015-01-19 15:06:42', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('163', '84', '1', '11', '1004', '1', '2015-01-19 15:09:52', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('164', '85', '1', '11', '1004', '1', '2015-01-19 15:10:17', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('165', '86', '1', '11', '1004', '1', '2015-01-19 15:18:00', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('166', '87', '1', '11', '1004', '1', '2015-01-19 15:20:30', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('167', '88', '1', '11', '1004', '1', '2015-01-19 15:33:58', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('168', '89', '1', '11', '37', '2', '2015-01-20 10:01:39', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('169', '67', '1', '11', '2', '1', '2015-01-20 10:02:20', '1', '5');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('170', '67', '2', '26', '1', '1', '2015-01-20 11:28:29', '1', '6');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('171', '67', '1', '11', '2', '1', '2015-01-20 11:29:45', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('172', '67', '2', '11', '2', '1', '2015-01-20 11:43:54', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('173', '67', '2', '11', '1011', '1', '2015-01-20 11:43:54', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('174', '67', '2', '26', '2', '1', '2015-01-20 11:46:49', '0', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('177', '67', '2', '26', '2', '26', '2015-01-20 13:57:37', '1', '7');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('178', '66', '2', '11', '1', '1', '2015-01-20 15:24:02', '1', '5');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('179', '66', '1', '11', '2', '1', '2015-01-21 10:02:36', '1', '6');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('180', '66', '2', '37', '1', '1', '2015-01-21 10:03:23', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('181', '66', '1', '11', '1', '1', '2015-01-21 10:08:43', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('182', '66', '1', '11', '2', '1', '2015-01-21 10:08:43', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('183', '66', '1', '11', '1', '1', '2015-01-21 10:09:00', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('184', '66', '1', '11', '2', '1', '2015-01-21 10:09:00', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('185', '66', '1', '11', '1', '1', '2015-01-21 10:12:45', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('186', '66', '1', '11', '2', '1', '2015-01-21 10:12:45', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('187', '55', '2', '26', '1', '1', '2015-01-21 10:17:39', '1', '6');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('188', '53', '2', '26', '1', '1', '2015-01-21 10:19:08', '1', '6');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('189', '90', '1007', '29', '1011', '1', '2015-01-21 10:37:12', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('190', '91', '1007', '29', '1011', '1', '2015-01-21 10:43:07', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('193', '93', '1011', '35', '1007', '1', '2015-01-21 15:03:16', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('194', '94', '1007', '29', '1011', '1', '2015-01-21 15:51:13', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('195', '94', '1011', '35', '1007', '1', '2015-01-21 15:59:39', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('197', '96', '1011', '11', '1011', '1', '2015-01-22 09:12:33', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('198', '97', '1007', '15', '1011', '1', '2015-01-22 09:20:09', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('199', '97', '1011', '11', '1007', '1', '2015-01-22 09:21:18', '1', '5');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('200', '97', '1007', '15', '1011', '1', '2015-01-22 09:22:03', '1', '6');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('201', '97', '1011', '35', '1007', '1', '2015-01-22 09:22:44', '1', '5');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('202', '98', '1', '11', '2', '1', '2015-01-23 11:09:57', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('203', '98', '2', '11', '1', '1', '2015-01-26 10:40:21', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('205', '101', '2', '15', '1', '1', '2015-01-26 10:56:10', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('206', '101', '2', '15', '1', '1', '2015-01-26 10:57:40', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('207', '101', '1', '11', '2', '1', '2015-01-26 10:59:05', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('208', '98', '1', null, '1', '1', '2015-01-27 09:05:17', '1', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('209', '101', '2', '8', '2', '1', '2015-01-27 09:10:43', '1', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('210', '65', '2', '8', '1', '1', '2015-01-27 09:18:34', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('211', '65', '1', null, '2', '1', '2015-01-27 09:26:32', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('212', '104', '4', '13', '5', '1', '2015-01-28 09:53:47', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('213', '104', '5', '15', '4', '1', '2015-01-28 09:54:50', '0', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('214', '104', '4', '33', '4', '1', '2015-01-28 09:55:27', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('215', '104', '4', '13', '5', '1', '2015-01-28 09:55:50', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('216', '104', '4', '13', '4', '13', '2015-01-28 09:57:12', '1', '7');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('217', '105', '4', '33', '7', '1', '2015-01-30 10:28:06', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('218', '105', '7', '37', '4', '1', '2015-01-30 10:28:32', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('219', '105', '4', '33', '4', '1', '2015-01-30 10:29:22', '1', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('220', '106', '4', '33', '7', '1', '2015-01-30 10:37:19', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('221', '106', '7', '15', '4', '1', '2015-01-30 10:37:41', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('222', '106', '4', '13', '7', '1', '2015-01-30 10:38:27', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('223', '107', '6', '9', '7', '1', '2015-01-30 14:41:35', '0', '0');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('224', '107', '6', '9', '7', '1', '2015-01-30 14:42:16', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('225', '107', '7', '15', '2', '1', '2015-01-30 14:48:52', '0', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('226', '107', '2', '8', '6', '1', '2015-01-30 14:50:54', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('227', '107', '6', '9', '6', '1', '2015-01-30 14:53:18', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('228', '107', '6', '9', '7', '1', '2015-01-30 14:53:18', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('229', '107', '6', '9', '6', '1', '2015-01-30 14:56:19', '0', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('230', '107', '6', '9', '6', '9', '2015-01-30 14:57:14', '1', '7');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('231', '108', '6', '9', '7', '1', '2015-01-30 15:18:59', '0', '0');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('232', '108', '6', '9', '7', '1', '2015-01-30 15:19:19', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('233', '108', '7', '15', '2', '1', '2015-01-30 15:20:53', '0', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('234', '108', '2', '8', '6', '1', '2015-01-30 15:22:01', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('235', '108', '6', '9', '6', '1', '2015-01-30 15:23:48', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('236', '108', '6', '9', '7', '1', '2015-01-30 15:23:48', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('237', '108', '6', '9', '6', '1', '2015-01-30 15:23:56', '0', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('238', '108', '6', '9', '6', '9', '2015-01-30 15:24:23', '1', '7');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('239', '110', '7', '52', '4', '1', '2015-02-03 08:58:13', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('240', '111', '7', '59', '13', '2', '2015-02-03 09:09:11', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('241', '112', '7', '59', '4', '1', '2015-02-03 09:16:14', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('242', '112', '4', '16', '7', '1', '2015-02-03 09:19:34', '1', '5');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('243', '112', '7', '59', '4', '1', '2015-02-03 09:40:53', '1', '6');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('244', '112', '4', '16', '2', '1', '2015-02-03 09:42:26', '0', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('245', '112', '2', '8', '7', '1', '2015-02-03 09:44:48', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('246', '112', '7', '59', '4', '1', '2015-02-03 09:45:46', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('247', '106', '4', '33', '4', '33', '2015-02-03 09:47:39', '1', '7');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('248', '112', '4', '9', '4', '1', '2015-02-03 09:47:53', null, null);
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('249', '113', '4', '15', '7', '1', '2015-02-03 09:59:59', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('250', '113', '7', '52', '4', '1', '2015-02-03 10:08:34', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('251', '113', '4', '16', '7', '1', '2015-02-03 10:09:17', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('252', '113', '7', '59', '7', '1', '2015-02-03 10:12:29', null, null);
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('253', '114', '4', '16', '7', '1', '2015-02-03 10:18:21', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('254', '115', '4', '15', '7', '1', '2015-02-03 10:26:05', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('255', '115', '7', '52', '4', '1', '2015-02-03 10:31:07', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('256', '115', '4', '15', '7', '1', '2015-02-03 10:33:20', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('257', '115', '4', '15', '4', '15', '2015-02-03 10:33:31', '1', '7');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('258', '116', '4', '16', '7', '1', '2015-02-03 10:57:17', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('259', '103', '4', '16', '7', '1', '2015-02-03 11:09:04', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('261', '65', '2', '8', '2', '1', '2015-02-04 09:12:28', null, null);
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('262', '66', '2', '8', '2', '1', '2015-02-04 09:15:22', '0', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('263', '54', '2', '8', '2', '1', '2015-02-04 09:16:38', '0', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('264', '53', '1', '11', '2', '1', '2015-02-04 09:21:13', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('265', '53', '2', '8', '6', '1', '2015-02-04 09:21:46', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('266', '116', '7', '59', '4', '1', '2015-02-04 09:36:41', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('267', '120', '7', '52', '4', '1', '2015-02-04 09:40:26', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('268', '53', '6', '9', '6', '1', '2015-02-04 09:40:47', '1', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('269', '120', '4', '9', '7', '1', '2015-02-04 09:41:20', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('270', '55', '1', '11', '2', '1', '2015-02-04 09:54:58', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('271', '121', '4', '9', '7', '1', '2015-02-04 09:55:19', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('272', '121', '7', '35', '4', '1', '2015-02-04 09:57:33', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('273', '55', '2', '8', '6', '1', '2015-02-04 09:59:26', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('274', '55', '6', '9', '6', '1', '2015-02-04 09:59:40', '1', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('275', '122', '7', '59', '4', '1', '2015-02-04 10:45:27', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('276', '123', '7', '59', '4', '1', '2015-02-04 11:35:06', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('277', '124', '7', '52', '4', '1', '2015-02-04 11:45:37', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('278', '126', '7', '35', '6', '1', '2015-02-04 14:03:36', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('279', '127', '7', '59', '4', '1', '2015-02-04 14:03:33', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('280', '126', '6', '9', '7', '1', '2015-02-04 14:04:09', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('281', '126', '7', '35', '6', '1', '2015-02-04 14:04:39', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('282', '128', '7', '59', '4', '1', '2015-02-04 14:05:12', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('283', '129', '7', '52', '4', '1', '2015-02-04 14:05:59', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('284', '126', '7', '35', '7', '35', '2015-02-04 14:07:01', '1', '7');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('285', '130', '7', '59', '4', '1', '2015-02-04 14:10:12', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('286', '133', '4', '9', '4', '1', '2015-02-04 15:09:40', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('287', '134', '4', '9', '4', '1', '2015-02-04 15:10:18', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('288', '135', '4', '16', '4', '1', '2015-02-04 15:27:18', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('289', '66', '1', '11', '1', '1', '2015-02-04 16:09:38', '0', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('290', '66', '1', '11', '1', '11', '2015-02-04 16:09:47', '1', '7');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('291', '76', '2', '8', '1011', '1', '2015-02-04 16:10:56', '1', '5');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('292', '75', '2', '8', '7', '1', '2015-02-04 16:14:54', '1', '5');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('293', '136', '7', '52', '4', '1', '2015-02-05 09:26:26', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('294', '137', '4', '9', '7', '1', '2015-02-05 11:14:08', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('295', '138', '7', '52', '4', '1', '2015-02-05 11:44:48', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('296', '139', '4', '9', '7', '1', '2015-02-05 11:46:32', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('297', '139', '7', '52', '4', '1', '2015-02-05 11:47:28', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('298', '139', '4', '9', '7', '1', '2015-02-05 11:49:14', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('299', '139', '4', '9', '4', '9', '2015-02-05 11:52:51', '1', '7');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('300', '140', '4', '9', '7', '1', '2015-02-05 11:53:57', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('301', '141', '7', '35', '2', '1', '2015-02-05 11:56:19', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('302', '141', '2', '8', '7', '1', '2015-02-05 11:56:44', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('303', '143', '4', '9', '7', '1', '2015-02-06 11:42:48', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('304', '143', '7', '52', '4', '1', '2015-02-06 11:43:36', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('305', '143', '4', '9', '7', '1', '2015-02-06 11:45:20', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('306', '143', '4', '9', '4', '9', '2015-02-06 11:45:26', '1', '7');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('307', '144', '7', '38', '4', '1', '2015-02-06 14:18:52', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('308', '144', '4', '9', '7', '1', '2015-02-06 14:29:01', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('309', '145', '7', '38', '4', '1', '2015-02-06 14:30:23', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('310', '146', '1', '9', '9', '2', '2015-02-06 14:33:05', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('311', '147', '7', '38', '4', '1', '2015-02-06 14:58:48', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('312', '148', '7', '52', '4', '1', '2015-02-06 15:32:24', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('313', '150', '2', '9', '37', '2', '2015-02-09 09:01:31', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('314', '151', '2', '8', '4', '1', '2015-02-09 09:07:37', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('315', '152', '2', '8', '4', '1', '2015-02-09 09:08:49', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('316', '152', '4', '16', '2', '1', '2015-02-09 09:10:07', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('317', '153', '7', '52', '4', '1', '2015-02-09 09:11:55', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('318', '153', '4', '34', '7', '1', '2015-02-09 09:12:30', '1', '5');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('319', '153', '7', '52', '4', '1', '2015-02-09 09:17:02', '1', '6');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('320', '153', '4', '36', '7', '1', '2015-02-09 09:19:42', '1', '5');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('321', '153', '7', '52', '4', '1', '2015-02-09 09:20:08', '1', '6');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('322', '153', '4', '33', '7', '1', '2015-02-09 09:26:33', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('323', '154', '1', '9', '9', '2', '2015-02-09 14:08:36', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('324', '155', '1', '9', '2', '1', '2015-02-09 14:35:05', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('325', '155', '2', '37', '1', '1', '2015-02-09 14:36:28', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('326', '155', '1', '9', '2', '1', '2015-02-09 14:39:14', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('327', '156', '4', '36', '7', '1', '2015-02-09 15:12:50', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('328', '157', '3', '52', '2', '1', '2015-02-09 15:37:06', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('329', '163', '1', '9', '2', '1', '2015-02-09 16:39:15', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('330', '163', '2', '8', '1', '1', '2015-02-09 16:40:00', '1', '5');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('331', '163', '1', '9', '2', '1', '2015-02-09 16:51:43', '1', '6');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('332', '164', '4', '9', '13', '2', '2015-02-10 09:10:06', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('333', '165', '4', '9', '7', '1', '2015-02-10 09:11:09', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('334', '166', '7', '38', '31', '2', '2015-02-10 09:23:10', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('335', '167', '7', '52', '37', '2', '2015-02-10 09:23:46', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('336', '168', '4', '33', '31', '2', '2015-02-10 09:25:17', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('337', '169', '4', '36', '7', '1', '2015-02-10 09:43:28', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('338', '169', '7', '38', '4', '1', '2015-02-10 09:43:49', '1', '5');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('339', '169', '4', '36', '7', '1', '2015-02-10 09:44:19', '1', '6');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('340', '169', '7', '38', '4', '1', '2015-02-10 09:44:49', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('341', '169', '4', '36', '7', '1', '2015-02-10 09:46:05', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('342', '169', '4', '36', '6', '1', '2015-02-10 09:46:05', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('343', '169', '4', '36', '4', '1', '2015-02-10 09:46:05', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('344', '169', '4', '36', '2', '1', '2015-02-10 09:46:05', '1', '3');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('345', '169', '7', '52', '7', '1', '2015-02-10 09:49:40', '0', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('346', '169', '6', '38', '6', '1', '2015-02-10 09:50:24', '0', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('347', '170', '4', '9', '7', '1', '2015-02-10 11:04:32', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('348', '170', '7', '38', '4', '1', '2015-02-10 11:04:49', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('349', '170', '4', '36', '4', '1', '2015-02-10 11:05:27', '1', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('350', '171', '1', '9', '7', '1', '2015-02-10 11:06:17', '0', '0');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('351', '171', '1', '9', '7', '1', '2015-02-10 11:06:21', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('352', '171', '7', '52', '1', '1', '2015-02-10 11:08:27', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('353', '171', '7', '52', '1', '1', '2015-02-10 11:08:28', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('354', '121', '4', '34', '4', '1', '2015-02-10 11:08:35', '1', '4');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('355', '172', '7', '52', '4', '1', '2015-02-10 11:23:07', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('356', '172', '4', '13', '7', '1', '2015-02-10 11:24:10', '1', '2');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('357', '173', '4', '36', '2', '1', '2015-02-10 15:34:24', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('358', '174', '1', '9', '11', '1', '2015-02-10 16:19:57', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('359', '175', '1', '9', '11', '1', '2015-02-10 16:20:32', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('360', '176', '1', '9', '11', '1', '2015-02-10 16:22:31', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('361', '177', '4', '9', '7', '1', '2015-02-10 16:45:57', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('362', '178', '7', '38', '4', '1', '2015-02-11 11:23:08', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('363', '179', '7', '38', '4', '1', '2015-02-11 16:28:17', '1', '1');
INSERT INTO `t_oa_officialdocument_deliver` VALUES ('364', '169', '2', '8', '2', '1', '2015-02-13 11:32:16', '0', '4');

-- ----------------------------
-- Table structure for `t_oa_officialdocument_file`
-- ----------------------------
DROP TABLE IF EXISTS `t_oa_officialdocument_file`;
CREATE TABLE `t_oa_officialdocument_file` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OFFICIALDOCUMENTID` int(11) DEFAULT NULL,
  `FILEPATH` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '文件在服务器中的存储相对路径（带物理文件名）',
  `SUFFIX` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '文件后缀',
  `SIZE` double DEFAULT NULL COMMENT '单位 字节（b）',
  `FILENAME` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '文件的逻辑文件名',
  `SOURCEFILEFLAG` int(11) DEFAULT NULL COMMENT '1：公文起草人 第一次发起时 提供的附件；\r\n            0：公文在其他人经手或审批时提供的附件；',
  `UPLOADDATE` datetime DEFAULT NULL,
  `USERID` int(11) DEFAULT NULL,
  `ORGID` int(11) DEFAULT NULL,
  `DELIVERID` int(11) DEFAULT NULL COMMENT '记录是哪个流转记录提交的文件',
  `SEALPATH` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '加盖了公章的文件地址',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='公文附件表';

-- ----------------------------
-- Records of t_oa_officialdocument_file
-- ----------------------------
INSERT INTO `t_oa_officialdocument_file` VALUES ('8', '45', '/eos/application/octet-stream/20141226/8155da9f9c77d89826c8e1bd858d53fa.sql', 'sql', '7918', 'oa base.sql', '1', '2014-12-26 11:44:37', '1', '12', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('9', '46', '/eos/application/octet-stream/20141227/ae433aa4895821d72f1d5627d245124d.docx', 'docx', '490738', '新建 Microsoft Office Word 文档.docx', '1', '2014-12-27 17:30:15', '1', '11', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('10', '46', '/eos/application/octet-stream/20141227/ae433aa4895821d72f1d5627d245124d.docx', 'docx', '490738', '新建 Microsoft Office Word 文档.docx', '1', '2014-12-27 17:30:25', '1', '11', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('12', '49', '/eos/application/octet-stream/20141231/2f8f2d83af8a2cd4ece48a2a7076008f.docx', 'docx', '16055', '2014-12-29至30临澧出差报告.docx', '1', '2014-12-31 11:12:46', '1', '11', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('13', '59', '/eos/application/octet-stream/20150104/2846e66797e9a7f86fd2d22226c90da4.txt', 'txt', '98', '新建文本文档.txt', '1', '2015-01-04 09:09:42', '1', '11', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('16', '50', '/eos/application/octet-stream/20150105/26ff227f36497d76e9f5ffe849b8e255.xlsx', 'xlsx', '42524', 'eduZ100版本规划（禁止提交客户）.xlsx', '1', '2015-01-05 15:15:51', null, null, null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('17', '52', '/eos/application/octet-stream/20150107/6d1dd677273e30e22d175d43ae92ea7f.xlsx', 'xlsx', '42543', 'eduZ100版本规划（禁止提交客户）.xlsx', '1', '2015-01-07 10:25:36', null, null, null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('19', '65', '/eos/application/octet-stream/20150109/edc2abc5911f4e664ba4d9517af08c05.doc', 'doc', '43520', '系统工程师.doc', '1', '2015-01-09 17:09:39', '1', '11', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('20', '66', '/eos/application/octet-stream/20150115/4c0014986e7b7145dfe0848384378616.1.doc', 'doc', '150016', '教育综合运营平台产品建设方案v0.1.doc', '1', '2015-01-15 16:21:29', '1', '11', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('21', '67', '/eos/application/octet-stream/20150115/001819c0f972fc5c57e600ce32453bfc.docx', 'docx', '16709', '临澧出差报告1-12.docx', '1', '2015-01-15 16:24:19', '2', '26', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('22', '77', '/eos/application/octet-stream/20150116/82ab1687d88e41856ed5c7e225c91533.xls', 'xls', '24064', 'CompanyXLSDetail (2).xls', '1', '2015-01-16 10:59:07', '1011', '26', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('28', '98', '/eos/application/octet-stream/20150123/0c3f5ed39164404ef5112d038611711f.docx', 'null', '14134', 'kettle解决方案.docx', '1', '2015-01-23 11:09:57', '1', '11', null, '/eduz100/stamp/2015-01-26/0c3f5ed39164404ef5112d038611711f_stamp.pdf');
INSERT INTO `t_oa_officialdocument_file` VALUES ('30', '101', '/eos/application/octet-stream/20150126/001819c0f972fc5c57e600ce32453bfc.docx', 'pdf', '16709', '临澧出差报告1-12.docx', '1', '2015-01-26 10:54:14', '2', null, null, '/eduz100/stamp/2015-01-26/001819c0f972fc5c57e600ce32453bfc_stamp.pdf');
INSERT INTO `t_oa_officialdocument_file` VALUES ('31', '107', '/eos/application/octet-stream/20150130/e169f42efec3bc788d1298e38fde4996.docx', 'pdf', '16752', '测试用文档.docx', '1', '2015-01-30 14:41:35', '6', '9', null, '/eduz100/stamp/2015-01-30/e169f42efec3bc788d1298e38fde4996_stamp.pdf');
INSERT INTO `t_oa_officialdocument_file` VALUES ('32', '108', '/eos/application/octet-stream/20150130/e169f42efec3bc788d1298e38fde4996.docx', 'pdf', '16752', '测试用文档.docx', '1', '2015-01-30 15:18:59', '6', '9', null, '/eduz100/stamp/2015-01-30/e169f42efec3bc788d1298e38fde4996_stamp.pdf');
INSERT INTO `t_oa_officialdocument_file` VALUES ('33', '110', '/eos/application/octet-stream/20150203/f45cf8fd8dfcce1976590394f213ed58.png', 'png', '96522', '(E[Y10BGVR6%QGOR7I}{S`5.png', '1', '2015-02-03 08:58:13', '7', '52', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('34', '113', '/eos/application/octet-stream/20150203/135926f35914899e72deb6f8af0d5467.doc', 'pdf', '50293', '金鹰小学无障碍通道和售货机测试报告 (1).doc', '1', '2015-02-03 09:59:59', '4', '15', null, '/eduz100/stamp/2015-02-03/135926f35914899e72deb6f8af0d5467_stamp.pdf');
INSERT INTO `t_oa_officialdocument_file` VALUES ('35', '114', '/eos/application/octet-stream/20150203/5d4ab67464c3fe1effd46df64ebe959e.jpg', 'jpg', '786581', '1.jpg', '1', '2015-02-03 10:18:21', '4', '16', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('36', '116', '/eos/application/octet-stream/20150203/82be0af2ccf50d58c51116f8da0ecd2b.jpg', 'jpg', '251733', '1.jpg', '1', '2015-02-03 10:57:17', '4', '16', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('38', '120', '/eos/application/octet-stream/20150204/17351eb42a0cccc6ac3f1a0c0b14a98e.doc', 'pdf', '1210880', '华尔T82XX系列消费翼机通调试手册 (1).doc', '1', '2015-02-04 09:40:26', '7', '52', null, '/eduz100/stamp/2015-02-04/17351eb42a0cccc6ac3f1a0c0b14a98e_stamp.pdf');
INSERT INTO `t_oa_officialdocument_file` VALUES ('39', '121', '/eos/application/octet-stream/20150204/135926f35914899e72deb6f8af0d5467.doc', 'pdf', '50293', '金鹰小学无障碍通道和售货机测试报告 (1).doc', '1', '2015-02-04 09:55:19', '4', '9', null, '/eduz100/stamp/2015-02-04/135926f35914899e72deb6f8af0d5467_stamp.pdf');
INSERT INTO `t_oa_officialdocument_file` VALUES ('40', '138', '/eos/application/octet-stream/20150205/135926f35914899e72deb6f8af0d5467.doc', 'doc', '50293', '金鹰小学无障碍通道和售货机测试报告 (1).doc', '1', '2015-02-05 11:44:48', '7', '52', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('41', '139', '/eos/application/octet-stream/20150205/31371c1cdcd1f8e8037134694eae69ab.xls', 'xls', '24576', '1.xls', '1', '2015-02-05 11:46:32', '4', '9', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('42', '140', '/eos/application/octet-stream/20150205/bc4a650d891b6683f860f5e0b756c0de.09.21?????.pdf', 'pdf', '1833732', '2013.09.21 金码说明书.pdf', '1', '2015-02-05 11:53:57', '4', '9', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('68', '144', '/eos/application/msword/20150206/17351eb42a0cccc6ac3f1a0c0b14a98e.doc', 'pdf', '1210880', '华尔T82XX系列消费翼机通调试手册 (1).doc', '1', '2015-02-06 14:18:52', '7', '38', null, '/eduz100/stamp/2015-02-06/17351eb42a0cccc6ac3f1a0c0b14a98e_stamp.pdf');
INSERT INTO `t_oa_officialdocument_file` VALUES ('69', '145', '/eos/application/pdf/20150206/bc4a650d891b6683f860f5e0b756c0de.09.21金码说明书.pdf', 'pdf', '1833732', '2013.09.21 金码说明书.pdf', '1', '2015-02-06 14:30:23', '7', '38', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('70', '150', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/8d8514ad542b825481d88fc11bda631b.docx', 'docx', '3388623', '翼机通非前置机接入方式操作指引.docx', '1', '2015-02-09 09:01:31', '2', '9', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('71', '151', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/1ec471c782c167a09193517ac9fa4e49.docx', 'docx', '19804', '翼机通环境信息（测试和生产正式）.docx', '1', '2015-02-09 09:07:37', '2', '8', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('72', '152', '/eos/application/msword/20150209/17351eb42a0cccc6ac3f1a0c0b14a98e.doc', 'pdf', '1210880', '华尔T82XX系列消费翼机通调试手册 (1).doc', '1', '2015-02-09 09:08:49', '2', '8', null, '/eduz100/stamp/2015-02-09/17351eb42a0cccc6ac3f1a0c0b14a98e_stamp.pdf');
INSERT INTO `t_oa_officialdocument_file` VALUES ('73', '154', '/eos/application/pdf/20150209/d01f4dc1adbf6b76fc3770eaa2903c82.pdf', 'pdf', '229702', '测试3123123.pdf', '1', '2015-02-09 14:08:36', '1', '9', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('74', '155', '/eos/application/pdf/20150209/d01f4dc1adbf6b76fc3770eaa2903c82.pdf', 'pdf', '229702', '测试3123123.pdf', '1', '2015-02-09 14:35:05', '1', '9', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('75', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('76', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('77', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('78', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('79', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('80', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('81', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('82', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('83', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('84', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('85', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('86', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('87', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('88', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('89', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('90', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('91', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('92', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('93', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('94', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('95', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('96', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('97', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('98', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('99', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('100', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('101', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('102', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('103', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('104', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('105', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('106', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('107', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('108', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('109', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('110', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('111', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('112', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('113', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('114', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('115', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('116', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('117', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('118', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('119', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('120', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('121', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('122', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('123', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('124', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('125', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('126', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('127', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('128', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('129', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('130', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('131', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('132', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('133', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('134', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('135', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('136', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('137', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('138', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('139', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('140', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('141', '156', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150209/2da2ad675bed2a50d16abc7eba197a2f.docx', 'docx', '10270753', '出入口管理系统用户手册V1.7.docx', '1', '2015-02-09 15:12:50', '4', '36', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('142', '157', '/eos/application/pdf/20150209/547d4dc1bae356b51fb99ff17f7bfb12.pdf', 'pdf', '2908637', '测试用文档.pdf', '1', '2015-02-09 15:37:06', '3', '52', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('143', '158', '/eos/application/pdf/20150209/d01f4dc1adbf6b76fc3770eaa2903c82.pdf', 'pdf', '229702', '测试3123123.pdf', '1', '2015-02-09 15:43:10', '1', '9', null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('145', '163', '/eos/application/pdf/20150209/547d4dc1bae356b51fb99ff17f7bfb12.pdf', 'pdf', '2908637', '测试用文档.pdf', '1', '2015-02-09 16:51:43', null, null, null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('146', '163', '/eos/application/pdf/20150209/d01f4dc1adbf6b76fc3770eaa2903c82.pdf', 'pdf', '229702', '测试3123123.pdf', '1', '2015-02-09 16:51:43', null, null, null, null);
INSERT INTO `t_oa_officialdocument_file` VALUES ('147', '171', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150210/d6f2651292a0fcb703f191d1795ec089.docx', 'pdf', '11591', '测试的文件.docx', '1', '2015-02-10 11:06:17', '1', '9', null, '/eduz100/stamp/2015-02-10/d6f2651292a0fcb703f191d1795ec089_stamp.pdf');
INSERT INTO `t_oa_officialdocument_file` VALUES ('148', '171', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150210/d6f2651292a0fcb703f191d1795ec089.docx', 'pdf', '11591', '测试的文件.docx', '1', '2015-02-10 11:06:21', '1', '9', null, '/eduz100/stamp/2015-02-10/d6f2651292a0fcb703f191d1795ec089_stamp.pdf');
INSERT INTO `t_oa_officialdocument_file` VALUES ('149', '172', '/eos/application/msword/20150210/135926f35914899e72deb6f8af0d5467.doc', 'pdf', '50293', '金鹰小学无障碍通道和售货机测试报告 (1).doc', '1', '2015-02-10 11:23:07', '7', '52', null, '/eduz100/stamp/2015-02-10/135926f35914899e72deb6f8af0d5467_stamp.pdf');
INSERT INTO `t_oa_officialdocument_file` VALUES ('150', '172', '/eos/application/msword/20150210/135926f35914899e72deb6f8af0d5467.doc', 'pdf', '50293', '金鹰小学无障碍通道和售货机测试报告 (1).doc', '1', '2015-02-10 11:23:07', '7', '52', null, '/eduz100/stamp/2015-02-10/135926f35914899e72deb6f8af0d5467_stamp.pdf');
INSERT INTO `t_oa_officialdocument_file` VALUES ('151', '172', '/eos/application/msword/20150210/de52497ab10fe3e228cc0f3676c163ee.doc', 'pdf', '134144', '翼机通首轮测试报告 (1).doc', '1', '2015-02-10 11:23:07', '7', '52', null, '/eduz100/stamp/2015-02-10/de52497ab10fe3e228cc0f3676c163ee_stamp.pdf');
INSERT INTO `t_oa_officialdocument_file` VALUES ('152', '172', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150210/9df52033fc33ca597ac6aaf8e6dc8d5a.docx', 'pdf', '25171', '月度绩效自评表.docx', '1', '2015-02-10 11:23:07', '7', '52', null, '/eduz100/stamp/2015-02-10/9df52033fc33ca597ac6aaf8e6dc8d5a_stamp.pdf');
INSERT INTO `t_oa_officialdocument_file` VALUES ('153', '173', '/eos/application/vnd.openxmlformats-officedocument.wordprocessingml.document/20150210/c81a6f95d951b4edaab03991224141ed.docx', 'docx', '25351', '株洲检察院出差报告.docx', '1', '2015-02-10 15:34:24', '4', '36', null, null);

-- ----------------------------
-- Table structure for `t_oa_officialdocument_monitor`
-- ----------------------------
DROP TABLE IF EXISTS `t_oa_officialdocument_monitor`;
CREATE TABLE `t_oa_officialdocument_monitor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OFFICIALDOCUMENTID` int(11) DEFAULT NULL,
  `USERID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='公文流转监控表：当某个人对公文做了某种操作的时候，添加跟踪监控记录';

-- ----------------------------
-- Records of t_oa_officialdocument_monitor
-- ----------------------------
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('17', '45', '1003');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('18', '46', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('23', '50', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('24', '50', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('25', '50', '1003');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('27', '51', '1003');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('28', '51', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('29', '52', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('30', '52', '1003');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('31', '53', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('32', '53', '1003');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('33', '54', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('34', '54', '1003');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('35', '55', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('36', '55', '1003');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('38', '56', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('39', '57', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('40', '57', '1003');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('41', '57', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('42', '59', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('43', '60', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('44', '60', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('46', '52', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('47', '63', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('48', '63', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('49', '45', '3');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('51', '45', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('52', '65', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('53', '66', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('54', '67', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('55', '68', '1011');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('56', '69', '1011');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('57', '70', '1011');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('58', '71', '1011');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('59', '72', '1011');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('60', '73', '1011');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('61', '73', '1007');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('62', '74', '1011');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('63', '75', '1011');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('64', '76', '1011');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('65', '77', '1011');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('66', '78', '1011');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('68', '81', '1011');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('69', '82', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('70', '82', '1011');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('71', '77', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('72', '78', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('73', '83', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('74', '84', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('75', '85', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('76', '86', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('77', '87', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('78', '88', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('79', '89', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('81', '67', '1011');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('82', '66', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('83', '90', '1007');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('84', '91', '1007');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('85', '93', '1011');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('86', '94', '1007');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('87', '94', '1011');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('88', '96', '1011');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('89', '97', '1007');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('90', '97', '1011');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('91', '98', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('92', '98', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('93', '101', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('94', '101', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('95', '65', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('97', '104', '5');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('99', '105', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('101', '106', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('102', '107', '6');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('104', '107', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('105', '108', '6');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('107', '108', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('108', '110', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('109', '111', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('110', '112', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('112', '112', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('115', '114', '4');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('118', '116', '4');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('119', '103', '4');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('120', '53', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('121', '53', '6');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('122', '116', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('123', '120', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('124', '120', '4');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('125', '55', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('128', '55', '6');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('129', '122', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('130', '123', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('131', '124', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('133', '127', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('135', '128', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('136', '129', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('137', '130', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('138', '133', '4');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('139', '134', '4');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('140', '135', '4');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('141', '76', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('142', '75', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('143', '136', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('144', '137', '4');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('145', '138', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('146', '139', '4');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('148', '140', '4');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('149', '141', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('150', '141', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('153', '144', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('154', '144', '4');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('155', '145', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('156', '146', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('157', '147', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('158', '148', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('159', '150', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('160', '151', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('161', '152', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('162', '152', '4');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('163', '153', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('164', '153', '4');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('165', '154', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('166', '155', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('167', '155', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('168', '156', '4');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('169', '157', '3');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('170', '163', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('171', '163', '2');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('172', '164', '4');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('173', '165', '4');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('174', '166', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('175', '167', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('176', '168', '4');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('177', '169', '4');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('178', '169', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('179', '169', '6');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('180', '170', '4');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('182', '171', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('183', '171', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('184', '172', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('185', '172', '4');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('186', '173', '4');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('187', '174', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('188', '175', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('189', '176', '1');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('190', '177', '4');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('191', '178', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('192', '179', '7');
INSERT INTO `t_oa_officialdocument_monitor` VALUES ('193', '169', '2');

-- ----------------------------
-- Table structure for `t_oa_officialdocument_postil`
-- ----------------------------
DROP TABLE IF EXISTS `t_oa_officialdocument_postil`;
CREATE TABLE `t_oa_officialdocument_postil` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OFFICIALDOCUMENTID` int(11) DEFAULT NULL,
  `USERID` int(11) DEFAULT NULL COMMENT '批注人',
  `ORGID` int(11) DEFAULT NULL COMMENT '批注人组织机构',
  `DATE` datetime DEFAULT NULL,
  `CONTENT` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '批注内容',
  `DELIVERID` int(11) DEFAULT NULL COMMENT '记录是哪个流转记录提交批注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='公文批注表';

-- ----------------------------
-- Records of t_oa_officialdocument_postil
-- ----------------------------
INSERT INTO `t_oa_officialdocument_postil` VALUES ('4', '45', '1', '12', '2014-12-26 15:21:05', '提交给了自己审批，错了，移交给A部门 负责人处理', '37');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('5', '45', '1003', '13', '2014-12-27 15:30:47', ' 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好 这个东西很好', '38');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('6', '47', '2', '26', '2014-12-30 10:23:11', ' 我没有权限处理不了', '49');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('7', '49', '2', '26', '2014-12-31 11:18:48', '审批通过的时候要加上 短消息 短信 提醒啊！', '55');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('8', '50', '1003', '23', '2014-12-31 11:34:49', 'asdasdasdasdasdasd', '58');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('10', '52', '1003', '23', '2014-12-31 11:51:42', '534534534534', '63');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('11', '53', '1003', '23', '2014-12-31 11:52:42', '098765432', '65');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('12', '60', '2', '26', '2015-01-05 16:17:28', 'ghjgfdsasfddasfsdgfdgdfg', '97');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('14', '52', '1', '11', '2015-01-07 10:26:12', 'kjhgfds', '102');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('15', '54', '1003', '13', '2015-01-08 09:28:11', '89765432', '106');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('16', '63', '2', '26', '2015-01-08 11:39:05', 'mmmmmmmmmmmmmmmm', '111');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('17', '63', '2', '8', '2015-01-08 11:40:08', 'bnbnbnbnbnbnbn', '113');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('18', '63', '2', '13', '2015-01-08 13:46:41', 'kandn asd 11', '116');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('19', '71', '1011', '22', '2015-01-16 10:03:08', 'dd', '131');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('20', '71', '1011', '8', '2015-01-16 10:03:51', 'fddf', '133');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('21', '71', '1011', '29', '2015-01-16 10:04:31', '房顶上', '135');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('22', '71', '1011', '26', '2015-01-16 10:04:46', '第三点', '136');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('23', '73', '1007', '29', '2015-01-16 10:27:24', 'dfff', '140');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('24', '73', '1007', '29', '2015-01-16 10:31:07', 'ff', '142');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('25', '73', '1011', '31', '2015-01-16 10:31:28', '谁东方饭店', '143');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('26', '81', '1011', '26', '2015-01-16 14:19:12', 'fsd', '150');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('27', '81', '1011', '29', '2015-01-16 14:19:23', 'fds', '151');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('28', '82', '1011', '29', '2015-01-16 14:28:47', 'ds', '155');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('29', '82', '2', '13', '2015-01-16 14:29:11', 'fds', '156');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('30', '77', '2', '9', '2015-01-16 14:32:25', '费大幅度', '158');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('31', '78', '2', '11', '2015-01-16 14:48:09', '的士费', '160');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('32', '67', '1', '11', '2015-01-20 10:02:20', '09876543213456789875643', '169');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('33', '67', '1', '11', '2015-01-20 11:29:45', '98765432', '171');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('34', '66', '2', '11', '2015-01-20 15:24:02', '908765432测试发送短消息提醒', '178');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('35', '66', '2', '37', '2015-01-21 10:03:23', '8976543', '180');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('36', '94', '1011', '35', '2015-01-21 15:59:39', '批准', '195');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('37', '97', '1011', '11', '2015-01-22 09:21:18', '早上好', '199');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('38', '97', '1011', '35', '2015-01-22 09:22:44', '呵呵', '201');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('39', '101', '1', '11', '2015-01-26 10:59:05', '123123123123123123', '207');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('40', '65', '2', '8', '2015-01-27 09:18:34', '76667676', '210');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('41', '104', '5', '15', '2015-01-28 09:54:50', '联机', '213');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('42', '104', '4', '33', '2015-01-28 09:55:27', '批准', '214');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('43', '107', '7', '15', '2015-01-30 14:48:52', '说的很有道理嘛， 我这边没问题， 但需要tom sir 签一下', '225');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('44', '107', '2', '8', '2015-01-30 14:50:54', '嗯，不错', '226');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('45', '108', '7', '15', '2015-01-30 15:20:53', '广阔的哭记录的', '233');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('46', '108', '2', '8', '2015-01-30 15:22:01', 'ok', '234');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('47', '112', '4', '16', '2015-02-03 09:19:34', 'cds', '242');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('48', '112', '4', '16', '2015-02-03 09:42:26', 'OK ', '244');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('49', '112', '2', '8', '2015-02-03 09:44:48', 'dsfd', '245');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('50', '113', '7', '52', '2015-02-03 10:08:34', '通过', '250');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('51', '115', '7', '52', '2015-02-03 10:31:07', '地方税', '255');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('52', '116', '7', '59', '2015-02-04 09:36:41', '1', '266');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('53', '120', '4', '9', '2015-02-04 09:41:20', '通过', '269');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('54', '121', '7', '35', '2015-02-04 09:57:33', '通过', '272');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('55', '139', '7', '52', '2015-02-05 11:47:28', 'tongguo', '297');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('56', '141', '2', '8', '2015-02-05 11:56:44', 's', '302');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('57', '143', '7', '52', '2015-02-06 11:43:36', '的士费', '304');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('58', '144', '4', '9', '2015-02-06 14:29:01', '通过', '308');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('59', '152', '4', '16', '2015-02-09 09:10:07', '通过', '316');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('60', '153', '4', '34', '2015-02-09 09:12:30', '驳回', '318');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('61', '153', '4', '36', '2015-02-09 09:19:42', '驳回', '320');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('62', '153', '4', '33', '2015-02-09 09:26:33', '通过', '322');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('63', '163', '2', '8', '2015-02-09 16:40:00', '路口就很反感的', '330');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('64', '169', '7', '38', '2015-02-10 09:43:49', '驳回', '338');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('65', '169', '7', '38', '2015-02-10 09:44:49', '通过', '340');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('66', '170', '7', '38', '2015-02-10 11:04:49', '通过', '348');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('67', '171', '7', '52', '2015-02-10 11:08:27', '审批通过', '352');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('68', '171', '7', '52', '2015-02-10 11:08:28', '审批通过', '353');
INSERT INTO `t_oa_officialdocument_postil` VALUES ('69', '172', '4', '13', '2015-02-10 11:24:10', '通过', '356');

-- ----------------------------
-- Table structure for `t_oa_officialdocument_record`
-- ----------------------------
DROP TABLE IF EXISTS `t_oa_officialdocument_record`;
CREATE TABLE `t_oa_officialdocument_record` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OFFICIALDOCUMENTID` int(11) DEFAULT NULL,
  `USERID` int(11) DEFAULT NULL,
  `ORGID` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL COMMENT '1：个人档案；2：部门档案',
  `DATE` datetime DEFAULT NULL COMMENT '归档时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='公文档案表';

-- ----------------------------
-- Records of t_oa_officialdocument_record
-- ----------------------------
INSERT INTO `t_oa_officialdocument_record` VALUES ('1', '45', '1', null, '1', null);
INSERT INTO `t_oa_officialdocument_record` VALUES ('2', '47', '2', null, '1', '2015-01-09 10:33:00');
INSERT INTO `t_oa_officialdocument_record` VALUES ('4', '49', null, '13', '2', null);
INSERT INTO `t_oa_officialdocument_record` VALUES ('5', '81', null, '26', '2', null);
INSERT INTO `t_oa_officialdocument_record` VALUES ('6', '67', '1', null, '1', null);
INSERT INTO `t_oa_officialdocument_record` VALUES ('7', '49', null, '11', '2', null);
INSERT INTO `t_oa_officialdocument_record` VALUES ('8', '45', null, '11', '2', null);
INSERT INTO `t_oa_officialdocument_record` VALUES ('9', '104', null, '13', '2', null);
INSERT INTO `t_oa_officialdocument_record` VALUES ('10', '45', '4', null, '1', null);
INSERT INTO `t_oa_officialdocument_record` VALUES ('11', '107', null, '9', '2', null);
INSERT INTO `t_oa_officialdocument_record` VALUES ('12', '108', null, '37', '2', null);
INSERT INTO `t_oa_officialdocument_record` VALUES ('13', '106', null, '9', '2', null);
INSERT INTO `t_oa_officialdocument_record` VALUES ('14', '113', null, '9', '2', null);
INSERT INTO `t_oa_officialdocument_record` VALUES ('15', '105', null, '15', '2', null);
INSERT INTO `t_oa_officialdocument_record` VALUES ('16', '47', null, '9', '2', null);
INSERT INTO `t_oa_officialdocument_record` VALUES ('17', '121', '4', null, '1', null);
INSERT INTO `t_oa_officialdocument_record` VALUES ('18', '121', '7', null, '1', null);
INSERT INTO `t_oa_officialdocument_record` VALUES ('19', '170', '7', null, '1', null);

-- ----------------------------
-- Table structure for `t_oa_remind`
-- ----------------------------
DROP TABLE IF EXISTS `t_oa_remind`;
CREATE TABLE `t_oa_remind` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REMINDTYPE` int(11) DEFAULT NULL COMMENT '1：手机短信；2：系统短消息；3：两者都发',
  `OPERATORUSERID` int(11) DEFAULT NULL,
  `RECIPIENTUSERID` int(11) DEFAULT NULL,
  `CONTENT` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL COMMENT '1：发送成功；2：发送失败',
  `TYPE` int(11) DEFAULT NULL COMMENT '数据类型：1：公文提醒；2：通知提醒;3:未提交数据提醒',
  `SENDDATE` datetime DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='提醒消息记录表';

-- ----------------------------
-- Records of t_oa_remind
-- ----------------------------
INSERT INTO `t_oa_remind` VALUES ('1', '2', '1', '1004', '尊敬的汤汤用户：有新的公文：675432，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-01-19 15:33:58');
INSERT INTO `t_oa_remind` VALUES ('2', '3', '1', '2', '尊敬的阿汤用户：您的公文：ghgfh，已被驳回，请登录系统查看。【临澧县教育系统OA平台】', '1', '1', '2015-01-20 10:02:20');
INSERT INTO `t_oa_remind` VALUES ('3', '1', '2', '1', '尊敬的超级管理员用户：公文：ghgfh，已经过修改，并重新提交，等待您审批。【临澧县教育系统OA平台】', '1', '1', '2015-01-20 11:28:29');
INSERT INTO `t_oa_remind` VALUES ('4', '2', '1', '2', '尊敬的阿汤用户：您发起的公文：ghgfh，已经通过审批。可以进行下一步操作啦！【临澧县教育系统OA平台】', '1', '1', '2015-01-20 11:29:45');
INSERT INTO `t_oa_remind` VALUES ('5', '3', '2', '2', '尊敬的阿汤用户：有公文：ghgfh，签发至您，需要您签收。【临澧县教育系统OA平台】', '1', '1', '2015-01-20 11:43:54');
INSERT INTO `t_oa_remind` VALUES ('6', '3', '2', '1011', '尊敬的唐小林用户：有公文：ghgfh，签发至您，需要您签收。【临澧县教育系统OA平台】', '1', '1', '2015-01-20 11:43:54');
INSERT INTO `t_oa_remind` VALUES ('7', '3', '1', '1004', '赶快提交数据了啊   过期不候', '1', '3', '2015-01-20 13:42:20');
INSERT INTO `t_oa_remind` VALUES ('8', '3', '2', '2', '尊敬的阿汤用户：公文：ghgfh，需要您签收，或因为您长时间没有响应，发起人已经强制签收。【临澧县教育系统OA平台】', '1', '1', '2015-01-20 13:57:37');
INSERT INTO `t_oa_remind` VALUES ('9', '3', '2', '1011', '尊敬的唐小林用户：公文：ghgfh，需要您签收，或因为您长时间没有响应，发起人已经强制签收。【临澧县教育系统OA平台】', '1', '1', '2015-01-20 13:57:37');
INSERT INTO `t_oa_remind` VALUES ('10', '2', '2', '1', '尊敬的超级管理员用户：您的公文：08978765432，已被驳回，请登录系统查看。【临澧县教育系统OA平台】', '1', '1', '2015-01-20 15:24:02');
INSERT INTO `t_oa_remind` VALUES ('11', '3', '1', '2', '尊敬的阿汤用户：公文：08978765432，已经过修改，并重新提交，等待您审批。【临澧县教育系统OA平台】', '1', '1', '2015-01-21 10:02:36');
INSERT INTO `t_oa_remind` VALUES ('12', '3', '2', '1', '尊敬的超级管理员用户：您发起的公文：08978765432，已经通过审批。可以进行下一步操作啦！【临澧县教育系统OA平台】', '1', '1', '2015-01-21 10:03:23');
INSERT INTO `t_oa_remind` VALUES ('13', '3', '1', '1', '尊敬的超级管理员用户：有公文：08978765432，签发至您，需要您签收。【临澧县教育系统OA平台】', '1', '1', '2015-01-21 10:12:45');
INSERT INTO `t_oa_remind` VALUES ('14', '3', '1', '2', '尊敬的阿汤用户：有公文：08978765432，签发至您，需要您签收。【临澧县教育系统OA平台】', '1', '1', '2015-01-21 10:12:45');
INSERT INTO `t_oa_remind` VALUES ('15', '3', '2', '1', '尊敬的超级管理员用户：公文：876767，已经过修改，并重新提交，等待您审批。【临澧县教育系统OA平台】', '1', '1', '2015-01-21 10:17:39');
INSERT INTO `t_oa_remind` VALUES ('16', '3', '2', '1', '尊敬的超级管理员用户：公文：987654321，已经过修改，并重新提交，等待您审批。【临澧县教育系统OA平台】', '1', '1', '2015-01-21 10:19:43');
INSERT INTO `t_oa_remind` VALUES ('17', '1', '1007', '1011', '尊敬的唐小林用户：有新的公文：Hello，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-01-21 10:37:12');
INSERT INTO `t_oa_remind` VALUES ('18', '3', '1007', '1011', '尊敬的唐小林用户：有新的公文：test  test ，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-01-21 10:43:07');
INSERT INTO `t_oa_remind` VALUES ('19', '1', '1007', '1011', '尊敬的唐小林用户：有新的公文：文件，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-01-21 15:51:13');
INSERT INTO `t_oa_remind` VALUES ('20', '1', '1011', '1007', '尊敬的刘美用户：您发起的公文：文件，已经通过审批。可以进行下一步操作啦！【临澧县教育系统OA平台】', '1', '1', '2015-01-21 15:59:39');
INSERT INTO `t_oa_remind` VALUES ('21', '1', '1011', '1011', '尊敬的唐小林用户：有新的公文：早上好，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-01-22 09:12:33');
INSERT INTO `t_oa_remind` VALUES ('22', '3', '1007', '1011', '尊敬的唐小林用户：有新的公文：Good morning，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-01-22 09:20:09');
INSERT INTO `t_oa_remind` VALUES ('23', '3', '1011', '1007', '尊敬的刘美用户：您的公文：Good morning，已被驳回，请登录系统查看。【临澧县教育系统OA平台】', '1', '1', '2015-01-22 09:21:18');
INSERT INTO `t_oa_remind` VALUES ('24', '3', '1007', '1011', '尊敬的唐小林用户：公文：Good morning，已经过修改，并重新提交，等待您审批。【临澧县教育系统OA平台】', '1', '1', '2015-01-22 09:22:03');
INSERT INTO `t_oa_remind` VALUES ('25', '3', '1011', '1007', '尊敬的刘美用户：您的公文：Good morning，已被驳回，请登录系统查看。【临澧县教育系统OA平台】', '1', '1', '2015-01-22 09:22:44');
INSERT INTO `t_oa_remind` VALUES ('26', '3', '1', null, null, '1', '2', '2015-01-23 10:37:43');
INSERT INTO `t_oa_remind` VALUES ('27', '3', '1', '1', '尊敬的超级管理员用户：收到新的通知，请尽快阅读，谢谢！！！【临澧县教育系统OA平台】', '1', '2', '2015-01-23 10:37:43');
INSERT INTO `t_oa_remind` VALUES ('28', '3', '1', '2', '尊敬的阿汤用户：收到新的通知，请尽快阅读，谢谢！！！【临澧县教育系统OA平台】', '1', '2', '2015-01-23 10:37:43');
INSERT INTO `t_oa_remind` VALUES ('29', '3', '1', '4', '尊敬的聪哥用户：收到新的通知，请尽快阅读，谢谢！！！【临澧县教育系统OA平台】', '1', '2', '2015-01-23 10:37:43');
INSERT INTO `t_oa_remind` VALUES ('30', '3', '1', '1003', '尊敬的汤姆用户：收到新的通知，请尽快阅读，谢谢！！！【临澧县教育系统OA平台】', '1', '2', '2015-01-23 10:37:43');
INSERT INTO `t_oa_remind` VALUES ('31', '3', '1', '1004', '尊敬的汤汤用户：收到新的通知，请尽快阅读，谢谢！！！【临澧县教育系统OA平台】', '1', '2', '2015-01-23 10:37:43');
INSERT INTO `t_oa_remind` VALUES ('32', '3', '1', '1005', '尊敬的刘美用户：收到新的通知，请尽快阅读，谢谢！！！【临澧县教育系统OA平台】', '1', '2', '2015-01-23 10:37:43');
INSERT INTO `t_oa_remind` VALUES ('33', '3', '1', '1007', '尊敬的刘美用户：收到新的通知，请尽快阅读，谢谢！！！【临澧县教育系统OA平台】', '1', '2', '2015-01-23 10:37:43');
INSERT INTO `t_oa_remind` VALUES ('34', '3', '1', '1009', '尊敬的李华用户：收到新的通知，请尽快阅读，谢谢！！！【临澧县教育系统OA平台】', '1', '2', '2015-01-23 10:37:43');
INSERT INTO `t_oa_remind` VALUES ('35', '3', '1', '1011', '尊敬的唐小林用户：收到新的通知，请尽快阅读，谢谢！！！【临澧县教育系统OA平台】', '1', '2', '2015-01-23 10:37:43');
INSERT INTO `t_oa_remind` VALUES ('41', '3', '1', '2', '尊敬的阿汤用户：您有新的通知新的额.&nbsp房管局的费用【临澧县教育系统OA平台】', '1', '2', '2015-01-23 11:31:19');
INSERT INTO `t_oa_remind` VALUES ('42', '3', '1', '4', '尊敬的聪哥用户：您有新的通知新的额.&nbsp房管局的费用【临澧县教育系统OA平台】', '1', '2', '2015-01-23 11:31:19');
INSERT INTO `t_oa_remind` VALUES ('43', '3', '1', '1007', '尊敬的刘美用户：您有新的通知新的额.&nbsp房管局的费用【临澧县教育系统OA平台】', '1', '2', '2015-01-23 11:31:19');
INSERT INTO `t_oa_remind` VALUES ('44', '2', '2', '1', '尊敬的超级管理员用户：有新的公文：未命名123123123123123，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-01-26 10:57:40');
INSERT INTO `t_oa_remind` VALUES ('45', '3', '5', '4', '尊敬的唐小林用户：有新的公文：测试，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-01-28 09:54:50');
INSERT INTO `t_oa_remind` VALUES ('46', '2', '4', '5', '尊敬的黑米用户：您有新的通知【3】.&nbsp\\n3【临澧县教育系统OA平台】', '1', '2', '2015-01-28 10:46:37');
INSERT INTO `t_oa_remind` VALUES ('47', '2', '1', '2', '尊敬的用户：您有新的通知.&nbsp\\nnull【临澧县教育系统OA平台】', '1', null, '2015-01-28 15:47:50');
INSERT INTO `t_oa_remind` VALUES ('48', '3', '4', '7', '尊敬的刘美用户：您有新的通知【测试5】.&nbsp\\n【临澧县教育系统OA平台】', '1', '2', '2015-01-30 13:48:16');
INSERT INTO `t_oa_remind` VALUES ('49', '3', '4', '7', '尊敬的刘美用户：您有新的通知【测试10】.&nbsp\\n【临澧县教育系统OA平台】', '1', '2', '2015-01-30 13:55:19');
INSERT INTO `t_oa_remind` VALUES ('50', '3', '4', '7', '尊敬的刘美用户：您有新的通知【45】.&nbsp\\n【临澧县教育系统OA平台】', '1', '2', '2015-01-30 14:11:46');
INSERT INTO `t_oa_remind` VALUES ('51', '3', '4', '7', '尊敬的刘美用户：您有新的通知【54】.&nbsp\\n【临澧县教育系统OA平台】', '1', '2', '2015-01-30 14:12:08');
INSERT INTO `t_oa_remind` VALUES ('52', '3', '4', '7', '尊敬的刘美用户：您有新的通知【65】.&nbsp\\n【临澧县教育系统OA平台】', '1', '2', '2015-01-30 14:21:09');
INSERT INTO `t_oa_remind` VALUES ('53', '2', '4', '7', '尊敬的刘美用户：您有新的通知【78】.&nbsp\\n【临澧县教育系统OA平台】', '1', '2', '2015-01-30 14:21:30');
INSERT INTO `t_oa_remind` VALUES ('54', '3', '4', '7', '尊敬的刘美用户：您有新的通知【87】.&nbsp\\n【临澧县教育系统OA平台】', '1', '2', '2015-01-30 14:22:03');
INSERT INTO `t_oa_remind` VALUES ('55', '3', '4', '7', '尊敬的刘美用户：您有新的通知【87】.&nbsp\\n【临澧县教育系统OA平台】', '1', '2', '2015-01-30 14:23:02');
INSERT INTO `t_oa_remind` VALUES ('56', '2', '4', '7', '尊敬的刘美用户：您有新的通知【87】.&nbsp\\n【临澧县教育系统OA平台】', '1', '2', '2015-01-30 14:23:18');
INSERT INTO `t_oa_remind` VALUES ('57', '2', '2', '6', '尊敬的蒋杰用户：您发起的公文：测试1-30，已经通过审批。可以进行下一步操作啦！【临澧县教育系统OA平台】', '1', '1', '2015-01-30 14:50:54');
INSERT INTO `t_oa_remind` VALUES ('58', '2', '6', '6', '尊敬的蒋杰用户：有公文：测试123h，签发至您，需要您签收。【临澧县教育系统OA平台】', '1', '1', '2015-01-30 15:23:48');
INSERT INTO `t_oa_remind` VALUES ('59', '2', '6', '7', '尊敬的刘美用户：有公文：测试123h，签发至您，需要您签收。【临澧县教育系统OA平台】', '1', '1', '2015-01-30 15:23:48');
INSERT INTO `t_oa_remind` VALUES ('60', '2', '4', '7', '尊敬的刘美用户：您有新的通知【测试通知】.&nbsp\\n【临澧县教育系统OA平台】', '1', '2', '2015-02-02 11:15:45');
INSERT INTO `t_oa_remind` VALUES ('61', '2', '4', '7', '尊敬的刘美用户：您有新的通知【通知测试1】.&nbsp\\n【临澧县教育系统OA平台】', '1', '2', '2015-02-02 11:18:33');
INSERT INTO `t_oa_remind` VALUES ('62', '2', '4', '7', '尊敬的刘美用户：您有新的通知【经费打开】.&nbsp\\n都是【临澧县教育系统OA平台】', '1', '2', '2015-02-02 11:56:48');
INSERT INTO `t_oa_remind` VALUES ('63', '2', '4', '7', '尊敬的刘美用户：您有新的通知【手机】.&nbsp\\n【临澧县教育系统OA平台】', '1', '2', '2015-02-02 11:57:58');
INSERT INTO `t_oa_remind` VALUES ('64', '3', '7', '1', '尊敬的超级管理员用户：您有新的通知【测试手机短信】.&nbsp\\n手机短信是否已收到【临澧县教育系统OA平台】', '1', '2', '2015-02-02 13:44:06');
INSERT INTO `t_oa_remind` VALUES ('65', '3', '7', '4', '尊敬的唐小林用户：您有新的通知【测试手机短信】.&nbsp\\n手机短信是否已收到【临澧县教育系统OA平台】', '1', '2', '2015-02-02 13:44:06');
INSERT INTO `t_oa_remind` VALUES ('67', '3', '7', '1', '尊敬的超级管理员用户：您有新的通知【测试手机短信】.&nbsp\\n手机短信是否已收到【临澧县教育系统OA平台】', '1', '2', '2015-02-02 13:44:53');
INSERT INTO `t_oa_remind` VALUES ('68', '3', '7', '4', '尊敬的唐小林用户：您有新的通知【测试手机短信】.&nbsp\\n手机短信是否已收到【临澧县教育系统OA平台】', '1', '2', '2015-02-02 13:44:53');
INSERT INTO `t_oa_remind` VALUES ('70', '3', '7', '1', '尊敬的超级管理员用户：您有新的通知【测试手机短信】.&nbsp\\n手机短信是否已收到【临澧县教育系统OA平台】', '1', '2', '2015-02-02 13:45:07');
INSERT INTO `t_oa_remind` VALUES ('71', '3', '7', '4', '尊敬的唐小林用户：您有新的通知【测试手机短信】.&nbsp\\n手机短信是否已收到【临澧县教育系统OA平台】', '1', '2', '2015-02-02 13:45:07');
INSERT INTO `t_oa_remind` VALUES ('73', '2', '4', '7', '尊敬的刘美用户：您有新的通知【打开】.&nbsp\\n【临澧县教育系统OA平台】', '1', '2', '2015-02-02 13:56:50');
INSERT INTO `t_oa_remind` VALUES ('74', '1', '7', '4', '尊敬的唐小林用户：有新的公文：测试通知，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-02-03 08:58:13');
INSERT INTO `t_oa_remind` VALUES ('75', '3', '4', '7', '尊敬的刘美用户：您的公文：测试公文，已被驳回，请登录系统查看。【临澧县教育系统OA平台】', '1', '1', '2015-02-03 09:19:34');
INSERT INTO `t_oa_remind` VALUES ('76', '1', '7', '4', '尊敬的唐小林用户：公文：测试公文，已经过修改，并重新提交，等待您审批。【临澧县教育系统OA平台】', '1', '1', '2015-02-03 09:40:53');
INSERT INTO `t_oa_remind` VALUES ('77', '3', '4', '2', '尊敬的汤姆用户：有新的公文：测试公文，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-02-03 09:42:26');
INSERT INTO `t_oa_remind` VALUES ('78', '3', '2', '7', '尊敬的刘美用户：您发起的公文：测试公文，已经通过审批。可以进行下一步操作啦！【临澧县教育系统OA平台】', '1', '1', '2015-02-03 09:44:48');
INSERT INTO `t_oa_remind` VALUES ('79', '3', '7', '4', '尊敬的唐小林用户：有公文：测试公文，签发至您，需要您签收。【临澧县教育系统OA平台】', '1', '1', '2015-02-03 09:45:46');
INSERT INTO `t_oa_remind` VALUES ('80', '3', '7', '4', '尊敬的唐小林用户：您发起的公文：测试都是，已经通过审批。可以进行下一步操作啦！【临澧县教育系统OA平台】', '1', '1', '2015-02-03 10:08:34');
INSERT INTO `t_oa_remind` VALUES ('81', '2', '7', '4', '尊敬的唐小林用户：您发起的公文：12，已经通过审批。可以进行下一步操作啦！【临澧县教育系统OA平台】', '1', '1', '2015-02-03 10:31:07');
INSERT INTO `t_oa_remind` VALUES ('82', '2', '4', '7', '尊敬的刘美用户：有新的公文：测试公文时效性，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-02-03 10:57:17');
INSERT INTO `t_oa_remind` VALUES ('83', '3', '4', '7', '尊敬的刘美用户：您有新的通知【1】.&nbsp\\n【临澧县教育系统OA平台】', '1', '2', '2015-02-03 13:53:35');
INSERT INTO `t_oa_remind` VALUES ('84', '3', '6', '2', '尊敬的汤姆用户：您签发的公文：987654321，已经全部签收。【临澧县教育系统OA平台】', '1', '1', '2015-02-04 09:40:55');
INSERT INTO `t_oa_remind` VALUES ('85', '2', '2', '6', '尊敬的蒋杰用户：有公文：876767，签发至您，需要您签收。【临澧县教育系统OA平台】', '1', '1', '2015-02-04 09:59:26');
INSERT INTO `t_oa_remind` VALUES ('86', '3', '6', '2', '尊敬的汤姆用户：您签发的公文：876767，已经全部签收。【临澧县教育系统OA平台】', '1', '1', '2015-02-04 09:59:40');
INSERT INTO `t_oa_remind` VALUES ('87', '1', '7', '4', '尊敬的唐小林用户：有新的公文：测试短信通道，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-02-04 10:45:27');
INSERT INTO `t_oa_remind` VALUES ('88', '1', '7', '4', '尊敬的唐小林用户：有新的公文：测试短信，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-02-04 11:35:06');
INSERT INTO `t_oa_remind` VALUES ('89', '2', '7', '4', '尊敬的唐小林用户：有新的公文：测试公文短信，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-02-04 11:45:37');
INSERT INTO `t_oa_remind` VALUES ('90', '1', '7', '4', '尊敬的唐小林用户：有新的公文：2323，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-02-04 14:03:33');
INSERT INTO `t_oa_remind` VALUES ('91', '2', '4', '4', '尊敬的唐小林用户：有新的公文：都是，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-02-04 15:27:18');
INSERT INTO `t_oa_remind` VALUES ('92', '2', '1', '1', '尊敬的超级管理员用户：您有新的通知【last】.&nbsp\\nlastlastlastlast【临澧县教育系统OA平台】', '1', '2', '2015-02-04 15:56:49');
INSERT INTO `t_oa_remind` VALUES ('93', '2', '1', '4', '尊敬的唐小林用户：您有新的通知【last】.&nbsp\\nlastlastlastlast【临澧县教育系统OA平台】', '1', '2', '2015-02-04 15:56:49');
INSERT INTO `t_oa_remind` VALUES ('94', '2', '1', '6', '尊敬的蒋杰用户：您有新的通知【last】.&nbsp\\nlastlastlastlast【临澧县教育系统OA平台】', '1', '2', '2015-02-04 15:56:49');
INSERT INTO `t_oa_remind` VALUES ('95', '1', '7', '4', '尊敬的唐小林用户：有新的公文：34，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-02-05 09:26:26');
INSERT INTO `t_oa_remind` VALUES ('96', '3', '4', '7', '尊敬的刘美用户：您有新的通知【dsf 】.&nbsp\\n【临澧县教育系统OA平台】', '1', '2', '2015-02-06 11:26:06');
INSERT INTO `t_oa_remind` VALUES ('97', '1', '7', '4', '尊敬的唐小林用户：您发起的公文：审批，已经通过审批。可以进行下一步操作啦！【临澧县教育系统OA平台】', '1', '1', '2015-02-06 11:43:36');
INSERT INTO `t_oa_remind` VALUES ('98', '2', '7', '7', '尊敬的刘美用户：您有新的通知【对方是否】.&nbsp\\n【临澧县教育系统OA平台】', '1', '2', '2015-02-06 11:55:41');
INSERT INTO `t_oa_remind` VALUES ('99', '1', '7', '4', '尊敬的唐小林用户：有新的公文：测试公文文件上传，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-02-06 14:18:52');
INSERT INTO `t_oa_remind` VALUES ('100', '3', '4', '7', '尊敬的刘美用户：您发起的公文：测试公文文件上传，已经通过审批。可以进行下一步操作啦！【临澧县教育系统OA平台】', '1', '1', '2015-02-06 14:29:01');
INSERT INTO `t_oa_remind` VALUES ('101', '3', '7', '4', '尊敬的唐小林用户：有新的公文：56，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-02-06 14:30:23');
INSERT INTO `t_oa_remind` VALUES ('102', '3', '4', '2', '尊敬的汤姆用户：您有新的通知【付款了水电费付款了水电费付款了水电费付款了水电费】.&nbsp\\n【临澧县教育系统OA平台】', '1', '2', '2015-02-06 14:54:51');
INSERT INTO `t_oa_remind` VALUES ('103', '3', '4', '6', '尊敬的蒋杰用户：您有新的通知【付款了水电费付款了水电费付款了水电费付款了水电费】.&nbsp\\n【临澧县教育系统OA平台】', '1', '2', '2015-02-06 14:54:51');
INSERT INTO `t_oa_remind` VALUES ('104', '3', '4', '7', '尊敬的刘美用户：您有新的通知【付款了水电费付款了水电费付款了水电费付款了水电费】.&nbsp\\n【临澧县教育系统OA平台】', '1', '2', '2015-02-06 14:54:51');
INSERT INTO `t_oa_remind` VALUES ('105', '1', '7', '4', '尊敬的唐小林用户：有新的公文：测试公文短信，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-02-06 14:58:48');
INSERT INTO `t_oa_remind` VALUES ('106', '1', '7', '4', '尊敬的唐小林用户：有新的公文：我要发文，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-02-06 15:32:24');
INSERT INTO `t_oa_remind` VALUES ('107', '3', '4', '1', '尊敬的超级管理员用户：您有新的通知:佛挡杀佛【临澧县教育系统OA平台】', '1', '2', '2015-02-06 16:39:33');
INSERT INTO `t_oa_remind` VALUES ('108', '3', '4', '2', '尊敬的汤姆用户：您有新的通知:佛挡杀佛【临澧县教育系统OA平台】', '1', '2', '2015-02-06 16:39:33');
INSERT INTO `t_oa_remind` VALUES ('109', '3', '4', '4', '尊敬的唐小林用户：您有新的通知:佛挡杀佛【临澧县教育系统OA平台】', '1', '2', '2015-02-06 16:39:33');
INSERT INTO `t_oa_remind` VALUES ('110', '3', '4', '6', '尊敬的蒋杰用户：您有新的通知:佛挡杀佛【临澧县教育系统OA平台】', '1', '2', '2015-02-06 16:39:33');
INSERT INTO `t_oa_remind` VALUES ('114', '3', '4', '2', '尊敬的汤姆用户：您有新的通知:测试通知【临澧县教育系统OA平台】', '1', '2', '2015-02-09 08:55:34');
INSERT INTO `t_oa_remind` VALUES ('115', '3', '4', '4', '尊敬的唐小林用户：您有新的通知:测试通知【临澧县教育系统OA平台】', '1', '2', '2015-02-09 08:55:34');
INSERT INTO `t_oa_remind` VALUES ('116', '3', '4', '6', '尊敬的蒋杰用户：您有新的通知:测试通知【临澧县教育系统OA平台】', '1', '2', '2015-02-09 08:55:34');
INSERT INTO `t_oa_remind` VALUES ('117', '3', '4', '7', '尊敬的刘美用户：您有新的通知:测试通知【临澧县教育系统OA平台】', '1', '2', '2015-02-09 08:55:34');
INSERT INTO `t_oa_remind` VALUES ('121', '1', '2', '4', '尊敬的唐小林用户：有新的公文：测试公文短信，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-02-09 09:07:37');
INSERT INTO `t_oa_remind` VALUES ('122', '3', '2', '4', '尊敬的唐小林用户：有新的公文：测试2，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-02-09 09:08:49');
INSERT INTO `t_oa_remind` VALUES ('123', '3', '4', '2', '尊敬的汤姆用户：您发起的公文：测试2，已经通过审批。可以进行下一步操作啦！【临澧县教育系统OA平台】', '1', '1', '2015-02-09 09:10:07');
INSERT INTO `t_oa_remind` VALUES ('124', '3', '7', '4', '尊敬的唐小林用户：有新的公文：测试3，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-02-09 09:11:55');
INSERT INTO `t_oa_remind` VALUES ('125', '3', '4', '7', '尊敬的刘美用户：您的公文：测试3，已被驳回，请登录系统查看。【临澧县教育系统OA平台】', '1', '1', '2015-02-09 09:12:30');
INSERT INTO `t_oa_remind` VALUES ('126', '3', '4', '7', '尊敬的刘美用户：您的公文：测试3，已被驳回，请登录系统查看。【临澧县教育系统OA平台】', '1', '1', '2015-02-09 09:19:42');
INSERT INTO `t_oa_remind` VALUES ('127', '3', '7', '4', '尊敬的唐小林用户：公文：测试3，已经过修改，并重新提交，等待您审批。【临澧县教育系统OA平台】', '1', '1', '2015-02-09 09:20:08');
INSERT INTO `t_oa_remind` VALUES ('128', '1', '4', '7', '尊敬的刘美用户：您发起的公文：测试3，已经通过审批。可以进行下一步操作啦！【临澧县教育系统OA平台】', '1', '1', '2015-02-09 09:26:33');
INSERT INTO `t_oa_remind` VALUES ('129', '3', '4', '7', '23', '1', '3', '2015-02-09 10:56:24');
INSERT INTO `t_oa_remind` VALUES ('130', '2', '4', '7', '都是', '1', '3', '2015-02-09 11:03:57');
INSERT INTO `t_oa_remind` VALUES ('131', '3', '4', '7', '1', '1', '3', '2015-02-09 11:05:03');
INSERT INTO `t_oa_remind` VALUES ('132', '3', '4', '7', '尊敬的刘美用户：有公文：公文测试22，签发至您，需要您签收。【临澧县教育系统OA平台】', '1', '1', '2015-02-10 09:46:05');
INSERT INTO `t_oa_remind` VALUES ('133', '3', '4', '6', '尊敬的蒋杰用户：有公文：公文测试22，签发至您，需要您签收。【临澧县教育系统OA平台】', '1', '1', '2015-02-10 09:46:05');
INSERT INTO `t_oa_remind` VALUES ('134', '3', '4', '4', '尊敬的唐小林用户：有公文：公文测试22，签发至您，需要您签收。【临澧县教育系统OA平台】', '1', '1', '2015-02-10 09:46:05');
INSERT INTO `t_oa_remind` VALUES ('135', '3', '4', '2', '尊敬的汤姆用户：有公文：公文测试22，签发至您，需要您签收。【临澧县教育系统OA平台】', '1', '1', '2015-02-10 09:46:05');
INSERT INTO `t_oa_remind` VALUES ('136', '3', '2', '2', '尊敬的汤姆用户：您有新的通知:测试给多人发送通知【临澧县教育系统OA平台】', '1', '2', '2015-02-10 10:28:56');
INSERT INTO `t_oa_remind` VALUES ('137', '3', '2', '4', '尊敬的唐小林用户：您有新的通知:测试给多人发送通知【临澧县教育系统OA平台】', '1', '2', '2015-02-10 10:28:56');
INSERT INTO `t_oa_remind` VALUES ('138', '3', '2', '6', '尊敬的蒋杰用户：您有新的通知:测试给多人发送通知【临澧县教育系统OA平台】', '1', '2', '2015-02-10 10:28:56');
INSERT INTO `t_oa_remind` VALUES ('139', '3', '2', '7', '尊敬的刘美用户：您有新的通知:测试给多人发送通知【临澧县教育系统OA平台】', '1', '2', '2015-02-10 10:28:56');
INSERT INTO `t_oa_remind` VALUES ('143', '3', '4', '7', '填写数据收集任务了', '1', '3', '2015-02-10 10:50:32');
INSERT INTO `t_oa_remind` VALUES ('144', '3', '4', '7', '测试', '1', '3', '2015-02-10 10:51:55');
INSERT INTO `t_oa_remind` VALUES ('145', '3', '4', '7', '测试', '1', '3', '2015-02-10 10:51:55');
INSERT INTO `t_oa_remind` VALUES ('146', '3', '4', '7', '测试2', '1', '3', '2015-02-10 10:52:18');
INSERT INTO `t_oa_remind` VALUES ('147', '1', '7', '1', '尊敬的超级管理员用户：您发起的公文：测试上传书库01234567890123456789012345678901234567890123，已经通过审批。可以进行下一步操作啦！【临澧县教育系统OA平台】', '1', '1', '2015-02-10 11:08:27');
INSERT INTO `t_oa_remind` VALUES ('148', '1', '7', '1', '尊敬的超级管理员用户：您发起的公文：测试上传书库01234567890123456789012345678901234567890123，已经通过审批。可以进行下一步操作啦！【临澧县教育系统OA平台】', '1', '1', '2015-02-10 11:08:28');
INSERT INTO `t_oa_remind` VALUES ('149', '1', '7', '4', '尊敬的唐小林用户：有新的公文：测试盖章，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-02-10 11:23:08');
INSERT INTO `t_oa_remind` VALUES ('150', '3', '7', '4', '尊敬的唐小林用户：您有新的通知:通知A【临澧县教育系统OA平台】', '1', '2', '2015-02-10 14:14:51');
INSERT INTO `t_oa_remind` VALUES ('151', '3', '7', '6', '尊敬的蒋杰用户：您有新的通知:通知A【临澧县教育系统OA平台】', '1', '2', '2015-02-10 14:14:51');
INSERT INTO `t_oa_remind` VALUES ('152', '3', '7', '7', '尊敬的刘美用户：您有新的通知:通知A【临澧县教育系统OA平台】', '1', '2', '2015-02-10 14:14:51');
INSERT INTO `t_oa_remind` VALUES ('153', '3', '7', '8', '尊敬的张小西用户：您有新的通知:通知A【临澧县教育系统OA平台】', '1', '2', '2015-02-10 14:14:51');
INSERT INTO `t_oa_remind` VALUES ('154', '3', '7', '11', '尊敬的测试用户：您有新的通知:通知A【临澧县教育系统OA平台】', '1', '2', '2015-02-10 14:14:51');
INSERT INTO `t_oa_remind` VALUES ('157', '3', '7', '4', '收信息啦', '1', '3', '2015-02-10 15:59:45');
INSERT INTO `t_oa_remind` VALUES ('158', '2', '7', '4', '你好啊', '1', '3', '2015-02-10 16:00:13');
INSERT INTO `t_oa_remind` VALUES ('159', '1', '7', '4', '的水水水水费', '1', '3', '2015-02-10 16:00:51');
INSERT INTO `t_oa_remind` VALUES ('160', '3', '7', '4', '·12323', '1', '3', '2015-02-10 16:01:01');
INSERT INTO `t_oa_remind` VALUES ('161', '3', '7', '4', '第三款龙卷风第三款龙卷风第三款龙卷风第三款龙卷风第三款龙卷风第三款龙卷风第三款龙卷风第三款龙卷风第三款龙卷风第三款龙卷风第三款龙', '1', '3', '2015-02-10 16:01:15');
INSERT INTO `t_oa_remind` VALUES ('162', '3', '7', '4', '1231111111111111111111111111111111111111111111111111111111111111', '1', '3', '2015-02-10 16:01:42');
INSERT INTO `t_oa_remind` VALUES ('163', '1', '4', '7', '尊敬的刘美用户：有新的公文：1324，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-02-10 16:45:57');
INSERT INTO `t_oa_remind` VALUES ('164', '3', '4', '7', '尊敬的刘美用户：您有新的通知:测试通知【临澧县教育系统OA平台】', '1', '2', '2015-02-11 10:29:01');
INSERT INTO `t_oa_remind` VALUES ('165', '2', '4', '7', '尊敬的刘美用户：您有新的通知:测试通知2【临澧县教育系统OA平台】', '1', '2', '2015-02-11 10:29:31');
INSERT INTO `t_oa_remind` VALUES ('166', '2', '4', '7', '发送短小发送短小发送短小发送短小发送短小发送短小发送短小发送短小发送短小发送短小发送短小发送短小发送短小发送短小发送短小发送短小', '1', '3', '2015-02-11 13:42:08');
INSERT INTO `t_oa_remind` VALUES ('167', '3', '4', '7', '开房大厦开房大厦开房大厦开房大厦开房大厦开房大厦开房大厦开房大厦开房大厦开房大厦开房大厦开房大厦开房大厦开房大厦开房大厦开房大厦', '1', '3', '2015-02-11 13:42:46');
INSERT INTO `t_oa_remind` VALUES ('168', '1', '7', '4', '23424', '1', '3', '2015-02-11 13:44:31');
INSERT INTO `t_oa_remind` VALUES ('169', '1', '7', '6', '23424', '1', '3', '2015-02-11 13:44:31');
INSERT INTO `t_oa_remind` VALUES ('170', '3', '7', '4', '非的规范的', '1', '3', '2015-02-11 13:44:50');
INSERT INTO `t_oa_remind` VALUES ('171', '3', '7', '6', '非的规范的', '1', '3', '2015-02-11 13:44:50');
INSERT INTO `t_oa_remind` VALUES ('172', '1', '7', '4', '尊敬的唐小林用户：有新的公文：测试公文，提交给您等待审批。【临澧县教育系统OA平台】', '1', '1', '2015-02-11 16:28:17');
INSERT INTO `t_oa_remind` VALUES ('173', '3', '7', '4', '尊敬的唐小林用户：您有新的通知:通知测试A【临澧县教育系统OA平台】', '1', '2', '2015-02-14 14:25:32');
INSERT INTO `t_oa_remind` VALUES ('174', '3', '7', '6', '尊敬的蒋杰用户：您有新的通知:通知测试A【临澧县教育系统OA平台】', '1', '2', '2015-02-14 14:25:32');
INSERT INTO `t_oa_remind` VALUES ('175', '3', '7', '7', '尊敬的刘美用户：您有新的通知:通知测试A【临澧县教育系统OA平台】', '1', '2', '2015-02-14 14:25:32');
INSERT INTO `t_oa_remind` VALUES ('176', '2', '4', '4', '尊敬的唐小林用户：您有新的通知:12【临澧县教育系统OA平台】', '1', '2', '2015-02-14 14:29:19');
INSERT INTO `t_oa_remind` VALUES ('177', '2', '4', '6', '尊敬的蒋杰用户：您有新的通知:12【临澧县教育系统OA平台】', '1', '2', '2015-02-14 14:29:19');
INSERT INTO `t_oa_remind` VALUES ('178', '2', '4', '7', '尊敬的刘美用户：您有新的通知:12【临澧县教育系统OA平台】', '1', '2', '2015-02-14 14:29:19');
INSERT INTO `t_oa_remind` VALUES ('179', '2', '2', '2', '尊敬的汤姆用户：您有新的通知:DD【临澧县教育系统OA平台】', '1', '2', '2015-02-14 15:01:41');
INSERT INTO `t_oa_remind` VALUES ('180', '2', '2', '4', '尊敬的唐小林用户：您有新的通知:DD【临澧县教育系统OA平台】', '1', '2', '2015-02-14 15:01:41');
INSERT INTO `t_oa_remind` VALUES ('181', '2', '2', '6', '尊敬的蒋杰用户：您有新的通知:DD【临澧县教育系统OA平台】', '1', '2', '2015-02-14 15:01:41');
INSERT INTO `t_oa_remind` VALUES ('182', '2', '2', '7', '尊敬的刘美用户：您有新的通知:DD【临澧县教育系统OA平台】', '1', '2', '2015-02-14 15:01:41');
INSERT INTO `t_oa_remind` VALUES ('186', '3', '6', '2', '测试', '1', '3', '2015-02-14 15:08:41');
INSERT INTO `t_oa_remind` VALUES ('187', '3', '6', '6', '测试', '1', '3', '2015-02-14 15:08:41');
INSERT INTO `t_oa_remind` VALUES ('188', '3', '6', '7', '测试', '1', '3', '2015-02-14 15:08:41');
INSERT INTO `t_oa_remind` VALUES ('189', '3', '4', '2', '发送提醒啦', '1', '3', '2015-02-14 15:26:21');
INSERT INTO `t_oa_remind` VALUES ('190', '3', '4', '4', '发送提醒啦', '1', '3', '2015-02-14 15:26:21');
INSERT INTO `t_oa_remind` VALUES ('191', '3', '4', '6', '发送提醒啦', '1', '3', '2015-02-14 15:26:21');
INSERT INTO `t_oa_remind` VALUES ('192', '3', '4', '7', '发送提醒啦', '1', '3', '2015-02-14 15:26:21');
INSERT INTO `t_oa_remind` VALUES ('193', '3', '4', '18', '发送提醒啦', '1', '3', '2015-02-14 15:26:21');
INSERT INTO `t_oa_remind` VALUES ('194', '3', '6', '2', '2222222222', '1', '3', '2015-02-14 15:28:01');
INSERT INTO `t_oa_remind` VALUES ('195', '3', '6', '6', '2222222222', '1', '3', '2015-02-14 15:28:01');
INSERT INTO `t_oa_remind` VALUES ('196', '3', '6', '7', '2222222222', '1', '3', '2015-02-14 15:28:01');

-- ----------------------------
-- Table structure for `t_oa_seal`
-- ----------------------------
DROP TABLE IF EXISTS `t_oa_seal`;
CREATE TABLE `t_oa_seal` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILEPATH` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '文件保存服务器相对路径',
  `FILENAME` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '文件名',
  `KEYTEXT` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '备忘或关键字',
  `USERID` int(11) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户上传公章文件保存表';

-- ----------------------------
-- Records of t_oa_seal
-- ----------------------------
INSERT INTO `t_oa_seal` VALUES ('2', '/eos/image/png/20150122/20795acb199d5a39e4cf4f7a2d6c9796.png', '测试用章', '测试用章', '1');
INSERT INTO `t_oa_seal` VALUES ('7', '/eos/image/png/20150123/e69be2ea39961563c69329969353394d.png', '56', '56', '2');
INSERT INTO `t_oa_seal` VALUES ('13', '/eos/image/png/20150123/20795acb199d5a39e4cf4f7a2d6c9796.png', '123', '123', '2');
INSERT INTO `t_oa_seal` VALUES ('38', '/eos/image/jpeg/20150126/59779c0fa6dd0a5bff10b913f539a8a9.jpg', '测试下', '测试下', '1');
INSERT INTO `t_oa_seal` VALUES ('41', '/eos/image/png/20150130/20795acb199d5a39e4cf4f7a2d6c9796.png', '测试用章', '测试用章', '6');
INSERT INTO `t_oa_seal` VALUES ('58', '/eos/image/png/20150202/f45cf8fd8dfcce1976590394f213ed58.png', '(E[Y10BGVR6%QGOR7I}{S`5.png', '', '4');
INSERT INTO `t_oa_seal` VALUES ('64', '/eos/image/png/20150202/20795acb199d5a39e4cf4f7a2d6c9796.png', '3gz.png', '', '1');
INSERT INTO `t_oa_seal` VALUES ('65', '/eos/image/png/20150202/20795acb199d5a39e4cf4f7a2d6c9796.png', '3gz.png', '', '1');
INSERT INTO `t_oa_seal` VALUES ('66', '/eos/image/png/20150203/f45cf8fd8dfcce1976590394f213ed58.png', '(E[Y10BGVR6%QGOR7I}{S`5.png', '', '7');
INSERT INTO `t_oa_seal` VALUES ('67', '/eos/image/jpeg/20150204/e9342776cdc25d0f4ef654bf4b931a33.jpg', '反垄断水井坊解放路口三等奖焚枯食淡交罚款了解放路卡萨丁积分将反馈', '反垄断水井坊解放路口三等奖焚枯食淡交罚款了解放路卡萨丁积分将反馈', '7');
INSERT INTO `t_oa_seal` VALUES ('68', '/eos/image/jpeg/20150204/30d70eafdeb8a84e22812bd395e93c86.jpg', '水电费付水电费s费昆仑山附近将反馈里的水积分等方式将两块绝地逢生', '水电费付水电费s费昆仑山附近将反馈里的水积分等方式将两块绝地逢生', '7');
INSERT INTO `t_oa_seal` VALUES ('69', '/eos/image/jpeg/20150204/c26a3fe7884bb33dc74b676a2317419f.jpg', '1', '1', '7');
INSERT INTO `t_oa_seal` VALUES ('70', '/eos/image/jpeg/20150204/c26a3fe7884bb33dc74b676a2317419f.jpg', '2', '2', '7');
INSERT INTO `t_oa_seal` VALUES ('71', '/eos/image/jpeg/20150204/e9342776cdc25d0f4ef654bf4b931a33.jpg', '3', '3', '7');
INSERT INTO `t_oa_seal` VALUES ('72', '/eos/image/gif/20150204/7059846bd0007e771a2c86dcd5404432.gif', '5', '5', '7');
INSERT INTO `t_oa_seal` VALUES ('73', '/eos/image/jpeg/20150204/c26a3fe7884bb33dc74b676a2317419f.jpg', '435', '435', '7');
INSERT INTO `t_oa_seal` VALUES ('74', '/eos/image/jpeg/20150204/c26a3fe7884bb33dc74b676a2317419f.jpg', '543', '543', '7');
INSERT INTO `t_oa_seal` VALUES ('75', '/eos/image/jpeg/20150204/30d70eafdeb8a84e22812bd395e93c86.jpg', '问问', '问问', '7');
INSERT INTO `t_oa_seal` VALUES ('76', '/eos/image/jpeg/20150204/c26a3fe7884bb33dc74b676a2317419f.jpg', '谢谢亲', '谢谢亲', '7');
INSERT INTO `t_oa_seal` VALUES ('77', '/eos/image/gif/20150204/7059846bd0007e771a2c86dcd5404432.gif', '常德', '常德', '7');
INSERT INTO `t_oa_seal` VALUES ('78', '/eos/image/jpeg/20150204/c26a3fe7884bb33dc74b676a2317419f.jpg', '常德', '常德', '7');
INSERT INTO `t_oa_seal` VALUES ('79', '/eos/image/jpeg/20150204/30d70eafdeb8a84e22812bd395e93c86.jpg', '发给', '发给', '7');
INSERT INTO `t_oa_seal` VALUES ('80', '/eos/image/jpeg/20150204/30d70eafdeb8a84e22812bd395e93c86.jpg', '发的', '发的', '7');
INSERT INTO `t_oa_seal` VALUES ('81', '/eos/image/jpeg/20150204/c26a3fe7884bb33dc74b676a2317419f.jpg', '3', '3', '7');
INSERT INTO `t_oa_seal` VALUES ('82', '/eos/image/jpeg/20150204/c26a3fe7884bb33dc74b676a2317419f.jpg', '2', '2', '7');
INSERT INTO `t_oa_seal` VALUES ('83', '/eos/image/jpeg/20150204/c26a3fe7884bb33dc74b676a2317419f.jpg', 'a8af3914cd9ca896f.jpg', '', '7');
INSERT INTO `t_oa_seal` VALUES ('84', '/eos/image/jpeg/20150204/e9342776cdc25d0f4ef654bf4b931a33.jpg', '20131030142338-1169194126.jpg', '', '7');
INSERT INTO `t_oa_seal` VALUES ('85', '/eos/image/jpeg/20150204/c26a3fe7884bb33dc74b676a2317419f.jpg', 'a8af3914cd9ca896f.jpg', '', '7');
INSERT INTO `t_oa_seal` VALUES ('86', '/eos/image/jpeg/20150204/30d70eafdeb8a84e22812bd395e93c86.jpg', 'p15_b.jpg', '', '7');
INSERT INTO `t_oa_seal` VALUES ('88', '/eos/image/jpeg/20150204/30d70eafdeb8a84e22812bd395e93c86.jpg', 'p15_b.jpg', '', '7');
INSERT INTO `t_oa_seal` VALUES ('89', '/eos/image/gif/20150204/7059846bd0007e771a2c86dcd5404432.gif', '2140532948-0.gif', '', '7');
INSERT INTO `t_oa_seal` VALUES ('90', '/eos/image/jpeg/20150204/c26a3fe7884bb33dc74b676a2317419f.jpg', 'a8af3914cd9ca896f.jpg', '', '7');
INSERT INTO `t_oa_seal` VALUES ('91', '/eos/image/jpeg/20150204/c26a3fe7884bb33dc74b676a2317419f.jpg', 'a8af3914cd9ca896f.jpg', '', '7');
INSERT INTO `t_oa_seal` VALUES ('92', '/eos/image/jpeg/20150204/c26a3fe7884bb33dc74b676a2317419f.jpg', 'a8af3914cd9ca896f.jpg', '', '7');
INSERT INTO `t_oa_seal` VALUES ('93', '/eos/image/jpeg/20150204/30d70eafdeb8a84e22812bd395e93c86.jpg', 'p15_b.jpg', '', '7');
INSERT INTO `t_oa_seal` VALUES ('96', '/eos/image/jpeg/20150204/30d70eafdeb8a84e22812bd395e93c86.jpg', 'p15_b.jpg', '', '7');
INSERT INTO `t_oa_seal` VALUES ('97', '/eos/image/png/20150205/20795acb199d5a39e4cf4f7a2d6c9796.png', '3gz.png', '', '1');
INSERT INTO `t_oa_seal` VALUES ('100', '/eos/image/png/20150205/20795acb199d5a39e4cf4f7a2d6c9796.png', '3gz.png', '', '1');
INSERT INTO `t_oa_seal` VALUES ('101', '/eos/image/png/20150205/20795acb199d5a39e4cf4f7a2d6c9796.png', '3gz.png', '', '1');
INSERT INTO `t_oa_seal` VALUES ('102', '/eos/image/png/20150205/20795acb199d5a39e4cf4f7a2d6c9796.png', '3gz.png', '', '1');
INSERT INTO `t_oa_seal` VALUES ('103', '/eos/image/png/20150205/20795acb199d5a39e4cf4f7a2d6c9796.png', '3gz.png', '', '1');
INSERT INTO `t_oa_seal` VALUES ('104', '/eos/image/png/20150205/20795acb199d5a39e4cf4f7a2d6c9796.png', '3gz.png', '', '1');
INSERT INTO `t_oa_seal` VALUES ('105', '/eos/image/png/20150210/20795acb199d5a39e4cf4f7a2d6c9796.png', '3gz.png', '', '1');

-- ----------------------------
-- Procedure structure for `chat`
-- ----------------------------
DROP PROCEDURE IF EXISTS `chat`;
DELIMITER ;;
CREATE DEFINER=`eduz100`@`%` PROCEDURE `chat`(IN `userid` integer)
BEGIN
declare tid int default -1 ;
declare tnum int default 0;
declare cur1 CURSOR FOR 
				select operid from t_oa_address_book where owner=userid  and operid<>userid and operid is not null 
union 
select null;



	open cur1;
	fetch cur1 into tid;
		while(tid is not null) do

			
		delete from t_oa_message_one where (addresser=tid and recipient=userid) or (addresser=userid and recipient=tid);
			
			insert into t_oa_message_one
														 
							SELECT
								id,addresser,addressername,recipient,recipientname,content,date
							FROM
								(
									SELECT m.id,m.addresser,ao.USERNAME addressername,m.recipient,ab. NAME recipientname,m.content,m.date
									FROM	t_oa_message m
									LEFT JOIN t_oa_address_book ab ON m.recipient = ab.operid
									left join ac_operator ao on ao.id=m.addresser
									WHERE(m.addresser = tid and m.recipient = userid)
									AND m.recipient IS NOT NULL
									AND ab. NAME IS NOT NULL
									ORDER BY	m.date DESC
								) a
							GROUP BY	addresser,recipient
							union 
							SELECT
								id,addresser,addressername,recipient,recipientname,content,date
							FROM
								(
									SELECT m.id,m.addresser,ao.USERNAME addressername,m.recipient,ab. NAME recipientname,m.content,m.date
									FROM	t_oa_message m
									LEFT JOIN t_oa_address_book ab ON m.recipient = ab.operid
							left join ac_operator ao on ao.id=m.addresser
									WHERE(m.addresser = userid and m.recipient = tid)
									AND m.recipient IS NOT NULL
									AND ab. NAME IS NOT NULL
									ORDER BY	m.date DESC
								) a
							GROUP BY	addresser,recipient
							ORDER BY	date desc 
							limit 1;
			

			fetch cur1 into tid;
		end WHILE;
	close cur1;


select 1;

 /*展现

 select * from t_oa_message_one ORDER BY date desc; */

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `findOrgs`
-- ----------------------------
DROP PROCEDURE IF EXISTS `findOrgs`;
DELIMITER ;;
CREATE DEFINER=`eduz100`@`%` PROCEDURE `findOrgs`(IN `orgid` int,IN `layer` int)
BEGIN

/*创建接受查询的临时表 */
    create temporary table if not exists tmp_table(
		id int(11),name varchar(50),pid int(8), type varchar(11)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*最高允许递归数*/
    SET @@max_sp_recursion_depth = 99 ;
	IF orgid>0 THEN
			call iterative_Schools(orgid,layer);/*核心数据收集*/
     
	ELSE
			call iterative_Orgs(orgid,layer);/*核心数据收集*/
end if;

insert into tmp_table(id,name,pid,type)
select id,CONCAT(ORGNAME,''),parentid,'org' from ac_org where id=orgid; 

 /*展现*/
select id,name,pid,type from tmp_table where name is not null group by id,pid,type order by type; 

/*select * from tmp_table tt  right join ac_oper_org_relation a on tt.pid=a.ORGID;

select rela.operid id,ao.USERNAME name,'user' as type ,rela.orgid pid from ac_oper_org_relation rela
        left join ac_operator ao on rela.OPERID=ao.id where rela.ORGID in(select id from tmp_table) 
				and ao.USERNAME is not null;*/





   drop temporary table if exists   tmp_table ;/*删除临时表*/
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `iterative_Orgs`
-- ----------------------------
DROP PROCEDURE IF EXISTS `iterative_Orgs`;
DELIMITER ;;
CREATE DEFINER=`eduz100`@`%` PROCEDURE `iterative_Orgs`(IN `param_orgId` int,IN `layer` int)
BEGIN
		declare tid int default -1 ;
    declare tname varchar(50) charset utf8 ;
		declare type varchar(11);
		declare tpid int(8) ;
		declare tnum int(8) ;
         /* 游标定义 */

		declare cur1 CURSOR FOR 
				select id,ORGNAME,'org',PARENTID from ac_org where (id=belongorgid or belongorgid=0) and PARENTID=param_orgId;
		

	  declare CONTINUE HANDLER FOR SQLSTATE '02000' SET tid = null;
		
			/*insert into tmp_table(id,name,type,pid) 
						select operid id,ao.USERNAME name,'user' as type ,orgid pid from ac_oper_org_relation rela
        left join ac_operator ao on rela.OPERID=ao.id where orgid=param_orgId and ao.USERNAME is not null;*/
		
			select count(1) into tnum from ac_org where (id=belongorgid or belongorgid=0) and PARENTID=param_orgId;

			if tnum>0 THEN
			insert into tmp_table(id,name,type,pid) 
						select id,CONCAT(ORGNAME,''),'org',PARENTID from ac_org where (id=belongorgid or belongorgid=0) and PARENTID=param_orgId;
			end if;
			
/* 允许递归深度 */
      if layer>0 then
         OPEN cur1 ;
         FETCH cur1 INTO tid,tname,type,tpid ;
					
           WHILE ( tid is not null) 
              DO
               call iterative_Orgs(tid,layer-1);
              FETCH cur1 INTO tid,tname,type,tpid ;
           END WHILE;
     end if;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `iterative_Schools`
-- ----------------------------
DROP PROCEDURE IF EXISTS `iterative_Schools`;
DELIMITER ;;
CREATE DEFINER=`eduz100`@`%` PROCEDURE `iterative_Schools`(IN `param_orgId` int,IN `layer` int)
BEGIN
		declare tid int default -1 ;
    declare tname varchar(50) charset utf8 ;
		declare type varchar(11);
		declare tpid int(8) ;
		declare tnum int(8) ;
         /* 游标定义 */

		declare cur1 CURSOR FOR 
				select id,ORGNAME,'org',PARENTID from ac_org where PARENTID=param_orgId;
		

	  declare CONTINUE HANDLER FOR SQLSTATE '02000' SET tid = null;

/*insert into tmp_table(id,name,type,pid) 
						select operid id,ao.USERNAME name,'user' as type ,orgid pid from ac_oper_org_relation rela
					left join ac_operator ao on rela.OPERID=ao.id where orgid=param_orgId  and ao.USERNAME is not null;*/
		
			select count(1) into tnum from ac_org where PARENTID=param_orgId;

			if tnum>0 THEN
			insert into tmp_table(id,name,type,pid) 
						select id,CONCAT(ORGNAME,''),'org',PARENTID from ac_org where  PARENTID=param_orgId;
			
			end if;
			
/* 允许递归深度 
      if layer>0 then*/
         OPEN cur1 ;
         FETCH cur1 INTO tid,tname,type,tpid ;
					
           WHILE ( tid is not null) 
              DO
               call iterative_Schools(tid,layer-1);
              FETCH cur1 INTO tid,tname,type,tpid ;
           END WHILE;
     /*end if;*/

END
;;
DELIMITER ;
