-- Create Database
CREATE DATABASE IF NOT EXISTS BankingSystem;

-- Use Database
USE BankingSystem;


-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Address VARCHAR(255),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

-- Accounts Table
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(50),
    Balance DECIMAL(10, 2),
    OpenDate DATE,
    Status VARCHAR(20),
    CONSTRAINT fk_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Transactions Table
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionType VARCHAR(50),
    Amount DECIMAL(10, 2),
    TransactionDate DATE,
    Description VARCHAR(255),
    CONSTRAINT fk_AccountID_Transactions FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

-- Branches Table
CREATE TABLE Branches (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    Location VARCHAR(255),
    ManagerID INT
);

-- Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50),
    BranchID INT
);

-- Adding Foreign Key to Branches table
ALTER TABLE Branches
ADD CONSTRAINT fk_ManagerID FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID);

-- Adding Foreign Key to Employees table
ALTER TABLE Employees
ADD CONSTRAINT fk_BranchID FOREIGN KEY (BranchID) REFERENCES Branches(BranchID);


-- Loans Table
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    LoanType VARCHAR(50),
    Amount DECIMAL(10, 2),
    InterestRate DECIMAL(5, 2),
    Term INT,
    ApprovalDate DATE,
    Status VARCHAR(20),
    CONSTRAINT fk_CustomerID_Loans FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- CreditCards Table
CREATE TABLE CreditCards (
    CardID INT PRIMARY KEY,
    CustomerID INT,
    CardType VARCHAR(50),
    CreditLimit DECIMAL(10, 2),
    ExpiryDate DATE,
    OutstandingBalance DECIMAL(10, 2),
    CONSTRAINT fk_CustomerID_CreditCards FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- CreditCardTransactions Table
CREATE TABLE CreditCardTransactions (
    CreditCardTransactionID INT PRIMARY KEY,
    CardID INT,
    TransactionType VARCHAR(50),
    Amount DECIMAL(10, 2),
    TransactionDate DATE,
    Merchant VARCHAR(100),
    Description VARCHAR(255),
    CONSTRAINT fk_CardID_CreditCardTransactions FOREIGN KEY (CardID) REFERENCES CreditCards(CardID)
);

-- Payments Table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    LoanID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    Method VARCHAR(50),
    CONSTRAINT fk_LoanID_Payments FOREIGN KEY (LoanID) REFERENCES Loans(LoanID)
);

