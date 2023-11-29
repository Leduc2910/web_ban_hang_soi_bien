create database store;
use store;
create table product (
                         id int not null auto_increment primary key,
                         name varchar(255) not null ,
                         brand varchar(255) not null ,
                         unit varchar(50) not null ,
                         weight double not null ,
                         price int default 0,
                         description text not null ,
                         image text not null,
                         idCategory int not null
);
create table category (
                          id int not null auto_increment primary key ,
                          name varchar(255) not null
);
create table user (
                      id int not null auto_increment primary key ,
                      phoneNumber varchar(20) not null unique,
                      password varchar(50) not null
);
alter table product
add foreign key (idCategory) references category(id);

