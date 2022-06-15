SELECT team_id as 팀ID, TO_NUMBER(zip_code1, '999') + TO_NUMBER(zip_code1, '999') as 우편번호함 FROM team;

SELECT SYSDATE FROM dual;

SELECT ename AS 사원명, hiredate AS 입사일자
    , to_number(TO_CHAR(hiredate, 'YYYY')) AS 입사년도
    , to_number(TO_CHAR(hiredate, 'MM')) AS 입사월    
    , to_number(TO_CHAR(hiredate, 'DD')) AS 입사일
FROM EMP;

SELECT TO_CHAR(sysdate, 'YYYY/MM/DD') AS 날짜
    , TO_CHAR(sysdate, 'YYYY/MON/DAY') AS 문자형
FROM DUAL;

SELECT ename, round(sal/12) as sal_round, ceil(sal/12) as SAL_CEIL FROM EMP;