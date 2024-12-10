BEGIN TRANSACTION;

-- Delete all dependent data first
DELETE FROM Modifications;
DELETE FROM ExamRequestRooms;
DELETE FROM ExamRequest;
DELETE FROM LabHolder;
DELETE FROM Professor;
DELETE FROM Secretary;
DELETE FROM Student;
DELETE FROM "User";
DELETE FROM "Group";
DELETE FROM Room;
DELETE FROM Course;
DELETE FROM Specialization;
DELETE FROM Department;
DELETE FROM Faculty;
DELETE FROM "Session";

-- Reset identity columns for SQL Server
DBCC CHECKIDENT ('Faculty', RESEED, 0);
DBCC CHECKIDENT ('Department', RESEED, 0);
DBCC CHECKIDENT ('Specialization', RESEED, 0);
DBCC CHECKIDENT ('[User]', RESEED, 0);
DBCC CHECKIDENT ('[Group]', RESEED, 0);
DBCC CHECKIDENT ('Student', RESEED, 0);
DBCC CHECKIDENT ('Professor', RESEED, 0);
DBCC CHECKIDENT ('Course', RESEED, 0);
DBCC CHECKIDENT ('[Session]', RESEED, 0);
DBCC CHECKIDENT ('ExamRequest', RESEED, 0);
DBCC CHECKIDENT ('Room', RESEED, 0);
DBCC CHECKIDENT ('Modifications', RESEED, 0);
DBCC CHECKIDENT ('Secretary', RESEED, 0);


COMMIT;


-- Populate Faculty
INSERT INTO Faculty (ShortName, LongName, Description, CreationDate)
VALUES
('SCI', 'Faculty of Science', 'Covers various science-related disciplines', GETDATE()),
('ARTS', 'Faculty of Arts', 'Focuses on arts, humanities, and literature', GETDATE()),
('ENG', 'Faculty of Engineering', 'Dedicated to engineering and technology', GETDATE()),
('MED', 'Faculty of Medicine', 'Includes medical and health sciences', GETDATE()),
('LAW', 'Faculty of Law', 'Specializes in legal studies and law practices', GETDATE()),
('BUS', 'Faculty of Business', 'Focuses on business, economics, and management', GETDATE()),
('EDU', 'Faculty of Education', 'Dedicated to educational theories and practices', GETDATE()),
('IT', 'Faculty of Information Technology', 'Focuses on IT, software, and systems', GETDATE()),
('AGRI', 'Faculty of Agriculture', 'Covers agricultural sciences and farming', GETDATE()),
('ENV', 'Faculty of Environmental Studies', 'Specializes in environmental sciences and sustainability', GETDATE());


-- Populate Department
INSERT INTO Department (FacultyID, Name, Description, CreationDate)
VALUES
(1, 'Physics Department', 'Department of Physics', GETDATE()),
(1, 'Chemistry Department', 'Department of Chemistry', GETDATE()),
(2, 'History Department', 'Department of History', GETDATE()),
(2, 'Literature Department', 'Department of Literature', GETDATE()),
(1, 'Biology Department', 'Department of Biology', GETDATE()),
(2, 'Philosophy Department', 'Department of Philosophy', GETDATE()),
(1, 'Mathematics Department', 'Department of Mathematics', GETDATE()),
(2, 'Fine Arts Department', 'Department of Fine Arts', GETDATE()),
(1, 'Computer Science Department', 'Department of Computer Science', GETDATE()),
(2, 'Sociology Department', 'Department of Sociology', GETDATE());

-- Populate Specialization
INSERT INTO Specialization (FacultyID, Name, Description, CreationDate)
VALUES
(1, 'Quantum Mechanics', 'Focus on quantum mechanics', GETDATE()),
(1, 'Organic Chemistry', 'Study of organic compounds', GETDATE()),
(2, 'Renaissance Art', 'Exploration of Renaissance artwork', GETDATE()),
(2, 'Modern Philosophy', 'Study of modern philosophers', GETDATE()),
(1, 'Astrophysics', 'Study of stars and galaxies', GETDATE()),
(2, 'World History', 'History across global civilizations', GETDATE()),
(1, 'Data Science', 'Analysis and interpretation of data', GETDATE()),
(2, 'Classical Literature', 'Focus on classical writings', GETDATE()),
(1, 'Biochemistry', 'Intersection of biology and chemistry', GETDATE()),
(2, 'Ethics and Society', 'Study of moral systems in society', GETDATE());

-- Populate User
INSERT INTO [User] (FacultyID, Email, PasswordHash, FirstName, MiddleName, LastName, Role, UniversityID, Status, CreationDate)
VALUES
(1, 'student1@university.edu', 'hashedpassword1', 'John', 'A', 'Doe', 'Student', 12345, 'Active', GETDATE()),
(1, 'student2@university.edu', 'hashedpassword2', 'Jane', 'B', 'Smith', 'Student', 12346, 'Active', GETDATE()),
(2, 'professor1@university.edu', 'hashedpassword3', 'Alice', 'C', 'Johnson', 'Professor', 22345, 'Active', GETDATE()),
(2, 'professor2@university.edu', 'hashedpassword4', 'Bob', 'D', 'Williams', 'Professor', 22346, 'Active', GETDATE()),
(1, 'admin@university.edu', 'hashedpassword5', 'Admin', 'E', 'Adminson', 'Admin', 99999, 'Active', GETDATE()),
(2, 'student3@university.edu', 'hashedpassword6', 'Charlie', 'F', 'Brown', 'Student', 12347, 'Active', GETDATE()),
(1, 'student4@university.edu', 'hashedpassword7', 'Emily', 'G', 'White', 'Student', 12348, 'Active', GETDATE()),
(2, 'professor3@university.edu', 'hashedpassword8', 'David', 'H', 'Clark', 'Professor', 22347, 'Active', GETDATE()),
(1, 'student5@university.edu', 'hashedpassword9', 'Grace', 'I', 'Hall', 'Student', 12349, 'Active', GETDATE()),
(2, 'professor4@university.edu', 'hashedpassword10', 'Frank', 'J', 'Adams', 'Professor', 22348, 'Active', GETDATE());

-- Populate Group
INSERT INTO [Group] (SpecializationID, Name, CreationDate)
VALUES
(1, 'Group A', GETDATE()),
(2, 'Group B', GETDATE()),
(3, 'Group C', GETDATE()),
(4, 'Group D', GETDATE()),
(5, 'Group E', GETDATE()),
(6, 'Group F', GETDATE()),
(7, 'Group G', GETDATE()),
(8, 'Group H', GETDATE()),
(9, 'Group I', GETDATE()),
(10, 'Group J', GETDATE());

-- Populate Student
INSERT INTO Student (UserID, GroupID, IsLeader, CreationDate)
VALUES
(1, 2, 1, GETDATE()),
(2, 2, 0, GETDATE()),
(6, 3, 0, GETDATE()),
(7, 4, 1, GETDATE()),
(10, 5, 0, GETDATE()),
(8, 6, 0, GETDATE()),
(9, 7, 1, GETDATE()),
(3, 8, 0, GETDATE()),
(4, 9, 0, GETDATE()),
(5, 10, 1, GETDATE());


-- Populate Professor
INSERT INTO Professor (UserID, DepartmentID, Title, CreationDate)
VALUES
(3, 1, 'Associate Professor', GETDATE()),
(4, 2, 'Professor', GETDATE()),
(8, 3, 'Lecturer', GETDATE()),
(10, 4, 'Senior Lecturer', GETDATE()),
(3, 5, 'Professor', GETDATE()),
(4, 6, 'Associate Professor', GETDATE()),
(8, 7, 'Senior Lecturer', GETDATE()),
(10, 8, 'Professor', GETDATE()),
(3, 9, 'Lecturer', GETDATE()),
(4, 10, 'Professor', GETDATE());

-- Populate Course
INSERT INTO Course (ProfessorID, SpecializationID, Title, Description, Status, CreationDate)
VALUES
(3, 1, 'Introduction to Quantum Mechanics', 'Basic concepts in quantum mechanics', 'Active', GETDATE()),
(4, 2, 'Advanced Organic Chemistry', 'Detailed organic chemistry topics', 'Active', GETDATE()),
(8, 3, 'Renaissance Art Masterpieces', 'Study of iconic Renaissance art', 'Active', GETDATE()),
(10, 4, 'Existentialism 101', 'Exploring existential philosophy', 'Active', GETDATE()),
(3, 5, 'Exoplanetary Science Fundamentals', 'Basics of studying exoplanets', 'Active', GETDATE()),
(4, 6, 'History of Ancient Empires', 'Deep dive into ancient empires', 'Active', GETDATE()),
(8, 7, 'Introduction to Machine Learning', 'Basics of machine learning algorithms', 'Active', GETDATE()),
(10, 8, 'Greek Classics in Literature', 'Overview of Greek literary works', 'Active', GETDATE()),
(3, 9, 'Principles of Molecular Biology', 'Molecular mechanisms in biology', 'Active', GETDATE()),
(4, 10, 'Ethical Decision-Making', 'Applications of ethical principles', 'Active', GETDATE());

-- Populate Session
INSERT INTO Session (Status, StartDate, EndDate, Description, CreationDate)
VALUES
('Active', GETDATE(), DATEADD(DAY, 10, GETDATE()), 'Session for Quantum Mechanics', GETDATE()),
('Active', GETDATE(), DATEADD(DAY, 20, GETDATE()), 'Session for Organic Chemistry', GETDATE()),
('Completed', DATEADD(DAY, -30, GETDATE()), DATEADD(DAY, -20, GETDATE()), 'Session for Renaissance Art', GETDATE()),
('Active', GETDATE(), DATEADD(DAY, 15, GETDATE()), 'Session for Existential Philosophy', GETDATE()),
('Active', GETDATE(), DATEADD(DAY, 25, GETDATE()), 'Session for Exoplanetary Science', GETDATE()),
('Completed', DATEADD(DAY, -50, GETDATE()), DATEADD(DAY, -40, GETDATE()), 'Session for Ancient History', GETDATE()),
('Active', GETDATE(), DATEADD(DAY, 30, GETDATE()), 'Session for Machine Learning', GETDATE()),
('Completed', DATEADD(DAY, -60, GETDATE()), DATEADD(DAY, -50, GETDATE()), 'Session for Greek Literature', GETDATE()),
('Active', GETDATE(), DATEADD(DAY, 35, GETDATE()), 'Session for Molecular Biology', GETDATE()),
('Completed', DATEADD(DAY, -40, GETDATE()), DATEADD(DAY, -30, GETDATE()), 'Session for Ethics', GETDATE());


-- Populate ExamRequest
INSERT INTO ExamRequest (GroupID, CourseID, AssistantID, SessionID, Type, Date, TimeStart, TimeEnd, Details, Status, CreationDate)
VALUES
(1, 1, 1, 1, 'Written', GETDATE(),    '09:00:00', '10:00:00', 'Mid-term exam on quantum mechanics', 'Pending', GETDATE()),
(2, 2, 2, 2, 'Oral', GETDATE(),       '10:00:00', '11:00:00', 'Final exam on organic chemistry', 'Approved', GETDATE()),
(3, 3, 3, 3, 'Written', GETDATE(),    '11:00:00', '12:00:00', 'Exam on Renaissance Art', 'Pending', GETDATE()),
(4, 4, 4, 4, 'Practical', GETDATE(),  '14:00:00', '15:00:00', 'Assessment on Existential Philosophy', 'Approved', GETDATE()),
(5, 5, 5, 5, 'Written', GETDATE(),    '15:00:00', '16:00:00', 'Exam on Exoplanetary Science', 'Pending', GETDATE()),
(6, 6, 6, 6, 'Oral', GETDATE(),       '16:00:00', '18:00:00', 'Final exam on Ancient History', 'Approved', GETDATE()),
(7, 7, 7, 7, 'Written', GETDATE(),    '09:30:00', '10:30:00', 'Exam on Machine Learning', 'Pending', GETDATE()),
(8, 8, 8, 8, 'Practical', GETDATE(),  '11:30:00', '12:30:00', 'Assessment on Greek Literature', 'Approved', GETDATE()),
(9, 9, 9, 9, 'Oral', GETDATE(),       '13:30:00', '14:30:00', 'Final exam on Molecular Biology', 'Pending', GETDATE()),
(10, 10, 10, 10, 'Written', GETDATE(),'15:30:00', '17:30:00', 'Ethics exam', 'Approved', GETDATE());

-- Populate Room
INSERT INTO Room (DepartmentID, Name, Location, Capacity, Description, CreationDate)
VALUES
(1, 'Room 101', 'Building A', 30, 'Physics classroom', GETDATE()),
(2, 'Room 102', 'Building B', 25, 'Chemistry lab', GETDATE()),
(3, 'Room 201', 'Building C', 40, 'Art studio', GETDATE()),
(4, 'Room 202', 'Building D', 35, 'Philosophy seminar room', GETDATE()),
(5, 'Room 301', 'Building E', 50, 'Astronomy lab', GETDATE()),
(6, 'Room 302', 'Building F', 20, 'History archive room', GETDATE()),
(7, 'Room 401', 'Building G', 60, 'Computer science lab', GETDATE()),
(8, 'Room 402', 'Building H', 15, 'Literature reading room', GETDATE()),
(9, 'Room 501', 'Building I', 45, 'Biology research lab', GETDATE()),
(10, 'Room 502', 'Building J', 55, 'Ethics discussion room', GETDATE());

-- Populate ExamRequestRooms
INSERT INTO ExamRequestRooms (ExamRequestID, RoomID, CreationDate)
VALUES
(1, 1, GETDATE()),
(2, 2, GETDATE()),
(3, 3, GETDATE()),
(4, 4, GETDATE()),
(5, 5, GETDATE()),
(6, 6, GETDATE()),
(7, 7, GETDATE()),
(8, 8, GETDATE()),
(9, 9, GETDATE()),
(10, 10, GETDATE());


-- Populate Modifications
INSERT INTO Modifications (UserID, TableName, ColumnName, OldValue, NewValue, CreationDate)
VALUES
(1, 'Course', 'Title', 'Old Course Title', 'Updated Course Title', GETDATE()),
(2, 'User', 'Status', 'Inactive', 'Active', GETDATE()),
(3, 'Room', 'Capacity', '30', '40', GETDATE()),
(4, 'Group', 'Name', 'Old Group Name', 'New Group Name', GETDATE()),
(5, 'Specialization', 'Description', 'Old Description', 'Updated Description', GETDATE()),
(6, 'SubSpecialization', 'Name', 'Old SubSpecialization', 'New SubSpecialization', GETDATE()),
(7, 'Department', 'Name', 'Old Department', 'New Department', GETDATE()),
(8, 'ExamRequest', 'Status', 'Pending', 'Approved', GETDATE()),
(9, 'Session', 'Status', 'Inactive', 'Active', GETDATE()),
(10, 'Faculty', 'LongName', 'Old Faculty Name', 'New Faculty Name', GETDATE());



-- Populate Secretary
INSERT INTO Secretary (UserID, SpecializationID, Title, CreationDate)
VALUES
(5, 1, 'Administrative Secretary', GETDATE()),
(6, 2, 'Executive Secretary', GETDATE()),
(7, 3, 'Office Assistant', GETDATE()),
(8, 4, 'Academic Secretary', GETDATE()),
(9, 5, 'Faculty Secretary', GETDATE()),
(10, 6, 'Research Secretary', GETDATE()),
(1, 7, 'HR Secretary', GETDATE()),
(2, 8, 'Finance Secretary', GETDATE()),
(3, 9, 'Project Coordinator', GETDATE()),
(4, 10, 'Department Secretary', GETDATE());

-- Populate LabelHolders
INSERT INTO LabHolder (CourseID, ProfessorID, CreationDate)
VALUES
(1, 3, GETDATE()),
(2, 4, GETDATE()),
(3, 8, GETDATE()),
(4, 10, GETDATE()),
(5, 3, GETDATE()),
(6, 4, GETDATE()),
(7, 8, GETDATE()),
(8, 10, GETDATE()),
(9, 3, GETDATE()),
(10, 4, GETDATE());
