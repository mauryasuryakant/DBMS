CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (emp_id, name, position, salary) VALUES (1, 'Alice', 'Developer', 75000.00);
INSERT INTO employees (emp_id, name, position, salary) VALUES (2, 'Bob', 'Manager', 85000.00);

SAVEPOINT sp1;

INSERT INTO employees (emp_id, name, position, salary) VALUES (3, 'Charlie', 'Analyst', 65000.00);

SAVEPOINT sp2;

INSERT INTO employees (emp_id, name, position, salary) VALUES (4, 'David', 'Intern', 500000.00);  -- too high salary

ROLLBACK TO sp2;

INSERT INTO employees (emp_id, name, position, salary) VALUES (4, 'David', 'Intern', 30000.00);

COMMIT;

SELECT * FROM employees;


