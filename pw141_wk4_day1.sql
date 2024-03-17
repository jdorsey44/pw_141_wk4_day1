-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT COUNT(*) AS Wahlberg_Actors
FROM actor
WHERE last_name = 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(*) AS Payments_Between_399_599
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- 3. What film does the store have the most of? (search in inventory)
SELECT film_id, COUNT(*) AS Inventory_Count
FROM inventory
GROUP BY film_id
ORDER BY Inventory_Count DESC
LIMIT 1;

-- 4. How many customers have the last name ‘William’?
SELECT COUNT(*) AS William_Customers
FROM customer
WHERE last_name = 'William';

-- 5. What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT(*) AS Rentals_Sold
FROM rental
GROUP BY staff_id
ORDER BY Rentals_Sold DESC
LIMIT 1;

-- 6. How many different district names are there?
SELECT COUNT(DISTINCT district) AS Different_Districts
FROM address;

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(*) AS Actor_Count
FROM film_actor
GROUP BY film_id
ORDER BY Actor_Count DESC
LIMIT 1;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(*) AS Customers_With_LastName_Es
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430?
SELECT amount, COUNT(*) AS Rental_Count
FROM payment
JOIN rental ON payment.rental_id = rental.rental_id
WHERE amount IN (4.99, 5.99) AND rental.customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(*) > 250;

-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?
SELECT COUNT(DISTINCT rating) AS Rating_Categories,
       rating,
       COUNT(*) AS Total_Movies
FROM film
GROUP BY rating
ORDER BY Total_Movies DESC
LIMIT 1;