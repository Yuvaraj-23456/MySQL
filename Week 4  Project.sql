#Questions:

#1. What is the total revenue generated from all rentals in the database?
select * from payment;
SELECT 
    SUM(amount) AS Total_Revenue
FROM
    payment; 

#2. How many rentals were made in each month_name? 
select * from rental;
select * from payment;
SELECT 
    MONTHNAME(payment_date) AS Month,
    COUNT(payment_id) AS 'No of Rentals'
FROM
    payment
GROUP BY Month
ORDER BY 2 DESC;

#3. What is the rental rate of the film with the longest title in the database?
select * from film;
SELECT 
    title, LENGTH(title) AS 'length Title', rental_rate
FROM
    film
WHERE
    LENGTH(title) = (SELECT 
            MAX(LENGTH(title))
        FROM
            film); 

#4. What is the average rental rate for films that were taken from the last 30 days from the date("2005-05-05 22:04:30")? 
select * from rental;
select * from film;
select * from inventory;
SELECT 
    f.title,
    DATEDIFF(c.rental_date, '2005-05-05 22:04:30') AS Difference,
    AVG(rental_rate) AS avg_rent
FROM
    film a
        LEFT JOIN
    inventory i ON a.film_id = b.film_id
        LEFT JOIN
    rental r ON i.inventory_id = r.inventory_id
WHERE
    DATEDIFF(c.rental_date, '2005-05-05 22:04:30') <= 30
GROUP BY 1 , 2
ORDER BY 1 , 2;

#5. What is the most popular category of films in terms of the number of rentals?
select * from film;
select * from inventory;
select * from rental;
select * from film_category;
select * from category;
SELECT 
    c.name AS Category, COUNT(r.rental_id) AS Rentals
FROM
    film f
        INNER JOIN
    inventory i ON f.film_id = i.film_id
        INNER JOIN
    rental r ON i.inventory_id = r.inventory_id
        INNER JOIN
    film_category s ON f.film_id = s.film_id
        INNER JOIN
    category c ON c.category_id = s.category_id
GROUP BY 1
ORDER BY Rentals DESC
LIMIT 1; 

#6. Find the longest movie duration from the list of films that have not been rented by any customer.
select * from film;
select * from rental;
select * from inventory;
with base as (select title,count(r.rental_id) as Rentals from film f left join inventory i on f.film_id = i.film_id left join rental r on r.inventory_id = i.inventory_id
group by 1 order by Rentals asc) select f.*, r.length from base f inner join film r on f.title = r.title having Rentals = 0 order by 3 desc
limit 1; 

#7. What is the average rental rate for films, broken down by category?
select * from film;
select  * from film_category;
select * from category;
SELECT 
    e.name, a.title, AVG(rental_rate)
FROM
    film a
        INNER JOIN
    film_category d ON a.film_id = d.film_id
        INNER JOIN
    category e ON e.category_id = d.category_id
GROUP BY 1 , 2;

#8. What is the total revenue generated from rentals for each actor in the database? 
select * from film;
select * from film_actor;
select * from actor;
SELECT 
    a.actor_id,
    a.first_name,
    a.last_name,
    SUM(f.rental_rate * f.rental_duration) AS Total_Revenue
FROM
    actor a
        INNER JOIN
    film_actor s ON a.actor_id = s.actor_id
        INNER JOIN
    film c ON b.film_id = c.film_id
GROUP BY 1 , 2 , 3
ORDER BY 1;

#9. Show all the actresses who worked in a film having a "Wrestler" in the description.
SELECT 
    *
FROM
    film;
SELECT 
    *
FROM
    film_actor;
SELECT 
    *
FROM
    actor;
SELECT DISTINCT
    a.first_name, a.last_name
FROM
    actor a
        INNER JOIN
    film_actor b ON a.actor_id = b.actor_id
        INNER JOIN
    film c ON b.film_id = c.film_id
WHERE
    c.description LIKE '%Wrestler%'
ORDER BY 1;
#10. Which customers have rented the same film more than once? 
select * from customer;
select * from rental;
select * from inventory;
SELECT 
    a.first_name,
    a.last_name,
    d.title,
    COUNT(d.title) AS Rent
FROM
    customer a
        INNER JOIN
    rental b ON a.customer_id = b.customer_id
        INNER JOIN
    inventory c ON b.inventory_id = c.inventory_id
        INNER JOIN
    film d ON c.film_id = d.film_id
GROUP BY 1 , 2 , 3
HAVING Rent > 1
ORDER BY Rent DESC;

#11. How many films in the comedy category have a rental rate higher than the average rental rate? 
select * from film;
select * from film_category;
select * from category;
SELECT 
    c.name, COUNT(DISTINCT f.film_id) AS 'Total films'
FROM
    film a
        INNER JOIN
    film_category s ON f.film_id = s.film_id
        INNER JOIN
    category c ON s.category_id = c.category_id
WHERE
    c.name LIKE '%comedy%'
        AND f.rental_rate > (SELECT 
            AVG(rental_rate)
        FROM
            film)
GROUP BY 1;

#12. Which films have been rented the most by customers living in each city?
select * from customer;
select * from rental;
select * from inventory;
select * from address;
with m_rented as (select f.city, d.title, count(d.title) as Times_rented,row_number() over(partition by f.city) as Most_rented from customer a inner join rental b
on a.customer_id =b.customer_id left join inventory c on b.inventory_id = c.inventory_id left join film d on c.film_id = d.film_id left join address e on e.address_id = a.address_id
left join city f on f.city_id = e.city_id group by 1,2) select distinct city, title, Times_rented from m_rented where Most_rented = 1 order by Times_rented desc;
select * from city; 

#13. What is the total amount spent by customers whose rental payments exceed $200? 
select * from payment;
select * from customer;
SELECT 
    b.customer_id,
    a.first_name,
    a.last_name,
    SUM(b.amount) AS Total_amount
FROM
    customer a
        INNER JOIN
    payment b ON a.customer_id = b.customer_id
GROUP BY a.customer_id
HAVING Total_amount > 200;

#14. Display the fields which are having foreign key constraints related to the "rental" table. [Hint: using Information_schema] 
desc rental;
SELECT 
    *
FROM
    information_schema.key_column_usage
WHERE
    referenced_table_name = 'rental';


#15. Create a View for the total revenue generated by each staff member, broken down by store city with the country name. 
select * from store;
select * from address;
select * from city;
select * from country;
select * from staff;
select * from payment;
create view Rental_Info as
select b.rental_date as visiting_day, a.first_name, a.last_name, e.title, datediff(b.return_date,b.rental_date)  as no_of_rental_days, c.amount, round(c.amount/(sum(c.amount) over(partition by a.first_name ))*100,2) as Percentage_spent
from customer a inner join rental b on a.customer_id = b.customer_id inner join payment c on b.rental_id = c.rental_id inner join inventory d on b.inventory_id = d.inventory_id
inner join film e on d.film_id = e.film_id  having no_of_rental_days is not null ;

#16. Create a view based on rental information consisting of visiting_day, customer_name, the title of the film, no_of_rental_days, the amount paid by the customer along with the percentage of customer spending.
select * from customer;
select * from rental;
select * from payment;
select * from inventory;
select * from film;

#17. Display the customers who paid 50% of their total rental costs within one day. 
select * from payment;
select * from customer;