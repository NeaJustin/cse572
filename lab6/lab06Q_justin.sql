--------------------------------------------------------------------------------------------
--Justin Pulido
--lab06Q_justin.sql
--May 9th, 2019
--------------------------------------------------------------------------------------------

spool lab06QOutput_justin.txt

set pause off

--------------------------------------------------------------------------------------------
--1. selecting employee ID and last name and hire date and then I am getting this from
--hr.employees table where I am selecting hte department ID and checking to see if it is
--equal the department ID of employees where the last name is Zlotkey and if it is,
--then display his coworkers. Then we use the <> to make it where Zlotkey is not shown
--when displaying and then order by employee ID. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, last_name, hire_date
    FROM HR.employees
    WHERE department_ID =
        (SELECT department_ID 
        FROM HR.employees
        WHERE last_name='Zlotkey')
    AND last_name <> 'Zlotkey'
    ORDER BY employee_ID;

--------------------------------------------------------------------------------------------
--2. selecting employee_id, last_name and then grabbing from hr.employees table where 
--I am getting their salaries and comparing it to the avg salary from all employees 
--and if it is greater than the average, then display it. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, last_name
    FROM HR.employees
    WHERE salary >
        (SELECT avg(salary)
        FROM HR.employees)
    ORDER BY employee_ID ASC;

--------------------------------------------------------------------------------------------
--3. selecting employee id, last name, department id and location id from departments and 
--employees and then I am taking the location ID from departments and then using IN 
--to select the location ID from locations table and checking to see if it is equal to 
--1700 and if it is, then display those employees, and then order by employee ID. 
--------------------------------------------------------------------------------------------
SELECT e.employee_ID, e.last_name, d.department_ID, d.location_ID
    FROM HR.employees e, HR.departments d
    WHERE d.location_ID IN
        (SELECT location_ID
        FROM HR.locations
        WHERE location_ID = 1700)
    ORDER BY e.employee_ID;

--------------------------------------------------------------------------------------------
--4. selecting the employee id, last name and job id and then getting their manager ID
-- and displaying those who report to King. This is done by getting the last name of the
--employee ID from hr.employees and checking the manager ID from the previous portion.  
--------------------------------------------------------------------------------------------
SELECT e.employee_ID, e.last_name, e.job_ID
    FROM HR.employees e
    WHERE e.manager_ID IN
        (SELECT employee_ID
        FROM HR.employees
        WHERE last_name = 'King');

--------------------------------------------------------------------------------------------
--5. selecting the employee ID, the last name, and the job id and then getting them from
--hr.employees and checking the department ID and seeing if its in the department ID 
--from hr.departments where the department Name is executive and if it is, then 
--display it.  
--------------------------------------------------------------------------------------------
SELECT e.employee_ID, e.last_name, e.job_ID
    FROM HR.employees e
    WHERE e.department_ID IN
        (SELECT department_ID
        FROM HR.departments 
        WHERE department_name = 'Executive');

--------------------------------------------------------------------------------------------
--6. displaying department ID, number of employees, avg salaries, min salaries,
--max salaries, and sum salaries and then i am getting it from HR.employees and after
--I am grouping them by department ID and then sorting them by department ID.  
--------------------------------------------------------------------------------------------
SELECT department_ID as department, COUNT(employee_ID) as total_employees, 
    ROUND(AVG(salary)) as AVG_salary, MIN(salary) AS MIN_salary, MAX(salary) AS max_salary, 
    SUM(salary) as sum_salary
    FROM HR.employees 
    GROUP BY department_ID
    ORDER BY department_ID;

--------------------------------------------------------------------------------------------
--7. doing the same thing as the above function but the only difference is that 
--I am only displaying departments from 50 to 100 and that is it, the rest will not
--be displayed. 
--------------------------------------------------------------------------------------------
SELECT department_ID as department, COUNT(employee_ID) as total_employees, 
    ROUND(AVG(salary)) as AVG_salary, MIN(salary) as MIN_salary, MAX(salary) as max_salary,
    SUM(salary) as sum_salary
    FROM HR.employees
    WHERE department_ID >= 50 AND department_ID <= 100
    GROUP BY department_ID
    ORDER BY department_ID;

--------------------------------------------------------------------------------------------
--8. selecting the job_ID, counting how many employees there are, getting the average 
--salary, the max salary, and the minimum salary from hr.jobs and hr.employees. Then 
--I am grouping them by job id and sorting them by job ID.
--------------------------------------------------------------------------------------------
SELECT job_ID, COUNT(*) AS Employee_Count, 
    AVG(salary) AS average_salary, 
    MIN(salary) AS min_salary, MAX(salary) AS max_salary
    FROM HR.employees  
    GROUP BY job_ID
    ORDER BY job_ID;

--------------------------------------------------------------------------------------------
--9. doing the same thing as the previous function, just displaying those who have the 
--average salaries over 5000.
--------------------------------------------------------------------------------------------
SELECT job_ID, COUNT(*) AS Employee_Count, 
    AVG(salary) AS average_salary, 
    MIN(salary) AS min_salary, MAX(salary) AS max_salary
    FROM HR.employees 
    WHERE salary > 5000
    GROUP BY job_ID
    ORDER BY job_ID;

spool off
