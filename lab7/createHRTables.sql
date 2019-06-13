--------------------------------------------------------------------------------------------
-- Justin Pulido
-- 005178247
-- May 21, 2019
--------------------------------------------------------------------------------------------

spool createHRTables_Outputs.txt

--------------------------------------------------------------------------------------------
--Here we are indicating the table an its schema that we are going to drop after
--drop table and using cascade constraints to remove all referential in the table itself.
--the cascade constraint also allows a primary key field in a primary key-forieng key 
--relationship to be updated or delete. 
--then we create the table department with number, name, ssn, start date and set
--primary key to be dnumber. 
--------------------------------------------------------------------------------------------
DROP TABLE Department CASCADE CONSTRAINTS;
CREATE TABLE Department (
	Dnumber	INT,
	Dname   VARCHAR2(15) UNIQUE NOT NULL,
	Mgr_SSN CHAR(9),
	Mgr_startDate DATE,
	CONSTRAINTS Department_PK PRIMARY KEY (Dnumber)
);

--------------------------------------------------------------------------------------------
--creating the table for employee and adding in all its parameters. Then we are using the
--ssn as the primary key for the employee table. 
--------------------------------------------------------------------------------------------
DROP TABLE Employee CASCADE CONSTRAINTS;
CREATE TABLE Employee (
	SSN	CHAR(9),	
	Fname VARCHAR2(15) NOT NULL,
	Minit CHAR(1),
    Lname VARCHAR2(15) NOT NULL,
    Bdate DATE NOT NULL,
    Address VARCHAR2(30),
	Sex   CHAR(1),
	Salary NUMBER(10,2) NOT NULL,
	super_SSN CHAR(9),
	Dno  INT,
    CONSTRAINTS Employee_PK PRIMARY KEY(SSN),
	CONSTRAINTS Employee_Sex_CK CHECK (Sex IN ('F','M'))
);

--------------------------------------------------------------------------------------------
--using to add, delete or moridfy the exisiting tables
--ON DELETE SET NULL will if the parent table of the record is deleted, then the child
--then the childs foreign key fields are set to null and the record is not deleted.
--------------------------------------------------------------------------------------------
ALTER TABLE Employee
	ADD CONSTRAINTS Employee_Dno_FK FOREIGN KEY (Dno) REFERENCES Department(Dnumber)
	ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE;

--------------------------------------------------------------------------------------------
--giving a constraint for employee by adding in a foreign key that references the employee
--ssn and using deferrable initially immediate to defer the constraints on demand when 
--it is needed.
--------------------------------------------------------------------------------------------
ALTER TABLE Employee
	ADD CONSTRAINTS Employee_super_SSN_FK FOREIGN KEY (super_SSN) REFERENCES Employee(SSN)
	DEFERRABLE INITIALLY IMMEDIATE;

--------------------------------------------------------------------------------------------
--adding the ability to alter the department and add constraints for the foreign key
--and having the on delete set null. 
--------------------------------------------------------------------------------------------
ALTER TABLE Department
	ADD CONSTRAINTS Department_Mgr_SSN_FK FOREIGN KEY (Mgr_SSN) REFERENCES Employee(SSN)
	ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE;
	
--------------------------------------------------------------------------------------------
--creating department locations and giving information for the table and its constraint
--of giving the primary key the department Number
--------------------------------------------------------------------------------------------
DROP TABLE Dept_Locations CASCADE CONSTRAINTS;
CREATE TABLE Dept_Locations(
	Dnumber INT,
	Dlocation VARCHAR2(20),
	CONSTRAINTS Dept_Locations_PK PRIMARY KEY (Dnumber)
);

--------------------------------------------------------------------------------------------
--adding on constraints to the department table giving it a primary key that references
--department number and using on delete set null
--------------------------------------------------------------------------------------------
ALTER TABLE Dept_Locations
	ADD CONSTRAINTS Dept_Locations_Dnumber_FK FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber)
	ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE;

--------------------------------------------------------------------------------------------
--creating the table project with all its parameters and its primary key
--------------------------------------------------------------------------------------------
DROP TABLE Project CASCADE CONSTRAINTS;
CREATE TABLE Project(
	Pnumber INT,
	Pname	 VARCHAR2(15) NOT NULL,
	Plocation VARCHAR2(20) NOT NULL,
	Dnumber  INT,
	CONSTRAINTS Project_PK PRIMARY KEY (Pnumber)
);

--------------------------------------------------------------------------------------------
--adding the constraints for the foreign key and the reference to the department number
--then deferrable inittialy immediately to get the constraints when you need it. 
--------------------------------------------------------------------------------------------
ALTER TABLE Project
	ADD CONSTRAINTS Project_Dnumber_FK FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber)
	DEFERRABLE INITIALLY IMMEDIATE;

--------------------------------------------------------------------------------------------
--Creating the table for work ons and giving the data and the constraints
--------------------------------------------------------------------------------------------
DROP TABLE Work_ons CASCADE CONSTRAINTS;
CREATE TABLE Work_ons(
	Essn	CHAR(9),
    Pno		INT,
	Hours	NUMBER,
	CONSTRAINTS Work_ons_PK PRIMARY KEY (Essn,Pno)
);

--------------------------------------------------------------------------------------------
--giving the table another constraint for the foreign key and using the on delete cascade
--functionality to immediately get the constraints when needed. 
--------------------------------------------------------------------------------------------
ALTER TABLE Work_ons
	ADD CONSTRAINTS Work_ons_Essn_FK FOREIGN KEY (Essn) REFERENCES Employee(SSN)
	ON DELETE CASCADE DEFERRABLE INITIALLY IMMEDIATE;

--------------------------------------------------------------------------------------------
--doing the same above but using the foreign key for the Pno
--------------------------------------------------------------------------------------------
ALTER TABLE Work_ons
	ADD CONSTRAINTS Work_ons_FK FOREIGN KEY (Pno) REFERENCES Project(Pnumber)
	ON DELETE CASCADE  DEFERRABLE INITIALLY IMMEDIATE;
	
--------------------------------------------------------------------------------------------
--creating a table for dependent and giving it its data and the primary key.
--------------------------------------------------------------------------------------------
DROP TABLE Dependent CASCADE CONSTRAINTS;
CREATE TABLE Dependent(
	Essn CHAR(9),
	Dependent_name VARCHAR2(15),
	Sex CHAR(1),
	Bdate DATE,
	RelationShip VARCHAR2(20),
	CONSTRAINTS Dependent_UK UNIQUE(Essn,Dependent_name)
);

-------------------------------------------------------------------------------------------
--adding on the same as all the other functions but to table dependent and adding 
--foreign key.
-------------------------------------------------------------------------------------------
ALTER TABLE Dependent
	ADD CONSTRAINTS Dependent_SSN_FK FOREIGN KEY (Essn) REFERENCES Employee(SSN)
	ON DELETE CASCADE DEFERRABLE INITIALLY IMMEDIATE;

spool off	

