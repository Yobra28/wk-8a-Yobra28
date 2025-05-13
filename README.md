![image](https://github.com/user-attachments/assets/11248ea9-3503-4f38-afed-a7aa3fcd6fd9)



**Project Title**
Library Management System (LMS) – MySQL-Based Relational Database Project

**Project Description**
The Library Management System (LMS) is a relational database system designed to manage all operations of a library, including:

Maintaining records of members, librarians, books, and authors

Tracking book borrowing and returns

Handling multiple copies of books and their status (e.g., Available, Borrowed, Lost)

Supporting categorization, publishing, and authorship of books

Managing complex relationships such as many-to-many between books and authors

This system enforces data integrity and referential constraints using SQL standards and supports scalability and efficient querying.

**How to Run / Setup the Project
Requirements:**
MySQL Server (e.g., MySQL 8.0 or higher)

MySQL Workbench, phpMyAdmin, or any SQL client

**Step-by-Step Setup:**
Download or Copy SQL Script

**Save the SQL code provided earlier into a file named, for example:**
answers.sql

Start MySQL Server

Import SQL File:

**Option 1 – Using MySQL Command Line:**
mysql -u root -p < path/to/library_management.sql

**Option 2 – Using MySQL Workbench:**

Open MySQL Workbench

Connect to your server

Go to File → Open SQL Script

Load library_management.sql

Click the ⚡ (Execute) button



Click Go

Verify Database

The database LibraryDB should now be available.

Tables such as Members, Books, Borrowing, etc., will be created and ready for use.
