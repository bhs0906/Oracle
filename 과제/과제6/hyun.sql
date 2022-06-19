SELECT mgr
    FROM emp
    where ename = 'SCOTT';
    
 SELECT mgr
    FROM emp
    where ename = 'KING';
    
SELECT NVL(MGR,9999) AS MGR
    FROM emp
    where ename = 'KING'; 
    
SELECT mgr
    FROM emp
    where ename = 'jsc';
    
    SELECT NVL(MGR,9999) AS MGR
    FROM emp
    where ename = 'JSC'; 