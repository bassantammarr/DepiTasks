/*Task 1: Creating a Simple View 
Question: 
Create a simple view named vw_employee_details that displays the first name, last name, and 
department name of employees. 
Instructions: 
1. Use the CREATE VIEW statement to define a new view. 
2. Select the columns fname, lname, and dname (department name) from the appropriate 
tables. 
3. Use JOIN to connect the employees and departments tables using the department ID.*/
CREATE VIEW vw_employee_details AS
SELECT e.first_name AS first_name, e.last_name AS last_name, d.department_name AS department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

/*Task 2: Modifying a View 
Question: 
Modify the existing view vw_work_hrs to only include employees working in department 
number 5. 
Instructions: 
1. Use the CREATE OR REPLACE VIEW statement to update the view. 
2. Filter the results using the WHERE clause to include only employees with department 
number 5. 
3. Ensure that the columns selected are fname, lname, pname, and hours. */

CREATE OR REPLACE VIEW vw_work_hrs AS
SELECT e.first_name AS first_name, e.last_name AS last_name, p.project_name AS project_name, w.hours AS work_hours
FROM employees e
JOIN works_on w
ON e.employee_id = w.employee_id
JOIN projects p
ON w.project_id = p.project_id
WHERE e.department_id = 5;



/*Task 3: Creating Views with Check Option 
Question: 
Create a view named vw_high_status_suppliers to display all suppliers with a status greater 
than 15, and ensure that any updates or inserts through the view still meet the status condition. 
Instructions: 
1. Use the CREATE VIEW statement to define the view. 
2. Include the WITH CHECK OPTION to enforce that all modifications through the view 
adhere to the condition that status must be greater than 15. 
3. Use a SELECT statement to pull all columns from the suppliers table.*/

CREATE VIEW vw_high_status_suppliers AS
SELECT * FROM suppliers
WHERE status > 15
WITH CHECK OPTION;
