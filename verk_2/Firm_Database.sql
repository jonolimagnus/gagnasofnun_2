drop database if exists TheFirm;
create database TheFirm;
use TheFirm;


create table Firm
(
	firmID int primary key,
    c_name char(75),
    telephone_1 char(10),
    telephone_2 char(10),
    Email varchar(125),
    CEO varchar(75),
    companySlogan char(25),
    constraint postalcode_fk foreign key (zipCode) REFERENCES PostalCode(zipCode)
);

create table FirmDivisions
(
	divisionID int primary key,
    divNAme varchar(75),
    staff int,
    ProductsNumbers text,
    divisionManager varchar(75),
    firmID int references FirmInfo(firmID)
);

create table Products
(
	productNumber char(6) primary key,
    prodName varchar(55),
    timeOfProduction float,
    recommendedSalesPrice int
);

create table Staff
(
	staffID int primary key,
    staffName varchar(75),
    jobTitle varchar(55),
    jobPhone char(10),
    homePhone char(10),
    mobilePhone char(10),
    worksIn int references FirmDivisions(divisionID)    
);

CREATE TABLE PostalCode
(
	zipCode int primary key,
    city varchar(75)
);