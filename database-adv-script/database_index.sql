-- Indexes for User Table
CREATE INDEX idx_users_id ON users(id);

-- Indexes for Booking Table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Indexes for Property Table
CREATE INDEX idx_properties_id ON properties(id);

-- Indexes for Reviews Table
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
