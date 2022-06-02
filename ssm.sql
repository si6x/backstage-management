/*
 Navicat Premium Data Transfer

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:3306
 Source Schema         : ssm

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 20/05/2022 11:26:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `member.id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('E61D65F673D54F68B0861025C69773DB', '张三', '小三', '18888888888', 'zs@163.com');

-- ----------------------------
-- Table structure for order_traveller
-- ----------------------------
DROP TABLE IF EXISTS `order_traveller`;
CREATE TABLE `order_traveller`  (
  `orderId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `travellerId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`orderId`, `travellerId`) USING BTREE,
  INDEX `odr_tra.travellerId_key`(`travellerId`) USING BTREE,
  CONSTRAINT `odr_tra.orderId_key` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `odr_tra.travellerId_key` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_traveller
-- ----------------------------
INSERT INTO `order_traveller` VALUES ('0E7231DC797C486290E8713CA3C6ECCC', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('2FF351C4AC744E2092DCF08CFD314420', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('5DC6A48DD4E94592AE904930EA866AFA', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('A0657832D93E4B10AE88A2D4B70B1A28', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('3081770BC3984EF092D9E99760FDABDE', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('55F9AF582D5A4DB28FB4EC3199385762', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('96CC8BD43C734CC2ACBFF09501B4DD5D', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('CA005CF1BE3C4EF68F88ABC7DF30E976', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('E4DD4C45EED84870ABA83574A801083E', 'EE7A71FB6945483FBF91543DBE851960');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `peopleCount` int(255) NULL DEFAULT NULL,
  `orderDesc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payType` int(255) NULL DEFAULT NULL,
  `orderStatus` int(255) NULL DEFAULT NULL,
  `productId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `memberId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orders.id`(`id`) USING BTREE,
  INDEX `orders.productId_key`(`productId`) USING BTREE,
  INDEX `orders.memberId_key`(`memberId`) USING BTREE,
  CONSTRAINT `orders.memberId_key` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders.productId_key` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('0E7231DC797C486290E8713CA3C6ECCC', '12345', '2021-12-17 15:39:16', 2, '没什么', 0, 1, '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('2FF351C4AC744E2092DCF08CFD314420', '67890', '2021-12-17 15:39:20', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('3081770BC3984EF092D9E99760FDABDE', '55555', '2021-12-17 15:39:22', 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('55F9AF582D5A4DB28FB4EC3199385762', '33333', '2021-12-17 15:39:25', 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('5DC6A48DD4E94592AE904930EA866AFA', '54321', '2021-12-17 15:39:28', 2, '没什么', 0, 1, '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('96CC8BD43C734CC2ACBFF09501B4DD5D', '22222', '2021-12-17 15:39:30', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('A0657832D93E4B10AE88A2D4B70B1A28', '98765', '2021-12-17 15:39:33', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('CA005CF1BE3C4EF68F88ABC7DF30E976', '44444', '2021-12-17 15:39:36', 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('E4DD4C45EED84870ABA83574A801083E', '11111', '2021-12-17 15:39:38', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `permissionName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('8e9ec44a92c111ec9be34851c546690e', 'findByUserId', '/user/findByUserId');
INSERT INTO `permission` VALUES ('968f13a492c111ec9be34851c546690e', 'findUserByIdAndAllRole', '/user/findUserByIdAndAllRole');
INSERT INTO `permission` VALUES ('9f75813e92c111ec9be34851c546690e', 'saveUserInfo', '/user/saveUserInfo');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '无意义，主键uuid\r',
  `productNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品编号，唯一，不为空',
  `productName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称（路线名称）',
  `cityName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出发城市',
  `departureTime` timestamp NULL DEFAULT NULL COMMENT '出发时间\r',
  `productPrice` double(12, 2) NULL DEFAULT NULL COMMENT '产品价格',
  `productDesc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品描述',
  `productStatus` int(1) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '状态(0 关闭 1 开启',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product.id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('12B7ABF2A4C544568B0A7C69F36BF8B7', 'itcast-003', '上海五日游', '上海', '2021-12-14 11:08:00', 1800.00, '魔都我来了', 0);
INSERT INTO `product` VALUES ('480b794566ea11ec944c4851c546690e', 'si6x-001', '珠海一日游', '珠海', '2021-12-28 18:05:00', 1000.00, '珠海好玩', 1);
INSERT INTO `product` VALUES ('676C5BD1D35E429A8C2E114939C5685A', 'itcast-002', '北京三日游', '北京', '2021-12-14 11:07:00', 1200.00, '不错的旅行', 1);
INSERT INTO `product` VALUES ('9F71F01CB448476DAFB309AA6DF9497F', 'itcast-001', '北京三日游', '北京', '2021-12-14 11:10:04', 1200.00, '不错的旅行', 1);
INSERT INTO `product` VALUES ('e8ca0d0e6d0511ec944c4851c546690e', 'si6x-004', '深圳一日游', '深圳', '2022-01-04 10:27:00', 500.00, '北上广深', 0);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleDesc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role.id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('38f0144c6d3111ec944c4851c546690e', 'ROLE_ADMIN', 'vip');
INSERT INTO `role` VALUES ('ff5a71d76d3011ec944c4851c546690e', 'ROLE_USER', 'vip');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `permissionId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`permissionId`, `roleId`) USING BTREE,
  INDEX `role_permission.roleId_key`(`roleId`) USING BTREE,
  CONSTRAINT `role_permission.permissionId_key` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_permission.roleId_key` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('8e9ec44a92c111ec9be34851c546690e', '38f0144c6d3111ec944c4851c546690e');
INSERT INTO `role_permission` VALUES ('968f13a492c111ec9be34851c546690e', '38f0144c6d3111ec944c4851c546690e');
INSERT INTO `role_permission` VALUES ('9f75813e92c111ec9be34851c546690e', '38f0144c6d3111ec944c4851c546690e');
INSERT INTO `role_permission` VALUES ('8e9ec44a92c111ec9be34851c546690e', 'ff5a71d76d3011ec944c4851c546690e');

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `visitTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `executionTime` int(255) NULL DEFAULT NULL,
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sysLog.id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES ('015581a4d7e811ec8073005056c00001', '2022-05-20 10:51:57', 'admin', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 19, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('0401e040d7e811ec8073005056c00001', '2022-05-20 10:52:01', 'admin', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 2, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('04e3f5afd7e911ec8073005056c00001', '2022-05-20 10:59:12', 'si6x', '0:0:0:0:0:0:0:1', '/role/findAllRole', 3, '[类名] com.si6x.ssm.controller.RoleController[方法名] findAllRole');
INSERT INTO `syslog` VALUES ('06ca15fcd7e911ec8073005056c00001', '2022-05-20 10:59:16', 'si6x', '0:0:0:0:0:0:0:1', '/permission/findAllPermission', 2, '[类名] com.si6x.ssm.controller.PermissionController[方法名] findAllPermission');
INSERT INTO `syslog` VALUES ('08f56946d7e911ec8073005056c00001', '2022-05-20 10:59:19', 'si6x', '0:0:0:0:0:0:0:1', '/role/findAllRole', 2, '[类名] com.si6x.ssm.controller.RoleController[方法名] findAllRole');
INSERT INTO `syslog` VALUES ('098c592d947711ec9be34851c546690e', '2022-02-23 15:05:25', 'tom', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole', 14, '[类名] com.si6x.ssm.controller.UserController[方法名] findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES ('0b3ccca9d7e911ec8073005056c00001', '2022-05-20 10:59:23', 'si6x', '0:0:0:0:0:0:0:1', '/permission/findAllPermission', 1, '[类名] com.si6x.ssm.controller.PermissionController[方法名] findAllPermission');
INSERT INTO `syslog` VALUES ('0b9571c5947711ec9be34851c546690e', '2022-02-23 15:05:28', 'tom', '0:0:0:0:0:0:0:1', '/user/addRoleToUser', 13, '[类名] com.si6x.ssm.controller.UserController[方法名] addRoleToUser');
INSERT INTO `syslog` VALUES ('0b9778f0947711ec9be34851c546690e', '2022-02-23 15:05:28', 'tom', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 3, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('0d63027fd7e911ec8073005056c00001', '2022-05-20 10:59:27', 'si6x', '0:0:0:0:0:0:0:1', '/permission/findAllPermission', 2, '[类名] com.si6x.ssm.controller.PermissionController[方法名] findAllPermission');
INSERT INTO `syslog` VALUES ('0e33c0d8947711ec9be34851c546690e', '2022-02-23 15:05:33', 'tom', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 4, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('0eb4db47d7e911ec8073005056c00001', '2022-05-20 10:59:29', 'si6x', '0:0:0:0:0:0:0:1', '/role/findAllRole', 3, '[类名] com.si6x.ssm.controller.RoleController[方法名] findAllRole');
INSERT INTO `syslog` VALUES ('0fa65a4fd7e911ec8073005056c00001', '2022-05-20 10:59:30', 'si6x', '0:0:0:0:0:0:0:1', '/permission/findAllPermission', 2, '[类名] com.si6x.ssm.controller.PermissionController[方法名] findAllPermission');
INSERT INTO `syslog` VALUES ('13fc4dfbd7e911ec8073005056c00001', '2022-05-20 10:59:38', 'si6x', '0:0:0:0:0:0:0:1', '/role/findAllRole', 2, '[类名] com.si6x.ssm.controller.RoleController[方法名] findAllRole');
INSERT INTO `syslog` VALUES ('15170bb8d7e911ec8073005056c00001', '2022-05-20 10:59:40', 'si6x', '0:0:0:0:0:0:0:1', '/product/findAllProduct', 12, '[类名] com.si6x.ssm.controller.ProductController[方法名] findAllProduct');
INSERT INTO `syslog` VALUES ('15e9a2f7d7e911ec8073005056c00001', '2022-05-20 10:59:41', 'si6x', '0:0:0:0:0:0:0:1', '/orders/findAllOrders', 8, '[类名] com.si6x.ssm.controller.OrdersController[方法名] findAllOrders');
INSERT INTO `syslog` VALUES ('17e64671d7e911ec8073005056c00001', '2022-05-20 10:59:44', 'si6x', '0:0:0:0:0:0:0:1', '/orders/findAllOrders', 9, '[类名] com.si6x.ssm.controller.OrdersController[方法名] findAllOrders');
INSERT INTO `syslog` VALUES ('18aee2d7d7e911ec8073005056c00001', '2022-05-20 10:59:46', 'si6x', '0:0:0:0:0:0:0:1', '/product/findAllProduct', 1, '[类名] com.si6x.ssm.controller.ProductController[方法名] findAllProduct');
INSERT INTO `syslog` VALUES ('195ea56cd7e911ec8073005056c00001', '2022-05-20 10:59:47', 'si6x', '0:0:0:0:0:0:0:1', '/orders/findAllOrders', 8, '[类名] com.si6x.ssm.controller.OrdersController[方法名] findAllOrders');
INSERT INTO `syslog` VALUES ('1a0f7b24d7e911ec8073005056c00001', '2022-05-20 10:59:48', 'si6x', '0:0:0:0:0:0:0:1', '/product/findAllProduct', 2, '[类名] com.si6x.ssm.controller.ProductController[方法名] findAllProduct');
INSERT INTO `syslog` VALUES ('1ae6341dd7e711ec8073005056c00001', '2022-05-20 10:45:30', 'admin', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 32, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('1b83853ed7e911ec8073005056c00001', '2022-05-20 10:59:50', 'si6x', '0:0:0:0:0:0:0:1', '/orders/findAllOrders', 7, '[类名] com.si6x.ssm.controller.OrdersController[方法名] findAllOrders');
INSERT INTO `syslog` VALUES ('1cd1b688d7e911ec8073005056c00001', '2022-05-20 10:59:53', 'si6x', '0:0:0:0:0:0:0:1', '/role/findAllRole', 3, '[类名] com.si6x.ssm.controller.RoleController[方法名] findAllRole');
INSERT INTO `syslog` VALUES ('1d3c45bed7e711ec8073005056c00001', '2022-05-20 10:45:34', 'admin', '0:0:0:0:0:0:0:1', '/role/findAllRole', 187, '[类名] com.si6x.ssm.controller.RoleController[方法名] findAllRole');
INSERT INTO `syslog` VALUES ('1dbb5684d7e911ec8073005056c00001', '2022-05-20 10:59:54', 'si6x', '0:0:0:0:0:0:0:1', '/permission/findAllPermission', 1, '[类名] com.si6x.ssm.controller.PermissionController[方法名] findAllPermission');
INSERT INTO `syslog` VALUES ('1ea6fdc9d7e711ec8073005056c00001', '2022-05-20 10:45:37', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAllPermission', 10, '[类名] com.si6x.ssm.controller.PermissionController[方法名] findAllPermission');
INSERT INTO `syslog` VALUES ('1fe84a2b951111ec9be34851c546690e', '2022-02-24 09:28:20', 'admin', '0:0:0:0:0:0:0:1', '/product/findAllProduct', 56, '[类名] com.si6x.ssm.controller.ProductController[方法名] findAllProduct');
INSERT INTO `syslog` VALUES ('215d7dcb947711ec9be34851c546690e', '2022-02-23 15:06:05', 'admin', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 4, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('25dc5a9d951111ec9be34851c546690e', '2022-02-24 09:28:30', 'admin', '0:0:0:0:0:0:0:1', '/product/findAllProduct', 7, '[类名] com.si6x.ssm.controller.ProductController[方法名] findAllProduct');
INSERT INTO `syslog` VALUES ('2ace43aa951111ec9be34851c546690e', '2022-02-24 09:28:38', 'admin', '0:0:0:0:0:0:0:1', '/product/findAllProduct', 9, '[类名] com.si6x.ssm.controller.ProductController[方法名] findAllProduct');
INSERT INTO `syslog` VALUES ('2d8d09da947711ec9be34851c546690e', '2022-02-23 15:06:25', 'admin', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 5, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('31b16d73951011ec9be34851c546690e', '2022-02-24 09:21:40', 'admin', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 53, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('34442565951011ec9be34851c546690e', '2022-02-24 09:21:45', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole', 6, '[类名] com.si6x.ssm.controller.UserController[方法名] findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES ('37276fb8951011ec9be34851c546690e', '2022-02-24 09:21:49', 'admin', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 4, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('3816989f951011ec9be34851c546690e', '2022-02-24 09:21:51', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole', 6, '[类名] com.si6x.ssm.controller.UserController[方法名] findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES ('38e0f8bbd7e711ec8073005056c00001', '2022-05-20 10:46:21', 'admin', '0:0:0:0:0:0:0:1', '/product/findAllProduct', 23, '[类名] com.si6x.ssm.controller.ProductController[方法名] findAllProduct');
INSERT INTO `syslog` VALUES ('39acba48d7e711ec8073005056c00001', '2022-05-20 10:46:22', 'admin', '0:0:0:0:0:0:0:1', '/product/findAllProduct', 3, '[类名] com.si6x.ssm.controller.ProductController[方法名] findAllProduct');
INSERT INTO `syslog` VALUES ('39c3ceef951011ec9be34851c546690e', '2022-02-24 09:21:54', 'admin', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 3, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('3a7ea1f6d7e711ec8073005056c00001', '2022-05-20 10:46:23', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAllOrders', 105, '[类名] com.si6x.ssm.controller.OrdersController[方法名] findAllOrders');
INSERT INTO `syslog` VALUES ('3aec58b0951011ec9be34851c546690e', '2022-02-24 09:21:56', 'admin', '0:0:0:0:0:0:0:1', '/product/findAllProduct', 23, '[类名] com.si6x.ssm.controller.ProductController[方法名] findAllProduct');
INSERT INTO `syslog` VALUES ('3de1fb59951011ec9be34851c546690e', '2022-02-24 09:22:01', 'admin', '0:0:0:0:0:0:0:1', '/product/findAllProduct', 6, '[类名] com.si6x.ssm.controller.ProductController[方法名] findAllProduct');
INSERT INTO `syslog` VALUES ('44da9db3947611ec9be34851c546690e', '2022-02-23 14:59:55', 'tom', '0:0:0:0:0:0:0:1', '/role/findAllRole', 64, '[类名] com.si6x.ssm.controller.RoleController[方法名] findAllRole');
INSERT INTO `syslog` VALUES ('46fce007d7e911ec8073005056c00001', '2022-05-20 11:01:03', 'si6x', '0:0:0:0:0:0:0:1', '/permission/findAllPermission', 10, '[类名] com.si6x.ssm.controller.PermissionController[方法名] findAllPermission');
INSERT INTO `syslog` VALUES ('4a54f190947611ec9be34851c546690e', '2022-02-23 15:00:04', 'tom', '0:0:0:0:0:0:0:1', '/role/deleteRoleById', 19, '[类名] com.si6x.ssm.controller.RoleController[方法名] deleteRoleById');
INSERT INTO `syslog` VALUES ('4a5aefde947611ec9be34851c546690e', '2022-02-23 15:00:04', 'tom', '0:0:0:0:0:0:0:1', '/role/findAllRole', 6, '[类名] com.si6x.ssm.controller.RoleController[方法名] findAllRole');
INSERT INTO `syslog` VALUES ('50fa8730947611ec9be34851c546690e', '2022-02-23 15:00:15', 'tom', '0:0:0:0:0:0:0:1', '/role/deleteRoleById', 18, '[类名] com.si6x.ssm.controller.RoleController[方法名] deleteRoleById');
INSERT INTO `syslog` VALUES ('50fd5b3b947611ec9be34851c546690e', '2022-02-23 15:00:15', 'tom', '0:0:0:0:0:0:0:1', '/role/findAllRole', 4, '[类名] com.si6x.ssm.controller.RoleController[方法名] findAllRole');
INSERT INTO `syslog` VALUES ('52e77996947611ec9be34851c546690e', '2022-02-23 15:00:18', 'tom', '0:0:0:0:0:0:0:1', '/role/findAllRole', 5, '[类名] com.si6x.ssm.controller.RoleController[方法名] findAllRole');
INSERT INTO `syslog` VALUES ('53e66672947611ec9be34851c546690e', '2022-02-23 15:00:20', 'tom', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 3, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('545a4c2ed7e711ec8073005056c00001', '2022-05-20 10:47:07', 'admin', '0:0:0:0:0:0:0:1', '/role/findAllRole', 4, '[类名] com.si6x.ssm.controller.RoleController[方法名] findAllRole');
INSERT INTO `syslog` VALUES ('5545416ed7e711ec8073005056c00001', '2022-05-20 10:47:08', 'admin', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 2, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('55f3f2f7d7e711ec8073005056c00001', '2022-05-20 10:47:09', 'admin', '0:0:0:0:0:0:0:1', '/role/findAllRole', 3, '[类名] com.si6x.ssm.controller.RoleController[方法名] findAllRole');
INSERT INTO `syslog` VALUES ('5692c618d7e711ec8073005056c00001', '2022-05-20 10:47:10', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAllPermission', 3, '[类名] com.si6x.ssm.controller.PermissionController[方法名] findAllPermission');
INSERT INTO `syslog` VALUES ('683e79bfd7e711ec8073005056c00001', '2022-05-20 10:47:40', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAllPermission', 4, '[类名] com.si6x.ssm.controller.PermissionController[方法名] findAllPermission');
INSERT INTO `syslog` VALUES ('69e6ddd1d7e711ec8073005056c00001', '2022-05-20 10:47:43', 'admin', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 2, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('6abc7fc8d7e711ec8073005056c00001', '2022-05-20 10:47:44', 'admin', '0:0:0:0:0:0:0:1', '/role/findAllRole', 3, '[类名] com.si6x.ssm.controller.RoleController[方法名] findAllRole');
INSERT INTO `syslog` VALUES ('6b68908ed7e711ec8073005056c00001', '2022-05-20 10:47:45', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAllPermission', 2, '[类名] com.si6x.ssm.controller.PermissionController[方法名] findAllPermission');
INSERT INTO `syslog` VALUES ('6d8582bfd7e711ec8073005056c00001', '2022-05-20 10:47:49', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAllOrders', 11, '[类名] com.si6x.ssm.controller.OrdersController[方法名] findAllOrders');
INSERT INTO `syslog` VALUES ('6e4f721dd7e711ec8073005056c00001', '2022-05-20 10:47:50', 'admin', '0:0:0:0:0:0:0:1', '/product/findAllProduct', 3, '[类名] com.si6x.ssm.controller.ProductController[方法名] findAllProduct');
INSERT INTO `syslog` VALUES ('76c2ec89947611ec9be34851c546690e', '2022-02-23 15:01:18', 'tom', '0:0:0:0:0:0:0:1', '/user/saveUserInfo', 140, '[类名] com.si6x.ssm.controller.UserController[方法名] saveUserInfo');
INSERT INTO `syslog` VALUES ('76c5cc3c947611ec9be34851c546690e', '2022-02-23 15:01:19', 'tom', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 8, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('7886215c947611ec9be34851c546690e', '2022-02-23 15:01:21', 'tom', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole', 20, '[类名] com.si6x.ssm.controller.UserController[方法名] findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES ('7cb322e5947611ec9be34851c546690e', '2022-02-23 15:01:28', 'tom', '0:0:0:0:0:0:0:1', '/user/addRoleToUser', 28, '[类名] com.si6x.ssm.controller.UserController[方法名] addRoleToUser');
INSERT INTO `syslog` VALUES ('7cb546c9947611ec9be34851c546690e', '2022-02-23 15:01:29', 'tom', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 3, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('90cdf7fdd7e811ec8073005056c00001', '2022-05-20 10:55:58', 'admin', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 10, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('91d29da0d7e811ec8073005056c00001', '2022-05-20 10:55:59', 'admin', '0:0:0:0:0:0:0:1', '/role/findAllRole', 3, '[类名] com.si6x.ssm.controller.RoleController[方法名] findAllRole');
INSERT INTO `syslog` VALUES ('9309a5e4d7e811ec8073005056c00001', '2022-05-20 10:56:01', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAllPermission', 2, '[类名] com.si6x.ssm.controller.PermissionController[方法名] findAllPermission');
INSERT INTO `syslog` VALUES ('93f48603d7e811ec8073005056c00001', '2022-05-20 10:56:03', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAllPermission', 2, '[类名] com.si6x.ssm.controller.PermissionController[方法名] findAllPermission');
INSERT INTO `syslog` VALUES ('95c938e0d7e811ec8073005056c00001', '2022-05-20 10:56:06', 'admin', '0:0:0:0:0:0:0:1', '/product/findAllProduct', 2, '[类名] com.si6x.ssm.controller.ProductController[方法名] findAllProduct');
INSERT INTO `syslog` VALUES ('96d4080cd7e811ec8073005056c00001', '2022-05-20 10:56:08', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAllOrders', 9, '[类名] com.si6x.ssm.controller.OrdersController[方法名] findAllOrders');
INSERT INTO `syslog` VALUES ('9ac1f8b7d7e911ec8073005056c00001', '2022-05-20 11:03:24', 'si6x', '0:0:0:0:0:0:0:1', '/permission/findAllPermission', 9, '[类名] com.si6x.ssm.controller.PermissionController[方法名] findAllPermission');
INSERT INTO `syslog` VALUES ('9dd95d31951211ec9be34851c546690e', '2022-02-24 09:39:01', 'admin', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 56, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('9f516147951211ec9be34851c546690e', '2022-02-24 09:39:03', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole', 7, '[类名] com.si6x.ssm.controller.UserController[方法名] findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES ('9faf5660d7e711ec8073005056c00001', '2022-05-20 10:49:13', 'admin', '0:0:0:0:0:0:0:1', '/product/findAllProduct', 10, '[类名] com.si6x.ssm.controller.ProductController[方法名] findAllProduct');
INSERT INTO `syslog` VALUES ('a07cd6c7951211ec9be34851c546690e', '2022-02-24 09:39:05', 'admin', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 3, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('a2295af5951211ec9be34851c546690e', '2022-02-24 09:39:08', 'admin', '0:0:0:0:0:0:0:1', '/user/findByUserId', 7, '[类名] com.si6x.ssm.controller.UserController[方法名] findByUserId');
INSERT INTO `syslog` VALUES ('b822f637951111ec9be34851c546690e', '2022-02-24 09:32:35', 'admin', '0:0:0:0:0:0:0:1', '/product/findAllProduct', 56, '[类名] com.si6x.ssm.controller.ProductController[方法名] findAllProduct');
INSERT INTO `syslog` VALUES ('c0613ddd951111ec9be34851c546690e', '2022-02-24 09:32:49', 'si6x', '0:0:0:0:0:0:0:1', '/product/findAllProduct', 7, '[类名] com.si6x.ssm.controller.ProductController[方法名] findAllProduct');
INSERT INTO `syslog` VALUES ('c6a49c55d7e811ec8073005056c00001', '2022-05-20 10:57:28', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAllPermission', 8, '[类名] com.si6x.ssm.controller.PermissionController[方法名] findAllPermission');
INSERT INTO `syslog` VALUES ('cb5c57d5d7e811ec8073005056c00001', '2022-05-20 10:57:36', 'admin', '0:0:0:0:0:0:0:1', '/role/findAllRole', 4, '[类名] com.si6x.ssm.controller.RoleController[方法名] findAllRole');
INSERT INTO `syslog` VALUES ('cc87c8f5d7e811ec8073005056c00001', '2022-05-20 10:57:38', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission', 5, '[类名] com.si6x.ssm.controller.RoleController[方法名] findRoleByIdAndAllPermission');
INSERT INTO `syslog` VALUES ('cdb2e95bd7e811ec8073005056c00001', '2022-05-20 10:57:40', 'admin', '0:0:0:0:0:0:0:1', '/role/findAllRole', 2, '[类名] com.si6x.ssm.controller.RoleController[方法名] findAllRole');
INSERT INTO `syslog` VALUES ('ce6c27c5d7e811ec8073005056c00001', '2022-05-20 10:57:41', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission', 5, '[类名] com.si6x.ssm.controller.RoleController[方法名] findRoleByIdAndAllPermission');
INSERT INTO `syslog` VALUES ('cf373cc8d7e811ec8073005056c00001', '2022-05-20 10:57:42', 'admin', '0:0:0:0:0:0:0:1', '/role/findAllRole', 3, '[类名] com.si6x.ssm.controller.RoleController[方法名] findAllRole');
INSERT INTO `syslog` VALUES ('cfe1e122d7e811ec8073005056c00001', '2022-05-20 10:57:43', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission', 3, '[类名] com.si6x.ssm.controller.RoleController[方法名] findRoleByIdAndAllPermission');
INSERT INTO `syslog` VALUES ('d0ad0983d7e811ec8073005056c00001', '2022-05-20 10:57:45', 'admin', '0:0:0:0:0:0:0:1', '/role/findAllRole', 2, '[类名] com.si6x.ssm.controller.RoleController[方法名] findAllRole');
INSERT INTO `syslog` VALUES ('d29bd321d7e811ec8073005056c00001', '2022-05-20 10:57:48', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAllPermission', 2, '[类名] com.si6x.ssm.controller.PermissionController[方法名] findAllPermission');
INSERT INTO `syslog` VALUES ('da1643f7d7e811ec8073005056c00001', '2022-05-20 10:58:01', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAllPermission', 2, '[类名] com.si6x.ssm.controller.PermissionController[方法名] findAllPermission');
INSERT INTO `syslog` VALUES ('daafaa33947611ec9be34851c546690e', '2022-02-23 15:04:06', 'tom', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole', 12, '[类名] com.si6x.ssm.controller.UserController[方法名] findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES ('dbdc990c947611ec9be34851c546690e', '2022-02-23 15:04:08', 'tom', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 2, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('dd2ba466d7e811ec8073005056c00001', '2022-05-20 10:58:06', 'admin', '0:0:0:0:0:0:0:1', '/role/findAllRole', 2, '[类名] com.si6x.ssm.controller.RoleController[方法名] findAllRole');
INSERT INTO `syslog` VALUES ('de4d1f34d7e811ec8073005056c00001', '2022-05-20 10:58:08', 'admin', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 12, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('e021e08ad7e811ec8073005056c00001', '2022-05-20 10:58:11', 'admin', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 2, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('e28836eed7e811ec8073005056c00001', '2022-05-20 10:58:15', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAllPermission', 2, '[类名] com.si6x.ssm.controller.PermissionController[方法名] findAllPermission');
INSERT INTO `syslog` VALUES ('e35c95f5d7e811ec8073005056c00001', '2022-05-20 10:58:16', 'admin', '0:0:0:0:0:0:0:1', '/role/findAllRole', 2, '[类名] com.si6x.ssm.controller.RoleController[方法名] findAllRole');
INSERT INTO `syslog` VALUES ('e5c850c2d7e811ec8073005056c00001', '2022-05-20 10:58:20', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission', 4, '[类名] com.si6x.ssm.controller.RoleController[方法名] findRoleByIdAndAllPermission');
INSERT INTO `syslog` VALUES ('e67a8d47d7e811ec8073005056c00001', '2022-05-20 10:58:21', 'admin', '0:0:0:0:0:0:0:1', '/role/findAllRole', 2, '[类名] com.si6x.ssm.controller.RoleController[方法名] findAllRole');
INSERT INTO `syslog` VALUES ('e79360c4d7e811ec8073005056c00001', '2022-05-20 10:58:23', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission', 4, '[类名] com.si6x.ssm.controller.RoleController[方法名] findRoleByIdAndAllPermission');
INSERT INTO `syslog` VALUES ('e83f1f8ed7e811ec8073005056c00001', '2022-05-20 10:58:24', 'admin', '0:0:0:0:0:0:0:1', '/role/findAllRole', 2, '[类名] com.si6x.ssm.controller.RoleController[方法名] findAllRole');
INSERT INTO `syslog` VALUES ('e933b67bd7e811ec8073005056c00001', '2022-05-20 10:58:26', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAllPermission', 2, '[类名] com.si6x.ssm.controller.PermissionController[方法名] findAllPermission');
INSERT INTO `syslog` VALUES ('eaf6aacdd7e811ec8073005056c00001', '2022-05-20 10:58:29', 'admin', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 2, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('ec5101d6d7e811ec8073005056c00001', '2022-05-20 10:58:31', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole', 3, '[类名] com.si6x.ssm.controller.UserController[方法名] findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES ('ede729ebd7e911ec8073005056c00001', '2022-05-20 11:05:43', 'si6x', '0:0:0:0:0:0:0:1', '/permission/findAllPermission', 6, '[类名] com.si6x.ssm.controller.PermissionController[方法名] findAllPermission');
INSERT INTO `syslog` VALUES ('ee626f3dd7e811ec8073005056c00001', '2022-05-20 10:58:35', 'admin', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 1, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('ef43628fd7e811ec8073005056c00001', '2022-05-20 10:58:36', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole', 2, '[类名] com.si6x.ssm.controller.UserController[方法名] findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES ('f003d6e2d7e811ec8073005056c00001', '2022-05-20 10:58:37', 'admin', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 1, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('f11aae11d7e811ec8073005056c00001', '2022-05-20 10:58:39', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole', 4, '[类名] com.si6x.ssm.controller.UserController[方法名] findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES ('f24506bbd7e811ec8073005056c00001', '2022-05-20 10:58:41', 'admin', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 2, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');
INSERT INTO `syslog` VALUES ('f4b74f6f951111ec9be34851c546690e', '2022-02-24 09:34:17', 'admin', '0:0:0:0:0:0:0:1', '/product/findAllProduct', 64, '[类名] com.si6x.ssm.controller.ProductController[方法名] findAllProduct');
INSERT INTO `syslog` VALUES ('f4d614b8d7e811ec8073005056c00001', '2022-05-20 10:58:45', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAllPermission', 2, '[类名] com.si6x.ssm.controller.PermissionController[方法名] findAllPermission');
INSERT INTO `syslog` VALUES ('f88c7a32951111ec9be34851c546690e', '2022-02-24 09:34:23', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAllOrders', 199, '[类名] com.si6x.ssm.controller.OrdersController[方法名] findAllOrders');
INSERT INTO `syslog` VALUES ('fa8fe571951111ec9be34851c546690e', '2022-02-24 09:34:27', 'admin', '0:0:0:0:0:0:0:1', '/product/findAllProduct', 6, '[类名] com.si6x.ssm.controller.ProductController[方法名] findAllProduct');
INSERT INTO `syslog` VALUES ('fc4e75e5951111ec9be34851c546690e', '2022-02-24 09:34:30', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAllOrders', 22, '[类名] com.si6x.ssm.controller.OrdersController[方法名] findAllOrders');
INSERT INTO `syslog` VALUES ('fe7f32ce951111ec9be34851c546690e', '2022-02-24 09:34:33', 'admin', '0:0:0:0:0:0:0:1', '/user/findAllUserInfo', 16, '[类名] com.si6x.ssm.controller.UserController[方法名] findAllUserInfo');

-- ----------------------------
-- Table structure for traveller
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `credentialsType` int(255) NULL DEFAULT NULL,
  `credentialsNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `travellerType` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `traveller.id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of traveller
-- ----------------------------
INSERT INTO `traveller` VALUES ('3FE27DF2A4E44A6DBC5D0FE4651D3D3E', '张龙', '男', '13333333333', 0, '123456789009876543', 0);
INSERT INTO `traveller` VALUES ('EE7A71FB6945483FBF91543DBE851960', '张小龙', '男', '15555555555', 0, '987654321123456789', 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users.id`(`id`) USING BTREE,
  UNIQUE INDEX `users.email`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('2e6f657f92c111ec9be34851c546690e', 'si6x@vip.qq.com', 'si6x', '$2a$10$YJWVxxjXBxJxiHmA.hy0FueDERy2ZyM43ZWIimphUmAcVzoqf2Gje', '134 3357 5232', 1);
INSERT INTO `users` VALUES ('76c2241b947611ec9be34851c546690e', '609697036@qq.com', 'admin', '$2a$10$WDJEbgxFN3x9L9TkrBBfwu.Ft4gTgZtVW314Q5f8Ks5W726xpARye', '134 3357 5232', 1);

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role`  (
  `userId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`userId`, `roleId`) USING BTREE,
  INDEX `users_role.roleId_key`(`roleId`) USING BTREE,
  CONSTRAINT `users_role.userId_key` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `users_role.roleId_key` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES ('76c2241b947611ec9be34851c546690e', '38f0144c6d3111ec944c4851c546690e');
INSERT INTO `users_role` VALUES ('2e6f657f92c111ec9be34851c546690e', 'ff5a71d76d3011ec944c4851c546690e');
INSERT INTO `users_role` VALUES ('76c2241b947611ec9be34851c546690e', 'ff5a71d76d3011ec944c4851c546690e');

-- ----------------------------
-- Triggers structure for table member
-- ----------------------------
DROP TRIGGER IF EXISTS `member.id_trigger`;
delimiter ;;
CREATE TRIGGER `member.id_trigger` BEFORE INSERT ON `member` FOR EACH ROW BEGIN
IF new.id is NULL THEN
		set new.id=replace(UUID(),'-','');
END IF; 
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table orders
-- ----------------------------
DROP TRIGGER IF EXISTS `orders.id_trigger`;
delimiter ;;
CREATE TRIGGER `orders.id_trigger` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN
IF new.id is NULL THEN
		set new.id=replace(UUID(),'-','');
END IF; 
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table permission
-- ----------------------------
DROP TRIGGER IF EXISTS `permission.id.trigger`;
delimiter ;;
CREATE TRIGGER `permission.id.trigger` BEFORE INSERT ON `permission` FOR EACH ROW BEGIN
IF new.id is NULL THEN
		set new.id=replace(UUID(),'-','');
END IF; 
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table product
-- ----------------------------
DROP TRIGGER IF EXISTS `product.id_trigger`;
delimiter ;;
CREATE TRIGGER `product.id_trigger` BEFORE INSERT ON `product` FOR EACH ROW BEGIN
IF new.id is NULL THEN
		set new.id=replace(UUID(),'-','');
END IF; 
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table role
-- ----------------------------
DROP TRIGGER IF EXISTS `role.id.trigger`;
delimiter ;;
CREATE TRIGGER `role.id.trigger` BEFORE INSERT ON `role` FOR EACH ROW BEGIN
IF new.id is NULL THEN
		set new.id=replace(UUID(),'-','');
END IF; 
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table syslog
-- ----------------------------
DROP TRIGGER IF EXISTS `sysLog.id.trigger`;
delimiter ;;
CREATE TRIGGER `sysLog.id.trigger` BEFORE INSERT ON `syslog` FOR EACH ROW BEGIN
IF new.id is NULL THEN
		set new.id=replace(UUID(),'-','');
END IF; 
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table traveller
-- ----------------------------
DROP TRIGGER IF EXISTS `traveller.id_trigger`;
delimiter ;;
CREATE TRIGGER `traveller.id_trigger` BEFORE INSERT ON `traveller` FOR EACH ROW BEGIN
IF new.id is NULL THEN
		set new.id=replace(UUID(),'-','');
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table users
-- ----------------------------
DROP TRIGGER IF EXISTS `users.id.trigger`;
delimiter ;;
CREATE TRIGGER `users.id.trigger` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
IF new.id is NULL THEN
		set new.id=replace(UUID(),'-','');
END IF; 
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
