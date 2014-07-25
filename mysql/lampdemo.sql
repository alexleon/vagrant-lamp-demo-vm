/*
 Navicat Premium Data Transfer

 Source Server         : 8li-vm
 Source Server Type    : MySQL
 Source Server Version : 50537
 Source Host           : 192.168.33.10
 Source Database       : lampdemo

 Target Server Type    : MySQL
 Target Server Version : 50537
 File Encoding         : utf-8

 Date: 07/24/2014 23:42:13 PM
*/

USE lampdemo;

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `characters`
-- ----------------------------
DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(64) DEFAULT NULL,
  `lastname` varchar(64) DEFAULT NULL,
  `img` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `characters`
-- ----------------------------
BEGIN;
INSERT INTO `characters` VALUES ('1', 'Luke', 'Skywalker', 'luke.png'), ('2', 'Han', 'Solo', 'han.jpg'), ('3', 'Leia', 'Organa', 'leia.jpg');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
