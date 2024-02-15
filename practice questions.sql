SELECT * FROM world.country;
use world;
#Show all country name start and end with same letter
select name from country where left(name,1)=right(name,1);
#how many country start with i
select name from country where name like "I%";
#HOW many countries  'Dutch 'language is spoken
select count(Language) from countrylanguage where language='Dutch';
#list name of cities whose population more than 10 milion
select name from city where population>10000000;
#list all country whose name start and end with a vowel
select name from country where left(name,1) in ('A', 'E', 'I', 'O', 'U') and right (name,1) in ('a', 'e', 'i', 'o', 'u');
#list all country which gained independance after 1950
select name from country where Indepyear>1950;
#how many country are there in africa
select count(name) from country where continent ='Africa';
#list all countries whose  area is larger than area of argentina.
select name from country where surfacearea>(select surfacearea from country where name='argentina');
