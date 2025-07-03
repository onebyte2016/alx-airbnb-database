#Step 1: Identify High-Usage Columns

| Table        | Column        | Usage Context                           |
| ------------ | ------------- | --------------------------------------- |
| `users`      | `id`          | `JOIN`, `WHERE`, `GROUP BY`             |
| `bookings`   | `user_id`     | `JOIN`, `WHERE`, `GROUP BY`             |
| `bookings`   | `property_id` | `JOIN`, `GROUP BY`, `WHERE`             |
| `properties` | `id`          | `JOIN`, `WHERE`, `GROUP BY`, `ORDER BY` |
| `reviews`    | `property_id` | `WHERE`, `JOIN`, `AVG()` in subqueries  |


#Step 3: Measure Performance (Before & After)

EXPLAIN ANALYZE
SELECT 
    p.id, p.name, COUNT(b.id) AS total_bookings
FROM 
    properties p
LEFT JOIN 
    bookings b ON p.id = b.property_id
GROUP BY 
    p.id, p.name
ORDER BY 
    total_bookings DESC;
