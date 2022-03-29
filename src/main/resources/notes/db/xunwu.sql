SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP DATABASE IF EXISTS `xunwu`;
CREATE DATABASE `xunwu`;
USE `xunwu`;

-- ----------------------------
--  Table structure for `support_address`
-- ----------------------------
DROP TABLE IF EXISTS `support_address`;
CREATE TABLE `support_address` (
                                   `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                                   `belong_to` varchar(32) NOT NULL DEFAULT '0' COMMENT '上一级行政单位名',
                                   `en_name` varchar(32) NOT NULL COMMENT '行政单位英文名缩写',
                                   `cn_name` varchar(32) NOT NULL COMMENT '行政单位中文名',
                                   `level` varchar(16) NOT NULL COMMENT '行政级别 市-city 地区-region',
                                   `baidu_map_lng` double NOT NULL COMMENT '百度地图经度',
                                   `baidu_map_lat` double NOT NULL COMMENT '百度地图纬度',
                                   PRIMARY KEY (`id`),
                                   UNIQUE KEY `unique_en_name_and_belong_to` (`en_name`,`level`,`belong_to`) USING BTREE COMMENT '每个城市的英文名都是独一无二的'
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `support_address`
-- ----------------------------
BEGIN;
INSERT INTO `support_address` VALUES ('4', 'bj', 'bj', '北京', 'city', '116.395645', '39.929986'), ('5', 'sh', 'sh', '上海', 'city', '121.487899', '31.249162'), ('6', 'hb', 'sjz', '石家庄', 'city', '114.522082', '38.048958'), ('7', 'hb', 'ts', '唐山', 'city', '118.183451', '39.650531'), ('8', 'hb', 'hd', '邯郸', 'city', '114.482694', '36.609308'), ('9', 'bj', 'dcq', '东城区', 'region', '116.42188470126446', '39.93857401298612'), ('10', 'bj', 'xcq', '西城区', 'region', '116.37319010401802', '39.93428014370851'), ('12', 'bj', 'hdq', '海淀区', 'region', '116.23967780102151', '40.03316204507791'), ('13', 'bj', 'cpq', '昌平区', 'region', '116.21645635689414', '40.2217235498323'), ('14', 'sh', 'ptq', '普陀区', 'region', '121.39844294374956', '31.263742929075534'), ('15', 'sjz', 'caq', '长安区', 'region', '114.59262155387033', '38.07687479578663'), ('16', 'sjz', 'qdq', '桥东区', 'region', '114.51078430496142', '38.06338975380927'), ('17', 'sjz', 'qxq', '桥西区', 'region', '114.43813995531943', '38.033364550068136'), ('18', 'sjz', 'xhq', '新华区', 'region', '114.4535014286928', '38.117218640478164'), ('19', 'bj', 'cyq', '朝阳区', 'region', '116.52169489108084', '39.95895316640668');
COMMIT;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
                        `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户唯一id',
                        `name` varchar(32) DEFAULT NULL COMMENT '用户名',
                        `email` varchar(32) DEFAULT NULL COMMENT '电子邮箱',
                        `phone_number` varchar(15) NOT NULL COMMENT '电话号码',
                        `password` varchar(32) DEFAULT NULL COMMENT '密码',
                        `status` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '用户状态 0-正常 1-封禁',
                        `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户账号创建时间',
                        `last_login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上次登录时间',
                        `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次更新记录时间',
                        `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `index_on_phone` (`phone_number`) USING BTREE COMMENT '用户手机号',
                        UNIQUE KEY `index_on_username` (`name`) USING BTREE COMMENT '用户名索引',
                        UNIQUE KEY `index_on_email` (`email`) USING BTREE COMMENT '电子邮箱索引'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='用户基本信息表';

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', 'waliwali', 'wali@wali.com', '15111111111', '6fd1aad88b038aeecd9adeccc92b0bd1', '1', '2017-08-25 15:18:20', '2017-08-25 12:00:00', '2017-11-26 10:29:02', 'http://7xo6gy.com1.z0.glb.clouddn.com/99ff568bd61c744bf31185aeddf13580.png'), ('2', 'admin', 'admin@imooc.com', '1388888888', '55b3d0936a3fb63168d57a6bda0ddbbf', '1', '2017-08-27 09:07:05', '2017-08-27 09:07:07', '2017-10-21 15:03:57', 'http://7xo6gy.com1.z0.glb.clouddn.com/99ff568bd61c744bf31185aeddf13580.png'), ('5', '138****8888', null, '13888888888', null, '0', '2017-11-25 17:56:45', '2017-11-25 17:56:45', '2017-11-25 17:56:45', null), ('8', '151****9677', null, '15110059677', null, '0', '2017-11-25 18:58:18', '2017-11-25 18:58:18', '2017-11-25 18:58:18', null);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;


-- ----------------------------
--  Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
                        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                        `user_id` int(11) unsigned NOT NULL COMMENT '用户id',
                        `name` varchar(32) NOT NULL COMMENT '用户角色名',
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `user_id_and_name` (`user_id`,`name`) USING BTREE,
                        KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='用户角色表';

-- ----------------------------
--  Records of `role`
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES ('1', '1', 'USER'), ('2', '2', 'ADMIN'), ('3', '3', 'USER'), ('4', '4', 'USER'), ('5', '5', 'USER'), ('6', '6', 'USER'), ('7', '7', 'USER'), ('8', '8', 'USER');
COMMIT;


-- ----------------------------
--  Table structure for `house`
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'house唯一标识',
                         `title` varchar(32) NOT NULL,
                         `price` int(11) unsigned NOT NULL COMMENT '价格',
                         `area` int(11) unsigned NOT NULL COMMENT '面积',
                         `room` int(11) unsigned NOT NULL COMMENT '卧室数量',
                         `floor` int(11) unsigned NOT NULL COMMENT '楼层',
                         `total_floor` int(11) unsigned NOT NULL COMMENT '总楼层',
                         `watch_times` int(11) unsigned DEFAULT '0' COMMENT '被看次数',
                         `build_year` int(4) NOT NULL COMMENT '建立年限',
                         `status` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '房屋状态 0-未审核 1-审核通过 2-已出租 3-逻辑删除',
                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                         `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最近数据更新时间',
                         `city_en_name` varchar(32) NOT NULL COMMENT '城市标记缩写 如 北京bj',
                         `region_en_name` varchar(255) NOT NULL COMMENT '地区英文简写 如昌平区 cpq',
                         `cover` varchar(32) DEFAULT NULL COMMENT '封面',
                         `direction` int(11) NOT NULL COMMENT '房屋朝向',
                         `distance_to_subway` int(11) NOT NULL DEFAULT '-1' COMMENT '距地铁距离 默认-1 附近无地铁',
                         `parlour` int(11) NOT NULL DEFAULT '0' COMMENT '客厅数量',
                         `district` varchar(32) NOT NULL COMMENT '所在小区',
                         `admin_id` int(11) NOT NULL COMMENT '所属管理员id',
                         `bathroom` int(11) NOT NULL DEFAULT '0',
                         `street` varchar(32) NOT NULL COMMENT '街道',
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COMMENT='房屋信息表';

-- ----------------------------
--  Records of `house`
-- ----------------------------
BEGIN;
INSERT INTO `house` VALUES ('15', '富力城 国贸CBD 时尚休闲 商务办公', '6200', '70', '2', '10', '20', '2', '2005', '1', '2017-09-06 18:56:14', '2017-12-03 11:13:46', 'bj', 'hdq', 'Fhxz_c16YmEmIz5UVxrp6ihwbvCk', '2', '10', '1', '融泽嘉园', '2', '0', '龙域西二路'), ('16', '富力城 国贸CBD 时尚休闲 商务办公', '6300', '70', '2', '10', '20', '0', '2012', '1', '2017-09-06 19:53:35', '2017-12-03 11:13:42', 'bj', 'hdq', 'FvkO1FFyGbrxCP_1O9tA94u2qvbP', '1', '-1', '1', '融泽嘉园', '2', '0', '龙域西二路'), ('17', '二环东直门地铁站附近、王府井、天安门、国贸、三里屯、南锣鼓巷', '3000', '35', '1', '5', '10', '2', '2013', '1', '2017-09-06 20:45:35', '2017-12-03 11:13:36', 'bj', 'hdq', 'FpVYJRsLykrBRyUSCEOeqsqWU-bt', '1', '200', '0', '融泽嘉园', '2', '0', '龙域西二路'), ('18', '华贸城 东向一居挑空loft 干净温馨 随时可以签约', '5700', '52', '1', '7', '20', '0', '2012', '1', '2017-09-06 21:01:02', '2017-12-03 11:13:30', 'bj', 'hdq', 'Fl1lNikhmMIecbTn-JTsurxugtFU', '2', '1085', '1', '融泽嘉园', '2', '0', '龙域西二路'), ('19', '望春园板楼三居室 自住精装 南北通透 采光好视野棒！', '9200', '132', '3', '6', '14', '0', '2005', '1', '2017-09-06 22:44:25', '2017-12-03 11:13:25', 'bj', 'hdq', 'Fp1xPKVYtPsCeVHVQVW0Hif2FXk7', '2', '1108', '2', '融泽嘉园', '2', '0', '龙域西二路'), ('20', '高大上的整租两居室 业主诚意出租', '5400', '56', '2', '12', '20', '0', '2012', '1', '2017-09-06 23:39:50', '2017-12-03 11:13:20', 'bj', 'hdq', 'FvVqU8LneZZ5xaLBAOM1KXR2Pz1X', '2', '-1', '1', '融泽嘉园', '2', '0', '龙域西二路'), ('21', '新康园 正规三居室 精装修 家电家具齐全', '1900', '18', '1', '13', '25', '0', '2012', '1', '2017-09-07 00:52:47', '2017-12-03 11:13:15', 'bj', 'hdq', 'FnuOFbFtDYTbpPdFoZthR-R0tszC', '3', '1302', '0', '融泽嘉园', '2', '0', '龙域西二路'), ('24', '湖光壹号望京华府183-387㎡阔景大宅', '50000', '288', '5', '1', '1', '0', '2015', '1', '2017-09-07 11:42:20', '2017-12-03 11:13:10', 'bj', 'hdq', 'FvVqU8LneZZ5xaLBAOM1KXR2Pz1X', '5', '200', '3', '融泽嘉园', '2', '0', '龙域西二路'), ('25', '测试房源-编辑', '3000', '59', '2', '10', '20', '0', '2010', '3', '2017-10-28 22:34:48', '2017-11-11 12:22:50', 'bj', 'cpq', 'FtbxR2LY98lnnX_TPOgOPzti3k7G', '2', '1000', '1', '融泽嘉园', '2', '0', '龙域中街');
COMMIT;
