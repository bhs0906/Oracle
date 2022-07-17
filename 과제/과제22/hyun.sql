SELECT job
    , sum(case deptno when 10 then sal end) as d10_sal
    , sum(case deptno when 20 then sal end) as d20_sal
    , sum(case deptno when 30 then sal end) as d30_sal  
FROM emp
group by job
order by job;

select empno, sal from emp order by sal, empno fetch first 5 rows only;

select empno, sal from emp order by sal, empno offset 5 rows;

SELECT b.empno, b.ename, b.mgr
FROM emp a, emp b
where a.ename = 'JONES'
and b.mgr = a.empno;

SELECT c.empno, c.ename, c.mgr
FROM emp a, emp b, emp c
where a.ename = 'JONES'
and b.mgr = a.empno
and c.mgr = b.empno;

SELECT b.empno, b.ename, b.mgr
FROM emp a, emp b
where a.ename = 'SMITH'
and b.empno = a.mgr;

SELECT c.empno, c.ename, c.mgr
FROM emp a, emp b, emp c
where a.ename = 'SMITH'
and b.empno = a.mgr
and c.empno = b.mgr;

SELECT level as lv, lpad(' ', (level -1) *2) || empno as empno, mgr
    , connect_by_isleaf as isleaf
FROM emp
start with mgr is null
connect by mgr = prior empno;

SELECT level as lv, lpad(' ', (level -1) *2) || empno as empno, mgr
    , connect_by_isleaf as isleaf
FROM emp
start with empno = 7876
connect by empno = prior mgr;

SELECT connect_by_root (empno) as root_empno
    , sys_connect_by_path (empno, ',') as path
    , empno, mgr
FROM emp
start with mgr is null
connect by mgr = prior empno;


