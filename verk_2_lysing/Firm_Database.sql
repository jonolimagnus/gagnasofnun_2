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
    constraint postalcode_fk foreign key (zipCode) REFERENCES PostalCode(zipCode),
    constraint contact_fk foreign key (c_name) REFERENCES contacts(c_name)
);

create table FirmDivisions
(
	divisionID int primary key,
    divNAme varchar(75),
    staff int,
    ProductsNumbers text,
    divisionManager varchar(75),
    firmID int references FirmInfo(firmID),
    constraint product_fk foreign key (ProductsNumbers) references Products(ProductsNumbers)
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
    divisionID int,
    staffName varchar(75),
    jobTitle varchar(55),
    jobPhone char(10),
    homePhone char(10),
    mobilePhone char(10),
    worksIn int,
    constraint division_fk foreign key (divisionID) references FirmDivisions(divisionID)    
);

CREATE TABLE contacts
(
	c_name int primary key,
    telephone_1 char(10),
    telephone_2 char(10),
);

CREATE TABLE PostalCode
(
	zipCode int primary key,
    city varchar(75)
);