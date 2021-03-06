create table users (
	user_id int(10) primary key auto_increment,
	user varchar(20),
	password varchar(20),
	birth_date date,
        city_id int(10),
	state tinyint(1)
);

create table books (
	book_id int(10) primary key auto_increment,
	name varchar(50),
	isbn varchar(20),
	pages int(4),
	author_id int(10),
	state tinyint(1),
	created_by int(10),
	publish_date date
);

create table authors (
	author_id int(10) primary key auto_increment,
	name varchar(40),
	apepat varchar(30),
	apemat varchar(30),
	birth_date date,
        state tinyint(1),
        nation_id int(10)
);

create table nationalities (
	nation_id int(10) primary key auto_increment,
	name varchar(20),
	state tinyint(1)
);
create table countries(
        country_id int(10) primary key not null auto_increment,
        name varchar(20),
        created_by int(10),
        state tinyint(1)
);

create table cities(
        city_id int(10) primary key not null auto_increment,
        name varchar(20),
        country_id int(10),
        state tinyint(1)
);
