-- Step 1: Create the table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10, 2)
);

-- Step 2: Start a transaction (some systems do this implicitly)

-- Step 3: Insert initial values
INSERT INTO employees (emp_id, name, position, salary) VALUES (1, 'Alice', 'Developer', 75000.00);
INSERT INTO employees (emp_id, name, position, salary) VALUES (2, 'Bob', 'Manager', 85000.00);

-- Save current state
SAVEPOINT sp1;

-- Step 4: Add more data
INSERT INTO employees (emp_id, name, position, salary) VALUES (3, 'Charlie', 'Analyst', 65000.00);

-- Save this new state
SAVEPOINT sp2;

-- Step 5: Oops! Wrong data entered
INSERT INTO employees (emp_id, name, position, salary) VALUES (4, 'David', 'Intern', 500000.00);  -- too high salary

-- Step 6: Roll back to before bad insert
ROLLBACK TO sp2;

-- Step 7: Insert correct data
INSERT INTO employees (emp_id, name, position, salary) VALUES (4, 'David', 'Intern', 30000.00);

-- Step 8: Commit the transaction
COMMIT;

-- Step 9: Check final table
SELECT * FROM employees;
