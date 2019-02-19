CREATE DATABASE verk_2
USE verk_2

CREATE TABLE stafsmenn(
	id INT PRIMARY KEY,
    nafn_f CHAR(20),
    nafn_e CHAR(20),
    psotnum int,
    sveitafel varchar(29),
);

CREATE TABLE born(
	barn_id INT AUTO_INCREMENT PRIMARY KEY,
    nafn VARCHAR(30)
    dob date,
    foreldri_id INT,
    CONSTRAINT barn_id,foreldri_id FOREIGN KEY folredri_id REFERENCES starsmenn
);

INSERT INTO starfsmenn(staff_id,nafn_f,nafn_e)
VALUES
	();
    
INSERT INTO born(barn_id,dob,)
VALUES
	();
SELECT starfsmenn.nafn,born.nafn,born.dob
FROM starfsmenn
INNER JOIN born ON starfsmenn.id = born.foreldri_id;