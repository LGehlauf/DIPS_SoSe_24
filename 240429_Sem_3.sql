--3. Seminar; 29.04.2024


--2.1.1
select * from M

insert into M (enr, bezeichnung, sitz)
values ('E8', 'Prado', 'Madrid')

select * from M


--2.1.2
select * from B order by Titel

insert into B (bnr, titel, knr)
values ('B17', 'Pfeile ohne Landschaft', 'K2')

select * from B order by wert


--2.2.1
select * from M

delete from M

select * from M


--2.2.2
select * from k 
where k.knr not in (
	select distinct k.knr from k
	right join b
	on b.knr = k.knr
	where b.knr is not null)

delete from k
where k.knr not in (
	select distinct k.knr from k
	right join b
	on b.knr = k.knr
	where b.knr is not null)

select * from k


--2.3.1
CREATE TABLE W(
KNR varchar,
Maler varchar,
AnzahlBilder int
)

select * from w

--2.3.2
select k.name, b.knr, count(*) as Bildercount from b
join k on k.knr = b.knr
where b.knr is not null
group by k.name, b.knr

insert into w (knr, maler, anzahlbilder)
select k.name, b.knr, count(*) as Bildercount from b
join k on k.knr = b.knr
where b.knr is not null
group by k.name, b.knr

select * from w

--2.4.1
select * from k where k.name = 'Endler'

update k set tod = 1999
where k.name = 'Endler'

select * from k where k.name = 'Endler'


--2.4.2
SELECT Wert FROM B WHERE KNR = (SELECT KNR FROM K WHERE Name='Endler')

update b set wert = (3 * wert)
where (KNR = (SELECT KNR FROM K WHERE Name='Endler'))

SELECT Wert FROM B WHERE KNR = (SELECT KNR FROM K WHERE Name='Endler')


--2.5.1
drop table w

select * from w

