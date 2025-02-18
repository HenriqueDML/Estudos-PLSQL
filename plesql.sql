
CREATE TABLE pais (
    id_pais   NUMBER,
    nome_pais VARCHAR2(30)
);

INSERT INTO pais (id_pais, nome_pais) VALUES (1,'Brasil');
INSERT INTO pais (id_pais, nome_pais) VALUES (2,'EUA');
INSERT INTO pais (id_pais, nome_pais) VALUES (3,'Colombia');
INSERT INTO pais (id_pais, nome_pais) VALUES (4,'Somalia');
INSERT INTO pais (id_pais, nome_pais) VALUES (5,'Congo');

CREATE TABLE estado (
    id_estado   NUMBER PRIMARY KEY,
    nome_cidade VARCHAR2(30),
    id_pais     NUMBER
);

INSERT INTO estado (id_estado, nome_estado, id_pais) VALUES (1, 'Sao Paulo', 1);
INSERT INTO estado (id_estado, nome_estado, id_pais) VALUES (2, 'Rio de Janeiro', 1);
INSERT INTO estado (id_estado, nome_estado, id_pais) VALUES (3, 'Mato Grosso', 1);
INSERT INTO estado (id_estado, nome_estado, id_pais) VALUES (4, 'Rio Grande do Sul', 1);
INSERT INTO estado (id_estado, nome_estado, id_pais) VALUES (5, 'Minas Gerais', 1);

ALTER TABLE estado
    ADD CONSTRAINT fk_estado FOREIGN KEY ( id_pais )
        REFERENCES pais ( id_pais );

CREATE TABLE cidade (
    id_cidade   NUMBER PRIMARY KEY,
    nome_cidade VARCHAR2(30),
    id_estado   NUMBER
);

INSERT INTO cidade (id_cidade, nome_cidade, id_estado) VALUES (1, 'Sao Paulo', 1);
INSERT INTO cidade (id_cidade, nome_cidade, id_estado) VALUES (1, 'Sao Paulo', 1);
INSERT INTO cidade (id_cidade, nome_cidade, id_estado) VALUES (1, 'Sao Paulo', 1);
INSERT INTO cidade (id_cidade, nome_cidade, id_estado) VALUES (2, 'Rio de Janeiro', 1);
INSERT INTO cidade (id_cidade, nome_cidade, id_estado) VALUES (2, 'Rio de Janeiro', 1);

ALTER TABLE cidade
    ADD CONSTRAINT fk_cidade FOREIGN KEY ( id_estado )
        REFERENCES estado ( id_estado );

CREATE TABLE bairro (
    id_bairro   NUMBER PRIMARY KEY,
    nome_bairro VARCHAR2(30),
    id_cidade   NUMBER
);

INSERT INTO bairro (id_bairro, nome_bairro, id_cidade) VALUES (1, 'Maua', 1);
INSERT INTO bairro (id_bairro, nome_bairro, id_cidade) VALUES (2, 'Diadema', 1);
INSERT INTO bairro (id_bairro, nome_bairro, id_cidade) VALUES (3, 'Santo Andre', 1);
INSERT INTO bairro (id_bairro, nome_bairro, id_cidade) VALUES (4, 'Sao Caetano', 1);
INSERT INTO bairro (id_bairro, nome_bairro, id_cidade) VALUES (5, 'Santana', 1);

ALTER TABLE bairro
    ADD CONSTRAINT fk_cidade FOREIGN KEY ( id_cidade )
        REFERENCES cidade ( id_cidade );

CREATE TABLE end_cliente (
    id_endereco NUMBER PRIMARY KEY,
    cep         NUMBER,
    logradouro  VARCHAR2(50),
    numero      NUMBER,
    complemento VARCHAR2(50),
    id_bairro   NUMBER
);

INSERT INTO end_cliente ( id_endereco, cep, logradouro, numero, complemento, id_bairro) VALUES (1, 12345123, 'Rua Benedito', 12, 'N', 1);
INSERT INTO end_cliente ( id_endereco, cep, logradouro, numero, complemento, id_bairro) VALUES (1, 13456123, 'Rua Romero', 132, 'Ap 1', 2);
INSERT INTO end_cliente ( id_endereco, cep, logradouro, numero, complemento, id_bairro) VALUES (1, 22342323, 'Rua Brito', 1, 'Ap 23', 3);
INSERT INTO end_cliente ( id_endereco, cep, logradouro, numero, complemento, id_bairro) VALUES (1, 52545123, 'Rua Pai', 886, 'N', 3);
INSERT INTO end_cliente ( id_endereco, cep, logradouro, numero, complemento, id_bairro) VALUES (1, 12344443, 'Rua Cratina', 337, 'N', 2);

ALTER TABLE end_cliente
    ADD CONSTRAINT fk_end_cliente FOREIGN KEY ( id_bairro )
        REFERENCES bairro ( id_bairro );

SELECT
    a.nom_pais          pais,
    COUNT(b.nom_estado) "QDT_ESTADOS"
FROM
         pf1788.pais a
    INNER JOIN pf1788.estado b ON ( a.cod_pais = b.cod_pais )
GROUP BY
    a.nom_pais
    

SELECT
    a.nom_pais          pais,
    COUNT(b.nom_estado) "QTD_ESTADO"
FROM
    pf1788.pais a
    LEFT JOIN pf1788.estado b ON (a.cod_pais = b.cod_pais)
WHERE
    a.cod_pais = b.cod_pais
GROUP BY
    a.nom_pais;
    ------------------------
SELECT
    a.nom_pais          pais,
    COUNT(b.nom_estado) "QTD_ESTADO"
FROM
    pf1788.pais a,
    pf1788.estado b
WHERE
    a.cod_pais = b.cod_pais(+)
GROUP BY
    a.nom_pais
HAVING COUNT(b.nom_estado) > 5
ORDER BY 2 ;
--------------
SELECT
    a.nom_estado          estado,
    COUNT(b.nom_cidade) "QTD_CIDADE"
FROM
    pf1788.estado a,
    pf1788.cidade b
WHERE
    a.cod_estado = b.cod_estado
GROUP BY
    a.nom_estado
ORDER BY 2 ;
---------------
SELECT
    a.nom_pais         pais,
    b.nom_estado        estado,
    COUNT(C.nom_cidade) "QTD_CIDADES"
FROM
    pf1788.pais a
JOIN pf1788.estado b ON (a.cod_pais = b.cod_pais)
LEFT JOIN pf1788.cidade C ON( b.cod_estado = c.cod_estado )
GROUP BY
    a.nom_pais, 
        b.nom_estado
ORDER BY 3 desc,1,2 ;
--------------
--INTRODUÇÃO A BLOCO ANONIMO
SET SERVEROUTPUT ON;-- é um print, é possivel colocar OFF
DECLARE
    SALARIOMINIMO NUMBER; -- variavel numerica
    NOME VARCHAR2(30) := ' VERGE'; -- texto 
    VINTECINCO NUMBER;
    NOVO NUMBER;
BEGIN
    salariominimo := 1518; -- atrobuindo um valor
    vintecinco := salariominimo * 0.25;
    novo := salariominimo + vintecinco;
    dbms_output.put_line('Olá' || nome ||  ' Tudo bem ai?');
    dbms_output.put_line('O Salário minimo atual é: R$'||salariominimo);
    dbms_output.put_line('E 25% dele é: R$' || vintecinco);
    dbms_output.put_line('Seu novo salário é: R$' || novo);
END;
------------
SET SERVEROUTPUT ON;-- é um print, é possivel colocar OFF
DECLARE
    DOLAR NUMBER; 
    CAMBIO NUMBER := 6;
    REAL NUMBER;
BEGIN
    DOLAR  := 45;
    REAL := 45 * cambio;
    
    dbms_output.put_line('O valor do real é: R$'||real);
END;

---------
SET SERVEROUTPUT ON;-- é um print, é possivel colocar OFF
DECLARE
    PARCELAS NUMBER; 
    VALORCARRO NUMBER;
    VALORTOTAL NUMBER;
    APAGAR NUMBER;
BEGIN
    valorcarro := 1000;
    parcelas := 10;
    valortotal := (valorcarro * 1.03) / parcelas;
    apagar := valortotal*10;
    dbms_output.put_line('valor da parcela é: R$'||valortotal);
    dbms_output.put_line('valor total é: R$'||apagar);
END;
