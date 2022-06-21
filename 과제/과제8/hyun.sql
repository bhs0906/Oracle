select player_name AS 선수명, position AS 포지션, back_no AS 백넘버, height AS 키 
    from player
    WHERE TEAM_ID = 'K02';
    
select player_name AS 선수명, position as 포지션, back_no AS 백넘버, height AS 키 
    from player
    WHERE position = 'MF';
    
select player_name AS 선수명, position as 포지션, back_no AS 백넘버, height AS 키 
    from player
    WHERE height >= 170;
    
select player_name AS 선수명, position AS 포지션, back_no AS 백넘버, height AS 키 
    from player
    WHERE TEAM_ID IN ('K02', 'K07');
    
SELECT ename, job, deptno
    FROM EMP
    WHERE (job,deptno)IN (('MANAGER',20), ('CLERK', 30));

SELECT ename, job, deptno
    FROM EMP
    WHERE JOB IN ('MANAGER','CLERK') and deptno in(20,30);
    
select player_name AS 선수명, position as 포지션, back_no AS 백넘버, height AS 키 
    from player
    WHERE position LIKE 'MF';
    
select player_name AS 선수명, position as 포지션, back_no AS 백넘버, height AS 키 
    from player
    WHERE player_name LIKE '장%';
    
select player_name AS 선수명, position as 포지션, back_no AS 백넘버, height AS 키 
    from player
    WHERE player_name LIKE '장_호';