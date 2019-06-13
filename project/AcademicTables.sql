--------------------------------------------------------------------------------------------
--Justin Pulido
--Richard Vargas
--6/9/2019
--CSE 572
--Phase 3
--------------------------------------------------------------------------------------------

SET PAUSE OFF
spool TableCreation.txt

--------------------------------------------------------------------------------------------
--creating the tables for the database that will be used when inserting the data and
--creating the views. 
--------------------------------------------------------------------------------------------

DROP TABLE AcademicDepartment CASCADE CONSTRAINTS;
CREATE TABLE AcademicDepartment (
    departmentName VARCHAR2(10) NOT NULL,
    departmentNo CHAR(4) NOT NULL,
    phoneNo VARCHAR2(10),
    faxNo VARCHAR2(10),
    strAddress VARCHAR2(40),
    city VARCHAR2(15),
    postalCode INT,
    staffNo CHAR(4) NOT NULL,
    CONSTRAINTS AcademicDepartment_PK PRIMARY KEY (departmentNo)
);

DROP TABLE Staff CASCADE CONSTRAINTS;
CREATE TABLE Staff (
    staffNo CHAR(4) NOT NULL,
    departmentNo CHAR(4),
    ModuleCode CHAR(5) NOT NULL,
    networkID CHAR(3) NOT NULL,
    FName VARCHAR2(20) NOT NULL,
    Minit CHAR(1),
    LName VARCHAR2(20) NOT NULL,
    phoneExt INT,
    officeNo VARCHAR2(10),
    Sex CHAR(1),
    Salary NUMBER(8,2),
    Post VARCHAR2(20),
    Qualifications VARCHAR2(50) NOT NULL,
    strAddress VARCHAR2(40),
    city VARCHAR(15),
    postalCode INT,
    CONSTRAINTS Staff_PK PRIMARY KEY (staffNo)
);

DROP TABLE Modules CASCADE CONSTRAINTS;
CREATE TABLE Modules (
    ModuleCode CHAR(5) NOT NULL,
    ModuleTitle VARCHAR2(30) NOT NULL,
    staffNo CHAR(4) NOT NULL,
    CourseCode CHAR(3) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    textbooks VARCHAR2(30),
    assessment CHAR(1),
    prereqs VARCHAR2(70),
    CONSTRAINTS Modules_PK PRIMARY KEY (ModuleCode)
);

DROP TABLE Courses CASCADE CONSTRAINTS;
CREATE TABLE Courses (
    CourseCode CHAR(3) NOT NULL,
    CourseTitle VARCHAR2(30) NOT NULL,
    staffNo CHAR(4) NOT NULL,
    CONSTRAINTS Courses_PK PRIMARY KEY (CourseCode)
);

DROP TABLE Students CASCADE CONSTRAINTS;
CREATE TABLE Students (
    networkID CHAR(3)NOT NULL,
    FName VARCHAR2(20) NOT NULL,
    LName VARCHAR2(20) NOT NULL,
    strAddress VARCHAR2(40),
    city VARCHAR2(15),
    postalCode INT,
    DOB DATE NOT NULL,
    Sex CHAR(1),
    FinancialLoan NUMBER(10,2) NOT NULL,
    Phone INT,
    NOK VARCHAR2(30), --NOK == Next of Kin
    CourseCode CHAR(3),
    CONSTRAINTS Students_PK PRIMARY KEY (networkID)
);

DROP TABLE StaffModule CASCADE CONSTRAINTS;
CREATE TABLE StaffModule (
    staffNo CHAR(4) NOT NULL,
    ModuleCode CHAR(5) NOT NULL,
    Hours NUMBER(6,2),
    CONSTRAINTS StaffModule_PK PRIMARY KEY (staffNo, ModuleCode),
    UNIQUE(ModuleCode)
);

DROP TABLE StudentModule CASCADE CONSTRAINTS;
CREATE TABLE StudentModule (
    networkID CHAR(3),
    ModuleCode CHAR(5) NOT NULL,
    Grade CHAR(2),
    matriculationNo INT NOT NULL,
    CONSTRAINTS StudentModule_PK PRIMARY KEY (matriculationNo)
);

spool off

--------------------------------------------------------------------------------------------
--Creating a new text file for altering the tables to add the the foreign keys that will be
--used for later on.
--------------------------------------------------------------------------------------------

spool AlterTables.txt

ALTER TABLE AcademicDepartment
    ADD CONSTRAINTS AcademicDepartment_staffNo_FK FOREIGN KEY(staffNo) 
    REFERENCES Staff(staffNo)
    ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Staff
    ADD CONSTRAINTS Staff_ModuleCode_FK FOREIGN KEY(ModuleCode) 
    REFERENCES Modules(ModuleCode)
    ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Modules
    ADD CONSTRAINTS Modules_CourseCode_FK FOREIGN KEY(CourseCode)
    REFERENCES Courses(CourseCode)
    ON DELETE SET NULL DEFERRABLE;

ALTER TABLE Courses
    ADD CONSTRAINTS Courses_staffNo_FK FOREIGN KEY(staffNo) 
    REFERENCES Staff(staffNo)
    ON DELETE SET NULL DEFERRABLE;

ALTER TABLE Students 
    ADD CONSTRAINTS Students_ModuleCode_FK FOREIGN KEY(CourseCode)
    REFERENCES Courses(CourseCode)
    ON DELETE SET NULL DEFERRABLE;

ALTER TABLE StaffModule
    ADD CONSTRAINTS StaffModule_staffNo_FK FOREIGN KEY(staffNo)
    REFERENCES Staff(staffNo)
    ON DELETE SET NULL DEFERRABLE;

ALTER TABLE StaffModule
    ADD CONSTRAINTS StaffModule_ModuleCode_FK FOREIGN KEY(ModuleCode)
    REFERENCES Modules(ModuleCode)
    ON DELETE SET NULL DEFERRABLE;

ALTER TABLE StudentModule
    ADD CONSTRAINTS StudentModule_networkID_FK FOREIGN KEY(networkID)
    REFERENCES Students(networkID)
    ON DELETE SET NULL DEFERRABLE ;

ALTER TABLE StudentModule
    ADD CONSTRAINTS StudentModule_ModuleCode_FK FOREIGN KEY(ModuleCode)
    REFERENCES Modules(ModuleCode)
    ON DELETE SET NULL DEFERRABLE;

spool off

--------------------------------------------------------------------------------------------
--creating comments for the table
--------------------------------------------------------------------------------------------

spool CommentOnTables.txt

COMMENT ON TABLE AcademicDepartment
	IS 'All departments in the university database';

COMMENT ON COLUMN AcademicDepartment.departmentName
	IS 'Unique Department Name';

COMMENT ON COLUMN AcademicDepartment.departmentNo
	IS 'Unique Department Number';

COMMENT ON COLUMN AcademicDepartment.phoneNo
	IS 'Department Telephone Number';

COMMENT ON COLUMN AcademicDepartment.faxNo
	IS 'Department Fax Number';

COMMENT ON COLUMN AcademicDepartment.strAddress
	IS 'Department Street Address';
  
COMMENT ON COLUMN AcademicDepartment.city
	IS 'Department city';

COMMENT ON COLUMN AcademicDepartment.postalCode
	IS 'Department Postal Zip Code';
  
COMMENT ON TABLE Courses
	IS 'All Courses at the University';

COMMENT ON COLUMN Courses.CourseCode
	IS 'Unique Course Code';

COMMENT ON COLUMN Courses.CourseTitle
	IS 'Course Title';
  
COMMENT ON COLUMN Courses.staffNo
	IS 'Unique Staff Number for Staff in charge of Course';

COMMENT ON TABLE Staff
	IS 'All staff at the university';
  
COMMENT ON COLUMN Staff.staffNo
	IS 'Unique staff number';

COMMENT ON COLUMN Staff.staffNo
	IS 'Unique staff number';
  
COMMENT ON COLUMN Staff.departmentNo
	IS 'Unique department number that the employee belongs to';

COMMENT ON COLUMN Staff.ModuleCode
	IS 'Module that the employee belongs to';

COMMENT ON COLUMN Staff.networkID
	IS 'Unique network ID';

COMMENT ON COLUMN Staff.FName
	IS 'First name of staff';

COMMENT ON COLUMN Staff.LName
	IS 'Last name of staff';
  
COMMENT ON COLUMN Staff.Minit
	IS 'Middle Initial';

COMMENT ON COLUMN Staff.phoneExt
	IS 'Phone extension of that stuff number';

COMMENT ON COLUMN Staff.officeNo
	IS 'Office number of the staff';
  
COMMENT ON COLUMN Staff.Sex
	IS 'Sexual Gender of the staff';
  
COMMENT ON COLUMN Staff.Salary
	IS 'How much the staff is making';
  
COMMENT ON COLUMN Staff.Post
	IS 'Position of the employee';
  
COMMENT ON COLUMN Staff.Qualifications
	IS 'Qualifications of the staff';
  
COMMENT ON COLUMN Staff.strAddress
	IS 'Staff home Street Address';
  
COMMENT ON COLUMN Staff.city
	IS 'Staff home city';

COMMENT ON COLUMN Staff.postalCode
	IS 'Staff home Postal Zip Code';
  
COMMENT ON TABLE Modules
	IS 'All modules at the university, aka classes';

COMMENT ON COLUMN Modules.ModuleCode
	IS 'Unique Module Code';

COMMENT ON COLUMN Modules.ModuleTitle
	IS 'Unique Module Title';

COMMENT ON COLUMN Modules.CourseCode
	IS 'Course that the module belongs to';

COMMENT ON COLUMN Modules.StartDate
	IS 'Date the the module starts';

COMMENT ON COLUMN Modules.EndDate
	IS 'Date the the module ends';

COMMENT ON COLUMN Modules.textbooks
	IS 'Books required for the course';

COMMENT ON COLUMN Modules.prereqs
	IS 'prereq modules for the module';
  
COMMENT ON TABLE Students
	IS 'All students at the university';

COMMENT ON COLUMN Students.networkID
	IS 'unique network ID';

COMMENT ON COLUMN Students.FName
	IS 'First name of student';

COMMENT ON COLUMN Students.LName
	IS 'Last name of student';

COMMENT ON COLUMN Students.strAddress
	IS 'Students home Street Address';
  
COMMENT ON COLUMN Students.city
	IS 'Students home city';

COMMENT ON COLUMN Students.postalCode
	IS 'Students home Postal Zip Code';

COMMENT ON COLUMN Students.DOB
	IS 'Date of birth';

COMMENT ON COLUMN Students.Sex
	IS 'Sexual Gender of Student';

COMMENT ON COLUMN Students.FinancialLoan
	IS 'Amount the student owns';

COMMENT ON COLUMN Students.Phone
	IS 'Phone Number of the student';

COMMENT ON COLUMN Students.NOK
	IS 'Next of Kin of the student';

COMMENT ON COLUMN Students.CourseCode
	IS 'Course code that the student belongs to';
  
COMMENT ON TABLE StaffModule
	IS 'Staff teaching a module in the university';

COMMENT ON COLUMN StaffModule.staffNo
	IS 'Staff number of staff teaching';

COMMENT ON COLUMN StaffModule.ModuleCode
	IS 'Module that staff is teaching';

COMMENT ON COLUMN StaffModule.Hours
	IS 'Amount of hours spent teaching that module';

COMMENT ON TABLE StudentModule
	IS 'Students who belong to a certain module in the university';

COMMENT ON COLUMN StudentModule.networkID
	IS 'Network ID that student belongs do';

COMMENT ON COLUMN StudentModule.ModuleCode
	IS 'Module that the student belongs to';

COMMENT ON COLUMN StudentModule.Grade
	IS 'Grade in the module';

spool off

