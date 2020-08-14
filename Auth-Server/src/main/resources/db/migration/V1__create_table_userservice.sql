/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : userservice

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 03/08/2020 07:26:52
*/


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for assign_permission_to_role
-- ----------------------------
DROP TABLE IF EXISTS `assign_permission_to_role`;
CREATE TABLE `assign_permission_to_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `permission_id` int NULL DEFAULT NULL,
  `role_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `permission_id`(`permission_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `assign_permission_to_role_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `assign_permission_to_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assign_permission_to_role
-- ----------------------------
INSERT INTO `assign_permission_to_role` VALUES (1, 1, 1);
INSERT INTO `assign_permission_to_role` VALUES (2, 2, 1);
INSERT INTO `assign_permission_to_role` VALUES (3, 3, 1);
INSERT INTO `assign_permission_to_role` VALUES (4, 4, 1);
INSERT INTO `assign_permission_to_role` VALUES (5, 5, 1);
INSERT INTO `assign_permission_to_role` VALUES (6, 4, 2);
INSERT INTO `assign_permission_to_role` VALUES (7, 5, 2);

-- ----------------------------
-- Table structure for assign_user_to_role
-- ----------------------------
DROP TABLE IF EXISTS `assign_user_to_role`;
CREATE TABLE `assign_user_to_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `role_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `assign_user_to_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `assign_user_to_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assign_user_to_role
-- ----------------------------
INSERT INTO `assign_user_to_role` VALUES (1, 1, 1);
INSERT INTO `assign_user_to_role` VALUES (2, 2, 2);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, 'create_note');
INSERT INTO `permission` VALUES (2, 'edit_note');
INSERT INTO `permission` VALUES (3, 'delete_note');
INSERT INTO `permission` VALUES (4, 'view_all_note');
INSERT INTO `permission` VALUES (5, 'view_note');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'Administrator');
INSERT INTO `role` VALUES (2, 'Auditor');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'Arayik', 'mailtoharutyunyan@gmail.com', '$2a$10$gRNZcY3XsWuaZ6Wms2uD6ei0Y9cTPM7h1IUrBiJYtrc1AJP6IoBsO');
INSERT INTO `user` VALUES (2, 'Narek', 'narek1994t@gmail.com', '$2a$10$gRNZcY3XsWuaZ6Wms2uD6ei0Y9cTPM7h1IUrBiJYtrc1AJP6IoBsO');

SET FOREIGN_KEY_CHECKS = 1;
