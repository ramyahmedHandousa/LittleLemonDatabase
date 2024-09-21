
# Little Lemon Booking System Project

This project is designed to create a booking system for the Little Lemon restaurant using MySQL, Python, and Tableau. Below are the details of the components included in the project.

## Project Components

1. **Database Schema**:
   - The database schema includes tables for Customers, Tables, and Bookings.
   - The SQL file `database_schema.sql` contains all necessary CREATE TABLE statements for setting up the database.

2. **Stored Procedures**:
   - Several stored procedures were implemented for managing bookings in the system.
     - `GetMaxQuantity()`: Retrieves the table with the maximum seating capacity.
     - `ManageBooking()`: Adds or updates a booking depending on whether one already exists.
     - `UpdateBooking()`: Updates an existing booking's table and time.
     - `AddBooking()`: Adds a new booking to the system.
     - `CancelBooking()`: Cancels an existing booking by deleting it from the database.
   - The SQL file `stored_procedures.sql` includes all the necessary stored procedures.

3. **Python Connection Script**:
   - The Python script `connection_script.py` demonstrates how to connect to the MySQL database and execute the stored procedures.
   - This script uses the `mysql-connector-python` package to interact with the database.

4. **ER Diagram**:
   - The entity-relationship diagram (`LittleLemon_ER.png`) shows the relationships between the Customers, Tables, and Bookings tables.

5. **Tableau Workbook**:
   - The Tableau workbook (`TableauWorkbook.twbx`) includes visualizations based on the Little Lemon booking data. It connects to the MySQL database and provides insights into bookings, seating capacity, and booking trends.

6. **GitHub Repository**:
   - The project is stored on GitHub for version control and collaboration. It includes all files (SQL schema, stored procedures, Python script, ER diagram, and Tableau workbook) needed to set up the booking system.

## How to Run the Project

1. **Setting up the MySQL Database**:
   - Import the `database_schema.sql` file into your MySQL instance to set up the necessary tables.
   - Run the `stored_procedures.sql` to create the required stored procedures.

2. **Python Setup**:
   - Install the `mysql-connector-python` package using pip: 
     ```
     pip install mysql-connector-python
     ```
   - Modify the connection details in the `connection_script.py` to match your MySQL server settings.

3. **Tableau Visualizations**:
   - Open the `TableauWorkbook.twbx` file in Tableau Desktop to view the pre-built visualizations.
   - Make sure Tableau can connect to your MySQL database.

## Contribution

Feel free to fork the project, raise issues, or submit pull requests for enhancements or bug fixes.

## License

This project is open-source and free to use.
