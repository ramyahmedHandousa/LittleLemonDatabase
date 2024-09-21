CREATE DATABASE LittleLemon;
USE LittleLemon;

-- Table for customers
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Table for restaurant tables
CREATE TABLE Tables (
    table_id INT AUTO_INCREMENT PRIMARY KEY,
    table_number INT,
    seating_capacity INT
);

-- Table for bookings
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    table_id INT,
    booking_time DATETIME,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (table_id) REFERENCES Tables(table_id)
);

-- Sample data
INSERT INTO Customers (first_name, last_name, email, phone) VALUES 
('John', 'Doe', 'john@example.com', '1234567890'),
('Jane', 'Smith', 'jane@example.com', '0987654321');

INSERT INTO Tables (table_number, seating_capacity) VALUES 
(1, 4), (2, 6), (3, 8);

INSERT INTO Bookings (customer_id, table_id, booking_time) VALUES 
(1, 1, '2024-09-21 19:00:00'),
(2, 2, '2024-09-21 20:00:00');
