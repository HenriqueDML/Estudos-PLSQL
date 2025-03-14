SET SERVEROUTPUT ON;

-- 1. Calcula o total de movimentações de estoque para um determinado produto
DECLARE
    v_cod_produto NUMBER;
    v_total_movimentacao NUMBER := 0;
BEGIN
    v_cod_produto := TO_NUMBER('&Informe_o_Codigo_do_Produto');
    
    SELECT SUM(QTD_MOVIMENTACAO_ESTOQUE)
    INTO v_total_movimentacao
    FROM movimento_estoque
    WHERE COD_PRODUTO = v_cod_produto;
    
    DBMS_OUTPUT.PUT_LINE('Total de movimentações: ' || v_total_movimentacao);
END;
/

-- 2. Calcula a média de valores totais de pedidos para um cliente específico
DECLARE
    v_cod_cliente NUMBER;
    v_total NUMBER := 0;
    v_count NUMBER := 0;
    v_media NUMBER := 0;
BEGIN
    v_cod_cliente := TO_NUMBER('&Informe_o_Codigo_do_Cliente');
    
    FOR pedido IN (SELECT VAL_TOTAL_PEDIDO FROM pedido WHERE COD_CLIENTE = v_cod_cliente) LOOP
        v_total := v_total + pedido.VAL_TOTAL_PEDIDO;
        v_count := v_count + 1;
    END LOOP;
    
    IF v_count > 0 THEN
        v_media := v_total / v_count;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Média de pedidos: ' || v_media);
END;
/

-- 3. Exibe os produtos compostos ativos
DECLARE
    CURSOR c_produtos IS
        SELECT COD_PRODUTO, COD_PRODUTO_RELACIONADO, QTD_PRODUTO, QTD_PRODUTO_RELACIONADO
        FROM produto_composto
        WHERE STA_ATIVO = '1';
BEGIN
    FOR produto IN c_produtos LOOP
        DBMS_OUTPUT.PUT_LINE('Produto: ' || produto.COD_PRODUTO || ' - Relacionado: ' || produto.COD_PRODUTO_RELACIONADO);
    END LOOP;
END;
/

-- 4. Calcula o total de movimentações de estoque usando INNER JOIN
DECLARE
    v_cod_produto NUMBER;
    v_total_movimentacao NUMBER := 0;
BEGIN
    v_cod_produto := TO_NUMBER('&Informe_o_Codigo_do_Produto');
    
    SELECT SUM(m.QTD_MOVIMENTACAO_ESTOQUE)
    INTO v_total_movimentacao
    FROM movimento_estoque m
    INNER JOIN tipo_movimento_estoque t ON m.COD_TIPO_MOVIMENTO_ESTOQUE = t.COD_TIPO_MOVIMENTO_ESTOQUE
    WHERE m.COD_PRODUTO = v_cod_produto;
    
    DBMS_OUTPUT.PUT_LINE('Total de movimentações: ' || v_total_movimentacao);
END;
/

-- 5. Exibe produtos compostos e informações de estoque com LEFT JOIN
DECLARE
    CURSOR c_produtos IS
        SELECT p.COD_PRODUTO, p.COD_PRODUTO_RELACIONADO, e.QTD_PRODUTO
        FROM produto_composto p
        LEFT JOIN estoque_produto e ON p.COD_PRODUTO = e.COD_PRODUTO;
BEGIN
    FOR produto IN c_produtos LOOP
        DBMS_OUTPUT.PUT_LINE('Produto: ' || produto.COD_PRODUTO || ' - Relacionado: ' || produto.COD_PRODUTO_RELACIONADO || ' - Estoque: ' || NVL(produto.QTD_PRODUTO, 0));
    END LOOP;
END;
/

-- 6. Exibe informações de pedidos e clientes com RIGHT JOIN
DECLARE
    CURSOR c_pedidos IS
        SELECT p.COD_PEDIDO, p.VAL_TOTAL_PEDIDO, c.NOM_CLIENTE
        FROM pedido p
        RIGHT JOIN cliente c ON p.COD_CLIENTE = c.COD_CLIENTE;
BEGIN
    FOR pedido IN c_pedidos LOOP
        DBMS_OUTPUT.PUT_LINE('Pedido: ' || NVL(pedido.COD_PEDIDO, 'Sem Pedido') || ' - Cliente: ' || pedido.NOM_CLIENTE);
    END LOOP;
END;
/

-- 7. Calcula a média de valores totais de pedidos e exibe informações do cliente com INNER JOIN
DECLARE
    v_cod_cliente NUMBER;
    v_media NUMBER := 0;
BEGIN
    v_cod_cliente := TO_NUMBER('&Informe_o_Codigo_do_Cliente');
    
    SELECT AVG(p.VAL_TOTAL_PEDIDO)
    INTO v_media
    FROM pedido p
    INNER JOIN cliente c ON p.COD_CLIENTE = c.COD_CLIENTE
    WHERE p.COD_CLIENTE = v_cod_cliente;
    
    DBMS_OUTPUT.PUT_LINE('Cliente: ' || v_cod_cliente || ' - Média de pedidos: ' || v_media);
END;
/
