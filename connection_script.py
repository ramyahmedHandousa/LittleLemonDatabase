import mysql.connector
from mysql.connector import Error

# Establish connection to MySQL
def create_connection(host_name, user_name, user_password, db_name):
    connection = None
    try:
        connection = mysql.connector.connect(
            host=host_name,
            user=user_name,
            passwd=user_password,
            database=db_name
        )
        print("Connection to MySQL DB successful")
    except Error as e:
        print(f"The error '{e}' occurred")
    return connection

# Execute stored procedures
def execute_procedure(connection, procedure_name, params=None):
    cursor = connection.cursor()
    try:
        if params:
            cursor.callproc(procedure_name, params)
        else:
            cursor.callproc(procedure_name)
        for result in cursor.stored_results():
            print(result.fetchall())
        print(f"Procedure {procedure_name} executed successfully")
    except Error as e:
        print(f"The error '{e}' occurred")
    cursor.close()

# Main function to run the procedures
if __name__ == "__main__":
    connection = create_connection("localhost", "root", "your_password", "little_lemon")

    # Example: Call GetMaxQuantity stored procedure
    execute_procedure(connection, "GetMaxQuantity")

    # Example: Call ManageBooking stored procedure
    execute_procedure(connection, "ManageBooking", [1, 2, "2024-09-30 18:00:00"])

    # Example: Call AddBooking stored procedure
    execute_procedure(connection, "AddBooking", [3, 1, "2024-10-01 20:00:00"])

    connection.close()
