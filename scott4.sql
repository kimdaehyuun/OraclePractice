SELECT * FROM DEPT;

SELECT * FROM EMP;

SELECT * FROM SALGRADE;

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL, E.DEPTNO
FROM DEPT D FULL OUTER JOIN EMP E ON D.DEPTNO = E.DEPTNO
WHERE SAL >= 2000
ORDER BY DEPTNO;

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM DEPT D FULL OUTER JOIN EMP E ON D.DEPTNO = E.DEPTNO
ORDER BY DEPTNO, ENAME;

SELECT D.DEPTNO, D.DNAME, E1.EMPNO, E1.ENAME, E1.MGR, E1.SAL,
S.LOSAL, S.HISAL, S.GRADE,
E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM DEPT D FULL OUTER JOIN EMP E1 ON (D.DEPTNO = E1.DEPTNO)
LEFT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
FULL OUTER JOIN SALGRADE S ON (E1.SAL BETWEEN S.LOSAL AND S.HISAL)
ORDER BY DEPTNO, EMPNO;

CREATE TABLE emp_master
(
  emp_id     NUMBER        NOT NULL, --�����ȣ
  emp_name   VARCHAR2(100) NOT NULL, --�����
  gender     VARCHAR2(10),           --����
  age        NUMBER,                 --����
  hire_date  DATE,                   --�Ի�����
  dept_id    NUMBER,                 --�μ����̵�
  address_id NUMBER,                 --�ּҾ��̵�
  CONSTRAINT emp_master_pk PRIMARY KEY (emp_id)
);

CREATE TABLE dept_master (
  dept_id    NUMBER NOT NULL,         --�μ����̵�
  dept_name  VARCHAR2(50),            --�μ� ��
  use_yn     VARCHAR2(2) DEFAULT 'Y', --��뿩��
  dept_desc  VARCHAR2(100),           --�μ�����
  CONSTRAINT dept_master_pk PRIMARY KEY (dept_id)
);


CREATE TABLE address_master (
  address_id   NUMBER NOT NULL,       --�ּҾ��̵� 
  city         VARCHAR2(100),         --���� �� 
  gu           VARCHAR2(50),          --�� ��
  address_name VARCHAR2(100),         --������ �ּ�
  CONSTRAINT address_master_pk PRIMARY KEY (address_id)
);

INSERT INTO emp_master ( emp_id, emp_name, gender, age, hire_date, dept_id, address_id )
VALUES (1, '����', '����', 56, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 1, 1);

INSERT INTO emp_master ( emp_id, emp_name, gender, age, hire_date, dept_id, address_id )
VALUES (2, 'ä��ȭ', '����', 34, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 1, 2);

INSERT INTO emp_master ( emp_id, emp_name, gender, age, hire_date, dept_id, address_id )
VALUES (3, '������', '����', 45, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 3, 2);

INSERT INTO emp_master ( emp_id, emp_name, gender, age, hire_date, dept_id, address_id )
VALUES (4, '������', '����', 23, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 2, 3);

INSERT INTO emp_master ( emp_id, emp_name, gender, age, hire_date, dept_id, address_id )
VALUES (5, '�缮��', '����', 45, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 4, 4);

INSERT INTO emp_master ( emp_id, emp_name, gender, age, hire_date, dept_id, address_id )
VALUES (6, '���ؿ�', '����', 35, TO_DATE('2018-01-01', 'YYYY-MM-DD'), NULL, 4);


INSERT INTO dept_master ( dept_id, dept_name )
VALUES (1, 'ȸ����');

INSERT INTO dept_master ( dept_id, dept_name )
VALUES (2, '�濵��');

INSERT INTO dept_master ( dept_id, dept_name )
VALUES (3, '������');

INSERT INTO dept_master ( dept_id, dept_name )
VALUES (4, '��������');

INSERT INTO dept_master ( dept_id, dept_name )
VALUES (5, 'IT��');

INSERT INTO address_master ( address_id, city, gu, address_name )
VALUES (1, '����Ư����', '�߱�', '�����ȷ� 12');

INSERT INTO address_master ( address_id, city, gu, address_name )
VALUES (2, '����Ư����', '���빮��', '����� 15��');

INSERT INTO address_master ( address_id, city, gu, address_name )
VALUES (3, '����Ư����', '��������', '���Ǵ�� 99');

INSERT INTO address_master ( address_id, city, gu, address_name )
VALUES (4, '����Ư����', '������', '������� 33');

commit;

select * from emp_master;
select * from dept_master;
select * from address_master;

select * from emp
WHERE DEPTNO = 10;

select * from dept;

select e.job, e.empno, e.ename, e.sal, d.deptno, d.dname
from emp e left join dept d on (e.deptno = d.deptno)
where job = (select job from emp where ename = 'ALLEN')
order by sal desc;

SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
WHERE E.DEPTNO = 10 AND E.JOB NOT IN(SELECT E.JOB FROM EMP E WHERE E.DEPTNO = 30);

SELECT DISTINCT JOB FROM EMP WHERE DEPTNO = 30;
