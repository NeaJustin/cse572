--------------------------------------------------------------------------------------------
--Justin Pulido
--Lab04A
--April 28th, 2019
--------------------------------------------------------------------------------------------

spool lab04AOutput_justin.txt

--------------------------------------------------------------------------------------------
--Selecting employee attributes and then changing their first name to all upper case and
--checking their first name with david and if it is then it will display it. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name, salary
    FROM HR.employees
    WHERE UPPER(first_name)='DAVID';

--------------------------------------------------------------------------------------------
--Selecting sql course and changing it to be lower case and we are grabbing it from a 
--dummy table called DUAL. 
--------------------------------------------------------------------------------------------
SELECT LOWER('SQL Course')
    FROM DUAL;

--------------------------------------------------------------------------------------------
--displaying the lenght of the string Sqlplus with is 7. 
--------------------------------------------------------------------------------------------
SELECT LENGTH('Sqlplus')
    FROM DUAL;

--------------------------------------------------------------------------------------------
--selecting l from sqlplus and then checking how many characters is it from the 
--nth character which is 2 to the m position. 
--------------------------------------------------------------------------------------------
SELECT INSTR('Sqlplus','l',3,2)
    FROM DUAL;

--------------------------------------------------------------------------------------------
--LPAD will make the string be right-justified and it will have a total of 10 character 
--spaces and the ones that have nothing will have * to replace the missing characters. 
--------------------------------------------------------------------------------------------
SELECT LPAD(24000,10,'*')
    FROM DUAL;

--------------------------------------------------------------------------------------------
--RPAD will make the string left-justified and will do the same as LPAD. 
--------------------------------------------------------------------------------------------
SELECT RPAD(24000,10,'*')
    FROM DUAL;

--------------------------------------------------------------------------------------------
--Selecting the string Hello home and replacing the lower case letter h with upper case 
--letter H. 
--------------------------------------------------------------------------------------------
SELECT REPLACE('Hello home','h','H')
    FROM DUAL;

--------------------------------------------------------------------------------------------
--Rounding the number 45.936 to 2 decimal points. 
--------------------------------------------------------------------------------------------
SELECT ROUND(45.936,2)
    FROM DUAL;

--------------------------------------------------------------------------------------------
--truncating the string to be only 2 decimal places, so it is not rounding the output
--is then 45.93 instead of round where it is 45.94. 
--------------------------------------------------------------------------------------------
SELECT TRUNC(45.936,2)
    FROM DUAL;

--------------------------------------------------------------------------------------------
--doing modular division on 5, 3 and the answer should be 2 to grab the remainder of the 
--division. 
--------------------------------------------------------------------------------------------
SELECT MOD(5,3)
    FROM DUAL;

--------------------------------------------------------------------------------------------
--selecting employee attributes and seeing how many days they have been hired where their
--job id matches it_prog and if it does then display them and how many days they have been
--here for. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name, (sysdate-hire_date) AS days_hired
    FROM HR.employees
    WHERE job_id='IT_PROG';

--------------------------------------------------------------------------------------------
--selecting employee attributes and getting how many months they have been working since
--today and their hire date. and display if their job id matches IT_PROG. 
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name,
    ROUND(MONTHS_BETWEEN(sysdate,hire_date),0) AS months_hired
    FROM HR.employees
    WHERE job_id='IT_PROG';

--------------------------------------------------------------------------------------------
--adding 6 months to the month of january and it should be july. 
--------------------------------------------------------------------------------------------
SELECT ADD_MONTHS('11-JAN-96',6)
    FROM DUAL;

--------------------------------------------------------------------------------------------
--selecting the date of september 1st, 95 and them I am selecting the next date which would
--be friday in this case. 
--------------------------------------------------------------------------------------------
SELECT NEXT_DAY('01-SEP-95','FRIDAY')
    FROM DUAL;

--------------------------------------------------------------------------------------------
--selecting the last day from the month of february. 
--------------------------------------------------------------------------------------------
SELECT LAST_DAY('01-FEB-95')
    FROM DUAL;

--------------------------------------------------------------------------------------------
--getting to the first day on the next month. 
--------------------------------------------------------------------------------------------
SELECT ROUND(sysdate,'MONTH')
    FROM DUAL;

--------------------------------------------------------------------------------------------
--getting the first date of the current year.
--------------------------------------------------------------------------------------------
SELECT TRUNC(SYSDATE,'YEAR')
    FROM DUAL;

--------------------------------------------------------------------------------------------
--displaying the current date as of today. 
--------------------------------------------------------------------------------------------
SELECT TO_CHAR(sysdate, 'Day dd mon, yyyy')
    FROM DUAL;

--------------------------------------------------------------------------------------------
--selecting attributes of first name and last name and getting their salries and selecting
--from hr.employees and then im checking to see if their first name matches with DAVID
--and if it does then display it. 
--------------------------------------------------------------------------------------------
SELECT first_name, last_name, TO_CHAR(salary, 'L9,999,999.00')
    FROM HR.employees
    WHERE UPPER(first_name)='DAVID';

--------------------------------------------------------------------------------------------
--listing employees in the job id of IT_PROG and seeing how long they have been hired.
--------------------------------------------------------------------------------------------
SELECT employee_ID, first_name, last_name, 
    ROUND(MONTHS_BETWEEN(sysdate,hire_date),0) AS months_hired
    FROM HR.employees
    WHERE job_id='IT_PROG';

--------------------------------------------------------------------------------------------
--selecting employee attributes and getting their salary and commission percentage. 
--i am them listing their bonus based on their commission percentage. 
--------------------------------------------------------------------------------------------
SELECT first_name, last_name, salary, commission_pct,
    NVL2(commission_pct, salary*commission_pct, salary*0.1) bonus
    FROM HR.employees;

--------------------------------------------------------------------------------------------
--selecting employee attributes and getting their salary and commission percentage. 
--i am then multiplying their salary by commission percentage and then multiplying their 
--salary by .1 and listing their bonus.  
--------------------------------------------------------------------------------------------
SELECT first_name, last_name, salary, commission_pct,
    COALESCE(salary*commission_pct,salary*0.1) bonus
    FROM HR.employees;

--------------------------------------------------------------------------------------------
--selecting full name and salary and doing a case to see which job id get a certain salary
--bonus and if it is not either it prog or st clerk then they only get a salary bonus of
--0.1
--------------------------------------------------------------------------------------------
SELECT first_name, last_name, salary,
    CASE job_id
        WHEN 'IT_PROG' THEN salary*0.25
        WHEN 'ST_CLERK' THEN salary*0.3
        ELSE salary*0.1
    END Bonus
    FROM HR.employees;

--------------------------------------------------------------------------------------------
--getting their full name and salary and then I am computing their bonuses based on their
--job title. If it does nt match it prog or st clerk then they only get 0.1 bonus. 
--pulling data from HR.employees
--------------------------------------------------------------------------------------------
SELECT first_name, last_name, salary,
    DECODE(job_id,
        'IT_PROG', salary*0.25,
        'ST_CLERK', salary*0.3,
        salary*0.1) Bonus
    FROM HR.employees;

spool off
