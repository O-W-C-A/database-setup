BEGIN TRANSACTION;

-- Delete all dependent data first
DELETE FROM Modifications;
DELETE FROM ExamRequestRooms;
DELETE FROM ExamRequests;
DELETE FROM LabHolders;
DELETE FROM Professors;
DELETE FROM Secretaries;
DELETE FROM Students;
DELETE FROM Users;
DELETE FROM Groups;
DELETE FROM Rooms;
DELETE FROM Courses;
DELETE FROM Specializations;
DELETE FROM Departments;
DELETE FROM Faculties;
DELETE FROM Sessions;

-- Reset identity columns for SQL Server
DBCC CHECKIDENT ('Faculties', RESEED, 0);
DBCC CHECKIDENT ('Departments', RESEED, 0);
DBCC CHECKIDENT ('Specializations', RESEED, 0);
DBCC CHECKIDENT ('Users', RESEED, 0);
DBCC CHECKIDENT ('Groups', RESEED, 0);
DBCC CHECKIDENT ('Students', RESEED, 0);
DBCC CHECKIDENT ('Professors', RESEED, 0);
DBCC CHECKIDENT ('Courses', RESEED, 0);
DBCC CHECKIDENT ('Sessions', RESEED, 0);
DBCC CHECKIDENT ('ExamRequests', RESEED, 0);
DBCC CHECKIDENT ('Rooms', RESEED, 0);
DBCC CHECKIDENT ('Modifications', RESEED, 0);
DBCC CHECKIDENT ('Secretaries', RESEED, 0);

COMMIT;


-- Populate Faculties
INSERT INTO Faculties (ShortName, LongName, Description, CreationDate)
VALUES
('', '', '', GETDATE()),
('FIESC', 'Facultatea de Inginerie Electrică şi Ştiinţa Calculatoarelor', '', GETDATE()),
('FIMAR', 'Facultatea de Inginerie Mecanică, Autovehicule şi Robotică', '', GETDATE()),
('FEFS', 'Facultatea de Educaţie Fizică şi Sport', '', GETDATE()),
('FIA', 'Facultatea de Inginerie Alimentară', '', GETDATE()),
('FIG', 'Facultatea de Istorie, Geografie și Ştiinţe Sociale', '', GETDATE()),
('FLSC', 'Facultatea de Litere şi Ştiinţe ale Comunicării', '', GETDATE()),
('FS', 'Facultatea de Silvicultură', '', GETDATE()),
('FEAA', 'Facultatea de Economie, Administrație și Afaceri', '', GETDATE()),
('FSE', 'Facultatea de Ştiinţe ale Educaţiei', '', GETDATE()),
('FDSA', 'Facultatea de Drept şi Ştiinţe Administrative', '', GETDATE()),
('DSPP', 'Departamentul de Specialitate cu Profil Psihopedagogic', '', GETDATE()),
('FMSB', 'Facultatea de Medicină și Ştiințe Biologice', '', GETDATE()),
('CSUD', 'Consiliul pentru Studiile Universitare de Doctorat', '', GETDATE());


-- Populate Departments
INSERT INTO Departments (FacultyID, Name, Description, CreationDate)
VALUES
(1, 'Exterior', '', GETDATE()),
(2, 'Calculatoare', '', GETDATE()),
(2, 'Calculatoare, Electronică şi Automatică', '', GETDATE()),
(2, 'Electrotehnică', '', GETDATE()),
(3, 'Mecanică şi tehnologii', '', GETDATE()),
(4, 'Educaţie fizică şi sport', '', GETDATE()),
(5, 'Tehnologii alimentare, siguranţa producţiei alimentare şi a mediului', '', GETDATE()),
(6, 'Geografie', '', GETDATE()),
(6, 'Ştiinţe umane şi social-politice', '', GETDATE()),
(7, 'Limba şi literatura română şi ştiinţele comunicării', '', GETDATE()),
(7, 'Limbi şi literaturi străine', '', GETDATE()),
(8, 'Silvicultura şi protecţia mediului', '', GETDATE()),
(9, 'Contabilitate, Audit si Finante', '', GETDATE()),
(9, 'Economie, Informatica economica si Gestiunea Afacerilor', '', GETDATE()),
(9, 'Management Administrarea afacerilor si Turism', '', GETDATE()),
(10, 'Departamentul de specialitate cu profil psihopedagogic', '', GETDATE()),
(10, 'Ştiinţe ale educaţiei', '', GETDATE()),
(11, 'Drept şi Ştiinţe Administrative', '', GETDATE()),
(12, 'Departamentul de Învăţământ la Distanţă', '', GETDATE()),
(13, 'Departamentul de Științe Biologice și Morfofuncționale', '', GETDATE()),
(13, 'Departamentul de Științe Medico-Chirurgicale și Complementare', '', GETDATE()),
(14, 'CSUD', '', GETDATE());

-- Populate Specializations
INSERT INTO Specializations (FacultyID, Name, Description, CreationDate)
VALUES
(1, 'ESCCA', '', GETDATE()),
(1, 'RCC', '', GETDATE()),
(1, 'SC', '', GETDATE()),
(1, 'TAMAE', '', GETDATE()),
(1, 'EN', '', GETDATE()),
(1, 'RST', '', GETDATE()),
(1, 'AIA_DUAL', '', GETDATE()),
(1, 'C', '', GETDATE()),
(1, 'ME', '', GETDATE()),
(1, 'Conv. TIC', '', GETDATE()),
(1, 'SIC', '', GETDATE()),
(1, 'SE_DUAL', '', GETDATE()),
(1, 'AIA', 'Automatica şi Informatică Aplicată', GETDATE()),
(1, 'C_DUAL', '', GETDATE()),
(1, 'ETTI', '', GETDATE()),
(1, 'ESM', '', GETDATE()),
(1, 'SE', '', GETDATE()),
(1, 'SMCPE', '', GETDATE()),
(1, 'FIESC - CR', '', GETDATE()),
(1, 'Drept', '', GETDATE()),
(1, 'DPC', '', GETDATE()),
(1, 'DEI', '', GETDATE()),
(1, 'PL', '', GETDATE()),
(1, 'MAE', '', GETDATE()),
(1, 'AP', '', GETDATE()),
(2, 'AR', '', GETDATE()),
(2, 'TCM', '', GETDATE()),
(2, 'IMCSSM', '', GETDATE()),
(2, 'MA', '', GETDATE()),
(2, 'FIMAR-CR', '', GETDATE()),
(2, 'MAU', '', GETDATE()),
(2, 'IM_DUAL', '', GETDATE()),
(2, 'MCT', '', GETDATE()),
(2, 'TCM_DUAL', '', GETDATE()),
(2, 'IM', '', GETDATE()),
(2, 'II-Postuni', '', GETDATE()),
(2, 'I-Postuniv', '', GETDATE()),
(2, 'ND', '', GETDATE()),
(2, 'AMG', '', GETDATE()),
(2, 'NRM', '', GETDATE()),
(2, 'BC', '', GETDATE()),
(2, 'TD', '', GETDATE()),
(2, 'MED', '', GETDATE()),
(2, 'BFKT', '', GETDATE()),
(2, 'BIO', '', GETDATE()),
(2, 'SDSSU', '', GETDATE()),
(2, 'SDSAI', '', GETDATE()),
(3, 'EFS', '', GETDATE()),
(3, 'KRMC', '', GETDATE()),
(3, 'KMS', '', GETDATE()),
(3, 'EFSAE', '', GETDATE()),
(4, 'MSMSA', '', GETDATE()),
(4, 'MCEPA', '', GETDATE()),
(4, 'PCM', '', GETDATE()),
(4, 'MIASP', '', GETDATE()),
(4, 'CEPA', '', GETDATE()),
(4, 'IPA', '', GETDATE()),
(5, 'G (ID)', '', GETDATE()),
(5, 'GT', '', GETDATE()),
(5, 'Ist.(Conv)', '', GETDATE()),
(5, 'TDR', '', GETDATE()),
(5, 'RISE', '', GETDATE()),
(5, 'IPIS', '', GETDATE()),
(5, 'GISPT', '', GETDATE()),
(5, 'Ist.', '', GETDATE()),
(5, 'Fil.(Conv)', '', GETDATE()),
(5, 'MSSSC', '', GETDATE()),
(5, 'RU', '', GETDATE()),
(5, 'EAAEO', '', GETDATE()),
(5, 'Asist. Soc', '', GETDATE()),
(5, 'MRICT', '', GETDATE()),
(5, 'G', '', GETDATE()),
(6, 'EG', '', GETDATE()),
(6, 'LC', '', GETDATE()),
(6, 'RS', '', GETDATE()),
(6, 'ES', '', GETDATE()),
(6, 'CCB', '', GETDATE()),
(6, 'Litere', '', GETDATE()),
(6, 'Conv.I', '', GETDATE()),
(6, 'Conv.U', '', GETDATE()),
(6, 'MD', '', GETDATE()),
(6, 'RF (ID)', '', GETDATE()),
(6, 'FS', '', GETDATE()),
(6, 'Conv.F', '', GETDATE()),
(6, 'TPT-F', '', GETDATE()),
(6, 'LRCE', '', GETDATE()),
(6, 'Conv.S', '', GETDATE()),
(6, 'Conv.R', '', GETDATE()),
(6, 'RI', '', GETDATE()),
(6, 'FG', '', GETDATE()),
(6, 'UF', '', GETDATE()),
(6, 'UR', '', GETDATE()),
(6, 'RF', '', GETDATE()),
(6, 'CRP', '', GETDATE()),
(6, 'RG', '', GETDATE()),
(6, 'ER', '', GETDATE()),
(6, 'Conv.E', '', GETDATE()),
(6, 'Conv.G', '', GETDATE()),
(6, 'CMIC', '', GETDATE()),
(6, 'FI', '', GETDATE()),
(6, 'UE', '', GETDATE()),
(6, 'FE', '', GETDATE()),
(6, 'EI', '', GETDATE()),
(7, 'MADF', '', GETDATE()),
(7, 'Silvicult.', '', GETDATE()),
(7, 'CBME', '', GETDATE()),
(7, 'Silvic-ID', '', GETDATE()),
(7, 'E.P.M.', '', GETDATE()),
(8, 'MAAF', '', GETDATE()),
(8, 'MI', '', GETDATE()),
(8, 'ECTS', '', GETDATE()),
(8, 'AI', '', GETDATE()),
(8, 'AGC', '', GETDATE()),
(8, 'DDS', '', GETDATE()),
(8, 'DEEF', '', GETDATE()),
(8, 'MFCTS', '', GETDATE()),
(8, 'IEc', '', GETDATE()),
(8, 'AMA', '', GETDATE()),
(8, 'AFRUO', '', GETDATE()),
(8, 'APE', '', GETDATE()),
(8, 'MAAFAD', '', GETDATE()),
(8, 'MNG', '', GETDATE()),
(8, 'PLANNING', '', GETDATE()),
(8, 'CIG', '', GETDATE()),
(8, 'AMS', '', GETDATE()),
(8, 'EGCE', '', GETDATE()),
(8, 'EAI', '', GETDATE()),
(8, 'NTPDM', '', GETDATE()),
(8, 'GDE', '', GETDATE()),
(8, 'CAFEC', '', GETDATE()),
(8, 'FB', '', GETDATE()),
(8, 'AF', '', GETDATE()),
(9, 'Psih', '', GETDATE()),
(9, 'PIPP', '', GETDATE()),
(9, 'MIE', '', GETDATE()),
(9, 'CSEE', '', GETDATE()),
(9, 'PIPP-Conv.', '', GETDATE()),
(9, 'RIEC', '', GETDATE());

-- Populate User
 
-- Add Professors
INSERT INTO Users (FacultyID, Email, PasswordHash, FirstName, LastName, Role, UniversityID, Status, CreationDate)
VALUES
(1, 'alice.johnson@usm.ro', 'hashedpassword1', 'Alice', 'Johnson', 'professor', 22345, 'Active', GETDATE()),
(1, 'bob.williams@usm.ro', 'hashedpassword2', 'Bob', 'Williams', 'professor', 22346, 'Active', GETDATE());

-- Add Students for Group 1 (Group 3141)
INSERT INTO Users (FacultyID, Email, PasswordHash, FirstName, LastName, Role, UniversityID, Status, CreationDate)
VALUES
(1, 'john.doe@student.usm.ro', 'hashedpassword3', 'John', 'Doe', 'student', 32001, 'Active', GETDATE()),
(1, 'jane.smith@student.usm.ro', 'hashedpassword4', 'Jane', 'Smith', 'student', 32002, 'Active', GETDATE()),
(1, 'alex.popescu@student.usm.ro', 'hashedpassword5', 'Alex', 'Popescu', 'student', 32003, 'Active', GETDATE()),
(1, 'emily.white@student.usm.ro', 'hashedpassword6', 'Emily', 'White', 'student', 32004, 'Active', GETDATE()),
(1, 'rares.vasilescu@student.usm.ro', 'hashedpassword7', 'Rares', 'Vasilescu', 'student', 32005, 'Active', GETDATE());

-- Add Students for Group 2 (Group 3142)
INSERT INTO Users (FacultyID, Email, PasswordHash, FirstName, LastName, Role, UniversityID, Status, CreationDate)
VALUES
(1, 'andrei.ionescu@student.usm.ro', 'hashedpassword8', 'Andrei', 'Ionescu', 'student', 32006, 'Active', GETDATE()),
(1, 'maria.dumitrescu@student.usm.ro', 'hashedpassword9', 'Maria', 'Dumitrescu', 'student', 32007, 'Active', GETDATE()),
(1, 'mihai.stanescu@student.usm.ro', 'hashedpassword10', 'Mihai', 'Stanescu', 'student', 32008, 'Active', GETDATE()),
(1, 'elena.georgescu@student.usm.ro', 'hashedpassword11', 'Elena', 'Georgescu', 'student', 32009, 'Active', GETDATE()),
(1, 'ana.munteanu@student.usm.ro', 'hashedpassword12', 'Ana', 'Munteanu', 'student', 32010, 'Active', GETDATE());

-- Add Secretaries
INSERT INTO Users (FacultyID, Email, PasswordHash, FirstName, LastName, Role, UniversityID, Status, CreationDate)
VALUES
(1, 'linda.brown@usm.ro', 'hashedpassword13', 'Linda', 'Brown', 'secretary', 40001, 'Active', GETDATE());


-- Populate Group
INSERT INTO Groups (SpecializationID, Name, CreationDate)
VALUES 
-- Computer Science groups
(8, '3111', GETDATE()),
(8, '3112', GETDATE()),
(8, '3113', GETDATE()),
(8, '3114', GETDATE()),
(8, '3115', GETDATE()),
(8, '3121', GETDATE()),
(8, '3122', GETDATE()),
(8, '3123', GETDATE()),
(8, '3124', GETDATE()),
(8, '3131', GETDATE()),
(8, '3132', GETDATE()),
(8, '3133', GETDATE()),
(8, '3134', GETDATE()),
(8, '3141', GETDATE()),
(8, '3142', GETDATE()),
(8, '3143', GETDATE());

-- Populate Students
INSERT INTO Students (UserID, GroupID, IsLeader, CreationDate)
VALUES
(3, 14, 1, GETDATE()),
(4, 14, 0, GETDATE()),
(5, 14, 0, GETDATE()),
(6, 14, 0, GETDATE()),
(7, 14, 0, GETDATE()),
(8, 15, 1, GETDATE()),
(9, 15, 0, GETDATE()),
(10, 15, 0, GETDATE()),
(11, 15, 0, GETDATE()),
(12, 15, 0, GETDATE());

-- Populate Professors
INSERT INTO Professors (UserID, DepartmentID, Title, CreationDate)
VALUES
(1, 3, 's.l. dr. ing.', GETDATE()),
(2, 3, 'prof. dr. ing.', GETDATE());

-- Populate Secretaries
INSERT INTO Secretaries (UserID, SpecializationID, Title, CreationDate)
VALUES
(13, 8, 'Computer Secretary', GETDATE());

-- Populate Courses
DELETE FROM Courses;

-- Reset the identity counter
DBCC CHECKIDENT ('Courses', RESEED, 0);

-- Insert new, more relevant courses
INSERT INTO Courses (ProfessorID, SpecializationID, Title, Year, Semester, Description, Status, CreationDate)
VALUES
-- Year 4 - Semester 1
(1, 1, 'Analiza matematica', 3, 1, 'Calcul diferential si integral, serii de functii', 'Active', GETDATE()),
(1, 1, 'Algebra liniara si geometrie', 4, 1, 'Spatii vectoriale, transformari liniare, forme patratice', 'Active', GETDATE()),
(1, 1, 'Programarea calculatoarelor', 3, 1, 'Fundamentele programarii in C++', 'Active', GETDATE()),
(1, 1, 'Logica computationala', 4, 1, 'Logica propozitionala, predicate, demonstratii', 'Active', GETDATE()),
(1, 1, 'Structuri de date', 4, 2, 'Algoritmi si structuri fundamentale de date', 'Active', GETDATE()),
(1, 1, 'Arhitectura sistemelor de calcul', 3, 2, 'Organizarea si proiectarea calculatoarelor', 'Active', GETDATE()),
(1, 1, 'Matematici speciale', 4, 2, 'Ecuatii diferentiale si analiza complexa', 'Active', GETDATE()),
(1, 1, 'Fizica', 3, 2, 'Fundamente de mecanica si electricitate', 'Active', GETDATE()),

(2, 2, 'Programare orientata pe obiecte', 3, 1, 'Concepte OOP in Java', 'Active', GETDATE()),
(2, 2, 'Baze de date', 4, 1, 'Proiectare si administrare baze de date', 'Active', GETDATE()),
(2, 2, 'Retele de calculatoare', 3, 1, 'Protocoale si arhitecturi de retea', 'Active', GETDATE()),
(2, 2, 'Sisteme de operare', 4, 1, 'Gestiunea resurselor si procese', 'Active', GETDATE()),
(2, 2, 'Ingineria programarii', 3, 2, 'Metodologii de dezvoltare software', 'Active', GETDATE()),
(2, 2, 'Proiectarea algoritmilor', 4, 2, 'Tehnici de proiectare si analiza', 'Active', GETDATE()),
(2, 2, 'Tehnologii Web', 3, 2, 'Dezvoltare aplicatii web moderne', 'Active', GETDATE()),
(2, 2, 'Inteligenta artificiala', 4, 2, 'Algoritmi si tehnici de AI', 'Active', GETDATE());


-- Populate Session
DELETE FROM Sessions;
DBCC CHECKIDENT ('Sessions', RESEED, 0);

-- Insert Sessions
INSERT INTO Sessions (Status, StartDate, EndDate, Semester, Description, CreationDate)
VALUES
-- Last Academic Year (2023-2024)
('Inactive', '2023-12-15', '2024-02-15', 1, 'Sesiune de examene', '2023-12-01'),
('Inactive', '2024-01-30', '2024-02-19', 1,  'Sesiune de restante', '2024-01-15'),
('Inactive', '2024-06-15', '2024-07-15', 2, 'Sesiune de examene', '2024-06-01'),
('Inactive', '2024-09-01', '2024-09-15', 2, 'Sesiune de restante', '2024-08-15'),

-- Current Academic Year (2024-2025) - Planned
('Active', '2024-12-15', '2025-02-15', 1, 'Sesiune de examene', GETDATE()),
('Scheduled', '2025-01-30', '2025-02-19', 1, 'Sesiune de restante', GETDATE());

-- Populate ExamRequests
DELETE FROM ExamRequests;
DBCC CHECKIDENT ('ExamRequests', RESEED, 0);

INSERT INTO ExamRequests (GroupID, CourseID, AssistantID, SessionID, Date, Status, CreationDate)
VALUES
(14, 1, 1, 5, '2025-01-20', 'Pending', GETDATE()),
(14, 2, 2, 5, '2025-01-22', 'Pending', GETDATE()),
(15, 3, 1, 5, '2025-01-25', 'Pending', GETDATE()),
(15, 4, 2, 5, '2025-01-27', 'Pending', GETDATE());

-- Populate Rooms
INSERT INTO Rooms (DepartmentID, Name, Location, Capacity, Description, CreationDate)
VALUES
-- Corp A rooms
(1, 'A018', 'A', 30, 'A018 Laborator Gamificarea Ed', GETDATE()),
(1, 'A022', 'A', 30, 'A022 Centru Resurse ET', GETDATE()),
(1, 'A114', 'A', 30, 'A114 (A53)', GETDATE()),
(1, 'A121', 'A', 30, 'A121 - laborator', GETDATE()),
(1, 'A108', 'A', 30, 'Laborator Limbi Moderne', GETDATE()),
(1, 'A111', 'A', 50, 'Sala Eugeniu Coşeriu', GETDATE()),
(1, 'A115', 'A', 100, 'Amfiteatrul Eugen Lovinescu', GETDATE()),

-- Corp B rooms
(2, 'B302', 'B', 35, 'B302 Tehnica dentara-Protetica', GETDATE()),
(2, 'B304', 'B', 35, 'Sala B304', GETDATE()),
(2, 'B305', 'B', 35, 'B305 Laborator Fizica', GETDATE()),
(2, 'B307', 'B', 35, 'B307 Sala Curs', GETDATE()),
(2, 'B310', 'B', 35, 'B310 Sala Curs', GETDATE()),
(2, 'B312', 'B', 35, 'FIM B312', GETDATE()),

-- Corp C rooms
(3, 'C001', 'C', 30, 'Sala C001', GETDATE()),
(3, 'C002', 'C', 30, 'Sala C002', GETDATE()),
(3, 'C003', 'C', 30, 'Sala C003', GETDATE()),
(3, 'C004', 'C', 30, 'Sala C004', GETDATE()),
(3, 'C005', 'C', 30, 'Sala C005', GETDATE()),
(3, 'C007', 'C', 30, 'Sala C007', GETDATE()),

-- Corp D rooms and amphitheaters
(4, 'D Amf. DH', 'D', 100, 'Amfiteatrul Dragomir Hurmuzescu', GETDATE()),
(4, 'D Amf. NB', 'D', 100, 'Amfiteatrul Nicolae Boţan', GETDATE()),
(4, 'D Amf. RR', 'D', 100, 'Amfiteatrul Remus Radulet', GETDATE()),
(4, 'D Amf. DL', 'D', 100, 'Amfiteatrul Dimitrie Leonida', GETDATE()),

-- Corp E rooms
(5, 'E213', 'E', 40, 'Sala E213', GETDATE()),
(5, 'E210', 'E', 40, 'Sala E210', GETDATE()),
(5, 'E205', 'E', 40, 'Sala E205', GETDATE()),
(5, 'E223', 'E', 40, 'Sala E223', GETDATE()),
(5, 'Aula E', 'E', 200, 'Aula Corp E', GETDATE()),

-- Special facilities
(6, 'Sala Sport', 'Sala', 100, 'Sala sport', GETDATE()),
(6, 'S. Fitness', 'A', 30, 'L104 - Sala Fitness', GETDATE()),
(6, 'Bazin', 'K', 50, 'Bazin de înot', GETDATE()),
(6, 'Auditorium', 'F', 300, 'Auditorium Corp F', GETDATE()),

-- Labs and specialized rooms
(7, 'B006 Lab MF', 'B', 25, 'B006 Laborator Mec Fluide', GETDATE()),
(7, 'B008 Lab TMT', 'B', 25, 'B008 Laborator Termotehnica', GETDATE()),
(7, 'B209 Lab Mec', 'B', 25, 'B209 Laborator Mecanica', GETDATE()),
(7, 'B213 Lab RM', 'B', 25, 'B213 Laborator Rezistenta', GETDATE()),
(7, 'Lab Roboti', 'B', 25, 'Laborator ROBOTI', GETDATE());

-- Populate ExamRequestRooms
DELETE FROM ExamRequestRooms;

INSERT INTO ExamRequestRooms (ExamRequestID, RoomID, CreationDate)
VALUES
(1, 11, GETDATE()),
(1, 12, GETDATE()),
(2, 13, GETDATE()),
(2, 14, GETDATE()),
(3, 15, GETDATE()),
(4, 16, GETDATE());


-- Populate Modifications
--INSERT INTO Modifications (UserID, TableName, ColumnName, OldValue, NewValue, CreationDate)
--VALUES
--(1, 'Courses', 'Title', 'Old Courses Title', 'Updated Courses Title', GETDATE()),
--(2, 'User', 'Status', 'Inactive', 'Active', GETDATE()),
--(3, 'Rooms', 'Capacity', '30', '40', GETDATE()),
--(4, 'Group', 'Name', 'Old Group Name', 'New Group Name', GETDATE()),
--(5, 'Specializations', 'Description', 'Old Description', 'Updated Description', GETDATE()),
--(6, 'SubSpecializations', 'Name', 'Old SubSpecializations', 'New SubSpecializations', GETDATE()),
--(7, 'Departments', 'Name', 'Old Departments', 'New Departments', GETDATE()),
--(8, 'ExamRequests', 'Status', 'Pending', 'Approved', GETDATE()),
--(9, 'Session', 'Status', 'Inactive', 'Active', GETDATE()),
--(10, 'Faculties', 'LongName', 'Old Faculties Name', 'New Faculties Name', GETDATE());


-- Populate LabHolders
DELETE FROM LabHolders;
DBCC CHECKIDENT ('LabHolders', RESEED, 0);

INSERT INTO LabHolders (CourseID, ProfessorID, CreationDate)
VALUES
(1, 1, GETDATE()),
(2, 2, GETDATE()),
(3, 1, GETDATE()),
(4, 2, GETDATE());


-- First, let's clean up any orphaned records

-- Clean up Students table - remove entries where User doesn't exist
DELETE FROM Students 
WHERE UserID NOT IN (SELECT UserID FROM Users WHERE Role = 'student');

-- Clean up Professors table - remove entries where User doesn't exist
DELETE FROM Professors 
WHERE UserID NOT IN (SELECT UserID FROM Users WHERE Role = 'professor');

-- Clean up LabHolders - remove entries where Professor or Course doesn't exist
DELETE FROM LabHolders 
WHERE ProfessorID NOT IN (SELECT ProfessorID FROM Professors)
   OR CourseID NOT IN (SELECT CourseID FROM Courses);

-- Clean up Courses - remove entries where Professor doesn't exist
DELETE FROM Courses 
WHERE ProfessorID NOT IN (SELECT ProfessorID FROM Professors);

-- Ensure all Students are in valid Groups
DELETE FROM Students 
WHERE GroupID NOT IN (SELECT GroupID FROM Groups);

-- Update Courses to ensure valid SpecializationIDs
UPDATE Courses 
SET SpecializationID = 1 
WHERE SpecializationID NOT IN (SELECT SpecializationID FROM Specializations);

-- Ensure all Groups have valid Specializations
UPDATE Groups 
SET SpecializationID = 1 
WHERE SpecializationID NOT IN (SELECT SpecializationID FROM Specializations);

-- Ensure each Group has exactly one leader
WITH GroupLeaders AS (
    SELECT GroupID, COUNT(*) as LeaderCount
    FROM Students
    WHERE IsLeader = 1
    GROUP BY GroupID
)
UPDATE Students
SET IsLeader = 0
WHERE GroupID IN (
    SELECT GroupID 
    FROM GroupLeaders 
    WHERE LeaderCount > 1
)
AND UserID NOT IN (
    SELECT TOP 1 UserID 
    FROM Students s2 
    WHERE s2.GroupID = Students.GroupID 
    AND s2.IsLeader = 1 
    ORDER BY UserID
);

-- Ensure groups without leaders get one
INSERT INTO Students (UserID, GroupID, IsLeader, CreationDate)
SELECT TOP 1 
    s.UserID, 
    s.GroupID, 
    1, 
    GETDATE()
FROM Students s
WHERE s.GroupID NOT IN (
    SELECT DISTINCT GroupID 
    FROM Students 
    WHERE IsLeader = 1
)
GROUP BY s.GroupID, s.UserID;

-- Verify and fix Faculty relationships
UPDATE Users
SET FacultyID = 1
WHERE FacultyID NOT IN (SELECT FacultyID FROM Faculties);

-- Verify and fix Department relationships
UPDATE Professors
SET DepartmentID = 1
WHERE DepartmentID NOT IN (SELECT DepartmentID FROM Departments);

-- Set consistent Status values
UPDATE Users
SET Status = 'Active'
WHERE Status IS NULL OR Status NOT IN ('Active', 'Inactive');

-- Ensure all dates are valid
UPDATE Users
SET CreationDate = GETDATE()
WHERE CreationDate IS NULL;

UPDATE Students
SET CreationDate = GETDATE()
WHERE CreationDate IS NULL;

UPDATE Professors
SET CreationDate = GETDATE()
WHERE CreationDate IS NULL;

UPDATE Courses
SET CreationDate = GETDATE()
WHERE CreationDate IS NULL;
