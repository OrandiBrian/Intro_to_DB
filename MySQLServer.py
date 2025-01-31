import mysql.connector
from mysql.connector import Error

try:
    # database connection details
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="belarandi"
    )

    if connection.is_connected():
        mycursor = connection.cursor()
        mycursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")

except Error as e:
    print(f"Error while connecting to MySQL: {e}")

finally:
    if connection.is_connected():
        mycursor.close()
        connection.close()
        print("MySQL connection is closed.")