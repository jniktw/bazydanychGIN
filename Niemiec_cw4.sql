-- Æw. 1

Create database firma;

-- Æw. 2

CREATE SCHEMA rozliczenia;

-- Æw. 3

create table rozliczenia.pracownicy (
	id_pracownika int PRIMARY KEY NOT NULL,
	imie varchar(255),
	nazwisko varchar(255) NOT NULL,
	adres varchar(255),
	telefon int
);

create table rozliczenia.godziny (
	id_godziny int PRIMARY KEY NOT NULL,
	"data" date,
	liczba_godzin int NOT NULL
);

create table rozliczenia.pensje (
	id_pensji int PRIMARY KEY NOT NULL,
	stanowisko varchar (255) NOT NULL,
	kwota float(2) NOT NULL
);

create table rozliczenia.premie (
	id_premii int PRIMARY KEY NOT NULL,
	rodzaj varchar (255),
	kwota int NOT NULL
);

ALTER TABLE rozliczenia.godziny ADD ID_pracownika int NOT NULL FOREIGN KEY REFERENCES rozliczenia.pracownicy(id_pracownika);
ALTER TABLE rozliczenia.pensje ADD ID_premii int NOT NULL FOREIGN KEY REFERENCES rozliczenia.premie(id_premii);

-- Æw. 4

INSERT INTO rozliczenia.pracownicy VALUES
(1, 'Adrian', 'Malczewski','Konopnickiej 21, Mys³owice', 598213408), 
(2, 'Kamila', 'Samusionek', 'Stawowa 13, Katowice', 447392385), 
(3, 'Mariusz', 'No¿yñski', 'Hajducka 6, Chorzów', 750195213), 
(4, 'Krzysztof', 'Nowak', 'Wybickiego 25, Bytom', 834288774), 
(5, 'Anna', 'Kowalska', 'Prusa 36, Katowice', 843457743), 
(6, 'Tadeusz', 'Andrzejczak',  'Grota-Roweckiego 4, Sosnowiec', 836719401), 
(7, 'Magdalena', 'Gintrowska', 'Ziêtka 13, Siemianowice Œl¹skie', 338999050), 
(8, 'Ewa', 'Kirszenstein', 'Konopnickiej 52, Jaworzno', 654923190), 
(9, 'Mariusz', 'Zarêbski', '3 maja 113, Katowice', 191458718), 
(10, 'Marzena', 'Adamczyk', 'Wiosenna 21, Chorzów', 121702675);

INSERT INTO rozliczenia.godziny VALUES
(1, '03-28-2022', 7, 4),
(2, '03-28-2022', 5, 3),
(3, '03-28-2022', 6, 1),
(4, '03-29-2022', 10, 6),
(5, '03-29-2022', 6, 9),
(6, '03-29-2022', 8, 8),
(7, '03-30-2022', 6, 9),
(8, '03-30-2022', 7, 2),
(9, '03-30-2022', 6, 7),
(10, '03-30-2022', 8, 8),
(11, '03-31-2022', 9, 2),
(12, '03-31-2022', 6, 8),
(13, '03-31-2022', 8, 1),
(14, '03-31-2022', 9, 10),
(15, '03-31-2022', 7, 6),
(16, '04-01-2022', 10, 8),
(17, '04-01-2022', 5, 4),
(18, '04-01-2022', 6, 1),
(19, '04-02-2022', 7, 8),
(20, '04-02-2022', 7, 7);

INSERT INTO rozliczenia.premie VALUES
(1, 'Za nadgodziny', 200),
(2, 'Za nadprogramow¹ pomoc prze³o¿onemu', 500),
(3, 'Za godne reprezentowanie firmy', 350),
(4, 'Za zas³ugi dla firmy', 700),
(5, 'Brak premii', 0),
(6, 'Praca w trakcie urlopu', 250),
(7, 'Za uczciwoœæ', 100),
(8, 'Pracownik miesi¹ca', 500),
(9, 'Przejêcie obowi¹zków innego pracownika w nag³ej sytuacji', 450),
(10, 'Zadoœæuczynienie', 750);

INSERT INTO rozliczenia.pensje VALUES
(1, 'Prezes', 15000.00, 5),
(2, 'Menad¿er', 12000.00, 2),
(3, 'Programista', 7550.00, 8),
(4, 'Ksiêgowy', 5000.00, 7),
(5, 'Analityk', 6000.00, 6),
(6, 'Specjalista PR', 4500.00, 3),
(7, 'Dozorca', 2500.00, 1),
(8, 'Brygadzista', 1500.00, 9),
(9, 'Sta¿ysta', 1200.00, 5),
(10, 'Ochroniarz', 2000.00, 10),
(11, 'Cz³onek zarz¹du', 10000.00, 4),
(12, 'Mechanik', 2500.00, 6),
(13, 'Sekretarz', 5000.00, 7),
(14, 'Recepcjonista', 3500.00, 5),
(15, 'Reprezentant handlowy', 6000.00, 3);

-- 5

Select nazwisko, adres from rozliczenia.pracownicy

-- 6

Select id_godziny, DATEPART(dw, "data") as "dzieñ tygodnia", DATEPART(mm, "data") as "miesi¹c", ID_pracownika from rozliczenia.godziny

-- 7

sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto', 'COLUMN';
ALTER TABLE rozliczenia.pensje ADD "kwota_netto" float(2);
UPDATE rozliczenia.pensje Set kwota_netto = 0.81 * kwota_brutto;
Select * from rozliczenia.pensje