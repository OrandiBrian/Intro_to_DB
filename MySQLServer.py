import mysql.connector

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

except mysql.connector.Error:
    print("Error while connecting to MySQL")

finally:
    if connection.is_connected():
        mycursor.close()
        connection.close()
        print("MySQL connection is closed.")