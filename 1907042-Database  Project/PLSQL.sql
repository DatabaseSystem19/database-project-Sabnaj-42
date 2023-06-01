set pagesize 100
set linesize 150

----------------- PL/SQL  --------------------

-- Insert and set default value

set serverout on

declare

User_id Users.User_Id%type:=12;

User_Name Users.Name%type:='Ramisa';

User_Degree Users.Degree_Program%type:='Biomedical Engineering';

User_contact Users.Contact%type:='01777258450';

User_Address Users.Address%type:='Faridpur,Dhaka,Bangladesh';

begin

insert into Users values(User_id,User_Name,User_Degree,User_Contact,User_Address);

end;
/



--  Cursor and row count

-- count User_id 2 on Book_Issue table

declare

Cursor id_cursor is select * from Book_Issue where User_id like 2;
id_row Book_Issue%rowtype;
counter number;
begin

counter:=0;
open id_cursor;
fetch id_cursor into id_row.Book_Issue_id,id_row.User_id,id_row.Book_id,id_row.Date_of_issue ,id_row.Date_of_return;

while id_cursor%found loop
counter:=counter+1;
dbms_output.put_line('Book_issue_id : '|| id_row.Book_Issue_id || 'User_id'|| id_row.User_id|| 'Book_id '|| id_row.Book_Id || 'Date_of_issue : '|| id_row.Date_of_issue||'Date_Of_Return : '|| id_row.Date_of_return);
fetch id_cursor into id_row.Book_Issue_id,id_row.User_id,id_row.Book_id,id_row.Date_of_issue ,id_row.Date_of_return;
end loop;

dbms_output.put_line('user of id 2 : '|| counter);
close id_cursor;
end;
/

---- using array


declare 

counter number;

uname Users.Name%type;
TYPE NAMEARRAY IS VARRAY(12) OF Users.Name%type;

A_NAME NAMEARRAY:=NAMEARRAY();

begin
counter:=1;
for x in 0..10

loop
select Name into uname from Users where User_Id=1+x;
A_NAME.EXTEND();
A_NAME(counter):=uname;
counter:=counter+1;

end loop;
counter:=1;

while counter<=A_NAME.count
  loop
  dbms_output.put_line(A_NAME(counter));
  counter:=counter+1;
  end loop;
end;
/

-- 

---Retriving User name and Book Name for which the fine is maximum

CREATE OR REPLACE PROCEDURE proc2(
  var1 OUT VARCHAR2,
  var2 OUT VARCHAR2
)
AS
BEGIN
  SELECT Name INTO var2  from Users where User_ID= (select User_Id from Fine where Fine_Taka=(select max (Fine_Taka) from Fine));

  DBMS_OUTPUT.PUT_LINE('Name of The User of Maximum Fine :' || var2);

 SELECT Book_Name INTO var1  from Books where Book_id=(select Book_id from Fine where Fine_Taka= (select max (Fine_Taka) from Fine));
  DBMS_OUTPUT.PUT_LINE('Name of The Book of Maximum Fine :' || var1);

END;
/

set serveroutput on
declare 
var1 Users.Name%type;
var2 Books.Book_Name%type;
begin
proc2(var1 ,var2 );
end;
/

