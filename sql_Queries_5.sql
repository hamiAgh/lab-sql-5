#Lab | SQL Queries 5
USE Sakila;

#1. Drop column picture from staff.
SELECT * from staff;

ALTER TABLE staff
DROP COLUMN picture;

SELECT * from staff;

#2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
INSERT INTO staff values(3,"Tammy","Sanders",5,"tammy.sanders@sakilastaff.com",2,1,"Tammy","","2023-02-25 12:01:00");
SELECT * from staff;


#3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
#You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. 
#You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
#select customer_id from sakila.customer
#where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

#Use similar method to get inventory_id, film_id, and staff_id.
SELECT * FROM rental ORDER BY rental_id DESC;

SELECT * FROM film WHERE title="Academy Dinosaur"; #film_id=1

SELECT * FROM inventory WHERE film_id=1; #I choose to use inventory_id=1

select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';#customer_id=130

SELECT staff_id from staff WHERE first_name= "Mike"; #staff_id=1

INSERT INTO rental Values(16050,"2023-02-25 12:14:00",1,130,"2023-02-28 12:15:00",1,"2023-02-25 12:14:00");

SELECT * from rental WHERE rental_id=16050;


#4. Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:
#Check if there are any non-active users

SELECT * FROM customer;
SELECT * FROM customer WHERE active=0;
#Create a table backup table as suggested

CREATE TABLE deleted_users(
customer_id int NOT NULL,
email char(50),
deleted_date datetime
);

SELECT * from deleted_users;

#Insert the non active users in the table backup table
INSERT INTO deleted_users Values(16,"SANDRA.MARTIN@sakilacustomer.org","2023-02-25 12:45:00"),(64,"JUDITH.COX@sakilacustomer.org","2023-02-25 12:45:00"),(124,"SHEILA.WELLS@sakilacustomer.org","2023-02-25 12:45:00"),(169,"ERICA.MATTHEWS@sakilacustomer.org","2023-02-25 12:45:00"),
(241,"HEIDI.LARSON@sakilacustomer.org","2023-02-25 12:45:00"),(271,"PENNY.NEAL@sakilacustomer.org","2023-02-25 12:45:00"),(315,"KENNETH.GOODEN@sakilacustomer.org",NOW()),(368,"HARRY.ARCE@sakilacustomer.org",NOW()),
(406,"NATHAN.RUNYON@sakilacustomer.org",NOW()),(446,"THEODORE.CULP@sakilacustomer.org",NOW()),(482,"MAURICE.CRAWLEY@sakilacustomer.org",NOW()),(510,"BEN.EASTER@sakilacustomer.org",NOW()),(534,"CHRISTIAN.JUNG@sakilacustomer.org",NOW()),
(558,"JIMMIE.EGGLESTON@sakilacustomer.org",NOW()),(592,"TERRANCE.ROUSH@sakilacustomer.org",NOW());

SELECT * from deleted_users;

#Delete the non active users from the table customer


SET FOREIGN_KEY_CHECKS=0;
DELETE FROM customer WHERE active=0;

SELECT * FROM customer WHERE active=0;
