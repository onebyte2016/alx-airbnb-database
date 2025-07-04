--1. Find total number of bookings made by each user using COUNT and GROUP

SELECT 
    u.id AS user_id,
    u.name,
    COUNT(b.id) AS total_bookings
FROM 
    users u
LEFT JOIN 
    bookings b ON u.id = b.user_id
GROUP BY 
    u.id, u.name
ORDER BY 
    total_bookings DESC;


--2. Rank properties based on the total number of bookings using a window function


-- SELECT 
--     property_id,
--     COUNT(*) AS total_bookings,
--     RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
-- FROM 
--     bookings
-- GROUP BY 
--     property_id;

SELECT 
    property_id,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM (
    SELECT 
        b.property_id,
        COUNT(*) AS total_bookings
    FROM 
        bookings b
    GROUP BY 
        b.property_id
) AS property_bookings;
