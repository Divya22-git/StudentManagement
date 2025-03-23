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
