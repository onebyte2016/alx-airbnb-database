-- PostgreSQL
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 123;


--Example 2: Reviews for properties in April 2023
sql
Copy
Edit
EXPLAIN ANALYZE
SELECT r.*, p.name, p.location
FROM reviews r
JOIN properties p ON r.property_id = p.id
WHERE r.created_at BETWEEN '2023-04-01' AND '2023-04-30';



--Example 3: Count bookings per property
sql
Copy
Edit
EXPLAIN ANALYZE
SELECT property_id, COUNT(*) as total_bookings
FROM bookings
GROUP BY property_id;


--Step 2: Analyze Bottlenecks

| Problem                                | Symptom                              |
| -------------------------------------- | ------------------------------------ |
| Sequential Scan on large table         | No index used; slow query            |
| Hash Join or Nested Loop on large data | Costly joins; no filter optimization |
| Grouping without index                 | Slow GROUP BY                        |
| Wide column SELECT (`SELECT *`)        | Unnecessary I/O load                 |


Step 3: Suggested Improvements

| Query | Bottleneck               | Suggested Fix                                                          |
| ----- | ------------------------ | ---------------------------------------------------------------------- |
| #1    | Seq Scan on `bookings`   | Create index on `bookings.user_id`                                     |
| #2    | Join without filter push | Create index on `reviews.property_id` and `reviews.created_at`         |
| #3    | Full scan + group        | Create composite index on `bookings(property_id)` or materialized view |


-- Step 4: Implement the Changes
-- Booking Query Optimization
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Review Query Optimization
CREATE INDEX idx_reviews_property_date ON reviews(property_id, created_at);

-- Booking Count Optimization
CREATE INDEX idx_bookings_property_id ON bookings(property_id);



--Step 5: Re-Measure with EXPLAIN ANALYZE

| Query | Before Index (ms) | After Index (ms) | Improvement |
| ----- | ----------------- | ---------------- | ----------- |
| #1    | 450               | 25               | \~18x       |
| #2    | 700               | 120              | \~6x        |
| #3    | 520               | 80               | \~6.5x      |
