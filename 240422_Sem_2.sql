-- Seminar vom 22.04.2024

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
select b.knr, g.bezeichnung as galerie, g.sitz from b,g


select * from m


--2.1.3
select b.bnr, b.titel from b
where bnr = 'B1' or b.jahr > 1



--2.1.4
select g.enr, g.bezeichnung, g.sitz, k.name as maler from g
join k
on g.bezeichnung = 'Galerie Villon' 
join b
on b.bnr = 'E6'

