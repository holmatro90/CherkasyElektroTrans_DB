/*get a list of all employees, ordered by last name;*/

SELECT employe_last_name
FROM employe
GROUP BY employe_last_name;


/*get average salary by employee;*/

SELECT e.employe_name,
       e.employe_last_name,
       AVG(s.salary_value) AS average_salary
FROM employe AS e,
     salary AS s
WHERE e.employe_id = s.employe_id
GROUP BY e.employe_name, e.employe_last_name;


/*get average and highest salary by position;*/

SELECT p.position_name,
       AVG(s.salary_value) AS position_average_salary
FROM position AS p
         INNER JOIN employe AS e
                    ON p.position_id = e.position_id
         INNER JOIN salary AS s
                    ON s.employe_id = e.employe_id
GROUP BY p.position_name
ORDER BY position_average_salary DESC;


/*get total number of days every person worked and total income;*/

SELECT e.employe_last_name,
       COUNT(et.employe_id) AS total_days,
       SUM(et.income)       AS total_income
FROM employe_transport AS et
         INNER JOIN employe AS e
                    ON e.employe_id = et.employe_id
GROUP BY e.employe_last_name
ORDER BY total_days DESC;

/*get overall (total) income by transport, average income and a number of working days in the descending order;*/

ALTER TABLE transport ADD UNIQUE INDEX `TRANSPORT_NUMBER` (transport_number);

SELECT t.transport_number,
       SUM(et.income)         AS transport_income,
       AVG(et.income)         AS average_transport_income,
       COUNT(et.transport_id) AS transport_working_days
FROM employe_transport AS et
         INNER JOIN transport AS t ON t.transport_id = et.transport_id
GROUP BY t.transport_number
ORDER BY transport_working_days DESC;


/*get people who have birthday in May;*/

SELECT e.employe_name, e.employe_last_name, e.dob
FROM employe AS e
WHERE dob LIKE '%-05-%';


/*get a number of years every person works in `CherkasyElektroTrans`*/

SELECT e.employe_last_name,
       SUM((DATEDIFF(CURRENT_DATE, e.position_start_date)) / 365.25) AS Years
FROM employe AS e
GROUP BY e.employe_last_name;

