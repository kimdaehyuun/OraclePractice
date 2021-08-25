SELECT EMPNO, ENAME, HIREDATE,
TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '월요일'), 'YYYY-MM-DD') AS R_JGB,
NVL(TO_CHAR(COMM), 'N/A') AS COMM
FROM EMP;

SELECT EMPNO, ENAME, SAL,
TRUNC((SAL / 21.5), 2) AS DAY_PAY,
ROUND(((SAL / 21.5) / 8), 1) AS TIME_PAY
FROM EMP;

SELECT EMPNO,
RPAD(SUBSTR(EMPNO, 1, 2), 4, '*') AS MASKING_EMPNO,
ENAME,
RPAD(SUBSTR(ENAME, 1, 1), 5, '*') AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME) >= 5 AND LENGTH(ENAME) < 6;

SELECT RPAD(RPAD(empno, 2), 4, '*') masking_empno
FROM EMP;

select empno, ename, hiredate,
to_char(next_day(add_months(hiredate , 3) , '월요일'), 'YYYY-MM-DD') AS R_JGB,
nvl(to_char(comm),'N/A') AS COMM
from emp;

select empno, ename, hiredate,
to_char(next_day(add_months(hiredate , 3) , '월요일'), 'YYYY-MM-DD') AS R_JGB,
nvl(to_char(comm),'N/A') AS COMM
from emp;

SELECT * FROM EMP;

select ename, enpno,
rpad(substr(enpno,1,2),4,'*') as MASKING_EMPNO,
rpad(substr(ename,1,1),5,'*') AS MASKING_ENAME
from emp
where length(ename) >=5 and length(ename)<6 ;