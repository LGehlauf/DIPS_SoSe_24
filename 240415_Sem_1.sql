--1.1.1
select knr, name, geburt, geb_ort, tod
from k

--1.1.2
select bezeichnung, sitz
from m 

--1.1.3
select sitz as orte
from m

--1.2.1
select avg(wert)
from b 

--1.2.2
select count(sitz) as anzahl
from m

--1.3.1
select bnr, titel, wert
from b
where wert > 1000

--1.3.2
select *
from k 
where (tod - geburt) > 100

--1.3.3
select *
from b 
where wert > 700 and wert < 1000

--1.3.4
select * from k 
where tod isnull

--1.3.5
select name, geburt, tod from k
where geb_ort = 'Paris' and geburt > 1699 and geburt < 1800

--1.3.6
select bnr, titel, jahr, wert, knr, enr from b
where titel like '%landschaft%' or titel like '%Landschaft%'

--1.4.1
select bezeichnung from g
where sitz in ('Berlin', 'Paris')

--2.1.1 
select name, geburt from k
order by name

--2.2.1
select count(sitz), sitz from g
group by sitz

--2.2.2
select enr, count(enr) as anzahl, sum(wert) as gesamtwert
from b
group by enr
order by gesamtwert desc

--2.3.1
select sitz from g
group by sitz
having count(sitz) > 1

--3.1.1
select bezeichnung, sitz from g
union
select bezeichnung, sitz from m

--3.1.2
select enr from m
except
select enr from b

