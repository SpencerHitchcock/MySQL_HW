USE sakila;
#1a
SELECT first_name, last_name FROM actor;
#1b
SELECT CONCAT(first_name , ' ', last_name) AS Name FROM actor;
#2a
SELECT first_name, last_name, actor_id
FROM actor
WHERE first_name = 'JOE';
#2b
SELECT *
FROM actor
WHERE last_name LIKE '%GEN%';
#2c
SELECT last_name, first_name
FROM actor
WHERE last_name LIKE '%LI%';
#2d
SELECT country_id, country
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');
#3a - ?
#3b - ?
#4a
SELECT last_name, COUNT(*) name_count 
FROM actor 
GROUP BY last_name;
#4b
SELECT last_name, COUNT(*) name_count 
FROM actor 
GROUP BY last_name HAVING name_count > 1;
#4c - Safe mode?
#UPDATE actor
#SET first_name='HARPO'
#WHERE first_name='GROUCHO';
#4d - Safe mode?
#UPDATE actor
#SET first_name='GROUCHO'
#WHERE first_name='HARPO';
#5a - ?
#6a
SELECT first_name, last_name, address
FROM staff
JOIN address
USING (address_id);
#6b - Get the TOTAL for aug, 2005?
SELECT first_name, last_name, amount
FROM staff
JOIN payment
USING (staff_id);
#6c - Need to add a count function
SELECT film.title, film_actor.actor_id
	#(SELECT COUNT(*)
	#FROM film_actor
	#WHERE film_actor.actor_id)
FROM film
INNER JOIN film_actor ON film.film_id = film_actor.film_id;
#6d
#6e
#7a
#7b
#7c
#7d
#7e
#7f
#7g
#7h
#8a
#8b
#8c