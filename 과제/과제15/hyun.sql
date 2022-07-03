SELECT 
    *
FROM dept a join dept_temp b
using (deptno, dname);

SELECT a.empno, a.ename, b.deptno, b.dname
FROM emp a join dept b
on (b.deptno = a.deptno);

SELECT a.ename, b.deptno, b.deptno, b.dname
FROM emp a join dept b
on b.deptno = a.deptno
where b.deptno = 30;

SELECT a.ename, a.mgr, a.deptno, b.dname
FROM emp a join dept b
on b.deptno = a.deptno
and a.mgr = 7968;

SELECT a.ename, a.mgr, a.deptno, b.dname
FROM emp a join dept b
on b.deptno = a.deptno
and a.mgr = 7698;

SELECT a.ename, a.mgr, a.deptno, b.dname
FROM emp a join dept b
on b.deptno = a.deptno
where a.mgr = 7698;

SELECT a.team_name, a.stadium_id, b.stadium_name
FROM team a join stadium b
on b.stadium_id = a.stadium_id
order by a.stadium_id;

SELECT a.team_name, a.team_id, b.stadium_name
FROM team a join stadium b
on b.hometeam_id = a.team_id
order by a.team_id;

SELECT a.empno, a.deptno, b.dname, c.dname as new_dname
FROM emp a, dept b, dept_temp c
where b.deptno = a.deptno
and c.deptno = b.deptno;

SELECT a.empno, a.deptno, b.dname, c.dname as new_dname
FROM emp a, dept b, dept_temp c
where b.deptno = a.deptno
and c.deptno = b.deptno;

SELECT a.player_name as 선수명, a.position as 포지션
    ,b.region_name as 연고지명, b.team_name as 팀명
    ,c.stadium_name as 구장명
FROM player a join team b
on b.team_id = a.team_id
join stadium c
on c.stadium_id = b.stadium_id
where a.position = 'GK'
order by 선수명;

SELECT b.stadium_name, b.stadium_id, a.sche_date
    ,c.team_name, d.team_name
    ,a.home_score, a.away_score
FROM schedule a join stadium b
on b.stadium_id = a.stadium_id
join team c
on c.team_id = a.hometeam_id
join team d
on d.team_id = a.awayteam_id
where a.home_score >= a.away_score +3;

SELECT b.stadium_name, b.stadium_id, a.sche_date
    ,c.team_name, c.team_name
    ,a.home_score, a.away_score
FROM schedule a, stadium b, team c, team d
where a.home_score >= a.away_score +3
and b.stadium_id = a.stadium_id
and c.team_id = a.hometeam_id
and d.team_id = a.awayteam_id;

SELECT a.ename, b.dname
FROM emp a cross join dept b
order by a.ename;