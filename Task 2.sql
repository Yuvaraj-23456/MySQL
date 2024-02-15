use Travego_travellers;

#a. How many female passengers traveled a minimum distance of 600 KMs?
select * from passenger;
select count(*) as FP_traveldistance from passenger where Distance<600;

#b. Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus.
select * from passenger;
select * from passenger where Distance>500 and Bus_Type='Sleeper';

#c. Select passenger names whose names start with the character 'S'.
select * from passenger;
select passenger_name from passenger where passenger_name like "S%";

#d. Calculate the price charged for each passenger, displaying the Passenger name, Boarding City,Destination City, Bus type, and Price in the output.
select passenger_name,Boarding_point,Destination,passenger.Bus_Type,Price from passenger,price;

#e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?
select * from passenger,price;
select passenger_name,price from passenger,price where passenger.Distance=1000 and price.Bus_Type='Sitting';

#f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select * from passenger,price;
SELECT 
  passenger_name,
    price,p.bus_type,pr.bus_type FROM passenger as p
    join price as pr
    on p.passenger_id=pr.id
    where 
passenger_name='Pallavi';
  
WHERE
    Boarding_point = 'Bengaluru'
        AND Destination = 'Panaji'
        AND price.Bus_Type IN ('Sitting' , 'Sleeper');  


#g. Alter the column category with the value "Non-AC" where the Bus_Type is sleeper
select * from passenger;
UPDATE passenger 
SET 
    category = 'Non-AC'
WHERE
    Bus_Type = 'Sleeper';
    
select * from passenger;

#h. Delete an entry from the table where the passenger name is Piyush and commit this change in the database.
select * from passenger;    
DELETE FROM passenger 
WHERE
    passenger_name = 'piyush';
commit;
select * from passenger;

#i. Truncate the table passenger and comment on the number of rows in the table (explain if required).
select * from passenger;
truncate table passenger;
select count(*) from passenger;

#j. Delete the table passenger from the database.
select * from passenger;
Drop table passenger;