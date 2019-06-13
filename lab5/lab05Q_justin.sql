--------------------------------------------------------------------------------------------
--Justin Pulido
--lab05Q
--CSE 572
--May 4th, 2019
--------------------------------------------------------------------------------------------

spool lab05QOutput_justin.txt

--------------------------------------------------------------------------------------------
--getting employee information and having the e in front so it knows I am getting it from 
--employees and using d for departments and then ordering by employee id. 
--------------------------------------------------------------------------------------------
SELECT e.employee_id, e.last_name, e.department_id, d.department_name
    FROM HR.employees e, HR.departments d
    ORDER BY e.employee_id;

--------------------------------------------------------------------------------------------
--I am getting the employees id, last name, and department id, then the department name
--and getting both from HR.employees and hr.departments and using the left outer join
--function on HR.departments and im using the department id column to list all employees
--and then im ordering by employee id. 
--------------------------------------------------------------------------------------------
SELECT employee_id, last_name, department_id, department_name
    FROM HR.employees
    LEFT OUTER JOIN HR.departments
    USING(department_id)
    ORDER BY employee_id;

--------------------------------------------------------------------------------------------
--selecting distinct job id's and the city and the location of the jobs and then
--grabbing from HR employees, department and locations and checking to see if the 
--employees department id matches department id and making sure it is equal to 80 then
--display those. 
--------------------------------------------------------------------------------------------
SELECT DISTINCT e.job_id, l.city, l.location_id
    FROM HR.employees e, HR.departments d, HR.locations l
    WHERE e.department_id=d.department_id
    AND e.department_id=80;

--------------------------------------------------------------------------------------------
--select job_id, department name, and city grabbing each from employees and departments
--locations. and checking the employees department id to mach with departments department
--id and then checking the location id to match with location and checking to see 
--if the id is in 80,90,100 then order by department name. 
--------------------------------------------------------------------------------------------
SELECT e.job_id, d.department_name, l.city
    FROM HR.employees e, HR.departments d, HR.locations l
    WHERE e.department_id=d.department_id
    AND d.location_id=l.location_id
    AND e.department_id IN (80,90,100)
    ORDER BY d.department_name;

--------------------------------------------------------------------------------------------
--select the last name, department name, city and commission pct of the employees 
--from hr employees, departments and locations and then im displaying only the employees
--whose commission pct is not null and ordering by department name. 
--------------------------------------------------------------------------------------------
SELECT e.last_name, d.department_name, l.city, e.commission_pct
    FROM HR.employees e, HR.departments d, HR.locations l
    WHERE e.commission_pct IS NOT NULL
    ORDER BY d.department_name;

--------------------------------------------------------------------------------------------
--getting the last name and the department name from hr.employees and departments and then
--displaying those who have the letter a in their last name using like. 
--------------------------------------------------------------------------------------------
SELECT e.last_name, d.department_name
    FROM HR.employees e, HR.departments d
    WHERE e.last_name like '%a%'

--------------------------------------------------------------------------------------------
--grabbing employee information and then the departments name and the city and 
--im only displaying the workers information of those who work in TORONTO. 
--------------------------------------------------------------------------------------------
SELECT e.employee_id, e.last_name, e.job_id, d.department_name, l.city
    FROM HR.employees e, HR.departments d, HR.locations l
    WHERE l.city='Toronto';

--------------------------------------------------------------------------------------------
--using self joining tables to display the employees information as well as their 
--manager id and the last name and then ordering it by employee id. 
--------------------------------------------------------------------------------------------
SELECT e.employee_id AS EMP#, e.last_name AS Employee, e.manager_id AS MGR#,
    m.last_name AS Manager
    FROM HR.employees e, HR.employees m
    ORDER BY e.employee_id;

--------------------------------------------------------------------------------------------
--selecting employees informatio and the managers last name and using the self joining
--tables and then im grabbing the hire date of the employee and seeing if they 
--were working before their manager and if they are then display those only. 
--------------------------------------------------------------------------------------------
SELECT e.employee_id, e.last_name, e.hire_date, e.manager_id, m.last_name
    FROM HR.employees e, HR.employees m
    WHERE e.hire_date < m.hire_date;

--------------------------------------------------------------------------------------------
--selecting employee information and using the self joining table to also get employees
--davies that start with that last name and then check to see if the employees hire date
--is greater than davies and if it is then display it. 
--------------------------------------------------------------------------------------------
SELECT e.employee_ID, e.last_name, e.hire_date
    FROM HR.employees e, HR.employees davies
    WHERE davies.last_name='Davies'
    AND e.hire_date > davies.hire_date;

spool off
