-- Identify which store generates the highest rental revenue.
SELECT
    s.store_id,
    SUM(p.amount) AS total_revenue
FROM
    store s
JOIN
    staff staff ON s.store_id = staff.store_id
JOIN
    payment p ON staff.staff_id = p.staff_id
GROUP BY
    s.store_id
ORDER BY
    total_revenue DESC
LIMIT 1;

-- Determine which film categories have the highest number of rentals.

SELECT
    c.name AS category_name,
    COUNT(r.rental_id) AS rental_count
FROM
    rental r
JOIN
    inventory i ON r.inventory_id = i.inventory_id
JOIN
    film f ON i.film_id = f.film_id
JOIN
    film_category fc ON f.film_id = fc.film_id
JOIN
    category c ON fc.category_id = c.category_id
GROUP BY
    c.name
ORDER BY
    rental_count DESC;

-- Identify the top 10 most rented films.

SELECT
    f.title,
    COUNT(r.rental_id) AS rental_count
FROM
    rental r
JOIN
    inventory i ON r.inventory_id = i.inventory_id
JOIN
    film f ON i.film_id = f.film_id
GROUP BY
    f.title
ORDER BY
    rental_count DESC
LIMIT 10;

-- Analyze the monthly rental trends over the available data period.
SELECT 
    EXTRACT(YEAR FROM rental.rental_date) AS year,
    EXTRACT(MONTH FROM rental.rental_date) AS month,
    COUNT(*) AS total_rentals
FROM 
    rental
GROUP BY 
    year, month
ORDER BY 
    year, month;

-- Determine the peak rental hours in a day based on rental transactions.


SELECT
    EXTRACT(HOUR FROM rental_date) AS rental_hour,
    COUNT(*) AS transaction_count
FROM
    rental
GROUP BY
    rental_hour
ORDER BY
    transaction_count DESC;
    
SELECT
    staff_id,
    COUNT(*) AS rental_count
FROM
    rental
GROUP BY
    staff_id
ORDER BY
    rental_count DESC;
    
