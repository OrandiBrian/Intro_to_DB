-- Creating a database
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Using the created database
USE alx_book_store;

-- Creating the Authors table first since Books depends on it
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215)
);

-- Creating the Books table
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130),
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    CONSTRAINT fk_books_authors FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Creating the Customers table before Orders
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215),
    email VARCHAR(215),
    address TEXT
);

-- Creating the Orders table after Customers
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Creating the Order_Details table after Orders and Books
CREATE TABLE Order_Details (
    order_detailid INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    CONSTRAINT fk_orderdetails_orders FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    CONSTRAINT fk_orderdetails_books FOREIGN KEY (book_id) REFERENCES Books(book_id)
);