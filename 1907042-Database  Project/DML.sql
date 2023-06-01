---//Insert into Users

INSERT INTO Users (User_Id, Name, Degree_Program, Contact, Address)
VALUES (1, 'Sornaly', 'Computer Science', '01876528976', 'Dhaka, Bangladesh');
INSERT INTO Users (User_Id, Name, Degree_Program, Contact, Address)
VALUES (2, 'Sabnaj', 'Electrical Engineering', '0173456789', 'New York, USA');


INSERT INTO Users (User_Id, Name, Degree_Program, Contact, Address)
VALUES (3, 'Arpita', 'Mechanical Engineering', '01876543210', 'London, UK');


INSERT INTO Users (User_Id, Name, Degree_Program, Contact, Address)
VALUES (4, 'Deya', 'Business Administration', '01876543610', 'Madrid, Spain');

INSERT INTO Users (User_Id, Name, Degree_Program, Contact, Address)
VALUES (5, 'Robert Johnson', 'History', '01876543210', 'Chicago, USA');

INSERT INTO Users (User_Id, Name, Degree_Program, Contact, Address)
VALUES (6, 'Emily Wilson', 'Psychology', '01876443210', 'Sydney, Australia');

INSERT INTO Users (User_Id, Name, Degree_Program, Contact, Address)
VALUES (7, 'Mohammed Ahmed', 'Mechanical Engineering', '01876543910','Dubai, UAE');

INSERT INTO Users (User_Id, Name, Degree_Program, Contact, Address)
VALUES (8, 'Raha', 'Chemical Engineering', '01676543910','Mirpur, Dhaka');

INSERT INTO Users (User_Id, Name, Degree_Program, Contact, Address)
VALUES (9, 'Samima', 'Software Engineering', '01677543910','Tejgaon, Dhaka');

INSERT INTO Users (User_Id, Name, Degree_Program, Contact, Address)
VALUES (10, 'Tuba', 'Textile Engineering', '01676743910','Khulna, Bangladesh');





---//Insert into Books

insert into Books values(1,101,  'English',     'shely',   '1st' );
insert into Books values(2,102,  'Islamiyat',    'sana',    '1st');
insert into Books values(3,103,  'stats',     'imran',   '1st');
insert into Books values(4,104,  'algebra',     'ali',    '1st');
insert into Books values(5,105,  'calculus',     'qadrii',   '1st');
insert into Books values(6,106,  'C++',      'ahmed',   '1st');
insert into Books values(7,107,  'basic mangement',   'tahir',   '1st');
insert into Books values(8,108,  'basic it',     'shafiq',   '1st');
insert into Books values(9,109,  'aconmics',     'nawaz',   '1st');
insert into Books values(10,110,  'accounting',    'jangir',   '1st');




---//Insert into Book_Issue

Insert into Book_Issue  Values (1,1,1,TO_DATE('2023-05-22', 'YYYY-MM-DD'),TO_DATE('2023-05-29', 'YYYY-MM-DD'));
Insert into Book_Issue  Values (2,2,2,TO_DATE('2023-05-25', 'YYYY-MM-DD'),TO_DATE('2023-05-29', 'YYYY-MM-DD'));
Insert into Book_Issue  Values (3,3,1,TO_DATE('2023-05-22', 'YYYY-MM-DD'),TO_DATE('2023-05-29', 'YYYY-MM-DD'));
Insert into Book_Issue  Values (4,4,5,TO_DATE('2023-05-25', 'YYYY-MM-DD'),TO_DATE('2023-05-30', 'YYYY-MM-DD'));
Insert into Book_Issue  Values (5,5,3,TO_DATE('2023-05-18', 'YYYY-MM-DD'),TO_DATE('2023-05-22', 'YYYY-MM-DD'));
Insert into Book_Issue  Values (6,6,2,TO_DATE('2023-05-02', 'YYYY-MM-DD'),TO_DATE('2023-05-15', 'YYYY-MM-DD'));
Insert into Book_Issue  Values (7,7,8,TO_DATE('2023-05-31', 'YYYY-MM-DD'),TO_DATE('2023-06-02', 'YYYY-MM-DD'));
Insert into Book_Issue  Values (8,8,1,TO_DATE('2023-05-22', 'YYYY-MM-DD'),TO_DATE('2023-05-28', 'YYYY-MM-DD'));
Insert into Book_Issue  Values (9,9,9,TO_DATE('2023-05-25', 'YYYY-MM-DD'),TO_DATE('2023-05-29', 'YYYY-MM-DD'));
Insert into Book_Issue  Values (10,10,6,TO_DATE('2023-05-21', 'YYYY-MM-DD'),TO_DATE('2023-05-29', 'YYYY-MM-DD'));




---//Insert into Fine

insert into Fine values (1,1,0);
insert into Fine values (2,2,0);
insert into Fine values (3,3,20);
insert into Fine values (4,3,0);
insert into Fine values (5,3,5);
insert into Fine values (6,5,15);
insert into Fine values (7,7,0);
insert into Fine values (8,3,17);
insert into Fine values (9,8,0);
insert into Fine values (10,2,28);

-- displaying all table using select command
select * from branch;

select * from Users;

select * from Books;

select * from Book_Issue;

select * from Fine;



--Retrieve all data of a Users of specific User_id:

select Name,Degree_Program,Contact,Address from Users where User_id=10;




---Nested query to find the User details  whose Fine is maximum

 select User_ID, Name,Degree_Program,Contact,Address from Users where User_ID= (select User_Id from Fine where Fine_Taka=(select max (Fine_Taka) from Fine));




----------------------------  join  ------------------------------

--Retrieve all Users with their corresponding Book Issue:
select a.Book_ID, a.User_Id, a.Date_Of_Issue,a.Date_Of_Return, b.fine_taka 
from Book_Issue a
join Fine b on a.User_Id= b.User_Id;




--------  aggregation function with having, group by  ------------

--Retrieve all User with a Fine greater than the average balance Fine accross all Users:
 select User_Id, Fine_Taka
from Fine 
where Fine_Taka > (select AVG(Fine_Taka) from Fine);


-- total Fine
select sum(Fine_Taka) as total_Fine_of_Users from Fine;


-- count User  where Borrow Book is Bangla 

select count(User_Id) as Borrowing_English_Book
from Book_Issue
where Book_Id in(
   select Book_Id
   from Books where Book_Name='English');





----------- union, intersect, and except ------------------

select Author_Name from Books where Book_Name like 'Englis' union all select Author_Name from Books where Book_Name like 'Accounting';

select Author_Name from Books where Book_Name like 'Englis' except all select Author_Name from Books where Book_Name like 'Accounting';


select Author_Name from Books where Book_Name like 'Englis' intersect all select Author_Name from Books where Book_Name like 'Accounting';

---------------------------- delete -------------------------

delete from fine where User_id=2;

---------------------------  update ----------------------

update Fine set Fine_Taka= 12 where User_id=7;



----- string operation  ----------------------


select * from Users  where Name like '%a%';




------------------------  view  -----------------------------

create view User_inf as select Name,Contact,Address from Users;

select *from User_inf;