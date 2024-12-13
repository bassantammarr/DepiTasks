/*Task 1: Using Date and Time Functions 
Question: 
Write a SQL query to retrieve all employees who were hired within the last 30 days from the 
current date. 
Instructions: 
1. Use the SELECT statement to choose all relevant columns from the employees table. 
2. Utilize a date function such as CURRENT_DATE or GETDATE() depending on your SQL 
dialect. 
3. Apply date arithmetic to filter rows where the hire date is within the last 30 days. 
4. Use the WHERE clause to compare hire dates.*/

SELECT * FROM employees
WHERE hire_date >= DATEADD(DAY, -30, GETDATE());

/*Task 2: Creating and Using a Stored Procedure 
Question: 
Create a stored procedure named sp_get_employee_hours that retrieves the first name, last 
name, and total hours worked on projects for a given employee ID. 
Instructions: 
1. Define the stored procedure using the CREATE PROCEDURE statement. 
2. Include a parameter for the employee ID (emp_id). 
3. Use a SELECT statement to fetch the required columns (fname, lname, total_hours) 
from the employees and works_on tables. 
4. Join the tables on the appropriate keys (e.g., SSN = ESSN). 
5. Sum the hours worked using the SUM() function and group by employee details.*/
DELIMITER $$

CREATE PROCEDURE sp_get_employee_hours (IN emp_id INT)
BEGIN
SELECT e.first_name AS first_name, e.last_name AS last_name, SUM(w.hours) AS total_hours
FROM employees e
JOIN works_on w
ON e.employee_id = w.employee_id
WHERE e.employee_id = employee_id
GROUP BY e.first_name, e.last_name;
END $$

DELIMITER ;
/*Task 3: Creating a Stored Procedure for Employee Count by Department 
Question: 
Create a stored procedure named sp_department_employee_count that retrieves the 
department ID, department name, and the number of employees in each department, but only for 
departments with more than 5 employees. 
Instructions: 
1. Define the stored procedure using the CREATE PROCEDURE statement. 
2. Use a SELECT statement to fetch the department ID, department name, and count of 
employees. 
3. Use a JOIN to connect the departments and employees tables on the department ID. 
4. Use the GROUP BY clause to group results by department. 
5. Apply the HAVING clause to filter departments with more than 5 employees.*/

DELIMITER $$

CREATE PROCEDURE sp_department_employee_count()
BEGIN
SELECT d.department_id AS department_id, d.department_name AS department_name,
COUNT(e.employee_id) AS employee_count
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) > 5;
END $$

DELIMITER ;

