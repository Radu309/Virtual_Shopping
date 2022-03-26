drop database if exists magazin_virtual;
create database magazin_virtual;
use magazin_virtual;

CREATE TABLE IF NOT EXISTS categorie (
    Cod INTEGER PRIMARY KEY,
    Denumire VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS furnizor (
    CodFurnizor INTEGER PRIMARY KEY,
    Denumire VARCHAR(20),
    Adresa VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS produs (
    IdProdus INTEGER NOT NULL PRIMARY KEY,
    Denumire VARCHAR(50),
    Garantie INTEGER,
    Stoc INTEGER,
    ValoareUnitara INTEGER,
    Valuta VARCHAR(10),
    CodCategorie INT,
    CodFurnizor INT,
    Id_Categorie INTEGER,
    FOREIGN KEY (Id_Categorie)
		REFERENCES Categorie (Cod),
	Id_Furnizor INTEGER,
    FOREIGN KEY (Id_Furnizor)
		REFERENCES Furnizor (CodFurnizor)
);

CREATE TABLE IF NOT EXISTS recenzie (
    Id INTEGER PRIMARY KEY,
    Persoana VARCHAR(20),
    DataRecenzie VARCHAR(15),
    Nota INTEGER,
    Descriere TEXT,
    Id_Produs INTEGER,
    FOREIGN KEY (Id_Produs)
		REFERENCES produs (IdProdus)
);

CREATE TABLE IF NOT EXISTS clienti (
	IdClient INTEGER PRIMARY KEY,
    NumarCont VARCHAR(8),
    Nume VARCHAR(20),
    Prenume VARCHAR(20),
    Adresa VARCHAR(20),
    DataNasterii VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS comanda (
    NrComanda INTEGER NOT NULL PRIMARY KEY,
    IdProdus INTEGER NOT NULL,
    CodClient INTEGER NOT NULL,
    Cantitate INTEGER,
	Id_Comanda INTEGER,
    FOREIGN KEY (Id_Comanda)
        REFERENCES clienti (IdClient)
);

CREATE TABLE IF NOT EXISTS tranzactie (
    NrTranzactie INTEGER NOT NULL PRIMARY KEY,
    ValoareTotala INTEGER NOT NULL,
    Valuta VARCHAR(10),
    Id_comanda INTEGER,
    Id_client INTEGER,
    FOREIGN KEY (Id_comanda)
        REFERENCES comanda (NrComanda),
	FOREIGN KEY (Id_client)
        REFERENCES clienti (IdClient)
);

CREATE TABLE IF NOT EXISTS cont(
	idCont INTEGER NOT NULL auto_increment PRIMARY KEY,
    usernameCont VARCHAR(15),
    passwordCont VARCHAR(15),
    firstName VARCHAR(15),
    lastName VARCHAR(15),
    Adress VARCHAR(30),
    dataNasterii VARCHAR(15)
);

CREATE TABLE produs_has_comanda (
    id_produs INT,
    id_comanda INT,
    PRIMARY KEY (id_comanda , id_produs),
    FOREIGN KEY (id_comanda)
        REFERENCES comanda (NrComanda),
    FOREIGN KEY (id_produs)
        REFERENCES produs (IdProdus)
);

####################	INSERT		####################

INSERT INTO produs(IdProdus, Denumire, Garantie, Stoc, ValoareUnitara, Valuta, CodCategorie ,CodFurnizor ) VALUES
(1,'Fujitsu Siemens Amilo Pro',1,10,2000,'RON',1,2),
(2,'Indesit WLI1000 ',3,5,900,'RON',3,2),
(3,'Gorenje RC400',3,4,1500,'RON',5,2),
(4,'Smartphone xyz',2,9,2000,'RON',2,3),
(6,'iPhone 13',2,5,6000,'RON',1,9),
(7,'MacBook Pro M1','3','2',8000,'RON',1,1),
(8,'Skullcandy CrusherEVO',1,10,400,'RON',2,2),
(9,'Corsair Harpoon RGB',1,4,300,'RON',3,3),
(10,'TP-LINK Archer C6',1,7,100,'RON',4,4),
(11,'Smart LED',1,1,100,'RON',5,5),
(12,'iPad mini',2,15,2000,'RON',6,6),
(13,'Mouse Gaming Razer',2,3,150,'RON',6,2),
(14,'PC MYRIA Style V75',2,1,7000,'RON',6,5),
(15,'Huawei WatchFit',2,1,350,'RON',6,1),
(16,'Acumulator Asus ZenPower',2,15,80,'RON',9,9);


INSERT INTO clienti(IdClient, NumarCont, Nume, Prenume, DataNasterii) VALUES
(1,'11111111','Popescu','Ion','1985-01-01'),
(2,'22222222','Georgescu','Andreea','1983-08-23'),
(3,'33333333','Ionescu','Robert','1982-03-08'),
(4,'44444444','Gavrila','Valentin','1980-05-09'),
(5,'55555555','Circeie','Alexandru','1985-06-10'),
(6,'12345','Circeie','Ion','1988-06-10'),
(7,'1234','Popescu','Gigel','1990-09-11'),
(8,'54321','Moldovan','Marcel','1985-09-15'),
(9,'641241','Pop','Marius','1991-07-10'),
(10,'124124','Nati','Bogdan','1985-06-10'),
(11,'191294','Suciu','Liana','2000-12-10'),
(12,'6959412','Ciunterei','Rodica','1988-11-09'),
(13,'654231','Pop','Andrei','2001-07-10'),
(14,'595911','Popescu','Diana','1989-01-10'),
(15,'131012','Lazar','Mara','1995-08-20');

INSERT INTO comanda(NrComanda, IdProdus, CodClient, Cantitate) VALUES
(1,2,1,9),
(2,3,2,3),
(3,2,3,1),
(4,2,4,2),
(5,3,5,1),
(6,7,5112,2),
(7,6,60504,2),
(8,5,54321,1),
(9,8,654321,1),
(10,7,12345,5),
(11,3,514124,1),
(12,4,14124,3);

INSERT INTO tranzactie(NrTranzactie, ValoareTotala, Valuta) VALUES
(1,1245,"RON"),
(2,123,"RON"),
(3,234,"RON"),
(4,1252,"RON"),
(5,6784,"RON"),
(6,1244,"RON"),
(7,854,"RON"),
(8,521,"RON"),
(9,8000,"RON"),
(10,1231,"RON"),
(11,100,"RON"),
(12,500,"RON");


INSERT INTO cont(usernameCont, passwordCont, firstName, lastName, Adress, dataNasterii) VALUES
("nume1","parola1","Circeie","Gavrila","Str. Florilor",'2000-12-12'),
("nume2","parola2","Neaca","Radu","Str. Lalelelor",'2001-09-30'),
("nume3","parola3","Popescu","Ion","Str. Trandafirilor",'2000-06-17');

INSERT INTO categorie(Cod, Denumire ) VALUES
(0," "),
(1,"Laptop"),
(2,"Televizoare"),
(3,"Periferice PC"),
(4,"Masina de spalat"),
(5,"Telefoane Mobile"),
(6,"Tablete si accesorii"),
(7,"Accesorii Laptop"),
(8,"Accesorii telefoane"),
(9,"Componente PC");

INSERT INTO furnizor(CodFurnizor, Denumire, Adresa) VALUES 
(0," ","asdasd"),
(1,"furnizor1","asdasd"),
(2,"furnizor2","asdasd"),
(3,"furnizor3","asdasd"),
(4,"furnizor4","asdasd"),
(5,"furnizor5","asdasd"),
(6,"furnizor6","asdasd"),
(7,"furnizor7","asdasd"),
(8,"furnizor8","asdasd"),
(9,"furnizor9","asdasd");

INSERT INTO recenzie (Id, Persoana, DataRecenzie, Nota, Descriere) VALUES
(1, "Circeie Gavrila", "2010-06-17", 10, "Super produs, excelent!!"),
(2, "Neaca Radu", "2015-06-17", 10, "Super produs, mi-a placut"),
(3, "Ciunterei Rodica", "2010-09-17", 8, "Se putea si mai bine"),
(4, "Pop Andrei", "2016-06-19", 5, "Sa fie de trecere"),
(5, "Moldovan Ionut", "2012-08-15", 9, "frumos"),
(6, "Nati Marius", "2017-02-17", 4, "Am primit un produs defect"),
(7, "Pop Gigel", "2013-04-21", 7, "Este ok!"),
(8, "Popescu Ioan", "2014-12-11", 6, "Nu indeplineste descrierea");

delimiter //
create trigger produs_comanda after insert on produs_has_comanda 
for each row begin
update produs P
set P.Stoc = P.Stoc - 1 where 
		P.IdProdus = ANY (select id_produs from produs_has_comanda);
end //

#insert into produs_has_comanda values (1,1);
#insert into produs_has_comanda values (2,2);

delimiter //
create procedure client_produs (NumarProduse integer, id_produs integer)
begin
	update produs P
    set Stoc = Stoc - NumarProduse where id_produs = P.IdProdus;
end; //
call client_produs(3,3);
call client_produs(3,1);

delimiter //
create procedure new_account(UsernameCont varchar(30), PasswordCont varchar(30), FirstName  varchar(30),LastName  varchar(30), AAdress1 varchar(30),DataNasterii VARCHAR(15))
begin 
	INSERT INTO cont(usernameCont, passwordCont, firstName, lastName, Adress, dataNasterii) VALUES
	(UsernameCont,PasswordCont,FirstName,LastName,AAdress1,DataNasterii);
end; //
#call new_account("Ana","Ana","Popescu","Pop","Str Alexandru Ioan Cuza", "1900-01-01");

CREATE VIEW MyAccountView AS
SELECT k.firstName, k.lastName, k.usernameCont, k.passwordCont, k.Adress
FROM cont k WHERE k.idCont = ("1");

CREATE VIEW CustomersViewOnProducts AS 
SELECT p.Denumire, p.ValoareUnitara 
 FROM  produs p ORDER BY p.Denumire ;
 
create view raport_cumparaturi as 
select C.Nume, C.Prenume, P.Denumire, K.Cantitate, T.ValoareTotala
from clienti C, produs P, comanda K, tranzactie T
where ((P.IdProdus = K.NrComanda) &&( T.NrTranzactie = C.IdClient)&& ( C.IdClient = K.NrComanda));

SELECT 	denumire from produs where garantie >= 2;
SELECT nume,prenume from clienti where DataNasterii <=  '1985-06-10';
SELECT NrComanda from comanda where cantitate > 4;
SELECT idprodus,denumire from produs where ValoareUnitara > 500;
SELECT idclient from clienti where prenume = "Ion";
SELECT R.Persoana from recenzie R where (R.Nota > 7);
SELECT NrTranzactie from tranzactie where ValoareTotala < 200;
SELECT p.IdProdus, p.Denumire, p.Stoc
	from produs P
	inner join furnizor
	on p.CodFurnizor = furnizor.CodFurnizor;

SELECT* FROM cont;
#SELECT * FROM produs;
#SELECT * FROM clienti;