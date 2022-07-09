SELECT team_id as 팀코드, player_name as 선수명, position as 포지션
    , back_no as 백넘버, height as 키
    FROM player
    where team_id = 'K02'
minus
SELECT team_id as 팀코드, player_name as 선수명, position as 포지션
    , back_no as 백넘버, height as 키
    from player
    where position = 'GK'
order by 1,2,3,4,5;

SELECT b.dname, a.job, count (*) as emp_cnt, sum(a.sal) as sal_sum
    FROM emp a, dept b
    where b.deptno = a.deptno
group by b.dname, a.job;

SELECT b.dname, a.job, count (*) as emp_cnt, sum(a.sal) as sal_sum
    FROM emp a, dept b
    where b.deptno = a.deptno
group by b.dname, a.job
order by b.dname, a.job;

SELECT b.dname, a.job, count (*) as emp_cnt, sum(a.sal) as sal_sum
    FROM emp a, dept b
    where b.deptno = a.deptno
group by rollup (b.dname, a.job);

SELECT b.dname, a.job, count (*) as emp_cnt, sum(a.sal) as sal_sum
    FROM emp a, dept b
    where b.deptno = a.deptno
group by rollup (b.dname, a.job)
order by b.dname, a.job;

SELECT b.dname, grouping (b.dname) as dname_grp
        , a.job, grouping (a.job) as job_grp
        , count (*) as emp_cnt, sum(a.sal) as sal_sum
    FROM emp a, dept b
    where b.deptno = a.deptno
group by rollup (b.dname, a.job)
order by b.dname, a.job;

SELECT decode (grouping (b.dname), 1, 'all departments', b.dname) as dname
    ,  decode (grouping (a.job), 1, 'all job', a.job) as job
    ,  count (*) as emp_cnt, sum(a.sal) as sal_sum
FROM emp a, dept b
where b.deptno = a.deptno
group by rollup (b.dname, a.job)
order by b.dname, a.job;

SELECT case grouping (b.dname) when 1 then 'all departments' else b.dname end as dname
    ,  case grouping (a.job) when 1 then 'all job' else a.job end as job
    ,  count (*) as emp_cnt, sum(a.sal) as sal_sum
FROM emp a, dept b
where b.deptno = a.deptno
group by b.dname, rollup(a.job)
order by b.dname, a.job;

SELECT b.dname, a.job, a.mgr
    , count (*) as emp_cnt, sum(a.sal) as sal_sum
FROM emp a, dept b
where b.deptno = a.deptno
group by rollup (b.dname, (a.job, a.mgr))
order by b.dname, a.job, a.mgr;

SELECT case grouping (b.dname) when 1 then 'all departments' else b.dname end as dname
    ,  case grouping (a.job) when 1 then 'all job' else a.job end as job
    ,  count (*) as emp_cnt, sum(a.sal) as sal_sum
FROM emp a, dept b
where b.deptno = a.deptno
group by cube (b.dname, a.job)
order by b.dname, a.job;