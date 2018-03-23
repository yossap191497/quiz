CREATE TABLE EMPLOYEES(
ID NUMBER(*,0) PRIMARY KEY,
MANAGER_ID NUMBER(*,0) CONSTRAINT FK_MANAGER REFERENCES EMPLOYEES(ID),
DATE_OF_JOINING DATE NOT NULL,
FULL_NAME VARCHAR2(255 BYTE) NOT NULL
);

CREATE TABLE PROJECTS(
ID NUMBER(*,0) PRIMARY KEY,
CODE VARCHAR2(255 BYTE) NOT NULL,
MANAGER_ID NUMBER(*,0) NOT NULL CONSTRAINT FK_MANAGER_PROJECT REFERENCES EMPLOYEES(ID),
BUDGET NUMBER(10,2) NOT NULL,
DATE_OF_BEGINNING DATE,
DATE_OF_ENDING DATE
);

CREATE TABLE SALARIES(
ID NUMBER(*,0) PRIMARY KEY,
EMPLOYEE_ID NUMBER(*,0)NOT NULL CONSTRAINT FK_SALARY_EMPLOYEE REFERENCES EMPLOYEES(ID),
PROJECT_ID NUMBER(*,0) NOT NULL CONSTRAINT FK_SALARY_PROJECT REFERENCES PROJECTS(ID),
SALARY NUMBER(10,2) NOT NULL
);



--Write a SQL query to fetch project code and count of employees (code, counter) sorted by counter in ascending order. example 48205501099, 4

--Write a query to fetch employee names of those who are not assigned to any project

--Write a SQL query to fetch all the Employees who are also managers from employees table

--Write a SQL query to fetch each employee with the name of his/her boss in one column named "employee_boss" separated by ' - ' (don't forget the spaces). Example: "Drew Rosario - Holmes Manning", "Emery Kelley - Holmes Manning" (employee name - manager name)
SELECT  CONCAT(CONCAT(E.FULL_NAME ,' - '),EM.FULL_NAME ) FROM  EMPLOYEES E
INNER JOIN EMPLOYEES EM ON E.ID = EM.MANAGER_ID;
--Write a SQL query to fetch all the employees which first name is Kermit
SELECT * FROM  EMPLOYEES 
WHERE FULL_NAME = '%Kermit';

