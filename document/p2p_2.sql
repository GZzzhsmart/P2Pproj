/*
Navicat MySQL Data Transfer

Source Server         : 教室mysql
Source Server Version : 50717
Source Host           : 192.168.3.105:3306
Source Database       : p2p_2

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-22 21:28:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_bank
-- ----------------------------
DROP TABLE IF EXISTS `t_bank`;
CREATE TABLE `t_bank` (
  `id` bigint(20) NOT NULL,
  `bankName` varchar(255) DEFAULT NULL,
  `deposit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bank
-- ----------------------------
INSERT INTO `t_bank` VALUES ('1', '中国农业银行', 'logo_abc.png');
INSERT INTO `t_bank` VALUES ('2', '中信银行', '1.jpg');
INSERT INTO `t_bank` VALUES ('3', '中国银行', '2.jpg');
INSERT INTO `t_bank` VALUES ('4', '兴业银行', '3.jpg');
INSERT INTO `t_bank` VALUES ('5', '邮政储蓄', '4.jpg');
INSERT INTO `t_bank` VALUES ('6', '交通银行', '5.jpg');
INSERT INTO `t_bank` VALUES ('7', '华夏银行', '6.jpg');
INSERT INTO `t_bank` VALUES ('8', '大连银行', '7.jpg');

-- ----------------------------
-- Table structure for t_bankcard
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bankcard
-- ----------------------------
INSERT INTO `t_bankcard` VALUES ('3', '34', '13737284568', '赖国荣', '412532144535465', '1', '0', '2018-01-09 10:23:24');
INSERT INTO `t_bankcard` VALUES ('4', '38', '137372868', '谢山', '13254656569', '2', '0', '2018-01-09 11:10:13');
INSERT INTO `t_bankcard` VALUES ('5', '37', '13737268', '程哥', '1214654465', '3', '0', '2018-01-09 11:18:59');
INSERT INTO `t_bankcard` VALUES ('6', '46', '13737568', '彭于晏', '4234565768768', '2', '0', '2018-01-09 14:26:14');
INSERT INTO `t_bankcard` VALUES ('29', '47', '12345', '吴磊', '16389898', '2', '0', '2018-01-16 09:57:42');
INSERT INTO `t_bankcard` VALUES ('30', '48', '6345241', '你好', '432456565634523', '1', '0', '2018-01-16 10:08:55');
INSERT INTO `t_bankcard` VALUES ('46', '50', '621700215739217213', '陈桢', '9867546345234123', '6', '0', '2018-01-17 20:16:37');
INSERT INTO `t_bankcard` VALUES ('51', '28', '62170021798898426', '李云龙', '362426199701232303', '3', '0', '2018-01-19 09:02:26');
INSERT INTO `t_bankcard` VALUES ('52', '1', '6123154545454545456', '胡八一', '360782199512236699', '5', '0', '2018-01-19 09:13:42');
INSERT INTO `t_bankcard` VALUES ('53', '79', '6217002147897410254', '赖勇建', '759293674234', '1', '0', '2018-01-21 19:19:03');

-- ----------------------------
-- Table structure for t_borrowapply
-- ----------------------------
DROP TABLE IF EXISTS `t_borrowapply`;
CREATE TABLE `t_borrowapply` (
  `baid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rname` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `money` decimal(10,2) DEFAULT NULL COMMENT '申请金额',
  `uid` bigint(20) DEFAULT NULL COMMENT '借款人id，uid为t_user表id',
  `bzid` bigint(20) DEFAULT NULL COMMENT '标种',
  `time` datetime DEFAULT NULL COMMENT '审核时间',
  `state` tinyint(4) DEFAULT NULL COMMENT '审核状态（0表示审核通过，1表示未审核，2已满标，3审核不通过）',
  `lxid` bigint(20) DEFAULT NULL COMMENT '借款类型为标种的主键字段',
  `term` int(11) DEFAULT NULL COMMENT '借款期限',
  `deadline` datetime DEFAULT NULL COMMENT '截止时间',
  `reason` varchar(50) DEFAULT NULL COMMENT '预留字段',
  `huid` bigint(20) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`baid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_borrowapply
-- ----------------------------
INSERT INTO `t_borrowapply` VALUES ('1', '李小龙', '25000.00', '31', '1', '2017-12-29 08:51:20', '0', '1', '5', '2017-05-30 16:46:52', '通过', '1');
INSERT INTO `t_borrowapply` VALUES ('2', '胡八一', '21000.00', '1', '2', '2018-01-10 14:22:21', '0', '2', '3', '2018-04-10 08:51:28', '审核通过', '2');
INSERT INTO `t_borrowapply` VALUES ('3', '曾志湖', '26000.00', '33', '3', '2017-12-29 09:28:41', '0', '3', '5', '2017-05-28 20:12:53', '通过', '2');
INSERT INTO `t_borrowapply` VALUES ('4', '赖国荣', '30000.00', '34', '4', '2017-12-28 20:38:36', '0', '4', '6', '2017-06-28 20:19:28', '审核通过', '1');
INSERT INTO `t_borrowapply` VALUES ('23', '李云龙', '50000.00', '28', '5', '2018-01-05 16:21:04', '0', '3', '3', '2018-03-05 14:14:17', '审核通过', '2');
INSERT INTO `t_borrowapply` VALUES ('24', '胡歌', '15000.00', '36', '1', '2018-01-12 15:22:22', '3', '3', '3', '2018-04-12 14:58:26', '审核不通过，用户认证信息不全', '1');
INSERT INTO `t_borrowapply` VALUES ('25', '李小龙', '20000.00', '1', '1', '2018-01-15 20:13:16', '0', '2', '5', '2018-06-15 14:19:57', '审核通过', '1');
INSERT INTO `t_borrowapply` VALUES ('26', '吴磊', '17500.00', '47', '5', '2018-01-16 10:13:38', '0', '2', '2', '2018-03-16 10:15:14', '审核通过', '2');
INSERT INTO `t_borrowapply` VALUES ('28', '彭于晏', '21500.00', '46', '1', '2018-01-19 10:45:53', '0', '1', '2', '2018-03-19 10:47:03', '通过', '1');
INSERT INTO `t_borrowapply` VALUES ('29', '小赖子', '31000.00', '79', '1', '2018-01-21 19:35:47', '0', '1', '4', '2018-05-21 19:34:57', '通过', '1');

-- ----------------------------
-- Table structure for t_borrowdetail
-- ----------------------------
DROP TABLE IF EXISTS `t_borrowdetail`;
CREATE TABLE `t_borrowdetail` (
  `bdid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fpic` varchar(50) DEFAULT NULL COMMENT '法人身份证照片',
  `ypic` varchar(50) DEFAULT NULL COMMENT '营业执照副本照片',
  `qpic` varchar(50) DEFAULT NULL COMMENT '企业银行账号',
  `tpic` varchar(50) DEFAULT NULL COMMENT '其他资料',
  `mpurpose` varchar(100) DEFAULT NULL COMMENT '资金用途',
  `hksource` varchar(1000) DEFAULT NULL COMMENT '还款来源',
  `suggest` varchar(1000) DEFAULT NULL COMMENT '借款人介绍',
  `xmdescrip` varchar(1000) DEFAULT NULL COMMENT '项目描述',
  `guarantee` varchar(1000) DEFAULT NULL COMMENT '保障措施',
  `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `nprofit` decimal(7,2) DEFAULT NULL COMMENT '年化收益',
  `sid` bigint(20) DEFAULT NULL COMMENT '收益方式,t_sway表sid',
  `cpname` varchar(200) DEFAULT NULL COMMENT '产品名称',
  `baid` bigint(20) DEFAULT NULL COMMENT '借款人id，baid为t_borrowapply表id',
  PRIMARY KEY (`bdid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_borrowdetail
-- ----------------------------
INSERT INTO `t_borrowdetail` VALUES ('1', '201801021957041.jpg', '201801021957042.jpg', '2018010219303101.jpg', '2018010219303102.jpg', '用于贷款', '***有限公司', '赣州**商贸有限责任公司成立于2007年04月23日  ，注册资本260万，实收资本260万元，股东分别为李**占比60%、吴**占比40%，经营范围：预包装食品，散装食品，乳制品（含婴幼儿配方乳粉）批发兼零售（凭有效食品经营许可证经营）；食盐批发(凭食盐批发有效许可证经营)；日用品销售；市场营销策划；展览展示服务。公司现有在册员工87名，办公面积600余平方米，仓储面积5000余平米，配送车辆11台。2016年年营业收入6147.82万元左右，净利润519.33万元，2017年1-10月年营业收入5568.88万元，净利润479.49万元。', '本次借款主要用于年底年货销售旺季备货，该企业借款金额为100万元，第一期50万元，期限3个月，本平台为此借款提供服务。', '1、 公司股东李**、吴**夫妇提供无限连带责任担保\r\n2、在中登网登记2018年度与赣州**实业有限公司应收账款金额不低于240万元', '0.00', '10.00', '1', 'YRB1101', '1');
INSERT INTO `t_borrowdetail` VALUES ('2', '201801021957041.jpg', '201801021957042.jpg', '2018010219303101.jpg', '2018010219303102.jpg', '用于买车', '至锐科技', '借款人李**，男，赣州市石城人， 2014年经营一家广告公司，每月盈利5万元左右，经济实力强，该次借款用于还清银行按揭贷款，尾款目前余额50万元左右， 该借款人已跟买家签好房屋买卖合同，房产售出即可回款。', '本次借款用于还清银行按揭贷款，尾款目前余额50万元左右， 该借款人已跟买家签好房屋买卖合同，房产售出即可回款，该次借款金额为20万元，借款期限3个月，本平台为此借款提供服务。', '1、监控交易回款账户', '0.00', '50.00', '2', 'YRB0202', '2');
INSERT INTO `t_borrowdetail` VALUES ('3', '201801021957041.jpg', '201801021957042.jpg', '2018010219303101.jpg', '2018010219303102.jpg', '用于投资', '***工作室', '赣州市***贸易有限公司成立于2014-11-11，注册资金500万元，经营范围：玻璃制品及原材料、化工材料（危险化学品除外）、光伏组件、光伏材料及辅材、机械设备、五金建材、电子产品批发、零售。本次借款主要用采购焦锑酸钠，该企业借款金额为100万元，第一期50万元，期限3个月，本平台为此借款提供服务。', '赣州市***贸易有限公司是 江西**光伏玻璃有限公司上下游供应链关键环节，后者是赣州市于2011年引进的以光伏玻璃生产、加工、销售的民营企业，到目前为止总投资达2.2亿元，土地面积250亩，拥有员工230人，是赣州唯一生产光伏玻璃企业，被列入省战略性新兴产业,赣州市主攻工业三年翻翻前30名企业。公司计划总投资6亿元，一期于2013年已经投资2.2亿元建成投产日产250吨光伏玻璃生产线，现正在积极筹划建设二期日产600吨光伏玻璃生产线。江西**光伏玻璃有限公司为赣州市***贸易有限公司借款提供无限连带责任担保，并提供上市公司500w应收账款质押，已在中证网登记为凭证。', '1、 赣州市***贸易有限公司股东周*承担无限连带责任担保；\r\n2、 江西**光伏玻璃有限公司提供上市公司500w应收账款质押，中证网登记证明编号：0405 6452 0004 8678 1797；\r\n3、 江西**光伏的所有股东周*、黄**承担无限连带责任担保；', '0.00', '40.00', '4', 'YRB0303', '3');
INSERT INTO `t_borrowdetail` VALUES ('4', '201801021957041.jpg', '201801021957042.jpg', '2018010219303101.jpg', '2018010219303102.jpg', '用于投资', '***科技公司', '江西某农业发展有限公司成立于2011年09月20日 ，注册资本1200万元，股东分别为邹**占比95%、张**占比5%，主要经营范围：水果、蔬菜种植、收购、储藏、包装、销售；苗木培育；水果、蔬菜、预包装食品、散装食品（凭有效许可证经营）、农副产品、农产品批发、零售；网上经营：水果、蔬菜、预包装食品、散装食品、农副产品、农产品。现有员工35名。公司2016年主营业务收入3310.66万元，利润376.10万元，截止至2017年9月，主营业务收入3574.23万元，净利润421.36万元。历年12月销售脐橙686.52万元，1月销售脐橙645.87万元，2月销售脐521.58万元，近三个月销量1853.97万元，销量可观，目前企业自有脐橙园正在种植中，预计2019年可以结果。目前均从各大果农处收购脐橙。', '本次借款主要用于收购脐橙，通过往年销售情况比对，今年脐橙销量可观，且净利率高，今年10月份已经打款给果农预定399万斤，销售额不低于2000万元，今年11月5日开始采摘脐橙，脐橙销量将在12月，1月，2月迎来销量暴发，现金流大，去年（2016年）同期现金流流入1949.32万元。该企业借款金额为100万元，第一期50万元，借款期限3个月，本平台为此借款提供服务.', '1、公司股东邹**、张**夫妇提供无限连带责任担保\r\n2、某银行行长赖某提供无限连带责任担保', '0.00', '40.00', '2', 'YRB0404', '4');
INSERT INTO `t_borrowdetail` VALUES ('18', '201801021957041.jpg', '201801021957042.jpg', '2018010219303101.jpg', '2018010219303102.jpg', '用于投资', '***公司', '借款人李某，男，江西赣州人，2013年合伙经营一家大型网吧，每月可分红3万元，经济实力强。', '本次借款总额为20万元，借款期限1个月，客户借款用于与朋友徐某、范某 一起购买石城县某安置地剩余地块，本次借款为续借，本平台为此次借款提供服务。', '某知名企业高级经理人李某为此笔借款提供无限连带担保责任', '50000.00', '44.00', '3', 'YRB1223', '23');
INSERT INTO `t_borrowdetail` VALUES ('19', '201801021957041.jpg', '201801021957042.jpg', '2018010219303101.jpg', '2018010219303102.jpg', '用于周转资金不足', '深圳腾讯科技有限公司', '某保理公司成立于2016年5月，办公地址前海深港合作区，主要从事保付代理业务，经济信息咨询，注册资本10000万元。将恒大集团所开具商业承兑汇票质押于我公司，恒大集团信用状况良好，资产实力充裕。', '本次借款主要用于资金周转，该企业借款金额为20万元，借款期限1个月。本平台为此借款提供服务。', '以**开出的10万元商业承兑汇票做质押', '0.00', '28.00', '2', 'YRB1324', '24');
INSERT INTO `t_borrowdetail` VALUES ('20', '201801021957041.jpg', '201801021957042.jpg', '2018010219303101.jpg', '2018010219303102.jpg', '商业活动', '一套房子', '借款人李某，男，江西赣州人，2013年合伙经营一家大型网吧，每月可分红3万元，经济实力强。', '本次借款总额为20万元，借款期限1个月，客户借款用于与朋友徐某、范某 一起购买石城县某安置地剩余地块，本次借款为续借，本平台为此次借款提供服务。', '某知名企业高级经理人李某为此笔借款提供无限连带担保责任', '0.00', '25.00', '1', 'YRB1225', '25');
INSERT INTO `t_borrowdetail` VALUES ('21', '201801161015131.jpg', '201801161015132.jpg', '201801161015133.jpg', '201801161015134.jpg', '其他目的', '****科技有限公司', '借款人温**，男，赣州市石城人， 2014年经营一家广告公司，每月盈利5万元左右，经济实力强，该次借款用于还清银行按揭贷款，尾款目前余额50万元左右， 该借款人已跟买家签好房屋买卖合同，房产售出即可回款。', '本次借款用于还清银行按揭贷款，尾款目前余额50万元左右， 该借款人已跟买家签好房屋买卖合同，房产售出即可回款，该次借款金额为20万元，借款期限3个月，本平台为此借款提供服务。', '监控交易回款账户', '0.00', '10.00', '2', 'YRB5226', '26');
INSERT INTO `t_borrowdetail` VALUES ('22', '201801191047021.jpg', '201801191047022.jpg', '201801191047023.jpg', '201801191047024.jpg', '用于周转公司资金不足', '阿里巴巴集团', '江西某医药有限公司创建于2006年12月份。注册资本2100万元，实收资本2100万元，股东分别是黄**，占股95.24%；赣州某管理有限公司（国企），占股4.76%。主要经营范围为生物制品、中成药、化学原料药、化学药制剂、抗生素原料药、抗生素制剂、生化药品（凭药品经营许可证经营）；II类（凭第二类医疗器械经营备案书经营）、III类医疗器械批发（凭医疗器械经营许可证经营）。公司快速发展，截止至2017年6月，江西某医药有限公司资产总计13023.72万元，2017年1-6月累计营业收入5649.93万元，净利润395.22万元。净利润率为7.00%。\r\n目前主营药品批发，员工120多人，占地31亩，建筑面积15000平方米。公司从购地、土地平整、土建后于2009年11月29日取得了《药品经营许可证》、于2010年2月22日取得了《药品经营质量管理规范认证证书》，于2010年3月26日取得了《医疗器械经营企业许可证》，机2010年3月公司顺利进入经营阶段。\r\n公司运营至今，与全国2100多家上游供应商（药厂）家建立了业务联系。同时经营品种逐步多样化，目前经营的医药品种约8000余种，形成了200多家医疗机构（含赣州18个县市区的卫生院）、1000多家药店的批发销售网络体系。', '本次借款主要用于二甲医院事业部配套资金，目前企业与赣州某管理有限公司（国企）签署战略合作协议，成立二甲医院事业部，为二甲医院提供药品及医疗器械，需筹集配套资金，该企业借款金额为100万元，第一期50万元，借款期限3个月，本次借款为续借，本平台为此借款提供服务。', '1、保证借款资金的安全，做到专款专用，借款资金必需进入二甲事业部专用账户\r\n2、黄**、黄**夫妇提供连带责任担保\r\n3、股东赣州某管理有限公司（国企）同意出具股东会决议', '0.00', '11.20', '1', 'YRB1128', '28');
INSERT INTO `t_borrowdetail` VALUES ('23', '201801211934571.jpg', '201801211934572.jpg', '201801211934573.jpg', '201801211934574.jpg', '周转资金', '经营性收入', '某保理公司成立于2016年5月，办公地址前海深港合作区，主要从事保付代理业务，经济信息咨询，注册资本10000万元。将恒大集团所开具商业承兑汇票质押于我公司，恒大集团信用状况良好，资产实力充裕。', '本次借款主要用于资金周转，该企业借款金额为20万元，借款期限1个月。本平台为此借款提供服务。', '以**开出的40万元商业承兑汇票做质押', '0.00', '12.00', '1', 'YRB1129', '29');

-- ----------------------------
-- Table structure for t_bz
-- ----------------------------
DROP TABLE IF EXISTS `t_bz`;
CREATE TABLE `t_bz` (
  `bzid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `bzname` varchar(20) DEFAULT NULL COMMENT '标种名称',
  `state` tinyint(4) DEFAULT NULL COMMENT '标种状态(0为可用，1为不可用)',
  PRIMARY KEY (`bzid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bz
-- ----------------------------
INSERT INTO `t_bz` VALUES ('1', '多金宝', '0');
INSERT INTO `t_bz` VALUES ('2', '普金宝', '0');
INSERT INTO `t_bz` VALUES ('3', '恒金宝', '0');
INSERT INTO `t_bz` VALUES ('4', '余额宝', '0');
INSERT INTO `t_bz` VALUES ('5', '新手标', '0');

-- ----------------------------
-- Table structure for t_dxmodel
-- ----------------------------
DROP TABLE IF EXISTS `t_dxmodel`;
CREATE TABLE `t_dxmodel` (
  `dxid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`dxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dxmodel
-- ----------------------------

-- ----------------------------
-- Table structure for t_dynamic
-- ----------------------------
DROP TABLE IF EXISTS `t_dynamic`;
CREATE TABLE `t_dynamic` (
  `dyid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `date` date DEFAULT NULL COMMENT '时间',
  `content` varchar(5000) DEFAULT NULL COMMENT '内容',
  `pic` varchar(500) DEFAULT NULL COMMENT '封面图片',
  `state` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`dyid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dynamic
-- ----------------------------
INSERT INTO `t_dynamic` VALUES ('2', '01月18新中冠获“福州市创新发展优秀企业”奖', '2018-01-19', '<p><img src=\"/upload/image/20180122/1516623314201071975.jpg\" title=\"1516623314201071975.jpg\" alt=\"a52158e0-b170-409c-b781-abc0e750aaab.jpg\"/></p><p>2018年1月17日下午，福州市企联举行2017年年会暨创新发展优秀企业表彰大会。我司荣获“</p><p>福州市创新发展优秀企业”奖，此次获奖的优秀企业共29家</p>', 'upload/5cfef74e-b486-461c-aa0c-a0887fd93461.jpg', '0');
INSERT INTO `t_dynamic` VALUES ('3', '亿人宝三季度成交额突破15.1亿元', '2018-01-23', '<p>　2015年第三季度末，网贷行业累计成交近万亿，延续了快速增长的势头。而数据显示，3000多家平台中，成交量排名前100家的平台贡献了超过60%的成交额，行业二八格局已现。　　&nbsp;　　&nbsp;　　&nbsp;</p><p>　　根据网贷龙头平台拍拍贷最新公布的业绩报告显示，三季度平台成交额突破15.1亿元，单季度成交额甚至超出上半年总成交量2.1亿，环比大涨81%，大幅度跑赢行业环比增速。　　&nbsp;　　&nbsp;&nbsp;</p><p>　　拍拍贷CEO张俊指出，未来随着监管细则的落地，行业门槛、业务模式的规范，强者恒强，弱者愈弱的局面仍将加剧。　　</p><p>&nbsp;　　&nbsp;　　&nbsp;</p><p>　　亿人宝<strong>三季度月均成交额超5亿元　</strong>　&nbsp;　　&nbsp;　　&nbsp;</p><p>　　除了成交量的快速增长，拍拍贷业绩的攀升还体现在每达成一亿元交易的用时明显缩短，2015年9月较去年同期单日成交量增加了4倍。此外，拍拍贷三季度月均成交额超5亿元，其中9月份成交5.8亿元，再次刷新单月成交记录。　　&nbsp;　　&nbsp;　　&nbsp;</p><p>　　值得强调的是，平台业绩的增长是有质量的。三季度末平台贷款余额环比增长69%，占平台累计成交额的比重远超行业平均水平，反映出拍拍贷较强的资产开发能力和稳健的业务运营能力。　　&nbsp;　　&nbsp;　　&nbsp;</p><p>　　究其原因，拍拍贷高成长性是建立在扎实基本功上的厚积薄发。三季度拍拍贷共受理借款申请155.3万笔，相当于每5秒就产生一笔借款申请，共审批通过借款30.9万笔，环比增长93.2%，服务借款用户24.7万人，这样的业务量是其他同行无法匹敌的。　　&nbsp;　　&nbsp;&nbsp;</p><p>　　打铁还需自身硬。目前，拍拍贷成熟的纯线上风控模式已能够支撑个人信贷业务的快速扩张。魔镜风控系统能够从400多个数据维度对借款人作出精准的风险评级和风险定价，大幅度提升审核效率，同时也保证了优质资产的供应。　　&nbsp;</p><p><br/></p>', 'upload/635ff28c-c4b4-423c-b38b-0111a9ca93fe.png', '0');
INSERT INTO `t_dynamic` VALUES ('4', '亿人宝被评为年度P2P榜样企业', '2018-01-23', '<p>3月19日，由《财视中国》与第一财经联合主办的“2015互联网金融趋势论坛暨2014年度互联网金融榜样企业颁奖典礼”在上海举行，拍拍贷获得2014年度互联网金融榜样企业“P2P榜样企业奖”。</p><p><br/></p><p>2007年6月，中国第一家P2P公司拍拍贷成立。自成立至今，拍拍贷在这几年里得到了飞速发展，也赢得了广大拍友的信任。截止目前，已经有逾600万用户选择拍拍贷进行投资和借款。<br/></p><p><br/></p><p>未来在投资人发展战略方面，拍拍贷将在产品设计、产品风险管理、资产证券化三个方面着力。拍拍贷一直保持着与广大投资者的互动，在产品和服务方面一直努力将自身打造为投资者触手可及的金融。对于借款人，我们也将致力于提供更加低成本、高效率的贷款服务。</p><p><br/></p><p>2015年3月24日，我们将在北京举办拍拍贷“魔镜”风控系统发布会，更多资讯，敬请关注拍拍贷官方微信平台。</p><p><br/></p>', 'upload/eb21ef94-8af1-4ddf-8e7c-280994c477e6.png', '0');
INSERT INTO `t_dynamic` VALUES ('6', '关于年综合成本和息费后置收取的通知', '2018-01-21', '<p>尊敬的亿人宝用户：</p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\"><br/></span></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\">&nbsp; &nbsp; &nbsp; <span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\">亿人宝</span><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\"></span>平台自2007年上线以来，致力为广大用户提供优质的网络借贷信息中介服务。12月1日，互联网金融风险专项整治、P2P网贷风险专项整治工作领导小组办公室下发了《关于规范整顿“现金贷”业务的通知》，拍拍贷第一时间协调公司各部门，积极响应监管要求，已将产品做如下调整： (i) 拍拍贷平台撮合的借款，借款人的综合息费成本年化不超过36%；以及 (ii) 拍拍贷网站平台、M站及拍拍贷旗下子公司运营的APP不再从借款本金中先行扣除利息、平台手续费、质保金等相关息费。</span></p><p><br/></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\">&nbsp; &nbsp; &nbsp; &nbsp;亿人宝相信国家监管部门出台相关“现金贷”的监管政策必将促进行业健康有序发展。拍拍贷作为网络借贷信息平台的领头军之一，一贯勇于承担社会责任、秉承合规经营的理念，并将继续积极配合监管、拥抱监管、积极响应监管号召！</span></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\"><br/></span></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\">&nbsp; &nbsp; &nbsp; &nbsp;感谢您的理解与支持，拍拍贷将一如既往地为您提供安全优质的服务。</span></p><p><br/></p><p style=\"text-align: right;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\">上海亿人宝金融信息服务有限公司</span></p><p style=\"text-align: right;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\">2017年1月17日</span></p>', 'upload/28a9c0fd-64b3-47b2-98f3-9fc4e7ccee9c.jpeg.jpg', '0');
INSERT INTO `t_dynamic` VALUES ('11', '亿人宝上半年线上借贷交易超70亿元', '2018-01-18', '<p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">　与P2P网贷行业遇冷、平台相继退出相比，消费金融热潮丝毫未减。主营个人消费信贷平台拍拍贷日前发布的2016半年报显示，其平台累计用户总量已达2145万，上半年共促成交易70.5亿元，今年5月2日（123天）的成交量便超过了去年全年。</span></p><p><br/></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">　　消费需求日益增长，但传统的银行贷款和信用卡体系，已难以满足人们日益增长的消费信贷需求。拍拍贷CEO张俊表示，中国有5亿互联网非信用卡人群，仍未被传统金融所覆盖，难以享受到消费信贷服务。</span></p><p><br/></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">　　正是大量未被满足的消费信贷需求，为提供消费金融服务的网贷平台带来了契机。2013年全面转型个人消费借款的拍拍贷，其业绩近两年开始倍数级增长。</span></p><p><br/></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">　　根据拍拍贷2016半年报，其平台二季度共新增用户549.66万人，同比增长3倍。在成交量上，拍拍贷二季度共促成交易40.94亿元，同比增长383.05%。</span></p><p><br/></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">　　值得注意的是，6月在拍拍贷平台上成功借款的有44.49万人，而根据网贷之家数据，2016年6月网贷行业借款人数共112.41万人，拍拍贷一家就占到了行业总数的四成。</span></p><p><br/></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">　　“资产类型决定了风控方式。我们通过自主研发‘魔镜’风控系统，基于大数据技术在线对用户进行信用识别，这使我们有能力服务大量的用户，将那些原来在获取金融服务门槛之外的人群纳入到金融服务中来，同时有效地控制风险。”拍拍贷CEO张俊表示。</span></p><p><br/></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">　　据悉，小额分散也是拍拍贷的风控手段之一，其二季度每笔平均借款2775.69元。</span></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><br/></span></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span></p><p><br/></p>', 'upload/a42472ecc0be4f8787060cb08bbcc81f.jpg', '0');
INSERT INTO `t_dynamic` VALUES ('12', '亿人宝张俊：P2P倒闭潮将进一步到来', '2018-01-18', '<p><span style=\"font-size: 18px; word-wrap: break-word; font-weight: 700; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">有社会价值才能有商业价值</span></p><p><strong><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">新浪财经主持人翁晓莹：</span></strong><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">07年创立拍拍贷款之前，其实已经有过几次创业经历了，是什么时候开始创业的？</span></p><p><br/></p><p><strong><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">张俊：</span></strong><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">其实我在做拍拍贷之前就是一个兼职创业的状态，我有一个好基友，就是我的合伙人，我们是大学的同班同学，所以在大学时代我们就在经常聊关于创业的事情，其实我们的尝试在大学时代就开始了。</span></p><p><br/></p><p><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">大学时代我们曾经策划过，甚至做过旅游网站，几乎是跟携程同一时期，但是后来我们又转型，临近毕业的时候做过一个叫信息无处不在的项目，其实就是做一个电子阅读设备，后来也没有做下去，然后后来毕业之后我们同事进入了微软，微软做了同事，关系一直比较紧密，然后大家都有创业这个想法。</span></p><p><br/></p><p><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">在微软的时候基本上技术为主，后来逐步逐步往管理方向走，所以那个时候他就先出去开始创业了，这个时候我兼职的只有做了一些事情，直到我们后来做拍拍贷，决定这件事情必须要全职来做，后来全职来做拍拍贷。</span></p><p><br/></p>', 'upload/bed329a1-378c-4444-81c2-edf714135d4a.jpg', '0');
INSERT INTO `t_dynamic` VALUES ('13', '亿人宝：最佳产品创新互联网金融平台', '2018-01-22', '<p><span style=\"font-family: 微软雅黑; word-wrap: break-word; line-height: 21px; background-color: rgb(255, 255, 255);\">2015年1月17日，由中国证券市场研究设计中心（SEEC）与和讯网联合主办的第十二届中国财经风云榜暨“书写改革信心”财经中国年会在北京举行。</span><br/><br/><span style=\"font-family: 微软雅黑; word-wrap: break-word; line-height: 21px; background-color: rgb(255, 255, 255);\">年会围绕“书写改革信心”的会议主题，将从宏观经济领域，中观行业层面，邀请诸多政界人士、顶尖学者、商界翘楚、金融业精英、媒体领袖共话经济政策信号，详解未来机遇，寻觅中国经济良性增长的动力源泉。</span><br/><br/><span style=\"font-family: 微软雅黑; word-wrap: break-word; line-height: 21px; background-color: rgb(255, 255, 255);\">作为金融产业最具权威及影响力的评选之一，“第十二届中国财经风云榜”依旧以严谨的态度盘点网贷、保险、外汇、银行、证券以及上市公司等金融及相关行业的年度榜单。在本次榜单中上海拍拍贷金融信息服务有限公司获得互联网金融业“2014年度最佳产品创新互联网金融平台”奖项。</span></p><p><br/></p><p>是国内首家P2P纯信用无担保网络借贷平台，同时也是第一家由工商部门批准，获得“金融信息服务”资质的互联网金融平台。截至2014年上半年，注册用户近360万，是国内用户规模最大的P2P平台。拍拍贷用先进的理念和创新的技术建立了一个安全、高效、诚信、透明的互联网金融平台，规范了个人借贷行为，让借入者改善生产生活，让借出者增加投资渠道。拍拍贷相信，随着互联网的发展和中国个人信用体系的健全，先进的理念和创新的技术将给民间借贷带来历史性的变革，拍拍贷将是这场变革的领导者。</p>', 'upload/a52158e0-b170-409c-b781-abc0e750aaab.jpg', '0');
INSERT INTO `t_dynamic` VALUES ('22', '金融跟互联网应该是有个很好的结合', '2018-01-12', '<p><strong><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">新浪财经主持人翁晓莹：</span></strong><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">我看您先后几次创业的方向感觉差别很大，当时怎么想到做拍拍贷这样一个项目？</span></p><p><br/></p><p><strong><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">张俊：</span></strong><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">其实我们的几次创业还是跟我们判断大方向、大趋势有关，我们的创业基本上不是说从我自己来看，我有什么，现在我有什么样的能力，我能做什么样的事情出发，更多的是看在未来一个时间点可能会发生什么样的事情，这个大方向会是什么样，人们的行为习惯会是什么样的变化，再来判断说能够产生什么样的商业机会我们去做。</span></p><p><br/></p><p><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">我们看到互联网的大趋势，就想什么样的行业能够和互联网发生结合，甚至说互联网的发展未来能够产生什么新的行业，我们分析来、分析去，发现金融跟互联网应该是有个很好的结合，再加上我们觉得未来国家也会开放，不同的行业也会相应的放开，所以我们基于这么些判断，包括人们的行为，所以我们觉得在网上做金融服务业能做成。</span></p><p><br/></p><p><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">所以基于这个判断，我们想来做一个事情，做了以后才发现，我们的能力跟金融所要求的那个东西还是有很大的差距，所以就不断的学习、不断的做尝试。</span></p><p><br/></p>', 'upload/untitled.png', '0');
INSERT INTO `t_dynamic` VALUES ('26', '美丽的鄱阳湖', '2018-01-21', '<p>尊敬的各位亿人友：&nbsp; &nbsp;</p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\">&nbsp; &nbsp; &nbsp; &nbsp;基于投资用户对拍拍贷的信任和支持，亿人宝已于2017年12月20日，对超出预期收益的彩虹计划进行了超出预期收益部分的分配，具体金额以实际到账为准。超出预期收益的部分以返现形式到达您的亿人宝账户。</span></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\">&nbsp; &nbsp; &nbsp; &nbsp;涉及超出预期收益分配的彩虹计划发行日期及购买期数如下：</span></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\">&nbsp; &nbsp; &nbsp; &nbsp;2016-12-17，购买12个月彩虹计划投资者。</span></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\">&nbsp; &nbsp; &nbsp; &nbsp;感谢您对彩虹计划的大力支持，今后我们会持续努力，请多多关注，祝拍友们收益高升！</span></p><p style=\"text-align: right;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\">亿人宝团队</span></p><p style=\"text-align: right;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;\">2017年12月21日</span></p><p><br/></p><p style=\"text-align: right;\"><br/></p><p><br/></p>', 'upload/09b515c0-90bc-4abc-963d-4c376e1cf281.jpg', '0');
INSERT INTO `t_dynamic` VALUES ('27', ' 亿人宝当选上海金融信息行业协会副会长单位', '2018-01-22', '<p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">“小额消费信贷的合规优势，会随着网贷行业的逐步规范化越来越明显。”拍拍贷CEO张俊表示，三季度拍拍贷平台上20万元以上借款占比仅为0.02%，1万元以下的消费性借款占比则高达98.34%，单笔平均借款额度为2716.54元，完全符合监管规定。</span></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><br/></span></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">随着监管趋严、投资收益下滑等多种因素影响，线上理财服务也面临新一轮的调整。良性退出已成为监管出台后的常态。</span></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><br/></span></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">投资者以合规为标准的投票正在进行中，规模较小的平台被分流成为趋势，大平台虹吸效应更加凸显。资料显示，拍拍贷平台上的投资行为在监管出台之后表现得更为活跃。8月24日到9月30日，拍拍贷用户投资额共计39.88亿元，相比前37天增长30.80%。此外，拍拍贷三季度新注册投资用户共40.67万人，环比二季度增长了131.75%。</span></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><br/></span></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">张俊认为，前两年行业的火热吸引了一大批资本和制度套利者进入，激烈的竞争推高了整个行业的获客成本和运营成本，很多中小平台在资金端并没有线上流量的优势。而目前，网贷行业的发展已进入优质平台与巨头竞争的下半场，未来将是一个存量淘汰的时期。</span></p><p><br/></p>', 'upload/09b002bb-660e-476d-86aa-98fe91127501.jpg', '0');
INSERT INTO `t_dynamic` VALUES ('28', '亿人宝與新鴻基 達成戰略合作', '2018-01-21', '<p>香港文匯報訊（記者 張聰 北京報道）</p><p><br/></p><p>在美國上市的拍拍貸宣佈，與香港新鴻基有限公司達成戰略合作，雙方將在未來共同探索在資產和資金端、新產品以及互聯網科技等領域的業務合作機會。拍拍貸CEO張俊表示，新鴻基的豐富經驗對拍拍貸未來的業務發展將是一項非常寶貴的資產，期待此項合作在未來能夠共同促進雙方發展。<br/></p><p><br/></p><p>據了解，11月10日，拍拍貸成功在紐約證券交易所上市。新鴻基在拍拍貸IPO期間通過私募入股成為拍拍貸的戰略投資者。新鴻基有限公司執行主席李成煌表示，隨着投資進程的推進，集團對拍拍貸管理團隊的能力和經歷有了非常深刻的印象，對未來雙方在優勢領域發揮協同效應充滿信心。</p><p><br/></p><p><strong>拍拍貸用戶達5758萬</strong></p><p>同日，拍拍貸發佈了2017年第三季度未經審計的財務業績報告。根據報告，截至2017年9月30日，拍拍貸累計註冊用戶達到5,758萬，第三季度撮合借款交易總額210億元(人民幣，下同)，營收達到12.503億元，業績整體表現較為穩健。</p><p><br/></p><p>報告顯示，拍拍貸在2017年第三季度撮合借款交易總額210億元，較去年同期增長256.5%；第三季度服務借款人450萬，較去年同期增長207.5%，平均借款金額為2,542元，平均借款期限為7.3個月。截至2017年9月30日，拍拍貸累計借款人達到900萬人，累計投資者約為52.2萬人。</p><p><br/></p>', 'upload/40646decd54b4c7aa650858578089fb8.jpg', '0');

-- ----------------------------
-- Table structure for t_friend
-- ----------------------------
DROP TABLE IF EXISTS `t_friend`;
CREATE TABLE `t_friend` (
  `fid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `furl` varchar(50) DEFAULT NULL COMMENT '链接',
  `fpic` varchar(500) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_friend
-- ----------------------------
INSERT INTO `t_friend` VALUES ('28', 'http://www.abchina.com/cn/', 'static/uploads/22611376078804.jpg');
INSERT INTO `t_friend` VALUES ('29', 'http://www.sbcvc.com/', 'static/uploads/4115534200054.jpg');
INSERT INTO `t_friend` VALUES ('30', 'https://www.baidu.com/', 'static/uploads/22799975769570.jpg');
INSERT INTO `t_friend` VALUES ('31', 'http://www.wdzj.com/', 'static/uploads/4126650658644.jpg');
INSERT INTO `t_friend` VALUES ('32', 'http://www.anquanbao.com/', 'static/uploads/4140786157211.jpg');

-- ----------------------------
-- Table structure for t_hkb
-- ----------------------------
DROP TABLE IF EXISTS `t_hkb`;
CREATE TABLE `t_hkb` (
  `hkid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT 'uid为前台用户表t_user主键字段',
  `rname` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `cpname` varchar(20) DEFAULT NULL COMMENT '产品名称',
  `rnum` int(11) DEFAULT NULL COMMENT '已还期数',
  `tnum` int(11) DEFAULT NULL COMMENT '总期数',
  `ytime` datetime DEFAULT NULL COMMENT '应还时间',
  `rtime` datetime DEFAULT NULL COMMENT '实际还款时间',
  `bzname` varchar(20) DEFAULT NULL COMMENT '标种名称，bzname为t_bz表里面标种名称',
  `ybx` decimal(10,2) DEFAULT NULL COMMENT '应还本息',
  `rbx` decimal(10,2) DEFAULT NULL COMMENT '已还本息',
  `ylx` decimal(10,2) DEFAULT NULL COMMENT '应还利息',
  `rlx` decimal(10,2) DEFAULT NULL COMMENT '已还利息',
  `ybj` decimal(10,2) DEFAULT NULL COMMENT '应还本金',
  `rbj` decimal(10,2) DEFAULT NULL COMMENT '已还本金',
  `yfx` decimal(10,2) DEFAULT NULL COMMENT '应还罚息',
  `rfx` decimal(10,2) DEFAULT NULL COMMENT '已还罚息',
  `yucount` int(11) DEFAULT NULL COMMENT '逾期次数',
  `state` tinyint(4) DEFAULT NULL COMMENT '还款状态（0未还款，1已还款）',
  `baid` bigint(20) DEFAULT NULL COMMENT '借款人id ，t_borrowapply主键id',
  `yustartime` datetime DEFAULT NULL COMMENT '逾期执行时间',
  `huid` bigint(20) DEFAULT NULL COMMENT '贷后负责人 t_huser后台用户id字段',
  `djq` int(20) DEFAULT NULL COMMENT '第几期',
  `int1` bigint(20) DEFAULT NULL COMMENT '预留字段',
  `str1` varchar(20) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`hkid`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_hkb
-- ----------------------------
INSERT INTO `t_hkb` VALUES ('52', '28', '李云龙', 'YRB1223', '1', '3', '2018-02-22 20:11:08', '2018-01-22 21:09:32', '新手标', '1833.33', '1833.33', '1833.33', '1833.33', '0.00', null, null, null, null, '1', '23', null, '2', '1', null, null);
INSERT INTO `t_hkb` VALUES ('53', '28', '李云龙', 'YRB1223', null, '3', '2018-03-22 20:11:08', null, '新手标', '1833.33', null, '1833.33', null, '0.00', null, null, null, null, '0', '23', null, '2', '2', null, null);
INSERT INTO `t_hkb` VALUES ('54', '28', '李云龙', 'YRB1223', null, '3', '2018-04-22 20:11:08', null, '新手标', '51833.33', null, '1833.33', null, '50000.00', null, null, null, null, '0', '23', null, '2', '3', null, null);

-- ----------------------------
-- Table structure for t_home
-- ----------------------------
DROP TABLE IF EXISTS `t_home`;
CREATE TABLE `t_home` (
  `hid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pic1` varchar(500) DEFAULT NULL COMMENT '轮播图1',
  `pic2` varchar(500) DEFAULT NULL COMMENT '轮播图2',
  `pic3` varchar(500) DEFAULT NULL COMMENT '轮播图3',
  `ewm` varchar(500) DEFAULT NULL COMMENT '二维码',
  `phone` char(11) DEFAULT NULL COMMENT '手机号码',
  `l1` varchar(50) DEFAULT NULL COMMENT '链接1',
  `l2` varchar(50) DEFAULT NULL COMMENT '链接2',
  `l3` varchar(50) DEFAULT NULL COMMENT '链接3',
  `l4` varchar(50) DEFAULT NULL COMMENT '链接4',
  `state` tinyint(4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_home
-- ----------------------------
INSERT INTO `t_home` VALUES ('14', 'upload/banner.jpg', 'upload/banner1.jpg', 'upload/banner2.jpg', 'upload/code.png', '15770783886', 'http://www.ppdai.com/help/honor', 'http://www.w3school.com.cn/', 'http://mvnrepository.com/', 'http://how2j.cn/', '0', '2018-01-23');
INSERT INTO `t_home` VALUES ('15', 'upload/banner4.jpg', 'upload/banner3.jpg', 'upload/CgF38VnxgTiAdemoAAGjjWk-VYQ742.jpg', 'upload/code.png', '15978708907', 'https://www.baidu.com', 'http://www.runoob.com/', 'https://www.baidu.com/?tn=80035161_1_dg', 'https://www.baidu.com/?tn=80035161_1_dg', '0', '2018-01-23');
INSERT INTO `t_home` VALUES ('16', 'upload/tunhuo2018.jpg', 'upload/banner1.jpg', 'upload/banner3.jpg', 'upload/code.png', '15978708907', 'https://www.baidu.com', 'http://www.w3school.com.cn/', 'http://mvnrepository.com/', 'http://how2j.cn/', '0', '2018-01-23');
INSERT INTO `t_home` VALUES ('17', 'upload/tunhuo2018.jpg', 'upload/banner.jpg', 'upload/banner3.jpg', 'upload/code.png', '15770783886', 'https://connect.qq.com/index.html', 'http://www.w3school.com.cn/', 'https://www.baidu.com/?tn=80035161_1_dg', 'http://www.runoob.com/', '0', '2018-01-23');
INSERT INTO `t_home` VALUES ('18', 'upload/banner2.jpg', 'upload/banner3.jpg', 'upload/banner4.jpg', 'upload/code.png', '13479798187', 'https://www.baidu.com', 'http://www.w3school.com.cn/', 'https://www.baidu.com/?tn=80035161_1_dg', 'http://how2j.cn/', '0', '2018-01-21');

-- ----------------------------
-- Table structure for t_huser
-- ----------------------------
DROP TABLE IF EXISTS `t_huser`;
CREATE TABLE `t_huser` (
  `huid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `rname` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别（0男，1女）',
  `phone` char(11) DEFAULT NULL COMMENT '手机号码',
  `huname` varchar(50) DEFAULT NULL COMMENT '用户名，相当于昵称',
  `oid` int(11) DEFAULT NULL COMMENT '所属组id',
  `oname` varchar(20) DEFAULT NULL COMMENT '组名',
  `email` varchar(30) DEFAULT NULL COMMENT '电子邮箱',
  `state` bigint(20) DEFAULT NULL COMMENT '预留字段',
  `hpwd` varchar(50) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`huid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_huser
-- ----------------------------
INSERT INTO `t_huser` VALUES ('1', '胡八一', '0', '18720865791', '曾志湖', '1', '超级管理员', '1729340612@qq.com', '1', '4QrcOUm6Wau+VuBX8g+IPg==');
INSERT INTO `t_huser` VALUES ('2', '小建', '1', '18162194556', '赖勇建', '2', '普通管理员', '5323267423@qq.com', '1', '83nq88gxsE3hU0adG+w0Xg==');
INSERT INTO `t_huser` VALUES ('3', '阮萌', '1', '18188009900', '萌萌', '3', '普通员工', '18188009900@qq.com', '1', '83nq88gxsE3hU0adG+w0Xg==');

-- ----------------------------
-- Table structure for t_huser_role
-- ----------------------------
DROP TABLE IF EXISTS `t_huser_role`;
CREATE TABLE `t_huser_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huser_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_huser_role
-- ----------------------------
INSERT INTO `t_huser_role` VALUES ('19', '3', '3');
INSERT INTO `t_huser_role` VALUES ('20', '4', '3');
INSERT INTO `t_huser_role` VALUES ('24', '2', '2');
INSERT INTO `t_huser_role` VALUES ('25', '1', '1');

-- ----------------------------
-- Table structure for t_jklx
-- ----------------------------
DROP TABLE IF EXISTS `t_jklx`;
CREATE TABLE `t_jklx` (
  `lxid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `lxname` varchar(20) DEFAULT NULL COMMENT '借款名称，如（先本后息，先息后本，等额本息，等额本金）',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态（0可用，1不可用）',
  PRIMARY KEY (`lxid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jklx
-- ----------------------------
INSERT INTO `t_jklx` VALUES ('1', '信用贷款', '0');
INSERT INTO `t_jklx` VALUES ('2', '担保贷款', '0');
INSERT INTO `t_jklx` VALUES ('3', '票据贴现', '0');
INSERT INTO `t_jklx` VALUES ('4', '抵押贷款', '0');

-- ----------------------------
-- Table structure for t_letter
-- ----------------------------
DROP TABLE IF EXISTS `t_letter`;
CREATE TABLE `t_letter` (
  `lid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `date` datetime DEFAULT NULL COMMENT '日期',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态，0激活，1冻结',
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_letter
-- ----------------------------
INSERT INTO `t_letter` VALUES ('5', '1', '2', '2018-01-16 14:01:05', '0');
INSERT INTO `t_letter` VALUES ('7', '自适应', '自适应', '2018-01-17 14:01:28', '0');
INSERT INTO `t_letter` VALUES ('9', '3333', '33333333333', '2018-01-17 15:01:35', '0');
INSERT INTO `t_letter` VALUES ('10', '3423', '111111', '2018-01-17 15:01:24', '0');
INSERT INTO `t_letter` VALUES ('15', '11', '11', '2018-01-16 15:01:36', '0');
INSERT INTO `t_letter` VALUES ('16', '张三李四', '活动结束', '2018-01-16 16:48:10', '1');
INSERT INTO `t_letter` VALUES ('17', '1', '1', '2018-01-16 18:49:12', '1');
INSERT INTO `t_letter` VALUES ('18', '想', '1', '2018-01-16 19:51:32', '0');
INSERT INTO `t_letter` VALUES ('25', '陈', '11', '2018-01-17 09:09:24', '0');
INSERT INTO `t_letter` VALUES ('28', '333222', '1111111111111111111', '2018-01-17 19:30:29', '0');
INSERT INTO `t_letter` VALUES ('29', '谢', '11111', '2018-01-17 19:31:04', '0');
INSERT INTO `t_letter` VALUES ('30', '一样一样', '11111', '2018-01-17 19:31:14', '0');

-- ----------------------------
-- Table structure for t_letter_user
-- ----------------------------
DROP TABLE IF EXISTS `t_letter_user`;
CREATE TABLE `t_letter_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lid` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_letter_user
-- ----------------------------
INSERT INTO `t_letter_user` VALUES ('1', '27', '1', '0');
INSERT INTO `t_letter_user` VALUES ('2', '27', '28', '0');
INSERT INTO `t_letter_user` VALUES ('3', '27', '31', '0');
INSERT INTO `t_letter_user` VALUES ('4', '27', '33', '0');
INSERT INTO `t_letter_user` VALUES ('5', '27', '34', '0');
INSERT INTO `t_letter_user` VALUES ('6', '27', '35', '0');
INSERT INTO `t_letter_user` VALUES ('7', '27', '36', '0');
INSERT INTO `t_letter_user` VALUES ('9', '27', '38', '0');
INSERT INTO `t_letter_user` VALUES ('10', '27', '43', '0');
INSERT INTO `t_letter_user` VALUES ('11', '27', '46', '0');
INSERT INTO `t_letter_user` VALUES ('12', '27', '47', '0');
INSERT INTO `t_letter_user` VALUES ('13', '27', '48', '0');
INSERT INTO `t_letter_user` VALUES ('14', '27', '49', '0');
INSERT INTO `t_letter_user` VALUES ('15', '27', '50', '0');
INSERT INTO `t_letter_user` VALUES ('16', '27', '51', '0');
INSERT INTO `t_letter_user` VALUES ('17', '27', '52', '0');
INSERT INTO `t_letter_user` VALUES ('18', '27', '54', '0');
INSERT INTO `t_letter_user` VALUES ('19', '27', '65', '0');
INSERT INTO `t_letter_user` VALUES ('20', '27', '66', '0');
INSERT INTO `t_letter_user` VALUES ('21', '27', '67', '0');
INSERT INTO `t_letter_user` VALUES ('22', '27', '68', '0');
INSERT INTO `t_letter_user` VALUES ('23', '27', '69', '0');
INSERT INTO `t_letter_user` VALUES ('24', '27', '70', '0');
INSERT INTO `t_letter_user` VALUES ('25', '27', '71', '0');
INSERT INTO `t_letter_user` VALUES ('26', '27', '72', '0');
INSERT INTO `t_letter_user` VALUES ('27', '27', '73', '0');
INSERT INTO `t_letter_user` VALUES ('28', '27', '74', '0');
INSERT INTO `t_letter_user` VALUES ('29', '27', '75', '0');
INSERT INTO `t_letter_user` VALUES ('30', '27', '76', '0');
INSERT INTO `t_letter_user` VALUES ('31', '27', '77', '0');
INSERT INTO `t_letter_user` VALUES ('32', '28', '1', '0');
INSERT INTO `t_letter_user` VALUES ('33', '28', '28', '0');
INSERT INTO `t_letter_user` VALUES ('34', '28', '31', '0');
INSERT INTO `t_letter_user` VALUES ('35', '28', '33', '0');
INSERT INTO `t_letter_user` VALUES ('36', '28', '34', '0');
INSERT INTO `t_letter_user` VALUES ('37', '28', '35', '0');
INSERT INTO `t_letter_user` VALUES ('38', '28', '36', '0');
INSERT INTO `t_letter_user` VALUES ('40', '28', '38', '0');
INSERT INTO `t_letter_user` VALUES ('41', '28', '43', '0');
INSERT INTO `t_letter_user` VALUES ('42', '28', '46', '0');
INSERT INTO `t_letter_user` VALUES ('43', '28', '47', '0');
INSERT INTO `t_letter_user` VALUES ('44', '28', '48', '0');
INSERT INTO `t_letter_user` VALUES ('45', '28', '49', '0');
INSERT INTO `t_letter_user` VALUES ('46', '28', '50', '0');
INSERT INTO `t_letter_user` VALUES ('47', '28', '51', '0');
INSERT INTO `t_letter_user` VALUES ('48', '28', '52', '0');
INSERT INTO `t_letter_user` VALUES ('49', '28', '54', '0');
INSERT INTO `t_letter_user` VALUES ('50', '28', '65', '0');
INSERT INTO `t_letter_user` VALUES ('51', '28', '66', '0');
INSERT INTO `t_letter_user` VALUES ('52', '28', '67', '0');
INSERT INTO `t_letter_user` VALUES ('53', '28', '68', '0');
INSERT INTO `t_letter_user` VALUES ('54', '28', '69', '0');
INSERT INTO `t_letter_user` VALUES ('55', '28', '70', '0');
INSERT INTO `t_letter_user` VALUES ('56', '28', '71', '0');
INSERT INTO `t_letter_user` VALUES ('57', '28', '72', '0');
INSERT INTO `t_letter_user` VALUES ('58', '28', '73', '0');
INSERT INTO `t_letter_user` VALUES ('59', '28', '74', '0');
INSERT INTO `t_letter_user` VALUES ('60', '28', '75', '0');
INSERT INTO `t_letter_user` VALUES ('61', '28', '76', '0');
INSERT INTO `t_letter_user` VALUES ('62', '28', '77', '0');
INSERT INTO `t_letter_user` VALUES ('63', '29', '1', '0');
INSERT INTO `t_letter_user` VALUES ('64', '29', '28', '0');
INSERT INTO `t_letter_user` VALUES ('65', '29', '31', '0');
INSERT INTO `t_letter_user` VALUES ('66', '29', '33', '0');
INSERT INTO `t_letter_user` VALUES ('67', '29', '34', '0');
INSERT INTO `t_letter_user` VALUES ('68', '29', '35', '0');
INSERT INTO `t_letter_user` VALUES ('69', '29', '36', '0');
INSERT INTO `t_letter_user` VALUES ('71', '29', '38', '0');
INSERT INTO `t_letter_user` VALUES ('72', '29', '43', '0');
INSERT INTO `t_letter_user` VALUES ('73', '29', '46', '0');
INSERT INTO `t_letter_user` VALUES ('74', '29', '47', '0');
INSERT INTO `t_letter_user` VALUES ('75', '29', '48', '0');
INSERT INTO `t_letter_user` VALUES ('76', '29', '49', '0');
INSERT INTO `t_letter_user` VALUES ('77', '29', '50', '0');
INSERT INTO `t_letter_user` VALUES ('78', '29', '51', '0');
INSERT INTO `t_letter_user` VALUES ('79', '29', '52', '0');
INSERT INTO `t_letter_user` VALUES ('80', '29', '54', '0');
INSERT INTO `t_letter_user` VALUES ('81', '29', '65', '0');
INSERT INTO `t_letter_user` VALUES ('82', '29', '66', '0');
INSERT INTO `t_letter_user` VALUES ('83', '29', '67', '0');
INSERT INTO `t_letter_user` VALUES ('84', '29', '68', '0');
INSERT INTO `t_letter_user` VALUES ('85', '29', '69', '0');
INSERT INTO `t_letter_user` VALUES ('86', '29', '70', '0');
INSERT INTO `t_letter_user` VALUES ('87', '29', '71', '0');
INSERT INTO `t_letter_user` VALUES ('88', '29', '72', '0');
INSERT INTO `t_letter_user` VALUES ('89', '29', '73', '0');
INSERT INTO `t_letter_user` VALUES ('90', '29', '74', '0');
INSERT INTO `t_letter_user` VALUES ('91', '29', '75', '0');
INSERT INTO `t_letter_user` VALUES ('92', '29', '76', '0');
INSERT INTO `t_letter_user` VALUES ('93', '29', '77', '0');
INSERT INTO `t_letter_user` VALUES ('94', '30', '1', '0');
INSERT INTO `t_letter_user` VALUES ('95', '30', '28', '0');
INSERT INTO `t_letter_user` VALUES ('96', '30', '31', '0');
INSERT INTO `t_letter_user` VALUES ('97', '30', '33', '0');
INSERT INTO `t_letter_user` VALUES ('98', '30', '34', '0');
INSERT INTO `t_letter_user` VALUES ('99', '30', '35', '0');
INSERT INTO `t_letter_user` VALUES ('102', '30', '38', '0');
INSERT INTO `t_letter_user` VALUES ('103', '30', '43', '0');
INSERT INTO `t_letter_user` VALUES ('104', '30', '46', '0');
INSERT INTO `t_letter_user` VALUES ('105', '30', '47', '0');
INSERT INTO `t_letter_user` VALUES ('106', '30', '48', '0');
INSERT INTO `t_letter_user` VALUES ('107', '30', '49', '0');
INSERT INTO `t_letter_user` VALUES ('108', '30', '50', '0');
INSERT INTO `t_letter_user` VALUES ('109', '30', '51', '0');
INSERT INTO `t_letter_user` VALUES ('110', '30', '52', '0');
INSERT INTO `t_letter_user` VALUES ('111', '30', '54', '0');
INSERT INTO `t_letter_user` VALUES ('112', '30', '65', '0');
INSERT INTO `t_letter_user` VALUES ('113', '30', '66', '0');
INSERT INTO `t_letter_user` VALUES ('114', '30', '67', '0');
INSERT INTO `t_letter_user` VALUES ('115', '30', '68', '0');
INSERT INTO `t_letter_user` VALUES ('116', '30', '69', '0');
INSERT INTO `t_letter_user` VALUES ('117', '30', '70', '0');
INSERT INTO `t_letter_user` VALUES ('118', '30', '71', '0');
INSERT INTO `t_letter_user` VALUES ('119', '30', '72', '0');
INSERT INTO `t_letter_user` VALUES ('120', '30', '73', '0');
INSERT INTO `t_letter_user` VALUES ('121', '30', '74', '0');
INSERT INTO `t_letter_user` VALUES ('122', '30', '75', '0');
INSERT INTO `t_letter_user` VALUES ('123', '30', '76', '0');
INSERT INTO `t_letter_user` VALUES ('124', '30', '77', '0');

-- ----------------------------
-- Table structure for t_logczz
-- ----------------------------
DROP TABLE IF EXISTS `t_logczz`;
CREATE TABLE `t_logczz` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) NOT NULL COMMENT '用户id',
  `bankcard` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `banktype` varchar(20) DEFAULT NULL COMMENT '所属银行',
  `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态，0充值成功，1充值失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_logczz
-- ----------------------------

-- ----------------------------
-- Table structure for t_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE `t_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_ip` varchar(100) DEFAULT NULL,
  `is_online` tinyint(4) DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1325 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_login_log
-- ----------------------------
INSERT INTO `t_login_log` VALUES ('1157', '1', '2018-01-18 08:36:42', '127.0.0.1', '0', '2018-01-18 09:40:53');
INSERT INTO `t_login_log` VALUES ('1158', '1', '2018-01-18 09:30:12', '127.0.0.1', '0', '2018-01-18 09:40:53');
INSERT INTO `t_login_log` VALUES ('1159', '1', '2018-01-18 09:33:36', '127.0.0.1', '0', '2018-01-18 09:40:53');
INSERT INTO `t_login_log` VALUES ('1160', '1', '2018-01-18 09:45:06', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1161', '28', '2018-01-18 10:12:28', '127.0.0.1', '0', '2018-01-18 16:11:50');
INSERT INTO `t_login_log` VALUES ('1162', '1', '2018-01-18 10:36:03', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1163', '1', '2018-01-18 10:42:51', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1164', '1', '2018-01-18 10:46:44', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1165', '1', '2018-01-18 10:53:55', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1166', '1', '2018-01-18 11:10:32', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1167', '1', '2018-01-18 14:11:51', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1168', '1', '2018-01-18 14:19:41', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1169', '1', '2018-01-18 14:23:27', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1170', '1', '2018-01-18 14:25:20', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1171', '1', '2018-01-18 14:25:20', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1172', '1', '2018-01-18 14:25:20', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1173', '1', '2018-01-18 15:30:25', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1174', '1', '2018-01-18 15:36:25', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1175', '1', '2018-01-18 15:45:19', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1176', '1', '2018-01-18 15:45:19', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1177', '1', '2018-01-18 15:45:19', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1178', '1', '2018-01-18 15:45:19', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1179', '1', '2018-01-18 15:45:19', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1180', '1', '2018-01-18 15:45:19', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1181', '1', '2018-01-18 15:55:32', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1182', '1', '2018-01-18 15:55:32', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1183', '1', '2018-01-18 15:55:32', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1184', '1', '2018-01-18 15:55:32', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1185', '1', '2018-01-18 15:55:32', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1186', '1', '2018-01-18 15:55:32', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1187', '31', '2018-01-18 16:06:13', '127.0.0.1', '0', '2018-01-18 16:06:51');
INSERT INTO `t_login_log` VALUES ('1188', '28', '2018-01-18 16:07:06', '127.0.0.1', '0', '2018-01-18 16:11:50');
INSERT INTO `t_login_log` VALUES ('1189', '28', '2018-01-18 16:10:41', '127.0.0.1', '0', '2018-01-18 16:11:50');
INSERT INTO `t_login_log` VALUES ('1190', '1', '2018-01-18 16:12:17', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1191', '1', '2018-01-18 16:15:57', '127.0.0.1', '0', '2018-01-18 16:16:43');
INSERT INTO `t_login_log` VALUES ('1192', '1', '2018-01-18 16:16:53', '127.0.0.1', '0', '2018-01-18 16:25:23');
INSERT INTO `t_login_log` VALUES ('1193', '1', '2018-01-18 16:20:16', '127.0.0.1', '0', '2018-01-18 16:25:23');
INSERT INTO `t_login_log` VALUES ('1194', '1', '2018-01-18 16:25:41', '127.0.0.1', '0', '2018-01-18 16:31:18');
INSERT INTO `t_login_log` VALUES ('1195', '1', '2018-01-18 16:26:35', '127.0.0.1', '0', '2018-01-18 16:31:18');
INSERT INTO `t_login_log` VALUES ('1196', '31', '2018-01-18 16:31:38', '127.0.0.1', '0', '2018-01-18 16:32:04');
INSERT INTO `t_login_log` VALUES ('1197', '1', '2018-01-18 16:32:18', '127.0.0.1', '0', '2018-01-18 16:37:24');
INSERT INTO `t_login_log` VALUES ('1198', '28', '2018-01-18 16:37:54', '127.0.0.1', '0', '2018-01-18 16:39:29');
INSERT INTO `t_login_log` VALUES ('1199', '31', '2018-01-18 16:39:46', '127.0.0.1', '0', '2018-01-18 18:53:17');
INSERT INTO `t_login_log` VALUES ('1200', '31', '2018-01-18 18:26:49', '127.0.0.1', '0', '2018-01-18 18:53:17');
INSERT INTO `t_login_log` VALUES ('1201', '28', '2018-01-18 18:36:32', '127.0.0.1', '0', '2018-01-18 18:51:13');
INSERT INTO `t_login_log` VALUES ('1202', '31', '2018-01-18 18:51:33', '127.0.0.1', '0', '2018-01-18 18:53:17');
INSERT INTO `t_login_log` VALUES ('1203', '1', '2018-01-18 18:53:31', '127.0.0.1', '0', '2018-01-18 18:54:34');
INSERT INTO `t_login_log` VALUES ('1204', '31', '2018-01-18 18:54:52', '127.0.0.1', '0', '2018-01-18 18:58:22');
INSERT INTO `t_login_log` VALUES ('1205', '1', '2018-01-18 19:01:09', '127.0.0.1', '0', '2018-01-18 19:02:07');
INSERT INTO `t_login_log` VALUES ('1206', '28', '2018-01-18 19:02:21', '127.0.0.1', '0', '2018-01-18 19:02:46');
INSERT INTO `t_login_log` VALUES ('1207', '1', '2018-01-18 19:03:04', '127.0.0.1', '0', '2018-01-18 19:26:33');
INSERT INTO `t_login_log` VALUES ('1208', '28', '2018-01-18 19:26:49', '127.0.0.1', '0', '2018-01-18 19:27:03');
INSERT INTO `t_login_log` VALUES ('1209', '31', '2018-01-18 19:27:22', '127.0.0.1', '0', '2018-01-18 19:30:54');
INSERT INTO `t_login_log` VALUES ('1210', '28', '2018-01-18 19:31:16', '127.0.0.1', '0', '2018-01-18 19:58:47');
INSERT INTO `t_login_log` VALUES ('1211', '31', '2018-01-18 19:51:17', '127.0.0.1', '0', '2018-01-18 19:55:07');
INSERT INTO `t_login_log` VALUES ('1212', '28', '2018-01-18 19:55:26', '127.0.0.1', '0', '2018-01-18 19:58:47');
INSERT INTO `t_login_log` VALUES ('1213', '1', '2018-01-18 19:58:58', '127.0.0.1', '0', '2018-01-18 20:00:12');
INSERT INTO `t_login_log` VALUES ('1214', '31', '2018-01-18 20:00:39', '127.0.0.1', '0', '2018-01-18 20:04:28');
INSERT INTO `t_login_log` VALUES ('1215', '1', '2018-01-18 21:10:02', '127.0.0.1', '0', '2018-01-18 21:19:04');
INSERT INTO `t_login_log` VALUES ('1216', '1', '2018-01-19 08:03:53', '127.0.0.1', '0', '2018-01-19 08:50:46');
INSERT INTO `t_login_log` VALUES ('1217', '1', '2018-01-19 08:14:53', '127.0.0.1', '0', '2018-01-19 08:50:46');
INSERT INTO `t_login_log` VALUES ('1218', '1', '2018-01-19 08:56:14', '127.0.0.1', '0', '2018-01-19 09:30:26');
INSERT INTO `t_login_log` VALUES ('1219', '28', '2018-01-19 09:00:58', '127.0.0.1', '0', '2018-01-19 09:05:48');
INSERT INTO `t_login_log` VALUES ('1220', '1', '2018-01-19 09:11:37', '127.0.0.1', '0', '2018-01-19 09:30:26');
INSERT INTO `t_login_log` VALUES ('1221', '46', '2018-01-19 10:13:20', '127.0.0.1', '0', '2018-01-19 10:54:35');
INSERT INTO `t_login_log` VALUES ('1222', '1', '2018-01-19 10:19:01', '127.0.0.1', '0', '2018-01-19 10:34:11');
INSERT INTO `t_login_log` VALUES ('1223', '1', '2018-01-19 10:22:51', '127.0.0.1', '0', '2018-01-19 10:34:11');
INSERT INTO `t_login_log` VALUES ('1224', '1', '2018-01-19 10:33:33', '127.0.0.1', '0', '2018-01-19 10:34:11');
INSERT INTO `t_login_log` VALUES ('1225', '1', '2018-01-19 10:34:52', '127.0.0.1', '0', '2018-01-19 11:14:00');
INSERT INTO `t_login_log` VALUES ('1226', '1', '2018-01-19 10:35:20', '127.0.0.1', '0', '2018-01-19 11:14:00');
INSERT INTO `t_login_log` VALUES ('1227', '1', '2018-01-19 10:35:43', '127.0.0.1', '0', '2018-01-19 11:14:00');
INSERT INTO `t_login_log` VALUES ('1228', '1', '2018-01-19 10:36:19', '127.0.0.1', '0', '2018-01-19 11:14:00');
INSERT INTO `t_login_log` VALUES ('1229', '1', '2018-01-19 10:39:46', '127.0.0.1', '0', '2018-01-19 11:14:00');
INSERT INTO `t_login_log` VALUES ('1230', '1', '2018-01-19 10:40:49', '127.0.0.1', '0', '2018-01-19 11:14:00');
INSERT INTO `t_login_log` VALUES ('1231', '1', '2018-01-19 10:41:08', '127.0.0.1', '0', '2018-01-19 11:14:00');
INSERT INTO `t_login_log` VALUES ('1232', '1', '2018-01-19 10:41:21', '127.0.0.1', '0', '2018-01-19 11:14:00');
INSERT INTO `t_login_log` VALUES ('1233', '1', '2018-01-19 10:41:36', '127.0.0.1', '0', '2018-01-19 11:14:00');
INSERT INTO `t_login_log` VALUES ('1234', '1', '2018-01-19 10:42:32', '127.0.0.1', '0', '2018-01-19 11:14:00');
INSERT INTO `t_login_log` VALUES ('1235', '1', '2018-01-19 10:43:09', '127.0.0.1', '0', '2018-01-19 11:14:00');
INSERT INTO `t_login_log` VALUES ('1236', '46', '2018-01-19 10:48:42', '127.0.0.1', '0', '2018-01-19 10:54:35');
INSERT INTO `t_login_log` VALUES ('1237', '48', '2018-01-19 11:09:57', '127.0.0.1', '1', null);
INSERT INTO `t_login_log` VALUES ('1238', '1', '2018-01-19 11:13:37', '127.0.0.1', '0', '2018-01-19 11:14:00');
INSERT INTO `t_login_log` VALUES ('1239', '1', '2018-01-19 11:16:33', '127.0.0.1', '0', '2018-01-19 11:17:01');
INSERT INTO `t_login_log` VALUES ('1240', '1', '2018-01-19 11:17:19', '127.0.0.1', '0', '2018-01-19 11:17:25');
INSERT INTO `t_login_log` VALUES ('1241', '1', '2018-01-19 11:19:03', '127.0.0.1', '0', '2018-01-19 11:24:44');
INSERT INTO `t_login_log` VALUES ('1242', '78', '2018-01-19 11:27:54', '127.0.0.1', '1', null);
INSERT INTO `t_login_log` VALUES ('1243', '1', '2018-01-19 11:34:07', '127.0.0.1', '0', '2018-01-19 14:41:26');
INSERT INTO `t_login_log` VALUES ('1244', '1', '2018-01-19 14:40:39', '127.0.0.1', '0', '2018-01-19 14:41:26');
INSERT INTO `t_login_log` VALUES ('1245', '36', '2018-01-19 19:41:05', '0:0:0:0:0:0:0:1', '1', null);
INSERT INTO `t_login_log` VALUES ('1246', '36', '2018-01-19 19:58:45', '0:0:0:0:0:0:0:1', '1', null);
INSERT INTO `t_login_log` VALUES ('1247', '1', '2018-01-20 08:33:06', '127.0.0.1', '0', '2018-01-20 10:10:36');
INSERT INTO `t_login_log` VALUES ('1248', '1', '2018-01-20 09:05:34', '127.0.0.1', '0', '2018-01-20 10:10:36');
INSERT INTO `t_login_log` VALUES ('1249', '1', '2018-01-20 09:58:27', '127.0.0.1', '0', '2018-01-20 10:10:36');
INSERT INTO `t_login_log` VALUES ('1250', '1', '2018-01-20 09:58:27', '127.0.0.1', '0', '2018-01-20 10:10:36');
INSERT INTO `t_login_log` VALUES ('1251', '1', '2018-01-20 09:58:27', '127.0.0.1', '0', '2018-01-20 10:10:36');
INSERT INTO `t_login_log` VALUES ('1252', '1', '2018-01-20 10:12:36', '127.0.0.1', '0', '2018-01-20 10:15:26');
INSERT INTO `t_login_log` VALUES ('1253', '1', '2018-01-20 10:16:07', '127.0.0.1', '0', '2018-01-20 10:28:22');
INSERT INTO `t_login_log` VALUES ('1254', '1', '2018-01-20 10:24:09', '127.0.0.1', '0', '2018-01-20 10:28:22');
INSERT INTO `t_login_log` VALUES ('1255', '1', '2018-01-20 10:29:39', '127.0.0.1', '0', '2018-01-20 10:47:35');
INSERT INTO `t_login_log` VALUES ('1256', '1', '2018-01-20 10:34:57', '127.0.0.1', '0', '2018-01-20 10:47:35');
INSERT INTO `t_login_log` VALUES ('1257', '1', '2018-01-20 10:38:07', '127.0.0.1', '0', '2018-01-20 10:47:35');
INSERT INTO `t_login_log` VALUES ('1258', '1', '2018-01-20 10:44:35', '127.0.0.1', '0', '2018-01-20 10:47:35');
INSERT INTO `t_login_log` VALUES ('1259', '1', '2018-01-20 10:48:29', '127.0.0.1', '0', '2018-01-22 19:26:10');
INSERT INTO `t_login_log` VALUES ('1260', '1', '2018-01-20 10:55:56', '127.0.0.1', '0', '2018-01-22 19:26:10');
INSERT INTO `t_login_log` VALUES ('1261', '1', '2018-01-20 10:56:34', '127.0.0.1', '0', '2018-01-22 19:26:10');
INSERT INTO `t_login_log` VALUES ('1262', '1', '2018-01-20 11:01:54', '127.0.0.1', '0', '2018-01-22 19:26:10');
INSERT INTO `t_login_log` VALUES ('1263', '1', '2018-01-20 11:05:18', '127.0.0.1', '0', '2018-01-22 19:26:10');
INSERT INTO `t_login_log` VALUES ('1264', '1', '2018-01-20 11:07:58', '127.0.0.1', '0', '2018-01-22 19:26:10');
INSERT INTO `t_login_log` VALUES ('1265', '1', '2018-01-20 11:20:45', '127.0.0.1', '0', '2018-01-22 19:26:10');
INSERT INTO `t_login_log` VALUES ('1266', '1', '2018-01-20 11:20:45', '127.0.0.1', '0', '2018-01-22 19:26:10');
INSERT INTO `t_login_log` VALUES ('1267', '1', '2018-01-20 11:20:45', '127.0.0.1', '0', '2018-01-22 19:26:10');
INSERT INTO `t_login_log` VALUES ('1268', '1', '2018-01-20 11:20:45', '127.0.0.1', '0', '2018-01-22 19:26:10');
INSERT INTO `t_login_log` VALUES ('1269', '1', '2018-01-20 11:20:45', '127.0.0.1', '0', '2018-01-22 19:26:10');
INSERT INTO `t_login_log` VALUES ('1270', '1', '2018-01-20 11:20:45', '127.0.0.1', '0', '2018-01-22 19:26:10');
INSERT INTO `t_login_log` VALUES ('1271', '36', '2018-01-20 11:27:08', '0:0:0:0:0:0:0:1', '1', null);
INSERT INTO `t_login_log` VALUES ('1272', '36', '2018-01-20 11:35:14', '0:0:0:0:0:0:0:1', '1', null);
INSERT INTO `t_login_log` VALUES ('1273', '36', '2018-01-21 12:37:28', '0:0:0:0:0:0:0:1', '1', null);
INSERT INTO `t_login_log` VALUES ('1274', '79', '2018-01-21 19:13:47', '127.0.0.1', '0', '2018-01-21 19:24:12');
INSERT INTO `t_login_log` VALUES ('1275', '79', '2018-01-21 19:26:52', '127.0.0.1', '0', '2018-01-21 19:39:43');
INSERT INTO `t_login_log` VALUES ('1276', '31', '2018-01-21 19:39:56', '127.0.0.1', '0', '2018-01-21 19:41:29');
INSERT INTO `t_login_log` VALUES ('1277', '79', '2018-01-21 19:41:39', '127.0.0.1', '0', '2018-01-21 19:42:36');
INSERT INTO `t_login_log` VALUES ('1278', '31', '2018-01-21 19:42:48', '127.0.0.1', '0', '2018-01-21 19:45:49');
INSERT INTO `t_login_log` VALUES ('1279', '79', '2018-01-21 19:45:59', '127.0.0.1', '0', '2018-01-21 19:46:58');
INSERT INTO `t_login_log` VALUES ('1280', '31', '2018-01-21 19:47:10', '127.0.0.1', '0', '2018-01-21 19:47:26');
INSERT INTO `t_login_log` VALUES ('1281', '79', '2018-01-21 19:47:45', '127.0.0.1', '0', '2018-01-21 19:54:40');
INSERT INTO `t_login_log` VALUES ('1282', '36', '2018-01-21 20:04:05', '0:0:0:0:0:0:0:1', '1', null);
INSERT INTO `t_login_log` VALUES ('1283', '36', '2018-01-22 08:13:58', '0:0:0:0:0:0:0:1', '1', null);
INSERT INTO `t_login_log` VALUES ('1284', '1', '2018-01-22 11:00:33', '127.0.0.1', '0', '2018-01-22 19:26:10');
INSERT INTO `t_login_log` VALUES ('1285', '1', '2018-01-22 11:00:33', '127.0.0.1', '0', '2018-01-22 19:26:10');
INSERT INTO `t_login_log` VALUES ('1286', '1', '2018-01-22 11:00:33', '127.0.0.1', '0', '2018-01-22 19:26:10');
INSERT INTO `t_login_log` VALUES ('1287', '1', '2018-01-22 11:00:33', '127.0.0.1', '0', '2018-01-22 19:26:10');
INSERT INTO `t_login_log` VALUES ('1288', '1', '2018-01-22 11:00:33', '127.0.0.1', '0', '2018-01-22 19:26:10');
INSERT INTO `t_login_log` VALUES ('1289', '1', '2018-01-22 11:00:33', '127.0.0.1', '0', '2018-01-22 19:26:10');
INSERT INTO `t_login_log` VALUES ('1290', '36', '2018-01-22 14:59:42', '0:0:0:0:0:0:0:1', '1', null);
INSERT INTO `t_login_log` VALUES ('1291', '36', '2018-01-22 15:21:37', '0:0:0:0:0:0:0:1', '1', null);
INSERT INTO `t_login_log` VALUES ('1292', '36', '2018-01-22 15:39:33', '0:0:0:0:0:0:0:1', '1', null);
INSERT INTO `t_login_log` VALUES ('1293', '36', '2018-01-22 15:44:52', '0:0:0:0:0:0:0:1', '1', null);
INSERT INTO `t_login_log` VALUES ('1294', '36', '2018-01-22 15:53:34', '0:0:0:0:0:0:0:1', '1', null);
INSERT INTO `t_login_log` VALUES ('1295', '1', '2018-01-22 16:49:49', '127.0.0.1', '0', '2018-01-22 19:26:10');
INSERT INTO `t_login_log` VALUES ('1296', '36', '2018-01-22 16:58:32', '0:0:0:0:0:0:0:1', '1', null);
INSERT INTO `t_login_log` VALUES ('1297', '36', '2018-01-22 17:05:18', '0:0:0:0:0:0:0:1', '1', null);
INSERT INTO `t_login_log` VALUES ('1298', '36', '2018-01-22 17:07:07', '0:0:0:0:0:0:0:1', '1', null);
INSERT INTO `t_login_log` VALUES ('1299', '1', '2018-01-22 19:13:22', '127.0.0.1', '0', '2018-01-22 19:26:10');
INSERT INTO `t_login_log` VALUES ('1300', '1', '2018-01-22 19:24:13', '127.0.0.1', '0', '2018-01-22 19:26:10');
INSERT INTO `t_login_log` VALUES ('1301', '31', '2018-01-22 19:28:29', '127.0.0.1', '0', '2018-01-22 19:30:27');
INSERT INTO `t_login_log` VALUES ('1302', '34', '2018-01-22 19:30:38', '127.0.0.1', '0', '2018-01-22 19:37:54');
INSERT INTO `t_login_log` VALUES ('1303', '1', '2018-01-22 19:37:38', '127.0.0.1', '0', '2018-01-22 19:40:05');
INSERT INTO `t_login_log` VALUES ('1304', '1', '2018-01-22 19:38:29', '127.0.0.1', '0', '2018-01-22 19:40:05');
INSERT INTO `t_login_log` VALUES ('1305', '31', '2018-01-22 19:40:21', '127.0.0.1', '0', '2018-01-22 19:41:18');
INSERT INTO `t_login_log` VALUES ('1306', '34', '2018-01-22 19:41:35', '127.0.0.1', '0', '2018-01-22 20:09:40');
INSERT INTO `t_login_log` VALUES ('1307', '1', '2018-01-22 19:44:23', '127.0.0.1', '0', '2018-01-22 19:52:49');
INSERT INTO `t_login_log` VALUES ('1308', '1', '2018-01-22 20:05:31', '127.0.0.1', '0', '2018-01-22 20:06:57');
INSERT INTO `t_login_log` VALUES ('1309', '31', '2018-01-22 20:07:09', '127.0.0.1', '0', '2018-01-22 20:08:00');
INSERT INTO `t_login_log` VALUES ('1310', '34', '2018-01-22 20:08:20', '127.0.0.1', '0', '2018-01-22 20:09:40');
INSERT INTO `t_login_log` VALUES ('1311', '31', '2018-01-22 20:10:18', '127.0.0.1', '0', '2018-01-22 20:20:34');
INSERT INTO `t_login_log` VALUES ('1312', '1', '2018-01-22 20:17:46', '127.0.0.1', '0', '2018-01-22 20:17:59');
INSERT INTO `t_login_log` VALUES ('1313', '31', '2018-01-22 20:20:31', '127.0.0.1', '0', '2018-01-22 20:20:34');
INSERT INTO `t_login_log` VALUES ('1314', '31', '2018-01-22 20:21:06', '127.0.0.1', '0', '2018-01-22 20:28:40');
INSERT INTO `t_login_log` VALUES ('1315', '31', '2018-01-22 20:28:07', '127.0.0.1', '0', '2018-01-22 20:28:40');
INSERT INTO `t_login_log` VALUES ('1316', '1', '2018-01-22 20:29:12', '127.0.0.1', '0', '2018-01-22 20:35:39');
INSERT INTO `t_login_log` VALUES ('1317', '28', '2018-01-22 20:35:53', '127.0.0.1', '0', '2018-01-22 20:38:50');
INSERT INTO `t_login_log` VALUES ('1318', '1', '2018-01-22 20:39:13', '127.0.0.1', '0', '2018-01-22 20:39:46');
INSERT INTO `t_login_log` VALUES ('1319', '31', '2018-01-22 20:40:06', '127.0.0.1', '0', '2018-01-22 20:40:15');
INSERT INTO `t_login_log` VALUES ('1320', '28', '2018-01-22 20:52:08', '127.0.0.1', '0', '2018-01-22 21:09:46');
INSERT INTO `t_login_log` VALUES ('1321', '28', '2018-01-22 21:09:17', '127.0.0.1', '0', '2018-01-22 21:09:46');
INSERT INTO `t_login_log` VALUES ('1322', '31', '2018-01-22 21:09:59', '127.0.0.1', '0', '2018-01-22 21:10:44');
INSERT INTO `t_login_log` VALUES ('1323', '1', '2018-01-22 21:11:15', '127.0.0.1', '0', '2018-01-22 21:11:55');
INSERT INTO `t_login_log` VALUES ('1324', '34', '2018-01-22 21:12:10', '127.0.0.1', '1', null);

-- ----------------------------
-- Table structure for t_logmoney
-- ----------------------------
DROP TABLE IF EXISTS `t_logmoney`;
CREATE TABLE `t_logmoney` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型，0充值，1提现，2收款，3.公司奖励，4投资金额，5还款，6优惠券充入余额',
  `in` decimal(10,2) DEFAULT NULL COMMENT '收入',
  `out` decimal(10,2) DEFAULT NULL COMMENT '支出',
  `date` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_logmoney
-- ----------------------------
INSERT INTO `t_logmoney` VALUES ('187', '1', '4', '0.00', '10000.00', '2018-01-22 20:05:51');
INSERT INTO `t_logmoney` VALUES ('188', '31', '4', '0.00', '20000.00', '2018-01-22 20:07:28');
INSERT INTO `t_logmoney` VALUES ('189', '34', '4', '0.00', '20000.00', '2018-01-22 20:08:39');
INSERT INTO `t_logmoney` VALUES ('190', '1', '3', '500.00', null, '2018-01-22 20:31:54');
INSERT INTO `t_logmoney` VALUES ('191', '31', '3', '1000.00', null, '2018-01-22 20:32:17');
INSERT INTO `t_logmoney` VALUES ('192', '34', '3', '1000.00', null, '2018-01-22 20:32:44');
INSERT INTO `t_logmoney` VALUES ('193', '28', '5', '0.00', '1833.33', '2018-01-22 20:38:15');
INSERT INTO `t_logmoney` VALUES ('194', '1', '2', '366.67', '0.00', '2018-01-22 20:39:26');
INSERT INTO `t_logmoney` VALUES ('195', '28', '5', '0.00', '1833.33', '2018-01-22 20:52:33');
INSERT INTO `t_logmoney` VALUES ('196', '28', '5', '0.00', '1833.33', '2018-01-22 21:09:32');
INSERT INTO `t_logmoney` VALUES ('197', '31', '2', '733.33', '0.00', '2018-01-22 21:10:11');
INSERT INTO `t_logmoney` VALUES ('198', '1', '2', '366.67', '0.00', '2018-01-22 21:11:24');
INSERT INTO `t_logmoney` VALUES ('199', '34', '2', '733.33', '0.00', '2018-01-22 21:12:19');

-- ----------------------------
-- Table structure for t_logtx
-- ----------------------------
DROP TABLE IF EXISTS `t_logtx`;
CREATE TABLE `t_logtx` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `bankcard` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `banktype` varchar(20) DEFAULT NULL COMMENT '所属银行',
  `money` decimal(10,2) DEFAULT NULL COMMENT '提现金额',
  `date_time` datetime DEFAULT NULL COMMENT '时间',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态，0提现成功，1未提现失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_logtx
-- ----------------------------
INSERT INTO `t_logtx` VALUES ('1', '1', '1023', '建设银行', '1000.00', '2017-12-25 09:55:19', '0');
INSERT INTO `t_logtx` VALUES ('2', '1', '110221330', '建设银行', '1000.00', '2018-01-04 09:08:29', '0');
INSERT INTO `t_logtx` VALUES ('3', '1', '110221330', '建设银行', '1000.00', '2018-01-04 09:08:31', '0');
INSERT INTO `t_logtx` VALUES ('4', '1', '110221330', '建设银行', '1000.00', '2018-01-04 09:08:35', '0');
INSERT INTO `t_logtx` VALUES ('5', '1', '110221330', '建设银行', '1000.00', '2018-01-04 09:08:35', '0');
INSERT INTO `t_logtx` VALUES ('6', '1', '110221330', '建设银行', '1000.00', '2018-01-04 09:08:38', '0');
INSERT INTO `t_logtx` VALUES ('7', '1', '110221330', '建设银行', '100.00', '2018-01-04 09:11:14', '0');
INSERT INTO `t_logtx` VALUES ('8', '1', '110221330', '建设银行', '100.00', '2018-01-04 09:15:29', '0');
INSERT INTO `t_logtx` VALUES ('9', '1', '110221330', '建设银行', '100.00', '2018-01-04 09:15:31', null);
INSERT INTO `t_logtx` VALUES ('10', '1', '110221330', '建设银行', '100.00', '2018-01-04 09:15:48', null);
INSERT INTO `t_logtx` VALUES ('11', '1', '110221330', '建设银行', '100.00', '2018-01-04 09:16:07', null);
INSERT INTO `t_logtx` VALUES ('12', '1', '110221330', '建设银行', '100.00', '2018-01-04 09:23:02', null);
INSERT INTO `t_logtx` VALUES ('13', '1', '110221330', '建设银行', '1000.00', '2018-01-04 09:25:29', null);
INSERT INTO `t_logtx` VALUES ('14', '1', '110221330', '建设银行', '100.00', '2018-01-04 09:30:35', null);
INSERT INTO `t_logtx` VALUES ('15', '1', '110221330', '建设银行', '100.00', '2018-01-04 09:44:30', null);
INSERT INTO `t_logtx` VALUES ('16', '1', '110221330', '建设银行', '1000.00', '2018-01-04 09:46:16', null);
INSERT INTO `t_logtx` VALUES ('17', '28', '110221330', '建设银行', '21.00', '2018-01-04 15:35:03', '0');
INSERT INTO `t_logtx` VALUES ('18', '28', '110221330', '建设银行', '3.00', '2018-01-04 16:15:58', '0');
INSERT INTO `t_logtx` VALUES ('19', null, '110221330', '建设银行', '50.00', '2018-01-04 16:31:57', null);
INSERT INTO `t_logtx` VALUES ('20', '28', '110221330', '建设银行', '50.00', '2018-01-04 16:33:05', '0');
INSERT INTO `t_logtx` VALUES ('21', '28', '110221330', '建设银行', '1270.00', '2018-01-05 16:01:13', null);
INSERT INTO `t_logtx` VALUES ('22', '28', '110221330', '建设银行', '1270.00', '2018-01-05 16:01:15', null);
INSERT INTO `t_logtx` VALUES ('23', '28', '110221330', '建设银行', '1270.00', '2018-01-05 16:01:16', null);
INSERT INTO `t_logtx` VALUES ('24', '28', '110221330', '建设银行', '1270.00', '2018-01-05 16:01:17', null);
INSERT INTO `t_logtx` VALUES ('25', '28', '110221330', '建设银行', '1270.00', '2018-01-05 16:01:17', null);
INSERT INTO `t_logtx` VALUES ('26', '1', '110221330', '建设银行', '10000.00', '2018-01-05 16:05:54', null);
INSERT INTO `t_logtx` VALUES ('27', '1', '110221330', '建设银行', '100.00', '2018-01-09 08:52:38', '0');
INSERT INTO `t_logtx` VALUES ('28', '28', '110221330', '建设银行', '123.00', '2018-01-11 11:07:18', '0');
INSERT INTO `t_logtx` VALUES ('29', '28', '110221330', '建设银行', '100000.00', '2018-01-11 11:36:25', null);
INSERT INTO `t_logtx` VALUES ('30', '28', '124234234', '2', '10.00', '2018-01-11 14:57:59', null);
INSERT INTO `t_logtx` VALUES ('31', '28', '154654162', '3', '100.00', '2018-01-11 16:24:09', '0');
INSERT INTO `t_logtx` VALUES ('32', '28', '154654162', '3', '20.00', '2018-01-11 16:24:18', '0');
INSERT INTO `t_logtx` VALUES ('33', '28', '13737284568', '6', '23.00', '2018-01-11 16:25:08', '0');
INSERT INTO `t_logtx` VALUES ('34', '28', '13737284568', '6', '50.00', '2018-01-11 16:25:16', '0');
INSERT INTO `t_logtx` VALUES ('35', '28', '13737284568', '6', '40.00', '2018-01-11 16:58:24', null);
INSERT INTO `t_logtx` VALUES ('36', '1', '6541123678946542185', '6', '50.00', '2018-01-16 16:52:56', null);
INSERT INTO `t_logtx` VALUES ('37', '1', '6541123678946542185', '6', '20.00', '2018-01-16 16:57:21', null);
INSERT INTO `t_logtx` VALUES ('38', '1', '6542365478943654125', '8', '250.00', '2018-01-17 09:55:09', null);
INSERT INTO `t_logtx` VALUES ('39', '1', '1254635894123654', '6', '120.00', '2018-01-18 14:30:07', null);
INSERT INTO `t_logtx` VALUES ('40', '1', '6541365412654561235', '7', '230.00', '2018-01-18 15:56:26', null);
INSERT INTO `t_logtx` VALUES ('41', '28', '62170021798898426', '3', '700.00', '2018-01-19 09:03:36', null);
INSERT INTO `t_logtx` VALUES ('42', '1', '6123154545454545456', '5', '1.00', '2018-01-19 09:15:19', null);
INSERT INTO `t_logtx` VALUES ('43', '1', '6123154545454545456', '5', '1.00', '2018-01-19 09:15:29', null);
INSERT INTO `t_logtx` VALUES ('44', '1', '6123154545454545456', '5', '100.00', '2018-01-19 09:16:03', null);

-- ----------------------------
-- Table structure for t_media
-- ----------------------------
DROP TABLE IF EXISTS `t_media`;
CREATE TABLE `t_media` (
  `mid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `content` varchar(5000) DEFAULT NULL COMMENT '内容',
  `pic` varchar(500) DEFAULT NULL COMMENT '封面图片',
  `date` date DEFAULT NULL COMMENT '时间',
  `url` varchar(50) DEFAULT NULL COMMENT '报道的链接地址',
  `state` tinyint(4),
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_media
-- ----------------------------
INSERT INTO `t_media` VALUES ('59', '全线下调综合息费至36%以下', '<p>昨日（12月13日），美股上市公司拍拍贷（NYSE:PPDF）发布了2017年第三季度未经审计的财务业绩报告。<br/></p><p><br/></p><p>报告中披露，为迎合《关于规范整顿“现金贷”业务的通知》中的相关规定。拍拍贷将于12月初停止在所有平台上收取前期交易费用，将其更改为每月收取的方式，并于12月13日全线下调其借贷产品的综合息费至36%以下。</p><p><br/></p><p>除此，趣店、玖富、掌众金融等也纷纷下调了综合息费至36%以下。</p><p><br/></p><p>同时，拍拍贷将于2018年起取消投资者风险准备金（Investorreservefunds）以应对日益收紧的监管环境。</p><p><br/></p><p>报告还显示，拍拍贷截至9月30日的第三季度运营营收为12.503亿元（人民币，约合1.879亿美元），较去年同期的3.625亿元增长244.9%；归属于公司普通股股东的净亏损为2.787亿元（约合4190万美元），去年同期为净利润6080万元。</p><p><br/></p><p>此外，拍拍贷还在今日宣布，公司已与总部位于香港的新鸿基金融达成战略合作，双方将在未来共同探索在资产和资金端、新产品以及互联网科技等领域的业务合作机会。</p><p><br/></p>', 'upload/5180ed61d91c4c17b61d6bb5e9a621a4.jpg', '2021-01-23', 'http://www.tmtpost.com/nictation/2968879.html', '0');
INSERT INTO `t_media` VALUES ('60', '网贷信披指引出台', '<p>针对一些突发的状况，银监会要求于发生之日起48小时内将事件的起因、目前的状态、可能产生的影响、采取的措施向公众披露。比如，网贷机构出现减资、合并、分立、解散、申请破产；进入破产程序；被责令停业、整顿、关闭；涉及重大诉讼、仲裁或涉嫌违法违规被调查；法定代表人、实际控制人、董监高等涉及重大诉讼、仲裁，或涉嫌违法违纪；主要或者全部业务陷入停顿等重大事项。</p><p><br/></p>', 'upload/069b99207c8b43b7932f6a37d57bfd96.jpg', '2018-01-23', 'http://www.ppdai.com/help/mediareports', '0');
INSERT INTO `t_media` VALUES ('61', '合规发展成为行业关键点', '<p>中国金融信息网讯（记者王原）多家中国<a href=\"http://fintech.xinhua08.com/\" target=\"_blank\">互联网金融</a>企业在2017年密集赴美上市。从已经公布第三季度财报的美股上市互金平台类企业数据来看，行业内各平台在第三季度的各项业务数据和财务数据均保持增长态势。</p><p>宜人贷第三季度促成借款总额121.85亿元，较2016年同期增长117%；信而富单季度新增借款人93.1万人，较去年同期增长804%；趣店的交易规模则延续高增长，第三季度交易额达256亿元，同比增长218.8%，交易笔数达2670万，较去年的笔数1100万同比增长141.7%。</p>', 'upload/0fdf837ff30b410681afb95ce4230fe3.jpg', '2018-01-22', 'http://stock.xinhua08.com/a/20171215/1740933.shtml', '0');
INSERT INTO `t_media` VALUES ('62', '互联网经济', '<p>互联网经济</p>', 'upload/1.jpg', '2018-01-09', 'http://www.zxdy.cc/vod/19134.html', '0');
INSERT INTO `t_media` VALUES ('63', '亿人宝上线了', '<p>亿人宝</p>', 'upload/02.jpg', '2018-01-02', 'http://www.zxdy.cc/vod/19134.html', '0');

-- ----------------------------
-- Table structure for t_module
-- ----------------------------
DROP TABLE IF EXISTS `t_module`;
CREATE TABLE `t_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_module
-- ----------------------------
INSERT INTO `t_module` VALUES ('9000', '用户管理');
INSERT INTO `t_module` VALUES ('9001', '客户管理');
INSERT INTO `t_module` VALUES ('9002', '角色管理');
INSERT INTO `t_module` VALUES ('9003', '人才管理');

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `nid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `content` text COMMENT '内容',
  `title` varchar(20) DEFAULT NULL COMMENT '标题',
  `date` datetime DEFAULT NULL COMMENT '公告时间',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('9', '<p>你好，我好，大家好，才是真的好</p>', '张三', '2018-01-11 15:05:25');
INSERT INTO `t_notice` VALUES ('10', '<p><img src=\"/upload/image/20180112/1515725686041031098.jpg\" title=\"1515725686041031098.jpg\" alt=\"267855-13032410192878.jpg\"/></p>', '圣诞节晚会', '2018-01-12 10:54:24');
INSERT INTO `t_notice` VALUES ('11', '<p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">【项目简介】</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">本期投资标的借款企业某保理公司成立于2016年5月，办公地址前海深港合作区，主要从事保付代理业务，经济信息咨询，注册资本10000万元。将恒大集团所开具商业承兑汇票质押于我公司，恒大集团信用状况良好，资产实力充裕。本项目本次融资金额20万元，融资期1个月。该借款用于资金周转，借款总额20万元，本平台为此次借款提供服务。</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">【借款金额】 20万</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">【产品类别】新手标</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">【借款期限】1个月</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">【借款利率】12%</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">【发标时间】2018年01月12日&nbsp;10:00</p><p><br/></p>', '2018年01月11日新标预告', '2018-01-14 20:49:47');
INSERT INTO `t_notice` VALUES ('12', '<p>124124</p>', '123124', '2018-01-18 11:17:37');
INSERT INTO `t_notice` VALUES ('13', '<p>12512512</p>', '125125125', '2018-01-18 11:17:44');
INSERT INTO `t_notice` VALUES ('14', '<p>135236346</p>', '2352362', '2018-01-18 11:17:51');

-- ----------------------------
-- Table structure for t_option
-- ----------------------------
DROP TABLE IF EXISTS `t_option`;
CREATE TABLE `t_option` (
  `opid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `phone` char(11) NOT NULL COMMENT '电话',
  `content` varchar(200) DEFAULT NULL COMMENT '内容',
  `date` date DEFAULT NULL COMMENT '反馈时间',
  PRIMARY KEY (`opid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_option
-- ----------------------------
INSERT INTO `t_option` VALUES ('1', '15978888888', '我很爱你', '2017-12-20');
INSERT INTO `t_option` VALUES ('2', '15978777777', '我很羡慕你哦', '2017-12-20');
INSERT INTO `t_option` VALUES ('3', '18720733215', '红包没领到', '2018-01-04');
INSERT INTO `t_option` VALUES ('4', '18720733215', '红包没领到', '2018-01-04');
INSERT INTO `t_option` VALUES ('5', '18720733215', '红包没领到', '2018-01-04');
INSERT INTO `t_option` VALUES ('6', '18720733215', '红包没领到', '2018-01-04');
INSERT INTO `t_option` VALUES ('7', '18720733215', '红包没领到', '2018-01-04');
INSERT INTO `t_option` VALUES ('8', '18720733215', '我要当管理员', '2018-01-04');
INSERT INTO `t_option` VALUES ('9', '18720733215', '你们的服务很周到', '2018-01-04');
INSERT INTO `t_option` VALUES ('10', '18720733215', '嗯嗯呢，好', '2018-01-04');
INSERT INTO `t_option` VALUES ('11', '18720733215', '嗯嗯呢，好', '2018-01-04');
INSERT INTO `t_option` VALUES ('12', '18720733215', 'hahhahahahaha', '2018-01-04');
INSERT INTO `t_option` VALUES ('13', '18720733215', 'eeeeeeeeeeeeeeeeeeeeeeeeeeee', '2018-01-04');
INSERT INTO `t_option` VALUES ('14', '18720733215', '你好，我要投诉你的客服好无力哦\r\n', '2018-01-04');
INSERT INTO `t_option` VALUES ('15', '18720733215', '我很高兴注册你们的平台', '2018-01-04');
INSERT INTO `t_option` VALUES ('16', '18720733215', '没什么想说的就是玩玩而已', '2018-01-04');
INSERT INTO `t_option` VALUES ('17', '18720733215', '无聊而已', '2018-01-04');
INSERT INTO `t_option` VALUES ('18', '18720733215', '无聊而已', '2018-01-04');
INSERT INTO `t_option` VALUES ('19', '18720733215', '明明很在意的', '2018-01-04');
INSERT INTO `t_option` VALUES ('20', '18720733215', 'hahhahahahahaha哈哈哈哈', '2018-01-04');
INSERT INTO `t_option` VALUES ('21', '18720733215', '明明i个', '2018-01-04');
INSERT INTO `t_option` VALUES ('22', '18720733215', '这里很好玩啊', '2018-01-04');
INSERT INTO `t_option` VALUES ('23', '15979851881', '我要成为你的员工', '2018-01-05');
INSERT INTO `t_option` VALUES ('25', '18720865791', '露西，我宣你', '2018-01-19');
INSERT INTO `t_option` VALUES ('26', '18720865791', '村里有个姑娘，叫小芳☺', '2018-01-19');
INSERT INTO `t_option` VALUES ('27', '18720865791', '啊，✔☺☹۞☋㊤〄♙❤', '2018-01-19');
INSERT INTO `t_option` VALUES ('28', '17370134037', '小月，我要你', '2018-01-21');

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL,
  `des_zh` varchar(100) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('1', '/luser/userList', '用户管理:用户信息', null, '1');
INSERT INTO `t_permission` VALUES ('2', '/recommend/page', '用户管理:推荐管理', null, '1');
INSERT INTO `t_permission` VALUES ('3', '/logMoney/list', '用户管理:资金流向管理', null, '1');
INSERT INTO `t_permission` VALUES ('4', '/logTx/init', '用户管理:用户提现记录', null, '1');
INSERT INTO `t_permission` VALUES ('5', '/option/page', '用户管理:用户反馈', null, '1');
INSERT INTO `t_permission` VALUES ('6', '/luser/loginlog', '用户管理:登录日志', null, '1');
INSERT INTO `t_permission` VALUES ('7', '/page/users', '审核管理:借款审核', null, '1');
INSERT INTO `t_permission` VALUES ('8', '/rzvip/rzvipList', '审核管理:认证审核', null, '1');
INSERT INTO `t_permission` VALUES ('9', '/txCheck/init', '审核管理:提现审核', null, '1');
INSERT INTO `t_permission` VALUES ('10', '/reward/rewardList', '金额管理:奖励信息', null, '1');
INSERT INTO `t_permission` VALUES ('11', '/tz/page', '金额管理:用户投资列表', null, '1');
INSERT INTO `t_permission` VALUES ('12', '/userMoney/init', '金额管理:用户资金管理', null, '1');
INSERT INTO `t_permission` VALUES ('13', '/ticket/page', '金额管理:优惠券管理', null, '1');
INSERT INTO `t_permission` VALUES ('14', '/sway/sway', '类型管理:还款方式类型管理', null, '1');
INSERT INTO `t_permission` VALUES ('15', '/bz/bz', '类型管理:标种类型管理', null, '1');
INSERT INTO `t_permission` VALUES ('16', '/jklx/jklx', '类型管理:借款类型管理', null, '1');
INSERT INTO `t_permission` VALUES ('17', '/friend/friend', '类型管理:合作伙伴管理', null, '1');
INSERT INTO `t_permission` VALUES ('18', '/notice/notice', '类型管理:最新公告列表', null, '1');
INSERT INTO `t_permission` VALUES ('19', '/media/page', '宣传管理:媒体报道列表', null, '1');
INSERT INTO `t_permission` VALUES ('21', '/home/page', '宣传管理:首页信息列表', null, '1');
INSERT INTO `t_permission` VALUES ('23', '/dynamic/page', '宣传管理:公司动态列表', null, '1');

-- ----------------------------
-- Table structure for t_recommend
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_recommend
-- ----------------------------
INSERT INTO `t_recommend` VALUES ('1', '36', '胡歌', '1', '胡', '2018-01-08 11:40:08');
INSERT INTO `t_recommend` VALUES ('2', '1', '胡', '79', '小赖子', '2018-01-21 19:12:40');

-- ----------------------------
-- Table structure for t_reward
-- ----------------------------
DROP TABLE IF EXISTS `t_reward`;
CREATE TABLE `t_reward` (
  `rwid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '投资人id，t_user前台用户表id字段',
  `tmoney` decimal(20,2) DEFAULT NULL COMMENT '投资总额',
  `money` decimal(20,2) DEFAULT NULL COMMENT '奖励金额',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态（0已发放，1未发放）',
  `date` datetime DEFAULT NULL COMMENT '奖励发放时间',
  PRIMARY KEY (`rwid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_reward
-- ----------------------------
INSERT INTO `t_reward` VALUES ('20', '1', '10000.00', '500.00', '2', '2018-01-22 20:34:24');
INSERT INTO `t_reward` VALUES ('21', '31', '20000.00', '1000.00', '2', '2018-01-22 20:34:46');
INSERT INTO `t_reward` VALUES ('22', '34', '20000.00', '1000.00', '2', '2018-01-22 20:35:14');

-- ----------------------------
-- Table structure for t_rewardsetting
-- ----------------------------
DROP TABLE IF EXISTS `t_rewardsetting`;
CREATE TABLE `t_rewardsetting` (
  `rwid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `minmoney` decimal(10,2) DEFAULT NULL COMMENT '最小金额',
  `maxmoney` decimal(10,2) DEFAULT NULL COMMENT '最大金额',
  `percent` double(255,0) DEFAULT NULL COMMENT '奖励百分比',
  PRIMARY KEY (`rwid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rewardsetting
-- ----------------------------
INSERT INTO `t_rewardsetting` VALUES ('1', '5.00', '500000.00', '9');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `rid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `rname` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `content` varchar(500) DEFAULT NULL COMMENT '角色描述',
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '超级管理员', '拥有全部权限', '1');
INSERT INTO `t_role` VALUES ('2', '普通管理员', '拥有大部分权限', '1');
INSERT INTO `t_role` VALUES ('3', '普通员工', '拥有少部分权限', '1');

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  `set_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('83', '2', '1', null);
INSERT INTO `t_role_permission` VALUES ('84', '2', '2', null);
INSERT INTO `t_role_permission` VALUES ('85', '2', '3', null);
INSERT INTO `t_role_permission` VALUES ('86', '2', '4', null);
INSERT INTO `t_role_permission` VALUES ('87', '2', '5', null);
INSERT INTO `t_role_permission` VALUES ('88', '2', '6', null);
INSERT INTO `t_role_permission` VALUES ('89', '2', '7', null);
INSERT INTO `t_role_permission` VALUES ('90', '2', '8', null);
INSERT INTO `t_role_permission` VALUES ('91', '2', '9', null);
INSERT INTO `t_role_permission` VALUES ('92', '2', '10', null);
INSERT INTO `t_role_permission` VALUES ('93', '2', '11', null);
INSERT INTO `t_role_permission` VALUES ('94', '2', '12', null);
INSERT INTO `t_role_permission` VALUES ('95', '2', '13', null);
INSERT INTO `t_role_permission` VALUES ('96', '2', '14', null);
INSERT INTO `t_role_permission` VALUES ('97', '2', '15', null);
INSERT INTO `t_role_permission` VALUES ('98', '2', '16', null);
INSERT INTO `t_role_permission` VALUES ('99', '2', '17', null);
INSERT INTO `t_role_permission` VALUES ('100', '2', '18', null);
INSERT INTO `t_role_permission` VALUES ('101', '2', '19', null);
INSERT INTO `t_role_permission` VALUES ('102', '2', '21', null);
INSERT INTO `t_role_permission` VALUES ('103', '2', '23', null);
INSERT INTO `t_role_permission` VALUES ('104', '3', '19', null);
INSERT INTO `t_role_permission` VALUES ('105', '3', '21', null);
INSERT INTO `t_role_permission` VALUES ('106', '3', '23', null);
INSERT INTO `t_role_permission` VALUES ('107', '1', '1', null);
INSERT INTO `t_role_permission` VALUES ('108', '1', '2', null);
INSERT INTO `t_role_permission` VALUES ('109', '1', '3', null);
INSERT INTO `t_role_permission` VALUES ('110', '1', '4', null);
INSERT INTO `t_role_permission` VALUES ('111', '1', '5', null);
INSERT INTO `t_role_permission` VALUES ('112', '1', '6', null);
INSERT INTO `t_role_permission` VALUES ('113', '1', '7', null);
INSERT INTO `t_role_permission` VALUES ('114', '1', '8', null);
INSERT INTO `t_role_permission` VALUES ('115', '1', '9', null);
INSERT INTO `t_role_permission` VALUES ('116', '1', '10', null);
INSERT INTO `t_role_permission` VALUES ('117', '1', '11', null);
INSERT INTO `t_role_permission` VALUES ('118', '1', '12', null);
INSERT INTO `t_role_permission` VALUES ('119', '1', '13', null);
INSERT INTO `t_role_permission` VALUES ('120', '1', '14', null);
INSERT INTO `t_role_permission` VALUES ('121', '1', '15', null);
INSERT INTO `t_role_permission` VALUES ('122', '1', '16', null);
INSERT INTO `t_role_permission` VALUES ('123', '1', '17', null);
INSERT INTO `t_role_permission` VALUES ('124', '1', '18', null);
INSERT INTO `t_role_permission` VALUES ('125', '1', '19', null);
INSERT INTO `t_role_permission` VALUES ('126', '1', '21', null);
INSERT INTO `t_role_permission` VALUES ('127', '1', '23', null);

-- ----------------------------
-- Table structure for t_rzvip
-- ----------------------------
DROP TABLE IF EXISTS `t_rzvip`;
CREATE TABLE `t_rzvip` (
  `rid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) NOT NULL COMMENT '用户id',
  `xl` varchar(40) DEFAULT NULL COMMENT '学历',
  `ism` tinyint(4) DEFAULT NULL COMMENT '婚否（0已婚，1未婚，2单身）',
  `bschool` varchar(30) DEFAULT NULL COMMENT '毕业学校',
  `addr` varchar(40) NOT NULL COMMENT '居住地址',
  `work` varchar(30) DEFAULT NULL COMMENT '现工作',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `int1` bigint(20) DEFAULT NULL COMMENT '预留字段',
  `str1` varchar(20) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rzvip
-- ----------------------------
INSERT INTO `t_rzvip` VALUES ('1', '1', '博士', '1', '北京航天', '江西省赣州市', '程序猿', '21', null, null);
INSERT INTO `t_rzvip` VALUES ('2', '33', '博士后', '0', '清华大学', '江西省吉安市', '高级软件工程师', '20', null, null);
INSERT INTO `t_rzvip` VALUES ('33', '28', '本科', '1', '江西农大', '江西省赣州', '程序员', '22', null, null);
INSERT INTO `t_rzvip` VALUES ('34', '47', '本科', '0', '清华大学', '江西省赣州市', '软件工程师', '23', null, null);
INSERT INTO `t_rzvip` VALUES ('35', '48', '专科', '1', '江西应用技术学院', '赣州', '搬砖', '32', null, null);
INSERT INTO `t_rzvip` VALUES ('36', '46', '本科', '0', '江西师范大学', '江西省赣州市', '搬砖', '21', null, null);
INSERT INTO `t_rzvip` VALUES ('37', '79', '专科', '0', '华中师范大学', '北京', '程序员', '34', null, null);
INSERT INTO `t_rzvip` VALUES ('38', '31', '小学', '0', '小学', '吉安', '搬砖', '23', null, null);

-- ----------------------------
-- Table structure for t_rzvipcheck
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rzvipcheck
-- ----------------------------
INSERT INTO `t_rzvipcheck` VALUES ('1', '1', '2', '0', '通过', '2018-01-07 19:08:06');
INSERT INTO `t_rzvipcheck` VALUES ('2', '33', '1', '1', '不通', '2018-01-03 10:30:07');
INSERT INTO `t_rzvipcheck` VALUES ('7', '28', '1', '0', '通过', '2018-01-05 14:47:47');
INSERT INTO `t_rzvipcheck` VALUES ('8', '47', '2', '0', '通过', '2018-01-16 10:14:37');
INSERT INTO `t_rzvipcheck` VALUES ('9', '48', '2', '0', '通过', '2018-01-16 10:15:06');
INSERT INTO `t_rzvipcheck` VALUES ('10', '46', '1', '0', '通过', '2018-01-21 19:17:55');
INSERT INTO `t_rzvipcheck` VALUES ('11', '79', '1', '0', '通过', '2018-01-21 19:18:06');
INSERT INTO `t_rzvipcheck` VALUES ('12', '31', '1', '0', '通过', '2018-01-22 20:22:55');

-- ----------------------------
-- Table structure for t_shborrow
-- ----------------------------
DROP TABLE IF EXISTS `t_shborrow`;
CREATE TABLE `t_shborrow` (
  `shid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `huid` bigint(20) DEFAULT NULL COMMENT '审核人id，t_huser后台用户主键id',
  `isok` tinyint(4) DEFAULT NULL COMMENT '审核是否通过（0未通过，1已通过）',
  `excute` varchar(200) DEFAULT NULL COMMENT '审核理由',
  `date` datetime DEFAULT NULL COMMENT '审核时间',
  `baid` bigint(20) DEFAULT NULL COMMENT '借款人id，t_borrowapply申请借款表主键id字段',
  PRIMARY KEY (`shid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shborrow
-- ----------------------------
INSERT INTO `t_shborrow` VALUES ('1', '1', '1', '通过', '2017-12-28 14:15:39', '1');
INSERT INTO `t_shborrow` VALUES ('2', '2', '1', '审核通过', '2017-12-28 08:46:15', '1');
INSERT INTO `t_shborrow` VALUES ('3', '3', '1', '审核通过', '2017-12-26 20:08:44', '2');
INSERT INTO `t_shborrow` VALUES ('4', '3', '1', '审核通过', '2017-12-26 20:12:33', '2');
INSERT INTO `t_shborrow` VALUES ('5', '1', '1', '通过', '2017-12-26 20:23:46', '2');
INSERT INTO `t_shborrow` VALUES ('6', '2', '1', '审核通过', '2017-12-27 20:06:51', '2');
INSERT INTO `t_shborrow` VALUES ('7', null, '0', null, null, '4');

-- ----------------------------
-- Table structure for t_skb
-- ----------------------------
DROP TABLE IF EXISTS `t_skb`;
CREATE TABLE `t_skb` (
  `skid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id，前台用户t_user主键id',
  `juid` bigint(20) DEFAULT NULL COMMENT '借款人id，t_borrowapply表主键id',
  `ybx` decimal(10,2) DEFAULT NULL COMMENT '应收本息',
  `rbx` decimal(10,2) DEFAULT NULL COMMENT '已收本息',
  `ylx` decimal(10,2) DEFAULT NULL COMMENT '应收利息',
  `rlx` decimal(10,2) DEFAULT NULL COMMENT '已收利息',
  `ybj` decimal(10,2) DEFAULT NULL COMMENT '应收本金',
  `rbj` decimal(10,2) DEFAULT NULL COMMENT '已收本金',
  `rnum` int(11) DEFAULT NULL COMMENT '已还期数',
  `tnum` int(11) DEFAULT NULL COMMENT '总期数',
  `date` datetime DEFAULT NULL COMMENT '日期',
  `baid` bigint(20) DEFAULT NULL COMMENT '借款人id，t_borrowapply表主键id',
  `fmoney` decimal(10,2) DEFAULT NULL COMMENT '好友奖励',
  `djq` int(20) DEFAULT NULL COMMENT '第几期收款',
  `state` tinyint(4) DEFAULT NULL COMMENT '收款状态 1未还 2已还 3确认收款',
  `int1` bigint(20) DEFAULT NULL COMMENT '预留字段',
  `str1` varchar(20) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`skid`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_skb
-- ----------------------------
INSERT INTO `t_skb` VALUES ('44', '34', '28', '733.33', '733.33', '733.33', '733.33', '0.00', null, '1', '3', '2018-01-22 21:14:48', '23', null, '1', '2', null, null);
INSERT INTO `t_skb` VALUES ('45', '34', '28', '733.33', null, '733.33', null, '0.00', null, null, '3', null, '23', null, '2', '1', null, null);
INSERT INTO `t_skb` VALUES ('46', '34', '28', '20733.33', null, '733.33', null, '20000.00', null, null, '3', null, '23', null, '3', '1', null, null);
INSERT INTO `t_skb` VALUES ('47', '31', '28', '733.33', '733.33', '733.33', '733.33', '0.00', null, '1', '3', '2018-01-22 21:12:40', '23', null, '1', '2', null, null);
INSERT INTO `t_skb` VALUES ('48', '31', '28', '733.33', null, '733.33', null, '0.00', null, null, '3', null, '23', null, '2', '1', null, null);
INSERT INTO `t_skb` VALUES ('49', '31', '28', '20733.33', null, '733.33', null, '20000.00', null, null, '3', null, '23', null, '3', '1', null, null);
INSERT INTO `t_skb` VALUES ('50', '1', '28', '366.67', '366.67', '366.67', '366.67', '0.00', null, '1', '3', '2018-01-22 21:13:53', '23', null, '1', '2', null, null);
INSERT INTO `t_skb` VALUES ('51', '1', '28', '366.67', null, '366.67', null, '0.00', null, null, '3', null, '23', null, '2', '1', null, null);
INSERT INTO `t_skb` VALUES ('52', '1', '28', '10366.67', null, '366.67', null, '10000.00', null, null, '3', null, '23', null, '3', '1', null, null);

-- ----------------------------
-- Table structure for t_sway
-- ----------------------------
DROP TABLE IF EXISTS `t_sway`;
CREATE TABLE `t_sway` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `way` varchar(100) DEFAULT NULL COMMENT '方式',
  `fw` varchar(200) DEFAULT NULL COMMENT '算法',
  `state` tinyint(4) DEFAULT NULL COMMENT '还款方式状态（0不可用，1可用）',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sway
-- ----------------------------
INSERT INTO `t_sway` VALUES ('1', '等额本金', '等额本金', '1');
INSERT INTO `t_sway` VALUES ('2', '等额本息', '等额本息', '1');
INSERT INTO `t_sway` VALUES ('3', '先息后本', '先息后本', '1');
INSERT INTO `t_sway` VALUES ('4', '一次性还本付息', '一次性还本付息', '1');

-- ----------------------------
-- Table structure for t_ticket
-- ----------------------------
DROP TABLE IF EXISTS `t_ticket`;
CREATE TABLE `t_ticket` (
  `kid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `type` tinyint(4) DEFAULT NULL COMMENT '优惠券类型，如现金劵1，代金券2，体验金3，加息券4',
  `tkmoney` decimal(10,2) DEFAULT NULL COMMENT '优惠券金额',
  `tktime` date DEFAULT NULL COMMENT '有效时间',
  `tname` varchar(50) DEFAULT NULL COMMENT '优惠卷名称',
  `tintro` varchar(500) DEFAULT NULL COMMENT '优惠卷简介（例如什么情况下用）',
  `usecondition` decimal(10,0) unsigned DEFAULT NULL COMMENT '使用条件',
  `status` tinyint(255) DEFAULT NULL COMMENT '优惠券状态(0冻结1激活)',
  PRIMARY KEY (`kid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ticket
-- ----------------------------
INSERT INTO `t_ticket` VALUES ('1', '3', '16000.00', '2200-01-12', '注册', '投资大于6000时候', '6000', '1');
INSERT INTO `t_ticket` VALUES ('2', '1', '10.00', '2018-04-01', '注册', '请直接转到余额里面哦', '0', '1');
INSERT INTO `t_ticket` VALUES ('3', '1', '200.00', '2018-01-01', '注册', '请直接转到余额里面哦', null, '1');
INSERT INTO `t_ticket` VALUES ('22', '2', '200.00', '2018-01-01', '注册', '投资大于1000时使用', '1000', '1');
INSERT INTO `t_ticket` VALUES ('23', '4', '1.00', '2018-01-13', '注册', '投资大于1000时使用', '1000', '1');
INSERT INTO `t_ticket` VALUES ('24', '1', '150.00', '2018-01-12', '注册', '请直接转到余额里面哦', null, '1');
INSERT INTO `t_ticket` VALUES ('25', '2', '111.00', '2018-03-02', '投资111', '投资大于6000时使用', '6000', '1');
INSERT INTO `t_ticket` VALUES ('26', '4', '1.00', '2018-01-16', '注册', '满100000才可使用加息券', '10000', '1');
INSERT INTO `t_ticket` VALUES ('27', '1', '50.00', '2028-01-01', '50元推荐金', '被推荐人总投资超过10000，给推荐人50元现金劵', '500', '1');
INSERT INTO `t_ticket` VALUES ('28', '1', '500.00', '2028-01-01', '500元推荐金', '5位被推荐人总投资超过10000，给推荐人500元现金劵', '10000', '1');

-- ----------------------------
-- Table structure for t_txcheck
-- ----------------------------
DROP TABLE IF EXISTS `t_txcheck`;
CREATE TABLE `t_txcheck` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `txid` bigint(20) DEFAULT NULL COMMENT '提现人id',
  `huid` bigint(20) DEFAULT NULL COMMENT '审核人id',
  `isok` tinyint(4) DEFAULT NULL COMMENT '审核是否通过，0通过，1未通过',
  `excute` varchar(200) DEFAULT NULL COMMENT '审核理由',
  `date_time` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_txcheck
-- ----------------------------
INSERT INTO `t_txcheck` VALUES ('31', '31', '28', '0', '通过', '2018-01-11 16:24:09');
INSERT INTO `t_txcheck` VALUES ('32', '32', '28', '0', '通过', '2018-01-11 16:24:19');
INSERT INTO `t_txcheck` VALUES ('33', '33', '28', '0', '通过', '2018-01-11 16:25:08');
INSERT INTO `t_txcheck` VALUES ('34', '34', '28', '0', '通过', '2018-01-11 16:25:17');
INSERT INTO `t_txcheck` VALUES ('35', '35', '28', '0', '通过', '2018-01-11 16:58:24');
INSERT INTO `t_txcheck` VALUES ('36', '36', '1', '2', null, '2018-01-16 16:52:56');
INSERT INTO `t_txcheck` VALUES ('37', '37', '1', '2', null, '2018-01-16 16:57:21');
INSERT INTO `t_txcheck` VALUES ('38', '38', '1', '2', null, '2018-01-17 09:55:09');
INSERT INTO `t_txcheck` VALUES ('39', '39', '1', '1', '我宣你啊', '2018-01-18 14:30:07');
INSERT INTO `t_txcheck` VALUES ('40', '40', '1', '1', '我宣你啊', '2018-01-18 15:56:26');
INSERT INTO `t_txcheck` VALUES ('41', '41', '28', '0', '通过', '2018-01-19 09:03:36');
INSERT INTO `t_txcheck` VALUES ('42', '44', '1', '0', '我宣你啊', '2018-01-19 09:16:04');

-- ----------------------------
-- Table structure for t_tzb
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
  `int1` int(20) DEFAULT NULL,
  `str1` varchar(20) DEFAULT NULL COMMENT '预留字段',
  `int2` int(20) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`tzid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tzb
-- ----------------------------
INSERT INTO `t_tzb` VALUES ('32', '1', '28', '10000.00', '2018-01-22 20:05:51', '0.44', 'YRB1223', '23', null, null, null);
INSERT INTO `t_tzb` VALUES ('33', '31', '28', '20000.00', '2018-01-22 20:07:27', '0.44', 'YRB1223', '23', null, null, null);
INSERT INTO `t_tzb` VALUES ('34', '34', '28', '20000.00', '2018-01-22 20:08:39', '0.44', 'YRB1223', '23', null, null, null);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uname` varchar(20) DEFAULT NULL COMMENT '用户名',
  `upwd` varchar(100) DEFAULT NULL COMMENT '密码，进行MD5加密',
  `phone` char(11) DEFAULT NULL COMMENT '手机号码',
  `tzm` varchar(100) DEFAULT NULL COMMENT '推荐码',
  `idtype` varchar(20) DEFAULT NULL COMMENT '证件类型',
  `idno` char(18) DEFAULT NULL COMMENT '证件号（身份证号）',
  `zpwd` varchar(100) DEFAULT NULL COMMENT '支付密码',
  `email` varchar(30) DEFAULT NULL COMMENT '电子邮箱',
  `rname` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `tid` bigint(20) DEFAULT NULL COMMENT '推荐人id， t_recommend推荐人表主键id',
  `face` varchar(50) DEFAULT NULL COMMENT '头像',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别（0男，1女）',
  `isvip` tinyint(4) DEFAULT NULL COMMENT '是否为VIP用户，0是，1否',
  `state` bigint(20) DEFAULT NULL COMMENT '预留字段',
  `create_time` datetime DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '胡八一', '4QrcOUm6Wau+VuBX8g+IPg==', '17370134037', '12', '身份证', '360782199512236699', '4QrcOUm6Wau+VuBX8g+IPg==', '194484548@qq.com', '胡八一', '12', 'static/uploads/3.gif', '0', '1', '1', '2018-01-08 14:29:39');
INSERT INTO `t_user` VALUES ('28', '李云龙', '4QrcOUm6Wau+VuBX8g+IPg==', '15656565656', '346', '身份证', '362426199701232303', '4QrcOUm6Wau+VuBX8g+IPg==', '31293817812@qq.com', '李云龙', '36', 'static/uploads/3.gif', '0', '1', '1', '2017-12-13 14:29:25');
INSERT INTO `t_user` VALUES ('31', '李小龙', '4QrcOUm6Wau+VuBX8g+IPg==', '16548454548', '35', '身份证', '786456352432', '4QrcOUm6Wau+VuBX8g+IPg==', '2143@qq.com', '李小龙', null, null, '0', '1', '1', '2017-12-06 14:29:32');
INSERT INTO `t_user` VALUES ('33', '曾志湖', '4QrcOUm6Wau+VuBX8g+IPg==', '18720865791', '', '身份证', null, null, null, null, null, null, null, '1', '1', '2017-10-18 14:29:42');
INSERT INTO `t_user` VALUES ('34', '赖国荣', '4QrcOUm6Wau+VuBX8g+IPg==', '15448454545', '', '身份证', '412532144535465', '4QrcOUm6Wau+VuBX8g+IPg==', '313454690@qq.com', '赖国荣', null, 'static/uploads/23.jpg', '0', '1', '1', '2017-12-22 14:29:48');
INSERT INTO `t_user` VALUES ('35', 'Zachary', 'AWUR1AvvSFozwXrquCqMvw==', '18720733215', '', '身份证', null, null, null, null, null, null, null, '1', '1', '2017-12-22 14:29:53');
INSERT INTO `t_user` VALUES ('36', '胡歌', '4QrcOUm6Wau+VuBX8g+IPg==', '13145203344', 'b8824', '身份证', null, '4QrcOUm6Wau+VuBX8g+IPg==', null, null, null, 'static/uploads/1.jpg', null, '1', '1', '2018-01-05 20:35:00');
INSERT INTO `t_user` VALUES ('37', '陈', '4QrcOUm6Wau+VuBX8g+IPg==', '15270743951', '7e942', '身份证', '1214654465', '4QrcOUm6Wau+VuBX8g+IPg==', '4584@qq.com', '程哥', null, null, '0', null, '1', null);
INSERT INTO `t_user` VALUES ('38', '谢', '4QrcOUm6Wau+VuBX8g+IPg==', '15270743952', 'dead7', '身份证', '13254656569', null, '12264165@qq.com', '谢山', null, null, '0', null, '1', null);
INSERT INTO `t_user` VALUES ('43', '12', 'wgrU12/pd1mqJ6DJm/9nEA==', '17370134036', 'ce295', '身份证', null, null, null, null, null, 'static/uploads/105.jpg', null, '1', '2', null);
INSERT INTO `t_user` VALUES ('46', '彭于晏', '4QrcOUm6Wau+VuBX8g+IPg==', '15270743955', '6ca4e', '身份证', '4234565768768', '4QrcOUm6Wau+VuBX8g+IPg==', '15454@qq.com', '彭于晏', null, 'static/uploads/1.jpg', '0', null, '1', null);
INSERT INTO `t_user` VALUES ('47', '吴磊', '4QrcOUm6Wau+VuBX8g+IPg==', '15270743956', '1849b', '身份证', '16389898', '4QrcOUm6Wau+VuBX8g+IPg==', '635496485@qq.com', '吴磊', null, 'static/uploads/1.jpg', '0', null, '1', null);
INSERT INTO `t_user` VALUES ('48', '你好', '4QrcOUm6Wau+VuBX8g+IPg==', '15770783886', '153c2', '身份证', '432456565634523', '4QrcOUm6Wau+VuBX8g+IPg==', '1653544@qq.com', '你好', null, 'static/uploads/2.jpg', '0', '1', '1', null);
INSERT INTO `t_user` VALUES ('49', '123', 'ICy5YqxZB1uWSwcVLSNLcA==', '12345678900', '475e1', '身份证', null, null, null, null, null, null, null, '1', '1', null);
INSERT INTO `t_user` VALUES ('50', '真哥', '4QrcOUm6Wau+VuBX8g+IPg==', '15270640022', 'a9ac6', '身份证', '9867546345234123', '4QrcOUm6Wau+VuBX8g+IPg==', '1234659876@qq.com', '陈桢', null, null, '0', '1', '1', null);
INSERT INTO `t_user` VALUES ('51', '李四', '4QrcOUm6Wau+VuBX8g+IPg==', '15266634256', 'c2466', '身份证', null, null, null, null, null, null, null, '1', '1', null);
INSERT INTO `t_user` VALUES ('52', '吴宗杰', '4QrcOUm6Wau+VuBX8g+IPg==', '11111111111', '4dc76', '身份证', null, null, null, null, null, null, null, '1', '1', null);
INSERT INTO `t_user` VALUES ('54', 'aaaa', '4QrcOUm6Wau+VuBX8g+IPg==', '22222222222', '684bc', '身份证', null, null, null, null, null, null, null, '1', '1', null);
INSERT INTO `t_user` VALUES ('65', 'bbbb', '4QrcOUm6Wau+VuBX8g+IPg==', '33333333333', '423a3', '身份证', null, null, null, null, null, null, null, '1', '1', null);
INSERT INTO `t_user` VALUES ('66', 'cccc', '4QrcOUm6Wau+VuBX8g+IPg==', '44444444444', '8bac4', '身份证', null, null, null, null, null, null, null, '1', '1', null);
INSERT INTO `t_user` VALUES ('67', 'jjjj', '4QrcOUm6Wau+VuBX8g+IPg==', '99999999999', '29298', '身份证', null, null, null, null, null, null, null, '1', '1', null);
INSERT INTO `t_user` VALUES ('68', 'yyyy', '4QrcOUm6Wau+VuBX8g+IPg==', '66666666666', '5e15d', '身份证', null, null, null, null, null, null, null, '1', '1', null);
INSERT INTO `t_user` VALUES ('69', 'iiii', '4QrcOUm6Wau+VuBX8g+IPg==', '89898989899', '36d9b', '身份证', null, null, null, null, null, null, null, '1', '1', null);
INSERT INTO `t_user` VALUES ('70', 'tttt', 'gdyb21LQTcIANtvYMT7QVQ==', '44445555555', 'c4143', '身份证', null, null, null, null, null, null, null, '1', '1', null);
INSERT INTO `t_user` VALUES ('71', 'erer', '4QrcOUm6Wau+VuBX8g+IPg==', '23232323233', 'ab99c', '身份证', null, null, null, null, null, null, null, '1', '1', null);
INSERT INTO `t_user` VALUES ('72', 'qqqq', '4QrcOUm6Wau+VuBX8g+IPg==', '12122222221', 'a6241', '身份证', null, null, null, null, null, null, null, '1', '1', null);
INSERT INTO `t_user` VALUES ('73', 'rrrr', '4QrcOUm6Wau+VuBX8g+IPg==', '23454545451', '947e4', '身份证', null, null, null, null, null, null, null, '1', '1', null);
INSERT INTO `t_user` VALUES ('74', '17370134037', '4QrcOUm6Wau+VuBX8g+IPg==', '34343434343', '351b1', '身份证', null, null, null, null, null, null, null, '1', '1', null);
INSERT INTO `t_user` VALUES ('75', '17370134037', '4QrcOUm6Wau+VuBX8g+IPg==', '34343434343', '791d1', '身份证', null, null, null, null, null, null, null, '1', '1', null);
INSERT INTO `t_user` VALUES ('76', '17370134037', '4QrcOUm6Wau+VuBX8g+IPg==', '34343434343', '1d592', '身份证', null, null, null, null, null, null, null, '1', '1', null);
INSERT INTO `t_user` VALUES ('77', 'rtrt', '4QrcOUm6Wau+VuBX8g+IPg==', '3424344444', '953bb', '身份证', null, null, null, null, null, null, null, '1', '1', null);
INSERT INTO `t_user` VALUES ('78', '天王盖地虎', '4QrcOUm6Wau+VuBX8g+IPg==', '17370134030', '233a5', '身份证', null, null, null, null, null, null, null, '1', '1', null);
INSERT INTO `t_user` VALUES ('79', '小赖子', '4QrcOUm6Wau+VuBX8g+IPg==', '17370134026', '673d9', '身份证', '759293674234', '4QrcOUm6Wau+VuBX8g+IPg==', '7812217122@qq.com', '赖勇建', null, null, '0', '1', '1', null);

-- ----------------------------
-- Table structure for t_usermoney
-- ----------------------------
DROP TABLE IF EXISTS `t_usermoney`;
CREATE TABLE `t_usermoney` (
  `umid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `zmoney` decimal(10,2) DEFAULT NULL COMMENT '总资产',
  `kymoney` decimal(10,2) DEFAULT NULL COMMENT '可用余额',
  `symoney` decimal(10,2) DEFAULT NULL COMMENT '收益总额',
  `tzmoney` decimal(10,2) DEFAULT NULL COMMENT '投资总额',
  `djmoney` decimal(10,2) DEFAULT NULL COMMENT '冻结金额',
  `dsmoney` decimal(10,2) DEFAULT NULL COMMENT '待收金额',
  `jlmoney` decimal(20,2) DEFAULT NULL COMMENT '奖励金额',
  PRIMARY KEY (`umid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_usermoney
-- ----------------------------
INSERT INTO `t_usermoney` VALUES ('1', '1', '92333.34', '91233.34', '733.34', '10000.00', '0.00', '11100.00', '500.00');
INSERT INTO `t_usermoney` VALUES ('2', '28', '144500.01', '144500.01', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('3', '33', '100000.00', '100000.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('4', '31', '83933.33', '81733.33', '733.33', '20000.00', '0.00', '22200.00', '1000.00');
INSERT INTO `t_usermoney` VALUES ('5', '34', '83933.33', '81733.33', '733.33', '20000.00', '0.00', '22200.00', '1000.00');
INSERT INTO `t_usermoney` VALUES ('9', '76', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('10', '74', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('11', '75', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('12', '77', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('13', '47', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('14', '46', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('15', '78', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `t_usermoney` VALUES ('16', '79', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');

-- ----------------------------
-- Table structure for t_userticket
-- ----------------------------
DROP TABLE IF EXISTS `t_userticket`;
CREATE TABLE `t_userticket` (
  `ukid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) DEFAULT NULL COMMENT '前台用户id',
  `kid` bigint(20) DEFAULT NULL COMMENT '劵id',
  `tktime` date DEFAULT NULL COMMENT '领劵时间',
  `usestatus` tinyint(4) DEFAULT NULL COMMENT '使用状态（0未使用，1已使用，2已过期）',
  PRIMARY KEY (`ukid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userticket
-- ----------------------------
INSERT INTO `t_userticket` VALUES ('1', '1', '1', '2017-12-20', '2');
INSERT INTO `t_userticket` VALUES ('2', '1', '2', '2017-12-20', '1');
INSERT INTO `t_userticket` VALUES ('3', '1', '3', '2017-12-30', '1');
INSERT INTO `t_userticket` VALUES ('4', '1', '22', '2018-01-02', '0');
INSERT INTO `t_userticket` VALUES ('5', '1', '23', '2018-01-06', '0');
INSERT INTO `t_userticket` VALUES ('6', '54', '1', '2018-01-11', '2');
INSERT INTO `t_userticket` VALUES ('7', '54', '2', '2018-01-11', '0');
INSERT INTO `t_userticket` VALUES ('9', '65', '1', '2018-01-11', '2');
INSERT INTO `t_userticket` VALUES ('10', '65', '2', '2018-01-11', '0');
INSERT INTO `t_userticket` VALUES ('11', '65', '23', '2018-01-11', '0');
INSERT INTO `t_userticket` VALUES ('12', '65', '24', '2018-01-11', '0');
INSERT INTO `t_userticket` VALUES ('13', '66', '1', '2018-01-12', '2');
INSERT INTO `t_userticket` VALUES ('14', '66', '2', '2018-01-12', '0');
INSERT INTO `t_userticket` VALUES ('15', '66', '23', '2018-01-12', '0');
INSERT INTO `t_userticket` VALUES ('16', '67', '1', '2018-01-14', '2');
INSERT INTO `t_userticket` VALUES ('17', '67', '2', '2018-01-14', '0');
INSERT INTO `t_userticket` VALUES ('18', '68', '1', '2018-01-14', '2');
INSERT INTO `t_userticket` VALUES ('19', '68', '2', '2018-01-14', '0');
INSERT INTO `t_userticket` VALUES ('20', '69', '1', '2018-01-15', '2');
INSERT INTO `t_userticket` VALUES ('21', '69', '2', '2018-01-15', '0');
INSERT INTO `t_userticket` VALUES ('22', '70', '1', '2018-01-15', '2');
INSERT INTO `t_userticket` VALUES ('23', '70', '2', '2018-01-15', '0');
INSERT INTO `t_userticket` VALUES ('24', '70', '26', '2018-01-15', '0');
INSERT INTO `t_userticket` VALUES ('25', '71', '1', '2018-01-15', '2');
INSERT INTO `t_userticket` VALUES ('26', '71', '2', '2018-01-15', '0');
INSERT INTO `t_userticket` VALUES ('27', '71', '26', '2018-01-15', '0');
INSERT INTO `t_userticket` VALUES ('28', '72', '1', '2018-01-15', '2');
INSERT INTO `t_userticket` VALUES ('29', '72', '2', '2018-01-15', '0');
INSERT INTO `t_userticket` VALUES ('30', '72', '26', '2018-01-15', '0');
INSERT INTO `t_userticket` VALUES ('31', '73', '1', '2018-01-15', '2');
INSERT INTO `t_userticket` VALUES ('32', '73', '2', '2018-01-15', '0');
INSERT INTO `t_userticket` VALUES ('33', '73', '26', '2018-01-15', '0');
INSERT INTO `t_userticket` VALUES ('34', '75', '1', '2018-01-15', '2');
INSERT INTO `t_userticket` VALUES ('35', '76', '1', '2018-01-15', '2');
INSERT INTO `t_userticket` VALUES ('36', '74', '1', '2018-01-15', '2');
INSERT INTO `t_userticket` VALUES ('37', '75', '2', '2018-01-15', '0');
INSERT INTO `t_userticket` VALUES ('38', '74', '2', '2018-01-15', '0');
INSERT INTO `t_userticket` VALUES ('39', '75', '26', '2018-01-15', '0');
INSERT INTO `t_userticket` VALUES ('40', '76', '2', '2018-01-15', '0');
INSERT INTO `t_userticket` VALUES ('41', '74', '26', '2018-01-15', '0');
INSERT INTO `t_userticket` VALUES ('42', '76', '26', '2018-01-15', '0');
INSERT INTO `t_userticket` VALUES ('43', '77', '1', '2018-01-16', '2');
INSERT INTO `t_userticket` VALUES ('44', '77', '2', '2018-01-16', '0');
INSERT INTO `t_userticket` VALUES ('45', '78', '1', '2018-01-19', '0');
INSERT INTO `t_userticket` VALUES ('46', '78', '2', '2018-01-19', '0');
INSERT INTO `t_userticket` VALUES ('47', '79', '1', '2018-01-21', '0');
INSERT INTO `t_userticket` VALUES ('48', '79', '2', '2018-01-21', '1');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '1', '1');
INSERT INTO `t_user_role` VALUES ('2', '34', '3');
INSERT INTO `t_user_role` VALUES ('3', '35', '3');
INSERT INTO `t_user_role` VALUES ('4', '28', '1');
INSERT INTO `t_user_role` VALUES ('5', '36', '3');
INSERT INTO `t_user_role` VALUES ('6', '37', '3');
INSERT INTO `t_user_role` VALUES ('7', '38', '3');
INSERT INTO `t_user_role` VALUES ('8', '39', '3');
INSERT INTO `t_user_role` VALUES ('9', '40', '3');
INSERT INTO `t_user_role` VALUES ('10', '41', '3');
INSERT INTO `t_user_role` VALUES ('11', '42', '3');
INSERT INTO `t_user_role` VALUES ('12', '43', '3');
INSERT INTO `t_user_role` VALUES ('13', '44', '3');
INSERT INTO `t_user_role` VALUES ('14', '45', '3');
INSERT INTO `t_user_role` VALUES ('15', '46', '3');
INSERT INTO `t_user_role` VALUES ('16', '47', '3');
INSERT INTO `t_user_role` VALUES ('17', '48', '3');
INSERT INTO `t_user_role` VALUES ('18', '49', '3');
INSERT INTO `t_user_role` VALUES ('19', '50', '3');
INSERT INTO `t_user_role` VALUES ('20', '51', '3');
INSERT INTO `t_user_role` VALUES ('21', '52', '3');
INSERT INTO `t_user_role` VALUES ('22', '53', '3');
INSERT INTO `t_user_role` VALUES ('23', '54', '3');
INSERT INTO `t_user_role` VALUES ('24', '55', '3');
INSERT INTO `t_user_role` VALUES ('25', '56', '3');
INSERT INTO `t_user_role` VALUES ('26', '57', '3');
INSERT INTO `t_user_role` VALUES ('27', '58', '3');
INSERT INTO `t_user_role` VALUES ('28', '59', '3');
INSERT INTO `t_user_role` VALUES ('29', '60', '3');
INSERT INTO `t_user_role` VALUES ('30', '61', '3');
INSERT INTO `t_user_role` VALUES ('31', '62', '3');
INSERT INTO `t_user_role` VALUES ('32', '63', '3');
INSERT INTO `t_user_role` VALUES ('33', '64', '3');
INSERT INTO `t_user_role` VALUES ('34', '65', '3');
INSERT INTO `t_user_role` VALUES ('35', '66', '3');
INSERT INTO `t_user_role` VALUES ('36', '67', '3');
INSERT INTO `t_user_role` VALUES ('37', '68', '3');
INSERT INTO `t_user_role` VALUES ('38', '69', '3');
INSERT INTO `t_user_role` VALUES ('39', '70', '3');
INSERT INTO `t_user_role` VALUES ('40', '71', '3');
INSERT INTO `t_user_role` VALUES ('41', '72', '3');
INSERT INTO `t_user_role` VALUES ('42', '73', '3');
INSERT INTO `t_user_role` VALUES ('43', '76', '3');
INSERT INTO `t_user_role` VALUES ('44', '75', '3');
INSERT INTO `t_user_role` VALUES ('45', '74', '3');
INSERT INTO `t_user_role` VALUES ('46', '77', '3');
INSERT INTO `t_user_role` VALUES ('47', '31', '3');
INSERT INTO `t_user_role` VALUES ('48', '78', '3');
INSERT INTO `t_user_role` VALUES ('49', '79', '3');

-- ----------------------------
-- Table structure for t_ydate
-- ----------------------------
DROP TABLE IF EXISTS `t_ydate`;
CREATE TABLE `t_ydate` (
  `yid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `date` date DEFAULT NULL COMMENT '生成时间',
  `tmoney` decimal(10,2) DEFAULT NULL COMMENT '交易总额',
  `mmoney` decimal(10,2) DEFAULT NULL COMMENT '月交易总额',
  `tuser` int(11) DEFAULT NULL COMMENT '总用户数',
  `muser` int(11) DEFAULT NULL COMMENT '月用户数',
  `ttzno` int(11) DEFAULT NULL COMMENT '总投资人数',
  `mtzno` int(11) DEFAULT NULL COMMENT '月投资人数',
  `tdkno` int(11) DEFAULT NULL COMMENT '总贷款人数',
  `mdkno` int(11) DEFAULT NULL COMMENT '月贷款人数',
  `tdkbno` int(11) DEFAULT NULL COMMENT '总贷款笔数',
  `mdkbno` int(11) DEFAULT NULL COMMENT '月贷款笔数',
  PRIMARY KEY (`yid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ydate
-- ----------------------------
INSERT INTO `t_ydate` VALUES ('1', '2017-05-31', '30000.00', '10000.00', '300000', '300', '300000', '300', '3000', '300', '3000', '300');
INSERT INTO `t_ydate` VALUES ('2', '2017-06-30', '40000.00', '20000.00', '400000', '400', '400000', '400', '4000', '400', '4000', '400');
INSERT INTO `t_ydate` VALUES ('3', '2017-07-31', '50000.00', '30000.00', '500000', '500', '500000', '500', '5000', '500', '5000', '500');
INSERT INTO `t_ydate` VALUES ('4', '2017-08-31', '60000.00', '40000.00', '600000', '600', '600000', '600', '6000', '600', '6000', '600');
INSERT INTO `t_ydate` VALUES ('5', '2017-09-30', '70000.00', '50000.00', '700000', '700', '700000', '700', '7000', '700', '7000', '700');
INSERT INTO `t_ydate` VALUES ('6', '2017-10-31', '80000.00', '60000.00', '800000', '800', '800000', '800', '8000', '800', '8000', '800');
INSERT INTO `t_ydate` VALUES ('7', '2017-11-30', '90000.00', '90000.00', '900000', '900', '900000', '900', '9000', '900', '9000', '900');
INSERT INTO `t_ydate` VALUES ('8', '2017-12-31', '343710.00', '28710.00', '2032', '132', '13300', '132', '425', '234', '834', '443');
