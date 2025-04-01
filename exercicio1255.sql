// 1.	Escreva um procedimento em PL/SQL denominado "ListarPedidosCliente" que recebe o código de um cliente como parâmetro e lista todos os 
// pedidos associados a esse cliente, incluindo detalhes como o número do pedido, a data do pedido e o valor total.
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE ListarPedidosCliente(
codigo NUMBER) AS 

BEGIN
FOR t IN (SELECT cod_pedido, dat_pedido, val_total_pedido - val_desconto valortotal FROM pedido WHERE cod_cliente = codigo)LOOP
dbms_output.put_line('Código pedido: ' || t.cod_pedido || ' - Data pedido: ' ||  t.dat_pedido || ' - Valor Total: ' || t.valortotal); 
END LOOP;

END;

EXECUTE ListarPedidosCliente(111);

---------------------------------------------------------------------------------------------------------------------------------------------
//2.	Desenvolva um procedimento em PL/SQL chamado "ListarItensPedido" que aceita o código de um pedido como entrada e lista todos os 
//itens incluídos nesse pedido, fornecendo informações como o código do item, o nome do produto e a quantidade.
CREATE OR REPLACE PROCEDURE ListarItensPedido(
codigo.cod_pedido%TYPE) AS 

BEGIN
FORM item IN (
SELECT pe.cod_produto, p.nom_produto, ep.qtd_produto 
FROM pedido pe, produto p, estoque_produto ep 
WHERE cod_pedido = codigo
)LOOP
dmbs_output.put_line()
END LOOP;

END;

---------------------------------------------------------------------------------------------------------------------------------------------
//3.	Crie um procedimento em PL/SQL denominado "ListarMovimentosEstoqueProduto" que recebe o código de um produto como argumento e 
//lista todos os movimentos de estoque associados a esse produto, incluindo detalhes como a data do movimento e o tipo de movimento.

---------------------------------------------------------------------------------------------------------------------------------------------
//4.	Crie um procedimento chamado prc_insere_produto para todas as colunas da tabela de produtos, valide: Se o nome do produto tem mais de 
//3 caracteres e não contêm números (0 a 9)

---------------------------------------------------------------------------------------------------------------------------------------------
//5.	Crie um procedimento chamado prc_insere_cliente para inserir novos clientes, valide: Se o nome do cliente tem mais de 3 caracteres 
//e não contêm números (0 a 9)
