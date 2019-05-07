-- 1:buið
-- Notiðselect skipun til að skila fjölda undirskóla Tækniskólans.

select count(heiti)
from Undirskolar;

-- 2:buið
-- hver er meðaleinkunn allra nemenda sem fengið hafa einkunn
select sum(einkunn)
from Nemendaskraning;


-- 3: buið
-- veljið fjölda einkunna sem eru á bilinu 5 - 8
select * from Nemendaskraning
where einkunn BETWEEN 5 AND 8;

-- 4: buið
-- veljið alla nemendur(nemandiID) sem eru í námi(hafa ekki fengið einkunn)
-- birtið hvert nemenda ID aðeins einu sinni +i niðurstöðunum

select distinct NemandiID from Nemendaskraning
where einkunn IS null;


-- 5: buinn
-- sækið númer og heiti allra áfanga sem byrja á bókstafnum E
-- hér má nota annað hvort áfanga númerið eða áfanga heitið!

select * from Nemendaskraning
where afangaNumer LIKE 'e%';

-- 6:buinn
-- Gefnir eru eftirfarandi áfangar sem kenndir eru í rafiðnaðarskólanum
-- SKYN2SE01AT - Skyndihjálp  		önn 1
-- RAFL1GA03AR - Raflagnir 1  		önn 1
-- RAFL1GA03BR - Raflagnir 2		önn 2
-- RAFM1GA05AR - Rafmagnsfræði 1	önn 2
-- Áfangarnir eru 5 einingar nema Skyndihjálp sem gefur eina einingu.

-- 6a:buinn
-- skráið þessa áfanga í gagnagrunninn.


-- insert into AfangaFrambod(brautarNumer,afangaNumer,onnAfanga,skylda)
--      (7,'SKYN2SE01AT',1,false),
 --     (10,'RAFL1GA03AR',1,false),
--      (10,'RAFL1GA03BR',2,false),
--      (10,'RAFM1GA05AR',3,false);



-- 6b:buinn
-- Þessir áfagnar eru kenndir í grunnnámi rafiðna sem er braut innan Raftækniskólans.
-- Skráðið þessa braut í grunninn.

-- insert into Undirskolar(heiti,skolaNumer)values('Raftækniskólinn',1);

-- 6c:buinn
-- Setjið þessa áfanga í framboð á nýju brautinni(Gunnnám rafiðna) með því að skrá 
-- viðeigandi upplýsingar í töfluna Afangaframboð.

-- insert into Afangar(afangaNumer,afangaHeiti)values('SKYN2SE01AT','Skyndihjálp');
-- insert into Afangar(afangaNumer,afangaHeiti)values('RAFL1GA03AR','Raflagnir 1');
-- insert into Afangar(afangaNumer,afangaHeiti)values('RAFL1GA03BR','Raflagnir 2');
-- insert into Afangar(afangaNumer,afangaHeiti)values('RAFM1GA05AR','Rafmagnsfræði 1');

-- 7:BUINN
-- veljið allar upplýsingar um alla áfanga úr Afangatöflunni NEMA eftirfarandi:
-- DANS2BM05AT
-- ÍÞRÓ1GH02AT
-- MENL1AL05AT
-- STÆR4HT05FT

select * from Afangar
where not afangaNumer = 'DANS2BM05AT' and not afangaNumer = 'ÍÞRÓ1GH02AT' and not afangaNumer = 'MENL1AL05AT' and not afangaNumer = 'STÆR4HT05FT';


-- 8:buinn
-- veljið meðaleinkunn á hvern áfanga. Birtið áhanganúmerið ásamt meðaleinkunn:

select sum(einkunn), afangaNumer
from Nemendaskraning
group by afangaNumer;


-- 9: buinn
-- Veljð nú meðaleinkunn hvers nemanda(nemandiID) og rúnnið einkunnina af uppá einn aukastaf( td: 8.5000 verður 9.0 en 8.4000 verður 8.0)
-- Takið aðeins einkunnir +afanga sem er lokið(ekki null)
-- https://www.w3schools.com/sql/func_mysql_round.asp

select nemandiID, sum(einkunn), round(einkunn, 1) as roundedeinkunn
from Nemendaskraning
where einkunn is not null
group by nemandiID;


-- 10: buinn
-- Hvað eru margir skylduáfangar áætlaðir á hverja önn á tölvubraut(brautarnúmer 7). 
-- Birtið bæði númer viðkomandi annar og fjölda skylduáfanga:

select count(skylda), brautarNumer from AfangaFrambod
where skylda = TRUE
group by brautarNumer;