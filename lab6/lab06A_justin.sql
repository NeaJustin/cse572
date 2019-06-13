--------------------------------------------------------------------------------------------
--Justin Pulido
--lab06A
--April 8th, 2019
--------------------------------------------------------------------------------------------

spool lab06AOutput_justin.txt

--------------------------------------------------------------------------------------------
--selecting employees information and getting their salaries from the HR.employees table
--then i am comparing the salaries and seeing if it is greater than or equal to the 
--slaries of the employees who have an employee of ID 201. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name, salary
    FROM HR.employees
    WHERE salary >=
        (SELECT salary
        FROM HR.employees
        WHERE employee_ID = '201');

--------------------------------------------------------------------------------------------
--listing employees with their full name, ID, and salary and then getting it from the
--HR.employees table. After I am selecting the salary that is greater than all 
--and then selecting salary from hr.employees again and getting the job_id of it_prog
--and display those that are at least the maximum salary of the employees of IT. 
--Then order by Employee_ID. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name, salary
    FROM HR.employees
    WHERE salary >= ALL
        (SELECT salary 
        FROM HR.employees
        WHERE Job_ID = 'IT_PROG')
    ORDER BY employee_ID;

--------------------------------------------------------------------------------------------
--listing the employees information from HR.employees table and getting the salary that
--is greater than or euqla to the MAX salary of IT_PROG that we are grabbing from 
--that we are pulling from HR.employees. Then we are ordering by employee_ID. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name, salary, Job_ID
    FROM HR.employees
    WHERE salary >=
        (SELECT MAX(salary)
        FROM HR.employees
        WHERE Job_ID = 'IT_PROG')
    ORDER BY employee_ID;

--------------------------------------------------------------------------------------------
--listing the employees infromation and then using the keyword IN to specify more than
--one specific value and then selecting manager ID from the employees table and checking 
--and then selecting the salary and checking to see if it is less than or equal too
--the average salary from hr.employees and if it is then display it. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name, salary
    FROM HR.employees
    WHERE employee_ID IN
        (SELECT manager_ID
        FROM HR.employees)
    AND salary <= (SELECT AVG(salary) FROM HR.employees);

--------------------------------------------------------------------------------------------
--selecting employee information then getting the data from HR.employees table, 
--then after I am selecting the min salary from HR.employees as comparison to the salary
--and only displaying the one with the minimum salary. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name, department_ID, salary
    FROM HR.employees
    WHERE salary = (SELECT MIN(salary) FROM HR.employees);

--------------------------------------------------------------------------------------------
--selecting the information of employees where their employee id is the manager ID and 
--only displaying those who are supervisors/managers that are unique. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name
    FROM HR.employees
    WHERE employee_ID IN
        (SELECT distinct manager_ID FROM HR.employees);

--------------------------------------------------------------------------------------------
--This will not print anything as this is saying to not print those that are not in 
--the distinct manager ID from HR.employees so nothing is going to print. Failing to list. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name
    FROM HR.employees
    where employee_ID NOT IN 
        (SELECT distinct manager_ID FROM HR.employees);

--------------------------------------------------------------------------------------------
--we are listing the employees that are not supervisors and checking to make sure it is 
--not null also.  
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name
    FROM HR.employees
    WHERE employee_ID NOT IN
        (SELECT distinct manager_ID FROM HR.employees
        WHERE manager_ID IS NOT NULL);

--------------------------------------------------------------------------------------------
--selecting the min and max salaries and the avg salary along with the sum, then we are 
--seeing how many salaries there are by using Count function and getting the contents from
--HR.employees. Its not required but I wanted to round the avg salary since it
--was too long. 
--------------------------------------------------------------------------------------------
SELECT COUNT(*), MIN(salary), MAX(salary), AVG(salary), SUM(salary)
    FROM HR.employees;

--------------------------------------------------------------------------------------------
--listing employees information where their salaries are less than or equal to the 
--average of the salaries from HR.employees. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name, salary
    FROM HR.employees
    WHERE salary <=
        (SELECT AVG(salary) FROM HR.employees);

--------------------------------------------------------------------------------------------
--getting the employees information and checking to see if their salaries are greater than
--or equal to the max salary from HR.employees where the job id is IT_PROG and if it is
--list them, otherwise dont. Also, order by employee_id. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name, salary, Job_ID
    FROM HR.employees
    WHERE salary >=
        (SELECT MAX(salary) FROM HR.employees
        WHERE Job_ID = 'IT_PROG')
    ORDER BY employee_ID;

--------------------------------------------------------------------------------------------
--select ID of the department and counting their total number of employees, their min
--and max salaries and the average salary and then im grouping by deparmtent ID. 
--------------------------------------------------------------------------------------------
SELECT department_ID, COUNT(*), MIN(salary), MAX(salary), AVG(salary)
    FROM HR.employees
    GROUP BY department_ID;

--------------------------------------------------------------------------------------------
--selecting the employee information and listing those whose department ID is not 100 and 
--as long as the minimum salary is less than 8000 then lsit them. Otherwise dont list them. 
--------------------------------------------------------------------------------------------
SELECT department_ID, COUNT(*), MIN(salary), MAX(salary)
    FROM HR.employees WHERE department_ID <> 100
    GROUP BY department_ID
    HAVING MIN(salary) < 8000;

--------------------------------------------------------------------------------------------
--we are comparing department 100 to the rest of the departments where if the min 
--salary is the same as the other departments, then list all those departments with
--their minimum salary, max salary, and their average salary as well along with how 
--many employees work in the department.
--------------------------------------------------------------------------------------------
SELECT department_ID, COUNT(*), MIN(salary), MAX(salary), AVG(salary)
    FROM HR.employees
    GROUP BY department_ID
    HAVING MIN(salary) >=
        (SELECT MIN(salary) 
        FROM HR.employees
        WHERE department_ID = 100);

--------------------------------------------------------------------------------------------
--Selecting the employees information where they have the lowest salary in their 
--departments. This is done by checking salary IN min salary from hr.employees and then
--checknig a and b department ID and see if they are a match and if they are, then
--display them.
--------------------------------------------------------------------------------------------
SELECT first_name, last_name, department_ID, salary
    FROM HR.employees a
    WHERE salary IN
        (SELECT MIN(salary) FROM HR.employees b
        GROUP BY department_ID
        HAVING a.department_ID = b.department_ID);

spool off
