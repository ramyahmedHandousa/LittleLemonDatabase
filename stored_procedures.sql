
-- Stored Procedures for Little Lemon Booking System

-- GetMaxQuantity Procedure
DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT table_number, seating_capacity 
    FROM Tables 
    WHERE seating_capacity = (SELECT MAX(seating_capacity) FROM Tables);
END //
DELIMITER ;

-- ManageBooking Procedure
DELIMITER //
CREATE PROCEDURE ManageBooking(
    IN cust_id INT,
    IN tbl_id INT,
    IN booking_time DATETIME
)
BEGIN
    DECLARE booking_exists INT;
    -- Check if a booking already exists for the customer at the given time
    SELECT COUNT(*) INTO booking_exists 
    FROM Bookings 
    WHERE customer_id = cust_id 
    AND booking_time = booking_time;
    
    IF booking_exists > 0 THEN
        -- Update the existing booking if found
        UPDATE Bookings 
        SET table_id = tbl_id 
        WHERE customer_id = cust_id 
        AND booking_time = booking_time;
    ELSE
        -- Add a new booking if none exists
        INSERT INTO Bookings (customer_id, table_id, booking_time) 
        VALUES (cust_id, tbl_id, booking_time);
    END IF;
END //
DELIMITER ;

-- UpdateBooking Procedure
DELIMITER //
CREATE PROCEDURE UpdateBooking(
    IN booking_id INT,
    IN new_table_id INT,
    IN new_booking_time DATETIME
)
BEGIN
    -- Update the booking with the provided table ID and booking time
    UPDATE Bookings 
    SET table_id = new_table_id, booking_time = new_booking_time 
    WHERE booking_id = booking_id;
END //
DELIMITER ;

-- AddBooking Procedure
DELIMITER //
CREATE PROCEDURE AddBooking(
    IN cust_id INT,
    IN tbl_id INT,
    IN booking_time DATETIME
)
BEGIN
    -- Insert a new booking into the Bookings table
    INSERT INTO Bookings (customer_id, table_id, booking_time) 
    VALUES (cust_id, tbl_id, booking_time);
END //
DELIMITER ;

-- CancelBooking Procedure
DELIMITER //
CREATE PROCEDURE CancelBooking(
    IN booking_id INT
)
BEGIN
    -- Delete the booking with the given booking ID
    DELETE FROM Bookings 
    WHERE booking_id = booking_id;
END //
DELIMITER ;
