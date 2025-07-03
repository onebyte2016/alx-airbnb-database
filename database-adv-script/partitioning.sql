-- partitioning.sql

-- Step 1: Rename the existing table
ALTER TABLE bookings RENAME TO bookings_old;

-- Step 2: Create a new partitioned parent table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    payment_id INT,
    start_date DATE NOT NULL,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- Add any other required columns
    -- No constraints like CHECK or DEFAULTS on partition key!
    
    -- Partitioning definition
    PARTITION BY RANGE (start_date)
);

-- Step 3: Create partitions (you can create more ranges based on your data)
CREATE TABLE bookings_2023_q1 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2023-04-01');

CREATE TABLE bookings_2023_q2 PARTITION OF bookings
    FOR VALUES FROM ('2023-04-01') TO ('2023-07-01');

CREATE TABLE bookings_2023_q3 PARTITION OF bookings
    FOR VALUES FROM ('2023-07-01') TO ('2023-10-01');

CREATE TABLE bookings_2023_q4 PARTITION OF bookings
    FOR VALUES FROM ('2023-10-01') TO ('2024-01-01');

-- Step 4: Insert old data (optional)
INSERT INTO bookings
SELECT * FROM bookings_old;

-- Step 5: (Optional) Drop the old table
-- DROP TABLE bookings_old;


--# Step 2: Test Query Performance
-- Use EXPLAIN ANALYZE to measure performance
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2023-04-01' AND '2023-04-30';


