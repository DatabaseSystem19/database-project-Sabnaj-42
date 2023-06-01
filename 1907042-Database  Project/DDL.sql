create database Library_Management_System
use Library_Management_System

drop table Users;
drop table Books;
drop table Book_Issue;
drop table Book_Fine;


---//Table Users

create table Users(
User_Id int not null,
Name varchar(20),
Degree_Program varchar(25),
Contact varchar(15),
Address varchar(500),
primary key(User_Id)
);


---//Book Table

create table Books(
Book_Id int not null,
Book_Serial_Num int,
Book_Name varchar(50),
Author_Name varchar(50),
Book_Edition varchar(100),
primary key(Book_Id)
);

---//Book_Issues

create table Book_Issue(
Book_Issue_Id int,
Book_Id int,
User_Id int,
Date_Of_Issue date,
Date_Of_Return date,
primary key (Book_Issue_Id),
foreign key (User_Id) references Users(User_Id),
foreign key (Book_Id) references Books(Book_Id)
);

--//Book Fine

create table Fine(
User_Id int ,
Book_Id int,
Fine_Taka int,
primary key(User_Id),
foreign key (User_Id) references Users(User_Id),
foreign key (Book_Id) references Books(Book_Id)
);

desc Users;
desc Books;
desc Book_Issue;
desc Fine;

-- added an extra column to the Users table

alter table Users add address1 char(30);

desc Users;

--modify column"address1" definition of Users table

alter table Users modify address varchar2(30);

desc Users;

-- rename column"address1" to address2
alter table Users rename column address1 to address2;

desc Users;

--drop the address2 column from the Users table
alter table Users drop column address2;

desc Users;
