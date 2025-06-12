create database learningPlus

use learningPlus
go
create table roles(
id int primary key,
name varchar(20) not null
)
go
create table users(
userId int primary key identity(1,1),
firstName varchar(20) not null,
lastName varchar(20) not null,
email varchar(50) not null,
mobileNumber numeric(10) not null,
profilePhoto varchar(200),
gender char(1) check(gender in('M','F')),
password varchar(20) not null,
roleId int,
membershipStatus varchar(20) check (membershipStatus in ('active','inactive')) default 'inactive',
membership_expiryDate date,
created_at datetime default GETDATE(),
updated_at datetime default GETDATE(),
constraint fk_Role foreign key(roleId) references roles(id) on delete set null
)
go