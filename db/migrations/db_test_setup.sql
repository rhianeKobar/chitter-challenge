CREATE DATABASE chitter_test;

CREATE TABLE users (
	id SERIAL PRIMARY KEY,	
	first_name VARCHAR(30), 
	last_name VARCHAR(30), 
	username VARCHAR(30), 
	email VARCHAR(100),  
	password VARCHAR(100)
);

CREATE TABLE peeps (
	id SERIAL PRIMARY KEY,	
	date TIMESTAMP, 
	message TEXT, 
	user_id INT, 
	CONSTRAINT fk_user FOREIGN KEY(user_id) REFERENCES users(id)
);