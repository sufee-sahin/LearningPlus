create database learningPlus

use learningPlus
go
create table roles(
id int primary key,
name varchar(20) not null
)
go
create table users(
userId int primary key identity(1,1),
firstName varchar(20) not null,
lastName varchar(20) not null,
email varchar(50) not null,
mobileNumber numeric(10) not null,
profilePhoto varchar(200),
gender char(1) check(gender in('M','F')),
password varchar(20) not null,
roleId int,
membershipStatus varchar(20) check (membershipStatus in ('active','inactive')) default 'inactive',
membership_expiryDate date,
created_at datetime default GETDATE(),
updated_at datetime default GETDATE(),
constraint fk_Role foreign key(roleId) references roles(id) on delete set null
)
go
create table courses(
courseId varchar(20) primary key,
courseName varchar(50) not null,
)

create table courseContent(
id int primary key identity(1,1),
courseId varchar(20) not null,
title varchar(50) not null,
description varchar(200) not null,
contentUrl varchar(200) not null,
sequence int not null,
isFree bit not null default 0,
notesUrl varchar(2000),
CONSTRAINT fk_courseContent_course FOREIGN KEY (courseId) REFERENCES courses(courseId) ON DELETE CASCADE
)
GO
create table courseEnrollments(
enrollmentId int primary key identity(1,1),

userId int not null,
courseId varchar(20) not null,
enrollmentDate datetime default GETDATE(),
validUntil date,
status varchar(20) check (status in ('active','completed','dropped')) default 'active',
constraint fk_courseEnrollment_user foreign key(userId) references users(userId) on delete cascade,
constraint fk_courseEnrollment_course foreign key(courseId) references courses(courseId) on delete cascade
)
GO
create table courseProgress(
id int primary key identity(1,1),
userId int not null,
courseId varchar(20) not null,
isCompleted bit not null default 0,
progressPercentage int not null default 0,
lastAccessed datetime default GETDATE(),
constraint fk_courseProgress_user foreign key(userId) references users(userId) on delete cascade,
constraint fk_courseProgress_course foreign key(courseId) references courses(courseId) on delete cascade
)
go
CREATE TABLE courseContentProgress (
    contentId INT NOT NULL,
    userId INT NOT NULL,
    courseId VARCHAR(20) NOT NULL,
    isCompleted BIT NOT NULL DEFAULT 0,
    progressPercentage INT NOT NULL DEFAULT 0,
    lastAccessed DATETIME DEFAULT GETDATE(),
    CONSTRAINT pk_courseContentProgress PRIMARY KEY (userId, contentId),
    CONSTRAINT fk_courseContentProgress_content 
        FOREIGN KEY (contentId) 
        REFERENCES courseContent(id) 
        ON DELETE CASCADE,
    CONSTRAINT fk_courseContentProgress_user 
        FOREIGN KEY (userId) 
        REFERENCES users(userId) 
        ON DELETE CASCADE,
    CONSTRAINT fk_courseContentProgress_course 
        FOREIGN KEY (courseId) 
        REFERENCES courses(courseId) 
        ON DELETE NO ACTION
)
GO
create table Payments(
    paymentId int primary key identity(1,1),
    userId int not null,
    courseId varchar(20) not null,
    amount decimal(10,2) not null,
    paymentDate datetime default GETDATE(),
    paymentStatus varchar(20) check (paymentStatus in ('pending', 'completed', 'failed')) default 'pending',
    constraint fk_payment_user foreign key(userId) references users(userId) on delete cascade,
    constraint fk_payment_course foreign key(courseId) references courses(courseId) on delete cascade
)
go
create table assessment(
assessmentId int primary key identity(1,1),
courseId varchar(20) not null,
title varchar(50) not null,
noOfQuestions int not null,
totalMarks int not null,
passingMarks int not null,
duration int not null, -- in minutes
constraint fk_assessment_course foreign key(courseId) references courses(courseId) on delete cascade
)
go
create table assessmentQuestions(
questionId int primary key identity(1,1),
assessmentId int not null,
questionText varchar(500) not null,
marks int not null,
)
alter table assessmentQuestions add constraint
fk_assessmentQuestions_assessment foreign key(assessmentId) 
references assessment(assessmentId) on delete cascade
go
create table assessmentAnswers(
answerId int primary key identity(1,1),
questionId int not null,
optionText varchar(200) not null,
isCorrect bit not null default 0,
constraint fk_ques foreign key(questionId) references assessmentQuestions(questionId) on delete cascade
)
go
create table userAssessmentResults(
assessmentResultId int primary key identity(1,1),
userId int not null,
courseId varchar(20) not null,
assessmentId int not null,
marksObtained int,
Userstatus varchar(20) check(Userstatus in('passed','failed','not attempted')) default 'not attemped',
attemptDate datetime,
certificateIssued bit default 0,
CONSTRAINT us_userId foreign key(userId) references users(userId) on delete cascade,
constraint us_courseId foreign key(courseId) references courses(courseId) on delete cascade,
constraint us_assesmentId foreign key(assessmentId) references assessment(assessmentId) on delete no action
)
go
