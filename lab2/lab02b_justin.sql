-------------------------------------------------------------------------------------------
--Lab: Lab02B
--Name: Justin Pulido
-------------------------------------------------------------------------------------------

SET linesize 150

spool lab02bOutput_justin.txt

-------------------------------------------------------------------------------------------
--Here i am selecting the table name from all tables where the owner is HR.
--it will then display each table name in the column which accounts to x amount total
--for the given owner.
-------------------------------------------------------------------------------------------
SELECT table_name
    FROM all_tables
    WHERE owner='HR';

-------------------------------------------------------------------------------------------
--Using the describe to list the contents of each table name, that are owned by HR.
--Could not find a more efficient way of doing this. 
-------------------------------------------------------------------------------------------
DESC HR.regions;
DESC HR.locations;
DESC HR.departments;
DESC HR.jobs;
DESC HR.employees;
DESC HR.job_history;
DESC HR.job_grades;
DESC HR.countries;

-------------------------------------------------------------------------------------------
--I am selecting the job id, job title, max and min salary, and im subtracting the max and 
--min and naming the column called difference. And I am selecting it from HR.jobs.
-------------------------------------------------------------------------------------------
SELECT job_id, job_title, max_salary, min_salary, (max_salary-min_salary) Difference
    FROM HR.jobs;

-------------------------------------------------------------------------------------------
--I am selecting the employee id and concatenating the last name and first name and 
--forming it as one full name. I am then grabbing the hire date, and using the sysdate
--function to subtract it form the hire date and divinde it by 365 days to get an 
--accurate time of how long they have worked and naming it as years employed. Then
--I name the column years_employed and display the salary column after. 
-------------------------------------------------------------------------------------------
SELECT employee_id, last_name || '.' || first_name AS full_name, hire_date, 
    (sysdate-hire_date)/365 AS years_employed, salary
    FROM HR.employees;

-------------------------------------------------------------------------------------------
--using the select count wildstart and naming it as current employess and counting how 
--many employees are currently working at this time. 
-------------------------------------------------------------------------------------------
SELECT COUNT(*) AS current_employees
    FROM HR.employees;

-------------------------------------------------------------------------------------------
--Using the dstinct to grab only unique values of the employees salary as some of them 
--could have the same salary so it would only display it one time. 
-------------------------------------------------------------------------------------------
SELECT DISTINCT salary
    FROM HR.employees;

-------------------------------------------------------------------------------------------
--Using the select count and adding in DISTINCT salary to only grab the unique salaries 
--from hr.employees and displaying the column with the name of number of unique salaries. 
-------------------------------------------------------------------------------------------
SELECT COUNT(DISTINCT salary) AS number_of_unique_salaries
    FROM HR.employees;

spool off
