CREATE DATABASE StudentDB;
USE StudentDB;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    MathScore INT,
    TotalScore INT
);
INSERT INTO Students (StudentID, Name, MathScore, TotalScore) VALUES
(1, 'Neels', 85, 270),
(2, 'Divya', 92, 285),
(3, 'Manju', 75, 260),
(4, 'Meha', 85, 270),
(5, 'Rahul', 95, 290);
SELECT 
    StudentID,
    Name,
    TotalScore,
    RANK() OVER (ORDER BY TotalScore DESC) AS StudentRank
FROM Students;
SELECT 
    StudentID,
    Name,
    MathScore,
    SUM(MathScore) OVER (ORDER BY StudentID) AS RunningMathTotal
FROM Students;
