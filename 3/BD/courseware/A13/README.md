# Used commands
_by page in the courseware_

## Before (with `.my.cnf` setted)
In the MySQL Server terminal:
``` sql
CREATE DATABASE a13vids;
CREATE DATABASE a13cineOnline;
CREATE DATABASE a13locadora;
exit;
```
In the Bash terminal:
``` bash
mysqldump a12vids | mysql a13vids;
mysqldump a12cineOnline | mysql a13cineOnline;
mysqldump a12locadora | mysql a13locadora;
mysql
```

## p02
Back to the MySQL Server terminal:
### creation of the DB
``` sql
CREATE DATABASE a13sistVendas;
USE a13sistVendas;
```
### criation of the table
``` sql
CREATE TABLE produtos (
prod_codigo int NOT NULL,
prod_nome varchar(100) NOT NULL,
prod_marca varchar(40) NOT NULL,
prod_preco decimal(9,2) NOT NULL,
PRIMARY KEY (prod_codigo)
);

CREATE TABLE clientes (
cli_codigo int NOT NULL,
cli_nome varchar(50) NOT NULL,
cli_cpf varchar(11) NOT NULL,
cli_sexo char(1) NOT NULL,
cli_dataNascimento datetime NOT NULL,
PRIMARY KEY (cli_codigo)
);

CREATE TABLE compras (
comp_codigo int NOT NULL,
comp_codproduto int NOT NULL,
comp_codcliente int NOT NULL,
comp_total int NOT NULL,
PRIMARY KEY (comp_codigo),
FOREIGN KEY (comp_codproduto) REFERENCES produtos (prod_codigo),
FOREIGN KEY (comp_codcliente) REFERENCES clientes (cli_codigo)
);
```
### Data inserting on tables
``` sql
INSERT INTO produtos
VALUES
(1,'Ventilador','Arno',90),
(2,'Celular N97','Nokia',1200),
(3,'Chocolate Sonho de Valsa','Lacta',0.8),
(4,'Geladeira','Brastemp',2000);

INSERT INTO clientes
VALUES
(1,'José Josemar','3252541','M','1980-10-03'),
(2,'Luciana','4812072','F','1972-04-30');

INSERT INTO compras
VALUES
(1,3,2,30),
(2,2,2,1),
(3,4,1,1),
(4,3,1,100);

SELECT comp_codproduto FROM compras;
```
## p03
``` sql
SELECT prod_nome FROM produtos
WHERE prod_codigo IN (2,3,4);

SELECT prod_nome
FROM produtos
WHERE prod_codigo IN (
SELECT comp_codproduto FROM compras
);

SELECT prod_nome
FROM produtos, compras
WHERE prod_codigo = comp_codproduto
GROUP BY prod_nome;
```
## p04 (ativ)
``` sql
USE a13sistVendas;

SELECT cli_nome
FROM clientes
WHERE cli_codigo IN
(SELECT comp_codcliente FROM compras);

SELECT cli_nome, prod_nome
FROM clientes, produtos
WHERE cli_codigo = 1 AND
prod_codigo IN (SELECT comp_codproduto FROM compras WHERE comp_codcliente = 1);

SELECT cli_nome, prod_nome
FROM clientes, produtos
WHERE cli_codigo = 2 AND
prod_codigo IN (SELECT comp_codproduto FROM compras WHERE comp_codcliente = 2);

SELECT cli_nome, prod_nome
FROM clientes, produtos, compras
WHERE prod_codigo IN (SELECT comp_codproduto FROM compras)
AND cli_codigo = comp_codcliente
AND prod_codigo = comp_codproduto;
```
or...
``` sql
SELECT cli_nome, prod_nome
FROM clientes, produtos, compras
WHERE cli_codigo = comp_codcliente
AND prod_codigo = comp_codproduto;
```
## p05
``` sql
SELECT prod_nome
FROM produtos
WHERE prod_preco = (SELECT MAX(prod_preco) FROM produtos);
```
or...
``` sql
SELECT prod_nome, prod_preco FROM produtos WHERE prod_preco = (SELECT MAX(prod_preco) FROM produtos);
```
### v02
``` sql
USE a13vids;

SELECT obr_cod, COUNT(*)
FROM autores_obras
GROUP BY obr_cod;

SELECT COUNT(*)
FROM autores_obras
GROUP BY obr_cod
ORDER BY 1 DESC;

SELECT COUNT(*)
FROM autores_obras
GROUP BY obr_cod
ORDER BY 1 DESC
LIMIT 0,1;

SELECT obr_titulo, COUNT(*)
FROM obras AS o, autores_obras AS ao
WHERE o.obr_codigo = ao.obr_cod
GROUP BY obr_titulo
HAVING COUNT(*) = (
SELECT COUNT(*)
FROM autores_obras
GROUP BY obr_cod
ORDER BY 1 DESC
LIMIT 0,1
);
```
## p07
``` sql
USE a13sistVendas;

SELECT prod_nome, (
SELECT SUM(comp_total)
FROM compras
WHERE prod_codigo = comp_codproduto
) AS 'qtd vendida'
FROM produtos;
```
## p08 (ativs)
### p08q1a
``` sql
SELECT prod_nome, (
SELECT count(comp_codproduto)
FROM compras
WHERE comp_codproduto = prod_codigo
) as 'qt comprada'
FROM produtos;
```
### p08q1b
``` sql
SELECT comp_codigo, prod_nome, (
SELECT cli_nome
FROM clientes
WHERE cli_codigo=1
) AS cli1nome, (
SELECT cli_cpf
FROM clientes
WHERE cli_codigo=1
) AS cli1cpf
FROM compras, produtos
WHERE comp_codproduto = prod_codigo
AND comp_codcliente = 1;
```
### p08q1c
``` sql
SELECT prod_nome, (
SELECT cli_nome
FROM clientes
WHERE cli_codigo=1
) AS cliente1
FROM compras, produtos
WHERE comp_codproduto = prod_codigo
AND comp_codcliente=1;
```
## p09
``` sql
SELECT cli_nome, (
SELECT SUM(comp_total)
FROM compras
WHERE cli_codigo= comp_codcliente
) AS itenscomprados
FROM clientes;

SELECT cli_nome, prod_nome 
FROM clientes, produtos 
WHERE prod_codigo IN (
SELECT comp_codproduto
FROM compras
WHERE comp_codcliente=1
) AND cli_codigo=1;

SELECT comp_codproduto
FROM compras
WHERE comp_codcliente=1;
```
### v03
``` sql
USE a13vids;
```
#### Updating the tables
``` sql
SELECT * FROM autores;

INSERT INTO autores (aut_codigo, aut_nome)
VALUES (8, 'Manzano');

SELECT * FROM obras;

INSERT INTO obras (obr_codigo, obr_titulo)
VALUES (5, 'SQL Server 2008');

INSERT INTO obras (obr_codigo, obr_titulo)
VALUES (6,'Algoritmos');

SELECT * FROM autores_obras;

INSERT INTO autores_obras (aut_obr_id, aut_cod, obr_cod)
VALUES (8,8,5);

INSERT INTO autores_obras(aut_obr_id, aut_cod, obr_cod)
VALUES (9,8,6);

SELECT * FROM autores_obras;
```
#### Query using cross join
``` sql
SELECT aut_nome, count(ao.aut_cod)
FROM autores a, autores_obras ao
WHERE a.aut_codigo = ao.aut_cod
GROUP BY aut_nome;
```
#### Query using subquery
``` sql
SELECT aut_nome, (
SELECT COUNT(ao.aut_cod)
FROM autores_obras AS ao
WHERE a.aut_codigo = ao.aut_cod
) as 'qt obras'
FROM autores AS a;
```
## p10
``` sql
USE a13sistVendas;

SELECT prod_nome
FROM produtos
WHERE NOT EXISTS (
SELECT * FROM compras
WHERE prod_codigo = comp_codproduto
);

SELECT prod_nome
FROM produtos
WHERE EXISTS (
SELECT * FROM compras
WHERE prod_codigo = comp_codproduto
);
```
### v04
``` sql
USE a13vids;

INSERT INTO autores
(aut_codigo, aut_nome)
VALUES (9,'Isaías Boratti');

INSERT INTO autores
(aut_codigo, aut_nome)
VALUES (10,'Karin Breitman');
```
#### with `EXISTS`
``` sql
SELECT aut_nome
FROM autores AS a
WHERE NOT EXISTS (
SELECT * FROM autores_obras AS ao
WHERE a.aut_codigo = ao.aut_cod
);
```
#### with `NOT EXISTS`
``` sql
SELECT aut_nome
FROM autores AS a
WHERE EXISTS (
SELECT * FROM autores_obras AS ao
WHERE a.aut_codigo = ao.aut_cod
);
```
#### alternative to `NOT EXISTS`
``` sql
SELECT DISTINCT (aut_nome)
FROM autores AS a, autores_obras AS ao
WHERE a.aut_codigo = ao.aut_cod;

/* manzano is on more than one row */
SELECT aut_nome
FROM autores AS a, autores_obras AS ao
WHERE a.aut_codigo = ao.aut_cod;
```
## p11 (ativ)
### p11q1
``` sql
USE a13cineOnline;
```
### p11q1a
``` sql
SELECT fil_titulo
FROM filmes
WHERE EXISTS (
SELECT * FROM compras, sessao
WHERE ses_codfilme = fil_codigo
AND ses_codigo = ses_cod
);
```
### p11q1b
``` sql
SELECT cli_nome
FROM clientes
WHERE NOT EXISTS (
SELECT * FROM compras
WHERE clientes.cli_cpf = compras.cli_cpf
);
```
## p14 (ativ)
### p14q3
``` sql
USE a13locadora;
```
### p14q3a
``` sql
DESC clientes;

ALTER TABLE clientes DROP COLUMN cli_data_nasc;
ALTER TABLE clientes DROP COLUMN cli_endereco_eletronico;
ALTER TABLE clientes DROP COLUMN cli_endereco;
ALTER TABLE clientes ADD COLUMN cli_profissao varchar(20);
ALTER TABLE clientes ADD COLUMN cli_salario decimal(7,2);
ALTER TABLE clientes ADD PRIMARY KEY (cli_codigo);

UPDATE clientes SET cli_profissao='Administrador', cli_salario='3500' WHERE cli_codigo = 1;
UPDATE clientes SET cli_profissao='Arquiteta', cli_salario='900' WHERE cli_codigo = 2;
UPDATE clientes SET cli_profissao='Dev Web', cli_salario='9000' WHERE cli_codigo = 3;
UPDATE clientes SET cli_profissao='Programadora', cli_salario='4500' WHERE cli_codigo = 4;

DESC clientes;

SELECT * FROM clientes;
```
### p14q3b
``` sql
DESC filmes;

ALTER TABLE filmes ADD PRIMARY KEY (fil_codigo);
ALTER TABLE filmes ADD COLUMN fil_ano int AFTER fil_duracao;

UPDATE filmes SET fil_ano=1939 WHERE fil_codigo = 1;
UPDATE filmes SET fil_ano=1991 WHERE fil_codigo = 2;
UPDATE filmes SET fil_ano=2003 WHERE fil_codigo = 3;
UPDATE filmes SET fil_ano=2002 WHERE fil_codigo = 4;
UPDATE filmes SET fil_ano=1939 WHERE fil_codigo = 5;

DESC FILMES;

SELECT * FROM filmes;
```
### p14q3c
``` sql
CREATE TABLE locacoes (
loc_codigo INT NOT NULL AUTO_INCREMENT,
loc_cl_cod INT NOT NULL,
loc_fi_cod  INT NOT NULL,
loc_data DATE NOT NULL,
PRIMARY KEY (loc_codigo),
FOREIGN KEY (loc_cl_cod) REFERENCES clientes (cli_codigo),
FOREIGN KEY (loc_fi_cod) REFERENCES filmes (fil_codigo)
);

INSERT INTO locacoes
(loc_cl_cod, loc_fi_cod,loc_data)
VALUES
(1,3,'2019-01-01'),
(1,5,'2019-01-15'),
(3,2,'2019-02-01'),
(4,2,'2019-02-15'),
(4,4,'2019-03-01');
```
### p14q4a
``` sql
SELECT cli_nome
FROM clientes
WHERE cli_codigo IN (SELECT loc_cl_cod FROM locacoes);
```
### p14q4b
``` sql
SELECT fil_titulo, fil_genero
FROM filmes
WHERE fil_codigo IN (SELECT loc_fi_cod FROM locacoes);
```
### p14q4c
``` sql
INSERT INTO filmes
VALUES
(6,'Minha Mãe é uma Peça','comédia','01:25:00',2013,'alugado',6);

INSERT INTO locacoes
(loc_cl_cod, loc_fi_cod,loc_data)
VALUES
(3,6,'2019-03-15');
```
#### Solution using sub-subquery
``` sql
SELECT cli_profissao, cli_sexo
FROM clientes
WHERE cli_codigo IN (
SELECT loc_cl_cod
FROM locacoes
WHERE loc_fi_cod IN (
SELECT fil_codigo
FROM filmes
WHERE fil_genero = 'comédia'
)
);
```
#### Solution using subquery
``` sql
SELECT cli_profissao, cli_sexo
FROM clientes, filmes
WHERE fil_genero = 'comédia'
AND cli_codigo IN (
SELECT loc_cl_cod
FROM locacoes
WHERE loc_fi_cod = fil_codigo
);
```
### p14q4d
``` sql
INSERT INTO clientes
VALUES
(5,'Rodolfo','123456789-01','M','Estudante',400),
(6,'Ana','987654321-12','F','Estudante',800);

INSERT INTO locacoes
(loc_cl_cod,loc_fi_cod,loc_data)
VALUES
(5,6,'2019-04-01'),
(6,3,'2019-04-15');

SELECT cli_nome, fil_genero, fil_titulo
FROM clientes, filmes
WHERE fil_codigo IN (
SELECT loc_fi_cod
FROM locacoes
WHERE loc_cl_cod = cli_codigo
)
AND cli_profissao = 'Estudante';
```
### p14q4e
``` sql
INSERT INTO filmes
VALUES
(7,'O Código Da Vinci','suspense','02:54',2006,'disponível',2.90),
(8,'Gravidade','suspense','01:31',2013,'alugado',3.6),
(9,'O Sexto Sentido','suspense','02:10',1999,'disponível',1.9),
(10,'O Guarda-Costas','suspense','02:10',1992,'alugado',0.9);

INSERT INTO locacoes
(loc_cl_cod,loc_fi_cod,loc_data)
VALUES
(1,7,'2019-05-01'),
(6,9,'2019-05-15'),
(4,10,'2019-06-01'),
(3,8,'2019-06-15'),
(6,9,'2019-07-01');
```
#### Solution using sub-subquery
``` sql
SELECT cli_sexo, COUNT(cli_sexo)
FROM clientes
WHERE cli_codigo IN (
SELECT loc_cl_cod
FROM locacoes
WHERE loc_fi_cod IN (
SELECT fil_codigo
FROM filmes
WHERE fil_genero = 'suspense'
)
)
GROUP BY cli_sexo;
```
#### Solution using `EXISTS` test
``` sql
SELECT cli_sexo, COUNT(cli_sexo)
FROM clientes
WHERE EXISTS (
	SELECT * FROM locacoes, filmes
WHERE cli_codigo = loc_cl_cod
AND fil_genero = 'suspense'
AND fil_codigo = loc_fi_cod
) GROUP BY cli_sexo;
```
### p14q4f
``` sql
INSERT INTO filmes
VALUES
(11,'Aquaman','aventura','02:22',2018,'alugado',6.5);

INSERT INTO locacoes
(loc_cl_cod,loc_fi_cod,loc_data)
VALUES
(6,11,'2019-07-15'),
(5,11,'2019-08-01'),
(4,11,'2019-08-15');
```
#### Solution using sub-subquery
``` sql
SELECT AVG(cli_salario)
FROM clientes
WHERE cli_codigo IN (
SELECT loc_cl_cod
FROM locacoes
WHERE loc_fi_cod IN (
SELECT fil_codigo
FROM filmes
WHERE fil_genero = 'aventura'
)
);
```
#### Solution using subquery
``` sql
SELECT AVG(cli_salario)
FROM clientes
WHERE cli_codigo IN (
SELECT loc_cl_cod
FROM locacoes, filmes
WHERE fil_genero = 'aventura'
AND fil_codigo = loc_fi_cod
);
```
### p14q4g
``` sql
SELECT cli_nome
FROM clientes
WHERE cli_codigo IN (
SELECT loc_cl_cod
FROM locacoes
WHERE loc_fi_cod IN (1,5)
);
```
### p14q4h
``` sql
SELECT loc_codigo, cli_nome, cli_cpf, fil_titulo, fil_genero, fil_preco, loc_data
FROM locacoes, clientes, filmes
WHERE loc_fi_cod = fil_codigo
AND loc_cl_cod = cli_codigo
ORDER BY loc_codigo;
```
### p14q4i
#### Updating the data
``` sql
ALTER TABLE locacoes ADD COLUMN loc_gp INT AFTER loc_codigo;
UPDATE locacoes SET loc_gp = 1 WHERE loc_codigo = 1;
UPDATE locacoes SET loc_gp = 2 WHERE loc_codigo = 2;
UPDATE locacoes SET loc_gp = 3 WHERE loc_codigo = 3;
UPDATE locacoes SET loc_gp = 4 WHERE loc_codigo = 4;
UPDATE locacoes SET loc_gp = 4 WHERE loc_codigo = 5;
UPDATE locacoes SET loc_gp = 5 WHERE loc_codigo = 6;
UPDATE locacoes SET loc_gp = 6 WHERE loc_codigo = 7;
UPDATE locacoes SET loc_gp = 6 WHERE loc_codigo = 8;
UPDATE locacoes SET loc_gp = 7 WHERE loc_codigo = 9;
UPDATE locacoes SET loc_gp = 8 WHERE loc_codigo = 10;
UPDATE locacoes SET loc_gp = 9 WHERE loc_codigo = 11;
UPDATE locacoes SET loc_gp = 10 WHERE loc_codigo = 12;
UPDATE locacoes SET loc_gp = 11 WHERE loc_codigo = 13;
UPDATE locacoes SET loc_gp = 12 WHERE loc_codigo = 14;
UPDATE locacoes SET loc_gp = 12 WHERE loc_codigo = 15;
UPDATE locacoes SET loc_gp = 12 WHERE loc_codigo = 16;
UPDATE locacoes SET loc_fi_cod = 8 WHERE loc_codigo = 14;
UPDATE locacoes SET loc_fi_cod = 3 WHERE loc_codigo = 15;
```
#### DB normalization
``` sql
ALTER TABLE locacoes DROP FOREIGN KEY `locacoes_ibfk_1`;
ALTER TABLE locacoes DROP COLUMN loc_cl_cod;

ALTER TABLE locacoes DROP COLUMN loc_data;

CREATE TABLE loc_gps (
loc_gp_codigo int NOT NULL,
loc_cl_cod int NOT NULL,
loc_data date,
PRIMARY KEY (loc_gp_codigo),
FOREIGN KEY (loc_cl_cod) REFERENCES clientes (cli_codigo)
);

INSERT INTO loc_gps
VALUES
(1,1,'2019-01-01'),
(2,1,'2019-01-15'),
(3,3,'2019-02-01'),
(4,4,'2019-03-01'),
(5,3,'2019-03-15'),
(6,5,'2019-04-15'),
(7,1,'2019-05-01'),
(8,6,'2019-05-15'),
(9,4,'2019-06-01'),
(10,3,'2019-06-15'),
(11,6,'2019-07-01'),
(12,6,'2019-08-15');

ALTER TABLE locacoes ADD FOREIGN KEY (loc_gp) REFERENCES loc_gps (loc_gp_codigo);

SELECT * FROM locacoes;
SELECT cli_codigo, cli_nome FROM clientes;
SELECT fil_codigo, fil_titulo, fil_preco FROM filmes;
```
#### Answering the question
``` sql
SELECT
lg.loc_gp_codigo,
c.cli_nome,
lg.loc_data,
(
SELECT COUNT(loc_gp) AS qtd_films_alug
FROM locacoes AS l
WHERE l.loc_gp = lg.loc_gp_codigo
) AS qt_f_alug,
(	
SELECT sum(fil_preco)
FROM
filmes AS f,
locacoes As l
WHERE
f.fil_codigo = l.loc_fi_cod
AND l.loc_gp = lg.loc_gp_codigo
) AS preco_tot
FROM
loc_gps AS lg,
clientes AS c
WHERE loc_cl_cod = cli_codigo
ORDER BY 1;
```
