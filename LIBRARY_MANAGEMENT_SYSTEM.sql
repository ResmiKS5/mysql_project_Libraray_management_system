CREATE DATABASE Library;
USE library;
CREATE TABLE Branch (
Branch_no INT PRIMARY KEY,
Manager_Id INT,
Branch_address VARCHAR(100),
Contact_no VARCHAR(20)
);

CREATE TABLE Employee (
Emp_Id INT PRIMARY KEY,
Emp_name VARCHAR(50),
Position VARCHAR(50),
Salary DECIMAL(10, 2),
FOREIGN KEY (Emp_Id) REFERENCES Branch(Manager_Id)
);

CREATE TABLE Customer (
Customer_Id INT PRIMARY KEY,
Customer_name VARCHAR(50),
Customer_address VARCHAR(100),
Reg_date DATE
);

CREATE TABLE IssueStatus (
Issue_Id INT PRIMARY KEY,
Issued_cust INT,
Issued_book_name VARCHAR(100),
Issue_date DATE,
Isbn_book VARCHAR(50),
FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

CREATE TABLE ReturnStatus (
Return_Id INT PRIMARY KEY,
Return_cust INT,
Return_book_name VARCHAR(100),
Return_date DATE,
Isbn_book2 VARCHAR(50),
FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

CREATE TABLE Books (
ISBN VARCHAR(50) PRIMARY KEY,
Book_title VARCHAR(100),
Category VARCHAR(50),
Rental_Price DECIMAL(10, 2),
Status ENUM('yes', 'no'),
Author VARCHAR(50),
Publisher VARCHAR(50)
);

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(1001, 151, 'Palayam, Thiruvananthapuram', '987-654-3210'),
(1002, 152, 'Kottarakkara, Kollam', '987-654-3211'),
(1003, 153, 'Aranmula, Pathanamthitta', '987-654-3212'),
(1004, 154, ‘Ambalapuzha, Alappuzha’, '987-654-3213'),
(1005, 155, ‘Ramapuram, Kottayam, '987-654-3214'),
(1006, 156, ‘Vytilla, Ernakulam’, '987-654-3215'),
(1007, 157, ‘Ottapalam, Palakkad’, '987-654-3216'),
(1008, 158, ‘Nilambur, Malappuram’, '987-654-3217'),
(1009, 159, ‘, Kozhikode’, '987-654-3218'),
(1010, 160, ‘, Kasaragod’, '987-654-3219'),
(1011, 161, ‘, Kannur’, '987-654-3220'),
(1012, 162, ‘, Thrissur, '987-654-3221'),
(1013, 163, ‘, Wayanad, '987-654-3222'),
(1014, 164, ‘, Idukki, '987-654-3223');

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary)
VALUES
(151, 'Resmi K S', 'Librarian', 67000.00),
(152, 'Mahesh A', 'Assistant Librarian', 43000.00),
(153,'Latha A', 'Librarian', 67000.00),
(154, 'Santra L', 'Librarian', 67000.00),
(155, 'Aneesh K', 'Assistant Librarian', 43000.00),
(156, 'Banu S', 'Librarian', 67000.00),
(157, 'Charu R', 'Assistant Librarian', 43000.00),
(158, 'Deepu G', 'Librarian', 67000.00),
(159, 'Eshan V', 'Assistant Librarian', 43000.00),
(160, 'Farooq K', 'Librarian', 67000.00),
(161, 'Gayathri A', 'Assistant Librarian', 43000.00),
(162, 'Hari P', 'Librarian', 67000.00),
(163, 'Irshad T', 'Assistant Librarian', 43000.00),
(164, 'Jeyanthi B', 'Librarian', 67000.00);

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(11, 'Aliya', '123 XY St, City A', '2023-01-15'),
(12, 'Badra', '456 UV St, City B', '2023-02-20'),
(13, 'Chithra', ' 789 KL St , City C', '2023-03-10'),
(14, 'Greeshma', '789 KL St , City C', '2023-03-10'),

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(2001, 11, 'Book A', '2023-04-01', '978-1234567890'),
(2002, 12, 'Book B', '2023-04-02', '978-0987654321'),
(2003, 13, 'Book C', '2023-04-03', '978-9876543210'),

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(3001, 1001, 'Book A', '2023-04-10', '978-1234567890'),
(3002, 1002, 'Book B', '2023-04-12', '978-0987654321'),
(3003, 1003, 'Book C', '2023-04-15', '978-9876543210'),

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('978-1234567890', 'Book A', 'Fiction', 12.99, 'yes', 'John Author', 'Publisher X'),
('978-0987654321', 'Book B', 'Mystery', 10.99, 'yes', 'Jane Writer', 'Publisher Y'),
('978-9876543210', 'Book C', 'Science Fiction', 14.99, 'yes', 'Michael Novelist', 'Publisher Z'),

--#Q1

SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

--#Q2

SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

--#Q3

SELECT i.Issued_book_name AS Book_Title, c.Customer_name AS Customer_Name
FROM IssueStatus i
JOIN Customer c ON i.Issued_cust = c.Customer_Id
JOIN Books b ON i.Isbn_book = b.ISBN;

--#Q4

SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

--#Q5

SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

--#Q6
--List the customer names who registered before 2022-01-01 and have not issued any books yet.

SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (
SELECT DISTINCT Issued_cust
FROM IssueStatus

);

--#Q7

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

--#Q8

SELECT DISTINCT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE MONTH(i.Issue_date) = 6 AND YEAR(i.Issue_date) = 2023;

--#Q9

SELECT Book_title
FROM Books
WHERE Category LIKE '%history%';

--#Q10

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;