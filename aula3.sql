set serveroutput on

DECLARE
    genero CHAR(1) := '&digite';
BEGIN
    IF upper(genero) = 'F' THEN
        dbms_output.put_line('O genêro informado é Feminino');
    ELSIF upper(genero) = 'M' THEN
        dbms_output.put_line('O genêro informado é Masculino');
    ELSE
        dbms_output.put_line('outros');
    END IF;
END;

---------------------------
--CRIAR UM BLOCO ANONIMO PARA INFORMAR SE O NUMERO INFORMADO É AR OU IMPAR
DECLARE
    numero int:= '&digite' ;
BEGIN
    IF MOD(numero, 2) = 0 THEN
        dbms_output.put_line('O numero é Par');
    ELSE
        dbms_output.put_line('O numero é Impar');
    END IF;
END;
--CRIAR UM BLOCO ANONIMO PARA INFORMAR O USUARIO SE A NOTA ESTA ACIMA DA MEDIA NA MEDIA OU REPROVADO
--ACIMA DE 8 E MENOR QUE 10 ACIMA DA MEDIA
-- ENTRE 6 E 7 NA MEDIA
-- MENOR QUE 6 REPROVADO

DECLARE
    nota int:= '&digite' ;
BEGIN
    IF nota >= 8 AND nota <= 10  THEN
        dbms_output.put_line('FOI DEMAIS');
    ELSIF nota = 6 OR nota = 7 THEN
        dbms_output.put_line('FOI LEK');
    ELSE
        dbms_output.put_line('REPROVADO');
    END IF;
END;

CREATE TABLE aluno (
    ra   CHAR(9),
    nome VARCHAR2(50),
    CONSTRAINT aluno_pk PRIMARY KEY ( ra )
);

INSERT INTO ALUNO (ra, nome) VALUES ('111222333','Antonio Alves');
INSERT INTO ALUNO (ra, nome) VALUES ('222333444','Beatriz Bernardes');
INSERT INTO ALUNO (ra, nome) VALUES ('333444555','Claudio Cardoso');


-- VERIFICANDO VARIAVEL
DECLARE
    v_ra   CHAR(9) := '333444555';
    v_nome VARCHAR2(50);
BEGIN
    SELECT NOME INTO V_NOME FROM ALUNO WHERE RA = V_RA;
    DBMS_OUTPUT.PUT_LINE ('O nome do aluno é ' || v_nome);
END;

--COLOCANDO UMA NOVA VARIAVEL

DECLARE
    v_ra CHAR(9) := '444555666';
    v_nome VARCHAR2(50) := 'Daniela Dorneles';
BEGIN
    INSERT INTO ALUNO (RA,NOME) VALUES (V_RA, V_NOME);
END;

--ATUALIZANDO O VALOR DO BANCO COM O DADO DE UMA VARIAVEL

DECLARE
    V_RA CHAR(9) := '111222333';
    V_NOME VARCHAR2(50) := 'Antonio Rodrigues';
BEGIN
    UPDATE ALUNO SET NOME = V_NOME WHERE RA = V_RA;
END;

-- DELETANDO VALORES DO BANCO ATRAVEZ DO VALOR DE UMA VARIAVEL

DECLARE
    V_RA CHAR(9) := '444555666';
BEGIN
    DELETE FROM ALUNO WHERE RA = V_RA;
END;