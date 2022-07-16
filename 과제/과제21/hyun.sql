SELECT ename, hiredate
    , lead (hiredate, 1) over (order by hiredate) as lead_hiredate
FROM emp
where job = 'SALESMAN';

SELECT ename, sal
    , round (ratio_to_report (sal) over(),2) as sal_rr
FROM emp
where job = 'SALESMAN';

SELECT deptno, ename, sal
    , percent_rank () over (partition by deptno order by sal desc) as pr
FROM emp;

SELECT deptno, ename, sal
    , cume_dist () over (partition by deptno order by sal desc) as cd
FROM emp;

SELECT ename, sal
    , ntile (4) over (order by sal desc) as nt
FROM emp;

SELECT ename, sal
FROM emp
where rownum < 4
order by sal desc;

SELECT ename, sal
FROM (select ename, sal
        from emp
      order by sal desc)
where rownum <= 3;

SELECT top(2) ename, sal
FROM emp
order by sal desc;

SELECT top(2) with ties
        ename, sal
FROM emp
order by sal desc;



