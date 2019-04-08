# Used commands
_by page in the courseware_

## p02
CREATE DATABASE a09;
USE a09;

### Vid 02
CREATE DATABASE a09vids;
USE a09vids;
SHOW DATABASES;
DROP DATABASE a09vids;
SHOW DATABASES;
CREATE DATABASE a09vids;
SHOW DATABASES;
USE a09vids;

CREATE TABLE pessoas (
pes_cod int,
pes_nome varchar(50),
pes_cidade varchar(30),
pes_filhos tinyint);

SHOW TABLES;

## p04
USE a09;

CREATE TABLE clientes (
cli_codigo INT,
cli_nome VARCHAR(30),
cli_cpf CHAR(12),
cli_data_nasc DATE,
cli_sexo CHAR(1),
cli_email VARCHAR(50)
);

CREATE TABLE filmes (
fil_codigo INT,
fil_titulo VARCHAR(40),
fil_genero VARCHAR(15),
fil_duracao TIME,
fil_situacao VARCHAR(12),
fil_preco NUMERIC(3,2)
);

## p05 (ativ)
### q01
CREATE DATABASE a09p5q1;
USE a09p5q1;

CREATE TABLE funcionarios (
func_id int,
func_nome varchar(100)
);

CREATE TABLE estoque (
prod_id int,
prod_nome varchar(100),
prod_qtd int
);

SHOW TABLES;

## p06
USE a09;

INSERT INTO clientes
(cli_codigo, cli_nome, cli_cpf, cli_data_nasc, cli_sexo, cli_email)
VALUES
(1, 'José da Silva', '123456789-10', '1980-12-10', 'M', 'joseSilva@cursoSQL.com');

INSERT INTO clientes
(cli_codigo, cli_email, cli_nome, cli_cpf, cli_data_nasc, cli_sexo)
VALUES
(2, 'mariaSilva@cursoSQL.com', 'Maria da Silva', '012345678-99', '1982-02-28', 'F');

INSERT INTO clientes
VALUES
(3, 'Francisco da Silva', '109876543-21', '1990-01-01', 'M', 'franciscoSilva@cursoSQL.com');

INSERT INTO clientes
(cli_codigo, cli_nome, cli_sexo, cli_email)
VALUES
(4, 'Francisca da Silva', 'F', 'franciscaSilva@cursoSQL.com');

### Vid 3
USE a09vids;

SHOW TABLES;

INSERT INTO pessoas
VALUES
(1,'João','Parnamirim',2),
(2,'Maria','Ceará Mirim',1),
(3,'Carlos','Natal',0),
(4,'Camila','Natal',3),
(5,'Carla','Natal',0),
(6,'Daniel','Recife',1),
(7,'Danilo','Recife',2),
(8,'Eduardo','João Pessoa',3),
(9,'Ernesto','João Pessoa',2),
(10,'Fabíola','João Pessoa',1),
(11,'Gabriela','Rio de Janeiro',0),
(12,'Iara','São Paulo',1);

## p07 (ativ)
USE a09;
### 1a
INSERT INTO filmes
(fil_codigo, fil_titulo, fil_genero, fil_duracao, fil_situacao, fil_preco)
VALUES
(1, 'E o vento Levou', 'romance', '0:03:10', 'alugado', 5.00);
### 1b
INSERT INTO filmes
(fil_codigo, fil_titulo, fil_genero, fil_duracao, fil_situacao,fil_preco)
VALUES
(2, 'O silêncio dos inocentes', 'policial', '0:02:00', 'disponível', 02.50);

### 1c
INSERT INTO filmes VALUES
(3, 'Procurando Nemo', 'animação', '0:01:40','alugado', 02.50);

### 1d
INSERT INTO filmes
(fil_codigo, fil_titulo, fil_genero, fil_situacao, fil_duracao)
VALUES
(4, 'Cidade de Deus', 'ação', 'disponível', '0:02:10');

## p08
USE a09;

UPDATE clientes
SET cli_email = 'silvajose@cursosql.com'
WHERE cli_nome = 'José da Silva';

UPDATE filmes
SET fil_preco = fil_preco - 1;

UPDATE filmes
SET fil_preco = 4.50;

## p09
DELETE FROM clientes
WHERE cli_sexo = 'M';

DELETE FROM filmes
WHERE fil_genero= 'terror';

DELETE FROM filmes;

DROP TABLE filmes;

### Vid 4
USE a09vids;
ALTER TABLE pessoas ADD pes_nascimento date;

UPDATE pessoas
SET pes_nascimento = '1990/01/29'
WHERE pes_cod = 1;

UPDATE pessoas
SET pes_nascimento = '1982/03/12'
WHERE pes_cod = 3;

UPDATE pessoas SET pes_nascimento = '2001/05/02' WHERE pes_cod = 5;

UPDATE pessoas SET pes_nascimento = '1994/07/21' WHERE pes_cod = 7;

UPDATE pessoas SET pes_nascimento = '1997/09/16' WHERE pes_cod = 9;

DELETE FROM pessoas WHERE pes_cidade = 'São Paulo' OR pes_cidade = 'Rio de Janeiro';

## p13 (ativ)
### q1
CREATE DATABASE a09p13;
USE a09p13;

### q2
CREATE TABLE alunos (
aluno_cod int,
aluno_nome varchar(100),
aluno_endereco varchar(200),
aluno_cidade varchar(100)
);

CREATE TABLE disciplina (
dis_cod int,
dis_nome varchar(100),
dis_carga int,
dis_professor varchar(100)
);

CREATE TABLE professores (
prof_cod int,
prof_nome varchar(100),
prof_endereco varchar(200),
prof_cidade varchar(100)
);

### q3a
INSERT INTO alunos
VALUES
(1,'Joao','Rua da Li','São Paulo'),
(10,'Maria','Avenida Paulista','São Paulo');

### q3b
INSERT INTO disciplina
VALUES
(1,'Matemática',60,'Sidarta'),
(5,'Português',40,'Pascoale');

### q3c
INSERT INTO professores
VALUES
(1,'Fátima','Rua da Praia','Rio de Janeiro'),
(5,'Roberto','Av. Sen. Salg Filho','Natal');

### q4
UPDATE disciplina SET dis_carga = dis_carga + 10;

### q5
DELETE FROM disciplina WHERE dis_professor = 'Roberto';
