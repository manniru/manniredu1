/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : manniredu

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2014-04-27 04:49:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `application`
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pin` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `mobileno` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `dob` varchar(50) DEFAULT NULL,
  `picture` blob,
  `address` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `school` varchar(50) DEFAULT NULL,
  `exam` varchar(50) DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `program` varchar(50) DEFAULT NULL,
  `admission` varchar(50) DEFAULT NULL,
  `dateapp` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of application
-- ----------------------------
INSERT INTO `application` VALUES ('1', '', 'admin', 'admin', 'admin', '', '', '', null, '', '', 0x636C7573746572352E706E67, '', null, '', '', '', '', '', '', '2014-03-18');
INSERT INTO `application` VALUES ('2', '9999999998', 'mannir', 'mannir', 'applicant', '08069354904', 'manniru@gmail.com', 'MANNIR', 'AHMAD', 'M', '1982-11-07', 0x6E756C6C, 'Endah regal condo', 'Abuja', 'Nigeria', 'Foundation', 'Primary Certificate', 'B', 'Diploma in Computer Science', '', '2014-03-23');
INSERT INTO `application` VALUES ('3', '9999999998', 'zahra', '12345', 'student', '234803659484', 'zahra@mannir.com', 'ZAHRA', 'MAIGARI', 'M', '1986-11-07', 0x6E756C6C, 'Endah Prominade', 'Lagos', 'Nigeria', 'Foundation', 'Higher Certificate', 'B', 'BSc (Hons) in S.E.', '', '2014-03-23');
INSERT INTO `application` VALUES ('4', '9999999997', 'jahara', '12345', 'applicant', '63828292287', 'jahara@mannir.com', 'JAHARA', 'MANNIR', 'M', '1982-03-05', 0x4465736572742E6A7067, 'Bukit Jalil', 'Bauchi', 'Nigeria', 'Certificate', 'Higher Certificate', 'C', 'Diploma in Computer Science', '', '2014-03-18');
INSERT INTO `application` VALUES ('5', '1234567890', 'mannir', '12345', null, '601123064474', 'manniru@gmail.com', 'MUHAMMAD', 'MANNIR', 'M', '1986-11-07', 0x4465736572742E6A7067, 'Kano Nigeria', 'Kano', 'Nigeria', 'Diploma', 'Higher Certificate', 'B', 'BSc (Hons) in S.E.', '', '2014-03-18');
INSERT INTO `application` VALUES ('6', '9999999998', 'zahra', '12345', null, '234803659484', 'zahra@mannir.com', 'Mannir2', 'MAIGARI', 'M', '1986-11-07', 0x706176696C696F6E5F6476375F647269766572732E706E67, 'Endah Prominade', 'null', 'Nigeria', 'Foundation', 'Higher Certificate', 'B', '4', '', '2014-03-18');
INSERT INTO `application` VALUES ('7', '9999999999', 'mannir', '1234', null, '601123064474', 'manniru@gmail.com', 'MANNIRU', 'AHMAD', 'M', '1982-11-07', 0x6A73702E706E67, 'Endah regal condo', 'Kano', 'Nigeria', 'Degree', 'Higher Certificate', 'D', 'BSc (Hons) in S.E.', '', '2014-03-23');
INSERT INTO `application` VALUES ('8', '9999999999', 'mannir', '1234', null, '601123064474', 'manniru@gmail.com', 'MANNIRU', 'AHMAD', 'M', '1982-11-07', '', 'Endah regal condo', 'Kano', 'Nigeria', 'Degree', 'Higher Certificate', 'D', 'BSc (Hons) in S.E.', '', '2014-03-23');
INSERT INTO `application` VALUES ('9', '8888888888', 'auwal', 'auwal', null, '60128272827', 'auwal@mannir.com', 'AUWAL', 'IBRAHIM', 'M', '1982-11-07', 0x7273362E706E67, 'Endah Parade', 'Kuala Lumpur', 'Malaysia', 'Diploma', 'Higher Certificate', 'C', 'BSc (Hons) Software Engineering', '', '2014-03-30');
INSERT INTO `application` VALUES ('10', 'Jszzo', 'manniru@gmail.com', 'Pzild', null, 'Hdbop', 'manniru@gmail.com', 'MUHAMMAD MANNIR', 'AHMAD', 'M', 'Buxiq', null, 'Bukit Jalil', 'Kuala Lumpur', 'Nigeria', 'Diploma', 'Higher Certificate', 'C', 'BSc (Hons) Software Engineering', '', '2014-03-31');
INSERT INTO `application` VALUES ('11', 'testing1', 'manniru@gmail.com', 'Hqvrt', null, 'Qkcqw', 'manniru@gmail.com', 'MUHAMMAD MANNIR', 'AHMAD', 'M', 'Rbugg', null, 'Bukit Jalil', 'Kuala Lumpur', 'Nigeria', 'Diploma', 'Higher Certificate', 'C', 'BSc (Hons) Software Engineering', '', '2014-03-31');
INSERT INTO `application` VALUES ('12', 'Ipsct', 'manniru@gmail.com', 'Yyegt', null, 'Lbwlf', 'manniru@gmail.com', 'MUHAMMAD MANNIR', 'AHMAD', 'M', 'Rbmxc', null, 'Bukit Jalil', 'Kuala Lumpur', 'Nigeria', 'Diploma', 'Higher Certificate', 'C', 'BSc (Hons) Software Engineering', '', '2014-03-31');
INSERT INTO `application` VALUES ('13', 'Nmvfp', 'manniru@gmail.com', 'Pfryr', null, 'Fkztq', 'manniru@gmail.com', 'MUHAMMAD MANNIR', 'AHMAD', 'M', 'Pxtyi', null, 'Bukit Jalil', 'Kuala Lumpur', 'Nigeria', 'Diploma', 'Higher Certificate', 'C', 'BSc (Hons) Software Engineering', '', '2014-03-31');
INSERT INTO `application` VALUES ('14', 'test1', 'manniru@gmail.com', 'Hsrtr', null, 'Kgmqs', 'manniru@gmail.com', 'MUHAMMAD MANNIR', 'AHMAD', 'M', 'Ytecr', null, 'Bukit Jalil', 'Kuala Lumpur', 'Nigeria', 'Diploma', 'Higher Certificate', 'C', 'BSc (Hons) Software Engineering', '', '2014-03-31');
INSERT INTO `application` VALUES ('15', '9999999998', 'manniru@gmail.com', 'u', null, 'u', 'manniru@gmail.com', 'MUHAMMAD MANNIR', 'AHMAD', 'M', 'Gemub', null, 'Bukit Jalil', 'Kuala Lumpur', 'Nigeria', 'Diploma', 'Higher Certificate', 'C', 'BSc (Hons) Business Information Systems', '', '2014-03-31');
INSERT INTO `application` VALUES ('16', '987654321', 'user1', 'user1', 'applicant', '601123064474', 'manniru@gmail.com', 'MUHAMMAD', 'AHMAD', 'M', '1982-11-07', 0x616770617070312E706E67, 'Kano Nigeria', 'Kano', 'Nigeria', 'Degree', 'Higher Certificate', 'C', 'BSc (Hons) Software Engineering', '', '2014-03-31');
INSERT INTO `application` VALUES ('17', 'Gcjlm', 'manniru@gmail.com', 'Fihyi', null, 'Hmixl', 'manniru@gmail.com', 'MUHAMMAD MANNIR', 'AHMAD', 'M', 'Vjwsu', null, 'Bukit Jalil', 'Kuala Lumpur', 'Nigeria', 'Diploma', 'Higher Certificate', 'C', 'BSc (Hons) Software Engineering', '', '2014-04-05');
INSERT INTO `application` VALUES ('18', '9999999999', 'manniru@gmail.com', 'test9', null, 'Pfkkm', 'manniru@gmail.com', 'MUHAMMAD MANNIR', 'AHMAD', 'M', 'Dbkia', null, 'Bukit Jalil', 'Kuala Lumpur', 'Nigeria', 'Diploma', 'Higher Certificate', 'C', 'BSc (Hons) Software Engineering', '', '2014-04-06');
INSERT INTO `application` VALUES ('19', 'Xmhcs', 'test10', 'test10', 'applicant', 'Pqkfc', 'manniru@gmail.com', 'MUHAMMAD MANNIR', 'AHMAD', 'M', 'Cejvv', null, 'Bukit Jalil', 'Kuala Lumpur', 'Nigeria', 'Diploma', 'Higher Certificate', 'C', 'BSc (Hons) Software Engineering', '', '2014-04-06');
INSERT INTO `application` VALUES ('20', 'Fnzmd', 'user2', 'user2', 'applicant', 'Hdczj', 'manniru@gmail.com', 'MUHAMMAD MANNIR', 'AHMAD', 'M', 'Rliyv', null, 'Bukit Jalil', 'Kuala Lumpur', 'Nigeria', 'Diploma', 'Higher Certificate', 'C', 'BSc (Hons) Software Engineering', '', '2014-04-06');
INSERT INTO `application` VALUES ('21', 'Geroh', 'user21', 'user21', 'applicant', '60128272827', 'manniru@gmail.com', 'MUHAMMAD MANNIR', 'AHMAD', 'M', 'Csoqa', null, 'Bukit Jalil', 'Kuala Lumpur', 'Nigeria', 'Diploma', 'Higher Certificate', 'C', 'BSc (Hons) Software Engineering', '', '2014-04-06');
INSERT INTO `application` VALUES ('22', 'Qxggl', 'user22', 'user22', 'applicant', '60163750441', 'manniru@gmail.com', 'MUHAMMAD MANNIR', 'AHMAD', 'M', 'Fyjfa', null, 'Bukit Jalil', 'Kuala Lumpur', 'Nigeria', 'Diploma', 'Higher Certificate', 'C', 'BSc (Hons) Software Engineering', '', '2014-04-06');
INSERT INTO `application` VALUES ('23', 'Acqsa', 'chosen', 'chosen', 'applicant', '601123064474', 'chosen@gmail.com', 'CHOSEN', 'CHOSEN', 'F', 'Bnaiq', null, 'Bukit Jalil', 'Kuala Lumpur', 'Malaysia', 'Degree', 'Bsc', 'B', 'BSc (Hons) Software Engineering', '1', '2014-04-07');
INSERT INTO `application` VALUES ('24', '9999999999', 'musa', 'musa', 'applicant', '601123064474', 'mannri@gmail.com', 'MANNIR', 'AHMAD', 'M', '1982-11-07', 0x617070656E67696E65202D20436F70792E706E67, 'Bukit Jalil', 'Kano', 'Nigeria', 'Degree', 'Higher Certificate', 'B', 'BSc (Hons) Software Engineering', '1', '2014-04-07');

-- ----------------------------
-- Table structure for `courses`
-- ----------------------------
DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `cu` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of courses
-- ----------------------------
INSERT INTO `courses` VALUES ('1', 'CN1041', 'Academic Skills for Computing', '20', '1', '1', '1');
INSERT INTO `courses` VALUES ('2', 'SD1042', 'Introduction to Software Development', '20', '1', '1', '1');
INSERT INTO `courses` VALUES ('3', 'IM1024', 'Web Development and Management', '20', '1', '1', '2');
INSERT INTO `courses` VALUES ('4', 'IM1045', 'Information Systems', '20', '1', '1', '2');
INSERT INTO `courses` VALUES ('5', 'CN1147', 'Introduction to Computer Systems and Networks', '20', '1', '1', '3');
INSERT INTO `courses` VALUES ('6', 'SD1333', 'Mathematics for Computing', '20', '1', '1', '3');
INSERT INTO `courses` VALUES ('7', 'CN2041', 'Professional Issues', '20', '1', '2', '1');
INSERT INTO `courses` VALUES ('8', 'IM2042', 'Information Systems Modelling and Design', '20', '1', '2', '1');
INSERT INTO `courses` VALUES ('9', 'CN2053', 'Operating Systems', '20', '1', '2', '2');
INSERT INTO `courses` VALUES ('10', 'SD2052', 'Database Systems', '20', '1', '2', '2');
INSERT INTO `courses` VALUES ('11', 'SD2054', 'Software Development', '20', '1', '2', '3');
INSERT INTO `courses` VALUES ('12', 'SD2012', 'Data Structures and Algorithms', '20', '1', '2', '3');
INSERT INTO `courses` VALUES ('13', 'CN3070', 'Project: Research and Implementation', '40', '1', '3', '1');
INSERT INTO `courses` VALUES ('14', 'CN3001', 'Computer Studies Project', '40', '1', '3', '1');
INSERT INTO `courses` VALUES ('15', 'SD3331', 'Data Analysis and Data Mining', '20', '1', '3', '2');
INSERT INTO `courses` VALUES ('16', 'CN3044', 'Network Programming', '20', '1', '3', '2');
INSERT INTO `courses` VALUES ('17', 'SD3049', 'Formal Software Methods', '20', '1', '3', '3');
INSERT INTO `courses` VALUES ('18', 'SD3004', 'Programming Languages', '20', '1', '3', '3');
INSERT INTO `courses` VALUES ('19', 'CN1041', 'Academic Skills for Computing', '20', '2', '1', '1');
INSERT INTO `courses` VALUES ('20', 'SD1032', 'Foundations of Programming', '20', '2', '1', '1');
INSERT INTO `courses` VALUES ('21', 'IM1024', 'Web Development and Management', '20', '2', '1', '2');
INSERT INTO `courses` VALUES ('22', 'IM1045', 'Information Systems', '20', '2', '1', '2');
INSERT INTO `courses` VALUES ('23', 'CN1147', 'Introduction to Computer Systems and Networks', '20', '2', '1', '3');
INSERT INTO `courses` VALUES ('24', 'SD1333', 'Mathematics for Computing', '20', '2', '1', '3');
INSERT INTO `courses` VALUES ('25', 'CN2041', 'Professional Issues', '20', '2', '2', '1');
INSERT INTO `courses` VALUES ('26', 'IM2043', 'Information Technology Planning and Infrastructure', '20', '2', '2', '1');
INSERT INTO `courses` VALUES ('27', 'IM2042', 'Information Systems Modelling and Design', '20', '2', '2', '2');
INSERT INTO `courses` VALUES ('28', 'IM2801', 'Web Applications Programming', '20', '2', '2', '2');
INSERT INTO `courses` VALUES ('29', 'SD2052', 'Database Systems', '20', '2', '2', '3');
INSERT INTO `courses` VALUES ('30', 'IM2044', 'Usability Engineering', '20', '2', '2', '3');
INSERT INTO `courses` VALUES ('31', 'CN2014', 'Computer and Network Security', '20', '2', '3', '1');
INSERT INTO `courses` VALUES ('32', 'CN3070', 'Project: Research and Implementation', '20', '2', '3', '1');
INSERT INTO `courses` VALUES ('33', 'CN3001', 'Computer Studies Project', '20', '2', '3', '1');
INSERT INTO `courses` VALUES ('34', 'SD3042', 'Advanced Database Development', '20', '2', '3', '2');
INSERT INTO `courses` VALUES ('35', 'SD3059', 'Information Security Audit and Assurance', '20', '2', '3', '2');
INSERT INTO `courses` VALUES ('36', 'IM3045', 'Project Management', '20', '2', '3', '2');
INSERT INTO `courses` VALUES ('37', 'IM3802', 'Issues in Internet Design and Development', '20', '2', '3', '3');
INSERT INTO `courses` VALUES ('38', 'IM3056', 'Management and Information Systems', '20', '2', '3', '3');

-- ----------------------------
-- Table structure for `examtype`
-- ----------------------------
DROP TABLE IF EXISTS `examtype`;
CREATE TABLE `examtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of examtype
-- ----------------------------
INSERT INTO `examtype` VALUES ('1', 'Primary Certificate');
INSERT INTO `examtype` VALUES ('2', 'Secondary Certificate');
INSERT INTO `examtype` VALUES ('3', 'Higher Certificate');
INSERT INTO `examtype` VALUES ('4', 'Diploma Certificate');
INSERT INTO `examtype` VALUES ('5', 'Bsc');

-- ----------------------------
-- Table structure for `gradetype`
-- ----------------------------
DROP TABLE IF EXISTS `gradetype`;
CREATE TABLE `gradetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of gradetype
-- ----------------------------
INSERT INTO `gradetype` VALUES ('1', 'A');
INSERT INTO `gradetype` VALUES ('2', 'B');
INSERT INTO `gradetype` VALUES ('3', 'C');
INSERT INTO `gradetype` VALUES ('4', 'D');
INSERT INTO `gradetype` VALUES ('5', 'E');

-- ----------------------------
-- Table structure for `hqtype`
-- ----------------------------
DROP TABLE IF EXISTS `hqtype`;
CREATE TABLE `hqtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hqtype
-- ----------------------------
INSERT INTO `hqtype` VALUES ('1', 'Certificate');
INSERT INTO `hqtype` VALUES ('2', 'Foundation');
INSERT INTO `hqtype` VALUES ('3', 'Diploma');
INSERT INTO `hqtype` VALUES ('4', 'Degree');
INSERT INTO `hqtype` VALUES ('5', 'Masters');

-- ----------------------------
-- Table structure for `pin`
-- ----------------------------
DROP TABLE IF EXISTS `pin`;
CREATE TABLE `pin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pin` varchar(20) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `amount` varchar(11) DEFAULT NULL,
  `uid` int(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pin
-- ----------------------------
INSERT INTO `pin` VALUES ('1', '9999999999', 'app', '2000', '0');
INSERT INTO `pin` VALUES ('2', '9999999999', 'app', '2000', '0');
INSERT INTO `pin` VALUES ('3', '9999999999', 'app', '2000', '0');
INSERT INTO `pin` VALUES ('4', '9999999999', 'app', '2000', '0');
INSERT INTO `pin` VALUES ('5', '9999999999', 'app', '2000', '0');
INSERT INTO `pin` VALUES ('6', '9999999999', 'reg', '2000', '0');

-- ----------------------------
-- Table structure for `program`
-- ----------------------------
DROP TABLE IF EXISTS `program`;
CREATE TABLE `program` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `duration` varchar(20) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `school` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of program
-- ----------------------------
INSERT INTO `program` VALUES ('1', 'BSc (Hons) Software Engineering', '3 years', null, null);
INSERT INTO `program` VALUES ('2', 'BSc (Hons) Business Information Systems', '3 years', null, null);

-- ----------------------------
-- Table structure for `registration`
-- ----------------------------
DROP TABLE IF EXISTS `registration`;
CREATE TABLE `registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` varchar(20) DEFAULT NULL,
  `studentname` varchar(50) DEFAULT NULL,
  `programme` varchar(10) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `semester` varchar(1) DEFAULT NULL,
  `module` varchar(20) DEFAULT NULL,
  `units` int(11) DEFAULT NULL,
  `cw` int(11) DEFAULT NULL,
  `exam` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `grade` varchar(2) DEFAULT NULL,
  `point` float DEFAULT NULL,
  `gp` float DEFAULT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  `datereg` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of registration
-- ----------------------------
INSERT INTO `registration` VALUES ('1', 'u1131819', 'MUHAMMAD MANNIR AHMAD', 'BSE', '1', 'A', 'SD2058', '28', '34', '35', null, null, null, null, null, '2014-04-06 09:03:41');
INSERT INTO `registration` VALUES ('2', 'u1172623', 'ZAHRAU SHARU MAIGAIRI', 'BSE', '1', 'A', 'SD2058', '32', '5', '20', null, null, null, null, null, '2014-04-06 09:08:03');
INSERT INTO `registration` VALUES ('3', 'u1120912', 'JAHARA FERA MACRAMBON', 'BIS', '1', 'B', 'SD2058', '25', '16', '15', null, null, null, null, null, '2014-04-06 09:03:43');
INSERT INTO `registration` VALUES ('4', 'u1182263', 'AISHA MAHMOOD ABUBAKAR', 'BSE', '1', 'B', 'SD2058', '24', '36', '36', null, null, null, null, null, '2014-04-06 09:03:45');
INSERT INTO `registration` VALUES ('5', 'u1726233', 'ZAINAB ABUBAKAR', 'BIS', '1', 'C', 'SD2058', '20', '8', '10', null, null, null, null, null, '2014-04-06 09:12:34');

-- ----------------------------
-- Table structure for `registration_copy`
-- ----------------------------
DROP TABLE IF EXISTS `registration_copy`;
CREATE TABLE `registration_copy` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL,
  `pin` varchar(20) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `units` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `cw` int(11) DEFAULT NULL,
  `exam` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `grade` varchar(2) DEFAULT NULL,
  `point` float DEFAULT NULL,
  `gp` float DEFAULT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  `datereg` date DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of registration_copy
-- ----------------------------
INSERT INTO `registration_copy` VALUES ('1', '22', '9876543210', 'SD2054', null, '1', '1', null, null, null, null, null, null, null, null);
INSERT INTO `registration_copy` VALUES ('2', '22', '9876543210', 'IM1045', null, '1', '1', null, null, null, null, null, null, null, null);
INSERT INTO `registration_copy` VALUES ('3', '22', '9876543210', 'CN1147', null, '1', '1', null, null, null, null, null, null, null, null);
INSERT INTO `registration_copy` VALUES ('4', '22', '9876543210', 'IM2042', null, '1', '1', null, null, null, null, null, null, null, null);
INSERT INTO `registration_copy` VALUES ('5', '22', '9876543210', 'SD3331', null, '1', '1', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pin` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `mobileno` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `dob` varchar(50) DEFAULT NULL,
  `picture` blob,
  `address` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `school` varchar(50) DEFAULT NULL,
  `exam` varchar(50) DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `program` varchar(50) DEFAULT NULL,
  `admission` varchar(50) DEFAULT NULL,
  `dateapp` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '', '', '', '', '', '', null, '', '', 0x636C7573746572352E706E67, '', null, '', '', '', '', '', '', '2014-03-18');
INSERT INTO `user` VALUES ('2', '9999999998', 'mannir', 'muhammad', '08069354904', 'manniru@gmail.com', 'MANNIR', 'AHMAD', 'M', '1982-11-07', 0x6E756C6C, 'Endah regal condo', 'Abuja', 'Nigeria', 'Foundation', 'Primary Certificate', 'B', 'Diploma in Computer Science', '', '2014-03-23');
INSERT INTO `user` VALUES ('3', '9999999998', 'zahra', '12345', '234803659484', 'zahra@mannir.com', 'ZAHRA', 'MAIGARI', 'M', '1986-11-07', 0x6E756C6C, 'Endah Prominade', 'Lagos', 'Nigeria', 'Foundation', 'Higher Certificate', 'B', 'BSc (Hons) in S.E.', '', '2014-03-23');
INSERT INTO `user` VALUES ('4', '9999999997', 'jahara', '12345', '63828292287', 'jahara@mannir.com', 'JAHARA', 'MANNIR', 'M', '1982-03-05', 0x4465736572742E6A7067, 'Bukit Jalil', 'Bauchi', 'Nigeria', 'Certificate', 'Higher Certificate', 'C', 'Diploma in Computer Science', '', '2014-03-18');
INSERT INTO `user` VALUES ('5', '1234567890', 'mannir', '12345', '601123064474', 'manniru@gmail.com', 'MUHAMMAD', 'MANNIR', 'M', '1986-11-07', 0x4465736572742E6A7067, 'Kano Nigeria', 'Kano', 'Nigeria', 'Diploma', 'Higher Certificate', 'B', 'BSc (Hons) in S.E.', '', '2014-03-18');
INSERT INTO `user` VALUES ('6', '9999999998', 'zahra', '12345', '234803659484', 'zahra@mannir.com', 'Mannir2', 'MAIGARI', 'M', '1986-11-07', 0x706176696C696F6E5F6476375F647269766572732E706E67, 'Endah Prominade', 'null', 'Nigeria', 'Foundation', 'Higher Certificate', 'B', '4', '', '2014-03-18');
INSERT INTO `user` VALUES ('7', '9999999999', 'mannir', '1234', '601123064474', 'manniru@gmail.com', 'MANNIRU', 'AHMAD', 'M', '1982-11-07', 0x6A73702E706E67, 'Endah regal condo', 'Kano', 'Nigeria', 'Degree', 'Higher Certificate', 'D', 'BSc (Hons) in S.E.', '', '2014-03-23');
INSERT INTO `user` VALUES ('8', '9999999999', 'mannir', '1234', '601123064474', 'manniru@gmail.com', 'MANNIRU', 'AHMAD', 'M', '1982-11-07', '', 'Endah regal condo', 'Kano', 'Nigeria', 'Degree', 'Higher Certificate', 'D', 'BSc (Hons) in S.E.', '', '2014-03-23');
INSERT INTO `user` VALUES ('9', '8888888888', 'auwal', 'auwal', '60128272827', 'auwal@mannir.com', 'AUWAL', 'IBRAHIM', 'M', '1982-11-07', 0x7273362E706E67, 'Endah Parade', 'Kuala Lumpur', 'Malaysia', 'Diploma', 'Higher Certificate', 'C', 'BSc (Hons) Software Engineering', '', '2014-03-30');
INSERT INTO `user` VALUES ('10', 'Jszzo', 'manniru@gmail.com', 'Pzild', 'Hdbop', 'manniru@gmail.com', 'MUHAMMAD MANNIR', 'AHMAD', 'M', 'Buxiq', null, 'Bukit Jalil', 'Kuala Lumpur', 'Nigeria', 'Diploma', 'Higher Certificate', 'C', 'BSc (Hons) Software Engineering', '', '2014-03-31');
INSERT INTO `user` VALUES ('11', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('12', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('13', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('14', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `users1`
-- ----------------------------
DROP TABLE IF EXISTS `users1`;
CREATE TABLE `users1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users1
-- ----------------------------
INSERT INTO `users1` VALUES ('1', 'admin', 'admin', 'admin');
INSERT INTO `users1` VALUES ('2', 'app', 'app', 'applicant');
INSERT INTO `users1` VALUES ('3', 'std', 'std', 'student');

-- ----------------------------
-- Table structure for `users_03312014`
-- ----------------------------
DROP TABLE IF EXISTS `users_03312014`;
CREATE TABLE `users_03312014` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pin` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `mobileno` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `dob` varchar(50) DEFAULT NULL,
  `picture` blob,
  `address` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `school` varchar(50) DEFAULT NULL,
  `exam` varchar(50) DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `program` varchar(50) DEFAULT NULL,
  `admission` varchar(50) DEFAULT NULL,
  `dateapp` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users_03312014
-- ----------------------------
INSERT INTO `users_03312014` VALUES ('1', '', 'admin', 'admin', 'admin', '', '', '', null, '', '', 0x636C7573746572352E706E67, '', null, '', '', '', '', '', '', '2014-03-18');
INSERT INTO `users_03312014` VALUES ('2', '9999999998', 'mannir', 'mannir', 'applicant', '08069354904', 'manniru@gmail.com', 'MANNIR', 'AHMAD', 'M', '1982-11-07', 0x6E756C6C, 'Endah regal condo', 'Abuja', 'Nigeria', 'Foundation', 'Primary Certificate', 'B', 'Diploma in Computer Science', '1', '2014-03-23');
INSERT INTO `users_03312014` VALUES ('3', '9999999998', 'zahra', '12345', 'applicant', '234803659484', 'zahra@mannir.com', 'ZAHRA', 'MAIGARI', 'M', '1986-11-07', 0x6E756C6C, 'Endah Prominade', 'Lagos', 'Nigeria', 'Foundation', 'Higher Certificate', 'B', 'BSc (Hons) in S.E.', null, '2014-03-23');
INSERT INTO `users_03312014` VALUES ('4', '9999999997', 'jahara', '12345', 'applicant', '63828292287', 'jahara@mannir.com', 'JAHARA', 'MANNIR', 'M', '1982-03-05', 0x4465736572742E6A7067, 'Bukit Jalil', 'Bauchi', 'Nigeria', 'Certificate', 'Higher Certificate', 'C', 'Diploma in Computer Science', '', '2014-03-18');
INSERT INTO `users_03312014` VALUES ('5', '1234567890', 'mannir', '12345', 'applicant', '601123064474', 'manniru@gmail.com', 'MUHAMMAD', 'MANNIR', 'M', '1986-11-07', 0x4465736572742E6A7067, 'Kano Nigeria', 'Kano', 'Nigeria', 'Diploma', 'Higher Certificate', 'B', 'BSc (Hons) in S.E.', '', '2014-03-18');
INSERT INTO `users_03312014` VALUES ('6', '9999999998', 'zahra', '12345', 'applicant', '234803659484', 'zahra@mannir.com', 'Mannir2', 'MAIGARI', 'M', '1986-11-07', 0x706176696C696F6E5F6476375F647269766572732E706E67, 'Endah Prominade', 'null', 'Nigeria', 'Foundation', 'Higher Certificate', 'B', '4', '', '2014-03-18');
INSERT INTO `users_03312014` VALUES ('7', '9999999999', 'mannir', '1234', 'applicant', '601123064474', 'manniru@gmail.com', 'MANNIRU', 'AHMAD', 'M', '1982-11-07', 0x6A73702E706E67, 'Endah regal condo', 'Kano', 'Nigeria', 'Degree', 'Higher Certificate', 'D', 'BSc (Hons) in S.E.', '', '2014-03-23');
INSERT INTO `users_03312014` VALUES ('8', '9999999999', 'std', 'std', 'student', '601123064474', 'manniru@gmail.com', 'MANNIRU', 'AHMAD', 'M', '1982-11-07', '', 'Endah regal condo', 'Kano', 'Nigeria', 'Degree', 'Higher Certificate', 'D', 'BSc (Hons) in S.E.', '', '2014-03-23');
INSERT INTO `users_03312014` VALUES ('9', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 0x31, '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `users_03312014` VALUES ('10', 'Cigxs', 'manniru@gmail.com', 'Exjmz', null, 'Rxsmg', 'manniru@gmail.com', 'Muhammad Mannir', 'Ahmad', 'M', 'Mwtmd', '', 'Bukit Jalil', 'Kuala Lumpur', 'Nigeria', 'Diploma', 'Higher Certificate', 'C', 'BSc (Hons) Software Engineering', '', '2014-03-30');

-- ----------------------------
-- Table structure for `user_03312014`
-- ----------------------------
DROP TABLE IF EXISTS `user_03312014`;
CREATE TABLE `user_03312014` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `mobileno` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_03312014
-- ----------------------------
