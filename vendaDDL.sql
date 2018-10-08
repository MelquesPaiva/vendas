drop database vendas_db;
CREATE DATABASE IF NOT EXISTS vendas_db;
USE vendas_db;
CREATE TABLE IF NOT EXISTS estabelecimento(id int(11) PRIMARY KEY AUTO_INCREMENT, descricao varchar(100), endereco varchar(100), cnpj varchar(20))
														 engine=InnoDB default charset=utf8;
														 
CREATE TABLE IF NOT EXISTS produto(id int(11) PRIMARY KEY AUTO_INCREMENT, descricao varchar(50), valor float)
											  engine=InnoDB default charset=utf8;
											  
CREATE TABLE IF NOT EXISTS venda(cod int(11) PRIMARY KEY AUTO_INCREMENT, hora datetime, id_estab int(11),
											FOREIGN KEY(id_estab) REFERENCES estabelecimento(id))
											engine=InnoDB default charset=utf8;
											
CREATE TABLE IF NOT EXISTS venda_produto(id int(11) PRIMARY KEY AUTO_INCREMENT, id_produto int(11), id_venda int(11), qtd float, valor_final float,
												   FOREIGN KEY(id_produto) REFERENCES produto(id),
													FOREIGN KEY(id_venda) REFERENCES venda(cod))
													engine=InnoDB default charset=utf8;
													
													
ALTER TABLE estabelecimento ADD COLUMN cidade varchar(100) after endereco;													