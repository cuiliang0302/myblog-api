/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : 39.107.245.103:3306
 Source Schema         : myblog

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 29/05/2022 19:33:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_oauthid
-- ----------------------------
DROP TABLE IF EXISTS `account_oauthid`;
CREATE TABLE `account_oauthid` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `openid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_oauthid_source_id_8330658d_fk_account_usersource_id` (`source_id`),
  KEY `account_oauthid_user_id_ebc11725_fk_account_userinfo_id` (`user_id`),
  CONSTRAINT `account_oauthid_source_id_8330658d_fk_account_usersource_id` FOREIGN KEY (`source_id`) REFERENCES `account_usersource` (`id`),
  CONSTRAINT `account_oauthid_user_id_ebc11725_fk_account_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `account_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of account_oauthid
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for account_searchkey
-- ----------------------------
DROP TABLE IF EXISTS `account_searchkey`;
CREATE TABLE `account_searchkey` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of account_searchkey
-- ----------------------------
BEGIN;
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (1, '面试');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (2, 'vue3');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (3, 'coding');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (4, '爬虫');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (5, 'docker');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (6, '阿里云');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (7, 'mysql');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (8, 'prometheus');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (9, 'k8s');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (10, 'DRF');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (11, 'grafana');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (12, 'elk');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (13, '第三方');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (14, '1');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (15, '1111');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (16, '123');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (17, 'centos8');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (18, 'linux');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (19, '集群组件');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (20, 'python');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (21, 'ceph');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (22, 'jenkins');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (23, '递归');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (24, '百度统计');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (25, '自动化');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (26, 'react');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (27, 'alpine');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (28, 'ansible');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (29, 'nginx');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (30, 'consul');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (31, 'element-plus');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (32, '运维工程师面试');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (33, 'traefik');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (34, '暗黑');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (35, '总结');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (36, 'DateTimeField');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (37, 'devops');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (38, '告警');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (39, 'django');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (40, '推荐');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (41, 'loguru');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (42, 'rc');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (43, 'process-exporter');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (44, 'zabbix');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (45, '博客');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (46, '背景');
INSERT INTO `account_searchkey` (`id`, `key`) VALUES (47, 'admi');
COMMIT;

-- ----------------------------
-- Table structure for account_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `account_userinfo`;
CREATE TABLE `account_userinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `sex` varchar(1) NOT NULL,
  `web` varchar(200) DEFAULT NULL,
  `signature` longtext NOT NULL,
  `photo` varchar(200) NOT NULL,
  `is_flow` tinyint(1) NOT NULL,
  `area_code` varchar(10) DEFAULT NULL,
  `area_name` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `source_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `account_userinfo_source_id_f58feb6f_fk_account_usersource_id` (`source_id`),
  CONSTRAINT `account_userinfo_source_id_f58feb6f_fk_account_usersource_id` FOREIGN KEY (`source_id`) REFERENCES `account_usersource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of account_userinfo
-- ----------------------------
BEGIN;
INSERT INTO `account_userinfo` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `phone`, `sex`, `web`, `signature`, `photo`, `is_flow`, `area_code`, `area_name`, `birthday`, `source_id`) VALUES (1, 'pbkdf2_sha256$260000$ZswS0FRRDruYVcdPDjgCBz$yvx8izTnWj40e9mcOxD3pjvZlFMrGQ5Yc53RJ7wu0Us=', '2022-05-29 11:24:00.000000', 1, 'admin', '', '', '1554382111@qq.com', 1, 1, '2021-05-07 01:00:00.000000', '16612345678', '1', NULL, '这个人很懒，什么都没留下！', 'https://oss.cuiliangblog.cn/photo/default.jpg', 1, NULL, NULL, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for account_userinfo_groups
-- ----------------------------
DROP TABLE IF EXISTS `account_userinfo_groups`;
CREATE TABLE `account_userinfo_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_userinfo_groups_userinfo_id_group_id_b4e3668d_uniq` (`userinfo_id`,`group_id`),
  KEY `account_userinfo_groups_group_id_2e347f59_fk_auth_group_id` (`group_id`),
  CONSTRAINT `account_userinfo_gro_userinfo_id_e39139e5_fk_account_u` FOREIGN KEY (`userinfo_id`) REFERENCES `account_userinfo` (`id`),
  CONSTRAINT `account_userinfo_groups_group_id_2e347f59_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of account_userinfo_groups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for account_userinfo_search
-- ----------------------------
DROP TABLE IF EXISTS `account_userinfo_search`;
CREATE TABLE `account_userinfo_search` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` bigint NOT NULL,
  `searchkey_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_userinfo_search__userinfo_id_searchkey_id_6f8ed699_uniq` (`userinfo_id`,`searchkey_id`),
  KEY `account_userinfo_sea_searchkey_id_77055fdb_fk_record_se` (`searchkey_id`),
  CONSTRAINT `account_userinfo_sea_userinfo_id_c34adc0a_fk_account_u` FOREIGN KEY (`userinfo_id`) REFERENCES `account_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of account_userinfo_search
-- ----------------------------
BEGIN;
INSERT INTO `account_userinfo_search` (`id`, `userinfo_id`, `searchkey_id`) VALUES (29, 1, 8);
INSERT INTO `account_userinfo_search` (`id`, `userinfo_id`, `searchkey_id`) VALUES (30, 1, 9);
INSERT INTO `account_userinfo_search` (`id`, `userinfo_id`, `searchkey_id`) VALUES (31, 1, 10);
COMMIT;

-- ----------------------------
-- Table structure for account_userinfo_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `account_userinfo_user_permissions`;
CREATE TABLE `account_userinfo_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_userinfo_user_pe_userinfo_id_permission_i_3658d500_uniq` (`userinfo_id`,`permission_id`),
  KEY `account_userinfo_use_permission_id_adc527dd_fk_auth_perm` (`permission_id`),
  CONSTRAINT `account_userinfo_use_permission_id_adc527dd_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `account_userinfo_use_userinfo_id_e6d47a80_fk_account_u` FOREIGN KEY (`userinfo_id`) REFERENCES `account_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of account_userinfo_user_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for account_usersource
-- ----------------------------
DROP TABLE IF EXISTS `account_usersource`;
CREATE TABLE `account_usersource` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of account_usersource
-- ----------------------------
BEGIN;
INSERT INTO `account_usersource` (`id`, `name`) VALUES (1, '直接注册');
INSERT INTO `account_usersource` (`id`, `name`) VALUES (2, 'github');
INSERT INTO `account_usersource` (`id`, `name`) VALUES (3, '微博');
INSERT INTO `account_usersource` (`id`, `name`) VALUES (4, 'qq');
INSERT INTO `account_usersource` (`id`, `name`) VALUES (5, '支付宝');
INSERT INTO `account_usersource` (`id`, `name`) VALUES (6, '百度');
INSERT INTO `account_usersource` (`id`, `name`) VALUES (7, '微软');
COMMIT;

-- ----------------------------
-- Table structure for api_uploadimg
-- ----------------------------
DROP TABLE IF EXISTS `api_uploadimg`;
CREATE TABLE `api_uploadimg` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `images` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of api_uploadimg
-- ----------------------------
BEGIN;
INSERT INTO `api_uploadimg` (`id`, `images`) VALUES (1, 'tmp/Docker_1.png');
INSERT INTO `api_uploadimg` (`id`, `images`) VALUES (2, 'api.UploadImg.dir/Docker_1.png');
COMMIT;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (21, 'Can add 上传图片', 6, 'add_uploadimg');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (22, 'Can change 上传图片', 6, 'change_uploadimg');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (23, 'Can delete 上传图片', 6, 'delete_uploadimg');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (24, 'Can view 上传图片', 6, 'view_uploadimg');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (25, 'Can add 文章分类', 7, 'add_category');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (26, 'Can change 文章分类', 7, 'change_category');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (27, 'Can delete 文章分类', 7, 'delete_category');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (28, 'Can view 文章分类', 7, 'view_category');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (29, 'Can add 笔记名称', 8, 'add_note');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (30, 'Can change 笔记名称', 8, 'change_note');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (31, 'Can delete 笔记名称', 8, 'delete_note');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (32, 'Can view 笔记名称', 8, 'view_note');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (33, 'Can add 文章标签', 9, 'add_tag');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (34, 'Can change 文章标签', 9, 'change_tag');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (35, 'Can delete 文章标签', 9, 'delete_tag');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (36, 'Can view 文章标签', 9, 'view_tag');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (37, 'Can add 笔记内容', 10, 'add_section');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (38, 'Can change 笔记内容', 10, 'change_section');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (39, 'Can delete 笔记内容', 10, 'delete_section');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (40, 'Can view 笔记内容', 10, 'view_section');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (41, 'Can add 笔记目录', 11, 'add_catalogue');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (42, 'Can change 笔记目录', 11, 'change_catalogue');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (43, 'Can delete 笔记目录', 11, 'delete_catalogue');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (44, 'Can view 笔记目录', 11, 'view_catalogue');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (45, 'Can add 文章内容', 12, 'add_article');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (46, 'Can change 文章内容', 12, 'change_article');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (47, 'Can delete 文章内容', 12, 'delete_article');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (48, 'Can view 文章内容', 12, 'view_article');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (49, 'Can add 用户详细信息', 13, 'add_userinfo');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (50, 'Can change 用户详细信息', 13, 'change_userinfo');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (51, 'Can delete 用户详细信息', 13, 'delete_userinfo');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (52, 'Can view 用户详细信息', 13, 'view_userinfo');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (53, 'Can add 关于页面', 14, 'add_about');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (54, 'Can change 关于页面', 14, 'change_about');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (55, 'Can delete 关于页面', 14, 'delete_about');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (56, 'Can view 关于页面', 14, 'view_about');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (57, 'Can add 轮播图管理', 15, 'add_carousel');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (58, 'Can change 轮播图管理', 15, 'change_carousel');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (59, 'Can delete 轮播图管理', 15, 'delete_carousel');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (60, 'Can view 轮播图管理', 15, 'view_carousel');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (61, 'Can add 图片配置', 16, 'add_imagesconfig');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (62, 'Can change 图片配置', 16, 'change_imagesconfig');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (63, 'Can delete 图片配置', 16, 'delete_imagesconfig');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (64, 'Can view 图片配置', 16, 'view_imagesconfig');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (65, 'Can add 博主信息', 17, 'add_info');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (66, 'Can change 博主信息', 17, 'change_info');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (67, 'Can delete 博主信息', 17, 'delete_info');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (68, 'Can view 博主信息', 17, 'view_info');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (69, 'Can add 友情链接', 18, 'add_link');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (70, 'Can change 友情链接', 18, 'change_link');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (71, 'Can delete 友情链接', 18, 'delete_link');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (72, 'Can view 友情链接', 18, 'view_link');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (73, 'Can add 网站配置', 19, 'add_websiteconfig');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (74, 'Can change 网站配置', 19, 'change_websiteconfig');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (75, 'Can delete 网站配置', 19, 'delete_websiteconfig');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (76, 'Can view 网站配置', 19, 'view_websiteconfig');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (77, 'Can add 笔记浏览记录', 20, 'add_sectionviewhistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (78, 'Can change 笔记浏览记录', 20, 'change_sectionviewhistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (79, 'Can delete 笔记浏览记录', 20, 'delete_sectionviewhistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (80, 'Can view 笔记浏览记录', 20, 'view_sectionviewhistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (81, 'Can add 笔记评论回复记录', 21, 'add_sectionmessage');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (82, 'Can change 笔记评论回复记录', 21, 'change_sectionmessage');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (83, 'Can delete 笔记评论回复记录', 21, 'delete_sectionmessage');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (84, 'Can view 笔记评论回复记录', 21, 'view_sectionmessage');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (85, 'Can add 留言回复记录', 22, 'add_leavemessage');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (86, 'Can change 留言回复记录', 22, 'change_leavemessage');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (87, 'Can delete 留言回复记录', 22, 'delete_leavemessage');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (88, 'Can view 留言回复记录', 22, 'view_leavemessage');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (89, 'Can add 博文评论回复记录', 23, 'add_commentmessage');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (90, 'Can change 博文评论回复记录', 23, 'change_commentmessage');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (91, 'Can delete 博文评论回复记录', 23, 'delete_commentmessage');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (92, 'Can view 博文评论回复记录', 23, 'view_commentmessage');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (93, 'Can add 博文浏览记录', 24, 'add_articleviewhistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (94, 'Can change 博文浏览记录', 24, 'change_articleviewhistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (95, 'Can delete 博文浏览记录', 24, 'delete_articleviewhistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (96, 'Can view 博文浏览记录', 24, 'view_articleviewhistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (97, 'Can add 网站配置', 25, 'add_siteconfig');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (98, 'Can change 网站配置', 25, 'change_siteconfig');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (99, 'Can delete 网站配置', 25, 'delete_siteconfig');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (100, 'Can view 网站配置', 25, 'view_siteconfig');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (101, 'Can add 博文浏览记录', 26, 'add_articlehistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (102, 'Can change 博文浏览记录', 26, 'change_articlehistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (103, 'Can delete 博文浏览记录', 26, 'delete_articlehistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (104, 'Can view 博文浏览记录', 26, 'view_articlehistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (105, 'Can add 搜索记录', 27, 'add_searchhistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (106, 'Can change 搜索记录', 27, 'change_searchhistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (107, 'Can delete 搜索记录', 27, 'delete_searchhistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (108, 'Can view 搜索记录', 27, 'view_searchhistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (109, 'Can add 笔记浏览记录', 28, 'add_sectionhistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (110, 'Can change 笔记浏览记录', 28, 'change_sectionhistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (111, 'Can delete 笔记浏览记录', 28, 'delete_sectionhistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (112, 'Can view 笔记浏览记录', 28, 'view_sectionhistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (113, 'Can add 博文评论回复记录', 23, 'add_articlecomment');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (114, 'Can change 博文评论回复记录', 23, 'change_articlecomment');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (115, 'Can delete 博文评论回复记录', 23, 'delete_articlecomment');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (116, 'Can view 博文评论回复记录', 23, 'view_articlecomment');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (117, 'Can add 留言记录', 22, 'add_message');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (118, 'Can change 留言记录', 22, 'change_message');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (119, 'Can delete 留言记录', 22, 'delete_message');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (120, 'Can view 留言记录', 22, 'view_message');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (121, 'Can add 笔记评论回复记录', 21, 'add_sectioncomment');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (122, 'Can change 笔记评论回复记录', 21, 'change_sectioncomment');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (123, 'Can delete 笔记评论回复记录', 21, 'delete_sectioncomment');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (124, 'Can view 笔记评论回复记录', 21, 'view_sectioncomment');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (125, 'Can add 消息记录', 29, 'add_messagehistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (126, 'Can change 消息记录', 29, 'change_messagehistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (127, 'Can delete 消息记录', 29, 'delete_messagehistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (128, 'Can view 消息记录', 29, 'view_messagehistory');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (129, 'Can add 上传图片', 30, 'add_uploadimg');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (130, 'Can change 上传图片', 30, 'change_uploadimg');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (131, 'Can delete 上传图片', 30, 'delete_uploadimg');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (132, 'Can view 上传图片', 30, 'view_uploadimg');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (133, 'Can add 搜索关键词', 31, 'add_searchkey');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (134, 'Can change 搜索关键词', 31, 'change_searchkey');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (135, 'Can delete 搜索关键词', 31, 'delete_searchkey');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (136, 'Can view 搜索关键词', 31, 'view_searchkey');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (137, 'Can add 搜索关键词', 32, 'add_searchkey');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (138, 'Can change 搜索关键词', 32, 'change_searchkey');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (139, 'Can delete 搜索关键词', 32, 'delete_searchkey');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (140, 'Can view 搜索关键词', 32, 'view_searchkey');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (141, 'Can add association', 33, 'add_association');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (142, 'Can change association', 33, 'change_association');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (143, 'Can delete association', 33, 'delete_association');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (144, 'Can view association', 33, 'view_association');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (145, 'Can add code', 34, 'add_code');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (146, 'Can change code', 34, 'change_code');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (147, 'Can delete code', 34, 'delete_code');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (148, 'Can view code', 34, 'view_code');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (149, 'Can add nonce', 35, 'add_nonce');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (150, 'Can change nonce', 35, 'change_nonce');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (151, 'Can delete nonce', 35, 'delete_nonce');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (152, 'Can view nonce', 35, 'view_nonce');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (153, 'Can add user social auth', 36, 'add_usersocialauth');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (154, 'Can change user social auth', 36, 'change_usersocialauth');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (155, 'Can delete user social auth', 36, 'delete_usersocialauth');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (156, 'Can view user social auth', 36, 'view_usersocialauth');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (157, 'Can add partial', 37, 'add_partial');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (158, 'Can change partial', 37, 'change_partial');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (159, 'Can delete partial', 37, 'delete_partial');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (160, 'Can view partial', 37, 'view_partial');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (161, 'Can add application', 38, 'add_application');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (162, 'Can change application', 38, 'change_application');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (163, 'Can delete application', 38, 'delete_application');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (164, 'Can view application', 38, 'view_application');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (165, 'Can add access token', 39, 'add_accesstoken');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (166, 'Can change access token', 39, 'change_accesstoken');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (167, 'Can delete access token', 39, 'delete_accesstoken');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (168, 'Can view access token', 39, 'view_accesstoken');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (169, 'Can add grant', 40, 'add_grant');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (170, 'Can change grant', 40, 'change_grant');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (171, 'Can delete grant', 40, 'delete_grant');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (172, 'Can view grant', 40, 'view_grant');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (173, 'Can add refresh token', 41, 'add_refreshtoken');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (174, 'Can change refresh token', 41, 'change_refreshtoken');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (175, 'Can delete refresh token', 41, 'delete_refreshtoken');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (176, 'Can view refresh token', 41, 'view_refreshtoken');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (177, 'Can add id token', 42, 'add_idtoken');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (178, 'Can change id token', 42, 'change_idtoken');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (179, 'Can delete id token', 42, 'delete_idtoken');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (180, 'Can view id token', 42, 'view_idtoken');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (181, 'Can add 注册用户来源', 43, 'add_usersource');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (182, 'Can change 注册用户来源', 43, 'change_usersource');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (183, 'Can delete 注册用户来源', 43, 'delete_usersource');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (184, 'Can view 注册用户来源', 43, 'view_usersource');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (185, 'Can add 第三方密钥', 44, 'add_useroauth');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (186, 'Can change 第三方密钥', 44, 'change_useroauth');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (187, 'Can delete 第三方密钥', 44, 'delete_useroauth');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (188, 'Can view 第三方密钥', 44, 'view_useroauth');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (189, 'Can add django job', 45, 'add_djangojob');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (190, 'Can change django job', 45, 'change_djangojob');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (191, 'Can delete django job', 45, 'delete_djangojob');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (192, 'Can view django job', 45, 'view_djangojob');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (193, 'Can add django job execution', 46, 'add_djangojobexecution');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (194, 'Can change django job execution', 46, 'change_djangojobexecution');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (195, 'Can delete django job execution', 46, 'delete_djangojobexecution');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (196, 'Can view django job execution', 46, 'view_djangojobexecution');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (197, 'Can add 第三方登录用户ID', 47, 'add_oauthid');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (198, 'Can change 第三方登录用户ID', 47, 'change_oauthid');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (199, 'Can delete 第三方登录用户ID', 47, 'delete_oauthid');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (200, 'Can view 第三方登录用户ID', 47, 'view_oauthid');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (201, 'Can add site', 48, 'add_site');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (202, 'Can change site', 48, 'change_site');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (203, 'Can delete site', 48, 'delete_site');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (204, 'Can view site', 48, 'view_site');
COMMIT;

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `abstract` longtext NOT NULL,
  `body` longtext NOT NULL,
  `view` int unsigned NOT NULL,
  `like` int unsigned NOT NULL,
  `collect` int unsigned NOT NULL,
  `comment` int unsigned NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `modified_time` datetime(6) NOT NULL,
  `is_recommend` tinyint(1) NOT NULL,
  `is_release` tinyint(1) NOT NULL,
  `author_id` bigint NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `cover` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_article_author_id_905add38_fk_account_userinfo_id` (`author_id`),
  KEY `blog_article_category_id_7e38f15e_fk_blog_category_id` (`category_id`),
  KEY `blog_articl_title_12b0b3_idx` (`title`,`category_id`,`created_time`),
  CONSTRAINT `blog_article_author_id_905add38_fk_account_userinfo_id` FOREIGN KEY (`author_id`) REFERENCES `account_userinfo` (`id`),
  CONSTRAINT `blog_article_category_id_7e38f15e_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`),
  CONSTRAINT `blog_article_chk_1` CHECK ((`view` >= 0)),
  CONSTRAINT `blog_article_chk_2` CHECK ((`like` >= 0)),
  CONSTRAINT `blog_article_chk_4` CHECK ((`comment` >= 0)),
  CONSTRAINT `blog_article_collect_50915e87_check` CHECK ((`collect` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
BEGIN;
INSERT INTO `blog_article` (`id`, `title`, `abstract`, `body`, `view`, `like`, `collect`, `comment`, `created_time`, `modified_time`, `is_recommend`, `is_release`, `author_id`, `category_id`, `cover`) VALUES (1, 'linux运维工程师面试题总结', '本人花费为期一周的时间，参加了数十家互联网公司的面试，主要方向是linux、容器运维、自动化运维，其中包括IBM、新浪、完美世界等公司。以下是本人参加面试时遇到的考题，希望可以帮助到大家！', '> 本人花费为期一周的时间，参加了数十家互联网公司的面试，主要方向是linux、容器运维、自动化运维，其中包括IBM、新浪、完美世界等公司。以下是本人参加面试时遇到的考题，希望可以帮助到大家！\r\n\r\n# 一、linux\r\n\r\n1. 系统启动流程\r\n1. linux文件类型\r\n1. centos6和7怎么添加程序开机自启动？\r\n1. 如何升级内核，目前最新版本号多少？\r\n1. nginx日志访问量前十的ip怎么统计？\r\n1. 删除/var/log/下.log结尾的30天前的日志文件\r\n1. ansible有哪些模块？功能是什么？\r\n1. nginx性能为什么比apache高？\r\n1. 四层负载和七层负载区别是什么？\r\n1. lvs有哪些工作模式？哪个性能高？\r\n1. lvs nginx haproxy keeplived区别，优缺点？\r\n1. 如下url地址，各个部分的含义\r\nhttps://www.baidu.com/s?word=123&ie=utf-8\r\n1. tomcat各个目录含义，如何修改端口，如何修改内存数？\r\n1. nginx反向代理时，如何使后端获取真正的访问来源ip？\r\n1. nginx负载均衡算法有哪些？\r\n1. 如何进行压力测试？\r\n1. curl命令如何发送https请求？如何查看response头信息？如何发送get和post表单信息？\r\n\r\n# 二、mysql\r\n\r\n1. 索引的为什么使查询加快？有啥缺点？\r\n1. sql语句左外连接 右外连接 内连接 全连接区别\r\n1. mysql数据备份方式，如何恢复？你们的备份策略是什么？\r\n1. 如何配置数据库主从同步，实际工作中是否遇到数据不一致问题？如何解决？\r\n1. mysql约束有哪些？\r\n1. 二进制日志（binlog）用途？\r\n1. mysql数据引擎有哪些？\r\n1. 如何查询mysql数据库存放路径？\r\n1. mysql数据库文件后缀名有哪些？用途什么？\r\n1. 如何修改数据库用户的密码？\r\n1. 如何修改用户权限？如何查看？\r\n\r\n# 三、nosql\r\n\r\n1. redis数据持久化有哪些方式？\r\n1. redis集群方案有哪些？\r\n1. redis如何进行数据备份与恢复？\r\n1. MongoDB如何进行数据备份？\r\n1. kafka为何比redis rabbitmq快？\r\n\r\n# 四、docker\r\n\r\n1. dockerfile有哪些关键字？用途是什么？\r\n1. 如何减小dockerfile生成镜像体积？\r\n1. dockerfile中CMD与ENTRYPOINT区别是什么？\r\n1. dockerfile中COPY和ADD区别是什么？\r\n1. docker的cs架构组件有哪些？\r\n1. docker网络类型有哪些？\r\n1. 如何配置docker远程访问？\r\n1. docker核心namespace CGroups 联合文件系统功能是什么？\r\n1. 命令相关：导入导出镜像，进入容器，设置重启容器策略，查看镜像环境变量，查看容器占用资源\r\n1. 构建镜像有哪些方式？\r\n1. docker和vmware虚拟化区别？\r\n\r\n\r\n\r\n# 五、kubernetes\r\n\r\n1. k8s的集群组件有哪些？功能是什么？\r\n1. kubectl命令相关：如何修改副本数，如何滚动更新和回滚，如何查看pod的详细信息，如何进入pod交互？\r\n1. etcd数据如何备份？\r\n1. k8s控制器有哪些？\r\n1. 哪些是集群级别的资源？\r\n1. pod状态有哪些？\r\n1. pod创建过程是什么？\r\n1. pod重启策略有哪些？\r\n1. 资源探针有哪些？\r\n1. requests和limits用途是什么？\r\n1. kubeconfig文件包含什么内容，用途是什么？\r\n1. RBAC中role和clusterrole区别，rolebinding和 clusterrolebinding区别？\r\n1. ipvs为啥比iptables效率高？\r\n1. sc pv pvc用途，容器挂载存储整个流程是什么？\r\n1. nginx ingress的原理本质是什么？\r\n1. 网络类型，描述不同node上的Pod之间的通信流程\r\n1. k8s集群节点需要关机维护，需要怎么操作\r\n\r\n# 六、prometheus\r\n\r\n1. prometheus对比zabbix有哪些优势？\r\n1. prometheus组件有哪些，功能是什么？\r\n1. 指标类型有哪些？\r\n1. 在应对上千节点监控时，如何保障性能\r\n1. （降低采集频率，缩小历史数据保存天数，使用集群联邦和远程存储）\r\n1. 简述从添加节点监控到grafana成图的整个流程\r\n1. 在工作中用到了哪些exporter\r\n\r\n# 七、ELK\r\n\r\n1. Elasticsearch的数据如何备份与恢复？\r\n1. 你们项目中使用的logstash过滤器插件是什么？实现哪些功能？\r\n1. 是否用到了filebeat的内置module？用了哪些？\r\n1. kibana如何自定义图表和仪表盘？\r\n1. elasticsearch分片副本是什么？你们配置的参数是多少？\r\n\r\n# 八、运维开发\r\n\r\n1. 备份系统中所有镜像\r\n1. 编写脚本，定时备份某个库，然后压缩，发送异机\r\n1. （注意：①公共部分定义函数，如获取时间戳，配置报警接口②异常处理，如数据库大，检测任务是否完成。检测生成文件大小是否是空文件）\r\n1. 批量获取所有主机的系统信息\r\n1. django的mtv模式流程\r\n1. python如何导出、导入环境依赖包\r\n1. python创建，进入，退出，查看虚拟环境\r\n1. flask和django区别，应用场景\r\n1. flask开发一个hello word页面流程\r\n1. 列举常用的git命令\r\n1. git gitlab jenkins的CICD流程如何配置\r\n\r\n\r\n\r\n# 九、日常工作\r\n\r\n1. 在日常工作中遇到了什么棘手的问题，如何排查\r\n\r\n（①redis弱口令导致中挖矿病毒，排查，优化②k8s中开发的程序在用户上传文件时开启进程，未及时关闭，导致节点超出最大进程数）\r\n\r\n3. 日常故障处理流程\r\n2. 修改线上业务配置文件流程\r\n2. 业务pv多少？集群规模多少？怎么保障业务高可用？\r\n\r\n# 十、开放性问题\r\n\r\n1. 你认为初级运维工程师和高级运维工程师的区别？（初级干活的，会操作，顺利完成领导安排的任务。高级优化架构，研究如何避免问题，研究新技术并引用）\r\n1. 你认为未来运维发展方向（自动化，智能化）', 2316, 20, 0, 0, '2020-11-08 11:37:41.588291', '2022-05-26 09:12:47.848511', 1, 1, 1, 8, 'https://oss.cuiliangblog.cn/articleCover/2020_12_11_20_32_48_685428.jpg');
COMMIT;

-- ----------------------------
-- Table structure for blog_article_tags
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_tags`;
CREATE TABLE `blog_article_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `article_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_article_tags_article_id_tag_id_b78a22e9_uniq` (`article_id`,`tag_id`),
  KEY `blog_article_tags_tag_id_88eb3ed9_fk_blog_tag_id` (`tag_id`),
  CONSTRAINT `blog_article_tags_article_id_82c02dd6_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `blog_article_tags_tag_id_88eb3ed9_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of blog_article_tags
-- ----------------------------
BEGIN;
INSERT INTO `blog_article_tags` (`id`, `article_id`, `tag_id`) VALUES (47, 1, 5);
INSERT INTO `blog_article_tags` (`id`, `article_id`, `tag_id`) VALUES (2, 1, 9);
COMMIT;

-- ----------------------------
-- Table structure for blog_catalogue
-- ----------------------------
DROP TABLE IF EXISTS `blog_catalogue`;
CREATE TABLE `blog_catalogue` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `order` int NOT NULL,
  `level` int NOT NULL,
  `father` int DEFAULT NULL,
  `note_id` bigint NOT NULL,
  `section_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_catalogue_note_id_9f765cc4_fk_blog_note_id` (`note_id`),
  KEY `blog_catalogue_section_id_55c0f70a_fk_blog_section_id` (`section_id`),
  CONSTRAINT `blog_catalogue_note_id_9f765cc4_fk_blog_note_id` FOREIGN KEY (`note_id`) REFERENCES `blog_note` (`id`),
  CONSTRAINT `blog_catalogue_section_id_55c0f70a_fk_blog_section_id` FOREIGN KEY (`section_id`) REFERENCES `blog_section` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of blog_catalogue
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
BEGIN;
INSERT INTO `blog_category` (`id`, `name`) VALUES (1, 'Linux');
INSERT INTO `blog_category` (`id`, `name`) VALUES (2, 'MySQL');
INSERT INTO `blog_category` (`id`, `name`) VALUES (3, 'Python');
INSERT INTO `blog_category` (`id`, `name`) VALUES (4, 'Django');
INSERT INTO `blog_category` (`id`, `name`) VALUES (5, 'Docker');
INSERT INTO `blog_category` (`id`, `name`) VALUES (6, 'Kubernetes');
INSERT INTO `blog_category` (`id`, `name`) VALUES (7, 'CI/CD');
INSERT INTO `blog_category` (`id`, `name`) VALUES (8, '其他');
INSERT INTO `blog_category` (`id`, `name`) VALUES (9, '前端');
INSERT INTO `blog_category` (`id`, `name`) VALUES (10, 'Prometheus');
INSERT INTO `blog_category` (`id`, `name`) VALUES (11, 'ElasticSearch');
COMMIT;

-- ----------------------------
-- Table structure for blog_note
-- ----------------------------
DROP TABLE IF EXISTS `blog_note`;
CREATE TABLE `blog_note` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `cover` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of blog_note
-- ----------------------------
BEGIN;
INSERT INTO `blog_note` (`id`, `name`, `cover`) VALUES (1, 'Kubernetes', 'https://oss.cuiliangblog.cn/noteCover/kubernetes.png');
INSERT INTO `blog_note` (`id`, `name`, `cover`) VALUES (2, 'Docker', 'https://oss.cuiliangblog.cn/noteCover/docker.jpeg');
INSERT INTO `blog_note` (`id`, `name`, `cover`) VALUES (3, 'Prometheus', 'https://oss.cuiliangblog.cn/noteCover/prometheus.png');
COMMIT;

-- ----------------------------
-- Table structure for blog_section
-- ----------------------------
DROP TABLE IF EXISTS `blog_section`;
CREATE TABLE `blog_section` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `body` longtext NOT NULL,
  `view` int unsigned NOT NULL,
  `like` int unsigned NOT NULL,
  `collect` int unsigned NOT NULL,
  `comment` int unsigned NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `modified_time` datetime(6) NOT NULL,
  `is_release` tinyint(1) NOT NULL,
  `author_id` bigint NOT NULL,
  `note_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_section_author_id_2703d732_fk_account_userinfo_id` (`author_id`),
  KEY `blog_section_note_id_6035d84b_fk_blog_note_id` (`note_id`),
  KEY `blog_sectio_title_2d7f6a_idx` (`title`,`note_id`,`created_time`),
  CONSTRAINT `blog_section_author_id_2703d732_fk_account_userinfo_id` FOREIGN KEY (`author_id`) REFERENCES `account_userinfo` (`id`),
  CONSTRAINT `blog_section_note_id_6035d84b_fk_blog_note_id` FOREIGN KEY (`note_id`) REFERENCES `blog_note` (`id`),
  CONSTRAINT `blog_section_chk_1` CHECK ((`view` >= 0)),
  CONSTRAINT `blog_section_chk_2` CHECK ((`like` >= 0)),
  CONSTRAINT `blog_section_chk_4` CHECK ((`comment` >= 0)),
  CONSTRAINT `blog_section_collect_40716f68_check` CHECK ((`collect` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of blog_section
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
BEGIN;
INSERT INTO `blog_tag` (`id`, `name`) VALUES (1, '入门简介');
INSERT INTO `blog_tag` (`id`, `name`) VALUES (2, '实验案例');
INSERT INTO `blog_tag` (`id`, `name`) VALUES (3, '理论基础');
INSERT INTO `blog_tag` (`id`, `name`) VALUES (4, '容器');
INSERT INTO `blog_tag` (`id`, `name`) VALUES (5, '数据库');
INSERT INTO `blog_tag` (`id`, `name`) VALUES (6, '服务部署');
INSERT INTO `blog_tag` (`id`, `name`) VALUES (8, '编程开发');
INSERT INTO `blog_tag` (`id`, `name`) VALUES (9, '经验总结');
COMMIT;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_account_userinfo_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `account_userinfo` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=1368 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
BEGIN;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1, '2021-05-07 02:02:07.521041', '1', 'UploadImg object (1)', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (2, '2021-05-07 02:03:06.828624', '2', 'UploadImg object (2)', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (3, '2021-05-08 08:06:52.346351', '4', '七牛云', 2, '[{\"changed\": {\"fields\": [\"\\u8f6e\\u64ad\\u56fe\"]}}]', 15, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (4, '2021-05-08 08:07:10.823188', '3', '阿里云', 2, '[{\"changed\": {\"fields\": [\"\\u8f6e\\u64ad\\u56fe\"]}}]', 15, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (5, '2021-05-08 08:07:33.739057', '2', '语雀', 2, '[{\"changed\": {\"fields\": [\"\\u8f6e\\u64ad\\u56fe\"]}}]', 15, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (6, '2021-05-08 08:07:47.311720', '1', 'Prometheus笔记', 2, '[{\"changed\": {\"fields\": [\"\\u8f6e\\u64ad\\u56fe\"]}}]', 15, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (7, '2021-05-09 12:37:41.712223', '1', 'linux运维工程师面试题总结', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (8, '2021-05-09 12:39:19.714128', '2', '运维工程师面试总结(含答案)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (9, '2021-05-09 12:40:52.094173', '3', 'Django使用百度统计进行流量分析', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (10, '2021-05-09 12:43:49.438450', '4', 'Django项目使用CDN加速', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (11, '2021-05-09 12:45:06.359743', '5', '使用阿里云SDK监控主机状态', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (12, '2021-05-09 12:46:13.574453', '6', 'python爬虫自动更换必应壁纸', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (13, '2021-05-09 12:47:19.371905', '7', 'Django第三方账号登录（QQ、微博、github）', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (14, '2021-05-09 12:48:20.554179', '8', 'python读取csv处理生成excel', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (15, '2021-05-09 12:49:39.063431', '9', 'Vue项目上线前优化总结', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (16, '2021-05-09 12:50:46.842792', '10', 'Vue+NodeJS前后端分离项目Docker部署', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (17, '2021-05-09 12:52:02.320824', '11', 'flex弹性布局总结', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (18, '2021-05-09 12:53:17.220073', '12', 'VUE3封装axios网络请求示例', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (19, '2021-05-09 12:54:19.300182', '13', 'DRF序列化器学习总结', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (20, '2021-05-09 12:55:32.238434', '14', 'DRF视图总结', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (21, '2021-05-09 12:56:42.476970', '15', '如何使用coding优雅的开发项目', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (22, '2021-05-09 12:57:49.375353', '16', '使用coding拉取外网镜像与资源', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (23, '2021-05-09 12:59:00.671634', '17', 'Python获取prometheus监控和告警数据', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (24, '2021-05-09 12:59:58.779097', '18', 'VUE3添加animate页面切换动画', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (25, '2021-05-09 13:00:27.412504', '5', '使用阿里云SDK监控主机状态', 2, '[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (26, '2021-05-09 13:36:54.154487', '15', '如何使用coding优雅的开发项目', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5c01\\u9762\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (27, '2021-05-10 00:26:58.644695', '2', '运维工程师面试总结(含答案)', 2, '[{\"changed\": {\"fields\": [\"\\u8bc4\\u8bba\\u6570\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (28, '2021-05-10 00:27:24.504777', '10', 'Vue+NodeJS前后端分离项目Docker部署', 2, '[{\"changed\": {\"fields\": [\"\\u8bc4\\u8bba\\u6570\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (29, '2021-05-15 09:31:02.271523', '19', 'VIM编辑器使用总结', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (30, '2021-05-15 09:39:00.003638', '20', 'docker部署使用MySQL', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (31, '2021-05-15 09:44:02.444399', '20', 'docker部署使用MySQL', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (32, '2021-05-15 09:51:26.729072', '21', 'k8s集群状态与日志查看', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (33, '2021-05-15 12:21:52.842319', '1', 'Kubernetes', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (34, '2021-05-15 12:22:44.809237', '2', 'Docker', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (35, '2021-05-15 12:23:22.146798', '3', 'Prometheus', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (36, '2021-05-16 01:43:06.958665', '18', 'VUE3添加animate页面切换动画', 2, '[{\"changed\": {\"fields\": [\"\\u6458\\u8981\", \"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (37, '2021-05-16 10:29:44.406711', '20', 'docker部署使用MySQL', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (38, '2021-05-17 00:34:20.464812', '3', 'Django使用百度统计进行流量分析', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (39, '2021-05-17 00:36:42.429959', '3', 'Django使用百度统计进行流量分析', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (40, '2021-05-17 00:37:00.987919', '3', 'Django使用百度统计进行流量分析', 2, '[]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (41, '2021-05-17 00:39:28.929589', '3', 'Django使用百度统计进行流量分析', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (42, '2021-05-17 01:04:54.689771', '3', 'Django使用百度统计进行流量分析', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (43, '2021-05-20 13:05:26.653990', '100', 'k8s高可用部署', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (44, '2021-05-20 13:07:10.820585', '3', 'kubernetes特性', 2, '[{\"changed\": {\"fields\": [\"\\u6807\\u9898\\u540d\\u79f0\"]}}]', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (45, '2021-05-20 14:06:09.288248', '4', '概念和术语', 2, '[{\"changed\": {\"fields\": [\"\\u6807\\u9898\\u540d\\u79f0\"]}}]', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (46, '2021-05-21 09:32:26.777805', '2', '南城阿宇', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (47, '2021-05-21 09:33:26.045902', '3', '浮生若梦', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (48, '2021-05-21 09:33:55.510887', '2', '南城阿宇', 2, '[{\"changed\": {\"fields\": [\"\\u5f00\\u542f\\u66f4\\u65b0\\u8ba2\\u9605\"]}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (49, '2021-05-21 09:34:34.610036', '4', '蕉太狼', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (50, '2021-05-22 01:15:20.337290', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Last login\", \"Email address\"]}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (51, '2021-05-22 01:17:21.949867', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"\\u624b\\u673a\\u53f7\"]}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (52, '2021-05-26 00:30:33.698792', '5', 'adc', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (53, '2021-05-27 14:49:08.894565', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Last login\", \"\\u4e2a\\u4eba\\u7f51\\u7ad9\"]}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (54, '2021-05-30 13:45:22.872933', '8', '张三', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (55, '2021-06-01 00:07:00.482758', '15', '如何使用coding优雅的开发项目', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (56, '2021-06-01 03:01:20.666378', '3', 'Django使用百度统计进行流量分析', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (57, '2021-06-01 03:03:13.954084', '3', 'Django使用百度统计进行流量分析', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (58, '2021-06-01 03:08:51.146606', '20', 'docker部署使用MySQL', 2, '[{\"changed\": {\"fields\": [\"\\u6807\\u7b7e\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (59, '2021-06-02 12:51:29.516507', '4', 'Django项目使用CDN加速', 2, '[{\"changed\": {\"fields\": [\"\\u6807\\u7b7e\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (60, '2021-06-02 12:52:29.495501', '14', 'DRF视图总结', 2, '[{\"changed\": {\"fields\": [\"\\u6807\\u7b7e\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (61, '2021-06-02 12:53:32.189556', '7', '虚拟化', 3, '', 9, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (62, '2021-06-03 10:57:49.258838', '22', 'grafana告警与webhook配置', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (63, '2021-06-03 11:28:49.622164', '22', 'grafana告警与webhook配置', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5c01\\u9762\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (64, '2021-06-03 11:29:42.424502', '22', 'grafana告警与webhook配置', 2, '[{\"changed\": {\"fields\": [\"Body\", \"\\u9605\\u8bfb\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (65, '2021-06-04 12:29:16.202063', '1', 'content:coding,username:张三', 1, '[{\"added\": {}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (66, '2021-06-04 12:29:33.989440', '2', 'content:vue3,username:南城阿宇', 1, '[{\"added\": {}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (67, '2021-06-04 12:30:11.731052', '3', 'content:爬虫,username:浮生若梦', 1, '[{\"added\": {}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (68, '2021-06-04 12:31:09.555813', '4', 'content:docker,username:张三', 1, '[{\"added\": {}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (69, '2021-06-04 12:31:35.157594', '5', 'content:阿里云,username:南城阿宇', 1, '[{\"added\": {}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (70, '2021-06-04 12:31:49.839453', '6', 'content:CDN,username:张三', 1, '[{\"added\": {}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (71, '2021-06-04 12:32:07.110042', '7', 'content:mysql,username:admin', 1, '[{\"added\": {}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (72, '2021-06-04 12:32:38.111783', '8', 'content:面试,username:张三', 1, '[{\"added\": {}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (73, '2021-06-04 12:33:02.059769', '9', 'content:面试,username:南城阿宇', 1, '[{\"added\": {}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (74, '2021-06-04 12:33:26.439939', '10', 'content:面试,username:浮生若梦', 1, '[{\"added\": {}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (75, '2021-06-04 12:33:49.545041', '11', 'content:k8s,username:张三', 1, '[{\"added\": {}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (76, '2021-06-04 12:34:04.295043', '12', 'content:vue3,username:浮生若梦', 1, '[{\"added\": {}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (77, '2021-06-04 13:34:38.770818', '1', 'coding', 2, '[{\"changed\": {\"fields\": [\"\\u641c\\u7d22\\u7528\\u6237\"]}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (78, '2021-06-04 13:34:59.278643', '12', 'vue', 2, '[{\"changed\": {\"fields\": [\"\\u5173\\u952e\\u8bcd\", \"\\u641c\\u7d22\\u7528\\u6237\"]}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (79, '2021-06-04 13:35:08.848122', '10', '面试', 2, '[{\"changed\": {\"fields\": [\"\\u641c\\u7d22\\u7528\\u6237\"]}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (80, '2021-06-04 13:35:25.703586', '9', 'prometheus', 2, '[{\"changed\": {\"fields\": [\"\\u5173\\u952e\\u8bcd\", \"\\u641c\\u7d22\\u7528\\u6237\"]}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (81, '2021-06-04 13:35:40.011735', '8', 'grafana', 2, '[{\"changed\": {\"fields\": [\"\\u5173\\u952e\\u8bcd\", \"\\u641c\\u7d22\\u7528\\u6237\"]}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (82, '2021-06-04 13:35:47.225170', '11', 'k8s', 2, '[{\"changed\": {\"fields\": [\"\\u641c\\u7d22\\u7528\\u6237\"]}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (83, '2021-06-04 13:35:55.463845', '7', 'mysql', 2, '[{\"changed\": {\"fields\": [\"\\u641c\\u7d22\\u7528\\u6237\"]}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (84, '2021-06-04 13:36:02.340316', '6', 'CDN', 2, '[{\"changed\": {\"fields\": [\"\\u641c\\u7d22\\u7528\\u6237\"]}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (85, '2021-06-04 13:36:09.916933', '5', '阿里云', 2, '[{\"changed\": {\"fields\": [\"\\u641c\\u7d22\\u7528\\u6237\"]}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (86, '2021-06-04 13:36:20.504362', '4', 'docker', 2, '[{\"changed\": {\"fields\": [\"\\u641c\\u7d22\\u7528\\u6237\"]}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (87, '2021-06-04 13:36:27.896283', '3', '爬虫', 2, '[{\"changed\": {\"fields\": [\"\\u641c\\u7d22\\u7528\\u6237\"]}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (88, '2021-06-04 13:36:34.781919', '2', 'vue3', 2, '[{\"changed\": {\"fields\": [\"\\u641c\\u7d22\\u7528\\u6237\"]}}]', 27, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (89, '2021-06-04 14:05:09.937365', '1', '面试', 1, '[{\"added\": {}}]', 31, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (90, '2021-06-04 14:05:14.512385', '2', 'vue3', 1, '[{\"added\": {}}]', 31, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (91, '2021-06-04 14:05:19.122711', '3', 'coding', 1, '[{\"added\": {}}]', 31, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (92, '2021-06-04 14:05:23.993712', '4', '爬虫', 1, '[{\"added\": {}}]', 31, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (93, '2021-06-04 14:05:28.502327', '5', 'docker', 1, '[{\"added\": {}}]', 31, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (94, '2021-06-04 14:05:33.196530', '6', '阿里云', 1, '[{\"added\": {}}]', 31, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (95, '2021-06-04 14:05:40.788210', '7', 'mysql', 1, '[{\"added\": {}}]', 31, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (96, '2021-06-04 14:05:47.198405', '8', 'prometheus', 1, '[{\"added\": {}}]', 31, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (97, '2021-06-04 14:05:52.103987', '9', 'k8s', 1, '[{\"added\": {}}]', 31, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (98, '2021-06-04 14:08:32.159893', '10', 'DRF', 1, '[{\"added\": {}}]', 31, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (99, '2021-06-04 14:22:34.015994', '8', '张三', 2, '[{\"changed\": {\"fields\": [\"\\u641c\\u7d22\\u8bb0\\u5f55\"]}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (100, '2021-06-04 14:22:56.435744', '6', 'adc', 2, '[{\"changed\": {\"fields\": [\"\\u641c\\u7d22\\u8bb0\\u5f55\"]}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (101, '2021-06-04 14:23:18.328245', '4', '蕉太狼', 2, '[{\"changed\": {\"fields\": [\"\\u641c\\u7d22\\u8bb0\\u5f55\"]}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (102, '2021-06-04 14:23:35.161300', '3', '浮生若梦', 2, '[{\"changed\": {\"fields\": [\"\\u641c\\u7d22\\u8bb0\\u5f55\"]}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (103, '2021-06-04 14:23:55.708356', '2', '南城阿宇', 2, '[{\"changed\": {\"fields\": [\"\\u641c\\u7d22\\u8bb0\\u5f55\"]}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (104, '2021-06-04 14:24:20.209992', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Last login\", \"\\u641c\\u7d22\\u8bb0\\u5f55\"]}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (105, '2021-06-06 09:12:36.819775', '11', 'grafana', 3, '', 31, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (106, '2021-06-06 09:17:02.748880', '12', 'grafana', 3, '', 31, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (107, '2021-06-06 09:19:33.201105', '13', 'grafana', 3, '', 31, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (108, '2021-06-06 09:21:40.560501', '14', 'grafana', 3, '', 31, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (109, '2021-06-06 12:55:29.380980', '16', '123', 3, '', 31, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (110, '2021-06-06 14:07:16.725541', '1', 'Prometheus笔记', 2, '[{\"changed\": {\"fields\": [\"\\u56fe\\u7247\\u94fe\\u63a5\"]}}]', 15, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (111, '2021-06-06 15:06:02.672431', '1', '面试', 1, '[{\"added\": {}}]', 32, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (112, '2021-06-06 15:06:06.719707', '2', 'vue3', 1, '[{\"added\": {}}]', 32, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (113, '2021-06-06 15:06:10.332305', '3', 'coding', 1, '[{\"added\": {}}]', 32, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (114, '2021-06-06 15:06:14.421052', '4', '爬虫', 1, '[{\"added\": {}}]', 32, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (115, '2021-06-06 15:06:18.766465', '5', 'docker', 1, '[{\"added\": {}}]', 32, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (116, '2021-06-06 15:06:22.980155', '6', '阿里云', 1, '[{\"added\": {}}]', 32, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (117, '2021-06-06 15:06:29.307386', '7', 'mysql', 1, '[{\"added\": {}}]', 32, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (118, '2021-06-06 15:06:34.714150', '8', 'prometheus', 1, '[{\"added\": {}}]', 32, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (119, '2021-06-06 15:06:40.270952', '9', 'k8s', 1, '[{\"added\": {}}]', 32, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (120, '2021-06-06 15:06:46.021429', '10', 'DRF', 1, '[{\"added\": {}}]', 32, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (121, '2021-06-06 15:06:50.704000', '11', 'grafana', 1, '[{\"added\": {}}]', 32, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (122, '2021-06-07 00:25:53.475383', '1', 'linux运维工程师面试题总结', 2, '[{\"changed\": {\"fields\": [\"\\u6807\\u7b7e\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (123, '2021-06-07 11:13:51.480251', '1', 'content:我过来看看,username:南城阿宇', 1, '[{\"added\": {}}]', 22, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (124, '2021-06-07 11:14:46.290016', '2', 'content:good good study，day day up,username:adc', 1, '[{\"added\": {}}]', 22, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (125, '2021-06-07 11:16:13.162135', '3', 'content:欢迎欢迎,username:admin', 1, '[{\"added\": {}}]', 22, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (126, '2021-06-07 11:16:48.133833', '4', 'content:热烈欢迎，有空多来看看,username:admin', 1, '[{\"added\": {}}]', 22, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (127, '2021-06-07 11:19:13.023194', '5', 'content:一定一定！,username:adc', 1, '[{\"added\": {}}]', 22, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (128, '2021-06-09 11:14:21.111268', '9', 'Vue项目上线前优化总结', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (129, '2021-06-10 12:35:58.036639', '23', 'DRF递归序列化器与VUE递归组件', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (130, '2021-06-11 00:25:36.539999', '105', '进入容器', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (131, '2021-06-12 14:08:16.293164', '1', '感谢分享！', 1, '[{\"added\": {}}]', 23, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (132, '2021-06-12 14:09:06.485623', '1', '谢谢！', 2, '[{\"changed\": {\"fields\": [\"\\u8bc4\\u8bba\\u5185\\u5bb9\", \"\\u7528\\u6237\\u540d\", \"\\u7236\\u8bc4\\u8bba\"]}}]', 23, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (133, '2021-06-12 14:09:43.394636', '1', '写的不错，受教了！', 2, '[{\"changed\": {\"fields\": [\"\\u8bc4\\u8bba\\u5185\\u5bb9\", \"\\u7528\\u6237\\u540d\", \"\\u7236\\u8bc4\\u8bba\"]}}]', 23, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (134, '2021-06-12 14:10:02.553059', '2', '感谢支持', 1, '[{\"added\": {}}]', 23, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (135, '2021-06-13 00:46:37.489065', '3', '写得好！', 1, '[{\"added\": {}}]', 23, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (136, '2021-06-13 02:42:55.346254', '14', '456789', 2, '[{\"changed\": {\"fields\": [\"\\u7559\\u8a00\\u5185\\u5bb9\"]}}]', 22, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (137, '2021-06-13 12:45:22.688781', '1', 'get到了', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (138, '2021-06-13 12:45:46.102546', '2', '总结的很到位', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (139, '2021-06-13 12:46:07.589673', '3', '谢谢！', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (140, '2021-06-14 02:46:45.781985', '3', 'DRF递归序列化器与VUE递归组件', 1, '[{\"added\": {}}]', 26, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (141, '2021-06-14 03:14:09.567967', '5', 'DRF递归序列化器与VUE递归组件', 3, '', 26, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (142, '2021-06-14 03:14:09.594577', '4', 'DRF递归序列化器与VUE递归组件', 3, '', 26, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (143, '2021-06-14 06:08:34.426265', '10', 'Vue项目上线前优化总结', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u6536\\u85cf\"]}}]', 26, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (144, '2021-06-14 06:41:30.393579', '1', 'Kubernetes特性', 1, '[{\"added\": {}}]', 28, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (145, '2021-06-14 06:42:21.915523', '2', 'Kubernetes特性', 1, '[{\"added\": {}}]', 28, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (146, '2021-06-14 07:07:24.264010', '2', 'Kubernetes特性', 2, '[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u540d\"]}}]', 28, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (147, '2021-06-14 07:07:41.016753', '2', 'Kubernetes特性', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u6536\\u85cf\"]}}]', 28, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (148, '2021-06-16 00:02:51.651512', '8', 'grafana告警与webhook配置', 3, '', 26, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (149, '2021-06-16 00:02:51.683791', '7', 'DRF递归序列化器与VUE递归组件', 3, '', 26, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (150, '2021-06-19 13:52:56.245143', '1', 'SiteConfig object (1)', 1, '[{\"added\": {}}]', 25, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (151, '2021-06-19 13:56:40.711344', '1', 'SiteConfig object (1)', 2, '[{\"changed\": {\"fields\": [\"\\u9ed8\\u8ba4\\u5c01\\u9762\"]}}]', 25, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (152, '2021-06-19 14:07:35.383288', '1', 'Info object (1)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (153, '2021-06-19 14:09:45.536489', '1', 'Info object (1)', 2, '[{\"changed\": {\"fields\": [\"QQ\\u4e8c\\u7ef4\\u7801\", \"\\u5fae\\u4fe1\\u4e8c\\u7ef4\\u7801\"]}}]', 17, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (154, '2021-06-19 14:28:02.948511', '1', 'Info object (1)', 2, '[]', 17, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (155, '2021-06-19 14:28:42.196531', '1', '关于博主', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (156, '2021-06-19 14:29:03.327908', '2', '关于网站', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (157, '2021-06-19 14:29:18.268103', '3', '关于友链', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (158, '2021-06-19 14:29:33.994708', '4', '关于赞赏', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (159, '2021-06-19 14:29:53.206014', '5', '特别鸣谢', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (160, '2021-06-19 14:34:15.604437', '1', '关于博主', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (161, '2021-06-19 14:35:49.191793', '1', '关于博主', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (162, '2021-06-19 14:37:31.791055', '2', '关于网站', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (163, '2021-06-19 14:42:07.847487', '2', '关于网站', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (164, '2021-06-19 14:43:29.187792', '2', '关于网站', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (165, '2021-06-19 14:53:03.032897', '2', '关于网站', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (166, '2021-06-19 14:57:27.128543', '3', '关于友链', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (167, '2021-06-19 14:57:58.712758', '4', '关于赞赏', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (168, '2021-06-19 15:00:53.705800', '5', '特别鸣谢', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (169, '2021-06-20 00:42:18.951269', '1', '关于博主', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (170, '2021-06-20 00:46:05.200818', '2', '关于网站', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (171, '2021-06-20 00:46:15.085958', '2', '关于网站', 2, '[]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (172, '2021-06-20 00:47:07.372358', '3', '关于友链', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (173, '2021-06-20 00:48:27.030574', '3', '关于友链', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (174, '2021-06-20 01:12:36.832998', '5', '特别鸣谢', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (175, '2021-06-20 10:20:12.361729', '2', '关于网站', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (176, '2021-06-20 13:16:17.467897', '1', '关于博主', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (177, '2021-06-20 13:19:19.733148', '1', '关于博主', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (178, '2021-06-20 13:22:12.219676', '2', '关于网站', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (179, '2021-06-20 13:45:38.557697', '1', 'VUE', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (180, '2021-06-20 13:47:01.896537', '2', 'Django', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (181, '2021-06-20 13:48:19.874165', '3', 'Django REST Framewor', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (182, '2021-06-20 13:49:18.977030', '4', 'vant', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (183, '2021-06-20 13:51:35.319409', '5', 'Alliot\'s blog', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (184, '2021-06-20 14:15:46.416034', '3', 'Django REST Framewor', 2, '[{\"changed\": {\"fields\": [\"\\u7ad9\\u70b9\\u7b80\\u4ecb\"]}}]', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (185, '2021-06-20 15:05:49.053031', '4', '关于赞赏', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (186, '2021-06-20 15:07:47.071272', '1', 'Info object (1)', 2, '[{\"changed\": {\"fields\": [\"\\u652f\\u4ed8\\u5b9d\\u6536\\u6b3e\\u7801\", \"\\u5fae\\u4fe1\\u6536\\u6b3e\\u7801\"]}}]', 17, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (187, '2021-06-21 00:04:10.864533', '1', 'Info object (1)', 2, '[]', 17, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (188, '2021-06-21 00:10:31.200745', '1', 'Info object (1)', 2, '[{\"changed\": {\"fields\": [\"\\u5fae\\u4fe1\\u6536\\u6b3e\\u7801\"]}}]', 17, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (189, '2021-06-21 00:32:06.315496', '2', 'Info object (2)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (190, '2021-06-21 01:06:45.108934', '6', '百度', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u542f\\u7528\"]}}]', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (191, '2021-06-21 01:07:08.080241', '6', '百度', 3, '', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (192, '2021-06-21 03:48:45.316570', '8', '百度', 3, '', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (193, '2021-06-21 03:48:45.436012', '7', '123', 3, '', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (194, '2021-06-21 08:43:28.539634', '9', 'StarsL\'s Blog', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u542f\\u7528\"]}}]', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (195, '2021-06-21 09:13:36.533904', '5', '博客网站开源', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (196, '2021-06-21 09:42:19.387833', '23', 'DRF递归序列化器与VUE递归组件', 2, '[{\"changed\": {\"fields\": [\"\\u9605\\u8bfb\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (197, '2021-06-21 09:42:33.318276', '22', 'grafana告警与webhook配置', 2, '[{\"changed\": {\"fields\": [\"\\u9605\\u8bfb\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (198, '2021-06-23 01:48:52.179226', '205', 'kubeadmin高可用部署', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (199, '2021-06-23 01:50:23.092690', '241', 'kubeadmin高可用部署', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (200, '2021-06-23 01:51:08.605920', '241', 'kubeadmin高可用部署', 2, '[{\"changed\": {\"fields\": [\"\\u5e8f\\u53f7\"]}}]', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (201, '2021-06-23 14:31:15.327581', '2', 'Docker', 2, '[{\"changed\": {\"fields\": [\"\\u7b14\\u8bb0\\u5c01\\u9762\"]}}]', 8, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (202, '2021-06-23 14:31:33.558092', '1', 'Kubernetes', 2, '[{\"changed\": {\"fields\": [\"\\u7b14\\u8bb0\\u5c01\\u9762\"]}}]', 8, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (203, '2021-06-23 14:31:50.064515', '3', 'Prometheus', 2, '[{\"changed\": {\"fields\": [\"\\u7b14\\u8bb0\\u5c01\\u9762\"]}}]', 8, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (204, '2021-06-24 12:22:38.989883', '6', 'adc', 2, '[{\"changed\": {\"fields\": [\"\\u641c\\u7d22\\u8bb0\\u5f55\"]}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (205, '2021-06-25 00:32:16.144325', '1', 'Prometheus笔记', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u663e\\u793a\"]}}]', 15, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (206, '2021-07-04 10:14:22.374262', '8', '张三', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (207, '2021-07-04 10:14:22.401376', '6', 'adc', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (208, '2021-07-04 10:14:22.428762', '4', '蕉太狼', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (209, '2021-07-04 10:14:22.456985', '3', '浮生若梦', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (210, '2021-07-04 10:14:22.484571', '2', '南城阿宇', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (211, '2021-07-04 10:14:22.509035', '1', 'admin', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (212, '2021-07-05 12:27:02.881431', '1', '直接注册', 1, '[{\"added\": {}}]', 43, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (213, '2021-07-05 12:27:10.765953', '2', 'github', 1, '[{\"added\": {}}]', 43, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (214, '2021-07-05 12:27:16.921899', '3', '微博', 1, '[{\"added\": {}}]', 43, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (215, '2021-07-05 12:27:21.815612', '4', 'qq', 1, '[{\"added\": {}}]', 43, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (216, '2021-07-05 13:24:59.241847', '4', 'github', 1, '[{\"added\": {}}]', 44, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (217, '2021-07-05 13:25:21.253900', '5', '微博', 1, '[{\"added\": {}}]', 44, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (218, '2021-07-05 13:25:38.661222', '6', 'qq', 1, '[{\"added\": {}}]', 44, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (219, '2021-07-05 14:13:29.370252', '4', 'github', 2, '[{\"changed\": {\"fields\": [\"Key\", \"Secret\"]}}]', 44, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (220, '2021-07-10 03:21:12.647906', '2', '关于网站', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (221, '2021-07-10 03:27:09.241210', '2', '关于网站', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (222, '2021-07-14 14:21:14.348727', '4', '关于赞赏', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (223, '2021-07-17 12:35:56.688469', '1', 'SiteConfig object (1)', 2, '[{\"changed\": {\"fields\": [\"\\u7f51\\u7ad9logo\"]}}]', 25, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (224, '2021-07-17 12:39:25.086869', '1', 'SiteConfig object (1)', 2, '[{\"changed\": {\"fields\": [\"\\u7f51\\u7ad9logo\"]}}]', 25, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (225, '2021-07-22 14:15:14.349948', '24', 'vite2+vue3+script setup创建项目', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (226, '2021-07-22 14:16:23.721035', '24', 'vite2+vue3+script setup创建项目', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (227, '2021-07-23 01:29:15.065785', '24', 'vite2+vue3+script setup创建项目', 2, '[{\"changed\": {\"fields\": [\"Body\", \"\\u70b9\\u8d5e\\u6570\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (228, '2021-07-23 12:54:04.709430', '24', 'vite2+vue3+script setup创建项目', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (229, '2021-07-25 10:24:59.664062', '10', '糊涂博客', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u542f\\u7528\"]}}]', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (230, '2021-07-30 01:50:32.955155', '24', 'vite2+vue3+script setup创建项目', 2, '[{\"changed\": {\"fields\": [\"\\u6458\\u8981\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (231, '2021-08-04 13:48:04.735294', '1', 'SiteConfig object (1)', 2, '[{\"changed\": {\"fields\": [\"ICP\\u5907\\u6848\\u53f7\", \"ICP\\u5907\\u6848\\u94fe\\u63a5\", \"\\u516c\\u5b89\\u5907\\u6848\\u53f7\", \"\\u516c\\u5b89\\u5907\\u6848\\u94fe\\u63a5\"]}}]', 25, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (232, '2021-08-09 04:52:20.166375', '24', 'vite2+vue3+script setup创建项目', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (233, '2021-08-09 04:53:51.283346', '24', 'vite2+vue3+script setup创建项目', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (234, '2021-08-12 06:05:55.528792', '4', '关于赞赏', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (235, '2021-08-15 23:34:40.211257', '25', 'k8s 资源清单yaml字段总结', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (236, '2021-08-16 00:21:23.890403', '25', 'k8s 资源清单yaml字段总结', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (237, '2021-08-16 00:31:28.380641', '22', 'grafana告警与webhook配置', 2, '[{\"changed\": {\"fields\": [\"Body\", \"\\u9605\\u8bfb\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (238, '2021-08-16 00:34:52.666013', '22', 'grafana告警与webhook配置', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (239, '2021-08-16 00:52:57.334484', '22', 'grafana告警与webhook配置', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (240, '2021-08-16 03:07:06.608754', '22', 'grafana告警与webhook配置', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (241, '2021-08-16 03:27:35.845823', '25', 'k8s 资源清单yaml字段总结', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (242, '2021-08-16 23:41:29.766794', '26', 'kubernetes yaml模板与示例', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (243, '2021-08-16 23:56:20.730833', '26', 'kubernetes yaml模板与示例', 2, '[{\"changed\": {\"fields\": [\"\\u6458\\u8981\", \"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (244, '2021-08-16 23:59:10.956478', '26', 'kubernetes yaml模板与示例', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (245, '2021-08-17 02:49:10.502407', '1', 'SiteConfig object (1)', 2, '[{\"changed\": {\"fields\": [\"\\u7f51\\u7ad9logo\"]}}]', 25, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (246, '2021-08-21 02:40:08.258925', '27', 'vue3 markdown与锚点的完美交互', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (247, '2021-08-21 02:49:15.491325', '27', 'vue3 markdown与锚点的完美交互', 2, '[{\"changed\": {\"fields\": [\"Body\", \"\\u9605\\u8bfb\\u91cf\", \"\\u70b9\\u8d5e\\u6570\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (248, '2021-08-21 02:53:04.383742', '4', '关于赞赏', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (249, '2021-08-21 03:02:08.517251', '4', '关于赞赏', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (250, '2021-08-23 14:23:26.669129', '1', '关于博主', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (251, '2021-08-23 14:27:10.286397', '5', '特别鸣谢', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (252, '2021-08-29 08:33:09.748921', '19', 'VIM编辑器使用总结', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (253, '2021-08-29 08:34:07.985662', '2', '运维工程师面试总结(含答案)', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (254, '2021-08-29 08:34:56.894594', '3', 'Django使用百度统计进行流量分析', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (255, '2021-08-29 08:36:50.898886', '5', '使用阿里云SDK监控主机状态', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (256, '2021-08-29 08:37:50.432608', '7', 'Django第三方账号登录（QQ、微博、github）', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (257, '2021-08-29 08:38:21.155080', '8', 'python读取csv处理生成excel', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (258, '2021-08-29 08:38:43.634441', '9', 'Vue项目上线前优化总结', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (259, '2021-08-29 08:39:07.193465', '10', 'Vue+NodeJS前后端分离项目Docker部署', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (260, '2021-08-29 08:39:38.227377', '11', 'flex弹性布局总结', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (261, '2021-08-29 08:39:47.305984', '11', 'flex弹性布局总结', 2, '[{\"changed\": {\"fields\": [\"\\u9605\\u8bfb\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (262, '2021-08-29 08:41:34.457787', '16', '使用coding拉取外网镜像与资源', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (263, '2021-08-29 08:41:57.168666', '17', 'Python获取prometheus监控和告警数据', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (264, '2021-08-29 08:42:59.410560', '23', 'DRF递归序列化器与VUE递归组件', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (265, '2021-08-29 08:43:30.866026', '24', 'vite2+vue3+script setup创建项目', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (266, '2021-08-29 08:43:31.162691', '24', 'vite2+vue3+script setup创建项目', 2, '[]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (267, '2021-08-29 08:44:15.434081', '27', 'vue3 markdown与锚点的完美交互', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (268, '2021-08-31 14:38:56.053692', '28', 'vue3.2 ref模板引用', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (269, '2021-09-07 14:29:07.257179', '3', '阿里云', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u663e\\u793a\"]}}]', 15, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (270, '2021-09-07 14:29:21.210719', '4', '七牛云', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u663e\\u793a\"]}}]', 15, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (271, '2021-09-07 14:30:09.452570', '6', '网站更新公告', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (272, '2021-09-08 09:54:12.144298', '29', 'k8s Traefik简介与部署', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (273, '2021-09-08 09:55:47.795072', '29', 'k8s Traefik简介与部署', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (274, '2021-09-08 10:02:06.107242', '29', 'k8s Traefik简介与部署', 2, '[{\"changed\": {\"fields\": [\"Body\", \"\\u9605\\u8bfb\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (275, '2021-09-10 02:01:33.436404', '4', '关于赞赏', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (276, '2021-09-13 02:41:19.754991', '30', 'thanos高可用prometheus集群部署', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (277, '2021-09-13 02:44:01.241150', '30', 'thanos高可用prometheus集群部署', 2, '[{\"changed\": {\"fields\": [\"Body\", \"\\u9605\\u8bfb\\u91cf\", \"\\u70b9\\u8d5e\\u6570\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (278, '2021-09-13 02:57:15.418367', '30', 'thanos高可用prometheus集群部署', 2, '[{\"changed\": {\"fields\": [\"Body\", \"\\u9605\\u8bfb\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (279, '2021-09-13 03:00:46.902098', '30', 'thanos高可用prometheus集群部署', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (280, '2021-09-13 08:18:19.363198', '30', 'thanos高可用prometheus集群部署', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (281, '2021-09-27 07:31:28.485121', '30', 'thanos高可用prometheus集群部署', 2, '[{\"changed\": {\"fields\": [\"Body\", \"\\u9605\\u8bfb\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (282, '2021-10-05 15:02:26.730103', '5', '特别鸣谢', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (283, '2021-10-10 15:33:39.105947', '5', '特别鸣谢', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (284, '2021-10-14 01:20:21.994188', '5', '特别鸣谢', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (285, '2021-10-18 00:26:00.746727', '31', 'prometheus自动发现之kubernetes_sd_configs', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (286, '2021-10-19 13:21:14.968889', '32', '项目迁移至vite2+vue3.2问题总结', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (287, '2021-10-19 13:21:32.134451', '31', 'prometheus自动发现之kubernetes_sd_configs', 2, '[{\"changed\": {\"fields\": [\"\\u9605\\u8bfb\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (288, '2021-10-19 13:22:00.987008', '4', 'Django项目使用CDN加速', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u63a8\\u8350\\u663e\\u793a\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (289, '2021-10-19 15:11:17.983164', '2', '关于网站', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (290, '2021-10-24 12:41:26.241658', '30', 'thanos高可用prometheus集群部署', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5c01\\u9762\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (291, '2021-10-24 12:42:17.306845', '23', 'DRF递归序列化器与VUE递归组件', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5c01\\u9762\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (292, '2021-11-01 01:15:28.832273', '33', 'grafana API使用', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (293, '2021-11-01 01:15:41.426233', '32', '项目迁移至vite2+vue3.2问题总结', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5c01\\u9762\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (294, '2021-11-01 01:18:53.230805', '33', 'grafana API使用', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (295, '2021-11-01 01:19:17.527311', '33', 'grafana API使用', 2, '[{\"changed\": {\"fields\": [\"\\u6807\\u7b7e\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (296, '2021-11-03 04:36:22.994522', '3', '阿里云', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u663e\\u793a\"]}}]', 15, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (297, '2021-11-03 04:36:36.474742', '4', '七牛云', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u663e\\u793a\"]}}]', 15, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (298, '2021-11-08 13:54:07.021268', '3', '关于友链', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (299, '2021-11-11 14:41:58.980698', '34', 'prometheus告警处理——基础入门', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (300, '2021-11-12 00:13:06.212446', '34', 'Alertmanager——基础入门', 2, '[{\"changed\": {\"fields\": [\"\\u6807\\u9898\", \"\\u6587\\u7ae0\\u5c01\\u9762\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (301, '2021-11-13 03:07:30.857591', '10', 'Prometheus', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (302, '2021-11-13 03:12:25.459228', '35', 'Alertmanager——配置详解', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (303, '2021-11-13 03:12:38.794752', '34', 'Alertmanager——基础入门', 2, '[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (304, '2021-11-13 03:32:58.268382', '31', 'prometheus自动发现之kubernetes_sd_configs', 2, '[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (305, '2021-11-13 03:48:09.046970', '35', 'Alertmanager——配置详解', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (306, '2021-11-13 04:47:27.066840', '30', 'thanos高可用prometheus集群部署', 2, '[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (307, '2021-11-13 09:26:01.683375', '1', 'SiteConfig object (1)', 2, '[{\"changed\": {\"fields\": [\"META\\u5173\\u952e\\u8bcd\", \"META\\u63cf\\u8ff0\"]}}]', 25, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (308, '2021-12-02 01:57:14.189884', '26', 'kubernetes yaml模板与示例', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (309, '2021-12-02 15:06:53.403846', '31', 'prometheus自动发现之kubernetes_sd_configs', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u63a8\\u8350\\u663e\\u793a\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (310, '2021-12-03 07:35:14.050547', '35', 'Alertmanager——配置详解', 2, '[{\"changed\": {\"fields\": [\"Body\", \"\\u9605\\u8bfb\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (311, '2021-12-04 14:06:48.513615', '5', '特别鸣谢', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (312, '2021-12-05 02:49:46.676355', '5', '特别鸣谢', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (313, '2021-12-05 02:51:19.779356', '5', '特别鸣谢', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (314, '2021-12-05 02:52:17.797442', '5', '特别鸣谢', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (315, '2021-12-05 14:01:17.889659', '20', 'docker部署使用MySQL', 2, '[{\"changed\": {\"fields\": [\"\\u6458\\u8981\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (316, '2021-12-05 14:02:34.242349', '2', '运维工程师面试总结(含答案)', 2, '[{\"changed\": {\"fields\": [\"\\u6458\\u8981\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (317, '2021-12-05 14:03:27.902569', '2', '运维工程师面试总结(含答案)', 2, '[{\"changed\": {\"fields\": [\"\\u6458\\u8981\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (318, '2021-12-05 14:04:04.893324', '1', 'linux运维工程师面试题总结', 2, '[{\"changed\": {\"fields\": [\"\\u6458\\u8981\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (319, '2021-12-07 03:45:39.238089', '5', '特别鸣谢', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (320, '2021-12-07 03:47:21.738167', '5', '特别鸣谢', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (321, '2021-12-07 03:47:56.986723', '5', '特别鸣谢', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (322, '2021-12-10 13:45:15.609974', '3', 'Django REST Framework', 2, '[{\"changed\": {\"fields\": [\"\\u7f51\\u7ad9\\u540d\\u79f0\"]}}]', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (323, '2021-12-10 14:16:12.034372', '3', '关于友链', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (324, '2021-12-14 02:28:14.571886', '11', '百度', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u542f\\u7528\"]}}]', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (325, '2021-12-14 02:29:02.729288', '11', '百度', 3, '', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (326, '2021-12-14 02:32:29.581603', '5', '特别鸣谢', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (327, '2021-12-16 12:20:49.511734', '12', '百度', 3, '', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (328, '2021-12-16 12:48:38.270900', '4', '七牛云', 2, '[{\"changed\": {\"fields\": [\"\\u94fe\\u63a5\\u5730\\u5740\"]}}]', 15, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (329, '2021-12-17 00:50:41.029883', '36', '详解用户图片上传流程', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (330, '2021-12-25 02:36:33.139583', '1', '腾讯云推广', 2, '[{\"changed\": {\"fields\": [\"\\u8f6e\\u64ad\\u56fe\", \"\\u94fe\\u63a5\\u5730\\u5740\", \"\\u56fe\\u7247\\u6807\\u9898\", \"\\u662f\\u5426\\u663e\\u793a\"]}}]', 15, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (331, '2021-12-25 02:48:19.676247', '3', '阿里云', 2, '[{\"changed\": {\"fields\": [\"\\u8f6e\\u64ad\\u56fe\", \"\\u94fe\\u63a5\\u5730\\u5740\"]}}]', 15, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (332, '2021-12-25 02:56:23.500503', '5', '博客网站开源', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u663e\\u793a\"]}}]', 15, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (333, '2021-12-25 02:58:19.582900', '4', '七牛云', 2, '[{\"changed\": {\"fields\": [\"\\u8f6e\\u64ad\\u56fe\", \"\\u94fe\\u63a5\\u5730\\u5740\"]}}]', 15, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (334, '2021-12-25 02:59:09.598357', '4', '七牛云', 2, '[{\"changed\": {\"fields\": [\"\\u94fe\\u63a5\\u5730\\u5740\"]}}]', 15, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (335, '2021-12-26 05:14:45.959226', '15', '半旧冬天', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (336, '2021-12-26 05:22:38.634461', '16', '半旧冬天', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (337, '2021-12-29 11:51:07.170834', '9', '✎_M๓₯μl ♡柠檬不萌3', 3, '', 47, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (338, '2021-12-29 11:51:07.180116', '3', '✎_M๓₯μl ♡柠檬不萌', 3, '', 47, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (339, '2021-12-29 11:51:24.264348', '25', '✎_M๓₯μl ♡柠檬不萌3', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (340, '2021-12-29 11:51:24.271628', '19', '✎_M๓₯μl ♡柠檬不萌', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (341, '2021-12-29 13:24:45.672068', '5', '支付宝', 1, '[{\"added\": {}}]', 43, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (342, '2021-12-29 13:24:50.115074', '6', '百度', 1, '[{\"added\": {}}]', 43, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (343, '2021-12-30 12:07:59.430502', '37', '星空的泪痕', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (344, '2021-12-30 13:44:50.086548', '25', '星空的泪痕2', 3, '', 47, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (345, '2021-12-30 13:44:50.093547', '24', '星空的泪痕87', 3, '', 47, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (346, '2021-12-30 13:44:50.101226', '23', '星空的泪痕6', 3, '', 47, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (347, '2021-12-30 13:44:50.107943', '22', '星空的泪痕8', 3, '', 47, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (348, '2021-12-30 13:44:50.114500', '21', '星空的泪痕', 3, '', 47, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (349, '2021-12-30 13:45:03.206085', '42', '星空的泪痕2', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (350, '2021-12-30 13:45:03.214794', '41', '星空的泪痕87', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (351, '2021-12-30 13:45:03.220617', '40', '星空的泪痕6', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (352, '2021-12-30 13:45:03.226505', '39', '星空的泪痕8', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (353, '2021-12-30 13:45:03.232387', '38', '星空的泪痕', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (354, '2021-12-30 13:57:01.178250', '44', '半旧冬天4', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (355, '2021-12-30 13:57:01.185590', '43', '星空的泪痕', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (356, '2021-12-30 13:59:46.016345', '28', '半旧冬天6', 3, '', 47, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (357, '2021-12-30 14:00:01.091228', '45', '半旧冬天6', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (358, '2021-12-30 14:05:47.825765', '29', '半旧冬天4', 3, '', 47, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (359, '2021-12-30 14:06:01.118049', '46', '半旧冬天4', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (360, '2021-12-31 04:01:30.148595', '7', '微软', 1, '[{\"added\": {}}]', 43, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (361, '2022-01-02 01:25:41.885377', '11', '✎_M๓₯μl ♡柠檬不萌2', 3, '', 47, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (362, '2022-01-02 01:25:41.893850', '10', '✎_M๓₯μl ♡柠檬不萌', 3, '', 47, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (363, '2022-01-02 01:26:00.144974', '27', '✎_M๓₯μl ♡柠檬不萌2', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (364, '2022-01-02 01:26:00.151965', '26', '✎_M๓₯μl ♡柠檬不萌', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (365, '2022-01-04 04:42:23.952218', '37', '崔亮', 3, '', 47, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (366, '2022-01-04 04:42:32.807998', '54', '崔亮', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (367, '2022-01-04 04:45:39.701802', '53', '河***广4', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (368, '2022-01-04 04:45:39.708464', '52', '河***广', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (369, '2022-01-04 04:47:58.003788', '56', '崔亮', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (370, '2022-01-04 08:00:21.031589', '40', '崔亮', 3, '', 47, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (371, '2022-01-04 08:01:08.348737', '57', '崔亮', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (372, '2022-01-04 08:09:50.186315', '58', '{\'source_id\': 7, \'username\': \'崔亮\', \'password\': \'01e9f78c-6d35-11ec-bce2-0242ac110006\'}', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (373, '2022-01-04 08:16:01.040015', '59', '崔亮', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (374, '2022-01-04 08:16:01.048205', '55', '河***广', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (375, '2022-01-04 08:16:01.058716', '47', '半旧冬天7', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (376, '2022-01-04 08:16:01.070776', '51', '✎_M๓₯μl ♡柠檬不萌', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (377, '2022-01-04 08:16:01.081191', '20', '木糖醇', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (378, '2022-01-04 08:16:01.088435', '18', '迪迪小可爱133', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (379, '2022-01-04 08:16:01.095247', '17', '半旧冬天', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (380, '2022-01-04 08:16:01.101781', '50', 'Liang.Cui', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (381, '2022-01-04 08:16:16.286058', '21', '可望可及133', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (382, '2022-01-05 00:52:19.516275', '66', '✎_M๓₯μl ♡柠檬不萌1', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (383, '2022-01-05 01:10:38.512296', '37', '前后端分离项目OAuth登录总结', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (384, '2022-01-05 01:11:06.391079', '34', 'Alertmanager——基础入门', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u63a8\\u8350\\u663e\\u793a\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (385, '2022-01-05 01:33:30.738183', '37', '前后端分离项目OAuth登录总结', 2, '[{\"changed\": {\"fields\": [\"Body\", \"\\u9605\\u8bfb\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (386, '2022-01-07 02:31:31.119317', '45', 'Ingress案例', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (387, '2022-01-24 10:54:09.737118', '67', '✎_M๓₯μl ♡柠檬不萌1', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (388, '2022-01-27 16:03:11.367641', '14', '1', 3, '', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (389, '2022-01-27 16:03:51.357269', '13', 'Alexcld colwn fish', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u542f\\u7528\"]}}]', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (390, '2022-02-02 12:48:57.541049', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Last login\", \"Email address\"]}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (391, '2022-02-03 07:56:48.303969', '3', 'Django使用百度统计进行流量分析', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (392, '2022-02-03 07:57:43.088074', '3', 'Django使用百度统计进行流量分析', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (393, '2022-02-14 00:29:18.233989', '38', 'element-plus项目主题换肤与暗黑模式', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (394, '2022-02-14 01:18:06.363632', '38', 'element-plus项目主题换肤与暗黑模式', 2, '[{\"changed\": {\"fields\": [\"Body\", \"\\u9605\\u8bfb\\u91cf\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (395, '2022-02-16 02:25:28.005765', '29', 'k8s Traefik简介与部署', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (396, '2022-02-18 14:11:17.265281', '38', 'element-plus项目主题换肤与暗黑模式', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u63a8\\u8350\\u663e\\u793a\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (397, '2022-02-22 00:54:52.245253', '39', '浅谈运维工程师的开发能力的培养', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (398, '2022-02-22 00:56:12.335720', '39', '浅谈运维工程师的开发能力的培养', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (399, '2022-02-22 00:56:49.831601', '39', '浅谈运维工程师的开发能力的培养', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (400, '2022-02-22 00:58:07.139385', '39', '浅谈运维工程师的开发能力的培养', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (401, '2022-02-22 00:59:14.007173', '39', '浅谈运维工程师的开发能力的培养', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (402, '2022-02-22 01:10:48.678995', '39', '浅谈运维工程师的开发能力的培养', 2, '[{\"changed\": {\"fields\": [\"Body\", \"\\u9605\\u8bfb\\u91cf\", \"\\u70b9\\u8d5e\\u6570\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (403, '2022-02-22 01:19:20.207333', '39', '浅谈运维工程师的开发能力的培养', 2, '[{\"changed\": {\"fields\": [\"\\u9605\\u8bfb\\u91cf\", \"\\u70b9\\u8d5e\\u6570\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (404, '2022-02-22 06:59:23.788639', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Last login\", \"Email address\"]}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (405, '2022-02-22 06:59:56.768867', '6', 'adc', 2, '[{\"changed\": {\"fields\": [\"Last login\", \"Email address\"]}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (406, '2022-02-25 02:29:40.928317', '4', '关于赞赏', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (407, '2022-03-03 01:17:35.331706', '40', 'Django SimpleUI与vue的完美结合', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (408, '2022-03-05 03:21:08.123939', '243', '高可用了啊', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (409, '2022-03-05 03:21:08.164561', '242', '高可用', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (410, '2022-03-05 03:24:55.676760', '244', '高可用了啊', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (411, '2022-03-05 03:40:43.004934', '246', '123', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (412, '2022-03-15 02:08:25.433373', '41', 'celery定时与异步任务详解', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (413, '2022-03-18 00:27:24.837398', '42', 'prometheus进程监控', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (414, '2022-03-18 00:45:48.041380', '42', 'prometheus进程监控', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (415, '2022-03-22 06:58:58.163917', '15', '百度', 3, '', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (416, '2022-03-22 07:02:17.681891', '16', 'vite', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (417, '2022-03-22 07:04:49.981494', '17', 'element-plus', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (418, '2022-03-22 07:07:17.899276', '18', 'echarts', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (419, '2022-04-01 01:32:39.884661', '43', 'DRF模型序列化器常见需求场景总结', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (420, '2022-04-01 01:32:51.841297', '43', 'DRF模型序列化器常见需求场景总结', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5c01\\u9762\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (421, '2022-04-02 10:45:42.770799', '21', '123', 3, '', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (422, '2022-04-02 10:45:42.815134', '20', '百度', 3, '', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (423, '2022-04-02 10:45:42.846003', '19', '百度', 3, '', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (424, '2022-04-09 03:34:25.334865', '26', '<p>嗯嗯</p>', 3, '', 21, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (425, '2022-05-14 00:53:14.200028', '668', '668: job \'sitemap_job\' (Executed)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (426, '2022-05-14 00:53:14.230664', '667', '667: job \'sitemap_job\' (Executed)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (427, '2022-05-14 00:53:14.260161', '666', '666: job \'sitemap_job\' (Executed)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (428, '2022-05-14 00:53:14.290011', '665', '665: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (429, '2022-05-14 00:53:14.319981', '664', '664: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (430, '2022-05-14 00:53:14.362054', '663', '663: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (431, '2022-05-14 00:53:14.399865', '662', '662: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (432, '2022-05-14 00:53:14.432922', '661', '661: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (433, '2022-05-14 00:53:14.470375', '660', '660: job \'sitemap_job\' (Executed)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (434, '2022-05-14 00:53:14.511996', '659', '659: job \'check_ssl_job\' (Executed)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (435, '2022-05-14 00:53:14.550173', '658', '658: job \'check_ssl_job\' (Executed)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (436, '2022-05-14 00:53:14.596060', '657', '657: job \'sitemap_job\' (Executed)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (437, '2022-05-14 00:53:14.630505', '656', '656: job \'delete_old_job_executions\' (Executed)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (438, '2022-05-14 00:53:14.660133', '655', '655: job \'sitemap_job\' (Executed)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (439, '2022-05-14 00:53:14.691101', '654', '654: job \'check_ssl_job\' (Error!)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (440, '2022-05-14 00:53:14.726112', '653', '653: job \'sitemap_job\' (Executed)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (441, '2022-05-14 00:53:14.763292', '652', '652: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (442, '2022-05-14 00:53:14.799961', '651', '651: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (443, '2022-05-14 00:53:14.830445', '650', '650: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (444, '2022-05-14 00:53:14.860053', '649', '649: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (445, '2022-05-14 00:53:14.894152', '648', '648: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (446, '2022-05-14 00:53:14.930023', '647', '647: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (447, '2022-05-14 00:53:14.959926', '646', '646: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (448, '2022-05-14 00:53:15.011868', '645', '645: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (449, '2022-05-14 00:53:15.050070', '644', '644: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (450, '2022-05-14 00:53:15.082059', '643', '643: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (451, '2022-05-14 00:53:15.119798', '642', '642: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (452, '2022-05-14 00:53:15.150371', '641', '641: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (453, '2022-05-14 00:53:15.190532', '640', '640: job \'sitemap_job\' (Executed)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (454, '2022-05-14 00:53:15.230327', '639', '639: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (455, '2022-05-14 00:53:15.259955', '638', '638: job \'delete_old_job_executions\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (456, '2022-05-14 00:53:15.289800', '637', '637: job \'delete_old_job_executions\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (457, '2022-05-14 00:53:15.327792', '636', '636: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (458, '2022-05-14 00:53:15.369795', '635', '635: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (459, '2022-05-14 00:53:15.400008', '634', '634: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (460, '2022-05-14 00:53:15.429929', '633', '633: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (461, '2022-05-14 00:53:15.461150', '632', '632: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (462, '2022-05-14 00:53:15.490105', '631', '631: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (463, '2022-05-14 00:53:15.519991', '630', '630: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (464, '2022-05-14 00:53:15.559999', '629', '629: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (465, '2022-05-14 00:53:15.590379', '628', '628: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (466, '2022-05-14 00:53:15.619863', '627', '627: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (467, '2022-05-14 00:53:15.650326', '626', '626: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (468, '2022-05-14 00:53:15.688621', '668', '668: job \'sitemap_job\' (Executed)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (469, '2022-05-14 00:53:15.689886', '625', '625: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (470, '2022-05-14 00:53:15.722078', '667', '667: job \'sitemap_job\' (Executed)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (471, '2022-05-14 00:53:15.755139', '666', '666: job \'sitemap_job\' (Executed)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (472, '2022-05-14 00:53:15.797082', '665', '665: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (473, '2022-05-14 00:53:15.830561', '664', '664: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (474, '2022-05-14 00:53:15.859814', '663', '663: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (475, '2022-05-14 00:53:15.891487', '662', '662: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (476, '2022-05-14 00:53:15.920254', '661', '661: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (477, '2022-05-14 00:53:15.951472', '660', '660: job \'sitemap_job\' (Executed)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (478, '2022-05-14 00:53:15.980048', '659', '659: job \'check_ssl_job\' (Executed)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (479, '2022-05-14 00:53:16.009832', '658', '658: job \'check_ssl_job\' (Executed)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (480, '2022-05-14 00:53:16.039975', '657', '657: job \'sitemap_job\' (Executed)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (481, '2022-05-14 00:53:16.079974', '656', '656: job \'delete_old_job_executions\' (Executed)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (482, '2022-05-14 00:53:16.110005', '655', '655: job \'sitemap_job\' (Executed)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (483, '2022-05-14 00:53:16.139882', '654', '654: job \'check_ssl_job\' (Error!)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (484, '2022-05-14 00:53:16.191221', '653', '653: job \'sitemap_job\' (Executed)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (485, '2022-05-14 00:53:16.219884', '652', '652: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (486, '2022-05-14 00:53:16.249864', '651', '651: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (487, '2022-05-14 00:53:16.280653', '650', '650: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (488, '2022-05-14 00:53:16.309860', '649', '649: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (489, '2022-05-14 00:53:16.349872', '648', '648: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (490, '2022-05-14 00:53:16.379963', '647', '647: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (491, '2022-05-14 00:53:16.410425', '646', '646: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (492, '2022-05-14 00:53:16.450087', '645', '645: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (493, '2022-05-14 00:53:16.480931', '644', '644: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (494, '2022-05-14 00:53:16.510509', '643', '643: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (495, '2022-05-14 00:53:16.540105', '642', '642: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (496, '2022-05-14 00:53:16.580025', '641', '641: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (497, '2022-05-14 00:53:16.614302', '640', '640: job \'sitemap_job\' (Executed)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (498, '2022-05-14 00:53:16.650491', '639', '639: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (499, '2022-05-14 00:53:16.686118', '638', '638: job \'delete_old_job_executions\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (500, '2022-05-14 00:53:16.719986', '637', '637: job \'delete_old_job_executions\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (501, '2022-05-14 00:53:16.752478', '636', '636: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (502, '2022-05-14 00:53:16.789931', '635', '635: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (503, '2022-05-14 00:53:16.819795', '634', '634: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (504, '2022-05-14 00:53:16.849940', '633', '633: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (505, '2022-05-14 00:53:16.879863', '632', '632: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (506, '2022-05-14 00:53:16.910525', '631', '631: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (507, '2022-05-14 00:53:16.949962', '630', '630: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (508, '2022-05-14 00:53:16.979993', '629', '629: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (509, '2022-05-14 00:53:17.019927', '628', '628: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (510, '2022-05-14 00:53:17.079386', '627', '627: job \'sitemap_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (511, '2022-05-14 00:53:17.109939', '626', '626: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (512, '2022-05-14 00:53:17.150994', '625', '625: job \'check_ssl_job\' (Started execution)', 3, '', 46, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (513, '2022-05-16 01:11:15.130591', '1', 'www.cuiliangblog.cn', 2, '[{\"changed\": {\"fields\": [\"Domain name\", \"Display name\"]}}]', 48, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (514, '2022-05-16 02:58:44.057016', '1', 'SiteConfig object (1)', 2, '[{\"changed\": {\"fields\": [\"\\u7f51\\u7ad9\\u5730\\u56fe\\u94fe\\u63a5\"]}}]', 25, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (515, '2022-05-16 09:00:56.487507', '1', '关于博主', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (516, '2022-05-16 10:07:10.819971', '2', '关于网站', 2, '[{\"changed\": {\"fields\": [\"\\u5185\\u5bb9\"]}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (517, '2022-05-27 11:02:15.172524', '6', '项目地址', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (518, '2022-05-28 03:17:07.434427', '11', 'elasticsearch', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (519, '2022-05-28 03:40:53.842294', '44', 'elasticsearch查询之URI Search查询总结', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (520, '2022-05-28 03:41:46.989731', '11', 'ElasticSearch', 2, '[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5206\\u7c7b\"]}}]', 7, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (521, '2022-05-28 03:42:50.940541', '44', 'elasticsearch查询之URI Search查询总结', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (522, '2022-05-28 03:45:55.316528', '44', 'elasticsearch查询之URI Search查询总结', 2, '[{\"changed\": {\"fields\": [\"Body\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (523, '2022-05-28 06:10:29.927887', '26', '二丫讲梵', 2, '[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u542f\\u7528\"]}}]', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (524, '2022-05-28 06:26:34.500764', '27', '百度', 3, '', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (525, '2022-05-28 06:26:34.506042', '25', '百度', 3, '', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (526, '2022-05-28 06:26:34.509367', '24', '百度', 3, '', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (527, '2022-05-28 06:26:34.512953', '23', '百度', 3, '', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (528, '2022-05-28 06:26:34.516901', '22', '百度', 3, '', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (529, '2022-05-29 11:25:52.336103', '44', 'elasticsearch查询之URI Search查询总结', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (530, '2022-05-29 11:25:52.391138', '43', 'DRF模型序列化器常见需求场景总结', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (531, '2022-05-29 11:25:52.477119', '42', 'prometheus进程监控', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (532, '2022-05-29 11:25:52.556454', '41', 'celery定时与异步任务详解', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (533, '2022-05-29 11:25:52.601163', '40', 'Django SimpleUI与vue的完美结合', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (534, '2022-05-29 11:25:52.641009', '39', '浅谈运维工程师的开发能力的培养', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (535, '2022-05-29 11:25:52.670321', '38', 'element-plus项目主题换肤与暗黑模式', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (536, '2022-05-29 11:25:52.701085', '37', '前后端分离项目OAuth登录总结', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (537, '2022-05-29 11:25:52.742300', '36', '详解用户图片上传流程', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (538, '2022-05-29 11:25:52.771645', '35', 'Alertmanager——配置详解', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (539, '2022-05-29 11:25:52.805397', '34', 'Alertmanager——基础入门', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (540, '2022-05-29 11:25:52.841517', '33', 'grafana API使用', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (541, '2022-05-29 11:25:52.875344', '32', '项目迁移至vite2+vue3.2问题总结', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (542, '2022-05-29 11:25:52.911432', '31', 'prometheus自动发现之kubernetes_sd_configs', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (543, '2022-05-29 11:25:52.940544', '30', 'thanos高可用prometheus集群部署', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (544, '2022-05-29 11:25:52.990928', '29', 'k8s Traefik简介与部署', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (545, '2022-05-29 11:25:53.029669', '28', 'vue3.2 ref模板引用', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (546, '2022-05-29 11:25:53.061363', '27', 'vue3 markdown与锚点的完美交互', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (547, '2022-05-29 11:25:53.093804', '26', 'kubernetes yaml模板与示例', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (548, '2022-05-29 11:25:53.119778', '25', 'k8s 资源清单yaml字段总结', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (549, '2022-05-29 11:25:53.162324', '24', 'vite2+vue3+script setup创建项目', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (550, '2022-05-29 11:25:53.201496', '23', 'DRF递归序列化器与VUE递归组件', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (551, '2022-05-29 11:25:53.261300', '22', 'grafana告警与webhook配置', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (552, '2022-05-29 11:25:53.300148', '18', 'VUE3添加animate页面切换动画', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (553, '2022-05-29 11:25:53.335655', '17', 'Python获取prometheus监控和告警数据', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (554, '2022-05-29 11:25:53.375306', '16', '使用coding拉取外网镜像与资源', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (555, '2022-05-29 11:25:53.414465', '15', '如何使用coding优雅的开发项目', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (556, '2022-05-29 11:25:53.453364', '14', 'DRF视图总结', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (557, '2022-05-29 11:25:53.486415', '13', 'DRF序列化器学习总结', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (558, '2022-05-29 11:25:53.524855', '12', 'VUE3封装axios网络请求示例', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (559, '2022-05-29 11:27:46.188614', '11', 'flex弹性布局总结', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (560, '2022-05-29 11:27:46.220933', '10', 'Vue+NodeJS前后端分离项目Docker部署', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (561, '2022-05-29 11:27:46.250805', '9', 'Vue项目上线前优化总结', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (562, '2022-05-29 11:27:46.280422', '8', 'python读取csv处理生成excel', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (563, '2022-05-29 11:27:46.310988', '7', 'Django第三方账号登录（QQ、微博、github）', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (564, '2022-05-29 11:27:46.340468', '6', 'python爬虫自动更换必应壁纸', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (565, '2022-05-29 11:27:46.370424', '5', '使用阿里云SDK监控主机状态', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (566, '2022-05-29 11:27:46.401065', '4', 'Django项目使用CDN加速', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (567, '2022-05-29 11:27:46.431134', '3', 'Django使用百度统计进行流量分析', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (568, '2022-05-29 11:27:46.460695', '2', '运维工程师面试总结(含答案)', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (569, '2022-05-29 11:27:46.490722', '21', 'k8s集群状态与日志查看', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (570, '2022-05-29 11:27:46.520865', '20', 'docker部署使用MySQL', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (571, '2022-05-29 11:27:46.551076', '19', 'VIM编辑器使用总结', 3, '', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (572, '2022-05-29 11:28:11.032086', '205', 'kubeadmin高可用部署', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (573, '2022-05-29 11:28:11.061718', '204', 'dockerfile多个from', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (574, '2022-05-29 11:28:11.091534', '203', 'Alertmanager高可用', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (575, '2022-05-29 11:28:11.120991', '202', 'prometheus高可用', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (576, '2022-05-29 11:28:11.151776', '201', '联邦集群', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (577, '2022-05-29 11:28:11.191016', '200', '远程存储', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (578, '2022-05-29 11:28:11.220936', '199', '本地存储', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (579, '2022-05-29 11:28:11.251722', '198', 'grafana报警', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (580, '2022-05-29 11:28:11.441118', '197', '变量', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (581, '2022-05-29 11:28:11.471160', '196', '当前状态：SingleStat面板', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (582, '2022-05-29 11:28:11.501161', '195', '分布统计：Heatmap面板', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (583, '2022-05-29 11:28:11.531207', '194', 'graph面板常用操作', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (584, '2022-05-29 11:28:11.561414', '193', '变化趋势：Graph面板', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (585, '2022-05-29 11:28:11.591786', '192', '创建dashboard与Panel', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (586, '2022-05-29 11:28:11.621091', '191', 'grafana基本概念', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (587, '2022-05-29 11:28:11.651078', '190', 'Pushgateway', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (588, '2022-05-29 11:28:11.850747', '189', '网络探测：Blackbox Exporter', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (589, '2022-05-29 11:28:11.880923', '188', '监控MySQL：MySQLD Exporter', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (590, '2022-05-29 11:28:11.911408', '187', '容器监控：cAdvisor', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (591, '2022-05-29 11:28:11.941034', '186', 'exporter', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (592, '2022-05-29 11:28:11.971069', '185', '使用Recoding Rules优化性能', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (593, '2022-05-29 11:28:12.001053', '184', '屏蔽告警通知', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (594, '2022-05-29 11:28:12.035410', '183', '自定义告警模板', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (595, '2022-05-29 11:28:12.061155', '182', '使用Receiver接收告警信息', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (596, '2022-05-29 11:28:12.091503', '181', '基于标签的告警处理路由', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (597, '2022-05-29 11:28:12.121078', '180', 'Alertmanager配置概述', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (598, '2022-05-29 11:28:12.151011', '179', '部署Alertmanager', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (599, '2022-05-29 11:28:12.181077', '178', '自定义Prometheus告警规则', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (600, '2022-05-29 11:28:12.211154', '177', '告警简介', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (601, '2022-05-29 11:28:12.241134', '176', '最佳实践', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (602, '2022-05-29 11:28:12.271721', '175', '在HTTP API中使用PromQL', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (603, '2022-05-29 11:28:12.311357', '174', '内置函数', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (604, '2022-05-29 11:28:12.351140', '173', '聚合操作', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (605, '2022-05-29 11:28:12.380773', '172', '匹配模式', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (606, '2022-05-29 11:28:12.410816', '171', '操作符', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (607, '2022-05-29 11:28:12.461053', '170', '查询表达式', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (608, '2022-05-29 11:28:12.521093', '169', 'Jobs和Instances', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (609, '2022-05-29 11:28:12.551355', '168', '指标类型', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (610, '2022-05-29 11:28:12.613283', '167', '数据模型', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (611, '2022-05-29 11:28:12.641145', '166', '部署prometheus', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (612, '2022-05-29 11:28:12.671210', '165', 'prometheus简介', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (613, '2022-05-29 11:28:12.701033', '164', 'docker命令总结', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (614, '2022-05-29 11:28:12.731364', '163', 'docker其他问题', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (615, '2022-05-29 11:28:12.761119', '162', 'docker配置常见问题', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (616, '2022-05-29 11:28:12.791272', '161', 'docker仓库常见问题', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (617, '2022-05-29 11:28:12.821606', '160', 'docker容器常见问题', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (618, '2022-05-29 11:28:12.851061', '159', 'docker镜像常见问题', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (619, '2022-05-29 11:28:12.883202', '158', 'docker system命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (620, '2022-05-29 11:28:12.910956', '157', 'Docker图形化管理', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (621, '2022-05-29 11:28:12.941123', '156', 'service访问', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (622, '2022-05-29 11:28:12.971145', '155', 'swarm高可用', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (623, '2022-05-29 11:28:13.001033', '154', '部署swarm集群', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (624, '2022-05-29 11:28:13.031182', '153', 'Docker Swarm简介', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (625, '2022-05-29 11:28:13.061099', '152', 'compose案例', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (626, '2022-05-29 11:28:13.091235', '151', 'compose环境变量', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (627, '2022-05-29 11:28:13.125164', '150', 'compose命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (628, '2022-05-29 11:28:13.151132', '149', 'compose模板文件', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (629, '2022-05-29 11:28:13.181046', '148', 'Docker Compose简介', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (630, '2022-05-29 11:28:13.211930', '147', '管理machine', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (631, '2022-05-29 11:28:13.241136', '146', '安装Docker Machine', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (632, '2022-05-29 11:28:13.271097', '145', '其他安全特性', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (633, '2022-05-29 11:28:13.300806', '144', 'Docker服务端的防护', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (634, '2022-05-29 11:28:13.342888', '143', '内核能力机制', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (635, '2022-05-29 11:28:13.536439', '142', '控制组资源控制的安全', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (636, '2022-05-29 11:28:13.561109', '141', '命名空间隔离的安全', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (637, '2022-05-29 11:28:13.591470', '140', '网络虚拟化', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (638, '2022-05-29 11:28:13.621799', '139', '联合文件系统', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (639, '2022-05-29 11:28:13.651041', '138', '控制组', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (640, '2022-05-29 11:28:13.681267', '137', '命名空间', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (641, '2022-05-29 11:28:13.711177', '136', '基本架构', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (642, '2022-05-29 11:28:13.741311', '135', 'docker网络模型', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (643, '2022-05-29 11:28:13.771189', '134', '自定义网络', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (644, '2022-05-29 11:28:13.801114', '133', 'docker网络类型', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (645, '2022-05-29 11:28:13.831061', '132', 'docker网络分析', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (646, '2022-05-29 11:28:13.861071', '131', '容器防火墙访问控制', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (647, '2022-05-29 11:28:13.892435', '130', '配置DNS和主机名', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (648, '2022-05-29 11:28:13.921060', '129', 'docker网络管理', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (649, '2022-05-29 11:28:13.951100', '128', '为镜像添加SSH服务', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (650, '2022-05-29 11:28:13.980850', '127', '容器互联', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (651, '2022-05-29 11:28:14.011116', '126', '端口映射', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (652, '2022-05-29 11:28:14.041313', '125', '利用数据卷容器进行数据迁移', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (653, '2022-05-29 11:28:14.071176', '124', '数据卷容器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (654, '2022-05-29 11:28:14.101149', '123', '数据卷', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (655, '2022-05-29 11:28:14.131097', '122', '存储管理常用命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (656, '2022-05-29 11:28:14.164112', '121', '限制磁盘IO', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (657, '2022-05-29 11:28:14.191165', '120', 'CPU限制', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (658, '2022-05-29 11:28:14.221176', '119', '内存限制', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (659, '2022-05-29 11:28:14.253346', '118', 'dockerfile编写注意事项', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (660, '2022-05-29 11:28:14.280814', '117', '构建镜像', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (661, '2022-05-29 11:28:14.311184', '116', '命令区别', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (662, '2022-05-29 11:28:14.340724', '115', '操作命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (663, '2022-05-29 11:28:14.370872', '114', '配置命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (664, '2022-05-29 11:28:14.400890', '113', '基本结构', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (665, '2022-05-29 11:28:14.431174', '112', 'Harbor私有镜像仓库', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (666, '2022-05-29 11:28:14.464420', '111', 'registry私有仓库', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (667, '2022-05-29 11:28:14.491071', '110', 'docker hub公共仓库', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (668, '2022-05-29 11:28:14.522806', '109', '其他容器命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (669, '2022-05-29 11:28:14.551071', '108', '查看容器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (670, '2022-05-29 11:28:14.581215', '107', '导入和导出容器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (671, '2022-05-29 11:28:14.611049', '106', '删除容器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (672, '2022-05-29 11:28:38.981524', '1', '基础知识', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (673, '2022-05-29 11:28:39.011360', '2', 'kubeadm部署k8s', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (674, '2022-05-29 11:28:39.041353', '25', 'kubectl命令', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (675, '2022-05-29 11:28:39.071319', '26', '资源对象', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (676, '2022-05-29 11:28:39.101425', '36', '资源控制器', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (677, '2022-05-29 11:28:39.139737', '45', 'Service和Ingress', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (678, '2022-05-29 11:28:39.171164', '52', '存储', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (679, '2022-05-29 11:28:39.201144', '60', 'rook', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (680, '2022-05-29 11:28:39.231789', '68', '网络', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (681, '2022-05-29 11:28:39.261502', '74', '安全', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (682, '2022-05-29 11:28:39.291094', '80', 'pod调度', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (683, '2022-05-29 11:28:39.321610', '86', '系统扩展', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (684, '2022-05-29 11:28:39.351206', '89', '资源指标与HPA', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (685, '2022-05-29 11:28:39.381003', '94', 'helm', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (686, '2022-05-29 11:28:39.411397', '104', '日常维护', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (687, '2022-05-29 11:28:39.451315', '105', '更改证书有效期', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (688, '2022-05-29 11:28:39.501747', '101', 'kubeadm高可用部署', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (689, '2022-05-29 11:28:39.531408', '95', 'helm基础', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (690, '2022-05-29 11:28:39.564470', '90', '资源监控及资源指标', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (691, '2022-05-29 11:28:39.591581', '87', '自定义资源类型（CRD）', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (692, '2022-05-29 11:28:39.621411', '81', '调度器概述', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (693, '2022-05-29 11:28:39.654362', '75', '访问控制', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (694, '2022-05-29 11:28:39.941611', '69', '网络概述', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (695, '2022-05-29 11:28:39.971459', '61', 'rook简介', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (696, '2022-05-29 11:28:40.011857', '53', '配置集合ConfigMap', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (697, '2022-05-29 11:28:40.041411', '46', 'Service资源及模型', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (698, '2022-05-29 11:28:40.071390', '37', 'Pod控制器', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (699, '2022-05-29 11:28:40.101393', '27', 'K8S中的资源对象', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (700, '2022-05-29 11:28:40.132032', '18', '命令格式', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (701, '2022-05-29 11:28:40.162673', '8', '前期准备', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (702, '2022-05-29 11:28:40.191282', '3', 'kubernetes特性', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (703, '2022-05-29 11:28:40.231052', '212', '自定义Prometheus告警规则', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (704, '2022-05-29 11:28:40.263557', '106', 'k8s版本升级', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (705, '2022-05-29 11:28:40.291260', '102', '离线二进制部署k8s', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (706, '2022-05-29 11:28:40.321685', '96', 'helm安装', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (707, '2022-05-29 11:28:40.352187', '91', '监控组件安装', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (708, '2022-05-29 11:28:40.381124', '88', '自定义控制器', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (709, '2022-05-29 11:28:40.412660', '82', 'node亲和调度', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (710, '2022-05-29 11:28:40.441350', '76', '认证', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (711, '2022-05-29 11:28:40.473388', '70', '网络类型', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (712, '2022-05-29 11:28:40.501408', '62', 'ceph', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (713, '2022-05-29 11:28:40.532360', '54', '敏感信息Secret', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (714, '2022-05-29 11:28:40.561522', '47', '服务发现', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (715, '2022-05-29 11:28:40.591377', '38', 'ReplicaSet控制器', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (716, '2022-05-29 11:28:40.621400', '28', 'yuml文件', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (717, '2022-05-29 11:28:40.651454', '19', 'node常用命令', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (718, '2022-05-29 11:28:40.681375', '9', '部署kubernets', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (719, '2022-05-29 11:28:40.711352', '4', '概念和术语', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (720, '2022-05-29 11:28:40.748080', '107', '添加work节点', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (721, '2022-05-29 11:28:40.785041', '103', '其他高可用部署方式', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (722, '2022-05-29 11:28:40.811438', '97', 'helm常用命令', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (723, '2022-05-29 11:28:40.841817', '92', '资源指标及其应用', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (724, '2022-05-29 11:28:40.877988', '83', 'pod亲和调度', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (725, '2022-05-29 11:28:40.911493', '77', '鉴权', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (726, '2022-05-29 11:28:40.941393', '71', 'flannel网络插件', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (727, '2022-05-29 11:28:40.971487', '63', 'rook部署', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (728, '2022-05-29 11:28:41.001370', '55', '临时存储emptyDir', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (729, '2022-05-29 11:28:41.031557', '48', 'Service类型', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (730, '2022-05-29 11:28:41.061445', '39', 'Deployment控制器', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (731, '2022-05-29 11:28:41.091415', '29', 'k8s yaml字段大全', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (732, '2022-05-29 11:28:41.121962', '20', 'pod常用命令', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (733, '2022-05-29 11:28:41.152618', '10', '部署helm', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (734, '2022-05-29 11:28:41.184591', '5', '集群组件', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (735, '2022-05-29 11:28:41.211707', '108', '控制节点启用pod调度', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (736, '2022-05-29 11:28:41.242139', '98', 'Helm Charts', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (737, '2022-05-29 11:28:41.271200', '93', '自动弹性缩放', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (738, '2022-05-29 11:28:41.301081', '84', '污点和容忍度', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (739, '2022-05-29 11:28:41.331121', '78', '准入控制', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (740, '2022-05-29 11:28:41.361415', '72', '网络策略', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (741, '2022-05-29 11:28:41.391813', '64', 'rbd块存储服务', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (742, '2022-05-29 11:28:41.421467', '56', '节点存储hostPath', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (743, '2022-05-29 11:28:41.461489', '49', 'Headless Service', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (744, '2022-05-29 11:28:41.492704', '40', 'DaemonSet控制器', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (745, '2022-05-29 11:28:41.521779', '30', '管理Namespace资源', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (746, '2022-05-29 11:28:41.551398', '21', '控制器常用命令', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (747, '2022-05-29 11:28:41.581486', '11', '部署ingress控制器', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (748, '2022-05-29 11:28:41.611463', '6', '抽象对象', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (749, '2022-05-29 11:28:41.641507', '109', '集群以外节点控制k8s集群', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (750, '2022-05-29 11:28:41.671543', '99', '自定义Charts', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (751, '2022-05-29 11:28:41.701359', '85', '固定节点调度', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (752, '2022-05-29 11:28:41.731479', '79', '示例', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (753, '2022-05-29 11:28:41.761542', '73', '网络与策略实例', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (754, '2022-05-29 11:28:41.791410', '65', 'cephfs共享文件存储', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (755, '2022-05-29 11:28:41.983110', '57', '网络存储卷', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (756, '2022-05-29 11:28:42.011384', '50', 'Ingress资源', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (757, '2022-05-29 11:28:42.041423', '41', 'Job控制器', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (758, '2022-05-29 11:28:42.071385', '31', '标签与标签选择器', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (759, '2022-05-29 11:28:42.105047', '23', '存储常用命令', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (760, '2022-05-29 11:28:42.131510', '12', '部署calico网络组件', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (761, '2022-05-29 11:28:42.161463', '7', '通过阿里云获取gcr.io镜像文件', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (762, '2022-05-29 11:28:42.191701', '110', '删除本地集群', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (763, '2022-05-29 11:28:42.221427', '66', 'RGW对象存储服务', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (764, '2022-05-29 11:28:42.251393', '58', '持久存储卷', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (765, '2022-05-29 11:28:42.281280', '51', 'Ingress案例', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (766, '2022-05-29 11:28:42.321421', '42', 'CronJob控制器', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (767, '2022-05-29 11:28:42.361111', '32', 'Pod资源对象', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (768, '2022-05-29 11:28:42.391944', '22', 'service常用命令', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (769, '2022-05-29 11:28:42.421211', '13', '部署dashboard', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (770, '2022-05-29 11:28:42.461457', '111', '日志排查', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (771, '2022-05-29 11:28:42.501394', '67', '维护rook存储', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (772, '2022-05-29 11:29:03.772257', '59', 'downwardAPI存储卷', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (773, '2022-05-29 11:29:03.802745', '43', 'StatefulSet控制器', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (774, '2022-05-29 11:29:03.832832', '33', 'Pod生命周期', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (775, '2022-05-29 11:29:03.861722', '24', '日常命令总结', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (776, '2022-05-29 11:29:04.191889', '14', '部署metrics-server监控组件', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (777, '2022-05-29 11:29:04.225058', '241', 'kubeadmin高可用部署', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (778, '2022-05-29 11:29:04.251676', '44', 'PDB中断预算', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (779, '2022-05-29 11:29:04.281436', '34', '资源需求与限制', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (780, '2022-05-29 11:29:04.311484', '15', '部署Prometheus+Grafana', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (781, '2022-05-29 11:29:04.342260', '35', 'Pod服务质量（优先级）', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (782, '2022-05-29 11:29:04.371396', '16', '部署elk日志收集', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (783, '2022-05-29 11:29:04.401418', '17', '部署Harbor私有镜像仓库', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (784, '2022-05-29 11:29:04.435654', '112', '基础', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (785, '2022-05-29 11:29:04.461449', '115', '镜像', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (786, '2022-05-29 11:29:04.494328', '120', '容器', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (787, '2022-05-29 11:29:04.551737', '129', '仓库', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (788, '2022-05-29 11:29:04.581834', '133', 'dockerfile', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (789, '2022-05-29 11:29:04.613511', '140', '资源限制', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (790, '2022-05-29 11:29:04.652771', '144', '存储管理', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (791, '2022-05-29 11:29:04.961652', '149', '网络管理', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (792, '2022-05-29 11:29:04.991700', '160', '核心技术', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (793, '2022-05-29 11:29:05.021599', '166', '安全', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (794, '2022-05-29 11:29:05.051637', '172', 'Docker Machine批量安装管理', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (795, '2022-05-29 11:29:05.081454', '175', 'Docker Compose容器编排', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (796, '2022-05-29 11:29:05.111626', '181', 'Docker Swarm集群管理', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (797, '2022-05-29 11:29:05.146406', '186', 'docker其他与总结', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (798, '2022-05-29 11:29:05.171638', '187', 'Docker图形化管理', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (799, '2022-05-29 11:29:05.201749', '182', 'Docker Swarm简介', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (800, '2022-05-29 11:29:05.251793', '176', 'Docker Compose简介', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (801, '2022-05-29 11:29:05.281638', '173', '安装Docker Machine', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (802, '2022-05-29 11:29:05.313228', '167', '命名空间隔离的安全', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (803, '2022-05-29 11:29:05.341769', '161', '基本架构', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (804, '2022-05-29 11:29:05.371468', '150', '端口映射', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (805, '2022-05-29 11:29:05.401377', '145', '存储管理常用命令', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (806, '2022-05-29 11:29:05.433820', '141', '内存限制', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (807, '2022-05-29 11:29:05.463720', '134', '基本结构', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (808, '2022-05-29 11:29:05.491383', '130', 'docker hub公共仓库', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (809, '2022-05-29 11:29:05.521767', '121', '容器操作命令总结', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (810, '2022-05-29 11:29:05.555247', '116', '镜像操作命令', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (811, '2022-05-29 11:29:05.581605', '113', 'docker基础', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (812, '2022-05-29 11:29:05.611647', '188', 'docker system命令', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (813, '2022-05-29 11:29:05.643240', '183', '部署swarm集群', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (814, '2022-05-29 11:29:05.671841', '177', 'compose模板文件', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (815, '2022-05-29 11:29:05.701616', '174', '管理machine', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (816, '2022-05-29 11:29:05.731695', '168', '控制组资源控制的安全', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (817, '2022-05-29 11:29:05.766967', '162', '命名空间', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (818, '2022-05-29 11:29:05.801486', '151', '容器互联', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (819, '2022-05-29 11:29:05.831718', '146', '数据卷', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (820, '2022-05-29 11:29:05.871785', '142', 'CPU限制', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (821, '2022-05-29 11:29:05.917787', '135', '配置命令', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (822, '2022-05-29 11:29:05.944567', '131', 'registry私有仓库', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (823, '2022-05-29 11:29:06.242537', '122', '创建容器', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (824, '2022-05-29 11:29:06.274366', '117', '管理镜像', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (825, '2022-05-29 11:29:06.301465', '114', 'docker安装与卸载', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (826, '2022-05-29 11:29:06.331475', '189', 'docker镜像常见问题', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (827, '2022-05-29 11:29:06.361394', '184', 'swarm高可用', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (828, '2022-05-29 11:29:06.392777', '178', 'compose命令', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (829, '2022-05-29 11:29:06.421664', '169', '内核能力机制', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (830, '2022-05-29 11:29:06.451651', '163', '控制组', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (831, '2022-05-29 11:29:06.481699', '152', '为镜像添加SSH服务', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (832, '2022-05-29 11:29:06.771825', '147', '数据卷容器', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (833, '2022-05-29 11:29:06.802013', '143', '限制磁盘IO', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (834, '2022-05-29 11:29:06.832053', '136', '操作命令', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (835, '2022-05-29 11:29:06.861777', '132', 'Harbor私有镜像仓库', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (836, '2022-05-29 11:29:06.892047', '123', '停止容器', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (837, '2022-05-29 11:29:06.922514', '118', '构建镜像', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (838, '2022-05-29 11:29:06.952219', '190', 'docker容器常见问题', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (839, '2022-05-29 11:29:06.981854', '185', 'service访问', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (840, '2022-05-29 11:29:07.011630', '179', 'compose环境变量', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (841, '2022-05-29 11:29:07.042043', '170', 'Docker服务端的防护', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (842, '2022-05-29 11:29:07.071737', '164', '联合文件系统', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (843, '2022-05-29 11:29:07.101789', '153', 'docker网络管理', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (844, '2022-05-29 11:29:07.131721', '148', '利用数据卷容器进行数据迁移', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (845, '2022-05-29 11:29:07.162234', '137', '命令区别', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (846, '2022-05-29 11:29:07.195332', '124', '进入容器', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (847, '2022-05-29 11:29:07.221742', '119', '导出和导入镜像', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (848, '2022-05-29 11:29:07.251908', '191', 'docker仓库常见问题', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (849, '2022-05-29 11:29:07.281775', '180', 'compose案例', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (850, '2022-05-29 11:29:07.311963', '171', '其他安全特性', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (851, '2022-05-29 11:29:07.341645', '165', '网络虚拟化', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (852, '2022-05-29 11:29:07.371425', '154', '配置DNS和主机名', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (853, '2022-05-29 11:29:07.681781', '138', '构建镜像', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (854, '2022-05-29 11:29:08.071783', '125', '删除容器', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (855, '2022-05-29 11:29:08.101787', '240', 'dockerfile多个from', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (856, '2022-05-29 11:29:08.131677', '192', 'docker配置常见问题', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (857, '2022-05-29 11:29:08.161747', '155', '容器防火墙访问控制', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (858, '2022-05-29 11:29:08.192332', '126', '导入和导出容器', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (859, '2022-05-29 11:29:08.221910', '193', 'docker其他问题', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (860, '2022-05-29 11:29:08.252172', '156', 'docker网络分析', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (861, '2022-05-29 11:29:08.283151', '139', 'dockerfile编写注意事项', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (862, '2022-05-29 11:29:08.313945', '127', '查看容器', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (863, '2022-05-29 11:29:08.352185', '194', 'docker命令总结', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (864, '2022-05-29 11:29:08.381586', '157', 'docker网络类型', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (865, '2022-05-29 11:29:08.411573', '128', '其他容器命令', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (866, '2022-05-29 11:29:08.442096', '158', '自定义网络', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (867, '2022-05-29 11:29:08.473814', '159', 'docker网络模型', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (868, '2022-05-29 11:29:08.501722', '195', 'prometheus基础', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (869, '2022-05-29 11:29:08.531816', '201', 'PromQL', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (870, '2022-05-29 11:29:08.562064', '210', '告警处理', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (871, '2022-05-29 11:29:08.591746', '209', 'exporter', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (872, '2022-05-29 11:29:08.628725', '225', 'grafana', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (873, '2022-05-29 11:29:08.661559', '234', 'prometheus高可用', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (874, '2022-05-29 11:29:08.692801', '235', '本地存储', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (875, '2022-05-29 11:29:09.011511', '226', 'grafana基本概念', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (876, '2022-05-29 11:29:09.041440', '220', 'exporter', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (877, '2022-05-29 11:29:09.071544', '211', '告警简介', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (878, '2022-05-29 11:29:09.412578', '202', '查询表达式', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (879, '2022-05-29 11:29:09.450524', '196', 'prometheus简介', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (880, '2022-05-29 11:29:09.481595', '236', '远程存储', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (881, '2022-05-29 11:29:09.511997', '227', '创建dashboard与Panel', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (882, '2022-05-29 11:29:09.541707', '221', '容器监控：cAdvisor', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (883, '2022-05-29 11:29:09.855455', '203', '操作符', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (884, '2022-05-29 11:29:09.881514', '197', '部署prometheus', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (885, '2022-05-29 11:29:09.912192', '237', '联邦集群', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (886, '2022-05-29 11:29:09.944328', '228', '变化趋势：Graph面板', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (887, '2022-05-29 11:29:09.991691', '222', '监控MySQL：MySQLD Exporter', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (888, '2022-05-29 11:29:10.023985', '213', '部署Alertmanager', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (889, '2022-05-29 11:29:10.052372', '204', '匹配模式', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (890, '2022-05-29 11:29:10.083614', '198', '数据模型', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (891, '2022-05-29 11:29:10.111521', '238', 'prometheus高可用', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (892, '2022-05-29 11:29:10.142017', '229', 'graph面板常用操作', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (893, '2022-05-29 11:29:10.172063', '223', '网络探测：Blackbox Exporter', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (894, '2022-05-29 11:29:10.201835', '214', 'Alertmanager配置概述', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (895, '2022-05-29 11:29:10.231873', '205', '聚合操作', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (896, '2022-05-29 11:29:10.551737', '199', '指标类型', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (897, '2022-05-29 11:29:10.581858', '239', 'Alertmanager高可用', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (898, '2022-05-29 11:29:10.611764', '230', '分布统计：Heatmap面板', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (899, '2022-05-29 11:29:10.655404', '224', 'Pushgateway', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (900, '2022-05-29 11:29:10.681718', '215', '基于标签的告警处理路由', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (901, '2022-05-29 11:29:10.711735', '206', '内置函数', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (902, '2022-05-29 11:29:10.742680', '200', 'Jobs和Instances', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (903, '2022-05-29 11:29:10.771663', '231', '当前状态：SingleStat面板', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (904, '2022-05-29 11:29:10.801719', '216', '使用Receiver接收告警信息', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (905, '2022-05-29 11:29:10.831954', '207', '在HTTP API中使用PromQL', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (906, '2022-05-29 11:29:10.865372', '232', '变量', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (907, '2022-05-29 11:29:10.891853', '217', '自定义告警模板', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (908, '2022-05-29 11:29:10.921775', '208', '最佳实践', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (909, '2022-05-29 11:29:10.951784', '233', 'grafana报警', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (910, '2022-05-29 11:29:10.985038', '218', '屏蔽告警通知', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (911, '2022-05-29 11:29:11.011735', '219', '使用Recoding Rules优化性能', 3, '', 11, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (912, '2022-05-29 11:30:13.399445', '205', 'kubeadmin高可用部署', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (913, '2022-05-29 11:30:13.433485', '204', 'dockerfile多个from', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (914, '2022-05-29 11:30:13.469141', '203', 'Alertmanager高可用', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (915, '2022-05-29 11:30:13.513834', '202', 'prometheus高可用', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (916, '2022-05-29 11:30:13.543392', '201', '联邦集群', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (917, '2022-05-29 11:30:13.573523', '200', '远程存储', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (918, '2022-05-29 11:30:13.603615', '199', '本地存储', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (919, '2022-05-29 11:30:13.635965', '198', 'grafana报警', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (920, '2022-05-29 11:30:13.663720', '197', '变量', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (921, '2022-05-29 11:30:13.693396', '196', '当前状态：SingleStat面板', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (922, '2022-05-29 11:30:13.724473', '195', '分布统计：Heatmap面板', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (923, '2022-05-29 11:30:13.753401', '194', 'graph面板常用操作', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (924, '2022-05-29 11:30:13.784927', '193', '变化趋势：Graph面板', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (925, '2022-05-29 11:30:13.813234', '192', '创建dashboard与Panel', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (926, '2022-05-29 11:30:13.843174', '191', 'grafana基本概念', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (927, '2022-05-29 11:30:13.878828', '190', 'Pushgateway', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (928, '2022-05-29 11:30:13.903420', '189', '网络探测：Blackbox Exporter', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (929, '2022-05-29 11:30:13.933473', '188', '监控MySQL：MySQLD Exporter', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (930, '2022-05-29 11:30:13.964732', '187', '容器监控：cAdvisor', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (931, '2022-05-29 11:30:14.003448', '186', 'exporter', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (932, '2022-05-29 11:30:14.035431', '185', '使用Recoding Rules优化性能', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (933, '2022-05-29 11:30:14.063375', '184', '屏蔽告警通知', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (934, '2022-05-29 11:30:14.094245', '183', '自定义告警模板', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (935, '2022-05-29 11:30:14.126678', '182', '使用Receiver接收告警信息', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (936, '2022-05-29 11:30:14.153456', '181', '基于标签的告警处理路由', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (937, '2022-05-29 11:30:14.185271', '180', 'Alertmanager配置概述', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (938, '2022-05-29 11:30:14.213541', '179', '部署Alertmanager', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (939, '2022-05-29 11:30:14.243485', '178', '自定义Prometheus告警规则', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (940, '2022-05-29 11:30:14.275300', '177', '告警简介', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (941, '2022-05-29 11:30:14.303428', '176', '最佳实践', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (942, '2022-05-29 11:30:14.333211', '175', '在HTTP API中使用PromQL', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (943, '2022-05-29 11:30:14.363317', '174', '内置函数', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (944, '2022-05-29 11:30:14.393292', '173', '聚合操作', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (945, '2022-05-29 11:30:14.423110', '172', '匹配模式', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (946, '2022-05-29 11:30:14.456505', '171', '操作符', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (947, '2022-05-29 11:30:14.483255', '170', '查询表达式', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (948, '2022-05-29 11:30:14.513167', '169', 'Jobs和Instances', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (949, '2022-05-29 11:30:14.543127', '168', '指标类型', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (950, '2022-05-29 11:30:14.573163', '167', '数据模型', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (951, '2022-05-29 11:30:14.603293', '166', '部署prometheus', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (952, '2022-05-29 11:30:14.633307', '165', 'prometheus简介', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (953, '2022-05-29 11:30:14.663229', '164', 'docker命令总结', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (954, '2022-05-29 11:30:14.703324', '163', 'docker其他问题', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (955, '2022-05-29 11:30:14.733306', '162', 'docker配置常见问题', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (956, '2022-05-29 11:30:14.764001', '161', 'docker仓库常见问题', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (957, '2022-05-29 11:30:14.793469', '160', 'docker容器常见问题', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (958, '2022-05-29 11:30:14.997000', '159', 'docker镜像常见问题', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (959, '2022-05-29 11:30:15.055124', '158', 'docker system命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (960, '2022-05-29 11:30:15.118813', '157', 'Docker图形化管理', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (961, '2022-05-29 11:30:15.176803', '156', 'service访问', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (962, '2022-05-29 11:30:15.223100', '155', 'swarm高可用', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (963, '2022-05-29 11:30:15.258064', '154', '部署swarm集群', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (964, '2022-05-29 11:30:15.292060', '153', 'Docker Swarm简介', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (965, '2022-05-29 11:30:15.349697', '152', 'compose案例', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (966, '2022-05-29 11:30:15.385500', '151', 'compose环境变量', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (967, '2022-05-29 11:30:15.417513', '150', 'compose命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (968, '2022-05-29 11:30:15.475894', '149', 'compose模板文件', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (969, '2022-05-29 11:30:15.509518', '148', 'Docker Compose简介', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (970, '2022-05-29 11:30:15.562882', '147', '管理machine', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (971, '2022-05-29 11:30:15.621949', '146', '安装Docker Machine', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (972, '2022-05-29 11:30:15.691309', '145', '其他安全特性', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (973, '2022-05-29 11:30:15.746022', '144', 'Docker服务端的防护', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (974, '2022-05-29 11:30:15.774695', '143', '内核能力机制', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (975, '2022-05-29 11:30:15.809921', '142', '控制组资源控制的安全', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (976, '2022-05-29 11:30:15.844487', '141', '命名空间隔离的安全', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (977, '2022-05-29 11:30:15.884573', '140', '网络虚拟化', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (978, '2022-05-29 11:30:15.915193', '139', '联合文件系统', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (979, '2022-05-29 11:30:15.952158', '138', '控制组', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (980, '2022-05-29 11:30:15.992850', '137', '命名空间', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (981, '2022-05-29 11:30:16.032499', '136', '基本架构', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (982, '2022-05-29 11:30:16.083453', '135', 'docker网络模型', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (983, '2022-05-29 11:30:16.116649', '134', '自定义网络', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (984, '2022-05-29 11:30:16.155121', '133', 'docker网络类型', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (985, '2022-05-29 11:30:16.206030', '132', 'docker网络分析', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (986, '2022-05-29 11:30:16.243976', '131', '容器防火墙访问控制', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (987, '2022-05-29 11:30:16.277786', '130', '配置DNS和主机名', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (988, '2022-05-29 11:30:16.324014', '129', 'docker网络管理', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (989, '2022-05-29 11:30:16.354997', '128', '为镜像添加SSH服务', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (990, '2022-05-29 11:30:16.409588', '127', '容器互联', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (991, '2022-05-29 11:30:16.455394', '126', '端口映射', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (992, '2022-05-29 11:30:16.496147', '125', '利用数据卷容器进行数据迁移', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (993, '2022-05-29 11:30:16.544599', '124', '数据卷容器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (994, '2022-05-29 11:30:16.575976', '123', '数据卷', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (995, '2022-05-29 11:30:16.606545', '122', '存储管理常用命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (996, '2022-05-29 11:30:16.647798', '121', '限制磁盘IO', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (997, '2022-05-29 11:30:16.695048', '120', 'CPU限制', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (998, '2022-05-29 11:30:16.751368', '119', '内存限制', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (999, '2022-05-29 11:30:16.796370', '118', 'dockerfile编写注意事项', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1000, '2022-05-29 11:30:16.833392', '117', '构建镜像', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1001, '2022-05-29 11:30:16.865479', '116', '命令区别', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1002, '2022-05-29 11:30:16.894447', '115', '操作命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1003, '2022-05-29 11:30:16.925509', '114', '配置命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1004, '2022-05-29 11:30:16.966068', '113', '基本结构', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1005, '2022-05-29 11:30:17.017771', '112', 'Harbor私有镜像仓库', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1006, '2022-05-29 11:30:17.045941', '111', 'registry私有仓库', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1007, '2022-05-29 11:30:17.088781', '110', 'docker hub公共仓库', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1008, '2022-05-29 11:30:17.125920', '109', '其他容器命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1009, '2022-05-29 11:30:17.165343', '108', '查看容器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1010, '2022-05-29 11:30:17.196169', '107', '导入和导出容器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1011, '2022-05-29 11:30:17.224514', '106', '删除容器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1012, '2022-05-29 11:30:17.260440', '105', '进入容器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1013, '2022-05-29 11:30:17.294652', '104', '停止容器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1014, '2022-05-29 11:30:17.368743', '103', '创建容器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1015, '2022-05-29 11:30:17.412581', '102', '容器操作命令总结', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1016, '2022-05-29 11:30:17.455632', '101', '导出和导入镜像', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1017, '2022-05-29 11:30:17.498972', '100', '构建镜像', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1018, '2022-05-29 11:30:17.535904', '99', '管理镜像', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1019, '2022-05-29 11:30:17.572911', '98', '镜像操作命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1020, '2022-05-29 11:30:17.607537', '97', 'docker安装与卸载', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1021, '2022-05-29 11:30:17.820111', '96', 'docker基础', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1022, '2022-05-29 11:30:17.865263', '95', '日志排查', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1023, '2022-05-29 11:30:17.894869', '94', '删除本地集群', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1024, '2022-05-29 11:30:17.924936', '93', '集群以外节点控制k8s集群', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1025, '2022-05-29 11:30:17.960054', '92', '控制节点启用pod调度', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1026, '2022-05-29 11:30:18.005213', '91', '添加work节点', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1027, '2022-05-29 11:30:18.048054', '90', 'k8s版本升级', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1028, '2022-05-29 11:30:18.081903', '89', '更改证书有效期', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1029, '2022-05-29 11:30:18.125773', '88', '其他高可用部署方式', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1030, '2022-05-29 11:30:18.166202', '87', '离线二进制部署k8s', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1031, '2022-05-29 11:30:18.203531', '86', 'kubeadm高可用部署', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1032, '2022-05-29 11:30:18.236015', '85', '自定义Charts', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1033, '2022-05-29 11:30:18.269866', '84', 'Helm Charts', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1034, '2022-05-29 11:30:18.304879', '83', 'helm常用命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1035, '2022-05-29 11:30:18.336060', '82', 'helm安装', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1036, '2022-05-29 11:30:18.594296', '81', 'helm基础', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1037, '2022-05-29 11:30:18.644205', '80', '自动弹性缩放', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1038, '2022-05-29 11:30:18.679447', '79', '资源指标及其应用', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1039, '2022-05-29 11:30:18.725385', '78', '监控组件安装', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1040, '2022-05-29 11:30:18.774051', '77', '资源监控及资源指标', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1041, '2022-05-29 11:30:18.819296', '76', '自定义控制器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1042, '2022-05-29 11:30:18.859404', '75', '自定义资源类型（CRD）', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1043, '2022-05-29 11:30:18.907144', '74', '固定节点调度', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1044, '2022-05-29 11:30:18.935337', '73', '污点和容忍度', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1045, '2022-05-29 11:30:18.965477', '72', 'pod亲和调度', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1046, '2022-05-29 11:30:19.002670', '71', 'node亲和调度', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1047, '2022-05-29 11:30:19.036810', '70', '调度器概述', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1048, '2022-05-29 11:30:19.066371', '69', '示例', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1049, '2022-05-29 11:30:19.104960', '68', '准入控制', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1050, '2022-05-29 11:30:19.145076', '67', '鉴权', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1051, '2022-05-29 11:30:19.174074', '66', '认证', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1052, '2022-05-29 11:30:19.211132', '65', '访问控制', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1053, '2022-05-29 11:30:19.473923', '64', '网络与策略实例', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1054, '2022-05-29 11:30:19.504261', '63', '网络策略', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1055, '2022-05-29 11:30:19.533930', '62', 'flannel网络插件', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1056, '2022-05-29 11:30:19.578814', '61', '网络类型', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1057, '2022-05-29 11:30:19.616023', '60', '网络概述', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1058, '2022-05-29 11:30:19.651265', '59', '维护rook存储', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1059, '2022-05-29 11:30:19.684932', '58', 'RGW对象存储服务', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1060, '2022-05-29 11:30:19.725262', '57', 'cephfs共享文件存储', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1061, '2022-05-29 11:30:19.755564', '56', 'rbd块存储服务', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1062, '2022-05-29 11:30:19.784871', '55', 'rook部署', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1063, '2022-05-29 11:30:19.821651', '54', 'ceph', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1064, '2022-05-29 11:30:19.856033', '53', 'rook简介', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1065, '2022-05-29 11:30:19.887920', '52', 'downwardAPI存储卷', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1066, '2022-05-29 11:30:19.922708', '51', '持久存储卷', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1067, '2022-05-29 11:30:19.956711', '50', '网络存储卷', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1068, '2022-05-29 11:30:19.989279', '49', '节点存储hostPath', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1069, '2022-05-29 11:30:20.014189', '48', '临时存储emptyDir', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1070, '2022-05-29 11:30:20.046092', '47', '敏感信息Secret', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1071, '2022-05-29 11:30:20.085728', '46', '配置集合ConfigMap', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1072, '2022-05-29 11:30:20.114589', '45', 'Ingress案例', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1073, '2022-05-29 11:30:20.146054', '44', 'Ingress资源', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1074, '2022-05-29 11:30:20.176622', '43', 'Headless Service', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1075, '2022-05-29 11:30:20.213737', '42', 'Service类型', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1076, '2022-05-29 11:30:20.252432', '41', '服务发现', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1077, '2022-05-29 11:30:20.285890', '40', 'Service资源及模型', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1078, '2022-05-29 11:30:20.315797', '39', 'PDB中断预算', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1079, '2022-05-29 11:30:20.344688', '38', 'StatefulSet控制器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1080, '2022-05-29 11:30:20.604337', '37', 'CronJob控制器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1081, '2022-05-29 11:30:20.639009', '36', 'Job控制器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1082, '2022-05-29 11:30:20.664221', '35', 'DaemonSet控制器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1083, '2022-05-29 11:30:20.695055', '34', 'Deployment控制器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1084, '2022-05-29 11:30:20.728279', '33', 'ReplicaSet控制器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1085, '2022-05-29 11:30:20.757637', '32', 'Pod控制器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1086, '2022-05-29 11:30:20.785168', '31', 'Pod服务质量（优先级）', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1087, '2022-05-29 11:30:20.815482', '30', '资源需求与限制', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1088, '2022-05-29 11:30:20.844470', '29', 'Pod生命周期', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1089, '2022-05-29 11:30:20.875374', '28', 'Pod资源对象', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1090, '2022-05-29 11:30:20.930438', '27', '标签与标签选择器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1091, '2022-05-29 11:30:20.967514', '26', '管理Namespace资源', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1092, '2022-05-29 11:30:21.010381', '25', 'k8s yaml字段大全', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1093, '2022-05-29 11:30:21.057196', '24', 'yuml文件', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1094, '2022-05-29 11:30:21.571093', '23', 'K8S中的资源对象', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1095, '2022-05-29 11:30:21.605504', '22', '日常命令总结', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1096, '2022-05-29 11:30:21.637721', '21', '存储常用命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1097, '2022-05-29 11:30:21.675403', '20', 'service常用命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1098, '2022-05-29 11:30:21.716113', '19', '控制器常用命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1099, '2022-05-29 11:30:21.755522', '18', 'pod常用命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1100, '2022-05-29 11:30:21.795455', '17', 'node常用命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1101, '2022-05-29 11:30:21.846892', '16', '命令格式', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1102, '2022-05-29 11:30:21.886168', '15', '部署Harbor私有镜像仓库', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1103, '2022-05-29 11:30:21.933288', '14', '部署elk日志收集', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1104, '2022-05-29 11:30:22.224733', '13', '部署Prometheus+Grafana', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1105, '2022-05-29 11:30:22.265150', '12', '部署metrics-server监控组件', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1106, '2022-05-29 11:30:22.304879', '11', '部署dashboard', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1107, '2022-05-29 11:30:22.334548', '10', '部署calico网络组件', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1108, '2022-05-29 11:30:22.379719', '9', '部署ingress控制器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1109, '2022-05-29 11:30:22.415308', '8', '部署helm', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1110, '2022-05-29 11:30:22.445987', '7', '部署kubernets', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1111, '2022-05-29 11:30:22.493203', '6', '前期准备', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1112, '2022-05-29 11:30:22.536810', '5', '通过阿里云获取gcr.io镜像文件', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1113, '2022-05-29 11:30:22.587351', '4', '抽象对象', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1114, '2022-05-29 11:30:22.617255', '3', '集群组件', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1115, '2022-05-29 11:30:22.655702', '2', '概念和术语', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1116, '2022-05-29 11:30:22.702711', '1', 'Kubernetes特性', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1117, '2022-05-29 11:30:34.872801', '205', 'kubeadmin高可用部署', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1118, '2022-05-29 11:30:35.076236', '204', 'dockerfile多个from', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1119, '2022-05-29 11:30:35.105360', '203', 'Alertmanager高可用', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1120, '2022-05-29 11:30:35.135276', '202', 'prometheus高可用', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1121, '2022-05-29 11:30:35.165272', '201', '联邦集群', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1122, '2022-05-29 11:30:35.205268', '200', '远程存储', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1123, '2022-05-29 11:30:35.235447', '199', '本地存储', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1124, '2022-05-29 11:30:35.265317', '198', 'grafana报警', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1125, '2022-05-29 11:30:35.295204', '197', '变量', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1126, '2022-05-29 11:30:35.324853', '196', '当前状态：SingleStat面板', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1127, '2022-05-29 11:30:35.355499', '195', '分布统计：Heatmap面板', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1128, '2022-05-29 11:30:35.385004', '194', 'graph面板常用操作', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1129, '2022-05-29 11:30:35.414903', '193', '变化趋势：Graph面板', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1130, '2022-05-29 11:30:35.445188', '192', '创建dashboard与Panel', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1131, '2022-05-29 11:30:35.645248', '191', 'grafana基本概念', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1132, '2022-05-29 11:30:35.675862', '190', 'Pushgateway', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1133, '2022-05-29 11:30:35.705020', '189', '网络探测：Blackbox Exporter', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1134, '2022-05-29 11:30:35.734998', '188', '监控MySQL：MySQLD Exporter', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1135, '2022-05-29 11:30:35.765173', '187', '容器监控：cAdvisor', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1136, '2022-05-29 11:30:35.796465', '186', 'exporter', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1137, '2022-05-29 11:30:35.824984', '185', '使用Recoding Rules优化性能', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1138, '2022-05-29 11:30:35.854829', '184', '屏蔽告警通知', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1139, '2022-05-29 11:30:36.045073', '183', '自定义告警模板', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1140, '2022-05-29 11:30:36.075191', '182', '使用Receiver接收告警信息', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1141, '2022-05-29 11:30:36.107777', '181', '基于标签的告警处理路由', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1142, '2022-05-29 11:30:36.135331', '180', 'Alertmanager配置概述', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1143, '2022-05-29 11:30:36.166377', '179', '部署Alertmanager', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1144, '2022-05-29 11:30:36.195447', '178', '自定义Prometheus告警规则', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1145, '2022-05-29 11:30:36.225282', '177', '告警简介', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1146, '2022-05-29 11:30:36.265338', '176', '最佳实践', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1147, '2022-05-29 11:30:36.308894', '175', '在HTTP API中使用PromQL', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1148, '2022-05-29 11:30:36.345236', '174', '内置函数', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1149, '2022-05-29 11:30:36.375010', '173', '聚合操作', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1150, '2022-05-29 11:30:36.409198', '172', '匹配模式', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1151, '2022-05-29 11:30:36.434904', '171', '操作符', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1152, '2022-05-29 11:30:36.464361', '170', '查询表达式', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1153, '2022-05-29 11:30:36.494613', '169', 'Jobs和Instances', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1154, '2022-05-29 11:30:36.522673', '168', '指标类型', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1155, '2022-05-29 11:30:37.005825', '167', '数据模型', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1156, '2022-05-29 11:30:37.059606', '166', '部署prometheus', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1157, '2022-05-29 11:30:37.088472', '165', 'prometheus简介', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1158, '2022-05-29 11:30:37.115458', '164', 'docker命令总结', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1159, '2022-05-29 11:30:37.145401', '163', 'docker其他问题', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1160, '2022-05-29 11:30:37.175712', '162', 'docker配置常见问题', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1161, '2022-05-29 11:30:37.206176', '161', 'docker仓库常见问题', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1162, '2022-05-29 11:30:37.235038', '160', 'docker容器常见问题', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1163, '2022-05-29 11:30:37.265124', '159', 'docker镜像常见问题', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1164, '2022-05-29 11:30:37.331721', '158', 'docker system命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1165, '2022-05-29 11:30:37.365534', '157', 'Docker图形化管理', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1166, '2022-05-29 11:30:37.395218', '156', 'service访问', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1167, '2022-05-29 11:30:37.444113', '155', 'swarm高可用', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1168, '2022-05-29 11:30:37.502631', '154', '部署swarm集群', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1169, '2022-05-29 11:30:37.555412', '153', 'Docker Swarm简介', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1170, '2022-05-29 11:30:37.585446', '152', 'compose案例', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1171, '2022-05-29 11:30:37.615402', '151', 'compose环境变量', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1172, '2022-05-29 11:30:37.645351', '150', 'compose命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1173, '2022-05-29 11:30:37.675367', '149', 'compose模板文件', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1174, '2022-05-29 11:30:37.705365', '148', 'Docker Compose简介', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1175, '2022-05-29 11:30:37.745323', '147', '管理machine', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1176, '2022-05-29 11:30:37.776184', '146', '安装Docker Machine', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1177, '2022-05-29 11:30:37.805973', '145', '其他安全特性', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1178, '2022-05-29 11:30:37.835383', '144', 'Docker服务端的防护', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1179, '2022-05-29 11:30:37.875513', '143', '内核能力机制', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1180, '2022-05-29 11:30:37.908256', '142', '控制组资源控制的安全', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1181, '2022-05-29 11:30:37.947182', '141', '命名空间隔离的安全', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1182, '2022-05-29 11:30:37.975408', '140', '网络虚拟化', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1183, '2022-05-29 11:30:38.005248', '139', '联合文件系统', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1184, '2022-05-29 11:30:38.195260', '138', '控制组', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1185, '2022-05-29 11:30:38.225375', '137', '命名空间', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1186, '2022-05-29 11:30:38.255378', '136', '基本架构', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1187, '2022-05-29 11:30:38.285978', '135', 'docker网络模型', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1188, '2022-05-29 11:30:38.316290', '134', '自定义网络', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1189, '2022-05-29 11:30:38.355056', '133', 'docker网络类型', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1190, '2022-05-29 11:30:38.385119', '132', 'docker网络分析', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1191, '2022-05-29 11:30:38.415097', '131', '容器防火墙访问控制', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1192, '2022-05-29 11:30:38.445622', '130', '配置DNS和主机名', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1193, '2022-05-29 11:30:38.475459', '129', 'docker网络管理', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1194, '2022-05-29 11:30:38.505898', '128', '为镜像添加SSH服务', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1195, '2022-05-29 11:30:38.535363', '127', '容器互联', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1196, '2022-05-29 11:30:38.565403', '126', '端口映射', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1197, '2022-05-29 11:30:38.595471', '125', '利用数据卷容器进行数据迁移', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1198, '2022-05-29 11:30:38.625369', '124', '数据卷容器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1199, '2022-05-29 11:30:38.659856', '123', '数据卷', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1200, '2022-05-29 11:30:38.685463', '122', '存储管理常用命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1201, '2022-05-29 11:30:38.715676', '121', '限制磁盘IO', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1202, '2022-05-29 11:30:38.747023', '120', 'CPU限制', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1203, '2022-05-29 11:30:38.775217', '119', '内存限制', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1204, '2022-05-29 11:30:38.805454', '118', 'dockerfile编写注意事项', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1205, '2022-05-29 11:30:38.835869', '117', '构建镜像', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1206, '2022-05-29 11:30:38.866631', '116', '命令区别', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1207, '2022-05-29 11:30:38.895496', '115', '操作命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1208, '2022-05-29 11:30:38.925526', '114', '配置命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1209, '2022-05-29 11:30:38.955497', '113', '基本结构', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1210, '2022-05-29 11:30:38.985406', '112', 'Harbor私有镜像仓库', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1211, '2022-05-29 11:30:39.015551', '111', 'registry私有仓库', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1212, '2022-05-29 11:30:39.045321', '110', 'docker hub公共仓库', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1213, '2022-05-29 11:30:39.071357', '109', '其他容器命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1214, '2022-05-29 11:30:39.105134', '108', '查看容器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1215, '2022-05-29 11:30:39.135640', '107', '导入和导出容器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1216, '2022-05-29 11:30:39.165307', '106', '删除容器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1217, '2022-05-29 11:30:39.190977', '105', '进入容器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1218, '2022-05-29 11:30:39.225356', '104', '停止容器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1219, '2022-05-29 11:30:39.316206', '103', '创建容器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1220, '2022-05-29 11:30:39.345133', '102', '容器操作命令总结', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1221, '2022-05-29 11:30:39.379906', '101', '导出和导入镜像', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1222, '2022-05-29 11:30:39.415207', '100', '构建镜像', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1223, '2022-05-29 11:30:39.445273', '99', '管理镜像', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1224, '2022-05-29 11:30:39.480711', '98', '镜像操作命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1225, '2022-05-29 11:30:39.515520', '97', 'docker安装与卸载', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1226, '2022-05-29 11:30:39.546532', '96', 'docker基础', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1227, '2022-05-29 11:30:39.575607', '95', '日志排查', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1228, '2022-05-29 11:30:39.605922', '94', '删除本地集群', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1229, '2022-05-29 11:30:39.635410', '93', '集群以外节点控制k8s集群', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1230, '2022-05-29 11:30:39.665459', '92', '控制节点启用pod调度', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1231, '2022-05-29 11:30:39.695451', '91', '添加work节点', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1232, '2022-05-29 11:30:39.725662', '90', 'k8s版本升级', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1233, '2022-05-29 11:30:39.766625', '89', '更改证书有效期', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1234, '2022-05-29 11:30:39.795346', '88', '其他高可用部署方式', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1235, '2022-05-29 11:30:39.825340', '87', '离线二进制部署k8s', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1236, '2022-05-29 11:30:39.854533', '86', 'kubeadm高可用部署', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1237, '2022-05-29 11:30:39.890138', '85', '自定义Charts', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1238, '2022-05-29 11:30:39.915293', '84', 'Helm Charts', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1239, '2022-05-29 11:30:39.945147', '83', 'helm常用命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1240, '2022-05-29 11:30:39.975914', '82', 'helm安装', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1241, '2022-05-29 11:30:40.011519', '81', 'helm基础', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1242, '2022-05-29 11:30:40.045444', '80', '自动弹性缩放', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1243, '2022-05-29 11:30:40.078294', '79', '资源指标及其应用', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1244, '2022-05-29 11:30:40.105417', '78', '监控组件安装', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1245, '2022-05-29 11:30:40.135578', '77', '资源监控及资源指标', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1246, '2022-05-29 11:30:40.176090', '76', '自定义控制器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1247, '2022-05-29 11:30:40.205948', '75', '自定义资源类型（CRD）', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1248, '2022-05-29 11:30:40.235760', '74', '固定节点调度', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1249, '2022-05-29 11:30:40.265732', '73', '污点和容忍度', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1250, '2022-05-29 11:30:40.301476', '72', 'pod亲和调度', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1251, '2022-05-29 11:30:40.335416', '71', 'node亲和调度', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1252, '2022-05-29 11:30:40.395273', '70', '调度器概述', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1253, '2022-05-29 11:30:40.595387', '69', '示例', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1254, '2022-05-29 11:30:40.625664', '68', '准入控制', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1255, '2022-05-29 11:30:40.655561', '67', '鉴权', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1256, '2022-05-29 11:30:40.688006', '66', '认证', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1257, '2022-05-29 11:30:40.715499', '65', '访问控制', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1258, '2022-05-29 11:30:40.745479', '64', '网络与策略实例', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1259, '2022-05-29 11:30:40.775652', '63', '网络策略', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1260, '2022-05-29 11:30:40.812421', '62', 'flannel网络插件', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1261, '2022-05-29 11:30:40.845556', '61', '网络类型', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1262, '2022-05-29 11:30:40.877016', '60', '网络概述', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1263, '2022-05-29 11:30:40.915501', '59', '维护rook存储', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1264, '2022-05-29 11:30:40.945501', '58', 'RGW对象存储服务', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1265, '2022-05-29 11:30:40.975621', '57', 'cephfs共享文件存储', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1266, '2022-05-29 11:30:41.005571', '56', 'rbd块存储服务', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1267, '2022-05-29 11:30:41.035479', '55', 'rook部署', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1268, '2022-05-29 11:30:41.075672', '54', 'ceph', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1269, '2022-05-29 11:30:41.105997', '53', 'rook简介', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1270, '2022-05-29 11:30:41.135509', '52', 'downwardAPI存储卷', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1271, '2022-05-29 11:30:41.165386', '51', '持久存储卷', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1272, '2022-05-29 11:30:41.195350', '50', '网络存储卷', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1273, '2022-05-29 11:30:41.228991', '49', '节点存储hostPath', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1274, '2022-05-29 11:30:41.255637', '48', '临时存储emptyDir', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1275, '2022-05-29 11:30:41.286654', '47', '敏感信息Secret', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1276, '2022-05-29 11:30:41.315243', '46', '配置集合ConfigMap', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1277, '2022-05-29 11:30:41.346881', '45', 'Ingress案例', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1278, '2022-05-29 11:30:41.395178', '44', 'Ingress资源', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1279, '2022-05-29 11:30:41.435467', '43', 'Headless Service', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1280, '2022-05-29 11:30:41.465750', '42', 'Service类型', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1281, '2022-05-29 11:30:41.497211', '41', '服务发现', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1282, '2022-05-29 11:30:41.530561', '40', 'Service资源及模型', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1283, '2022-05-29 11:30:41.565425', '39', 'PDB中断预算', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1284, '2022-05-29 11:30:41.595239', '38', 'StatefulSet控制器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1285, '2022-05-29 11:30:41.629889', '37', 'CronJob控制器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1286, '2022-05-29 11:30:41.655529', '36', 'Job控制器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1287, '2022-05-29 11:30:41.685541', '35', 'DaemonSet控制器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1288, '2022-05-29 11:30:41.725737', '34', 'Deployment控制器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1289, '2022-05-29 11:30:41.785960', '33', 'ReplicaSet控制器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1290, '2022-05-29 11:30:42.045485', '32', 'Pod控制器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1291, '2022-05-29 11:30:42.095458', '31', 'Pod服务质量（优先级）', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1292, '2022-05-29 11:30:42.126562', '30', '资源需求与限制', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1293, '2022-05-29 11:30:42.155475', '29', 'Pod生命周期', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1294, '2022-05-29 11:30:42.186088', '28', 'Pod资源对象', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1295, '2022-05-29 11:30:42.215492', '27', '标签与标签选择器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1296, '2022-05-29 11:30:42.245336', '26', '管理Namespace资源', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1297, '2022-05-29 11:30:42.275621', '25', 'k8s yaml字段大全', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1298, '2022-05-29 11:30:42.305727', '24', 'yuml文件', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1299, '2022-05-29 11:30:42.347705', '23', 'K8S中的资源对象', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1300, '2022-05-29 11:30:42.385254', '22', '日常命令总结', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1301, '2022-05-29 11:30:42.415362', '21', '存储常用命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1302, '2022-05-29 11:30:42.449490', '20', 'service常用命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1303, '2022-05-29 11:30:42.495566', '19', '控制器常用命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1304, '2022-05-29 11:30:42.545519', '18', 'pod常用命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1305, '2022-05-29 11:30:42.585512', '17', 'node常用命令', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1306, '2022-05-29 11:30:42.625649', '16', '命令格式', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1307, '2022-05-29 11:30:42.655692', '15', '部署Harbor私有镜像仓库', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1308, '2022-05-29 11:30:42.685599', '14', '部署elk日志收集', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1309, '2022-05-29 11:30:42.715681', '13', '部署Prometheus+Grafana', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1310, '2022-05-29 11:30:42.756962', '12', '部署metrics-server监控组件', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1311, '2022-05-29 11:30:42.785643', '11', '部署dashboard', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1312, '2022-05-29 11:30:42.815756', '10', '部署calico网络组件', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1313, '2022-05-29 11:30:42.846104', '9', '部署ingress控制器', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1314, '2022-05-29 11:30:42.875730', '8', '部署helm', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1315, '2022-05-29 11:30:42.905564', '7', '部署kubernets', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1316, '2022-05-29 11:30:42.935413', '6', '前期准备', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1317, '2022-05-29 11:30:42.965777', '5', '通过阿里云获取gcr.io镜像文件', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1318, '2022-05-29 11:30:42.995634', '4', '抽象对象', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1319, '2022-05-29 11:30:43.026843', '3', '集群组件', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1320, '2022-05-29 11:30:43.055641', '2', '概念和术语', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1321, '2022-05-29 11:30:43.105683', '1', 'Kubernetes特性', 3, '', 10, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1322, '2022-05-29 11:31:15.906143', '6', 'adc', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1323, '2022-05-29 11:31:15.946156', '76', 'MK', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1324, '2022-05-29 11:31:15.976065', '75', '卡***6', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1325, '2022-05-29 11:31:16.006256', '65', '崔亮', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1326, '2022-05-29 11:31:16.038430', '74', '星空              ❶', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1327, '2022-05-29 11:31:16.066930', '73', 'hu健力', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1328, '2022-05-29 11:31:16.096831', '64', 'Liang.Cui', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1329, '2022-05-29 11:31:16.126837', '72', 'Marks', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1330, '2022-05-29 11:31:16.156824', '68', '✎_M๓₯μl ♡柠檬不萌2', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1331, '2022-05-29 11:31:16.186856', '71', '空空', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1332, '2022-05-29 11:31:16.216352', '70', 'hutu', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1333, '2022-05-29 11:31:16.246338', '69', '‘', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1334, '2022-05-29 11:31:16.276361', '62', '河***广', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1335, '2022-05-29 11:31:16.306723', '63', '星空的泪痕', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1336, '2022-05-29 11:31:16.336102', '61', '✎_M๓₯μl ♡柠檬不萌', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1337, '2022-05-29 11:31:16.366250', '60', '半旧冬天', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1338, '2022-05-29 11:31:16.396069', '49', '卫慧杰', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1339, '2022-05-29 11:31:16.426368', '48', '沫沫', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1340, '2022-05-29 11:31:16.456422', '36', '奏.弦&请安静', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1341, '2022-05-29 11:31:16.496158', '35', '海棠', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1342, '2022-05-29 11:31:16.526464', '34', '白熊', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1343, '2022-05-29 11:31:16.566494', '31', '樂活6', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1344, '2022-05-29 11:31:16.597369', '33', '越前*', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1345, '2022-05-29 11:31:16.626465', '32', '菰菰單單', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1346, '2022-05-29 11:31:16.656240', '28', 'Lee', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1347, '2022-05-29 11:31:16.686282', '30', 'K', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1348, '2022-05-29 11:31:16.716439', '29', '樂活', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1349, '2022-05-29 11:31:16.746488', '24', '溺水卫', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1350, '2022-05-29 11:31:16.786445', '23', '用户6465473984', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1351, '2022-05-29 11:31:16.816407', '22', '溺水老卫', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1352, '2022-05-29 11:31:16.846272', '14', '晓林', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1353, '2022-05-29 11:31:16.877055', '13', 'shibosen', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1354, '2022-05-29 11:31:16.916553', '12', 'tyh2001', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1355, '2022-05-29 11:31:16.960314', '11', 'adc123', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1356, '2022-05-29 11:31:16.996343', '10', 'mvp', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1357, '2022-05-29 11:31:17.026521', '9', '哈哈哈', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1358, '2022-05-29 11:31:17.061524', '8', '张三', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1359, '2022-05-29 11:31:17.086380', '4', '蕉太狼', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1360, '2022-05-29 11:31:17.116460', '3', '浮生若梦', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1361, '2022-05-29 11:31:17.148188', '2', '南城阿宇', 3, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1362, '2022-05-29 11:31:57.008427', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Last login\", \"\\u624b\\u673a\\u53f7\"]}}]', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1363, '2022-05-29 11:32:33.010477', '26', '二丫讲梵', 3, '', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1364, '2022-05-29 11:32:33.226164', '13', 'Alexcld colwn fish', 3, '', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1365, '2022-05-29 11:32:33.277397', '10', '糊涂博客', 3, '', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1366, '2022-05-29 11:32:33.314512', '9', 'StarsL\'s Blog', 3, '', 18, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1367, '2022-05-29 11:32:33.354237', '5', 'Alliot\'s blog', 3, '', 18, 1);
COMMIT;

-- ----------------------------
-- Table structure for django_apscheduler_djangojob
-- ----------------------------
DROP TABLE IF EXISTS `django_apscheduler_djangojob`;
CREATE TABLE `django_apscheduler_djangojob` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `next_run_time` datetime(6) DEFAULT NULL,
  `job_state` longblob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_apscheduler_djangojob_next_run_time_2f022619` (`next_run_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of django_apscheduler_djangojob
-- ----------------------------
BEGIN;
INSERT INTO `django_apscheduler_djangojob` (`id`, `next_run_time`, `job_state`) VALUES ('check_ssl_job', '2022-05-29 17:00:00.000000', 0x800595F0030000000000007D94288C0776657273696F6E944B018C026964948C0D636865636B5F73736C5F6A6F62948C0466756E63948C1C7075626C69632E63726F6E7461623A636865636B5F73736C5F6A6F62948C0774726967676572948C1961707363686564756C65722E74726967676572732E63726F6E948C0B43726F6E547269676765729493942981947D942868014B028C0874696D657A6F6E65948C047079747A948C025F70949394288C0D417369612F5368616E67686169944DE8714B008C034C4D5494749452948C0A73746172745F64617465944E8C08656E645F64617465944E8C066669656C6473945D94288C2061707363686564756C65722E74726967676572732E63726F6E2E6669656C6473948C09426173654669656C649493942981947D94288C046E616D65948C0479656172948C0A69735F64656661756C7494888C0B65787072657373696F6E73945D948C2561707363686564756C65722E74726967676572732E63726F6E2E65787072657373696F6E73948C0D416C6C45787072657373696F6E9493942981947D948C0473746570944E736261756268188C0A4D6F6E74684669656C649493942981947D9428681D8C056D6F6E746894681F8868205D9468242981947D9468274E736261756268188C0F4461794F664D6F6E74684669656C649493942981947D9428681D8C0364617994681F8868205D9468242981947D9468274E736261756268188C095765656B4669656C649493942981947D9428681D8C047765656B94681F8868205D9468242981947D9468274E736261756268188C0E4461794F665765656B4669656C649493942981947D9428681D8C0B6461795F6F665F7765656B94681F8868205D9468242981947D9468274E7362617562681A2981947D9428681D8C04686F757294681F8968205D9468228C0F52616E676545787072657373696F6E9493942981947D942868274E8C056669727374944B018C046C617374944B017562617562681A2981947D9428681D8C066D696E75746594681F8968205D94684D2981947D942868274E68504B0068514B007562617562681A2981947D9428681D8C067365636F6E6494681F8868205D94684D2981947D942868274E68504B0068514B007562617562658C066A6974746572944E75628C086578656375746F72948C0764656661756C74948C046172677394298C066B7761726773947D94681D68038C126D6973666972655F67726163655F74696D65944D84038C08636F616C6573636594888C0D6D61785F696E7374616E636573944B058C0D6E6578745F72756E5F74696D65948C086461746574696D65948C086461746574696D65949394430A07E6051E01000000000094680F2868104D80704B008C03435354947494529486945294752E);
INSERT INTO `django_apscheduler_djangojob` (`id`, `next_run_time`, `job_state`) VALUES ('delete_old_job_executions', '2022-05-29 16:00:00.000000', 0x8005952B040000000000007D94288C0776657273696F6E944B018C026964948C1964656C6574655F6F6C645F6A6F625F657865637574696F6E73948C0466756E63948C287075626C69632E63726F6E7461623A64656C6574655F6F6C645F6A6F625F657865637574696F6E73948C0774726967676572948C1961707363686564756C65722E74726967676572732E63726F6E948C0B43726F6E547269676765729493942981947D942868014B028C0874696D657A6F6E65948C047079747A948C025F70949394288C0D417369612F5368616E67686169944DE8714B008C034C4D5494749452948C0A73746172745F64617465944E8C08656E645F64617465944E8C066669656C6473945D94288C2061707363686564756C65722E74726967676572732E63726F6E2E6669656C6473948C09426173654669656C649493942981947D94288C046E616D65948C0479656172948C0A69735F64656661756C7494888C0B65787072657373696F6E73945D948C2561707363686564756C65722E74726967676572732E63726F6E2E65787072657373696F6E73948C0D416C6C45787072657373696F6E9493942981947D948C0473746570944E736261756268188C0A4D6F6E74684669656C649493942981947D9428681D8C056D6F6E746894681F8868205D9468242981947D9468274E736261756268188C0F4461794F664D6F6E74684669656C649493942981947D9428681D8C0364617994681F8868205D9468242981947D9468274E736261756268188C095765656B4669656C649493942981947D9428681D8C047765656B94681F8868205D9468242981947D9468274E736261756268188C0E4461794F665765656B4669656C649493942981947D9428681D8C0B6461795F6F665F7765656B94681F8968205D9468228C165765656B64617952616E676545787072657373696F6E9493942981947D942868274E8C056669727374944B008C046C617374944B007562617562681A2981947D9428681D8C04686F757294681F8968205D9468228C0F52616E676545787072657373696F6E9493942981947D942868274E684A4B00684B4B007562617562681A2981947D9428681D8C066D696E75746594681F8968205D9468512981947D942868274E684A4B00684B4B007562617562681A2981947D9428681D8C067365636F6E6494681F8868205D9468512981947D942868274E684A4B00684B4B007562617562658C066A6974746572944E75628C086578656375746F72948C0764656661756C74948C046172677394298C066B7761726773947D94681D68038C126D6973666972655F67726163655F74696D65944B018C08636F616C6573636594888C0D6D61785F696E7374616E636573944B018C0D6E6578745F72756E5F74696D65948C086461746574696D65948C086461746574696D65949394430A07E6051E00000000000094680F2868104D80704B008C03435354947494529486945294752E);
INSERT INTO `django_apscheduler_djangojob` (`id`, `next_run_time`, `job_state`) VALUES ('sitemap_job', '2022-05-29 18:00:00.000000', 0x800595EC030000000000007D94288C0776657273696F6E944B018C026964948C0B736974656D61705F6A6F62948C0466756E63948C1A7075626C69632E63726F6E7461623A736974656D61705F6A6F62948C0774726967676572948C1961707363686564756C65722E74726967676572732E63726F6E948C0B43726F6E547269676765729493942981947D942868014B028C0874696D657A6F6E65948C047079747A948C025F70949394288C0D417369612F5368616E67686169944DE8714B008C034C4D5494749452948C0A73746172745F64617465944E8C08656E645F64617465944E8C066669656C6473945D94288C2061707363686564756C65722E74726967676572732E63726F6E2E6669656C6473948C09426173654669656C649493942981947D94288C046E616D65948C0479656172948C0A69735F64656661756C7494888C0B65787072657373696F6E73945D948C2561707363686564756C65722E74726967676572732E63726F6E2E65787072657373696F6E73948C0D416C6C45787072657373696F6E9493942981947D948C0473746570944E736261756268188C0A4D6F6E74684669656C649493942981947D9428681D8C056D6F6E746894681F8868205D9468242981947D9468274E736261756268188C0F4461794F664D6F6E74684669656C649493942981947D9428681D8C0364617994681F8868205D9468242981947D9468274E736261756268188C095765656B4669656C649493942981947D9428681D8C047765656B94681F8868205D9468242981947D9468274E736261756268188C0E4461794F665765656B4669656C649493942981947D9428681D8C0B6461795F6F665F7765656B94681F8868205D9468242981947D9468274E7362617562681A2981947D9428681D8C04686F757294681F8968205D9468228C0F52616E676545787072657373696F6E9493942981947D942868274E8C056669727374944B028C046C617374944B027562617562681A2981947D9428681D8C066D696E75746594681F8968205D94684D2981947D942868274E68504B0068514B007562617562681A2981947D9428681D8C067365636F6E6494681F8868205D94684D2981947D942868274E68504B0068514B007562617562658C066A6974746572944E75628C086578656375746F72948C0764656661756C74948C046172677394298C066B7761726773947D94681D68038C126D6973666972655F67726163655F74696D65944D84038C08636F616C6573636594888C0D6D61785F696E7374616E636573944B058C0D6E6578745F72756E5F74696D65948C086461746574696D65948C086461746574696D65949394430A07E6051E02000000000094680F2868104D80704B008C03435354947494529486945294752E);
COMMIT;

-- ----------------------------
-- Table structure for django_apscheduler_djangojobexecution
-- ----------------------------
DROP TABLE IF EXISTS `django_apscheduler_djangojobexecution`;
CREATE TABLE `django_apscheduler_djangojobexecution` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `run_time` datetime(6) NOT NULL,
  `duration` decimal(15,2) DEFAULT NULL,
  `finished` decimal(15,2) DEFAULT NULL,
  `exception` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `traceback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `job_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_job_executions` (`job_id`,`run_time`),
  KEY `django_apscheduler_djangojobexecution_run_time_16edd96b` (`run_time`),
  CONSTRAINT `django_apscheduler_djangojobexecution_job_id_daf5090a_fk` FOREIGN KEY (`job_id`) REFERENCES `django_apscheduler_djangojob` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=744 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of django_apscheduler_djangojobexecution
-- ----------------------------
BEGIN;
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (678, 'Executed', '2022-05-15 17:00:00.000000', 1.69, 1652634001.69, NULL, NULL, 'check_ssl_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (680, 'Executed', '2022-05-15 18:00:00.000000', 0.57, 1652637600.57, NULL, NULL, 'sitemap_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (683, 'Executed', '2022-05-16 17:00:00.000000', 2.04, 1652720402.04, NULL, NULL, 'check_ssl_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (685, 'Executed', '2022-05-16 18:00:00.000000', 0.96, 1652724000.96, NULL, NULL, 'sitemap_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (686, 'Error!', '2022-05-17 17:00:00.000000', 1.41, 1652806801.41, '(4031, \'The client was disconnected by the server because of inactivity. See wait_timeout and interactive_timeout for configuring this behavior.\')', '  File \"/usr/local/lib/python3.8/site-packages/apscheduler/executors/base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n  File \"./public/crontab.py\", line 69, in check_ssl_job\n    admin_email = UserInfo.objects.get(id=1).email\n  File \"/usr/local/lib/python3.8/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/usr/local/lib/python3.8/site-packages/django/db/models/query.py\", line 431, in get\n    num = len(clone)\n  File \"/usr/local/lib/python3.8/site-packages/django/db/models/query.py\", line 262, in __len__\n    self._fetch_all()\n  File \"/usr/local/lib/python3.8/site-packages/django/db/models/query.py\", line 1324, in _fetch_all\n    self._result_cache = list(self._iterable_class(self))\n  File \"/usr/local/lib/python3.8/site-packages/django/db/models/query.py\", line 51, in __iter__\n    results = compiler.execute_sql(chunked_fetch=self.chunked_fetch, chunk_size=self.chunk_size)\n  File \"/usr/local/lib/python3.8/site-packages/django/db/models/sql/compiler.py\", line 1169, in execute_sql\n    cursor.execute(sql, params)\n  File \"/usr/local/lib/python3.8/site-packages/django/db/backends/utils.py\", line 98, in execute\n    return super().execute(sql, params)\n  File \"/usr/local/lib/python3.8/site-packages/django/db/backends/utils.py\", line 66, in execute\n    return self._execute_with_wrappers(sql, params, many=False, executor=self._execute)\n  File \"/usr/local/lib/python3.8/site-packages/django/db/backends/utils.py\", line 75, in _execute_with_wrappers\n    return executor(sql, params, many, context)\n  File \"/usr/local/lib/python3.8/site-packages/django/db/backends/utils.py\", line 84, in _execute\n    return self.cursor.execute(sql, params)\n  File \"/usr/local/lib/python3.8/site-packages/django/db/utils.py\", line 90, in __exit__\n    raise dj_exc_value.with_traceback(traceback) from exc_value\n  File \"/usr/local/lib/python3.8/site-packages/django/db/backends/utils.py\", line 84, in _execute\n    return self.cursor.execute(sql, params)\n  File \"/usr/local/lib/python3.8/site-packages/django/db/backends/mysql/base.py\", line 73, in execute\n    return self.cursor.execute(query, args)\n  File \"/usr/local/lib64/python3.8/site-packages/MySQLdb/cursors.py\", line 206, in execute\n    res = self._query(query)\n  File \"/usr/local/lib64/python3.8/site-packages/MySQLdb/cursors.py\", line 319, in _query\n    db.query(q)\n  File \"/usr/local/lib64/python3.8/site-packages/MySQLdb/connections.py\", line 254, in query\n    _mysql.connection.query(self, query)\n', 'check_ssl_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (689, 'Executed', '2022-05-17 18:00:00.000000', 1.35, 1652810401.35, NULL, NULL, 'sitemap_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (692, 'Error!', '2022-05-18 17:00:00.000000', 2.56, 1652893202.56, '(4031, \'The client was disconnected by the server because of inactivity. See wait_timeout and interactive_timeout for configuring this behavior.\')', '  File \"/usr/local/lib/python3.8/site-packages/apscheduler/executors/base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n  File \"./public/crontab.py\", line 69, in check_ssl_job\n    admin_email = UserInfo.objects.get(id=1).email\n  File \"/usr/local/lib/python3.8/site-packages/django/db/models/manager.py\", line 85, in manager_method\n    return getattr(self.get_queryset(), name)(*args, **kwargs)\n  File \"/usr/local/lib/python3.8/site-packages/django/db/models/query.py\", line 431, in get\n    num = len(clone)\n  File \"/usr/local/lib/python3.8/site-packages/django/db/models/query.py\", line 262, in __len__\n    self._fetch_all()\n  File \"/usr/local/lib/python3.8/site-packages/django/db/models/query.py\", line 1324, in _fetch_all\n    self._result_cache = list(self._iterable_class(self))\n  File \"/usr/local/lib/python3.8/site-packages/django/db/models/query.py\", line 51, in __iter__\n    results = compiler.execute_sql(chunked_fetch=self.chunked_fetch, chunk_size=self.chunk_size)\n  File \"/usr/local/lib/python3.8/site-packages/django/db/models/sql/compiler.py\", line 1169, in execute_sql\n    cursor.execute(sql, params)\n  File \"/usr/local/lib/python3.8/site-packages/django/db/backends/utils.py\", line 98, in execute\n    return super().execute(sql, params)\n  File \"/usr/local/lib/python3.8/site-packages/django/db/backends/utils.py\", line 66, in execute\n    return self._execute_with_wrappers(sql, params, many=False, executor=self._execute)\n  File \"/usr/local/lib/python3.8/site-packages/django/db/backends/utils.py\", line 75, in _execute_with_wrappers\n    return executor(sql, params, many, context)\n  File \"/usr/local/lib/python3.8/site-packages/django/db/backends/utils.py\", line 84, in _execute\n    return self.cursor.execute(sql, params)\n  File \"/usr/local/lib/python3.8/site-packages/django/db/utils.py\", line 90, in __exit__\n    raise dj_exc_value.with_traceback(traceback) from exc_value\n  File \"/usr/local/lib/python3.8/site-packages/django/db/backends/utils.py\", line 84, in _execute\n    return self.cursor.execute(sql, params)\n  File \"/usr/local/lib/python3.8/site-packages/django/db/backends/mysql/base.py\", line 73, in execute\n    return self.cursor.execute(query, args)\n  File \"/usr/local/lib64/python3.8/site-packages/MySQLdb/cursors.py\", line 206, in execute\n    res = self._query(query)\n  File \"/usr/local/lib64/python3.8/site-packages/MySQLdb/cursors.py\", line 319, in _query\n    db.query(q)\n  File \"/usr/local/lib64/python3.8/site-packages/MySQLdb/connections.py\", line 254, in query\n    _mysql.connection.query(self, query)\n', 'check_ssl_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (693, 'Executed', '2022-05-18 18:00:00.000000', 1.34, 1652896801.34, NULL, NULL, 'sitemap_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (696, 'Executed', '2022-05-19 17:00:00.000000', 0.40, 1652979600.40, NULL, NULL, 'check_ssl_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (697, 'Executed', '2022-05-19 18:00:00.000000', 1.06, 1652983201.06, NULL, NULL, 'sitemap_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (700, 'Executed', '2022-05-20 17:00:00.000000', 1.45, 1653066001.45, NULL, NULL, 'check_ssl_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (703, 'Executed', '2022-05-20 18:00:00.000000', 1.17, 1653069601.17, NULL, NULL, 'sitemap_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (705, 'Executed', '2022-05-21 17:00:00.000000', 0.38, 1653152400.38, NULL, NULL, 'check_ssl_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (707, 'Executed', '2022-05-21 18:00:00.000000', 0.84, 1653156000.84, NULL, NULL, 'sitemap_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (710, 'Executed', '2022-05-22 16:00:00.000000', 0.19, 1653235200.19, NULL, NULL, 'delete_old_job_executions');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (712, 'Error!', '2022-05-22 17:00:00.000000', 0.36, 1653238800.36, '\'NoneType\' object has no attribute \'group\'', '  File \"/usr/local/lib/python3.10/site-packages/apscheduler/executors/base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n  File \"/opt/myblog_api/./public/crontab.py\", line 58, in check_ssl_job\n    start_date = datetime.strptime(start_match.group(1), \"%b %d %H:%M:%S %Y GMT\")\n', 'check_ssl_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (713, 'Executed', '2022-05-22 18:00:00.000000', 0.70, 1653242400.70, NULL, NULL, 'sitemap_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (716, 'Error!', '2022-05-23 17:00:00.000000', 0.44, 1653325200.44, '\'NoneType\' object has no attribute \'group\'', '  File \"/usr/local/lib/python3.10/site-packages/apscheduler/executors/base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n  File \"/opt/myblog_api/./public/crontab.py\", line 58, in check_ssl_job\n    start_date = datetime.strptime(start_match.group(1), \"%b %d %H:%M:%S %Y GMT\")\n', 'check_ssl_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (718, 'Executed', '2022-05-23 18:00:00.000000', 0.86, 1653328800.86, NULL, NULL, 'sitemap_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (721, 'Error!', '2022-05-24 17:00:00.000000', 1.20, 1653411601.20, '\'NoneType\' object has no attribute \'group\'', '  File \"/usr/local/lib/python3.10/site-packages/apscheduler/executors/base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n  File \"/opt/myblog_api/./public/crontab.py\", line 58, in check_ssl_job\n    start_date = datetime.strptime(start_match.group(1), \"%b %d %H:%M:%S %Y GMT\")\n', 'check_ssl_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (726, 'Executed', '2022-05-24 18:00:00.000000', 0.74, 1653415200.74, NULL, NULL, 'sitemap_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (727, 'Error!', '2022-05-25 17:00:00.000000', 1.07, 1653498001.07, '\'NoneType\' object has no attribute \'group\'', '  File \"/usr/local/lib/python3.10/site-packages/apscheduler/executors/base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n  File \"/opt/myblog_api/./public/crontab.py\", line 58, in check_ssl_job\n    start_date = datetime.strptime(start_match.group(1), \"%b %d %H:%M:%S %Y GMT\")\n', 'check_ssl_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (730, 'Executed', '2022-05-25 18:00:00.000000', 0.64, 1653501600.64, NULL, NULL, 'sitemap_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (732, 'Error!', '2022-05-26 17:00:00.000000', 0.92, 1653584400.92, '\'NoneType\' object has no attribute \'group\'', '  File \"/usr/local/lib/python3.10/site-packages/apscheduler/executors/base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n  File \"/opt/myblog_api/./public/crontab.py\", line 58, in check_ssl_job\n    start_date = datetime.strptime(start_match.group(1), \"%b %d %H:%M:%S %Y GMT\")\n', 'check_ssl_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (734, 'Error!', '2022-05-26 18:00:00.000000', 0.72, 1653588000.72, '(2006, \'MySQL server has gone away\')', '  File \"/usr/local/lib/python3.10/site-packages/apscheduler/executors/base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n  File \"/opt/myblog_api/./public/crontab.py\", line 28, in sitemap_job\n    for article in articles:\n  File \"/usr/local/lib/python3.10/site-packages/django/db/models/query.py\", line 280, in __iter__\n    self._fetch_all()\n  File \"/usr/local/lib/python3.10/site-packages/django/db/models/query.py\", line 1324, in _fetch_all\n    self._result_cache = list(self._iterable_class(self))\n  File \"/usr/local/lib/python3.10/site-packages/django/db/models/query.py\", line 51, in __iter__\n    results = compiler.execute_sql(chunked_fetch=self.chunked_fetch, chunk_size=self.chunk_size)\n  File \"/usr/local/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1169, in execute_sql\n    cursor.execute(sql, params)\n  File \"/usr/local/lib/python3.10/site-packages/django/db/backends/utils.py\", line 98, in execute\n    return super().execute(sql, params)\n  File \"/usr/local/lib/python3.10/site-packages/django/db/backends/utils.py\", line 66, in execute\n    return self._execute_with_wrappers(sql, params, many=False, executor=self._execute)\n  File \"/usr/local/lib/python3.10/site-packages/django/db/backends/utils.py\", line 75, in _execute_with_wrappers\n    return executor(sql, params, many, context)\n  File \"/usr/local/lib/python3.10/site-packages/django/db/backends/utils.py\", line 79, in _execute\n    with self.db.wrap_database_errors:\n  File \"/usr/local/lib/python3.10/site-packages/django/db/utils.py\", line 90, in __exit__\n    raise dj_exc_value.with_traceback(traceback) from exc_value\n  File \"/usr/local/lib/python3.10/site-packages/django/db/backends/utils.py\", line 84, in _execute\n    return self.cursor.execute(sql, params)\n  File \"/usr/local/lib/python3.10/site-packages/django/db/backends/mysql/base.py\", line 73, in execute\n    return self.cursor.execute(query, args)\n  File \"/usr/local/lib/python3.10/site-packages/MySQLdb/cursors.py\", line 206, in execute\n    res = self._query(query)\n  File \"/usr/local/lib/python3.10/site-packages/MySQLdb/cursors.py\", line 319, in _query\n    db.query(q)\n  File \"/usr/local/lib/python3.10/site-packages/MySQLdb/connections.py\", line 254, in query\n    _mysql.connection.query(self, query)\n', 'sitemap_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (736, 'Error!', '2022-05-27 17:00:00.000000', 0.91, 1653670800.91, '\'NoneType\' object has no attribute \'group\'', '  File \"/usr/local/lib/python3.10/site-packages/apscheduler/executors/base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n  File \"/opt/myblog_api/./public/crontab.py\", line 58, in check_ssl_job\n    start_date = datetime.strptime(start_match.group(1), \"%b %d %H:%M:%S %Y GMT\")\n', 'check_ssl_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (737, 'Error!', '2022-05-27 18:00:00.000000', 0.57, 1653674400.57, '(2006, \'MySQL server has gone away\')', '  File \"/usr/local/lib/python3.10/site-packages/apscheduler/executors/base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n  File \"/opt/myblog_api/./public/crontab.py\", line 28, in sitemap_job\n    for article in articles:\n  File \"/usr/local/lib/python3.10/site-packages/django/db/models/query.py\", line 280, in __iter__\n    self._fetch_all()\n  File \"/usr/local/lib/python3.10/site-packages/django/db/models/query.py\", line 1324, in _fetch_all\n    self._result_cache = list(self._iterable_class(self))\n  File \"/usr/local/lib/python3.10/site-packages/django/db/models/query.py\", line 51, in __iter__\n    results = compiler.execute_sql(chunked_fetch=self.chunked_fetch, chunk_size=self.chunk_size)\n  File \"/usr/local/lib/python3.10/site-packages/django/db/models/sql/compiler.py\", line 1169, in execute_sql\n    cursor.execute(sql, params)\n  File \"/usr/local/lib/python3.10/site-packages/django/db/backends/utils.py\", line 98, in execute\n    return super().execute(sql, params)\n  File \"/usr/local/lib/python3.10/site-packages/django/db/backends/utils.py\", line 66, in execute\n    return self._execute_with_wrappers(sql, params, many=False, executor=self._execute)\n  File \"/usr/local/lib/python3.10/site-packages/django/db/backends/utils.py\", line 75, in _execute_with_wrappers\n    return executor(sql, params, many, context)\n  File \"/usr/local/lib/python3.10/site-packages/django/db/backends/utils.py\", line 79, in _execute\n    with self.db.wrap_database_errors:\n  File \"/usr/local/lib/python3.10/site-packages/django/db/utils.py\", line 90, in __exit__\n    raise dj_exc_value.with_traceback(traceback) from exc_value\n  File \"/usr/local/lib/python3.10/site-packages/django/db/backends/utils.py\", line 84, in _execute\n    return self.cursor.execute(sql, params)\n  File \"/usr/local/lib/python3.10/site-packages/django/db/backends/mysql/base.py\", line 73, in execute\n    return self.cursor.execute(query, args)\n  File \"/usr/local/lib/python3.10/site-packages/MySQLdb/cursors.py\", line 206, in execute\n    res = self._query(query)\n  File \"/usr/local/lib/python3.10/site-packages/MySQLdb/cursors.py\", line 319, in _query\n    db.query(q)\n  File \"/usr/local/lib/python3.10/site-packages/MySQLdb/connections.py\", line 254, in query\n    _mysql.connection.query(self, query)\n', 'sitemap_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (738, 'Error!', '2022-05-28 17:00:00.000000', 1.11, 1653757201.11, '\'NoneType\' object has no attribute \'group\'', '  File \"/usr/local/lib/python3.10/site-packages/apscheduler/executors/base.py\", line 125, in run_job\n    retval = job.func(*job.args, **job.kwargs)\n  File \"/opt/myblog_api/./public/crontab.py\", line 58, in check_ssl_job\n    start_date = datetime.strptime(start_match.group(1), \"%b %d %H:%M:%S %Y GMT\")\n', 'check_ssl_job');
INSERT INTO `django_apscheduler_djangojobexecution` (`id`, `status`, `run_time`, `duration`, `finished`, `exception`, `traceback`, `job_id`) VALUES (741, 'Executed', '2022-05-28 18:00:00.000000', 0.79, 1653760800.79, NULL, NULL, 'sitemap_job');
COMMIT;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (47, 'account', 'oauthid');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (32, 'account', 'searchkey');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (13, 'account', 'userinfo');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (44, 'account', 'useroauth');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (43, 'account', 'usersource');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (6, 'api', 'uploadimg');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (12, 'blog', 'article');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (11, 'blog', 'catalogue');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (7, 'blog', 'category');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (8, 'blog', 'note');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (10, 'blog', 'section');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (9, 'blog', 'tag');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (45, 'django_apscheduler', 'djangojob');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (46, 'django_apscheduler', 'djangojobexecution');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (14, 'management', 'about');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (15, 'management', 'carousel');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (16, 'management', 'imagesconfig');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (17, 'management', 'info');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (18, 'management', 'link');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (25, 'management', 'siteconfig');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (19, 'management', 'websiteconfig');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (39, 'oauth2_provider', 'accesstoken');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (38, 'oauth2_provider', 'application');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (40, 'oauth2_provider', 'grant');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (42, 'oauth2_provider', 'idtoken');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (41, 'oauth2_provider', 'refreshtoken');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (30, 'public', 'uploadimg');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (23, 'record', 'articlecomment');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (26, 'record', 'articlehistory');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (24, 'record', 'articleviewhistory');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (22, 'record', 'leavemessage');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (29, 'record', 'messagehistory');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (27, 'record', 'searchhistory');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (31, 'record', 'searchkey');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (21, 'record', 'sectioncomment');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (28, 'record', 'sectionhistory');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (20, 'record', 'sectionviewhistory');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (48, 'sites', 'site');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (33, 'social_django', 'association');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (34, 'social_django', 'code');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (35, 'social_django', 'nonce');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (37, 'social_django', 'partial');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (36, 'social_django', 'usersocialauth');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (1, 'contenttypes', '0001_initial', '2021-05-07 01:00:15.165480');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2021-05-07 01:00:15.514419');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (3, 'auth', '0001_initial', '2021-05-07 01:00:16.611360');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2021-05-07 01:00:16.799555');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (5, 'auth', '0003_alter_user_email_max_length', '2021-05-07 01:00:16.888145');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (6, 'auth', '0004_alter_user_username_opts', '2021-05-07 01:00:16.978726');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (7, 'auth', '0005_alter_user_last_login_null', '2021-05-07 01:00:17.069590');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (8, 'auth', '0006_require_contenttypes_0002', '2021-05-07 01:00:17.149495');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2021-05-07 01:00:17.234063');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (10, 'auth', '0008_alter_user_username_max_length', '2021-05-07 01:00:17.315970');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2021-05-07 01:00:17.403258');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (12, 'auth', '0010_alter_group_name_max_length', '2021-05-07 01:00:17.532766');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (13, 'auth', '0011_update_proxy_permissions', '2021-05-07 01:00:17.769799');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2021-05-07 01:00:17.863414');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (15, 'account', '0001_initial', '2021-05-07 01:00:19.564544');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (16, 'admin', '0001_initial', '2021-05-07 01:00:20.240759');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2021-05-07 01:00:20.326261');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2021-05-07 01:00:20.413473');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (19, 'api', '0001_initial', '2021-05-07 01:00:20.638526');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (20, 'blog', '0001_initial', '2021-05-07 01:00:23.707888');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (21, 'management', '0001_initial', '2021-05-07 01:00:25.873625');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (22, 'record', '0001_initial', '2021-05-07 01:00:29.165670');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (23, 'sessions', '0001_initial', '2021-05-07 01:00:29.507647');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (24, 'api', '0002_auto_20210507_1000', '2021-05-07 02:01:03.890556');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (25, 'api', '0003_auto_20210507_1002', '2021-05-07 02:02:44.608997');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (26, 'api', '0004_auto_20210508_0829', '2021-05-08 00:29:35.156229');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (27, 'blog', '0002_auto_20210508_0829', '2021-05-08 00:29:37.983916');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (28, 'account', '0002_rename_aboutme_userinfo_signature', '2021-05-08 00:56:02.382123');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (29, 'management', '0002_auto_20210508_0855', '2021-05-08 00:56:04.673817');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (30, 'management', '0003_auto_20210508_0857', '2021-05-08 00:57:43.497933');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (31, 'management', '0004_auto_20210508_0858', '2021-05-08 00:58:58.734768');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (32, 'record', '0002_auto_20210508_0913', '2021-05-08 01:14:08.124395');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (33, 'record', '0003_auto_20210508_0924', '2021-05-08 01:24:07.217962');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (34, 'account', '0003_userinfo_is_flow', '2021-05-08 02:15:42.731057');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (35, 'record', '0004_auto_20210508_1015', '2021-05-08 02:15:42.866411');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (36, 'account', '0004_alter_userinfo_is_flow', '2021-05-21 09:35:55.949656');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (37, 'account', '0005_alter_userinfo_is_flow', '2021-05-21 09:36:32.633306');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (38, 'account', '0006_alter_userinfo_web', '2021-05-22 01:14:49.930209');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (39, 'account', '0007_alter_userinfo_phone', '2021-05-22 01:17:58.829416');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (40, 'account', '0008_auto_20210528_2200', '2021-05-28 14:00:38.526179');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (41, 'account', '0009_userinfo_birthday', '2021-05-28 14:36:59.404393');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (42, 'account', '0010_alter_userinfo_photo', '2021-05-29 13:00:59.907846');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (43, 'api', '0005_alter_uploadimg_images', '2021-05-29 13:01:00.367471');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (44, 'blog', '0003_auto_20210529_2100', '2021-05-29 13:01:01.947250');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (45, 'management', '0005_alter_carousel_img', '2021-05-29 13:01:02.336264');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (46, 'account', '0011_alter_userinfo_web', '2021-05-29 14:31:13.160417');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (47, 'management', '0006_auto_20210529_2235', '2021-05-29 14:36:01.362828');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (48, 'public', '0001_initial', '2021-06-02 01:05:32.230941');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (49, 'record', '0005_auto_20210604_2114', '2021-06-04 13:14:11.335026');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (50, 'record', '0006_auto_20210604_2133', '2021-06-04 13:33:32.108937');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (51, 'record', '0007_auto_20210604_2203', '2021-06-04 14:03:16.958347');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (52, 'record', '0008_auto_20210604_2219', '2021-06-04 14:20:07.531792');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (53, 'account', '0012_userinfo_search_key', '2021-06-04 14:20:08.080235');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (54, 'account', '0013_rename_search_key_userinfo_searchs', '2021-06-04 14:21:50.653545');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (55, 'account', '0014_rename_searchs_userinfo_search', '2021-06-04 14:51:50.695850');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (56, 'record', '0009_rename_key_searchkey_name', '2021-06-05 00:16:57.670686');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (57, 'record', '0010_rename_name_searchkey_key', '2021-06-05 01:26:45.772078');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (58, 'account', '0015_auto_20210606_2233', '2021-06-06 14:38:04.547892');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (59, 'record', '0002_articlecomment_articlehistory_messagehistory_sectioncomment_sectionhistory', '2021-06-06 15:14:00.416411');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (60, 'record', '0002_leavemessage', '2021-06-07 11:12:56.848893');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (61, 'record', '0003_auto_20210607_2222', '2021-06-07 14:22:29.544861');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (62, 'record', '0004_alter_leavemessage_user', '2021-06-11 00:29:17.433703');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (63, 'record', '0005_auto_20210612_2203', '2021-06-12 14:04:05.064416');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (64, 'record', '0006_auto_20210612_2205', '2021-06-12 14:05:54.772750');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (65, 'record', '0002_auto_20210613_2039', '2021-06-13 12:39:37.242761');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (66, 'record', '0003_auto_20210613_2042', '2021-06-13 12:42:16.002896');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (67, 'record', '0004_alter_sectioncomment_options', '2021-06-13 12:43:33.624203');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (68, 'record', '0005_auto_20210613_2044', '2021-06-13 12:44:39.617410');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (69, 'record', '0006_auto_20210613_2221', '2021-06-13 14:21:50.581291');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (70, 'record', '0007_auto_20210614_1302', '2021-06-14 05:02:04.768629');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (71, 'record', '0008_rename_is_like_sectionhistory_is_collect', '2021-06-14 06:40:29.683429');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (72, 'record', '0009_auto_20210614_1532', '2021-06-14 07:32:55.602053');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (73, 'record', '0010_messagehistory_is_read', '2021-06-16 11:57:40.419119');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (74, 'record', '0011_delete_messagehistory', '2021-06-16 12:57:00.162669');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (75, 'management', '0002_auto_20210619_2142', '2021-06-19 13:42:20.362462');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (76, 'management', '0003_auto_20210619_2201', '2021-06-19 14:01:36.330003');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (77, 'management', '0004_alter_link_logo', '2021-06-20 13:37:37.060694');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (78, 'management', '0005_auto_20210620_2235', '2021-06-20 14:36:10.497701');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (79, 'management', '0002_auto_20210621_0834', '2021-06-21 00:34:49.071771');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (80, 'management', '0003_auto_20210702_2231', '2021-07-02 14:31:41.219589');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (81, 'default', '0001_initial', '2021-07-02 14:31:44.360759');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (82, 'social_auth', '0001_initial', '2021-07-02 14:31:44.414367');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (83, 'default', '0002_add_related_name', '2021-07-02 14:31:44.577907');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (84, 'social_auth', '0002_add_related_name', '2021-07-02 14:31:44.646061');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (85, 'default', '0003_alter_email_max_length', '2021-07-02 14:31:44.739267');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (86, 'social_auth', '0003_alter_email_max_length', '2021-07-02 14:31:44.790683');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (87, 'default', '0004_auto_20160423_0400', '2021-07-02 14:31:45.104809');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (88, 'social_auth', '0004_auto_20160423_0400', '2021-07-02 14:31:45.161526');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (89, 'social_auth', '0005_auto_20160727_2333', '2021-07-02 14:31:45.285028');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (90, 'social_django', '0006_partial', '2021-07-02 14:31:45.540321');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (91, 'social_django', '0007_code_timestamp', '2021-07-02 14:31:45.762682');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (92, 'social_django', '0008_partial_timestamp', '2021-07-02 14:31:45.993526');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (93, 'social_django', '0009_auto_20191118_0520', '2021-07-02 14:31:46.392188');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (94, 'social_django', '0010_uid_db_index', '2021-07-02 14:31:46.654733');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (95, 'social_django', '0011_auto_20210702_2231', '2021-07-02 14:31:47.379152');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (96, 'social_django', '0003_alter_email_max_length', '2021-07-02 14:31:47.499682');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (97, 'social_django', '0001_initial', '2021-07-02 14:31:47.555968');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (98, 'social_django', '0002_add_related_name', '2021-07-02 14:31:47.613533');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (99, 'social_django', '0005_auto_20160727_2333', '2021-07-02 14:31:47.670694');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (100, 'social_django', '0004_auto_20160423_0400', '2021-07-02 14:31:47.737727');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (101, 'oauth2_provider', '0001_initial', '2021-07-03 15:18:42.527320');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (102, 'oauth2_provider', '0002_auto_20190406_1805', '2021-07-03 15:18:43.153966');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (103, 'oauth2_provider', '0003_auto_20201211_1314', '2021-07-03 15:18:43.389137');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (104, 'oauth2_provider', '0004_auto_20200902_2022', '2021-07-03 15:18:45.547594');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (105, 'account', '0002_usersource', '2021-07-05 12:22:28.511226');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (106, 'management', '0003_auto_20210705_2022', '2021-07-05 12:22:28.598209');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (107, 'account', '0003_userinfo_source', '2021-07-05 12:31:45.328974');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (108, 'account', '0004_useroauth', '2021-07-05 13:13:51.086727');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (109, 'account', '0005_alter_useroauth_options', '2021-07-05 13:19:54.048153');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (110, 'account', '0006_auto_20210705_2123', '2021-07-05 13:23:25.684325');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (111, 'management', '0004_auto_20210804_2145', '2021-08-04 13:45:54.597807');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (112, 'blog', '0002_auto_20210821_1019', '2021-08-21 02:19:25.699875');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (113, 'django_apscheduler', '0001_initial', '2021-09-25 10:50:09.218357');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (114, 'django_apscheduler', '0002_auto_20180412_0758', '2021-09-25 10:50:09.377988');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (115, 'django_apscheduler', '0003_auto_20200716_1632', '2021-09-25 10:50:09.498006');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (116, 'django_apscheduler', '0004_auto_20200717_1043', '2021-09-25 10:50:10.160283');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (117, 'django_apscheduler', '0005_migrate_name_to_id', '2021-09-25 10:50:10.398703');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (118, 'django_apscheduler', '0006_remove_djangojob_name', '2021-09-25 10:50:10.538477');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (119, 'django_apscheduler', '0007_auto_20200717_1404', '2021-09-25 10:50:10.798125');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (120, 'django_apscheduler', '0008_remove_djangojobexecution_started', '2021-09-25 10:50:10.958160');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (121, 'management', '0005_alter_link_name', '2021-12-10 13:28:33.512210');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (122, 'public', '0002_delete_uploadimg', '2021-12-21 14:33:19.633492');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (123, 'account', '0002_delete_useroauth', '2021-12-25 12:02:19.438034');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (124, 'account', '0003_oauthid', '2021-12-25 12:31:56.306798');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (125, 'account', '0004_auto_20220222_2254', '2022-02-22 14:54:33.623877');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (126, 'management', '0002_alter_link_type', '2022-02-22 14:54:33.695736');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (127, 'blog', '0002_auto_20220305_1123', '2022-03-05 03:24:24.857784');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (128, 'blog', '0003_alter_catalogue_options', '2022-03-19 09:20:45.978708');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (129, 'blog', '0004_article_blog_articl_title_12b0b3_idx', '2022-03-19 09:30:21.948766');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (130, 'blog', '0005_section_blog_sectio_title_2d7f6a_idx', '2022-03-19 09:33:28.418832');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (131, 'django_apscheduler', '0009_djangojobexecution_unique_job_executions', '2022-05-14 01:09:14.423045');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (132, 'sites', '0001_initial', '2022-05-16 00:55:55.508923');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (133, 'sites', '0002_alter_domain_unique', '2022-05-16 00:55:55.628769');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (134, 'management', '0003_siteconfig_sitemap', '2022-05-16 02:57:39.022236');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES ('2ic26gr4937yf96jzcgzq4xxopdnm0mb', '.eJzNmMlu2zAQhl8l0DmJtZAi1WPvPfZUF8Fwka1WS6ClQFHk3UvSTmszjCTTCuRLBIt_hpxvxJkh_wRPMPT7p6GT7VMhgk9BFNyfvmPAf8paD4gfUO-aR97UfVuwRy15PI52j18aIcvPR-2ZgT10e20W8iwWEMfqb06oIIwSGUcYURKKmEQJAUwo4STJQhAojmjEGGJRxgRAiDJttJL10Clb3_5sgxoquQ0-3W2D7XbAEcX6wVimHoRBpB8oTLfBvVIUas0HbQ7tXQ4PvGh5KQ-DlV55p4ffmE0xJdoQyNCaZNrs0JaHsQ2Iqqg3rGx2G2j7Qik2BwkI8XVMpcaPStZKELwdKuZeqK__L_d3S_n88l0Py0Lo0SgM42nbsVqf-sUJ8-XJoZe7pv09AfSf7BaIzvbaJppM2k5paH4xIn2J9rCbgKkVN8Bxvq82R-SwTViE1IMyttBO7yTvi6aeYPmqWoWnr882TzxtG4VCv8zy0Jdn3fRTadNIboHkbG9tkumkbZJKqafIMb4iZ4J6DlM4_-tugOl8v22mxH4RuVJLAmbdiUyW7B-QDEE_8th8F2mufSAxIh6xg-diMzyXDYiiGknR57L5kfMl4IDp67UdqMx-QV2fCY6pXn6ckCUjd26WMmlqtuSpcUzqSdIwzX3iyHkz1P1G98ZFnTcjobSV86PpS2USsC8JK5RRZL8IXVPn2KwbxKJdPY5IYj5Tqj_MjBKfVFpBDTupDiT9Blgz9O-H8Y3ygjB6AnCwvNhpO0Cu7hMn2Ox0mbCr98UJpvFtYQvXwenpuU3V1YvihDNjjeuMnCGTP01-vopqWdQ_Z1E1wpWo-nluU3V2pGfLzCJkerQ89TkpncDqil6qf82LkZrslq9C2JeCTdjVqVJtRsULgTip-xdl7RHQHNpGVcJyFuZ_4lUgXwnCZm13sJHraoVSxA8JCU5OIvOOCWO18pDnjkfvVKBcW884vXgSO7St2geteL3r2hddP3qP45bPD68vn_dz_5VM7KBmkzNRxo8nIjCflTAnoswcNpeMBW8qs4lmxuJVfgOxWIaQFZnY1ZqmKNIuEBHHS9HvJLR8P3cjnKtXYe_LwObrPJALSl87qoX4VrLrVH2YC9iSr0PYk4JN2FUwCMa60FEIw6UIlxJ-ySO3Sb5n4lXo-hKw6bpORue3Vx9QN483x_PTxZl8Hd6LMLHpT9_mf3jdPMKdWzct-Q3E4mPqJrZbHNf9HWVwmJrr7hgjqj1Mk0PeIyh5O2en5-z2hSzFA5T99FWeVM65reibte6BN7t3ruqGfr_ZqZPE88gl3X_NBYG83mlXTGc5akfJPl3E6cv34OUvqIEQDg:1lftkG:GImAnqTNJYJH52whbA1x1g_Nlecodv72zelu9HHeFEo', '2021-05-24 00:26:00.855000');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES ('9rco507dzmxsdigxemf09zgqa2p2lzvi', '.eJzNmUtz4ygQx79KSuck1gMEmuPe97in9VSqecjWjh4pPbZqayrffQHbmYghkoyVki-hDP809K8NNO2fwQsM_fFl6GT7UojgWxAFjx_7GPAfstYD4h-oD80zb-q-LdizljyfR7vnPxshyz_O2pGBI3RHbRbyLBYQx-pvTqggjBIZRxhREoqYRAkBTCjhJMlCECiOaMQYYlHGBECIMm20kvXQKVt__9wHNVRyH3x72Af7_YCjlJuGRKpJE8D6UyKTffCoFIVa80mbQ_uQwxMvWl7K02ClV97p4d_MIhmCbvI41PbSXKqGxIgsMDu05WlsB6Iq6h28FrvhtWxAFNVhd9KAEH9NypTgLGWtBMHboWLupfoSeHt8WMvrt-96WBZCj0ZhGNsdkWMyHFGzUsYyPQsDvXyCwvS2yKWYEm0IZGhNcn3kWNmoSLR9oRSfB26kuiZufv47UPr6bIcJzduO1frUJ06YL08OvTw07X8zQN9l90B0sdc2UTxrO6Wh-cSI9CXaw8Sx8q64A47LfbU5pg7bhEVINZSxlXZ6J3lfNPUMy4tqE56-Pts8ybxtFArdmeWhL8-66eeOTSO5B5KLvbVJ0lnbJJX6HsU5xjecmaDaYQ7nL90dMF3ut800szsS12Q4pvpMiROyZv4wNkuZNCe_5KlJjKTJscI098kDOW-Gut_p3Lio82YiFbSVy6PpS2UWsC8JK5RRZHeErqlzbNYNYtXcUOXIiUlzqf5iZpT4bMgKajhI9SDpd8Caof88jL8prwijJwBnnn2l03aAXJsPJ9i8FGTCbt4XHzBNbwtbuA1OT89tqq5cGyecGWtcn8gZMu8v86K7iWpZ1D8WUTXCjaj6eW5TdeXb42VmETI3fZ765NsfYHVFL9W_5sVE8u2Wb0LYl4JN2JWJU21GxQuBNnqpG1x1ak-A5tA26iYsF2F-F28C-UYQNmtid8SuOSnipwMJPuSzy5LNqbvydM6dH3CpQLm2nnF69SR2aFu1D1pxqZgci66frAa45cvD68vn87P_RiZ2ULPZmSjj57wazNdKmLw6M0-WNWPBm8psooWxuMjvIBbrELIiE7tS0xRF2gUi4ngt-p2Elh-XboSxehP2vgxsvq6ycCoovWRUK_GtZNep-2EpYEu-DWFPCjZh14VBMNYXHYUwXItwKeFfeeY2y3ck3oSuLwGbrrMsMaqBfMG9ea4_Lj8uRvJteK_CxKbvekGNZ_rye_MMd-m9acnvIBZfc29iO8VxFUkpg9PUXGfHGFHtYZqczj2CHD9fdnrO7ljIUjxB2c-X8qRyzm1FV9a6J94cPinVDf1xd1AvideJIt0vzRWBvN1pV0wXOWpHyX5dxOnb9-Dtf1nXD7A:1ljhqo:4QObBSFAHHaYLEirP0F5PnGm9yGmn_z_xnNdZc4G67c', '2021-06-03 12:32:30.359586');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES ('dg0pva83ibd4xrqixsbkcmbqjgtlrssn', '.eJzNmUtz4ygQx79KSuck1gMEmuPe97in9VSqecjWjh4pPbZqayrffQHbmYghkoyVki-hDP809K8NNO2fwQsM_fFl6GT7UojgWxAFjx_7GPAfstYD4h-oD80zb-q-LdizljyfR7vnPxshyz_O2pGBI3RHbRbyLBYQx-pvTqggjBIZRxhREoqYRAkBTCjhJMlCECiOaMQYYlHGBECIMm20kvXQKVt__9wHNVRyH3x72Af7_YCjlJuGRKpJE8D6UyKTffCoFIVa80mbQ_uQwxMvWl7K02ClV97p4d_MIhmCbvI41PbSXKqGxIgsMDu05WlsB6Iq6h28FrvhtWxAFNVhd9KAEH9NypTgLGWtBMHboWLupfoSeHt8WMvrt-96WBZCj0ZhGNsdkWMyHFGzUsYyPQsDvXyCwvS2yKWYEm0IZGhNcn3kWNmoSLR9oRSfB26kuiZufv47UPr6bIcJzduO1frUJ06YL08OvTw07X8zQN9l90B0sdc2UTxrO6Wh-cSI9CXaw8Sx8q64A47LfbU5pg7bhEVINZSxlXZ6J3lfNPUMy4tqE56-Pts8ybxtFArdmeWhL8-66eeOTSO5B5KLvbVJ0lnbJJX6HsU5xjecmaDaYQ7nL90dMF3ut800szsS12Q4pvpMiROyZv4wNkuZNCe_5KlJjKTJscI098kDOW-Gut_p3Lio82YiFbSVy6PpS2UWsC8JK5RRZHeErqlzbNYNYtXcUOXIiUlzqf5iZpT4bMgKajhI9SDpd8Caof88jL8prwijJwBnnn2l03aAXJsPJ9i8FGTCbt4XHzBNbwtbuA1OT89tqq5cGyecGWtcn8gZMu8v86K7iWpZ1D8WUTXCjaj6eW5TdeXb42VmETI3fZ765NsfYHVFL9W_5sVE8u2Wb0LYl4JN2JWJU21GxQuBNnqpG1x1ak-A5tA26iYsF2F-F28C-UYQNmtid8SuOSnipwMJPuSzy5LNqbvydM6dH3CpQLm2nnF69SR2aFu1D1pxqZgci66frAa45cvD68vn87P_RiZ2ULPZmSjj57wazNdKmLw6M0-WNWPBm8psooWxuMjvIBbrELIiE7tS0xRF2gUi4ngt-p2Elh-XboSxehP2vgxsvq6ycCoovWRUK_GtZNep-2EpYEu-DWFPCjZh14VBMNYXHYUwXItwKeFfeeY2y3ck3oSuLwGbrrMsMaqBfMG9ea4_Lj8uRvJteK_CxKbvekGNZ_rye_MMd-m9acnvIBZfc29iO8VxFUkpg9PUXGfHGFHtYZqczj2CHD9fdnrO7ljIUjxB2c-X8qRyzm1FV9a6J94cPinVDf1xd1AvideJIt0vzRWBvN1pV0wXOWpHyX5dxOnb9-Dtf1nXD7A:1ljet6:b-tvO0kTPrSbBw9KnDPAK5TorNTH6LPQdmes_5g2s3w', '2021-06-03 09:22:40.928216');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES ('gagbfpd86imqqrcao89ckd4aag9gkoeo', '.eJzNmUtz4ygQx79KSuck1gMEmuPe97in9VSqecjWjh4pPbZqayrffQHbmYghkoyVki-hDP809K8NNO2fwQsM_fFl6GT7UojgWxAFjx_7GPAfstYD4h-oD80zb-q-LdizljyfR7vnPxshyz_O2pGBI3RHbRbyLBYQx-pvTqggjBIZRxhREoqYRAkBTCjhJMlCECiOaMQYYlHGBECIMm20kvXQKVt__9wHNVRyH3x72Af7_YCjlJuGRKpJE8D6UyKTffCoFIVa80mbQ_uQwxMvWl7K02ClV97p4d_MIhmCbvI41PbSXKqGxIgsMDu05WlsB6Iq6h28FrvhtWxAFNVhd9KAEH9NypTgLGWtBMHboWLupfoSeHt8WMvrt-96WBZCj0ZhGNsdkWMyHFGzUsYyPQsDvXyCwvS2yKWYEm0IZGhNcn3kWNmoSLR9oRSfB26kuiZufv47UPr6bIcJzduO1frUJ06YL08OvTw07X8zQN9l90B0sdc2UTxrO6Wh-cSI9CXaw8Sx8q64A47LfbU5pg7bhEVINZSxlXZ6J3lfNPUMy4tqE56-Pts8ybxtFArdmeWhL8-66eeOTSO5B5KLvbVJ0lnbJJX6HsU5xjecmaDaYQ7nL90dMF3ut800szsS12Q4pvpMiROyZv4wNkuZNCe_5KlJjKTJscI098kDOW-Gut_p3Lio82YiFbSVy6PpS2UWsC8JK5RRZHeErqlzbNYNYtXcUOXIiUlzqf5iZpT4bMgKajhI9SDpd8Caof88jL8prwijJwBnnn2l03aAXJsPJ9i8FGTCbt4XHzBNbwtbuA1OT89tqq5cGyecGWtcn8gZMu8v86K7iWpZ1D8WUTXCjaj6eW5TdeXb42VmETI3fZ765NsfYHVFL9W_5sVE8u2Wb0LYl4JN2JWJU21GxQuBNnqpG1x1ak-A5tA26iYsF2F-F28C-UYQNmtid8SuOSnipwMJPuSzy5LNqbvydM6dH3CpQLm2nnF69SR2aFu1D1pxqZgci66frAa45cvD68vn87P_RiZ2ULPZmSjj57wazNdKmLw6M0-WNWPBm8psooWxuMjvIBbrELIiE7tS0xRF2gUi4ngt-p2Elh-XboSxehP2vgxsvq6ycCoovWRUK_GtZNep-2EpYEu-DWFPCjZh14VBMNYXHYUwXItwKeFfeeY2y3ck3oSuLwGbrrMsMaqBfMG9ea4_Lj8uRvJteK_CxKbvekGNZ_rye_MMd-m9acnvIBZfc29iO8VxFUkpg9PUXGfHGFHtYZqczj2CHD9fdnrO7ljIUjxB2c-X8qRyzm1FV9a6J94cPinVDf1xd1AvideJIt0vzRWBvN1pV0wXOWpHyX5dxOnb9-Dtf1nXD7A:1ljhoB:OfYKXd2W41cn333jcWVXFGAy_w_9NfZppO56w1sZZI0', '2021-06-03 12:29:47.256743');
COMMIT;

-- ----------------------------
-- Table structure for django_site
-- ----------------------------
DROP TABLE IF EXISTS `django_site`;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of django_site
-- ----------------------------
BEGIN;
INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES (1, 'www.cuiliangblog.cn', '崔亮的博客');
COMMIT;

-- ----------------------------
-- Table structure for management_about
-- ----------------------------
DROP TABLE IF EXISTS `management_about`;
CREATE TABLE `management_about` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `time` datetime(6) NOT NULL,
  `title` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of management_about
-- ----------------------------
BEGIN;
INSERT INTO `management_about` (`id`, `body`, `time`, `title`) VALUES (1, 'Hi 陌生人，欢迎访问我的博客网站！\r\n\r\n先做个简单的自我介绍。我叫崔亮，老家在甘肃，18年开始北漂。目前在IBM从事运维开发相关工作，日常工作主要就是centos、kubernetes、prometheus、grafana、elk的相关运维工作。\r\n\r\n作为一名专业的运维从业者。我精通水晶头的制作和服务器开关机重启，擅长centos系统管理、Web服务部署维护，熟悉Ansible批量运维工具和CI/CD相关使用，以及MySQL的基本操作，略懂Kubernets和docker容器管理，以及监控日志方面的prometheus、elk和grafana使用。\r\n\r\n编程开发方面，除了日常必备的shell脚本外，也经常使用Python开发一些小工具程序。比较常用web相关的Django、DRF、Flask库开发项目，偶尔也使用requests、 pandas库以及调用开源组件的API、SDK开发点小工具，提高运维效率。前端主要使用Vue开发项目。\r\n\r\n平时除了喜欢钻研技术外，空闲时间偶尔也爱看看电影、玩玩游戏。', '2022-05-16 09:00:56.485021', '关于博主');
INSERT INTO `management_about` (`id`, `body`, `time`, `title`) VALUES (2, '## 建站目的\r\n\r\n作为一名运维工程师，知识的积累是必不可少的，本人在工作和学习中记录了大量的笔记，打算通过这个博客平台，分享工作中遇到的各种问题的解决办法和学习笔记总结，本站所有文章和笔记内容都是本人亲自实践过后总结所得，各种坑已经替大家踩过了，大家可以放心参考。\r\n\r\n本站所有文章均为原创，若有引用会在博文底部均注明了参考地址，如有遗漏，欢迎您联系我进行处理。因原创文章均由自己手打而成，即使发表时检查再三也难免有错误或者错别字产生，如果您发现了需要更正的地方或者您有更好的见解和思路，欢迎评论留言。\r\n\r\n开发博客网站一方面也是为了督促自己每天学习，发表文章和笔记内容。另一方面，希望能通过这个网站结识更多志趣相同的人，一起交流研究运维技术，提高个人专业能力。\r\n\r\n\r\n## 网站技术\r\n\r\n目前的博客网站大多才有HEXO或者WordPress搭建而成，拿来即用。但博客网站这件事，我还是喜欢自己造轮子。可以随心所欲地按需开发功能模块，设计业务逻辑，制作前端样式。同时也是通过博客网站项目将业务产品从需求分析、功能模块设计、数据库设计、代码开发、项目测试、部署运维、SEO优化的整个流程做一个充分了解，提高自己的运维开发能力。\r\n\r\n网站前端使用VUE3.2框架，JavaScript开发语言，Vite构建工具完成开发。其中PC端使用element-plus，手机端使用vant，admin端也是element-plus，以及echaets实现数据可视化。\r\n\r\n网站后端使用Django REST framework。遵循RESTful API接口规范开发，为VUE前端提供API数据接口。\r\n\r\n由NGINX服务器根据用户不同的UA，反向代理至PC端或者手机端vue项目提供访问，手机端和PC端共用一套后端API接口，手机端访问地址[https://m.cuiliangblog.cn](https://m.cuiliangblog.cn \"https://m.cuiliangblog.cn\")，电脑端访问地址[https://www.cuiliangblog.cn](https://www.cuiliangblog.cn \"https://www.cuiliangblog.cn\")。\r\n\r\n富文本编辑器使用markdown。\r\n\r\n数据库使用MySQL，以及Redis缓存加速。\r\n\r\n网站部署在阿里云服务器，使用docker-compose部署。css、js、字体、图片等静态资源以及用户上传数据使用七牛OSS对象存储。前端VUE使用腾讯CDN提供加速服务。\r\n\r\n站点流量通过调用百度统计的api接口实现流量统计分析。\r\n\r\n整个项目遵循敏捷开发思路，使用腾讯coding实现项目自动打包构建与部署，以及CDN自动刷新等操作。\r\n\r\n## 网站架构\r\n\r\n![](https://oss.cuiliangblog.cn/markdown/%E5%8D%9A%E5%AE%A2%E7%BD%91%E7%AB%99%E6%9E%B6%E6%9E%841.png)\r\n\r\n## 功能模块\r\n\r\n博客网站按照用户身份权限共划分为游客访问前台、用户管理后台、管理员后台三部分，总共二十八个功能模块。\r\n\r\n除了具备博客网站基本的文章浏览查看评论功能外，还贴心的增加了主题换肤、深色模式适配、字体大小调整、第三方登录、邮件订阅等特色功能。\r\n\r\n### 游客用户前台\r\n\r\n不需要直接登录的页面均属于游客用户前台，包含网站首页、文章列表、笔记列表、标签列表、文章浏览、笔记浏览、归档、留言板、关于页等功能模块。\r\n\r\n### 电脑端用户管理后台\r\n\r\n用户登录或注册后，可以进行发表文章评论、收藏文章、发表留言以及回复留言评论操作，在个人中心可以查看自己的浏览记录，收藏记录，点赞记录，还可以修改个人信息、修改密码、修改邮箱等功能。\r\n\r\n- 个人中心\r\n![](https://oss.cuiliangblog.cn/markdown%2Fpc-user-1.png)\r\n\r\n- 个人中心（深色模式）\r\n![](https://oss.cuiliangblog.cn/markdown%2Fpc-user-2.png)\r\n\r\n- 修改信息\r\n![](https://oss.cuiliangblog.cn/markdown%2Fpc-user-3.png)\r\n\r\n- 浏览记录\r\n![](https://oss.cuiliangblog.cn/markdown%2Fpc-user-4.png)\r\n\r\n### 手机端用户管理后端\r\n\r\n- 个人中心\r\n![](https://oss.cuiliangblog.cn/markdown%2Fm-user-5.jpg)\r\n\r\n- 数据统计\r\n![](https://oss.cuiliangblog.cn/markdown%2Fm-user-3.jpg)\r\n\r\n- 修改信息\r\n![](https://oss.cuiliangblog.cn/markdown%2Fm-user-2.jpg)\r\n\r\n- 浏览记录\r\n![](https://oss.cuiliangblog.cn/markdown%2Fm-user-4.jpg)\r\n\r\n- 字体设置\r\n![](https://oss.cuiliangblog.cn/markdown%2Fm-user-1.jpg)\r\n\r\n### admin端管理员后台\r\n\r\n后台博客管理系统是为管理员管理博客而设置的，管理员可以查看网站流量数据，查看注册用户信息，可以对文章进行发布、修改、删除操作。以及对文章分类，标签管理。还有设置博客网站的轮播图、友情链接等内容。\r\n\r\n![](https://oss.cuiliangblog.cn/markdown/2020_12_26_23_52_32_791830.jpg)\r\n\r\n![](https://oss.cuiliangblog.cn/markdown/2020_12_09_12_21_06_545641.png)\r\n\r\n![](https://oss.cuiliangblog.cn/markdown/2020_12_09_12_21_55_166338.png)\r\n\r\n![](https://oss.cuiliangblog.cn/markdown/2020_12_09_12_22_36_497601.png)\r\n\r\n![](https://oss.cuiliangblog.cn/markdown/2020_12_09_12_22_59_876194.png)\r\n\r\n![](https://oss.cuiliangblog.cn/markdown/2020_12_09_12_23_22_812681.png)\r\n\r\n正如冰山一般，你看到的仅是一小部分模块，网站后台页面同样精彩，也欢迎大家通过邮箱注册账号，登录体验完整功能！\r\n\r\n## 建站历程\r\n\r\n|  时间 | 事件  | 版本 |\r\n| ------------ | ------------ |-----------|\r\n|  2019.6.10 | 作为毕业设计作品，历时两个月完成开发。前端使用Bootstrap，实现了博客的基本功能  |v1|\r\n| 2020.5.11| 新版本开发完成，使用layui对前端页面进行美化，并使用layui-mini重构了用户个人中心模块，新增了系统管理模块。现已开源，欢迎大家访问。[gitee地址](https://gitee.com/cuiliang0302/myblog \"gitee地址\")  [github地址](https://github.com/cuiliang0302/myblog \"github地址\") |v2|\r\n|2021.3.22|使用vue+DRF重构项目，采用前后端分离模式。为更好优化手机端体验，单独开发PC端和手机端。目前项目正在开发中|v3', '2022-05-16 10:07:10.818456', '关于网站');
INSERT INTO `management_about` (`id`, `body`, `time`, `title`) VALUES (3, '### 申请地址：\r\n\r\n[https://www.cuiliangblog.cn/applyLink](https://www.cuiliangblog.cn/applyLink \"https://www.cuiliangblog.cn/applyLink\")\r\n\r\n\r\n### 申请格式：\r\n\r\n- 网站名称：崔亮的博客\r\n\r\n- 网站地址：https://www.cuiliangblog.cn\r\n\r\n- 网站简介：专注devops自动化运维，传播优秀it运维技术文章\r\n\r\n- 网站logo尺寸：https://oss.cuiliangblog.cn/image/logo.png', '2021-12-10 14:16:12.033273', '关于友链');
INSERT INTO `management_about` (`id`, `body`, `time`, `title`) VALUES (4, '### 赞赏说明\r\n由于网站每个月都需要大量的费用维护，且目前没有有效的盈利方式\r\n\r\n如果您感觉本站对您有帮助，欢迎扫取下面的二维码赞助一顿饭钱，让博主不再忍受饥饿~\r\n\r\n但是如果您感觉本站对您没有任何帮助，那么一分钱也不要赞助，让博主继续饿着吧！(๑•̀ㅂ•́)و✧\r\n\r\n（请赞助后发送邮件或添加本人QQ/微信联系，如果未联系，则默认为匿名赞助。）\r\n### 赞赏地址\r\n![](https://oss.cuiliangblog.cn/markdown/2020_10_28_12_05_13_529384.png)\r\n### 已赞赏列表\r\n赞助名单\r\n(按照赞助时间先后排名，以*开头的名单均为匿名赞助）：\r\n\r\n| 赞助者 |平台 |金额   |时间   |\r\n| :------------: | :------------: | :------------: | :------------: |\r\n| * |  支付宝 |5 |  2020.11.04 |\r\n|  寡人为王 |  微信|10 |  2020.11.08 |\r\n| *音|微信|  20 |  2020.11.11 |\r\n|  Marina | 微信| 3 |  2020.11.18 |\r\n|  *思亲 | 支付宝| 8 |  2020.11.19 |\r\n|  董小姐| 微信| 1 |  2020.11.19 |\r\n| 天空大海| 微信 | 88 | 2020.12.14|\r\n| 诗人的眼里| 微信 | 88 | 2021.2.5|\r\n| 天听| 微信 |30 |2021.2.8|\r\n| *宇| 微信 |5 |2021.2.23|\r\n|*玲|支付宝|300|2021.3.23|\r\n|*凯|支付宝|25|2021.3.24|\r\n|*才|支付宝|20|2021.3.28|\r\n|时光鸡|微信|6|2021.5.22|\r\n|*。|微信|1|2021.5.22|\r\n|*流|微信|20|2021.7.14|\r\n|时光鸡|微信|30|2021.8.21|\r\n|TOM|微信|66|2021.8.21|\r\n|小马哥|微信|500|2022.2.23|\r\n\r\n感谢以上所有人对本站的支持，我会更加努力让本站帮助到更多的人，谢谢！', '2022-02-25 02:29:40.927072', '关于赞赏');
INSERT INTO `management_about` (`id`, `body`, `time`, `title`) VALUES (5, '> 项目的开发离不开这些优秀的开源组件与框架。正是有了这些轮子，才使得开发过程更加的顺利。在此万分感谢大佬们贡献的开源项目。\r\n\r\n### CSS组件\r\n\r\n|  组件 | 简介 |地址|\r\n| ------------ | ------------ | ----------- |\r\n|animate.css | css动画库  | https://github.com/animate-css/animate.css |\r\n|normalize.css |css初始化| https://github.com/necolas/normalize.css|\r\n|loaders.css|css加载动画|https://github.com/ConnorAtherton/loaders.css|\r\n\r\n### JS组件\r\n\r\n|  组件 | 简介 |地址|\r\n| ------------ | ------------ | ----------- |\r\n|ECharts|js可视化图表库|https://github.com/apache/echarts|\r\n|Fuse.js|js模糊匹配搜索|https://fusejs.io|\r\n|Day.js|js处理日期时间|https://dayjs.fenxianglu.cn|\r\n|Lodash.js|js实用工具库|https://www.lodashjs.com|\r\n\r\n### VUE组件\r\n|  组件 | 简介 |地址|\r\n| ------------ | ------------ | ----------- |\r\n| vant  | 有赞vue组件库  | https://github.com/youzan/vant |\r\n| element-plus| 饿了么element组件库| https://github.com/element-plus/element-plus|\r\n|  vue-echarts |vue封装百度echarts| https://github.com/ecomfe/vue-echarts  |\r\n|vue-markdown-editor|markdown富文本编辑器| https://github.com/code-farmer-i/vue-markdown-editor |\r\n|vue3-cropper|头像图片裁剪(手机端)|https://github.com/dreamicalwestswim/vue3-cropper|\r\n|vue-cropper|头像图片裁剪(PC端)|https://github.com/xyxiao001/vue-cropper|\r\n|vue-drag-verify|滑块验证、图片验证|https://github.com/yimijianfang/vue-drag-verify|\r\n|vuex-along | vuex数据持久化|https://github.com/boenfu/vuex-along|\r\n|vue-clipboard3|剪切板调用操作|https://github.com/JamieCurnow/vue-clipboard3|\r\n|wangEditor |轻量级web富文本框| https://github.com/wangeditor-team/wangEditor |\r\n\r\n### Django组件\r\n|  组件 | 简介 |地址|\r\n| ------------ | ------------ | ----------- |\r\n|loguru|python日志记录|https://github.com/Delgan/loguru|\r\n|qiniu-python-sdk |七牛OSS存储sdk| https://github.com/qiniu/python-sdk|\r\n|simpleui |Django admin样式美化|https://gitee.com/tompeppa/simpleui|\r\n|django-redis | Django使用redis  | https://github.com/jazzband/django-redis |\r\n|django-apscheduler|Django定时任务|https://github.com/agronholm/apscheduler|\r\n|django-cors-headers|Django跨域|https://github.com/adamchainz/django-cors-headers|\r\n|django-filter|Django过滤|https://github.com/carltongibson/django-filter|\r\n|django-mdeditor|Django markdown富文本|https://github.com/pylixm/django-mdeditor|\r\n|drf-extensions|DRF 数据缓存|https://github.com/chibisov/drf-extensions|\r\n|djangorestframework-recursive|DRF 自关联递归序列化器|https://github.com/heywbj/django-rest-framework-recursive|\r\n|djangorestframework-simplejwt|DRF jwt认证|https://github.com/jazzband/djangorestframework-simplejwt|', '2021-12-14 02:32:29.580351', '特别鸣谢');
INSERT INTO `management_about` (`id`, `body`, `time`, `title`) VALUES (6, '整个博客系统分为博客网站后端API、管理员后台、桌面端前端、移动端前端四个项目组合而成，现已全部开源，欢迎访问。\r\n\r\n|项目名称 | github  | gitee  |\r\n| ------------ | ------------ | ------------ |\r\n|博客网站后端|[https://github.com/cuiliang0302/myblog_api](https://github.com/cuiliang0302/myblog_api)|  [https://gitee.com/cuiliang0302/myblog_api](https://gitee.com/cuiliang0302/myblog_api) |\r\n|博客网站桌面端前端|[https://github.com/cuiliang0302/myblog_pc](https://github.com/cuiliang0302/myblog_pc)|[https://gitee.com/cuiliang0302/myblog_pc](https://gitee.com/cuiliang0302/myblog_pc)|\r\n|博客网站移动端前端|[https://github.com/cuiliang0302/myblog_mobile](https://github.com/cuiliang0302/myblog_mobile)|[https://gitee.com/cuiliang0302/myblog_mobile](https://gitee.com/cuiliang0302/myblog_mobile)|\r\n|博客网站管理员后台|[https://github.com/cuiliang0302/myblog_admin](https://github.com/cuiliang0302/myblog_admin)|[https://gitee.com/cuiliang0302/myblog_admin](https://gitee.com/cuiliang0302/myblog_admin)|', '2022-05-27 11:02:15.170721', '项目地址');
COMMIT;

-- ----------------------------
-- Table structure for management_carousel
-- ----------------------------
DROP TABLE IF EXISTS `management_carousel`;
CREATE TABLE `management_carousel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `img` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of management_carousel
-- ----------------------------
BEGIN;
INSERT INTO `management_carousel` (`id`, `img`, `url`, `is_show`, `title`) VALUES (1, 'https://oss.cuiliangblog.cn/carousel/tengxun.png', 'https://cloud.tencent.com/act/cps/redirect?redirect=1077&cps_key=1dc036d339a0a2edb541d6386197a81b&from=console', 1, '腾讯云推广');
INSERT INTO `management_carousel` (`id`, `img`, `url`, `is_show`, `title`) VALUES (2, 'https://oss.cuiliangblog.cn/carousel/carousel-1.png', 'https://www.yuque.com/login?platform=wechat&inviteToken=d250cce7a9bfb322880f20b1d1c4cdc482efb9966f48a20bc6fbb66407542ced', 1, '语雀');
INSERT INTO `management_carousel` (`id`, `img`, `url`, `is_show`, `title`) VALUES (3, 'https://oss.cuiliangblog.cn/carousel/aliyun.png', 'https://www.aliyun.com/daily-act/ecs/fy22-12-yure?userCode=gs1gd34d', 1, '阿里云');
INSERT INTO `management_carousel` (`id`, `img`, `url`, `is_show`, `title`) VALUES (4, 'https://oss.cuiliangblog.cn/carousel/qiniu.png', 'https://s.qiniu.com/vMVVzq', 1, '七牛云');
INSERT INTO `management_carousel` (`id`, `img`, `url`, `is_show`, `title`) VALUES (5, 'https://oss.cuiliangblog.cn/carousel/%E5%8D%9A%E5%AE%A2%E5%BC%80%E6%BA%90.png', 'https://github.com/cuiliang0302/myblog', 0, '博客网站开源');
INSERT INTO `management_carousel` (`id`, `img`, `url`, `is_show`, `title`) VALUES (6, 'https://oss.cuiliangblog.cn/carousel/%E7%BD%91%E7%AB%99%E6%9B%B4%E6%96%B0%E5%85%AC%E5%91%8A.png', 'https://www.cuiliangblog.cn/', 1, '网站更新公告');
COMMIT;

-- ----------------------------
-- Table structure for management_info
-- ----------------------------
DROP TABLE IF EXISTS `management_info`;
CREATE TABLE `management_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `position` varchar(10) NOT NULL,
  `company` varchar(20) NOT NULL,
  `location` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `github` varchar(200) NOT NULL,
  `qq` varchar(200) NOT NULL,
  `wechat` varchar(200) NOT NULL,
  `gitee` varchar(200) NOT NULL,
  `ali_pay` varchar(200) NOT NULL,
  `wechat_pay` varchar(200) NOT NULL,
  `qq_img` varchar(200) NOT NULL,
  `wechat_img` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of management_info
-- ----------------------------
BEGIN;
INSERT INTO `management_info` (`id`, `position`, `company`, `location`, `email`, `github`, `qq`, `wechat`, `gitee`, `ali_pay`, `wechat_pay`, `qq_img`, `wechat_img`) VALUES (1, '运维开发工程师', 'IBM', '北京', 'cuiliang0302@qq.com', 'https://github.com/cuiliang0302', '1554382111', 'cuiliang0302', 'https://gitee.com/cuiliang0302', 'https://oss.cuiliangblog.cn/image/ali-pay.png', 'https://oss.cuiliangblog.cn/image/weixin-pay1.png', 'https://oss.cuiliangblog.cn/image/qq.png', 'https://oss.cuiliangblog.cn/image/weixin.png');
COMMIT;

-- ----------------------------
-- Table structure for management_link
-- ----------------------------
DROP TABLE IF EXISTS `management_link`;
CREATE TABLE `management_link` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `logo` varchar(200) NOT NULL,
  `name` varchar(25) NOT NULL,
  `url` varchar(200) NOT NULL,
  `describe` varchar(100) DEFAULT NULL,
  `type` varchar(1) NOT NULL,
  `is_activate` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of management_link
-- ----------------------------
BEGIN;
INSERT INTO `management_link` (`id`, `logo`, `name`, `url`, `describe`, `type`, `is_activate`) VALUES (1, 'https://oss.cuiliangblog.cn/logo/Vue.png', 'VUE', 'https://v3.vuejs.org/', '渐进式 JavaScript 框架', '2', 1);
INSERT INTO `management_link` (`id`, `logo`, `name`, `url`, `describe`, `type`, `is_activate`) VALUES (2, 'https://oss.cuiliangblog.cn/logo/django.png', 'Django', 'https://www.djangoproject.com/', 'python开源web开发框架', '2', 1);
INSERT INTO `management_link` (`id`, `logo`, `name`, `url`, `describe`, `type`, `is_activate`) VALUES (3, 'https://oss.cuiliangblog.cn/logo/DRF.png', 'Django REST Framework', 'https://www.django-rest-framework.org/', '遵循REST API规范的Django App开发框架', '2', 1);
INSERT INTO `management_link` (`id`, `logo`, `name`, `url`, `describe`, `type`, `is_activate`) VALUES (4, 'https://oss.cuiliangblog.cn/logo/vant.png', 'vant', 'https://vant-contrib.gitee.io/vant/v3/#/zh-CN', '轻量、可靠的移动端 Vue 组件库', '2', 1);
INSERT INTO `management_link` (`id`, `logo`, `name`, `url`, `describe`, `type`, `is_activate`) VALUES (16, 'https://oss.cuiliangblog.cn/link/2022_03_22_15_01_35_565-1647932495669.jpg', 'vite', 'https://cn.vitejs.dev/', '下一代前端开发与构建工具', '2', 1);
INSERT INTO `management_link` (`id`, `logo`, `name`, `url`, `describe`, `type`, `is_activate`) VALUES (17, 'https://oss.cuiliangblog.cn/link/2022_03_22_15_04_36_593-1647932676782.jpg', 'element-plus', 'https://element-plus.gitee.io/zh-CN/', '基于 Vue 3，面向设计师和开发者的组件库', '2', 1);
INSERT INTO `management_link` (`id`, `logo`, `name`, `url`, `describe`, `type`, `is_activate`) VALUES (18, 'https://oss.cuiliangblog.cn/link/2022_03_22_15_06_55_470-1647932815570.jpg', 'echarts', 'https://echarts.apache.org/zh/index.html', '一个基于 JavaScript 的开源可视化图表库', '2', 1);
COMMIT;

-- ----------------------------
-- Table structure for management_siteconfig
-- ----------------------------
DROP TABLE IF EXISTS `management_siteconfig`;
CREATE TABLE `management_siteconfig` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `domain` varchar(200) NOT NULL,
  `title` varchar(50) NOT NULL,
  `keywords` varchar(200) DEFAULT NULL,
  `describe` varchar(300) DEFAULT NULL,
  `copyright` varchar(100) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `logo` varchar(200) NOT NULL,
  `cover` varchar(200) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `icp_num` varchar(100) DEFAULT NULL,
  `icp_url` varchar(200) DEFAULT NULL,
  `police_num` varchar(100) DEFAULT NULL,
  `police_url` varchar(200) DEFAULT NULL,
  `sitemap` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of management_siteconfig
-- ----------------------------
BEGIN;
INSERT INTO `management_siteconfig` (`id`, `name`, `domain`, `title`, `keywords`, `describe`, `copyright`, `icon`, `logo`, `cover`, `photo`, `icp_num`, `icp_url`, `police_num`, `police_url`, `sitemap`) VALUES (1, '崔亮的博客', 'https://www.cuiliangblog.cn', '崔亮的博客-专注devops自动化运维，传播优秀it运维技术文章', '运维开发,自动化运维,k8s,docker,vue,python,prometheus,devops,linux,云计算,虚拟化', '崔亮的个人博客，致力于分享运维开发等技术经验，由系统运维、脚本编程、devops等分类组成，涵盖了docker、k8s、vue、python、DevOps、linux、prometheus、自动化运维、云计算、虚拟化等内容。', 'Copyright © 2019-2021 崔亮的博客 All Rights Reserved', 'https://oss.cuiliangblog.cn/image/favicon.ico', 'https://oss.cuiliangblog.cn/image/logo.png', 'https://oss.cuiliangblog.cn/image/cover.jpg', 'https://oss.cuiliangblog.cn/images/photo.jpg', '陇ICP备19001718号', 'https://beian.miit.gov.cn/#/Integrated/index', '京公安备11011202002337号', 'http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11011202002337', 'https://www.cuiliangblog.cn/sitemap.xml');
COMMIT;

-- ----------------------------
-- Table structure for record_articlecomment
-- ----------------------------
DROP TABLE IF EXISTS `record_articlecomment`;
CREATE TABLE `record_articlecomment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` datetime(6) NOT NULL,
  `like` int NOT NULL,
  `article_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `father_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `record_articlecomment_article_id_fd5670de_fk_blog_article_id` (`article_id`),
  KEY `record_articlecomment_user_id_7a364d80_fk_account_userinfo_id` (`user_id`),
  KEY `record_articlecommen_father_id_5e00f08a_fk_record_ar` (`father_id`),
  CONSTRAINT `record_articlecommen_father_id_5e00f08a_fk_record_ar` FOREIGN KEY (`father_id`) REFERENCES `record_articlecomment` (`id`),
  CONSTRAINT `record_articlecomment_article_id_fd5670de_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `record_articlecomment_user_id_7a364d80_fk_account_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `account_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of record_articlecomment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for record_articlehistory
-- ----------------------------
DROP TABLE IF EXISTS `record_articlehistory`;
CREATE TABLE `record_articlehistory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `time` datetime(6) NOT NULL,
  `is_collect` tinyint(1) NOT NULL,
  `article_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `record_articlehistory_article_id_a45c6922_fk_blog_article_id` (`article_id`),
  KEY `record_articlehistory_user_id_7fdf7117_fk_account_userinfo_id` (`user_id`),
  CONSTRAINT `record_articlehistory_article_id_a45c6922_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `record_articlehistory_user_id_7fdf7117_fk_account_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `account_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of record_articlehistory
-- ----------------------------
BEGIN;
INSERT INTO `record_articlehistory` (`id`, `time`, `is_collect`, `article_id`, `user_id`) VALUES (44, '2022-02-26 11:56:11.025886', 0, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for record_leavemessage
-- ----------------------------
DROP TABLE IF EXISTS `record_leavemessage`;
CREATE TABLE `record_leavemessage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` datetime(6) NOT NULL,
  `like` int NOT NULL,
  `user_id` bigint NOT NULL,
  `father_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `record_leavemessage_father_id_378d16de_fk_record_leavemessage_id` (`father_id`),
  KEY `record_leavemessage_user_id_9d96826b_fk_account_userinfo_id` (`user_id`),
  CONSTRAINT `record_leavemessage_father_id_378d16de_fk_record_leavemessage_id` FOREIGN KEY (`father_id`) REFERENCES `record_leavemessage` (`id`),
  CONSTRAINT `record_leavemessage_user_id_9d96826b_fk_account_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `account_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of record_leavemessage
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for record_sectioncomment
-- ----------------------------
DROP TABLE IF EXISTS `record_sectioncomment`;
CREATE TABLE `record_sectioncomment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` datetime(6) NOT NULL,
  `like` int NOT NULL,
  `section_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `father_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `record_sectioncomment_section_id_81b272aa_fk_blog_section_id` (`section_id`),
  KEY `record_sectioncomment_user_id_5d55d2ff_fk_account_userinfo_id` (`user_id`),
  KEY `record_sectioncommen_father_id_2aa78210_fk_record_se` (`father_id`),
  CONSTRAINT `record_sectioncommen_father_id_2aa78210_fk_record_se` FOREIGN KEY (`father_id`) REFERENCES `record_sectioncomment` (`id`),
  CONSTRAINT `record_sectioncomment_section_id_81b272aa_fk_blog_section_id` FOREIGN KEY (`section_id`) REFERENCES `blog_section` (`id`),
  CONSTRAINT `record_sectioncomment_user_id_5d55d2ff_fk_account_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `account_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of record_sectioncomment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for record_sectionhistory
-- ----------------------------
DROP TABLE IF EXISTS `record_sectionhistory`;
CREATE TABLE `record_sectionhistory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `time` datetime(6) NOT NULL,
  `is_collect` tinyint(1) NOT NULL,
  `section_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `record_sectionhistory_section_id_cb11ed6b_fk_blog_section_id` (`section_id`),
  KEY `record_sectionhistory_user_id_2e4392ec_fk_account_userinfo_id` (`user_id`),
  CONSTRAINT `record_sectionhistory_section_id_cb11ed6b_fk_blog_section_id` FOREIGN KEY (`section_id`) REFERENCES `blog_section` (`id`),
  CONSTRAINT `record_sectionhistory_user_id_2e4392ec_fk_account_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `account_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of record_sectionhistory
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
