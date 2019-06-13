--------------------------------------------------------------------------------------------
--Justin Pulido
--May 3rd, 2019
--lab05A_justin.sql
--------------------------------------------------------------------------------------------

spool lab05AOutput_justin.txt

--------------------------------------------------------------------------------------------
--selecting the employee id, full name and the deparmtent name and I am choosing from both
--the HR.employees and the HR.departments. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name, department_name
    FROM HR.employees, HR.departments;

--------------------------------------------------------------------------------------------
--getting the employee id, first_name, last_name, the employees department ID number from 
--HR and the department name and I am getting it from HR.employees and HR. departments
--where the employees department 
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name,
    HR.employees.department_id, department_name
    FROM HR.employees, HR.departments
    WHERE HR.employees.department_id=HR.departments.department_id;

--------------------------------------------------------------------------------------------
--displaying the employess id, full name, their department name and their location by 
--joining three different tables and only displaying the ones in department id in 80,90. 
--------------------------------------------------------------------------------------------
SELECT e.employee_id, e.first_name, e.last_name,
    d.department_name, l.city
    FROM HR.employees e, HR.departments d, HR.locations l
    WHERE e.department_id=d.department_id
    AND e.department_id IN (80,90);

--------------------------------------------------------------------------------------------
--selecting the full name of the employee, their grade level, lowest and highest salary,
--and im grabbing it from HR.employees and HR.job_grades and then Im displaying the salary
--from employees that is between lowest and highest. 
--------------------------------------------------------------------------------------------
SELECT e.first_name, e.last_name, j.grade_level, j.lowest_sal, j.highest_sal
    FROM HR.employees e, HR.job_grades j
    WHERE e.salary BETWEEN j.lowest_sal AND j.highest_sal;

--------------------------------------------------------------------------------------------
--selecting the full name of the employee with their department id and their department 
--name and Im calling it by e by having HR.employee e, and same goes for department,
--then I am displaying the employee department id where it is equal to the Departments
--ID. 
--------------------------------------------------------------------------------------------
SELECT e.first_name, e.last_name, e.department_id, d.department_name
    FROM HR.employees e, HR.departments d
    WHERE e.department_id=d.department_id;

--------------------------------------------------------------------------------------------
--selecting the full name and department id of employees and getting the department name,
--then i am calling it from HR employees/departments and giving them e and d to shorten 
--typing it out to call them. then i am checking to display the employee department ID is 
--equal to department id and using add to the side that might not have rows to satisfy join
--conditions. 
--------------------------------------------------------------------------------------------
SELECT e.first_name, e.last_name, e.department_id, d.department_name
    FROM HR.employees e, HR.departments d
    WHERE e.department_id=d.department_id (+)
    ORDER BY e.first_name, e.last_name;

--------------------------------------------------------------------------------------------
--selecting the full name ofthe employees and their department name and then using left
--join to grab the contents of department name from HR and then using the 
--ON to check to see if employees department id is equal to department id and if it is
--then display and sort by first name, last name.
--------------------------------------------------------------------------------------------
SELECT e.first_name, e.last_name, e.department_id, d.department_name
    FROM HR.employees e
    LEFT JOIN HR.departments d
    ON e.department_id=d.department_id
    ORDER BY e.first_name, e.last_name;

--------------------------------------------------------------------------------------------
--selecting the full name of the employee and the last name of the manager and setting
--the column to be manager. Then I am displaying those whose manager ID is equal to 
--employee ID. 
--------------------------------------------------------------------------------------------
SELECT e.first_name, e.last_name, m.last_name Manager
    FROM HR.employees e, HR.employees m
    WHERE e.manager_id=m.employee_id;

--------------------------------------------------------------------------------------------
--selecting employee ID, full name and their department name and I am crost joining it with 
--HR.departments
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name, department_name
    FROM HR.employees
    CROSS JOIN HR.departments;

--------------------------------------------------------------------------------------------
--listing employees whose supervisors are also department managers and this is done through
--NATURAL JOIN. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name, department_name
    FROM HR.employees
    NATURAL JOIN HR.departments;

--------------------------------------------------------------------------------------------
--using Equivalent EquiJoin to them pull last name, department id, and department name from
--HR employees and departments and giving them a shoter calling method. Then display 
--those whose department id is equal to department ID and manager id is equal to department
--id. 
--------------------------------------------------------------------------------------------
SELECT e.last_name, e.department_id, d.department_name
    FROM HR.employees e, HR.departments d
    WHERE e.department_id=d.department_id
    AND e.manager_id=d.manager_id;

--------------------------------------------------------------------------------------------
--listing employees who are assigned to departments
--------------------------------------------------------------------------------------------
SELECT employee_id, first_name, last_name, department_name
    FROM HR.employees
    JOIN HR.departments
    USING (department_id);

--------------------------------------------------------------------------------------------
--selecting the employee id, full name, department name, and location of it and then 
--joining the tables of departments and locations and displaying those whose employees
--department id is equal to departments department idm and displaying those whose 
--department location id is equal to locations location id. 
--------------------------------------------------------------------------------------------
SELECT e.employee_id, e.first_name, e.last_name, d.department_name, l.city
    FROM HR.employees e
    JOIN HR.departments d
    ON e.department_id=d.department_id
    JOIN HR.locations l
    ON d.location_id=l.location_id;

--------------------------------------------------------------------------------------------
--selecting employee id and full name and department id and then using left outer join to 
--get all rows of table on the left regardless of join conditions and then im using 
--department id
--------------------------------------------------------------------------------------------
SELECT employee_id, first_name, last_name, department_name
    FROM HR.employees
    LEFT OUTER JOIN HR.departments
    USING(department_id);

--------------------------------------------------------------------------------------------
--doing the same thing as the function above but using the right outer join 
--to get all rows of table on the right and then using ON to display the employees whose
--department id is qual to departments department id.
--------------------------------------------------------------------------------------------
SELECT employee_id, first_name, last_name, department_name
    FROM HR.employees e
    RIGHT OUTER JOIN HR.departments d
    ON e.department_id=d.department_id;

--------------------------------------------------------------------------------------------
--selecting employee id and full name and departments name from department, then using 
--full outer join to retrieve every row of both tables, and displaying those employees 
--who have their department id equal to the Departments Department ID if any.
--------------------------------------------------------------------------------------------
SELECT employee_id, first_name, last_name, d.department_name
    FROM HR.employees e
    FULL OUTER JOIN HR.departments d
    ON e.department_id=d.department_id;

spool off
