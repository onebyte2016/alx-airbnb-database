-- USER TABLE
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) DEFAULT 'guest',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- PROPERTY TABLE
CREATE TABLE properties (
    property_id SERIAL PRIMARY KEY,
    owner_id INTEGER NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    location VARCHAR(150),
    price_per_night DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'available',

    CONSTRAINT fk_property_owner FOREIGN KEY (owner_id)
        REFERENCES users(user_id) ON DELETE CASCADE
);

-- BOOKING TABLE
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    property_id INTEGER NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50) DEFAULT 'pending',

    CONSTRAINT fk_booking_user FOREIGN KEY (user_id)
        REFERENCES users(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_booking_property FOREIGN KEY (property_id)
        REFERENCES properties(property_id) ON DELETE CASCADE
);

-- PAYMENT TABLE
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    booking_id INTEGER NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50),
    status VARCHAR(50) DEFAULT 'paid',

    CONSTRAINT fk_payment_booking FOREIGN KEY (booking_id)
        REFERENCES bookings(booking_id) ON DELETE CASCADE
);

-- REVIEW TABLE
CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    booking_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_review_booking FOREIGN KEY (booking_id)
        REFERENCES bookings(booking_id) ON DELETE CASCADE,
    CONSTRAINT fk_review_user FOREIGN KEY (user_id)
        REFERENCES users(user_id) ON DELETE CASCADE
);

-- OPTIONAL: INDEXES FOR PERFORMANCE
CREATE INDEX idx_property_owner ON properties(owner_id);
CREATE INDEX idx_booking_user ON bookings(user_id);
CREATE INDEX idx_booking_property ON bookings(property_id);
CREATE INDEX idx_payment_booking ON payments(booking_id);
CREATE INDEX idx_review_user ON reviews(user_id);
CREATE INDEX idx_review_booking ON reviews(booking_id);
