-- create  database employees
create database employees;
use employees;
-- Create a simple employees table
CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50),
  department VARCHAR(30),
  salary INT
);

-- Insert sample data
INSERT INTO employees VALUES
(1, 'Alice', 'HR', 50000),
(2, 'Bob', 'IT', 70000),
(3, 'Charlie', 'IT', 80000),
(4, 'David', 'Finance', 60000),
(5, 'Eve', 'HR', 55000);

-- 1. Stored Procedure: Get all employees in a given department
DELIMITER $$

CREATE PROCEDURE GetEmployeesByDept(IN deptName VARCHAR(30))
BEGIN
  SELECT emp_name, salary
  FROM employees
  WHERE department = deptName;
END $$

DELIMITER ;

-- Call the procedure
CALL GetEmployeesByDept('IT');

-- 2. Stored Function: Get average salary of a department
DELIMITER $$

CREATE FUNCTION AvgDeptSalary(deptName VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE avg_salary INT;
  SELECT AVG(salary) INTO avg_salary
  FROM employees
  WHERE department = deptName;
  RETURN avg_salary;
END $$

DELIMITER ;

-- Use the function
SELECT AvgDeptSalary('HR') AS HR_Average_Salary;


