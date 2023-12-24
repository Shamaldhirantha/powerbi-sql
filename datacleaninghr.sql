create database projects;

USE projects;

SELECT * FROM hr;
alter table hr
change column ï»¿id emp_id varchar(20)null;

describe hr;
select birthdate from hr;
set sql_safe_updates = 0;

update hr

set birthdate=
 case 
when birthdate like '%/%' then date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
when birthdate like '%-%' then date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
else null 
end;

alter table hr
modify column birthdate date;

update hr
set hire_date=
 case 
when hire_date like '%/%' then date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
when hire_date like '%-%' then date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
else null 
end;
alter table hr
modify column hire_date date;

UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SELECT termdate from hr;

SET sql_mode = 'ALLOW_INVALID_DATES';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

select termdate from hr;

ALTER TABLE hr ADD COLUMN age INT;
UPDATE hr
SET age=timestampdiff(YEAR,birthdate,CURDATE());

SELECT 
	min(age) as youngest,
    max(age) as oldest
from hr;

select count(*) from hr where age < 18;





