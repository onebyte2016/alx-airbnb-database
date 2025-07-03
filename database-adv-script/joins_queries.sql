#Write a query using an INNER JOIN to retrieve all bookings 
# 1. INNER JOIN — Bookings with respective users

SELECT 
    bookings.id AS booking_id,
    bookings.booking_date,
    users.id AS user_id,
    users.name,
    users.email
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.id;


#2. LEFT JOIN — All properties and their reviews, including those with no reviews
SELECT 
    properties.id AS property_id,
    properties.name AS property_name,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM 
    properties
LEFT JOIN 
    reviews ON properties.id = reviews.property_id;


#FULL OUTER JOIN — All users and all bookings (even unmatched ones)

-- SELECT 
--     users.id AS user_id,
--     users.name,
--     bookings.id AS booking_id,
--     bookings.booking_date
-- FROM 
--     users
-- FULL OUTER JOIN 
--     bookings ON users.id = bookings.user_id;

-- Emulated FULL OUTER JOIN for MySQL or systems without direct support
SELECT 
    users.id AS user_id,
    users.name,
    bookings.id AS booking_id,
    bookings.booking_date
FROM 
    users
LEFT JOIN 
    bookings ON users.id = bookings.user_id

UNION

SELECT 
    users.id AS user_id,
    users.name,
    bookings.id AS booking_id,
    bookings.booking_date
FROM 
    bookings
LEFT JOIN 
    users ON users.id = bookings.user_id;
