SELECT player_name 선수명, position 포지션, back_no 백넘버, height 키
FROM player
where height BETWEEN 170 and 180;

SELECT player_name 선수명, position 포지션, team_id 팀ID
FROM player
where position is null;

SELECT player_name 선수명, position 포지션, back_no 백넘버, height 키
FROM player
where team_id = 'K02' and height >= 170;

SELECT player_name 선수명, position 포지션, back_no 백넘버, height 키
FROM player
where team_id IN ('K02', 'K07') and position = 'MF';

SELECT team_id 팀ID, player_name 선수명, position 포지션, back_no 백넘버, height 키
FROM player
where 
(team_id = 'K02' OR team_id = 'K07') AND (position = 'MF' AND height >=170 AND height <=180);

SELECT player_name 선수명, position 포지션, back_no 백넘버, height 키
FROM player
where team_id = 'K02' AND position <> 'MF' AND height NOT BETWEEN 175 AND 185;

SELECT player_name 선수명, nation 국적
FROM player
where nation IS NOT NULL;