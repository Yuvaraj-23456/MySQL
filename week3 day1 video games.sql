use week2;
#1. Display the details of top 5 games in terms of NA_Sales rounded off to 1 decimal place.
select * from video_games;
select *  from video_games order by round(NA_Sales,1) desc limit 5;

#2.For how many games NA_Sales contributes atleast 50% to the global sales
select * from video_games;
select Name,NA_Sales,Global_Sales from video_games;
select count(*) from video_games where NA_Sales/Global_sales>=0.5;

#3.Display all the nintendo games whose critic score is an odd number
select * from video_games;
use week2;
select * from video_games where publisher='Nintendo' and Critic_score mod 2=1;


#4.Display the name,year_of_Release, publisher,global_sales and critic_score of all action games.If the game does not have critic score show values of user_score*10. If it does not have both score show 0
Select * from video_games;
select Name,Year_of_Release,Publisher,Global_Sales,ifnull(ifnull(Critic_Score,user_score*10),0) as critic_score from Video_Games
Where User_Score*10;
select Name,Year_of_Release,Publisher,Global_Sales,coalesce(Critic_Score,user_score*10,0) as critic_score from Video_Games;

#5.How many games have critic score divisible by both 3 and 4
select * from video_games;
select count(*) from video_games where critic_score mod 3=0 and critic_score mod 4=0;

#6.List all games released in leap year
select * from video_games;
select * from video_games where year_of_Release mod 4=0; 

#7.Display all the games whose square of jp_sales is lower than EU_Sales
select * from video_games;
select power(JP_Sales,2) from video_games;
select * from video_games where power(JP_Sales,2) < EU_Sales;

#8.How many games have their year_of_release perfectly divisible by critic_score
select * from video_games;
select count(*) from video_games where year_of_release mod critic_score=0;

#9.How many games have their global_sales as an integer
select * from video_games;
select * from video_games where global_sales mod 1=0;
select * from video_games where floor (global_sales)=global_sales; 

#10.Assume ubisoft sells their game for 5 USD in NA,3 Euro in EU and 1000 Yen in Japan, RS 500 in other places,show their top 10 games in terms of collection in rupees.Use today currency conversion rates upto 2 decimal places or conversion
select * from video_games;
select * from video_games where publisher='ubisoft' order by NA_Sales*461.37+ EU_Sales*273.78+ JP_Sales*584.87+ other_sales*500  desc limit 10;


#11. Show the celsius values for the following temperture in fahrenheit. 25,31,14,44,86,134,180
create table temperature (temperature int);
Insert into temperature values (25),(31),(14),(44),(86),(134);



#12.Which is the most sold games without any user and critic score
select * from video_games;
select * from video_games where critic_score is  null and user_score is  null order by global_sales desc limit 1;

use world;
#13. List the country name,capital_name,country population and capital population of countries whose capital city has population more than 5000000(use country and city)
select * from city,country;
select c.name as country_name ,ct.name as city_name ,c.population as country_population,ct.population  as city_popualtion from country c,city ct where c.capital=ct.id and ct.population>50000;

#14.In how many continents french language is spoken(use country and country Language)
select * from country,countrylanguage;
select count(distinct (continent)) from country c, countrylanguage c1 where c1.countrycode=c.code and language='French';

#15.Display all the countries which will celebrate their 100th independence year in this decade(2020 to 2029)
select * from country;
select * from country where indepyear is not null and (Indepyear +100) between 2020 and 2029;


#16.show all african coutries whose GNP is increased by more than 15%(comapre gnp and gnpold)
select * from country;
select *from country where continent='Africa';
select * from country where (gnp-gnpold)>(gnpold*15)/100 and continent='Africa';


#17.Display all countries whose lifeexpectany is above 80 and they speak Engilsh as one of the languages(use country and countrylanguage)
select * from country,countrylanguage;
select * from country,countrylanguage where lifeexpectancy>80 and language='English';
select * from country c,countrylanguage c1 where c1.countrycode-c.code and lifeexpectancy>80 and language='English';

use world;
#1.List all the continents in descending order of average GNP
select * from country;
select continent,avg(GNP) from country group by  1;

#2.List the language and the number of countries where they are spoken.
select * from country,countrylanguage;
#select c.name as country_name,c1.name as countrylanguage_name from country c, countrylanguage c1 whe

#3.list all the regions whose total population is above 100 million
select * from country;
select region,sum(population) as population from country group by region having population>10000000;

#4.what is the population density of all the continents? populationdensity=population\surfacearea
select * from country;
select sum(population/surfacearea),continent as population_density from country group by continent ;

#5.list the top 3 continents in terms of no of countries
select * from country;
select continent,count(name) from country group by continent;

#6.list the total population of all the countries where tamil is one of the language is spoken
select * from country,countrylanguage;
select sum(population) as total_population from country,countrylanguage where country.code=countrylanguage.countrycode and language='Tamil';

use week2;
#7.list the platform whose average is above 75
select * from video_games;
select avg(critic_score) as critic_score, platform from video_games group by platform having critic_score>75 ;

#8.List the total global sales of games whose name begin with vowels and also total_sales of the remaining games
select * from video_games;
select name
select
list top 5 genre of games which has the highest average of critic score
out of all publishres with total global sales more than 200 how many have made more than 75 in total na sales
use hr emp
list the average salary of amangers,clerkd amd other employee table use 9jbid man mgr as manage