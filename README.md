# Prueba de Programacion 2
Proyecto CRUD realizado en java web para el ramo Programacion II en
INACAP. 2016, Punta Arenas.

## Estructura de la base de datos
>create table users (
>	user_id int(10) primary key auto_increment,
>	user varchar(20),
>	password varchar(20),
>	birth_date date,
>	state tinyint(1)
>);

>create table books (
>	book_id int(10) primary key auto_increment,
>	name varchar(50),
>	isbn varchar(20),
>	pages int(4),
>	author_id int(10),
>	state tinyint(1),
>	created_by int(10),
>	publish_date date
>);

>create table authors (
>	author_id int(10) primary key auto_increment,
>	name varchar(40),
>	apepat varchar(30),
>	apemat varchar(30),
>	birth_date date,
> state tinyint(1)
>);

>create table nationalities (
>	nation_id int(10) primary key auto_increment,
>	name varchar(20),
>	state tinyint(1)
>);

## Librerias externas
Todo el css y el javascript se encuentra local. (Bootstrap, jQuery, bootstrap-datetimepicker)

## Autores:
1. Andres Otero
2. Fabián Vásquez
