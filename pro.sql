@ 'C:\Users\labsfiap\Desktop\SQL\SCRIPT_MODELO_PEDIDO(1).SQL';

ALTER TABLE CIDADE MODIFY NOM_CIDADE VARCHAR2(50);
ALTER TABLE PEDIDO ADD STATUS VARCHAR2 (50);

-- Inserindo em pais
INSERT INTO pais SELECT * FROM PF1788.PAIS;
COMMIT;

-- Inserindo em estado (depende de pais)
INSERT INTO estado SELECT * FROM PF1788.ESTADO;
COMMIT;

-- Inserindo em cidade (depende de estado)
INSERT INTO cidade SELECT * FROM PF1788.CIDADE;
COMMIT;

-- Inserindo em estoque
INSERT INTO estoque SELECT * FROM PF1788.ESTOQUE;
COMMIT;

-- Inserindo em tipo_endereco
INSERT INTO tipo_endereco SELECT * FROM PF1788.TIPO_ENDERECO;
COMMIT;

-- Inserindo em cliente
INSERT INTO cliente SELECT * FROM PF1788.CLIENTE;
COMMIT;

-- Inserindo em vendedor
INSERT INTO vendedor SELECT * FROM PF1788.VENDEDOR;
COMMIT;

-- Inserindo em usuario
INSERT INTO usuario SELECT * FROM PF1788.USUARIO;
COMMIT;

-- Inserindo em endereco_cliente (depende de cliente e tipo_endereco)
INSERT INTO endereco_cliente SELECT * FROM PF1788.ENDERECO_CLIENTE;
COMMIT;

-- Inserindo em cliente_vendedor (depende de cliente e vendedor)
INSERT INTO cliente_vendedor SELECT * FROM PF1788.CLIENTE_VENDEDOR;
COMMIT;

-- Inserindo em produto
INSERT INTO produto SELECT * FROM PF1788.PRODUTO;
COMMIT;

-- Inserindo em produto_composto (depende de produto)
INSERT INTO produto_composto SELECT * FROM PF1788.PRODUTO_COMPOSTO;
COMMIT;

-- Inserindo em estoque_produto (depende de produto e estoque)
INSERT INTO estoque_produto SELECT * FROM PF1788.ESTOQUE_PRODUTO;
COMMIT;

-- Inserindo em tipo_movimento_estoque
INSERT INTO tipo_movimento_estoque SELECT * FROM PF1788.TIPO_MOVIMENTO_ESTOQUE;
COMMIT;

-- Inserindo em movimento_estoque (depende de produto e tipo_movimento_estoque)
INSERT INTO movimento_estoque SELECT * FROM PF1788.MOVIMENTO_ESTOQUE;
COMMIT;

-- Inserindo em pedido (depende de cliente, usuario, vendedor, endereco_cliente)
INSERT INTO pedido SELECT * FROM PF1788.PEDIDO;
COMMIT;

-- Inserindo em item_pedido (depende de pedido e produto)
INSERT INTO item_pedido SELECT * FROM PF1788.ITEM_PEDIDO;
COMMIT;

-- Inserindo em historico_pedido (depende de pedido, cliente, endereco_cliente e vendedor)
INSERT INTO historico_pedido SELECT * FROM PF1788.HISTORICO_PEDIDO;
COMMIT;
