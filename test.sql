delimiter $$
drop procedure if exists nyrAfangi $$

create procedure nyrAfangi
(
	afanga_numer char(15),
	a_heiti varchar(75),
	a_eining tinyint
)
begin
	 insert into Afangar(afangaNumer,afangaHeiti,einingar)
	 values(afanga_numer,a_heiti,a_eining);
     
     select row_count();
end $$

-- select * from afangar$$

delimiter ;

call nyrAfangar('RAES05FU','Ræsingafræði IV',10);

select * from Afangar where afangaNumer like 'RA%';

-- select * from afangar;