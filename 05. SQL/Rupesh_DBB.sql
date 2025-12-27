#########################   04//05  #######################
show databases;	

create database Rupesh_DB;

create table pet(pet_name varchar(20),
				 owner_name varchar(20),
                 age int,
                 sex char(1),
                 DOB date);

use rupesh_db    /*this use to select the database. or else you can 
					just double click on the database name in the DB lists.
					if it bold then it means, that DB is Selected.*/

describe pet;  #it shoen the created table. #to check the table 

#drop table pet;   #it drop the table. if it drop then you have to create the table again.

rename table pet to petss;   #It rename the name of table from pet to petss in DB.

describe petss;

#We insert the data with coloum name.
INSERT INTO petss (pet_name, owner_name, age, sex, DOB)   #Insert the values as per order in the table petss
VALUES
('Tommy', 'Rupesh', 5, 'M', '2020-10-10'),	#itmes as per order for table petss.
("BELLA", "Rupess", 1, "F","2018-10-20");

#We insert the data without coloum name.  but for that you have to knows the coloum suquence of table.

insert into petss values("DJ","Siddhu",55, "F","1234-11-09");    #Without coloum name.alter

select * from petss;   #Shown All the data from the table.

truncate table petss;	#Truncate delete all the data in one shot. clear all the data from the table.
						#The table is drop and table is recreated., You can not get back the data.
                        #TRUNCATE हा command पूर्ण टेबलमधील सर्व  data delete करतो,  पण टेबलची structure (columns वगैरे) ठेवतो. 

SET SQL_SAFE_UPDATES = 0;

insert into petss values("DJ","Siddhu",55, "F","1234-11-09");
insert into petss values ("ABC", "Pappu", 23,"M","2000-03-09");
insert into petss values ("XYZ", "Raj",45,"M","4355-07-10");

update petss set owner_name= "Raj" where pet_name="XYZ";
update petss set owner_name= "ABCD" where pet_name="Pappu";

delete from petss where sex="F";	#where is the sex F that will row remove.

grant all on tablename to username;		#दुसऱ्या user ला permission (privilege) देण्यासाठी वापरले जाते.

revoke all on tablename to username;	#आधी दिलेल्या permission परत घेण्यासाठी वापरले जाते.

select * from petss;	#Shown the table and the data of ther table.alter


#########################   10//05  #######################

		-- NOT NULL CONSTRAINT
	#कॉलम रिकामा ठेवता येत नाही. जर तू त्या कॉलमसाठी value दिली नाही, तर SQL error देईल.
    
create table Persons (ID int Not Null,
LastName varchar (255) ,
FirstName varchar(255) ,
Age int);

describe Persons;

insert into persons (ID, LastName, FirstName, Age) values (1, "Desai","Rupesh",25);	# (ID int Not Null if we type this then we have to enterd the ID complasory, or else we get the error. Here 1 is ID
insert into persons (ID, LastName, FirstName, Age) values (10, "D","R",5);	#Here 10 is ID

		-- UNIQUE CONSTRAIN
        #त्या कॉलममधल्या  values unique (एकमेव) असायला हव्यात.

create table Person1 (ID int unique,
LastName varchar (255) not null,
FirstName varchar (255) not null,
Age int);

insert into person1 (ID, LastName, FirstName, Age) values (87, "Desai","Rupesh",25);	# (ID int unique, here 87 is ID
insert into person1 (ID, LastName, FirstName, Age) values (33, "G","Rupss",2);	#Here 33 is ID and that is unique.
insert into person1 (ID, LastName, FirstName, Age) values (33, "R","R",25);	#Here 33 is ID and that is not unique, so it give us error.

SELECT * FROM Person1;
#TRUNCATE TABLE person1;

					-- -- Primary key
        -- Unique + Not Null.
        #Any table can have only ONE primary key.

create table person2 (ID int primary key, 	# ID duplicate नसावा,  id रिकामा (NULL) ठेवता येत नाही
LastName varchar (255) not null,
FirstName varchar (255) not null,
Age int);

describe person2

insert into person2 (ID, LastName, FirstName, Age) values (7, "Desai","Rupesh",25);	# (ID int unique & primary, here 7 is ID
insert into person2 (ID, LastName, FirstName, Age) values (11, "G","Rupss",2);	#Here 11 is ID and that is unique and primary.
insert into person2 (ID, LastName, FirstName, Age) values (7, "Desai","Rupesh",25);	# (ID havde to unique and primary here 7 is ID which is alredy taken form 1 row.


create table person3 (ID int, 
LastName varchar (255)  primary key,
FirstName varchar (255) not null,
Age int);

insert into person3 (ID, LastName, FirstName, Age) values (1, "Desai","Rupesh",25);	# (Here LastName is unique & primary, here "Desai" is primary key
insert into person3 (ID, LastName, FirstName, Age) values (2, "Desai","Rupesh",25);	# thats why we`ll get the error here because we use the "desai" name  as a last name.
insert into person3 (ID, LastName, FirstName, Age) values (2, "Rupesh","Desai",25);	# here last name is Rupesh and  FIrstName is Desai, so, we dident get any error.

select * from person3

		-- CHECK Constraints.
        -- Only works in newer versions
        
CREATE TABLE person4 (
	id int primary key,
	FristName VARCHAR (50),
	age int CHECK (Age >= 18)
);

insert into person4 values (1, "Rupesh", 45);	#✅ Works fine
insert into person4 values (3, "R", 5); 	# ❌ Error: CHECK constraint fails, Age is less thenn  5

select * from person4



		-- DEFAULT Constraints
        -- जर value दिली नाही, तर default value आपोआप टाकतो.
        -- more then one default value can be added.
        
CREATE TABLE person5 (
	ID int primary key,
    LastName varchar(255) not null,
    FirstName Varchar(255),
    Age int default 20);   

insert into person5 values (1, "Desai", "Rupesh", 20); 	#here i provied all the values.
insert into person5 values (2, "Desai", "Rupesh", 22); 	#here i declre age = 22 so it shown age = 20 he dosent give default value. (eg.. 20)
insert into person5 (ID, LastName, FirstName) values (3, "D", "R"); 	# if you want to give default value then you have to specify column names 

select * from person5

		-- ENUM constraints.
        -- You’re creating a column where users can only select one value from a specific list.
        -- for example: "Male", "Female", "Other".
        
create table person6(
	ID int,
    LastName Varchar(250) Not null,
    FirstName varchar (250) not null,
    Age int,
    gender enum ('Male','Female','Others')
);

select * from person6


insert into person6 values (1, "Desai","Rupesh",20, "Male");
insert into person6 values (2, "D","R",20, "female"); 	#if you enter anything except Male, female, or other then it will give error.


		-- FOREIGN KEY
		-- एका टेबलचा कॉलम दुसऱ्या टेबलच्या primary key शी जोडतो.  यामुळे relationship तयार होते (one-to-many, many-to-one).

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

















