SELECT a.stadium_name, a.stadium_id, a.seat_count, a.hometeam_id
    ,b.team_name
FROM stadium a left outer join team b
    on B.team_id = a.hometeam_id
order by a.hometeam_id;

SELECT a.ename, b.deptno, b.dname, b.loc
FROM emp a right join dept b
    on b.deptno = a.deptno;
    
update dept_temp
    set deptno = deptno + 20;
    
SELECT
    *
FROM dept_temp;

SELECT * 
FROM dept a full join dept_temp b
    on b.deptno = a.deptno;
    
SELECT player_name as 선수명, position as 포지션, back_no as 백넘버
FROM player
where team_id = (select team_id
                    from player
                    where player_name = '정남일')
order by player_name;

SELECT player_name as 선수명, position as 포지션, back_no as 백넘버
FROM player
where height <= (select avg (height)
                    from player)
order by player_name;

SELECT region_name as 연고지명, team_name as 팀명, e_team_name as 영문팀명
    FROM team
where team_id = (selsect team_id
                    from player
                    where player_name = '정현수')
order by team_name;

SELECT region_name as 연고지명, team_name as 팀명, e_team_name as 영문팀명
    FROM team
    where team_id in (select team_id
                        from player
                        where player_name='정현수')
order by team_name;

SELECT  team_id as 팀코드, player_name as 선수명, position as 포지션
    , back_no as 백넘버, height as 키
FROM player
where (team_id, height) in (select team_id, min(height)
                                from player
                                group by team_id)
order by team_id, player_name;

SELECT b.team_name as 팀명, a.player_name as 선수명, a.position as 포지션
    , a.back_no as 백넘버, a.height as 키
    FROM player a, team b
where a.height < (select avg(X.HEIGHT)
                    from player X
                    where x.team_id = a.team_id
                    group by x.team_id)
            and b.team_id = a.team_id
order by 선수명;