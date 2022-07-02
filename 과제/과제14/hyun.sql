SELECT A.empno, A.ename, B.deptno, B.dname
FROM emp a natural join dept b;

SELECT *
FROM emp a natural join dept b;

SELECT *
    FROM emp a inner join dept b
        on b.deptno = a.deptno;
        
create table DEPT_TEMP AS SELECT * FROM DEPT;

UPDATE DEPT_TEMP
    SET dname = 'CONSULTING'
WHERE dname = 'RESEARCH';

UPDATE DEPT_TEMP
    SET dname = 'MARKETING'
WHERE dname = 'SALES';

SELECT
    *
FROM dept_temp;

SELECT *
    FROM dept a natural inner join dept_temp b;
    
SELECT *
    FROM dept a join dept_temp b
    on b.deptno = a.deptno
   and b.dname = a.dname
   and b.loc = a.loc;
   
SELECT *
    FROM dept a join dept_temp b
   USING(deptno);
   
SELECT deptno, a.dname, a.loc, b.dname, b.loc
    FROM dept a join dept_temp b
   USING(deptno);
   
SELECT *
    FROM dept a join dept_temp b
   USING(dname);

SELECT *
    FROM dept a join dept_temp b
   USING(loc, deptno);   