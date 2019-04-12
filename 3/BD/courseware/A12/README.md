# Used commands
_by page in the courseware_

## Before (with `.my.cnf` setted)
In the MySQL Server terminal:
``` sql
CREATE DATABASE a12locadora;
CREATE DATABASE a12vids;
exit;
```
In the Bash terminal:
``` bash
mysqldump a11locadora | mysql a12locadora;
mysqldump a11vids | mysql a12vids;
mysql
```

## p02
Back to the MySQL Server terminal:
``` sql
USE a12locadora;

ALTER TABLE clientes
ADD
cli_endereco VARCHAR(100);

DESC clientes;

ALTER TABLE filmes
ADD fil_direcao VARCHAR(50)
FIRST;

ALTER TABLE filmes 
ADD fil_atores VARCHAR(200)
AFTER fil_direcao;

DESC filmes;
```
## p03
``` sql
ALTER TABLE filmes DROP COLUMN fil_direcao;

DESC filmes;

ALTER TABLE filmes DROP fil_atores;

DESC filmes;

DESC clientes;

ALTER TABLE clientes CHANGE COLUMN cli_email cli_endereco_eletronico varchar(80);

DESC clientes;

ALTER TABLE clientes MODIFY COLUMN cli_nome varchar(50);
```
### v02
``` sql
USE a12vids;

CREATE TABLE carros (
car_codigo int,
car_marcar varchar(20)
);

SHOW TABLES;

DESC carros;

ALTER TABLE carros ADD coluna_teste int;

DESC carros;

ALTER TABLE carros ADD car_cor varchar(10) AFTER car_codigo;

DESC carros;

ALTER TABLE carros DROP COLUMN coluna_teste;

DESC carros;

ALTER TABLE carros CHANGE COLUMN car_marcar car_marca varchar(20);

DESC carros;

ALTER TABLE carros MODIFY COLUMN car_marca varchar(10);

DESC carros;
```
## p05
``` sql
CREATE DATABASE a12cineOnline;
USE a12cineOnline;

CREATE TABLE cinema (
cinema_codigo int NOT NULL,
cinema_nome varchar(40) NOT NULL,
cinema_sala varchar(2) NOT NULL,
cinema_capacidade_sala int NOT NULL,
cinema_cidade varchar(50) NOT NULL,
PRIMARY KEY(cinema_codigo)
);

DESC cinema;

CREATE TABLE filmes (
fil_codigo int NOT NULL,
fil_titulo varchar(50) NOT NULL,
fil_genero varchar(30) NOT NULL,
fil_censura char(8) NOT NULL DEFAULT 'Livre',
PRIMARY KEY (fil_codigo)
);

DESC filmes;

CREATE TABLE sessao (
ses_codigo int NOT NULL,
ses_codfilme int NOT NULL,
ses_codcinema int NOT NULL,
ses_datahora datetime NOT NULL,
ses_preco numeric(4,2) NOT NULL,
PRIMARY KEY (ses_codigo),
FOREIGN KEY (ses_codfilme) REFERENCES filmes (fil_codigo),
FOREIGN KEY (ses_codcinema) REFERENCES cinema (cinema_codigo)
);

DESC sessao;
```
### v03
``` sql
USE a12vids;

CREATE TABLE autores (
aut_codigo int NOT NULL,
aut_nome varchar(5) NOT NULL,
PRIMARY KEY (aut_codigo)
);

DESC autores;

CREATE TABLE obras(
obr_codigo int NOT NULL,
obr_titulo varchar(50) NOT NULL,
PRIMARY KEY (obr_codigo)
);

DESC obras;

CREATE TABLE autores_obras(
aut_obr_id int NOT NULL,
aut_cod int NOT NULL,
obr_cod int NOT NULL,
PRIMARY KEY (aut_obr_id),
FOREIGN KEY (aut_cod) REFERENCES autores (aut_codigo),
FOREIGN KEY (obr_cod) REFERENCES obras (obr_codigo)
);

DESC autores_obras;
```
## p06 (ativ)
### p06q1
``` sql
USE a12cineOnline;

CREATE TABLE clientes (
cli_cpf varchar(14) NOT NULL,
cli_nome varchar(50) NOT NULL,
cli_sexo char(1),
cli_dataNascimento date NOT NULL,
PRIMARY KEY (cli_cpf)
);

DESC clientes;

CREATE TABLE pgto (
pgt_codigo int NOT NULL,
pgt_nome varchar(10),
PRIMARY KEY (pgt_codigo)
);

DESC pgto;

CREATE TABLE compras(
comp_codigo int NOT NULL,
cli_cpf varchar(14) NOT NULL,
ses_cod int NOT NULL,
comp_qtInt int NOT NULL,
comp_qtMeia int NOT NULL,
pgt_cod int NOT NULL,
PRIMARY KEY (comp_codigo),
FOREIGN KEY (cli_cpf) REFERENCES clientes (cli_cpf),
FOREIGN KEY (ses_cod) REFERENCES sessao (ses_codigo),
FOREIGN KEY (pgt_cod) REFERENCES pgto (pgt_codigo)
);

DESC compras;
```
### p06q2
``` sql
INSERT INTO cinema
VALUES
(1,'Severiano Ribeiro','SV',150,'Natal'),
(2,'MovieCom','MC',200,'Recife'),
(3,'Cinemark','CM',250,'São Paulo');

INSERT INTO filmes
VALUES
(101,'The Matrix','Ficção Científica','14 anos'),
(102,'Parallels','Ficção Científica','14 anos'),
(103,'Avatar','Fantasia','12 anos'),
(104,'Sociedade dos Poetas Mortos','Drama','12 anos');

INSERT INTO sessao
VALUES
(201,102,3,'2011-01-10-14',20.70),
(202,101,2,'2011-02-11-15',30.50),
(203,103,2,'2010-03-12-16-30',10.40),
(204,101,1,'2012-04-13-17',40.52),
(205,103,3,'2012-05-14-18',16.82),
(206,101,3,'2013-06-15-19',30.12);

INSERT INTO clientes
VALUES
('001.001.001-01','Rodrigo','M','1995-05-09'),
('002.002.002-02','Marina','F','2000-07-09'),
('003.003.003-03','Geórgia','F','2005-08-04'),
('004.004.004-04','Luiza','F','1999-03-16'),
('005.005.005-05','João','M','1995-09-23');

INSERT INTO pgto
VALUES
(1,'Dinheiro'),
(2,'Crédito'),
(3,'Débito');

INSERT INTO compras
VALUES
(1001,'003.003.003-03',203,1,0,1),
(1002,'001.001.001-01',202,0,1,2),
(1003,'005.005.005-05',204,1,0,3),
(1004,'002.002.002-02',202,0,1,1);
```

## p07
``` sql
SELECT cli_nome, fil_titulo
FROM clientes CROSS JOIN filmes;
```
## p08
_Matching the data to those used in the courseware_
``` sql
DELETE FROM compras;
DELETE FROM sessao;
DELETE FROM cinema;
DELETE FROM filmes;

INSERT INTO cinema
VALUES
(1,'Cinemark','A',50,'Natal'),
(2,'Cinemark','B',60,'Natal'),
(3,'Cinemark','C',70,'Natal'),
(4,'Cinemark','D',80,'Natal'),
(5,'UCI','A',90,'Recife'),
(6,'UCI','B',100,'Recife'),
(7,'UCI','C',110,'Recife'),
(8,'UCI','D',120,'Recife');

INSERT INTO filmes
VALUES
(101,'Procurando Nemo','Animação','Livre'),
(102,'O Silêncio dos Inocentes','Policial','14 anos'),
(103,'Cidade de Deus','Ação','16 anos'),
(104,'E o Vento Levou','Romance','Livre'),
(105,'Shrek 3','Animação','Livre'),
(106,'Toy Story 3','Animação','Livre');

INSERT INTO sessao
(ses_codigo, ses_codfilme, ses_codcinema,
ses_datahora, ses_preco)
VALUES
(201,102,3,'2011-01-10-14',20.70),
(202,101,2,'2011-02-11-15',30.50),
(203,103,5,'2010-03-12-16-30',10.40),
(204,101,8,'2012-04-13-17',40.52),
(205,103,4,'2012-05-14-18',16.82),
(206,101,6,'2013-06-15-19',30.12);

INSERT INTO compras
VALUES
(1001,'003.003.003-03',203,1,0,1),
(1002,'001.001.001-01',202,0,1,2),
(1003,'005.005.005-05',204,1,0,3),
(1004,'002.002.002-02',202,0,1,1);
```
### Ex1
``` sql
SELECT ses_codigo, cinema_nome, cinema_sala
FROM filmes, sessao, cinema
WHERE fil_titulo = 'Procurando Nemo'
AND ses_codfilme = fil_codigo
AND cinema_codigo = ses_codcinema;
```
### Ex2
``` sql
SELECT fil_titulo, cinema_nome, cinema_sala 
FROM filmes, sessao, cinema 
WHERE fil_titulo <> 'Procurando Nemo' 
AND ses_codfilme = fil_codigo 
AND cinema_codigo = ses_codcinema;
```
### v04
``` sql
USE a12vids;

ALTER TABLE autores MODIFY COLUMN aut_nome varchar(60);

INSERT INTO autores
VALUES
(1,'Andrew S. Tanenbaun'),
(2,'Kurose'),
(3,'Ross'),
(4,'Date'),
(5,'Silberschatz'),
(6,'Korth'),
(7,'Sudarshan');

INSERT INTO obras
VALUES
(1,'Redes de Computadores'),
(2,'Redes de Computadores e a Internet'),
(3,'Introdução a Sistemas de BD'),
(4,'BD');

INSERT INTO autores_obras
VALUES
(1,1,1),
(2,2,2),
(3,3,2),
(4,4,3),
(5,5,4),
(6,6,4),
(7,7,4);

SELECT obr_titulo AS Livro, aut_nome AS Autor
FROM autores AS a, obras AS o, autores_obras ao
WHERE o.obr_titulo like '%BD%'
AND a.aut_codigo = ao.aut_cod
AND o.obr_codigo = ao.obr_cod;
```
## p09 (ativ)
### p09q2
``` sql
USE a12cineOnline;

SELECT * FROM clientes CROSS JOIN filmes;
```
### p09q3
``` sql
SELECT cinema_nome, cinema_sala, fil_titulo
FROM cinema, filmes
WHERE fil_titulo = 'Procurando Nemo'
ORDER BY cinema_nome;

SELECT cinema_nome, cinema_sala, fil_titulo
FROM cinema, filmes
WHERE fil_titulo = 'Procurando Nemo'
ORDER BY 1,2;
```
### p09q5
``` sql
SELECT ses_codigo, cinema_nome, cinema_sala,
ROUND(
(SUM(comp_qtInt)*ses_preco)
+
(SUM(comp_qtMeia)*(ses_preco/2))
,2) as Faturamento
FROM filmes, sessao, cinema, compras
WHERE fil_titulo = 'Procurando Nemo'
AND ses_codfilme = fil_codigo
AND cinema_codigo = ses_codcinema
AND ses_cod = ses_codigo
GROUP BY ses_codigo;
```
## p12 (ativ)
### p12q1
``` sql
CREATE DATABASE a12p12;
USE a12p12;
```
### p12q2a
``` sql
CREATE TABLE clientes(
cli_cpf varchar(14) NOT NULL,
cli_nome varchar(50) NOT NULL,
cli_profissao varchar(50),
cli_saldoPontos int NOT NULL DEFAULT 0,
PRIMARY KEY (cli_cpf)
);

INSERT INTO clientes
VALUES
('001.001.001-01','Pedro','Bancário',0),
('002.002.002-02','Joana','Empresária',0),
('003.003.003-03','Fátima','Jornalista',0);
```
### p12q2b
``` sql
CREATE TABLE compras(
comp_codigo int NOT NULL,
cliente_cpf varchar(14) NOT NULL,
comp_data date NOT NULL,
comp_valor numeric (5,2),
comp_ptsGanhos int NOT NULL,
PRIMARY KEY (comp_codigo),
FOREIGN KEY (cliente_cpf) REFERENCES clientes (cli_cpf)
);

INSERT INTO compras
VALUES
(1,'001.001.001-01','2013-04-02',30,3),
(2,'002.002.002-02','2014-01-03',40,4),
(3,'001.001.001-01','2013-05-04',50,5),
(4,'003.003.003-03','2016-05-08',60,6);
```
### p12q2c
``` sql
CREATE TABLE premios(
prem_codigo int NOT NULL,
prem_descricao varchar(100) NOT NULL,
prem_valorPontos int NOT NULL,
prem_qtEstoque int NOT NULL DEFAULT 0,
PRIMARY KEY (prem_codigo)
);

INSERT INTO premios
VALUES
(101,'Relógio de plástico',4,40),
(102,'Almofada',3,30),
(103,'Calendário de geladeira',2,20);
```
### p12q2d
``` sql
CREATE TABLE trocas(
troca_codigo int NOT NULL,
client_cpf varchar(14) NOT NULL,
prem_cod int NOT NULL,
troca_qtd int NOT NULL,
troca_data date NOT NULL,
PRIMARY KEY (troca_codigo),
FOREIGN KEY (client_cpf) REFERENCES clientes (cli_cpf),
FOREIGN KEY (prem_cod) REFERENCES premios (prem_codigo)
);

INSERT INTO trocas
VALUES
(201,'003.003.003-03',103,1,'2016-07-05'),
(202,'001.001.001-01',102,1,'2014-03-08'),
(203,'003.003.003-03',103,1,'2017-08-03'),
(204,'001.001.001-01',103,1,'2015-04-07'),
(205,'001.001.001-01',103,1,'2016-09-04');
```
### p12q3
``` sql
ALTER TABLE clientes ADD COLUMN cli_email varchar(100) NOT NULL;
DESC clientes;
```
### p12q4
``` sql
SELECT troca_data, cli_nome, prem_descricao, troca_qtd
FROM clientes, premios, trocas
WHERE cli_cpf = client_cpf
AND prem_cod = prem_codigo
ORDER BY troca_data;
```
### p12q5
``` sql
UPDATE clientes SET cli_saldoPontos = (SELECT SUM(comp_ptsGanhos) FROM compras WHERE compras.cliente_cpf = clientes.cli_cpf);

SELECT * FROM clientes;
SELECT * FROM premios;

INSERT INTO premios
VALUES
(104,'Rádio portátil',7,10);

SELECT cli_nome, cli_saldoPontos, prem_descricao, prem_valorPontos
FROM clientes, premios
WHERE cli_saldoPontos >= prem_valorPontos
ORDER BY cli_nome;
```
