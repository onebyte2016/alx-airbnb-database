
--# Step 2: Test Query Performance
-- Use EXPLAIN ANALYZE to measure performance
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2023-04-01' AND '2023-04-30';




--Step 3: Report on Improvements

| Metric                     | Before Partitioning        | After Partitioning             |
| -------------------------- | -------------------------- | ------------------------------ |
| Query Type                 | Date range on `start_date` | Same                           |
| Scan Type (EXPLAIN output) | `Seq Scan on bookings`     | `Seq Scan on bookings_2023_q2` |
| Total Time (example)       | 800ms                      | 120ms                          |
| Rows Filtered              | \~Millions                 | \~Thousands                    |
