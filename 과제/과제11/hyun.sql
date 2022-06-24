SELECT ENAME 사원명, DEPTNO 부서번호
    , case month when 1 then sal end M01, case month when 2 then sal end M02
    , case month when 3 then sal end M03, case month when 4 then sal end M04
    , case month when 5 then sal end M05, case month when 6 then sal end M06
    , case month when 7 then sal end M07, case month when 8 then sal end M08
    , case month when 9 then sal end M09, case month when 10 then sal end M10
    , case month when 11 then sal end M11, case month when 12 then sal end M12
FROM (SELECT ENAME, DEPTNO, EXTRACT (MONTH FROM HIREDATE) MONTH, SAL FROM EMP);

SELECT DEPTNO 부서번호
    , AVG (case month when 1 then sal end) M01, AVG (case month when 2 then sal end) M02
    , AVG (case month when 3 then sal end) M03, AVG (case month when 4 then sal end) M04
    , AVG (case month when 5 then sal end) M05, AVG (case month when 6 then sal end) M06
    , AVG (case month when 7 then sal end) M07, AVG (case month when 8 then sal end) M08
    , AVG (case month when 9 then sal end) M09, AVG (case month when 10 then sal end) M10
    , AVG (case month when 11 then sal end) M11, AVG (case month when 12 then sal end) M12
FROM (SELECT ENAME, DEPTNO, EXTRACT (MONTH FROM HIREDATE) MONTH, SAL FROM EMP)
GROUP BY DEPTNO;

SELECT DEPTNO 부서번호
    , AVG (decode (month, 1, sal)) M01, AVG (decode (month, 2, sal)) M02
    , AVG (decode (month, 3, sal)) M03, AVG (decode (month, 4, sal)) M04
    , AVG (decode (month, 5, sal)) M05, AVG (decode (month, 6, sal)) M06
    , AVG (decode (month, 7, sal)) M07, AVG (decode (month, 8, sal)) M08
    , AVG (decode (month, 9, sal)) M09, AVG (decode (month, 10, sal)) M10
    , AVG (decode (month, 11, sal)) M11, AVG (decode (month, 12, sal)) M12
FROM (SELECT ENAME, DEPTNO, EXTRACT (MONTH FROM HIREDATE) MONTH, SAL FROM EMP)
GROUP BY DEPTNO;

SELECT team_id
        , NVL (sum (case position when 'FW' then 1 else 0 end), 0) FW
        , NVL (sum (case position when 'MF' then 1 else 0 end), 0) MF
        , NVL (sum (case position when 'DF' then 1 else 0 end), 0) DF
        , NVL (sum (case position when 'GK' then 1 else 0 end), 0) GK
        , COUNT(*) SUM
FROM PLAYER
GROUP BY TEAM_ID;

SELECT team_id
        , NVL (SUM (case position when 'FW' then 1 end), 0) FW
        , NVL (SUM (case position when 'MF' then 1 end), 0) MF
        , NVL (SUM (case position when 'DF' then 1 end), 0) DF
        , NVL (SUM (case position when 'GK' then 1 end), 0) GK
        , COUNT(*) SUM
FROM PLAYER
GROUP BY TEAM_ID;

SELECT team_id
        , NVL (SUM (case when position = 'FW' then 1 end), 0) FW
        , NVL (SUM (case when position = 'MF' then 1 end), 0) MF
        , NVL (SUM (case when position = 'DF' then 1 end), 0) DF
        , NVL (SUM (case when position = 'GK' then 1 end), 0) GK
        , COUNT(*) SUM
FROM PLAYER
GROUP BY TEAM_ID;

SELECT ROUND (AVG (CASE WHEN POSITION = 'MF' THEN HEIGHT END), 2) 미드필더
      ,ROUND (AVG (CASE WHEN POSITION = 'FW' THEN HEIGHT END), 2) 포워드
      ,ROUND (AVG (CASE WHEN POSITION = 'DF' THEN HEIGHT END), 2) 디펜더
      ,ROUND (AVG (CASE WHEN POSITION = 'GK' THEN HEIGHT END), 2) 골키퍼
      ,ROUND (AVG (HEIGHT), 2) 전체평균키
FROM PLAYER;

SELECT player_name 선수명, position 포지션, back_no 백넘버
FROM PLAYER
ORDER BY player_name desc;

SELECT player_name 선수명, position 포지션, back_no 백넘버
FROM PLAYER
ORDER BY 포지션 desc;

SELECT player_name 선수명, position 포지션, back_no 백넘버, height 키
FROM PLAYER
WHERE HEIGHT IS NOT NULL
ORDER BY HEIGHT DESC, back_no;

SELECT player_name 선수명, position 포지션, back_no 백넘버
FROM PLAYER
WHERE back_no is not null
ORDER BY 3 desc, 2, 1;