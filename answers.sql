-- Create the database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- 1. Members Table
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    Address TEXT,
    JoinDate DATE NOT NULL DEFAULT CURRENT_DATE
);

-- 2. Librarians Table (1-to-1 with login credentials could be added separately)
CREATE TABLE Librarians (
    LibrarianID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

-- 3. Publishers Table
CREATE TABLE Publishers (
    PublisherID INT AUTO_INCREMENT PRIMARY KEY,
    PublisherName VARCHAR(100) NOT NULL UNIQUE,
    ContactEmail VARCHAR(100)
);

-- 4. Categories Table
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE
);

-- 5. Authors Table
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Bio TEXT
);

-- 6. Books Table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ISBN VARCHAR(13) UNIQUE NOT NULL,
    PublisherID INT,
    CategoryID INT,
    PublicationYear YEAR,
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- 7. Book-Author (Many-to-Many)
CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID) ON DELETE CASCADE
);

-- 8. BookCopies Table (1-to-Many from Books)
CREATE TABLE BookCopies (
    CopyID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT NOT NULL,
    Barcode VARCHAR(50) UNIQUE NOT NULL,
    Status ENUM('Available', 'Borrowed', 'Lost', 'Damaged') DEFAULT 'Available',
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- 9. Borrowing Table (Transactions)
CREATE TABLE Borrowing (
    BorrowID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT NOT NULL,
    CopyID INT NOT NULL,
    LibrarianID INT NOT NULL,
    BorrowDate DATE NOT NULL DEFAULT CURRENT_DATE,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (CopyID) REFERENCES BookCopies(CopyID),
    FOREIGN KEY (LibrarianID) REFERENCES Librarians(LibrarianID)
);
