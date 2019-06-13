SET LINESIZE 80
SET PAGESIZE 60

spool report_005178247.txt

SET FEEDBACK OFF
TTITLE CENTER 'New Report For Lab08_Query' SKIP 1 CENTER 'As of ' _DATE
BTITLE CENTER 'PAGE:'SQL.PNO
BREAK ON job_ID
COLUMN job_ID HEADING 'Job|Category'
COLUMN Employees HEADING 'employees'
COLUMN avg_salary HEADING 'Average Salary' FORMAT $99,999.99
COLUMN min_salary HEADING 'Minimum Salary' FORMAT $99,999.99
COLUMN max_salary HEADING 'Maximum Salary' FORMAT $99,999.99
COLUMN total_salary HEADING 'Total Salary' FORMAT $9,999,999.99

SELECT job_ID, COUNT(*) AS "Employees", AVG(salary) AS avg_salary, 
    MIN(salary) AS min_salary, MAX(salary) AS max_salary, SUM(salary) AS total_salary
    FROM HR.employees
    GROUP BY job_ID
    ORDER BY job_ID;

SET FEEDBACK ON
CLEAR BREAK
COLUMN job_ID CLEAR
COLUMN Employees CLEAR
COLUMN avg_salary CLEAR
COLUMN min_salary CLEAR
COLUMN max_salary CLEAR
COLUMN total_salary CLEAR

spool off
SET PAUSE ON

