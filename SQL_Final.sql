#-------------> 31/08/2026
show databases;
# create databases
create database final;
# use databases
use final;

create table t1 (name varchar(20),
id int,
city varchar(10));

select * from t1; 

insert into t1 values("vijay",12,"pune");

create table t2 (name varchar(20) not null,
id_f int);

insert into t2 values("null",123);
select * from t2;

insert into t2 values(null,123);

# --------->1/09/2026
use final;

create table t3(id int unique,
name varchar(29));

insert into t3 values(12,"vj"),
(null,"rj");

select * from t3;


create table t4(id int,
name varchar(29) primary key);

insert into t4 values(12,"vj"),
(null,"rj");

insert into t4 values(13,"vj");

select * from t4;

-- check
create table t5(n1 varchar(20),
age int check(age>18));

insert into t5 values("vijay",19);

select * from t5;

create table shirt(brand varchar(30),
size enum("m","l"));

insert into shirt values("westside","l");
select * from shirt;

create table t6(city varchar(20),
country varchar(20) default "india");

insert into t6 values("pune",country);
insert into t6 (city) values("mumbai");

insert into t6 values("pune","pak");

select * from t6;

-- foreign key
create table dept(
dept_id int primary key ,
dep_name varchar(20) );

insert into dept values(101,"vijay"),
(102,"raj"),
(103,"raju");

select * from dept;

create table emp(
emp_id int primary key,
f_name varchar(20) not null,
l_name varchar(20) not null,
age int check (age>19),
salary int not null,
u_id int ,
doj varchar(20) default "2025-10-07",
foreign key (u_id) references dept(dept_id));


insert into emp(emp_id,f_name,l_name,age,salary,u_id) 
values
(1,"vj","takmoge", 24,123123,102),
(2,"az","patil",23,23222,103);

select * from emp;

create table e1(id int primary key,
name1 varchar(10),
age int ,
location varchar(10));

insert into e1 values(15,"vijay",25,"tuljapur"),
(16,"raju",26,"mumbai"),
(17,"raj",27,"pune");

select * from e1;

update e1 
set age=26
where id =15;

create table e2(id int primary key,
name1 varchar(10),
age int ,
location varchar(10),
salary int);

insert into e2 values(12,"vijay",25,"tuljapur",35000),
(13,"raju",26,"mumbai",45000),
(14,"raj",27,"pune",55000);

select * from e2;

update e2
set salary =85000
where id=12;

update e2
set salary=salary+(salary*.10)
where id in (12,13,14);

select * from e2;

alter table e2 drop location;
truncate table e2;
drop table e2;


create table e3(id int primary key,
name1 varchar(10),
age int ,
location varchar(10));

insert into e3 values(1,"vijay",25,"tuljapur"),
(2,"raju",26,"mumbai"),
(3,"raj",27,"pune");

select * from e3;
alter table e3 add column salary int;
alter table e3 modify location char(49);

describe e3;

alter table e3 rename column location to place;
alter table e3 rename emp_3;
select * from emp_3;


create table emp1 (id char(10) primary key,
name1 varchar(20) not null,
aadhar_number int unique,
age int check (age>18),
country varchar(29) default "india");

insert into emp1 values ("E123","raj",234,26,country),
("E124","raju",456,null,country);

insert into emp1 values("E12","raju",235,null,country);

select * from emp1;

select * from emp1 where age is null;
select * from emp1 where age is not null;
   
   CREATE TABLE m1 (
    mobile_no VARCHAR(10),
    CHECK (LENGTH(mobile_no) = 10)
);

insert into m1 values("1234567899");

insert into m1 values("12345678901");

select * from m1;

create table r1(id int primary key auto_increment ,
name1 varchar(10));

select * from r1;
insert into r1 values(1,"vijay");
insert into r1 values(id,"raju");

create table t10(id int primary key auto_increment,
name12 varchar(20)) auto_increment=100;

insert into t10 values(id,"raju");
select * from t10;

# ------------> 2/9/2026
use final;

create table emp_details2(
emp_id int,
emp_name varchar (20),
mobile_no bigint check (mobile_no between 1000000000 and 9999999999));

insert into emp_details2 (emp_id,emp_name,mobile_no)values
(123,'vijay',1111111111),
(124,'anand',1222222222),
(125,'prashant',1333333333),
(126,'raj',1444444444),
(126,'raj',1444444444);

select * from emp_details2;


# -- check content for new table
# RND -->Research and developement
# ADMIN--> administrative spend
# MKT --> market spend

select * from startups;
select rnd from startups;

select distinct(state) from startups;
#-- 6. Find out startups which belong to New York

select * from startups where state="new york";

#7.Find out startups whose profit more than 150000
select * from startups
where profit>150000;

#8.Find out startups whose profit is in between 1 lakh and 1.5 lakh 
select profit from startups
where profit>100000 and profit<150000;

# 9. Startup State is california or florida 
select * from startups where state in("california","florida");

# 10. Not equal to new york
select * from startups
where state not in ("new york");

select * from startups
where not state="new york";

select * from startups
where state!="new york";

select * from startups
where state <> "new york";

#  11. Find out startups whose profit is in between 1lakh to 1.5 lakh 
# and state is California or New York 
select * from startups
where (profit >100000 and profit<150000)
and (state = "california" or state = "Florida");

select state,profit from startups
where (profit >100000 and profit<150000)
and (state in ("california","florida","abc","pqr"));

select state,profit from startup
where (profit between 50000 and 195000)
and (state = "california" or state = "Florida");

# -- 12. find out state which starts with letter C
select * from startups where state like "c%";

#13. find out state which ends with letter a
select * from startups where state like "%a";
#14. Find out state that contains characters 'Yor'
select * from startups where state like "%yor%";

#aggregation functions:
#sum()
#max()
#min()
#avg()
#count() => number of rows of data

#21. Counting number of rows in table
select count(*)  from startups;

#count of number of rows of data in profit column
select count(profit)  from startups;

# 22. Show count as StartupCount
-- as is used to rename it or alias names
select count(distinct(state)) as count_st from startups;

#-- 24. Find out average RND spend for the data
select avg(profit) from startups;
#-- 26. Find out minimum profit and max RND
select min(profit), max(rnd) from startups;

#-- 30. Find out number of startups which belong 
# to florida and avg, max ,min , Profit
select count(*),avg(profit),max(profit),min(profit) 
from startups
where state="florida";
select * from startups;

#-- round off avg amount and display
select round(avg(profit),2) from startups;

select round(avg(profit),4) from startups
where state = "florida";

-- 4.Order by Query by default orders in ascending
select profit from startups order by profit asc;

select * from startups order by profit;
select * from startups order by profit asc;
select * from startups order by profit desc;

select * from startups order by state;
select * from startups order by state desc;

select * from startups order by mkt desc;


# 11. Find out average profit based on states(group by=state) 
# and arrange avg profit in desc order

select state, avg(profit) as avg_p from startups group by  
state order by avg_p desc;
-- 13. Find out std deviation for ADMIN based on states
select stddev(admin) from startups;

select state,stddev(admin) from startups
group by state;
 
-- 14. Find out total Spend by startups
select * from startups;
select state,sum(rnd+admin+mkt) from startups
group by state;

# Find out average profit based on states(group by=state) 
# and display average profit greater than 100000