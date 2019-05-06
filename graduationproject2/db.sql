/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : online_exam2

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-06-03 11:36:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `answerresult`
-- ----------------------------
DROP TABLE IF EXISTS `answerresult`;
CREATE TABLE `answerresult` (
  `sturesultid` int(11) NOT NULL,
  `questionid` int(11) NOT NULL,
  `stuanswer` varchar(255) DEFAULT NULL,
  `rightorwrong` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sturesultid`,`questionid`),
  KEY `ansres_question_fk` (`questionid`),
  CONSTRAINT `ansres_question_fk` FOREIGN KEY (`questionid`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ansres_stures_fk` FOREIGN KEY (`sturesultid`) REFERENCES `studentresult` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answerresult
-- ----------------------------
INSERT INTO `answerresult` VALUES ('29', '42', 'A', '错误');
INSERT INTO `answerresult` VALUES ('29', '45', 'C', '错误');
INSERT INTO `answerresult` VALUES ('29', '48', '无', '错误');
INSERT INTO `answerresult` VALUES ('29', '49', '错误', '错误');
INSERT INTO `answerresult` VALUES ('29', '50', '无', '错误');
INSERT INTO `answerresult` VALUES ('29', '51', 'B', '正确');
INSERT INTO `answerresult` VALUES ('29', '52', 'A', '错误');
INSERT INTO `answerresult` VALUES ('29', '53', 'A,C,D', '正确');
INSERT INTO `answerresult` VALUES ('29', '54', 'C', '错误');
INSERT INTO `answerresult` VALUES ('29', '55', 'A,B,C', '错误');
INSERT INTO `answerresult` VALUES ('29', '58', 'D', '正确');
INSERT INTO `answerresult` VALUES ('29', '59', 'C', '正确');
INSERT INTO `answerresult` VALUES ('29', '60', '错误', '正确');
INSERT INTO `answerresult` VALUES ('29', '61', 'C', '正确');
INSERT INTO `answerresult` VALUES ('29', '62', 'C', '错误');
INSERT INTO `answerresult` VALUES ('29', '63', 'B,D', '正确');
INSERT INTO `answerresult` VALUES ('29', '64', 'B', '正确');
INSERT INTO `answerresult` VALUES ('29', '65', 'B', '正确');
INSERT INTO `answerresult` VALUES ('29', '66', 'A,B,D', '错误');
INSERT INTO `answerresult` VALUES ('29', '67', 'A', '正确');
INSERT INTO `answerresult` VALUES ('29', '69', '正确', '正确');
INSERT INTO `answerresult` VALUES ('30', '42', 'B', '正确');
INSERT INTO `answerresult` VALUES ('30', '45', 'B', '正确');
INSERT INTO `answerresult` VALUES ('30', '48', '错误', '正确');
INSERT INTO `answerresult` VALUES ('30', '49', '正确', '正确');
INSERT INTO `answerresult` VALUES ('30', '50', '正确', '正确');
INSERT INTO `answerresult` VALUES ('30', '51', 'B', '正确');
INSERT INTO `answerresult` VALUES ('30', '52', 'C', '正确');
INSERT INTO `answerresult` VALUES ('30', '53', 'A,C,D', '正确');
INSERT INTO `answerresult` VALUES ('30', '54', 'B', '正确');
INSERT INTO `answerresult` VALUES ('30', '55', 'A,D', '正确');
INSERT INTO `answerresult` VALUES ('30', '58', 'D', '正确');
INSERT INTO `answerresult` VALUES ('30', '59', 'C', '正确');
INSERT INTO `answerresult` VALUES ('30', '60', '错误', '正确');
INSERT INTO `answerresult` VALUES ('30', '61', 'B', '错误');
INSERT INTO `answerresult` VALUES ('30', '62', 'D', '正确');
INSERT INTO `answerresult` VALUES ('30', '63', 'B,D', '正确');
INSERT INTO `answerresult` VALUES ('30', '64', 'B', '正确');
INSERT INTO `answerresult` VALUES ('30', '65', 'B', '正确');
INSERT INTO `answerresult` VALUES ('30', '66', 'A,B,D', '正确');
INSERT INTO `answerresult` VALUES ('30', '67', 'A', '正确');
INSERT INTO `answerresult` VALUES ('30', '69', '正确', '正确');
INSERT INTO `answerresult` VALUES ('31', '42', 'B', '正确');
INSERT INTO `answerresult` VALUES ('31', '45', 'A', '错误');
INSERT INTO `answerresult` VALUES ('31', '48', '错误', '正确');
INSERT INTO `answerresult` VALUES ('31', '49', '正确', '正确');
INSERT INTO `answerresult` VALUES ('31', '50', '错误', '错误');
INSERT INTO `answerresult` VALUES ('31', '51', 'B', '正确');
INSERT INTO `answerresult` VALUES ('31', '52', 'C', '正确');
INSERT INTO `answerresult` VALUES ('31', '53', 'A,C,D', '正确');
INSERT INTO `answerresult` VALUES ('31', '54', 'B', '正确');
INSERT INTO `answerresult` VALUES ('31', '55', 'A,D', '正确');
INSERT INTO `answerresult` VALUES ('31', '58', 'D', '正确');
INSERT INTO `answerresult` VALUES ('31', '59', 'D', '错误');
INSERT INTO `answerresult` VALUES ('31', '60', '正确', '错误');
INSERT INTO `answerresult` VALUES ('31', '61', 'B', '错误');
INSERT INTO `answerresult` VALUES ('31', '62', 'D', '正确');
INSERT INTO `answerresult` VALUES ('31', '63', 'B,D', '正确');
INSERT INTO `answerresult` VALUES ('31', '64', 'C', '错误');
INSERT INTO `answerresult` VALUES ('31', '65', 'B', '正确');
INSERT INTO `answerresult` VALUES ('31', '66', 'A,B,D', '正确');
INSERT INTO `answerresult` VALUES ('31', '67', 'A', '正确');
INSERT INTO `answerresult` VALUES ('31', '69', '正确', '正确');
INSERT INTO `answerresult` VALUES ('32', '42', 'B', '正确');
INSERT INTO `answerresult` VALUES ('32', '45', 'B', '正确');
INSERT INTO `answerresult` VALUES ('32', '48', '正确', '错误');
INSERT INTO `answerresult` VALUES ('32', '49', '正确', '正确');
INSERT INTO `answerresult` VALUES ('32', '50', '正确', '正确');
INSERT INTO `answerresult` VALUES ('32', '51', 'A', '错误');
INSERT INTO `answerresult` VALUES ('32', '52', 'C', '正确');
INSERT INTO `answerresult` VALUES ('32', '53', 'B', '错误');
INSERT INTO `answerresult` VALUES ('32', '54', 'B', '正确');
INSERT INTO `answerresult` VALUES ('32', '55', 'C', '错误');
INSERT INTO `answerresult` VALUES ('32', '58', 'A', '错误');
INSERT INTO `answerresult` VALUES ('32', '59', 'C', '正确');
INSERT INTO `answerresult` VALUES ('32', '60', '正确', '错误');
INSERT INTO `answerresult` VALUES ('32', '61', 'A', '错误');
INSERT INTO `answerresult` VALUES ('32', '62', 'D', '正确');
INSERT INTO `answerresult` VALUES ('32', '63', 'A', '错误');
INSERT INTO `answerresult` VALUES ('32', '64', 'B', '正确');
INSERT INTO `answerresult` VALUES ('32', '65', 'A', '错误');
INSERT INTO `answerresult` VALUES ('32', '66', 'B', '错误');
INSERT INTO `answerresult` VALUES ('32', '67', 'A', '正确');
INSERT INTO `answerresult` VALUES ('32', '69', '正确', '正确');
INSERT INTO `answerresult` VALUES ('33', '42', 'B', '正确');
INSERT INTO `answerresult` VALUES ('33', '45', 'B', '正确');
INSERT INTO `answerresult` VALUES ('33', '48', '正确', '错误');
INSERT INTO `answerresult` VALUES ('33', '49', '正确', '正确');
INSERT INTO `answerresult` VALUES ('33', '50', '正确', '正确');
INSERT INTO `answerresult` VALUES ('33', '51', 'B', '正确');
INSERT INTO `answerresult` VALUES ('33', '52', 'C', '正确');
INSERT INTO `answerresult` VALUES ('33', '53', 'A,C,D', '正确');
INSERT INTO `answerresult` VALUES ('33', '54', 'B', '正确');
INSERT INTO `answerresult` VALUES ('33', '55', 'A,D', '正确');
INSERT INTO `answerresult` VALUES ('33', '58', 'D', '正确');
INSERT INTO `answerresult` VALUES ('33', '59', 'C', '正确');
INSERT INTO `answerresult` VALUES ('33', '60', '正确', '错误');
INSERT INTO `answerresult` VALUES ('33', '61', 'B', '错误');
INSERT INTO `answerresult` VALUES ('33', '62', 'D', '正确');
INSERT INTO `answerresult` VALUES ('33', '63', 'B,D', '正确');
INSERT INTO `answerresult` VALUES ('33', '64', 'B', '正确');
INSERT INTO `answerresult` VALUES ('33', '65', 'B', '正确');
INSERT INTO `answerresult` VALUES ('33', '66', 'A,B,D', '正确');
INSERT INTO `answerresult` VALUES ('33', '67', 'A', '正确');
INSERT INTO `answerresult` VALUES ('33', '69', '正确', '正确');
INSERT INTO `answerresult` VALUES ('34', '42', 'B', '正确');
INSERT INTO `answerresult` VALUES ('34', '45', 'B', '正确');
INSERT INTO `answerresult` VALUES ('34', '48', '无', '错误');
INSERT INTO `answerresult` VALUES ('34', '49', '无', '错误');
INSERT INTO `answerresult` VALUES ('34', '50', '无', '错误');
INSERT INTO `answerresult` VALUES ('34', '51', 'B', '正确');
INSERT INTO `answerresult` VALUES ('34', '52', 'C', '正确');
INSERT INTO `answerresult` VALUES ('34', '53', 'A,C,D', '正确');
INSERT INTO `answerresult` VALUES ('34', '54', 'B', '正确');
INSERT INTO `answerresult` VALUES ('34', '55', 'A,D', '正确');
INSERT INTO `answerresult` VALUES ('34', '58', 'D', '正确');
INSERT INTO `answerresult` VALUES ('34', '59', 'C', '正确');
INSERT INTO `answerresult` VALUES ('34', '60', '无', '错误');
INSERT INTO `answerresult` VALUES ('34', '61', 'B', '错误');
INSERT INTO `answerresult` VALUES ('34', '62', 'D', '正确');
INSERT INTO `answerresult` VALUES ('34', '63', 'B,D', '正确');
INSERT INTO `answerresult` VALUES ('34', '64', 'B', '正确');
INSERT INTO `answerresult` VALUES ('34', '65', 'B', '正确');
INSERT INTO `answerresult` VALUES ('34', '66', 'A,B,D', '正确');
INSERT INTO `answerresult` VALUES ('34', '67', 'A', '正确');
INSERT INTO `answerresult` VALUES ('34', '69', '无', '错误');
INSERT INTO `answerresult` VALUES ('35', '42', 'B', '正确');
INSERT INTO `answerresult` VALUES ('35', '45', 'A', '错误');
INSERT INTO `answerresult` VALUES ('35', '48', '无', '错误');
INSERT INTO `answerresult` VALUES ('35', '49', '无', '错误');
INSERT INTO `answerresult` VALUES ('35', '50', '无', '错误');
INSERT INTO `answerresult` VALUES ('35', '51', 'B', '正确');
INSERT INTO `answerresult` VALUES ('35', '52', 'C', '正确');
INSERT INTO `answerresult` VALUES ('35', '53', '无', '错误');
INSERT INTO `answerresult` VALUES ('35', '54', 'B', '正确');
INSERT INTO `answerresult` VALUES ('35', '55', '无', '错误');
INSERT INTO `answerresult` VALUES ('35', '58', 'A', '错误');
INSERT INTO `answerresult` VALUES ('35', '59', 'C', '正确');
INSERT INTO `answerresult` VALUES ('35', '60', '无', '错误');
INSERT INTO `answerresult` VALUES ('35', '61', 'B', '错误');
INSERT INTO `answerresult` VALUES ('35', '62', 'D', '正确');
INSERT INTO `answerresult` VALUES ('35', '63', '无', '错误');
INSERT INTO `answerresult` VALUES ('35', '64', 'B', '正确');
INSERT INTO `answerresult` VALUES ('35', '65', 'B', '正确');
INSERT INTO `answerresult` VALUES ('35', '66', '无', '错误');
INSERT INTO `answerresult` VALUES ('35', '67', 'A', '正确');
INSERT INTO `answerresult` VALUES ('35', '69', '无', '错误');
INSERT INTO `answerresult` VALUES ('36', '42', 'B', '正确');
INSERT INTO `answerresult` VALUES ('36', '45', 'B', '正确');
INSERT INTO `answerresult` VALUES ('36', '48', '错误', '正确');
INSERT INTO `answerresult` VALUES ('36', '49', '无', '错误');
INSERT INTO `answerresult` VALUES ('36', '50', '无', '错误');
INSERT INTO `answerresult` VALUES ('36', '51', 'B', '正确');
INSERT INTO `answerresult` VALUES ('36', '52', 'C', '正确');
INSERT INTO `answerresult` VALUES ('36', '53', 'A,C,D', '正确');
INSERT INTO `answerresult` VALUES ('36', '54', 'B', '正确');
INSERT INTO `answerresult` VALUES ('36', '55', 'A,D', '正确');
INSERT INTO `answerresult` VALUES ('36', '58', 'D', '正确');
INSERT INTO `answerresult` VALUES ('36', '59', 'C', '正确');
INSERT INTO `answerresult` VALUES ('36', '60', '错误', '正确');
INSERT INTO `answerresult` VALUES ('36', '61', 'B', '错误');
INSERT INTO `answerresult` VALUES ('36', '62', 'D', '正确');
INSERT INTO `answerresult` VALUES ('36', '63', 'B,D', '正确');
INSERT INTO `answerresult` VALUES ('36', '64', 'B', '正确');
INSERT INTO `answerresult` VALUES ('36', '65', 'B', '正确');
INSERT INTO `answerresult` VALUES ('36', '66', 'A,B,D', '正确');
INSERT INTO `answerresult` VALUES ('36', '67', 'A', '正确');
INSERT INTO `answerresult` VALUES ('36', '69', '无', '错误');
INSERT INTO `answerresult` VALUES ('37', '42', 'B', '正确');
INSERT INTO `answerresult` VALUES ('37', '45', 'B', '正确');
INSERT INTO `answerresult` VALUES ('37', '48', '错误', '正确');
INSERT INTO `answerresult` VALUES ('37', '49', '错误', '错误');
INSERT INTO `answerresult` VALUES ('37', '50', '正确', '正确');
INSERT INTO `answerresult` VALUES ('37', '51', '无', '错误');
INSERT INTO `answerresult` VALUES ('37', '52', 'C', '正确');
INSERT INTO `answerresult` VALUES ('37', '53', 'A,C,D', '正确');
INSERT INTO `answerresult` VALUES ('37', '54', 'B', '正确');
INSERT INTO `answerresult` VALUES ('37', '55', 'A,D', '正确');
INSERT INTO `answerresult` VALUES ('37', '58', 'D', '正确');
INSERT INTO `answerresult` VALUES ('37', '59', 'C', '正确');
INSERT INTO `answerresult` VALUES ('37', '60', '错误', '正确');
INSERT INTO `answerresult` VALUES ('37', '61', 'B', '错误');
INSERT INTO `answerresult` VALUES ('37', '62', 'D', '正确');
INSERT INTO `answerresult` VALUES ('37', '63', 'B,D', '正确');
INSERT INTO `answerresult` VALUES ('37', '64', 'B', '正确');
INSERT INTO `answerresult` VALUES ('37', '65', 'B', '正确');
INSERT INTO `answerresult` VALUES ('37', '66', 'A,B,D', '正确');
INSERT INTO `answerresult` VALUES ('37', '67', 'A', '正确');
INSERT INTO `answerresult` VALUES ('37', '69', '错误', '错误');
INSERT INTO `answerresult` VALUES ('38', '42', 'B', '正确');
INSERT INTO `answerresult` VALUES ('38', '45', 'B', '正确');
INSERT INTO `answerresult` VALUES ('38', '48', '错误', '正确');
INSERT INTO `answerresult` VALUES ('38', '49', '无', '错误');
INSERT INTO `answerresult` VALUES ('38', '50', '无', '错误');
INSERT INTO `answerresult` VALUES ('38', '51', 'B', '正确');
INSERT INTO `answerresult` VALUES ('38', '52', 'C', '正确');
INSERT INTO `answerresult` VALUES ('38', '53', 'A,C,D', '正确');
INSERT INTO `answerresult` VALUES ('38', '54', 'B', '正确');
INSERT INTO `answerresult` VALUES ('38', '55', 'A,D', '正确');
INSERT INTO `answerresult` VALUES ('38', '58', 'D', '正确');
INSERT INTO `answerresult` VALUES ('38', '59', 'C', '正确');
INSERT INTO `answerresult` VALUES ('38', '60', '错误', '正确');
INSERT INTO `answerresult` VALUES ('38', '61', 'B', '错误');
INSERT INTO `answerresult` VALUES ('38', '62', 'D', '正确');
INSERT INTO `answerresult` VALUES ('38', '63', 'A,B,D', '错误');
INSERT INTO `answerresult` VALUES ('38', '64', 'B', '正确');
INSERT INTO `answerresult` VALUES ('38', '65', '无', '错误');
INSERT INTO `answerresult` VALUES ('38', '66', 'A,B,D', '正确');
INSERT INTO `answerresult` VALUES ('38', '67', 'A', '正确');
INSERT INTO `answerresult` VALUES ('38', '69', '无', '错误');
INSERT INTO `answerresult` VALUES ('39', '42', 'B', '正确');
INSERT INTO `answerresult` VALUES ('39', '45', 'B', '正确');
INSERT INTO `answerresult` VALUES ('39', '48', '错误', '正确');
INSERT INTO `answerresult` VALUES ('39', '49', '无', '错误');
INSERT INTO `answerresult` VALUES ('39', '50', '正确', '正确');
INSERT INTO `answerresult` VALUES ('39', '51', 'B', '正确');
INSERT INTO `answerresult` VALUES ('39', '52', 'C', '正确');
INSERT INTO `answerresult` VALUES ('39', '53', 'A,C,D', '正确');
INSERT INTO `answerresult` VALUES ('39', '54', '无', '错误');
INSERT INTO `answerresult` VALUES ('39', '55', 'A,D', '正确');
INSERT INTO `answerresult` VALUES ('39', '58', 'D', '正确');
INSERT INTO `answerresult` VALUES ('39', '59', 'C', '正确');
INSERT INTO `answerresult` VALUES ('39', '60', '无', '错误');
INSERT INTO `answerresult` VALUES ('39', '61', 'B', '错误');
INSERT INTO `answerresult` VALUES ('39', '62', 'D', '正确');
INSERT INTO `answerresult` VALUES ('39', '63', 'B,D', '正确');
INSERT INTO `answerresult` VALUES ('39', '64', 'B', '正确');
INSERT INTO `answerresult` VALUES ('39', '65', 'B', '正确');
INSERT INTO `answerresult` VALUES ('39', '66', 'A,B,D', '正确');
INSERT INTO `answerresult` VALUES ('39', '67', 'A', '正确');
INSERT INTO `answerresult` VALUES ('39', '69', '正确', '正确');
INSERT INTO `answerresult` VALUES ('40', '42', 'B', '正确');
INSERT INTO `answerresult` VALUES ('40', '45', 'B', '正确');
INSERT INTO `answerresult` VALUES ('40', '48', '无', '错误');
INSERT INTO `answerresult` VALUES ('40', '49', '无', '错误');
INSERT INTO `answerresult` VALUES ('40', '50', '无', '错误');
INSERT INTO `answerresult` VALUES ('40', '51', 'B', '正确');
INSERT INTO `answerresult` VALUES ('40', '52', 'C', '正确');
INSERT INTO `answerresult` VALUES ('40', '53', 'A,C,D', '正确');
INSERT INTO `answerresult` VALUES ('40', '54', 'B', '正确');
INSERT INTO `answerresult` VALUES ('40', '55', 'A,D', '正确');
INSERT INTO `answerresult` VALUES ('40', '58', 'D', '正确');
INSERT INTO `answerresult` VALUES ('40', '59', 'C', '正确');
INSERT INTO `answerresult` VALUES ('40', '60', '无', '错误');
INSERT INTO `answerresult` VALUES ('40', '61', 'B', '错误');
INSERT INTO `answerresult` VALUES ('40', '62', 'D', '正确');
INSERT INTO `answerresult` VALUES ('40', '63', '无', '错误');
INSERT INTO `answerresult` VALUES ('40', '64', 'B', '正确');
INSERT INTO `answerresult` VALUES ('40', '65', 'B', '正确');
INSERT INTO `answerresult` VALUES ('40', '66', 'A,B,D', '正确');
INSERT INTO `answerresult` VALUES ('40', '67', 'A', '正确');
INSERT INTO `answerresult` VALUES ('40', '69', '无', '错误');
INSERT INTO `answerresult` VALUES ('41', '42', 'A', '错误');
INSERT INTO `answerresult` VALUES ('41', '45', 'B', '正确');
INSERT INTO `answerresult` VALUES ('41', '48', '无', '错误');
INSERT INTO `answerresult` VALUES ('41', '49', '无', '错误');
INSERT INTO `answerresult` VALUES ('41', '50', '无', '错误');
INSERT INTO `answerresult` VALUES ('41', '51', 'B', '正确');
INSERT INTO `answerresult` VALUES ('41', '52', 'B', '错误');
INSERT INTO `answerresult` VALUES ('41', '53', '无', '错误');
INSERT INTO `answerresult` VALUES ('41', '54', '无', '错误');
INSERT INTO `answerresult` VALUES ('41', '55', '无', '错误');
INSERT INTO `answerresult` VALUES ('41', '58', '无', '错误');
INSERT INTO `answerresult` VALUES ('41', '59', 'C', '正确');
INSERT INTO `answerresult` VALUES ('41', '60', '无', '错误');
INSERT INTO `answerresult` VALUES ('41', '61', 'B', '错误');
INSERT INTO `answerresult` VALUES ('41', '62', 'D', '正确');
INSERT INTO `answerresult` VALUES ('41', '63', '无', '错误');
INSERT INTO `answerresult` VALUES ('41', '64', '无', '错误');
INSERT INTO `answerresult` VALUES ('41', '65', 'B', '正确');
INSERT INTO `answerresult` VALUES ('41', '66', '无', '错误');
INSERT INTO `answerresult` VALUES ('41', '67', 'A', '正确');
INSERT INTO `answerresult` VALUES ('41', '69', '无', '错误');
INSERT INTO `answerresult` VALUES ('42', '42', '无', '错误');
INSERT INTO `answerresult` VALUES ('42', '45', '无', '错误');
INSERT INTO `answerresult` VALUES ('42', '48', '无', '错误');
INSERT INTO `answerresult` VALUES ('42', '49', '无', '错误');
INSERT INTO `answerresult` VALUES ('42', '50', '无', '错误');
INSERT INTO `answerresult` VALUES ('42', '51', '无', '错误');
INSERT INTO `answerresult` VALUES ('42', '52', '无', '错误');
INSERT INTO `answerresult` VALUES ('42', '53', '无', '错误');
INSERT INTO `answerresult` VALUES ('42', '54', '无', '错误');
INSERT INTO `answerresult` VALUES ('42', '55', '无', '错误');
INSERT INTO `answerresult` VALUES ('42', '58', '无', '错误');
INSERT INTO `answerresult` VALUES ('42', '59', '无', '错误');
INSERT INTO `answerresult` VALUES ('42', '60', '无', '错误');
INSERT INTO `answerresult` VALUES ('42', '61', '无', '错误');
INSERT INTO `answerresult` VALUES ('42', '62', '无', '错误');
INSERT INTO `answerresult` VALUES ('42', '63', '无', '错误');
INSERT INTO `answerresult` VALUES ('42', '64', '无', '错误');
INSERT INTO `answerresult` VALUES ('42', '65', '无', '错误');
INSERT INTO `answerresult` VALUES ('42', '66', '无', '错误');
INSERT INTO `answerresult` VALUES ('42', '67', '无', '错误');
INSERT INTO `answerresult` VALUES ('42', '69', '无', '错误');
INSERT INTO `answerresult` VALUES ('43', '42', '无', '错误');
INSERT INTO `answerresult` VALUES ('43', '45', '无', '错误');
INSERT INTO `answerresult` VALUES ('43', '48', '无', '错误');
INSERT INTO `answerresult` VALUES ('43', '49', '无', '错误');
INSERT INTO `answerresult` VALUES ('43', '50', '无', '错误');
INSERT INTO `answerresult` VALUES ('43', '51', '无', '错误');
INSERT INTO `answerresult` VALUES ('43', '52', '无', '错误');
INSERT INTO `answerresult` VALUES ('43', '53', '无', '错误');
INSERT INTO `answerresult` VALUES ('43', '54', '无', '错误');
INSERT INTO `answerresult` VALUES ('43', '55', '无', '错误');
INSERT INTO `answerresult` VALUES ('43', '58', '无', '错误');
INSERT INTO `answerresult` VALUES ('43', '59', '无', '错误');
INSERT INTO `answerresult` VALUES ('43', '60', '无', '错误');
INSERT INTO `answerresult` VALUES ('43', '61', '无', '错误');
INSERT INTO `answerresult` VALUES ('43', '62', '无', '错误');
INSERT INTO `answerresult` VALUES ('43', '63', '无', '错误');
INSERT INTO `answerresult` VALUES ('43', '64', '无', '错误');
INSERT INTO `answerresult` VALUES ('43', '65', '无', '错误');
INSERT INTO `answerresult` VALUES ('43', '66', '无', '错误');
INSERT INTO `answerresult` VALUES ('43', '67', '无', '错误');
INSERT INTO `answerresult` VALUES ('43', '69', '无', '错误');
INSERT INTO `answerresult` VALUES ('44', '42', 'B', '正确');
INSERT INTO `answerresult` VALUES ('44', '45', 'B', '正确');
INSERT INTO `answerresult` VALUES ('44', '48', '无', '错误');
INSERT INTO `answerresult` VALUES ('44', '49', '无', '错误');
INSERT INTO `answerresult` VALUES ('44', '50', '无', '错误');
INSERT INTO `answerresult` VALUES ('44', '51', 'B', '正确');
INSERT INTO `answerresult` VALUES ('44', '52', 'C', '正确');
INSERT INTO `answerresult` VALUES ('44', '53', 'A,C,D', '正确');
INSERT INTO `answerresult` VALUES ('44', '54', 'B', '正确');
INSERT INTO `answerresult` VALUES ('44', '55', 'A,D', '正确');
INSERT INTO `answerresult` VALUES ('44', '58', 'D', '正确');
INSERT INTO `answerresult` VALUES ('44', '59', 'C', '正确');
INSERT INTO `answerresult` VALUES ('44', '60', '无', '错误');
INSERT INTO `answerresult` VALUES ('44', '61', 'B', '错误');
INSERT INTO `answerresult` VALUES ('44', '62', 'D', '正确');
INSERT INTO `answerresult` VALUES ('44', '63', '无', '错误');
INSERT INTO `answerresult` VALUES ('44', '64', 'B', '正确');
INSERT INTO `answerresult` VALUES ('44', '65', 'B', '正确');
INSERT INTO `answerresult` VALUES ('44', '66', 'A,B,D', '正确');
INSERT INTO `answerresult` VALUES ('44', '67', 'A', '正确');
INSERT INTO `answerresult` VALUES ('44', '69', '无', '错误');
INSERT INTO `answerresult` VALUES ('45', '45', 'A', '错误');
INSERT INTO `answerresult` VALUES ('45', '48', '正确', '错误');
INSERT INTO `answerresult` VALUES ('45', '49', '正确', '正确');
INSERT INTO `answerresult` VALUES ('45', '50', '正确', '正确');
INSERT INTO `answerresult` VALUES ('45', '52', 'B', '错误');
INSERT INTO `answerresult` VALUES ('45', '53', 'A,C,D', '正确');
INSERT INTO `answerresult` VALUES ('45', '54', 'B', '正确');
INSERT INTO `answerresult` VALUES ('45', '55', 'B,D', '错误');
INSERT INTO `answerresult` VALUES ('45', '58', 'A', '错误');
INSERT INTO `answerresult` VALUES ('45', '59', 'A', '错误');
INSERT INTO `answerresult` VALUES ('45', '60', '正确', '错误');
INSERT INTO `answerresult` VALUES ('45', '61', 'A', '错误');
INSERT INTO `answerresult` VALUES ('45', '62', 'A', '错误');
INSERT INTO `answerresult` VALUES ('45', '63', 'A,D', '错误');
INSERT INTO `answerresult` VALUES ('45', '64', 'B', '正确');
INSERT INTO `answerresult` VALUES ('45', '65', 'A', '错误');
INSERT INTO `answerresult` VALUES ('46', '71', '无', '错误');
INSERT INTO `answerresult` VALUES ('46', '72', 'A', '错误');
INSERT INTO `answerresult` VALUES ('46', '73', 'B', '正确');
INSERT INTO `answerresult` VALUES ('46', '74', '无', '错误');
INSERT INTO `answerresult` VALUES ('46', '75', 'D', '正确');
INSERT INTO `answerresult` VALUES ('46', '76', 'A,B,D', '正确');
INSERT INTO `answerresult` VALUES ('46', '77', 'B', '正确');
INSERT INTO `answerresult` VALUES ('46', '78', 'B', '错误');
INSERT INTO `answerresult` VALUES ('46', '79', 'A', '正确');
INSERT INTO `answerresult` VALUES ('46', '80', 'A', '正确');
INSERT INTO `answerresult` VALUES ('46', '81', 'C', '正确');
INSERT INTO `answerresult` VALUES ('46', '82', 'B', '正确');
INSERT INTO `answerresult` VALUES ('46', '83', '无', '错误');
INSERT INTO `answerresult` VALUES ('46', '84', '无', '错误');
INSERT INTO `answerresult` VALUES ('46', '85', '无', '错误');
INSERT INTO `answerresult` VALUES ('46', '86', '无', '错误');
INSERT INTO `answerresult` VALUES ('46', '88', '无', '错误');
INSERT INTO `answerresult` VALUES ('46', '89', '无', '错误');
INSERT INTO `answerresult` VALUES ('47', '71', 'D', '正确');
INSERT INTO `answerresult` VALUES ('47', '72', 'A', '错误');
INSERT INTO `answerresult` VALUES ('47', '73', 'C', '错误');
INSERT INTO `answerresult` VALUES ('47', '74', 'A,B,D', '错误');
INSERT INTO `answerresult` VALUES ('47', '75', 'D', '正确');
INSERT INTO `answerresult` VALUES ('47', '76', 'A,B,D', '正确');
INSERT INTO `answerresult` VALUES ('47', '77', 'B', '正确');
INSERT INTO `answerresult` VALUES ('47', '78', 'B', '错误');
INSERT INTO `answerresult` VALUES ('47', '79', 'A', '正确');
INSERT INTO `answerresult` VALUES ('47', '80', '无', '错误');
INSERT INTO `answerresult` VALUES ('47', '81', 'C', '正确');
INSERT INTO `answerresult` VALUES ('47', '82', 'B', '正确');
INSERT INTO `answerresult` VALUES ('47', '83', '无', '错误');
INSERT INTO `answerresult` VALUES ('47', '84', '无', '错误');
INSERT INTO `answerresult` VALUES ('47', '85', '无', '错误');
INSERT INTO `answerresult` VALUES ('47', '86', '无', '错误');
INSERT INTO `answerresult` VALUES ('47', '88', '无', '错误');
INSERT INTO `answerresult` VALUES ('47', '89', '无', '错误');
INSERT INTO `answerresult` VALUES ('48', '71', 'D', '正确');
INSERT INTO `answerresult` VALUES ('48', '72', 'A', '错误');
INSERT INTO `answerresult` VALUES ('48', '73', 'C', '错误');
INSERT INTO `answerresult` VALUES ('48', '74', 'A,B,C', '正确');
INSERT INTO `answerresult` VALUES ('48', '75', 'D', '正确');
INSERT INTO `answerresult` VALUES ('48', '76', 'A,B,C', '错误');
INSERT INTO `answerresult` VALUES ('48', '77', 'B', '正确');
INSERT INTO `answerresult` VALUES ('48', '78', 'B', '错误');
INSERT INTO `answerresult` VALUES ('48', '79', 'A', '正确');
INSERT INTO `answerresult` VALUES ('48', '80', 'A', '正确');
INSERT INTO `answerresult` VALUES ('48', '81', 'B', '错误');
INSERT INTO `answerresult` VALUES ('48', '82', 'C', '错误');
INSERT INTO `answerresult` VALUES ('48', '83', '错误', '正确');
INSERT INTO `answerresult` VALUES ('48', '84', '错误', '正确');
INSERT INTO `answerresult` VALUES ('48', '85', '错误', '正确');
INSERT INTO `answerresult` VALUES ('48', '86', '错误', '正确');
INSERT INTO `answerresult` VALUES ('48', '88', '错误', '正确');
INSERT INTO `answerresult` VALUES ('48', '89', 'A,B,C,D', '正确');
INSERT INTO `answerresult` VALUES ('49', '71', '无', '错误');
INSERT INTO `answerresult` VALUES ('49', '72', '无', '错误');
INSERT INTO `answerresult` VALUES ('49', '73', '无', '错误');
INSERT INTO `answerresult` VALUES ('49', '74', '无', '错误');
INSERT INTO `answerresult` VALUES ('49', '75', '无', '错误');
INSERT INTO `answerresult` VALUES ('49', '76', '无', '错误');
INSERT INTO `answerresult` VALUES ('49', '77', '无', '错误');
INSERT INTO `answerresult` VALUES ('49', '78', '无', '错误');
INSERT INTO `answerresult` VALUES ('49', '79', '无', '错误');
INSERT INTO `answerresult` VALUES ('49', '80', '无', '错误');
INSERT INTO `answerresult` VALUES ('49', '81', '无', '错误');
INSERT INTO `answerresult` VALUES ('49', '82', '无', '错误');
INSERT INTO `answerresult` VALUES ('49', '83', '无', '错误');
INSERT INTO `answerresult` VALUES ('49', '84', '无', '错误');
INSERT INTO `answerresult` VALUES ('49', '85', '无', '错误');
INSERT INTO `answerresult` VALUES ('49', '86', '无', '错误');
INSERT INTO `answerresult` VALUES ('49', '88', '无', '错误');
INSERT INTO `answerresult` VALUES ('49', '89', '无', '错误');
INSERT INTO `answerresult` VALUES ('50', '71', '无', '错误');
INSERT INTO `answerresult` VALUES ('50', '72', '无', '错误');
INSERT INTO `answerresult` VALUES ('50', '73', '无', '错误');
INSERT INTO `answerresult` VALUES ('50', '74', '无', '错误');
INSERT INTO `answerresult` VALUES ('50', '75', '无', '错误');
INSERT INTO `answerresult` VALUES ('50', '76', '无', '错误');
INSERT INTO `answerresult` VALUES ('50', '77', '无', '错误');
INSERT INTO `answerresult` VALUES ('50', '78', '无', '错误');
INSERT INTO `answerresult` VALUES ('50', '79', '无', '错误');
INSERT INTO `answerresult` VALUES ('50', '80', '无', '错误');
INSERT INTO `answerresult` VALUES ('50', '81', '无', '错误');
INSERT INTO `answerresult` VALUES ('50', '82', '无', '错误');
INSERT INTO `answerresult` VALUES ('50', '83', '无', '错误');
INSERT INTO `answerresult` VALUES ('50', '84', '无', '错误');
INSERT INTO `answerresult` VALUES ('50', '85', '无', '错误');
INSERT INTO `answerresult` VALUES ('50', '86', '无', '错误');
INSERT INTO `answerresult` VALUES ('50', '88', '无', '错误');
INSERT INTO `answerresult` VALUES ('50', '89', '无', '错误');
INSERT INTO `answerresult` VALUES ('51', '71', 'D', '正确');
INSERT INTO `answerresult` VALUES ('51', '72', 'C', '正确');
INSERT INTO `answerresult` VALUES ('51', '73', 'B', '正确');
INSERT INTO `answerresult` VALUES ('51', '74', 'A,B,C', '正确');
INSERT INTO `answerresult` VALUES ('51', '75', 'D', '正确');
INSERT INTO `answerresult` VALUES ('51', '76', 'A,B,D', '正确');
INSERT INTO `answerresult` VALUES ('51', '77', 'B', '正确');
INSERT INTO `answerresult` VALUES ('51', '78', 'C', '正确');
INSERT INTO `answerresult` VALUES ('51', '79', 'A', '正确');
INSERT INTO `answerresult` VALUES ('51', '80', 'A', '正确');
INSERT INTO `answerresult` VALUES ('51', '81', 'C', '正确');
INSERT INTO `answerresult` VALUES ('51', '82', '无', '错误');
INSERT INTO `answerresult` VALUES ('51', '83', '错误', '正确');
INSERT INTO `answerresult` VALUES ('51', '84', '错误', '正确');
INSERT INTO `answerresult` VALUES ('51', '85', '错误', '正确');
INSERT INTO `answerresult` VALUES ('51', '86', '错误', '正确');
INSERT INTO `answerresult` VALUES ('51', '88', '错误', '正确');
INSERT INTO `answerresult` VALUES ('51', '89', 'A,B,C,D', '正确');
INSERT INTO `answerresult` VALUES ('52', '45', 'B', '正确');
INSERT INTO `answerresult` VALUES ('52', '48', '无', '错误');
INSERT INTO `answerresult` VALUES ('52', '49', '无', '错误');
INSERT INTO `answerresult` VALUES ('52', '50', '无', '错误');
INSERT INTO `answerresult` VALUES ('52', '52', 'C', '正确');
INSERT INTO `answerresult` VALUES ('52', '53', 'A,C,D', '正确');
INSERT INTO `answerresult` VALUES ('52', '54', 'B', '正确');
INSERT INTO `answerresult` VALUES ('52', '55', 'B,D', '错误');
INSERT INTO `answerresult` VALUES ('52', '57', 'A,B,C,D', '错误');
INSERT INTO `answerresult` VALUES ('52', '58', 'D', '正确');
INSERT INTO `answerresult` VALUES ('52', '59', 'C', '正确');
INSERT INTO `answerresult` VALUES ('52', '60', '无', '错误');
INSERT INTO `answerresult` VALUES ('52', '61', 'B', '错误');
INSERT INTO `answerresult` VALUES ('52', '62', 'D', '正确');
INSERT INTO `answerresult` VALUES ('52', '63', 'A,D', '错误');
INSERT INTO `answerresult` VALUES ('52', '64', 'B', '正确');
INSERT INTO `answerresult` VALUES ('52', '65', 'B', '正确');
INSERT INTO `answerresult` VALUES ('52', '66', 'A,B,D', '正确');
INSERT INTO `answerresult` VALUES ('52', '68', 'A,B,D', '正确');
INSERT INTO `answerresult` VALUES ('52', '69', '无', '错误');
INSERT INTO `answerresult` VALUES ('53', '71', 'D', '正确');
INSERT INTO `answerresult` VALUES ('53', '72', 'C', '正确');
INSERT INTO `answerresult` VALUES ('53', '73', 'B', '正确');
INSERT INTO `answerresult` VALUES ('53', '74', 'A,B,C', '正确');
INSERT INTO `answerresult` VALUES ('53', '75', 'D', '正确');
INSERT INTO `answerresult` VALUES ('53', '76', 'A,B,D', '正确');
INSERT INTO `answerresult` VALUES ('53', '77', 'B', '正确');
INSERT INTO `answerresult` VALUES ('53', '78', 'C', '正确');
INSERT INTO `answerresult` VALUES ('53', '79', 'A', '正确');
INSERT INTO `answerresult` VALUES ('53', '80', 'A', '正确');
INSERT INTO `answerresult` VALUES ('53', '81', 'C', '正确');
INSERT INTO `answerresult` VALUES ('53', '82', 'B', '正确');
INSERT INTO `answerresult` VALUES ('53', '83', '无', '错误');
INSERT INTO `answerresult` VALUES ('53', '84', '无', '错误');
INSERT INTO `answerresult` VALUES ('53', '85', '无', '错误');
INSERT INTO `answerresult` VALUES ('53', '86', '无', '错误');
INSERT INTO `answerresult` VALUES ('53', '88', '无', '错误');
INSERT INTO `answerresult` VALUES ('53', '89', 'A,B,C,D', '正确');
INSERT INTO `answerresult` VALUES ('54', '71', '无', '错误');
INSERT INTO `answerresult` VALUES ('54', '72', 'C', '正确');
INSERT INTO `answerresult` VALUES ('54', '73', 'C', '错误');
INSERT INTO `answerresult` VALUES ('54', '74', '无', '错误');
INSERT INTO `answerresult` VALUES ('54', '75', 'D', '正确');
INSERT INTO `answerresult` VALUES ('54', '76', '无', '错误');
INSERT INTO `answerresult` VALUES ('54', '77', 'B', '正确');
INSERT INTO `answerresult` VALUES ('54', '78', 'C', '正确');
INSERT INTO `answerresult` VALUES ('54', '79', 'A', '正确');
INSERT INTO `answerresult` VALUES ('54', '80', '无', '错误');
INSERT INTO `answerresult` VALUES ('54', '81', 'C', '正确');
INSERT INTO `answerresult` VALUES ('54', '82', '无', '错误');
INSERT INTO `answerresult` VALUES ('54', '83', '无', '错误');
INSERT INTO `answerresult` VALUES ('54', '84', '无', '错误');
INSERT INTO `answerresult` VALUES ('54', '85', '无', '错误');
INSERT INTO `answerresult` VALUES ('54', '86', '无', '错误');
INSERT INTO `answerresult` VALUES ('54', '88', '无', '错误');
INSERT INTO `answerresult` VALUES ('54', '89', '无', '错误');
INSERT INTO `answerresult` VALUES ('55', '71', 'D', '正确');
INSERT INTO `answerresult` VALUES ('55', '72', '无', '错误');
INSERT INTO `answerresult` VALUES ('55', '73', '无', '错误');
INSERT INTO `answerresult` VALUES ('55', '74', '无', '错误');
INSERT INTO `answerresult` VALUES ('55', '75', '无', '错误');
INSERT INTO `answerresult` VALUES ('55', '76', '无', '错误');
INSERT INTO `answerresult` VALUES ('55', '77', 'B', '正确');
INSERT INTO `answerresult` VALUES ('55', '78', '无', '错误');
INSERT INTO `answerresult` VALUES ('55', '79', 'A', '正确');
INSERT INTO `answerresult` VALUES ('55', '80', 'A', '正确');
INSERT INTO `answerresult` VALUES ('55', '81', 'C', '正确');
INSERT INTO `answerresult` VALUES ('55', '82', 'B', '正确');
INSERT INTO `answerresult` VALUES ('55', '83', '无', '错误');
INSERT INTO `answerresult` VALUES ('55', '84', '无', '错误');
INSERT INTO `answerresult` VALUES ('55', '85', '无', '错误');
INSERT INTO `answerresult` VALUES ('55', '86', '无', '错误');
INSERT INTO `answerresult` VALUES ('55', '88', '无', '错误');
INSERT INTO `answerresult` VALUES ('55', '89', '无', '错误');
INSERT INTO `answerresult` VALUES ('56', '71', '无', '错误');
INSERT INTO `answerresult` VALUES ('56', '72', '无', '错误');
INSERT INTO `answerresult` VALUES ('56', '73', '无', '错误');
INSERT INTO `answerresult` VALUES ('56', '74', '无', '错误');
INSERT INTO `answerresult` VALUES ('56', '75', '无', '错误');
INSERT INTO `answerresult` VALUES ('56', '76', '无', '错误');
INSERT INTO `answerresult` VALUES ('56', '77', '无', '错误');
INSERT INTO `answerresult` VALUES ('56', '78', '无', '错误');
INSERT INTO `answerresult` VALUES ('56', '79', 'A', '正确');
INSERT INTO `answerresult` VALUES ('56', '80', '无', '错误');
INSERT INTO `answerresult` VALUES ('56', '81', '无', '错误');
INSERT INTO `answerresult` VALUES ('56', '82', '无', '错误');
INSERT INTO `answerresult` VALUES ('56', '83', '无', '错误');
INSERT INTO `answerresult` VALUES ('56', '84', '无', '错误');
INSERT INTO `answerresult` VALUES ('56', '85', '无', '错误');
INSERT INTO `answerresult` VALUES ('56', '86', '无', '错误');
INSERT INTO `answerresult` VALUES ('56', '88', '无', '错误');
INSERT INTO `answerresult` VALUES ('56', '89', '无', '错误');
INSERT INTO `answerresult` VALUES ('57', '71', 'D', '正确');
INSERT INTO `answerresult` VALUES ('57', '72', 'C', '正确');
INSERT INTO `answerresult` VALUES ('57', '73', 'B', '正确');
INSERT INTO `answerresult` VALUES ('57', '74', 'A,B,C', '正确');
INSERT INTO `answerresult` VALUES ('57', '75', 'D', '正确');
INSERT INTO `answerresult` VALUES ('57', '76', 'A,B,D', '正确');
INSERT INTO `answerresult` VALUES ('57', '77', 'B', '正确');
INSERT INTO `answerresult` VALUES ('57', '78', 'C', '正确');
INSERT INTO `answerresult` VALUES ('57', '79', 'A', '正确');
INSERT INTO `answerresult` VALUES ('57', '80', 'A', '正确');
INSERT INTO `answerresult` VALUES ('57', '81', 'C', '正确');
INSERT INTO `answerresult` VALUES ('57', '82', 'B', '正确');
INSERT INTO `answerresult` VALUES ('57', '83', '正确', '错误');
INSERT INTO `answerresult` VALUES ('57', '84', '无', '错误');
INSERT INTO `answerresult` VALUES ('57', '85', '正确', '错误');
INSERT INTO `answerresult` VALUES ('57', '86', '正确', '错误');
INSERT INTO `answerresult` VALUES ('57', '88', '无', '错误');
INSERT INTO `answerresult` VALUES ('57', '89', 'B,C,D', '错误');
INSERT INTO `answerresult` VALUES ('58', '71', 'D', '正确');
INSERT INTO `answerresult` VALUES ('58', '72', 'C', '正确');
INSERT INTO `answerresult` VALUES ('58', '73', 'B', '正确');
INSERT INTO `answerresult` VALUES ('58', '74', 'A,B,C', '正确');
INSERT INTO `answerresult` VALUES ('58', '75', 'D', '正确');
INSERT INTO `answerresult` VALUES ('58', '76', 'A,B,D', '正确');
INSERT INTO `answerresult` VALUES ('58', '77', 'B', '正确');
INSERT INTO `answerresult` VALUES ('58', '78', 'C', '正确');
INSERT INTO `answerresult` VALUES ('58', '79', 'A', '正确');
INSERT INTO `answerresult` VALUES ('58', '80', 'A', '正确');
INSERT INTO `answerresult` VALUES ('58', '81', 'C', '正确');
INSERT INTO `answerresult` VALUES ('58', '82', 'B', '正确');
INSERT INTO `answerresult` VALUES ('58', '83', '无', '错误');
INSERT INTO `answerresult` VALUES ('58', '84', '无', '错误');
INSERT INTO `answerresult` VALUES ('58', '85', '无', '错误');
INSERT INTO `answerresult` VALUES ('58', '86', '无', '错误');
INSERT INTO `answerresult` VALUES ('58', '88', '无', '错误');
INSERT INTO `answerresult` VALUES ('58', '89', 'A,B,C,D', '正确');
INSERT INTO `answerresult` VALUES ('59', '71', '无', '错误');
INSERT INTO `answerresult` VALUES ('59', '72', '无', '错误');
INSERT INTO `answerresult` VALUES ('59', '73', '无', '错误');
INSERT INTO `answerresult` VALUES ('59', '74', 'A,B,C', '正确');
INSERT INTO `answerresult` VALUES ('59', '75', 'D', '正确');
INSERT INTO `answerresult` VALUES ('59', '76', 'A,B,D', '正确');
INSERT INTO `answerresult` VALUES ('59', '77', '无', '错误');
INSERT INTO `answerresult` VALUES ('59', '78', 'C', '正确');
INSERT INTO `answerresult` VALUES ('59', '79', 'A', '正确');
INSERT INTO `answerresult` VALUES ('59', '80', '无', '错误');
INSERT INTO `answerresult` VALUES ('59', '81', '无', '错误');
INSERT INTO `answerresult` VALUES ('59', '82', '无', '错误');
INSERT INTO `answerresult` VALUES ('59', '83', '错误', '正确');
INSERT INTO `answerresult` VALUES ('59', '84', '错误', '正确');
INSERT INTO `answerresult` VALUES ('59', '85', '错误', '正确');
INSERT INTO `answerresult` VALUES ('59', '86', '错误', '正确');
INSERT INTO `answerresult` VALUES ('59', '88', '错误', '正确');
INSERT INTO `answerresult` VALUES ('59', '89', 'A,B,C,D', '正确');
INSERT INTO `answerresult` VALUES ('60', '71', 'D', '正确');
INSERT INTO `answerresult` VALUES ('60', '72', 'C', '正确');
INSERT INTO `answerresult` VALUES ('60', '73', 'B', '正确');
INSERT INTO `answerresult` VALUES ('60', '74', '无', '错误');
INSERT INTO `answerresult` VALUES ('60', '75', 'D', '正确');
INSERT INTO `answerresult` VALUES ('60', '76', '无', '错误');
INSERT INTO `answerresult` VALUES ('60', '77', 'B', '正确');
INSERT INTO `answerresult` VALUES ('60', '78', 'C', '正确');
INSERT INTO `answerresult` VALUES ('60', '79', 'A', '正确');
INSERT INTO `answerresult` VALUES ('60', '80', 'A', '正确');
INSERT INTO `answerresult` VALUES ('60', '81', 'C', '正确');
INSERT INTO `answerresult` VALUES ('60', '82', 'B', '正确');
INSERT INTO `answerresult` VALUES ('60', '83', '无', '错误');
INSERT INTO `answerresult` VALUES ('60', '84', '无', '错误');
INSERT INTO `answerresult` VALUES ('60', '85', '无', '错误');
INSERT INTO `answerresult` VALUES ('60', '86', '无', '错误');
INSERT INTO `answerresult` VALUES ('60', '88', '无', '错误');
INSERT INTO `answerresult` VALUES ('60', '89', 'A,B,C,D', '正确');
INSERT INTO `answerresult` VALUES ('61', '71', 'D', '正确');
INSERT INTO `answerresult` VALUES ('61', '72', 'C', '正确');
INSERT INTO `answerresult` VALUES ('61', '73', 'B', '正确');
INSERT INTO `answerresult` VALUES ('61', '74', 'A,B,C', '正确');
INSERT INTO `answerresult` VALUES ('61', '75', 'D', '正确');
INSERT INTO `answerresult` VALUES ('61', '76', 'A,B,D', '正确');
INSERT INTO `answerresult` VALUES ('61', '77', 'C', '错误');
INSERT INTO `answerresult` VALUES ('61', '78', 'C', '正确');
INSERT INTO `answerresult` VALUES ('61', '79', 'A', '正确');
INSERT INTO `answerresult` VALUES ('61', '80', 'A', '正确');
INSERT INTO `answerresult` VALUES ('61', '81', 'C', '正确');
INSERT INTO `answerresult` VALUES ('61', '82', 'B', '正确');
INSERT INTO `answerresult` VALUES ('61', '83', '正确', '错误');
INSERT INTO `answerresult` VALUES ('61', '84', '正确', '错误');
INSERT INTO `answerresult` VALUES ('61', '85', '错误', '正确');
INSERT INTO `answerresult` VALUES ('61', '86', '错误', '正确');
INSERT INTO `answerresult` VALUES ('61', '88', '错误', '正确');
INSERT INTO `answerresult` VALUES ('61', '89', 'A,B,C,D', '正确');
INSERT INTO `answerresult` VALUES ('62', '71', 'D', '正确');
INSERT INTO `answerresult` VALUES ('62', '72', 'B', '错误');
INSERT INTO `answerresult` VALUES ('62', '73', 'B', '正确');
INSERT INTO `answerresult` VALUES ('62', '74', '无', '错误');
INSERT INTO `answerresult` VALUES ('62', '75', 'D', '正确');
INSERT INTO `answerresult` VALUES ('62', '76', 'A', '错误');
INSERT INTO `answerresult` VALUES ('62', '77', 'B', '正确');
INSERT INTO `answerresult` VALUES ('62', '78', 'C', '正确');
INSERT INTO `answerresult` VALUES ('62', '79', 'A', '正确');
INSERT INTO `answerresult` VALUES ('62', '80', 'A', '正确');
INSERT INTO `answerresult` VALUES ('62', '81', 'C', '正确');
INSERT INTO `answerresult` VALUES ('62', '82', 'B', '正确');
INSERT INTO `answerresult` VALUES ('62', '83', '无', '错误');
INSERT INTO `answerresult` VALUES ('62', '84', '无', '错误');
INSERT INTO `answerresult` VALUES ('62', '85', '无', '错误');
INSERT INTO `answerresult` VALUES ('62', '86', '无', '错误');
INSERT INTO `answerresult` VALUES ('62', '88', '无', '错误');
INSERT INTO `answerresult` VALUES ('62', '89', 'A,B,C,D', '正确');
INSERT INTO `answerresult` VALUES ('63', '45', 'B', '正确');
INSERT INTO `answerresult` VALUES ('63', '48', '错误', '正确');
INSERT INTO `answerresult` VALUES ('63', '49', '错误', '错误');
INSERT INTO `answerresult` VALUES ('63', '50', '错误', '错误');
INSERT INTO `answerresult` VALUES ('63', '52', 'C', '正确');
INSERT INTO `answerresult` VALUES ('63', '53', 'A,C,D', '正确');
INSERT INTO `answerresult` VALUES ('63', '54', 'B', '正确');
INSERT INTO `answerresult` VALUES ('63', '55', 'B,D', '错误');
INSERT INTO `answerresult` VALUES ('63', '57', 'A,B,C,D', '错误');
INSERT INTO `answerresult` VALUES ('63', '58', 'D', '正确');
INSERT INTO `answerresult` VALUES ('63', '59', 'C', '正确');
INSERT INTO `answerresult` VALUES ('63', '60', '错误', '正确');
INSERT INTO `answerresult` VALUES ('63', '61', 'B', '错误');
INSERT INTO `answerresult` VALUES ('63', '62', 'D', '正确');
INSERT INTO `answerresult` VALUES ('63', '63', 'A,D', '错误');
INSERT INTO `answerresult` VALUES ('63', '64', 'B', '正确');
INSERT INTO `answerresult` VALUES ('63', '65', 'B', '正确');
INSERT INTO `answerresult` VALUES ('63', '66', 'A,B,D', '正确');
INSERT INTO `answerresult` VALUES ('63', '68', 'A,B,D', '正确');
INSERT INTO `answerresult` VALUES ('63', '69', '错误', '错误');
INSERT INTO `answerresult` VALUES ('64', '71', 'D', '正确');
INSERT INTO `answerresult` VALUES ('64', '72', 'C', '正确');
INSERT INTO `answerresult` VALUES ('64', '73', 'B', '正确');
INSERT INTO `answerresult` VALUES ('64', '74', '无', '错误');
INSERT INTO `answerresult` VALUES ('64', '75', 'D', '正确');
INSERT INTO `answerresult` VALUES ('64', '76', 'A,B,D', '正确');
INSERT INTO `answerresult` VALUES ('64', '77', 'B', '正确');
INSERT INTO `answerresult` VALUES ('64', '78', 'C', '正确');
INSERT INTO `answerresult` VALUES ('64', '79', 'A', '正确');
INSERT INTO `answerresult` VALUES ('64', '80', 'A', '正确');
INSERT INTO `answerresult` VALUES ('64', '81', 'C', '正确');
INSERT INTO `answerresult` VALUES ('64', '82', 'B', '正确');
INSERT INTO `answerresult` VALUES ('64', '83', '无', '错误');
INSERT INTO `answerresult` VALUES ('64', '84', '无', '错误');
INSERT INTO `answerresult` VALUES ('64', '85', '无', '错误');
INSERT INTO `answerresult` VALUES ('64', '86', '无', '错误');
INSERT INTO `answerresult` VALUES ('64', '88', '无', '错误');
INSERT INTO `answerresult` VALUES ('64', '89', '无', '错误');
INSERT INTO `answerresult` VALUES ('65', '45', '无', '错误');
INSERT INTO `answerresult` VALUES ('65', '48', '无', '错误');
INSERT INTO `answerresult` VALUES ('65', '49', '无', '错误');
INSERT INTO `answerresult` VALUES ('65', '50', '无', '错误');
INSERT INTO `answerresult` VALUES ('65', '52', '无', '错误');
INSERT INTO `answerresult` VALUES ('65', '53', '无', '错误');
INSERT INTO `answerresult` VALUES ('65', '54', 'C', '错误');
INSERT INTO `answerresult` VALUES ('65', '55', '无', '错误');
INSERT INTO `answerresult` VALUES ('65', '57', '无', '错误');
INSERT INTO `answerresult` VALUES ('65', '58', '无', '错误');
INSERT INTO `answerresult` VALUES ('65', '59', '无', '错误');
INSERT INTO `answerresult` VALUES ('65', '60', '无', '错误');
INSERT INTO `answerresult` VALUES ('65', '61', 'C', '正确');
INSERT INTO `answerresult` VALUES ('65', '62', '无', '错误');
INSERT INTO `answerresult` VALUES ('65', '63', '无', '错误');
INSERT INTO `answerresult` VALUES ('65', '64', '无', '错误');
INSERT INTO `answerresult` VALUES ('65', '65', '无', '错误');
INSERT INTO `answerresult` VALUES ('65', '66', '无', '错误');
INSERT INTO `answerresult` VALUES ('65', '68', '无', '错误');
INSERT INTO `answerresult` VALUES ('65', '69', '无', '错误');
INSERT INTO `answerresult` VALUES ('66', '45', '无', '错误');
INSERT INTO `answerresult` VALUES ('66', '48', '无', '错误');
INSERT INTO `answerresult` VALUES ('66', '49', '无', '错误');
INSERT INTO `answerresult` VALUES ('66', '50', '无', '错误');
INSERT INTO `answerresult` VALUES ('66', '52', 'C', '正确');
INSERT INTO `answerresult` VALUES ('66', '53', '无', '错误');
INSERT INTO `answerresult` VALUES ('66', '54', 'B', '正确');
INSERT INTO `answerresult` VALUES ('66', '55', '无', '错误');
INSERT INTO `answerresult` VALUES ('66', '57', '无', '错误');
INSERT INTO `answerresult` VALUES ('66', '58', '无', '错误');
INSERT INTO `answerresult` VALUES ('66', '59', '无', '错误');
INSERT INTO `answerresult` VALUES ('66', '60', '无', '错误');
INSERT INTO `answerresult` VALUES ('66', '61', 'B', '错误');
INSERT INTO `answerresult` VALUES ('66', '62', 'D', '正确');
INSERT INTO `answerresult` VALUES ('66', '63', '无', '错误');
INSERT INTO `answerresult` VALUES ('66', '64', 'B', '正确');
INSERT INTO `answerresult` VALUES ('66', '65', 'B', '正确');
INSERT INTO `answerresult` VALUES ('66', '66', '无', '错误');
INSERT INTO `answerresult` VALUES ('66', '68', '无', '错误');
INSERT INTO `answerresult` VALUES ('66', '69', '无', '错误');

-- ----------------------------
-- Table structure for `examination`
-- ----------------------------
DROP TABLE IF EXISTS `examination`;
CREATE TABLE `examination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `passscore` int(11) DEFAULT NULL,
  `introduction` text,
  `createtime` datetime DEFAULT NULL,
  `taotiid` int(11) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_taoti_fk` (`taotiid`),
  KEY `exam_manager_fk` (`mid`),
  CONSTRAINT `exam_manager_fk` FOREIGN KEY (`mid`) REFERENCES `manager` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `exam_taoti_fk` FOREIGN KEY (`taotiid`) REFERENCES `taoti` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examination
-- ----------------------------
INSERT INTO `examination` VALUES ('8', '数据结构A', '2018-05-02 10:47:35', '2018-05-23 10:47:41', '1', '60', '', '2018-05-14 10:47:55', '13', '1');
INSERT INTO `examination` VALUES ('11', '数据结构B', '2018-05-14 14:14:58', '2018-05-17 14:15:02', '2', '70', '', '2018-05-15 14:15:19', '16', '1');
INSERT INTO `examination` VALUES ('12', '计算机组成原理A', '2018-05-20 09:50:44', '2018-05-25 09:50:50', '1', '60', '', '2018-05-22 09:51:08', '17', '1');

-- ----------------------------
-- Table structure for `examtimes`
-- ----------------------------
DROP TABLE IF EXISTS `examtimes`;
CREATE TABLE `examtimes` (
  `sid` int(11) NOT NULL,
  `examinationid` int(11) NOT NULL,
  `timescount` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`,`examinationid`),
  KEY `times_examidfk` (`examinationid`),
  CONSTRAINT `times_examidfk` FOREIGN KEY (`examinationid`) REFERENCES `examination` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `times_sidfk` FOREIGN KEY (`sid`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examtimes
-- ----------------------------
INSERT INTO `examtimes` VALUES ('40', '8', '1');
INSERT INTO `examtimes` VALUES ('41', '8', '2');
INSERT INTO `examtimes` VALUES ('41', '12', '2');
INSERT INTO `examtimes` VALUES ('42', '8', '2');
INSERT INTO `examtimes` VALUES ('42', '12', '2');
INSERT INTO `examtimes` VALUES ('44', '8', '1');
INSERT INTO `examtimes` VALUES ('44', '12', '2');
INSERT INTO `examtimes` VALUES ('45', '8', '1');
INSERT INTO `examtimes` VALUES ('45', '12', '1');
INSERT INTO `examtimes` VALUES ('46', '8', '1');
INSERT INTO `examtimes` VALUES ('46', '12', '1');
INSERT INTO `examtimes` VALUES ('47', '8', '1');
INSERT INTO `examtimes` VALUES ('48', '8', '2');
INSERT INTO `examtimes` VALUES ('48', '12', '1');
INSERT INTO `examtimes` VALUES ('49', '8', '1');
INSERT INTO `examtimes` VALUES ('49', '12', '1');
INSERT INTO `examtimes` VALUES ('50', '8', '1');
INSERT INTO `examtimes` VALUES ('50', '12', '1');
INSERT INTO `examtimes` VALUES ('51', '8', '1');
INSERT INTO `examtimes` VALUES ('51', '12', '1');
INSERT INTO `examtimes` VALUES ('52', '8', '2');
INSERT INTO `examtimes` VALUES ('52', '12', '2');
INSERT INTO `examtimes` VALUES ('54', '8', '1');
INSERT INTO `examtimes` VALUES ('54', '12', '1');
INSERT INTO `examtimes` VALUES ('55', '12', '2');
INSERT INTO `examtimes` VALUES ('56', '8', '1');
INSERT INTO `examtimes` VALUES ('59', '8', '1');
INSERT INTO `examtimes` VALUES ('59', '12', '1');

-- ----------------------------
-- Table structure for `finalresult`
-- ----------------------------
DROP TABLE IF EXISTS `finalresult`;
CREATE TABLE `finalresult` (
  `sid` int(11) NOT NULL,
  `examinationid` int(11) NOT NULL,
  `resingle` int(11) DEFAULT NULL,
  `resmore` int(11) DEFAULT NULL,
  `restorf` int(11) DEFAULT NULL,
  `restotal` int(11) DEFAULT NULL,
  `ispass` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`sid`,`examinationid`),
  KEY `fianl_examid_fk` (`examinationid`),
  CONSTRAINT `fianl_examid_fk` FOREIGN KEY (`examinationid`) REFERENCES `examination` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `final_sid_fk` FOREIGN KEY (`sid`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of finalresult
-- ----------------------------
INSERT INTO `finalresult` VALUES ('40', '8', '33', '20', '15', '68', '是', '2018-05-14 11:10:22');
INSERT INTO `finalresult` VALUES ('41', '8', '49', '20', '25', '94', '是', '2018-05-14 11:08:33');
INSERT INTO `finalresult` VALUES ('41', '12', '35', '10', '0', '45', '否', '2018-05-22 09:59:54');
INSERT INTO `finalresult` VALUES ('42', '8', '36', '0', '15', '51', '否', '2018-05-14 11:14:13');
INSERT INTO `finalresult` VALUES ('42', '12', '45', '30', '20', '95', '是', '2018-05-22 10:14:05');
INSERT INTO `finalresult` VALUES ('44', '8', '49', '20', '15', '84', '是', '2018-05-14 11:16:12');
INSERT INTO `finalresult` VALUES ('44', '12', '45', '10', '0', '55', '否', '2018-05-22 10:51:05');
INSERT INTO `finalresult` VALUES ('45', '8', '49', '20', '10', '79', '是', '2018-05-14 11:21:21');
INSERT INTO `finalresult` VALUES ('45', '12', '50', '10', '0', '60', '是', '2018-05-22 10:47:57');
INSERT INTO `finalresult` VALUES ('46', '8', '49', '20', '0', '69', '是', '2018-05-14 11:17:46');
INSERT INTO `finalresult` VALUES ('46', '12', '15', '30', '20', '65', '是', '2018-05-22 10:46:37');
INSERT INTO `finalresult` VALUES ('47', '8', '39', '0', '0', '39', '否', '2018-05-14 11:18:44');
INSERT INTO `finalresult` VALUES ('48', '8', '46', '20', '15', '81', '是', '2018-05-14 11:23:21');
INSERT INTO `finalresult` VALUES ('48', '12', '45', '30', '12', '87', '是', '2018-05-22 10:49:18');
INSERT INTO `finalresult` VALUES ('49', '8', '49', '15', '0', '64', '是', '2018-05-14 11:28:25');
INSERT INTO `finalresult` VALUES ('49', '12', '30', '0', '0', '30', '否', '2018-05-22 10:24:00');
INSERT INTO `finalresult` VALUES ('50', '8', '43', '15', '10', '68', '是', '2018-05-14 11:25:08');
INSERT INTO `finalresult` VALUES ('50', '12', '50', '30', '0', '80', '是', '2018-05-22 10:45:22');
INSERT INTO `finalresult` VALUES ('51', '8', '43', '20', '15', '78', '是', '2018-05-14 11:27:07');
INSERT INTO `finalresult` VALUES ('51', '12', '50', '20', '0', '70', '是', '2018-05-22 10:43:48');
INSERT INTO `finalresult` VALUES ('52', '8', '33', '10', '10', '53', '否', '2018-05-14 10:53:01');
INSERT INTO `finalresult` VALUES ('52', '12', '25', '20', '20', '65', '是', '2018-05-22 10:03:32');
INSERT INTO `finalresult` VALUES ('54', '8', '39', '15', '0', '54', '否', '2018-05-22 10:21:43');
INSERT INTO `finalresult` VALUES ('54', '12', '50', '30', '0', '80', '是', '2018-05-22 10:23:00');
INSERT INTO `finalresult` VALUES ('55', '12', '30', '0', '0', '30', '否', '2018-05-22 10:41:01');
INSERT INTO `finalresult` VALUES ('56', '8', '39', '15', '10', '64', '是', '2018-05-22 10:55:37');
INSERT INTO `finalresult` VALUES ('59', '8', '23', '0', '0', '23', '否', '2018-05-22 15:15:56');
INSERT INTO `finalresult` VALUES ('59', '12', '50', '10', '0', '60', '是', '2018-05-22 11:36:28');

-- ----------------------------
-- Table structure for `knowledge`
-- ----------------------------
DROP TABLE IF EXISTS `knowledge`;
CREATE TABLE `knowledge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `lessonid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `knowledge_lesson_fk` (`lessonid`),
  CONSTRAINT `knowledge_lesson_fk` FOREIGN KEY (`lessonid`) REFERENCES `lesson` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of knowledge
-- ----------------------------
INSERT INTO `knowledge` VALUES ('58', '极限与连续', '19');
INSERT INTO `knowledge` VALUES ('59', '导数及其应用', '19');
INSERT INTO `knowledge` VALUES ('60', '一元积分学', '19');
INSERT INTO `knowledge` VALUES ('61', '微分方程', '19');
INSERT INTO `knowledge` VALUES ('62', '多元积分学', '19');
INSERT INTO `knowledge` VALUES ('69', '需求分析', '21');
INSERT INTO `knowledge` VALUES ('70', '总体设计', '21');
INSERT INTO `knowledge` VALUES ('71', '数据库设计', '21');
INSERT INTO `knowledge` VALUES ('72', '详细设计', '21');
INSERT INTO `knowledge` VALUES ('73', '运行测试', '21');
INSERT INTO `knowledge` VALUES ('74', '维护', '21');
INSERT INTO `knowledge` VALUES ('75', '链表', '22');
INSERT INTO `knowledge` VALUES ('76', '数组', '22');
INSERT INTO `knowledge` VALUES ('77', '稀疏矩阵', '22');
INSERT INTO `knowledge` VALUES ('78', '栈', '22');
INSERT INTO `knowledge` VALUES ('79', '队列', '22');
INSERT INTO `knowledge` VALUES ('80', '树和二叉树', '22');
INSERT INTO `knowledge` VALUES ('81', '图', '22');
INSERT INTO `knowledge` VALUES ('82', '排序', '22');
INSERT INTO `knowledge` VALUES ('83', '查找', '22');
INSERT INTO `knowledge` VALUES ('92', '物理层', '24');
INSERT INTO `knowledge` VALUES ('93', '数据链路层', '24');
INSERT INTO `knowledge` VALUES ('94', '网络层', '24');
INSERT INTO `knowledge` VALUES ('95', '传输层', '24');
INSERT INTO `knowledge` VALUES ('96', '应用层', '24');
INSERT INTO `knowledge` VALUES ('97', '计算机系统概论', '25');
INSERT INTO `knowledge` VALUES ('98', '系统总线', '25');
INSERT INTO `knowledge` VALUES ('99', '存储器', '25');
INSERT INTO `knowledge` VALUES ('100', '输入输出系统', '25');
INSERT INTO `knowledge` VALUES ('101', '计算机运算方法', '25');
INSERT INTO `knowledge` VALUES ('102', 'cpu的结构和功能', '25');
INSERT INTO `knowledge` VALUES ('103', '控制单元', '25');

-- ----------------------------
-- Table structure for `lesson`
-- ----------------------------
DROP TABLE IF EXISTS `lesson`;
CREATE TABLE `lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createtime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lesson
-- ----------------------------
INSERT INTO `lesson` VALUES ('19', '高等数学', '2018-05-13');
INSERT INTO `lesson` VALUES ('21', '软件工程', '2018-05-13');
INSERT INTO `lesson` VALUES ('22', '数据结构', '2018-05-13');
INSERT INTO `lesson` VALUES ('24', '计算机网络', '2018-05-15');
INSERT INTO `lesson` VALUES ('25', '计算机组成原理', '2018-05-21');

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', 'zhangsan', '123', '超级');
INSERT INTO `manager` VALUES ('3', 'joe', '123', '普通');
INSERT INTO `manager` VALUES ('5', 'JoeLeon', '123', '超级');
INSERT INTO `manager` VALUES ('6', '郭明周', '123', '普通');

-- ----------------------------
-- Table structure for `managerstudent`
-- ----------------------------
DROP TABLE IF EXISTS `managerstudent`;
CREATE TABLE `managerstudent` (
  `mid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  PRIMARY KEY (`mid`,`sid`),
  KEY `ms_student_fk` (`sid`),
  CONSTRAINT `ms_manager_fk` FOREIGN KEY (`mid`) REFERENCES `manager` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ms_student_fk` FOREIGN KEY (`sid`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of managerstudent
-- ----------------------------
INSERT INTO `managerstudent` VALUES ('1', '40');
INSERT INTO `managerstudent` VALUES ('3', '40');
INSERT INTO `managerstudent` VALUES ('1', '41');
INSERT INTO `managerstudent` VALUES ('3', '41');
INSERT INTO `managerstudent` VALUES ('1', '42');
INSERT INTO `managerstudent` VALUES ('3', '42');
INSERT INTO `managerstudent` VALUES ('1', '44');
INSERT INTO `managerstudent` VALUES ('3', '44');
INSERT INTO `managerstudent` VALUES ('1', '45');
INSERT INTO `managerstudent` VALUES ('3', '45');
INSERT INTO `managerstudent` VALUES ('1', '46');
INSERT INTO `managerstudent` VALUES ('3', '46');
INSERT INTO `managerstudent` VALUES ('1', '47');
INSERT INTO `managerstudent` VALUES ('3', '47');
INSERT INTO `managerstudent` VALUES ('1', '48');
INSERT INTO `managerstudent` VALUES ('3', '48');
INSERT INTO `managerstudent` VALUES ('1', '49');
INSERT INTO `managerstudent` VALUES ('3', '49');
INSERT INTO `managerstudent` VALUES ('1', '50');
INSERT INTO `managerstudent` VALUES ('1', '51');
INSERT INTO `managerstudent` VALUES ('1', '52');
INSERT INTO `managerstudent` VALUES ('1', '54');
INSERT INTO `managerstudent` VALUES ('1', '55');
INSERT INTO `managerstudent` VALUES ('1', '56');
INSERT INTO `managerstudent` VALUES ('1', '59');
INSERT INTO `managerstudent` VALUES ('1', '60');

-- ----------------------------
-- Table structure for `myfile`
-- ----------------------------
DROP TABLE IF EXISTS `myfile`;
CREATE TABLE `myfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `createtime` datetime DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_manager_fk` (`mid`),
  CONSTRAINT `file_manager_fk` FOREIGN KEY (`mid`) REFERENCES `manager` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myfile
-- ----------------------------
INSERT INTO `myfile` VALUES ('4', '郭明周-课程考试系统任务书.doc', '2018-05-15 15:07:21', '1');
INSERT INTO `myfile` VALUES ('5', '广工本科生毕业设计手册.pdf', '2018-05-15 15:12:51', '1');
INSERT INTO `myfile` VALUES ('7', '编译原理.ppt', '2018-05-15 15:18:01', '1');
INSERT INTO `myfile` VALUES ('8', '编译原理课件 .rar', '2018-05-15 15:18:16', '1');
INSERT INTO `myfile` VALUES ('9', '学生成绩单.xls', '2018-05-15 15:18:25', '1');
INSERT INTO `myfile` VALUES ('11', 'Image 2.png', '2018-05-22 11:34:36', '1');

-- ----------------------------
-- Table structure for `questions`
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `optiona` varchar(255) DEFAULT NULL,
  `optionb` varchar(255) DEFAULT NULL,
  `optionc` varchar(255) DEFAULT NULL,
  `optiond` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `judgeanswer` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `difficulty` varchar(255) DEFAULT NULL,
  `lessonid` int(11) DEFAULT NULL,
  `knowledgeid` int(11) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_lesson_fk` (`lessonid`),
  KEY `question_knowledge_fk` (`knowledgeid`),
  KEY `question_manager_fk` (`mid`),
  CONSTRAINT `question_knowledge_fk` FOREIGN KEY (`knowledgeid`) REFERENCES `knowledge` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `question_lesson_fk` FOREIGN KEY (`lessonid`) REFERENCES `lesson` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `question_manager_fk` FOREIGN KEY (`mid`) REFERENCES `manager` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES ('18', '', '单选', '2018-05-12 09:41:07', '', '', '', '', 'A', '正确', '', '简单', null, null, '1');
INSERT INTO `questions` VALUES ('28', '0.8亿转换成万单位为（）', '单选', '2018-05-13 22:07:03', '8000万', '800万', '80万', '80000万', 'A', '正确', '0.8亿转换成万单位为8000万', '简单', '19', '58', '1');
INSERT INTO `questions` VALUES ('29', '数a分解质因数是a=2×2×3，数b分解质因数是b=2×2×5，数a和数b的最大公因数是', '单选', '2018-05-13 22:09:08', '12', '20', '32', '4', 'D', null, '数a和数b的最大公因数是4', '一般', '19', '59', '1');
INSERT INTO `questions` VALUES ('30', '下面为质数的是（）', '单选', '2018-05-13 22:10:18', '2', '4', '6', '8', 'A', null, '2为质数', '困难', '19', '60', '1');
INSERT INTO `questions` VALUES ('31', '下面是12的约数的有（）', '多选', '2018-05-13 22:11:38', '2', '3', '4', '5', 'A,B,C', null, '12的约数的有2，3，4', '简单', '19', '60', '1');
INSERT INTO `questions` VALUES ('32', '下面为质数的是（）', '多选', '2018-05-13 22:12:35', '1', '2', '3', '5', 'B,C,D', null, '2，3，5为质数', '一般', '19', '61', '1');
INSERT INTO `questions` VALUES ('33', '下面为偶数的有（）', '多选', '2018-05-13 22:13:41', '1', '2', '3', '4', 'B,D', null, '2，4为偶数', '困难', '19', '61', '1');
INSERT INTO `questions` VALUES ('34', '11×11等于111', '判断', '2018-05-13 22:14:38', '', '', '', '', null, '错误', '11×11等于121', '简单', '19', '61', '1');
INSERT INTO `questions` VALUES ('38', '2为质数', '判断', '2018-05-13 22:17:46', '', '', '', '', null, '正确', '2为质数', '一般', '19', '58', '1');
INSERT INTO `questions` VALUES ('40', '0.5的倒数为5', '判断', '2018-05-13 22:21:30', '', '', '', '', 'A', '错误', '0.5的倒数为2', '困难', '19', '60', '1');
INSERT INTO `questions` VALUES ('41', '对于一个线性表既要求能够进行较快速地插入和删除，又要求存储结构能反映数据之间的逻辑关系，则应该用（）', '单选', '2018-05-14 09:27:31', '顺序存储方式', '链式存储方式', '散列存储方式', '以上均可以', 'B', '正确', '链式存储中的静态链表满足这一要求', '简单', '22', null, '1');
INSERT INTO `questions` VALUES ('42', '对于一个线性表既要求能够进行较快速地插入和删除，又要求存储结构能反映数据之间的逻辑关系，则应该用（）', '单选', '2018-05-14 09:30:25', '顺序存储方式', '链式存储方式', '散列存储方式', '以上均可以', 'B', null, '链式存储中的静态链表满足这一要求', '简单', '22', '75', '1');
INSERT INTO `questions` VALUES ('43', '单链表中，增加一个头结点的目的是为了（）', '单选', '2018-05-14 09:34:27', '使单链表至少有一个结点', '标识表结点中首结点的位置', '方便运算的实现', '说明单链表是线性表的链式存储', 'C', null, '单链表中，增加一个头结点的目的是为了方便运算的实现', '一般', '22', '75', '1');
INSERT INTO `questions` VALUES ('44', '与单链表相比，双链表的优点之一是（）', '单选', '2018-05-14 09:38:03', '插入、删除操作更方便', '可以进行随机访问', '可以省略表头指针或表尾指针', '访问前后相邻结点更灵活', 'D', null, '与单链表相比，双链表的优点之一是访问前后相邻结点更灵活', '困难', '22', '75', '1');
INSERT INTO `questions` VALUES ('45', '需要分配较大的空间，插入和删除不需要移动元素的线性表，其存储结构为（）', '单选', '2018-05-14 09:40:41', '单链表', '静态链表', '顺序表', '双链表', 'B', null, '', '困难', '22', '75', '1');
INSERT INTO `questions` VALUES ('46', '静态链表中指针表示的是（）', '单选', '2018-05-14 09:43:20', '下一元素的地址', '内存储器地址', '下一个元素在数组中的位置', '左链或右链指向的元素的地址', 'C', null, '静态链表中指针表示的是下一个元素在数组中的位置', '一般', '22', '75', '1');
INSERT INTO `questions` VALUES ('47', '线性表的顺序存储结构优于其链式存储结构', '判断', '2018-05-14 09:44:41', '', '', '', '', null, '错误', '', '简单', '22', '75', '1');
INSERT INTO `questions` VALUES ('48', '如频繁使用插入和删除结点操作，顺序存储结构更优于链式存储结构', '判断', '2018-05-14 09:46:12', '', '', '', '', null, '错误', '', '一般', '22', '75', '1');
INSERT INTO `questions` VALUES ('49', '链式存储结构比顺序存储结构能更方便的表示各种逻辑结构', '判断', '2018-05-14 09:47:37', '', '', '', '', null, '正确', '', '困难', '22', '75', '1');
INSERT INTO `questions` VALUES ('50', '顺序存储结构和链式存储结构都可以进行顺序存取', '判断', '2018-05-14 09:48:35', '', '', '', '', null, '正确', '', '简单', '22', '75', '1');
INSERT INTO `questions` VALUES ('51', '栈和队列具有相同的（）', '单选', '2018-05-14 09:51:53', '抽象数据类型', '逻辑结构', '存储结构', '运算', 'B', null, '栈和队列都是属于线性结构', '简单', '22', '78', '1');
INSERT INTO `questions` VALUES ('52', '栈是（）', '单选', '2018-05-14 09:53:43', '顺序存储的线性结构', '链式存储的非线性结构', '限制存取点的线性结构', '限制存储点的非线性结构', 'C', null, '栈是限制存取点的线性结构', '一般', '22', '78', '1');
INSERT INTO `questions` VALUES ('53', '（）是栈的基本操作', '多选', '2018-05-14 09:56:44', '删除栈顶元素', '删除栈底元素', '判断栈是否为空', '将栈置为空栈', 'A,C,D', null, '删除栈底元素不是栈的基本操作', '困难', '22', '78', '1');
INSERT INTO `questions` VALUES ('54', '3个不同元素依次进栈，能得到（）种不同的出栈序列。', '单选', '2018-05-14 09:58:42', '4', '5', '6', '7', 'B', null, '', '困难', '22', '78', '1');
INSERT INTO `questions` VALUES ('55', '队列的“先进先出”特性是指（）', '多选', '2018-05-14 10:03:15', '最后插入队列中的元素总是最后被删除', '当同时进行插入、删除操作时，总是插入操作优先', '每当有删除操作时，总要先做一次插入操作', '每次从队列中删除的总是最早插入的元素', 'A,D', null, '', '一般', '22', '79', '1');
INSERT INTO `questions` VALUES ('56', '在用单链表实现队列时，队头在链表的（）位置。', '单选', '2018-05-14 10:06:41', '链头', '链尾', '链中', '以上都可以', 'A', null, '', '困难', '22', '79', '1');
INSERT INTO `questions` VALUES ('57', '栈的应用包括（）', '多选', '2018-05-14 10:13:58', '递归', '进制转换', '迷宫求解', '缓冲区', 'A,B,C', '正确', '', '一般', '22', '78', '1');
INSERT INTO `questions` VALUES ('58', '树最适合用来表示（）的数据', '单选', '2018-05-14 10:16:21', '有序', '无序', '任意元素之间具有多种联系', '元素之间具有分支层次关系', 'D', null, '', '一般', '22', '80', '1');
INSERT INTO `questions` VALUES ('59', '假定一颗度为3的树中结点数为50，则其最小高度为（）', '单选', '2018-05-14 10:17:58', '3', '4', '5', '6', 'C', null, '', '困难', '22', '80', '1');
INSERT INTO `questions` VALUES ('60', '树的路径长度是从树根到每一结点的路径长度的最大值。', '判断', '2018-05-14 10:19:40', '', '', '', '', null, '错误', '树的路径长度是从树根到每一结点的路径长度的总和。', '困难', '22', '80', '1');
INSERT INTO `questions` VALUES ('61', '假设一棵二叉树的结点个数为50，则它的最小高度是（）', '单选', '2018-05-14 10:22:00', '4', '5', '6', '7', 'C', null, '', '困难', '22', '80', '1');
INSERT INTO `questions` VALUES ('62', '一个有n个顶点和n条边的无向图一定是（）', '单选', '2018-05-14 10:25:21', '连通的', '不连通的', '无环的', '有环的', 'D', null, '', '简单', '22', '81', '1');
INSERT INTO `questions` VALUES ('63', '用邻接表存储的图的深度优先遍历算法类似树的（），而其广度优先遍历算法类似于树的（）。', '多选', '2018-05-14 10:29:47', '中序遍历', '先序遍历', '后序遍历', '层次遍历', 'B,D', null, '', '一般', '22', '81', '1');
INSERT INTO `questions` VALUES ('64', '折半查找过程所对应的判定树是一棵（）', '单选', '2018-05-14 10:32:03', '最小生成树', '平衡二叉树', '完全二叉树', '满二叉树', 'B', null, '', '一般', '22', '83', '1');
INSERT INTO `questions` VALUES ('65', '折半查找和二叉树的时间性能（）', '单选', '2018-05-14 10:33:36', '相同', '有时不相同', '完全不同', '无法比较', 'B', null, '', '困难', '22', '83', '1');
INSERT INTO `questions` VALUES ('66', '属于内部排序方法的是（）', '多选', '2018-05-14 10:35:24', '插入排序', '选择排序', '拓扑排序', '冒泡排序', 'A,B,D', null, '', '简单', '22', '82', '1');
INSERT INTO `questions` VALUES ('67', '希尔排序属于（）', '单选', '2018-05-14 10:36:46', '插入排序', '交换排序', '选择排序', '归并排序', 'A', null, '', '一般', '22', '82', '1');
INSERT INTO `questions` VALUES ('68', '以下稳定的排序算法是（）', '多选', '2018-05-14 10:39:18', '冒泡排序', '直接插入排序', '希尔排序', '归并排序', 'A,B,D', null, '', '一般', '22', '82', '1');
INSERT INTO `questions` VALUES ('69', '希尔排序的组内排序采用的是直接插入排序', '判断', '2018-05-14 10:40:50', '', '', '', '', null, '正确', '', '简单', '22', '82', '1');
INSERT INTO `questions` VALUES ('70', 'ICMP是应用层协议', '判断', '2018-05-15 11:58:25', '', '', '', '', 'A', '错误', '', '简单', '24', '94', '1');
INSERT INTO `questions` VALUES ('71', '输入、输出装置以及外接的辅助存储器称为（）', '单选', '2018-05-21 15:52:06', '操作系统', '存储器', '主机', '外部设备', 'D', '正确', '', '简单', '25', '97', '1');
INSERT INTO `questions` VALUES ('72', '用以指定待执行指令所在地址的是（）', '单选', '2018-05-21 15:55:34', '指令寄存器', '数据计数器', '程序计数器', '累加器', 'C', null, '', '简单', '25', '97', '1');
INSERT INTO `questions` VALUES ('73', '用户与计算机通信的界面是（）', '单选', '2018-05-21 15:57:30', 'cpu', '外部设备', '应用程序', '系统程序', 'B', null, '', '一般', '25', '97', '1');
INSERT INTO `questions` VALUES ('74', '下列（）是输入设备', '多选', '2018-05-21 15:59:27', '画笔与图形板', '键盘', '鼠标器', '打印机', 'A,B,C', null, '', '困难', '25', '97', '1');
INSERT INTO `questions` VALUES ('75', '计算机与日常使用的袖珍计算机的本质区别在于（）', '单选', '2018-05-21 16:01:32', '运算速度的高低', '存储器容量的大小', '规模的大小', '自动化程度的高低', 'D', null, '', '困难', '25', '97', '1');
INSERT INTO `questions` VALUES ('76', '下列设备中（）属于输出设备', '多选', '2018-05-21 16:07:07', '打印机', '磁带机', '光笔', '绘图仪', 'A,B,D', null, '', '简单', '25', '97', '1');
INSERT INTO `questions` VALUES ('77', '计算机中（）负责指令译码', '单选', '2018-05-21 16:10:14', '算术逻辑单元', '控制单元', '存储器译码电路', '输入输出译码电路', 'B', null, '', '困难', '25', '97', '1');
INSERT INTO `questions` VALUES ('78', '在各种异步通信方式中，（）速度最快', '单选', '2018-05-21 16:14:18', '全互锁', '半互锁', '不互锁', '全不对', 'C', null, '', '简单', '25', '98', '1');
INSERT INTO `questions` VALUES ('79', '程序员编程所用的地址叫做（）', '单选', '2018-05-21 16:22:21', '逻辑地址', '物理地址', '真实地址', '以上都不对', 'A', null, '', '简单', '25', '98', '1');
INSERT INTO `questions` VALUES ('80', 'DMA方式中，周期窃取是窃取一个（）', '单选', '2018-05-21 16:24:40', '存取周期', '指令周期', 'cpu周期', '总线周期', 'A', null, '', '一般', '25', '100', '1');
INSERT INTO `questions` VALUES ('81', '主机与I/O设备传送数据时，采用（），cpu的效率最高', '单选', '2018-05-21 16:28:53', '程序查询方式', '中断方式', 'DMA方式', '以上都对', 'C', null, '', '困难', '25', '100', '1');
INSERT INTO `questions` VALUES ('82', '鼠标器适合于用（）方式实现输入操作', '单选', '2018-05-21 16:32:36', '程序查询', '中断', 'DMA', '以上都不对', 'B', null, '', '一般', '25', '100', '1');
INSERT INTO `questions` VALUES ('83', 'ALU只做算术运算，不做逻辑运算', '判断', '2018-05-21 16:46:03', '', '', '', '', null, '错误', '', '简单', '25', '101', '1');
INSERT INTO `questions` VALUES ('84', 'ALU能存放运算结果', '判断', '2018-05-21 16:46:56', '', '', '', '', null, '错误', '', '困难', '25', '101', '1');
INSERT INTO `questions` VALUES ('85', '数据库属于系统软件', '判断', '2018-05-21 16:47:58', '', '', '', '', null, '错误', '', '一般', '25', '97', '1');
INSERT INTO `questions` VALUES ('86', '磁盘驱动器只有输入功能', '判断', '2018-05-21 16:48:52', '', '', '', '', null, '错误', '', '困难', '25', '97', '1');
INSERT INTO `questions` VALUES ('87', '评估计算机的执行速度可以用每秒执行的指令数为判断依据', '判断', '2018-05-21 16:49:57', '', '', '', '', null, '正确', '', '一般', null, '101', '1');
INSERT INTO `questions` VALUES ('88', '个人计算机是小型机', '判断', '2018-05-21 16:50:55', '', '', '', '', null, '错误', '', '简单', '25', '97', '1');
INSERT INTO `questions` VALUES ('89', '一个总线传输周期包括（）', '多选', '2018-05-21 16:58:56', '申请阶段', '寻址阶段', '传输阶段', '结束阶段', 'A,B,C,D', null, '', '一般', '25', '98', '1');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `jointime` date DEFAULT NULL,
  `profession` varchar(255) DEFAULT NULL,
  `clazz` int(11) DEFAULT NULL,
  `activate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('40', 'Joe', '123', '男', '1604452143@qq.com', '2018-05-13', '计算机', '4', '1');
INSERT INTO `student` VALUES ('41', '郭明周', '123', '男', '1604452143@qq.com', '2018-05-13', '计算机', '3', '1');
INSERT INTO `student` VALUES ('42', 'Jack', '123', '男', '1604452143@qq.com', '2018-05-13', '机电', '4', '1');
INSERT INTO `student` VALUES ('44', '小红', '123', '女', '1604452143@qq.com', '2018-05-13', '土木工程', '2', '1');
INSERT INTO `student` VALUES ('45', '小周', '123', '男', '1604452143@qq.com', '2018-05-13', '建筑学', '6', '1');
INSERT INTO `student` VALUES ('46', '小丽', '123', '女', '1604452143@qq.com', '2018-05-13', '自动化', '3', '1');
INSERT INTO `student` VALUES ('47', '小龙', '123', '男', '1604452143@qq.com', '2018-05-13', '轻工化工', '2', '1');
INSERT INTO `student` VALUES ('48', '小明', '123', '男', '1604452143@qq.com', '2018-05-13', '计算机', '3', '1');
INSERT INTO `student` VALUES ('49', 'Joey', '123', '男', '1604452143@qq.com', '2018-05-13', '计算机', '2', '1');
INSERT INTO `student` VALUES ('50', 'Mike', '123', '男', '1604452143@qq.com', '2018-05-13', '计算机', '6', '1');
INSERT INTO `student` VALUES ('51', 'Lucy', '123', '女', '1604452143@qq.com', '2018-05-13', '机电', '3', '1');
INSERT INTO `student` VALUES ('52', '池圳炼', '123', '男', '1604452143@qq.com', '2018-05-14', '计算机', '3', '1');
INSERT INTO `student` VALUES ('54', 'JoeLeon', '111111', '男', '1604452143@qq.com', '2018-05-14', '计算机', '1', '1');
INSERT INTO `student` VALUES ('55', 'JoeyLeon', '111111', '男', '1604452143@qq.com', '2018-05-14', '计算机', '1', '1');
INSERT INTO `student` VALUES ('56', 'guomingzhou', '111111', '男', '1604452143@qq.com', '2018-05-22', '计算机', '3', '1');
INSERT INTO `student` VALUES ('59', 'guohai', '123', '男', '1604452143@qq.com', '2018-05-22', '计算机', '3', '1');
INSERT INTO `student` VALUES ('60', '郭海', '123', '男', '1604452143@qq.com', '2018-05-22', '计算机', '1', '1');
INSERT INTO `student` VALUES ('62', '11111111', '111111', '男', '1604452143@qq.com', '2018-05-22', '计算机', '1', '1');

-- ----------------------------
-- Table structure for `studentresult`
-- ----------------------------
DROP TABLE IF EXISTS `studentresult`;
CREATE TABLE `studentresult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT NULL,
  `resingle` int(11) DEFAULT NULL,
  `resmore` int(11) DEFAULT NULL,
  `restorf` int(11) DEFAULT NULL,
  `restotal` int(11) DEFAULT NULL,
  `ispass` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `examinationid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stures_stu_fk` (`sid`),
  KEY `stures_exam_fk` (`examinationid`),
  CONSTRAINT `stures_exam_fk` FOREIGN KEY (`examinationid`) REFERENCES `examination` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stures_stu_fk` FOREIGN KEY (`sid`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studentresult
-- ----------------------------
INSERT INTO `studentresult` VALUES ('29', '52', '33', '10', '10', '53', '否', '2018-05-14 10:53:01', '8');
INSERT INTO `studentresult` VALUES ('30', '41', '49', '20', '25', '94', '是', '2018-05-14 11:08:33', '8');
INSERT INTO `studentresult` VALUES ('31', '40', '33', '20', '15', '68', '是', '2018-05-14 11:10:22', '8');
INSERT INTO `studentresult` VALUES ('32', '42', '36', '0', '15', '51', '否', '2018-05-14 11:14:13', '8');
INSERT INTO `studentresult` VALUES ('33', '44', '49', '20', '15', '84', '是', '2018-05-14 11:16:12', '8');
INSERT INTO `studentresult` VALUES ('34', '46', '49', '20', '0', '69', '是', '2018-05-14 11:17:46', '8');
INSERT INTO `studentresult` VALUES ('35', '47', '39', '0', '0', '39', '否', '2018-05-14 11:18:44', '8');
INSERT INTO `studentresult` VALUES ('36', '45', '49', '20', '10', '79', '是', '2018-05-14 11:21:21', '8');
INSERT INTO `studentresult` VALUES ('37', '48', '46', '20', '15', '81', '是', '2018-05-14 11:23:21', '8');
INSERT INTO `studentresult` VALUES ('38', '50', '43', '15', '10', '68', '是', '2018-05-14 11:25:08', '8');
INSERT INTO `studentresult` VALUES ('39', '51', '43', '20', '15', '78', '是', '2018-05-14 11:27:07', '8');
INSERT INTO `studentresult` VALUES ('40', '49', '49', '15', '0', '64', '是', '2018-05-14 11:28:25', '8');
INSERT INTO `studentresult` VALUES ('41', '41', '28', '0', '0', '28', '否', '2018-05-14 14:37:36', '8');
INSERT INTO `studentresult` VALUES ('42', '41', '0', '0', '0', '0', '否', '2018-05-15 10:21:32', '8');
INSERT INTO `studentresult` VALUES ('43', '41', '0', '0', '0', '0', '否', '2018-05-15 10:24:31', '8');
INSERT INTO `studentresult` VALUES ('44', '41', '49', '15', '0', '64', '是', '2018-05-15 10:27:16', '8');
INSERT INTO `studentresult` VALUES ('45', '52', '10', '5', '10', '25', '否', '2018-05-20 16:49:53', '8');
INSERT INTO `studentresult` VALUES ('46', '41', '35', '10', '0', '45', '否', '2018-05-22 09:59:54', '12');
INSERT INTO `studentresult` VALUES ('47', '41', '30', '10', '0', '40', '否', '2018-05-22 10:01:11', '12');
INSERT INTO `studentresult` VALUES ('48', '52', '25', '20', '20', '65', '是', '2018-05-22 10:03:32', '12');
INSERT INTO `studentresult` VALUES ('49', '52', '0', '0', '0', '0', '否', '2018-05-22 10:05:08', '12');
INSERT INTO `studentresult` VALUES ('50', '42', '0', '0', '0', '0', '否', '2018-05-22 10:07:32', '12');
INSERT INTO `studentresult` VALUES ('51', '42', '45', '30', '20', '95', '是', '2018-05-22 10:14:05', '12');
INSERT INTO `studentresult` VALUES ('52', '54', '39', '15', '0', '54', '否', '2018-05-22 10:21:43', '8');
INSERT INTO `studentresult` VALUES ('53', '54', '50', '30', '0', '80', '是', '2018-05-22 10:23:00', '12');
INSERT INTO `studentresult` VALUES ('54', '49', '30', '0', '0', '30', '否', '2018-05-22 10:24:00', '12');
INSERT INTO `studentresult` VALUES ('55', '55', '30', '0', '0', '30', '否', '2018-05-22 10:41:01', '12');
INSERT INTO `studentresult` VALUES ('56', '55', '5', '0', '0', '5', '否', '2018-05-22 10:42:09', '12');
INSERT INTO `studentresult` VALUES ('57', '51', '50', '20', '0', '70', '是', '2018-05-22 10:43:48', '12');
INSERT INTO `studentresult` VALUES ('58', '50', '50', '30', '0', '80', '是', '2018-05-22 10:45:22', '12');
INSERT INTO `studentresult` VALUES ('59', '46', '15', '30', '20', '65', '是', '2018-05-22 10:46:37', '12');
INSERT INTO `studentresult` VALUES ('60', '45', '50', '10', '0', '60', '是', '2018-05-22 10:47:57', '12');
INSERT INTO `studentresult` VALUES ('61', '48', '45', '30', '12', '87', '是', '2018-05-22 10:49:18', '12');
INSERT INTO `studentresult` VALUES ('62', '44', '45', '10', '0', '55', '否', '2018-05-22 10:51:05', '12');
INSERT INTO `studentresult` VALUES ('63', '56', '39', '15', '10', '64', '是', '2018-05-22 10:55:37', '8');
INSERT INTO `studentresult` VALUES ('64', '59', '50', '10', '0', '60', '是', '2018-05-22 11:36:28', '12');
INSERT INTO `studentresult` VALUES ('65', '48', '6', '0', '0', '6', '否', '2018-05-22 13:00:54', '8');
INSERT INTO `studentresult` VALUES ('66', '59', '23', '0', '0', '23', '否', '2018-05-22 15:15:56', '8');

-- ----------------------------
-- Table structure for `taoti`
-- ----------------------------
DROP TABLE IF EXISTS `taoti`;
CREATE TABLE `taoti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `difficultylevel` varchar(255) DEFAULT NULL,
  `singlenum` int(11) DEFAULT NULL,
  `singlescore` int(11) DEFAULT NULL,
  `multinum` int(11) DEFAULT NULL,
  `multiscore` int(11) DEFAULT NULL,
  `trueorfalsenum` int(11) DEFAULT NULL,
  `trueorfalsescore` int(11) DEFAULT NULL,
  `easyscore` int(11) DEFAULT NULL,
  `ordinaryscore` int(11) DEFAULT NULL,
  `difficultscore` int(11) DEFAULT NULL,
  `totalscore` int(11) DEFAULT NULL,
  `createtime` date DEFAULT NULL,
  `lessonid` int(11) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taoti_lesson_fk` (`lessonid`),
  KEY `taoti_manager_fk` (`mid`),
  CONSTRAINT `taoti_lesson_fk` FOREIGN KEY (`lessonid`) REFERENCES `lesson` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `taoti_manager_fk` FOREIGN KEY (`mid`) REFERENCES `manager` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of taoti
-- ----------------------------
INSERT INTO `taoti` VALUES ('13', '数据结构A', '困难', '9', '45', '6', '30', '5', '25', '18', '37', '45', '100', '2018-05-14', '22', '1');
INSERT INTO `taoti` VALUES ('16', '数据结构B', '一般', '14', '70', '5', '26', '6', '24', '27', '55', '38', '120', '2018-05-15', '22', '1');
INSERT INTO `taoti` VALUES ('17', '计算机组成原理A', '简单', '10', '50', '3', '30', '5', '20', '38', '29', '33', '100', '2018-05-21', '25', '1');
INSERT INTO `taoti` VALUES ('19', '数据结构C', '简单', '2', '20', '0', '0', '0', '0', '10', '10', '0', '20', '2018-05-22', '22', '1');

-- ----------------------------
-- Table structure for `taotiquestion`
-- ----------------------------
DROP TABLE IF EXISTS `taotiquestion`;
CREATE TABLE `taotiquestion` (
  `taotiid` int(11) NOT NULL,
  `questionid` int(11) NOT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`taotiid`,`questionid`),
  KEY `tq_question_fk` (`questionid`),
  CONSTRAINT `tq_question_fk` FOREIGN KEY (`questionid`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tq_taoti_fk` FOREIGN KEY (`taotiid`) REFERENCES `taoti` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of taotiquestion
-- ----------------------------
INSERT INTO `taotiquestion` VALUES ('13', '45', '6');
INSERT INTO `taotiquestion` VALUES ('13', '48', '5');
INSERT INTO `taotiquestion` VALUES ('13', '49', '5');
INSERT INTO `taotiquestion` VALUES ('13', '50', '5');
INSERT INTO `taotiquestion` VALUES ('13', '52', '4');
INSERT INTO `taotiquestion` VALUES ('13', '53', '5');
INSERT INTO `taotiquestion` VALUES ('13', '54', '6');
INSERT INTO `taotiquestion` VALUES ('13', '55', '5');
INSERT INTO `taotiquestion` VALUES ('13', '57', '5');
INSERT INTO `taotiquestion` VALUES ('13', '58', '4');
INSERT INTO `taotiquestion` VALUES ('13', '59', '6');
INSERT INTO `taotiquestion` VALUES ('13', '60', '5');
INSERT INTO `taotiquestion` VALUES ('13', '61', '6');
INSERT INTO `taotiquestion` VALUES ('13', '62', '3');
INSERT INTO `taotiquestion` VALUES ('13', '63', '5');
INSERT INTO `taotiquestion` VALUES ('13', '64', '4');
INSERT INTO `taotiquestion` VALUES ('13', '65', '6');
INSERT INTO `taotiquestion` VALUES ('13', '66', '5');
INSERT INTO `taotiquestion` VALUES ('13', '68', '5');
INSERT INTO `taotiquestion` VALUES ('13', '69', '5');
INSERT INTO `taotiquestion` VALUES ('16', '43', '5');
INSERT INTO `taotiquestion` VALUES ('16', '45', '5');
INSERT INTO `taotiquestion` VALUES ('16', '46', '5');
INSERT INTO `taotiquestion` VALUES ('16', '47', '4');
INSERT INTO `taotiquestion` VALUES ('16', '48', '4');
INSERT INTO `taotiquestion` VALUES ('16', '49', '4');
INSERT INTO `taotiquestion` VALUES ('16', '50', '4');
INSERT INTO `taotiquestion` VALUES ('16', '51', '5');
INSERT INTO `taotiquestion` VALUES ('16', '52', '5');
INSERT INTO `taotiquestion` VALUES ('16', '54', '5');
INSERT INTO `taotiquestion` VALUES ('16', '55', '5');
INSERT INTO `taotiquestion` VALUES ('16', '56', '5');
INSERT INTO `taotiquestion` VALUES ('16', '57', '6');
INSERT INTO `taotiquestion` VALUES ('16', '58', '5');
INSERT INTO `taotiquestion` VALUES ('16', '59', '5');
INSERT INTO `taotiquestion` VALUES ('16', '60', '4');
INSERT INTO `taotiquestion` VALUES ('16', '61', '5');
INSERT INTO `taotiquestion` VALUES ('16', '62', '5');
INSERT INTO `taotiquestion` VALUES ('16', '63', '5');
INSERT INTO `taotiquestion` VALUES ('16', '64', '5');
INSERT INTO `taotiquestion` VALUES ('16', '65', '5');
INSERT INTO `taotiquestion` VALUES ('16', '66', '5');
INSERT INTO `taotiquestion` VALUES ('16', '67', '5');
INSERT INTO `taotiquestion` VALUES ('16', '68', '5');
INSERT INTO `taotiquestion` VALUES ('16', '69', '4');
INSERT INTO `taotiquestion` VALUES ('17', '71', '5');
INSERT INTO `taotiquestion` VALUES ('17', '72', '5');
INSERT INTO `taotiquestion` VALUES ('17', '73', '5');
INSERT INTO `taotiquestion` VALUES ('17', '74', '10');
INSERT INTO `taotiquestion` VALUES ('17', '75', '5');
INSERT INTO `taotiquestion` VALUES ('17', '76', '10');
INSERT INTO `taotiquestion` VALUES ('17', '77', '5');
INSERT INTO `taotiquestion` VALUES ('17', '78', '5');
INSERT INTO `taotiquestion` VALUES ('17', '79', '5');
INSERT INTO `taotiquestion` VALUES ('17', '80', '5');
INSERT INTO `taotiquestion` VALUES ('17', '81', '5');
INSERT INTO `taotiquestion` VALUES ('17', '82', '5');
INSERT INTO `taotiquestion` VALUES ('17', '83', '4');
INSERT INTO `taotiquestion` VALUES ('17', '84', '4');
INSERT INTO `taotiquestion` VALUES ('17', '85', '4');
INSERT INTO `taotiquestion` VALUES ('17', '86', '4');
INSERT INTO `taotiquestion` VALUES ('17', '88', '4');
INSERT INTO `taotiquestion` VALUES ('17', '89', '10');
INSERT INTO `taotiquestion` VALUES ('19', '42', '10');
INSERT INTO `taotiquestion` VALUES ('19', '46', '10');
