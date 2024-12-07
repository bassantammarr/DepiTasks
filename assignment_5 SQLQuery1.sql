-- ○ Write a SQL query to retrieve all columns from a table named employees.
SELECT * from employees;


--○ Write a SQL query to retrieve the emp_id, emp_name, and dept_id from the employees table, where the location is 'Cairo'.
SELECT employee_id, first_name, department_id 
FROM employees
WHERE location = 'Cairo';


--○ Write a SQL query that displays distinct dept_id values from the employees table. 
SELECT DISTINCT department_id
FROM employees;


/* 
○ Write a SQL query to create a table students with the following columns: ID 
(Primary Key), First_Name (not null), Last_Name (default 'Unknown'), 
Address (default 'N/A'), City (default 'N/A'), and Birth_Date.*/

CREATE TABLE student (
student_id INT PRIMARY KEY ,
first_name VARCHAR(30) NOT NULL ,
last_name VARCHAR(30) DEFAULT 'unknown',
address VARCHAR(50) DEFAULT 'N/A' ,
city VARCHAR(30) DEFAULT 'N/A' ,
birth_date DATE )

--Write a SQL query to drop the students table. 
DROP TABLE student;


--Write a SQL query to insert the following values into the students table: ('Ahmed', 'Ali', 'Downtown', 'Cairo', '1995-01-01'). 
INSERT INTO student (first_name , last_name , address , city , birth_date)
VALUES ('Ahmed', 'Ali', 'Downtown', 'Cairo', '1995-01-01');


--Write a SQL query to update the Address of the student with Last_Name = 'Ahmed' to 'Garden City'. 
UPDATE student 
SET address= 'Garden City'
WHERE last_name ='Ahmed'


--Write a SQL query to delete the rows from the students table where City is 
'Cairo', and then rollback the transaction.
BEGIN TRANSACTION 
DELETE FROM student 
WHERE city ='cairo'
ROLLBACK



