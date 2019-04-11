drop database if exists TheFirm;
create database TheFirm;
use TheFirm;


create table Firm
(
	firmID int primary key,
    c_name char(75),
	postalcode int,
    Email varchar(125),
    CEO varchar(75),
    companySlogan varchar(75),
    constraint postalcode_fk foreign key (zipCode) REFERENCES PostalCode(zipCode),
    constraint contact_fk foreign key (c_name) REFERENCES contacts(c_name)
);

insert into Firm (firmID, c_name, postalcode, Email, CEO, companySlogan)
values (101,'johnny cash',202,'companysupport@gmail.com','Stoner weed','we make things so you dont have to');

create table FirmDivisions
(
	divisionID int primary key,
    divName varchar(75),
    staffID int,
    ProductsNumbers int,
    divisionManager varchar(75),
    firmID int,
    constraint firm_fk foreign key (firmID) references Firm(firmID),
    constraint product_fk foreign key (ProductsNumbers) references Products(ProductsNumbers)
);

insert into firmDivisions (divisionID, divName,staffID,productsNumber,divisionManager,firmID)
values (1001,'the A-team',1021,141,'Mr T',101);

insert into firmDivisions (divisionID, divName,staffID,productsNumber,divisionManager,firmID)
values (1002,'the B-team',1034,141,'Mr B',101);

insert into firmDivisions (divisionID, divName,staffID,productsNumber,divisionManager,firmID)
values (1003,'task force who cares',1454,157,'sylvester stylone',101);

insert into firmDivisions (divisionID, divName,staffID,productsNumber,divisionManager,firmID)
values (1004,'we dont care',1654,157,'commander cobra',101);

insert into firmDivisions (divisionID, divName,staffID,productsNumber,divisionManager,firmID)
values (1005,'Garry and co',1376,345,'Garry Colman',101);

create table Products
(
	productNumber int primary key,
    prodName varchar(55),
    timeOfProduction date,
    recommendedSalesPrice int
);

insert into products (productNumber,pordName,timeofporduction,recommendedSalePrice)
values (141,'compute screen','2018-03-24',299.99);

insert into products (productNumber,pordName,timeofporduction,recommendedSalePrice)
values (157,'razer mouse','2018-06-25',99.99);

insert into products (productNumber,pordName,timeofporduction,recommendedSalePrice)
values (345,'laptop','2019-02-23',599.99);

create table Staff
(
	staffID int primary key,
    divisionID int,
    staffName varchar(75),
    jobTitle varchar(55),
    jobPhone char(10),
    homePhone char(10),
    mobilePhone char(10),
    worksIN int,
    constraint division_fk foreign key (divisionID) references FirmDivisions(divisionID)    
);

insert into Staff (staffID,divisionID,staffName,jobTitle,jobPhone,homePhone,mobilePhone,worksIN)
values (1021,1001,'Harold','Mr T assistant','5675-7895','6543-7891','8976-5432',,);

insert into Staff (staffID,divisionID,staffName,jobTitle,jobPhone,homePhone,mobilePhone,worksIN)
values (1034,1002,'Stan','head in enginering','5435-3442','5402-0987','8765-3498',,);

insert into Staff (staffID,divisionID,staffName,jobTitle,jobPhone,homePhone,mobilePhone,worksIN)
values (1454,1003,'Dan','Mr B assistant','5234-4567','5987-6786','8345-4321',,);

insert into Staff (staffID,divisionID,staffName,jobTitle,jobPhone,homePhone,mobilePhone,worksIN)
values (1654,1004,'Ban','he dosent even know','5987-1234','5006-5987','8923-6543',,);

insert into Staff (staffID,divisionID,staffName,jobTitle,jobPhone,homePhone,mobilePhone,worksIN)
values (1376,1005,'Fan','lobby advisor','5463-7281','5895-6766','8153-5432',,);

CREATE TABLE contacts
(
	c_name char(32) primary key,
    homePhone char(10),
    jobPhone char(10),
    mobilePhone char(10)
);
insert into (c_name,homePhone,jobPhone,mobilePhone)
values ('johnny cash','5789-4536','5968-8973','8976-3322');

insert into (c_name,homePhone,jobPhone,mobilePhone)
values ('john walters','5749-4798','5788-8976','8456-3562');

insert into (c_name,homePhone,jobPhone,mobilePhone)
values ('larry stone','5259-4676','5608-8073','8346-3982');

CREATE TABLE PostalCode
(
	zipCode int primary key,
    city varchar(75)
);

insert into PostalCode (Zipcode,city)
values (202,'Boston');