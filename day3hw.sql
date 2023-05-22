--1. List all customers who live in Texas (use JOINs)
SELECT first_name,last_name, address2, WHERE district = 'Texas'
FROM address
INNER JOIN customer
ON address.address_id= customer.address_id;
--Answer 'Kim Cruz','Bryan Hardison','Ian Still','Jennifer Davis'

--2. Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name, amount > 6.99
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;



--3. Show all customers names who have made payments over $175(use subqueries)
SELECT first_name, last_name, amount > 175
FROM payment
LEFT JOIN customer
ON payment.customer_id = customer.customer_id;

--4. List all customers that live in Nepal (use the city table)
SELECT customer_id, city = "Nepal"
FROM customer
INNER JOIN address
ON customer_id.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id;

--5. Which staff member had the most transactions?
SELECT staff
FROM payment
WHERE payment_id IN(
    SELECT staff_id
    FROM payment
    GROUP BY staff_id
    HAVING payment > payment
);



--6. How many movies of each rating are there?
SELECT  rating
FROM film
WHERE rating IN title;



--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name, customer_id
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY payment.amount, payment.customer_id
    HAVING amount > 6.99 
);
--Answer: Mary Smith, Peter Menard, Douglas Graf, Alvin Deloach and
-- Alfredo Mcadams


--8. How many free rentals did our store give away?

SELECT MIN(amount)
FROM payment
WHERE payment_id IN(
    SELECT payment
    FROM amount
    GROUP BY amount
    HAVING 0  = amount
);