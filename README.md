Proiect MySQL

The scope of this project is to use all the SQL knowledge gained through the Software Testing course and apply them in practice.  
Database Schema You can find below the database schema that was generated through Reverse Engineer and which contains all tables and relationships between them. The tables are conected in the following way:


Tools used: MySQL Workbench

Database description: Am creat o baza de date denumita Books. In this database, i created 5 tables named: Autori, Edituri, Gen carti, Carti si Autori carti.
I added and deleted different datas, i created principal and foreign keys, i made different joins between tables and i created a subquerie.

You can find below the database schema that was generated through Reverse Engineer and which contains all the tables and the relationships between them.

The tables are connected in the following way:

<ul>
  <li> **Autori**  is connected with **Autori_carti** through a **1:n** relationship which was implemented through **Autori.ID_autori** as a primary key and **Autori_carti.ID_autori** as a foreign key</li>
  <li> **Carti**  is connected with **Autori_carti** through a **n:1** relationship which was implemented through **Carti.ID_carte** as a primary key and **Autori_carti.ID_carte** as a foreign key</li>
  <li> **Carti**  is connected with **Gen_carti** through a **n:1** relationship which was implemented through **Gen_carti.ID_gen** as a primary key and **Carti.ID_gen** as a foreign key</li>
  <li> **Carti**  is connected with **Edituri** through a **1:1** relationship which was implemented through **Edituri.ID_editura** as a primary key and **CArti.ID_editura** as a foreign key</li>
</ul><br>

<li>Database Queries</li><br>

<ol type="a">
  <li>DDL (Data Definition Language)</li>

  The following instructions were written in the scope of CREATING the structure of the database (CREATE INSTRUCTIONS)

  **create database Books;

    create table Autori ( ID_autori int not null auto_increment primary key, Nume_autor varchar (20) not null, Prenume_autor varchar (20) not null);

    create table Edituri (ID_editura int not null auto_increment primary key, Nume_editura varchar (50) );

    create table Gen_carti (ID_gen int not null auto_increment primary key, Nume_categorie varchar (30) );

    create table Carti (ID_carte int not null auto_increment primary key, Titlu varchar (50), An_publicare date not null, ID_editura int not null, ID_gen int not null, constraint fk_Carti_Edituri foreign key (ID_editura) references Edituri (ID_editura), constraint fk_Carti_Gen_carti foreign key (ID_gen) references Gen_carti (ID_gen) );

    create table Autor_carti (ID_autori int not null, ID_carte int not null, constraint fk_Autor_carti_Autori foreign key (ID_autori) references Autori(ID_autori), constraint fk_Autor_carti_Carti foreign key (ID_carte) references Carti(ID_carte) ); **

  
  
  <li>DML (Data Manipulation Language)</li>

  In order to be able to use the database I populated the tables with various data necessary in order to perform queries and manipulate the data. 
  In the testing process, this necessary data is identified in the Test Design phase and created in the Test Implementation phase. 

  Below you can find all the insert instructions that were created in the scope of this project:

  **insert into Autori (Nume_autor, Prenume_autor) values ('Hill', 'Napoleon'), ('Batchelor', 'Doug'), ('Riordan', 'Rick'), ('Dostoievschi', 'Feodor'), ('Aristocles', 'Platon'), ('Kwik', 'Jim'), ('Einat', 'Nathan'), ('Dobson', 'James'), ('Shetty', 'Jay'), ('Kiyosaki', 'Robert');

    insert into Edituri (Nume_editura) values ('Curtea Veche'), ('Litera'), ('Imago Dei'), ('Lifestyle'), ('Editura pentru literatura universala'), ('IRI'), ('Arthur'), ('Viata si sanatate'), ('Librex');

    insert into Gen_carti (Nume_categorie) values ('Literatura clasica'), ('Dezvoltare personala'), ('Parenting'), ('Autobiografie'), ('Fantasy'), ('Filosofie'), ('Psihologie practica');

    insert into Carti (Titlu, An_publicare, ID_editura, ID_gen) values ('Crima si pedeapsa', 2022, 2, 1), ('Adolescentul', 1957, 5, 1), ('Fara limite', 2021, 4, 2), ('Baietii, cum sa-i crestem', 2010, 3, 3), ('Indrazneste sa disciplinezi', 2010, 3, 3), ('Tot ce am mai drag', 2022, 1, 3), ('Cel mai bogat on din pestera', 2013, 8, 4), ('Tata bogat, tata sarac', 2019, 1, 2), ('Gandeste ca un calugar', 2020, 2, 2), ('Eroul pierdut', 2021, 7, 5), ('Dialoguri', 1998, 6, 6), ('Gandeste si vei fi bogat', 2023, 9, 7);

    insert into Autor_carti (ID_autori, ID_carte) values (1, 12), (2, 7), (3, 10), (4, 1), (5, 11), (6, 3), (7, 6), (8, 4), (9, 9), (10, 8), (4, 2), (8, 5); **



  <li>DQL (Data Query Language)</li>

After the testing process, I droped the data that was no longer relevant in order to preserve the database clean: 

  ** drop table Carti; **


In order to simulate various scenarios that might happen in real life I created the following queries that would cover multiple potential real-life situations:

** select *from carti inner join edituri on carti.ID_editura = edituri.ID_editura;

  select *from carti left join edituri on carti.ID_editura = edituri.ID_editura;

  select *from carti left join edituri on carti.ID_editura = edituri.ID_editura where edituri.ID_editura is null;

  select *from carti left join edituri on carti.ID_editura = edituri.ID_editura where edituri.ID_editura is not null;

  select *from carti right join edituri on carti.ID_editura = edituri.ID_editura;

  select *from edituri where Nume_editura = 'Imago Dei';

  select *from carti left join edituri on carti.ID_editura = edituri.ID_editura where Nume_editura = 'Imago Dei';

  select *from Autori where Nume_autor like '%r%';

  select *from carti where An_publicare like '2%' and Titlu like '%e%';

  select *from carti where not ID_gen = '1' and not ID_gen = '7';

  select min(An_publicare) from carti; select count(*) from carti;

  select *from Carti group by Titlu, An_publicare;

  select min(An_publicare), ID_editura -- am selectat in fucntie de id-ul editurii minimul anului publicatiei from Carti group by ID_editura;

  select *from Carti order by An_publicare;

  select *from Carti order by An_publicare limit 5;

  select c.ID_carte, Titlu, An_publicare from Carti c inner join edituri e on c.ID_editura = e.ID_editura; **



-- Subqueries

** select ID_editura, Titlu, An_publicare from Carti where ID_editura in ( select ID_editura from Edituri where Nume_editura like '%i%'); **
</ol>

<li>Conclusions</li>

** The creation of the "Books" database signifies an important step towards building a robust and scalable system for managing book-related information. It provides a structured framework that will support the development of applications, reporting tools, or any other systems that rely on accurate and organized book data. **

</ol>
