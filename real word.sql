CREATE DATABASE bank_project;
USE bank_project;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    city VARCHAR(50),
    income DECIMAL(10,2)
);
CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_amount DECIMAL(10,2),
    loan_status VARCHAR(20), -- Approved / Rejected / Pending
    loan_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO customers VALUES
(1, 'Varshini', 22, 'Chennai', 30000),
(2, 'Arun', 30, 'Bangalore', 50000),
(3, 'Priya', 27, 'Hyderabad', 40000),
(4, 'Kumar', 35, 'Chennai', 25000);

INSERT INTO loans VALUES
(101, 1, 100000, 'Approved', '2025-01-10'),
(102, 2, 200000, 'Rejected', '2025-02-15'),
(103, 3, 150000, 'Approved', '2025-03-05'),
(104, 4, 50000, 'Pending', '2025-03-20');
SELECT SUM(loan_amount) AS total_loans
FROM loans;
SELECT * 
FROM loans
WHERE loan_status = 'Approved';
SELECT c.name, c.income, l.loan_amount
FROM customers c
JOIN loans l ON c.customer_id = l.customer_id
WHERE c.income < 30000 AND l.loan_amount > 100000;
SELECT loan_status, COUNT(*) AS total
FROM loans
GROUP BY loan_status;
SELECT c.name, SUM(l.loan_amount) AS total_loan
FROM customers c
JOIN loans l ON c.customer_id = l.customer_id
GROUP BY c.name
ORDER BY total_loan DESC;
