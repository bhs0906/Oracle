SELECT dname, loc, deptno
    FROM dept
ORDER BY dname, loc, deptno desc;

SELECT dname as dept, loc as area, deptno
    FROM dept
ORDER BY dname, area, deptno desc;

SELECT dname, loc as area, deptno
    FROM dept
ORDER BY 1, area, 3 desc;

SELECT empno, ename
    FROM emp
ORDER BY MGR;

SELECT empno
    FROM (SELECT EMPNO, ENAME
            FROM emp
        ORDER BY MGR);
        
SELECT MGR
    FROM (SELECT EMPNO, ENAME
            FROM emp
        ORDER BY MGR);
        
SELECT JOB,SAL
    FROM EMP
GROUP BY JOB
    HAVING COUNT (*) > 0
ORDER BY SAL;

SELECT JOB
    FROM EMP
GROUP BY JOB
    HAVING COUNT (*) > 0
ORDER BY SAL;

SELECT JOB, SUM(SAL) AS SALARY_SUM
    FROM EMP
GROUP BY JOB
    HAVING SUM (SAL) > 5000
ORDER BY SUM (SAL);

SELECT player.player_name AS 선수명, team.team_name as 소속팀명
    FROM player, TEAM
where team.team_id = player.team_id;

SELECT player.player_name AS 선수명, team.team_name as 소속팀명
    FROM player inner join team
on team.team_id = player.team_id;

SELECT player.player_name, player.back_no, player.team_id
    , team.team_name, team.region_name
    FROM player, team
where team.team_id = player.team_id;

SELECT a.player_name AS 선수명, a.back_no AS 백넘버, a.team_id AS 팀코드
    , b.team_name AS 팀명, b.region_name AS 연고지
    FROM PLAYER A, TEAM B
WHERE b.team_id = a.team_id;