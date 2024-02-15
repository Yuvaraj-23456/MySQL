use comapny;
describe comapny;
INSERT into comapny values (1,"SAM","K","IOT"),
(2,"RAVI","S","JAR");
select * from comapny;
Truncate comapny;
alter table comapny change firstname first_name varchar(30);
describe comapny;
alter table comapny 
add column domain int;
alter table comapny 
add column dob date after project_title;
describe comapny;
Rename table comapny to company;
show tables;
alter table comapny drop column dob;