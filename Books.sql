create database Books;
use Books;

create table Autori (
ID_autori int not null auto_increment primary key,
Nume_autor varchar (20) not null,
Prenume_autor varchar (20) not null);

insert into Autori (Nume_autor, Prenume_autor)
values ('Hill', 'Napoleon'),
	   ('Batchelor', 'Doug'),
       ('Riordan', 'Rick'),
       ('Dostoievschi', 'Feodor'),
       ('Aristocles', 'Platon'),
       ('Kwik', 'Jim'),
       ('Einat', 'Nathan'),
       ('Dobson', 'James'),
       ('Shetty', 'Jay'),
       ('Kiyosaki', 'Robert');
       
select *from Autori;

create table Edituri
(ID_editura int not null auto_increment primary key,
Nume_editura varchar (50)
);

insert into Edituri (Nume_editura)
values ('Curtea Veche'),
		('Litera'),
        ('Imago Dei'),
        ('Lifestyle'),
        ('Editura pentru literatura universala'),
        ('IRI'),
        ('Arthur'),
        ('Viata si sanatate'),
        ('Librex');
        
select *from Edituri;

create table Gen_carti 
(ID_gen int not null auto_increment primary key,
Nume_categorie varchar (30)
);

insert into Gen_carti (Nume_categorie)
values ('Literatura clasica'),
		('Dezvoltare personala'),
        ('Parenting'),
        ('Autobiografie'),
        ('Fantasy'),
        ('Filosofie'),
		('Psihologie practica');
		
select *from Gen_carti;       
 

create table Carti 
(ID_carte int not null auto_increment primary key,
Titlu varchar (50),
An_publicare date not null,
ID_editura int not null,
ID_gen int not null,
constraint fk_Carti_Edituri foreign key (ID_editura) references Edituri (ID_editura),
constraint fk_Carti_Gen_carti foreign key (ID_gen) references Gen_carti (ID_gen)
);

insert into Carti (Titlu, An_publicare, ID_editura, ID_gen)
values ('Crima si pedeapsa', 2022, 2, 1),
		('Adolescentul', 1957, 5, 1),
        ('Fara limite', 2021, 4, 2),
        ('Baietii, cum sa-i crestem', 2010, 3, 3),
        ('Indrazneste sa disciplinezi', 2010, 3, 3),
        ('Tot ce am mai drag', 2022, 1, 3),
        ('Cel mai bogat on din pestera', 2013, 8, 4),
        ('Tata bogat, tata sarac', 2019, 1, 2),
        ('Gandeste ca un calugar', 2020, 2, 2),
        ('Eroul pierdut', 2021, 7, 5),
        ('Dialoguri', 1998, 6, 6),
        ('Gandeste si vei fi bogat', 2023, 9, 7);
        
drop table Carti;

create table Carti 
(ID_carte int not null auto_increment primary key,
Titlu varchar (50),
An_publicare int not null,
ID_editura int not null,
ID_gen int not null,
constraint fk_Carti_Edituri foreign key (ID_editura) references Edituri (ID_editura),
constraint fk_Carti_Gen_carti foreign key (ID_gen) references Gen_carti (ID_gen)
);

select *from Carti;

create table Autor_carti
(ID_autori int not null,
ID_carte int not null,
constraint fk_Autor_carti_Autori foreign key (ID_autori) references Autori(ID_autori),
constraint fk_Autor_carti_Carti foreign key (ID_carte) references Carti(ID_carte)
);

insert into Autor_carti (ID_autori, ID_carte)
values (1, 12),
		(2, 7),
        (3, 10),
        (4, 1),
        (5, 11),
        (6, 3),
        (7, 6),
        (8, 4),
        (9, 9),
        (10, 8),
        (4, 2),
        (8, 5);
        
select *from Autor_carti;


select *from carti inner join edituri on carti.ID_editura = edituri.ID_editura;

select *from  carti left join edituri on carti.ID_editura = edituri.ID_editura;

select *from  carti left join edituri on carti.ID_editura = edituri.ID_editura where edituri.ID_editura is null;

select *from  carti left join edituri on carti.ID_editura = edituri.ID_editura where edituri.ID_editura is not null;


select *from carti right join edituri on carti.ID_editura = edituri.ID_editura;

select *from  edituri where Nume_editura = 'Imago Dei';

select *from  carti left join edituri on carti.ID_editura = edituri.ID_editura where Nume_editura = 'Imago Dei';

select *from Autori where Nume_autor like '%r%';


select *from carti where An_publicare like '2%' and Titlu like '%e%';

select *from carti where not ID_gen = '1' and not ID_gen = '7';

select min(An_publicare) from carti;
select count(*) from carti;

select *from Carti group by Titlu, An_publicare;


select min(An_publicare), ID_editura -- am selectat in functie de id-ul editurii minimul anului publicatiei
from Carti
group by ID_editura;


select *from Carti order by An_publicare;

select *from Carti order by An_publicare limit 5;

select c.ID_carte, Titlu, An_publicare from Carti c inner join edituri e on c.ID_editura = e.ID_editura;


-- Subqueries

select ID_editura, Titlu, An_publicare
from Carti
where ID_editura in (
select ID_editura
from Edituri
where Nume_editura like '%i%')






