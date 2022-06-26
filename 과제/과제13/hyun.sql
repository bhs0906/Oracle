select a.player_name 선수명, a.back_no 백넘버
      ,b.region_name 연고지, b.team_name 팀명
from player a, team b
where a.position = 'GK'
    and b.team_id=a.team_id
order by a.back_no;

select player.player_name 선수명, a.back_no 백넘버 
     , b.region_name 연고지, b.team_name 팀명
from player a, team b
where a.position='GK'
    and b.team_id=a.team_id
order by a.back_no;

select team.region_name, team.team_name, team.stadium_id
     , stadium.stadium_name, stadium.seat_count
from team, stadium
where stadium.stadium_id = team.stadium_id;

select a.region_name, a.team_name, a.stadium_id
     , b.stadium_name, b.seat_count
from team a, stadium b
where b.stadium_id = a.stadium_id;

SELECT a.ename, a.job, a.sal, b.grade
    FROM emp a, salgrade b
    WHERE a.sal BETWEEN b.losal and b.hisal;
 
SELECT a.ename as 사원명, a.sal as 급여, b.grade as 급여등급
FROM emp a, salgrade b
where a.sal between b.losal and b.hisal;

SELECT a.player_name as 선수명, a.position as 포지션
    ,b.region_name as 연고지, b.team_name as 팀명
    ,c.stadium_name as 구장명
FROM player a, team b, stadium c
where b.team_id=a.team_id
and c.stadium_id=b.stadium_id
order by 선수명;

SELECT  a.stadium_name, a.stadium_id, a.seat_count, a.hometeam_id
    ,b.team_name
FROM stadium a, team b
where b.team_id(+) = a.hometeam_id
order by a.hometeam_id;

SELECT a.ename, a.deptno, b.dname, b.loc
FROM emp a, dept b
where b.deptno=a.deptno(+);

SELECT a.empno, a.ename, b.deptno, b.dname
FROM emp a join dept b
on b.deptno=a.deptno;

SELECT a.empno, a.ename,deptno,b.dname
FROM emp a natural join dept b;




