use world;

#Dispaly all the details of country with second highest surface area (a) Using Subquery (b) using limit and offset (c) using rank window function
select * from country;
SELECT 
    *
FROM
    country
WHERE
    surfacearea < (SELECT 
            MAX(surfacearea)
        FROM
            country)
ORDER BY surfacearea DESC
LIMIT 1;
select * from country order by surfacearea desc limit 1,1;
select * from (select *,rank() over( order by surfacearea desc) as sa_rank from country)c where sa_rank=2;

#2.Show the total GNP of all countries where spanish is an official language(use country and countrylanguage)
select * from countrylanguage;
select * from country;
select sum(GNP) as Total_GNP from country c join countrylanguage cl on cl.countrycode = c.code where cl.language="Spanish";
select sum(GNP) as Total_GNP from country;
#3.	Display continentwise population of all continents whose population above 1 billion
select * from country;
select distinct(Region) from country where population>1000000000;
select sum(population),continent from country group by continent having sum(population)>1000000000;


#4.Display the total GNP of all countries whose name start with vowels and the Gnp of rest of the countries
select * from country;
select sum(GNP) as Total_GNP from country where name lik;
select'Vowel_country' as category,sum(GNP) from country where left(name,1) in ('a','e','i','o','u')
union
select'other_country' as category,sum(GNP) from country where left(name,1) not in ('a','e','i','o','u');

#5.Display top 10 african countries based on GNP per capita(GNP/Popuation)
select * from country;
select name from country where GNP>(select GNP from country where GNP= GNP/Population)order by name;
select * from country where continent='Africa' order by GNP/Population desc limit 10;

#6.How many asian country have surface area more than indonesia
select * from country;
select * from country where surfacearea>(select surfacearea from country where name ='indonesia')and continent='Asia';

#7.List the name of countries where atleast 5 languages are spoken
select * from country;
select * from countrylanguage;
select name,count(distinct language) from  country c join  countrylanguage cl on c.code=cl.countrycode group by 1 having count(distinct language)>=5;
use world;

#8.List the name of cities whose polplation atleast 20% of their country population
select * from city;
select * from country;
select cl.name from country c join city cl on c.code=cl.countrycode where cl.population>=0.2*c.population;

#9.Dispaly top 3 countries in terms of population from each continent
select * from country;
select * from country order by population desc limit 3;
select * from (select *,dense_rank() over(partition by continent order by population desc) as pop_rank from country) temp where pop_rank<=3;
select * from (select *,row_number() over(partition by continent order by population desc) as pop_rank from country) temp where pop_rank<=3;