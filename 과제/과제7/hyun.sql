SELECT MAX (mgr) AS MQR
    FROM emp
    where ename = 'JSC'; 
    
 SELECT NVL (MAX(mgr), 9999) AS MQR
    FROM emp
    where ename = 'JSC';
    
SELECT ename, empno, mgr, NULLIF(MGR, 7698)
AS NUIF
FROM emp;

SELECT ename, empno, mgr,
case
WHEN mgr = 7698 THEN NULL
ELSE mgr
END AS NUIF
FROM emp;

SELECT ename, comm, sal, COALESCE(COMM,SAL) COAL FROM emp;

SELECT ename, comm, sal,
case
    when comm is not null then comm
    else(case
            when sal is not null then sal else null end)
            end coal
FROM emp;