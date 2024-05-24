-- 2.Seminar, 22.04.2024

select * from g 
union
select * from m

-- JOIN implizit
select g.Bezeichnung as Galerie, m.bezeichnung as Museum, g.sitz as Sitz
from g, m
where g.sitz = m.sitz


-- JOIN explizit
select Titel, Name
from b 
join k on b.knr = k.knr

select *
from b
left join m on b.enr = m.enr

select b.titel, b.jahr, b.wert, b.enr, e.bezeichnung, e.sitz
from b left join (
select * from m 
union 
select * from g
) as e
on b.enr = e.enr

-- ALL ANY
select Bezeichnung
from m
where m.enr != all(select b.enr from b)


--exists
select Bezeichnung
from m
where exists
(select enr from b where m.enr = b.enr)


--1.1.1
select g.bezeichnung, g.sitz from g
union
select m.bezeichnung, m.sitz from m

--1.1.2
select m.enr from m
except
select b.enr from b

--2.1.1
select b.titel, k.name from b
join
k
on b.knr = k.knr

--2.1.2
select k.name, g.bezeichnung as galerie, g.sitz from g
join b on b.enr = g.enr
join k on k.knr = b.knr
where b.wert > 200 and k.tod isnull

--2.1.3
select L.bnr, L.titel from b L, b R
where L.jahr = R.jahr and L.bnr = 'B1'

--2.1.4
select bR.enr, g.bezeichnung, g.sitz, k.name from b bL, b bR
join k on bR.knr = k.knr
join g on g.enr = bR.enr
--where g.bezeichnung = 'Galerie Villon' or bL.titel = bR.titel


select b.enr, gL.bezeichnung, gL.sitz, k.name from g gL, g gR
join b on b.enr = gR.enr
join k on b.knr = k.knr

--2.1.4
select g.enr, g.bezeichnung, g.sitz, k.name as maler from g
join k
on g.bezeichnung = 'Galerie Villon' 
join b
on b.bnr = 'E6'


--2.1.4
select distinct u.*, k.name, bild1.titel
from g u, g v, k, b bild1
where u.bezeichnung = 'Galerie Villon'

select * from b
where enr='E6'

select * from k where knr = 'K2' or knr = 'K5'


--....