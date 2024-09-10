CREATE DATABASE qlnhanvien;
USE qlnhanvien;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    salary DECIMAL(10, 2),
    start_date DATE,
    department_id INT
);

CREATE TABLE access_rights (
    access_id INT PRIMARY KEY,
    employee_id INT,
    access_level VARCHAR(255),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255)
);

INSERT INTO employees (employee_id, employee_name, salary, start_date, department_id)
VALUES
    (1, 'John Doe', 60000, '2021-01-15', 1),
    (2, 'Jane Smith', 70000, '2020-05-20', 2),
    (3, 'Bob Johnson', 55000, '2022-03-10', 1),
    (4, 'Alice Williams', 80000, '2021-08-05', 3),
    (5, 'Charlie Brown', 65000, '2020-12-01', 2);

INSERT INTO employees (employee_id, employee_name, salary, start_date, department_id)
VALUES
    (6, 'Charlie Brown2', 65000, '2022-12-01', 4);


INSERT INTO departments (department_id, department_name)
VALUES
    (1, 'IT'),
    (2, 'Sales'),
    (3, 'HR');
INSERT INTO departments (department_id, department_name)
VALUES
    (4, 'Manager');


INSERT INTO access_rights (access_id, employee_id, access_level)
VALUES
    (1, 1, 'Admin'),
    (2, 2, 'User'),
    (3, 3, 'User'),
    (4, 4, 'Admin'),
    (5, 5, 'User');
    
   
-- 1)
SELECT * FROM employees;

-- 2)
SELECT e.employee_name, e.salary FROM employees e;
   
-- 3)
SELECT * FROM employees
WHERE salary > 50000;

-- 4)
SELECT e.department_id, d.department_name, COUNT(*) as employee_count
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY e.department_id;

-- 5)
SELECT * 
FROM employees e
ORDER BY e.employee_name;

-- 6)
SELECT 
e.employee_name, e.salary, e.department_id
FROM employees e
WHERE e.salary >= 40000 AND e.salary <= 60000
ORDER BY e.salary DESC;

-- 7)
SELECT SUM(e.salary) as total_salary 
FROM employees e;

-- 8)
SELECT e.employee_name , d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- 9)
SELECT e.department_id, d.department_name, COUNT(*) as employee_count
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY e.department_id
HAVING COUNT(*) >= 3;

-- 10)
SELECT e.employee_name , e.salary, d.department_name 
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'IT' OR d.department_name = 'Sales';

-- 11)
SELECT e.employee_name , e.start_date
FROM employees e
WHERE YEAR(e.start_date) > 2020;

-- 12)
SELECT AVG(e.salary) as avg_salary 
FROM employees e;

-- 13)
SELECT d.department_id, d.department_name, COUNT(*) as employee_count
FROM departments d
JOIN employees e ON e.department_id = d.department_id
GROUP BY e.department_id;

-- 14)
SELECT *
FROM employees e
ORDER BY e.salary DESC
LIMIT 5;

-- 15)
SELECT *
FROM employees e
WHERE e.employee_name LIKE 'a%';

-- 16)
SELECT e.employee_name, ar.access_level 
FROM employees e
JOIN access_rights ar ON e.employee_id = ar.employee_id
WHERE ar.access_level IN ('Admin');

-- 17)
SELECT d.department_id, d.department_name, SUM(e.salary) as total_salary
FROM departments d
JOIN employees e ON e.department_id = d.department_id
GROUP BY e.department_id
ORDER BY total_salary DESC;

-- 18)
SELECT e.employee_name, e.start_date 
FROM employees e
ORDER BY e.start_date;

-- 19)
SELECT e.employee_name, e.salary as max_salary, dt.department_name
FROM employees e 
JOIN (
	SELECT d.department_id, d.department_name , MAX(e.salary) as max_salary
	FROM departments d
	JOIN employees e ON e.department_id = d.department_id
	GROUP BY d.department_id, d.department_name
) dt
ON e.department_id  = dt.department_id AND e.salary = dt.max_salary;

-- 20)
SELECT e.employee_name, ar.access_level 
FROM employees e
LEFT JOIN access_rights ar ON e.employee_id = ar.employee_id;

  
  
  
  
  
  
  
  
  
  
  