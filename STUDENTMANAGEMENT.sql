CREATE DATABASE StudentManagement;
SHOW DATABASES;
USE StudentManagement;CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Gender VARCHAR(1),
    Age INT,
    Grade VARCHAR(10),
    MathScore INT,
    ScienceScore INT,
    EnglishScore INT
);
SHOW TABLES;
INSERT INTO Students (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore) 
VALUES 
('Divya', 'F', 16, 'A', 90, 85, 88),
('Neela', 'F', 17, 'B', 78, 80, 82),
('Manju', 'F', 15, 'A', 92, 89, 95),
('Meha', 'F', 16, 'C', 70, 72, 75),
('Nisha', 'F', 17, 'B', 80, 78, 85),
('Umar', 'M', 16, 'A', 95, 92, 90),
('Vishnupriya', 'F', 15, 'B', 85, 83, 87),
('Durai', 'M', 17, 'C', 60, 65, 62),
('Dinesh', 'M', 16, 'B', 78, 75, 80),
('Lavanya', 'F', 15, 'A', 91, 94, 96);
SELECT * FROM Students;
SELECT 
    AVG(MathScore) AS Avg_Math, 
    AVG(ScienceScore) AS Avg_Science, 
    AVG(EnglishScore) AS Avg_English 
FROM Students;
SELECT Name, (MathScore + ScienceScore + EnglishScore) AS TotalScore 
FROM Students 
ORDER BY TotalScore DESC 

LIMIT 1;
SELECT Grade, COUNT(*) AS Student_Count 
FROM Students 
GROUP BY Grade;
SELECT Gender, 
       AVG(MathScore) AS Avg_Math, 
       AVG(ScienceScore) AS Avg_Science, 
       AVG(EnglishScore) AS Avg_English 
FROM Students 
GROUP BY Gender;
SELECT * FROM Students WHERE MathScore > 80;
UPDATE Students 
SET Grade = 'A' 
WHERE StudentID = 5;
SELECT * FROM Students WHERE StudentID = 5;
USE studentmanagement;
SHOW TABLES;
DESC Students;
DESC Courses;
DESC Enrolments;
CREATE TABLE Enrolments (
	enrolment_id INT PRIMARY KEY,
    StudentID INT,
    course_id INT,
    enrolment_date DATE,
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY(course_id) REFERENCES Courses(course_id)
);
DESC Enrolments;
INSERT INTO Courses (course_name, course_description) VALUES
('Database Management', 'Learn about SQL databases.'),
('Machine Learning', 'Introduction to ML concepts.'),
('Web Development', 'Build dynamic websites.');
INSERT INTO Enrolments (enrolment_id,StudentID, course_id, enrolment_date) VALUES
(100,1, 1, '2025-03-01'), 
(102,1, 2, '2025-03-02'), 
(103,2, 1, '2025-03-03'), 
(104,3, 3, '2025-03-04'); 
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrolments;
SELECT Students.name AS student_name, Courses.course_name
FROM Students 
INNER JOIN Enrolments ON Students.StudentID = Enrolments.StudentID
INNER JOIN Courses ON Enrolments.course_id = Courses.course_id;
SELECT Courses.course_name, COUNT(Enrolments.StudentID) AS student_count
FROM Courses 
LEFT JOIN Enrolments ON Courses.course_id = Enrolments.course_id
GROUP BY Courses.course_id, Courses.course_name;
SELECT Students.name AS student_name, COUNT(Enrolments.course_id) AS courses_enrolled
FROM Students 
JOIN Enrolments ON Students.StudentID = Enrolments.StudentID
GROUP BY Students.StudentID, Students.name
HAVING COUNT(Enrolments.course_id) > 1;
SELECT Courses.course_name
FROM Courses 
LEFT JOIN Enrolments ON Courses.course_id = Enrolments.course_id
WHERE Enrolments.enrolment_id IS NULL;
SELECT MAX(math_score) FROM Students;

USE STUDENTMANAGEMENT;
SELECT * FROM Students;
SELECT name, 
       (MathScore +ScienceScore +EnglishScore) AS total_score
FROM Students
ORDER BY total_score DESC
LIMIT 5;

SELECT AVG(MathScore) AS average_math_core
FROM Students
WHERE MathScore > 70;
SELECT AVG(total) AS average_total
FROM (
  SELECT (MathScore+ScienceScore+EnglishScore) AS total
  FROM Students
) AS totals
WHERE total BETWEEN 200 AND 250;
SELECT MAX(MathScore) AS second_highest_math_score
FROM Students
WHERE MathScore < (SELECT MAX(MathScore) FROM Students);










