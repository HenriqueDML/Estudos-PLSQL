CREATE OR REPLACE FUNCTION calcx_fgts (
    valor NUMBER
) RETURN NUMBER IS
BEGIN
    RETURN valor * 0.08;
END calcx_fgts;

SELECT calcx_fgts(1000) FROM DUAL;
-----------------------------------
SET SERVEROUTPUT ON
------------------------------------
CREATE OR REPLACE PROCEDURE PRX_FTGS AS
    v_valor NUMBER;
BEGIN
    v_valor := calcx_fgts(150000);
    dbms_output.put_line('O valor do FGTS É: ' || v_valor);
END;

CALL prx_ftgs();
----------------------------------
CREATE OR REPLACE FUNCTION calcx_fgts (
    valor NUMBER
) RETURN NUMBER IS
    me_erro EXCEPTION;
    v_valor NUMBER;
BEGIN
    v_valor := valor * 0.08;
    IF v_valor < 80 THEN
        RAISE me_erro;
    END IF;
    RETURN v_valor;
EXCEPTION
    WHEN ME_ERRO THEN
        RAISE_APPLICATION_ERROR (-20001, 'FGTS NAO PODE SER MENOR QUE 80 REAIS');
END calcx_fgts;

SELECT calcx_fgts(100) FROM dual;
-----------------------------------------
--1) Crie um procedimento chamado prc_insere_produto para todas as colunas da tabela de produtos, valide:
--se o nome do produto tem mais de 3 caracteres e nao contem numeros (0 a 9)
CREATE OR REPLACE PROCEDURE prc_insere_produto (
    v_cod produto.cod_produto%TYPE,
    v_nom produto.nom_produto%TYPE,
    v_bar produto.cod_barra%TYPE,
    v_atv produto.sta_ativo%TYPE,
    v_cad produto.dat_cadastro%TYPE,
    v_can produto.dat_cancelamento%TYPE
) AS erro_meu EXCEPTION;
BEGIN
    IF length(v_nom) < 4 OR regexp_like(v_nom, '[0-9]') THEN
        RAISE erro_meu;
    END IF;

    INSERT INTO produto (
        cod_produto,
        nom_produto,
        cod_barra,
        sta_ativo,
        dat_cadastro,
        dat_cancelamento
    ) VALUES (
        v_cod,
        v_nom,
        v_bar,
        v_atv,
        v_cad,
        v_can
    );

EXCEPTION
    WHEN erro_meu THEN
        raise_application_error(-20002, 'Nome menor que 3 caracteres ou tem numero nele');
END;

CALL prc_insere_produto (15, 'TRE', 123456789,
    'ativo', 
    '03-MAY-04', NULL)
-----------------------------------------
--2)Crie um procedimento chamdo prc_insere_cliente para inserir novos clientes, valide:
-- se o nome do cliente tem mais de 3 carac e nao tem numero (0 a 9)
CREATE OR REPLACE PROCEDURE prc_insere_cliente (
v_clicod cliente.cod_cliente%TYPE,
v_clinom cliente.nom_cliente%TYPE,
v_cliraz cliente.des_razao_social%TYPE,
v_clitip cliente.tip_pessoa%TYPE,
v_clinum cliente.num_cpf_cnpj%TYPE,
v_clicad cliente.dat_cadastro%TYPE,
v_clican cliente.dat_cancelamento%TYPE,
v_clista cliente.sta_ativo%TYPE

) AS errin EXCEPTION;

BEGIN
    IF length(v_clinom) < 3 OR regexp_like(v_clinom, '[0-9]') THEN
        RAISE errin;
    END IF;
    INSERT INTO cliente (
        cod_cliente,
        nom_cliente,
        des_razao_social,
        tip_pessoa,
        num_cpf_cnpj,
        dat_cadastro,
        dat_cancelamento,
        sta_ativo
    ) VALUES (
        v_clicod,
        v_clinom,
        v_cliraz,
        v_clitip,
        v_clinum,
        v_clicad,
        v_clican,
        v_clista
    );
EXCEPTION
    WHEN errin THEN
        raise_application_error(-20002, 'Nome menor que 3 caracteres ou tem numero nele');
END;

CALL prc_insere_cliente (158, 'He','Henrique F. Garcia LTDA','J', '12345678000', SYSDATE, NULL, 'S');
-------------------------------------------------
/*
3)crie uma funçao chamada FUN_VALIDA_NOME que valide se o nome tem mais do que 3 caracteres e nao tenha numeros
*/
CREATE OR REPLACE FUNCTION FUN_VALIDA_NOME ()
-------------------------------------------------
/*
4) altere os procedimentos dos exercicios 1 e 2 para chamar a função do exerciocio3
*/
-------------------------------------------------
/*
5)altere o procedimento do exercicio 1 para que tenha um ultimo parametro chamado p_retorno do tipo varchar2 que devera retornnar
a informação 'produto cadastrado com sucesso'
*/
-------------------------------------------------
/*
6) crie um bloco anônimo e chame o procedimento do exercicio 1
*/
-------------------------------------------------