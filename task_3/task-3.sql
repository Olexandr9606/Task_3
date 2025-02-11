--1. 

SELECT 
    category.name AS Назва_категорії,
    COUNT(film.film_id) AS Кількість_фільмів
FROM 
    film
JOIN 
    film_category ON film.film_id = film_category.film_id
JOIN 
    category ON film_category.category_id = category.category_id
GROUP BY 
    category.name;

--2. 
SELECT 
    category.name AS Назва_категорії,
    AVG(film.length) AS Середня_тривалість
FROM 
    film
JOIN 
    film_category ON film.film_id = film_category.film_id
JOIN 
    category ON film_category.category_id = category.category_id
GROUP BY 
    category.name;

--3. 
SELECT 
    MIN(film.length) AS Мінімальна_тривалість,
    MAX(film.length) AS Максимальна_тривалість
FROM 
    film;

--4. 

SELECT 
    COUNT(customer.customer_id) AS Кількість_клієнтів
FROM 
    customer;

--5. 
SELECT 
    CONCAT(customer.first_name, ' ', customer.last_name) AS Імя_клієнта,
    SUM(payment.amount) AS Сума_платежів
FROM 
    customer
JOIN 
    payment ON customer.customer_id = payment.customer_id
GROUP BY 
    customer.customer_id;

  --6. 
SELECT 
    CONCAT(customer.first_name, ' ', customer.last_name) AS Імя_клієнта,
    SUM(payment.amount) AS Сума_платежів
FROM 
    customer
JOIN 
    payment ON customer.customer_id = payment.customer_id
GROUP BY 
    customer.customer_id
ORDER BY 
    Сума_платежів DESC
LIMIT 5;

--7. 
SELECT 
    CONCAT(customer.first_name, ' ', customer.last_name) AS Імя_клієнта,
    COUNT(rental.rental_id) AS Кількість_орендованих_фільмів
FROM 
    customer
JOIN 
    rental ON customer.customer_id = rental.customer_id
GROUP BY 
    customer.customer_id;

--8. 

SELECT 
    AVG(EXTRACT(YEAR FROM CURRENT_DATE) - film.release_year) AS Середній_вік_фільмів
FROM 
    film;

--9. 

SELECT 
    COUNT(rental.rental_id) AS Кількість_оренд
FROM 
    rental
WHERE 
    rental.rental_date BETWEEN 'YYYY-MM-DD' AND 'YYYY-MM-DD';

--10. 
SELECT 
    DATE_TRUNC('month', payment.payment_date) AS Місяць,
    SUM(payment.amount) AS Сума_платежів
FROM 
    payment
GROUP BY 
    Місяць
ORDER BY 
    Місяць;

--11.

SELECT 
    CONCAT(customer.first_name, ' ', customer.last_name) AS Імя_клієнта,
    MAX(payment.amount) AS Максимальний_платіж
FROM 
    customer
JOIN 
    payment ON customer.customer_id = payment.customer_id
GROUP BY 
    customer.customer_id;

--12. 

SELECT 
    CONCAT(customer.first_name, ' ', customer.last_name) AS Імя_клієнта,
    AVG(payment.amount) AS Середній_платіж
FROM 
    customer
JOIN 
    payment ON customer.customer_id = payment.customer_id
GROUP BY 
    customer.customer_id;

--13. 

SELECT 
    film.rating AS Рейтинг,
    COUNT(film.film_id) AS Кількість_фільмів
FROM 
    film
GROUP BY 
    film.rating;

--14. 

SELECT 
    store.store_id AS Магазин,
    AVG(payment.amount) AS Середній_платіж
FROM 
    payment
JOIN 
    rental ON payment.rental_id = rental.rental_id
JOIN 
    inventory ON rental.inventory_id = inventory.inventory_id
JOIN 
    store ON inventory.store_id = store.store_id
GROUP BY 
    store.store_id;

