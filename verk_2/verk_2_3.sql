drop database if exists 2611982589_TheFirm;
create database 2611982589_TheFirm;
use 2611982589_TheFirm;


create table Firm
(
	firmID int primary key,
    c_name char(75),
		postalcode int,
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
    worksIn int references FirmDivisions(divisionID)    
);

CREATE TABLE contacts
(
	staffName int primary key,
    vinnusimi char(10),
    gemsi char(10),
    heimasimi char(10),
    constraint staff_fk foreign key (staffID) references Staff(staffID)
);

CREATE TABLE PostalCode
(
	zipCode int primary key,
    city varchar(75)
);