CREATE DATABASE PROJECTS;

USE projects;

select * from hr;

ALTER TABLE hr
change column ï»¿id emp_id varchar(20)null;

describe hr;

select birthdate from hr;

set sql_safe_updates=0;

update hr
set birthdate= case
   when birthdate like '%/%' then date_format(str_to_date(birthdate,'%m/%d/%Y'),'%y-%m-%d')
   when birthdate like '%-%' then date_format(str_to_date(birthdate,'%m-%d-%y'),'%y-%m-%d')
   else null
   end;
   
alter table hr
modify column birthdate date;

update hr
set hire_date=case
   when hire_date like '%/%' then date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
   when hire_date like '%-%' then date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
   else null
   end;
   
ALTER TABLE hr
MODIFY COLUMN hire_date DATE;
   
UPDATE hr
SET termdate = if(termdate='', null, str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL;


ALTER TABLE hr
MODIFY COLUMN termdate DATE;

alter table hr add column age int;

update hr 
set age= timestampdiff(YEAR,birthdate,curdate());

















