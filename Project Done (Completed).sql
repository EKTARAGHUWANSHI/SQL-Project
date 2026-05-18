Create Table student(
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    email VARCHAR(100),
	join_date DATE,
    country VARCHAR(50)
    
);


Select * from student;

Copy
student(student_id, student_name, email, join_date, country)
From 'C:\Program Files\PostgreSQL\18\data\students_200.csv'
Delimiter ','
CSV Header;

Select * from student;

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    enrollment_id INT,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    payment_date DATE
);

Copy
payments(payment_id, enrollment_id, amount, payment_date, payment_status)
From 'C:\Program Files\PostgreSQL\18\data\payments_300.csv'
Delimiter ','
CSV Header;

Select * From payments;


CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE
);

Copy
enrollment(enrollment_id, student_id, course_id, enrollment_date)
From 'C:\Program Files\PostgreSQL\18\data\enrollments_300.csv'
Delimiter ','
CSV Header;

Select * From enrollment;


CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    instructor_id INT
);

Copy
courses (course_id, course_name, category, price, instructor_id)
From 'C:\Program Files\PostgreSQL\18\data\courses_50.csv'
Delimiter ','
CSV Header;

Select * From courses;


CREATE TABLE instructors (
    instructor_id INT PRIMARY KEY,
    instructor_name VARCHAR(100),
    experience_years INT
);

ALTER TABLE instructors
ADD expertise VARCHAR(100);

Copy
instructors (instructor_id, instructor_name, expertise, experience_years)
From 'C:\Program Files\PostgreSQL\18\data\instructors_20.csv'
Delimiter ','
CSV Header;

Select * From instructors;



Que-1= Display all details of students who joined after 1 March 2024
SELECT * FROM student
WHERE join_date > '2024-03-01';

Select * from student;


Que-2= Fetch student name and email of students who belong to India or USA
SELECT student_name, email
FROM student
WHERE country IN ('India','USA');

Select * from student;


Que-3= Retrieve all courses whose price is greater than 5000
SELECT *FROM courses
WHERE price > 5000;

Que-04= Display instructor details who have more than 7 years of experience
SELECT * FROM instructors
WHERE experience_years > 7;


Que-05= Show total number of students available in system
SELECT COUNT(*) AS total_students
FROM student;


Que-06= List all distinct course categories
SELECT DISTINCT category
FROM courses;


Que-07= Display payment details where payment status is Success
SELECT * FROM payments
WHERE payment_status = 'Success';


Que-08= Fetch cheapest course available
SELECT * FROM courses
WHERE price = (
    SELECT MIN(price)
    FROM courses
);


Que-09= Count total number of enrollments done by students
SELECT COUNT(*) AS total_enrollment
FROM enrollment;


Ques-10= Display student name and country sorted alphabetically by student name
SELECT student_name, country
FROM student
ORDER BY student_name ASC;

---
---

# ADVANCED LEVEL – CONDITION BASED QUESTIONS

Que-11= Display student names along with the course IDs they have enrolled in
SELECT s.student_name, e.course_id
FROM student s
JOIN enrollment e
ON s.student_id = e.student_id;



Que-12= Fetch student name and enrollment date for all enrolled students
SELECT s.student_name, e.enrollment_date
FROM student s
JOIN enrollment e
ON s.student_id = e.student_id;


Que-13= Display course name and instructor ID for each course
SELECT course_name, instructor_id
FROM courses;


Que-14= Show instructor names with their expertise for the courses they teach
SELECT i.instructor_name, i.expertise, c.course_name
FROM instructors i
JOIN courses c
ON i.instructor_id = c.instructor_id;


Que-15= Display enrollment ID along with payment status
SELECT e.enrollment_id, p.payment_status
FROM enrollment e
JOIN payments p
ON e.student_id = p.student_id;


Que-16= Fetch student ID and payment amount for all payments made
SELECT student_id, amount
FROM payments;


Que-17= Display course ID and category for courses that have enrollments
SELECT DISTINCT c.course_id, c.category
FROM courses c
JOIN enrollment e
ON c.course_id = e.course_id;


Que-18= Display enrollment ID where payment status is Pending
SELECT e.enrollment_id
FROM enrollment e
JOIN payments p
ON e.student_id = p.student_id
WHERE p.payment_status = 'Pending';


Que-19= Display course name and price along with instructor details
SELECT c.course_name, c.price,
       i.instructor_name, i.expertise
FROM courses c
JOIN instructors i
ON c.instructor_id = i.instructor_id;


Que-20= Fetch enrollment date and payment date together
SELECT e.enrollment_date, p.payment_date
FROM enrollment e
JOIN payments p
ON e.student_id = p.student_id;
