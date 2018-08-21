/*
 Navicat MySQL Data Transfer

 Source Server         : mysql_aliyun
 Source Server Type    : MySQL
 Source Server Version : 50173
 Source Host           : 47.98.140.133:3306
 Source Schema         : bgm

 Target Server Type    : MySQL
 Target Server Version : 50173
 File Encoding         : 65001

 Date: 21/08/2018 09:53:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bgm
-- ----------------------------
DROP TABLE IF EXISTS `bgm`;
CREATE TABLE `bgm`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '播放地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bgm
-- ----------------------------
INSERT INTO `bgm` VALUES ('1808169KMKR7FWZC', '李宇春', '1987', '\\bgm\\1987.mp3');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `father_comment_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `to_user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `video_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '视频id',
  `from_user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言者，评论的用户id',
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `create_time` datetime NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('180816B7436NYPPH', 'undefined', 'undefined', '180816B6WCCK1DD4', '1808169PP0D0R3MW', '你好啊', '2018-08-16 15:46:13');
INSERT INTO `comments` VALUES ('180816BDR9K6C2Y8', 'undefined', 'undefined', '180816B8WPGPM04H', '180816B7TFBGDB54', '我正在测试……', '2018-08-16 16:06:05');

-- ----------------------------
-- Table structure for search_records
-- ----------------------------
DROP TABLE IF EXISTS `search_records`;
CREATE TABLE `search_records`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '搜索的内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '视频搜索的记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `face_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '我的头像，如果没有默认给一张',
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `fans_counts` int(11) NULL DEFAULT 0 COMMENT '我的粉丝数量',
  `follow_counts` int(11) NULL DEFAULT 0 COMMENT '我关注的人总数',
  `receive_like_counts` int(11) NULL DEFAULT 0 COMMENT '我接受到的赞美/收藏 的数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('180816B7TFBGDB54', 'yyt', 'mUEme7ZSsij8v7HiakEJvg==', '/180816B7TFBGDB54/face/tmp_b6b4f21daad087fb7169abda9681cca0.jpg', 'yyt', 0, 0, 0);
INSERT INTO `users` VALUES ('1808169PP0D0R3MW', 'admin', 'ISMvKXpXpadDiUoOSoAfww==', '/1808169PP0D0R3MW/face/tmp_9827cfc695e062acb8c37e8de7125715.jpg', 'admin', 0, 0, 2);

-- ----------------------------
-- Table structure for users_fans
-- ----------------------------
DROP TABLE IF EXISTS `users_fans`;
CREATE TABLE `users_fans`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户',
  `fan_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '粉丝',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `fan_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户粉丝关联关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_like_videos
-- ----------------------------
DROP TABLE IF EXISTS `users_like_videos`;
CREATE TABLE `users_like_videos`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户',
  `video_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '视频',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_video_rel`(`user_id`, `video_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户喜欢的/赞过的视频' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_like_videos
-- ----------------------------
INSERT INTO `users_like_videos` VALUES ('180520HBA054FPPH', '180518CKMAAM5TXP', '180510CCX05TABHH');
INSERT INTO `users_like_videos` VALUES ('180520HSBDW6M0SW', '180518CKMAAM5TXP', '180510CD0A6K3SRP');
INSERT INTO `users_like_videos` VALUES ('180816AT6FZ86AY8', '1808169PP0D0R3MW', '180816AP77PMRSK4');
INSERT INTO `users_like_videos` VALUES ('180816B8DHZA00M8', '1808169PP0D0R3MW', '180816B3676HZX1P');

-- ----------------------------
-- Table structure for users_report
-- ----------------------------
DROP TABLE IF EXISTS `users_report`;
CREATE TABLE `users_report`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deal_user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被举报用户id',
  `deal_video_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型标题，让用户选择，详情见 枚举',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `userid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '举报人的id',
  `create_date` datetime NOT NULL COMMENT '举报时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '举报用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_report
-- ----------------------------
INSERT INTO `users_report` VALUES ('180521FZ501ABDYW', '180425CFA4RB6T0H', '180510CD0A6K3SRP', '引人不适', '不合时宜的视频', '180518CKMAAM5TXP', '2018-05-21 20:58:35');
INSERT INTO `users_report` VALUES ('180521FZK44ZRWX4', '180425CFA4RB6T0H', '180510CD0A6K3SRP', '引人不适', '不合时宜的视频', '180518CKMAAM5TXP', '2018-05-21 20:59:53');
INSERT INTO `users_report` VALUES ('180521FZR1TYRTXP', '180425CFA4RB6T0H', '180510CD0A6K3SRP', '辱骂谩骂', 't4t43', '180518CKMAAM5TXP', '2018-05-21 21:00:18');

-- ----------------------------
-- Table structure for videos
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布者id',
  `audio_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户使用音频的信息',
  `video_desc` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频描述',
  `video_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '视频存放的路径',
  `video_seconds` float(6, 2) NULL DEFAULT NULL COMMENT '视频秒数',
  `video_width` int(6) NULL DEFAULT NULL COMMENT '视频宽度',
  `video_height` int(6) NULL DEFAULT NULL COMMENT '视频高度',
  `cover_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频封面图',
  `like_counts` bigint(20) NOT NULL DEFAULT 0 COMMENT '喜欢/赞美的数量',
  `status` int(1) NOT NULL COMMENT '视频状态：\r\n1、发布成功\r\n2、禁止播放，管理员操作',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '视频信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videos
-- ----------------------------
INSERT INTO `videos` VALUES ('180816BC1S2MFC6W', '1808169PP0D0R3MW', '', '', '/1808169PP0D0R3MW/video/wx62c1fc8d233ba2c9.o6zAJs3-svuVM4n8r0EF0b8ySm_c.RGJ4ftCfCeVT6ffe9bd162decc8eb4c2b512d1130a1f.mp4', 10.03, 540, 960, '/1808169PP0D0R3MW/video/wx62c1fc8d233ba2c9o6zAJs3-svuVM4n8r0EF0b8ySm_cRGJ4ftCfCeVT6ffe9bd162decc8eb4c2b512d1130a1f.jpg', 0, 1, '2018-08-16 16:00:59');
INSERT INTO `videos` VALUES ('180816B8WPGPM04H', '180816B7TFBGDB54', '1808169KMKR7FWZC', '', '/180816B7TFBGDB54/video/78599845-b1cf-4481-a329-4ee37bd8c86f.mp4', 8.00, 960, 544, '/180816B7TFBGDB54/video/tmp_fbe054ce2937a4d01db477e815965f84.jpg', 0, 1, '2018-08-16 15:51:26');
INSERT INTO `videos` VALUES ('180816B3676HZX1P', '1808169PP0D0R3MW', '1808169KMKR7FWZC', '', '/1808169PP0D0R3MW/video/06f42f71-8e34-48ee-affd-a92b84a8d673.mp4', 6.04, 540, 960, '/1808169PP0D0R3MW/video/wx62c1fc8d233ba2c9o6zAJs3-svuVM4n8r0EF0b8ySm_crkhU8y4N2PkX7c4c0367de61c52aa38fa2d4106b012c.jpg', 1, 1, '2018-08-16 15:34:26');
INSERT INTO `videos` VALUES ('180816B5N9X7ZRD4', '1808169PP0D0R3MW', '1808169KMKR7FWZC', '', '/1808169PP0D0R3MW/video/04337a69-ec76-4d76-9d25-141e4f5bc149.mp4', 8.00, 960, 544, '/1808169PP0D0R3MW/video/tmp_518e4793a04745bbec05efe2faf317d0.jpg', 0, 1, '2018-08-16 15:41:51');
INSERT INTO `videos` VALUES ('180816B6WCCK1DD4', '1808169PP0D0R3MW', '1808169KMKR7FWZC', '', '/1808169PP0D0R3MW/video/d205bcbb-8e26-41db-a641-1aa34a5dd659.mp4', 2.00, 544, 960, '/1808169PP0D0R3MW/video/tmp_eccb6ce1f9fc4319a606ce7a2e4bf46f.jpg', 0, 1, '2018-08-16 15:45:24');

SET FOREIGN_KEY_CHECKS = 1;
