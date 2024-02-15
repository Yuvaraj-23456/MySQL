#1. Calculate Monthly-Wise invoice Sales and sort them in descending order.
select * from invoice;
select monthname(invoicedate) as monthly_wise,sum(total) as total_sales from invoice group by 1 order by total_sales desc;
       extract(month from invoicedate)
#2. Write an SQL query to fetch the names of all employees and their managers.
select * from employee;
select concat(e.firstname," ",e.lastname) as employee_name,concat(m.firstname,m.lastname) as manager_name from  employee e join employee e on e.reportsto=m.employeeid;

#3. Find the names of customers who have made a purchase in the USA?
select * from customer;
select  distinct concat(firstname," ",lastname) as customer from customer join invoice using(customerid) where billingcountry='USA' ;


#4. Show the name of each genre and the total number of tracks in that genre.
select * from genre;
select * from track;
select genre.name,count(trackid) from genre join track using (Genreid) group by 1;

#5. Show the name of each customer and the total amount they have spent on purchases.
select * from customer,invoice;
select c.firstname,c.lastname from customer c join invoice i on c.customerid=i.customerid group by 1 having sum(total);

#6. Find the name of the album with the highest unit price.
select * from track,invoice;
select * from album;
select * from invoice;

#7. Display the percentage of missing values for “billingstate” and “billingpostalcode” columns respectively for the invoice table.
select * from invoice;
select * from employee;


#8. Show the name of each track and the total number of times it has been purchased.
select * from invoiceline;
select name,count(quantity) from track,invoiceline group by 1;
