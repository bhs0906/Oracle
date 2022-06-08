SELECT * FROM employees;

SELECT employee_id, email FROM employees;

SELECT employee_id,first_name, last_name FROM employees ORDER BY employee_id DESC;

SELECT DISTINCT job_id FROM employees;

SELECT employee_id AS 사원번호, first_name AS 이름, last_name AS 성 FROM employees;

SELECT employee_id, first_name || last_name  FROM employees;

SELECT employee_id, first_name||' '||last_name, email||'@company.com'  FROM employees;

SELECT employee_id, salary, salary+500, salary-100, (salary*1.1)/2 FROM employees;

SELECT employee_id AS 사원번호, salary AS 급여, salary+500 AS 추가급여, salary-100 AS 인하급여, 
       (salary*1.1)/2 AS 조정급여 FROM employees;
       
SELECT * FROM employees WHERE employee_id = 100;

SELECT * FROM employees WHERE first_name = 'David';

SELECT * FROM employees WHERE employee_id >= 105;

SELECT * FROM employees WHERE salary BETWEEN 10000 and 20000;

SELECT * FROM employees WHERE salary IN(10000, 17000, 24000);

SELECT * FROM employees WHERE job_id LIke 'AD%';

SELECT * FROM employees WHERE job_id LIke 'AD___';

SELECT * FROM employees WHERE manager_id IS null;

SELECT * FROM employees WHERE salary > 4000 AND job_id = 'IT_PROG' OR job_id = 'FI_ACCOUNT';

SELECT * FROM employees WHERE employee_id <> 105;

SELECT * FROM employees WHERE manager_id IS NOT null;

SELECT last_name, LOWER(last_name) LOWER적용, UPPER(last_name) UPPER적용, email, 
INITCAP(email) INITCAP적용 FROM employees;

SELECT job_id, SUBSTR(job_id ,1,2) 적용결과 FROM employees;

SELECT job_id, REPLACE(job_id,'ACCOUNT','ACCNT') 적용결과 FROM employees;

SELECT first_name, LPAD(first_name, 12, '*') 적용결과 FROM employees;

SELECT 'star' || TRIM (' - space - ') || 'end' 제거된_공백 FROM dual;

SELECT salary,

       salary/30 일급,

       TRUNC(salary/30, 0) 적용결과0,

       TRUNC(salary/30, 1) 적용결과1,

       TRUNC(salary/30, -1) 적용결과2

FROM   employees;

SELECT * FROM employees ORDER BY commission_pct;

SELECT salary * commission_pct FROM employees ORDER BY commission_pct;

SELECT salary * NVL(commission_pct, 1)FROM employees ORDER BY commission_pct;

SELECT first_name, last_name, department_id,
       salary 원래급여,
       DECODE(department_id, 60, salary*1.1, salary) 조정된급여,
       DECODE(department_id, 60, '10%인상', '미인상') 인상여부
FROM   employees;

SELECT employee_id, first_name, last_name, salary,
       CASE
            WHEN salary >= 9000 THEN '상위급여'
            WHEN salary BETWEEN 6000 AND 8999 THEN '중위급여'
            ELSE '하위급여'
       END AS 급여등급
FROM  employees
WHERE job_id = 'IT_PROG';


SELECT employee_id,
       salary,
       RANK() OVER(ORDER BY salary DESC) RANK_급여,
       DENSE_RANK() OVER(ORDER BY salary DESC) DENSE_RANK_급여,
       ROW_NUMBER() OVER(ORDER BY salary DESC) ROW_NUMBER_급여
FROM employees;