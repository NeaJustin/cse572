--------------------------------------------------------------------------------------------
--Justin Pulido
--lab 3 
--------------------------------------------------------------------------------------------

spool lab03AOutput_justin.txt

--------------------------------------------------------------------------------------------
--What we are doing is selecting the employee id and the first name and last name,
--then we are grabbing it from employees that belong to HR that will then 
--select the empployee ID that is equal to 130. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name
    FROM HR.employees
    WHERE employee_ID='130';

--------------------------------------------------------------------------------------------
--We are selecting the employee ID, their first name and last name where we are grabbing
--it from employees that belong to HR and will then select it from where the department 
--is equal to 90. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name
    FROM HR.employees
    WHERE department_ID='90';

--------------------------------------------------------------------------------------------
--selecting the employee ID, first name and last name column to be displayed from 
--employees that belong to HR where the department ID is between 50 and 100. 
--if it is between 50 and 100 it will display that employees ID, first name and last name. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name
    FROM HR.employees
    WHERE department_ID
    BETWEEN 50 and 100;

--------------------------------------------------------------------------------------------
--Selecting the employee_ID, first name and last name column that belontg to HR. Then 
--I am displaying the names of the employees that their first name starts with the letters
--Da and only those will show up. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name
    FROM HR.employees
    WHERE first_name like '%Da%';

--------------------------------------------------------------------------------------------
--I am selecting the employee id, first and last name, department id, their job id, and 
--their salary and them im grabbing the data that belongs to HR.employees, where im 
--comparing the job id to IT_PROG and their salary is greater than 5000. If it matches
--those requirements it will display it. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name, department_id, job_id, salary
    FROM HR.employees
    WHERE job_id='IT_PROG' and salary >= 5000;

--------------------------------------------------------------------------------------------
--selecting the employee id, full name, department and job id, and their salary and then
--i am getting the employees from HR and checking their salary if it is greater than or 
--equal to 10000 or if their job id is comparable to mgr. if it is then it will be 
--displayed. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name, department_id, job_id, salary
    FROM HR.employees
    WHERE salary >= 10000 or job_id like '%mgr%';

--------------------------------------------------------------------------------------------
--selecting employee id, and their full name from hr.employees and i am displaying their 
--columns of employee id, and their full name if their first name has a similarity to the 
--the letters DA. example would be adam since it has da inside of the word. 
--------------------------------------------------------------------------------------------
SELECT employee_id, first_name, last_name
    FROM HR.employees
    WHERE first_name like '%da%';

--------------------------------------------------------------------------------------------
--selecting employee id, and their full name from hr.employees and i am displaying their
--columns only if their first name is not like da. meaning if it does not have the letters
--da next to each other in their first name, it will be displayed. If it does have them 
--together, then it will not be displayed. 
--------------------------------------------------------------------------------------------
SELECT employee_id, first_name, last_name
    FROM HR.employees
    WHERE first_name not like '%da%';

--------------------------------------------------------------------------------------------
--here I am selecting the employee id, their first name and last name, job id and salary
--that belong to hr. employees and i am comparing their job id to it_prog or to ad_pres
--and that their salary is over 10000. This will of course give us errors as it going to 
--display more than it should. Where it is only checking ad_pres for salaries over 10000.
--------------------------------------------------------------------------------------------
SELECT employee_id, first_name, last_name, job_id, salary
    FROM HR.employees
    WHERE job_id='IT_PROG' or job_id='AD_PRES' and salary > 10000;

--------------------------------------------------------------------------------------------
--Here it is different from above since we are using the parantheses to check the job_id
--with either it_prog or ad_pres and we are checking to see if each one has a salary over 
--10000 and if it doesnt, do not display it. If it does, then display it. 
--------------------------------------------------------------------------------------------
SELECT employee_id, first_name, last_name, job_id, salary
    FROM HR.employees
    WHERE (job_id='IT_PROG' or job_id='AD_PRES') and salary > 10000;

--------------------------------------------------------------------------------------------
--Here I am selecting the employee id, department id, and their full name from hr.employees
--and i am ordering them in order from least to greatest by department id. So 
--it will go from 1-n number of departments. 
--------------------------------------------------------------------------------------------
SELECT employee_id, department_id, first_name, last_name
    FROM HR.employees
    ORDER BY department_id;

--------------------------------------------------------------------------------------------
--Here I am selecting the employee id, department id, full name and raising their salary
--by multiplying it by 12, then renaming the column to be called annual. Then I am 
--ordering by department id from 1-n and getting the annual desc of it. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, department_id, first_name, last_name, salary*12 Annual
    FROM HR.employees
    ORDER BY department_id, Annual DESC;

--------------------------------------------------------------------------------------------
--Here I am ordering the employees by their department ID, and their first name and 
--last name. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, department_id, first_name, last_name
    FROM HR.employees
    ORDER BY department_id, first_name, last_name;

spool off
