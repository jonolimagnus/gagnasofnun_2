-- ------------------
-- 1: buinn
-- Sækja nemendur sem fæddir eru á milli 1998 og 2000, bæði árin meðtalin.
-- Setjið fornafn og eftirnafn saman með concat() fallinu.
-- Birtið allar upplýsingar um nemendurna og raðið niðurstöðum eftir fæðingardegi, þeir yngstu fyrst.
-- ------------------

SELECT sum(faedingardagur) FROM Nemendur
where faedingardagur between '1998-00-00' and '2000-12-31';

select concat(fornafn,' ',eftirnafn) AS nafn
from Nemendur;

select * from Nemendur
order by faedingardagur asc;

-- ------------------
-- 2:buinn
-- í töflunni Undanfarar er dálkurinn tegund sem er af taginu char(1).
-- Þessi dálkur er notaður til að geyma hverskonar undanfari er á ferðinni:
-- Ef skoðuð er create table skipunin fyrir töfluna Undanfarar þá er þar 
-- eftirfarandi komment:
-- 1 = undanfari, 2 = má taka með, 3 = verður að taka með.
-- veljið undanfaraNumer og afangaNumer og notið case skipunina til að breyta
-- tegund í viðeigandi heiti þannig að:
-- '1' verði að "Undanfari", 
-- '2' verði að "Má taka með"
-- '3' verði Bundin "Verður að taka með"
-- ------------------

select undanfaraNumer, afangaNumer,
case
	when tegund = 1 then 'undanfari'
    when tegund = 2 then 'má taka með'
    when tegund = 3 then 'veður að taka með'
    else 'er ekki undanfari'
end as undanfarir
from Undanfarar;

-- ------------------
-- 3: buið
-- þegar select skipunin úr lið 2 er keyrð fást eftirfarandi niðurstöður
-- ef verið er að nota upphaflegu gögnin í námsferils grunninum:
-- 
-- undanfaraNumer	afangaNumer		tegund   
-- 1-GAGN2HS05BU  	6-GAGN1NG05AU  	Undanfari
-- 3-GAGN2VG05CU  	5-GAGN2HS05BU  	Undanfari
-- 4-GAGN3GS05DU  	2-GAGN2VG05CU  	Má taka með

-- Þar er ljóst að gerð hafa verið mistök þegar þessi gögn voru sett í grunninn 
-- vegna þess að þau gögn sem eru í dálknum afangaNumer eiga að vera í dálknum
-- undanfaraNumer og öfugt.
-- Lagfærið þetta með update skipunum
-- ------------------


update Undanfarar
set undanfaraNumer = 'GAGN1NG05AU' where undanfaraNumer = 'GAGN2HS05BU';

update Undanfarar
set afangaNumer = 'GAGN3GS05DU' where  afangaNumer = 'GAGN2VG05CU';

update Undanfarar
set undanfaraNumer = 'GAGN2HS05BU' where undanfaraNumer = 'GAGN2VG05CU';

update Undanfarar
set undanfaraNumer = 'GAGN2VG05CU' where undanfaraNumer = 'GAGN3GS05DU';

update Undanfarar
set afangaNumer = 'GAGN2VG05CU' where  afangaNumer = 'GAGN2HS05BU';

update Undanfarar
set afangaNumer ='GAGN2HS05BU' where afangaNumer = 'GAGN1NG05AU';




-- ------------------
-- 4: buið
-- Þegar nemandi skráir sig í áfanga úthlutar kerfið svokölluðu skráningarnúmeri. 
-- Í þessari fyrirspurn þarf að skoða heiti þeirra áfanga sem hafa slíkt númer.
-- Ekki er þörf á að birta áfanganúmer heldur aðeins áfangaheiti og skráninganúmerið.
-- ------------------
select count(afangaNumer) from Nemendaskraning
where afangaNumer like 'ENSK2AE05AT';

select Afangar.afangaHeiti, Nemendaskraning.nemandiID
from Afangar
inner join Nemendaskraning on Nemendaskraning.afangaNumer = Afangar.afangaNumer
left join nemendur on Nemendaskraning.nemandiID = Nemendur.nemandiID
order by Afangar.afangaNumer;

-- select concat(afangaHeiti, " ", Nemendaskraning.nemandiID) as heiti
-- from Afangar, Nemendaskraning
-- inner join nemendur on Nemendaskraning.nemandiID = Nemendur.nemandiID;

-- ------------------
-- 5: ekki buið
-- Notið select skipun með case - when útfærslu til að finna út hvort einhver nemandi skráðir sig í 
-- áfanga á afmælsidaginn sinn. 
-- Hér verið þið að nota fæðingardaginn og mánuðinn ekki árið!
-- ------------------

select nemandiID,
case
	when 
end
from nemendaskraning;

-- ------------------
-- 6:
-- Eins og þið hafið komist að þá er enginn nemandi sem hefur skráð sig í áfanga á afmælisdaginn(miðað við original gögnin).
-- Til að geta prófað þetta þarf að breyta a.m.k. einni færslu í töflunni Nemendaskraning, þannig 
-- að viðkomandi hafi skráð sig á afmælisdeginum. Það er nóg að breyta einni skráningu!
-- ------------------



-- ------------------
-- 7: buið
-- Notið staðgengla til að birta upplýsingar um áfanga og undanfara þeirra.
-- Birtið áfagnanúmerið, áfangaheitið, undanfaranúmerið, undanfarheitið' og tegund undanfara(það nægir að nota 1, 2 eða 3)
-- ------------------
select Afangar.afangaNumer, Afangar.afangaHeiti, undanfarar.undanfaraNumer, undanfarar.afangaNumer, undanfarar.tegund
from Afangar
inner join undanfarar on Afangar.afangaNumer = undanfarar.undanfaraNumer;
-- where 

-- ------------------
-- 8: buið
-- Útfærið fyrirspurnina úr lið 7 þannig að birtar séu upplýsingar um alla áfanga óháð því 
-- hvort þeir eru með undanfara eða ekki.
-- ------------------

select Afangar.afangaNumer, Afangar.afangaHeiti, undanfarar.undanfaraNumer, undanfarar.afangaNumer, undanfarar.tegund
from Afangar
left outer join undanfarar on Afangar.afangaNumer = undanfarar.undanfaraNumer;


-- ------------------
-- 9: buið
-- Bætið nú fyrirspurn 7 þannig að í stað 1, 2 og 3 fyrir tegund komi sami texti og í lið 2.
-- ------------------

select *,
case
	when tegund = 1 then 'undanfari'
    when tegund = 2 then 'má taka með'
    when tegund = 3 then 'veður að taka með'
    else 'er ekki undanfari'
end as undanfarir
from Afangar, Undanfarar
where Afangar.afangaNumer = undanfarar.undanfaraNumer;
 


-- ------------------
-- 10:buið
-- Veljið upplýsingar um nemendur sem hafa valið áfanga sem er undanfari.
-- Birtið nemanda ID, fornafn og eftirnafn samsett með concat() fallinu og undanfaranúmerið!
-- ------------------

select undanfaraNumer, concat(fornafn, " ",eftirnafn, " ", nemendur.nemandiID) as nemandi
from Nemendaskraning, nemendur, undanfarar
where Nemendaskraning.nemandiID = nemendur.nemandiID;



