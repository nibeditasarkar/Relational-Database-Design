---- DATABASE CREATION ----
create database Relational_Database_design_Project;
use Relational_Database_design_Project;

---- TABLE CREATION -----

/*Role Table*/
create table role
(
	id int primary key,
	role_name varchar(100)
);

/*Status Table*/
create table status
(
	id int primary key,
	status_name varchar(100),
	is_user_working bit
);

/*User Account Table*/
create table user_account
(
	id int primary key,
	user_name varchar(100),
	email varchar(254),
	password varchar(200),
	password_salt varchar(50) null,
	password_hash_algorithm varchar(50)
);

/*User Has Role  Table*/
create table user_has_role
(
	id int primary key,
	role_start_time timestamp,
	role_end_time datetime Null,
	user_account_id int,
	role_id int,
	constraint fk_role_id foreign key(role_id) references role(id),
	constraint fk_user_account_id1 foreign key(user_account_id) references user_account(id)
);

/*User Has Status Table*/
CREATE TABLE user_has_status
(
    id INT PRIMARY KEY,
    status_start_time DATETIME,
    status_end_time DATETIME NULL,
    user_account_id INT,
    status_id INT,
    CONSTRAINT fk_user_account_id FOREIGN KEY(user_account_id) REFERENCES user_account(id),
    CONSTRAINT fk_status_id FOREIGN KEY(status_id) REFERENCES status(id)
);

---- INSERTING DATA INTO TABLES ----

/*Table: role*/
INSERT INTO role (id, role_name)
VALUES (1, 'Admin'), (2, 'User');

/*Table: status*/
INSERT INTO status (id, status_name, is_user_working)
VALUES (1, 'Active', 1), (2, 'Inactive', 0);

/*Table: user_account*/
INSERT INTO user_account (id, user_name, email, password, password_salt, password_hash_algorithm)
VALUES (1, 'JohnDoe', 'john.doe@example.com', 'password123', 'somesalt', 'SHA256'), 
       (2, 'JaneSmith', 'jane.smith@example.com', 'pass456', 'anothersalt', 'SHA512');

/*Table: user_has_role*/
INSERT INTO user_has_role (id, role_start_time, role_end_time, user_account_id, role_id)
VALUES (1, DEFAULT, NULL, 1, 1), (2, DEFAULT, NULL, 2, 2);

/*Table: user_has_status*/
INSERT INTO user_has_status (id, status_start_time, status_end_time, user_account_id, status_id)
VALUES (1, CURRENT_TIMESTAMP, NULL, 1, 1), (2, CURRENT_TIMESTAMP, NULL, 2, 2);



---- DISPLAYING THE TABLES ----
SELECT * FROM role; 
SELECT * FROM status;
SELECT * FROM user_account;
SELECT * FROM user_has_role;
SELECT * FROM user_has_status;



---- DROPIING FOREIGN KEY CONSTRAINTS ----
alter table user_has_role
drop constraint fk_role_id;

alter table user_has_role
drop constraint fk_user_account_id1;

alter table user_has_status
drop constraint fk_user_account_id;

alter table user_has_status
drop constraint fk_status_id;



--Delete Data from TABLE--

-- Deleting data from the role table
DELETE FROM role;
-- Deleting data from the status table
DELETE FROM status;
-- Deleting data from the user_account table
DELETE FROM user_account;
-- Deleting data from the user_has_role table
DELETE FROM user_has_role;
-- Deleting data from the user_has_status table
DELETE FROM user_has_status;


---- DISPLAYING TABLE AFTER DELETING ALL THE DATA ----
SELECT * FROM role; 
SELECT * FROM status;
SELECT * FROM user_account;
SELECT * FROM user_has_role;
SELECT * FROM user_has_status;