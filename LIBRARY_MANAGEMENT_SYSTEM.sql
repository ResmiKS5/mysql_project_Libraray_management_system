CREATE DATABASE Library;
USE Library;

CREATE TABLE Branch(Branch_no INT PRIMARY KEY,
                    Manager_Id INT,
                    Branch_address VARCHAR(30),
                    Contact_no VARCHAR(20));
                   
INSERT INTO Branch VALUES
(1001, 151, 'Palayam, Thiruvananthapuram', '987-654-3210'),
(1002, 152, 'Kottarakkara, Kollam', '987-654-3211'),
(1003, 153, 'Aranmula, Pathanamthitta', '987-654-3212'),
(1004, 154, 'Ambalapuzha, Alappuzha', '987-654-3213'),
(1005, 155, 'Ramapuram, Kottayam', '987-654-3214'),
(1006, 156, 'Vytilla, Ernakulam', '987-654-3215'),
(1007, 157, 'Ottapalam, Palakkad', '987-654-3216'),
(1008, 158, 'Nilambur, Malappuram', '987-654-3217'),
(1009, 159, 'Nadakavu, Kozhikode', '987-654-3218'),
(1010, 160, 'Nileshwaram, Kasaragod', '987-654-3219'),
(1011, 161, 'Thalassery, Kannur', '987-654-3220'),
(1012, 162, 'Guruvayoor, Thrissur', '987-654-3221'),
(1013, 163, 'Vythiri, Wayanad', '987-654-3222'),
(1014, 164, 'Kattappana, Idukki', '987-654-3223'); 

CREATE TABLE Employee(Emp_id INT PRIMARY KEY,
                      Emp_name VARCHAR(20) NOT NULL,
                      Position VARCHAR(20),Salary INT);
                      
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
DROP table Customer;
CREATE TABLE Customer(Customer_id INT PRIMARY KEY AUTO_INCREMENT,
				      Customer_name VARCHAR(20) NOT NULL,
                      Customer_address VARCHAR(50) NOT NULL,
                      Reg_date DATE);
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(123,'Merin','54/9,Dwaraka,Nellimoodu,Thiruvananthapuram','2023-07-28'),
(124,'Mamtha','2/7,Rachel"s house,Varkala,Kollam','2023-06-15'),
(125,'Krishna','31/6,Devaragam,Pathanamthitta','2023-05-03'),
(126,'Sruthi','8/123,Changanassery,Kottayam','2022-04-15'),
(127,'Linda','41/98,Guruvayur,Thrissur','2023-01-10'),
(128,'Eby','7/40,Vytila,Ernakulam','2022-02-14'),
(129,'Pushpa','21/6,Payyanur,Kannur','2023-01-13'),
(130,'Preetha','19/3,Koipady,Kasargode','2020-08-10'),
(131,'Chinchu','7/20,Beypore,Kozhikode','2021-09-12'),
(132,'Vishnu','5/2,Vandanam,Mananthavady,Wayanad','2022-01-31');

drop table Books;
CREATE TABLE Books(ISBN VARCHAR(50) PRIMARY KEY,
                   Book_title VARCHAR(50) NOT NULL,
                   Category VARCHAR(20) NOT NULL,
				   Rental_price FLOAT, 
                   Status VARCHAR(20),
                   Author VARCHAR(50) NOT NULL,
                   Publisher VARCHAR(50)  NOT NULL);
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('978-45-67890-09-8','Randamoozham','Novel',10.00,'Yes','M.T.Vasudevan Nair','XXX'),
('978-12-67890-09-8','Pathummayude Aadu','Novel',20.00,'Yes','Vaikom Muhammed Basheer','YYY'),
('978-34-67890-09-8','Aadujeevitham','Travel writing',10.00,'Yes','Benyamin','ZZZ'),
('978-56-67890-09-8','The legends of Khasak','Novel',20.00,'Yes','0.V.Vijayan','AAA'),
('978-78-67890-09-8','Balyakalasakhi','Novel',10.00,'Yes','Vaikom Muhammed Basheer','BBB'),
('978-90-67890-09-8','Ente Kadha','Novel',10.00,'Yes','Kamala Suraiyya Das','CCC'),
('978-01-67890-09-8','Oru Desathinte Katha ','Novel',20.00,'Yes','S.K.Pottekadu','DDD'),
('978-02-67890-09-8','Naalukettu','Novel',20.00,'Yes','M.T.Vasudevan Nair','EEE'),
('978-03-67890-09-8','Oru Sangeerthanam pole','Novel',10.00,'Yes','Perumbadavam Sreedharan','FFF'),
('978-04-67890-09-8','Premalekhanam','Novel',20.00,'Yes','Vaikom Muhammed Basheer','GGG');

CREATE TABLE IssueStatus (
Issue_Id INT PRIMARY KEY,
Issued_cust INT,
Issued_book_name VARCHAR(100),
Issue_date DATE,
Isbn_book VARCHAR(50),
FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(401,123,'Randamoozham','2023-01-01','978-45-67890-09-8'),
(402,124,'Pathummayude Aadu','2023-02-02','978-12-67890-09-8'),
(403,125,'Aadujeevitham','2023-03-03','978-34-67890-09-8'),
(404,126,'The legends of Khasak','2023-04-04','978-56-67890-09-8'),
(405,127,'Balyakalasakhi','2023-05-05','978-78-67890-09-8'),
(406,128,'Ente Kadha','2023-06-06','978-90-67890-09-8'),
(407,129,'Oru Desathinte Katha ','2023-07-07','978-01-67890-09-8'),
(408,130,'Naalukettu','2022-12-12','978-02-67890-09-8'),
(409,131,'Oru Sangeerthanam pole','2023-01-02','978-03-67890-09-8'),
(410,132,'Premalekhanam','2023-02-14','978-04-67890-09-8');

CREATE TABLE ReturnStatus (
Return_Id INT PRIMARY KEY,
Return_cust INT,
Return_book_name VARCHAR(100),
Return_date DATE,
Isbn_book2 VARCHAR(50),
FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(01,123,'Randamoozham','2023-02-01','978-45-67890-09-8'),
(02,124,'Pathummayude Aadu','2023-03-02','978-12-67890-09-8'),
(03,125,'Aadujeevitham','2023-04-03','978-34-67890-09-8'),
(04,126,'The legends of Khasak','2023-05-04','978-56-67890-09-8'),
(05,127,'Balyakalasakhi','2023-06-05','978-78-67890-09-8'),
(06,128,'Ente Kadha','2023-07-06','978-90-67890-09-8'),
(07,129,'Oru Desathinte Katha ','2023-08-07','978-01-67890-09-8'),
(08,130,'Naalukettu','2023-01-12','978-02-67890-09-8'),
(09,131,'Oru Sangeerthanam pole','2023-02-02','978-03-67890-09-8'),
(10,132,'Premalekhanam','2023-03-14','978-04-67890-09-8');

SELECT Book_title, Category, Rental_price FROM Books WHERE Status = 'Yes';

SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

SELECT i.Issued_book_name AS Book_Title, c.Customer_name AS Customer_Name
FROM IssueStatus i
JOIN Customer c ON i.Issued_cust = c.Customer_Id
JOIN Books b ON i.Isbn_book = b.ISBN;

SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (
SELECT DISTINCT Issued_cust
FROM IssueStatus);

SELECT Branch.Branch_no, count(Employee.Emp_name) FROM Branch LEFT JOIN Employee
ON Branch.Manager_Id=Employee.Emp_id GROUP BY Branch_no;

SELECT Customer_name FROM Customer LEFT JOIN IssueStatus 
ON Customer.Customer_id=IssueStatus.Issued_cust
WHERE monthname(IssueStatus.Issue_date)='June' AND year(IssueStatus.Issue_date)='2023';

SELECT Book_title FROM Books WHERE Category = 'History';

SELECT Branch.Branch_no, count(Employee.Emp_name) FROM Branch LEFT JOIN Employee
ON Branch.Manager_Id=Employee.Emp_id  GROUP BY Branch_no HAVING count(Employee.Emp_name)>5;
