#### -- Database Creation
CREATE DATABASE library;<br>
USE library;

#### -- Branch Table Creation
CREATE TABLE Branch (<br>
    Branch_no INT PRIMARY KEY,<br>
    Manager_Id INT,<br>
    Branch_address VARCHAR(100),<br>
    Contact_no VARCHAR(15)<br>
);

#### -- Employee Table Creation
CREATE TABLE Employee (<br>
    Emp_Id INT PRIMARY KEY,<br>
    Emp_name VARCHAR(50),<br>
    Position VARCHAR(50),<br>
    Salary DECIMAL(10, 2),<br>
    Branch_no INT,<br>
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)<br>
);

#### -- Books Table Creation
CREATE TABLE Books (<br>
    ISBN VARCHAR(20) PRIMARY KEY,<br>
    Book_title VARCHAR(100),<br>
    Category VARCHAR(50),<br>
    Rental_Price DECIMAL(10, 2),<br>
    Status VARCHAR(3) DEFAULT 'YES',<br>
    Author VARCHAR(50),<br>
    Publisher VARCHAR(50)<br>
);

#### -- Customer Table Creation
CREATE TABLE Customer (<br>
    Customer_Id INT PRIMARY KEY,<br>
    Customer_name VARCHAR(50),<br>
    Customer_address VARCHAR(100),<br>
    Reg_date DATE<br>
);

#### -- IssueStatus Table Creation
CREATE TABLE IssueStatus (<br>
    Issue_Id INT PRIMARY KEY,<br>
    Issued_cust INT,<br>
    Issued_book_name VARCHAR(100),<br>
    Issue_date DATE,<br>
    Isbn_book VARCHAR(20),<br>
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),<br>
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)<br>
);

#### -- ReturnStatus Table Creation
CREATE TABLE ReturnStatus (<br>
    Return_Id INT PRIMARY KEY,<br>
    Return_cust INT,<br>
    Return_book_name VARCHAR(100),<br>
    Return_date DATE,<br>
    Isbn_book2 VARCHAR(20),<br>
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)<br>
);

#### Output Screen Shot
![image](https://github.com/abhi-ram-krishna/Library-Management-System-MySQL/assets/42677472/e7a6437b-5d57-41cc-aa7b-a54757128913)
<hr>
