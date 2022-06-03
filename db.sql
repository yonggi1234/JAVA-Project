USE board;
DROP TABLE user;
DROP TABLE wt;
CREATE TABLE `user`(
	`id` varchar(50) NOT NULL,
	`password` varchar(50) NOT NULL,
	`name` varchar(50) NOT NULL
	);
INSERT INTO user(id, password, name) VALUES('t', 't', 't');
CREATE TABLE `wt`(
	`category` varchar(50) NOT NULL, 
	`write_id` varchar(50) NOT NULL,
	`write_title` varchar(50) NOT NULL,
	`write_content` varchar(50) NOT NULL,
	`img` varchar(50) DEFAULT NULL,
	`img_data` MediumBLOB DEFAULT NULL,
	`sel` varchar(50) DEFAULT NULL, 
	`use` varchar(30) DEFAULT NULL,
	`date` datetime NOT NULL,
	`view` int(11) DEFAULT 0,
	`write_num` int(11) NOT NULL
	);
INSERT INTO wt VALUES('product', 't', 'test', 'tes', './img/hero.jpg', 'null', 'books', 'many', '2022-02-02 22:22:22', 0, 1);
INSERT INTO wt VALUES('product', 't', 'test2', 'tes2', './img/hero.jpg', 'null', 'books', 'soso', '2022-02-02 22:22:22', 0, 2);
INSERT INTO wt VALUES('product', 't', 'test3', 'tes3', './img/hero.jpg', 'null', 'books', 'no', '2022-02-02 22:22:22', 0, 3);
