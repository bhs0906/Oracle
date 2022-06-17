select nvl(null, 'nvl-ok') as isnull_test from dual;

select nvl('not-null', 'nvl-ok') as isnull_test from dual;

select player_name 선수명, position 포지션,
    case when position = null 
    then '없음'
    else position
    end as 포지션
 from player
 where team_id='K08';
 
 SELECT ename as 사원명, sal as 월급, comm as 커미션
        ,(sal * 12) + comm as 연봉A, (SAL * 12) + NVL(COMM,0) as 연봉B
 FROM emp;