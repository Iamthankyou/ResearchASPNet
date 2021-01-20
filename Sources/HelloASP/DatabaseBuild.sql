USE SCHOOL

CREATE TABLE Student(
	StudentId nvarchar(20) PRIMARY KEY  NOT NULL,
	FisrtName nvarchar(50)  NOT NULL,
	LastName nvarchar(50) ,
	Grade datetime 
);

CREATE TABLE Course(
	CourseId nvarchar(20) PRIMARY KEY NOT NULL,
	Title nvarchar(50),
	Credit money,
);


CREATE TABLE Student_Course(
	StudentCourseId nvarchar(20) PRIMARY KEY NOT NULL,
	CourseId nvarchar(20) FOREIGN KEY REFERENCES Course(CourseId),
	StudentId nvarchar(20) FOREIGN KEY REFERENCES Student(StudentId),
);

INSERT INTO Student (StudentId,FisrtName,LastName,Grade) VALUES('001','Duy','Le Quang','02-03-2000')

SELECT * FROM Student

