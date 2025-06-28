 Database Normalization to 3NF – Property Booking System
Objective:
Apply normalization to the Property Booking System database schema to eliminate redundancy and ensure data integrity by achieving Third Normal Form (3NF).

Step-by-Step Normalization
Step 1: Unnormalized Form (UNF)
Let’s assume this flat table as a starting point:

user_id	user_name	email	property_id	property_title	booking_id	start_date	payment_amount

Multiple properties or bookings by the same user result in repeated user info.

Payments and bookings are tightly coupled.

Step 2: First Normal Form (1NF)
Rule: Eliminate repeating groups and ensure atomicity.

We restructure data into individual tables:

User(user_id, name, email, password)

Property(property_id, owner_id, title, location, price, description)

Booking(booking_id, user_id, property_id, start_date, end_date, status)

Payment(payment_id, booking_id, amount, payment_date, payment_method, status)

Review(review_id, booking_id, user_id, rating, comment, created_at)

Each column now holds atomic values, and no table has repeating groups.

Step 3: Second Normal Form (2NF)
Rule: Be in 1NF and ensure that every non-key attribute is fully functionally dependent on the whole primary key.

Problem example:
If we had Booking(booking_id, user_id, property_id, user_name) — user_name depends only on user_id, not the full key.

Fix: Remove partial dependencies:

Move user-related data to User table.

Keep only foreign keys in Booking.

This has already been done in our schema.

Step 4: Third Normal Form (3NF)
Rule: Be in 2NF and remove transitive dependencies — no non-key attribute should depend on another non-key attribute.

Example check:

In Property, location depends on property_id, not on title.

In Payment, amount depends on payment_id, not on payment_method.

In User, email does not depend on name.

Conclusion: No transitive dependencies found. 
Schema is in 3NF.

Final 3NF Tables
User
Field	Type
user_id (PK)	Integer
name	String
email	String
password	String
role	String
created_at	Datetime

Property
Field	Type
property_id (PK)	Integer
owner_id (FK)	Integer
title	String
description	Text
location	String
price_per_night	Decimal
status	String

Booking
Field	Type
booking_id (PK)	Integer
user_id (FK)	Integer
property_id (FK)	Integer
start_date	Date
end_date	Date
status	String

Payment
Field	Type
payment_id (PK)	Integer
booking_id (FK)	Integer
amount	Decimal
payment_date	Datetime
payment_method	String
status	String

Review
Field	Type
review_id (PK)	Integer
booking_id (FK)	Integer
user_id (FK)	Integer
rating	Integer
comment	Text
created_at	Datetime

Summary of Normalization
Form	Purpose	                    Status
UNF	Remove repeating groups	         Done
1NF	Atomic values	                 Done
2NF	Remove partial dependencies	     Done
3NF	Remove transitive dependencies	 Done