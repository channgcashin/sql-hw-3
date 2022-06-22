-- Q1
select customer_id, customer.first_name, customer.last_name, district
from customer
full join address
on customer.address_id = address.address_id
where district = 'Texas';

-- Q2
select customer.customer_id, customer.first_name, customer.last_name, amount
from customer
full join payment
on customer.customer_id = payment.customer_id
where amount > 6.99;

-- Q3
select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
);

-- Q4
select customer_id, first_name, last_name, country
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
full join country
on city.city_id = country.country_id
where country = 'Nepal';

-- Q5
select staff_id, count(staff_id) as transaction_count
from payment
group by staff_id
order by transaction_count desc;

-- Q6
select rating, count(film_id) as film_count
from film
group by rating;

-- Q7
select customer_id, first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 6.99
);

-- Q8
select rental.rental_id, amount
from rental
full join payment
on rental.rental_id = payment.rental_id
where amount = 0 or null

