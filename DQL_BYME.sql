#SQL quaries on data base company_db

# 1. Select quary
# select all the columns in the table employee
select * from employee;


# get all the detail department
select * from department;

#select fname and salary in employee
select fname,salary,dno from employee;

#select dname and dnumber in department table
select dname,dnumber from department;

#select Distinct i,e select unique values from column from dno from employee
select distinct dno,sex from employee;

# i want distict relationship  values from dependent table
select distinct relationship from dependent;

# aliases
# Retrive first name and last name of all Employee using alias
-- 1.
select fname as first_name 
from employee;

-- 2.
select fname first_name
from employee;
select lname as last_name 
from employee;

# WHERE


# using where clause retrive the information 
# retrive the details of all female employee
select *
from employee
where sex = 'f';

#retrive the table with project location as houston
select * 
from project 
where plocation='houston';

# Retrive details of all employee who draw a salary which is at least 30000
select * 
from employee
where salary>=30000;


#AND
select *
from employee
where sex = 'm' and dno = 5;

#NOT (!,<>)
select * from employee
where  dno <> 5;

select * from employee
where sex = 'm' and dno = 5 and super_ssn <> '888665555';

select * from employee
where dno = 1 or dno = 5;



# Beteween

# get fname and salary of getting between 20k to 30k
select * from employee
where salary between 20000 and 30000;

#get working between 30 to 40 hours
select * from works_on
where hours between 30 and 40;

# get details of employee whose pno = 10 and working hours between 10 to 30 hours
select * from works_on
where pno = 10 and hours between 10 and 30;

# LIKE
# Display employee 
select fname
from employee
where fname like 'f%';

#  IN  and NOT IN operator
 # dno in 4 and 5
 select * from employee
 where dno = 4 or dno = 5;
 
 select * from employee 
 where dno in (4,5,1);
 
 #1,2,3,30,10 - detail works on table who working for pno 1,2,3,30,10
 select * from works_on
 where pno  in (1,2,3,30,10);
 
 # between
 select * from employee
 where salary between 30000 and 40000;
 
 # get the all the details of the project where project name is poject x and poject y
 select  pname from project
 where pname in ('ProductX , ProductY');
 
 
 # NULL 
 
 # super_ssn is null
 select * from employee
 where super_ssn is  null;
 
 select  essn from works_on
 where essn is  not null;
 
 # Order by clause
 # fname and salary
 select *
 from employee
 order by salary desc;
 
 
 # top three salary making people as ouptput -- limit interview question
 -- use order by salary (asc,dsc)
 select * from employee
 order by salary desc
 limit  3;
 
 select * from employee
 limit 2;
 
 select * from employee
 where dno = 5
 order by salary desc limit 3;
 
 select * from employee
 order by salary
 limit 3;
 
 # get details of person who is getting third highest salary 
 # aws top and bottom 
 select * from employee
 order by salary desc 
 limit 2,1;
 
 
 
 
 
 #Like
 # get project names ,dno which has got ctx and ctv in their project name
 select pname,dnum from project
 where pname like '%ctx%' or pname like '%cty%';
 
 # aggregation function
# display the female employee with min sal
select min(salary)  * max(salary)  dummycol
from employee; 

select min(salary) 
from employee
where sex='f';

# min hours in works_on 
select min(hours) from works_on;

# what is max salary in employee table
select max(salary) from employee;

# count
# count the no of female employee 
select count(*),count(ssn),count(distinct ssn) as unq from employee
where sex = 'F';

# get count of total supervisors and unique supervisor
select count(super_ssn),count(distinct ssn) as unq from employee;

#get no of employee belongs to project no 1 - works_on table
select count(distinct essn) total from works_on
where pno = 1;

#get the total number of projects in works on table  out of which how many of them are unique
select count(distinct essn) as unq from works_on;

#sum
#sum the overall salary of male employee who belongs to dno 4
select sum(salary) as total,count(ssn) num
from employee 
where sex = "m" and dno = 5;

#get total working hours for essn = 999887777 and project 10
select sum(hours) as total
from works_on
where essn = '999887777' and pno = 10;

# AVG
## Display the average project hours avg() ,  round()
select avg(hours) 
from works_on;

select round(avg(hours),2)average 
from works_on;

#Display the ssn and fully concatenated name of all employee
-- use CONCAT function as in concate(fname,' ',minit,' ',lname)

select concat(fname,' ',minit,' ',lname) fullname 
from employee;

#date function 
#year(),month(), and day()
select bdate, year(bdate) year_bdate ,
month(bdate) month_bdate ,
day(bdate) day_bdate from employee;

# Group by
 # display the no of employees female in each department (group by dno)
select dno,count(ssn) as total , sum(salary) total_sal
from employee 
where sex = "f"
group by dno
order by total desc;

# get the avg working hours per each of the employee present in works on table
select essn, sum(hours) as total
from works_on
group by essn
order by total desc
limit 3;

select sex,sum(salary) as total
from employee
group by sex
order by total;

# display the no male employee in each department
   select dno,sex, count(ssn) as num
   from employee
   where sex = "m"
   group by dno;

# get total working hours of employee based on employee and pno 
select essn,pno,sum(hours) as total
from works_on
group by essn,pno;

# get no of dependends per each employee in the company   
select essn,count(*)
from dependent
group by essn;




## display the avg salary of employee (department wise and gendr wise)
select dno,sex,avg(salary)
from employee
group by dno,sex;



# practice 
select count(essn) as total
from works_on
where pno = 1;

select count(distinct pno) as unq
from works_on;

select sum(salary) as total
from employee
where sex = 'm' and dno = 4;

select sum(hours) as total 
from works_on
where essn = '999887777' and pno = 10;


select round(avg(hours),2) as avg_hours
from works_on;

# display the no of employees female in each department (group by dno)
select dno, count(*) as female, sum(salary) as total
from employee
where sex = 'f'
group by dno
order by total desc
limit 1;



select essn, sum(hours) as total
from works_on
group by essn
order by total desc
limit 3;

select sex, sum(salary)  as total
from employee
group by sex
order by total;

select dno,sex,avg(salary)
from employee
group by dno,sex;

select dno,sex ,count(ssn)
from employee
where sex = 'm'
group by  dno;

select plocation,count(*)
from project
group by plocation;

select essn, sum(hours) as total
from works_on
group by essn
order by total desc
limit 2;

select essn,count(*) as total
from dependent
group by essn;

# HAVING CLAUSE APPLIED ON AGGRIGATED values
# Display the dno of those departments that has 4 employee
select dno,count(ssn) as num
from employee

group by dno
having num = 4;

#
select dno,sum(salary) as total
from employee
group by dno
having total = 55000;

select essn, sum(hours) as total_hours
from works_on
group by essn
having total_hours>25;

#interview display the duplicates records
#display duplicate ids(super_ssn) in employee table based on id(super_ssn)
select super_ssn,count(super_ssn) as id
from employee
group by super_ssn
having id>1;

# joints
#inner joint
#inner join the two tables employee and department
select *
from employee
right join dependent
on employee.ssn=dependent.essn;

#small variation to the above query to write it optimistically
select * 
from dependent as d
right join employee as e
on d.essn=e.ssn;

# right join
select * 
from employee e
right join works_on w
on e.ssn=w.essn;

select d.*,e.salary,e.dno,dep.dname
from dependent d
join employee e 
on d.essn=e.ssn
join department dep
on e.dno=dep.dnumber ;


#Temporary table creation
drop table if exists temp_1;
create table temp_1 as
select d.*,e.salary
from dependent d
join employee e
on d.essn=e.ssn
join department dep 
on e.dno = dep.dnumber;

# get the names and salary of employee who  belongs to research department
select e.fname,e.salary,d.dname,e.dno
from employee e
join department d
on e.dno = d.dnumber
where dname = 'research';

# get total salalry and total working hours of all the employee
select e.ssn,sum(e.salary),sum(w.hours)
from employee e
join works_on w 
on e.ssn=w.essn
group by ssn;


# get first name of employee whose total working hours is greater than 35hours
select e.fname,sum(w.hours) hours
from employee e
join works_on w 
on e.ssn=w.essn
group by e.fname
having  hours > 35;


#get names of employee and dependents  also filter only male dependent
select  d.sex,e.ssn
from employee e
join dependent d
on e.ssn=d.essn
where sex = "m";

#get project names which  has working hours between 10 to 20
select w.hours,p.pname
from project p
join works_on w
on p.pnumber=w.pno
where hours between 10 and 20; 

#Union
select fname,ssn,sex from employee
where sex = "f"
union  
select fname,ssn,sex from employee
where sex = "m";

# sub queries
#Display the fname and salary of employee whose salary 
-- is more than the average salary of all the employee
# BY NORMAL METHOD
select round(avg(salary),1) from employee;
-- 35125
select fname,salary
from employee
where salary>35125;

#BY sub query
select fname,salary
from employee 
where salary>(select avg(salary) from employee);


# display the fname of employee working in the research department - use sub query
select fname,dno
from employee
where dno = (select dnumber from department where dname = "research");

# get count of persons of who are in employee table are also in dependent table - (imp)
select count(ssn) as total
from employee
where ssn in (select distinct essn from dependent );

# get fname  of those employees whose pno=10,1,2,3 and their working hours is greater than 20hours
select fname 
from employee
where ssn in (select essn from works_on where hours > 20 and pno in (10,1,3));


-- window function
# ranking function in sql
# rank
# rank each employee based on salary
select
    fname,
	sex,
    salary,
    rank () over (
    order by salary desc
    ) rank1
    from 
    employee;
    
    # assignment rank working hours of each employee in works on table
    
    
    # partitioning rank by dno
    select 
      fname,
      sex,
      salary,
      dno,
      rank () over (
        partition by dno
        order by salary desc
        ) price_rank_bydno
        from 
        employee;
        
       select 
      fname,
      sex,
      salary,
      dno,
      dense_rank () over (
        partition by dno
        order by salary desc
        ) price_rank_bydno
        from 
        employee;     
# Lead
select 
fname,
ssn,
salary,
lead(salary,1) over (
  order by salary desc
  ) next_person_salary
   from
   employee;
   
   
   # Lead
select 
fname,
ssn,
salary,
lag(salary,1) over (
  order by salary desc
  ) next_person_salary
   from
   employee;
   
   # View (temporary table stored in database  to reuse)
   create view first_view as
   select
    fname,
	sex,
    salary,
    rank () over (
    order by salary desc
    ) rank1
    from 
    employee;
    
    
    # replacing the present view
    # dropping the present view
    
    
    # case statement
    select salary,fname,
    case
       when salary > 30000 then " the salary id greater than 30k"
       
       # create new col where dno = 1 as abc,dno = 4 xyz, dno = 5 then none
        # date queries 
   
















 
 



