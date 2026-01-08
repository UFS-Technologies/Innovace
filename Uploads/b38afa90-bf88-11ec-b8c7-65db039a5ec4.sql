DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AccountGroup_Typeahead`( In Group_Name_ varchar(100))
Begin 
 set Group_Name_ = Concat( '%',Group_Name_ ,'%');
 SELECT  Account_Group_Id,
Group_Name From Account_Group 
where Group_Name like Group_Name_ and DeleteStatus=false 
 ORDER BY Group_Name Asc ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Activate_Application`(In Application_details_Id_ int,Student_Id_ int  )
BEGIN
Update application_details set Activation_Status = false
where Student_Id = Student_Id_;
Update application_details_history set Activation_Status = false
where Student_Id = Student_Id_;
Update application_details set Activation_Status = true
where Application_details_Id = Application_details_Id_;
Update application_details_history set Activation_Status = true
where Application_details_Id = Application_details_Id_;
select Application_details_Id_;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Agent_Login`( In User_Name_ VARCHAR(50),in Password_ VARCHAR(50))
BEGIN
SELECT 
Client_Accounts_Name,Client_Accounts_Id
From client_accounts 
 where 
 Client_Accounts_Name =User_Name_ and State=Password_;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Agent_Typeahead`( In Client_Accounts_Name_ varchar(100))
Begin
 set Client_Accounts_Name_ = Concat( '%',Client_Accounts_Name_ ,'%');
select  client_accounts.Client_Accounts_Id,Client_Accounts_Name
From client_accounts
where Client_Accounts_Name like Client_Accounts_Name_  and client_accounts.DeleteStatus=false and Account_Group_Id=13
order by Client_Accounts_Name asc  limit 5  ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Check_Agent_Mail`( In Email_ varchar(25))
Begin 
 SELECT Client_Accounts_Id, Client_Accounts_Name,State Password 
 From client_accounts where Email =Email_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Check_Duplicate_Student`(In Phone_Number_ varchar(25))
BEGIN
declare Student_Id_ int;declare Duplicate_Department_Name varchar(50);declare Duplicate_Remark_Name varchar(2000);
declare Duplicate_Department_Id_ int;declare Duplicate_Remark_Id_ int;declare Duplicate_FollowUp_Date datetime;
declare Duplicate_Registration int;declare Duplicate_Welcome_Status int;
declare Department_Status int;declare Duplicate_Student_Name varchar(25); declare Duplicate_User_Name varchar(25); declare Duplicate_User_Id int;
Set Student_Id_ = (select Student_Id from Student where  DeleteStatus=false and (Phone_Number like concat('%',Phone_Number_,'%')
        or Alternative_Phone_Number like concat('%',Phone_Number_,'%') or Whatsapp  like concat('%',Phone_Number_,'%') )  limit 1);
if(Student_Id_>0) then
		set Duplicate_User_Id = (select User_Id from Student where Student_Id = Student_Id_ and DeleteStatus=false );
		set Duplicate_Department_Id_ = (select Department from Student where Student_Id = Student_Id_ and DeleteStatus=false);
		set Duplicate_FollowUp_Date = (select Next_FollowUp_date from Student where Student_Id = Student_Id_ and DeleteStatus=false);
		set Duplicate_Student_Name = (select Student_Name from Student where Student_Id = Student_Id_ and DeleteStatus=false );
		set Duplicate_User_Name = (select User_Details_Name from user_details where User_Details_Id = Duplicate_User_Id and DeleteStatus=false );
		set Duplicate_Department_Name=(select Department_Name from department where Department_Id = Duplicate_Department_Id_ and Is_Delete=false);
		set Duplicate_Remark_Name=(select Remark from student where Student_Id = Student_Id_ and DeleteStatus=false);
		set Department_Status=(select FollowUp from department where Department_Id = Duplicate_Department_Id_ and Is_Delete=false);
end if;

select Student_Id_,Duplicate_Student_Name,Duplicate_User_Name,(Date_Format(Duplicate_FollowUp_Date,'%d-%m-%Y ')) as Duplicate_FollowUp_Date
,Duplicate_Department_Name,Duplicate_Remark_Name,Duplicate_Registration,Duplicate_Welcome_Status,Department_Status;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Check_Student_Mail`( In Email_ varchar(25))
Begin 
 SELECT Student_Id, Student_Name,Password 
 From student where Email =Email_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Account_Group`( In Account_Group_Id_ Int)
Begin 
	declare DeleteStatus_ bit;
	if exists(select Client_Accounts.Account_Group_Id  from Client_Accounts where DeleteStatus=False and Account_Group_Id =Account_Group_Id_ )
	then
		set DeleteStatus_=0;
	else
		update Account_Group set DeleteStatus=true where Account_Group_Id =Account_Group_Id_ ;
		set DeleteStatus_=1;
	end if;
select DeleteStatus_;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Agent`( In Client_Accounts_Id_ Int)
Begin 

  declare DeleteStatus_ bit;

update Client_Accounts set DeleteStatus=True where Client_Accounts.Client_Accounts_Id=Client_Accounts_Id_;
update Employee_Details set DeleteStatus=true where Client_Accounts_Id =Client_Accounts_Id_ ;
#update Employee_Location set DeleteStatus=true where Client_Accounts_Id =Client_Accounts_Id_ ;
set DeleteStatus_=True;

select DeleteStatus_;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Agent_Details`( In Agent_Id_ Int)
Begin 
 update agent set DeleteStatus=true where Agent_Id = Agent_Id_ ;
 select Agent_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Application_Details`( In Application_details_Id_ Int)
Begin 
 Declare DeleteStatus_ tinyint; 
 update application_details set DeleteStatus=true where Application_details_Id =Application_details_Id_ ;
 set DeleteStatus_=1; 
 select DeleteStatus_; 
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Application_Document`( In Application_Document_Id_ Int)
Begin 
 update application_document set DeleteStatus=true where Application_Document_Id =Application_Document_Id_ ;
 select Application_Document_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Branch`( In Branch_Id_ Int)
Begin 
 update Branch set Is_Delete=true where Branch_Id =Branch_Id_ ;
 SELECT Branch_Id  From Branch where Branch_Id =Branch_Id_  ;
 
 delete from Branch_Department where Branch_id=Branch_Id_;
 select Branch_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Check_List`( In Check_List_Id_ Int)
Begin 
 update check_list set DeleteStatus=true where Check_List_Id =Check_List_Id_ ;
 select Check_List_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Client_Accounts`( In Client_Accounts_Id_ Int)
Begin 

  declare DeleteStatus_ bit;

update Client_Accounts set DeleteStatus=True where Client_Accounts.Client_Accounts_Id=Client_Accounts_Id_;
update Employee_Details set DeleteStatus=true where Client_Accounts_Id =Client_Accounts_Id_ ;
#update Employee_Location set DeleteStatus=true where Client_Accounts_Id =Client_Accounts_Id_ ;
set DeleteStatus_=True;

select DeleteStatus_;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Company`( In Company_Id_ Int)
Begin 
 update Company set Is_Delete=true where Company_Id =Company_Id_ ;
 SELECT Company_Id  From Company where Company_Id =Company_Id_  ;
 select Company_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Country`( In Country_Id_ Int)
Begin 
 update Country set DeleteStatus=true where Country_Id =Country_Id_ ;
 select Country_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Course`( In Course_Id_ Int)
Begin 
 update Course set DeleteStatus=true where Course_Id =Course_Id_ ;
 select Course_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Course_Intake`( In Course_Intake_Id_ Int)
Begin 
 update Course_Intake set DeleteStatus=true where Course_Intake_Id =Course_Intake_Id_ ;
 select Course_Intake_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Data`()
BEGIN
declare DeleteStatus_ bit;
		delete from student ;
        delete from student_followup ;
		delete from student_course_selection;
        delete from fees_receipt;
		delete from feesreceipt_document;
        delete from application_details;
		delete from application_details_history;
        delete from visa;
        delete from visa_document;
        
        set DeleteStatus_=1;
	select DeleteStatus_ as Deletefiles;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Department`( In Department_Id_ Int)
Begin 
 update Department set Is_Delete=true where Department_Id =Department_Id_ ;
 SELECT Department_Id  From Department where Department_Id =Department_Id_  ;
delete from Status_Selection where department_id=Department_Id_;
 select Department_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Department_Status`( In Department_Status_Id_ Int)
Begin 
 update Department_Status set Is_Delete=true where Department_Status_Id =Department_Status_Id_ ;
 SELECT Department_Status_Id  From Department_Status where Department_Status_Id =Department_Status_Id_  ;
 select Department_Status_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Document`( In Document_Id_ Int)
Begin 
 update Document set DeleteStatus=true where Document_Id =Document_Id_ ;
 select Document_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Duration`( In Duration_Id_ Int)
Begin 
 update Duration set DeleteStatus=true where Duration_Id =Duration_Id_ ;
 select Duration_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Enquiry_Source`( In Enquiry_Source_Id_ Int)
Begin 
 update Enquiry_Source set DeleteStatus=true where Enquiry_Source_Id =Enquiry_Source_Id_ ;
 select Enquiry_Source_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Fees`( In Fees_Id_ Int)
Begin 
 update fees set DeleteStatus=true where Fees_Id =Fees_Id_ ;
 select Fees_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_FeesRecepit_Document`( In Feesreceipt_document_Id_ Int)
Begin 
 update feesreceipt_document set DeleteStatus=true where Feesreceipt_document_Id =Feesreceipt_document_Id_ ;
 select Feesreceipt_document_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Intake`( In Intake_Id_ Int)
Begin 
 update Intake set DeleteStatus=true where Intake_Id =Intake_Id_ ;
 select Intake_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Internship`( In Internship_Id_ Int)
Begin 
 update Internship set DeleteStatus=true where Internship_Id =Internship_Id_ ;
 select Internship_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Invoice`( In Invoice_Id_ Int)
Begin
 update Invoice set DeleteStatus=true where Invoice_Id =Invoice_Id_ ;
 update Invoice_document set DeleteStatus=true where Invoice_Id =Invoice_Id_ ;
 select Invoice_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Invoice_Document`( In Invoice_Document_Id_ Int)
Begin
 update Invoice_document set DeleteStatus=true where Invoice_Document_Id =Invoice_Document_Id_ ;
 select Invoice_Document_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Level_Detail`( In Level_Detail_Id_ Int)
Begin 
 update Level_Detail set DeleteStatus=true where Level_Detail_Id =Level_Detail_Id_ ;
 select Level_Detail_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Receipt`( In Fees_Receipt_Id_ Int)
Begin 
 update fees_receipt set Delete_Status=true where Fees_Receipt_Id =Fees_Receipt_Id_ ;
 select Fees_Receipt_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Remarks`( In Remarks_Id_ Int)
Begin 
 update Remarks set DeleteStatus=true where Remarks_Id =Remarks_Id_ ;
 select Remarks_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Student`( In Student_Id_ Int)
Begin 
 update Student set DeleteStatus=true where Student_Id =Student_Id_ ;
 update student_followup set DeleteStatus=true where Student_Id =Student_Id_ ;
 select Student_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Student_Document`( In Student_Document_Id_ Int)
Begin 
 update Student_Document set DeleteStatus=true where Student_Document_Id =Student_Document_Id_ ;
 select Student_Document_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Student_File`( In Student_Id_ Int, File_Name_ varchar(100) )
Begin 
if File_Name_='Passport_Copy'
then
 update Student set Passport_Copy='', Passport_Copy_File_Name='' where Student_Id =Student_Id_ ;
 elseif File_Name_='IELTS' then
 update Student set IELTS='' , IELTS_File_Name='' where Student_Id =Student_Id_ ;
 elseif File_Name_='Passport_Photo' then
 update Student set Passport_Photo='',Passport_Photo_File_Name=''  where Student_Id =Student_Id_ ;
 elseif File_Name_='Tenth_Certificate' then
 update Student set Tenth_Certificate='' ,Tenth_Certificate_File_Name=''  where Student_Id =Student_Id_ ;
 elseif File_Name_='Work_Experience' then
 update Student set Work_Experience='' ,Work_Experience_File_Name='' where Student_Id =Student_Id_ ;
 elseif File_Name_='Resume' then
 update Student set Resume='', Resume_File_Name=''  where Student_Id =Student_Id_ ;
 end if;
 
 select Student_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Student_Message`( In Student_Message_Id_ Int)
Begin 
 update Student_Message set DeleteStatus=true where Student_Message_Id =Student_Message_Id_ ;
 select Student_Message_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Student_Report`( In Student_ JSON)
Begin 
declare Student_Id_J int;declare i int;
set i=0;
WHILE i < JSON_LENGTH(Student_) DO
	#SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Student_Id')) INTO Student_Id_J; 
    SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,CONCAT('$[',i,'].Student_Id'))) INTO Student_Id_J;
  
		if( Student_Id_J>0 ) then
			update student_followup set DeleteStatus=1 where Student_Id= Student_Id_J ; 
			
            Update student set DeleteStatus=1 where Student_Id=Student_Id_J;
	    end if;
	SELECT i + 1 INTO i;  
end while;    
 select Student_Id_J;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Student_Status`( In Student_Status_Id_ Int)
Begin 
 update Student_Status set DeleteStatus=true where Student_Status_Id =Student_Status_Id_ ;
 select Student_Status_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Subject`( In Subject_Id_ Int)
Begin 
 update Subject set DeleteStatus=true where Subject_Id =Subject_Id_ ;
 select Subject_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Sub_Section`( In Sub_Section_Id_ Int)
Begin 
 update Sub_Section set DeleteStatus=true where Sub_Section_Id = Sub_Section_Id_ ;
 select Sub_Section_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_University`( In University_Id_ Int)
Begin 
 update University set DeleteStatus=true where University_Id =University_Id_ ;
 update University_Photos set DeleteStatus=true where University_Id =University_Id_ ;
 select University_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_User_Details`( In User_Details_Id_ Int)
Begin 
declare By_User_count int;declare To_User_count int;
set By_User_count = (SELECT  COALESCE( count(By_User_Id ),0) FROM student_followup where By_User_Id=User_Details_Id_);
set To_User_count = (SELECT  COALESCE( count(User_Id ),0) FROM student_followup where User_Id=User_Details_Id_ );
if(By_User_count = 0 && To_User_count = 0) then
	update User_Menu_Selection set DeleteStatus=true where User_Id =User_Details_Id_ ;
	update user_department set Is_Delete=true where User_Id =User_Details_Id_ ;
	update User_Details set DeleteStatus=true where User_Details_Id =User_Details_Id_ ;
	set User_Details_Id_ =1;
 else
	 set User_Details_Id_ =-2;
end if;
	select User_Details_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_User_Role`( In User_Role_Id_ Int)
Begin 
	declare DeleteStatus_ bit;
	if exists(select user_details.Role_Id  from user_details where DeleteStatus=False and Role_Id =User_Role_Id_ )
	then
		set DeleteStatus_=0;
	else
		update user_role set Is_Delete=true where User_Role_Id =User_Role_Id_ ;
		set DeleteStatus_=1;
	end if;
select DeleteStatus_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Visa`( In Visa_Id_ Int)
Begin
 update visa set DeleteStatus=true where Visa_Id =Visa_Id_ ;
 update visa_document set DeleteStatus=true where Visa_Id =Visa_Id_ ;
 select Visa_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Visa_Document`( In Visa_Document_Id_ Int)
Begin
 update visa_document set DeleteStatus=true where Visa_Document_Id =Visa_Document_Id_ ;
 select Visa_Document_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Dropdown_Branch`( )
BEGIN

SELECT 
Branch_Id,Branch_Name
From Branch
 where Is_Delete=false
ORDER BY Branch_Name ASC;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Dropdown_Department`()
BEGIN
SELECT 
Department_Id,Department_Name
From Department where Is_Delete=0
 
ORDER BY Department_Name ASC;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Dropdown_Users`()
BEGIN
SELECT 
User_Details_Id,User_Details_Name
From user_details
 where DeleteStatus=false
ORDER BY User_Details_Name ASC;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Fees_Typeahead`( In Fees_Name_ varchar(100))
Begin
 set Fees_Name_ = Concat( '%',Fees_Name_ ,'%');
select  fees.Fees_Id,Fees_Name
From fees
where Fees_Name like Fees_Name_  and fees.DeleteStatus=false
order by Fees_Name asc  limit 5  ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `FollowUp_Summary`(In  Department_String varchar(1000),RoleId_ varchar(100), By_User_ int,Login_User_Id_ int)
BEGIN
declare Search_Date_ varchar(500);declare User_Type_ int;
declare SearchbyName_Value varchar(2000);
set SearchbyName_Value='';
set Search_Date_=concat( " and date(student.Next_FollowUp_Date) < '", Date_Format( Now(),'%Y-%m-%d'),"'" );
set User_Type_=(select User_Type from user_details where User_Details_Id=Login_User_Id_);
if By_User_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.User_Id =",By_User_);
end if;
if User_Type_=2 then
 	SET SearchbyName_Value =concat(SearchbyName_Value," and student.User_Id =",Login_User_Id_);
    else
    SET SearchbyName_Value =concat(SearchbyName_Value," and student.User_Id in (select User_Details_Id from user_details where Branch_Id in (select
distinct Branch_Id from user_department where User_Id =",Login_User_Id_," and VIew_All=1))");
end if;
SET @query = Concat( "select  User_Details_Name To_Staff,count(student.Student_Id) as Pending,User_Id User_Details_Id
from student 
where student.DeleteStatus=0 and FollowUp=1 ",SearchbyName_Value," ",Search_Date_, "  ",Department_String,"
and student.Role_Id in(",RoleId_,")
group by student.User_Id
order by Next_FollowUp_Date asc ");
PREPARE QUERY FROM @query;
#select @query;
EXECUTE QUERY;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Account_Group`( In Account_Group_Id_ Int)
Begin 
 SELECT Account_Group_Id,
Primary_Id,
Group_Code,
Group_Name,
Link_Left,
Link_Right,
Under_Group,
IsPrimary,
CanDelete,
UserId From Account_Group where Account_Group_Id =Account_Group_Id_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Agent`( In Client_Accounts_Id_ Int)
Begin 
 SELECT 
Address1,Address2,
 Address3,Address4,Mobile
From Client_Accounts 
where Client_Accounts_Id =Client_Accounts_Id_ and Client_Accounts.DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_ApplicationDetails`( In Student_Id_ Int)
Begin
SELECT Application_details_Id ,Student_Id,Country_Id,
 Country_Name,University_Id,University_Name,Course_Id,Course_Name,intake_Id,
 intake_Name,Intake_Year_Id,Intake_Year_Name,Student_Reference_Id,Application_No,
 Date_Of_Applying, (Date_Format(Date_Of_Applying,'%d-%m-%y')) as Grid_Date ,Remark,Application_status_Id,
 Application_Status_Name,Agent_Id,Agent_Name,Reference_No,Activation_Status
 From application_details 
 where Student_Id =Student_Id_ and DeleteStatus=false ;
 /*select Application_Document_Id,File_Name,Document_Name,0 New_Entry, 
 Document_File_Name,application_document.Application_details_Id from application_document
 inner join application_details on application_details.Student_Id = application_document.Student_Id
 where application_document.Student_Id =Student_Id_ and application_document.DeleteStatus=false order by Document_Id;*/
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_ApplicationDetailswise_History`( In Application_details_Id_ Int)
Begin
 SELECT  Application_details_history_Id,Application_details_Id,Student_Id,Country_Id,
 Country_Name,University_Id,University_Name,Course_Id,Course_Name,intake_Id,
 intake_Name,Intake_Year_Id,Intake_Year_Name,
 Date_Of_Applying, (Date_Format(Date_Of_Applying,'%d-%m-%Y')) as Grid_Date ,Remark,Application_status_Id,
 Application_Status_Name,Agent_Id,Agent_Name
 From application_details_history where Application_details_Id =Application_details_Id_ and DeleteStatus=false 
 Order by Application_details_history_Id asc;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_ApplicationDetails_History`( In Student_Id_ Int)
Begin
 SELECT  Application_details_history_Id,Application_details_Id,Student_Id,Country_Id,
 Country_Name,University_Id,University_Name,Course_Id,Course_Name,intake_Id,
 intake_Name,Intake_Year_Id,Intake_Year_Name,
 Date_Of_Applying, (Date_Format(Date_Of_Applying,'%d-%m-%Y')) as Grid_Date ,Remark,Application_status_Id,
 Application_Status_Name,Agent_Id,Agent_Name
 From application_details_history where Student_Id =Student_Id_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Application_DocumentList`( In Application_details_Id_ Int)
Begin
select Application_Document_Id,ApplicationFile_Name,ApplicationDocument_Name,0 New_Entry, 
 ApplicationDocument_File_Name,application_document.Application_details_Id from application_document
 where Application_details_Id =Application_details_Id_ and DeleteStatus=false order by ApplicationDocument_Id;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Branch_Department_Edit`( In Branch_Id_ Int)
Begin 
 SELECT Department.Department_Id ,Department_Name,
 case when Branch_Department.Department_Id>0 then 1 else 0 end as Check_Box
  From Department left join Branch_Department on
  Department.Department_Id=Branch_Department.Department_Id
  and Branch_Id =Branch_Id_ where 
  Department.Is_Delete=false order by Department_Order ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Checklist`()
Begin
 SELECT Check_List_Id,Check_List_Name,Applicable,Checklist_Status
 From check_list
 where DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Check_List`( In Check_List_Id_ Int)
Begin 
 SELECT Check_List_Id,
Check_List_Name From check_list where Check_List_Id =Check_List_Id_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Client_Accounts`( In Client_Accounts_Id_ Int)
Begin 
 SELECT 
Address1,Address2,
 Address3,Address4,Mobile
From Client_Accounts 
where Client_Accounts_Id =Client_Accounts_Id_ and Client_Accounts.DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Company`()
Begin 
 SELECT Company_Id ,
companyname ,
Phone1 ,
Phone2 ,
Mobile ,
Website,
Email,
Address1,
Address2,
Address3,
Logo
 From Company where  Is_Delete=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Country`( In Country_Id_ Int)
Begin 
 SELECT Country_Id,
Country_Name From Country where Country_Id =Country_Id_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Course`( In Course_Id_ Int)
Begin 
 SELECT Course_Id,
Course_Name,
Subject_Id,
Sub_Section_Id ,
Duration_Id,
Level_Id,
Ielts_Minimum_Score,
Internship_Id,
Notes,
Details,
Application_Fees,
Tution_Fees ,
Entry_Requirement,
Living_Expense,
Work_Experience,
IELTS_Name,
Intake_Name,
University_Id,
Country_Id,
Tag,
Course_Status,
Intake_Name,
Tution_Fees,
Entry_Requirement,
IELTS_Name,
Duration,
Living_Expense,
Work_Experience,
Registration_Fees,
Date_Charges,
Bank_Statements,
Insurance,
VFS_Charges,
Apostille,
Other_Charges
 From Course where Course_Id =Course_Id_ and DeleteStatus=false ;

  SELECT  case when  Intake_Status=1 then true else false end as Intake_Status , case when  Course_intake_id>0 then true else false end as Intake_Selection
  ,Intake_Name,intake.Intake_Id from Intake left join  course_intake on course_intake.Intake_Id=intake.Intake_Id
  and course_intake.course_id =course_id_
  order by Intake_Name ;
  
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Course_Import`( In Import_Master_Id_ Int)
Begin 
 SELECT 
Course_Name Course,
Subject_Name Subject,
Duration_Name Duration ,
Level_Id Level,
Ielts_Minimum_Score Ielts,
Internship_Name Internship,
Notes,
Details,
Application_Fees Fees,
University_Name University,
Country_Name Country,
Tag ,
Tution_Fees,
Entry_Requirement,
Duration,
Living_Expense,
Work_Experience
From Course
inner join import_detail on course.Course_Id=import_detail.Course_Id and import_detail.Import_Master_Id=Import_Master_Id_ 
inner join subject on  course.Subject_Id=subject.Subject_Id
inner join duration on course.Duration_Id=duration.Duration_Id
inner join level_detail on course.Level_Id=level_detail.Level_Detail_Id
inner join ielts on course.Ielts_Minimum_Score=ielts.Minimum_Score
inner join internship on course.Internship_Id=internship.Internship_Id
inner join university on course.University_Id=university.University_Id
inner join country on course.Country_Id=country.Country_Id ;


 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Course_Intake`( In Course_Intake_Id_ Int)
Begin 
 SELECT Course_Id,
Intake_Id From Course_Intake where Course_Intake_Id =Course_Intake_Id_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Course_Load_Data`()
BEGIN
SELECT Internship_Id,Internship_Name From internship where  DeleteStatus=false  order by Internship_Name asc ;
SELECT Ielts_Id,Ielts_Name From ielts  where  DeleteStatus=false order by  Ielts_Name asc ;
SELECT Duration_Id,Duration_Name From duration where  DeleteStatus=false  order by Duration_Name asc ;
SELECT Level_Detail_Id,Level_Detail_Name From level_detail where  DeleteStatus=false  order by Level_Detail_Name asc ;
SELECT Student_Status_Id,Student_Status_Name From student_status where  DeleteStatus=false  order by Student_Status_Name asc; 
SELECT Enquiry_Source_Id,Enquiry_Source_Name From enquiry_source where  DeleteStatus=false  order by Enquiry_Source_Name asc; 

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Dashboard_Count`(In RoleId_ varchar(100),Department_String varchar(4000),Login_User_Id_ int)
BEGIN
declare Fromdate_ date;declare Todate_ date;
declare Search_Date_ varchar(200);declare User_Type_ int;declare curday int;
set Fromdate_=now();
set Todate_=now();
set curday=(SELECT DAY(Fromdate_)-1);
set Fromdate_=(SELECT DATE_SUB(Fromdate_, INTERVAL curday DAY));
set Search_Date_='';
set User_Type_=(select User_Type from user_details where User_Details_Id=Login_User_Id_);
set Search_Date_=concat( " and date(student.Entry_Date) >= '", Fromdate_ ,"' and  date(student.Entry_Date) <= '", Todate_,"'");
if User_Type_=2 then
  SET Department_String =concat(Department_String," and student.User_Id =",Login_User_Id_);
    else
    SET Department_String =concat(Department_String," and student.User_Id in (select User_Details_Id from user_details where Branch_Id in (select
distinct Branch_Id from user_department where User_Id =",Login_User_Id_," and VIew_All=1))");
end if;
SET @query = Concat( "  
select 1 as tp,count(student.Student_Id) as Data_Count from student
inner join Department on Department.Department_Id= student.Department  ",Department_String,"
inner join user_details on user_details.User_Details_Id=student.Created_By
where student.DeleteStatus=0     and date(student.Entry_Date) >= '", Fromdate_ ,"' and  date(student.Entry_Date) <= '", Todate_,"'
and user_details.Role_Id in(",RoleId_,")  
   union
    select 2 as tp,count(student.Student_Id) as Data_Count from student
inner join Department on Department.Department_Id= student.Department  ",Department_String,"
inner join user_details on user_details.User_Details_Id=student.Created_By
where student.DeleteStatus=0 and  student.Is_Registered=1    and date(student.Registered_On) >= '", Fromdate_ ,"' and  date(student.Registered_On) <= '", Todate_,"'
and user_details.Role_Id in(",RoleId_,")    
union
    select 3 as tp,count(student.Student_Id) as Data_Count from student
inner join Department on Department.Department_Id= student.Department  ",Department_String,"
inner join user_details on user_details.User_Details_Id=student.User_Id
where student.DeleteStatus=0 and department.FollowUp=1   and date(student.Next_FollowUp_Date) <'",  Todate_,"'
and user_details.Role_Id in(",RoleId_,")
union

 select 4 as tp,COALESCE(sum(Fees_Receipt.Amount),0) as Data_Count from student
inner join Department on Department.Department_Id= student.Department  ",Department_String,"
inner join Fees_Receipt on Fees_Receipt.Student_Id=student.Student_Id
inner join user_details on user_details.User_Details_Id=Fees_Receipt.User_Id
where student.DeleteStatus=0   and fees_receipt.Delete_Status=0 and date(Fees_Receipt.Entry_Date) >= '", Fromdate_ ,"' and  date(Fees_Receipt.Entry_Date) <= '", Todate_,"'
and user_details.Role_Id in(",RoleId_,")

union
select 5 as tp,COALESCE(count(student.Student_Id)) as Data_Count from student
inner join Department on Department.Department_Id= student.Department  ",Department_String,"
inner join application_details_history on application_details_history.Student_Id=student.Student_Id
inner join user_details on user_details.User_Details_Id=application_details_history.User_Id
where student.DeleteStatus=0 and application_details_history.SlNo=1  and application_details_history.DeleteStatus=0  and application_details_history.Application_status_Id=1  and date(application_details_history.Date_Of_Applying) >= '", Fromdate_ ,"' and  date(application_details_history.Date_Of_Applying) <= '", Todate_,"'
and user_details.Role_Id in(",RoleId_,") order by tp
    ");
PREPARE QUERY FROM @query;
#select @query;

EXECUTE QUERY;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Department_InUser`()
BEGIN
select
Department.Department_Id,
Department_Name,
Branch.Branch_Id,
Branch_Name,'0' VIew_All,'0' View_Entry

from Department inner join Branch_Department on Branch_Department.Department_Id=Department.Department_Id
inner join Branch on Branch.Branch_Id=Branch_Department.Branch_Id
order by Branch_Name,Department_Name asc;


END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Department_Permission_Byuser`( In User_Id_ Int,Branch_ int)
Begin 
SELECT Department_Id,Branch_Id,View_Entry ,VIew_All From User_Department where 
User_Id =User_Id_  and Branch_Id=Branch_ ;#and Is_Delete=false ;
End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Department_Permission_Byuser_current_Branch`( In User_Id_ Int,Branch_ int)
Begin 
SELECT Department_Id,Branch_Id,View_Entry ,VIew_All From User_Department where 
User_Id =User_Id_  and VIew_All=1 ;
End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Department_Status`( In Department_Status_Id_ Int)
Begin 
 SELECT Department_Status_Id,
Department_Status_Name,
Status_Order,
Editable,
Color From Department_Status where Department_Status_Id =Department_Status_Id_ and Is_Delete=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Document`( In Document_Id_ Int)
Begin 
 SELECT Document_Id,
Document_Name From Document where Document_Id =Document_Id_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Duration`( In Duration_Id_ Int)
Begin 
 SELECT Duration_Id,
Duration_Name From Duration where Duration_Id =Duration_Id_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Enquiry_Source`( In Enquiry_Source_Id_ Int)
Begin 
 SELECT Enquiry_Source_Id,
Enquiry_Source_Name From Enquiry_Source where Enquiry_Source_Id =Enquiry_Source_Id_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Enquiry_Source_data_Count`(In RoleId_ varchar(100),Department_String varchar(1000))
BEGIN
declare Fromdate_ date;declare Todate_ date;
declare curday int;
set Fromdate_=now();
set Todate_=now();
set curday=(SELECT DAY(Fromdate_)-1);
set Fromdate_=(SELECT DATE_SUB(Fromdate_, INTERVAL curday DAY));
SET @query = Concat( "select enquiry_source.Enquiry_Source_Name,count(student.Student_Id) as Data_Count from
enquiry_source left join student on enquiry_source.Enquiry_Source_Id=student.Enquiry_Source_Id and student.DeleteStatus=0  
and date(student.Entry_Date) >= '", Fromdate_ ,"' and  date(student.Entry_Date) <= '", Todate_,"'
and student.Role_Id in(",RoleId_,") where enquiry_source.DeleteStatus=0
group by enquiry_source.Enquiry_Source_Id
order by Enquiry_Source_Name");
PREPARE QUERY FROM @query;
#select @query;
EXECUTE QUERY;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Enquiry_Status`( In Enquiry_Source_Id_ Int)
Begin 
 SELECT Enquiry_Source_Id,
Enquiry_Source_Name From Enquiry_Source where Enquiry_Source_Id =Enquiry_Source_Id_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Fees`( In Fees_Id_ Int)
Begin 
 SELECT Fees_Id,
Fees_Name From fees where Fees_Id =Fees_Id_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Feesrecepitdetails`( In Student_Id_ Int)
Begin
SELECT Fees_Receipt_Id ,Student_Id,  Entry_date,
 User_Id,Description,Fees_Id,Amount,Fee_Receipt_Branch,
 Voucher_No, (Date_Format(Actual_Entry_date,'%d-%m-%Y')) as Actual_Entry_date 

 From fees_receipt 
 where Student_Id =Student_Id_ and Delete_Status=false ;
 
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Feesrecepit_DocumentList`( In Fees_Receipt_Id_ Int)
Begin
select Feesreceipt_document_Id,FeesreceiptFile_Name,FeesreceiptDocument_Name,0 New_Entry, 
 FeesreceiptDocument_File_Name,feesreceipt_document.Fees_Receipt_Id,
 Entry_date
 from feesreceipt_document
 where Fees_Receipt_Id =Fees_Receipt_Id_ and DeleteStatus=false order by FeesreceiptDocument_Id;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Fees_Receipt`( In Fees_Receipt_Id_ Int)
Begin 
 SELECT Entry_Date,
 Description,
 Amount,
 Fees_Name,
 Voucher_No
 From fees_receipt 
 inner join fees on fees_receipt.Fees_Id= fees.Fees_Id  
 where Fees_Receipt_Id =Fees_Receipt_Id_ and Delete_Status=false ;
 
/* select Feesreceipt_document_Id,FeesreceiptFile_Name,FeesreceiptDocument_Name,0 New_Entry, 
 FeesreceiptDocument_File_Name from feesreceipt_document
 where Fees_Receipt_Id =Fees_Receipt_Id_ and DeleteStatus=false order by FeesreceiptDocument_Id;*/
End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_FollowUp_Details`( In Student_Id_ Int)
Begin 
 SELECT
         student.Student_FollowUp_Id,Department,Department_Name,
     student.Status,Department_Status_Name,student.User_Id,User_Details_Name,
        (Date_Format(Next_FollowUp_Date,'%Y-%m-%d')) As Next_FollowUp_Date,Remark,
        Branch,Branch_Name,        FollowUp  Department_FollowUp,By_User_Id
From student
 where student.Student_Id =Student_Id_  ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_FollowUp_History`( In Student_Id_ Int)
Begin 
 SET @query = Concat( " SELECT '1'  Entry_Type ,'FollowUp' as Entry_Caption,Branch_Name,Dept_Name Department_Name,FollowUp Followup_value ,
 Dept_StatusName Status_Name,
(Date_Format(Next_FollowUp_Date,'%d-%m-%Y')) As Next_FollowUp_Date,(Date_Format(Entry_Date,'%d-%m-%Y-%h:%i')) As Entry_Date,
UserName User_Name,ByUserName By_User_Name,
Remark,unix_timestamp(Entry_Date) as Sort_Coloumn,FollowUp_Difference,(Date_Format(Actual_FollowUp_Date,'%d-%m-%Y')) As Actual_FollowUp_Date
From student_followup
where student_followup.Student_Id = ",Student_Id_,"   and student_followup.DeleteStatus=false
union
select  '2'  Entry_Type ,'Fees Receipt' as Entry_Caption,Branch_Name,'' Department_Name,'' Followup_value,Fees_Name as Status_Name, (Date_Format(fees_receipt.Actual_Entry_Date,'%d-%m-%Y-%h:%i')) As Next_FollowUp_Date  ,
(Date_Format(fees_receipt.Actual_Entry_Date,'%d-%m-%Y-%h:%i')) as Entry_Date,
'' as User_Name,user_details.User_Details_Name By_User_Name,
Description,unix_timestamp(Entry_Date) as Sort_Coloumn,'' FollowUp_Difference,Amount As Actual_FollowUp_Date
from fees_receipt
inner join fees on fees.Fees_Id=fees_receipt.Fees_Id
inner join  user_details on fees_receipt.User_Id=user_details.User_Details_Id 
inner join Branch  on fees_receipt.Fee_Receipt_Branch=Branch.Branch_Id
where fees_receipt.Student_Id = ",Student_Id_," and  Delete_Status=false
union
SELECT '3'  Entry_Type ,'Course Sent' as Entry_Caption,'' Branch_Name,''Department_Name,'' Followup_value ,'' Status_Name,
'' Next_FollowUp_Date,(Date_Format(Entry_Date,'%d-%m-%Y-%h:%i')) As Entry_Date,
user_details.User_Details_Name User_Name,'' By_User_Name,
'' Remark,unix_timestamp(Entry_Date),'' FollowUp_Difference,'' As Actual_FollowUp_Date
From student_course_apply
inner join user_details  on user_details.User_Details_Id =student_course_apply.User_Id
where student_course_apply.Student_Id = ",Student_Id_,"
union
SELECT '4'  Entry_Type ,'Registered' as Entry_Caption,Branch.Branch_Name,'' Department_Name,'' Followup_value ,
'' Status_Name,
'' Next_FollowUp_Date,(Date_Format(Registered_On,'%d-%m-%Y-%h:%i')) As Entry_Date,
'' User_Name,user_details.User_Details_Name By_User_Name,
'' Remark,unix_timestamp(Registered_On) as Sort_Coloumn,'' FollowUp_Difference,'' As Actual_FollowUp_Date
From student
inner join  user_details on student.Registered_By=user_details.User_Details_Id 
inner join Branch  on Branch.Branch_Id =student.Branch
where student.Student_Id = ",Student_Id_,"
union
SELECT '5'  Entry_Type ,'Welocome mail Sent' as Entry_Caption,'' as Branch_Name,'' Department_Name,'' Followup_value ,
'' Status_Name,
'' Next_FollowUp_Date,(Date_Format(Entry_date,'%d-%m-%Y-%h:%i')) As Entry_Date,
'' User_Name,user_details.User_Details_Name By_User_Name,
'' Remark,unix_timestamp(Entry_Date) as Sort_Coloumn,'' FollowUp_Difference,'' As Actual_FollowUp_Date
From transaction_history
inner join  user_details on transaction_history.User_Id=user_details.User_Details_Id 
where Transaction_type=1 and transaction_history.Student_Id = ",Student_Id_,"
order by Sort_Coloumn desc;");
PREPARE QUERY FROM @query;
#select @query;
EXECUTE QUERY;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_IELTS_Photo`( In Student_Id_ Int)
Begin
SELECT IELTS
 From student

 where Student_Id =Student_Id_
 and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Intake`( In Intake_Id_ Int)
Begin 
 SELECT Intake_Id,
Intake_Name From Intake where Intake_Id =Intake_Id_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Intakes_InCourse`()
Begin 

 SELECT false Intake_Status,false Intake_Selection,Intake_Name,Intake_Id from Intake  order by intake_Id asc;
   

 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Intakes_InCourse_Edit`( In Course_Id_ int)
Begin 

  SELECT false Intake_Status,false Intake_Selection,Intake_Name from Intake 
  left join  course_intake on course_intake.Intake_Id=intake.Intake_Id
  order by Intake_Name ;

 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_intake_year`( In Intake_Year_Id_ Int)
Begin 
 SELECT Intake_Year_Id,
Intake_Year_Name From intake_year where Intake_Year_Id =Intake_Year_Id_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Internship`( In Internship_Id_ Int)
Begin 
 SELECT Internship_Id,
Internship_Name From Internship where Internship_Id =Internship_Id_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Invoice_Details`( In Student_Id_ Int)
Begin
SELECT Invoice_Id ,Student_Id, (Date_Format(Entry_Date,'%Y-%m-%d'))   as Entry_Date, (Date_Format(Entry_Date,'%d-%m-%Y'))   as Edit_Entry_Date,Description,Amount
from invoice
 where Student_Id =Student_Id_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Invoice_Documents`(In Invoice_Id_ int)
BEGIN
 select  Invoice_Document_Id,Invoice_Id,(Date_Format(Entry_Date,'%d-%m-%Y')) as Entry_Date,Description,Invoice_Document_Name,Invoice_Document_File_Name,Invoice_File_Name,0 as New_Entry
 from Invoice_document where Invoice_Id = Invoice_Id_ and DeleteStatus= 0;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Last_FollowUp`( In User_Id_ Int)
Begin 
Declare Followup_Id_ numeric;
set Followup_Id_=(select Max(Student_FollowUp_Id) from student_followup where By_User_Id =User_Id_ and DeleteStatus=false);

 SELECT Department,student_followup.Status,student_followup.User_Id,
student_followup.Branch,Branch_Name,Dept_Name Department_Name,Dept_StatusName Department_Status_Name ,
UserName User_Details_Name ,FollowUp  Department_FollowUp,By_User_Id
From student_followup
 where student_followup.Student_FollowUp_Id =Followup_Id_  and student_followup.DeleteStatus=false and student_followup.Student_FollowUp_Id=student_followup.Student_FollowUp_Id;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Lead_Load_Data_ByUser`(In Login_User Int )
BEGIN
declare User_Type_ int;
set User_Type_=(select User_Type from user_details where User_Details_Id=Login_User);
if User_Type_=2 then
 	#SET SearchbyName_Value =concat(SearchbyName_Value," and User_Details_Id =",Login_Id_);
    SELECT User_Details_Id,User_Details_Name From user_details  where  DeleteStatus=false and User_Details_Id =Login_User order by  User_Details_Name asc ;
  
else
	SELECT User_Details_Id,User_Details_Name From user_details  where  DeleteStatus=false and User_Details_Id in (select User_Details_Id from user_details where Branch_Id in (select
	distinct Branch_Id from user_department where User_Id =Login_User and VIew_All=1)) order by  User_Details_Name asc ;
   
end if;
#SELECT Department_Id,Department_Name From department where  DeleteStatus=false  order by Department_Name asc ;

#SELECT User_Details_Id,User_Details_Name From user_details  where  DeleteStatus=false order by  User_Details_Name asc ;

SELECT Department_Id,Department_Name From department where  Is_Delete=false and
Department_Id in (select distinct Department_Id from user_department where User_Id =Login_User and View_Entry=1) order by Department_Name asc ;

SELECT Branch_Id,Branch_Name From branch where  Is_Delete=false and Branch_Id in (select
	distinct Branch_Id from user_department where User_Id =Login_User and VIew_Entry=1) order by Branch_Name asc ;

SELECT Fees_Id,Fees_Name From fees where  DeleteStatus=false  order by Fees_Name asc; 

SELECT Remarks_Id,Remarks_Name From remarks where  DeleteStatus=false  order by Remarks_Name asc; 

SELECT Department_Status_Id,Department_Status_Name From department_status where  Is_Delete=false  order by Department_Status_Name asc ;

SELECT Enquiry_Source_Id,Enquiry_Source_Name From enquiry_source where  DeleteStatus=false  order by Enquiry_Source_Name asc ;
    
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Level_Detail`( In Level_Detail_Id_ Int)
Begin 
 SELECT Level_Detail_Id,
Level_Detail_Name From Level_Detail where Level_Detail_Id =Level_Detail_Id_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Menu_Permission`(In User_Id_ int)
BEGIN
select
User_Menu_Selection.Menu_Id,
User_Menu_Selection.IsEdit Menu_Edit,
User_Menu_Selection.IsDelete Menu_Delete ,
User_Menu_Selection.IsSave Menu_Save,
User_Menu_Selection.IsView VIew_All ,
User_Menu_Selection.Menu_Status,
Menu_Type
from User_Menu_Selection
inner join Menu on User_Menu_Selection.Menu_Id=Menu.Menu_Id
Where
User_Id=User_Id_ 
and User_Menu_Selection.IsView=1 and Menu.Menu_Status=1
order by Menu_Order Asc;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Menu_Status`(In Menu_Id_ int,Login_User_ int)
BEGIN
select IsView ,Menu_Status,IsEdit Edit,IsSave Save,IsDelete,Menu_Id,IsDelete as 'Delete' ,IsView as'View' ,menu_id
from user_menu_selection where User_Id=Login_User_ and DeleteStatus=0 and menu_id=Menu_Id_;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Message_Details`(in Student_Id_ int)
BEGIN
select Student_Message_Id,Message_Detail,
(Date_Format(Entry_Date,'%Y-%m-%d')) As Entry_Date 
from student_message where Student_Id=Student_Id_ and DeleteStatus=false
order by Entry_Date desc ;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_MOI_Photo`( In Student_Id_ Int)
Begin
SELECT Passport_Photo
 From student

 where Student_Id =Student_Id_
 and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_More_Information`(in Course_Id_ int)
BEGIN
select Application_Fees,Tution_Fees,Level_Detail_Name,Details,Duration_Name,Subject_Name,
ielts.Ielts_Name Ielts_Minimum_Score
 From Course 
 inner join duration on  course.Duration_Id= duration.Duration_Id
 inner join  level_detail on course.Level_Id=level_detail.Level_Detail_Id
 inner join subject on course.Subject_Id=subject.Subject_Id
 inner join ielts on course.Ielts_Minimum_Score=ielts.Ielts_Id
where Course.DeleteStatus = false and Course.Course_Id=Course_Id_;
select Intake_Name
from intake
 inner join course_intake on  course_intake.Intake_Id= intake.Intake_Id
 where course_intake.Course_Id=Course_Id_;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Receipt_Sum`( In Student_Id_ Int)
Begin 
 SELECT COALESCE(sum(Amount),0) as paid_fees From fees_receipt where Student_Id =Student_Id_ and Fees_Id !=5 and Delete_Status=false ;

 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Registration_data_Count`(In RoleId_ varchar(100),Department_String varchar(1000))
BEGIN
declare Fromdate_ date;declare Todate_ date;
declare curday int;
set Fromdate_=now();
set Todate_=now();
set curday=(SELECT DAY(Fromdate_)-1);
set Fromdate_=(SELECT DATE_SUB(Fromdate_, INTERVAL curday DAY));
SET @query = Concat( "  
select User_Details_Name User,count(student.Student_Id) as No_of_Registration from
student
inner join user_details on user_details.User_Details_Id=student.Registered_By
inner join Branch  on Branch.Branch_Id= student.Registration_Branch
where student.DeleteStatus=0 and student.Is_Registered=1  and  and date(student.Registered_On) >= '", Fromdate_ ,"' and  date(student.Registered_On) <= '", Todate_,"'
 user_details.Role_Id in(",RoleId_,")
group by student.Registered_By order by Branch,User_Id
    ");
PREPARE QUERY FROM @query;
#select @query;

EXECUTE QUERY;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Resume_Photo`( In Student_Id_ Int)
Begin
SELECT Resume
 From student

 where Student_Id =Student_Id_
 and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_site_Pageload`()
BEGIN
SELECT Country_Id,Country_Name From Country where  DeleteStatus=false  order by Country_Name asc ;
SELECT Ielts_Id,Ielts_Name From ielts  where  DeleteStatus=false order by  Ielts_Name asc ;
SELECT Subject_Id,Subject_Name,Selection From subject where  DeleteStatus=false  order by Subject_Name asc ;
SELECT Duration_Id,Duration_Name,Selection From duration where  DeleteStatus=false  order by Duration_Name asc ;
SELECT Level_Detail_Id,Level_Detail_Name From level_detail where  DeleteStatus=false  order by Level_Detail_Name asc ;
SELECT Intake_Id,Intake_Name From intake where  DeleteStatus=false  order by Intake_Name asc ;
SELECT Intake_Year_Id,Intake_Year_Name From intake_year where  DeleteStatus=false  order by Intake_Year_Name asc ;
SELECT Internship_Id,Internship_Name From internship where  DeleteStatus=false  order by Internship_Name asc ;
SELECT University_Id,University_Name From university where  DeleteStatus=false  order by University_Name asc ;
SELECT Sub_Section_Id,Sub_Section_Name From sub_section where DeleteStatus=false  order by Sub_Section_Name asc ;


END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_SOP_Photo`( In Student_Id_ Int)
Begin
SELECT Passport_Copy
 From student

 where Student_Id =Student_Id_
 and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Status_Selection_Edit`( In Department_Id_ Int)
Begin 
 SELECT Department_Status_Id,
Department_Status_Name,
 case when Status_Selection.Status_Id>0 then 1 else 0 end as Check_Box
 From Department_Status  left join Status_Selection on
  Department_Status.Department_Status_Id=Status_Selection.status_Id
  and Department_Id=Department_Id_ where
  Department_Status.Is_Delete=false order by Status_Order ;
 

 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Student`( In Student_Id_ Int)
Begin
 SELECT Student_Id,
 Agent_Id,
Student_Name,
Last_Name,
 IFNULL(Gender, 0) as Gender,
 IFNULL(Address1, '') as Address1,
Address2,
Pincode,
IFNULL(Email, '') as Email,
Alternative_Email,
Phone_Number,
Alternative_Phone_Number,
(Date_Format(Dob,'%Y-%m-%d')) As Dob ,
Country_Name,
Promotional_Code,
Student_Status_Id,
Enquiry_Source_Id,
Whatsapp,
Passport_Copy_File_Name,IELTS_File_Name,Passport_Photo_File_Name,
Tenth_Certificate_File_Name,Work_Experience_File_Name,Resume_File_Name,

Facebook,IFNULL(Passport_Copy,'') Passport_Copy,
IFNULL(IELTS,'') IELTS,IFNULL(Passport_Photo,'') Passport_Photo,
IFNULL(Tenth_Certificate,'') Tenth_Certificate ,
IFNULL(Work_Experience,'') Work_Experience ,
IFNULL(Resume,'') Resume ,
Is_Registered,
Password,
College_University,
Programme_Course,
Intake,
Year,
Reference,
Visa_Submission_Date,
Activity,
#Visa_Outcome,
IFNULL(Course_Link, '') as Course_Link,
IFNULL(Agent, '') as Agent,
Status_Details,
Student_Remark,
Send_Welcome_Mail_Status,

 IFNULL(sslc_year, '') as sslc_year,
 IFNULL(sslc_institution, '') as sslc_institution,
 IFNULL(sslc_markoverall, '') as sslc_markoverall,
 IFNULL(sslc_englishmark, '') as sslc_englishmark,
 IFNULL(plustwo_year, '') as plustwo_year,
 IFNULL(plustwo_institution, '') as plustwo_institution,
 IFNULL(plustwo_markoverall, '') as plustwo_markoverall,
 IFNULL(plustwo_englishmark, '') as plustwo_englishmark,
 IFNULL(graduation_year, '') as graduation_year,
 IFNULL(graduation_institution, '') as graduation_institution,
 IFNULL(graduation_markoverall, '') as graduation_markoverall,
 IFNULL(graduation_englishmark, '') as graduation_englishmark,
 IFNULL(postgraduation_year, '') as postgraduation_year,
 IFNULL(postgraduation_institution, '') as postgraduation_institution,
 IFNULL(postgraduation_markoverall,'') as postgraduation_markoverall,
 IFNULL(postgraduation_englishmark, '') as postgraduation_englishmark,
 IFNULL(other_year, '') as other_year,
 IFNULL(other_instituation, '') as other_instituation,
 IFNULL(other_markoverall, '') as other_markoverall,
 IFNULL(other_englishmark, '') as other_englishmark,
 IFNULL(exp_institution_1, '') as exp_institution_1,
 IFNULL(exp_institution_2, '') as exp_institution_2,
 IFNULL(exp_designation_1, '') as exp_designation_1,
 IFNULL(exp_designation_2, '') as exp_designation_2,
 IFNULL(exp_designation_3, '') as exp_designation_3,
 IFNULL(exp_designation_4, '') as exp_designation_4,
(Date_Format(exp_tenure_from_1,'%Y-%m-%d')) As exp_tenure_from_1 ,
(Date_Format(exp_tenure_from_2,'%Y-%m-%d')) As exp_tenure_from_2 ,
(Date_Format(exp_tenure_from_3,'%Y-%m-%d')) As exp_tenure_from_3 ,
(Date_Format(exp_tenure_from_4,'%Y-%m-%d')) As exp_tenure_from_4 ,
(Date_Format(exp_tenure_to_1,'%Y-%m-%d')) As exp_tenure_to_1 ,
(Date_Format(exp_tenure_to_2,'%Y-%m-%d')) As exp_tenure_to_2 ,
(Date_Format(exp_tenure_to_3,'%Y-%m-%d')) As exp_tenure_to_3 ,
(Date_Format(exp_tenure_to_4,'%Y-%m-%d')) As exp_tenure_to_4 ,
  IFNULL(exp_institution_3, '') as exp_institution_3,
  IFNULL(exp_institution_4, '') as exp_institution_4,
  IFNULL(IELTS_Overall, '') as IELTS_Overall,
  IFNULL(IELTS_Listening, '') as IELTS_Listening,
  IFNULL(IELTS_Reading, '') as IELTS_Reading,
  IFNULL(IELTS_Writting, '') as IELTS_Writting,
  IFNULL(IELTS_Speaking, '') as IELTS_Speaking,
  IFNULL(Passport_No, '') as Passport_No,
(Date_Format(Passport_fromdate,'%Y-%m-%d')) As Passport_fromdate,
(Date_Format(Passport_Todate,'%Y-%m-%d')) As Passport_Todate,

  IFNULL(LOR_1_Id, 0) as LOR_1_Id,
 IFNULL(LOR_2_Id, 0) as LOR_2_Id,
 IFNULL(MOI_Id, 0) as MOI_Id,
 IFNULL(SOP_Id, 0) as SOP_Id,
 IFNULL(Ielts_Id, 0) as Ielts_Id,
 IFNULL(Passport_Id, 0) as Passport_Id,

 IFNULL(Resume_Id, 0) as Resume_Id,
IFNULL(Registered_On, '') as Registered_On,
IFNULL(Registration_Target, 0) as Registration_Target,
IFNULL(FollowUp_Count, 0) as FollowUp_Count,
IFNULL(FollowUp_Entrydate, '') as FollowUp_Entrydate,
IFNULL(Registration_Branch, '') as Registration_Branch,
IFNULL(Entry_Type, '') as Entry_Type,
IFNULL(First_Followup_Status, '') as First_Followup_Status,
IFNULL(First_Followup_Date, '') as First_Followup_Date,

 IFNULL(Student_Registration_Id, 0) as Student_Registration_Id, 
 IFNULL(Department_Name, '') as Department_Name, 
 IFNULL(FollowUp, '') as FollowUp, 
 IFNULL(Branch_Name, '') as Branch_Name, 
 IFNULL(Client_Accounts_Name, '') as Client_Accounts_Name, 
 IFNULL(Agent_Name, '') as Agent_Name, 
 IFNULL(Department_Status_Name, '') as Department_Status_Name, 
 IFNULL(User_Details_Name, '') as User_Details_Name, 
 IFNULL(Role_Id, 0) as Role_Id, 
 IFNULL(Enquiry_Source_Name, '') as Enquiry_Source_Name, 
 IFNULL(Visa_Outcome, '') as Visa_Outcome, 
 IFNULL(Created_User, '') as Created_User, 
 IFNULL(Registered_User, '') as Registered_User, 
  IFNULL(Registered_Branch, '') as Registered_Branch,
  IFNULL(Marital_Status_Id,'') as Marital_Status_Id ,
  IFNULL(Marital_Status_Name,'') as Marital_Status_Name ,
  
   IFNULL(Program_Course_Id,0) as Program_Course_Id ,
    IFNULL(Profile_University_Id,0) as Profile_University_Id ,
     IFNULL(Profile_Country_Id,0) as Profile_Country_Id ,
      #IFNULL(Created_On,'') as Created_On,
      (Date_Format(Created_On,'%Y-%m-%d')) as Created_On,
       IFNULL(Intake_Id,0) as Intake_Id


 From Student where Student_Id =Student_Id_ and DeleteStatus=false ;

select Student_Document_Id,File_Name,Document_Name,0 New_Entry, Document_File_Name from Student_Document where Student_Id =Student_Id_ and DeleteStatus=false order by Document_Id;
End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Student_Agent`( In Student_Id_ Int)
Begin 
 SELECT Student_Id,
 Agent_Id,
Student_Name,
Last_Name,
Gender,
Address1,
Address2,
Pincode,
Email,
Phone_Number,
Dob,
Country,
Promotional_Code,
Student_Status_Id,
Password From Student where Student_Id =Student_Id_ and DeleteStatus=false ;
End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Student_Course_Apply`(in Student_Id_ int )
BEGIN
select Student_Course_Apply_Id,
(Date_Format(Entry_Date,'%d-%m-%Y')) As Entry_Date ,
(Date_Format(Paid_On,'%Y-%m-%d')) As Paid_On ,Status_Id,Total_Course
from student_course_apply
where Student_Id=Student_Id_;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Student_Course_Selection`(in Student_Course_Apply_Id_ int)
BEGIN
select Course_Name,Application_Fees,Country_Name,University_Name,Student_Course_Apply_Id
from student_course_selection
inner join Course on Course.Course_Id=student_course_selection.Course_Id
inner join Country on Course.Country_Id=Country.Country_Id
inner join University on Course.University_Id=University.University_Id
where Student_Course_Apply_Id=Student_Course_Apply_Id_;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Student_Details`(in Student_Id_ int)
BEGIN
select Student_Id,Student_Name,Gender,Address1,Address2,Email,Phone_Number,Pincode,
Last_Name,Dob,Country,Promotional_Code,Password
from student where Student_Id=Student_Id_;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Student_Document`( In Student_Id_ Int)
Begin 
declare  Student_Document_Id int; 
 SELECT
(Date_Format(Entry_Date,'%Y-%m-%d')) Entry_Date,File_Name,document.Document_Name
From Student_Document
inner join document on Student_Document.Document_Id=document.Document_Id
where Student_Id =Student_Id_ and student_document.DeleteStatus=false
order by Student_Document_Id desc ;

 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Student_Edit`( In Student_Id_ Int)
Begin 
 SELECT check_list.Check_List_Id ,Check_List_Name,
 case when student_checklist.Applicable>0 then 1 else 0 end as Applicable,
 case when student_checklist.Checklist_Status>0 then 1 else 0 end as Checklist_Status,
  check_list.Applicable Applicable_Check,
	check_list.Checklist_Status Checklist_Status_Check
  From check_list 
  left join student_checklist on  check_list.Check_List_Id = student_checklist.Check_List_Id
  and Student_Id = Student_Id_ where check_list.DeleteStatus=false and student_checklist.DeleteStatus=false  order by check_list.Check_List_Id ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Student_Message`( In Student_Message_Id_ Int)
Begin 
 SELECT Student_Message_Id,
Student_Id,
Message_Detail From Student_Message where Student_Message_Id =Student_Message_Id_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Student_Status`( In Student_Status_Id_ Int)
Begin 
 SELECT Student_Status_Id,
Student_Status_Name From Student_Status where Student_Status_Id =Student_Status_Id_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Subject`( In Subject_Id_ Int)
Begin 
 SELECT Subject_Id,
Subject_Name From Subject where Subject_Id =Subject_Id_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Sub_Section_From_Course`( In Subject_Id_ Int)
Begin 
SELECT distinct course.Sub_Section_Id,Sub_Section_Name From course
inner join sub_section on course.Sub_Section_Id = sub_section.Sub_Section_Id where subject_id=Subject_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_University`( In University_Id_ Int)
Begin 
 SELECT University_Id,
University_Name From University where University_Id =University_Id_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_University_Photos`(in University_Id_ int)
BEGIN
select University_Image from University_Photos
where DeleteStatus=false and University_Id=University_Id_;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_User_Branch`( In User_Id_ Int)
Begin
 SELECT Branch_Id From User_Details  
 where User_Details_Id =User_Id_ ;

 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_User_Branches`( In User_Id_ Int,Branch_ int)
Begin 
SELECT distinct Branch_Id From User_Department where 
User_Id =User_Id_   ;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_User_Department_Edit`( In User_Id_ Int)
Begin 
 SELECT Department.Department_Id ,Department_Name,Branch.Branch_Id,Branch_Name,
 case when User_Department.View_Entry>0 then 1 else 0 end as Check_Box_View,
 case when  User_Department.VIew_All>0 then 1 else 0 end as Check_Box_VIew_All
  From Department inner join Branch_Department 
  on Department.Department_Id=Branch_Department.Department_Id inner join Branch
  on Branch.Branch_Id=Branch_Department.Branch_Id  left join User_Department 
  on Department.Department_Id=User_Department.Department_Id and  Branch.Branch_Id=User_Department.Branch_Id 
   and User_Id=user_Id_
  where Department.Is_Delete=false
  order by Branch_Name,Department_Name asc ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_User_Details`( In User_Details_Id_ Int)
Begin 
 SELECT User_Details_Id,
User_Details_Name,
Password,
Working_Status,
User_Type,
Role_Id,
Address1,
Address2,
Address3,
Address4,
Pincode,
Mobile,
Email,Employee_Id,
Registration_Target,
FollowUp_Target
 From User_Details where User_Details_Id =User_Details_Id_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_User_Details_Edit`( In User_Details_Id_ Int)
Begin 
 SELECT Menu.Menu_Id ,Menu_Name,
 case when User_Menu_Selection.IsView>0 then 1 else 0 end as IsView,
 case when User_Menu_Selection.IsSave>0 then 1 else 0 end as IsSave,
 case when User_Menu_Selection.IsEdit>0 then 1 else 0 end as IsEdit,
 case when User_Menu_Selection.IsDelete>0 then 1 else 0 end as IsDelete,
 Menu.IsEdit Edit_Check,
	Menu.IsSave Save_Check,
	Menu.IsDelete  Delete_Check
  From Menu 
  left join User_Menu_Selection on  Menu.Menu_Id=User_Menu_Selection.Menu_Id
  and User_Id =User_Details_Id_ where Menu.Menu_Status=1 and
  Menu.DeleteStatus=false order by Menu.Menu_Order,Menu_Order_Sub asc;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_User_Role`( In User_Role_Id_ Int)
Begin 
 SELECT User_Role_Id,
User_Role_Name,
Role_Under_Id
 From user_role where User_Role_Id =User_Role_Id_ and Is_Delete=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_User_Role_Id`( In User_Id_ Int)
Begin
 SELECT Role_Id From User_Details  
 where User_Details_Id =User_Id_ ;

 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_User_Status`()
BEGIN

 SELECT User_Status_Id,
User_Status_Name From User_Status
order by User_Status_Name asc  ;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_User_Type`()
BEGIN
SELECT User_Type_Id,
User_Type_Name From User_Type 
order by User_Type_Name asc ;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Visa_Details`( In Student_Id_ Int)
Begin
SELECT Visa_Id ,Student_Id, (Date_Format(Approved_Date,'%Y-%m-%d'))   as Approved_Date,(Date_Format(Approved_Date,'%d-%m-%Y'))   as Edit_Approved_Date,
(Date_Format(Approved_Date_L,'%Y-%m-%d'))   as Approved_Date_L,(Date_Format(Approved_Date_L,'%d-%m-%Y'))   as Edit_Approved_Date_L,
(Date_Format(Approved_Date_F,'%Y-%m-%d'))   as Approved_Date_F,(Date_Format(Approved_Date_F,'%d-%m-%Y'))   as Edit_Approved_Date_F,
Total_Fees,Scholarship_Fees,Balance_Fees,Paid_Fees,Visa_Type_Id , Visa_Type_Name , Description,
case when Visa_Granted>0 then 1 else 0 end as Visa_GrantedCheck_Box,case when Visa_Letter>0 then 1 else 0 end as Visa_Letter,case when Visa_File>0 then 1 else 0 end as Visa_File
,Application_No
 From visa
 where Student_Id =Student_Id_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Visa_Documents`(In Visa_Id_ int)
BEGIN
 select  Visa_Document_Id,Visa_Id,(Date_Format(Entry_Date,'%d-%m-%Y')) as Entry_Date,Description,Visa_Document_Name,Visa_Document_File_Name,Visa_File_Name,0 as New_Entry
 from visa_document where Visa_Id = Visa_Id_ and DeleteStatus=0;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `IELTS_Mode_Dropdown`()
BEGIN
select * from ielts_mode;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Load_Account_Group`(In Group_Name_ varchar(100))
Begin 
 set Group_Name_ = Concat( '%',Group_Name_ ,'%');
 SELECT Account_Group_Id,Group_Name
 From Account_Group where  
 Group_Name like Group_Name_ and DeleteStatus=false 
  ORDER BY Group_Name Asc Limit 5;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Load_Agents`()
BEGIN
select Agent_Id,Agent_Name  from agent where DeleteStatus=false;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Load_application_status`()
BEGIN
select Application_status_Id,Application_Status_Name  from application_status;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Load_Company`()
BEGIN
select * from Company;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Load_Country`()
BEGIN
select Country_Id,Country_Name from Country
;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Load_Intake`()
BEGIN
select intake_Id  as Intake_Id,intake_Name as Intake_Name  from intake where DeleteStatus =0;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Load_Intake_year`()
BEGIN
select Intake_Year_Id,Intake_Year_Name from intake_year;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Load_MailAddress_for_Registration`(In Login_Id int,Student_Id_ int)
BEGIN
select User_Details_Id as Tp,Email from user_details where User_Details_Id=Login_Id union
select Student_Id as Tp,Email from student where  Student_Id=Student_Id_;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Load_MailAddress_for_Report`(In Login_Id int)
BEGIN
select User_Details_Id as Tp, Email,FollowUp_Target from user_details where User_Details_Id=Login_Id union 
select 1 as Tp,Email from company ;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Load_Marital_Status`()
BEGIN
select Marital_Status_Id  as Marital_Status_Id,Marital_Status_Name as Marital_Status_Name  from marital_status where DeleteStatus =0;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Load_Receipt_Data_For_Mail`(In Login_Id_ int)
BEGIN
select Email,FollowUp_Target from user_details where User_Details_Id=Login_Id_ ;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Load_Status`()
BEGIN
select Status_Id,Status_Name from Status
;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Load_User`(in Login_Id int)
BEGIN
select User_Details_Name,Email,Mobile,FollowUp_Target from user_details where User_Details_Id=Login_Id;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Load_User_Role`(In User_Role_Name_ varchar(100))
Begin 
 set User_Role_Name_ = Concat( '%',User_Role_Name_ ,'%');
 SELECT User_Role_Id,User_Role_Name,Role_Under_Id
 From user_role where  
 User_Role_Name like User_Role_Name_ and Is_Delete=false 
  ORDER BY User_Role_Name Asc Limit 5;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Load_Visa_Type`()
BEGIN
select Visa_Type_Id  as Visa_Type_Id,Visa_Type_Name as Visa_Type_Name  from visa_type
 where DeleteStatus =0;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Login_Check`( In User_Details_Name_ VARCHAR(50),
in Password_ VARCHAR(50))
BEGIN
SELECT 
User_Details_Id,User_Details_Name,User_Type,Role_Id,Branch_Id
From User_Details 
 where 
 User_Details_Name =User_Details_Name_ and Password=Password_;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `LOR1_Mode_Dropdown`()
BEGIN
select * from lor_1_mode;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `LOR2_Mode_Dropdown`()
BEGIN
select * from lor_2_mode;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOI_Mode_Dropdown`()
BEGIN
select * from moi_mode;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Passport_Mode_Dropdown`()
BEGIN
select * from passport_mode;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Pending_FollowUp`(In  RoleId_ varchar(100),Department_String varchar(1000), Department_ int,Branch_ int,By_User_ int,Login_User_Id_ int)
BEGIN
declare Search_Date_ varchar(500);
declare SearchbyName_Value varchar(2000);declare User_Type_ int;
set SearchbyName_Value='';
set User_Type_=(select User_Type from user_details where User_Details_Id=Login_User_Id_);
set Search_Date_=concat( " and date(student.Next_FollowUp_Date) < '", Date_Format( Now(),'%Y-%m-%d'),"'" );
if Department_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.Department =",Department_);
end if;
if Branch_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.Branch =",Branch_);
end if;
if User_Type_=2 then
 	SET SearchbyName_Value =concat(SearchbyName_Value," and student.User_Id =",Login_User_Id_);
    else
    SET SearchbyName_Value =concat(SearchbyName_Value," and student.User_Id in (select User_Details_Id from user_details where Branch_Id in (select
distinct Branch_Id from user_department where User_Id =",Login_User_Id_," and VIew_All=1))");
end if;
if By_User_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.User_Id =",By_User_);
end if;

SET @query = Concat( "select (Date_Format(student.Entry_Date,'%d-%m-%Y')) As Created_On,user_details.User_Details_Name As Created_By,
 student.Student_Name Student,student.Phone_Number Mobile,Branch.Branch_Name Branch,
(Date_Format(student.Next_FollowUp_Date,'%d-%m-%Y')) As Follow_Up_On,Department.Department_Name Department,
Department_Status.Department_Status_Name Status,T.User_Details_Name To_Staff,B.User_Details_Name Registered_By,
(Date_Format(student.Registered_On,'%d-%m-%Y-%h:%i')) As Registered_On,student.Remark
from student
inner join Department on Department.Department_Id= student.Department  ",Department_String,Search_Date_,"
inner join user_details on user_details.User_Details_Id=student.Created_By
inner join Branch on Branch.Branch_Id= student.Branch
inner join Department_Status on Department_Status.Department_Status_Id=student.Status
inner join user_details as T on T.User_Details_Id=student.User_Id
left join user_details as B on B.User_Details_Id=student.Registered_By
where student.DeleteStatus=0 and department.FollowUp=1  ",SearchbyName_Value,"
and T.Role_Id in(",RoleId_,")
order by Next_FollowUp_Date asc ");

PREPARE QUERY FROM @query;
#select @query;


EXECUTE QUERY;


END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Public_Search_Course`(In Level_Detail_Id_ int,Country_Id_ int,
Intake_Id_ varchar(100),Sub_Section_Id_ varchar(100),Course_Name_ varchar(100),Branch_Search_ varchar(100),Duration_Search_ varchar(100),Ielts_ int,
Page_Start_ int,Page_End_ int,Page_Length_ int,University_ int,Subject_1 int)
Begin 
declare SearchbyName_Value varchar(2000);
declare SearchQuery_sub varchar(2000);
declare SearchQuery_sub_section varchar(2000);
set SearchQuery_sub=' ';
set SearchQuery_sub_section=' ';
set SearchbyName_Value='';
if Intake_Id_!='' &&  Intake_Id_!='0'  then
	#SET SearchbyName_Value =concat(SearchbyName_Value," );
    set SearchbyName_Value =concat(SearchbyName_Value,"  and course_id in (select course_id from  course_intake where
    Intake_Id in(",Intake_Id_,"))");
end if;

if Sub_Section_Id_!=''  &&  Sub_Section_Id_!='0'  then
	#SET SearchbyName_Value =concat(SearchbyName_Value," );
    set SearchQuery_sub_section=concat(" and Sub_Section_Id in(",Sub_Section_Id_,")");
end if;
if Level_Detail_Id_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and course.Level_Id =",Level_Detail_Id_);
end if;
if Country_Id_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and Course.Country_Id =",Country_Id_);
end if;
if Ielts_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and course.Ielts_Minimum_Score  <=",Ielts_);
end if;
if Course_Name_!='' then
SET SearchbyName_Value =   Concat(SearchbyName_Value, " and( course.Course_Name like '%",Course_Name_ ,"%'") ;
SET SearchbyName_Value =   Concat(SearchbyName_Value, " or course.Tag like '%",Course_Name_ ,"%')") ;
end if;
/*if Duration_Search_!='' then
SET SearchbyName_Value =   Concat( SearchbyName_Value," and Course.Duration_Id in (",Duration_Search_ ,")") ;
end if;*/
/*if Branch_Search_!='' then
SET SearchbyName_Value =   Concat( SearchbyName_Value," and Course.Subject_Id in (",Branch_Search_ ,")") ;
end if;*/
if University_!='' then
SET SearchbyName_Value =   Concat( SearchbyName_Value," and Course.University_Id in (",University_ ,")") ;
end if;
if Subject_1!='' then
SET SearchbyName_Value =   Concat( SearchbyName_Value," and Course.Subject_Id in (",Subject_1,")") ;
end if;
SET @query = Concat("select * from(select * from (SELECT 1 tp,course.Course_Id,Course_Name,Country_Name,University_Name,false More_Information,
CAST(CAST(ROW_NUMBER()OVER(ORDER BY Course.Course_Name DESC )AS UNSIGNED)AS SIGNED)AS RowNo
from Course 
inner join country on course.Country_Id = country.Country_Id
inner join university  on course.University_Id = university.University_Id ",SearchQuery_sub,SearchQuery_sub_section, " 
where Course.DeleteStatus = false  " ,SearchbyName_Value," order by Course.Course_Name desc )
 as lds WHERE RowNo >=",Page_Start_," AND RowNo<= ",Page_End_,"
 order by  RowNo LIMIT ",Page_Length_," ) as t union 
 SELECT 0 tp ,count(Course_Id) as Course_Id,'' Course_Name,'' Country_Name,'' University_Name,1  More_Information,
0 RowNo
from Course 
inner join country on course.Country_Id = country.Country_Id
inner join university  on course.University_Id = university.University_Id ",SearchQuery_sub,SearchQuery_sub_section, " 
where Course.DeleteStatus = false " ,SearchbyName_Value, " order by tp desc");
 
#insert into db_logs values(Duration_Search_,@query,1,0);
PREPARE QUERY FROM @query;
EXECUTE QUERY;


#select @query;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Public_Search_Course_Typeahead`(In Level_Detail_Id_ int,Country_Id_ int,
Intake_Id_ varchar(100),Sub_Section_Id_ varchar(100),Course_Name_ varchar(100),Branch_Search_ varchar(100),Duration_Search_ varchar(100),Ielts_ int,
Page_Start_ int,Page_End_ int,Page_Length_ int,University_ int,Subject_1 int)
Begin 
declare SearchbyName_Value varchar(2000);
declare SearchQuery_sub varchar(2000);
declare SearchQuery_sub_section varchar(2000);
set SearchQuery_sub=' ';
set SearchbyName_Value='';
set SearchQuery_sub_section=' ';


if Intake_Id_!='' &&  Intake_Id_!='0'  then
	#SET SearchbyName_Value =concat(SearchbyName_Value," );
    set SearchbyName_Value =concat(SearchbyName_Value,"  and course_id in (select course_id from  course_intake where
    Intake_Id in(",Intake_Id_,"))");
end if;

/*if Intake_Year_Id_!='' &&  Intake_Year_Id_!='0'  then
	#SET SearchbyName_Value =concat(SearchbyName_Value," );
    set SearchbyName_Value =concat(SearchbyName_Value,"  and course_id in (select course_id from  course_intake where
    Intake_Year_Id in(",Intake_Year_Id_,"))");
end if;*/


if Sub_Section_Id_!='' &&  Sub_Section_Id_!='0' then
	#SET SearchbyName_Value =concat(SearchbyName_Value," );
    set SearchQuery_sub_section=concat(" and Sub_Section_Id in(",Sub_Section_Id_,")");
end if;
if Level_Detail_Id_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and course.Level_Id =",Level_Detail_Id_);
end if;
if Country_Id_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and Course.Country_Id =",Country_Id_);
end if;
if Ielts_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and course.Ielts_Minimum_Score  <=",Ielts_);
end if;
if Course_Name_!='' then
SET SearchbyName_Value =   Concat(SearchbyName_Value, " and( course.Course_Name like '%",Course_Name_ ,"%'") ;
SET SearchbyName_Value =   Concat(SearchbyName_Value, " or course.Tag like '%",Course_Name_ ,"%')") ;
end if;
/*if Duration_Search_!='' then
SET SearchbyName_Value =   Concat( SearchbyName_Value," and Course.Duration_Id in (",Duration_Search_ ,")") ;
end if;
if Branch_Search_!='' then
SET SearchbyName_Value =   Concat( SearchbyName_Value," and Course.Subject_Id in (",Branch_Search_ ,")") ;
end if;*/
if University_!='' then
SET SearchbyName_Value =   Concat( SearchbyName_Value," and Course.University_Id in (",University_ ,")") ;
end if;
if Subject_1!='' then
SET SearchbyName_Value =   Concat( SearchbyName_Value," and Course.Subject_Id in (",Subject_1 ,")") ;
end if;
SET @query = Concat("SELECT course.Course_Id,Course_Name,Country_Name,University_Name,false More_Information
from Course 
inner join country on course.Country_Id = country.Country_Id
inner join university  on course.University_Id = university.University_Id ",SearchQuery_sub,SearchQuery_sub_section," 
where Course.DeleteStatus = false  " ,SearchbyName_Value," order by Course.Course_Name desc Limit 5");

#insert into db_logs values(Duration_Search_,@query,1,0);
PREPARE QUERY FROM @query;
EXECUTE QUERY;

#select @query;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Register_Candidate`(In Student_Id_ int , User_Id_ int )
BEGIN
Declare Target_ int;declare Registration_Branch_ int;declare Student_Registration_Id_ int;
declare Registered_User_ varchar(100);declare Registered_Branch_Name_ varchar(100);
set Registration_Branch_=(select Branch_Id from user_details where User_Details_Id= User_Id_);
set Target_=(select Registration_Target from user_details where User_Details_Id=User_Id_ );
set Registered_User_=(select User_Details_Name from user_details where User_Details_Id=User_Id_ );
set Registered_Branch_Name_=(select Branch_Name from branch where Branch_Id=Registration_Branch_);
set Student_Registration_Id_ = (SELECT  COALESCE( MAX(Student_Registration_Id ),0)+1 FROM Student);
Update Student set Is_Registered = true , Registered_By = User_Id_ , Registered_On = now(),
Registration_Target=Target_,Registration_Branch=Registration_Branch_,
Student_Registration_Id = Student_Registration_Id_,
Registered_User=Registered_User_,Registered_Branch=Registered_Branch_Name_
where Student_Id = Student_Id_;
select Student_Id_;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Remarks_Typeahead`( In Remarks_Name_ varchar(100))
Begin
 set Remarks_Name_ = Concat( '%',Remarks_Name_ ,'%');
select  Remarks.Remarks_Id,Remarks_Name
From Remarks
where  Remarks.DeleteStatus=false
order by Remarks_Name asc   ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Remove_Activity`(In Application_details_Id_ int )
BEGIN
Update application_details set Activation_Status = false
where Application_details_Id = Application_details_Id_;
Update application_details_history set Activation_Status = false
where Application_details_Id = Application_details_Id_;
select Application_details_Id_;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Remove_Registration`(In Student_Id_ int )
BEGIN
Update Student set Is_Registered = false,Student_Registration_Id=0
where Student_Id = Student_Id_;
select Student_Id_;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Resume_Mode_Dropdown`()
BEGIN
select * from resume_mode;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Account_Group`( In Account_Group_Id_ decimal,
Primary_Id_ decimal,
Group_Code_ varchar(50),
Group_Name_ varchar(200),
Link_Left_ decimal,
Link_Right_ decimal,
Under_Group_ decimal,
IsPrimary_ varchar(1),
CanDelete_ varchar(1),
UserId_ decimal)
Begin 
 if  Account_Group_Id_>0
 THEN 
 UPDATE Account_Group set Account_Group_Id = Account_Group_Id_ ,
Primary_Id = Primary_Id_ ,
Group_Code = Group_Code_ ,
Group_Name = Group_Name_ ,
Link_Left = Link_Left_ ,
Link_Right = Link_Right_ ,
Under_Group = Under_Group_ ,
IsPrimary = IsPrimary_ ,
CanDelete = CanDelete_ ,
UserId = UserId_  Where Account_Group_Id=Account_Group_Id_ ;
 ELSE 
 SET Account_Group_Id_ = (SELECT  COALESCE( MAX(Account_Group_Id ),0)+1 FROM Account_Group); 
 INSERT INTO Account_Group(Account_Group_Id ,
Primary_Id ,
Group_Code ,
Group_Name ,
Link_Left ,
Link_Right ,
Under_Group ,
IsPrimary ,
CanDelete ,
UserId ,
DeleteStatus ) values (Account_Group_Id_ ,
Primary_Id_ ,
Group_Code_ ,
Group_Name_ ,
Link_Left_ ,
Link_Right_ ,
Under_Group_ ,
IsPrimary_ ,
CanDelete_ ,
UserId_ ,
false);
 End If ;
 select Account_Group_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Agent`( In Client_Accounts_Id_ decimal,
Account_Group_Id_ decimal,Client_Accounts_Code_ varchar(50),Client_Accounts_Name_ varchar(500),
Client_Accounts_No_ varchar(50),Address1_ varchar(250),Address2_ varchar(250),
Address3_ varchar(250),Address4_ varchar(250),PinCode_ varchar(50),StateCode_ varchar(50),
GSTNo_ varchar(50) ,PanNo_ varchar(50),State_ varchar(1000),Country_ varchar(1000),
Phone_ varchar(50),Mobile_ varchar(50),Email_ varchar(200),Opening_Balance_ decimal,
Description1_ varchar(1000),UserId_ decimal,LedgerInclude_ varchar(50),CanDelete_ varchar(2),
Commision_ decimal,Opening_Type_ int,Employee_Id_ decimal(18,0))
Begin 
declare Entry_Date_ datetime;
set Entry_Date_=(SELECT CURRENT_DATE());
 if  Client_Accounts_Id_>0
 THEN 
 UPDATE Client_Accounts set 
Account_Group_Id = Account_Group_Id_ ,Client_Accounts_Code = Client_Accounts_Code_ ,
Client_Accounts_Name = Client_Accounts_Name_ ,Client_Accounts_No = Client_Accounts_No_ ,
Address1 = Address1_ ,Address2 = Address2_ ,Address3 = Address3_ ,Address4 = Address4_ ,
PinCode = PinCode_ ,StateCode=StateCode_,GSTNo =GSTNo_,PanNo =PanNo_,
State = State_ ,Country = Country_ ,Phone = Phone_ ,Mobile = Mobile_ ,Email = Email_ ,
Opening_Balance = Opening_Balance_ ,Description1 = Description1_ ,Entry_Date = Entry_Date_ ,
UserId = UserId_ ,LedgerInclude = LedgerInclude_ ,CanDelete = CanDelete_ ,
Commision = Commision_ ,Opening_Type=Opening_Type_ ,Employee_Id=Employee_Id_ 
Where Client_Accounts_Id=Client_Accounts_Id_ ;
 ELSE 
 SET Client_Accounts_Id_ = (SELECT  COALESCE( MAX(Client_Accounts_Id ),0)+1 FROM Client_Accounts); 
 INSERT INTO Client_Accounts(Client_Accounts_Id ,Account_Group_Id ,Client_Accounts_Code ,
Client_Accounts_Name ,Client_Accounts_No ,Address1 ,Address2 ,Address3 ,Address4 ,PinCode ,
StateCode,GSTNo,PanNo, State ,Country ,Phone ,Mobile ,Email ,Opening_Balance ,Description1 ,
Entry_Date ,UserId ,LedgerInclude ,CanDelete ,Commision ,Opening_Type,Employee_Id,DeleteStatus ) 
values (Client_Accounts_Id_ ,Account_Group_Id_ ,Client_Accounts_Code_ ,Client_Accounts_Name_ ,
Client_Accounts_No_ ,Address1_ ,Address2_ ,Address3_ ,Address4_ ,PinCode_ ,
StateCode_,GSTNo_,PanNo_, State_ ,Country_ ,Phone_ ,Mobile_ ,Email_ ,Opening_Balance_ ,Description1_ ,
Entry_Date_ ,UserId_ ,LedgerInclude_ ,CanDelete_ ,Commision_ ,Opening_Type_,Employee_Id_,false);
	#set Client_Accounts_Id_=(SELECT LAST_INSERT_ID());
 End If ;
 select Client_Accounts_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Agent_Details`( In Agent_Id_ int,Agent_Name_ varchar(500) ,Phone_ varchar(45), Email_ varchar(100) ,
Address_ varchar(500), Description_ varchar(500))
Begin 
 if  Agent_Id_>0
 THEN 
 UPDATE agent set Agent_Id = Agent_Id_ ,
Agent_Name = Agent_Name_,Phone =Phone_,Email=Email_,Address=Address_,Description =Description_ Where Agent_Id=Agent_Id_ ;
 ELSE 
 SET Agent_Id_ = (SELECT  COALESCE( MAX(Agent_Id ),0)+1 FROM agent); 
 INSERT INTO agent(Agent_Id,Agent_Name,Phone,Email,Address,Description,DeleteStatus) values ( Agent_Id_,Agent_Name_,Phone_,Email_,Address_,Description_,false );
 End If ;
 select Agent_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_ApplicationDetails`( In Application_details_Id_ int,
Student_Id_ int,Country_Id_ int,Country_Name_ varchar(50),University_Id_ int,
University_Name_ varchar(150),Course_Id_ int,Course_Name_ varchar(500),
intake_Id_ int,intake_Name_ varchar(150),Intake_Year_Id_ int,Intake_Year_Name_ varchar(45),
Date_Of_Applying_ datetime,Remark_ varchar(450),Application_status_Id_ int,
Application_Status_Name_ varchar(45),Agent_Id_ int,Agent_Name_ varchar(150))
Begin 
declare old_Country_Id_ int;declare old_University_Id_ int;declare old_Course_Id_ int;
declare old_intake_Id_ int;declare old_Intake_Year_Id_ int;declare old_Application_status_Id_ int;
declare old_Agent_Id_ int;declare old_Country_Name_ varchar(1000);declare old_University_Name_  varchar(1000);declare old_Course_Name_  varchar(1000);
declare old_intake_Name_  varchar(1000);declare old_Intake_Year_Name_  varchar(1000);declare old_Application_status_Name_  varchar(1000);
declare old_Agent_Name_  varchar(1000);declare old_Remark_  varchar(1000);


 if  Application_details_Id_>0
 THEN 
 set old_Country_Id_=(select Country_Id from application_details where Application_details_Id =Application_details_Id_);
 set old_Country_Name_=(select Country_Name from application_details where Application_details_Id =Application_details_Id_);
set old_University_Id_=(select University_Id from application_details where   Application_details_Id =Application_details_Id_);
set old_University_Name_=(select University_Name from application_details where   Application_details_Id =Application_details_Id_);
set old_Course_Id_=(select Course_Id from application_details where   Application_details_Id =Application_details_Id_);
set old_Course_Name_=(select Course_Name from application_details where   Application_details_Id =Application_details_Id_);
set old_intake_Id_=(select intake_Id from application_details where   Application_details_Id =Application_details_Id_);
set old_intake_Name_=(select intake_Name from application_details where   Application_details_Id =Application_details_Id_);
set old_Intake_Year_Id_=(select Intake_Year_Id from application_details where  Application_details_Id =Application_details_Id_);
set old_Intake_Year_Name_=(select Intake_Year_Name from application_details where  Application_details_Id =Application_details_Id_);
set old_Application_status_Id_=(select Application_status_Id from application_details where  Application_details_Id =Application_details_Id_);
set old_Application_status_Name_=(select Application_Status_Name from application_details where  Application_details_Id =Application_details_Id_);
set old_Agent_Id_=(select Agent_Id from application_details where   Application_details_Id =Application_details_Id_);
set old_Agent_Name_=(select Agent_Name from application_details where   Application_details_Id =Application_details_Id_);
set old_Remark_=(select Remark from application_details where   Application_details_Id =Application_details_Id_);

 if old_Country_Id_ != Country_Id_ or old_University_Id_ != University_Id_ or
 old_Course_Id_ != Course_Id_ or  old_intake_Id_ != intake_Id_ or
old_Intake_Year_Id_ != Intake_Year_Id_ or old_Application_status_Id_ != Application_status_Id_ or
old_Agent_Id_ != Agent_Id_ 
then
 #SET Application_details_Id_ = (SELECT  COALESCE( MAX(Application_details_Id ),0)+1 FROM application_details_history); 
 insert into application_details_history (Application_details_Id,Student_Id,Country_Id,Country_Name,
 University_Id,University_Name,Course_Id,Course_Name,
 intake_Id,intake_Name,Intake_Year_Id,Intake_Year_Name,Date_Of_Applying,Remark,
 Application_status_Id,Application_Status_Name,Agent_Id,Agent_Name,DeleteStatus)
values (Application_details_Id_,Student_Id_,old_Country_Id_,old_Country_Name_,old_University_Id_,
old_University_Name_,old_Course_Id_,old_Course_Name_,
 old_intake_Id_,old_intake_Name_,Intake_Year_Id_,old_Intake_Year_Name_,Date_Of_Applying_,old_Remark_,
 old_Application_status_Id_,old_Application_status_Name_,old_Agent_Id_,old_Agent_Name_,false );
 End If ;
 UPDATE application_details set
Student_Id = Student_Id_,Country_Id = Country_Id_,Country_Name=Country_Name_,
University_Id=University_Id_,University_Name=University_Name_,Course_Id=Course_Id_,
Course_Name=Course_Name_,intake_Id=intake_Id_,intake_Name=intake_Name_,
Intake_Year_Id=Intake_Year_Id_,Intake_Year_Name=Intake_Year_Name_,
Date_Of_Applying=Date_Of_Applying_,Remark=Remark_,Application_status_Id=Application_status_Id_,
Application_Status_Name=Application_Status_Name_,Agent_Id=Agent_Id_,Agent_Name=Agent_Name_
  Where Application_details_Id=Application_details_Id_;
 ELSE 
 SET Application_details_Id_ = (SELECT  COALESCE( MAX(Application_details_Id ),0)+1 FROM application_details); 
 INSERT INTO application_details(Application_details_Id ,Student_Id,Country_Id,
 Country_Name,University_Id,University_Name,Course_Id,Course_Name,intake_Id,
 intake_Name,Intake_Year_Id,Intake_Year_Name,Date_Of_Applying,Remark,Application_status_Id,
 Application_Status_Name,Agent_Id,Agent_Name,Activation_Status,
DeleteStatus) 
values (Application_details_Id_ ,Student_Id_,Country_Id_,
 Country_Name_,University_Id_,University_Name_,Course_Id_,Course_Name_,intake_Id_,
 intake_Name_,Intake_Year_Id_,Intake_Year_Name_,Date_Of_Applying_,Remark_,Application_status_Id_,
 Application_Status_Name_,Agent_Id_,Agent_Name_,0,false );
 End If ;

 select Application_details_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_ApplicationDetails_Datas`(In Applicationdetails_ Json,
Applicationdetails_Value_ int,
application_document_ Json,application_document_Value_ int )
Begin
declare Application_details_Id_ int;declare Student_Id_ int;
declare Country_Id_ int;declare Country_Name_ varchar(50);declare SlNo_ int;
declare University_Id_ int;
declare University_Name_ varchar(150);declare Course_Id_ int;declare Course_Name_ varchar(500);
declare intake_Id_ int;declare intake_Name_ varchar(150);declare Intake_Year_Id_ int;
declare Intake_Year_Name_ varchar(45);
declare Date_Of_Applying_ datetime;declare Remark_ varchar(450);
declare Application_status_Id_ int;
declare Application_Status_Name_ varchar(45);
declare Agent_Id_ int;declare Agent_Name_ varchar(150);declare Application_No_ varchar(45);declare Student_Reference_Id_ varchar(45);
#declare Reference_No_ int;
#declare Activation_Status_ tinyint;
declare old_Country_Id_ int;declare old_University_Id_ int;declare old_Course_Id_ int;
declare old_intake_Id_ int;declare old_Intake_Year_Id_ int;declare old_Application_status_Id_ int;
declare old_Agent_Id_ int;declare old_Country_Name_ varchar(1000);declare old_University_Name_  varchar(1000);declare old_Course_Name_  varchar(1000);
declare old_intake_Name_  varchar(1000);declare old_Intake_Year_Name_  varchar(1000);declare old_Application_status_Name_  varchar(1000);
declare old_Agent_Name_  varchar(1000);declare old_Remark_  varchar(1000);
declare ApplicationFile_Name_  varchar(500);declare ApplicationDocument_Name_  varchar(500);Declare i int default 0;
Declare j int default 0;declare ApplicationDocument_File_Name_  varchar(500);declare User_Id_ int;
Declare Subject_Id_ int ;
Declare Duration_Id_ int ;
Declare Level_Id_ int; 
Declare Ielts_Minimum_Score_ varchar(500) ;
Declare internship_Id_ int;

/*DECLARE exit handler for sqlexception
BEGIN
#set innodb_lock_wait_timeout=500;
GET DIAGNOSTICS CONDITION 1
@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p2 AS MESSAGE_TEXT, @p1 AS RETURNED_SQLSTATE;
ROLLBACK;
END;
    DECLARE exit handler for sqlwarning
BEGIN
GET DIAGNOSTICS CONDITION 1
@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p2 AS MESSAGE_TEXT, @p1 AS RETURNED_SQLSTATE;
ROLLBACK;
END;

    START TRANSACTION;*/
 
if( Applicationdetails_Value_>0) then
SELECT JSON_UNQUOTE (JSON_EXTRACT(Applicationdetails_,'$.Application_details_Id')) INTO Application_details_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Applicationdetails_,'$.Student_Id')) INTO Student_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Applicationdetails_,'$.Country_Id')) INTO Country_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Applicationdetails_,'$.Country_Name')) INTO Country_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Applicationdetails_,'$.University_Id')) INTO University_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Applicationdetails_,'$.University_Name')) INTO University_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Applicationdetails_,'$.Course_Id')) INTO Course_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Applicationdetails_,'$.Course_Name')) INTO Course_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Applicationdetails_,'$.intake_Id')) INTO intake_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Applicationdetails_,'$.intake_Name')) INTO intake_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Applicationdetails_,'$.Intake_Year_Id')) INTO Intake_Year_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Applicationdetails_,'$.Intake_Year_Name')) INTO Intake_Year_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Applicationdetails_,'$.Date_Of_Applying')) INTO Date_Of_Applying_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Applicationdetails_,'$.Remark')) INTO Remark_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Applicationdetails_,'$.Application_status_Id')) INTO Application_status_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Applicationdetails_,'$.Application_Status_Name')) INTO Application_Status_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Applicationdetails_,'$.Agent_Id')) INTO Agent_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Applicationdetails_,'$.Agent_Name')) INTO Agent_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Applicationdetails_,'$.User_Id')) INTO User_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Applicationdetails_,'$.Application_No')) INTO Application_No_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Applicationdetails_,'$.Student_Reference_Id')) INTO Student_Reference_Id_;

if(Country_Id_ =0)
then
SET Country_Id_ = (SELECT  COALESCE( MAX(Country_Id ),0)+1 FROM country);    
insert into country values(Country_Id_,Country_Name_,0);          
end if;  
if(University_Id_ =0)
then
SET University_Id_ = (SELECT  COALESCE( MAX(University_Id ),0)+1 FROM university);    
insert into university(University_Id,University_Name,DeleteStatus) values(University_Id_,University_Name_,0);          
end if;  
if(Course_Id_ =0)
then
set intake_Id_ =(select COALESCE( MAX(intake_Id ),0)  from intake where intake_Name=intake_Name_);
SET Course_Id_ = (SELECT  COALESCE( MAX(Course_Id ),0)+1 FROM course);    
insert into course(Course_Id,Country_Id,University_Id,Course_Name,intake_Name, Subject_Id,Duration_Id,Level_Id,Ielts_Minimum_Score,internship_Id,IELTS_Name,Sub_Section_Id,DeleteStatus)
values(Course_Id_,Country_Id_,University_Id_,Course_Name_,intake_Name_,0,0,0,0,0,0,0,0);  
insert into course_intake(Course_Id,intake_Id,intake_Status) values(Course_Id_,intake_Id_,1) ;  
end if;
if(Application_details_Id_>0) then
 #SET Application_details_Id_ = (SELECT  COALESCE( MAX(Application_details_Id ),0)+1 FROM application_details_history);
 #set SlNo_ = (SELECT  COALESCE( MAX(SlNo ),0)+1 FROM application_details_history where Application_details_Id = Application_details_Id_);
 insert into application_details_history (Application_details_Id,Student_Id,Country_Id,Country_Name,
 University_Id,University_Name,Course_Id,Course_Name,
 intake_Id,intake_Name,Intake_Year_Id,Intake_Year_Name,Date_Of_Applying,Remark,
 Application_status_Id,Application_Status_Name,Agent_Id,Agent_Name,Activation_Status,SlNo,User_Id,DeleteStatus)
values (Application_details_Id_,Student_Id_,Country_Id_,Country_Name_,University_Id_,
University_Name_,Course_Id_,Course_Name_,
 intake_Id_,intake_Name_,Intake_Year_Id_,Intake_Year_Name_,Date_Of_Applying_,Remark_,
 Application_status_Id_,Application_Status_Name_,Agent_Id_,Agent_Name_,0,0,User_Id_,false );
# End If ;

 UPDATE application_details set
Student_Id = Student_Id_,Country_Id = Country_Id_,Country_Name=Country_Name_,
University_Id=University_Id_,University_Name=University_Name_,Course_Id=Course_Id_,
Course_Name=Course_Name_,intake_Id=intake_Id_,intake_Name=intake_Name_,

#Subject_Id=Subject_Id_,Duration_Id=Duration_Id_,Level_Id=Level_Id_,Ielts_Minimum_Score=Ielts_Minimum_Score_,internship_Id=internship_Id_,IELTS_Name=IELTS_Name_,Sub_Section_Id=Sub_Section_Id_,

Intake_Year_Id=Intake_Year_Id_,Intake_Year_Name=Intake_Year_Name_,
Date_Of_Applying=Date_Of_Applying_,Remark=Remark_,Application_status_Id=Application_status_Id_,
Application_Status_Name=Application_Status_Name_,Agent_Id=Agent_Id_,Agent_Name=Agent_Name_,Application_No=Application_No_,Student_Reference_Id=Student_Reference_Id_
  Where Application_details_Id=Application_details_Id_;
 ELSE
 SET Application_details_Id_ = (SELECT  COALESCE( MAX(Application_details_Id ),0)+1 FROM application_details);
set SlNo_ = (SELECT  COALESCE( MAX(SlNo ),0)+1 FROM application_details where Student_Id = Student_Id_);
INSERT INTO application_details(Application_details_Id ,Student_Id,Country_Id,
 Country_Name,University_Id,University_Name,Course_Id,Course_Name,intake_Id,intake_Name,
 
 #Subject_Id,Duration_Id,Level_Id,Ielts_Minimum_Score,internship_Id,IELTS_Name,Sub_Section_Id,
 
 Intake_Year_Id,Intake_Year_Name,Date_Of_Applying,Remark,Application_status_Id,
 Application_Status_Name,Agent_Id,Agent_Name,Activation_Status,SlNo,User_Id,Application_No,Student_Reference_Id,
DeleteStatus)
values (Application_details_Id_ ,Student_Id_,Country_Id_,
 Country_Name_,University_Id_,University_Name_,Course_Id_,Course_Name_,intake_Id_,intake_Name_,
 
 #0,0,0,0,0,0,0,
 
 Intake_Year_Id_,Intake_Year_Name_,Date_Of_Applying_,Remark_,Application_status_Id_,
 Application_Status_Name_,Agent_Id_,Agent_Name_,0,SlNo_,User_Id_,Application_No_,Student_Reference_Id_,false );
 insert into application_details_history (Application_details_Id,Student_Id,Country_Id,Country_Name,
 University_Id,University_Name,Course_Id,Course_Name,
 intake_Id,intake_Name,
  #Subject_Id,Duration_Id,Level_Id,Ielts_Minimum_Score,internship_Id,IELTS_Name,Sub_Section_Id_,
 Intake_Year_Id,Intake_Year_Name,Date_Of_Applying,Remark,
 Application_status_Id,Application_Status_Name,Agent_Id,Agent_Name,SlNo,User_Id,Activation_Status,DeleteStatus)
values (Application_details_Id_,Student_Id_,Country_Id_,Country_Name_,University_Id_,
University_Name_,Course_Id_,Course_Name_,
 intake_Id_,intake_Name_,
  #0,0,0,0,0,0,0,
 Intake_Year_Id_,Intake_Year_Name_,Date_Of_Applying_,Remark_,
 Application_status_Id_,Application_Status_Name_,Agent_Id_,Agent_Name_,SlNo_,User_Id_,0,false );
 End If ;
 end if;
 if( application_document_Value_>0) then
WHILE j < JSON_LENGTH(application_document_) DO
SELECT JSON_UNQUOTE (JSON_EXTRACT(application_document_,CONCAT('$[',j,'].ApplicationFile_Name'))) INTO ApplicationFile_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(application_document_,CONCAT('$[',j,'].ApplicationDocument_Name'))) INTO ApplicationDocument_Name_;
        SELECT JSON_UNQUOTE (JSON_EXTRACT(application_document_,CONCAT('$[',j,'].ApplicationDocument_File_Name'))) INTO ApplicationDocument_File_Name_;
        insert into application_document (Student_Id,ApplicationFile_Name,ApplicationDocument_Name,
        ApplicationDocument_File_Name,Application_details_Id,DeleteStatus)
        values(Student_Id_,ApplicationFile_Name_,
        ApplicationDocument_Name_,ApplicationDocument_File_Name_,Application_details_Id_,0);

SELECT j + 1 INTO j;      
END WHILE;
 end if;
#commit;
 select Application_details_Id_,Country_Id_,University_Id_,Course_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Branch`( In Branch_Id_ int,Branch_Name_ varchar(50),
Address_ varchar(50),Location_ varchar(50),District_ varchar(50),State_ varchar(50),
Country_ varchar(50),PinCode_ varchar(50),Phone_Number_ varchar(50),Email_ varchar(50),
Branch_Code_ varchar(10),Company_ int,Branch_Department JSON)
Begin 

DECLARE Department_Id_ int;
DECLARE i int  DEFAULT 0;

  /*  DECLARE exit handler for sqlexception
BEGIN
GET DIAGNOSTICS CONDITION 1
@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p2 as MESSAGE_TEXT,@p1 as RETURNED_SQLSTATE  ;
ROLLBACK;
END;
    DECLARE exit handler for sqlwarning
BEGIN
GET DIAGNOSTICS CONDITION 1
@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p2 as MESSAGE_TEXT,@p1 as RETURNED_SQLSTATE  ;
ROLLBACK;
END;
    START TRANSACTION;*/

if  Branch_Id_>0
	THEN 
	delete from Branch_Department where Branch_id=Branch_Id_;
	UPDATE Branch 
	SET 
	Branch_Id = Branch_Id_,Branch_Name = Branch_Name_,Address = Address_,Location = Location_,
	District = District_,State = State_,Country = Country_,PinCode = PinCode_,
	Phone_Number = Phone_Number_,Email = Email_,Branch_Code = Branch_Code_,Company=Company_
	WHERE
	Branch_Id = Branch_Id_;
     update student set Branch_Name = Branch_Name_ where Branch = Branch_Id_;
     update student set Registered_Branch = Branch_Name_ where Registration_Branch = Branch_Id_;
	ELSE 
	SET Branch_Id_ = (SELECT  COALESCE( MAX(Branch_Id ),0)+1 FROM Branch); 
	INSERT INTO Branch(Branch_Id ,Branch_Name ,Address ,Location ,District ,State ,Country ,PinCode ,
	Phone_Number ,Email ,Branch_Code ,Company,Is_Delete )
	values (Branch_Id_ ,Branch_Name_ ,Address_ ,Location_ ,District_ ,State_ ,Country_ ,PinCode_ ,
	Phone_Number_ ,Email_ ,Branch_Code_ ,Company_,false);
End If ;

WHILE i < JSON_LENGTH(Branch_Department) DO
	SELECT JSON_UNQUOTE(JSON_EXTRACT(Branch_Department,CONCAT('$[',i,'].Department_Id'))) INTO Department_Id_;
	INSERT INTO Branch_Department(Branch_Id,Department_Id,Is_Delete )
	values (Branch_Id_ ,Department_Id_,false);  
	SELECT i + 1 INTO i;
END WHILE;     
#COMMIT;

SELECT Branch_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Check_List`( In Check_List_Id_ int,
Check_List_Name_ varchar(100))
Begin 
 if  Check_List_Id_>0
 THEN 
 UPDATE check_list set Check_List_Id = Check_List_Id_ ,
Check_List_Name = Check_List_Name_   Where Check_List_Id=Check_List_Id_ ;
 ELSE 
 SET Check_List_Id_ = (SELECT  COALESCE( MAX(Check_List_Id ),0)+1 FROM check_list); 
 INSERT INTO check_list(Check_List_Id ,
Check_List_Name ,
DeleteStatus ) values (Check_List_Id_ ,
Check_List_Name_ ,
false);
 End If ;
 select Check_List_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Client_Accounts`( In Client_Accounts_Id_ decimal,
Account_Group_Id_ decimal,Client_Accounts_Code_ varchar(50),Client_Accounts_Name_ varchar(500),
Client_Accounts_No_ varchar(50),Address1_ varchar(250),Address2_ varchar(250),
Address3_ varchar(250),Address4_ varchar(250),PinCode_ varchar(50),StateCode_ varchar(50),
GSTNo_ varchar(50) ,PanNo_ varchar(50),State_ varchar(1000),Country_ varchar(1000),
Phone_ varchar(50),Mobile_ varchar(50),Email_ varchar(200),Opening_Balance_ decimal,
Description1_ varchar(1000),UserId_ decimal,LedgerInclude_ varchar(50),CanDelete_ varchar(2),
Commision_ decimal,Opening_Type_ int,Employee_Id_ decimal(18,0))
Begin 
declare Entry_Date_ datetime;
set Entry_Date_=(SELECT CURRENT_DATE());
 if  Client_Accounts_Id_>0
 THEN 
 UPDATE Client_Accounts set 
Account_Group_Id = Account_Group_Id_ ,Client_Accounts_Code = Client_Accounts_Code_ ,
Client_Accounts_Name = Client_Accounts_Name_ ,Client_Accounts_No = Client_Accounts_No_ ,
Address1 = Address1_ ,Address2 = Address2_ ,Address3 = Address3_ ,Address4 = Address4_ ,
PinCode = PinCode_ ,StateCode=StateCode_,GSTNo =GSTNo_,PanNo =PanNo_,
State = State_ ,Country = Country_ ,Phone = Phone_ ,Mobile = Mobile_ ,Email = Email_ ,
Opening_Balance = Opening_Balance_ ,Description1 = Description1_ ,Entry_Date = Entry_Date_ ,
UserId = UserId_ ,LedgerInclude = LedgerInclude_ ,CanDelete = CanDelete_ ,
Commision = Commision_ ,Opening_Type=Opening_Type_ ,Employee_Id=Employee_Id_ 
Where Client_Accounts_Id=Client_Accounts_Id_ ;
 ELSE 
 SET Client_Accounts_Id_ = (SELECT  COALESCE( MAX(Client_Accounts_Id ),0)+1 FROM Client_Accounts); 
 INSERT INTO Client_Accounts(Client_Accounts_Id ,Account_Group_Id ,Client_Accounts_Code ,
Client_Accounts_Name ,Client_Accounts_No ,Address1 ,Address2 ,Address3 ,Address4 ,PinCode ,
StateCode,GSTNo,PanNo, State ,Country ,Phone ,Mobile ,Email ,Opening_Balance ,Description1 ,
Entry_Date ,UserId ,LedgerInclude ,CanDelete ,Commision ,Opening_Type,Employee_Id,DeleteStatus ) 
values (Client_Accounts_Id_ ,Account_Group_Id_ ,Client_Accounts_Code_ ,Client_Accounts_Name_ ,
Client_Accounts_No_ ,Address1_ ,Address2_ ,Address3_ ,Address4_ ,PinCode_ ,
StateCode_,GSTNo_,PanNo_, State_ ,Country_ ,Phone_ ,Mobile_ ,Email_ ,Opening_Balance_ ,Description1_ ,
Entry_Date_ ,UserId_ ,LedgerInclude_ ,CanDelete_ ,Commision_ ,Opening_Type_,Employee_Id_,false);
	#set Client_Accounts_Id_=(SELECT LAST_INSERT_ID());
 End If ;
 select Client_Accounts_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Company`( In Company_ JSON, Company_value_ int)
Begin 
DECLARE Company_Id_ int;DECLARE companyname_ varchar(45);DECLARE Phone1_ varchar(45);
DECLARE Phone2_ varchar(45);DECLARE Mobile_ varchar(45);DECLARE Website_ varchar(500);
DECLARE Email_ varchar(500);DECLARE Address1_ varchar(1000);
DECLARE Address2_ varchar(1000);DECLARE Address3_ varchar(45);DECLARE Logo_ varchar(45);
#DECLARE i int  DEFAULT 0;
/*DECLARE exit handler for sqlexception
BEGIN
	GET DIAGNOSTICS CONDITION 1
	@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
	SELECT @p2 AS MESSAGE_TEXT, @p1 AS RETURNED_SQLSTATE;
	ROLLBACK;
END;
    DECLARE exit handler for sqlwarning
BEGIN
	GET DIAGNOSTICS CONDITION 1
	@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
	SELECT @p2 AS MESSAGE_TEXT, @p1 AS RETURNED_SQLSTATE;
	ROLLBACK;
END;
    START TRANSACTION;*/
   # delete from Company where Company_Id =1;
if(Company_value_>0) then
	SELECT JSON_UNQUOTE (JSON_EXTRACT(Company_,('$.Company_Id'))) INTO Company_Id_;   
	SELECT JSON_UNQUOTE (JSON_EXTRACT(Company_,('$.companyname'))) INTO companyname_;
	SELECT JSON_UNQUOTE (JSON_EXTRACT(Company_,('$.Phone1'))) INTO Phone1_;
	SELECT JSON_UNQUOTE (JSON_EXTRACT(Company_,('$.Phone2'))) INTO Phone2_;
	SELECT JSON_UNQUOTE (JSON_EXTRACT(Company_,('$.Mobile'))) INTO Mobile_;
	SELECT JSON_UNQUOTE (JSON_EXTRACT(Company_,('$.Website'))) INTO Website_;
	SELECT JSON_UNQUOTE (JSON_EXTRACT(Company_,('$.Email'))) INTO Email_;
	SELECT JSON_UNQUOTE (JSON_EXTRACT(Company_,('$.Address1'))) INTO Address1_;
	SELECT JSON_UNQUOTE (JSON_EXTRACT(Company_,('$.Address2'))) INTO Address2_;
	SELECT JSON_UNQUOTE (JSON_EXTRACT(Company_,('$.Address3'))) INTO Address3_;
	SELECT JSON_UNQUOTE (JSON_EXTRACT(Company_,('$.Logo'))) INTO  Logo_;
	if( Company_Id_>0 )
	then
		if Logo_<>'' && Logo_<>'undefined' then
			UPDATE Company set Logo = Logo_ Where Company_Id=Company_Id_ ;
		end if;
		UPDATE Company set Company_Id = Company_Id_ ,companyname = companyname_ ,Phone1 = Phone1_ ,Phone2 = Phone2_ ,
		Mobile = Mobile_ ,Website = Website_ ,Email = Email_,Address1 = Address1_ ,Address2 = Address2_ ,Address3 = Address3_
		Where Company_Id = Company_Id_ ;
	 ELSE 
		SET Company_Id_ = (SELECT  COALESCE( MAX(Company_Id ),0)+1 FROM Company); 
		INSERT INTO Company(Company_Id ,companyname ,Phone1 ,Phone2 ,Mobile ,Website,Email,
		Address1,
		Address2,
		Address3,
		Logo,
		Is_Delete ) values (1 ,
		companyname_ ,
		Phone1_ ,
		Phone2_ ,
		Mobile_ ,
		Website_ ,
		Email_ ,
		Address1_ ,
		Address2_ ,
		Address3_ ,
		Logo_,
		false);
	end if;
end if;
#commit;
 select Company_Id_;
  End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Country`( In Country_Id_ int,
Country_Name_ varchar(50))
Begin 
 if  Country_Id_>0
 THEN 
 UPDATE Country set Country_Id = Country_Id_ ,
Country_Name = Country_Name_  Where Country_Id=Country_Id_ ;
 ELSE 
 SET Country_Id_ = (SELECT  COALESCE( MAX(Country_Id ),0)+1 FROM Country); 
 INSERT INTO Country(Country_Id ,
Country_Name,DeleteStatus ) values (Country_Id_ ,
Country_Name_,false );
 End If ;
 select Country_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Course`( In Course_Id_ int,
Course_Name_ varchar(500),
Subject_Id_ int,
Sub_Section_Id_ int,
Duration_Id_ int,
Level_Id_ int,
Ielts_Minimum_Score_ varchar(500),
Internship_Id_ int,
Notes_ varchar(500),
Details_ varchar(500),
Application_Fees_ varchar(500),
Tution_Fees_ varchar(200) ,
Entry_Requirement_ varchar(500),
Living_Expense_ varchar(100),
Work_Experience_ varchar(500),
Registration_Fees_ varchar(45) ,
Date_Charges_ varchar(45) ,
Bank_Statements_ varchar(45) ,
Insurance_ varchar(45) ,
VFS_Charges_ varchar(45) ,
Apostille_ varchar(45) ,
Other_Charges_ varchar(45),
IELTS_Name_ varchar(500),
Intake_Name_ varchar(200),
University_Id_ int,
Country_Id_ int,Tag_ varchar(2000), Intake_Data_ json
)
Begin 

Declare Intake_Id_ int; Declare Intake_Status_ varchar(10);Declare Intake_Selection_ varchar(10);Declare i int default 0;
Declare Ielts_Id_ int;
 Declare Duration_Name_ varchar(50);
 Declare IELTS_ varchar(50);
if  Course_Id_>0
 THEN 
 UPDATE Course set Course_Id = Course_Id_ ,
Course_Name = Course_Name_ ,
Subject_Id = Subject_Id_ ,
Sub_Section_Id = Sub_Section_Id_,
Duration_Id = Duration_Id_ ,
Level_Id = Level_Id_ ,
Ielts_Minimum_Score = Ielts_Minimum_Score_ ,
Internship_Id = Internship_Id_ ,
Notes = Notes_ ,
Details = Details_ ,
Application_Fees = Application_Fees_ ,
Tution_Fees=Tution_Fees_,
Entry_Requirement=Entry_Requirement_,
Living_Expense=Living_Expense_,
Work_Experience=Work_Experience_ ,
Registration_Fees =Registration_Fees_,
Date_Charges=Date_Charges_ ,
Bank_Statements =Bank_Statements_ ,
Insurance=Insurance_  ,
VFS_Charges=VFS_Charges_  ,
Apostille=Apostille_ ,
Other_Charges=Other_Charges_ ,
IELTS_Name=IELTS_Name_,
Intake_Name=Intake_Name_,
University_Id = University_Id_ ,
Country_Id = Country_Id_,
Tag=Tag_  Where Course_Id=Course_Id_ ;
Delete from course_intake where Course_Id=Course_Id_;
 
 ELSE 
 SET Course_Id_ = (SELECT  COALESCE( MAX(Course_Id ),0)+1 FROM Course); 
 SET Duration_Name_=(Select Duration_Name from duration where Duration_Id = Duration_Id_ );
 #SET IELTS_=(Select Ielts_Name from ielts where Minimum_Score = Ielts_Minimum_Score_ );
 INSERT INTO Course(Course_Id ,
Course_Name ,
Subject_Id ,
Sub_Section_Id ,
Duration_Id ,
Level_Id ,
Ielts_Minimum_Score ,
Internship_Id ,
Notes ,
Details ,
Application_Fees ,
Tution_Fees,
Entry_Requirement,
Living_Expense,
Work_Experience,
Registration_Fees, 
Date_Charges ,
Bank_Statements , 
Insurance,
VFS_Charges , 
Apostille ,
Other_Charges,
IELTS_Name,
Intake_Name,
Duration,
University_Id ,
Country_Id,Tag,Course_Status,DeleteStatus ) values (Course_Id_ ,
Course_Name_ ,
Subject_Id_ ,
Sub_Section_Id_ ,
Duration_Id_ ,
Level_Id_ ,
Ielts_Minimum_Score_ ,
Internship_Id_ ,
Notes_ ,
Details_ ,
Application_Fees_ ,
Tution_Fees_  ,
Entry_Requirement_ ,
Living_Expense_ ,
Work_Experience_ ,
Registration_Fees_, 
Date_Charges_ ,
Bank_Statements_ , 
Insurance_,
VFS_Charges_ , 
Apostille_ ,
Other_Charges_,
IELTS_Name_,
Intake_Name_,
Duration_Name_,
University_Id_ ,
Country_Id_,Tag_,1,false );
 End If ;
 

	#delete from temptable; 

	WHILE i < JSON_LENGTH(Intake_Data_) DO
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Intake_Data_,CONCAT('$[',i,'].Intake_Id'))) INTO Intake_Id_;
        SELECT JSON_UNQUOTE (JSON_EXTRACT(Intake_Data_,CONCAT('$[',i,'].Intake_Status'))) INTO Intake_Status_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Intake_Data_,CONCAT('$[',i,'].Intake_Selection'))) INTO Intake_Selection_;	
		#insert into temptable values(i,Intake_Selection_);
		if Intake_Selection_='true'
		then
			if Intake_Status_='true'
			then
				set Intake_Status_=1;
			else
				set Intake_Status_=0;
			end if;
			INSERT INTO course_intake(Course_Id,Intake_Id,Intake_Status) values(Course_Id_,Intake_Id_,Intake_Status_);
		end if;
	set i=i+1;
	End While;

 select  Course_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Course_Import`( In Course_Details json)
Begin
Declare  Course_Details_Id_ int; Declare i int;
Declare Course_Id_ int;Declare Course_Name_ varchar(2000) ;Declare Course_Code_ varchar(10);Declare Subject_Id_ int ;Declare Duration_Id_ int ;Declare Level_Id_ int ;
Declare Ielts_Minimum_Score_ varchar(500) ;Declare Internship_Id_ int ;Declare Notes_ varchar(500) ;Declare Details_ varchar(500) ;Declare Application_Fees_ varchar(500) ;Declare University_Id_ int ;
Declare Country_Id_ int ;Declare DeleteStatus_ tinyint;Declare Subject_Name_ varchar(150);Declare Duration_Name_ varchar(50); Declare Level_Detail_Name_ varchar(500);
Declare Minimum_Score_ varchar(500); Declare Internship_Name_ varchar(50); Declare University_Name_ varchar(50); Declare Country_Name_ varchar(50); Declare Intake_Name_ varchar(500);
Declare Level_Detail_Id_ int; Declare Ielts_Id_ int; Declare Import_Master_Id_ int;Declare Entry_Date_  tinyint; Declare Intake_Id_ int;Declare Tag_ varchar(2000);
Declare intake_temp1_ varchar(100);Declare intake_temp2_ varchar(100);Declare intake_length_ int; declare Intake_main_length int;
Declare j int default 1;
Declare Tution_Fees_ varchar(200);Declare Entry_Requirement_ varchar(500); Declare Living_Expense_ varchar(100);Declare Work_Experience_ varchar(500);
Declare Registration_Fees_ varchar(200);Declare Date_Charges_ varchar(500); Declare Bank_Statements_ varchar(100);Declare Insurance_ varchar(500);
Declare VFS_Charges_ varchar(500);Declare Other_Charges_ varchar(500);
Declare Apostille_ varchar(500);Declare Sub_Section_Id_ int ;Declare Sub_Section_Name_ varchar(150);
Declare intake_temp3_ varchar(100);
Declare Course_Status int;
Set i=0;
SET import_master_id_ = (SELECT  COALESCE( MAX(import_master_id ),0)+1 FROM import_master);    

insert into import_master(Import_Master_Id,Entry_Date)values(Import_Master_Id_,now());
WHILE i < JSON_LENGTH(Course_Details) DO
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Course'))) INTO Course_Name_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Code'))) INTO Course_Code_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Subject'))) INTO Subject_Name_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Duration'))) INTO Duration_Name_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Level'))) INTO Level_Detail_Name_;    
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Ielts'))) INTO Minimum_Score_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Internship'))) INTO Internship_Name_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Notes'))) INTO Notes_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Details'))) INTO Details_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Fees'))) INTO Application_Fees_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].University'))) INTO University_Name_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Country'))) INTO Country_Name_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Intake'))) INTO Intake_Name_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Tag'))) INTO Tag_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Tution_Fees'))) INTO Tution_Fees_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Entry_Requirement'))) INTO Entry_Requirement_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Living_Expense'))) INTO Living_Expense_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Work_Experience'))) INTO Work_Experience_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Registration_Fees'))) INTO Registration_Fees_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Date_Charges'))) INTO Date_Charges_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Bank_Statements'))) INTO Bank_Statements_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Insurance'))) INTO Insurance_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].VFS_Charges'))) INTO VFS_Charges_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Apostille'))) INTO Apostille_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Other_Charges'))) INTO Other_Charges_;
		SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Details,CONCAT('$[',i,'].Sub_Section'))) INTO Sub_Section_Name_;

    #insert into db_logs_ (id,Description) values(0,Intake_Name_);
   
   
set subject_id_ =(select COALESCE( MAX(subject_id ),0)  from subject where subject_name=Subject_Name_);
    if(subject_id_ =0)
    then
SET subject_id_ = (SELECT  COALESCE( MAX(subject_id ),0)+1 FROM subject);    
insert into subject values(subject_id_,Subject_Name_,1,0);
    end if;    
    set Sub_Section_Id_ =(select COALESCE( MAX(Sub_Section_Id ),0)  from sub_section where Sub_Section_Name=Sub_Section_Name_);
    if(Sub_Section_Id_ =0)
    then
SET Sub_Section_Id_ = (SELECT  COALESCE( MAX(Sub_Section_Id ),0)+1 FROM sub_section);    
insert into sub_section values(Sub_Section_Id_,Sub_Section_Name_,1,0);
    end if;    
    if ISNULL(Duration_Name_) = true then
    set Duration_Name_ = '';
    end if;
set duration_id_ =(select  COALESCE( MAX(duration_id ),0 ) from duration where duration_name=Duration_Name_);
    if(duration_id_ =0)
    then
SET duration_id_ = (SELECT  COALESCE( MAX(duration_id ),0)+1 FROM duration);    
insert into duration values(duration_id_,Duration_Name_,1,0);
    end if;    
set level_detail_id_ =(select COALESCE( MAX(level_detail_id ),0) from level_detail where level_detail_name=Level_Detail_Name_);
    if(level_detail_id_ =0)
    then
SET level_detail_id_ = (SELECT  COALESCE( MAX(level_detail_id ),0)+1 FROM level_detail);    
insert into level_detail values(level_detail_id_,Level_Detail_Name_,0);
    end if;        
set ielts_id_ =(select COALESCE( MAX(ielts_id ),0) from ielts where  Minimum_Score_>=Minimum_Score  &&  Minimum_Score_<= Maximum_Score);
    if(ielts_id_ =0)
    then
SET ielts_id_ = (SELECT  COALESCE( MAX(ielts_id ),0)+1 FROM ielts);    
insert into ielts values(ielts_id_,Minimum_Score_,Minimum_Score_,Minimum_Score_,0);
    end if;            
set internship_id_ =(select COALESCE( MAX(internship_id ),0) from internship where internship_name=Internship_Name_);
    if(internship_id_ =0)
    then
SET internship_id_ = (SELECT  COALESCE( MAX(internship_id ),0)+1 FROM internship);    
insert into internship values(internship_id_,Internship_Name_,0);
    end if;      
   set country_id_ =(select COALESCE( MAX(country_id ),0) from country where country_name=Country_Name_);
    if(country_id_ =0)
    then
SET country_id_ = (SELECT  COALESCE( MAX(country_id ),0)+1 FROM country);    
insert into country values(country_id_,Country_Name_,0);
    end if;
    
  set university_id_ =(select COALESCE( MAX(university_id ),0) from university where university_name=University_Name_);
    if(university_id_ =0)
    then
SET university_id_ = (SELECT  COALESCE( MAX(university_id ),0)+1 FROM university);    
insert into university (University_Id,University_Name,Country_Id,Level_Detail_Id,DeleteStatus) values(university_id_,University_Name_,country_id_,level_detail_id_,0);
    end if; 
  SET Course_Id_ = (SELECT  COALESCE( MAX(Course_Id ),0)  FROM Course where Course_Name=Course_name_ and  Country_Id=Country_Id_ and University_Id=University_Id_
  and Subject_Id=Subject_Id_ and Sub_Section_Id=Sub_Section_Id_
  );      
      if(Course_Id_ >0)
    then
update course  set Course_name=Course_name_ ,Course_Code=Course_Code_,Subject_Id=Subject_Id_,Duration_Id=Duration_Id_,Level_Id=Level_Detail_Id_,
        Ielts_Minimum_Score=ielts_id_,Internship_Id=Internship_Id_,Notes=Notes_,Details=Details_,Application_Fees=Application_Fees_,
        University_Id=University_Id_,Country_Id=Country_Id_, Tag=Tag_ ,Sub_Section_Id=Sub_Section_Id_ where Course_Id =Course_Id_;
 else
SET Course_Id_ = (SELECT  COALESCE( MAX(Course_Id ),0)+1 FROM Course);    
INSERT INTO Course(Course_Id,Course_Name,Course_Code,University_Id,Level_Id,Subject_Id,Duration_Id,Country_Id,Details,Tution_Fees,Work_Experience,Application_Fees,Entry_Requirement,Duration,Living_Expense,Ielts_Minimum_Score,IELTS_Name,Internship_Id,Notes,Tag,Intake_Name,Course_Status,DeleteStatus,
        Registration_Fees,Date_Charges,Bank_Statements,Insurance,VFS_Charges,Apostille,Other_Charges,Sub_Section_Id)
values (Course_Id_,Course_Name_,Course_Code_,University_Id_,Level_Detail_Id_,Subject_Id_,Duration_Id_,Country_Id_,Details_,Tution_Fees_,Work_Experience_,Application_Fees_,Entry_Requirement_,Duration_Name_,Living_Expense_,ielts_id_,Minimum_Score_,Internship_Id_,Notes_,Tag_,Intake_Name_,1,false
        ,Registration_Fees_,Date_Charges_,Bank_Statements_,Insurance_,VFS_Charges_,Apostille_,Other_Charges_,Sub_Section_Id_);  

end if;    
delete from course_intake where Course_Id=course_Id_;
do_this:
while j>0 do
#set Intake_Name_ = trim(Intake_Name_);
     
SET Intake_main_length = LENGTH(Intake_Name_);
#set Intake_temp1_ =(SELECT SUBSTRING_INDEX(Intake_Name_, ',',1));        
        set Intake_temp1_= SUBSTRING_INDEX(Intake_Name_, ",", 1);
       # set Intake_temp1_ = trim(Intake_temp1_);
       # if(Intake_temp1_ != '') then
# set intake_temp3_ =trim(Intake_temp1_);
#end if;
       

        set intake_id_ =(select COALESCE( MAX(intake_id ),0) from intake where intake_name=trim(Intake_temp1_));
if(intake_id_ =0)
then
SET intake_id_ = (SELECT  COALESCE( MAX(intake_id ),0)+1 FROM intake);    
insert into intake values(intake_id_,trim(Intake_temp1_),0);
end if;
        insert into course_intake(Course_Id,Intake_Id,Intake_Status)values(Course_Id_,Intake_Id_,1);
SET intake_length_ = LENGTH(Intake_temp1_);
        
SET Intake_Name_ = MID(Intake_Name_, intake_length_+2, Intake_main_length);
        set j=length(Intake_main_length);
        
IF Intake_Name_ = NULL || Intake_Name_ = '' THEN
set j=0;
END IF;
END while;
set j=1;
INSERT INTO import_detail(Import_Master_Id,Course_Id)values(Import_Master_Id_,Course_Id_);    
   
SELECT i + 1 INTO i;      
END WHILE;

 select  import_master_id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Department`( In Department_Id_ int,
Department_Name_ varchar(50),
FollowUp_ TInyint,
Status_ varchar(50),
Department_Order_ int,
Color_ varchar(50),
Status_Selection JSON)
Begin 
 DECLARE Status_Id_ int;
DECLARE i int  DEFAULT 0;
	
 /*   DECLARE exit handler for sqlexception
BEGIN
GET DIAGNOSTICS CONDITION 1
@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p2 as MESSAGE_TEXT,@p1 as RETURNED_SQLSTATE  ;
ROLLBACK;
END;
    DECLARE exit handler for sqlwarning
BEGIN
GET DIAGNOSTICS CONDITION 1
@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p2 as MESSAGE_TEXT,@p1 as RETURNED_SQLSTATE  ;
ROLLBACK;
END;
    START TRANSACTION;*/
    
 if  Department_Id_>0
  THEN 
	delete from Status_Selection where Department_Id=Department_Id_;
	UPDATE Department set Department_Id = Department_Id_ ,
	Department_Name = Department_Name_ ,
	FollowUp = FollowUp_ ,
	Status = Status_ ,
	Department_Order = Department_Order_ ,
	Color = Color_  Where Department_Id=Department_Id_ ;
    update student set Department_Name = Department_Name_ where Department = Department_Id_;
	ELSE 
	SET Department_Id_ = (SELECT  COALESCE( MAX(Department_Id ),0)+1 FROM Department); 
	INSERT INTO Department(Department_Id ,Department_Name ,FollowUp ,Status ,Department_Order ,
	Color ,Is_Delete ) 
	values (Department_Id_ ,Department_Name_ ,FollowUp_ ,Status_ ,Department_Order_ ,Color_ ,false);
End If ;

WHILE i < JSON_LENGTH(Status_Selection) DO
	SELECT JSON_UNQUOTE (JSON_EXTRACT(Status_Selection,CONCAT('$[',i,'].Department_Status_Id'))) INTO Status_Id_;
	INSERT INTO Status_Selection(Department_Id ,Status_Id,Is_Delete )
	values (Department_Id_ ,Status_Id_,false);  
	SELECT i + 1 INTO i;
END WHILE;     
#COMMIT;

select Department_Id_;
#select Status_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Department_Status`( In Department_Status_Id_ int,
Department_Status_Name_ varchar(50),
Status_Order_ int,
Editable_ TINYINT,
Color_ varchar(50))
Begin 
 if  Department_Status_Id_>0
 THEN 
 UPDATE Department_Status set Department_Status_Id = Department_Status_Id_ ,
Department_Status_Name = Department_Status_Name_ ,
Status_Order = Status_Order_ ,
Editable = Editable_ ,
Color = Color_  Where Department_Status_Id=Department_Status_Id_ ;
 update student set Department_Status_Name = Department_Status_Name_ where Status = Department_Status_Id_;
 ELSE 
 SET Department_Status_Id_ = (SELECT  COALESCE( MAX(Department_Status_Id ),0)+1 FROM Department_Status); 
 INSERT INTO Department_Status(Department_Status_Id ,
Department_Status_Name ,
Status_Order ,
Editable ,
Color ,
Is_Delete ) values (Department_Status_Id_ ,
Department_Status_Name_ ,
Status_Order_ ,
Editable_ ,
Color_ ,
false);
 End If ;
 select Department_Status_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Document`( In Document_Id_ int,
Document_Name_ varchar(50))
Begin 
 if  Document_Id_>0
 THEN 
 UPDATE Document set Document_Id = Document_Id_ ,
Document_Name = Document_Name_  Where Document_Id=Document_Id_ ;
 ELSE 
 SET Document_Id_ = (SELECT  COALESCE( MAX(Document_Id ),0)+1 FROM Document); 
 INSERT INTO Document(Document_Id ,
Document_Name,DeleteStatus) values (Document_Id_ ,
Document_Name_,false );
 End If ;
 select Document_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Duration`( In Duration_Id_ int,
Duration_Name_ varchar(50))
Begin 
 if  Duration_Id_>0
 THEN 
 UPDATE Duration set Duration_Id = Duration_Id_ ,
Duration_Name = Duration_Name_  Where Duration_Id=Duration_Id_ ;
 ELSE 
 SET Duration_Id_ = (SELECT  COALESCE( MAX(Duration_Id ),0)+1 FROM Duration); 
 INSERT INTO Duration(Duration_Id ,
Duration_Name,DeleteStatus ) values (Duration_Id_ ,
Duration_Name_,false );
 End If ;
 select Duration_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Enquiry_Source`( In Enquiry_Source_Id_ int,
Enquiry_Source_Name_ varchar(45))
Begin 
 if  Enquiry_Source_Id_>0
 THEN 
 UPDATE Enquiry_Source set Enquiry_Source_Id = Enquiry_Source_Id_ ,
Enquiry_Source_Name = Enquiry_Source_Name_ Where Enquiry_Source_Id=Enquiry_Source_Id_ ;
update student set Enquiry_Source_Name = Enquiry_Source_Name_ where Enquiry_Source_Id = Enquiry_Source_Id_;
 ELSE 
 SET Enquiry_Source_Id_ = (SELECT  COALESCE( MAX(Enquiry_Source_Id ),0)+1 FROM Enquiry_Source); 
 INSERT INTO Enquiry_Source(Enquiry_Source_Id ,
Enquiry_Source_Name,DeleteStatus) values (Enquiry_Source_Id_ ,
Enquiry_Source_Name_,false );
 End If ;
 select Enquiry_Source_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Fees`( In Fees_Id_ int,
Fees_Name_ varchar(45))
Begin 

 if  Fees_Id_>0
 THEN 
 UPDATE fees set Fees_Id = Fees_Id_ ,
Fees_Name = Fees_Name_ Where Fees_Id = Fees_Id_ ;
 ELSE 
 
 SET Fees_Id_ = (SELECT  COALESCE( MAX(Fees_Id ),0)+1 FROM fees); 
 INSERT INTO fees(Fees_Id ,
Fees_Name,DeleteStatus) values (Fees_Id_ ,
Fees_Name_,false );
 End If ;
 select Fees_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_FeesReceipt`( In FeesReceiptdetails_ json,
 FeesReceiptdetails_Value_ int,feesreceipt_document_ json,feesreceipt_document_Value_ int )
Begin
declare Fees_Receipt_Id_ int;declare Student_Id_ int;declare FeesreceiptDocument_Description_ Varchar(500);
declare Entry_date_ datetime;declare User_Id_ int;declare Description_ varchar(200);
declare Fees_Id_ int;declare Amount_ int;declare Fees_Name_ varchar(200);
declare Actual_Entry_date_ datetime;
declare Fee_Receipt_Branch_ int;
declare Voucher_No_ int;
declare FeesreceiptFile_Name_  varchar(500);declare FeesreceiptDocument_Name_  varchar(500);
declare FeesreceiptDocument_File_Name_  varchar(500);
declare Feesreceipt_document_Id_ int;
Declare i int default 0;
Declare j int default 0;
/*DECLARE exit handler for sqlexception
BEGIN
GET DIAGNOSTICS CONDITION 1
@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p2 AS MESSAGE_TEXT, @p1 AS RETURNED_SQLSTATE;
ROLLBACK;
END;
    DECLARE exit handler for sqlwarning
BEGIN
GET DIAGNOSTICS CONDITION 1
@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p2 AS MESSAGE_TEXT, @p1 AS RETURNED_SQLSTATE;
ROLLBACK;
END;
    START TRANSACTION;*/
if( FeesReceiptdetails_Value_>0) then
SELECT JSON_UNQUOTE (JSON_EXTRACT(FeesReceiptdetails_,'$.Fees_Receipt_Id')) INTO Fees_Receipt_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(FeesReceiptdetails_,'$.Student_Id')) INTO Student_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(FeesReceiptdetails_,'$.Entry_date')) INTO Entry_date_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(FeesReceiptdetails_,'$.User_Id')) INTO User_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(FeesReceiptdetails_,'$.Description')) INTO Description_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(FeesReceiptdetails_,'$.Fees_Id')) INTO Fees_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(FeesReceiptdetails_,'$.Amount')) INTO Amount_;
#SELECT JSON_UNQUOTE (JSON_EXTRACT(FeesReceiptdetails_,'$.Actual_Entry_date')) INTO Actual_Entry_date_;
#SELECT JSON_UNQUOTE (JSON_EXTRACT(FeesReceiptdetails_,'$.Fee_Receipt_Branch')) INTO Fee_Receipt_Branch_;
#SELECT JSON_UNQUOTE (JSON_EXTRACT(FeesReceiptdetails_,'$.Voucher_No')) INTO Voucher_No_;
set Fees_Name_ = (select Fees_Name from fees where Fees_Id = Fees_Id_ and DeleteStatus = 0 );
if(Fees_Receipt_Id_>0) then
 UPDATE fees_receipt set Fees_Receipt_Id = Fees_Receipt_Id_ ,
Fees_Id = Fees_Id_,
Entry_Date=Entry_Date_,
Amount=Amount_,
Description=Description_,
Student_Id=Student_Id_,
User_Id=User_Id_
#Fee_Receipt_Branch=Fee_Receipt_Branch_,Voucher_No=Voucher_No_
  Where Fees_Receipt_Id=Fees_Receipt_Id_;
 ELSE  
SET Fee_Receipt_Branch_=(select Branch_Id from user_details where User_Details_Id=User_Id_);
SET Fees_Receipt_Id_ = (SELECT  COALESCE( MAX(Fees_Receipt_Id ),0)+1 FROM fees_receipt);
SET Voucher_No_ = (SELECT  COALESCE( MAX(Voucher_No ),0)+1 FROM fees_receipt);
 INSERT INTO fees_receipt(Fees_Receipt_Id,Fees_Id ,
Entry_Date,
Amount,
Description,
Student_Id,
User_Id,
            Actual_Entry_Date,
            Delete_Status,
            Fee_Receipt_Branch,
            Voucher_No
            )
            values (Fees_Receipt_Id_,Fees_Id_,Entry_Date_,Amount_,Description_,Student_Id_,User_Id_,now(),0,Fee_Receipt_Branch_,Voucher_No_);
           
            insert into transaction_history(Entry_date,User_Id,Student_Id,Description1,Description2,Description3,Transaction_type)
            values (Entry_date_,User_Id_,Student_Id_,Description_,Description_,Description_,0);
 End If ;
 end if;
 if( feesreceipt_document_Value_>0) then
WHILE j < JSON_LENGTH(feesreceipt_document_) DO
SELECT JSON_UNQUOTE (JSON_EXTRACT(feesreceipt_document_,CONCAT('$[',j,'].FeesreceiptFile_Name'))) INTO FeesreceiptFile_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(feesreceipt_document_,CONCAT('$[',j,'].FeesreceiptDocument_Name'))) INTO FeesreceiptDocument_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(feesreceipt_document_,CONCAT('$[',j,'].FeesreceiptDocument_File_Name'))) INTO FeesreceiptDocument_File_Name_;
#SELECT JSON_UNQUOTE (JSON_EXTRACT(feesreceipt_document_,CONCAT('$[',j,'].FeesreceiptDocument_Description'))) INTO FeesreceiptDocument_Description_;
        SET Feesreceipt_document_Id_ = (SELECT  COALESCE( MAX(Feesreceipt_document_Id ),0)+1 FROM feesreceipt_document);
        insert into feesreceipt_document (Feesreceipt_document_Id,Student_Id,Entry_date,
        FeesreceiptFile_Name,FeesreceiptDocument_Name,
        FeesreceiptDocument_File_Name,Fees_Receipt_Id,DeleteStatus)
        values(Feesreceipt_document_Id_,Student_Id_,now(),FeesreceiptFile_Name_,
        FeesreceiptDocument_Name_,FeesreceiptDocument_File_Name_,Fees_Receipt_Id_,0);
SELECT j + 1 INTO j;      
END WHILE;
 end if;
#commit;
 select Fees_Receipt_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_FollowUp`( In Student_Id_ int,By_User_Id_ int,
Branch_ int,Department_ int,Status_ int,User_Id_ int,Next_FollowUp_Date_ datetime,Remark_ varchar(100),Remark_Id_ int)
Begin
#DECLARE Student_Id_ int;
Declare i int;
declare Student_FollowUp_Id_ int;
declare import_master_id int default 0;
declare Master_Id_ int;

Set i=0;

INSERT INTO student_followup(Student_Id ,Entry_Date,Next_FollowUp_Date,FollowUp_Difference,Department ,Status ,User_Id,Branch,Remark,Remark_Id,By_User_Id,FollowUp_Type ,DeleteStatus,FollowUP_Time,Actual_FollowUp_Date)
values (Student_Id_ ,Now(),Next_FollowUp_Date_,0,Department_ ,Status_ ,User_Id_,Branch_,Remark_,Remark_Id_,By_User_Id_,1,false,Now(),Now());
set Student_FollowUp_Id_ =(SELECT LAST_INSERT_ID());
#Update student set Student_FollowUp_Id=Student_FollowUp_Id_ ,Next_FollowUp_Date = Next_FollowUp_Date_
#where student.Student_Id=Student_Id_;   
Update student set Student_FollowUp_Id=Student_FollowUp_Id_ ,Department = Department_ ,Status = Status_ ,
	User_Id = User_Id_,By_User_Id=By_User_Id_,Next_FollowUp_Date = Next_FollowUp_Date_ ,Remark = Remark_,Remark_Id = Remark_Id_,
	Branch=Branch_
	where student.Student_Id=Student_Id_;
SELECT i + 1 INTO i;      

set import_master_id=1;
select Student_Id_;
End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Intake`( In Intake_Id_ int,
Intake_Name_ varchar(50))
Begin 
 if  Intake_Id_>0
 THEN 
 UPDATE Intake set Intake_Id = Intake_Id_ ,
Intake_Name = Intake_Name_  Where Intake_Id=Intake_Id_ ;
 ELSE 
 SET Intake_Id_ = (SELECT  COALESCE( MAX(Intake_Id ),0)+1 FROM Intake); 
 INSERT INTO Intake(Intake_Id ,
Intake_Name,DeleteStatus ) values (Intake_Id_ ,
Intake_Name_,false );
 End If ;
 select Intake_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Internship`( In Internship_Id_ int,
Internship_Name_ varchar(50))
Begin 
 if  Internship_Id_>0
 THEN 
 UPDATE Internship set Internship_Id = Internship_Id_ ,
Internship_Name = Internship_Name_  Where Internship_Id=Internship_Id_ ;
 ELSE 
 SET Internship_Id_ = (SELECT  COALESCE( MAX(Internship_Id ),0)+1 FROM Internship); 
 INSERT INTO Internship(Internship_Id ,
Internship_Name,DeleteStatus ) values (Internship_Id_ ,
Internship_Name_,false );
 End If ;
 select Internship_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Invoice`( In Invoice_Details_ json,Invoice_Details_Value_ int,Invoice_document_ json,Invoice_Document_Value_ int )
Begin
 Declare Invoice_Id_ int;Declare Student_Id_ int;Declare Entry_Date_ datetime; Declare Description_ varchar(100);Declare Amount_ decimal(18,2);
 declare Invoice_File_Name_ varchar(100); declare Invoice_Document_Name_ varchar(100); declare Invoice_Document_File_Name_ varchar(100);
Declare i int default 0;Declare j int default 0;
/*DECLARE exit handler for sqlexception
BEGIN
GET DIAGNOSTICS CONDITION 1
@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p2 AS MESSAGE_TEXT, @p1 AS RETURNED_SQLSTATE;
ROLLBACK;
END;
    DECLARE exit handler for sqlwarning
BEGIN
GET DIAGNOSTICS CONDITION 1
@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p2 AS MESSAGE_TEXT, @p1 AS RETURNED_SQLSTATE;
ROLLBACK;
END;
    START TRANSACTION;*/
if( Invoice_Details_Value_>0) then
SELECT JSON_UNQUOTE (JSON_EXTRACT(Invoice_Details_,'$.Invoice_Id')) INTO Invoice_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Invoice_Details_,'$.Student_Id')) INTO Student_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Invoice_Details_,'$.Entry_Date')) INTO Entry_Date_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Invoice_Details_,'$.Description')) INTO Description_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Invoice_Details_,'$.Amount')) INTO Amount_;

if(Invoice_Id_>0) then
 UPDATE invoice set Invoice_Id = Invoice_Id_ ,Description = Description_,Student_Id = Student_Id_,Entry_Date = Entry_Date_,Amount = Amount_
  Where Invoice_Id = Invoice_Id_;
 ELSE  
SET Invoice_Id_ = (SELECT  COALESCE( MAX(Invoice_Id ),0)+1 FROM invoice);
 INSERT INTO invoice(Invoice_Id,Description ,Entry_Date,Student_Id,Amount,DeleteStatus)
            values (Invoice_Id_,Description_,Entry_Date_,Student_Id_,Amount_,0);
End If ;
 end if;
 if( Invoice_Document_Value_>0) then
WHILE j < JSON_LENGTH(Invoice_document_) DO
SELECT JSON_UNQUOTE (JSON_EXTRACT(Invoice_document_,CONCAT('$[',j,'].Invoice_File_Name'))) INTO Invoice_File_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Invoice_document_,CONCAT('$[',j,'].Invoice_Document_Name'))) INTO Invoice_Document_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Invoice_document_,CONCAT('$[',j,'].Invoice_Document_File_Name'))) INTO Invoice_Document_File_Name_;
        insert into Invoice_document (Invoice_Id,Entry_Date,Description,Invoice_Document_Name,Invoice_Document_File_Name,Invoice_File_Name,Student_Id,DeleteStatus)
        values(Invoice_Id_,now(),'',Invoice_Document_Name_,Invoice_Document_File_Name_,Invoice_File_Name_,Student_Id_,0);
SELECT j + 1 INTO j;      
END WHILE;
 end if;
#commit;
 select Invoice_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Level_Detail`( In Level_Detail_Id_ int,
Level_Detail_Name_ varchar(50))
Begin 
 if  Level_Detail_Id_>0
 THEN 
 UPDATE Level_Detail set Level_Detail_Id = Level_Detail_Id_ ,
Level_Detail_Name = Level_Detail_Name_  Where Level_Detail_Id=Level_Detail_Id_ ;
 ELSE 
 SET Level_Detail_Id_ = (SELECT  COALESCE( MAX(Level_Detail_Id ),0)+1 FROM Level_Detail); 
 INSERT INTO Level_Detail(Level_Detail_Id ,
Level_Detail_Name,DeleteStatus ) values (Level_Detail_Id_ ,
Level_Detail_Name_,false );
 End If ;
 select Level_Detail_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Receipt`( In Fees_Receipt_Id_ int, Fees_Id_ int,
  Entry_Date_ datetime,
  Amount_ int ,
  Description_ varchar(200),
  Student_Id_ int,
  User_Id_ int
  )
Begin 
declare Fee_Receipt_Branch_ int;declare Voucher_No_ int;
if  Fees_Receipt_Id_>0
		 THEN 
		 UPDATE fees_receipt set Fees_Receipt_Id = Fees_Receipt_Id_ ,
		 Fees_Id = Fees_Id_,
		 Entry_Date=Entry_Date_,
		 Amount=Amount_,
		 Description=Description_,
		 Student_Id=Student_Id_,
		 User_Id=User_Id_
		 Where Fees_Receipt_Id=Fees_Receipt_Id_ ;
 ELSE 
			set Fee_Receipt_Branch_=(select Branch_Id from user_details where User_Details_Id=User_Id_);
			SET Fees_Receipt_Id_ = (SELECT  COALESCE( MAX(Fees_Receipt_Id ),0)+1 FROM fees_receipt); 
            SET Voucher_No_ = (SELECT  COALESCE( MAX(Voucher_No ),0)+1 FROM fees_receipt); 
			INSERT INTO fees_receipt(Fees_Receipt_Id,Fees_Id ,
			Entry_Date,
			Amount,
			Description,
			Student_Id,
			User_Id,
            Actual_Entry_Date,
            Delete_Status,
            Fee_Receipt_Branch,
            Voucher_No
            ) 
            values (Fees_Receipt_Id_,Fees_Id_,Entry_Date_,Amount_,Description_,Student_Id_,User_Id_,now(),0,Fee_Receipt_Branch_,Voucher_No_);
            
            insert into transaction_history(Entry_date,User_Id,Student_Id,Description1,Description2,Description3,Transaction_type)
            values (Entry_date_,User_Id_,Student_Id_,Description_,Description_,Description_,0);
			
 end if;
  select Fees_Receipt_Id_;
 end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Remarks`( In Remarks_Id_ int,
Remarks_Name_ varchar(50))
Begin 
 if  Remarks_Id_>0
 THEN 
 UPDATE Remarks set Remarks_Id = Remarks_Id_ ,
Remarks_Name = Remarks_Name_  Where Remarks_Id=Remarks_Id_ ;
 ELSE 
 SET Remarks_Id_ = (SELECT  COALESCE( MAX(Remarks_Id ),0)+1 FROM Remarks); 
 INSERT INTO Remarks(Remarks_Id ,
Remarks_Name,DeleteStatus ) values (Remarks_Id_ ,
Remarks_Name_,false );
 End If ;
 select Remarks_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Role_Department`(In UserRoleString varchar(100),Department_String varchar(1000),User_Details_Id_ int)
BEGIN
update user_details set Role_String = UserRoleString ,Department_String = Department_String where User_Details_Id = User_Details_Id_;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Student`( In Student_ Json,Followup_ Json,Student_Value_ int,FollowUp_Value_ int
,student_document_ Json,student_document_Value_ int,student_List_ json,Student_Checklist_Value_ int
)
Begin
DECLARE Student_Id_ int;declare Client_Accounts_Id_ int;declare Student_Name_ varchar(50);declare Last_Name_ varchar(50);
declare Gender_ varchar(50);declare Address1_ varchar(200);declare Address2_ varchar(50);declare Pincode_ varchar(7);
declare Email_ varchar(100);declare Alternative_Email_ varchar(100);declare Phone_Number_ varchar(25);declare Alternative_Phone_Number_ varchar(45);declare Dob_ varchar(45);declare Country_Name_ varchar(45);declare Promotional_Code_ varchar(50);
declare Student_Status_Id_ int;declare Password_ varchar(20);declare Passport_Copy_ varchar(100);declare IELTS_ varchar(100);declare Enquiry_Source_Id_ int;
declare Passport_Photo_ varchar(100);declare Tenth_Certificate_ varchar(100);declare Work_Experience_ varchar(100);
declare Resume_ varchar(100);declare Facebook_ varchar(45);declare Whatsapp_ varchar(45) ;
declare  File_Name_ varchar(500);declare Document_Name_ varchar(500); Declare i int default 0;
declare Passport_Copy_File_Name_ varchar(500);declare IELTS_File_Name_ varchar(500);declare Passport_Photo_File_Name_ varchar(500);
declare Tenth_Certificate_File_Name_ varchar(500) ;declare Work_Experience_File_Name_ varchar(500) ;declare Resume_File_Name_ varchar(500);
declare Document_File_Name_ varchar(500);declare Duplicate_Student_Id int;
declare Duplicate_Student_Name varchar(25); declare Duplicate_User_Name varchar(25); declare Duplicate_User_Id int;
declare Created_By_ int;declare Email_student_Id int;declare Email_Alternate_student_Id int;
declare Alternate_student_Id int;declare Whatsap_student_Id int;declare Duplicate_Email_Name varchar(50);
declare FollowUp_Count int;declare FollowUp_EntryDate datetime;declare First_FollowUp_Date datetime;
declare Visa_Submission_Date_ varchar(45);
declare Intake_ varchar(45);declare Reference_ varchar(45);declare Activity_ varchar(45);declare Course_Link_ varchar(45);
declare Year_ varchar(45);declare College_University_ varchar(1000);
declare Programme_Course_ varchar(1000);declare Agent_ varchar(45);declare Status_Details_ varchar(45);declare Student_Remark_ varchar(45);
declare Send_Welcome_Mail_Status varchar(45);
declare Duplicate_Department_Name varchar(50);declare Duplicate_Remark_Name varchar(2000);
declare Duplicate_Department_Id_ int;declare Duplicate_Remark_Id_ int;declare Duplicate_FollowUp_Date datetime;declare Call_From int;
declare Duplicate_Registration int;declare Duplicate_Welcome_Status int;
declare Department_Status int;
declare sslc_year_ varchar(45);declare sslc_institution_ varchar(500);declare sslc_markoverall_ varchar(45);declare sslc_englishmark_ varchar(45);
declare plustwo_year_ varchar(45);declare plustwo_institution_ varchar(500);declare plustwo_markoverall_ varchar(45);declare plustwo_englishmark_ varchar(45);
declare graduation_year_ varchar(45);declare graduation_institution_ varchar(500);declare graduation_markoverall_ varchar(45);declare graduation_englishmark_ varchar(45);
declare postgraduation_year_ varchar(45);declare postgraduation_institution_ varchar(500);declare postgraduation_markoverall_ varchar(45);
declare postgraduation_englishmark_ varchar(45);declare other_year_ varchar(45);declare other_instituation_ varchar(500);declare other_markoverall_ varchar(45);declare other_englishmark_ varchar(45);

declare exp_institution_1_ varchar(500);declare exp_institution_2_ varchar(500);declare exp_institution_3_ varchar(500);declare exp_institution_4_ varchar(500);declare exp_designation_1_ varchar(45);
declare exp_designation_2_ varchar(45);declare exp_designation_3_ varchar(45);declare exp_designation_4_ varchar(45);declare exp_tenure_from_1_ date;declare exp_tenure_from_2_ date;
declare exp_tenure_from_3_ date;declare exp_tenure_from_4_ date;declare exp_tenure_to_1_ date;declare exp_tenure_to_2_ date;declare exp_tenure_to_3_ date;
declare exp_tenure_to_4_ date;declare IELTS_Overall_ varchar(45);declare IELTS_Listening_ varchar(45);declare IELTS_Reading_ varchar(45);declare IELTS_Writting_ varchar(45);
declare IELTS_Speaking_ varchar(45);declare Passport_No_ varchar(45);declare Passport_fromdate_ date;declare Passport_Todate_ date;
declare LOR_1_Id_ int;declare LOR_2_Id_ int;declare MOI_Id_ int;declare SOP_Id_ int;declare Ielts_Id_ int;declare Passport_Id_ int;
declare Resume_Id_ int;Declare j int default 0;
declare Agent_Name_ varchar(150);declare Enquiry_Source_Name_ varchar(100);declare Created_User_ varchar(100);

declare Student_Checklist_Id_ int;declare Check_List_Id_ int;declare Applicable_ int;
declare Checklist_Status_ int;declare Description_ Varchar(150);
declare Marital_Status_Id_ int ;declare Marital_Status_Name_ Varchar(45);
declare Program_Course_Id_ int;declare Profile_University_Id_ int;declare Profile_Country_Id_ int;declare Created_On_ varchar(45);
declare Intake_Id_ int;

/*DECLARE exit handler for sqlexception
BEGIN
GET DIAGNOSTICS CONDITION 1
@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p2 AS MESSAGE_TEXT, @p1 AS RETURNED_SQLSTATE;
ROLLBACK;
END;
    DECLARE exit handler for sqlwarning
BEGIN
GET DIAGNOSTICS CONDITION 1
@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p2 AS MESSAGE_TEXT, @p1 AS RETURNED_SQLSTATE;
ROLLBACK;
END;

    START TRANSACTION;*/
   
    set Call_From=1;
if( Student_Value_>0) then
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Student_Id')) INTO Student_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Agent_Id')) INTO Client_Accounts_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Student_Name')) INTO Student_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Last_Name')) INTO Last_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Gender')) INTO Gender_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Address1')) INTO Address1_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Address2')) INTO Address2_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Pincode')) INTO Pincode_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Email')) INTO Email_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Alternative_Email')) INTO Alternative_Email_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Phone_Number')) INTO Phone_Number_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Alternative_Phone_Number')) INTO Alternative_Phone_Number_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Dob')) INTO Dob_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Country_Name')) INTO Country_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Promotional_Code')) INTO Promotional_Code_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Student_Status_Id')) INTO Student_Status_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Enquiry_Source_Id')) INTO Enquiry_Source_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Password')) INTO Password_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Passport_Copy')) INTO Passport_Copy_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.IELTS')) INTO IELTS_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Passport_Photo')) INTO Passport_Photo_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Tenth_Certificate')) INTO Tenth_Certificate_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Work_Experience')) INTO Work_Experience_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Resume')) INTO Resume_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Whatsapp')) INTO Whatsapp_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Facebook')) INTO Facebook_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Passport_Copy_File_Name')) INTO Passport_Copy_File_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.IELTS_File_Name')) INTO IELTS_File_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Passport_Photo_File_Name')) INTO Passport_Photo_File_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Tenth_Certificate_File_Name')) INTO Tenth_Certificate_File_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Work_Experience_File_Name')) INTO Work_Experience_File_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Resume_File_Name')) INTO Resume_File_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.College_University')) INTO College_University_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Programme_Course')) INTO Programme_Course_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Intake')) INTO Intake_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Reference')) INTO Reference_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Visa_Submission_Date')) INTO Visa_Submission_Date_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Activity')) INTO Activity_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Course_Link')) INTO Course_Link_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Year')) INTO Year_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Agent')) INTO Agent_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Status_Details')) INTO Status_Details_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Student_Remark')) INTO Student_Remark_;

SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.sslc_year')) INTO sslc_year_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.sslc_institution')) INTO sslc_institution_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.sslc_markoverall')) INTO sslc_markoverall_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.sslc_englishmark')) INTO sslc_englishmark_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.plustwo_year')) INTO plustwo_year_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.plustwo_institution')) INTO plustwo_institution_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.plustwo_markoverall')) INTO plustwo_markoverall_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.plustwo_englishmark')) INTO plustwo_englishmark_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.graduation_year')) INTO graduation_year_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.graduation_institution')) INTO graduation_institution_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.graduation_markoverall')) INTO graduation_markoverall_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.graduation_englishmark')) INTO graduation_englishmark_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.postgraduation_year')) INTO postgraduation_year_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.postgraduation_institution')) INTO postgraduation_institution_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.postgraduation_markoverall')) INTO postgraduation_markoverall_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.postgraduation_englishmark')) INTO postgraduation_englishmark_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.other_year')) INTO other_year_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.other_instituation')) INTO other_instituation_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.other_markoverall')) INTO other_markoverall_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.other_englishmark')) INTO other_englishmark_;

SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.exp_institution_1')) INTO exp_institution_1_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.exp_institution_2')) INTO exp_institution_2_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.exp_institution_3')) INTO exp_institution_3_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.exp_institution_4')) INTO exp_institution_4_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.exp_designation_1')) INTO exp_designation_1_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.exp_designation_2')) INTO exp_designation_2_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.exp_designation_3')) INTO exp_designation_3_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.exp_designation_4')) INTO exp_designation_4_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.exp_tenure_from_1')) INTO exp_tenure_from_1_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.exp_tenure_from_2')) INTO exp_tenure_from_2_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.exp_tenure_from_3')) INTO exp_tenure_from_3_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.exp_tenure_from_4')) INTO exp_tenure_from_4_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.exp_tenure_to_1')) INTO exp_tenure_to_1_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.exp_tenure_to_2')) INTO exp_tenure_to_2_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.exp_tenure_to_3')) INTO exp_tenure_to_3_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.exp_tenure_to_4')) INTO exp_tenure_to_4_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.IELTS_Overall')) INTO IELTS_Overall_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.IELTS_Listening')) INTO IELTS_Listening_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.IELTS_Reading')) INTO IELTS_Reading_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.IELTS_Writting')) INTO IELTS_Writting_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.IELTS_Speaking')) INTO IELTS_Speaking_;

SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Passport_No')) INTO Passport_No_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Passport_fromdate')) INTO Passport_fromdate_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Passport_Todate')) INTO Passport_Todate_;

SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.LOR_1_Id')) INTO LOR_1_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.LOR_2_Id')) INTO LOR_2_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.MOI_Id')) INTO MOI_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.SOP_Id')) INTO SOP_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Ielts_Id')) INTO Ielts_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Passport_Id')) INTO Passport_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Resume_Id')) INTO Resume_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Marital_Status_Id')) INTO Marital_Status_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Marital_Status_Name')) INTO Marital_Status_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Program_Course_Id')) INTO Program_Course_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Profile_University_Id')) INTO Profile_University_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Profile_Country_Id')) INTO Profile_Country_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Created_On')) INTO Created_On_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_,'$.Intake_Id')) INTO Intake_Id_;

set Agent_Name_ =(select Agent_Name from agent where Agent_Id = Agent_ and DeleteStatus=0 );
set Enquiry_Source_Name_ = (select Enquiry_Source_Name from enquiry_source where Enquiry_Source_Id = Enquiry_Source_Id_ and DeleteStatus=0 );
if  Student_Id_>0 THEN

          Set Duplicate_Student_Id = (select Student_Id from Student where Student_Id != Student_Id_ and DeleteStatus=false and (Phone_Number like concat('%',Phone_Number_,'%')
        or Alternative_Phone_Number like concat('%',Phone_Number_,'%') or Whatsapp  like concat('%',Phone_Number_,'%') )  limit 1);
         

        if Email_!="" then
set Email_student_Id= ( select Student_Id from Student where Student_Id != Student_Id_  and DeleteStatus=false  and   ( Email like concat('%',Email_,'%') or Alternative_Email  like concat('%',Email_,'%') ) limit 1);
        end if;
        if Alternative_Email_!="" then
        set Email_Alternate_student_Id= (select Student_Id from Student where Student_Id != Student_Id_ and DeleteStatus=false  and   ( Alternative_Email like concat('%',Alternative_Email_,'%') or Email  like concat('%',Alternative_Email_,'%') ) limit 1);
        end if;
         if Alternative_Phone_Number_!="" then
Set Alternate_student_Id = (select Student_Id from Student where  Student_Id != Student_Id_ and DeleteStatus=false  and  (Phone_Number like concat('%',Alternative_Phone_Number_,'%') or Alternative_Phone_Number like concat('%',Alternative_Phone_Number_,'%') or Whatsapp  like concat('%',Alternative_Phone_Number_,'%')) limit 1);
 end if;
         
      
       
if Whatsapp_!="" then
Set Whatsap_student_Id = (select Student_Id from Student where Student_Id != Student_Id_ and DeleteStatus=false  and   (Phone_Number like concat('%',Whatsapp_,'%') or Alternative_Phone_Number like concat('%',Whatsapp_,'%') or Whatsapp  like concat('%',Whatsapp_,'%')) limit 1);
end if;
        if(Duplicate_Student_Id>0) then
set Duplicate_User_Id = (select User_Id from Student where Student_Id = Duplicate_Student_Id and DeleteStatus=false);
set Duplicate_Department_Id_ = (select Department from Student where Student_Id = Duplicate_Student_Id and DeleteStatus=false);
set Duplicate_Remark_Id_ = (select Remark_Id from Student where Student_Id = Duplicate_Student_Id and DeleteStatus=false);
set Duplicate_FollowUp_Date = (select Next_FollowUp_date from Student where Student_Id = Duplicate_Student_Id and DeleteStatus=false);
set Duplicate_Student_Name = (select Student_Name from Student where Student_Id = Duplicate_Student_Id and DeleteStatus=false);
set Duplicate_User_Name = (select User_Details_Name from user_details where User_Details_Id = Duplicate_User_Id and DeleteStatus=false);
set Duplicate_Department_Name=(select Department_Name from department where Department_Id = Duplicate_Department_Id_ and Is_Delete=false);
set Duplicate_Remark_Name=(select Remark from student where Student_Id = Duplicate_Student_Id and DeleteStatus=false);
set Department_Status=(select FollowUp from department where Department_Id = Duplicate_Department_Id_ and Is_Delete=false);
SET Student_Id_ = -1;  
        elseif(Alternate_student_Id>0) then
set Duplicate_User_Id = (select User_Id from Student where Student_Id = Alternate_student_Id and DeleteStatus=false);
set Duplicate_Department_Id_ = (select Department from Student where Student_Id = Alternate_student_Id and DeleteStatus=false);
set Duplicate_Remark_Id_ = (select Remark_Id from Student where Student_Id = Alternate_student_Id and DeleteStatus=false);
set Duplicate_FollowUp_Date = (select Next_FollowUp_date from Student where Student_Id = Alternate_student_Id and DeleteStatus=false);
set Duplicate_Student_Name = (select Student_Name from Student where Student_Id = Alternate_student_Id and DeleteStatus=false);
set Duplicate_User_Name = (select User_Details_Name from user_details where User_Details_Id = Duplicate_User_Id and DeleteStatus=false);
set Duplicate_Department_Name=(select Department_Name from department where Department_Id = Duplicate_Department_Id_ and Is_Delete=false);
set Duplicate_Remark_Name=(select Remark from student where Student_Id = Alternate_student_Id and DeleteStatus=false);
set Department_Status=(select FollowUp from department where Department_Id = Duplicate_Department_Id_ and Is_Delete=false);
SET Student_Id_ = -1;  
        elseif(Whatsap_student_Id>0) then
set Duplicate_User_Id = (select User_Id from Student where Student_Id = Whatsap_student_Id and DeleteStatus=false);
set Duplicate_Department_Id_ = (select Department from Student where Student_Id = Whatsap_student_Id and DeleteStatus=false);
set Duplicate_FollowUp_Date = (select Next_FollowUp_date from Student where Student_Id = Whatsap_student_Id and DeleteStatus=false);
set Duplicate_Student_Name = (select Student_Name from Student where Student_Id = Whatsap_student_Id and DeleteStatus=false);
set Duplicate_User_Name = (select User_Details_Name from user_details where User_Details_Id = Duplicate_User_Id and DeleteStatus=false);
set Duplicate_Department_Name=(select Department_Name from department where Department_Id = Duplicate_Department_Id_ and Is_Delete=false);
set Duplicate_Remark_Name=(select Remark from student where Student_Id = Whatsap_student_Id and DeleteStatus=false);
set Department_Status=(select FollowUp from department where Department_Id = Duplicate_Department_Id_ and Is_Delete=false);
SET Student_Id_ = -1;                
elseif(Email_student_Id>0) then
set Duplicate_User_Id = (select User_Id from Student where Student_Id = Email_student_Id and DeleteStatus=false);
set Duplicate_Department_Id_ = (select Department from Student where Student_Id = Email_student_Id and DeleteStatus=false);
set Duplicate_FollowUp_Date = (select Next_FollowUp_date from Student where Student_Id = Email_student_Id and DeleteStatus=false);
set Duplicate_Student_Name = (select Student_Name from Student where Student_Id = Email_student_Id and DeleteStatus=false);
set Duplicate_User_Name = (select User_Details_Name from user_details where User_Details_Id = Duplicate_User_Id and DeleteStatus=false);
set Duplicate_Department_Name=(select Department_Name from department where Department_Id = Duplicate_Department_Id_ and Is_Delete=false);
set Duplicate_Remark_Name=(select Remark from student where Student_Id = Email_student_Id and DeleteStatus=false);
set Department_Status=(select FollowUp from department where Department_Id = Duplicate_Department_Id_ and Is_Delete=false);
SET Student_Id_ = -2;                
elseif(Email_Alternate_student_Id>0) then
set Duplicate_User_Id = (select User_Id from Student where Student_Id = Email_Alternate_student_Id and DeleteStatus=false);
set Duplicate_Department_Id_ = (select Department from Student where Student_Id = Email_Alternate_student_Id and DeleteStatus=false);
set Duplicate_FollowUp_Date = (select Next_FollowUp_date from Student where Student_Id = Email_Alternate_student_Id and DeleteStatus=false);
set Duplicate_Student_Name = (select Student_Name from Student where Student_Id = Email_Alternate_student_Id and DeleteStatus=false);
set Duplicate_User_Name = (select User_Details_Name from user_details where User_Details_Id = Duplicate_User_Id and DeleteStatus=false);
set Duplicate_Department_Name=(select Department_Name from department where Department_Id = Duplicate_Department_Id_ and Is_Delete=false);
set Duplicate_Remark_Name=(select Remark from student where Student_Id = Email_Alternate_student_Id and DeleteStatus=false);
set Department_Status=(select FollowUp from department where Department_Id = Duplicate_Department_Id_ and Is_Delete=false);
SET Student_Id_ = -2;
else
UPDATE Student set Agent_Id=Client_Accounts_Id_,Student_Name = Student_Name_ ,Last_Name = Last_Name_ ,Gender = Gender_ ,
Address1 = Address1_ ,Address2 = Address2_ ,Pincode = Pincode_ ,Email = Email_ ,Alternative_Email = Alternative_Email_ ,Alternative_Phone_Number = Alternative_Phone_Number_ ,Phone_Number = Phone_Number_ ,
Dob = Dob_ ,Country_Name = Country_Name_ ,Promotional_Code = Promotional_Code_ ,Student_Status_Id = Student_Status_Id_,Enquiry_Source_Id = Enquiry_Source_Id_,Password = Password_ ,
Resume=Resume_,Whatsapp = Whatsapp_ ,Facebook = Facebook_,College_University=College_University_,Programme_Course=Programme_Course_,Intake=Intake_,Year=Year_,Reference=Reference_,
Visa_Submission_Date=Visa_Submission_Date_,Activity=Activity_,Course_Link=Course_Link_,Agent=Agent_,Status_Details=Status_Details_,Student_Remark=Student_Remark_,
sslc_year = sslc_year_,sslc_institution = sslc_institution_,sslc_markoverall = sslc_markoverall_,sslc_englishmark = sslc_englishmark_,plustwo_year = plustwo_year_,
plustwo_institution =  plustwo_institution_,plustwo_markoverall = plustwo_markoverall_,plustwo_englishmark = plustwo_englishmark_,graduation_year = graduation_year_,
graduation_institution = graduation_institution_,graduation_markoverall = graduation_markoverall_,graduation_englishmark = graduation_englishmark_,
postgraduation_year = postgraduation_year_,postgraduation_institution = postgraduation_institution_,postgraduation_markoverall = postgraduation_markoverall_,
postgraduation_englishmark = postgraduation_englishmark_,other_year = other_year_,other_instituation = other_instituation_,other_markoverall = other_markoverall_,
other_englishmark = other_englishmark_,exp_institution_1 = exp_institution_1_,exp_institution_2  = exp_institution_2_,exp_institution_3 =exp_institution_3_,
exp_institution_4 = exp_institution_4_, exp_designation_1  =exp_designation_1_,exp_designation_2  = exp_designation_2_,exp_designation_3  = exp_designation_3_,
exp_designation_4  = exp_designation_4_,exp_tenure_from_1 = exp_tenure_from_1_,exp_tenure_from_2  = exp_tenure_from_2_,exp_tenure_from_3 = exp_tenure_from_3_,
exp_tenure_from_4 = exp_tenure_from_4_,exp_tenure_to_1  = exp_tenure_to_1_,exp_tenure_to_2 = exp_tenure_to_2_,exp_tenure_to_3  = exp_tenure_to_3_,exp_tenure_to_4   = exp_tenure_to_4_,
IELTS_Overall =IELTS_Overall_, IELTS_Listening  = IELTS_Listening_,IELTS_Reading = IELTS_Reading_,IELTS_Writting  = IELTS_Writting_,IELTS_Speaking = IELTS_Speaking_,
Passport_No=Passport_No_,Passport_fromdate=Passport_fromdate_,Passport_Todate=Passport_Todate_,LOR_1_Id=LOR_1_Id_,LOR_2_Id=LOR_2_Id_,MOI_Id=MOI_Id_,SOP_Id=SOP_Id_,Ielts_Id=Ielts_Id_,
Passport_Id=Passport_Id_,Resume_Id=Resume_Id_,Agent_Name=Agent_Name_,Enquiry_Source_Name = Enquiry_Source_Name_,
Marital_Status_Id=Marital_Status_Id_,Marital_Status_Name=Marital_Status_Name_,
Program_Course_Id=Program_Course_Id_,Profile_University_Id=Profile_University_Id_,Profile_Country_Id=Profile_Country_Id_,
Created_On=Created_On_,Intake_Id=Intake_Id_
Where Student_Id=Student_Id_ ;
if Passport_Copy_!="" then
UPDATE Student set Passport_Copy=Passport_Copy_, Passport_Copy_File_Name=Passport_Copy_File_Name_ Where Student_Id=Student_Id_ ;
end if;
if Tenth_Certificate_!="" then
UPDATE Student set Tenth_Certificate=Tenth_Certificate_,Tenth_Certificate_File_Name = Tenth_Certificate_File_Name_ Where Student_Id=Student_Id_ ;
end if;
if Work_Experience_!="" then
UPDATE Student set Work_Experience=Work_Experience_ ,Work_Experience_File_Name = Work_Experience_File_Name_ Where Student_Id=Student_Id_ ;
end if;
if Passport_Photo_!="" then
UPDATE Student set Passport_Photo=Passport_Photo_,Passport_Photo_File_Name = Passport_Photo_File_Name_ Where Student_Id=Student_Id_ ;
end if;
if IELTS_!="" then
UPDATE Student set IELTS=IELTS_,IELTS_File_Name = IELTS_File_Name_ Where Student_Id=Student_Id_ ;
end if;
if Resume_!="" then
UPDATE Student set  Resume=Resume_, Resume_File_Name = Resume_File_Name_ Where Student_Id=Student_Id_ ;
end if;
end if;
ELSE
Set Duplicate_Student_Id = (select Student_Id from Student where  DeleteStatus=false and (Phone_Number like concat('%',Phone_Number_,'%')
        or Alternative_Phone_Number like concat('%',Phone_Number_,'%') or Whatsapp  like concat('%',Phone_Number_,'%') )  limit 1);
        Set Duplicate_Registration=(select Is_Registered from Student where Student_Id= Duplicate_Student_Id and DeleteStatus=false);
Set Duplicate_Welcome_Status=(select Send_Welcome_Mail_Status from Student where Student_Id= Duplicate_Student_Id and DeleteStatus=false);
if Email_!="" then
set Email_student_Id= ( select Student_Id from Student where  DeleteStatus=false and ( Email like concat('%',Email_,'%') or Alternative_Email  like concat('%',Email_,'%') ) limit 1);
        end if;
        if Alternative_Email_!="" then
        set Email_Alternate_student_Id= (select Student_Id from Student where  DeleteStatus=false and ( Alternative_Email like concat('%',Alternative_Email_,'%') or Email  like concat('%',Alternative_Email_,'%') ) limit 1);
        end if;
         if Alternative_Phone_Number_!="" then
Set Alternate_student_Id = (select Student_Id from Student where  DeleteStatus=false and (Phone_Number like concat('%',Alternative_Phone_Number_,'%') or Alternative_Phone_Number like concat('%',Alternative_Phone_Number_,'%') or Whatsapp  like concat('%',Alternative_Phone_Number_,'%')) limit 1);
 end if;

       if Whatsapp_!="" then
Set Whatsap_student_Id = (select Student_Id from Student where  DeleteStatus=false and  (Phone_Number like concat('%',Whatsapp_,'%') or Alternative_Phone_Number like concat('%',Whatsapp_,'%') or Whatsapp  like concat('%',Whatsapp_,'%')) limit 1);
end if;
       
         if(Duplicate_Student_Id>0) then
set Duplicate_User_Id = (select User_Id from Student where Student_Id = Duplicate_Student_Id and DeleteStatus=false );
set Duplicate_Department_Id_ = (select Department from Student where Student_Id = Duplicate_Student_Id and DeleteStatus=false);
set Duplicate_FollowUp_Date = (select Next_FollowUp_date from Student where Student_Id = Duplicate_Student_Id and DeleteStatus=false);
set Duplicate_Student_Name = (select Student_Name from Student where Student_Id = Duplicate_Student_Id and DeleteStatus=false );
set Duplicate_User_Name = (select User_Details_Name from user_details where User_Details_Id = Duplicate_User_Id and DeleteStatus=false );
set Duplicate_Department_Name=(select Department_Name from department where Department_Id = Duplicate_Department_Id_ and Is_Delete=false);
set Duplicate_Remark_Name=(select Remark from student where Student_Id = Duplicate_Student_Id and DeleteStatus=false);
set Department_Status=(select FollowUp from department where Department_Id = Duplicate_Department_Id_ and Is_Delete=false);
SET Student_Id_ = -1;  
        elseif(Alternate_student_Id>0) then
set Duplicate_User_Id = (select User_Id from Student where Student_Id = Alternate_student_Id and DeleteStatus=false );
set Duplicate_Department_Id_ = (select Department from Student where Student_Id = Alternate_student_Id and DeleteStatus=false);
set Duplicate_FollowUp_Date = (select Next_FollowUp_date from Student where Student_Id = Alternate_student_Id and DeleteStatus=false);
set Duplicate_Student_Name = (select Student_Name from Student where Student_Id = Alternate_student_Id and DeleteStatus=false );
set Duplicate_User_Name = (select User_Details_Name from user_details where User_Details_Id = Duplicate_User_Id and DeleteStatus=false );
set Duplicate_Department_Name=(select Department_Name from department where Department_Id = Duplicate_Department_Id_ and Is_Delete=false);
set Duplicate_Remark_Name=(select Remark from student where Student_Id = Alternate_student_Id and DeleteStatus=false);
set Department_Status=(select FollowUp from department where Department_Id = Duplicate_Department_Id_ and Is_Delete=false);
SET Student_Id_ = -1;  
        elseif(Whatsap_student_Id>0) then
set Duplicate_User_Id = (select User_Id from Student where Student_Id = Whatsap_student_Id and DeleteStatus=false );
set Duplicate_Department_Id_ = (select Department from Student where Student_Id = Whatsap_student_Id and DeleteStatus=false);
set Duplicate_FollowUp_Date = (select Next_FollowUp_date from Student where Student_Id = Whatsap_student_Id and DeleteStatus=false);
set Duplicate_Student_Name = (select Student_Name from Student where Student_Id = Whatsap_student_Id and DeleteStatus=false );
set Duplicate_User_Name = (select User_Details_Name from user_details where User_Details_Id = Duplicate_User_Id and DeleteStatus=false );
set Duplicate_Department_Name=(select Department_Name from department where Department_Id = Duplicate_Department_Id_ and Is_Delete=false);
set Duplicate_Remark_Name=(select Remark from student where Student_Id = Whatsap_student_Id and DeleteStatus=false);
set Department_Status=(select FollowUp from department where Department_Id = Duplicate_Department_Id_ and Is_Delete=false);
SET Student_Id_ = -1;                
elseif(Email_student_Id>0) then
set Duplicate_User_Id = (select User_Id from Student where Student_Id = Email_student_Id and DeleteStatus=false );
set Duplicate_Department_Id_ = (select Department from Student where Student_Id = Email_student_Id and DeleteStatus=false);
set Duplicate_FollowUp_Date = (select Next_FollowUp_date from Student where Student_Id = Email_student_Id and DeleteStatus=false);
set Duplicate_Student_Name = (select Student_Name from Student where Student_Id = Email_student_Id and DeleteStatus=false );
set Duplicate_User_Name = (select User_Details_Name from user_details where User_Details_Id = Duplicate_User_Id and DeleteStatus=false );
set Duplicate_Department_Name=(select Department_Name from department where Department_Id = Duplicate_Department_Id_ and Is_Delete=false);
set Duplicate_Remark_Name=(select Remark from student where Student_Id = Email_student_Id and DeleteStatus=false);
set Department_Status=(select FollowUp from department where Department_Id = Duplicate_Department_Id_ and Is_Delete=false);
SET Student_Id_ = -2;                
elseif(Email_Alternate_student_Id>0) then
set Duplicate_User_Id = (select User_Id from Student where Student_Id = Email_Alternate_student_Id and DeleteStatus=false );
set Duplicate_Department_Id_ = (select Department from Student where Student_Id = Email_Alternate_student_Id and DeleteStatus=false);
set Duplicate_FollowUp_Date = (select Next_FollowUp_date from Student where Student_Id = Email_Alternate_student_Id and DeleteStatus=false);
set Duplicate_Student_Name = (select Student_Name from Student where Student_Id = Email_Alternate_student_Id and DeleteStatus=false );
set Duplicate_User_Name = (select User_Details_Name from user_details where User_Details_Id = Duplicate_User_Id and DeleteStatus=false );
set Duplicate_Department_Name=(select Department_Name from department where Department_Id = Duplicate_Department_Id_ and Is_Delete=false);
set Duplicate_Remark_Name=(select Remark from student where Student_Id = Email_Alternate_student_Id and DeleteStatus=false);
set Department_Status=(select FollowUp from department where Department_Id = Duplicate_Department_Id_ and Is_Delete=false);
SET Student_Id_ = -2;
else
        SELECT JSON_UNQUOTE (JSON_EXTRACT(FollowUp_,'$.By_User_Id')) INTO Created_By_;
        set Created_User_ =(select User_Details_Name from user_details where User_Details_Id= Created_By_);
        
SET Student_Id_ = (SELECT  COALESCE( MAX(Student_Id ),0)+1 FROM Student);
INSERT INTO Student(Student_Id , Agent_Id, Entry_Date,Student_Name ,Last_Name ,Gender ,Address1 ,Address2 ,Pincode ,Email ,Alternative_Email,Phone_Number,Alternative_Phone_Number ,Dob ,Country_Name ,
Promotional_Code ,Student_Status_Id,Enquiry_Source_Id ,Password,Created_By,
Passport_Copy,IELTS,Passport_Photo,Tenth_Certificate, Work_Experience,Resume,Whatsapp,Facebook,
Passport_Copy_File_Name,IELTS_File_Name, Passport_Photo_File_Name,Tenth_Certificate_File_Name,Work_Experience_File_Name,Resume_File_Name,DeleteStatus,Is_Registered,FollowUp_Count,FollowUp_EntryDate,
Entry_Type,First_Followup_Status,First_Followup_Date,College_University,Programme_Course,Intake,Year,Reference,Visa_Submission_Date,Activity,Course_Link,Agent,Status_Details,Student_Remark,Send_Welcome_Mail_Status,
sslc_year,sslc_institution,sslc_markoverall,sslc_englishmark,plustwo_year,plustwo_institution,plustwo_markoverall,plustwo_englishmark,graduation_year,graduation_institution,
graduation_markoverall,graduation_englishmark,postgraduation_year,postgraduation_institution,postgraduation_markoverall,postgraduation_englishmark,other_year,other_instituation,
other_markoverall,other_englishmark,exp_institution_1,exp_institution_2,exp_institution_3,exp_institution_4,exp_designation_1,exp_designation_2,exp_designation_3,exp_designation_4,
exp_tenure_from_1,exp_tenure_from_2,exp_tenure_from_3,exp_tenure_from_4,exp_tenure_to_1,exp_tenure_to_2,exp_tenure_to_3,exp_tenure_to_4,IELTS_Overall,IELTS_Listening,
IELTS_Reading,IELTS_Writting,IELTS_Speaking,Passport_No,Passport_fromdate,Passport_Todate,LOR_1_Id, LOR_2_Id ,MOI_Id,SOP_Id,Ielts_Id,Passport_Id,Resume_Id,Agent_Name,Enquiry_Source_Name,Created_User
,Marital_Status_Id,Marital_Status_Name,Program_Course_Id,Profile_University_Id,Profile_Country_Id,Created_On,Intake_Id)
values (Student_Id_ ,Client_Accounts_Id_,now(),Student_Name_ ,Last_Name_ ,Gender_ ,Address1_ ,Address2_ ,Pincode_ ,Email_ ,Alternative_Email_,Phone_Number_ ,
Alternative_Phone_Number_,Dob_ ,
Country_Name_ ,Promotional_Code_ ,Student_Status_Id_,Enquiry_Source_Id_ ,Password_,Created_By_,
Passport_Copy_,IELTS_,Passport_Photo_,Tenth_Certificate_, Work_Experience_,Resume_,Whatsapp_,Facebook_,Passport_Copy_File_Name_,IELTS_File_Name_,
Passport_Photo_File_Name_,Tenth_Certificate_File_Name_,Work_Experience_File_Name_,Resume_File_Name_,
  false,0,0,now(),1,1,now(),College_University_,Programme_Course_,Intake_,Year_,Reference_,Visa_Submission_Date_,Activity_,Course_Link_,Agent_,Status_Details_,Student_Remark_,0,
  sslc_year_,sslc_institution_,sslc_markoverall_,sslc_englishmark_,plustwo_year_,plustwo_institution_,plustwo_markoverall_,plustwo_englishmark_,graduation_year_,
  graduation_institution_,graduation_markoverall_,graduation_englishmark_,postgraduation_year_,postgraduation_institution_,postgraduation_markoverall_,postgraduation_englishmark_,
  other_year_,other_instituation_,other_markoverall_,other_englishmark_,
  exp_institution_1_,exp_institution_2_,exp_institution_3_,exp_institution_4_,exp_designation_1_,exp_designation_2_,exp_designation_3_,exp_designation_4_,
exp_tenure_from_1_,exp_tenure_from_2_,exp_tenure_from_3_,exp_tenure_from_4_,exp_tenure_to_1_,exp_tenure_to_2_,exp_tenure_to_3_,exp_tenure_to_4_,IELTS_Overall_,IELTS_Listening_,
IELTS_Reading_,IELTS_Writting_,IELTS_Speaking_,Passport_No_,Passport_fromdate_,Passport_Todate_,LOR_1_Id_,LOR_2_Id_,MOI_Id_,SOP_Id_,Ielts_Id_,Passport_Id_,Resume_Id_,Agent_Name_,Enquiry_Source_Name_,Created_User_,
Marital_Status_Id_,Marital_Status_Name_,Program_Course_Id_,Profile_University_Id_,Profile_Country_Id_,Created_On_,Intake_Id_);
end if;
End If ;
 if( student_document_Value_>0) then
WHILE i < JSON_LENGTH(student_document_) DO
SELECT JSON_UNQUOTE (JSON_EXTRACT(student_document_,CONCAT('$[',i,'].File_Name'))) INTO File_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(student_document_,CONCAT('$[',i,'].Document_Name'))) INTO Document_Name_;
        SELECT JSON_UNQUOTE (JSON_EXTRACT(student_document_,CONCAT('$[',i,'].Document_File_Name'))) INTO Document_File_Name_;
        insert into student_document (Student_Id,File_Name,Document_Name,Document_File_Name,DeleteStatus) values(Student_Id_,File_Name_,Document_Name_,Document_File_Name_,0);
SELECT i + 1 INTO i;      
END WHILE;
 end if;
 
  if( Student_Checklist_Value_>0) then
WHILE j < JSON_LENGTH(student_List_) DO
#SELECT JSON_UNQUOTE (JSON_EXTRACT(student_List_,CONCAT('$[',i,'].Student_Checklist_Id'))) INTO Student_Checklist_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(student_List_,CONCAT('$[',j,'].Check_List_Id'))) INTO Check_List_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(student_List_,CONCAT('$[',j,'].Applicable'))) INTO Applicable_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(student_List_,CONCAT('$[',j,'].Checklist_Status'))) INTO Checklist_Status_;
        insert into student_checklist (Student_Checklist_Id,Check_List_Id,
        Student_Id,Applicable,Checklist_Status,Description,DeleteStatus)
        values(Student_Checklist_Id_,Check_List_Id_,
        Student_Id_,Applicable_,Checklist_Status_,Description_,0);
SELECT j + 1 INTO j;      
END WHILE;
 end if;
 
 else
set Student_Id_=1;
 end if;
 if( FollowUp_Value_>0 && Student_Id_>0)
then
        #set Duplicate_Student_Name= "";
        CALL Save_Student_FollowUp(FollowUp_,Student_Id_);
end if;
#commit;
 select Student_Id_,Duplicate_Student_Id,Duplicate_Student_Name,Duplicate_User_Name,(Date_Format(Duplicate_FollowUp_Date,'%d-%m-%Y ')) as Duplicate_FollowUp_Date,Duplicate_Department_Name,Duplicate_Remark_Name,Duplicate_Registration,Duplicate_Welcome_Status,Department_Status;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Student1`( In
 Student_Id_ int,
 Client_Accounts_Id_ int,
Student_Name_ varchar(50),
Last_Name_ varchar(50),
Gender_ varchar(50),
Address1_ varchar(50),
Address2_ varchar(50),
Pincode_ varchar(7),
Email_ varchar(100),
Phone_Number_ varchar(25),
Dob_ date,
Country_ int,
Promotional_Code_ varchar(50),
Student_Status_Id_ int,
Password_ varchar(20))
Begin 
 if  Student_Id_>0
 THEN 
 UPDATE Student set Student_Id = Student_Id_ ,
Agent_Id=Client_Accounts_Id_,
Student_Name = Student_Name_ ,
Last_Name = Last_Name_ ,
Gender = Gender_ ,
Address1 = Address1_ ,
Address2 = Address2_ ,
Pincode = Pincode_ ,
Email = Email_ ,
Phone_Number = Phone_Number_ ,
Dob = Dob_ ,
Country = Country_ ,
Promotional_Code = Promotional_Code_ ,
Student_Status_Id = Student_Status_Id_ ,
Password = Password_  Where Student_Id=Student_Id_ ;
 ELSE 
 SET Student_Id_ = (SELECT  COALESCE( MAX(Student_Id ),0)+1 FROM Student); 
 INSERT INTO Student(Student_Id ,
 Agent_Id,
 Entry_Date,
Student_Name ,
Last_Name ,
Gender ,
Address1 ,
Address2 ,
Pincode ,
Email ,
Phone_Number ,
Dob ,
Country ,
Promotional_Code ,
Student_Status_Id ,
Password,DeleteStatus ) values (Student_Id_ ,
Client_Accounts_Id_,
now(),
Student_Name_ ,
Last_Name_ ,
Gender_ ,
Address1_ ,
Address2_ ,
Pincode_ ,
Email_ ,
Phone_Number_ ,
Dob_ ,
Country_ ,
Promotional_Code_ ,
Student_Status_Id_ ,
Password_,false );
 End If ;
 select Student_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Student_Course`( In Student_Course_Apply_Id_ int,
Student_Id_ int,Course_Apply JSON,User_Id_ int)
BEGIN
DECLARE Course_Id_ int;declare Course_Branch_ int;
DECLARE i int  DEFAULT 0;
/*DECLARE exit handler for sqlexception
BEGIN
GET DIAGNOSTICS CONDITION 1
@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p2 as MESSAGE_TEXT,@p1 as RETURNED_SQLSTATE  ;
ROLLBACK;
END;
   
    DECLARE exit handler for sqlwarning
BEGIN
GET DIAGNOSTICS CONDITION 1
@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p2 as MESSAGE_TEXT,@p1 as RETURNED_SQLSTATE  ;
ROLLBACK;
END;
   
    START TRANSACTION;*/
   
if  Student_Course_Apply_Id_>0
THEN
delete from student_course_selection where Student_Course_Apply_Id=Student_Course_Apply_Id_;
UPDATE student_course_apply set Student_Id = Student_Id_
Where Student_Course_Apply_Id=Student_Course_Apply_Id_ ;
ELSE
SET Student_Course_Apply_Id_ = (SELECT  COALESCE( MAX(Student_Course_Apply_Id ),0)+1 FROM student_course_apply);
INSERT INTO student_course_apply(Student_Course_Apply_Id ,Student_Id ,Entry_Date ,Status_Id,Paid_On,Total_Course ,User_Id)
values (Student_Course_Apply_Id_ ,Student_Id_ ,now() ,1,Curdate(),JSON_LENGTH(Course_Apply),User_Id_);
End If ;
 
 WHILE i < JSON_LENGTH(Course_Apply) DO
SELECT JSON_UNQUOTE (JSON_EXTRACT(Course_Apply,CONCAT('$[',i,'].Course_Id'))) INTO Course_Id_;
INSERT INTO student_course_selection(Course_Id,Student_Course_Apply_Id )
values (Course_Id_ ,Student_Course_Apply_Id_);

SELECT i + 1 INTO i;
END WHILE;  
 # COMMIT;
select student_course_selection.Student_Course_Apply_Id,Course_Name,student.Email,Student_Name,
 University_Name,Country.Country_Name,Subject_Name,Tution_Fees,Application_Fees,Entry_Requirement,
 Course.Work_Experience,Level_Detail_Name,Duration_Name,intake_Name,ielts.Ielts_Name,Details,Living_Expense,Notes,Course.Registration_Fees,
 Course.Date_Charges,Course.Bank_Statements,Course.Insurance,Course.VFS_Charges,Course.Apostille,Course.Other_Charges
 from student_course_apply
inner join student_course_selection on student_course_selection.Student_Course_Apply_Id=student_course_apply.Student_Course_Apply_Id
inner join student on student.Student_Id=student_course_apply.Student_Id
inner join Course on course.Course_Id=student_course_selection.Course_Id
inner join University on course.University_Id=University.University_Id
inner join Country on course.Country_Id=Country.Country_Id
inner join level_detail on course.Level_Id=level_detail.Level_Detail_Id
inner join duration on course.Duration_Id=duration.Duration_Id
inner join ielts on course.Ielts_Minimum_Score=ielts.Ielts_Id
inner join subject on course.Subject_Id=subject.Subject_Id
where student_course_selection.Student_Course_Apply_Id=Student_Course_Apply_Id_;


 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Student_Document`( In Student_Id_ int,Document_Id_ int, Image_Detail_ varchar(500))
Begin 
Declare Student_Document_Id_ int;
	 SET Student_Document_Id_ = (SELECT  COALESCE( MAX(Student_Document_Id ),0)+1 FROM Student_Document); 
	 INSERT INTO Student_Document(Student_Document_Id ,Student_Id ,Entry_Date,Document_Id,File_Name,DeleteStatus,Document_File_Name ) 
	 values (Student_Document_Id_ ,Student_Id_ ,now(),Document_Id_,Image_Detail_,false ,Document_File_Name_);

 select Student_Document_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Student_FollowUp`( In FollowUp_ JSON,Student_Id_ int)
Begin 
declare Student_FollowUp_Id_ int;declare Department_ int;declare Status_ int;
declare User_Id_ int;declare By_User_Id_ int;declare Next_FollowUp_Date_ datetime;declare Remark_Id_ int;
declare Remark_ varchar(4000);declare Branch_ int;declare Stage_ int;declare Entry_Date_ datetime;
declare FollowUp_Difference_ int;declare Student_Id_J int;declare FollowUP_Time_ datetime;
declare Previous_Followup_Date_ datetime; declare FollowUp_Count_ int;
declare Department_Name_ varchar(50);declare Dept_FollowUp_ int;declare Branch_Name_ varchar(50);declare Client_Accounts_Name_ varchar(500);
declare Department_Status_Name_ varchar(50);declare User_Details_Name_ varchar(250);declare Role_Id_ int;
declare By_User_Name_ varchar(100);declare Student_n varchar(100);declare Created_User_ varchar(100);declare Remark_Name_ varchar(200);
declare x int;
declare First_Followup_Status_ int;
 declare Duplicate_Student_Name varchar(25); declare Duplicate_User_Name varchar(25);
 set x=0;
SELECT JSON_UNQUOTE (JSON_EXTRACT(FollowUp_,'$.Student_Id')) INTO Student_Id_J;   
	if( Student_Id_J>0 )
		then set Student_Id_=Student_Id_J;
	end if;
SELECT JSON_UNQUOTE (JSON_EXTRACT(FollowUp_,'$.Next_FollowUp_Date')) INTO Next_FollowUp_Date_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(FollowUp_,'$.Department')) INTO Department_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(FollowUp_,'$.Status')) INTO Status_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(FollowUp_,'$.User_Id')) INTO User_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(FollowUp_,'$.Branch')) INTO Branch_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(FollowUp_,'$.Remark')) INTO Remark_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(FollowUp_,'$.Remark_id')) INTO Remark_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(FollowUp_,'$.By_User_Id')) INTO By_User_Id_;

set Department_Name_ = (select Department_Name from  department where Department_Id = Department_ and Is_Delete=0);
set Dept_FollowUp_ = (select FollowUp from department where Department_Id = Department_  and Is_Delete=0 );
set Branch_Name_ =(select Branch_Name from branch where Branch_Id = branch_ and Is_Delete=0 );
set Department_Status_Name_=(select Department_Status_Name from department_status where Department_Status_Id = Status_ and Is_Delete=0 );
set User_Details_Name_ =(select User_Details_Name from user_details where User_Details_Id=User_Id_ );
set Role_Id_=(select Role_Id from user_details where User_Details_Id=User_Id_);
set By_User_Name_=(select User_Details_Name from user_details where User_Details_Id=By_User_Id_);
set Student_n=(Select Student_Name from student where Student_Id=Student_Id_);
#set Remark_Name_=(Select Remarks_Name from remarks where Remarks_Id=Remark_Id_);
set Student_FollowUp_Id_ =(SELECT Student_FollowUp_Id from student where Student_Id =Student_Id_);
set Previous_Followup_Date_ =(SELECT Next_FollowUp_Date from student where Student_Id =Student_Id_);
set FollowUp_Difference_= DATEDIFF(Previous_Followup_Date_,now() );
update student_followup set Actual_FollowUp_Date=Now(), FollowUp_Difference=FollowUp_Difference_ where Student_FollowUp_Id= Student_FollowUp_Id_ ; 

 INSERT INTO student_followup(Student_Id ,Entry_Date,Next_FollowUp_Date,FollowUp_Difference,Department ,Status ,User_Id ,Branch,Remark,Remark_Id,By_User_Id,FollowUp_Type ,
 DeleteStatus,FollowUP_Time,Actual_FollowUp_Date,Entry_Type,Branch_Name,UserName,ByUserName,Dept_StatusName,Dept_Name,Student,FollowUp) 
values (Student_Id_ ,Now(),Next_FollowUp_Date_,0,Department_ ,Status_ ,User_Id_ ,Branch_,Remark_,Remark_Id_,By_User_Id_,1,false,Now(),Now(),1,Branch_Name_,User_Details_Name_,By_User_Name_,Department_Status_Name_,Department_Name_,Student_n,Dept_FollowUp_);

set Student_FollowUp_Id_ =(SELECT LAST_INSERT_ID());
set First_Followup_Status_=(select First_Followup_Status from Student where Student_Id = Student_Id_);
if First_Followup_Status_=0 then
	Update student set Student_FollowUp_Id=Student_FollowUp_Id_ ,Department = Department_ ,Status = Status_ ,
	User_Id = User_Id_ ,By_User_Id=By_User_Id_,Next_FollowUp_Date = Next_FollowUp_Date_ ,Remark = Remark_  ,Remark_Id = Remark_Id_,
	Branch=Branch_,FollowUp_Count=x+1,First_Followup_Status=1,First_Followup_Date=now(),Department_Name = Department_Name_,FollowUp=Dept_FollowUp_,Branch_Name = Branch_Name_,Department_Status_Name=Department_Status_Name_,User_Details_Name=User_Details_Name_,Role_Id=Role_Id_,By_UserName = By_User_Name_
	where student.Student_Id=Student_Id_;
else
	Update student set Student_FollowUp_Id=Student_FollowUp_Id_ ,Department = Department_ ,Status = Status_ ,
	User_Id = User_Id_ ,By_User_Id=By_User_Id_,Next_FollowUp_Date = Next_FollowUp_Date_ ,Remark = Remark_  ,Remark_Id = Remark_Id_,
	Branch=Branch_,FollowUp_Count=x+1,Department_Name = Department_Name_,FollowUp=Dept_FollowUp_,Branch_Name = Branch_Name_,Department_Status_Name=Department_Status_Name_,User_Details_Name=User_Details_Name_,Role_Id=Role_Id_,By_UserName = By_User_Name_
	where student.Student_Id=Student_Id_;
end if;
 select Student_Id_,Duplicate_Student_Name,Duplicate_User_Name;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Student_Import`( In Student_Details json,By_User_Id_ int,Branch_ int,Department_ int,Status_ int,To_User_ int,
Enquiry_Source_ int,Next_FollowUp_Date_ datetime)
Begin
Declare i int;DECLARE Student_Id_ int;
Declare intake_temp1_ varchar(100);Declare intake_temp2_ varchar(100);Declare intake_length_ int; declare Intake_main_length int;
declare Name_ varchar(100);declare Email_ varchar(100);declare Phone_ varchar(15);declare Whatsapp_ varchar(100);
declare Address1_ varchar(200);declare Last_Name_ varchar(100);declare Address2_ varchar(100);declare Pincode_ varchar(100);
declare Alternative_Email_ varchar(100);declare Alternative_Phone_Number_ varchar(100);declare Facebook_ varchar(100);
declare Duplicate_Student_Id int;declare Duplicate_Student_Name varchar(100); declare Student_FollowUp_Id_ int;
declare Duplicate_User_Name varchar(25); declare Duplicate_User_Id int; declare import_master_id int default 0;
declare Master_Id_ int;
declare Visa_Submission_Date_ varchar(20);declare Country_Name_ varchar(45);
declare Passport_fromdate_ date;declare Passport_Todate_ date;declare exp_tenure_from_1_ date;declare exp_tenure_from_2_ date;
declare exp_tenure_from_3_ date;declare exp_tenure_from_4_ date;declare exp_tenure_to_1_ date;declare exp_tenure_to_2_ date;declare exp_tenure_to_3_ date;
declare exp_tenure_to_4_ date;
declare Intake_ varchar(50);declare Reference_ varchar(50);declare Activity_ varchar(50);declare Visa_Outcome_ varchar(50);
declare Year_ varchar(50);declare College_University_ varchar(50);
declare Programme_Course_ varchar(50);declare Agent_ varchar(50);declare Status_Details_ varchar(45);
declare Student_Remark_ varchar(45);declare Created_On_ varchar(45);declare Department_Name_ varchar(100);
declare Dept_FollowUp_ int;declare Branch_Name_ varchar(100);declare Department_Status_Name_ varchar(100);
declare User_Details_Name_ varchar(100);declare Role_Id_ int;declare By_User_Name_ varchar(100);declare Enquiry_Source_Name_ varchar(100);
#DROP TEMPORARY TABLE Duplicate_Students;
#CREATE TEMPORARY TABLE Duplicate_Students
#(
# Student_Id int PRIMARY KEY,
#    Student_Name varchar(100),
 #  Mobile varchar(100),
#    By_User_Name varchar(100)
#);

Set i=0;
#SET import_master_id_ = (SELECT  COALESCE( MAX(import_master_id ),0)+1 FROM import_master);    

delete from Duplicate_Students;
#insert into import_master(Import_Master_Id,Entry_Date)values(Import_Master_Id_,now());
 SET Master_Id_ = (SELECT  COALESCE( MAX(Master_Id ),0)+1 FROM import_students_master);
 insert into import_students_master values(Master_Id_,By_User_Id_,Next_FollowUp_Date_);
WHILE i < JSON_LENGTH(Student_Details) DO
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_Details,CONCAT('$[',i,'].Name'))) INTO Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_Details,CONCAT('$[',i,'].Mobile'))) INTO Phone_ ;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_Details,CONCAT('$[',i,'].Address'))) INTO Address1_ ;
    SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_Details,CONCAT('$[',i,'].Country'))) INTO Country_Name_ ;
    SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_Details,CONCAT('$[',i,'].College_University'))) INTO College_University_ ;
    SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_Details,CONCAT('$[',i,'].Programme_Course'))) INTO Programme_Course_ ;
    SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_Details,CONCAT('$[',i,'].Intake'))) INTO Intake_ ;
    SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_Details,CONCAT('$[',i,'].Year'))) INTO Year_ ;
    SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_Details,CONCAT('$[',i,'].Reference'))) INTO Reference_ ;
    #SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_Details,CONCAT('$[',i,'].Visa_Submission_Date'))) INTO Visa_Submission_Date_ ;
    SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_Details,CONCAT('$[',i,'].Activity'))) INTO Activity_ ;
    SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_Details,CONCAT('$[',i,'].Visa_Outcome'))) INTO Visa_Outcome_ ;
    SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_Details,CONCAT('$[',i,'].Status'))) INTO Status_Details_ ;
    SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_Details,CONCAT('$[',i,'].Remarks'))) INTO Student_Remark_ ;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_Details,CONCAT('$[',i,'].Agent'))) INTO Agent_ ;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_Details,CONCAT('$[',i,'].Whatsapp'))) INTO Whatsapp_ ;
    SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_Details,CONCAT('$[',i,'].Email'))) INTO Email_ ;
      SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_Details,CONCAT('$[',i,'].Date'))) INTO Created_On_ ;
  # if Whatsapp_='null' then
  # set Whatsapp_='';
   #end if;

if  ISNULL(Address1_) then set Address1_=''; end if;
    if  ISNULL(Country_Name_) then set Country_Name_=''; end if;
    if  ISNULL(College_University_) then set College_University_=''; end if;
    if  ISNULL(Programme_Course_) then set Programme_Course_=''; end if;
    if  ISNULL(Intake_) then set Intake_=''; end if;
    if  ISNULL(Year_) then set Year_=''; end if;
if  ISNULL(Reference_) then set Reference_=''; end if;
    if  ISNULL(Visa_Submission_Date_) then set Visa_Submission_Date_=''; end if;
if  ISNULL(Activity_) then set Activity_=''; end if;
    if  ISNULL(Visa_Outcome_) then set Visa_Outcome_=''; end if;
    if  ISNULL(Status_Details_) then set Status_Details_=''; end if;
    if  ISNULL(Student_Remark_) then set Student_Remark_=''; end if;
     if  ISNULL(Whatsapp_) then set Whatsapp_=''; end if;
      if  ISNULL(Created_On_) then set Created_On_=''; end if;
set Department_Name_ = (select Department_Name from  department where Department_Id = Department_ and Is_Delete=0);
set Dept_FollowUp_ = (select FollowUp from department where Department_Id = Department_  and Is_Delete=0 );
set Branch_Name_ =(select Branch_Name from branch where Branch_Id = Branch_ and Is_Delete=0 );
set Department_Status_Name_=(select Department_Status_Name from department_status where Department_Status_Id = Status_ and Is_Delete=0 );
set User_Details_Name_ =(select User_Details_Name from user_details where User_Details_Id=To_User_ );
set Role_Id_=(select Role_Id from user_details where User_Details_Id=To_User_);
set By_User_Name_=(select User_Details_Name from user_details where User_Details_Id=By_User_Id_);
set Enquiry_Source_Name_=(select Enquiry_Source_Name from enquiry_source where Enquiry_Source_Id=Enquiry_Source_);
    #insert into db_logs_ (id,Description) values(0,Intake_Name_);and Alternative_Phone_Number like concat('%',Phone_,'%')
   Set Student_Id_ = (select Student_Id from Student where  DeleteStatus=0 and Phone_Number like concat('%',Phone_,'%') or Whatsapp like concat('%',Phone_,'%')    limit 1);
if(Student_Id_>0) then
set Duplicate_User_Id = (select User_Id from Student where Student_Id = Student_Id_);
set Duplicate_Student_Name = (select Student_Name from Student where Student_Id = Student_Id_);
set Duplicate_User_Name = (select User_Details_Name from user_details where User_Details_Id = Duplicate_User_Id);
SET Student_Id_ = -1;
            insert into Duplicate_Students values(0,Student_Id_,Duplicate_Student_Name,Phone_,Duplicate_User_Name,Master_Id_);
else
SET Student_Id_ = (SELECT  COALESCE( MAX(Student_Id ),0)+1 FROM Student);
           
/*INSERT INTO Student(Student_Id , Agent_Id, Entry_Date,Student_Name ,Last_Name ,Gender ,Address1 ,Address2 ,Pincode ,Email ,Alternative_Email,Phone_Number,Alternative_Phone_Number ,Dob ,Country ,
Promotional_Code ,Student_Status_Id,Enquiry_Source_Id ,Password,Created_By,
Passport_Copy,IELTS,Passport_Photo,Tenth_Certificate, Work_Experience,Resume,Whatsapp,Facebook,
Passport_Copy_File_Name,IELTS_File_Name, Passport_Photo_File_Name,Tenth_Certificate_File_Name,Work_Experience_File_Name,
Resume_File_Name,DeleteStatus,By_User_Id,Branch,Department,Status,User_Id,Next_FollowUp_Date,Is_Registered)
        values (Student_Id_,1,now(),Name_ ,'',0,Address1_,'','',Email_ ,'',Phone_ ,'',now(),0,
'',0,Enquiry_Source_,'',By_User_Id_,'','','','','','','','','','','','','','',0,
By_User_Id_,Branch_,Department_,Status_,To_User_,Next_FollowUp_Date_,0); */
INSERT INTO Student(Student_Id , Agent_Id, Entry_Date,Student_Name ,Last_Name ,Gender ,Address1 ,Address2 ,Pincode ,Email ,Phone_Number,Dob ,Country_Name ,Promotional_Code ,
Student_Status_Id,Password,Next_FollowUp_Date,Department,Status,User_Id, Branch,Remark,Remark_Id,By_User_Id,Passport_Copy,IELTS,Passport_Photo,
Tenth_Certificate,Work_Experience, Resume,DeleteStatus,Enquiry_Source_Id,Alternative_Phone_Number,Alternative_Email,
Whatsapp,Facebook,Passport_Copy_File_Name,IELTS_File_Name,Passport_Photo_File_Name,Tenth_Certificate_File_Name,
Work_Experience_File_Name,Resume_File_Name,Is_Registered,Registered_By ,Created_By,College_University,Programme_Course,
Intake,Year,Reference,Visa_Submission_Date,Activity,Visa_Outcome,Agent,Status_Details,Student_Remark,Send_Welcome_Mail_Status,
Passport_fromdate,Passport_Todate,
exp_tenure_from_1,exp_tenure_from_2,exp_tenure_from_3,exp_tenure_from_4,exp_tenure_to_1,exp_tenure_to_2,exp_tenure_to_3,
exp_tenure_to_4,Created_On,FollowUp,Branch_Name,Department_Status_Name,User_Details_Name,Role_Id,Enquiry_Source_Name,Created_User,
By_UserName,Department_Name)
values(Student_Id_ , 1, now(),Name_ ,'' ,0 ,Address1_ ,'' ,'',Email_,Phone_,now() ,Country_Name_ ,'' ,0,'',
Next_FollowUp_Date_,Department_,Status_,To_User_, Branch_,'',0,By_User_Id_,'','','',
'','', '',0,Enquiry_Source_,'','',
Whatsapp_,'','','','','','','',0,0 ,By_User_Id_,College_University_,Programme_Course_,
Intake_,Year_,Reference_,now(),Activity_,Visa_Outcome_,Agent_,Status_Details_,Student_Remark_,0,current_date(),current_date(),current_date(),current_date(),current_date(),
current_date(),current_date(),current_date(),current_date(),current_date(),Created_On_,Dept_FollowUp_,Branch_Name_,
Department_Status_Name_,User_Details_Name_,Role_Id_,Enquiry_Source_Name_,By_User_Name_,By_User_Name_,Department_Name_);
           
INSERT INTO student_followup(Student_Id ,Entry_Date,Next_FollowUp_Date,FollowUp_Difference,Department ,Status ,User_Id ,Branch,Remark,Remark_Id,By_User_Id,FollowUp_Type ,DeleteStatus,
FollowUP_Time,Actual_FollowUp_Date,Branch_Name,UserName,ByUserName,Dept_StatusName,Dept_Name,FollowUp)
values (Student_Id_ ,Now(),Next_FollowUp_Date_,0,Department_ ,Status_ ,To_User_ ,Branch_,0,0,By_User_Id_,1,false,Now(),Now(),
Branch_Name_,By_User_Name_,By_User_Name_,Department_Status_Name_,Department_Name_,Dept_FollowUp_);
set Student_FollowUp_Id_ =(SELECT LAST_INSERT_ID());
Update student set Student_FollowUp_Id=Student_FollowUp_Id_ ,Next_FollowUp_Date = Next_FollowUp_Date_ where student.Student_Id=Student_Id_;
           
end if;
SELECT i + 1 INTO i;      
END WHILE;
set import_master_id=1;

 select  import_master_id;
 select * from Duplicate_Students where Master_Id=Master_Id_;
 delete from Duplicate_Students where Master_Id=Master_Id_;
# DROP TEMPORARY TABLE Duplicate_Students;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Student_Message`( In Student_Message_Id_ int,
Student_Id_ int,
Message_Detail_ varchar(2000))
Begin 
 if  Student_Message_Id_>0
 THEN 
 UPDATE Student_Message set Student_Message_Id = Student_Message_Id_ ,
Student_Id = Student_Id_ ,
Message_Detail = Message_Detail_  Where Student_Message_Id=Student_Message_Id_ ;
 ELSE 
 SET Student_Message_Id_ = (SELECT  COALESCE( MAX(Student_Message_Id ),0)+1 FROM Student_Message); 
 INSERT INTO Student_Message(Student_Message_Id ,
Student_Id ,
Message_Detail,Entry_Date,DeleteStatus ) values (Student_Message_Id_ ,
Student_Id_ ,
Message_Detail_,now(),false );
 End If ;
 select Student_Message_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Student_Report_FollowUp`( In Student_Selected_Details_ json,By_User_Id_ int,
Branch_ int,User_Id_ int)
Begin
Declare i int;DECLARE Student_Id_ int;declare x int default 0;
declare Student_FollowUp_Id_ int;declare Department_ int;declare Remark_Id_ int;declare Status_ int ;
declare Next_FollowUp_Date_ datetime ;
declare import_master_id int default 0;
declare Master_Id_ int;

Set i=0;
WHILE i < JSON_LENGTH(Student_Selected_Details_) DO
SELECT JSON_UNQUOTE (JSON_EXTRACT(Student_Selected_Details_,CONCAT('$[',i,'].Student_Id'))) INTO Student_Id_;
set Department_ = (Select Department from student where Student_Id = Student_Id_);
set Remark_Id_ = (Select Remark_Id from student where Student_Id = Student_Id_);
set Status_ = (Select Status from student where Student_Id = Student_Id_);
set Next_FollowUp_Date_ = (Select Next_FollowUp_date from student where Student_Id = Student_Id_);

INSERT INTO student_followup(Student_Id ,Entry_Date,Next_FollowUp_Date,FollowUp_Difference,Department ,Status ,User_Id ,Branch,By_User_Id,FollowUp_Type ,
DeleteStatus,FollowUP_Time,Actual_FollowUp_Date,Remark_Id,Entry_Type)
values (Student_Id_ ,Now(),Next_FollowUp_Date_,0,Department_ ,Status_ ,User_Id_ ,Branch_,By_User_Id_,1,false,Now(),Now(),Remark_Id_,3);
set Student_FollowUp_Id_ =(SELECT LAST_INSERT_ID());
Update student set Student_FollowUp_Id=Student_FollowUp_Id_ ,Department = Department_ ,Status = Status_ ,
User_Id = User_Id_ ,By_User_Id=By_User_Id_,Next_FollowUp_Date = Next_FollowUp_Date_ ,Remark_Id=Remark_Id_,
Branch=Branch_,FollowUp_Count=x+1
where student.Student_Id=Student_Id_;
SELECT i + 1 INTO i;      
END WHILE;
set import_master_id=1;
select Student_Id_;
End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Student_Status`( In Student_Status_Id_ int,
Student_Status_Name_ varchar(50))
Begin 
 if  Student_Status_Id_>0
 THEN 
 UPDATE Student_Status set Student_Status_Id = Student_Status_Id_ ,
Student_Status_Name = Student_Status_Name_  Where Student_Status_Id=Student_Status_Id_ ;
 ELSE 
 SET Student_Status_Id_ = (SELECT  COALESCE( MAX(Student_Status_Id ),0)+1 FROM Student_Status); 
 INSERT INTO Student_Status(Student_Status_Id ,
Student_Status_Name,DeleteStatus ) values (Student_Status_Id_ ,
Student_Status_Name_,false );
 End If ;
 select Student_Status_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Subject`( In Subject_Id_ int,
Subject_Name_ varchar(50))
Begin 
 if  Subject_Id_>0
 THEN 
 UPDATE Subject set Subject_Id = Subject_Id_ ,
Subject_Name = Subject_Name_  Where Subject_Id=Subject_Id_ ;
 ELSE 
 SET Subject_Id_ = (SELECT  COALESCE( MAX(Subject_Id ),0)+1 FROM Subject); 
 INSERT INTO Subject(Subject_Id ,
Subject_Name,DeleteStatus ) values (Subject_Id_ ,
Subject_Name_,false );
 End If ;
 select Subject_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Sub_Section`( In Sub_Section_Id_ int,
Sub_Section_Name_ varchar(50))
Begin 
 if  Sub_Section_Id_>0
 THEN 
	UPDATE sub_section set Sub_Section_Id = Sub_Section_Id_ ,Sub_Section_Name = Sub_Section_Name_  Where Sub_Section_Id=Sub_Section_Id_ ;
 ELSE 
	SET Sub_Section_Id_ = (SELECT  COALESCE( MAX(Sub_Section_Id ),0)+1 FROM sub_section); 
	INSERT INTO sub_section(Sub_Section_Id ,Sub_Section_Name,DeleteStatus ) values (Sub_Section_Id_ ,Sub_Section_Name_,false );
 End If ;
 select Sub_Section_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_University`( In University_Id_ int,
University_Name_ varchar(50))
Begin 
 if  University_Id_>0
 THEN 
 UPDATE University set University_Id = University_Id_ ,
University_Name = University_Name_  Where University_Id=University_Id_ ;
 ELSE 
 SET University_Id_ = (SELECT  COALESCE( MAX(University_Id ),0)+1 FROM University); 
 INSERT INTO University(University_Id ,
University_Name,DeleteStatus ) values (University_Id_ ,
University_Name_,false );
 End If ;
 select University_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_University_Photos`(in University_Id_ int,
Photo json)
BEGIN
DECLARE University_Image_ varchar(50);DECLARE i int  DEFAULT 0;
/*DECLARE exit handler for sqlexception  
BEGIN
GET DIAGNOSTICS CONDITION 1
@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p2 AS MESSAGE_TEXT, @p1 AS RETURNED_SQLSTATE;
#ROLLBACK;
END;
DECLARE exit handler for sqlwarning
BEGIN
GET DIAGNOSTICS CONDITION 1
@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p2 AS MESSAGE_TEXT, @p1 AS RETURNED_SQLSTATE;
#ROLLBACK;
END;
    START TRANSACTION;*/
 WHILE i < JSON_LENGTH(Photo) DO
SELECT JSON_UNQUOTE (JSON_EXTRACT(Photo,CONCAT('$[',i,'].File_name'))) INTO University_Image_;
   
INSERT INTO University_Photos(University_Id,University_Image,DeleteStatus )
values (University_Id_ ,University_Image_ ,false);
SELECT i + 1 INTO i;
END WHILE;  
#COMMIT;
select University_Id_;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_User_Details`( In User_Details_Id_ decimal,
User_Details_Name_ varchar(250),Password_ varchar(250),Working_Status_ int,
User_Type_ int,Role_Id_ decimal,Branch_ int,Address1_ varchar(250),Address2_ varchar(250),Address3_ varchar(250),
Address4_ varchar(250),Pincode_ varchar(250),Mobile_ varchar(250),Email_ varchar(250),
Employee_Id_ int,Registration_Target_ int,FollowUp_Target_ varchar(250),User_Menu_Selection JSON,User_Department JSON)
BEGIN

DECLARE Department_Id_ int;DECLARE Branch_Id_ int;DECLARE View_Entry_ varchar(25);declare Old_Role_Id_ int;
DECLARE VIew_All_ varchar(25); DECLARE VIew_All_1 varchar(25);
DECLARE Menu_Id_ int;DECLARE IsEdit_ varchar(25);DECLARE IsSave_ varchar(25);
DECLARE IsDelete_ varchar(25);DECLARE IsView_ varchar(25); DECLARE Menu_Status_ varchar(25);
        declare User_Max_Count int;
    declare Current_User_Count int;
DECLARE i int  DEFAULT 0;
/*DECLARE exit handler for sqlexception
BEGIN
GET DIAGNOSTICS CONDITION 1
@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p2 as MESSAGE_TEXT,@p1 as RETURNED_SQLSTATE  ;
ROLLBACK;
END;
   
    DECLARE exit handler for sqlwarning
BEGIN
GET DIAGNOSTICS CONDITION 1
@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p2 as MESSAGE_TEXT,@p1 as RETURNED_SQLSTATE  ;
ROLLBACK;
END;
   
    START TRANSACTION;*/
    set Old_Role_Id_ = (select Role_Id from user_details where User_Details_Id = User_Details_Id_ );
delete from User_Menu_Selection where User_Id=User_Details_Id_;
delete from User_Department where User_Id=User_Details_Id_;
if  User_Details_Id_>0
THEN

UPDATE User_Details set User_Details_Name = User_Details_Name_ ,Password = Password_ ,Working_Status = Working_Status_ ,
User_Type = User_Type_ ,Role_Id = Role_Id_ ,Address1 = Address1_ ,Address2 = Address2_ ,Address3 = Address3_ ,Branch_Id=Branch_,
Address4 = Address4_ ,Pincode = Pincode_ ,Mobile = Mobile_ ,Email = Email_,Employee_Id=Employee_Id_,Registration_Target=Registration_Target_,
FollowUp_Target=FollowUp_Target_
Where User_Details_Id=User_Details_Id_ ;
update student set User_Details_Name = User_Details_Name_ where User_Id = User_Details_Id_;
update student set Created_User = User_Details_Name_ where Created_By = User_Details_Id_;
update student set Registered_User = User_Details_Name_ where Registered_By = User_Details_Id_;
update student set By_UserName = User_Details_Name_ where By_User_Id = User_Details_Id_;
update student set By_UserName = User_Details_Name_ where By_User_Id = User_Details_Id_;
update student set Role_Id = Role_Id_ where User_Id = User_Details_Id_;
ELSE

        set User_Max_Count=(select Settings_Value from settings_table where  Settings_Id=1);
set Current_User_Count=(select count(User_Details_Id) from user_details where DeleteStatus=0);
if User_Max_Count>Current_User_Count then
       
SET User_Details_Id_ = (SELECT  COALESCE( MAX(User_Details_Id ),0)+1 FROM User_Details);
INSERT INTO User_Details(User_Details_Id ,User_Details_Name ,Password ,Working_Status ,User_Type ,Role_Id ,Branch_Id,
Address1 ,Address2 ,Address3 ,Address4 ,Pincode ,Mobile ,Email ,Employee_Id,Registration_Target,FollowUp_Target,DeleteStatus )
values (User_Details_Id_ ,User_Details_Name_ ,Password_ ,Working_Status_ ,User_Type_ ,
Role_Id_ ,Branch_,Address1_ ,Address2_ ,Address3_ ,Address4_ ,Pincode_ ,Mobile_ ,Email_ ,Employee_Id_,Registration_Target_,FollowUp_Target_,false);
else
SET User_Details_Id_ = -1;
end if;
End If ;
    if  User_Details_Id_>0 then
WHILE i < JSON_LENGTH(User_Department) DO
SELECT JSON_UNQUOTE (JSON_EXTRACT(User_Department,CONCAT('$[',i,'].Department_Id'))) INTO Department_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(User_Department,CONCAT('$[',i,'].Branch_Id'))) INTO Branch_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(User_Department,CONCAT('$[',i,'].Check_Box_View'))) INTO View_Entry_;
if(View_Entry_='true')
then set View_Entry_=1;
else set View_Entry_=0;
end if;
SELECT JSON_UNQUOTE (JSON_EXTRACT(User_Department,CONCAT('$[',i,']. Check_Box_VIew_All'))) INTO VIew_All_;
set VIew_All_1=VIew_All_;

if(VIew_All_='true')
then set VIew_All_=1;
else set VIew_All_=0;
end if;

INSERT INTO User_Department(User_Id,Department_Id,Branch_Id,View_Entry,VIew_All,Is_Delete )
values (User_Details_Id_,Department_Id_,Branch_Id_,View_Entry_,VIew_All_,false);  
SELECT i + 1 INTO i;
END WHILE;  
set i=0;
WHILE i < JSON_LENGTH(User_Menu_Selection) DO
SELECT JSON_UNQUOTE (JSON_EXTRACT(User_Menu_Selection,CONCAT('$[',i,'].Menu_Id'))) INTO Menu_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(User_Menu_Selection,CONCAT('$[',i,'].IsEdit'))) INTO IsEdit_;
        if(IsEdit_='true')
then set IsEdit_=1;
else set IsEdit_=0;
end if;
SELECT JSON_UNQUOTE (JSON_EXTRACT(User_Menu_Selection,CONCAT('$[',i,'].IsSave'))) INTO IsSave_;
if(IsSave_='true')
then set IsSave_=1;
else set IsSave_=0;
end if;
SELECT JSON_UNQUOTE (JSON_EXTRACT(User_Menu_Selection,CONCAT('$[',i,'].IsDelete'))) INTO IsDelete_;
  if(IsDelete_='true')
then set IsDelete_=1;
else set IsDelete_=0;
end if;
           SELECT JSON_UNQUOTE (JSON_EXTRACT(User_Menu_Selection,CONCAT('$[',i,'].IsView'))) INTO IsView_;
  if(IsView_='true')
then set IsView_=1;
else set IsView_=0;
end if;
        SELECT JSON_UNQUOTE (JSON_EXTRACT(User_Menu_Selection,CONCAT('$[',i,'].Menu_Status'))) INTO Menu_Status_;
  if(Menu_Status_='true')
then set Menu_Status_=1;
else set Menu_Status_=0;
end if;          
INSERT INTO User_Menu_Selection(Menu_Id,User_Id,IsEdit,IsSave,IsDelete ,IsView,Menu_Status,DeleteStatus )
values (Menu_Id_ ,User_Details_Id_ ,IsEdit_ ,IsSave_ ,IsDelete_ ,IsView_ ,Menu_Status_ ,false);
SELECT i + 1 INTO i;
END WHILE;  
end if;
 #COMMIT;
 select User_Details_Id_,Branch_Id_;
 if Old_Role_Id_ != Role_Id_ then
	update student set Role_Id = Role_Id_ where User_Id = User_Details_Id_;
end if;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_User_Role`( In User_Role_Id_ int,
User_Role_Name_ varchar(50),
Role_Under_Id_ int)
Begin 
 if  User_Role_Id_>0
 THEN 
 UPDATE user_role set User_Role_Id = User_Role_Id_ ,
User_Role_Name=User_Role_Name_,
Role_Under_Id = Role_Under_Id_  Where User_Role_Id=User_Role_Id_ ;
 ELSE 
 SET User_Role_Id_ = (SELECT  COALESCE( MAX(User_Role_Id ),0)+1 FROM user_role); 
 INSERT INTO user_role(User_Role_Id ,
User_Role_Name ,
Role_Under_Id ,
Is_Delete ) values (User_Role_Id_ ,
User_Role_Name_ ,
Role_Under_Id_,
false);
 End If ;
 select User_Role_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Save_Visa`( In Visa_Details_ json,Visa_Details_Value_ int,Visa_document_ json,Visa_Document_Value_ int )
Begin
 Declare Visa_Id_ varchar(100);Declare Student_Id_ int;Declare Approved_Date_ Datetime; Declare Visa_Granted_ varchar(10);Declare Application_No_ varchar(100);Declare Total_Fees_ varchar(100);Declare Scholarship_Fees_ varchar(100);Declare Balance_Fees_ varchar(100);Declare Paid_Fees_ varchar(100);
 declare Visa_File_Name_ varchar(100); declare Visa_Document_Name_ varchar(100);declare Visa_Document_File_Name_ varchar(100);
 Declare Visa_File_ varchar(10);Declare Visa_Letter_ varchar(10);Declare Approved_Date_L_ Datetime;
 Declare Approved_Date_F_ Datetime;declare Visa_Type_Id_ int;declare Visa_Type_Name_ varchar(45);declare Description_ varchar(100);
Declare i int default 0;Declare j int default 0;
/*DECLARE exit handler for sqlexception
BEGIN
GET DIAGNOSTICS CONDITION 1
@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p2 AS MESSAGE_TEXT, @p1 AS RETURNED_SQLSTATE;
ROLLBACK;
END;
    DECLARE exit handler for sqlwarning
BEGIN
GET DIAGNOSTICS CONDITION 1
@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p2 AS MESSAGE_TEXT, @p1 AS RETURNED_SQLSTATE;
ROLLBACK;
END;
    START TRANSACTION;*/
if( Visa_Details_Value_>0) then
SELECT JSON_UNQUOTE (JSON_EXTRACT(Visa_Details_,'$.Visa_Id')) INTO Visa_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Visa_Details_,'$.Student_Id')) INTO Student_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Visa_Details_,'$.Approved_Date')) INTO Approved_Date_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Visa_Details_,'$.Approved_Date_L')) INTO Approved_Date_L_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Visa_Details_,'$.Approved_Date_F')) INTO Approved_Date_F_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Visa_Details_,'$.Visa_Granted')) INTO Visa_Granted_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Visa_Details_,'$.Visa_Letter')) INTO Visa_Letter_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Visa_Details_,'$.Visa_File')) INTO Visa_File_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Visa_Details_,'$.Application_No')) INTO Application_No_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Visa_Details_,'$.Total_Fees')) INTO Total_Fees_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Visa_Details_,'$.Scholarship_Fees')) INTO Scholarship_Fees_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Visa_Details_,'$.Balance_Fees')) INTO Balance_Fees_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Visa_Details_,'$.Paid_Fees')) INTO Paid_Fees_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Visa_Details_,'$.Visa_Type_Id')) INTO Visa_Type_Id_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Visa_Details_,'$.Visa_Type_Name')) INTO Visa_Type_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Visa_Details_,'$.Description')) INTO Description_;
if (Visa_Granted_ = 'true' )
then
set Visa_Granted_= 1;
 else
set Visa_Granted_= 0;
end if;

if (Visa_Letter_ = 'true' )
then
set Visa_Letter_= 1;
 else
set Visa_Letter_= 0;
end if;

if (Visa_File_ = 'true' )
then
set Visa_File_= 1;
 else
set Visa_File_= 0;
end if;

if(Visa_Id_>0) then
 UPDATE visa set Visa_Id = Visa_Id_ ,Visa_Granted = Visa_Granted_,Visa_Letter = Visa_Letter_,Visa_File = Visa_File_,Student_Id = Student_Id_,Approved_Date = Approved_Date_,Approved_Date_L = Approved_Date_L_,Approved_Date_F = Approved_Date_F_,
 Application_No = Application_No_,Total_Fees=Total_Fees_,Scholarship_Fees=Scholarship_Fees_,Balance_Fees=Balance_Fees_,Paid_Fees=Paid_Fees_,
 Visa_Type_Id=Visa_Type_Id_,Visa_Type_Name=Visa_Type_Name_,Description=Description_
  Where Visa_Id = Visa_Id_;
 ELSE  
SET Visa_Id_ = (SELECT  COALESCE( MAX(Visa_Id ),0)+1 FROM visa);
 INSERT INTO visa(Visa_Id,Visa_Granted ,Visa_Letter,Visa_File,Approved_Date,Approved_Date_L,Approved_Date_F,Student_Id,
 Application_No,Total_Fees,Scholarship_Fees,Balance_Fees,Paid_Fees,Visa_Type_Id,Visa_Type_Name,Description,DeleteStatus)
            values (Visa_Id_,Visa_Granted_,Visa_Letter_,Visa_File_,Approved_Date_,Approved_Date_L_,Approved_Date_F_,
            Student_Id_,Application_No_,Total_Fees_,Scholarship_Fees_,Balance_Fees_,Paid_Fees_,Visa_Type_Id_,
            Visa_Type_Name_,Description_,0);
End If ;
 end if;
 if( Visa_Document_Value_>0) then
WHILE j < JSON_LENGTH(Visa_document_) DO
SELECT JSON_UNQUOTE (JSON_EXTRACT(Visa_document_,CONCAT('$[',j,'].Visa_File_Name'))) INTO Visa_File_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Visa_document_,CONCAT('$[',j,'].Visa_Document_Name'))) INTO Visa_Document_Name_;
SELECT JSON_UNQUOTE (JSON_EXTRACT(Visa_document_,CONCAT('$[',j,'].Visa_Document_File_Name'))) INTO Visa_Document_File_Name_;
        insert into visa_document (Visa_Id,Entry_Date,Description,Visa_Document_Name,Visa_Document_File_Name,Visa_File_Name,Student_Id,DeleteStatus)
        values(Visa_Id_,now(),'',Visa_Document_Name_,Visa_Document_File_Name_,Visa_File_Name_,Student_Id_,0);
SELECT j + 1 INTO j;      
END WHILE;
 end if;
#commit;
 select Visa_Id_;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Account_Group`( In Group_Name_ varchar(100))
Begin 
set Group_Name_ = Concat( '%',Group_Name_ ,'%');
SELECT Second.Account_Group_Id,Second.Primary_Id,Second.Group_Name,Second.Under_Group,
First.Group_Name as UnderGroup
FROM Account_Group as Second inner join Account_Group as First 
on First.Account_Group_Id=Second.Under_Group
where Second.Group_Name LIKE Group_Name_
and Second.Account_Group_Id>35 AND First.DeleteStatus=False AND Second.DeleteStatus=False;
End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Account_Group_Typeahead`( In Group_Name_ varchar(100))
Begin 
set Group_Name_ = Concat( '%',Group_Name_ ,'%');
SELECT
Account_Group_Id,Group_Name
FROM Account_Group 
where Group_Name LIKE Group_Name_ 
and Group_Name Not in('Sundry Debtors')
and DeleteStatus=False
order by Group_Name asc Limit 5 ;
End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Agent`( In Client_Accounts_Name_ varchar(100),Account_Group_ int,Pointer_Start_ Varchar(10), 
Pointer_Stop_ Varchar(10), Page_Length_ Varchar(10))
Begin 
declare Search_Date_ varchar(500);declare SearchbyName_Value varchar(2000);
set Search_Date_="";set SearchbyName_Value=""; 

if Client_Accounts_Name_!='' then
SET SearchbyName_Value =   Concat( SearchbyName_Value ," and Client_Accounts.Client_Accounts_Name like '%",Client_Accounts_Name_ ,"%'") ;
end if;

if Account_Group_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and Client_Accounts.Account_Group_Id =",Account_Group_);
end if;


SET @query = Concat("select * from (SELECT 
Client_Accounts.Client_Accounts_Id,Client_Accounts.Client_Accounts_Code,
Client_Accounts.Client_Accounts_Name,Client_Accounts.Client_Accounts_No,Client_Accounts.Address1,
Client_Accounts.Address2,Client_Accounts.Address3,Client_Accounts.Address4,
Client_Accounts.PinCode,Client_Accounts.StateCode,Client_Accounts.GSTNo,Client_Accounts.PanNo,
Client_Accounts.State,Client_Accounts.Country,Client_Accounts.Phone,
Client_Accounts.Mobile,Client_Accounts.Email,Client_Accounts.Opening_Balance,
Client_Accounts.Description1,Client_Accounts.UserId,
Client_Accounts.LedgerInclude,Client_Accounts.CanDelete,Client_Accounts.Opening_Type
,Client_Accounts.Commision,
(Date_Format(Client_Accounts.Entry_Date,'%Y-%m-%d')) As Entry_Date,
Client_Accounts.Account_Group_Id ,Group_Name Account_Group_Name,
Client_Accounts.Employee_Id,Emp.Client_Accounts_Name as Employee,
CAST(CAST(ROW_NUMBER()OVER(ORDER BY client_accounts.Client_Accounts_Name DESC )AS UNSIGNED)AS SIGNED)AS RowNo
From Client_Accounts
inner join Account_Group on Account_Group.Account_Group_Id=Client_Accounts.Account_Group_Id
inner join Client_Accounts as Emp on Client_Accounts.Employee_Id=Emp.Client_Accounts_Id
where Client_Accounts.Client_Accounts_Id>35 and  Client_Accounts.DeleteStatus=false   ",SearchbyName_Value, ")
 as lds WHERE RowNo >=",Pointer_Start_," AND RowNo<= ",Pointer_Stop_," order by  RowNo LIMIT ",Page_Length_);
 
PREPARE QUERY FROM @query;
EXECUTE QUERY;


#select @query;
End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Agent_Details`(In Agent_Name_ varchar(500))
Begin 
 set Agent_Name_ = Concat( '%',Agent_Name_ ,'%');
 SELECT Agent_Id,
Agent_Name,Phone,Email,Address,Description
From agent where Agent_Name like Agent_Name_ and DeleteStatus=false 
Order by Agent_Name asc;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_ApplicationDetails`(In Application_details_Id_ int)
Begin
declare SearchbyName_Value varchar(2000);
 set SearchbyName_Value=''; 

 if Application_details_Id_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and application_details_history.Application_details_Id =",Application_details_Id_);
end if;

SET @query = Concat("select Application_details_Id,Student_Id,Country_Name
 from application_details_history
 where application_details_history.DeleteStatus=false ",SearchbyName_Value," order by Application_details_Id desc");
  PREPARE QUERY FROM @query;
  EXECUTE QUERY;
 #select @query;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Application_report`(In Fromdate_ date,Todate_ date,Branch_ int,By_User_ int,Is_Date_Check_ Tinyint,
Login_User_Id_ int,Status_Value int,Agent_Id_ int,Application_status_Id_ int)
BEGIN
declare SearchbyName_Value varchar(2000);declare UnionQuery varchar(4000);declare Search_Date_ varchar(500);
declare Search_Date_union varchar(500);declare pos1frm int;declare pos1to int;declare pos2frm int;
declare pos2to int; declare PageSize int;declare User_Type_ int;
 set pos1frm=0;    set pos1to=0;    set pos2frm=0;    set pos2to=0;    set PageSize=10;
 set SearchbyName_Value='';
 set Search_Date_='';
 set User_Type_=(select User_Type from user_details where User_Details_Id=Login_User_Id_);

if Branch_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and user_details.Branch_Id =",Branch_);
end if;
if By_User_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and application_details_history.User_Id =",By_User_);
end if;
if Agent_Id_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and agent.Agent_Id =",Agent_Id_);
end if;
if Application_status_Id_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and application_status.Application_status_Id =",Application_status_Id_);
end if;

if Status_Value=2 then
Set SearchbyName_Value= Concat( SearchbyName_Value," and application_details_history.Activation_Status= ",1) ;
    elseif Status_Value=3 then
    Set SearchbyName_Value= Concat( SearchbyName_Value," and application_details_history.Activation_Status= ",0) ;
    end if;

if User_Type_=2 then
         SET SearchbyName_Value =concat(SearchbyName_Value," and application_details_history.User_Id =",Login_User_Id_);
else
    SET SearchbyName_Value =concat(SearchbyName_Value," and application_details_history.User_Id in (select User_Details_Id from user_details where Branch_Id in (select
        distinct Branch_Id from user_department where User_Id =",Login_User_Id_," and VIew_All=1))");
end if;
if Is_Date_Check_=true then
set Search_Date_=concat( " and date(application_details_history.Date_Of_Applying) >= '", Fromdate_ ,"' and  date(application_details_history.Date_Of_Applying) <= '", Todate_,"'");
set Search_Date_union=concat( SearchbyName_Value," and  application_details_history.Date_Of_Applying < '", Fromdate_,"'");
ELSE
set Search_Date_= "and 1 =1 ";
end if;
set UnionQuery="";
SET @query = Concat( "select student.Student_Name Student,student.Phone_Number Mobile,Branch.Branch_Name Branch,
user_details.User_Details_Name User,application_details_history.Country_Name Country,University_Name University,Course_Name Course,intake_Name Intake,Intake_Year_Name Intake_Year,application_details_history.Remark Remark,
application_status.Application_Status_Name Status,agent.Agent_Name Agent,(Date_Format(application_details_history.Date_Of_Applying,'%d-%m-%Y ')) As Applied_Date,if (application_details_history.Activation_Status>0,'Active','Deactive')  AS Activation_Status
 from student
inner join application_details_history on application_details_history.Student_Id=student.Student_Id
inner join user_details on user_details.User_Details_Id=application_details_history.User_Id
inner join Branch on Branch.Branch_Id= user_details.Branch_Id
inner join agent on agent.Agent_Id= application_details_history.Agent_Id
inner join application_status on application_status.Application_status_Id= application_details_history.Application_status_Id
where student.DeleteStatus=0 and application_details_history.SlNo=1  ",SearchbyName_Value," ",Search_Date_,"
 order by User_Details_Id ");

PREPARE QUERY FROM @query;
#select @query;

EXECUTE QUERY;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Branch`( In Branch_Name_ varchar(100))
Begin 
 set Branch_Name_ = Concat( '%',Branch_Name_ ,'%');
 SELECT Branch_Id,
Branch_Name,
Address,
Location,
District,
State,
Country,
PinCode,
Branch.Phone_Number,
Branch.Email,
Branch_Code
 From Branch 
 where Branch_Name like Branch_Name_ and Branch.Is_Delete=false 
 Order by Branch_Name asc;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Branchwise_Summary`(In Fromdate_ date,Todate_ date,RoleId_ varchar(100),Department_String varchar(1000),Search_By_ int,
SearchbyName_ varchar(50),Department_ int,Branch_ int,By_User_ int,Is_Date_Check_ Tinyint,
Page_Index1_ int,Page_Index2_ int,Login_User_Id_ int,RowCount int ,RowCount2 int)
BEGIN
declare SearchbyName_Value varchar(2000);declare UnionQuery varchar(4000);declare Search_Date_ varchar(500);
declare Search_Date_union varchar(500);declare pos1frm int;declare pos1to int;declare pos2frm int;
declare pos2to int; declare PageSize int;
 set pos1frm=0;    set pos1to=0;    set pos2frm=0;    set pos2to=0;    set PageSize=10;
 set SearchbyName_Value='';
 set Search_Date_='';


set Search_Date_=concat( " and date(fees_receipt.Entry_Date) >= '", Fromdate_ ,"' and  date(fees_receipt.Entry_Date) <= '", Todate_,"'");


SET @query = Concat( "select sum(fees_receipt.Amount) Branch_Total , Branch_Name from 
student
inner join fees_receipt on student.Student_Id=fees_receipt.Student_Id
inner join Branch on Branch.Branch_Id= student.Branch
where fees_receipt.Delete_Status=0",Search_Date_," 
group by student.Branch ");
PREPARE QUERY FROM @query;
#select @query;

EXECUTE QUERY;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Branch_Department_Typeahead`(In Branch_Id_ int,
Department_Name_ Varchar(100))
BEGIN
 set Department_Name_ = Concat( '%',Department_Name_ ,'%');
SELECT
Department.Department_Id,
Department_Name,Department.FollowUp Department_FollowUp
from Department 
inner join Branch_Department on Department.Department_Id=Branch_Department.Department_Id and 
Branch_department.Branch_Id=Branch_Id_
where Department_Name like Department_Name_ 
and Department.Is_Delete=false 
 ORDER BY Department_Order Asc ;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Branch_Typeahead`( In Branch_Name_ varchar(100))
Begin 
 set Branch_Name_ = Concat( '%',Branch_Name_ ,'%');
 SELECT 
 Branch_Id,
Branch_Name,
Address,
Location,
District,
State,
Country,
PinCode,
Phone_Number,
Email,
Branch_Code From Branch where Branch_Name like Branch_Name_ and Is_Delete=false 
 ORDER BY Branch_Name Asc LIMIT 5;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Branch_User_Typeahead`(In Branch_Id_ int,
User_Details_Name_ varchar(100))
BEGIN 
 set User_Details_Name_ = Concat( '%',User_Details_Name_ ,'%');

SELECT
user_details.User_Details_Id,
User_Details_Name
from user_details 
inner join branch on user_details.Branch_Id=branch.Branch_Id 
and branch.Branch_Id=Branch_Id_
where User_Details_Name like User_Details_Name_ and user_details.DeleteStatus=false 
ORDER BY User_Details_Name Asc ;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Check_List`( In Check_List_Name_ varchar(100))
Begin 
 set Check_List_Name_ = Concat( '%',Check_List_Name_ ,'%');
 SELECT Check_List_Id,
Check_List_Name
From check_list where Check_List_Name like Check_List_Name_ and DeleteStatus=false 
Order by Check_List_Name asc;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Client_Accounts`( In Client_Accounts_Name_ varchar(100),Account_Group_ int,Pointer_Start_ Varchar(10), 
Pointer_Stop_ Varchar(10), Page_Length_ Varchar(10))
Begin 
declare Search_Date_ varchar(500);declare SearchbyName_Value varchar(2000);
set Search_Date_="";set SearchbyName_Value=""; 
/*
if Client_Accounts_Name_ !='' then
	set SearchbyName_Value = concat( "'%",Client_Accounts_Name_ ,"%'");
	SET SearchbyName_Value =concat(" and Client_Accounts.Client_Accounts_Name like " ,Client_Accounts_Name_);
end if;
*/

if Client_Accounts_Name_!='' then
SET SearchbyName_Value =   Concat( SearchbyName_Value ," and Client_Accounts.Client_Accounts_Name like '%",Client_Accounts_Name_ ,"%'") ;
end if;

if Account_Group_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and Client_Accounts.Account_Group_Id =",Account_Group_);
end if;


SET @query = Concat("select * from (SELECT 
Client_Accounts.Client_Accounts_Id,Client_Accounts.Client_Accounts_Code,
Client_Accounts.Client_Accounts_Name,Client_Accounts.Client_Accounts_No,Client_Accounts.Address1,
Client_Accounts.Address2,Client_Accounts.Address3,Client_Accounts.Address4,
Client_Accounts.PinCode,Client_Accounts.StateCode,Client_Accounts.GSTNo,Client_Accounts.PanNo,
Client_Accounts.State,Client_Accounts.Country,Client_Accounts.Phone,
Client_Accounts.Mobile,Client_Accounts.Email,Client_Accounts.Opening_Balance,
Client_Accounts.Description1,Client_Accounts.UserId,
Client_Accounts.LedgerInclude,Client_Accounts.CanDelete,Client_Accounts.Opening_Type
,Client_Accounts.Commision,
(Date_Format(Client_Accounts.Entry_Date,'%Y-%m-%d')) As Entry_Date,
Client_Accounts.Account_Group_Id ,Group_Name Account_Group_Name,
Client_Accounts.Employee_Id,Emp.Client_Accounts_Name as Employee,
CAST(CAST(ROW_NUMBER()OVER(ORDER BY client_accounts.Client_Accounts_Name DESC )AS UNSIGNED)AS SIGNED)AS RowNo
From Client_Accounts
inner join Account_Group on Account_Group.Account_Group_Id=Client_Accounts.Account_Group_Id
inner join Client_Accounts as Emp on Client_Accounts.Employee_Id=Emp.Client_Accounts_Id
where Client_Accounts.Client_Accounts_Id>35 and  Client_Accounts.DeleteStatus=false   ",SearchbyName_Value, ")
 as lds WHERE RowNo >=",Pointer_Start_," AND RowNo<= ",Pointer_Stop_," order by  RowNo LIMIT ",Page_Length_);
 
PREPARE QUERY FROM @query;
EXECUTE QUERY;


#select @query;
End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Counselor_Fees_Receipt_Report`(In Fromdate_ date,Todate_ date,Search_By_ int,
SearchbyName_ varchar(50),Department_ int,Branch_ int,By_User_ int,Is_Date_Check_ Tinyint,
Page_Index1_ int,Page_Index2_ int,Login_User_Id_ int,RowCount int ,RowCount2 int,Fees_Id int)
BEGIN
declare SearchbyName_Value varchar(2000);declare UnionQuery varchar(4000);declare Search_Date_ varchar(500);
declare Search_Date_union varchar(500);declare pos1frm int;declare pos1to int;declare pos2frm int;
declare pos2to int; declare PageSize int;
 set pos1frm=0;    set pos1to=0;    set pos2frm=0;    set pos2to=0;    set PageSize=10;
 set SearchbyName_Value='';
 set Search_Date_='';

if(SearchbyName_ !='0') then
	if Search_By_=1 then
	SET SearchbyName_Value =   Concat( " and student.Student_Name like '%",SearchbyName_ ,"%'") ;
	end if;
end if;
if Department_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.Department =",Department_);
end if;
if Branch_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.Branch =",Branch_);
end if;
if Login_User_Id_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and fees_receipt.User_Id =",Login_User_Id_);
end if;
if Fees_Id>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and fees_receipt.Fees_Id =",Fees_Id);
end if;
if Is_Date_Check_=true then
set Search_Date_=concat( " and date(Fees_Receipt.Entry_Date) >= '", Fromdate_ ,"' and  date(Fees_Receipt.Entry_Date) <= '", Todate_,"'");

ELSE
set Search_Date_= "and 1 =1 ";
end if;
set UnionQuery="";
SET @query = Concat( "select student.Student_Id,
student.Student_Name,(Date_Format(student.Registered_On,'%d-%m-%Y-%h:%i')) As Registered_On ,
    (Date_Format(Fees_Receipt.Entry_Date,'%d-%m-%Y')) As Entry_Date,  (Date_Format(student.Next_FollowUp_Date,'%d-%m-%Y')) As Next_FollowUp_Date,
Department.Department_Name,Department.FollowUp,Department_Status.Department_Status_Name,T.User_Details_Name,
B.User_Details_Name Registered_By_Name,Branch.Branch_Name,Is_Registered,user_details.User_Details_Name As Created_By_Name,
    F_user.User_Details_Name As Fees_Collected_By,Fees_Receipt.Amount,Fees_Receipt.Description,Fees.Fees_Name 
from student
inner join user_details on user_details.User_Details_Id=student.Created_By
inner join Department on Department.Department_Id= student.Department  
inner join Branch on Branch.Branch_Id= student.Branch
inner join Department_Status on Department_Status.Department_Status_Id=student.Status
inner join user_details as T on T.User_Details_Id=student.User_Id
left join user_details as B on B.User_Details_Id=student.Registered_By
inner join Fees_Receipt on Fees_Receipt.Student_Id=student.Student_Id
inner join user_details as F_user on F_user.User_Details_Id=Fees_Receipt.User_Id
inner join Fees on Fees.Fees_Id=Fees_Receipt.Fees_Id 
where student.DeleteStatus=0    and student.DeleteStatus=0  ",SearchbyName_Value," ",Search_Date_,"
order by Fees_Receipt.Entry_Date ");

PREPARE QUERY FROM @query;
#select @query;


EXECUTE QUERY;


END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Counselor_Registration_Report`(In Fromdate_ date,Todate_ date,Search_By_ int,
SearchbyName_ varchar(50),Department_ int,Branch_ int,By_User_ int,Is_Date_Check_ Tinyint,
Page_Index1_ int,Page_Index2_ int,Login_User_Id_ int,RowCount int ,RowCount2 int)
BEGIN

declare SearchbyName_Value varchar(2000);declare UnionQuery varchar(4000);declare Search_Date_ varchar(500);
declare Search_Date_union varchar(500);declare pos1frm int;declare pos1to int;declare pos2frm int;
declare pos2to int; declare PageSize int;
 set pos1frm=0;    set pos1to=0;    set pos2frm=0;    set pos2to=0;    set PageSize=10;
 set SearchbyName_Value='';
 set Search_Date_='';
if(SearchbyName_ !='0') then
if Search_By_=1 then
SET SearchbyName_Value =   Concat( " and student.Student_Name like '%",SearchbyName_ , "%' " ) ;
end if;
end if;
if Department_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.Department =",Department_);
end if;
if Branch_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.Branch =",Branch_);
end if;
if Login_User_Id_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.Registered_By =",Login_User_Id_);
end if;
if Is_Date_Check_=true then
set Search_Date_=concat( " and date(student.Registered_On) >= '", Fromdate_ ,"' and  date(student.Registered_On) <= '", Todate_,"'");
ELSE
set Search_Date_= "and 1 =1 ";
end if;
set UnionQuery=""; 

SET @query = Concat( "select student.Student_Id,
student.Student_Name,student.Phone_Number,student.Remark,(Date_Format(student.Registered_On,'%d-%m-%Y-%h:%i')) As Registered_On ,
    (Date_Format(student.Entry_Date,'%d-%m-%Y')) As Entry_Date,  (Date_Format(student.Next_FollowUp_Date,'%d-%m-%Y')) As Next_FollowUp_Date,
Department.Department_Name,Department.FollowUp,Department_Status.Department_Status_Name,T.User_Details_Name,
B.User_Details_Name Registered_By_Name,
Branch.Branch_Name,Is_Registered,user_details.User_Details_Name As Created_By_Name
from student
inner join Department on Department.Department_Id= student.Department  
inner join user_details on user_details.User_Details_Id=student.Created_By
inner join Branch on Branch.Branch_Id= student.Branch
inner join Department_Status on Department_Status.Department_Status_Id=student.Status
inner join user_details as T on T.User_Details_Id=student.User_Id
inner join user_details as B on B.User_Details_Id=student.Registered_By
where student.DeleteStatus=0    and student.Is_Registered=1  ",SearchbyName_Value," ",Search_Date_,"
order by student.Registered_On");

PREPARE QUERY FROM @query;
#select @query;

EXECUTE QUERY;

select 1;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Country`( In Country_Name_ varchar(100))
Begin 
 set Country_Name_ = Concat( '%',Country_Name_ ,'%');
 SELECT Country_Id,
Country_Name From Country where Country_Name like Country_Name_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Country_Typeahead`( In Country_Name_ varchar(100))
Begin
 set Country_Name_ = Concat( '%',Country_Name_ ,'%');
select  Country.Country_Id,Country_Name
From Country
where Country.DeleteStatus=false
order by Country_Name asc ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Course`(In Course_Name_ varchar(100),Level_Id_ int,Country_Id_ int,Internship_Id_ int,
Duration_Id_ int,University_Id_ int,Subject_Id_ int ,Sub_Section_Id_ int, Pointer_Start_ int , Pointer_Stop_ int,Page_Length_ int)
Begin 
declare SearchbyName_Value varchar(2000);
set SearchbyName_Value='';
if Course_Name_!='' then
	SET SearchbyName_Value =concat( SearchbyName_Value ," and Course.Course_Name like '%",Course_Name_ ,"%'") ;
end if;
if Level_Id_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and level_detail.Level_Detail_Id =",Level_Id_);
end if;
if Country_Id_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and Course.Country_Id =",Country_Id_);
end if;
if Internship_Id_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and Internship.Internship_Id =",Internship_Id_);
end if;
if Duration_Id_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and Course.Duration_Id =",Duration_Id_);
end if;
if University_Id_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and Course.University_Id =",University_Id_);
end if;
if Subject_Id_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and Course.Subject_Id =",Subject_Id_);
end if;

if Sub_Section_Id_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and Course.Sub_Section_Id =",Sub_Section_Id_);
end if;

SET @query = Concat("select * from ( select * from (
SELECT 1 tp, Course_Id,Course_Name,Course_Code,Country_Name,University_Name,Duration_Name,Level_Detail_Name,Subject_Name,Sub_Section_Name,Internship_Name,course.Internship_Id,
 course.Country_Id,course.Subject_Id,course.Sub_Section_Id,course.University_Id,
 CAST(CAST(ROW_NUMBER()OVER(ORDER BY Course.Course_Name DESC )AS UNSIGNED)AS SIGNED)AS RowNo
 
 From Course 
 inner join country on course.Country_Id = country.Country_Id 
 inner join duration on  course.Duration_Id= duration.Duration_Id
 inner join  level_detail on course.Level_Id=level_detail.Level_Detail_Id
 inner join subject on course.Subject_Id=subject.Subject_Id
inner join Sub_Section on course.Sub_Section_Id=Sub_Section.Sub_Section_Id
inner join  internship on course.Internship_Id=internship.Internship_Id
inner join university  on course.University_Id = university.University_Id 
where Course.DeleteStatus = false  " ,SearchbyName_Value," order by Course.Course_Name desc )
 as lds WHERE RowNo >=",Pointer_Start_," AND RowNo<= ",Pointer_Stop_,"
 order by  RowNo LIMIT ",Page_Length_ ," ) as t union 
 SELECT 0 tp, count(Course_Id)as Course_Id ,''Course_Name,''Course_Code,''Country_Name,''University_Name,''Duration_Name,''Level_Detail_Name,
 ''Subject_Name,''Sub_Section_Name,''Internship_Name,0 Internship_Id,
 '0' Country_Id,0 Subject_Id,0 Sub_Section_Id,0 University_Id,
 0 RowNo From Course 
 inner join country on course.Country_Id = country.Country_Id 
 inner join duration on  course.Duration_Id= duration.Duration_Id
 inner join  level_detail on course.Level_Id=level_detail.Level_Detail_Id
 inner join subject on course.Subject_Id=subject.Subject_Id
inner join Sub_Section on course.Sub_Section_Id=Sub_Section.Sub_Section_Id
inner join  internship on course.Internship_Id=internship.Internship_Id
inner join university  on course.University_Id = university.University_Id 
where Course.DeleteStatus = false  " ,SearchbyName_Value, " order by tp desc");
PREPARE QUERY FROM @query;


EXECUTE QUERY;
#
#
#select @query;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Courses_Typeahead`( In Course_Name_ varchar(500))
Begin
 set Course_Name_ = Concat( '%',Course_Name_ ,'%');
select  course.Course_Id,Course_Name
From course
where  course.DeleteStatus=false
order by Course_Name;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Course_Import`(In From_Date_ datetime,To_Date_ datetime,Is_Date_Check_ Tinyint)
Begin 
declare Search_Date_ varchar(500);declare SearchbyName_Value varchar(2000);
Declare Import_Master_Id_ int;
set Search_Date_="";set SearchbyName_Value=""; 
if Is_Date_Check_=true then
	set Search_Date_=concat(" and date(import_master.Entry_Date) >= '", From_Date_ ,"' and  date(import_master.Entry_Date) <= '", To_Date_,"'");
end if;

SET @query = Concat("SELECT Import_Master_Id,(Date_Format(Entry_Date,'%Y-%m-%d')) Entry_Date
 From import_master  order by import_master.Entry_Date desc ");
PREPARE QUERY FROM @query;EXECUTE QUERY;
#insert into db_logs values(1,@query,1,1);
#select @query;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Course_Intake`( In Course_Intake_Name_ varchar(100))
Begin 
 set Course_Intake_Name_ = Concat( '%',Course_Intake_Name_ ,'%');
 SELECT Course_Id,
Intake_Id From Course_Intake where Course_Intake_Name like Course_Intake_Name_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Course_Typeahead`(In Country_Id_ int,Subject_Id_ varchar(100),Level_Id_ int,
Course_Name_ varchar(100),Duration_Id_ varchar(100),Ielts_Minimum_Score_ int,Intake_Id_ int,Internship_Id_ int)
Begin 
declare SearchbyName_Value varchar(2000);
set SearchbyName_Value=""; 

if Course_Name_!='' then
SET SearchbyName_Value =   Concat( SearchbyName_Value ," and course.Course_Name like '%",Course_Name_ ,"%'") ;
end if;
if Duration_Id_!='' then
SET SearchbyName_Value =   Concat( SearchbyName_Value ," and course.Duration_Id in (",Duration_Id_ ,")") ;
end if;
if Subject_Id_!='' then
SET SearchbyName_Value =   Concat( SearchbyName_Value ," and course.Subject_Id in (",Subject_Id_ ,")") ;
end if;
if Country_Id_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and course.Country_Id =",Country_Id_);
end if;
if Intake_Id_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and course_intake.Intake_Id =",Intake_Id_);
end if;

if Level_Id_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and course.Level_Id =",Level_Id_);
end if;
if Ielts_Minimum_Score_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and course.Ielts_Minimum_Score =",Ielts_Minimum_Score_);
end if;
if Internship_Id_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and course.Internship_Id =",Internship_Id_);
end if;


SET @query = Concat("SELECT Course_Id,Course_Name,country.Country_Id,University_Name
From course 
 inner join country  on course.Country_Id = country.Country_Id
 inner join university on course.University_Id = university.University_Id 
 
 where course.DeleteStatus = false and country.DeleteStatus = false ",SearchbyName_Value," order by course.Course_Name asc ");
PREPARE QUERY FROM @query;EXECUTE QUERY;
#insert into db_logs values(1,@query,1,1);
#select @query;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Department`( In Department_Name_ varchar(100))
Begin 
 set Department_Name_ = Concat( '%',Department_Name_ ,'%');
 SELECT Department_Id,
Department_Name,
FollowUp,
Status,
Department_Order,
Color From Department where Department_Name like Department_Name_ and Is_Delete=false 
Order by Department_Name asc;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Department_Status`( In Department_Status_Name_ varchar(100))
Begin 
 set Department_Status_Name_ = Concat( '%',Department_Status_Name_ ,'%');
 SELECT Department_Status_Id,
Department_Status_Name,
Status_Order,
Editable,
Color From Department_Status where Department_Status_Name like Department_Status_Name_
 and Is_Delete=false 
Order by Department_Status_Name asc;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Department_Status_Typeahead`(In Department_Id_ int,

Department_Status_Name_ varchar(100))
BEGIN

 set Department_Status_Name_ = Concat( '%',Department_Status_Name_ ,'%');
select
 Department_Status_Name,Department_Status_Id 
 from Department_Status
 inner join Status_Selection
 on Department_Status.Department_Status_Id=Status_Selection.Status_Id
 and Status_Selection.Department_Id=Department_Id_
 where Department_Status_Name like Department_Status_Name_ 
 and Department_Status.Is_Delete=false
 ORDER BY Department_Status_Name Asc 
 ;
 
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Department_User_Typeahead`(IN Branch_Id_ int,
Department_Id_ int,Users_Name_ varchar(100))
BEGIN
set Users_Name_ = Concat( '%',Users_Name_ ,'%');
select
 distinct user_details.User_Details_Id,User_Details_Name
from user_details
 inner join User_Department on user_details.User_Details_Id=User_Department.User_Id  and user_details.Branch_Id=Branch_Id_
 and User_Department.Department_Id=Department_Id_ and user_department.Branch_Id=Branch_Id_
where User_Details_Name like Users_Name_  and user_details.DeleteStatus=false and user_details.Working_Status=1
 ORDER BY User_Details_Name Asc ;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Document`( In Document_Name_ varchar(100))
Begin 
 set Document_Name_ = Concat( '%',Document_Name_ ,'%');
 SELECT Document_Id,
Document_Name From Document where Document_Name like Document_Name_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Documentation_Report`(In Phone_Number_ varchar(25),User_id_ int)
BEGIN
declare SearchbyNumber_Value varchar(500);
declare Alternative_Phone_ varchar(25);
 set SearchbyNumber_Value = replace(replace(SearchbyNumber_Value,'+',''),' ','');
SET SearchbyNumber_Value = Concat(" and replace(replace(student.Phone_Number,'+',''),' ','') like '%",Phone_Number_,"%'
     or  replace(replace(student.Whatsapp,'+',''),' ','')  like '%",Phone_Number_,"%' or replace(replace(student.Alternative_Phone_Number,'+',''),' ','') like '%",Phone_Number_,"%' ") ;
SET @query = Concat( "select student.Student_Id,
student.Student_Name,student.Phone_Number,student.Alternative_Phone_Number,student.Remark,(Date_Format(student.Registered_On,'%d-%m-%Y-%h:%i')) As Registered_On ,
    (Date_Format(student.Entry_Date,'%d-%m-%Y')) As Entry_Date,  (Date_Format(student.Next_FollowUp_Date,'%d-%m-%Y')) As Next_FollowUp_Date,
Department.Department_Name,Department.FollowUp,Department_Status.Department_Status_Name,T.User_Details_Name,
B.User_Details_Name Registered_By_Name,
Branch.Branch_Name,Is_Registered,user_details.User_Details_Name As Created_By_Name,Whatsapp
from student
inner join Department on Department.Department_Id= student.Department  
inner join user_details on user_details.User_Details_Id=student.Created_By
inner join Branch on Branch.Branch_Id= student.Branch
inner join Department_Status on Department_Status.Department_Status_Id=student.Status
inner join user_details as T on T.User_Details_Id=student.User_Id
inner join user_details as B on B.User_Details_Id=student.Created_By
where student.DeleteStatus=0 and student.student_id in (select distinct Student_Id from student_followup where By_User_Id=" , User_id_ ,")",SearchbyNumber_Value," 
order by student.Phone_Number");
PREPARE QUERY FROM @query;
#select @query;

EXECUTE QUERY;
select 1;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Duration`( In Duration_Name_ varchar(100))
Begin 
 set Duration_Name_ = Concat( '%',Duration_Name_ ,'%');
 SELECT Duration_Id,
Duration_Name From Duration where Duration_Name like Duration_Name_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Efficiency_Count_Report`(In Fromdate_ date,Todate_ date,Branch_ int,
By_User_ int)
BEGIN
declare SearchbyName_Value varchar(2000);declare UnionQuery varchar(4000);declare Search_Date_ varchar(500);
declare Search_Date_union varchar(500);declare pos1frm int;declare pos1to int;declare pos2frm int;
declare pos2to int; declare PageSize int;
 set pos1frm=0;    set pos1to=0;    set pos2frm=0;    set pos2to=0;    set PageSize=10;
 set SearchbyName_Value='';
 set Search_Date_='';
if Branch_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and student.Branch =",Branch_);
end if;

	set Search_Date_=concat( SearchbyName_Value," and student.Next_FollowUp_Date >= '", Fromdate_ ,"' and  student.Next_FollowUp_Date <= '", Todate_,"'");
	set Search_Date_union=concat( SearchbyName_Value," and  student.Entry_Date < '", Fromdate_,"'");
    
SET @query = Concat("select count(student_followup.Student_Id) Count,Date_Format(Entry_Date,'%H') Entry_Date
from student_followup 
	inner join user_details as B on B.User_Details_Id=student_followup.By_User_Id 
    inner join Branch on Branch.Branch_Id= Student_followup.Branch
    and date(student_followup.Entry_Date )
    and B.User_Details_Id= '", By_User_,"'
    and Branch.Branch_Id= '", Branch_,"'
    group by FollowUp_Difference,By_User_Id
    "
    );	 
PREPARE QUERY FROM @query;
#select @query;

EXECUTE QUERY;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Employee_Summary`(In RoleId_ varchar(100)
,Department_String varchar(1000),Fromdate_ date,
 Todate_ date,Login_User_Id_ int,
 Is_Date_Check_ tinyint,Branch_ int 
 )
BEGIN
#select 1;
declare Search_Date_ varchar(500);declare SearchbyName_Value varchar(2000);declare User_Type_ int;
set Search_Date_=''; set SearchbyName_Value='';
set User_Type_=(select User_Type from user_details where User_Details_Id=Login_User_Id_);
if Is_Date_Check_=true then
set Search_Date_=concat( SearchbyName_Value," and date(student.Entry_Date) >= '", Fromdate_ ,"' and  date(student.Entry_Date) <= '", Todate_,"'");
ELSE
set Search_Date_= "and 1 =1 ";
end if;
 if Branch_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and student.Branch =",Branch_);
end if;
if User_Type_=2 then
 	SET SearchbyName_Value =concat(SearchbyName_Value," and student.User_Id =",Login_User_Id_);
    else
    SET SearchbyName_Value =concat(SearchbyName_Value," and student.User_Id in (select User_Details_Id from user_details where Branch_Id in (select
distinct Branch_Id from user_department where User_Id =",Login_User_Id_," and VIew_All=1))");
end if;
SET @query =concat ( "select Branch_Name Branch,User_Details_Name Assigned_To,sum(Data_Count) as No_of_Students,sum(Registration_Count) as Registration_Count ,
sum(Total) as Receipt_Amount
from (
 select User_Details_Name,count(student.Student_Id) as Data_Count,
sum(student.Is_Registered) as Registration_Count, 0 as Total,Branch_Name
from  student 
	where student.DeleteStatus=0    ",Search_Date_,SearchbyName_Value,"  ",Department_String,"
	group by student.User_Id,Branch
  union
select User_Details_Name,0 as Data_Count,
0 as Registration_Count, sum(fees_receipt.Amount) as Total,Branch_Name
from student 
	left join fees_receipt on fees_receipt.Student_Id=student.Student_Id
	where student.DeleteStatus=0   ",Search_Date_,SearchbyName_Value," ",Department_String,"
	group by student.User_Id,Branch) as ld
   group by User_Details_Name,Branch_Name 
order by User_Details_Name,Branch_Name ");
PREPARE QUERY FROM @query;
#select @query;

EXECUTE QUERY;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Enquiry_Conversion`(In RoleId_ varchar(100),Department_String varchar(1000),Fromdate_ date, Todate_ date,Login_User_Id_ int,Is_Date_Check_ tinyint,Branch_ int)
BEGIN
declare Search_Date_ varchar(500);declare SearchbyName_Value varchar(2000);declare User_Type_ int;

set Search_Date_=''; set SearchbyName_Value='';
set User_Type_=(select User_Type from user_details where User_Details_Id=Login_User_Id_);

if Is_Date_Check_=true then
set Search_Date_=concat(SearchbyName_Value, " and date(student.Entry_Date) >= '", Fromdate_ ,"' and  date(student.Entry_Date) <= '", Todate_,"'");
ELSE
set Search_Date_= "and 1 =1 ";
end if;
 if Branch_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and student.Branch =",Branch_);
end if;
if User_Type_=2 then
 	SET SearchbyName_Value =concat(SearchbyName_Value," and student.Created_By =",Login_User_Id_);
    else
    SET SearchbyName_Value =concat(SearchbyName_Value," and student.Created_By in (select User_Details_Id from user_details where Branch_Id in (select
distinct Branch_Id from user_department where User_Id =",Login_User_Id_," and VIew_All=1))");
end if;
SET @query = Concat( " select Branch_Name as Branch,Enquiry_Source_Name as Enquiry_Source, sum(Data_Count) as No_of_Students,
sum(Registration_Count) as Registration,sum(Total) as ReceivedAmount
from (
select Enquiry_Source_Name,count(student.Student_Id) as Data_Count,
sum(student.Is_Registered) as Registration_Count, 0 as Total,Branch_Name
from student 
	where student.DeleteStatus=0   ",Search_Date_,"",SearchbyName_Value,"
	group by Enquiry_Source_Id,Branch
   union
select Enquiry_Source_Name,0 as Data_Count,
0 as Registration_Count, sum(fees_receipt.Amount) as Total,Branch_Name
from student 
left join fees_receipt on fees_receipt.Student_Id=student.Student_Id 
	where student.DeleteStatus=0   ",Search_Date_,"",SearchbyName_Value," ",Department_String,"
	group by Enquiry_Source_Id,Branch) as ld
   group by Enquiry_Source_Name,Branch_Name 
order by Enquiry_Source_Name,Branch_Name");
PREPARE QUERY FROM @query;

EXECUTE QUERY;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Enquiry_Source`( In Enquiry_Source_Name_ varchar(45))
Begin 
 set Enquiry_Source_Name_ = Concat( '%',Enquiry_Source_Name_ ,'%');
 SELECT Enquiry_Source_Id,
Enquiry_Source_Name From Enquiry_Source where Enquiry_Source_Name like Enquiry_Source_Name_ 
and DeleteStatus=false 
order by  Enquiry_Source_Name asc;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Enquiry_Source_Report`(In Search_Fromdate_ date,Todate_ date,Is_Date_Check_ tinyint,Branch_ int)
BEGIN
declare SearchbyName_Value varchar(2000);declare UnionQuery varchar(4000);declare Search_Date_ varchar(500);
declare Search_Date_union varchar(500);declare pos1frm int;declare pos1to int;declare pos2frm int;
declare pos2to int; declare PageSize int;
 set pos1frm=0;    set pos1to=0;    set pos2frm=0;    set pos2to=0;    set PageSize=10;
 set SearchbyName_Value='';
 set Search_Date_='';

if Branch_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.Branch =",Branch_);
end if;

if Is_Date_Check_=true then
set Search_Date_=concat( SearchbyName_Value," and date(student.Entry_Date) >= '", Search_Fromdate_,"' and  date(student.Entry_Date) <= '", Todate_,"'");
ELSE
set Search_Date_= "and 1 =1 ";
end if;

SET @query = Concat( " select count(student.Student_Id) Enquiry_Source_Count,Enquiry_Source_Name,Branch_Name
from student 
	inner join enquiry_source on enquiry_source.Enquiry_Source_Id= student.Enquiry_Source_Id
    inner join Branch on Branch.Branch_Id= student.Branch
	where student.DeleteStatus=0   ",Search_Date_,"",SearchbyName_Value,"
	 group by student.Branch ");
	 
PREPARE QUERY FROM @query;
#select @query;


EXECUTE QUERY;


END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Enquiry_Source_Summary_Track`(In RoleId_ varchar(100),Department_String varchar(1000),Fromdate_ date, Todate_ date,Login_User_Id_ int,Is_Date_Check_ tinyint,Branch_ int)
BEGIN
declare Search_Date_ varchar(500);declare SearchbyName_Value varchar(2000);declare User_Type_ int;
set Search_Date_=''; set SearchbyName_Value='';
set User_Type_=(select User_Type from user_details where User_Details_Id=Login_User_Id_);
if Is_Date_Check_=true then
set Search_Date_=concat( SearchbyName_Value," and date(student.Entry_Date) >= '", Fromdate_ ,"' and  date(student.Entry_Date) <= '", Todate_,"'");
ELSE
set Search_Date_= "and 1 =1 ";
end if;
if Branch_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and user_details.Branch_Id =",Branch_);
end if;
if User_Type_=2 then
 	SET SearchbyName_Value =concat(SearchbyName_Value," and student.Created_By =",Login_User_Id_);
    else
    SET SearchbyName_Value =concat(SearchbyName_Value," and student.Created_By in (select User_Details_Id from user_details where Branch_Id in (select
distinct Branch_Id from user_department where User_Id =",Login_User_Id_," and VIew_All=1))");
end if;
SET @query = Concat( " select Branch_Name Branch, Enquiry_Source_Name Enquiry_Source,count(student.Student_Id) as No_of_Students from
		student 
		where student.DeleteStatus=0   ", Search_Date_ ,"",SearchbyName_Value,"
		and student.Role_Id in(",RoleId_,") 
		group by Enquiry_Source_Id
		order by Branch,User_Id
    ");
PREPARE QUERY FROM @query;
#select @query;

EXECUTE QUERY;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Fees`( In Fees_Name_ varchar(45))
Begin 
 set Fees_Name_ = Concat( '%',Fees_Name_ ,'%');
 SELECT Fees_Id,
Fees_Name From fees where Fees_Name like Fees_Name_ and DeleteStatus=false order by Fees_Name asc;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Fees_Data`( In Fees_Name_ varchar(45))
Begin 
 set Fees_Name_ = Concat( '%',Fees_Name_ ,'%');
 SELECT Fees_Id,
Fees_Name From fees where Fees_Name like Fees_Name_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Fees_Receipt_Report`(In Fromdate_ date,Todate_ date,RoleId_ varchar(100),Department_String varchar(1000),Search_By_ int,
SearchbyName_ varchar(50),Department_ int,Branch_ int,By_User_ int,Is_Date_Check_ Tinyint,
Page_Index1_ int,Page_Index2_ int,Login_User_Id_ int,RowCount int ,RowCount2 int,Fees_Id int)
BEGIN
declare SearchbyName_Value varchar(2000);declare UnionQuery varchar(4000);declare Search_Date_ varchar(500);
declare Search_Date_union varchar(500);declare pos1frm int;declare pos1to int;declare pos2frm int;
declare pos2to int; declare PageSize int;declare User_Type_ int;
 set pos1frm=0;    set pos1to=0;    set pos2frm=0;    set pos2to=0;    set PageSize=10;
 set SearchbyName_Value='';
 set Search_Date_='';
 set User_Type_=(select User_Type from user_details where User_Details_Id=Login_User_Id_);

if(SearchbyName_ !='0') then
if Search_By_=1 then
SET SearchbyName_Value =   Concat( SearchbyName_Value," and student.Student_Name like '%",SearchbyName_ ,"%'") ;
end if;
end if;
if Department_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.Department =",Department_);
end if;
if Branch_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and  fees_receipt.Fee_Receipt_Branch =",Branch_);
end if;
if User_Type_=2 then
 	SET SearchbyName_Value =concat(SearchbyName_Value," and fees_receipt.User_Id =",Login_User_Id_);
    else
    SET SearchbyName_Value =concat(SearchbyName_Value," and fees_receipt.User_Id in (select User_Details_Id from user_details where Branch_Id in (select
distinct Branch_Id from user_department where User_Id =",Login_User_Id_," and VIew_All=1))");
end if;
if By_User_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and Fees_Receipt.User_Id =",By_User_);
end if;
if Fees_Id>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and fees_receipt.Fees_Id =",Fees_Id);
end if;
if Is_Date_Check_=true then
set Search_Date_=concat(SearchbyName_Value, " and date(Fees_Receipt.Entry_Date) >= '", Fromdate_ ,"' and  date(Fees_Receipt.Entry_Date) <= '", Todate_,"'");

ELSE
set Search_Date_= "and 1 =1 ";
end if;
set UnionQuery="";
SET @query = Concat( "select student.Student_Id,
student.Student_Name,(Date_Format(student.Registered_On,'%d-%m-%Y-%h:%i')) As Registered_On ,
    (Date_Format(Fees_Receipt.Entry_Date,'%d-%m-%Y  %h:%i')) As Entry_Date,  (Date_Format(student.Next_FollowUp_Date,'%d-%m-%Y')) As Next_FollowUp_Date,
Department.Department_Name,Department.FollowUp,Department_Status.Department_Status_Name,T.User_Details_Name,
B.User_Details_Name Registered_By_Name,Branch.Branch_Name,Is_Registered,user_details.User_Details_Name As Created_By_Name,
    F_user.User_Details_Name As Fees_Collected_By,Fees_Receipt.Amount,Fees_Receipt.Description,Fees.Fees_Name ,By_User_Id,Fees_Receipt.User_Id as User_Id_
from student
inner join Department on Department.Department_Id= student.Department  ",Department_String,"
inner join user_details on user_details.User_Details_Id=student.Created_By
inner join Branch on Branch.Branch_Id= student.Branch
inner join Department_Status on Department_Status.Department_Status_Id=student.Status
inner join user_details as T on T.User_Details_Id=student.User_Id
left join user_details as B on B.User_Details_Id=student.Registered_By
inner join Fees_Receipt on Fees_Receipt.Student_Id=student.Student_Id
inner join user_details as F_user on F_user.User_Details_Id=Fees_Receipt.User_Id
inner join Fees on Fees.Fees_Id=Fees_Receipt.Fees_Id 
    where student.DeleteStatus=0 and  fees_receipt.Delete_Status=0  ",SearchbyName_Value," ",Search_Date_,"
and T.Role_Id in(",RoleId_,")
order by Fees_Receipt.Entry_Date ");
PREPARE QUERY FROM @query;
#select @query;

EXECUTE QUERY;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Intake`( In Intake_Name_ varchar(100))
Begin 
 set Intake_Name_ = Concat( '%',Intake_Name_ ,'%');
 SELECT Intake_Id,
Intake_Name From Intake where Intake_Name like Intake_Name_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Internship`( In Internship_Name_ varchar(100))
Begin 
 set Internship_Name_ = Concat( '%',Internship_Name_ ,'%');
 SELECT Internship_Id,
Internship_Name From Internship where Internship_Name like Internship_Name_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Level_Detail`( In Level_Detail_Name_ varchar(100))
Begin 
 set Level_Detail_Name_ = Concat( '%',Level_Detail_Name_ ,'%');
 SELECT Level_Detail_Id,
Level_Detail_Name From Level_Detail where Level_Detail_Name like Level_Detail_Name_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Receipt`( In Student_Id_ int)
Begin 
 SELECT Fees_Receipt_Id,
Student_Id,
(Date_Format(Entry_Date,'%Y-%m-%d')) As Entry_date,
(Date_Format(Entry_Date,'%d-%m-%Y')) As RecepitEntry_Date,
User_Details_Name,
Description,
Fees_Name,
fees_receipt.Fees_Id,
Amount,
(Date_Format(Actual_Entry_Date,'%d-%m-%Y %h:%i')) As Actual_Entry_Date,Voucher_No
 From fees_receipt 
 inner join fees on fees_receipt.Fees_Id= fees.Fees_Id  
inner join user_details on fees_receipt.User_Id=user_details.User_Details_Id 
where  Student_Id=Student_Id_ and Delete_Status=false
 order by Fees_Receipt_Id asc ;
 select Fees_Id,Fees_Name from fees where DeleteStatus=false order by Fees_Name asc;
 
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Registration_Report`(In Fromdate_ date,Todate_ date,RoleId_ varchar(100),Department_String varchar(1000),Search_By_ int,
SearchbyName_ varchar(50),Department_ int,Branch_ int,By_User_ int,Is_Date_Check_ Tinyint,
Page_Index1_ int,Page_Index2_ int,Login_User_Id_ int,RowCount int ,RowCount2 int)
BEGIN
declare SearchbyName_Value varchar(2000);declare UnionQuery varchar(4000);declare Search_Date_ varchar(500);
declare Search_Date_union varchar(500);declare pos1frm int;declare pos1to int;declare pos2frm int;
declare pos2to int; declare PageSize int;declare User_Type_ int;
 set pos1frm=0;    set pos1to=0;    set pos2frm=0;    set pos2to=0;    set PageSize=10;
 set SearchbyName_Value='';
 set Search_Date_='';
 set User_Type_=(select User_Type from user_details where User_Details_Id=Login_User_Id_);
if(SearchbyName_ !='0') then
	if Search_By_=1 then
	SET SearchbyName_Value =   Concat( SearchbyName_Value," and student.Student_Name like '%",SearchbyName_ ,"%'") ;
	end if;
end if;
if User_Type_=2 then
 	SET SearchbyName_Value =concat(SearchbyName_Value," and student.Registered_By =",Login_User_Id_);
    else
    SET SearchbyName_Value =concat(SearchbyName_Value," and student.Registered_By in (select User_Details_Id from user_details where Branch_Id in (select
distinct Branch_Id from user_department where User_Id =",Login_User_Id_," and VIew_All=1))");
end if;
if Department_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.Department =",Department_);
end if;
if Branch_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and  student.Registration_Branch =",Branch_);
end if;
if By_User_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.Registered_By =",By_User_);
end if;
if Is_Date_Check_=true then
set Search_Date_=concat( SearchbyName_Value," and date(student.Registered_On) >= '", Fromdate_ ,"' and  date(student.Registered_On) <= '", Todate_,"'");
ELSE
set Search_Date_= "and 1 =1 ";
end if;
set UnionQuery="";
SET @query = Concat( "select * from (select * from(select CAST(CAST(1 AS UNSIGNED) AS SIGNED)as tp,
(Date_Format(student.Registered_On,'%d-%m-%Y-%h:%i')) As Registered_On ,B.User_Details_Name Registered_By,student.Student_Name Student,
student.Phone_Number Mobile,D.Branch_Name Branch, (Date_Format(student.Next_FollowUp_Date,'%d-%m-%Y')) As Follow_Up_On,Department.Department_Name Department,
Department_Status.Department_Status_Name Status,T.User_Details_Name To_Staff,user_details.User_Details_Name As Created_By,
(Date_Format(student.Entry_Date,'%d-%m-%Y   %h:%i')) As Created_On,student.Remark
from student
inner join Department on Department.Department_Id= student.Department  ",Department_String,"
inner join user_details on user_details.User_Details_Id=student.Created_By

inner join Branch as D on D.Branch_Id= student.Registration_Branch
inner join Department_Status on Department_Status.Department_Status_Id=student.Status
inner join user_details as T on T.User_Details_Id=student.User_Id
inner join user_details as B on B.User_Details_Id=student.Registered_By
where student.DeleteStatus=0    and student.Is_Registered=1  ",SearchbyName_Value," ",Search_Date_,"
and T.Role_Id in(",RoleId_,"))as lds )as ldtwo
order by tp ");

PREPARE QUERY FROM @query;
#select @query;inner join Branch on Branch.Branch_Id= student.Branch


EXECUTE QUERY;


END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Remarks`( In Remarks_Name_ varchar(100))
Begin 
 set Remarks_Name_ = Concat( '%',Remarks_Name_ ,'%');
 SELECT Remarks_Id,
Remarks_Name From Remarks where Remarks_Name like Remarks_Name_ and DeleteStatus=false 
order by Remarks_Name asc;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Student`(In Fromdate_ date,Todate_ date,Search_By_ int,
SearchbyName_ varchar(50),Department_ int,Branch_ int,By_User_ int,Status_Id_ int,Is_Date_Check_ Tinyint,
Page_Index1_ int,Page_Index2_ int,Login_User_Id_ int,RowCount int ,RowCount2 int,Register_Value int)
BEGIN
declare SearchbyName_Value varchar(2000);declare UnionQuery varchar(4000);declare Search_Date_ varchar(500);
declare Search_Date_union varchar(500);declare pos1frm int;declare pos1to int;declare pos2frm int;declare Search_Date_Follow_ varchar(500);
declare pos2to int; declare PageSize int;declare Search_By_Registered varchar(500);declare User_Status int;declare more_info int;
declare closedentries varchar(1000); declare missedcount varchar(1000);declare RoleId_ varchar(100);declare Department_String_ varchar(4000);
 set pos1frm=0;    set pos1to=0;    set pos2frm=0;    set pos2to=0;    set PageSize=10; set more_info=0; 
 set SearchbyName_Value='';
 set Search_Date_='';
 set closedentries='';
/*set pos1frm = ((Page_Index1_ * PageSize) + 1 - RowCount);set pos1to = (((Page_Index1_ + 1) * PageSize) + RowCount);
    if (RowCount2 > 0 && RowCount > 0 && Page_Index1_ > 0)    then set pos1frm = 0;set pos1to = 0; end if;
set pos2frm = ((Page_Index2_ * PageSize) + 1 - RowCount); set pos2to = (((Page_Index2_ + 1) * PageSize) + RowCount);
       if (RowCount2 > 0 && RowCount > 0 && Page_Index1_ > 0)    then set pos2frm = 0;set pos2to = 0; end if;*/
    #set pos2frm = 0;#set pos2to = 10;
set RoleId_ =(select Role_String from user_details where User_Details_Id = Login_User_Id_);
set Department_String_ = (select Department_String from user_details where User_Details_Id = Login_User_Id_);
set User_Status= (select Working_Status from user_details where User_Details_Id=Login_User_Id_ ); 

if(SearchbyName_ !='') then
set SearchbyName_Value = replace(replace(SearchbyName_Value,'+',''),' ','');
SET SearchbyName_Value =   Concat( SearchbyName_Value," and student.Student_Name like '%",SearchbyName_ ,"%' or  replace(replace(student.Phone_Number,'+',''),' ','') like '%",SearchbyName_ ,"%'
        or  replace(replace(student.Whatsapp,'+',''),' ','')  like '%",SearchbyName_ ,"%' or replace(replace(student.Alternative_Phone_Number,'+',''),' ','') like '%",SearchbyName_ ,"%' or  student.Email like '%",SearchbyName_ ,"%' or student.Alternative_Email like '%",SearchbyName_ ,"%' ") ;
end if;
if Department_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.Department =",Department_);
else 
	if(SearchbyName_ !='') then
		set Is_Date_Check_=false;
	else
		set closedentries=concat(" and student.FollowUp =1");
	end if;
end if;
if Branch_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.Branch =",Branch_);
end if;
if By_User_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.User_Id =",By_User_);
end if;
if Status_Id_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.Status =",Status_Id_);
end if;
if Register_Value=2 then
Set SearchbyName_Value= Concat( SearchbyName_Value," and student.Is_Registered= ",1) ;
    elseif Register_Value=3 then
    Set SearchbyName_Value= Concat( SearchbyName_Value," and student.Is_Registered= ",0) ;
    end if;

if(SearchbyName_ !='') then
set Is_Date_Check_=false;
#set closedentries=concat(" and Department_FollowUP =0");
else
set closedentries=concat(" and student.FollowUp =1");
end if;
 if Is_Date_Check_=true then
        set Search_Date_=concat( " and  student.Next_FollowUp_Date <= '", Todate_,"'");
        set Search_Date_Follow_= concat( " and date(student.Next_FollowUp_Date) >= '", Fromdate_ ,"' and  date(student.Next_FollowUp_Date) <= '", Todate_,"'");
        set closedentries=concat(" and FollowUp =1");
    set missedcount=concat("
        union 
        select 3 tp,count(student.Student_Id) Student_Id,'' Student_Name
        ,'','', now(),now(),'',1,'','','','',1,1,1,1,'','' 
        from student  
        where student.DeleteStatus=0 and FollowUp=1    and date(student.Next_FollowUp_Date) <'",  Fromdate_,"' ",Department_String_,SearchbyName_Value,"
        and student.Role_Id in(",RoleId_,") 
        ");
#set Search_Date_union=concat( " and  Leads.Next_FollowUp_Date < '", Fromdate_,"'");
ELSE
        set Search_Date_= "and 1 =1 ";
        set Search_Date_Follow_= "and 1 =1 ";
    set missedcount=concat("
          union
        select 3 tp,0 Student_Id, ''
        ,'','', now(),now(),'',1,'','','','',1,1,1,1,'','' ");
end if;
SET @query = Concat( "select * from ( select CAST(CAST(1 AS UNSIGNED) AS SIGNED)as tp,student.Student_Id,
	student.Student_Name,student.Phone_Number,student.Remark,(Date_Format(student.Next_FollowUp_Date,'%d-%m-%Y')) As Next_FollowUp_Date,(Date_Format(student.Next_FollowUp_Date,'%Y-%m-%d')) As Actual_Next_FollowUp_Date,
	Department_Name,FollowUp,Department_Status_Name, User_Details_Name,
	Branch_Name,Client_Accounts_Name,Agent_Id,student.Is_Registered,1 as User_Status,0 as more_info,Country_Name,Send_Welcome_Mail_Status
	from student
where student.DeleteStatus=0  ",Search_Date_," ",Department_String_,closedentries," ",SearchbyName_Value,"
and student.Role_Id  in(",RoleId_,")  ",
" order by (date_format(Next_FollowUp_Date,'%Y-%m-%d'))  desc ,Student_Name asc LIMIT ",Page_Index1_-1 ,",",PageSize,") as one "
,missedcount,
" union
        select 4 tp,count(student.Student_Id) Student_Id,'' Student_Name
        ,'','', now(),now(),'',1,'','','','',1,1,1,1,'','' 
        from student
        where student.DeleteStatus=0 and FollowUp=1    ",Search_Date_Follow_," ",Department_String_,SearchbyName_Value,"
        and student.Role_Id in(",RoleId_,") order by tp ,Next_FollowUp_Date;");
#insert into db_logs values(0,CURDATE(),1,1, @query,'','');
PREPARE QUERY FROM @query;
EXECUTE QUERY;
#select @query;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Student_Agent`(In From_Date_ datetime,To_Date_ datetime,Is_Date_Check_ Tinyint,Student_Name_ varchar(100),
Phone_Number_ varchar(25), Agent_Id_ int,Student_Status_Id_ int, Pointer_Start_ Varchar(10), Pointer_Stop_ Varchar(10), Page_Length_ Varchar(10))
Begin 
declare Search_Date_ varchar(500);declare SearchbyName_Value varchar(4000);
set Search_Date_="";set SearchbyName_Value=""; 

if Is_Date_Check_=true then
	set Search_Date_=concat(SearchbyName_Value," and date(Student.Entry_Date) >= '", From_Date_ ,"' and  date(Student.Entry_Date) <= '", To_Date_,"'");
end if;
if Student_Name_!='' then
SET SearchbyName_Value =   Concat( SearchbyName_Value ," and Student.Student_Name like '%",Student_Name_ ,"%'") ;
end if;
if Phone_Number_!='' then
SET SearchbyName_Value =   Concat( SearchbyName_Value ," and Student.Phone_Number like '%",Phone_Number_ ,"%'") ;
end if;
if Agent_Id_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and Student.Agent_Id =",Agent_Id_);
end if;
if Student_Status_Id_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and Student.Student_Status_Id =",Student_Status_Id_);
end if;

/* inner join student_course_apply on Student.Student_Id = student_course_apply.Student_Id 
 inner join student_course_selection  on student_course_apply.Student_Course_Apply_Id = student_course_selection.Student_Course_Apply_Id 
 inner join course on student_course_selection.Course_Id = course.Course_Id */
 
SET @query = Concat("select * from (SELECT student.Student_Id,(Date_Format(student.Entry_Date,'%Y-%m-%d')) Entry_Date,student.Student_Name,student.Address1,
student.Email,student.Phone_Number,student.Agent_Id,client_accounts.Client_Accounts_Name,student_status.Student_Status_Name,
 CAST(CAST(ROW_NUMBER()OVER(ORDER BY Student.Student_Name DESC )AS UNSIGNED)AS SIGNED)AS RowNo
 From Student 

 inner join client_accounts on student.Agent_Id=client_accounts.Client_Accounts_Id
 inner join student_status on student.Student_Status_Id=student_status.Student_Status_Id
 
 where Student.DeleteStatus = false  ", Search_Date_ ,SearchbyName_Value," order by Student.Entry_Date desc  )
 as lds WHERE RowNo >=",Pointer_Start_," AND RowNo<= ",Pointer_Stop_,"
 order by  RowNo LIMIT ",Page_Length_);
 
PREPARE QUERY FROM @query;

EXECUTE QUERY;
#select @query;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Student_Count`(In Fromdate_ date,Todate_ date,RoleId_ varchar(100),Department_String varchar(1000),Search_By_ int,
SearchbyName_ varchar(50),Department_ int,Branch_ int,By_User_ int,Is_Date_Check_ Tinyint,
Page_Index1_ int,Page_Index2_ int,Login_User_Id_ int,RowCount int ,RowCount2 int)
BEGIN
declare SearchbyName_Value varchar(2000);declare UnionQuery varchar(4000);declare Search_Date_ varchar(500);
declare Search_Date_union varchar(500);declare pos1frm int;declare pos1to int;declare pos2frm int;
declare pos2to int; declare PageSize int;
 set pos1frm=0;    set pos1to=0;    set pos2frm=0;    set pos2to=0;    set PageSize=10;
 set SearchbyName_Value='';
 set Search_Date_='';
if(SearchbyName_ !='0') then
	if Search_By_=1 then
		SET SearchbyName_Value =   Concat( SearchbyName_Value," and student.Student_Name like '%",SearchbyName_ ,"%'") ;
	end if;
end if;
if Department_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and student.Department =",Department_);
end if;
if Branch_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and student.Branch =",Branch_);
end if;
if By_User_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and student.User_Id =",By_User_);
end if;
if Is_Date_Check_=true then
	set Search_Date_=concat( " and student.Next_FollowUp_Date >= '", Fromdate_ ,"' and  student.Next_FollowUp_Date <= '", Todate_,"'");
	set Search_Date_union=concat( " and  student.Entry_Date < '", Fromdate_,"'");
ELSE
	set Search_Date_= "and 1 =1 ";
end if;
set UnionQuery="";
SET @query = Concat(    "select B.User_Details_Name By_User,Department.Department_Name, count(student.Student_Id) Count
from student 
	inner join Department on Department.Department_Id= student.Department  ",Search_Date_," ",Department_String," 
	inner join user_details as B on B.User_Details_Id=student.By_User_Id 
and student.DeleteStatus=0  ",SearchbyName_Value,"  and B.Role_Id in(",RoleId_,") group by student.Department,By_User_Id 
 order by Count desc"
    );
	 
PREPARE QUERY FROM @query;
#select @query;

EXECUTE QUERY;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Student_Count_Track_Report`(In Fromdate_ date,
By_User_ int)
BEGIN
declare SearchbyName_Value varchar(2000);declare UnionQuery varchar(4000);declare Search_Date_ varchar(500);
declare Search_Date_union varchar(500);declare pos1frm int;declare pos1to int;declare pos2frm int;
declare pos2to int; declare PageSize int;
 set pos1frm=0;    set pos1to=0;    set pos2frm=0;    set pos2to=0;    set PageSize=10;
 set SearchbyName_Value='';
 set Search_Date_='';

SET @query = Concat("select count(student_followup.Student_Id) Count,Date_Format(Entry_Date,'%H') Entry_Date
from student_followup 
	inner join user_details as B on B.User_Details_Id=student_followup.By_User_Id and date(student_followup.Entry_Date )= '", Fromdate_,"'
    and B.User_Details_Id= '", By_User_,"'
    group by (Date_Format(Entry_Date,'%H')) order by Entry_Date asc"
    );	 
PREPARE QUERY FROM @query;
#select @query;

EXECUTE QUERY;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Student_Document`( In Student_Document_Name_ varchar(100))
Begin 
 set Student_Document_Name_ = Concat( '%',Student_Document_Name_ ,'%');
 SELECT Student_Document_Id,
Student_Id,
Document_Id From Student_Document where Student_Document_Name like Student_Document_Name_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Student_Import`(In From_Date_ datetime,To_Date_ datetime,Is_Date_Check_ Tinyint)
Begin 
declare Search_Date_ varchar(500);declare SearchbyName_Value varchar(2000);
declare Search_Date_union varchar(500);
#Declare Import_Master_Id_ int;
set Search_Date_="";set SearchbyName_Value=""; 
if Is_Date_Check_=true then
	set Search_Date_=concat(" and date(import_students_master.Entry_Date) >= '", From_Date_ ,"' and  date(import_students_master.Entry_Date) <= '", To_Date_,"'");
end if;

SET @query = Concat("SELECT User_Details_Name,(Date_Format(Entry_Date,'%Y-%m-%d')) Entry_Date
 From import_students_master ",Search_Date_," 
 inner join user_details  on  user_details.User_Details_Id = import_students_master.By_User_Id 
 order by import_students_master.Entry_Date desc ");
PREPARE QUERY FROM @query;EXECUTE QUERY;
#insert into db_logs values(1,@query,1,1);
#select @query;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Student_Message`( In Student_Id_ varchar(100))
Begin 

 SELECT Student_Message_Id,
Student_Id,
Message_Detail From Student_Message where Student_Id=Student_Id_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Student_Old`(In Fromdate_ date,Todate_ date,Search_By_ int,
SearchbyName_ varchar(50),Department_ int,Branch_ int,By_User_ int,Status_Id_ int,Is_Date_Check_ Tinyint,
Page_Index1_ int,Page_Index2_ int,Login_User_Id_ int,RowCount int ,RowCount2 int,Register_Value int)
BEGIN
declare SearchbyName_Value varchar(2000);declare UnionQuery varchar(4000);declare Search_Date_ varchar(500);
declare Search_Date_union varchar(500);declare pos1frm int;declare pos1to int;declare pos2frm int;
declare pos2to int; declare PageSize int;declare Search_By_Registered varchar(500);declare User_Status int;declare more_info int;
declare closedentries varchar(1000); declare missedcount varchar(1000);declare RoleId_ varchar(100);declare Department_String_ varchar(4000);
 set pos1frm=0;    set pos1to=0;    set pos2frm=0;    set pos2to=0;    set PageSize=10; set more_info=0; 
 set SearchbyName_Value='';
 set Search_Date_='';
 set closedentries='';
 set RoleId_ =(select Role_String from user_details where User_Details_Id = Login_User_Id_);
set Department_String_ = (select Department_String from user_details where User_Details_Id = Login_User_Id_);

 
 set User_Status= (select Working_Status from user_details where User_Details_Id=Login_User_Id_ );
if(SearchbyName_ !='') then
#if Search_By_=1 then
 set SearchbyName_Value = replace(replace(SearchbyName_Value,'+',''),' ','');
SET SearchbyName_Value =   Concat( SearchbyName_Value," and student.Student_Name like '%",SearchbyName_ ,"%' or  replace(replace(student.Phone_Number,'+',''),' ','') like '%",SearchbyName_ ,"%'
        or  replace(replace(student.Whatsapp,'+',''),' ','')  like '%",SearchbyName_ ,"%' or replace(replace(student.Alternative_Phone_Number,'+',''),' ','') like '%",SearchbyName_ ,"%' or  student.Email like '%",SearchbyName_ ,"%' or student.Alternative_Email like '%",SearchbyName_ ,"%' ") ;
#end if;
							/*    if Search_By_=2 then
							   set SearchbyName_Value = replace(replace(SearchbyName_Value,'+',''),' ','');
							   
							SET SearchbyName_Value =   Concat(SearchbyName_Value, " and replace(replace(student.Phone_Number,'+',''),' ','') like '%",SearchbyName_ ,"%'
									or  replace(replace(student.Whatsapp,'+',''),' ','')  like '%",SearchbyName_ ,"%' or replace(replace(student.Alternative_Phone_Number,'+',''),' ','') like '%",SearchbyName_ ,"%' ") ;
							end if;
							if Search_By_=3 then
							SET SearchbyName_Value =   Concat(SearchbyName_Value, " and student.Email like '%",SearchbyName_ ,"%'
							or student.Alternative_Email like '%",SearchbyName_ ,"%' ") ;
							end if;*/

end if;

if Register_Value=2 then
Set SearchbyName_Value= Concat( SearchbyName_Value," and student.Is_Registered= ",1) ;
    elseif Register_Value=3 then
    Set SearchbyName_Value= Concat( SearchbyName_Value," and student.Is_Registered= ",0) ;
    end if;
   
if Department_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and student.Department =",Department_);
else 
	if(SearchbyName_ !='') then
		set Is_Date_Check_=false;
	else
		set closedentries=concat(" and student.FollowUp =1");
	end if;

end if;
if Branch_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.Branch =",Branch_);
end if;
if By_User_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.User_Id =",By_User_);
end if;
if Status_Id_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.Status =",Status_Id_);
end if;
if(SearchbyName_ !='') then
	set Is_Date_Check_=false;
end if;
if Is_Date_Check_=true then
set Search_Date_=concat( " and date(student.Next_FollowUp_Date) >= '", Fromdate_ ,"' and  date(student.Next_FollowUp_Date) <= '", Todate_,"'");
set Search_Date_union=concat( " and  date(student.Next_FollowUp_Date) < '", Fromdate_,"'");
ELSE
set Search_Date_= "and 1 =1 ";
end if;
set UnionQuery="";
if User_Status=1 then
	if Is_Date_Check_=true then
		#inner join user_details on user_details.User_Details_Id=student.User_Id
		#inner join user_details as B on B.User_Details_Id=student.By_User_Id
		#B.User_Details_Name Registered_By_Name,
		set UnionQuery=concat(" union select * from(select  CAST(CAST(2 AS UNSIGNED) AS SIGNED)   as tp,student.Student_Id,
		student.Student_Name,student.Phone_Number,student.Remark,(Date_Format(student.Next_FollowUp_Date,'%d-%m-%Y')) As Next_FollowUp_Date,
		Department_Name,FollowUp,Department_Status_Name,User_Details_Name,
		CAST(CAST(ROW_NUMBER()OVER(ORDER BY student.Student_Id DESC,Student.Next_FollowUp_Date desc)AS UNSIGNED)AS SIGNED)AS
		RowNo,Branch_Name,Client_Accounts_Name,Agent_Id,student.Is_Registered,1 as User_Status,0 as more_info,Country_Name,Send_Welcome_Mail_Status
		from student
		where FollowUp=1 and student.DeleteStatus=0 ",Search_Date_union ," ",Department_String_,"
		and student.Role_Id in(",RoleId_,") ",SearchbyName_Value, " " ,Search_Date_union,"
		)as lds WHERE RowNo >=",RowCount," AND RowNo<= ",RowCount2
		);
		set missedcount=concat("
		union 
		select 3 tp,count(student.Student_Id) Student_Id,'' Student_Name,'','', now(),'',1,'','',1,'','',1,1,1,1,'','' 
		from student
		where student.Role_Id in(",RoleId_,") ",Department_String_,"
		and student.DeleteStatus=0 and FollowUp=1   ",SearchbyName_Value," and date(student.Next_FollowUp_Date) <'",  Fromdate_,"'");
	else
		set missedcount=concat("
		union 
		select 3 tp,0 Student_Id, '','','', now(),'',1,'','',1,'','',1,1,1,1,'','' ");
	end if;
	SET @query = Concat( "select * from ( select * from (select * from(select CAST(CAST(1 AS UNSIGNED) AS SIGNED)as tp,student.Student_Id,
	student.Student_Name,student.Phone_Number,student.Remark,(Date_Format(student.Next_FollowUp_Date,'%d-%m-%Y')) As Next_FollowUp_Date,
	Department_Name,FollowUp,Department_Status_Name, User_Details_Name,
	CAST(CAST(ROW_NUMBER()OVER(ORDER BY student.Student_Id DESC,Student.Next_FollowUp_Date desc)AS UNSIGNED)AS SIGNED)AS
	RowNo,Branch_Name,Client_Accounts_Name,Agent_Id,student.Is_Registered,1 as User_Status,0 as more_info,Country_Name,Send_Welcome_Mail_Status
	from student
	where student.DeleteStatus=0 ",Search_Date_," ",Department_String_,closedentries,"
	and student.Role_Id in(",RoleId_,") ",SearchbyName_Value,"
	)as lds WHERE RowNo >=",Page_Index1_," AND RowNo<= ",Page_Index2_,UnionQuery,"
	)as ldtwo order by tp, RowNo LIMIT ",PageSize ,") as ldthree " , missedcount," union
	select 4 tp,count(student.Student_Id) Student_Id,'' Student_Name,'','', now(),'',1,'','',1,'','',1,1,1,1,'','' 
	from student
	where student.DeleteStatus=0 and FollowUp=1 and student.Role_Id in(",RoleId_,")  ",Search_Date_,Department_String_,SearchbyName_Value,"
	order by tp ,Next_FollowUp_Date asc");
	PREPARE QUERY FROM @query;
	#select @query;
	EXECUTE QUERY;
else
 select 2 as User_Status;
 end if;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Student_Report`(In Fromdate_ date,Todate_ date,RoleId_ varchar(100),Department_String varchar(1000),Search_By_ int,
SearchbyName_ varchar(50),Department_ int,Enquiry_Source_ int,Branch_ int,By_User_ int,Is_Date_Check_ Tinyint,
Page_Index1_ int,Page_Index2_ int,Login_User_Id_ int,RowCount int ,RowCount2 int,remarks_ int,To_User_ int,Status_Id_ int,Register_Value int)
BEGIN
declare SearchbyName_Value varchar(2000);declare UnionQuery varchar(4000);declare Search_Date_ varchar(1000);
declare Search_Date_union varchar(500);declare pos1frm int;declare pos1to int;declare pos2frm int;
declare pos2to int; declare PageSize int;
 set pos1frm=0;    set pos1to=0;    set pos2frm=0;    set pos2to=0;    set PageSize=10;
 set SearchbyName_Value='';
 set Search_Date_='';
if(SearchbyName_ !='0') then
	if Search_By_=1 then
		SET SearchbyName_Value =   Concat( SearchbyName_Value," and student.Student_Name like '%",SearchbyName_ ,"%'") ;
	end if;
    if Search_By_=2 then
		SET SearchbyName_Value =   Concat( SearchbyName_Value," and student.Email like '%",SearchbyName_ ,"%'") ;
	end if;
    if Search_By_=3 then
		SET SearchbyName_Value =   Concat( SearchbyName_Value," and student.Phone_Number like '%",SearchbyName_ ,"%'") ;
	end if;
end if;
if Department_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and student.Department =",Department_);
end if;

if Enquiry_Source_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and student.Enquiry_Source_Id =",Enquiry_Source_);
end if;

if Register_Value=2 then
Set SearchbyName_Value= Concat( SearchbyName_Value," and student.Is_Registered= ",1) ;
    elseif Register_Value=3 then
    Set SearchbyName_Value= Concat( SearchbyName_Value," and student.Is_Registered= ",0) ;
    end if;
if Status_Id_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.Status =",Status_Id_);
end if;
if Branch_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and student.Branch =",Branch_);
end if;
if By_User_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and student.Created_By =",By_User_);
end if;
if To_User_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and student.User_Id =",To_User_);
end if;
if remarks_ >0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and student.Remark_Id =",remarks_);
end if;


if Is_Date_Check_=true then
	set Search_Date_=concat( SearchbyName_Value," and date(student.Next_FollowUp_date) >= '", Fromdate_ ,"' and  date(student.Next_FollowUp_date) <= '", Todate_,"'");
	
ELSE
	set Search_Date_= "and 1 =1 ";
end if;
set UnionQuery="";
SET @query = Concat( "select * from (select * from(select CAST(CAST(1 AS UNSIGNED) AS SIGNED)as tp,CAST(CAST(ROW_NUMBER()OVER(ORDER BY student.Student_Id DESC)AS UNSIGNED)AS SIGNED)AS 
No,(Date_Format(student.Entry_Date,'%d-%m-%Y   %h:%i')) As Created_On,user_details.User_Details_Name As Created_By,student.Student_Name Student,
enquiry_source.Enquiry_Source_Name AS Enquiry_Source,student.Is_Registered,Department_Status.Department_Status_Name,
student.Phone_Number Mobile,Branch.Branch_Name Branch,(Date_Format(student.Next_FollowUp_Date,'%d-%m-%Y')) As Follow_Up_On,Department.Department_Name Department,
Department_Status.Department_Status_Name Status,T.User_Details_Name To_Staff,B.User_Details_Name Registered_By,(Date_Format(student.Registered_On,'%d-%m-%Y   %h:%i')) As Registered_On ,
student.Remark,student.Email
from student 
	inner join Department on Department.Department_Id= student.Department  ",Department_String," 
	inner join user_details on user_details.User_Details_Id=student.Created_By 
	inner join Branch on Branch.Branch_Id= student.Branch
	inner join enquiry_source on enquiry_source.Enquiry_Source_Id= student.Enquiry_Source_Id
	inner join Department_Status on Department_Status.Department_Status_Id=student.Status 
	inner join user_details as T on T.User_Details_Id=student.User_Id 
   
	left join user_details as B on B.User_Details_Id=student.Registered_By 
	where student.DeleteStatus=0    and student.DeleteStatus=0  ",SearchbyName_Value," ",Search_Date_," 
	and T.Role_Id in(",RoleId_,"))as lds )as ldtwo
	order by tp ");	 
PREPARE QUERY FROM @query;
#select @query;

EXECUTE QUERY;


END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Student_Status`( In Student_Status_Name_ varchar(100))
Begin 
 set Student_Status_Name_ = Concat( '%',Student_Status_Name_ ,'%');
 SELECT Student_Status_Id,
Student_Status_Name From Student_Status where Student_Status_Name like Student_Status_Name_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Student_Summary`(In Fromdate_ date,Todate_ date,RoleId_ varchar(100),Department_String varchar(1000),Search_By_ int,
SearchbyName_ varchar(50),Department_ int,Branch_ int,By_User_ int,Is_Date_Check_ Tinyint,
Page_Index1_ int,Page_Index2_ int,Login_User_Id_ int,RowCount int ,RowCount2 int)
BEGIN
declare SearchbyName_Value varchar(2000);declare UnionQuery varchar(4000);declare Search_Date_ varchar(500);
declare Search_Date_union varchar(500);declare pos1frm int;declare pos1to int;declare pos2frm int;
declare pos2to int; declare PageSize int;
 set pos1frm=0;    set pos1to=0;    set pos2frm=0;    set pos2to=0;    set PageSize=10;
 set SearchbyName_Value='';
 set Search_Date_='';
if(SearchbyName_ !='0') then
	if Search_By_=1 then
		SET SearchbyName_Value =   Concat( SearchbyName_Value," and student.Student_Name like '%",SearchbyName_ ,"%'") ;
	end if;
end if;
if Department_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and student.Department =",Department_);
end if;
if Branch_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and student.Branch =",Branch_);
end if;
if By_User_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and student.Created_By =",By_User_);
end if;
if Is_Date_Check_=true then
	set Search_Date_=concat( SearchbyName_Value," and date(student.Entry_Date) >= '", Fromdate_ ,"' and  date(student.Entry_Date) <= '", Todate_,"'");
	
ELSE
	set Search_Date_= "and 1 =1 ";
end if;
set UnionQuery="";
SET @query = Concat("select count(student.Student_Id) Count,Department_Name
from student
	inner join department on student.Department=department.Department_Id     
    group by department.Department_Id"
    );	 
	 
PREPARE QUERY FROM @query;
#select @query;


EXECUTE QUERY;


END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Student_Summary_Report`(In Fromdate_ date,Todate_ date,RoleId_ varchar(100),Department_String varchar(1000),Search_By_ int,
SearchbyName_ varchar(50),Department_ int,Branch_ int,By_User_ int,Is_Date_Check_ Tinyint,
Page_Index1_ int,Page_Index2_ int,Login_User_Id_ int,RowCount int ,RowCount2 int)
BEGIN
declare SearchbyName_Value varchar(2000);declare UnionQuery varchar(4000);declare Search_Date_ varchar(500);
declare Search_Date_union varchar(500);declare pos1frm int;declare pos1to int;declare pos2frm int;declare User_Type_ int;
declare pos2to int; declare PageSize int;
 set pos1frm=0;    set pos1to=0;    set pos2frm=0;    set pos2to=0;    set PageSize=10;
 set SearchbyName_Value='';
 set Search_Date_='';
set User_Type_=(select User_Type from user_details where User_Details_Id=Login_User_Id_);

if Branch_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and student.Branch =",Branch_);
end if;
if User_Type_=2 then
 	SET SearchbyName_Value =concat(SearchbyName_Value," and student.User_Id =",Login_User_Id_);
    else
    SET SearchbyName_Value =concat(SearchbyName_Value," and student.User_Id in (select User_Details_Id from user_details where Branch_Id in (select
distinct Branch_Id from user_department where User_Id =",Login_User_Id_," and VIew_All=1))");
end if;

if Is_Date_Check_=true then
	set Search_Date_=concat( SearchbyName_Value," and date(student.Next_FollowUp_Date) >= '", Fromdate_ ,"' and  date(student.Next_FollowUp_Date) <= '", Todate_,"'");
	
ELSE
	set Search_Date_= "and 1 =1 ";
end if;
set UnionQuery="";
SET @query = Concat("select Branch_Name Branch,Department_Name Department,count(student.Student_Id) No_of_Students
from student
    where  student.DeleteStatus=0 ",Search_Date_," ",SearchbyName_Value,"  
    group by student.Department ,student.Branch order by Branch,Department"
    );	 
	 
PREPARE QUERY FROM @query;
#select @query;


EXECUTE QUERY;


END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Student_With_PhoneNumber`(In Phone_Number_ varchar(100))
BEGIN
declare SearchbyNumber_Value varchar(500);
declare Alternative_Phone_ varchar(25);
 set SearchbyNumber_Value = replace(replace(SearchbyNumber_Value,'+',''),' ','');
SET SearchbyNumber_Value = Concat(" where replace(replace(student.Phone_Number,'+',''),' ','') like '%",Phone_Number_,"%'
     or  replace(replace(student.Whatsapp,'+',''),' ','')  like '%",Phone_Number_,"%' or replace(replace(student.Alternative_Phone_Number,'+',''),' ','') like '%",Phone_Number_,"%'  or  student.Email like '%",Phone_Number_ ,"%' or student.Alternative_Email like '%",Phone_Number_ ,"%'  ") ;
#SET SearchbyNumber_Value=Concat( SearchbyNumber_Value," and( student.Phone_Number =",Phone_Number_," or student.Alternative_Phone_Number = ",Phone_Number_," or student.Whatsapp = ",Phone_Number_,")" ) ;

 # Concat( SearchbyNumber_Value," and( student.Phone_Number =",Phone_Number_," or student.Alternative_Phone_Number = ",Phone_Number_," or student.Whatsapp = ",Phone_Number_,")" ) ;
#SET SearchbyNumber_Value =   Concat() ;

        #SET SearchbyNumber_Value =   Concat( " and student.Phone_Number =",Phone_Number_ , " or  (student.Alternative_Phone_Number =)",Phone_Number_ ) ;
SET @query = Concat( "select student.Student_Id,
student.Student_Name,student.Phone_Number,student.Alternative_Phone_Number,student.Remark,(Date_Format(student.Registered_On,'%d-%m-%Y-%h:%i')) As Registered_On ,
    (Date_Format(student.Entry_Date,'%d-%m-%Y')) As Entry_Date,  (Date_Format(student.Next_FollowUp_Date,'%d-%m-%Y')) As Next_FollowUp_Date,
Department.Department_Name,Department.FollowUp,Department_Status.Department_Status_Name,T.User_Details_Name,
B.User_Details_Name Registered_By_Name,
Branch.Branch_Name,Is_Registered,user_details.User_Details_Name As Created_By_Name,Whatsapp,student.Email
from student
inner join Department on Department.Department_Id= student.Department  and student.DeleteStatus=0 
inner join user_details on user_details.User_Details_Id=student.Created_By
inner join Branch on Branch.Branch_Id= student.Branch
inner join Department_Status on Department_Status.Department_Status_Id=student.Status
inner join user_details as T on T.User_Details_Id=student.User_Id
inner join user_details as B on B.User_Details_Id=student.Created_By
",SearchbyNumber_Value," 
order by student.Phone_Number");
PREPARE QUERY FROM @query;
#select @query;

EXECUTE QUERY;
select 1;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Subject`( In Subject_Name_ varchar(100))
Begin 
 set Subject_Name_ = Concat( '%',Subject_Name_ ,'%');
 SELECT Subject_Id,
Subject_Name From Subject where Subject_Name like Subject_Name_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Sub_Section`( In Sub_Section_Name_ varchar(100))
Begin 
 set Sub_Section_Name_ = Concat( '%',Sub_Section_Name_ ,'%');
 SELECT Sub_Section_Id,
Sub_Section_Name From Sub_Section where Sub_Section_Name like Sub_Section_Name_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_University`( In University_Name_ varchar(100))
Begin 
 set University_Name_ = Concat( '%',University_Name_ ,'%');
 SELECT University_Id,
University_Name From University where University_Name like University_Name_ and DeleteStatus=false ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_University_Typeahead`( In University_Name_ varchar(150))
Begin
 set University_Name_ = Concat( '%',University_Name_ ,'%');
select  university.University_Id,University_Name
From university
where university.DeleteStatus=false
order by University_Name ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Userwise_Summary`(In Fromdate_ date,Todate_ date,RoleId_ varchar(100),Department_String varchar(1000),Search_By_ int,
SearchbyName_ varchar(50),Department_ int,Branch_ int,By_User_ int,Is_Date_Check_ Tinyint,
Page_Index1_ int,Page_Index2_ int,Login_User_Id_ int,RowCount int ,RowCount2 int)
BEGIN
declare SearchbyName_Value varchar(2000);declare UnionQuery varchar(4000);declare Search_Date_ varchar(500);
declare Search_Date_union varchar(500);declare pos1frm int;declare pos1to int;declare pos2frm int;
declare pos2to int; declare PageSize int;declare User_Type_ int;
 set pos1frm=0;    set pos1to=0;    set pos2frm=0;    set pos2to=0;    set PageSize=10;
 set SearchbyName_Value='';
 set Search_Date_='';
set User_Type_=(select User_Type from user_details where User_Details_Id=Login_User_Id_);

if By_User_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and fees_receipt.User_Id =",By_User_);
end if;
if Branch_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and fees_receipt.Fee_Receipt_Branch =",Branch_);
end if;
if User_Type_=2 then
 	SET SearchbyName_Value =concat(SearchbyName_Value," and fees_receipt.User_Id=",Login_User_Id_);
    else
    SET SearchbyName_Value =concat(SearchbyName_Value," and fees_receipt.User_Id in (select User_Details_Id from user_details where Branch_Id in (select
distinct Branch_Id from user_department where User_Id =",Login_User_Id_," and VIew_All=1))");
end if;
if Is_Date_Check_=true then
	set Search_Date_=concat(SearchbyName_Value, " and date(fees_receipt.Entry_Date) >= '", Fromdate_ ,"' and  date(fees_receipt.Entry_Date) <= '", Todate_,"'");
ELSE
	set Search_Date_= "and 1 =1 ";
end if;

SET @query = Concat( "select Branch.Branch_Name Branch,user_details.User_Details_Name User, sum(fees_receipt.Amount) Amount,User_Details_Id
from 
student
inner join fees_receipt on student.Student_Id=fees_receipt.Student_Id
inner join Branch on Branch.Branch_Id= fees_receipt.Fee_Receipt_Branch
inner join user_details on User_Details_Id =fees_receipt.User_Id
where fees_receipt.Delete_Status=0 and student.DeleteStatus=0  ",Search_Date_," ",SearchbyName_Value,"
group by fees_receipt.User_Id order by Branch,student.User_Id");
PREPARE QUERY FROM @query;
#select @query;

EXECUTE QUERY;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_User_Details`( In User_Details_Name_ varchar(100), Branch_Id_ int)
Begin 
declare SearchbyName_Value varchar(2000);
set SearchbyName_Value='';
if (User_Details_Name_ !='0') then
	 set  SearchbyName_Value =    Concat( SearchbyName_Value," and user_details.User_Details_Name like '%",User_Details_Name_,"%'");
end if;
if Branch_Id_>0 then
 set SearchbyName_Value =  Concat(SearchbyName_Value," and user_details.Branch_Id = " , Branch_Id_);
end if;
 SET @query = Concat("SELECT User_Details_Id,User_Details_Name,Password,Working_Status,User_Type,Role_Id,User_Status_Name,User_Type_Name,Branch_Name,
 User_Details.Address1, User_Details.Address2,User_Details.Address3,User_Details.Address4,User_Details.Pincode,
 User_Details.Mobile,User_Details.Email,branch.Branch_Id,branch.Branch_Name,User_Details.Registration_Target,User_Details.FollowUp_Target
From User_Details
inner join user_status on User_Details.Working_Status=user_status.User_Status_Id
inner join user_type on User_Details.User_Type=user_type.User_Type_Id
inner join branch on User_Details.Branch_Id=branch.Branch_Id
where User_Details.DeleteStatus=false ",SearchbyName_Value,"
order by User_Details_Id ");
PREPARE QUERY FROM @query;
#select @query;

EXECUTE QUERY;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_User_Menu_Selection`( )
Begin 
SELECT 
	Menu_Id,
	Menu_Name,
	Menu_Order,
	IsEdit Edit_Check,
	IsSave Save_Check,
	IsDelete  Delete_Check,
	IsView,
	Menu_Status 
From Menu 
	where Menu_Status=1 and DeleteStatus=false 
order by Menu.Menu_Order,Menu_Order_Sub asc;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_User_Role`(In User_Role_Name_ varchar(100))
BEGIN
 set User_Role_Name_ = Concat( '%',User_Role_Name_ ,'%');
 SELECT second.User_Role_Id,second.User_Role_Name,second.Role_Under_Id,
 first.User_Role_Name as Role_Under
 from 
 User_Role  as second 
 inner join User_Role as first
 on first.User_Role_Id=second.Role_Under_Id
 where second.User_Role_Name like User_Role_Name_ 
 and first.Is_Delete=false AND Second.Is_Delete=False
order by User_Role_Name asc ;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_User_Role_Typeahead`( In User_Role_Name_ varchar(100))
Begin 
set User_Role_Name_ = Concat( '%',User_Role_Name_ ,'%');
SELECT
User_Role_Id,User_Role_Name
FROM user_role 
where User_Role_Name LIKE User_Role_Name_ 
and User_Role_Name Not in('Sundry Debtors')
and DeleteStatus=False
order by User_Role_Name asc Limit 5 ;
End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_User_Typeahead`( In User_Details_Name_ varchar(100))
Begin 
set User_Details_Name_ = Concat( '%',User_Details_Name_ ,'%');
SELECT
User_Details_Id,User_Details_Name
FROM User_Details 
where User_Details_Name LIKE User_Details_Name_ 
and User_Details_Name Not in('Sundry Debtors')
and DeleteStatus=False
order by User_Details_Name asc Limit 5 ;
End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_User_Typeahead_ByUser`(In Login_Id_ int,User_Details_Name_ varchar(100))
BEGIN
declare SearchbyName_Value varchar(2000);
declare User_Type_ int;
 set SearchbyName_Value='';
 set User_Type_=(select User_Type from user_details where User_Details_Id=Login_Id_);
 set User_Details_Name_ =  Concat( " and User_Details_Name LIKE '%",User_Details_Name_,"%' ") ;
if User_Type_=2 then
 	SET SearchbyName_Value =concat(SearchbyName_Value," and User_Details_Id =",Login_Id_);
else
    SET SearchbyName_Value =concat(SearchbyName_Value," and User_Details_Id in (select User_Details_Id from user_details where Branch_Id in (select
	distinct Branch_Id from user_department where User_Id =",Login_Id_," and VIew_All=1))");
end if;

SET @query = Concat("select User_Details_Id,User_Details_Name  
from 
 user_details 
where DeleteStatus=0  ",User_Details_Name_," ",SearchbyName_Value,"
order by User_Details_Name asc Limit 5 ");
PREPARE QUERY FROM @query;
#select @query;


EXECUTE QUERY;


END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Work_History`(In RoleId_ varchar(100)
,Department_String varchar(1000),Fromdate_ date,
 Todate_ date,Login_User_Id_ int,
 Is_Date_Check_ tinyint,Branch_ int 
 )
BEGIN
#select 1;

declare Search_Date_ varchar(500);declare SearchbyName_Value varchar(2000);declare User_Type_ int;
set Search_Date_=''; set SearchbyName_Value='';
set User_Type_=(select User_Type from user_details where User_Details_Id=Login_User_Id_);
if Is_Date_Check_=true then
set Search_Date_=concat( SearchbyName_Value," and date(student_followup.Entry_Date) >= '", Fromdate_ ,"' and  date(student_followup.Entry_Date) <= '", Todate_,"'");
ELSE
set Search_Date_= "and 1 =1 ";
end if;
 if Branch_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and student_followup.Branch =",Branch_);
end if;
if User_Type_=2 then
 	SET SearchbyName_Value =concat(SearchbyName_Value," and student_followup.By_User_Id =",Login_User_Id_);
    else
    SET SearchbyName_Value =concat(SearchbyName_Value," and student_followup.By_User_Id in (select User_Details_Id from user_details where Branch_Id in (select
distinct Branch_Id from user_department where User_Id =",Login_User_Id_," and VIew_All=1))");
end if;
SET @query =concat ( "select count(Student_FollowUp_Id) as Data_Count,remarks.Remarks_Name as Remarks_Name,User_Details_Name
from student_followup
	inner join user_details on  user_details.User_Details_Id=student_followup.By_User_Id
    inner join Branch on Branch.Branch_Id= student_followup.Branch
    inner join Department on Department.Department_Id= student_followup.Department  ",Department_String,"
	left join remarks on remarks.Remarks_Id=student_followup.Remark_Id
	where student_followup.DeleteStatus=0   ",Search_Date_,SearchbyName_Value,"
	group by User_Details_Name,student_followup.Remark_Id
");


PREPARE QUERY FROM @query;
#select @query;

EXECUTE QUERY;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Work_report`(In RoleId_ varchar(100),Fromdate_ date,Todate_ date,Search_By_ int,
SearchbyName_ varchar(50),Department_ int,Branch_ int,By_User_ int,Is_Date_Check_ Tinyint,
Page_Index1_ int,Page_Index2_ int,Login_User_Id_ int,RowCount int ,RowCount2 int)
BEGIN
declare SearchbyName_Value varchar(2000);declare UnionQuery varchar(4000);declare Search_Date_ varchar(500);
declare Search_Date_union varchar(500);declare pos1frm int;declare pos1to int;declare pos2frm int;
declare pos2to int; declare PageSize int;declare User_Type_ int;
 set pos1frm=0;    set pos1to=0;    set pos2frm=0;    set pos2to=0;    set PageSize=10;
 set SearchbyName_Value='';
 set Search_Date_='';
 set User_Type_=(select User_Type from user_details where User_Details_Id=Login_User_Id_);
if(SearchbyName_ !='0') then
if Search_By_=1 then
SET SearchbyName_Value =   Concat( SearchbyName_Value," and student.Student_Name like '%",SearchbyName_ ,"%' ") ;
end if;
end if;
if Department_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.Department =",Department_);
end if;
if Branch_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and t.Branch_Id =",Branch_);
end if;
if By_User_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and Student_followup.By_User_Id =",By_User_);
end if;
if User_Type_=2 then
 	SET SearchbyName_Value =concat(SearchbyName_Value," and student_followup.By_User_Id =",Login_User_Id_);
else
    SET SearchbyName_Value =concat(SearchbyName_Value," and student_followup.By_User_Id in (select User_Details_Id from user_details where Branch_Id in (select
	distinct Branch_Id from user_department where User_Id =",Login_User_Id_," and VIew_All=1))");
end if;
if Is_Date_Check_=true then
set Search_Date_=concat( " and date(Student_followup.Entry_Date) >= '", Fromdate_ ,"' and  date(Student_followup.Entry_Date) <= '", Todate_,"'");
set Search_Date_union=concat( SearchbyName_Value," and  student.Entry_Date < '", Fromdate_,"'");
ELSE
set Search_Date_= "and 1 =1 ";
end if;
set UnionQuery="";
SET @query = Concat( "select student.Student_Name Student,student.Phone_Number Mobile,Branch.Branch_Name Branch,
(Date_Format(Student_followup.Next_FollowUp_Date,'%d-%m-%Y ')) As Follow_Up, (Date_Format(Student_followup.Entry_Date,'%d-%m-%Y   %h:%i')) As Entry_Date,
Department.Department_Name Department,Department_Status.Department_Status_Name Status,T.User_Details_Name Follow_Up_By,Touser.User_Details_Name as Assigned_To,
Student_followup.Remark
from student
	inner join student_followup on Student.Student_Id=Student_followup.Student_Id
	inner join Department on Department.Department_Id= Student_followup.Department
	inner join Department_Status on Department_Status.Department_Status_Id=Student_followup.Status
	inner join user_details as T on T.User_Details_Id=Student_followup.By_User_Id
    inner join Branch on Branch.Branch_Id= t.Branch_Id
    inner join  user_details as Touser on Touser.User_Details_Id =student.User_Id
	where student.DeleteStatus=0 and student_followup.Entry_Type =1 ",SearchbyName_Value," ",Search_Date_,"
	order by Student_followup.By_User_Id  ");

PREPARE QUERY FROM @query;
#select @query;

EXECUTE QUERY;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Search_Work_Summary`(In RoleId_ varchar(100),Fromdate_ date,Todate_ date,By_User_ int,Login_User_Id_ int,look_In_Date_Value tinyint,Branch_ int)
BEGIN
declare SearchbyName_Value varchar(2000);declare UnionQuery varchar(4000);declare Search_Date_ varchar(500);
declare Search_Date_union varchar(500);declare pos1frm int;declare pos1to int;declare pos2frm int;
declare pos2to int; declare PageSize int;declare User_Type_ int;
 set pos1frm=0;    set pos1to=0;    set pos2frm=0;    set pos2to=0;    set PageSize=10;
 set SearchbyName_Value='';
 set Search_Date_='';
 set User_Type_=(select User_Type from user_details where User_Details_Id=Login_User_Id_);
 if Branch_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and user_details.Branch_Id =",Branch_);
end if;
if User_Type_=2 then
 	SET SearchbyName_Value =concat(SearchbyName_Value," and student_followup.By_User_Id =",Login_User_Id_);
    else
    SET SearchbyName_Value =concat(SearchbyName_Value," and student_followup.By_User_Id in (select User_Details_Id from user_details where Branch_Id in (select
distinct Branch_Id from user_department where User_Id =",Login_User_Id_," and VIew_All=1))");
end if;
 if look_In_Date_Value=true then
	set Search_Date_=concat( SearchbyName_Value," and date(student_followup.Entry_Date) >= '", Fromdate_ ,"' and  date(student_followup.Entry_Date) <= '", Todate_,"'");
else	
set Search_Date_= "and 1 =1 ";
end if;
SET @query = Concat("select User_Details_Name To_Staff,T.Branch_Name Branch,count(student_followup.Student_Id) No_of_Follow_Up,User_Details_Id
from student_followup
	inner join user_details on student_followup.By_User_Id=user_details.User_Details_Id
    inner join branch on Branch.Branch_Id= student_followup.Branch
    inner join branch as T on T.Branch_Id=user_details.Branch_Id
    where student_followup.DeleteStatus=0 and Entry_Type =1 ",Search_Date_," ",SearchbyName_Value,"
    group by student_followup.By_User_Id
   order by User_Id , Branch ");
PREPARE QUERY FROM @query;
#select @query;


EXECUTE QUERY;


END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Send_Welcome_Mail`( In Student_Id_ int , User_Id_ int )
BEGIN
Declare Transaction_Id_ int;
    Declare Transaction_type_ int;
    set Transaction_type_=(select Transaction_TypeId from transaction_type where Type_Name='welcome mail' and DeleteStatus=0  );
insert into transaction_history(Transaction_Id,Entry_date,User_Id,Student_Id,Description1,Description2,Description3,Transaction_type)
    values (Transaction_Id_,now(),User_Id_,Student_Id_,'','','',Transaction_type_ );
    update student set Send_Welcome_Mail_Status=1 where Student_Id=Student_Id_;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SOP_Mode_Dropdown`()
BEGIN
select * from sop_mode;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Student_Login_Check`(in Email_ varchar(100),in Password_ VARCHAR(50))
BEGIN
SELECT Student_Id,Student_Name
From student 
 where 
 Email =Email_ and Password=Password_;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Student_Registration_By_Enquirysource`(In RoleId_ varchar(100),Fromdate_ date,Todate_ date,  Branch_  int,Is_Date_Check_ Tinyint,Login_User_Id_ int)
BEGIN
declare Search_Date_ varchar(500);
declare SearchbyName_Value varchar(2000);declare User_Type_ int;
set SearchbyName_Value='';
set Search_Date_='';
set User_Type_=(select User_Type from user_details where User_Details_Id=Login_User_Id_);
#set Search_Date_=concat( " and date(student.Next_FollowUp_Date) < '", Date_Format( Now(),'%Y-%m-%d'),"'" );
if Is_Date_Check_=true then
	set Search_Date_=concat(SearchbyName_Value, " and date(student.Registered_On) >= '", Fromdate_ ,"' and  date(student.Registered_On) <= '", Todate_,"'");
ELSE
	set Search_Date_= "and 1 =1 ";
end if;
if User_Type_=2 then
 	SET SearchbyName_Value =concat(SearchbyName_Value," and student.Registered_By =",Login_User_Id_);
    else
    SET SearchbyName_Value =concat(SearchbyName_Value," and student.Registered_By in (select User_Details_Id from user_details where Branch_Id in (select
distinct Branch_Id from user_department where User_Id =",Login_User_Id_," and VIew_All=1))");
end if;
if Branch_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and student.Registration_Branch =",Branch_);
end if;
SET @query = Concat( "select  Enquiry_Source_Name as Enquiry_source,Enquiry_Source_Id,Branch_Name Branch,count(student.Student_Id) as No_of_Registration
from student
where student.DeleteStatus=0 and student.Is_Registered=1 ",Search_Date_," ",SearchbyName_Value,"
group by student.Enquiry_Source_Id order by Branch");
PREPARE QUERY FROM @query;
#select @query;

EXECUTE QUERY;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Student_Registration_By_Enquirysource_Report`(In Fromdate_ date,Todate_ date,RoleId_ varchar(100),Department_String varchar(1000),Search_By_ int,
SearchbyName_ varchar(50),Department_ int,Branch_ int,Enquiry_Source_ int,Is_Date_Check_ Tinyint,
Page_Index1_ int,Page_Index2_ int,Login_User_Id_ int,RowCount int ,RowCount2 int)
BEGIN
declare SearchbyName_Value varchar(2000);declare UnionQuery varchar(4000);declare Search_Date_ varchar(500);
declare Search_Date_union varchar(500);declare pos1frm int;declare pos1to int;declare pos2frm int;
declare pos2to int; declare PageSize int;declare User_Type_ int;
 set pos1frm=0;    set pos1to=0;    set pos2frm=0;    set pos2to=0;    set PageSize=10;
 set SearchbyName_Value='';
 set Search_Date_='';
 set User_Type_=(select User_Type from user_details where User_Details_Id=Login_User_Id_);
if(SearchbyName_ !='0') then
	if Search_By_=1 then
	SET SearchbyName_Value =   Concat( SearchbyName_Value," and student.Student_Name like '%",SearchbyName_ ,"%'") ;
	end if;
end if;
if User_Type_=2 then
 	SET SearchbyName_Value =concat(SearchbyName_Value," and student.Registered_By =",Login_User_Id_);
    else
    SET SearchbyName_Value =concat(SearchbyName_Value," and student.Registered_By in (select User_Details_Id from user_details where Branch_Id in (select
distinct Branch_Id from user_department where User_Id =",Login_User_Id_," and VIew_All=1))");
end if;
if Department_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.Department =",Department_);
end if;
if Branch_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and  student.Registration_Branch =",Branch_);
end if;
#if By_User_>0 then
#SET SearchbyName_Value =concat(SearchbyName_Value," and student.Registered_By =",By_User_);
#end if;
if Enquiry_Source_>0 then
SET SearchbyName_Value =concat(SearchbyName_Value," and student.Enquiry_Source_Id  =",Enquiry_Source_);
end if;
if Is_Date_Check_=true then
set Search_Date_=concat( SearchbyName_Value," and date(student.Registered_On) >= '", Fromdate_ ,"' and  date(student.Registered_On) <= '", Todate_,"'");
ELSE
set Search_Date_= "and 1 =1 ";
end if;
set UnionQuery="";
SET @query = Concat( "select * from (select * from(select CAST(CAST(1 AS UNSIGNED) AS SIGNED)as tp,
(Date_Format(student.Registered_On,'%d-%m-%Y-%h:%i')) As Registered_On ,B.User_Details_Name Registered_By,student.Student_Name Student,
student.Phone_Number Mobile,D.Branch_Name Branch, (Date_Format(student.Next_FollowUp_Date,'%d-%m-%Y')) As Follow_Up_On,Department.Department_Name Department,
Department_Status.Department_Status_Name Status,T.User_Details_Name To_Staff,user_details.User_Details_Name As Created_By,
(Date_Format(student.Entry_Date,'%d-%m-%Y   %h:%i')) As Created_On,student.Remark,enquiry_source.Enquiry_Source_Name as Enquiry_Source
from student
inner join Department on Department.Department_Id= student.Department  ",Department_String,"
inner join user_details on user_details.User_Details_Id=student.Created_By
inner join Branch as D on D.Branch_Id= student.Registration_Branch
inner join Department_Status on Department_Status.Department_Status_Id=student.Status
inner join user_details as T on T.User_Details_Id=student.User_Id
inner join enquiry_source on enquiry_source.Enquiry_Source_Id= student.Enquiry_Source_Id
inner join user_details as B on B.User_Details_Id=student.Registered_By
where student.DeleteStatus=0    and student.Is_Registered=1  ",SearchbyName_Value," ",Search_Date_,"
and T.Role_Id in(",RoleId_,"))as lds )as ldtwo
order by tp ");
PREPARE QUERY FROM @query;
#select @query;inner join Branch on Branch.Branch_Id= student.Branch

EXECUTE QUERY;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Student_Registration_Summary`(In RoleId_ varchar(100),Fromdate_ date,Todate_ date,  Branch_  int,Is_Date_Check_ Tinyint,Login_User_Id_ int)
BEGIN
declare Search_Date_ varchar(500);
declare SearchbyName_Value varchar(2000);declare User_Type_ int;
set SearchbyName_Value='';
set Search_Date_='';
set User_Type_=(select User_Type from user_details where User_Details_Id=Login_User_Id_);
#set Search_Date_=concat( " and date(student.Next_FollowUp_Date) < '", Date_Format( Now(),'%Y-%m-%d'),"'" );
if Is_Date_Check_=true then
	set Search_Date_=concat(SearchbyName_Value, " and date(student.Registered_On) >= '", Fromdate_ ,"' and  date(student.Registered_On) <= '", Todate_,"'");
ELSE
	set Search_Date_= "and 1 =1 ";
end if;
if User_Type_=2 then
 	SET SearchbyName_Value =concat(SearchbyName_Value," and student.Registered_By =",Login_User_Id_);
    else
    SET SearchbyName_Value =concat(SearchbyName_Value," and student.Registered_By in (select User_Details_Id from user_details where Branch_Id in (select
distinct Branch_Id from user_department where User_Id =",Login_User_Id_," and VIew_All=1))");
end if;
if Branch_>0 then
	SET SearchbyName_Value =concat(SearchbyName_Value," and student.Registration_Branch =",Branch_);
end if;
SET @query = Concat( "select  Branch_Name Branch,User_Details_Name User,count(student.Student_Id) as No_of_Registration,Registered_By User_Details_Id
from student
where student.DeleteStatus=0 and student.Is_Registered=1 ",Search_Date_," ",SearchbyName_Value,"
group by student.Registered_By order by Branch,User_Id");
PREPARE QUERY FROM @query;
#select @query;

EXECUTE QUERY;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Subject_Typeahead`( In Subject_Name_ varchar(100))
Begin
 set Subject_Name_ = Concat( '%',Subject_Name_ ,'%');
select  Subject.Subject_Id,Subject_Name
From Subject
where Subject_Name like Subject_Name_  and Subject.DeleteStatus=false
order by Subject_Name asc  limit 5  ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Sub_Section_Typeahead`( In Sub_Section_Name_ varchar(100))
Begin
 set Sub_Section_Name_ = Concat( '%',Sub_Section_Name_ ,'%');
select  Sub_Section.Sub_Section_Id,Sub_Section_Name
From Sub_Section
where Sub_Section_Name like Sub_Section_Name_  and Sub_Section.DeleteStatus=false
order by Sub_Section_Name asc  limit 5  ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `University_Typeahead`( In University_Name_ varchar(100))
Begin
 set University_Name_ = Concat( '%',University_Name_ ,'%');
select  University.University_Id,University_Name
From University
where University_Name like University_Name_ and  University.DeleteStatus=false
order by University_Name asc ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `University_Typeahead_with_Level_Country`( In Country_Id int,Level_Detail_Id int ,University_Name_ varchar(100))
Begin
 set University_Name_ = Concat( '%',University_Name_ ,'%');
select  University.University_Id,University_Name
From University
where University_Name like University_Name_ and   University.Country_Id=Country_Id 
and University.Level_Detail_Id=Level_Detail_Id and University.DeleteStatus=false
order by University_Name asc ;
 End$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_Student`( In Student_Id_ int,Agent_Id_ int,Student_Name_ varchar(50),
Last_Name_ varchar(50),Address1_ varchar(50),Address2_ varchar(50),
Pincode_ varchar(7),Email_ varchar(100),Phone_Number_ varchar(25),
Promotional_Code_ varchar(50),Student_Status_Id_ int,Password_ varchar(20))
Begin 
 if  Student_Id_>0
 THEN 
 UPDATE Student set Student_Name = Student_Name_ ,Last_Name = Last_Name_ ,Agent_Id=Agent_Id_,
Address1 = Address1_ ,Address2 = Address2_ ,Pincode = Pincode_ ,Email = Email_ ,
Phone_Number = Phone_Number_ ,Promotional_Code = Promotional_Code_ ,
Student_Status_Id = Student_Status_Id_ ,Password = Password_  
Where Student_Id=Student_Id_ ;
ELSE 
 SET Student_Id_ = (SELECT  COALESCE( MAX(Student_Id ),0)+1 FROM student); 
  INSERT INTO Student(Student_Id , Agent_Id, Entry_Date,Student_Name ,Last_Name ,Gender ,  Address1 ,
  Address2 ,Pincode ,Email ,Phone_Number ,Dob ,Country ,Promotional_Code ,Student_Status_Id ,Password,DeleteStatus ) 
  values (Student_Id_ ,Agent_Id_,now(),Student_Name_ ,Last_Name_ ,0 ,Address1_ ,
Address2_ ,Pincode_ ,Email_ ,Phone_Number_ ,now() ,0 ,Promotional_Code_ ,1 ,
Password_,false );
End If ;
select Student_Id_;
END$$
DELIMITER ;
