--------------------------------------------------------------------------------------------
--Justin Pulido
--Richard Vargas
--cse 572
--June 9th, 2019
--------------------------------------------------------------------------------------------

SET CONSTRAINTS ALL DEFERRED;

--------------------------------------------------------------------------------------------
--Inserting Academic Department Values
--------------------------------------------------------------------------------------------
INSERT INTO AcademicDepartment VALUES ('NotreDame','1902','9095550912','4089998888',
'8700 Oak St.Bluffton, SC 29910 E Block','Ontario','91470','0000');
INSERT INTO AcademicDepartment VALUES ('CIS','1903','9095550913','4089998889',
'8702 Oak St.Bluffton, SC 29911 D Block','Ontario','91471','0001');
INSERT INTO AcademicDepartment VALUES ('AI','1904','9095550914','4089998890',
'8704 Oak St.Bluffton, SC 29912 F Block','Ontario','91472','0002');
INSERT INTO AcademicDepartment VALUES ('Sigma','1905','9095550915','4089998891',
'8706 Oak St.Bluffton, SC 29913 G Block','Ontario','91473','0003');
INSERT INTO AcademicDepartment VALUES ('MultiMedia','1906','9095550912','4089998888',
    '8700 Oak St.Bluffton, SC 29914 E Block','Ontario','91470','0004');

--------------------------------------------------------------------------------------------
--Inserting Staff Values
--43656, 39103, 43508,43422,43890
--------------------------------------------------------------------------------------------
INSERT INTO Staff VALUES ('0000','1902','43656','019','Jake',
    'M','Logan','','E 29','F','100000','DEPT. MANAGER',
    'PHD, MASTERS, BS','','','');

INSERT INTO Staff VALUES ('0001','1903','39103','020','Paulina',
    'K','Blade','','G 28','F','90000','DEPT. MANAGER',
    'PHD, MASTERS, BS','','','');

INSERT INTO Staff VALUES ('0002','1904','43502','021','Hector',
    'O','Garcia','','G 50','M','65000','DEPT. MANAGER',
    'PHD, MASTERS, BS','','','');

INSERT INTO Staff VALUES ('0003','1905','39111','022','Victoria',
    'T','Quincy','','D 21','F','85700','DEPT. MANAGER',
    'PHD, MASTERS, BS','','','');

INSERT INTO Staff VALUES ('0004','1906','43411','023','Maleria',
    'Z','Tucker','','D 09','M','86000','PROFESSOR',
    'MASTERS, BS, THEORETICAL DEGREE','','','');

INSERT INTO Staff VALUES ('0005','1902','43401','024','Richard',
    'D','Dy','','G 29','M','10000','PROFESSOR',
    'PHD, MASTERS, BS','','','');

INSERT INTO Staff VALUES ('0006','1903','43709','025','Eric',
    'C','Garcia','','F 29','M','29000','RESEARCH',
    'MASTERS, BS, QUANTUM MECHANICS BACKGROUND','','','');

INSERT INTO Staff VALUES ('0007','1904','43830','026','Ricardo',
    'M','Nothing','','F 50','F','35000','DEAN',
    'MASTERS IN PSYCHOLOGY','','','');

INSERT INTO Staff VALUES ('0008','1905','43102','027','Melany',
    '','Creative','','E 99','F','50000','IT',
    'MASTERS, BS, BIOLOGY CONCENTRATION','','','');

INSERT INTO Staff VALUES ('0009','1906', '43340','028','Cassandra',
    '','Haku','','G 10','M','50000','JANITOR',
    'MASTERS, PHILOSOPHY STUDYING PLATO','','','');

INSERT INTO Staff VALUES ('0010','1901','43876','029','Hitmon',
    'G','Haku','','F 90','M','20000','PROFESSOR',
    'MASTERS, PURSUING PHD NEURAL NETWORKS','','','');

--------------------------------------------------------------------------------------------
--Inserting Module Data
--------------------------------------------------------------------------------------------
INSERT INTO Modules VALUES ('43656','Graphic Design','0000','106','19-JAN-2019',
    '15-APR-2019', 'Graphics 101','1','NONE');
INSERT INTO Modules VALUES ('39103','Theoritical IT','0001','103','28-NOV-2016',
    '28-FEB-2017', 'Conceptual Modeling','1','BS DEGREE');
INSERT INTO Modules VALUES ('43502','Linear Algebra','0002','104','26-DEC-2017','31-JUL-208',
	'Really Hard Book','1','HIGH LEVEL MATH');
INSERT INTO Modules VALUES ('39111','Operating Systems','0003','102','31-OCT-2015',
    '28-JAN-2016', 'Intro To OS','1','CSE330');
INSERT INTO Modules VALUES ('43411','Creative Writing','0004','105','25-MAR-2010',
    '25-OCT-2010', 'Platos writing before death','1','NONE');
INSERT INTO Modules VALUES ('43401','Intro to Media','0005','101','27-MAR-2010',
    '30-OCT-2010', 'Media for Dummies','0','NONE');
INSERT INTO Modules VALUES ('43709','Intro to Adv CIS','0006','103','27-MAR-2010',
    '30-OCT-2010', 'Computer Info Stuff Vol 2','1','NONE');
INSERT INTO Modules VALUES ('43830','Media Philosophy','0007','101','27-MAR-2011',
    '30-OCT-2011', 'Damaging Society','1','NONE');
INSERT INTO Modules VALUES ('43102','Artificial Life','0008','102','20-MAR-2011',
    '30-OCT-2011', 'Robots living in society','1','NONE');
INSERT INTO Modules VALUES ('43340','International Media','0009','101','15-MAR-2011',
    '15-OCT-2011', 'Media of the world','1','NONE');
INSERT INTO Modules VALUES ('43876','Engineering','0010','103','10-MAR-2011',
    '10-OCT-2011', 'Create life by robotics','1','NONE');

--------------------------------------------------------------------------------------------
--Inserting Courses
--43656 MultiMedia, 43422 CS, 39103 PhDIT, 43508 MATH, 43890 English
--------------------------------------------------------------------------------------------
INSERT INTO Courses VALUES ('106','Art 1','0000');
INSERT INTO Courses VALUES ('103','PhDIT','0001');
INSERT INTO Courses VALUES ('104','MATH','0002');
INSERT INTO Courses VALUES ('102','CS','0003');
INSERT INTO Courses VALUES ('105','ENGLISH','0004');
INSERT INTO Courses VALUES ('101','MultiMedia','0005');

--------------------------------------------------------------------------------------------
--Inserting Students
--------------------------------------------------------------------------------------------
INSERT INTO Students VALUES ('123','Manuel','Scott','Bel Air 10029 Monroe AVE', --1
	'Corona','91536','11-JAN-1990','M','10000','9096542222','','106');
INSERT INTO Students VALUES ('124','Angelica','Monroe','Del Mar 10109 Columbine AVE',
	'Ontario','91520','11-DEC-1993','F','50000','9097432222','','103');
INSERT INTO Students VALUES ('125','Heidi','Fransico','San Bernardino 15264 Del Mar AVE',
	'Los Angeles','91650','21-JAN-1999','F','21000','9096562233','','104');
INSERT INTO Students VALUES ('126','Richard','Vargas','Long Beach 40039 Numbar AVE',
	'Redlands','91670','01-NOV-1994','M','460000','9095405858','','102');
INSERT INTO Students VALUES ('127','Justin','Pulido','Montrovia 10523 Aroyo AVE',
	'Ontario','91782','05-NOV-1995','M','50000','9095845555','','105');
INSERT INTO Students VALUES ('128','Desire','McGovern','Hollywood 15263 Dusbar AVE',
	'Skyrim','92560','05-FEB-1995','F','40000','7876504593','','101');
INSERT INTO Students VALUES ('129','Hillk','MGovern','Bollywood 15263 Dusbar AVE',
	'Skyword','92570','03-SEP-1991','F','80000','7776504593','','101');
INSERT INTO Students VALUES ('130','Hillary','Flynn','Dollywood 15263 Dusbar AVE',
	'Sword','92580','05-FEB-1995','F','40000','7556504593','','101', '783435');
INSERT INTO Students VALUES ('131','Millary','Alynn','Menaphie 15263 Dusbar AVE',
	'Dword','92590','05-MAY-1905','M','58000','7556504533','','101', '783651');
INSERT INTO Students VALUES ('132','Billary','Flynn','Xollywood 15263 Dusbar AVE',
	'Wword','92600','05-AUG-1985','F','30000','7656504593','','101', '785482');--5
INSERT INTO Students VALUES ('133','Xillary','Xlynn','Zollywood 15263 Dusbar AVE',
	'Kword','92610','05-FEB-1998','F','60000','7556504401','','103', '784823');--6

--------------------------------------------------------------------------------------------
--Inserting Staff Module
--------------------------------------------------------------------------------------------
INSERT INTO StaffModule VALUES ('0000','43656','1');
INSERT INTO StaffModule VALUES ('0001','39103','6');
INSERT INTO StaffModule VALUES ('0002','43502','40'); 
INSERT INTO StaffModule VALUES ('0003','39111','58');
INSERT INTO StaffModule VALUES ('0004','43411','46.00');
INSERT INTO StaffModule VALUES ('0005','43401','100.50'); 
INSERT INTO StaffModule VALUES ('0006','43709','98.50');
INSERT INTO StaffModule VALUES ('0007','43830','53.40');
INSERT INTO StaffModule VALUES ('0008','43102','89.40');
INSERT INTO StaffModule VALUES ('0009','43340','86.40');
INSERT INTO StaffModule VALUES ('0010','43876','89');


--------------------------------------------------------------------------------------------
--Inserting Student Module
--------------------------------------------------------------------------------------------
INSERT INTO StudentModule VALUES ('123','43656','A','001');
INSERT INTO StudentModule VALUES ('124','39103','A-','002');
INSERT INTO StudentModule VALUES ('125','43502','B+','003');
INSERT INTO StudentModule VALUES ('126','39111','C+','004');
INSERT INTO StudentModule VALUES ('127','43411','A+','005');
INSERT INTO StudentModule VALUES ('128','43401' ,'A+','006');
INSERT INTO StudentModule VALUES ('129','43709','B-','007');
INSERT INTO StudentModule VALUES ('129','43830','F','008');
INSERT INTO StudentModule VALUES ('129','43401','C','009');
INSERT INTO StudentModule VALUES ('130','43102','B-','010');
INSERT INTO StudentModule VALUES ('131','43340','C-', '011');
INSERT INTO StudentModule VALUES ('132','43876','D-', '012');

INSERT INTO StudentModule VALUES ('132','43709','D-', '013');
INSERT INTO StudentModule VALUES ('129','43830','A', '014');
INSERT INTO StudentModule VALUES ('129','43401','B+', '015');
INSERT INTO StudentModule VALUES ('131','43102','C', '016');
INSERT INTO StudentModule VALUES ('132','43401','F', '017');
INSERT INTO StudentModule VALUES ('132','43401','F', '018');
INSERT INTO StudentModule VALUES ('126','43401' ,'A+','019');
INSERT INTO StudentModule VALUES ('128','43401' ,'A','020');
INSERT INTO StudentModule VALUES ('129','43401' ,'A-','021');
INSERT INTO StudentModule VALUES ('130','43401' ,'B-','022');
INSERT INTO StudentModule VALUES ('132','43401' ,'B','023');
INSERT INTO StudentModule VALUES ('123','43401' ,'C+','024');


SET CONSTRAINTS ALL IMMEDIATE;
 
SELECT *
    FROM AcademicDepartment;
SELECT *
    FROM Staff;
SELECT *
    FROM Modules;
SELECT * 
    FROM Courses;
SELECT * 
    FROM Students;
SELECT *
    FROM StaffModule;
SELECT *
    FROM StudentModule;

