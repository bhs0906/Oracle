SELECT dname, 'all jobs' as job
    , count (*) as emp_cnt, sum (sal) as sal_sum
FROM emp a, dept b
where b.deptno = a.deptno
group by dname
union all
select 'all departments' as dname, job
    , count (*) as emp_cnt, sum (sal) as sal_sum
from emp a, dept b
where b.deptno = a.deptno
group by job;

select case grouping(b.dname) when 1 then 'all departments' else b.dname end as dname
    ,  case grouping(a.job) when 1 then 'all jobs' else a.job end as job
    , count (*) as emp_cnt, sum (sal) as sal_sum
from emp a, dept b
where b.deptno = a.deptno
group by grouping sets (b.dname, a.job)
order by b.dname, a.job;

select case grouping(b.dname) when 1 then 'all departments' else b.dname end as dname
    ,  case grouping(a.job) when 1 then 'all jobs' else a.job end as job
    , count (*) as emp_cnt, sum (sal) as sal_sum
from emp a, dept b
where b.deptno = a.deptno
group by grouping sets (a.job, b.dname)
order by b.dname, a.job;

SELECT b.dname, a.job, a.mgr
    , count (*) as emp_cnt, sum (a.sal) as sal_sum
FROM emp a, dept b
where b.deptno = a.deptno
group by grouping sets ((b.dname, a.job, a.mgr), (b.dname, a.job), (a.job, a.mgr));

SELECT job, ename, sal
    , rank () over (order by sal desc) as all_rk
    , rank () over (partition by job order by sal desc) as job_rk
FROM emp;

SELECT job, ename, sal
    , rank () over (partition by job order by sal desc) as job_rk
FROM emp;

SELECT job, ename, sal
    , rank () over (order by sal desc) as rk
    , dense_rank () over (order by sal desc) as dr
FROM emp;

SELECT job, ename, sal
    , rank () over (order by sal desc) as rk
    , row_number () over (order by sal desc) as rn
FROM emp;

SELECT job, ename, sal
    , sum (sal) over (partition by mgr) as sal_sum
FROM emp;

SELECT mgr, ename, sal
    , sum (sal) over (partition by mgr order by sal range unbounded preceding) as sal_sum
FROM emp;