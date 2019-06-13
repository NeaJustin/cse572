--------------------------------------------------------------------------------------------
--Justin Pulido
--Lab 3B
--April 21, 2019
--CSE 572
--------------------------------------------------------------------------------------------

spool lab03BOutput_justin.txt

--------------------------------------------------------------------------------------------
--I am selecting the department id, employee id, their full name and their hire date 
--and seeing how long they have been at the company. I am then getting the data from HR. 
--employees, and i am checking the hire_date to see if it is less than or equal to 
--15 years before today. then I am ordering it by department id and employee ID.
--------------------------------------------------------------------------------------------
SELECT department_id, employee_id, first_name, last_name, hire_date, (sysdate-hire_date)/365
    as Years_of_Service
    FROM HR.employees
    WHERE hire_date <= '21-APR-2004'
    ORDER BY department_id, employee_id;

--------------------------------------------------------------------------------------------
--I am doing the same as the function above, this time I am displaying only the department
--ID that is between 100 and 110 and them displaying those only. If they are not from 
--100 and 110 they will not be displayed. 
--------------------------------------------------------------------------------------------
SELECT department_id, employee_id, first_name, last_name, hire_date, (sysdate-hire_date)/365
    as Years_of_Service
    FROM HR.employees
    WHERE hire_date <= '21-APR-2004' and department_id BETWEEN 100 and 110
    ORDER BY department_id, employee_id;

--------------------------------------------------------------------------------------------
--selecting all the employee information (not repeating the top anymore too lazy. and its
--self explanatory) then I am getting the years of service and dividing it by 365 to get 
--an accurate amount of time they have worked. Then I am checking to see if the hire date
--is greater than or equal to the 1st of january of 2008 and I am ordering by Years of 
--service. If they were not hired by the first of January of 2008 they will not be 
--shown.
--------------------------------------------------------------------------------------------
SELECT employee_id, first_name, last_name, hire_date, (sysdate-hire_date)/365 
    as Years_of_Service
    FROM HR.employees
    WHERE hire_date >= '01-JAN-2008'
    ORDER BY Years_of_Service;

--------------------------------------------------------------------------------------------
--selecting all the employee information and getting the amount of years they worked 
--since april 21st, 2004 and if they worked before then and there salary is less than
--10000 then I will show them and order it by last name then first name. 
--------------------------------------------------------------------------------------------
SELECT employee_id, first_name, last_name, salary, hire_date, (sysdate-hire_date)/365
    as Years_of_Service
    FROM HR.employees
    WHERE hire_date <= '21-APR-2004' and salary < '10000'
    ORDER BY last_name, first_name;

--------------------------------------------------------------------------------------------
--I am counting the number of employees in the company and their min and max salaries
--then grabbing the data from hr.employees and displaying it in three columns by 
--count, min(salary) and max(salary)
--------------------------------------------------------------------------------------------
SELECT count(*), min(salary), max(salary)
    FROM HR.employees;

--------------------------------------------------------------------------------------------
--Selecting unique job_id from HR.employees. 
--------------------------------------------------------------------------------------------
SELECT DISTINCT job_id
    FROM HR.employees;

--------------------------------------------------------------------------------------------
--Selecting the first name and last name of the employees from hr and seeing if their 
--first name begins with the letter D and if it is no longer than 6 characters. 
--if it meets both of those conditions, display them. 
--------------------------------------------------------------------------------------------
SELECT first_name, last_name
    FROM HR.employees
    WHERE first_name like '%D%' and LENGTH(first_name)<=6;

--------------------------------------------------------------------------------------------
--Selecting first name, last name, and job id and changing their first name and last name
--to be upper case and then I am grabbing the information from hr.employees and checking
--to see if their job id has IT in the beginning of it and if it does then display those. 
--------------------------------------------------------------------------------------------
SELECT UPPER(last_name), UPPER(first_name), job_ID
    FROM HR.employees
    WHERE job_id like '%IT%';

--------------------------------------------------------------------------------------------
--providing a list of salaries that are unique and greater than or equal to 10000 and are 
--in order by least to greatest. 
--------------------------------------------------------------------------------------------
SELECT DISTINCT salary 
    FROM HR.employees
    WHERE salary >= '10000'
    ORDER BY salary;

--------------------------------------------------------------------------------------------
--Selecting all listings from job_history from HR and getting their years of service from 
--taking the sysdate and subtracting it from the start_date and dividing by 365. Then
--I am naming it years of service. After I grab it from HR.job_history and order by 
--Start date. 
--------------------------------------------------------------------------------------------
SELECT employee_id, start_date, end_date, job_id, department_id, (sysdate-start_date)/365
    as years_of_service
    FROM HR.job_history
    ORDER BY start_date;


spool off
