-- Generated by Oracle SQL Developer Data Modeler 18.3.0.268.1156
--   at:        2019-01-25 19:39:29 CET
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE user bd2a39_app identified by account unlock 
;

CREATE TABLE detale (
    id_detalu       NUMBER(5) NOT NULL,
    nazwa           VARCHAR2(30) NOT NULL,
    opis            VARCHAR2(140) NOT NULL,
    polozenie       VARCHAR2(140) NOT NULL,
    id_detalu_nad   NUMBER(5)
)
LOGGING;

COMMENT ON TABLE detale IS
    'Charakterystyka  detalu architektonicznego';

COMMENT ON COLUMN detale.opis IS
    'Zwi�z�y (140 znak�w)  opis wygl�du detalu. Bardziej rozwini�ty opis wymaga utworzenia notatki.';

COMMENT ON COLUMN detale.polozenie IS
    'Zwi�z�y (140 znak�w) opis po�o�enia detalu wzgl�dem np. budynku (dla du�ych detali) lub detalu nadrz�dnego (dla detali podrz�dnych wzgl�dem innych).'
    ;

COMMENT ON COLUMN detale.id_detalu_nad IS
    'ID detalu nadrzednego';

CREATE INDEX detale__idx ON
    detale (
        id_detalu_nad
    ASC )
        LOGGING;

GRANT DELETE, INSERT, SELECT, UPDATE ON detale TO bd2a39_app;

ALTER TABLE detale ADD CONSTRAINT detale_pk PRIMARY KEY ( id_detalu );

CREATE TABLE kategorie (
    id_kategorii   NUMBER(5) NOT NULL,
    nazwa          VARCHAR2(20)
)
LOGGING;

COMMENT ON TABLE kategorie IS
    'Kategoria detalu architektonicznego.';

GRANT DELETE, INSERT, SELECT, UPDATE ON kategorie TO bd2a39_app;

ALTER TABLE kategorie ADD CONSTRAINT kategorie_pk PRIMARY KEY ( id_kategorii );

ALTER TABLE kategorie ADD CONSTRAINT kategorie_nazwa_un UNIQUE ( nazwa );

CREATE TABLE kategorie_detali (
    id_kategorii   NUMBER(5) NOT NULL,
    id_detalu      NUMBER(5) NOT NULL
)
LOGGING;

COMMENT ON TABLE kategorie_detali IS
    'Przypisuje detal do kategorii';

CREATE INDEX kategorie_detali__idx ON
    kategorie_detali (
        id_detalu
    ASC )
        LOGGING;

GRANT DELETE, INSERT, SELECT, UPDATE ON kategorie_detali TO bd2a39_app;

ALTER TABLE kategorie_detali ADD CONSTRAINT kategorie_detali_pk PRIMARY KEY ( id_kategorii,
                                                                              id_detalu );

CREATE TABLE notatki (
    id_detalu      NUMBER(5) NOT NULL,
    data_dodania   DATE NOT NULL,
    tytul          VARCHAR2(30) NOT NULL,
    obraz          BLOB NOT NULL,
    opis           VARCHAR2(300) NOT NULL
)
LOGGING;

COMMENT ON TABLE notatki IS
    'Notatka dotycz�ca detalu - zawiera zdj�cie lub rysunek obiektu oraz jego opis';

COMMENT ON COLUMN notatki.data_dodania IS
    'Z dok�adno�ci� do sekund.';

COMMENT ON COLUMN notatki.tytul IS
    'Unikatowy wzgl�dem danego detalu';

COMMENT ON COLUMN notatki.obraz IS
    'Zdj�cie lub rysunek';

COMMENT ON COLUMN notatki.opis IS
    'Opis (300 znak�w) obrazu zawartego w notatce b�d� detalu przedstawionego na obrazie.';

GRANT DELETE, INSERT, SELECT, UPDATE ON notatki TO bd2a39_app;

ALTER TABLE notatki ADD CONSTRAINT notatki_pk PRIMARY KEY ( id_detalu,
                                                            data_dodania );

ALTER TABLE notatki ADD CONSTRAINT notatki_id_detalu_tytul_un UNIQUE ( tytul,
                                                                       id_detalu );

ALTER TABLE detale
    ADD CONSTRAINT detale_detale_fk FOREIGN KEY ( id_detalu_nad )
        REFERENCES detale ( id_detalu )
    DEFERRABLE;

ALTER TABLE kategorie_detali
    ADD CONSTRAINT kategorie_detali_detale_fk FOREIGN KEY ( id_detalu )
        REFERENCES detale ( id_detalu )
            ON DELETE CASCADE
    DEFERRABLE;

ALTER TABLE kategorie_detali
    ADD CONSTRAINT kategorie_detali_kategorie_fk FOREIGN KEY ( id_kategorii )
        REFERENCES kategorie ( id_kategorii )
    DEFERRABLE;

ALTER TABLE notatki
    ADD CONSTRAINT notatki_detale_fk FOREIGN KEY ( id_detalu )
        REFERENCES detale ( id_detalu )
            ON DELETE CASCADE
    DEFERRABLE;

ALTER TABLE detale
    ADD CONSTRAINT detale_detale_fk FOREIGN KEY ( id_detalu_nad )
        REFERENCES detale ( id_detalu )
    DEFERRABLE;

ALTER TABLE kategorie_detali
    ADD CONSTRAINT kategorie_detali_detale_fk FOREIGN KEY ( id_detalu )
        REFERENCES detale ( id_detalu )
            ON DELETE CASCADE
    DEFERRABLE;

ALTER TABLE kategorie_detali
    ADD CONSTRAINT kategorie_detali_kategorie_fk FOREIGN KEY ( id_kategorii )
        REFERENCES kategorie ( id_kategorii )
    DEFERRABLE;

ALTER TABLE notatki
    ADD CONSTRAINT notatki_detale_fk FOREIGN KEY ( id_detalu )
        REFERENCES detale ( id_detalu )
            ON DELETE CASCADE
    DEFERRABLE;

CREATE OR REPLACE TRIGGER fkntm_notatki BEFORE
    UPDATE OF id_detalu ON notatki FOR EACH ROW
    WHEN (new.id_detalu <> old.id_detalu) 
BEGIN
    raise_application_error(-20225, 'Non Transferable FK constraint  on table NOTATKI is violated');
END;
/



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             2
-- ALTER TABLE                             14
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              1
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
