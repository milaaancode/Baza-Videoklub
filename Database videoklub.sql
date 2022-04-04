create database VideoKlub;

go

use VideoKlub;

go

create table mesto
(
ptt bigint not null primary key,
naziv varchar(30) not null
);

go

create table clan
(
brclkarte int not null primary key,
prezime varchar(30) not null,
ime varchar(30) not null,
brlk bigint not null,
ulicaibroj varchar(30) not null,
ptt bigint not null
);

go

create table film
(
idfilma int not null primary key,
naziv varchar(30) not null,
zanr varchar(30) not null,
reziser varchar(30) null,
godina int null
);

go

create table iznajmljuje
(
idfilma int not null,
brclkarte int not null,
datumizdavanja datetime not null,
datumvracanja datetime null
);

go

alter table iznajmljuje
add constraint pk_iznajmljuje primary key
(
idfilma,
brclkarte
);

go
create table glumac
(
idglumca int identity(1,1) not null primary key,
prezime varchar(30) not null,
ime varchar(30) not null,
vrstauloge varchar(20) null,
);

go

create table glumi
(
idfilma int not null,
idglumca int not null,
);

go

alter table glumi
add constraint pk_glumi primary key
(
idfilma,
idglumca
);

go

alter table clan
add constraint fk_clan foreign key (ptt) references mesto(ptt);

go

alter table glumi
add constraint fk_glumi foreign key (idfilma) references film(idfilma);

go

alter table glumi
add constraint fk_glumiglumac foreign key (idglumca) references glumac(idglumca);

go

alter table iznajmljuje
add constraint fk_iznajmljujefilm foreign key (idfilma) references film(idfilma);

go

alter table iznajmljuje
add constraint fk_iznajmljujeclan foreign key (brclkarte) references clan(brclkarte);

go



Insert into Mesto
Values (23000, 'Zrenjanin')

go

Insert into Clan
Values (1, 'Perić', 'Pera', 223432, 'Pančevačka 78', 23000)

Insert into Clan
Values (2, 'Simić', 'Sima', 788211, 'Banatska 18c', 23000)

Insert into Clan
Values (3, 'Kukić', 'Ana', 342321, 'Bašaidska 3', 23000)

Insert into Clan
Values (4, 'Djukić', 'Djordje', 342321, 'Bačka 124', 23000)

go

Insert into Film
Values (1, 'Pisma sa Iwo Jime', 'ratni', 'Klint Istvud', 2006)

Insert into Film
Values (2, 'Zastave naših očeva', 'ratni', 'Klint Istvud', 2006)

Insert into Film
Values (3, 'Gladijator', 'istorijski', 'Ridli Skot', 2000)

Insert into Film
Values (4, 'Titanik', 'drama', 'Dzejms Kamerun', 1998)

Insert into Film
Values (5, 'Beogradski fantom', 'drama', 'Jovan Todorovic', 2009)

Insert into Film
Values (6, 'Wicker park', 'triler', 'Paul McGuigan', 2004)

Insert into Film
Values (7, 'Troja', 'akcioni', 'Paul McGuigan', 2004)

Insert into Film
Values (8, 'Forest Gamp', 'komedija', 'Robert Zemeckis', 1994)

Insert into Film
Values (9, 'Gremlini', 'komedija', 'Robert Zemeckis', 1984)


Insert into Film
Values (10, 'Rat zvezda – nova nada', 'sf', 'George Lucas', 1977)

go

Insert into Glumac
Values ('Krou', 'Rasel', null)

Insert into Glumac
Values ('Feniks', 'Zoakin', null)

Insert into Glumac
Values ('Di Kaprio', 'Leonardo', null)

Insert into Glumac
Values ('Živić', 'Marko', null)

Insert into Glumac
Values ('Milošević', 'Milutin', null)

Insert into Glumac
Values ('Hartnet', 'Džoš', null)

Insert into Glumac
Values ('Kruger', 'Diane', null)

Insert into Glumac
Values ('Vatanabe', 'Ken', null)

Insert into Glumac
Values ('Filip', 'Rajan', null)

Insert into Glumac
Values ('Tom', 'Hanks', null)


go

Insert into Glumi
Values (3,1)

Insert into Glumi
Values (3,2)

Insert into Glumi
Values (4,3)

Insert into Glumi
Values (5,4)

Insert into Glumi
Values (5,5)

Insert into Glumi
Values (6,6)

Insert into Glumi
Values (6,7)

Insert into Glumi
Values (7,7)

Insert into Glumi
Values (1,8)

Insert into Glumi
Values (2,9)

Insert into Glumi
Values (8,10)


go

Insert into Iznajmljuje
Values (1, 1, '2/2/2010', '2/3/2010')

Insert into Iznajmljuje
Values (2, 1, '2/2/2010', null)

Insert into Iznajmljuje
Values (3, 2, '3/3/2010', null)

Insert into Iznajmljuje
Values (1, 3, '3/3/2010', null)

Insert into Iznajmljuje
Values (1, 4, '3/3/2010', null)

Insert into Iznajmljuje
Values (8, 4, '3/3/2010', '3/4/2010')

Insert into Iznajmljuje
Values (7, 4, '3/4/2010', null)

Insert into Iznajmljuje
Values (8, 3, '3/3/2010', null)

go



SELECT * FROM clan
SELECT * FROM film
SELECT * FROM glumac
SELECT * FROM glumi
SELECT * FROM iznajmljuje

--POD A
SELECT IME,COUNT(IME) as [BROJ FILMOVA] FROM GLUMAC INNER JOIN  GLUMI G ON GLUMAC.IDGLUMCA=G.IDFILMA 
LEFT JOIN FILM F ON G.idfilma = F.idfilma INNER JOIN iznajmljuje I ON F.idfilma = I.idfilma GROUP BY
IME

--POD B
SELECT NAZIV FROM FILM WHERE GODINA BETWEEN 2005 AND 2010