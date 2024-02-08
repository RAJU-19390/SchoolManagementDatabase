create database School_Management
go
-------------------------------------
--Description

--Using SQL Server MMC, create tables and indexes for storing students, subjects and classes data.
--Background of the problem statement:
--Rainbow School is creating software for school management. The first stage is to design a database in SQL Server which will manage all the data. This database will then be used in the web-based application for school management.

--You must use the following:
--SQL Server 17 Express Edition

--Tables:
--The following master tables will be created:

--Student – store all student data across multiple classes
--Subjects – master list of subjects taught in all classes
--Classes – list of classes in the school
--------------------------------------------------------------------
---------------------------------------------------------------------

-- Create the Subjects table
CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY,
    SubjectName NVARCHAR(50) NOT NULL
);

-- Create the Classes table
CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName NVARCHAR(50) NOT NULL
);

-- Create the Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    ClassID INT REFERENCES Classes(ClassID),
    CONSTRAINT FK_Student_Class FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

INSERT INTO Subjects (SubjectID, SubjectName)
VALUES
    (1, 'Mathematics'),
    (2, 'English'),
    (3, 'Science'),
    (4, 'History'),
    (5, 'Computer Science'),
	(6, 'Physical Education'),
    (7, 'Art'),
    (8, 'Music'),
    (9, 'Geography'),
    (10, 'Spanish');


INSERT INTO Classes (ClassID, ClassName)
VALUES
    (1, 'Class 1A'),
    (2, 'Class 1B'),
    (3, 'Class 2A'),
    (4, 'Class 2B'),
    (5, 'Class 3A'),
	(6, 'Class 3B'),
    (7, 'Class 4A'),
    (8, 'Class 4B'),
    (9, 'Class 5A'),
    (10, 'Class 5B');


INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, ClassID)
VALUES
    (1, 'John', 'Doe', '2005-05-15', 1),
    (2, 'Jane', 'Smith', '2006-02-20', 2),
    (3, 'Robert', 'Johnson', '2005-08-10', 1),
    (4, 'Emily', 'Williams', '2006-11-25', 3),
    (5, 'Michael', 'Brown', '2005-07-03', 2),
    (6, 'Sophia', 'Davis', '2006-04-18', 4),
    (7, 'William', 'Miller', '2005-09-08', 3),
    (8, 'Olivia', 'Jones', '2006-01-30', 5),
    (9, 'Ethan', 'Anderson', '2005-06-22', 4),
    (10, 'Ava', 'Garcia', '2006-10-12', 1),
	(11, 'Isabella', 'Taylor', '2005-03-12', 2),
    (12, 'Liam', 'Moore', '2006-07-28', 3),
    (13, 'Mia', 'Clark', '2005-09-14', 4),
    (14, 'Noah', 'Martin', '2006-12-01', 5),
    (15, 'Emma', 'White', '2005-04-25', 1),
    (16, 'Jackson', 'Lee', '2006-08-19', 2),
    (17, 'Sophie', 'Allen', '2005-10-02', 3),
    (18, 'Lucas', 'Hall', '2006-02-15', 4),
    (19, 'Aria', 'Young', '2005-07-17', 5),
    (20, 'Caleb', 'Scott', '2006-11-08', 1);


Select * from Subjects;


Select * from Classes;



Select * from Subjects;


-- Create indexes for efficient querying
CREATE INDEX IX_SubjectName ON Subjects(SubjectName);
CREATE INDEX IX_ClassName ON Classes(ClassName);
CREATE INDEX IX_StudentLastName ON Students(LastName);


--Displaying tables after indexing:

Select * from Subjects;
Select * from Classes;
Select * from Subjects;