SELECT job, deptno, sal
FROM t1
unpivot include nulls (sal for deptno in (d10_sal as 10, d20_sal as 20))
order by 1,2;

SELECT  *
FROM t1
unpivot((sal, cnt)
        for deptno in ((d10_sal, d10_cnt) as 10, (d20_sal, d20_cnt) as 20))
        order by 1,2;
        
SELECT *
FROM t1
unpivot((sal, cnt)
        for (deptno, dname) in ((d10_sal, d10_cnt) as (10, 'ACCOUNTING')
                            ,(d20_sal, d20_cnt) as (20, 'RESEARCH')))
order by 1,2;

SELECT a.job
    , case b.lv when 1 then 10 when 2 then 20 end as deptno
    , case b.lv when 1 then a.d10_sal when 2 then a.d20_sal end as sal
    , case b.lv when 1 then a.d10_cnt when 2 then a.d20_cnt end as cnt
FROM t1 a
    , (select level as lv from dual connect by level <= 2) b
order by 1,2;

SELECT a.job, b.lv, a.d10_sal, a.d20_sal, a.d10_cnt, a.d20_cnt
FROM t1 a
    ,(select level as lv from dual connect by level <= 2) b
order by a.job, b.lv;

SELECT regexp_substr ('aab', 'a.b') as c1
    ,regexp_substr ('abb', 'a.b') as c2
    ,regexp_substr ('acb', 'a.b') as c3
    ,regexp_substr ('adb', 'a.b') as c4
FROM dual;

SELECT regexp_substr ('a', 'a|b') as c1
    ,regexp_substr ('b', 'a|b') as c2
    ,regexp_substr ('c', 'a|b') as c3
    ,regexp_substr ('ab', 'ab|cd') as c4
    ,regexp_substr ('cd', 'ab|cd') as c5
    ,regexp_substr ('bc', 'ab|cd') as c6
    ,regexp_substr ('aa', 'a|aa') as c7
    ,regexp_substr ('aa', 'aa|a') as c8
FROM dual;

SELECT regexp_substr ('a|b', 'a|b') as c1
    ,regexp_substr ('a|b', 'a\|b') as c2
FROM dual;

SELECT regexp_substr ('ab'|| chr(10) || 'cd', '^.', 1, 1) as c1
        ,regexp_substr ('ab'|| chr(10) || 'cd', '^.', 1, 2) as c2
        ,regexp_substr ('ab'|| chr(10) || 'cd', '.$', 1, 1) as c3
        ,regexp_substr ('ab'|| chr(10) || 'cd', '.$', 1, 2) as c4
FROM dual;

SELECT regexp_substr ('ac', 'ab?c') as c1
        ,regexp_substr ('abc', 'ab?c') as c2
        ,regexp_substr ('abbc', 'ab?c') as c3
        ,regexp_substr ('ac', 'ab*c') as c4
        ,regexp_substr ('abc', 'ab*c') as c5
        ,regexp_substr ('abbc', 'ab*c') as c6
        ,regexp_substr ('ac', 'ab+c') as c7
        ,regexp_substr ('abc', 'ab+c') as c8
        ,regexp_substr ('abbc', 'ab+c') as c9
FROM dual;