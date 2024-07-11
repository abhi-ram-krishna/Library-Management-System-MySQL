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

#### Output Screenshot
![image](https://github.com/abhi-ram-krishna/Library-Management-System-MySQL/assets/42677472/e7a6437b-5d57-41cc-aa7b-a54757128913)

<hr>

#### -- INSERTING VALUES TO TABLES

#### -- Inserting Values to Branch Table
INSERT INTO Branch ( Branch_no, Manager_Id , Branch_address, Contact_no) VALUES<br>
(1,101,'Systech Solutions, opposite CSI Church Road, Mananchira, Kozhikode, Kerala - 673001', '1234567890'),<br>
(2,102,'Systech Solutions, Poojappura Main Rd, Poojapura, Thiruvananthapuram, Kerala - 695012', '3456789012'),<br>
(3,103,'Systech Solutions, east fort junction, RC Bishop House Rd, Thrissur, Kerala - 680005', '5678901234');<br>
SELECT * FROM Branch;
#### Output Screenshot
![image](https://github.com/abhi-ram-krishna/Library-Management-System-MySQL/assets/42677472/2166acc6-9293-45a0-8963-1afdbfa44e80)
#### -- Inserting Values to Employee Table
INSERT INTO Employee ( Emp_Id, Emp_name, Position , Salary, Branch_no) VALUES<br>
(101, 'ABHIRAM KRISHNA', 'Branch Manager', 148000, 1),<br>
(102, 'DILNA SURESH', 'Branch Manager', 175000, 2),<br>
(103, 'SHYAMJITH N K', 'Branch Manager', 183000, 3),<br>
(104, 'APARNA KARTHIK', 'H R Manager', 62000, 1),<br>
(105, 'ABHINAND S', 'Senior Accountant', 76000, 1),<br>
(106, 'AKSHAY K P', 'Network Engineer', 63000, 1),<br>
(107, 'NEERAJ V K', 'DevOps Engineer', 120000, 1),<br>
(108, 'ADIL MAJEED', 'Security architect', 123000, 1),<br>
(109, 'SACHIN DINESH', 'H R Manager', 68000, 2),<br>
(110, 'LIGIL SREEKUMAR', 'H R Manager', 48000, 3);<br>
SELECT * FROM Employee;
#### Output Screenshot
![image](https://github.com/abhi-ram-krishna/Library-Management-System-MySQL/assets/42677472/4e96c3e9-9cce-4faa-9c3f-a9f7f8caa597)
#### -- Inserting Values to Books Table
INSERT INTO Books ( ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES<br>
('978-1847941831', 'Atomic Habits', 'Self-help', 29.00, 'NO', 'James Clear', 'Penguin Random House'),<br>
('978-8901234567', 'The Chronicles of Narnia', 'Fantasy', 23.00, 'YES', 'C. S. Lewis', 'Geoffrey Bles'),<br>
('978-9012345678', 'The Da Vinci Code', 'Thriller', 18.00, 'YES', 'Dan Brown', 'Doubleday'),<br>
('978-0123456789', 'A Brief History of Time', 'Science', 26.00, 'YES', 'Stephen Hawking', 'Bantam Dell');<br>
SELECT * FROM Books;
#### Output Screenshot
![image](https://github.com/abhi-ram-krishna/Library-Management-System-MySQL/assets/42677472/d3c5aa89-ee66-44b0-9008-2f20a0f6bb69)
#### -- Inserting Values to Customer Table
INSERT INTO Customer ( Customer_Id, Customer_name, Customer_address, Reg_date) VALUES<br>
(1001, 'VYSAKH O K', 'House No. 14, BKM Road, Pottammal, Kozhikode, Kerala - 673001', '2018-05-28'),<br>
(1002, 'HARSHITHA', 'House No. 9, KB Road, Mankavu, Kozhikode, Kerala - 673007', '2023-01-15'),<br>
(1001, 'KAVYA V K', 'House No. 2/11, OV Road, Chelavoor, Kozhikode, Kerala - 673571', '2000-05-28');<br>
SELECT * FROM Customer;
#### Output Screenshot
![image](https://github.com/abhi-ram-krishna/Library-Management-System-MySQL/assets/42677472/43a5d968-b019-4dcf-80f5-3e0f2289df29)
#### -- Inserting Values to IssueStatus Table
INSERT INTO IssueStatus ( Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES<br>
(10001, 1001, 'Atomic Habits', '2023-05-11', '978-1847941831'),<br>
(10002, 1003, 'The Da Vinci Code', '2024-01-23', '978-9012345678');<br>
SELECT * FROM IssueStatus;
#### Output Screenshot
![image](https://github.com/abhi-ram-krishna/Library-Management-System-MySQL/assets/42677472/78c9eeff-83f3-4808-9eca-c5e540adecd9)
#### -- Inserting Values to ReturnStatus Table
INSERT INTO ReturnStatus ( Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES<br>
(20001, 1002, 'The Da Vinci Code', '2024-05-02', '978-9012345678');<br>
SELECT * FROM ReturnStatus;
#### Output Screenshot
![image](https://github.com/abhi-ram-krishna/Library-Management-System-MySQL/assets/42677472/23dcf022-d0c5-4002-aeec-15df01ee2351)

<hr>





