CREATE DATABASE if not exists smapp;

USE smapp;

DROP TABLE if exists comments;
DROP TABLE if exists post;
DROP TABLE if exists users;

CREATE TABLE users (
		id INT(11) NOT NULL AUTO_INCREMENT,
		username VARCHAR(32) NOT NULL,
		password VARCHAR(64) NOT NULL,
		first_name VARCHAR(64) NOT NULL,
		last_name VARCHAR(64) NOT NULL,
		email VARCHAR(128) NOT NULL,
		phone_number VARCHAR(10),
		birth_date DATETIME,
		PRIMARY KEY(id)
);

CREATE TABLE post (
		id INT(11) NOT NULL AUTO_INCREMENT,
		users_id INT(11) NOT NULL,
		post TEXT NOT NULL,
		post_date DATETIME default CURRENT_TIMESTAMP,
		PRIMARY KEY(id),
		FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE comments (
		id INT(11) NOT NULL AUTO_INCREMENT,
		users_id INT(11) NOT NULL,
		post_id INT(11) NOT NULL,
		comment VARCHAR(500) NOT NULL,
		comment_date DATETIME default CURRENT_TIMESTAMP,
		PRIMARY KEY(id),
        FOREIGN KEY (post_id) REFERENCES post(id),
		FOREIGN KEY (users_id) REFERENCES users(id)
);
