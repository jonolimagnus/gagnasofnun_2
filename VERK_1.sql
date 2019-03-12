drop DATABASE if EXISTS 2611982589_SaleCo;

CREATE DATABASE 2611982589_SaleCo;
USE 2611982589_SaleCo;

CREATE TABLE customer(
	CUS_CODE INT AUTO_INCREMENT NOT NULL,
	cus_lname VARCHAR(75),
	cus_fname VARCHAR(75),
	cus_inital CHAR(1),
	cus_areacode CHAR(3) default '181',
	cus_phone CHAR(10),
	cus_balance INT null default NULL,
	CONSTRAINT coustomer_pk PRIMARY KEY(CUS_CODE)
);

INSERT INTO customer(cus_code, cus_lname,cus_fname,cus_inital,cus_areacode,cus_phone,cus_balance)
VALUE
	(10010,'Ramas','Alfred','A','181','844-2573',0);
    
INSERT INTO customer(cus_code, cus_lname,cus_fname,cus_inital,cus_areacode,cus_phone,cus_balance)
VALUE
	(10011,'Dunne','Leona','K','161','894-1238',0);
    
INSERT INTO customer(cus_code, cus_lname,cus_fname,cus_inital,cus_areacode,cus_phone,cus_balance)
VALUE
	(10012,'Smith','Kathy','W','181','894-2285',345.86);


CREATE TABLE employees(
	emp_num INT AUTO_INCREMENT NOT NULL,
    emp_title CHAR(15),
    emp_lname VARCHAR(15),
    emp_fname VARCHAR(15),
    emp_initial CHAR(1),
    emp_dob DATETIME,
    emp_hir_date DATETIME,
    emp_areacode CHAR(5),
    emp_phone CHAR(8),
    emp_mgr INT,
    CONSTRAINT EMPOYEE_PK PRIMARY KEY (EMP_NUM)
);

INSERT INTO employees(emp_num,emp_title,emp_lname,emp_fname,emp_initial,emp_dob,emp_hir_date,emp_areacode,emp_phone,emp_mgr)
VALUE
	(101,'SALES MANAGER','PHELPS','WILLIAM','A','1967-6-6 13:23:45','1989-3-6 12:04:25','00162',242-9876,101);

INSERT INTO employees(emp_num,emp_title,emp_lname,emp_fname,emp_initial,emp_dob,emp_hir_date,emp_areacode,emp_phone,emp_mgr)
VALUE
	(102,'SALE ASSIT','RICHARDS','STAN','W','1996-2-14 12:34:54','2013-4-5 14:54:34','00256',324-6875,101);

INSERT INTO employees(emp_num,emp_title,emp_lname,emp_fname,emp_initial,emp_dob,emp_hir_date,emp_areacode,emp_phone,emp_mgr)
VALUE
	(103,'SALE ASSIt','LANTON','FRANK','L','1988-12-25 13:13:43','2006-3-13 14:23:34','00268',254-5675,101);

CREATE TABLE invoice(
    INV_NUMBER INT AUTO_INCREMENT NOT NULL,
    CUS_CODE INT,
	INV_DATE DATETIME,
    PRIMARY KEY (INV_NUMBER),
    CONSTRAINT FK_custumerInvoice FOREIGN KEY (CUS_CODE) REFERENCES customer(CUS_CODE)
);

INSERT INTO invoice(INV_NUMBER, CUS_code, INV_DATE)
value
	(1001,10010,'2008-01-16 18:57:38');

INSERT INTO invoice(INV_NUMBER, CUS_code, INV_DATE)
VALUE
	(1002,10011,'2008-01-16 07:28:34');

INSERT INTO invoice(INV_NUMBER, CUS_code, INV_DATE)
VALUE
	(1003,10012,'2008-01-16 10:23:45');


CREATE TABLE line(
	LIN_ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    INV_NUMBER INT,
	LIN_NUMBER CHAR(10),
	LIN_UNITS char(10) DEFAULT 0,
	LIN_PRICE CHAR(5) DEFAULT 0,
    CONSTRAINT FK_INVOICELINE FOREIGN KEY (INV_NUMBER) REFERENCES invoice(INV_NUMBER)
);

INSERT INTO line(LIN_ID,INV_NUMBER,LIN_NUMBER,LIN_UNITS,LIN_PRICE)
VALUES
	(1011,1001,'13-Q2/P2',1,14.99);
    
INSERT INTO line(LIN_ID,INV_NUMBER,LIN_NUMBER,LIN_UNITS,LIN_PRICE)
VALUES
	(1031,1002,'23109-HB',1,9.95);


INSERT INTO line(LIN_ID,INV_NUMBER,LIN_NUMBER,LIN_UNITS,LIN_PRICE)
VALUES
	(1022,1003,'54778-2T',2,4.99);

CREATE TABLE product(
	prod_code INT AUTO_INCREMENT NOT NULL,
    LIN_ID INT,
	prod_descript varchar(75),
    prod_date DATE,
	prod_price CHAR(10),
	prod_on_hand VARCHAR(20),
    PRIMARY KEY (prod_code),
    CONSTRAINT LINEPRODUCT_FK FOREIGN KEY (LIN_ID) REFERENCES line(LIN_ID)
    
);

INSERT INTO product(prod_code,LIN_ID,prod_descript,prod_date,prod_price,prod_on_hand)
VALUES
	(25595,1011,'Power painter 15 psi. 3-nozzle','2007-11-07',109.99,8);

INSERT INTO product(prod_code,LIN_ID,prod_descript,prod_date,prod_price,prod_on_hand)
VALUES
	(21344,1031,'7.25-cm. pwr. saw blade','2007-12-14',14.99,32);

INSERT INTO product(prod_code,LIN_ID,prod_descript,prod_date,prod_price,prod_on_hand)
VALUES
	(26744,1022,'9.00-cm. pwr. saw blade','2007-11-13',17.49,15);


CREATE TABLE vendor(
	vend_code INT AUTO_INCREMENT NOT NULL,
    emp_num INT,
    vend_company VARCHAR(75),
	vend_contact VARCHAR(75),
	vend_areacode char(5),
	vend_phone char(10),
    PRIMARY KEY (vend_code),
    CONSTRAINT EMPLOYEE_FK FOREIGN KEY (emp_num) REFERENCES employees(emp_num)
);

INSERT INTO vendor(vend_code,emp_num,vend_company,vend_contact,vend_areacode,vend_phone)
VALUE
	(21225,101,'Bryson. Inc.','Smithson','0181','223-3234');

INSERT INTO vendor(vend_code,emp_num,vend_company,vend_contact,vend_areacode,vend_phone)
VALUE
	(21226,102,'SuperLoo. Inc.','Flushing','0113','215-8995');

INSERT INTO vendor(vend_code,emp_num,vend_company,vend_contact,vend_areacode,vend_phone)
VALUE
	(21231,103,'D\&E Supply','Singh','0181','228-3245');
    

select * from vendor;

