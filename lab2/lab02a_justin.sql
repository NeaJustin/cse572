--------------------------------------------------------------------------------------------
--lab: lab02-A
--Name: Justin Pulido
--------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------
--set 75 characters per line
--------------------------------------------------------------------------------------------
SET linesize 75

--------------------------------------------------------------------------------------------
--output queries result to text file called lab02Output_justin.txt
--------------------------------------------------------------------------------------------
spool lab02Output_justin.txt

--note each sql query has at least one comment line
--to describe what the query is expected to produce. 

--------------------------------------------------------------------------------------------
--describing the jobs from HR.
--------------------------------------------------------------------------------------------
DESC HR.jobs;

--------------------------------------------------------------------------------------------
--lising all columns from HR.jobs
--------------------------------------------------------------------------------------------
SELECT *
    FROM HR.jobs;

--------------------------------------------------------------------------------------------
--Selecting job id and title from the HR.jobs
--------------------------------------------------------------------------------------------
SELECT job_id, job_title
    FROM HR.jobs;

--------------------------------------------------------------------------------------------
--Selecting the list of the jobs title and having a column with the name Minimum_AS_Salary
--that shows the minimum salary for each job that is currently offered from HR.jobs
--------------------------------------------------------------------------------------------
SELECT job_title, min_salary Minimum_AS_Salary
    FROM HR.jobs;

--------------------------------------------------------------------------------------------
--Selecting the list of jobs title and getting the minimum salary and multiplying by 1.2
--to give a new minimum salary of 120% higher. 
--------------------------------------------------------------------------------------------
SELECT job_title, min_salary*1.2 "120% Minimum Salary"
    FROM HR.jobs;

--------------------------------------------------------------------------------------------
--Selecting the job title and getting the minimum salary of the job title.
--then we are multiplying it by 12 for 12 months to get the annual minimum salary of the 
--job.
--------------------------------------------------------------------------------------------
SELECT job_title, min_salary*12 Annual_minimum
    FROM HR.jobs;

--------------------------------------------------------------------------------------------
--Selecting the job title and getting the minimum salary and multiplying it by 12 and then
--we add 2000 onto it giving them a raise and calling it a New_minimum. 
--------------------------------------------------------------------------------------------
SELECT job_title, min_salary*12 + 2000 New_minimum
    FROM HR.jobs;

--------------------------------------------------------------------------------------------
--This will do the same as the above, the only difference is in the calcuation. 
--It will subtract 2000 from the Minimum salary instead of adding 2000. 
--------------------------------------------------------------------------------------------
SELECT job_title, min_salary*12 - 2000 New_minimum
    FROM HR.jobs;

--------------------------------------------------------------------------------------------
--Seecting the job title and then taking the minimum salary and atting the max salary
--then we divide it by 2 to get the average of the combined total. 
--------------------------------------------------------------------------------------------
SELECT job_title, (min_salary+max_salary)/2 Average_Salary
    FROM HR.jobs;

--------------------------------------------------------------------------------------------
--This will Select the last name and the salary as well as the comission pct, from
--HR.employees and it will display each three in three sepereate rows. some will 
--not have a value for the commission percentage. 
--------------------------------------------------------------------------------------------
SELECT last_name, salary, commission_pct
    FROM HR.employees;

--------------------------------------------------------------------------------------------
--Selecting the last name, salary and multiplying their salary by 12 and multiplying it to 
--the commission to get their commission percentage from their salary. 
--------------------------------------------------------------------------------------------
SELECT last_name, salary, 12*salary*commission_pct
    FROM HR.employees;

--------------------------------------------------------------------------------------------
--In this we are selecting the job title and use || operator to concatenate with 
--min_salary and have a new table created using AS to make it be 
--called Job_Title_Min_Salary
--------------------------------------------------------------------------------------------
SELECT job_title || min_salary AS Job_Title_Min_Salary
    FROM HR.jobs;

--------------------------------------------------------------------------------------------
--This one will do the same as the previous with concatenation, but it will use the job ID
--and the job title and add "," to have a space in between to make it more readable. and 
--the title will now be Job_ID, Title 
-------------------------------------------------------------------------------------------
SELECT job_id || ',' || job_title AS "Job_ID, Title"
    FROM HR.jobs;

--------------------------------------------------------------------------------------------
--Selecting the min_salary from hr.jobs and having their salaries displayed. 
--------------------------------------------------------------------------------------------
SELECT min_salary
    FROM HR.jobs;

--------------------------------------------------------------------------------------------
--Selecting Distinct minimum salaries and this will only grab the distinct salaries from
--hr.jobs. Any salary that is not unique, meaning that the salary matches another, it will
--not show those duplicates.
--------------------------------------------------------------------------------------------
SELECT DISTINCT min_salary
    FROM HR.jobs;

--------------------------------------------------------------------------------------------
--list available tables from HR user
--------------------------------------------------------------------------------------------
SELECT table_name
    FROM all_tables
    WHERE owner='HR';

--------------------------------------------------------------------------------------------
--stop sending output to file
--------------------------------------------------------------------------------------------
spool off
