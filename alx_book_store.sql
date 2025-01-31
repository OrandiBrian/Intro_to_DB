-- Creating a database
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- using the created database
USE DATABASE alx_book_store;

-- creating tables
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130),
    author_id INT FOREIGN KEY REFERENCES Authors(author_id),
    price DOUBLE,
    publication_date DATE
);

CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215),
    email VARCHAR(215),
    address TEXT
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES customers(customer_id),
    order_date DATE
);

CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY,
    order_id INT FOREIGN KEY REFERENCING Orders(order_id),
    book_id INT FOREIGN KEY REFERENCING Books(book_id),
    quantity DOUBLE
);