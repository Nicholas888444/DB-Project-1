CREATE DATABASE Courses;
USE Courses;

CREATE TABLE Instructor(
	instructor_id int,
    instructor_name varchar(100),
    primary key(instructor_id)
);

CREATE TABLE Course(
	course_number int,
    course_topic varchar(100),
    days varchar(100),
    class_time time,
    location varchar(100),
    credits int,
    class_status bool,
    instructor int,
    FOREIGN KEY (instructor) REFERENCES Instructor(instructor_id),
    course_type SET('Online', 'InPerson'),
    primary key(course_number)
);
DROP Table Course;
CREATE TABLE OnlineCourse (
    course_number INT PRIMARY KEY,
    meeting_link VARCHAR(100),
    FOREIGN KEY (course_number) REFERENCES Course(course_number) on delete cascade
);
DROP Table OnlineCourse;
CREATE TABLE InPersonCourse (
	course_number INT PRIMARY KEY,
    room_number VARCHAR(10),
    FOREIGN KEY (course_number) REFERENCES Course(course_number) on delete cascade
);
DROP Table InPersonCourse;
CREATE TABLE CourseDetails(
	course_number int PRIMARY KEY 
    REFERENCES Course(course_number)
    ON DELETE CASCADE,
    notes varchar(1000),
    capacity int,
    available int,
    wait_list int,
    mode_of_instruction varchar(10),
    start_date date,
    end_date date,
    course_component varchar(100)
);

INSERT INTO Instructor values(1, "Nour");
INSERT INTO Instructor values(2, "Canbaz");
INSERT INTO Instructor values(3, "Liu");\

INSERT INTO Course values(1, 'Computer Science', "MW", CURRENT_TIMESTAMP(), 'Hunt Hall', 3, true, 1, 'Online');
INSERT INTO Course values(4, 'Social Studies', "MW", CURRENT_TIMESTAMP(), 'KA', 3, true, 2, 'Online');
INSERT INTO Course values(5, 'Social Studies', "MW", CURRENT_TIMESTAMP(), 'Hunt Hall', 5, true, 1, 'Online');

INSERT INTO Course values(2, 'Math', "TuTh", CURRENT_TIMESTAMP(), 'Main Building', 5, true, 2, 'InPerson');
INSERT INTO Course values(3, 'English', "TuTh", CURRENT_TIMESTAMP(), 'Library', 5, true, 3, 'InPerson');
INSERT INTO Course values(6, 'Math', "TuTh", CURRENT_TIMESTAMP(), 'KA', 3, true, 3, 'InPerson');


INSERT INTO OnlineCourse values (1, 'http://example.com');
INSERT INTO OnlineCourse values (4, 'http://example.com');
INSERT INTO OnlineCourse values (5, 'http://example.com');

INSERT INTO InPersonCourse values (2, 201);
INSERT INTO InPersonCourse values (3, 203);
INSERT INTO InPersonCourse values (6, 204);

SELECT * FROM Course;
SELECT * FROM InPersonCourse;
SELECT * FROM OnlineCourse;

SELECT * FROM Instructor;