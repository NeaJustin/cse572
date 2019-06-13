DROP VIEW V1 CASCADE CONSTRAINTS;
CREATE VIEW V1 AS 
    SELECT * 
        FROM HR.jobs;
        
SELECT * 
    FROM V1;
    
DROP VIEW V2 CASCADE CONSTRAINTS;
CREATE VIEW V2 AS 
    SELECT job_id, job_title 
        FROM HR.jobs;

SELECT *
    FROM V2;
    
DROP VIEW V3 CASCADE CONSTRAINTS;
CREATE VIEW V3 AS 
    SELECT job_title, min_salary Minimum_Salary
        FROM HR.jobs;

        
SELECT *
    FROM V3;
    
DROP VIEW V4 CASCADE CONSTRAINTS;
CREATE VIEW V4 AS
    SELECT job_title, min_salary*1.2 AS "120% Minimum Salary"
        FROM HR.jobs;

SELECT *
    FROM V4;
    
DROP VIEW V5 CASCADE CONSTRAINTS;
CREATE VIEW V5 AS 
    SELECT job_title, min_salary*12 Annual_Minimum 
        FROM HR.jobs;
        
SELECT *
    FROM V5;
    
DROP VIEW V6 CASCADE CONSTRAINTS;
CREATE VIEW V6 AS 
    SELECT job_title, min_salary*12 + 2000 New_Minimum
        FROM HR.jobs;
        
SELECT * 
    FROM V6;
    
DROP VIEW V7 CASCADE CONSTRAINTS;
CREATE VIEW V7 AS 
    SELECT job_title, (min_salary+max_salary)/2  Average_Salary
        FROM HR.jobs;
        
SELECT * 
    FROM V7;
    
DROP VIEW V8 CASCADE CONSTRAINTS;
CREATE VIEW V8 AS 
    SELECT last_name, salary, commission_pct
        FROM HR.employees;
        
SELECT *
    FROM V8;
    
DROP VIEW V9 CASCADE CONSTRAINTS;
CREATE VIEW V9 AS
    SELECT last_name, salary, 12*salary*commission_pct
        FROM HR.employees;
        
SELECT *
    FROM V9;
    
DROP VIEW V10 CASCADE CONSTRAINTS;
CREATE VIEW V10 AS
    SELECT job_title || min_salary AS "Job Title Min Salary "
        FROM HR.jobs;
        
SELECT *
    FROM V10;
    
DROP VIEW V11 CASCADE CONSTRAINTS;
CREATE VIEW V11 AS
    SELECT job_id || ',' ||job_title  AS "Job ID, Title "
        FROM HR.jobs;
        
SELECT *
    FROM V11;
    
DROP VIEW V12 CASCADE CONSTRAINTS;
CREATE VIEW V12 AS 
    SELECT min_salary
        FROM HR.jobs;
        
SELECT *
    FROM V12;
    
DROP VIEW V13 CASCADE CONSTRAINTS;
CREATE VIEW V13 AS 
    SELECT DISTINCT min_salary
        FROM HR.jobs;
        
SELECT *
    FROM V13;
