

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

SELECT A.employee_id, A.department_id, B.department_name, salary,
       RANK() OVER(PARTITION BY A.department_id ORDER BY salary DESC) RANK_급여,
       DENSE_RANK() OVER(PARTITION BY A.department_id ORDER BY salary DESC) DENSE_RANK_급여,
       ROW_NUMBER() OVER(PARTITION BY A.department_id ORDER BY salary DESC) ROW_NUMBER_급여

FROM employees A, departments B
WHERE A.department_id = B.department_id
ORDER BY B.department_id, A.salary DESC;

SELECT COUNT(salary) salary행수 FROM employees;

SELECT SUM(salary) 합계, AVG(salary) 평균, SUM(salary)/COUNT(salary) 계산된평균 FROM employees;

SELECT MAX(salary) 최댓값, MIN(salary) 최솟값, MAX(first_name) 최대문자값, MIN(first_name) 최소문자값
FROM employees;

SELECT job_id 직무, SUM(salary) 직무별_총급여, AVG(salary) 직무별_평균급여
FROM employees
WHERE employee_id >= 10
GROUP BY job_id
ORDER BY 직무별_총급여 DESC, 직무별_평균급여;

SELECT job_id job_id_대그룹,
       manager_id manager_id_중그룹,
       SUM(salary) 그룹핑_총급여,
       AVG(salary) 그룹핑_평균급여
FROM   employees
WHERE  employee_id >= 10
GROUP BY job_id, manager_id
ORDER BY 그룹핑_총급여 DESC, 그룹핑_평균급여;

SELECT job_id 직무, SUM(salary) 직무별_총급여, AVG(salary) 직무별_평균급여
FROM employees
WHERE employee_id >= 10
GROUP BY job_id
HAVING SUM(salary) > 30000
ORDER BY 직무별_총급여 DESC, 직무별_평균급여;

SELECT a.first_name, a.last_name, B.*
FROM employees A, job_history B
WHERE A.employee_id = b.employee_id
AND a.employee_id =101;

SELECT *
FROM employees A, departments B
WHERE a.department_id = b.department_id;

SELECT a.employee_id, a.department_id, b.department_name, c.location_id, c.city 
FROM employees A, departments B, locations C
WHERE a.department_id = b.department_id
AND b.location_id = c.location_id;

SELECT COUNT(*) 조인된건수
FROM employees A, departments B
WHERE A.department_id = B.department_id;

SELECT *
FROM employees;
SELECT A.employee_id, A.first_name, A.last_name, B.department_id, B.department_name
FROM employees A, departments B
WHERE A.department_id = B.department_id(+)
ORDER BY A.employee_id;

SELECT *
FROM employees;
SELECT A.employee_id, A.first_name, A.last_name, B.department_id, B.department_name
FROM employees A, departments B
WHERE A.department_id(+) = B.department_id
ORDER BY A.employee_id;

SELECT A.employee_id, A.first_name, A.last_name, A.manager_id,
       B.first_name||' '||B.last_name manager_name
FROM employees A, employees B
WHERE A.manager_id = B.employee_id
ORDER BY A.employee_id;

SELECT department_id
FROM employees
UNION
SELECT department_id
FROM   departments;

SELECT department_id
FROM employees
UNION  ALL
SELECT department_id
FROM   departments
ORDER BY department_id;

SELECT department_id
FROM employees
INTERSECT
SELECT department_id
FROM departments
ORDER BY department_id;

SELECT *
FROM employees A
WHERE a.salary = (SELECT salary
                FROM employees
                WHERE last_name = 'De Haan');


-- 위의 코드와 동일한 결과가 출력됨                
SELECT *
FROM employees A
WHERE A.salary = 17000;       

SELECT *
FROM employees A
WHERE A.salary IN (SELECT MIN(salary) 최저급여
                   FROM employees
                   GROUP BY department_id)
ORDER BY a.salary DESC;  


SELECT *
FROM employees A
WHERE (A.job_id, A.salary) IN (SELECT job_id, MIN(salary) 그룹별급여
                               FROM employees
                               GROUP BY job_id)
ORDER BY A.salary DESC;


SELECT *
FROM employees A,(SELECT department_id
                     FROM departments
                     WHERE department_name = 'IT') B   -- B는 가상 테이블(가상뷰 = 인라인뷰)
WHERE A.department_id = B.department_id;


INSERT INTO departments ( department_id, department_name, manager_id, location_id)
VALUES (271, 'Sample_Dept', 200, 1700);

INSERT INTO departments
VALUES
(272, 'Sample_Dept', 200, 1700);

SELECT * FROM departments
ORDER BY department_id desc;

commit;

UPDATE departments
SET    manager_id = 201,
       location_id = 1800
WHERE  department_name = 'Sample_Dept';


UPDATE departments
SET    (manager_id, location_id) = ( SELECT manager_id, location_id
                                     FROM departments
                                     WHERE department_id = 40)
WHERE  department_name = 'Sample_Dept';

SELECT * FROM departments
WHERE department_name = 'Sample_Dept';

UPDATE departments
SET    department_id = null
WHERE  department_name = 'Sample_Dept';

--일반적인 방법
DELETE FROM departments
WHERE department_name = 'Sample_Dept';

-- 서브쿼리를 사용한 방법
DELETE FROM departments
WHERE department_id IN (SELECT department_id
                         FROM departments
                         WHERE department_name = 'Sample_Dept');
                         
commit;

-- 기본키 제약 조건 - 데이터 중복 불허
INSERT INTO departments
VALUES (100, 'Sample_Dept', 200, 1700);

-- ?외래키 제약 조건 - 열 값이 부모 테이블의 참조 열의 값을 반드시 참조
INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (273, 'Sample_Dept', 200, 1111);

-- 유일키 - 중복은 허용하지 않지만 null값은 허용가능
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary)
VALUES (207, 'fist_name' , 'last_name', 'SKING', '111.111.1111', to_date('030617','YYMMDD'),'IT_PROG', 6000);

SELECT *
FROM employees
WHERE email = 'SKING';

-- NOT NULL - NULL값을 허용하지 않는다.
INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (273, null , 200, 1700);

-- ?CHECK - 범위나 조건등 지정된 값만 허용
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary)
VALUES (209, 'fist_name' , 'last_name', 'TEST', '111.111.1111', to_date('030617','YYMMDD'),'IT_PROG', 0);


-- 테이블 생성
CREATE TABLE sample_product
       ( product_id number,
         product_name varchar2(30),
         manu_date date);

INSERT INTO sample_product VALUES ( 1, 'television', to_date('140101', 'YYMMDD'));
INSERT INTO sample_product VALUES ( 2, 'washer', to_date('150101', 'YYMMDD'));
INSERT INTO sample_product VALUES ( 3, 'cleaner', to_date('160101', 'YYMMDD'));
commit;
 
SELECT * FROM sample_product;        
 
ALTER TABLE sample_product ADD (factory varchar(10));

ALTER TABLE sample_product MODIFY ( factory char(8));

DELETE FROM sample_product
WHERE product_name = 'cleaner';

ALTER TABLE sample_product RENAME COLUMN factory to factory_name;

-- 열 삭제
ALTER TABLE sample_product DROP COLUMN factory_name;

-- 내용만 삭제
TRUNCATE TABLE sample_product;

-- 테이블 삭제
DROP TABLE sample_product;