/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : world

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 14/12/2022 18:58:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ums_user_admin
-- ----------------------------
DROP TABLE IF EXISTS `ums_user_admin`;
CREATE TABLE `ums_user_admin`  (
  `id` bigint(20) NOT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `login_time` datetime(6) NULL DEFAULT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_user_admin
-- ----------------------------
INSERT INTO `ums_user_admin` VALUES (1, '2022-08-29 10:03:04.405000', '2022-09-24 11:50:19.935000', '190', 'https://avatars.githubusercontent.com/u/26395835?v=4', '2022-09-24 11:50:19.906000', 'wy', 'q', '$2a$10$VofkbhLA3CvOgbR5qFFPYOnQrA8i2u.JdUs.FQCVnM5GFPhHr1Eqy', 1, 'admin');
INSERT INTO `ums_user_admin` VALUES (89, '2022-09-01 16:27:00.694000', '2022-09-01 16:30:01.227000', '1903372529@qq.com', NULL, '2022-09-01 16:27:17.927000', '王渔', NULL, '$2a$10$g74GJiUQaHhUBUufq6X/h.cUMOejxXFcTi.eCWBEMGnG2FjUnPTwa', 0, 'wangyu');
INSERT INTO `ums_user_admin` VALUES (92, '2022-09-01 16:29:26.629000', '2022-09-01 16:29:26.629000', '', NULL, NULL, '升而', NULL, '$2a$10$yX4ydUtMzrgNZDgnFS.sCOV3zTo7luLOGRXl3OU32ItlqMI6kAR/6', 1, 'qwshenger');

-- ----------------------------
-- Table structure for ums_roles_resources
-- ----------------------------
DROP TABLE IF EXISTS `ums_roles_resources`;
CREATE TABLE `ums_roles_resources`  (
  `resource_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`resource_id`, `role_id`) USING BTREE,
  INDEX `FKkqtu1op0ivlm5ae3g0ljh7t83`(`role_id`) USING BTREE,
  CONSTRAINT `FKkqtu1op0ivlm5ae3g0ljh7t83` FOREIGN KEY (`role_id`) REFERENCES `ums_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKodd7lwgxteyp2626bgtcgy39b` FOREIGN KEY (`resource_id`) REFERENCES `ums_resource` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_roles_resources
-- ----------------------------
INSERT INTO `ums_roles_resources` VALUES (1, 1);
INSERT INTO `ums_roles_resources` VALUES (2, 1);
INSERT INTO `ums_roles_resources` VALUES (4, 1);
INSERT INTO `ums_roles_resources` VALUES (5, 1);
INSERT INTO `ums_roles_resources` VALUES (6, 1);
INSERT INTO `ums_roles_resources` VALUES (23, 1);
INSERT INTO `ums_roles_resources` VALUES (24, 1);
INSERT INTO `ums_roles_resources` VALUES (8, 2);
INSERT INTO `ums_roles_resources` VALUES (9, 2);
INSERT INTO `ums_roles_resources` VALUES (10, 2);
INSERT INTO `ums_roles_resources` VALUES (11, 2);
INSERT INTO `ums_roles_resources` VALUES (12, 2);
INSERT INTO `ums_roles_resources` VALUES (1, 5);
INSERT INTO `ums_roles_resources` VALUES (2, 5);
INSERT INTO `ums_roles_resources` VALUES (4, 5);
INSERT INTO `ums_roles_resources` VALUES (5, 5);
INSERT INTO `ums_roles_resources` VALUES (6, 5);
INSERT INTO `ums_roles_resources` VALUES (8, 5);
INSERT INTO `ums_roles_resources` VALUES (9, 5);
INSERT INTO `ums_roles_resources` VALUES (10, 5);
INSERT INTO `ums_roles_resources` VALUES (11, 5);
INSERT INTO `ums_roles_resources` VALUES (12, 5);
INSERT INTO `ums_roles_resources` VALUES (13, 5);
INSERT INTO `ums_roles_resources` VALUES (14, 5);
INSERT INTO `ums_roles_resources` VALUES (15, 5);
INSERT INTO `ums_roles_resources` VALUES (16, 5);
INSERT INTO `ums_roles_resources` VALUES (17, 5);
INSERT INTO `ums_roles_resources` VALUES (18, 5);
INSERT INTO `ums_roles_resources` VALUES (19, 5);
INSERT INTO `ums_roles_resources` VALUES (20, 5);
INSERT INTO `ums_roles_resources` VALUES (21, 5);
INSERT INTO `ums_roles_resources` VALUES (22, 5);
INSERT INTO `ums_roles_resources` VALUES (23, 5);
INSERT INTO `ums_roles_resources` VALUES (24, 5);
INSERT INTO `ums_roles_resources` VALUES (25, 5);
INSERT INTO `ums_roles_resources` VALUES (26, 5);
INSERT INTO `ums_roles_resources` VALUES (27, 5);
INSERT INTO `ums_roles_resources` VALUES (28, 5);
INSERT INTO `ums_roles_resources` VALUES (29, 5);

-- ----------------------------
-- Table structure for ums_roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `ums_roles_menus`;
CREATE TABLE `ums_roles_menus`  (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
  INDEX `FK66co71g4840efcxjuixqmkqyj`(`menu_id`) USING BTREE,
  CONSTRAINT `FK66co71g4840efcxjuixqmkqyj` FOREIGN KEY (`menu_id`) REFERENCES `ums_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK6w9pjcqadpblbv2n4t37iqj6f` FOREIGN KEY (`role_id`) REFERENCES `ums_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_roles_menus
-- ----------------------------
INSERT INTO `ums_roles_menus` VALUES (1, 1);
INSERT INTO `ums_roles_menus` VALUES (5, 1);
INSERT INTO `ums_roles_menus` VALUES (1, 2);
INSERT INTO `ums_roles_menus` VALUES (5, 2);
INSERT INTO `ums_roles_menus` VALUES (1, 3);
INSERT INTO `ums_roles_menus` VALUES (5, 3);
INSERT INTO `ums_roles_menus` VALUES (1, 4);
INSERT INTO `ums_roles_menus` VALUES (5, 4);
INSERT INTO `ums_roles_menus` VALUES (1, 5);
INSERT INTO `ums_roles_menus` VALUES (5, 5);
INSERT INTO `ums_roles_menus` VALUES (1, 6);
INSERT INTO `ums_roles_menus` VALUES (5, 6);
INSERT INTO `ums_roles_menus` VALUES (2, 7);
INSERT INTO `ums_roles_menus` VALUES (5, 7);
INSERT INTO `ums_roles_menus` VALUES (2, 8);
INSERT INTO `ums_roles_menus` VALUES (5, 8);
INSERT INTO `ums_roles_menus` VALUES (2, 9);
INSERT INTO `ums_roles_menus` VALUES (5, 9);
INSERT INTO `ums_roles_menus` VALUES (2, 10);
INSERT INTO `ums_roles_menus` VALUES (5, 10);
INSERT INTO `ums_roles_menus` VALUES (2, 11);
INSERT INTO `ums_roles_menus` VALUES (5, 11);
INSERT INTO `ums_roles_menus` VALUES (5, 12);
INSERT INTO `ums_roles_menus` VALUES (5, 13);
INSERT INTO `ums_roles_menus` VALUES (5, 14);
INSERT INTO `ums_roles_menus` VALUES (5, 16);
INSERT INTO `ums_roles_menus` VALUES (5, 17);
INSERT INTO `ums_roles_menus` VALUES (5, 18);
INSERT INTO `ums_roles_menus` VALUES (5, 19);
INSERT INTO `ums_roles_menus` VALUES (5, 20);
INSERT INTO `ums_roles_menus` VALUES (5, 21);
INSERT INTO `ums_roles_menus` VALUES (5, 22);
INSERT INTO `ums_roles_menus` VALUES (5, 23);
INSERT INTO `ums_roles_menus` VALUES (5, 24);
INSERT INTO `ums_roles_menus` VALUES (5, 25);

-- ----------------------------
-- Table structure for ums_role
-- ----------------------------
DROP TABLE IF EXISTS `ums_role`;
CREATE TABLE `ums_role`  (
  `id` bigint(20) NOT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  `admin_count` int(11) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_role
-- ----------------------------
INSERT INTO `ums_role` VALUES (1, '2020-02-03 16:50:37.000000', NULL, 0, '只能查看及操作商品', '商品管理员', 0, 1);
INSERT INTO `ums_role` VALUES (2, '2018-09-30 15:53:45.000000', NULL, 0, '只能查看及操作订单', '订单管理员', 0, 1);
INSERT INTO `ums_role` VALUES (5, '2020-02-02 15:11:05.000000', NULL, 0, '拥有所有查看和操作功能', '超级管理员', 0, 1);

-- ----------------------------
-- Table structure for ums_resource_category
-- ----------------------------
DROP TABLE IF EXISTS `ums_resource_category`;
CREATE TABLE `ums_resource_category`  (
  `id` bigint(20) NOT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_resource_category
-- ----------------------------
INSERT INTO `ums_resource_category` VALUES (1, '2020-02-05 10:21:44.000000', NULL, '商品模块', 0);
INSERT INTO `ums_resource_category` VALUES (2, '2020-02-05 10:22:34.000000', NULL, '订单模块', 0);
INSERT INTO `ums_resource_category` VALUES (3, '2020-02-05 10:22:48.000000', NULL, '营销模块', 0);
INSERT INTO `ums_resource_category` VALUES (4, '2020-02-05 10:23:04.000000', NULL, '权限模块', 0);
INSERT INTO `ums_resource_category` VALUES (5, '2020-02-07 16:34:27.000000', NULL, '内容模块', 0);
INSERT INTO `ums_resource_category` VALUES (6, '2020-02-07 16:35:49.000000', NULL, '其他模块', 0);

-- ----------------------------
-- Table structure for ums_resource
-- ----------------------------
DROP TABLE IF EXISTS `ums_resource`;
CREATE TABLE `ums_resource`  (
  `id` bigint(20) NOT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  `category_id` bigint(20) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_resource
-- ----------------------------
INSERT INTO `ums_resource` VALUES (1, '2020-02-04 17:04:55.000000', NULL, 1, NULL, '商品品牌管理', '/brand/**');
INSERT INTO `ums_resource` VALUES (2, '2020-02-04 17:05:35.000000', NULL, 1, NULL, '商品属性分类管理', '/productAttribute/**');
INSERT INTO `ums_resource` VALUES (3, '2020-02-04 17:06:13.000000', NULL, 1, NULL, '商品属性管理', '/productAttribute/**');
INSERT INTO `ums_resource` VALUES (4, '2020-02-04 17:07:15.000000', NULL, 1, NULL, '商品分类管理', '/productCategory/**');
INSERT INTO `ums_resource` VALUES (5, '2020-02-04 17:09:16.000000', NULL, 1, NULL, '商品管理', '/product/**');
INSERT INTO `ums_resource` VALUES (6, '2020-02-04 17:09:53.000000', NULL, 1, NULL, '商品库存管理', '/sku/**');
INSERT INTO `ums_resource` VALUES (8, '2020-02-05 14:43:37.000000', NULL, 2, '', '订单管理', '/order/**');
INSERT INTO `ums_resource` VALUES (9, '2020-02-05 14:44:22.000000', NULL, 2, '', '订单退货申请管理', '/returnApply/**');
INSERT INTO `ums_resource` VALUES (10, '2020-02-05 14:45:08.000000', NULL, 2, '', '退货原因管理', '/returnReason/**');
INSERT INTO `ums_resource` VALUES (11, '2020-02-05 14:45:43.000000', NULL, 2, '', '订单设置管理', '/orderSetting/**');
INSERT INTO `ums_resource` VALUES (12, '2020-02-05 14:46:23.000000', NULL, 2, '', '收货地址管理', '/companyAddress/**');
INSERT INTO `ums_resource` VALUES (13, '2020-02-07 16:37:22.000000', NULL, 3, '', '优惠券管理', '/coupon/**');
INSERT INTO `ums_resource` VALUES (14, '2020-02-07 16:37:59.000000', NULL, 3, '', '优惠券领取记录管理', '/couponHistory/**');
INSERT INTO `ums_resource` VALUES (15, '2020-02-07 16:38:28.000000', NULL, 3, '', '限时购活动管理', '/flash/**');
INSERT INTO `ums_resource` VALUES (16, '2020-02-07 16:38:59.000000', NULL, 3, '', '限时购商品关系管理', '/flashProductRelation/**');
INSERT INTO `ums_resource` VALUES (17, '2020-02-07 16:39:22.000000', NULL, 3, '', '限时购场次管理', '/flashSession/**');
INSERT INTO `ums_resource` VALUES (18, '2020-02-07 16:40:07.000000', NULL, 3, '', '首页轮播广告管理', '/home/advertise/**');
INSERT INTO `ums_resource` VALUES (19, '2020-02-07 16:40:34.000000', NULL, 3, '', '首页品牌管理', '/home/brand/**');
INSERT INTO `ums_resource` VALUES (20, '2020-02-07 16:41:06.000000', NULL, 3, '', '首页新品管理', '/home/newProduct/**');
INSERT INTO `ums_resource` VALUES (21, '2020-02-07 16:42:16.000000', NULL, 3, '', '首页人气推荐管理', '/home/recommendProduct/**');
INSERT INTO `ums_resource` VALUES (22, '2020-02-07 16:42:48.000000', NULL, 3, '', '首页专题推荐管理', '/home/recommendSubject/**');
INSERT INTO `ums_resource` VALUES (23, '2020-02-07 16:44:56.000000', NULL, 5, '', '商品优选管理', '/prefrenceArea/**');
INSERT INTO `ums_resource` VALUES (24, '2020-02-07 16:45:39.000000', NULL, 5, '', '商品专题管理', '/subject/**');
INSERT INTO `ums_resource` VALUES (25, '2020-02-07 16:47:34.000000', NULL, 4, '', '后台用户管理', '/admin/**');
INSERT INTO `ums_resource` VALUES (26, '2020-02-07 16:48:24.000000', NULL, 4, '', '后台用户角色管理', '/role/**');
INSERT INTO `ums_resource` VALUES (27, '2020-02-07 16:48:48.000000', NULL, 4, '', '后台菜单管理', '/menu/**');
INSERT INTO `ums_resource` VALUES (28, '2020-02-07 16:49:18.000000', NULL, 4, '', '后台资源分类管理', '/resourceCategory/**');
INSERT INTO `ums_resource` VALUES (29, '2020-02-07 16:49:45.000000', NULL, 4, '', '后台资源管理', '/resource/**');

-- ----------------------------
-- Table structure for ums_menu
-- ----------------------------
DROP TABLE IF EXISTS `ums_menu`;
CREATE TABLE `ums_menu`  (
  `id` bigint(20) NOT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  `hidden` int(11) NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_menu
-- ----------------------------
INSERT INTO `ums_menu` VALUES (1, '2020-02-02 14:50:36.000000', '2022-09-24 11:50:53.478000', 0, 'product', 0, 'pms', 0, 0, '商品');
INSERT INTO `ums_menu` VALUES (2, '2020-02-02 14:51:50.000000', NULL, 0, 'product-list', 1, 'product', 1, 0, '商品列表');
INSERT INTO `ums_menu` VALUES (3, '2020-02-02 14:52:44.000000', NULL, 0, 'product-add', 1, 'addProduct', 1, 0, '添加商品');
INSERT INTO `ums_menu` VALUES (4, '2020-02-02 14:53:51.000000', NULL, 0, 'product-cate', 1, 'productCate', 1, 0, '商品分类');
INSERT INTO `ums_menu` VALUES (5, '2020-02-02 14:54:51.000000', NULL, 0, 'product-attr', 1, 'productAttr', 1, 0, '商品类型');
INSERT INTO `ums_menu` VALUES (6, '2020-02-02 14:56:29.000000', NULL, 0, 'product-brand', 1, 'brand', 1, 0, '品牌管理');
INSERT INTO `ums_menu` VALUES (7, '2020-02-02 16:54:07.000000', NULL, 0, 'order', 0, 'oms', 0, 0, '订单');
INSERT INTO `ums_menu` VALUES (8, '2020-02-02 16:55:18.000000', NULL, 0, 'product-list', 1, 'order', 7, 0, '订单列表');
INSERT INTO `ums_menu` VALUES (9, '2020-02-02 16:56:46.000000', NULL, 0, 'order-setting', 1, 'orderSetting', 7, 0, '订单设置');
INSERT INTO `ums_menu` VALUES (10, '2020-02-02 16:57:39.000000', NULL, 0, 'order-return', 1, 'returnApply', 7, 0, '退货申请处理');
INSERT INTO `ums_menu` VALUES (11, '2020-02-02 16:59:40.000000', NULL, 0, 'order-return-reason', 1, 'returnReason', 7, 0, '退货原因设置');
INSERT INTO `ums_menu` VALUES (12, '2020-02-04 16:18:00.000000', NULL, 0, 'sms', 0, 'sms', 0, 0, '营销');
INSERT INTO `ums_menu` VALUES (13, '2020-02-04 16:19:22.000000', NULL, 0, 'sms-flash', 1, 'flash', 12, 0, '秒杀活动列表');
INSERT INTO `ums_menu` VALUES (14, '2020-02-04 16:20:16.000000', NULL, 0, 'sms-coupon', 1, 'coupon', 12, 0, '优惠券列表');
INSERT INTO `ums_menu` VALUES (16, '2020-02-07 16:22:38.000000', NULL, 0, 'product-brand', 1, 'homeBrand', 12, 0, '品牌推荐');
INSERT INTO `ums_menu` VALUES (17, '2020-02-07 16:23:14.000000', NULL, 0, 'sms-new', 1, 'homeNew', 12, 0, '新品推荐');
INSERT INTO `ums_menu` VALUES (18, '2020-02-07 16:26:38.000000', NULL, 0, 'sms-hot', 1, 'homeHot', 12, 0, '人气推荐');
INSERT INTO `ums_menu` VALUES (19, '2020-02-07 16:28:16.000000', NULL, 0, 'sms-subject', 1, 'homeSubject', 12, 0, '专题推荐');
INSERT INTO `ums_menu` VALUES (20, '2020-02-07 16:28:42.000000', NULL, 0, 'sms-ad', 1, 'homeAdvertise', 12, 0, '广告列表');
INSERT INTO `ums_menu` VALUES (21, '2020-02-07 16:29:13.000000', NULL, 0, 'ums', 0, 'ums', 0, 0, '权限');
INSERT INTO `ums_menu` VALUES (22, '2020-02-07 16:29:51.000000', NULL, 0, 'ums-admin', 1, 'admin', 21, 0, '用户列表');
INSERT INTO `ums_menu` VALUES (23, '2020-02-07 16:30:13.000000', NULL, 0, 'ums-role', 1, 'role', 21, 0, '角色列表');
INSERT INTO `ums_menu` VALUES (24, '2020-02-07 16:30:53.000000', NULL, 0, 'ums-menu', 1, 'menu', 21, 0, '菜单列表');
INSERT INTO `ums_menu` VALUES (25, '2020-02-07 16:31:13.000000', NULL, 0, 'ums-resource', 1, 'resource', 21, 0, '资源列表');

-- ----------------------------
-- Table structure for ums_admins_roles
-- ----------------------------
DROP TABLE IF EXISTS `ums_admins_roles`;
CREATE TABLE `ums_admins_roles`  (
  `admin_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  INDEX `FK12o1u4woro3gwafew9qrn1ow0`(`role_id`) USING BTREE,
  INDEX `FKidj5plth7ciqhcr3rj9yu62o8`(`admin_id`) USING BTREE,
  CONSTRAINT `FK12o1u4woro3gwafew9qrn1ow0` FOREIGN KEY (`role_id`) REFERENCES `ums_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKidj5plth7ciqhcr3rj9yu62o8` FOREIGN KEY (`admin_id`) REFERENCES `ums_user_admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_admins_roles
-- ----------------------------
INSERT INTO `ums_admins_roles` VALUES (1, 5);
INSERT INTO `ums_admins_roles` VALUES (89, 5);

-- ----------------------------
-- Table structure for ums_admin_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_login_log`;
CREATE TABLE `ums_admin_login_log`  (
  `id` bigint(20) NOT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `update_time` datetime(6) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `admin_id` bigint(20) NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_admin_login_log
-- ----------------------------
INSERT INTO `ums_admin_login_log` VALUES (2, '2022-08-29 10:07:10.903000', '2022-08-29 10:07:10.903000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (3, '2022-08-29 10:23:43.559000', '2022-08-29 10:23:43.559000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (4, '2022-08-29 10:23:57.776000', '2022-08-29 10:23:57.776000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (5, '2022-08-29 12:59:13.365000', '2022-08-29 12:59:13.365000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (6, '2022-08-29 13:00:06.373000', '2022-08-29 13:00:06.373000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (7, '2022-08-29 13:00:14.832000', '2022-08-29 13:00:14.832000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (8, '2022-08-29 13:00:34.979000', '2022-08-29 13:00:34.979000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (9, '2022-08-29 13:00:50.821000', '2022-08-29 13:00:50.821000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (10, '2022-08-29 13:01:04.358000', '2022-08-29 13:01:04.358000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (11, '2022-08-29 13:01:17.809000', '2022-08-29 13:01:17.809000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (12, '2022-08-29 13:02:09.470000', '2022-08-29 13:02:09.470000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (13, '2022-08-29 13:02:24.064000', '2022-08-29 13:02:24.064000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (14, '2022-08-29 13:06:05.450000', '2022-08-29 13:06:05.450000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (15, '2022-08-29 13:08:53.922000', '2022-08-29 13:08:53.922000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (16, '2022-08-29 14:10:54.512000', '2022-08-29 14:10:54.512000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (17, '2022-08-29 14:19:58.013000', '2022-08-29 14:19:58.013000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (18, '2022-08-29 14:20:13.147000', '2022-08-29 14:20:13.147000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (19, '2022-08-29 14:21:28.192000', '2022-08-29 14:21:28.192000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (20, '2022-08-29 14:21:31.124000', '2022-08-29 14:21:31.124000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (21, '2022-08-29 14:21:35.929000', '2022-08-29 14:21:35.929000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (22, '2022-08-29 14:21:50.030000', '2022-08-29 14:21:50.030000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (23, '2022-08-29 14:22:39.689000', '2022-08-29 14:22:39.689000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (24, '2022-08-29 14:22:54.151000', '2022-08-29 14:22:54.151000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (25, '2022-08-29 14:23:04.099000', '2022-08-29 14:23:04.099000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (26, '2022-08-29 14:24:19.891000', '2022-08-29 14:24:19.891000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (27, '2022-08-29 14:26:55.255000', '2022-08-29 14:26:55.255000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (28, '2022-08-29 14:27:02.793000', '2022-08-29 14:27:02.793000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (29, '2022-08-29 14:29:00.291000', '2022-08-29 14:29:00.291000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (30, '2022-08-29 14:35:15.608000', '2022-08-29 14:35:15.608000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (31, '2022-08-29 14:35:29.131000', '2022-08-29 14:35:29.131000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (32, '2022-08-29 14:37:33.014000', '2022-08-29 14:37:33.014000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (33, '2022-08-29 14:41:25.155000', '2022-08-29 14:41:25.155000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (34, '2022-08-29 14:45:36.295000', '2022-08-29 14:45:36.295000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (35, '2022-08-29 15:05:43.898000', '2022-08-29 15:05:43.898000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (36, '2022-08-29 15:21:35.899000', '2022-08-29 15:21:35.900000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (37, '2022-08-29 16:29:57.761000', '2022-08-29 16:29:57.761000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (38, '2022-08-29 16:30:28.377000', '2022-08-29 16:30:28.377000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (39, '2022-08-29 17:05:53.022000', '2022-08-29 17:05:53.022000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (40, '2022-08-29 17:06:03.673000', '2022-08-29 17:06:03.673000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (41, '2022-08-29 17:06:13.782000', '2022-08-29 17:06:13.782000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (42, '2022-08-29 17:06:19.001000', '2022-08-29 17:06:19.001000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (43, '2022-08-29 17:12:51.007000', '2022-08-29 17:12:51.007000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (44, '2022-08-30 09:48:33.777000', '2022-08-30 09:48:33.777000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (45, '2022-08-30 15:39:02.599000', '2022-08-30 15:39:02.599000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (46, '2022-08-30 15:39:11.978000', '2022-08-30 15:39:11.978000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (47, '2022-08-30 15:39:17.538000', '2022-08-30 15:39:17.538000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (48, '2022-08-30 15:40:07.294000', '2022-08-30 15:40:07.294000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (49, '2022-08-30 15:40:40.108000', '2022-08-30 15:40:40.108000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (50, '2022-08-30 16:08:06.717000', '2022-08-30 16:08:06.717000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (51, '2022-08-30 16:08:17.509000', '2022-08-30 16:08:17.509000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (52, '2022-08-30 16:08:57.309000', '2022-08-30 16:08:57.309000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (53, '2022-08-30 16:11:01.195000', '2022-08-30 16:11:01.195000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (54, '2022-08-30 16:12:02.855000', '2022-08-30 16:12:02.855000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (55, '2022-08-30 16:12:07.728000', '2022-08-30 16:12:07.728000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (56, '2022-08-30 16:14:46.340000', '2022-08-30 16:14:46.340000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (57, '2022-08-30 16:16:00.895000', '2022-08-30 16:16:00.895000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (58, '2022-08-30 16:17:49.292000', '2022-08-30 16:17:49.292000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (59, '2022-08-30 16:18:12.174000', '2022-08-30 16:18:12.174000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (60, '2022-08-30 16:21:14.718000', '2022-08-30 16:21:14.718000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (61, '2022-08-30 16:21:40.923000', '2022-08-30 16:21:40.923000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (62, '2022-08-30 16:47:16.023000', '2022-08-30 16:47:16.023000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (63, '2022-08-30 16:47:27.984000', '2022-08-30 16:47:27.984000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (64, '2022-08-30 16:48:49.247000', '2022-08-30 16:48:49.247000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (65, '2022-08-30 16:51:07.555000', '2022-08-30 16:51:07.555000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (66, '2022-08-30 16:51:43.130000', '2022-08-30 16:51:43.130000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (67, '2022-08-30 16:52:24.056000', '2022-08-30 16:52:24.056000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (68, '2022-08-30 17:05:45.277000', '2022-08-30 17:05:45.277000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (69, '2022-08-30 17:33:08.307000', '2022-08-30 17:33:08.307000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (70, '2022-08-31 10:45:01.136000', '2022-08-31 10:45:01.136000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (71, '2022-08-31 10:45:46.061000', '2022-08-31 10:45:46.061000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (72, '2022-08-31 10:49:47.890000', '2022-08-31 10:49:47.890000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (73, '2022-08-31 13:39:34.051000', '2022-08-31 13:39:34.051000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (75, '2022-08-31 16:35:29.787000', '2022-08-31 16:35:29.787000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (77, '2022-08-31 16:40:35.537000', '2022-08-31 16:40:35.537000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (83, '2022-09-01 10:00:30.425000', '2022-09-01 10:00:30.425000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (84, '2022-09-01 11:00:47.258000', '2022-09-01 11:00:47.258000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (86, '2022-09-01 15:55:58.526000', '2022-09-01 15:55:58.526000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (87, '2022-09-01 16:26:14.755000', '2022-09-01 16:26:14.755000', NULL, 85, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (88, '2022-09-01 16:26:21.226000', '2022-09-01 16:26:21.226000', NULL, 85, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (90, '2022-09-01 16:27:17.923000', '2022-09-01 16:27:17.923000', NULL, 89, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (93, '2022-09-01 22:01:36.434000', '2022-09-01 22:01:36.434000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (94, '2022-09-01 22:06:03.034000', '2022-09-01 22:06:03.034000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (95, '2022-09-20 16:02:43.741000', '2022-09-20 16:02:43.741000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (97, '2022-09-20 16:31:47.157000', '2022-09-20 16:31:47.157000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (98, '2022-09-22 09:42:11.155000', '2022-09-22 09:42:11.155000', NULL, 1, '192.168.184.1', NULL);
INSERT INTO `ums_admin_login_log` VALUES (99, '2022-09-24 11:50:19.603000', '2022-09-24 11:50:19.603000', NULL, 1, '192.168.184.1', NULL);

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES (101);

SET FOREIGN_KEY_CHECKS = 1;
