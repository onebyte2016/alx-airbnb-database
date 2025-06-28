-- USERS
INSERT INTO users (name, email, password, role) VALUES
('Alice Johnson', 'alice@example.com', 'hashed_pwd_1', 'guest'),
('Bob Smith', 'bob@example.com', 'hashed_pwd_2', 'owner'),
('Clara James', 'clara@example.com', 'hashed_pwd_3', 'guest'),
('Daniel King', 'daniel@example.com', 'hashed_pwd_4', 'owner');

-- PROPERTIES
INSERT INTO properties (owner_id, title, description, location, price_per_night, status) VALUES
(2, 'Sunny Apartment in Lagos', '2-bedroom apartment with balcony', 'Lagos, Nigeria', 75.00, 'available'),
(4, 'Cozy Cottage in Abuja', 'Quiet place for a relaxing weekend', 'Abuja, Nigeria', 120.00, 'available'),
(2, 'Downtown Studio', 'Great location near markets and malls', 'Lagos, Nigeria', 55.00, 'available');

-- BOOKINGS
INSERT INTO bookings (user_id, property_id, start_date, end_date, status) VALUES
(1, 1, '2025-07-01', '2025-07-05', 'confirmed'),
(3, 2, '2025-07-10', '2025-07-12', 'pending'),
(1, 3, '2025-08-01', '2025-08-03', 'confirmed');

-- PAYMENTS
INSERT INTO payments (booking_id, amount, payment_date, payment_method, status) VALUES
(1, 300.00, '2025-06-20 10:00:00', 'credit_card', 'paid'),
(2, 240.00, '2025-06-22 14:30:00', 'paypal', 'pending'),
(3, 110.00, '2025-07-01 09:15:00', 'debit_card', 'paid');

-- REVIEWS
INSERT INTO reviews (booking_id, user_id, rating, comment) VALUES
(1, 1, 5, 'Fantastic place, very clean and convenient!'),
(3, 1, 4, 'Nice studio, could use better lighting.');
