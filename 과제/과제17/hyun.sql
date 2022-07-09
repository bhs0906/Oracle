SELECT b.team_name as 팀명, a.player_name as 선수명, a.back_no as 백넘버
FROM (SELECT team_id, player_name, back_no
        from player
        where position = 'MF') A
    , team b
where b.team_id = a.team_id
order by 선수명;

SELECT player_name as 선수명, position as 포지션
    , back_no as 백넘버, height as 키
FROM (select player_name, position, back_no, height
        from player
        where height is not null
        order by height desc)
where rownum <=5;

SELECT a.team_id as 팀코드, b.team_name as 팀명
    , round(avg(a.height), 3) as 평균키
FROM player a, team b
where b.team_id = a.team_id
group by a.team_id, b.team_name
    having avg(a.height) < (select avg(x.height)
                            from player X
                            where x.team_id in (select team_id
                                                from team
                                                where team_name = '삼성블루윙즈'));
                           
CREATE VIEW V_PLAYER_TEAM as 
SELECT a.player_name, a.position, a.back_no
    , b.team_id, b.team_name
FROM player a, team b
where b.team_id = a.team_id;

SELECT team_id as 팀코드, player_name as 선수명, position as 포지션
    , back_no as 백넘버, height as 키
FROM player
where team_id = 'K02'
UNION
SELECT team_id as 팀코드, player_name as 선수명, position as 포지션
    , back_no as 백넘버, height as 키
    from player
    where team_id = 'K07';
    
SELECT team_id as 팀코드, player_name as 선수명, position as 포지션
    , back_no as 백넘버, height as 키
FROM player
where team_id = 'K02'
UNION
SELECT team_id as 팀코드, player_name as 선수명, position as 포지션
    , back_no as 백넘버, height as 키
    from player
    where team_id = 'GK';
    
SELECT team_id as 팀코드, player_name as 선수명, position as 포지션
    , back_no as 백넘버, height as 키
FROM player
where team_id = 'K02'
UNION all
SELECT team_id as 팀코드, player_name as 선수명, position as 포지션
    , back_no as 백넘버, height as 키
    from player
    where team_id = 'GK';

SELECT 팀코드, 선수명, 포지션, 백넘버, 키 , count(*) as 중복수
    FROM (select team_id as 팀코드, player_name as 선수명
        , position as 포지션, back_no as 백넘버, height as 키
        from player
        where team_id='K02'
        UNION ALL
        SELECT team_id as 팀코드, player_name as 선수명
            , position as 포지션, back_no as 백넘버, height as 키
        from player
        where position = 'GK')
group by 팀코드, 선수명, 포지션, 백넘버, 키
    having count(*) > 1;

SELECT 'p' as 구분코드, position as 포지션, round(avg(height),3) as 평균키
    FROM player
group by position
union all
select 't' as 구분코드, team_id as 팀명, round(avg(height),3) as 평균키
    from player
group by team_id
order by 1;

SELECT team_id as 팀코드, player_name as 선수명, position as 포지션
    , back_no as 백넘버, height as 키
    FROM player
    where team_id = 'K02'
minus
SELECT team_id as 팀코드, player_name as 선수명, position as 포지션
    , back_no as 백넘버, height as 키
    from player
    where position = 'MF'
order by 1,2,3,4,5;

    
    