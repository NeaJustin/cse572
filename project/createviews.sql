
--First VIEW
DROP VIEW EBlockView CASCADE CONSTRAINTS;
CREATE VIEW EBlockView AS
SELECT
	departmentName
FROM
	AcademicDepartment
WHERE
	UPPER(strAddress)
LIKE
	'%E BLOCK%';

SELECT
	*
FROM
	EBlockView;

--Second VIEW
DROP VIEW PhDITView CASCADE CONSTRAINTS;
CREATE VIEW PhDITView AS
SELECT
	m.ModuleTitle,
	m.StartDate,
	m.EndDate
FROM
	Modules m,
	Courses c
WHERE
	c.CourseTitle 
LIKE 
	'PhDIT'
AND
	c.CourseCode
LIKE
	m.CourseCode;
	
SELECT
	*
FROM
	PhDITView;
	
--Third VIEW
DROP VIEW fManagerView CASCADE CONSTRAINTS;
CREATE VIEW fManagerView AS
SELECT
	s.FName || s.LName Full_Name,
	s.strAddress || ',' || s.city || ','|| s.postalCode Full_Address,
	TO_CHAR(s.salary,'$,999,999.00') AS Salary
FROM
	Staff s,
	AcademicDepartment a
WHERE
	a.staffNo
LIKE
	s.staffNo;
	
SELECT 
	*
FROM 
	fManagerView;
	
--Fourth VIEW;
DROP VIEW PhDView CASCADE CONSTRAINTS;
CREATE VIEW PhDView AS
SELECT
	FName || LName AS Full_Name,
	sex,
	TO_CHAR(salary,'$,999,999.00') AS Salary
FROM
	staff
WHERE
	UPPER(Qualifications)
LIKE
	'%PHD%';

SELECT
	*
FROM
	PhDView;
	
--Fifth VIEW
DROP VIEW CISStaffView CASCADE CONSTRAINTS;
CREATE VIEW CISStaffView AS
SELECT 
	s.LName,
	s.post,
	s.Qualifications
FROM
	Staff s,
	AcademicDepartment a
WHERE
	s.departmentNo
LIKE
	a.departmentNo;
	
SELECT 
	*
FROM
	CISStaffView;
	
--Sixth VIEW
DROP VIEW multiMediaView CASCADE CONSTRAINTS;
CREATE VIEW multiMediaView AS
SELECT
	s.matriculationNo,
	s.LName,
	s.sex,
	s.CourseCode
FROM
	Students s,
	CourseCode c,
WHERE
	s.CourseCode
LIKE
	c.CourseCode
AND
	UPPER(c.CourseTitle)
LIKE
	'MULTIMEDIA';
	
Select
	*
FROM
	multiMediaView;

--Seventh VIEW
DROP VIEW OverpaidView CASCADE CONSTRAINTS;
CREATE VIEW OverpaidView AS
SELECT
	staffNo,
	LName,
	sex,
	post
FROM
	Staff
WHERE
	salary > AVG((
	SELECT
		SALARY
	FROM 
		Staff
	));

SELECT
	*
FROM
	OverpaidView;
	
--Eighth VIEW
--DROP VIEW OverTenView CASCADE CONSTRAINTS;
--CREATE VIEW OverTenView AS
--SELECT
	







