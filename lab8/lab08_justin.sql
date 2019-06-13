--------------------------------------------------------------------------------------------
--Justin Pulido
--May 26th, 2019
--lab08_justin.sql
--------------------------------------------------------------------------------------------

spool lab08Output.txt

--------------------------------------------------------------------------------------------
--selecting the employee id, full name, job id and salary and then checking the job id
--and getting user input to see which job title they are needing and if the job id
--and the job title are a match then display those. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name, job_ID, salary
    FROM HR.employees
    WHERE UPPER(job_ID) = ('&job_title')
    ORDER BY employee_ID;

--------------------------------------------------------------------------------------------
--making job_title be defined as IT PROG so when the sql script runs it will
--automaticlly fill the job title with IT prog and display those workers. 
--------------------------------------------------------------------------------------------
DEFINE job_title = 'IT_PROG'
SELECT employee_ID, first_name, last_name, job_ID, salary
    FROM HR.employees
    WHERE UPPER(job_ID) = ('&job_title')
    ORDER BY employee_ID;

--------------------------------------------------------------------------------------------
--allowing the user to select specific attributes to be shown and giving the condtion and 
--how to order the list as well. 
--------------------------------------------------------------------------------------------
SELECT &columnlists
    FROM HR.employees
    WHERE &conditions
    ORDER BY &orders;

--------------------------------------------------------------------------------------------
--selecting employee ID, full name and letting the user choose the rest of the columns, 
--then Im select it from hr.employees and ordering it by the column list that was entered.
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name, &&columnList
    FROM HR.employees
    ORDER BY &columnList;

spool off

SET LINESIZE 80
SET PAGESIZE 60
SET PAUSE OFF

spool report_005178247.txt
SET FEEDBACK OFF
TTITLE CENTER 'Employee Report' SKIP 1 CENTER 'As of ' _DATE
BTITLE CENTER 'Page:'SQL.PNO
BREAK ON job_id
COLUMN job_id HEADING 'Job|Category'
COLUMN Salary HEADING 'Salary' FORMAT $99,999.99
--
SELECT job_id, last_name ||','|| first_name AS Employee, salary
    FROM HR.employees
    WHERE salary > 5000
    ORDER BY job_id, last_name;

SET FEEDBACK ON
CLEAR BREAK
COLUMN job_id CLEAR
COLUMN salary CLEAR

spool off
SET PAUSE ON
