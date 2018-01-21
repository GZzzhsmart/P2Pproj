/*
Navicat MySQL Data Transfer

Source Server         : MySQL连接
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : p2p

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-20 08:23:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_bankcard
-- 绑卡表
-- ----------------------------
DROP TABLE IF EXISTS `t_bankcard`;
CREATE TABLE `t_bankcard` (
  `bcid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `cardno` varchar(30) NOT NULL COMMENT '银行卡号',
  `rname` varchar(20) NOT NULL COMMENT '绑卡人姓名',
  `idno` char(18) DEFAULT NULL COMMENT '身份证号码，默认为18位',
  `type` varchar(20) NOT NULL COMMENT '所属银行',
  `state` tinyint(4) DEFAULT NULL COMMENT '银行卡状态，0激活，1冻结',
  `date` datetime DEFAULT NULL COMMENT '绑卡时间',
  PRIMARY KEY (`bcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for t_borrowapply
-- 申请借款表
-- ----------------------------
DROP TABLE IF EXISTS `t_borrowapply`;
CREATE TABLE `t_borrowapply` (
  `baid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rname` varchar(20) NOT NULL COMMENT '真实姓名',
  `money` decimal(2,0) DEFAULT NULL COMMENT '申请金额',
  `uid` bigint(20) DEFAULT NULL COMMENT '借款人id，uid为t_user表id',
  `bzid` bigint(20) DEFAULT NULL COMMENT '标种',
  `time` datetime DEFAULT NULL COMMENT '审核时间',
  `state` tinyint(4) DEFAULT NULL COMMENT '审核状态（0表示已审核，1表示未审核）',
  `type` tinyint(4) DEFAULT NULL COMMENT '借款类型为标种的主键字段，比如普金包，多金宝',
  `term` varchar(20) DEFAULT NULL COMMENT '借款期限',
  `deadline` datetime NOT NULL  COMMENT '截止时间',
  `huid` bigint(20) DEFAULT NULL COMMENT '审核人id',
  `reason` varchar(50) DEFAULT NULL COMMENT '审核理由',
  PRIMARY KEY (`baid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for t_borrowdetail
-- 借款详情表
-- ----------------------------
DROP TABLE IF EXISTS `t_borrowdetail`;
CREATE TABLE `t_borrowdetail` (
  `bdid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fpic` varchar(50) DEFAULT NULL COMMENT '法人身份证照片',
  `ypic` varchar(50) DEFAULT NULL COMMENT '营业执照副本照片',
  `qpic` varchar(50) DEFAULT NULL COMMENT '企业银行账号',
  `tpic` varchar(50) NOT NULL COMMENT '其他资料',
  `mpurpose` varchar(100) NOT NULL COMMENT '资金用途',
  `hksource` varchar(100) DEFAULT NULL COMMENT '还款来源',
  `suggest` varchar(500) DEFAULT NULL COMMENT '借款人介绍',
  `xmdescrip` varchar(500) DEFAULT NULL COMMENT '项目描述',
  `guarantee` varchar(500) DEFAULT NULL COMMENT '保障措施',
  `money` decimal(7,2) DEFAULT NULL COMMENT '金额', 
  `nprofit` float(3,2) DEFAULT NULL COMMENT '年化收益',
  `sid` bigint(20) DEFAULT NULL COMMENT '收益方式',
  `cpname` varchar(200) DEFAULT NULL COMMENT '产品名称',
  `baid` bigint(20) DEFAULT NULL COMMENT '借款人id，baid为t_borrowapply表id',
  `int1` bigint(20) DEFAULT NULL COMMENT '预留字段',
  `str1` varchar(20) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`bdid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for t_bz
-- 标种表
-- ----------------------------
DROP TABLE IF EXISTS `t_bz`;
CREATE TABLE `t_bz` (
  `bzid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `bzname` varchar(20) DEFAULT NULL COMMENT '标种名称',
  `state` tinyint(4) DEFAULT NULL COMMENT '标种状态(0为可用，1为不可用)',
  PRIMARY KEY (`bzid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_dxmodel
-- 短信模板表
-- ----------------------------
DROP TABLE IF EXISTS `t_dxmodel`;
CREATE TABLE `t_dxmodel` (
  `dxid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_dynamic
-- 公司动态表
-- ----------------------------
DROP TABLE IF EXISTS `t_dynamic`;
CREATE TABLE `t_dynamic` (
  `dyid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `pic` varchar(50) DEFAULT NULL COMMENT '封面图片',
  PRIMARY KEY (`dyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_friend
-- 合作伙伴表
-- ----------------------------
DROP TABLE IF EXISTS `t_friend`;
CREATE TABLE `t_friend` (
  `fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `furl` varchar(50) DEFAULT NULL COMMENT '链接',
  `fpic` varchar(50) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for t_hkb
-- 还款表 save update list
-- ----------------------------
DROP TABLE IF EXISTS `t_hkb`;
CREATE TABLE `t_hkb` (
  `hkid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT 'uid为前台用户表t_user主键字段',
  `rname` varchar(20) NOT NULL COMMENT '真实姓名',
  `cpname` varchar(20) NOT NULL COMMENT '产品名称',
  `rnum` int(11) DEFAULT NULL COMMENT '已还期数',
  `tnum` int(11) DEFAULT NULL COMMENT '总期数',
  `ytime` datetime DEFAULT NULL COMMENT '应还时间',
  `rtime` datetime DEFAULT NULL COMMENT '实际还款时间',
  `bzname` varchar(20) DEFAULT NULL COMMENT '标种名称，bzname为t_bz表里面标种名称',
  `ybx` decimal(7,2) DEFAULT NULL COMMENT '应还本息',
  `rbx` decimal(7,2) DEFAULT NULL COMMENT '已还本息',
  `ylx` decimal(7,2) DEFAULT NULL COMMENT '应还利息',
  `rlx` decimal(7,2) DEFAULT NULL COMMENT '已还利息',
  `ybj` decimal(7,2) DEFAULT NULL COMMENT '应还本金',
  `rbj` decimal(7,2) DEFAULT NULL COMMENT '已还本金',
  `yfx` decimal(7,2) DEFAULT NULL COMMENT '应还罚息',
  `rfx` decimal(7,2) DEFAULT NULL COMMENT '已还罚息',
  `yucount` int(11) DEFAULT NULL COMMENT '逾期次数',
  `state` tinyint(4) DEFAULT NULL COMMENT '还款状态（0未还款，1已还款）',
  `baid` bigint(20) DEFAULT NULL COMMENT '借款人id ，t_borrowapply主键id',
  `yustartime` datetime DEFAULT NULL COMMENT '逾期执行时间',
  `huid` bigint(20) DEFAULT NULL COMMENT '贷后负责人 t_huser后台用户id字段',
  `int1` bigint(20) DEFAULT NULL COMMENT '预留字段',
  `str1` varchar(20) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`hkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for t_home
-- 首页信息表
-- ----------------------------
DROP TABLE IF EXISTS `t_home`;
CREATE TABLE `t_home` (
  `hid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pic1` varchar(50) DEFAULT NULL COMMENT '轮播图1',
  `pic2` varchar(50) DEFAULT NULL COMMENT '轮播图2',
  `pic3` varchar(50) DEFAULT NULL COMMENT '轮播图3',
  `ewm` varchar(100) DEFAULT NULL COMMENT '二维码',
  `phone` char(11) DEFAULT NULL COMMENT '手机号码',
  `l1` varchar(50) DEFAULT NULL COMMENT '链接1',
  `l2` varchar(50) DEFAULT NULL COMMENT '链接2',
  `l3` varchar(50) DEFAULT NULL COMMENT '链接3',
  `l4` varchar(50) DEFAULT NULL COMMENT '链接4',
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_huser
-- 后台用户表
-- ----------------------------
DROP TABLE IF EXISTS `t_huser`;
CREATE TABLE `t_huser` (
  `huid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `rname` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `sex` tinyint(4) NOT NULL COMMENT '性别（0男，1女）',
  `phone` char(11) NOT NULL COMMENT '手机号码',
  `huname` varchar(50) DEFAULT NULL COMMENT '用户名，相当于昵称',
  `oid` int(11) DEFAULT NULL COMMENT '所属组id',
  `oname` varchar(20) DEFAULT NULL COMMENT '组名',
  `email` varchar(30) DEFAULT NULL COMMENT '电子邮箱',
  `int1` bigint(20) DEFAULT NULL COMMENT '预留字段',
  `str1` varchar(20) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`huid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_jklx
-- 借款类型表
-- ----------------------------
DROP TABLE IF EXISTS `t_jklx`;
CREATE TABLE `t_jklx` (
  `lxid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `lxname` varchar(20) DEFAULT NULL COMMENT '借款类型，如（先本后息，先息后本，等额本息，等额本金）',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态（0可用，1不可用）',
  PRIMARY KEY (`lxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_jur
-- 权限表
-- ----------------------------
DROP TABLE IF EXISTS `t_jur`;
CREATE TABLE `t_jur` (
  `jid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `jurl` varchar(50) DEFAULT NULL COMMENT '权限URL',
  `content` varchar(500) DEFAULT NULL COMMENT '权限描述',
  PRIMARY KEY (`jid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_letter
-- 站内信表
-- ----------------------------
DROP TABLE IF EXISTS `t_letter`;
CREATE TABLE `t_letter` (
  `lid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `date` datetime DEFAULT NULL COMMENT '日期',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态，0激活，1冻结',
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for t_logczz
-- 充值记录表
-- ----------------------------
DROP TABLE IF EXISTS `t_logczz`;
CREATE TABLE `t_logczz` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) NOT NULL COMMENT '用户id',
  `bankcard` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `banktype` varchar(20) DEFAULT NULL COMMENT '所属银行',
  `money` decimal(7,2) DEFAULT NULL COMMENT '金额',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态，0充值成功，1充值失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for t_logmoney
-- 资金流向表
-- ----------------------------
DROP TABLE IF EXISTS `t_logmoney`;
CREATE TABLE `t_logmoney` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型，0充值，1提现，2回款，3系统金额（公司奖励等）',
  `in` decimal(7,2) DEFAULT NULL COMMENT '收入',
  `out` decimal(7,2) DEFAULT NULL COMMENT '支出',
  `date` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_logtx
-- 提现记录表
-- ----------------------------
DROP TABLE IF EXISTS `t_logtx`;
CREATE TABLE `t_logtx` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `bankcard` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `banktype` varchar(20) DEFAULT NULL COMMENT '所属银行',
  `money` decimal(7,2) DEFAULT NULL COMMENT '提现金额',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态，0提现成功，1未提现失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for t_media
-- 媒体报道表
-- ----------------------------
DROP TABLE IF EXISTS `t_media`;
CREATE TABLE `t_media` (
  `mid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `pic` varchar(50) DEFAULT NULL COMMENT '封面图片',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `url` varchar(50) DEFAULT NULL COMMENT '报道的链接地址',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_notice
-- 最新公告表
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `nid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `title` varchar(20) DEFAULT NULL COMMENT '标题',
  `date` datetime DEFAULT NULL COMMENT '公告时间',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for t_option
-- 用户反馈表
-- ----------------------------
DROP TABLE IF EXISTS `t_option`;
CREATE TABLE `t_option` (
  `opid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `phone` char(11) NOT NULL COMMENT '电话',
  `content` varchar(200) DEFAULT NULL COMMENT '内容',
  `date` datetime DEFAULT NULL COMMENT '反馈时间',
  PRIMARY KEY (`opid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_recommend
-- 推荐管理表
-- ----------------------------
DROP TABLE IF EXISTS `t_recommend`;
CREATE TABLE `t_recommend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tid` bigint(20) DEFAULT NULL COMMENT '推荐人id',
  `tname` varchar(20) DEFAULT NULL COMMENT '推荐人姓名',
  `uid` bigint(20) DEFAULT NULL COMMENT '被推荐人id',
  `rname` varchar(20) DEFAULT NULL COMMENT '被推荐人姓名',
  `date` datetime DEFAULT NULL COMMENT '推荐时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_reward
-- 投资总额奖励表
-- ----------------------------
DROP TABLE IF EXISTS `t_reward`;
CREATE TABLE `t_reward` (
  `rwid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '投资人id，t_user前台用户表id字段',
  `tmoney` decimal(7,2) DEFAULT NULL COMMENT '投资总额',
  `money` decimal(7,2) DEFAULT NULL COMMENT '奖励金额',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态（0已发放，1未发放）',
  `date` datetime DEFAULT NULL COMMENT '奖励发放时间',
  PRIMARY KEY (`rwid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_rewardsetting
-- 投资奖励设置表
-- ----------------------------
DROP TABLE IF EXISTS `t_rewardsetting`;
CREATE TABLE `t_rewardsetting` (
  `rwid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `minmoney` decimal(7,2) DEFAULT NULL COMMENT '最小金额',
  `maxmoney` decimal(7,2) DEFAULT NULL COMMENT '最大金额',
  `percent` double(255,0) DEFAULT NULL COMMENT '奖励百分比',
  PRIMARY KEY (`rwid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for t_role
-- 角色表
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `rid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `rname` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `content` varchar(500) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_rolejur
-- 角色权限表
-- ----------------------------
DROP TABLE IF EXISTS `t_rolejur`;
CREATE TABLE `t_rolejur` (
  `rjid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色id，t_role主键id',
  `jid` bigint(20) DEFAULT NULL COMMENT '权限id，t_jur主键id',
  PRIMARY KEY (`rjid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for t_roleuser
-- 用户角色表
-- ----------------------------
DROP TABLE IF EXISTS `t_roleuser`;
CREATE TABLE `t_roleuser` (
  `ruid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色id',
  `huid` bigint(20) DEFAULT NULL COMMENT '后台用户id',
  PRIMARY KEY (`ruid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_rzvip
-- 认证表
-- ----------------------------
DROP TABLE IF EXISTS `t_rzvip`;
CREATE TABLE `t_rzvip` (
  `rid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) NOT NULL  COMMENT '用户id t_user表uid',
  `xl` varchar(40) DEFAULT NULL COMMENT '学历',
  `ism` tinyint(4) DEFAULT NULL COMMENT '婚否（0已婚，1未婚）',
  `bschool` varchar(30) DEFAULT NULL COMMENT '毕业学校',
  `addr` varchar(40) NOT NULL COMMENT '居住地址',
  `work` varchar(30) DEFAULT NULL COMMENT '现工作',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `int1` bigint(20) DEFAULT NULL COMMENT '预留字段',
  `str1` varchar(20) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_rzvipcheck
-- 认证审核表
-- ----------------------------
DROP TABLE IF EXISTS `t_rzvipcheck`;
CREATE TABLE `t_rzvipcheck` (
  `rcid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `huid` bigint(20) DEFAULT NULL COMMENT '审核人id',
  `isok` tinyint(4) DEFAULT NULL COMMENT '审核是否通过，0通过，1未通过',
  `excute` varchar(200) DEFAULT NULL COMMENT '理由',
  `date` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`rcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for t_shborrow
-- 借款审核表
-- ----------------------------
DROP TABLE IF EXISTS `t_shborrow`;
CREATE TABLE `t_shborrow` (
  `shid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `huid` bigint(20) DEFAULT NULL COMMENT '审核人id，t_huser后台用户主键id',
  `isok` tinyint(4) DEFAULT NULL COMMENT '审核是否通过（0未审核，1已审核）',
  `excute` varchar(200) DEFAULT NULL COMMENT '审核理由',
  `date` datetime DEFAULT NULL COMMENT '审核时间',
  `baid` bigint(20) DEFAULT NULL COMMENT '借款人id，t_borrowapply申请借款表主键id字段',
  PRIMARY KEY (`shid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_skb
-- 收款表 save update
-- ----------------------------
DROP TABLE IF EXISTS `t_skb`;
CREATE TABLE `t_skb` (
  `skid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id，前台用户t_user主键id',
  `juid` bigint(20) DEFAULT NULL COMMENT '借款人id，t_borrowapply表主键id',
  `ybx` decimal(7,2) DEFAULT NULL COMMENT '应收本息',
  `rbx` decimal(7,2) DEFAULT NULL COMMENT '已收本息',
  `ylx` decimal(7,2) DEFAULT NULL COMMENT '应收利息',
  `rlx` decimal(7,2) DEFAULT NULL COMMENT '已收利息',
  `ybj` decimal(7,2) DEFAULT NULL COMMENT '应收本金',
  `rbj` decimal(7,2) DEFAULT NULL COMMENT '已收本金',
  `rnum` int(11) DEFAULT NULL COMMENT '已还期数',
  `tnum` int(11) DEFAULT NULL COMMENT '总期数',
  `date` datetime DEFAULT NULL COMMENT '日期',
  `baid` bigint(20) DEFAULT NULL COMMENT '借款人id，t_borrowapply表主键id',
  `fmoney` decimal(7,2) DEFAULT NULL COMMENT '好友奖励',
  `int1` bigint(20) DEFAULT NULL COMMENT '预留字段',
  `str1` varchar(20) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`skid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_sway
-- 还款方式表
-- ----------------------------
DROP TABLE IF EXISTS `t_sway`;
CREATE TABLE `t_sway` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `way` tinyint(4) DEFAULT NULL COMMENT '方式',
  `fw` varchar(200) DEFAULT NULL COMMENT '算法',
  `state` tinyint(4) DEFAULT NULL COMMENT '还款方式状态（0不可用，1可用）',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ticket
-- 优惠券表
-- ----------------------------
DROP TABLE IF EXISTS `t_ticket`;
CREATE TABLE `t_ticket` (
  `kid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `type` tinyint(4) DEFAULT NULL COMMENT '优惠券类型，如现金劵，代金券，体验金',
  `tkmoney` decimal(7,2) DEFAULT NULL COMMENT '优惠券金额',
  `tktime` datetime DEFAULT NULL COMMENT '有效时间',
  PRIMARY KEY (`kid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_txcheck
-- 提现审核表
-- ----------------------------
DROP TABLE IF EXISTS `t_txcheck`;
CREATE TABLE `t_txcheck` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `txid` bigint(20) DEFAULT NULL COMMENT '提现人id',
  `huid` bigint(20) DEFAULT NULL COMMENT '审核人id',
  `isok` tinyint(4) DEFAULT NULL COMMENT '审核是否通过，0通过，1未通过',
  `excute` varchar(200) DEFAULT NULL COMMENT '审核理由',
  `date` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_tzb
-- 投资表
-- ----------------------------
DROP TABLE IF EXISTS `t_tzb`;
CREATE TABLE `t_tzb` (
  `tzid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '前台用户t_user表id字段',
  `juid` bigint(20) DEFAULT NULL COMMENT '借款人id，t_borrowapply表主键id',
  `money` decimal(10,2) NOT NULL COMMENT '投资金额',
  `time` datetime NOT NULL COMMENT '投资时间',
  `nprofit` float(3,2) NOT NULL COMMENT '利率',
  `cpname` varchar(20) NOT NULL COMMENT '产品名称',
  `baid` bigint(20) DEFAULT NULL COMMENT '借款id 取t_borrowapply表id',
  `int1` bigint(20) DEFAULT NULL COMMENT '预留字段',
  `str1` varchar(20) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`tzid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user
-- 前台用户表
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uname` varchar(20) NOT NULL COMMENT '用户名',
  `upwd` varchar(100) NOT NULL COMMENT '密码，进行MD5加密',
  `phone` char(11) NOT NULL COMMENT '手机号码',
  `tzm` varchar(100) DEFAULT NULL COMMENT '推荐码',
  `idtype` varchar(20) DEFAULT NULL COMMENT '证件类型',
  `idno` char(18) DEFAULT NULL COMMENT '证件号（身份证号）',
  `zpwd` varchar(100) DEFAULT NULL COMMENT '支付密码',
  `email` varchar(30) NOT NULL COMMENT '电子邮箱',
  `rname` varchar(20) NOT NULL COMMENT '真实姓名',
  `tid` bigint(20) DEFAULT NULL COMMENT '推荐人id， t_recommend推荐人表主键id',
  `face` varchar(50) NOT NULL COMMENT '头像',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别（0男，1女）',
  `isvip` tinyint(4) DEFAULT NULL COMMENT '是否为VIP用户，0是，1否',
  `int1` bigint(20) DEFAULT NULL COMMENT '预留字段',
  `str1` varchar(20) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_usermoney
-- 用户资金表
-- ----------------------------
DROP TABLE IF EXISTS `t_usermoney`;
CREATE TABLE `t_usermoney` (
  `umid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `zmoney` decimal(7,2) DEFAULT NULL COMMENT '总资产',
  `kymoney` decimal(7,2) DEFAULT NULL COMMENT '可用余额',
  `symoney` decimal(7,2) DEFAULT NULL COMMENT '收益总额',
  `tzmoney` decimal(7,2) DEFAULT NULL COMMENT '投资总额',
  `djmoney` decimal(7,2) DEFAULT NULL COMMENT '冻结金额',
  `dsmoney` decimal(7,2) DEFAULT NULL COMMENT '待收金额',
  `jlmoney` decimal(7,2) DEFAULT NULL COMMENT '奖励金额',
  PRIMARY KEY (`umid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_userticket
-- 领劵表
-- ----------------------------
DROP TABLE IF EXISTS `t_userticket`;
CREATE TABLE `t_userticket` (
  `ukid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '前台用户id',
  `kid` bigint(20) DEFAULT NULL COMMENT '劵id',
  `tktime` datetime DEFAULT NULL COMMENT '领劵时间',
  PRIMARY KEY (`ukid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_ydate
-- 运营数据表
-- ----------------------------
DROP TABLE IF EXISTS `t_ydate`;
CREATE TABLE `t_ydate` (
  `yid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `date` datetime DEFAULT NULL COMMENT '生成时间',
  `tmoney` decimal(7,2) DEFAULT NULL COMMENT '交易总额',
  `mmoney` decimal(7,2) DEFAULT NULL COMMENT '月交易总额',
  `tuser` int(11) DEFAULT NULL COMMENT '总用户数',
  `muser` int(11) DEFAULT NULL COMMENT '月用户数',
  `ttzno` int(11) DEFAULT NULL COMMENT '总投资人数',
  `mtzno` int(11) DEFAULT NULL COMMENT '月投资人数',
  `tdkno` int(11) DEFAULT NULL COMMENT '总贷款人数',
  `mdkno` int(11) DEFAULT NULL COMMENT '月贷款人数', 
  `tdkbno` int(11) DEFAULT NULL COMMENT '总贷款笔数',
  `mdkbno` int(11) DEFAULT NULL COMMENT '月贷款笔数',
  PRIMARY KEY (`yid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
