USE vendas_db;
INSERT INTO estabelecimento (descricao, endereco, cidade, cnpj) VALUES 
				('BRASA BRASILEIRA - LTDA', 'AV.JESIEL NORBERTO, 1200', 'Vitória da Conquista', '18.207.699/0001-20');
				
INSERT INTO produto (descricao, valor) VALUES ('fanta laranja lata', 4.00); 				
INSERT INTO produto (descricao, valor) VALUES ('coca-cola lata', 4.50);
INSERT INTO produto (descricao, valor) VALUES ('pepsi lata', 3.90);
INSERT INTO produto (descricao, valor) VALUES ('comida', 34.99);

INSERT INTO venda (hora, id_estab) VALUES (now(), 1);
INSERT INTO venda (hora, id_estab) VALUES (now(), 1);

INSERT INTO venda_produto (id_produto, id_venda, qtd, valor_final) VALUES (1, 1, 1, (select p.valor from produto p where id = 1) * qtd);
INSERT INTO venda_produto (id_produto, id_venda, qtd, valor_final) VALUES (4, 1, 0.45, (select p.valor from produto p where id = 4) * qtd);
INSERT INTO venda_produto (id_produto, id_venda, qtd, valor_final) VALUES (2, 2, 2, (select p.valor from produto p where id = 1) * qtd);
INSERT INTO venda_produto (id_produto, id_venda, qtd, valor_final) VALUES (4, 2, 0.70, (select p.valor from produto p where id = 4) * qtd);


SELECT * FROM estabelecimento e WHERE e.id = 1;			 
			 
SELECT (CEIL(vp.qtd)) as QTD_PRODUTOS, SUM(TRUNCATE(vp.valor_final,2)) as VALOR_FINAL,
			 v.hora, p.descricao FROM venda_produto vp
			 INNER JOIN venda v ON v.cod = vp.id_venda AND v.cod = 2
			 INNER JOIN produto p ON p.id = vp.id_produto GROUP BY (p.descricao);

SELECT SUM(CEIL(vp.qtd)) as QTD_PRODUTOS, SUM(TRUNCATE(vp.valor_final,2)) as Total,
			 v.hora FROM venda_produto vp
			 INNER JOIN venda v ON v.cod = vp.id_venda AND v.cod = 2;			 
			 
		 
			 