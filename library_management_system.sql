/****************************************************** LIBRARY MANAGEMENT SYSTEM ****************************************************/

-- Database Creation
CREATE DATABASE library;
USE library;

-- Branch Table Creation
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(100),
    Contact_no VARCHAR(15)
);

-- Employee Table Creation
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Books Table Creation
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(100),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3) DEFAULT 'YES',
    Author VARCHAR(50),
    Publisher VARCHAR(50)
);

-- Customer Table Creation
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(50),
    Customer_address VARCHAR(100),
    Reg_date DATE
);

-- IssueStatus Table Creation
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(100),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- ReturnStatus Table Creation
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(100),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

/***************************************************************************************************************************************/

-- INSERTING VALUES TO TABLES
-- Inserting Values to Branch Table
INSERT INTO Branch ( Branch_no, Manager_Id , Branch_address, Contact_no) VALUES
(1,101,'Systech Solutions, opposite CSI Church Road, Mananchira, Kozhikode, Kerala - 673001', '1234567890'),
(2,102,'Systech Solutions, Poojappura Main Rd, Poojapura, Thiruvananthapuram, Kerala - 695012', '3456789012'),
(3,103,'Systech Solutions, east fort junction, RC Bishop House Rd, Thrissur, Kerala - 680005', '5678901234');
SELECT * FROM Branch;

-- Inserting Values to Employee Table
INSERT INTO Employee ( Emp_Id, Emp_name, Position , Salary, Branch_no) VALUES
(101, 'ABHIRAM KRISHNA', 'Branch Manager', 148000, 1),
(102, 'DILNA SURESH', 'Branch Manager', 175000, 2),
(103, 'SHYAMJITH N K', 'Branch Manager', 183000, 3),
(104, 'APARNA KARTHIK', 'H R Manager', 62000, 1),
(105, 'ABHINAND S', 'Senior Accountant', 76000, 1),
(106, 'AKSHAY K P', 'Network Engineer', 63000, 1),
(107, 'NEERAJ V K', 'DevOps Engineer', 120000, 1),
(108, 'ADIL MAJEED', 'Security architect', 123000, 1),
(109, 'SACHIN DINESH', 'H R Manager', 68000, 2),
(110, 'LIGIL SREEKUMAR', 'H R Manager', 48000, 3);
SELECT * FROM Employee;

-- Inserting Values to Books Table
INSERT INTO Books ( ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('978-1847941831', 'Atomic Habits', 'Self-help', 29.00, 'NO', 'James Clear', 'Penguin Random House'),
('978-8901234567', 'The Chronicles of Narnia', 'Fantasy', 23.00, 'YES', 'C. S. Lewis', 'Geoffrey Bles'),
('978-9012345678', 'The Da Vinci Code', 'Thriller', 18.00, 'YES', 'Dan Brown', 'Doubleday'),
('978-0123456789', 'A Brief History of Time', 'Science', 26.00, 'YES', 'Stephen Hawking', 'Bantam Dell');
SELECT * FROM Books;

-- Inserting Values to Customer Table
INSERT INTO Customer ( Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(1001, 'VYSAKH O K', 'House No. 14, BKM Road, Pottammal, Kozhikode, Kerala - 673001', '2018-05-28'),
(1002, 'HARSHITHA', 'House No. 9, KB Road, Mankavu, Kozhikode, Kerala - 673007', '2023-01-15'),
(1001, 'KAVYA V K', 'House No. 2/11, OV Road, Chelavoor, Kozhikode, Kerala - 673571', '2000-05-28');
SELECT * FROM Customer;

-- Inserting Values to IssueStatus Table
INSERT INTO IssueStatus ( Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(10001, 1001, 'Atomic Habits', '2023-05-11', '978-1847941831'),
(10002, 1003, 'The Da Vinci Code', '2024-01-23', '978-9012345678');
SELECT * FROM IssueStatus;

-- Inserting Values to ReturnStatus Table
INSERT INTO ReturnStatus ( Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(20001, 1002, 'The Da Vinci Code', '2024-05-02', '978-9012345678');
SELECT * FROM ReturnStatus;

/**************************************************************************************************************************************/

-- QUERIES

-- Q1. Retrieve the book title, category, and rental price of all available books. 
SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'YES';

-- Q2. List the employee names and their respective salaries in descending order of salary. 
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

-- Q3. Retrieve the book titles and the corresponding customers who have issued those books. 
SELECT b.Book_title, c.Customer_name FROM Books b JOIN IssueStatus i ON b.ISBN = i.Isbn_book JOIN Customer c ON i.Issued_cust = c.Customer_Id;

-- Q4. Display the total count of books in each category. 
SELECT Category, COUNT(*) as 'Total Books' FROM Books GROUP BY Category;

-- Q5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

-- Q6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 
SELECT Customer_name FROM Customer WHERE Reg_date < '2022-01-01' AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- Q7. Display the branch numbers and the total count of employees in each branch. 
SELECT Branch_no, COUNT(*) as 'Total Employees' FROM Employee GROUP BY Branch_no;

-- Q8. Display the names of customers who have issued books in the month of June 2023.
SELECT DISTINCT c.Customer_name FROM Customer c JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust WHERE Issue_date LIKE '2023-06-%';

-- Q9. Retrieve book_title from book table containing 'history'. 
SELECT Book_title FROM Books WHERE Book_title LIKE '%history%';

-- Q10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, COUNT(*) as 'Employee Count' FROM Employee GROUP BY Branch_no HAVING COUNT(*) > 5;

-- Q11. Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT e.Emp_name, b.Branch_address FROM Employee e JOIN Branch b ON e.Emp_Id = b.Manager_Id;

-- Q12.  Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT DISTINCT c.Customer_name FROM Customer c JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust JOIN Books b ON i.Isbn_book = b.ISBN WHERE b.Rental_Price > 25;

/************************************************************ END OF SCRIPT **********************************************************/