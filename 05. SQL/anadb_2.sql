#################     10/05		#######################

select * from myemp;

select * from myemp limit 5;  #it give only 5 row.

select emp_id,first_name,last_name,salary,salary+5000 as "Bonus" from myemp;		#here we add 5k and add into table as a new coloum  namede "coloum". 

select emp_id,first_name,last_name,salary,salary+ (15*SALARY/100) as "Salary + 15%" , (15*SALARY/100) as "15%"  from myemp;


#################     11/05		#######################
		#comparision oprators madhe "where" statment use kel pahije, tarch proppper ans yeil.
        
select emp_id,first_name,salary, salary>10000 as "high" from myemp;	 #it give 0 or 1
	# in comparision opratiorss when the condition is statify, then it give additionl coloum with 1 or 0 value.
    #indicates that true and false respective.

select emp_id,first_name,salary from myemp where salary>10000 ;	 # this give you only name whos salary > 10000
	
	# <> and != are NOt equal to.

		# LOGICAL OPRATORS.
        
select emp_id,first_name, last_name,salary, DEP_ID from myemp WHERE DEP_ID IN (60, 90, 110) AND salary > 10000;	

select emp_id,first_name, last_name,salary, DEP_ID from myemp WHERE salary between 10500 and 11000;

		#	AND --> Both match						Both conditions must be true
        #	OR --> Either one match						Any one condition true
        #	IN --> One of the listed values, 		Cleaner multiple OR
        #	BETWEEN --> BETWEEN is includes both ends. 


		# LIKE oprator. also known as Pattern matching oprators
        # The LIKE operator in SQL is used to search for a specific pattern in a column’s text (string) data.
        # LIKE is case-insensitive in MySQL by default (but case-sensitive in some other databases like PostgreSQL).
        
select emp_id, first_name, last_name from myemp where first_name = "Lisa";


		# to filter the text data you can use the Like oprators.
        # 'A%' → anything starting with A
        
select emp_id, first_name, last_name, SALARY, HIRE_DATE from myemp where FIRST_NAME like "___n";		# ___ (3)  UNDERSCOARE SPACE NANNTR N ASNARE NAME DENAR.

select emp_id, first_name, last_name, SALARY, HIRE_DATE from myemp where FIRST_NAME like "R%";  	# R PASUN START  HONARE NAME DENAR.


			#	Ascending and Descending.
            #	Ascending (ASC) 
            #	Descending (DESC)
            #	If you don’t specify ASC or DESC, SQL assumes ASC by default.
            
select emp_id,first_name,salary from myemp where salary>10000 order by SALARY asc ;	

select emp_id,first_name,salary from myemp where salary>11000 order by SALARY desc ;	


	# $$$$$$$$$$$$$$$  FUNCTION   $$$$$$$$$$$$$$$$$$$$

	# text function. 
    
select first_name, upper(first_name), lower(first_name), length(first_name),left(first_name,3),
right(first_name,4),mid(first_name,2,3), substr(first_name,2,3),concat(first_name," ",last_name) from myemp


	#Replace funcrion --> it is case sensitive. 
    # REPLACE() function in SQL is used to search for a substring inside a text (string) and replace it with another substring.

select first_name, replace (first_name, "al", "SQL") from myemp;

		# Date and time function
        
select current_date();
select current_time();
select current_timestamp();
select datediff (current_date(),"2000-10-20");


select sqrt(25); 	#Squroot finds

	#How to remove duplicates.
    
select dep_id from myemp;		#give dupkicate also.

select distinct dep_id from myemp;		#Remove duplicates.

		#whenever you want to filter a data based on the calculations, use having.
select distinct dep_id,sum(salary) as "Total_sal" from myemp group by DEP_ID having sum(salary) >100000;

		# *WHERE
        # used to filter that data, used before grouping. used to point out the data.
		# *HAVING
        # to filter calculations, usded aftwer grouping, will not work without grouping. 
 
 /* select statement			#डेटा fetch करण्यासाठी वापरतो — म्हणजे काय-काय columns पाहायचे ते सांगतो.
	where statement			# डेटा filter करण्यासाठी वापरतो — condition लावायला.
	group by statement			#डेटा group करून aggregate functions (SUM, COUNT, AVG, MAX, MIN) वापरतो.
								हे reports आणि summaries बनवण्यासाठी वापरलं जातं
    having statement			#HAVING हा WHERE सारखाच आहे, पण GROUP BY नंतर use होतो.
								( कारण aggregate values वर WHERE काम करत नाही )
    order by statement 			#डेटा sort करण्यासाठी वापरतो — ascending (ASC) किंवा descending (DESC). */


################################################################################

/*	Joints
	Set Oprations
    Sub Quries
    Case statmrnts.
    Ranking Functions /*
    
#	JOINTS.
		Join म्हणजे दोन किंवा जास्त tables connect करून एकाच result मध्ये data आणणं —
		जेव्हा त्या tables मध्ये काही common column (like ID, customer_id, emp_id) असतो.

		#Ex:-

select * from movies;
select * from members;

	#Inner Join -- Only matching rows
select  id, title,category,first_name, last_name
from movies
inner join
members
on movies.id=members.movieid;

	#Left Join -- All left + matching right, जर match नसेल, तर NULL दाखवतो.
    #ifnull--> if you want to hide null values

select  id, title,category, ifnull(first_name,id), last_name
from movies
left join
members
on movies.id=members.movieid;

	#Cross join--it is the only type of join,
       which will help you to join 2 tables without any commmon Coloum. 

select * from meals;
select * from drinks;

select mealname,meals.rate,drinkname,drinks.rate from meals
cross join drinks;

	#Self join.
    #Same table join, when you compare data within the table. 
    
select tbl1.first_name,tbl1.last_name,tbl2.first_name,tbl2.last_name
from myemp as tbl1
join
myemp as tbl2
on tbl1.mgr_id = tbl2.emp_id;
#where tbl1.mgr_id = 108;


##################################	17-05	###########################################
							     SET OPRATIONS.

		# UNION ALL → Combines all rows (including duplicates)
        
select * from myemp where dep_id in (90, 60)
union all
select * from myemp where dep_id in (100, 90);

			UNION → Combines all unique rows (No Duplicates)
            
select * from myemp where dep_id in (90, 60)
union
select * from myemp where dep_id in (100, 90);

			EXCEPT / MINUS → Returns rows from the first query that are not in the second

select * from myemp where dep_id in (100,90,80,110,70)
except
select * from myemp where dep_id in (100,90,80);

			INTERSECT → Returns only common rows
            
select * from myemp where dep_id in (60,90)
intersect
select * from myemp where dep_id in (100,90);


##################################	Sub- Quries	###########################################

select * from myemp
where salary<(select salary salary from myemp where first_name="Lisa");

select max(salary) from myemp;
select max(salary) from myemp where salary<(select max(salary) from myemp);
select min(salary) from myemp;


##################################	Case- Statement ###########################################

select emp_id,first_name,Last_name,Salary,dep_id,
case
when dep_id=110 then "Accounts"
when dep_id=100 then "Finance"
when dep_id=90 then "mANAGEMENT"
when dep_id=80 then "Sales"
when dep_id=70 then "Public relations"
when dep_id=60 then "IT"
when dep_id=40 then "HR"
when dep_id=20 then "Marketing"
else "Others" end as "Dep_Name"
from myemp;


*/ | Keyword  | Purpose                                   |
| -------- | ----------------------------------------- |
| CASE** | Starts the conditional block              |
| WHEN** | Specifies the condition                   |
| THEN** | Gives the result if the condition is true |
| **ELSE** | Optional, gives default value             |
| **END**  | Ends the CASE block                       

##################################	Windows Function ###########################################
		# Rank function
	# If two or more rows have the same value, they get the same rank,
		# but the next rank(s) are skipped.
from myemp;

select emp_id,First_name, Last_name,salary,
rank() over(order by salary) as "Rank" from myemp;

		# Dense Rank.
        # Same as RANK(), but it does not skip ranks after ties.
        
select emp_id,First_name, Last_name,salary,
dense_rank() over(order by salary desc) as "Dense_Rank" from myemp;

		# Partitation By

select emp_id,First_name, Last_name,salary,dep_id,
rank() over(partition by dep_id order by salary) as "Rank" from myemp;

		#	percent rank
        
select emp_id,First_name, Last_name,salary,dep_id,salary,
percent_rank() over(order by salary) as "Percent_Rank" from myemp;

		# Row Number

select emp_id,First_name, Last_name,salary,dep_id,salary,
row_number() over(order by salary) as "Row_Number" from myemp;

	#	N- tile Functioin

select emp_id,First_name, Last_name,salary,dep_id,salary,
ntile(10) over(order by salary) as "Num_of_grps" from myemp;

	#LEAD()
 
select emp_id,First_name, Last_name,salary,dep_id,salary,
lead(FIRST_NAME,2,"No data") over(order by salary) as "Lead" from myemp;

 	#lag()
 
select emp_id,First_name, Last_name,salary,dep_id,salary,
lag(FIRST_NAME,3,"-") over(order by salary) as "lag" from myemp;

	#first_value

select emp_id,First_name, Last_name,salary,dep_id,salary,
first_value(emp_id) over(order by salary) as "first_value" from myemp;

	#last_value

select emp_id,First_name, Last_name,salary,dep_id,salary,
last_value(emp_id) over(order by salary) as "last_val" from myemp;

	#Nth_value

select emp_id,First_name, Last_name,salary,dep_id,salary,
nth_value(emp_id,5) over(order by salary) as "Nth_value" from myemp;

 ########################################	 18-05	####################################################

		#Indexing in SQL

		# Stored objects
        
				#View
create view emp_details as (
select first_name,last_name,dep_id,salary from myemp );

select * from emp_details;

select * from authors;

create view aut_view as 
(select * from authors where AuthorId <= 10);

select * from aut_view;

insert into aut_view values (12,"Rupesh"); #we`re trying to insert id = 12 where as our conditiobn id  == 10

select * from aut_view; # as our condition if the data is under 10 then it will insrert in the Aut_view 

select * from authors; # # as our condition if the data is over 10 then it will insrert in the main table Authors. 

		# Procedures
        
call anadb.Veriable_procedure();

#############################   25/5 
# Error Handling.
# USe Err_Hand procedure.
# excute this then apply bellow steps. 
describe payments;

insert into payments values (1, 1000);
insert into payments values (5, 2000);
select * FROM payments;

select * from fraud;

#################  FUNCTIONS.

select * from myemp;

select emp_id, first_name, last_name,hire_date,
experience(emp_id) as "No of years" from myemp;	#here "experience(emp_id)" is the function.

set global log_bin_trust_function_creators = 1; # run this command before saving the function query. basically, this unlock chaild locl to create user defined function.

SELECT area(5) AS Area;

#########################  Triggers   31/5

select * from books;
select * from book_sales;

alter table books add column sales int default 0;
 # for bellow this you have to write triggers, and ten run this line, it will affect on the table i.e. store_sales.
 # for chechking run the book_sales line. (336)
update books set sales = sales + 1 where bookid = 1;
update books set sales = sales + 1 where bookid = 3;
update books set sales = sales + 3 where bookid = 6;








 








 
 
 
 
 
 
 
 
 
    

