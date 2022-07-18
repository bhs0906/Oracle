SELECT
    *
FROM (select job, deptno, sal from emp)
pivot(sum (sal) for deptno in (10,20,30))
order by 1;

SELECT
    *
FROM(select to_char (hiredate, 'yyyy') as yyyy, job, deptno, sal from emp)
pivot(sum (sal) for deptno in (10,20,30))
order by 1,2;

SELECT
    *
FROM (select job, deptno, sal from emp)
pivot(sum (sal) as sal for deptno in (10 as d10, 20 as d20, 30 as d30))
order by 1;

SELECT job, d20_Sal
FROM (select job, deptno, sal from emp)
pivot(sum (sal) as sal  for deptno in (10 as d10, 20 as d20, 30 as d30))
where d20_sal > 2500
order by 1;

SELECT *
FROM (select job, deptno, sal from emp)
pivot(sum (sal) as sal, count (*) as cnt for deptno in (10 as d10, 20 as d20))
order by 1;

SELECT
    *
FROM(select to_char (hiredate, 'yyyy') as yyyy, job, deptno, sal from emp)
pivot(sum (sal) as sal, count (*) as cnt
      for (deptno, job) in ((10, 'analyst') as d10a, (10, 'clerk') as d10c
                           ,(20, 'analyst') as d20a, (20, 'clerk') as d20c))
order by 1;

SELECT job
    , sum(case deptno when 10 then sal end) as d10_sal
    , sum(case deptno when 20 then sal end) as d20_sal
    , sum(case deptno when 30 then sal end) as d30_sal
FROM emp
group by job
order by job;

drop table t1 purge;

create table t1 as
select job, d10_sal, d20_sal, d10_cnt, d20_cnt
from(select job, deptno, sal from emp where job in('ANALYST', 'CLERK'))
pivot (sum (sal) as sal, count(*) as cnt for deptno in (10 as d10, 20 as d20));

SELECT
    *
FROM t1 order by job;

SELECT job, deptno, sal
FROM t1
unpivot (sal for deptno in (d10_sal, d20_sal))
order by 1,2;

SELECT job, deptno, sal
FROM t1
unpivot (sal for deptno in (d10_sal as 10, d20_sal as 20))
order by 1,2;

