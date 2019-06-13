--------------------------------------------------------------------------------------------
--Justin Pulido
--May 30, 2019
--lab08_Query.sql
--------------------------------------------------------------------------------------------

SET PAUSE OFF
spool lab08_Output.txt

--------------------------------------------------------------------------------------------
--displaying the workers ID, last name and then checking the department ID
--and then im linking the department and checking the location ID and displaying
--those employees only. Then order by employeeID. 
--------------------------------------------------------------------------------------------
SELECT e.employee_ID, e.last_name 
    FROM HR.employees e
    WHERE e.department_ID IN
        (SELECT department_ID
        FROM HR.departments
        WHERE location_ID = '&location_ID')
    ORDER BY e.employee_ID;

--------------------------------------------------------------------------------------------
--selecting employee id, last name and job id and then getting the department ID and 
--displaying those who report to King. Then I am ordering by employee ID.
--------------------------------------------------------------------------------------------
SELECT employee_ID, last_name, job_ID
    FROM HR.employees
    WHERE department_ID IN
        (SELECT department_ID
        FROM HR.employees
        WHERE last_name = '&last_name')
    ORDER BY employee_ID;

--------------------------------------------------------------------------------------------
--selecting employee_ID, last_name, job_ID, department id, and then checking to see if it
--is in department ID of hr.departments and checking the department name if it is equal
--to executives. if it is then display those. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, last_name, job_ID, department_ID
    FROM HR.employees
    WHERE department_ID IN
        (SELECT department_ID
        FROM HR.departments
        WHERE department_name = '&department_name');

spool off

