Create Table Students(
Student_ID Serial Primary Key,
Student_Name varchar(100),
Student_Gender Varchar(25),
Student_Age Varchar(25),
Student_Grade Varchar(5),
Maths_Score INT,
Science_Score INT,
English_Score INT)

Select * From Students;

INSERT INTO Students
(Student_ID, Student_Name, Student_Gender, Student_Age, Student_Grade, Maths_Score, Science_Score, English_Score)
VALUES
(01, 'Ekant', 'M', 19, 'A', 76, 72, 68),
(02, 'Madhuri', 'F', 18, 'F', 12, 15, 18),
(03, 'Shasvat', 'M', 19, 'B', 62, 55, 42),
(04, 'Varsha', 'F', 19, 'F', 05, 06, 08),
(05, 'Akash', 'M', 18, 'A', 66, 68, 71),
(06, 'Shangarsh', 'M', 19, 'A+', 98, 96, 95),
(07, 'Yati', 'F', 18, 'A', 72, 65, 62),
(08, 'Suhasni', 'F', 18, 'B', 62, 61, 54),
(09, 'Radha', 'F', 19, 'A+', 99, 98,100),
(10, 'Ekta', 'F', 18, 'B', 25, 35, 55);

Select * From Students;

SELECT 
AVG(Maths_Score) AS Avg_Maths,
AVG(Science_Score) AS Avg_Science,
AVG(English_Score) AS Avg_English
FROM Students;

ALTER TABLE Students
ADD COLUMN Total_Marks INT;

UPDATE Students
SET Total_Marks = Maths_Score + Science_Score + English_Score;

Select * From Students;

SELECT 
Student_Name, Total_Marks
FROM Students
ORDER BY Total_Marks DESC
LIMIT 1;

SELECT 
Student_Grade,
COUNT(*) AS Total_Students
FROM Students
GROUP BY Student_Grade;


SELECT 
Student_Gender,
AVG(Total_Marks)
FROM Students
GROUP BY Student_Gender;

SELECT *
FROM Students
WHERE Maths_Score > 80;

UPDATE Students
SET Student_Grade = 'A'
WHERE Student_Name = 'Ekta';

Select * From Students;