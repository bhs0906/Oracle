SELECT COUNT (*) as 전체행수, count (height) as 키건수,
            max (height) as 최대키, min(height) as 최소키, round(avg(height),2) as 평균키
FROM player;

SELECT position as 포지션, avg(height) as 평균키
FROM player;

SELECT position as 포지션, count(*) as 인원수, count (height) as 키대상,
    max(height) as 최대키, min(height) as 최소키,
    ROUND(AVG(height),2) AS 평균키
FROM player
GROUP BY position;

SELECT position as 포지션, round(avg(height),2) as 평균키
FROM player
GROUP BY position
    HAVING avg (height) >= 180;
    
SELECT team_id as 팀ID, COUNT (*) AS 인원수
FROM player
WHERE TEAM_ID IN ('K09', 'K02')
GROUP BY team_id;

SELECT position as 포지션, round(avg(height),2) as 평균키
FROM player
GROUP BY position
    HAVING MAX (height) >= 190;
    
SELECT ename as 사원명, deptno as 부서번호,
    EXTRACT(month from hiredate) as 입사월, sal as 급여
FROM emp;
