CREATE SEQUENCE KATEGORIA_SEQ START WITH 1 INCREMENT BY 1;
INSERT INTO kategorie VALUES (KATEGORIA_SEQ.nextval, 'BALUSTRADY');
INSERT INTO kategorie VALUES (KATEGORIA_SEQ.nextval, 'SCHODY');
INSERT INTO kategorie VALUES (KATEGORIA_SEQ.nextval, 'RZEZBIONE');
INSERT INTO kategorie VALUES (KATEGORIA_SEQ.nextval, 'KOLUMNY');
INSERT INTO kategorie VALUES (KATEGORIA_SEQ.nextval, 'KONSOLE');

CREATE SEQUENCE DETAL_SEQ START WITH 1 INCREMENT BY 1;
INSERT INTO detale(id_detalu,nazwa,opis,polozenie) VALUES (DETAL_SEQ.nextval, 'AMBONA', 'RZEZBIONA AMBONA NA KOLUMNACH Z PROWADZACYMI NAN SCHODAMI. ', 'PATRZAC W STRONE OLTARZA, PO LEWEJ STRONIE, PRZY TRZECIEJ KOLUMNIE LICZAC OD OLTARZA');
INSERT INTO detale VALUES (DETAL_SEQ.nextval, 'SCHODY NA AMBONE', 'SCHODY PROWADZACE NA AMBONE ZNAJDUJACA SIE 2M NAD ZIEMIA. 10 STOPNI, DREWNIANE', 'PATRZAC W STRONE OLTARZA, PO LEWEJ STRONIE AMBONY',2);
INSERT INTO detale VALUES (DETAL_SEQ.nextval, 'KOLUMNA POD AMBONA', 'KOLUMNA PODTRZYMUJACA AMBONE. U PODSTAWY ZNAJDUJE SIE RZEZBA LWA. ZWIENCZONA ABAKUSEM', 'POD AMBONA',2);
INSERT INTO detale VALUES (DETAL_SEQ.nextval, 'KONSOLA POD AMBONA', 'KONSOLA ZNAJDUJACA SIE TUZ POD AMBONA. OZDOBNIE I BOGATO RZEZBIONA', 'POD AMBONA',2);
INSERT INTO detale VALUES (DETAL_SEQ.nextval, 'BALUSTRADA SCHODOWA', 'DREWNIANA BALUSTRADA', 'UMOCOWANA PRZY SCHODACH PROWADZACYCH NA AMBONE',3);
INSERT INTO detale VALUES (DETAL_SEQ.nextval, 'BALUSTRADA AMBONY', 'BOGATO RZEZBIONA BALUSTRADA O WYSOKOSCI OK. 1M', 'OTACZA AMBONE',2);
INSERT INTO detale VALUES (DETAL_SEQ.nextval, 'RZEZBA LWA', 'RZEZBA PRZEDSTAWIAJACA LWA STOJACEGO NA CZTERECH LAPACH.', 'U PODNOZY KOLUMNY',4);

INSERT INTO kategorie_detali VALUES (3,3);
INSERT INTO kategorie_detali VALUES (5,4);
INSERT INTO kategorie_detali VALUES (6,5);
INSERT INTO kategorie_detali VALUES (2,6);
INSERT INTO kategorie_detali VALUES (2,7);
INSERT INTO kategorie_detali VALUES (4,8);
INSERT INTO kategorie_detali VALUES (4,2);
INSERT INTO kategorie_detali VALUES (4,5);
INSERT INTO kategorie_detali VALUES (4,7);

--OBRAZ DODANY RÊCZNIE W ZAKLADCE 'DATA' TABELI NOTATKI
insert into NOTATKI values (2, TO_DATE('11/02/2017 16:48:12','DD/MM/YYYY HH24:MI:SS'), 'CALOKSZTALT', empty_blob(), 'Ambona skonstruowana na planie heksagonu. Ambone zdobia rzezby nawiazujace do form antycznych: piec plaskorzezb, piec alegorii cnot i Jan Chrzciciel nad kolumnami, figury ewangelistow i prorokow w naroznikach. Podtrzymywana przez centralna kolumne oraz szesc kolumn zewnetrznych.' ) ;
insert into NOTATKI values (8, TO_DATE('27/03/2015 11:12:56','DD/MM/YYYY HH24:MI:SS'), 'LWIATKO', empty_blob(), 'Rzezba lwa u podnozy kolumny moze przedstawiac zarowno doroslego lwa, jak i przedstawione na zdjeciu lwiatko.' ) ;
insert into NOTATKI values (7, TO_DATE('01/07/2018 08:31:33','DD/MM/YYYY HH24:MI:SS'), 'UKRZYZOWANIE', empty_blob(), 'Jedna z plaskorzezb umieszczonych na balustradzie ambony przestawia scene ukrzyzowania Chrystusa.' ) ;
