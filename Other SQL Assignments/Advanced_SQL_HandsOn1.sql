CREATE DATABASE Students;
USE Students;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    instructor VARCHAR(50)
);

CREATE TABLE student_courses (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


INSERT INTO students (student_id, name, age, gender) VALUES
(1, 'John Doe', 20, 'Male'),
(2, 'Jane Smith', 22, 'Female'),
(3, 'Michael Johnson', 21, 'Male');

INSERT INTO students VALUES (4, 'Nicholas Thomson', 22, 'Male');

INSERT INTO courses (course_id, course_name, instructor) VALUES
(1, 'Mathematics', 'Dr. Smith'),
(2, 'Computer Science', 'Prof. Johnson'),
(3, 'History', 'Dr. Adams');

INSERT INTO courses VALUES
(4, 'Database', 'Dr. Liu');

INSERT INTO student_courses (enrollment_id, student_id, course_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 2, 2),
(4, 3, 3);

#Names of students in computer science
SELECT name FROM students, student_courses 
WHERE students.student_id = student_courses.student_id 
AND student_courses.course_id = 2;
#SELECT students s join student_courses sc on s.student_id = sc.student_id join courses c on c.course_id = sc.course_id where c.course_name = 'Computer Science';

#The names of students enrolled in a class
SELECT course_name, name 
FROM courses, students, student_courses 
WHERE student_courses.course_id = courses.course_id 
AND student_courses.student_id = students.student_id;

#Count of students in each class
SELECT course_name, COUNT(student_courses.course_id) student_count FROM student_courses, courses WHERE student_courses.course_id = courses.course_id GROUP BY course_name;
SELECT c.course_name, COUNT(sc.enrollment_id) as count 
FROM courses c left join student_courses sc on c.course_id = sc.course_id 
GROUP BY c.course_name;

#Average age of students in classes
SELECT course_name, AVG(age) average_age 
FROM courses, students, student_courses 
WHERE courses.course_id = student_courses.course_id 
AND students.student_id = student_courses.student_id 
GROUP BY course_name;
#Or we can do
SELECT course_name, AVG(age) average_age
FROM students s
join student_courses sc on s.student_id = sc.student_id
join courses c on c.course_id = sc.course_id
group by c.course_name;


#Students not enrolled in classes
SELECT s.name 
FROM students s left join student_courses sc on s.student_id = sc.student_id
WHERE sc.student_id is null;