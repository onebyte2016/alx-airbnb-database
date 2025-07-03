#1. Find all properties where the average rating is greater than 4.0 using a subquery

SELECT 
    p.id,
    p.name,
    p.location
FROM 
    properties p
WHERE 
    (SELECT AVG(r.rating)
     FROM reviews r
     WHERE r.property_id = p.id) > 4.0;

#2. Correlated subquery to find users who have made more than 3 bookings
SELECT 
    u.id,
    u.name,
    u.email
FROM 
    users u
WHERE 
    (SELECT COUNT(*)
     FROM bookings b
     WHERE b.user_id = u.id) > 3;
