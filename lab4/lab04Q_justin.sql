--------------------------------------------------------------------------------------------
--Justin Pulido
--Lab4 Query
--April 28, 2019
--------------------------------------------------------------------------------------------

spool lab04QOutput_justin.txt

--------------------------------------------------------------------------------------------
--getting the current dates and naming the column as Dates since date is a key word and 
--cannot name the column date by itself. 
--------------------------------------------------------------------------------------------
SELECT sysdate AS Dates
    FROM HR.employees;

--------------------------------------------------------------------------------------------
--grabbing the employee ID, their full name and their commission percentage and then im
--ordering it by their commission percentage. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, last_name, first_name, commission_pct
    FROM HR.employees
    ORDER BY commission_pct;

--------------------------------------------------------------------------------------------
--grabbing all employee information from HR.employees, and then Im using the TO_CHAR 
--function to be able to dispalay it as a New_Salary and only display those that their
--salaries are over 10000. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, last_name, first_name, salary, 
    TO_CHAR(ROUND(salary+(salary*.15)),'L9,999,999.00') 
    AS New_Salary
    FROM HR.employees
    WHERE salary>='10000'
    ORDER BY employee_ID;

--------------------------------------------------------------------------------------------
--setting the first letter of the last name to be capital and them im getting the length
--of it and only displaying the ones that have it starting off with letters of J, A, M
--then order by last name
--------------------------------------------------------------------------------------------
SELECT INITCAP(last_name), LENGTH(last_name)
    FROM HR.employees
    WHERE last_name like 'J%' or last_name like 'A%' or last_name like 'M%'
    ORDER BY last_name;

--------------------------------------------------------------------------------------------
--getting the employees last name, then getting the time they worked and and round it 
--then i am displaying only those with the end substring of MGR and MAN and ordering 
--it by months worked. 
--------------------------------------------------------------------------------------------
SELECT last_name, ROUND((sysdate-hire_date)/365) AS Months_Worked
    FROM HR.employees
    WHERE job_id like '%MGR' or job_id like '%MAN'
    ORDER BY Months_Worked;

--------------------------------------------------------------------------------------------
--selecting employees last name and their salary by making it 15 characters long and having
--it alligned left and filling in the rest with the dollar symbol and ordering it by 
--the salary column. 
--------------------------------------------------------------------------------------------
SELECT last_name, LPAD(salary, 15, '$') AS salary
    FROM HR.employees
    WHERE salary>='3000'
    ORDER BY salary;

--------------------------------------------------------------------------------------------
--using the nvl2 function to check if commission pct is null and if its not then 
--multiply the salary by the commission pct and add it tot their salary and format it in 
--currency. If it is null then put No Bonus. Then order by last name then first name. 
--------------------------------------------------------------------------------------------
SELECT last_name, first_name, salary, commission_pct,
    NVL2(commission_pct, TO_CHAR(salary+(salary*commission_pct), 'L9,999,999.00'),'No Bonus')
    AS Bonus
    FROM HR.employees
    WHERE department_id like '80%' or department_id like '90%'
    ORDER BY last_name, first_name;

--------------------------------------------------------------------------------------------
--Using decode to get the job id and then im assigning it a grade value of A, B, C, D, E, 
--and NA if it doesnt match any of the job ids, them I am displaying only those that have 
--a salary greater or equal to 10000 and then im ordering by grades. 
--------------------------------------------------------------------------------------------
SELECT last_name, first_name,  
    DECODE(job_id, 
        'AD_PRES', 'A',
        'ST_MAN', 'B',
        'IT_PROG', 'C',
        'SA_REP', 'D',
        'ST_CLERK', 'E',
        'NA') Grades
    FROM HR.employees
    WHERE salary>='10000'
    ORDER BY Grades;

--------------------------------------------------------------------------------------------
--Doing the same thing as the funciton above, Except it is using CASE instead of DECODE. 
--------------------------------------------------------------------------------------------
SELECT last_name, first_name,  
    CASE job_id 
        WHEN 'AD_PRES' THEN 'A'
        WHEN 'ST_MAN' THEN 'B'
        WHEN 'IT_PROG' THEN 'C'
        WHEN 'SA_REP' THEN 'D'
        WHEN 'ST_CLERK' THEN 'E'
        ELSE 'NA'
    END Grades
    FROM HR.employees
    WHERE salary>='10000'
    ORDER BY Grades;

spool off
