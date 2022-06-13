SELECT player_name as 선수명, position as 위치, height as 키, weight as 몸무게 FROM PLAYER;

SELECT player_name as "선수 명", position as "포지션", height as "키", weight as "몸무게" FROM PLAYER;

SELECT player_name as "선수명", position as "포지션", height-weight "키 - 몸무게" FROM PLAYER;

SELECT player_name as "선수명", round(weight/((height/100) * (height/100)),2) BMI비만지수 FROM PLAYER;

SELECT player_name||'선수,'||height||'cm,'||weight||'kg' FROM PLAYER;