-- ============================================
-- Library Management System - MySQL Schema
-- ============================================

-- Table: Books
-- Stores information about books in the library
USE Library_Management_System;

CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255),
    ISBN VARCHAR(20) UNIQUE,
    Publisher VARCHAR(255),
    YearPublished YEAR,
    Genre VARCHAR(100)
);

-- Table: Members
-- Stores information about library members
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Address TEXT
);

-- Table: Staff
-- Stores information about library staff
CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    Position VARCHAR(100),
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20)
);

-- Table: Loans
-- Tracks books borrowed by members and processed by staff
CREATE TABLE Loans (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    StaffID INT,
    LoanDate DATE NOT NULL,
    ReturnDate DATE,
    DueDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- Table: Fines
-- Stores fine information for overdue books
CREATE TABLE Fines (
    FineID INT AUTO_INCREMENT PRIMARY KEY,
    LoanID INT UNIQUE,
    Amount DECIMAL(10, 2) NOT NULL,
    Paid ENUM('YES', 'NO') DEFAULT 'NO',
    FOREIGN KEY (LoanID) REFERENCES Loans(LoanID)
);
