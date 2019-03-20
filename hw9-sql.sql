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
select count(i.inventory_id) "COUNT"
from inventory i 
join film f 
	on i.film_id=f.film_id
    and f.title="Hunchback Impossible";
#6e
select c.first_name
	, c.last_name
    , sum(p.amount) "Total AMT" 
from customer c
join payment p
	on c.customer_id=p.customer_id
group by c.first_name
	, c.last_name
order by c.last_name;
#7a
select title 
from film 
where (title like "K%" 
	or title like "Q%" )
    and language_id=(select language_id from language where name="English");
#7b
select a.first_name
	, a.last_name 
from actor a
join film_actor fa
	on a.actor_id=fa.actor_id
    and fa.film_id=(select film_id from film where title="Alone Trip");
#7c
select first_name, last_name, email from customer where address_id in (
select address_id from address where city_id in(
select city_id from city where country_id in (
select country_id from country where country="Canada")));
#7d
select title from film where film_id in (
select film_id from film_category where category_id in (
select category_id from category where name="family"));
#7e
select f.title, count(r.rental_date) "Rental Count" from film f 
join inventory i 
	on f.film_id=i.film_id
join rental r 
	on i.inventory_id=r.inventory_id
group by f.title
order by count(r.rental_date) desc;
#7f
select s.store_id, sum(amount) "Total" from store s
join staff st 
	on s.store_id=st.store_id
join payment p 
	on st.staff_id=p.staff_id
group by s.store_id;
#7g
select s.store_id, c.city, co.country from store s
join address a 
	on s.address_id=a.address_id
join city c 
	on a.city_id=c.city_id
join country co
	on c.country_id=co.country_id;
#7h
select  c.name, sum(p.amount) from payment p
join rental r 
	on p.rental_id=r.rental_id
join inventory i
	on r.inventory_id=i.inventory_id
join film f
	on i.film_id=f.film_id
join film_category fc
	on f.film_id=fc.film_id
join category c
	on fc.category_id=c.category_id
group by c.name
order by sum(p.amount) desc
limit 5;
#8a
create view top_category as 
select  c.name, sum(p.amount) from payment p
join rental r 
	on p.rental_id=r.rental_id
join inventory i
	on r.inventory_id=i.inventory_id
join film f
	on i.film_id=f.film_id
join film_category fc
	on f.film_id=fc.film_id
join category c
	on fc.category_id=c.category_id
group by c.name
order by sum(p.amount) desc
limit 5;
#8b
select * from top_category;
#8c
drop view top_category;
