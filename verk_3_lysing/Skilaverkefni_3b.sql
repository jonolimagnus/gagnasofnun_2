-- 1:
-- Sækið upplýsingar um alla áfanga sem í boði eru óháð brautum.
-- Birtið áfanganúmer, áfangaheiti, einingafjölda, önn áfangans og 
-- hvort áfanginn er skylda eða ekki.
-- AHT: Hér þarf að nota inner join

select * from Afangar;


-- 2:buinn
-- Sækið upplýsingar um alla skylduáfanga sem skráðir eru í grunninn.
-- Birtið áfanganúmer, áfangaheiti og önn áfangans. Raðið eftir önn 
-- áfangans 

select * 
from AfangaFrambod
where skylda like true
order by onnAfanga;


-- 3:buinn
-- Sækið úr töflunni Nemendaskraning upplýsingar um alla nemendur 
-- sem eru í eða hafa tekið áfangann STÆR2BR05AT
-- birtið nemanda númer(ID),fornafn og eftirnafn.
-- ATH: Hér þarf að nota subquery

select nemandiID, fornafn, eftirnafn from Nemendur
where nemandiID in (select nemandiID from Nemendaskraning where afangaNumer like 'STÆR2BR05AT');


-- 4:buinn
-- Sækið allar eikunnir nemenda sem eru lægri en 
-- meðaleiknunn(allra áfanga)
-- birtið nemanda ID, áfanganúmer og einkunn

select nemandiID, afangaNumer, einkunn from Nemendaskraning
where einkunn < 4 or einkunn is null;


-- 5:
-- Sækið alla áfanga sem eru í framboði á brautum skólans.
-- birtið heiti undirskóla, heiti brautar, áfanganúmer og önn áfanga.
-- Gæti verið kúl að raða eftir undirskólum og svo á hvaða önn 
-- áfangarnir eru!
-- ATH: Töflur sem þarf að nota eru: Undirskolar, Brautir, Afangaframboð.

select * from Undirskolar, Brautir, AfangaFrambod;

