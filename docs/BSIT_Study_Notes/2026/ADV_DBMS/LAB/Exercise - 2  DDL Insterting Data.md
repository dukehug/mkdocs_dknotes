2026-02-04 11:10

Tags:  #ADV_DBMS 
Author:  Duke Hsu

---

## Notes


1. **Table and Column Names**
   - For example, the table name is `regions`(lowercase) and the column name is `REGION_ID` (uppercase)

2. **SQL Statement Rules**
   - All SQL statements should be in uppercase.
   - Each `VALUES` clause should be indented by one tab.

3. **When Inserting Data, Please Pay Attention to the Following:**
   - Check if the values referenced from the columns in the table are correct, if the data types match, and if the names are correct.
   - Ensure that the referenced values in the table actually exist.



## Regions Table

```sql
-- insert to {table name}(column) values (),(); 
INSERT INTO regions(REGION_ID, REGION_NAME) 
	VALUES
	(1,'Europe'),
	(2,'Americas'),
	(3,'Asia'),
	(4,'Middle East and Africa');
```

## Countries Table
```sql
INSERT INTO  countries (COUNTRY_ID,COUNTRY_NAME,REGION_ID)
VALUES
	('IT','Italy',1),
	('JP','Japan',3),
	('US','United States of America',2),
	('CA','Canada',2),
	('IN','India',3),
	('AU','Australia',3),
	('ZW','Zimbabwe',4),
	('SG','Singapore',3),
	('UK','United Kingdom',1),
	('FR','France',1),
	('GE','Germany',1), --ERROR shoud be DE
	('ZM','Zambia',4),
	('EG','Egypt',4),
	('BR','Brazil',2),
	('CH','Switzerlan',1),
	('CN','China',3),
	('NL','Netherlands',1),
	('MX','Mexico',2),
	('KW','Kuwait',4),
	('IL','Israel',4),
	('DK','Demark',1),
	('HK','Hongkong',3),
	('NG','Nigeria',4),
	('AR','Argentina',2),
	('BE','Belgium',1);
	
```

## Location table

```sql

INSERT INTO locations(LOCATION_ID,STREET_ADDRESS,POST_CODE,CITY,STATE_PROVINCE,COUNTRY_ID)
VALUES
	(1100, '93091 Calle della Testa', '10934', 'Venice', NULL, 'IT'),
	(1200, '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', 'JP'),
	(1300, '9450 Kamiya-cho', '6823', 'Hiroshima', NULL, 'JP'),
	(1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US'),
	(1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US'),
	(1600, '2007 Zagora St', '50090', 'South Brunswick', 'New Jersey', 'US'),
	(1700, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US'),
	(1800, '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA'),
	(1900, '6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA'),
	(2000, '40-5-12 Laogianggen', '190518', 'Beijing', NULL, 'CN'),
	(2100, '1298 Vileparle (E)', '490231', 'Bombay', 'Maharashtra', 'IN'),
	(2200, '12-98 Victoria Street', '2901', 'Sydney', 'New South Wales', 'AU'),
	(2300, '198 Clementi North', '540198', 'Singapore', NULL, 'SG'),
	(2400, '8204 Arthur St', NULL, 'London', NULL, 'UK'),
	(2500, '9702 Chester Road', '09629', 'Stretford', 'Manchester', 'UK'),
	(2600, 'Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE'), 
	(2700, 'Rua Frei Caneca 1360', '01-307', 'Sao Paulo', 'Sao Paulo', 'BR'),
	(2800, 'Pieter Breughelstraat 83', '3029SK', 'Utrecht', 'Utrecht', 'NL'),
	(2900, 'Mariano Escobedo 9991', '11932', 'Mexico City', 'Distrito Federal', 'MX'),
	(3000, '1297 Via Cola di Rie', '00989', 'Roma', NULL, 'IT');
	
```


## Department Table

```sql
INSERT INTO departments (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
VALUES
	(20, 'Marketing', 201, 1800),
	(30, 'Purchasing', 114, 1700),
	(40, 'Human Resources', 203, 2400),
	(50, 'Shipping', 121, 1500),
	(60, 'IT', 103, 1400),
	(70, 'Public Relations', 204, 2700),
	(80, 'Sales', 145, 2500),
	(90, 'Executive', 100, 1700),
	(100, 'Finance', 108, 1700),
	(110, 'Accounting', 205, 1700),
	(120, 'Treasury', NULL, 1700),
	(130, 'Corporate Tax', NULL, 1700),
	(140, 'Control and Credit', NULL, 1700),
	(150, 'Shareholder Services', NULL, 1700);
```


## Jobs Table
```sql

INSERT INTO jobs (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY)
VALUES
	('AD_PRES', 'President', 20000, 40000),
	('AD_VP', 'Administration Vice President', 15000, 30000),
	('AD_ASST', 'Administration Assistant', 3000, 6000),
	('FI_ACCOUNT', 'Accountant', 4200, 9000),
	('AC_MGR', 'Accounting Manager', 8200, 16000),
	('AC_ACCOUNT', 'Public Accountant', 4200, 9000),
	('SA_MAN', 'Sales Manager', 10000, 20000),
	('SA_REP', 'Sales Representative', 6000, 12000),
	('PU_MAN', 'Purchasing Manager', 8000, 15000),
	('PU_CLERK', 'Purchasing Clerk', 2500, 5500),
	('ST_MAN', 'Stock Manager', 5500, 8500),
	('ST_CLERK', 'Stock Clerk', 2000, 5000),
	('SH_CLERK', 'Shipping Clerk', 2500, 5500),
	('IT_PROG', 'Programmer', 4000, 10000),
	('MK_MAN', 'Marketing Manager', 9000, 15000);

```


## Employees Table
```sql
INSERT INTO employees (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) 
VALUES
	(100, 'Steven', 'King', 'SKING', '515.123.4567', '1987-06-17', 'AD_PRES', 24000, NULL, NULL, 90),
	(101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '1989-09-21', 'AD_VP', 17000, NULL, 100, 90),
	(102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', '1993-01-13', 'AD_VP', 17000, NULL, 100, 90),
	(103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '1990-01-03', 'IT_PROG', 9000, NULL, 102, 60),
	(104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '1991-05-21', 'IT_PROG', 6000, NULL, 103, 60),
	(105, 'David', 'Austin', 'DAUSTIN', '590.423.4569', '1997-06-25', 'IT_PROG', 4800, NULL, 103, 60),
	(106, 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', '1998-02-05', 'IT_PROG', 4800, NULL, 103, 60),
	(107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', '1999-02-07', 'IT_PROG', 200, NULL, 103, 60),
	(108, 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', '1994-08-17', 'FI_MGR', 12000, NULL, 101, 100),
	(109, 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', '1994-08-16', 'FI_ACCOUNT', 9000, NULL, 108, 100),
	(110, 'John', 'Chen', 'JCHEN', '515.124.4269', '1997-09-28', 'FI_ACCOUNT', 8200, NULL, 108, 100),
	(111, 'Ismael', 'Sciarra', 'ISCIARRA', '515.124.4369', '1997-09-30', 'FI_ACCOUNT', 7700, NULL, 108, 100),
	(112, 'Jose Manuel', 'Urman', 'JMURMAN', '515.124.4469', '1998-03-07', 'FI_ACCOUNT', 7800, NULL, 108, 100),
	(113, 'Luis', 'Popp', 'LPOPP', '515.124.4567', '1999-12-07', 'FI_ACCOUNT', 6900, NULL, 108, 100),
	(114, 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561', '1994-12-07', 'PU_MAN', 11000, NULL, 100, 30),
	(115, 'Alexander', 'Khoo', 'AKHOO', '515.127.4562', '1995-05-18', 'PU_CLERK', 3100, NULL, 114, 30),
	(116, 'Shelli', 'Baida', 'SBAIDA', '515.127.4563', '1997-12-24', 'PU_CLERK', 2900, NULL, 114, 30),
	(117, 'Sigal', 'Tobias', 'STOBIAS', '515.127.4564', '1997-07-24', 'PU_CLERK', 2800, NULL, 114, 30),
	(118, 'Guy', 'Himuro', 'GHIMURO', '515.127.4565', '1998-11-15', 'PU_CLERK', 2600, NULL, 114, 30),
	(119, 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', '1999-08-10', 'PU_CLERK', 2500, NULL, 114, 30),
	(120, 'Matthew', 'Weiss', 'MWEISS', '650.123.1234', '1996-07-18', 'ST_MAN', 8000, NULL, 100, 50),
	(121, 'Adam', 'Fripp', 'AFRIPP', '650.123.2234', '1997-04-10', 'ST_MAN', 8200, NULL, 100, 50),
	(122, 'Payam', 'Kaufling', 'PKAUFLIN', '650.123.3234', '1995-05-01', 'ST_MAN', 7900, NULL, 100, 50),
	(123, 'Shanta', 'Vollman', 'SVOLLMAN', '650.123.4234', '1997-10-10', 'ST_MAN', 6500, NULL, 100, 50),
	(124, 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', '1999-11-16', 'ST_MAN', 5800, NULL, 100, 50),
	(125, 'Julia', 'Nayer', 'JNAYER', '650.124.1214', '1997-07-16', 'ST_CLERK', 3200, NULL, 120, 50),
	(175, 'Alyssa', 'Hutton', 'AHUTTON', '011.44.1644.429266', '1997-03-19', 'SA_REP', 8800, 0.25, 149, 80), --not working  (manage_id 149, wala)
	(176, 'Jonathon', 'Taylor', 'JTAYLOR', '011.44.1644.429265', '1998-03-24', 'SA_REP', 8600, 0.20, 149, 80), -- not working  (manage_id 149, wala)
	(200, 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', '1987-09-17', 'AD_ASST', 4400, NULL, 101, 10), -- not working (departmentID - No 10)
	(201, 'Michael', 'Hartstein', 'MHARTSTE', '515.123.5555', '1996-02-17', 'MK_MAN', 13000, NULL, 100, 20); -- ok

```


## Job History Table

```sql
INSERT INTO job_History(EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID)

VALUES
	(102, '1993-01-13', '1998-07-24', 'IT_PROG', 60),
	(101, '1989-09-21', '1993-10-27', 'AC_ACCOUNT', 110),
	(101, '1993-10-28', '1997-03-15', 'AC_MGR', 110),
	(201, '1996-02-17', '1999-12-19', 'MK_REP', 20), --MK_REP wala
	(114, '1998-03-24', '1999-12-31', 'ST_CLERK', 50),
	(122, '1999-01-01', '1999-12-31', 'ST_CLERK', 50),
	(200, '1987-09-17', '1993-06-17', 'AD_ASST', 90), --employee id 200 wala
	(175, '1998-03-24', '1998-12-31', 'SA_REP', 80),
	(176, '1999-01-01', '1999-12-31', 'SA_MAN', 80), -- employee id 176 ,wala
	(200, '1994-07-01', '1998-12-31', 'AC_ACCOUNT', 90); --employee id 200 wala
```

----
### References: 
 
 DDL-  Inserting Data .PDF 