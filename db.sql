USE board;
DROP TABLE user;
DROP TABLE wt;
CREATE TABLE `user`(
	`id` varchar(10) NOT NULL,
	`password` varchar(15) NOT NULL,
	`phoneNumber` varchar(20) NOT NULL,
	`address` varchar(30) NOT NULL,
	`name` varchar(5) NOT NULL,
	`category` varchar(50),
	`block` varchar(50),
	PRIMARY KEY(`id`)
	);
INSERT INTO user(id, password, name) VALUES('t', 't', 't');
CREATE TABLE `wt`(
	`category` varchar(50) NOT NULL, 
	`write_id` varchar(50) NOT NULL,
	`write_title` varchar(50) NOT NULL,
	`write_content` varchar(50) NOT NULL,
	`img_data` MediumBLOB DEFAULT NULL,
	`sel` varchar(50) DEFAULT NULL, 
	`use` varchar(30) DEFAULT NULL,
	`date` datetime NOT NULL,
	`view` int(11) DEFAULT 0,
	`write_num` int(11) NOT NULL,
	`address` varchar(15) NOT NULL
	);

