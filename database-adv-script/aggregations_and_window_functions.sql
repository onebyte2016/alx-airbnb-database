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


SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM 
    bookings
GROUP BY 
    property_id;

-- SELECT 
--     p.id AS property_id,
--     p.name,
--     COUNT(b.id) AS total_bookings,
--     RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
-- FROM 
--     properties p
-- LEFT JOIN 
--     bookings b ON p.id = b.property_id
-- GROUP BY 
--     p.id, p.name
-- ORDER BY 
--     booking_rank;
