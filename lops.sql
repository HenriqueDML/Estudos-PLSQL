SET SERVEROUTPUT ON
/* LOOP */
 
DECLARE
    V_CONTADOR NUMBER(2)=1;
BEGIN
LOOP
    DBMS_OUTPUT.PUT_LINE(V_CONTADOR);
    V_CONTADOR := V_CONTADOR +1;
    EXIT WHEN V_CONTADOR > 20;
END LOOP;
END;
 
 
/* ESTRUTURA DE REPETIÇÃO: WHILE */
 
DECLARE
V_CONTADOR NUMBER(2):=1;
BEGIN
WHILE V_CONTADOR <= 20 LOOP
    DBMS_OUTPUT.PUT_LINE(V_CONTADOR0;
    V_CONTADOR := V_CONTADOR=1;
END LOOP;
END;
 
 
/* ESTRUTURA DE REPITIÇÃO: FOR */
 
DECLARE
FOR V_CONTADOR IN 1..20 LOOP
    DBMS_OUTPUT.PUT_LINE(V_CONTADOR);
END LOOP;
END;
 
 
/* ESTRUTURA DE REPITIÇÃO: FOR - REVERSE */
 
DECLARE
FOR V_CONTADOR IN REVERSE 1..20 LOOP
    DBMS_OUTPUT.PUT_LINE(V_CONTADOR);
END LOOP;
END;
 
 
-- EXERXÍCIOS *************
 
/* 1. Montar um bloco de programação que realize o processamento de uma tabuada
qualquer, por exemplo a tabuada do número 150. */
 
BEGIN
    FOR mult IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(mult*150);
    END LOOP;
END;
 
/* 2. Em um intervalo numérico inteiro, informar quantos números são pares e 
quantos são ímpares. */
 
DECLARE
    par   NUMBER := 0;
    impar NUMBER := 0;
BEGIN
    FOR x IN 1..1357 LOOP
        IF MOD(x, 2) = 0 THEN
            par := par + 1;
        ELSE
            impar := impar + 1;
        END IF;
    END LOOP;
 
    dbms_output.put_line('A QUANTIDADE DE NÚMEROS PARES SÃO: ' || par);
    dbms_output.put_line('A QUANTIDADE DE NÚMEROS IMPARES SÃO: ' || impar);
END;
 
 
/* 3. Exibir e média dos valores pares em um intervalo numérico e 
soma dos ímpares. */
 
DECLARE
    par   NUMBER := 0;
    par_soma NUMBER :=0;
    impar NUMBER :=0;
    impar_soma NUMBER := 0;
    media_par NUMBER := 0;
BEGIN
    FOR x IN 1..10 LOOP
        IF MOD(x, 2) = 0 THEN
            par := par + 1;
            par_soma := par_soma + x;
        ELSE
            impar := impar + 1;
            impar_soma := impar_soma + x;
        END IF;
    END LOOP;
    media_par := par_soma / par;
    dbms_output.put_line('A média dos pares: ' || media_par);
    dbms_output.put_line('A SOMA DOS IMPARES: ' || impar_soma);
END;