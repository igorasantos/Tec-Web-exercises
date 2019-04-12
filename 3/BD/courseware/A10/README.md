# Used commands
_by page in the courseware_

## Before (with `.my.cnf` setted)
In the MySQL Server terminal:
``` sql
CREATE DATABASE a10locadora;
CREATE DATABASE a10vids;
CREATE DATABASE a10sistEdu;
exit;
```
In the Bash terminal:
``` bash
mysqldump a09locadora | mysql a10locadora
mysqldump a09vids | mysql a10vids
mysqldump a09sistEdu | mysql a10sistEdu;
mysql
```

## p02
Back to the MySQL Server terminal:
``` sql
USE a10locadora;
DESC clientes;
SHOW DATABASES;
SHOW TABLES;
```
## p03 (ativ)
### p03q1
``` sql
USE a09p05;
DESC funcionarios;
DESC estoque;
```
## p04
``` sql
USE a10locadora;
SELECT * FROM clientes;
```
## p05
``` sql
SELECT cli_nome, cli_email FROM clientes;

DELETE FROM clientes;

INSERT INTO clientes
(cli_codigo,cli_nome, cli_cpf, cli_data_nasc, cli_sexo, cli_email)
VALUES
(1,'José da Silva','123456789-10','1980-12-10','M', 'joseSilva@cursoSQL.com'),
(2,'Maria da Silva','012345678-99','1982-02-28','F','mariaSilva@cursoSQL.com'),
(3,'Francisco da Silva','109876543-21','1990-01-01','M','franciscoSilva@cursoSQL.com'),
(4,'Francisca da Silva',NULL,NULL,'F','franciscaSilva@cursoSQL.com');

SELECT cli_nome, cli_email FROM clientes
WHERE cli_nome='José da Silva';
```
### v02
``` sql
USE a10vids;
SHOW tables;
DESC pessoas;

SELECT * FROM pessoas;
SELECT pes_nome, pes_cidade FROM pessoas;
```
## p06 (ativ)
### p06q1
``` sql
USE a10locadora;

CREATE TABLE filmes (
fil_codigo INT,
fil_titulo VARCHAR(40),
fil_genero VARCHAR(15),
fil_duracao TIME,
fil_situacao VARCHAR(12),
fil_preco NUMERIC(3,2)
);

INSERT INTO filmes
(fil_codigo, fil_titulo, fil_genero, fil_duracao, fil_situacao, fil_preco)
VALUES
(1, 'E o vento Levou', 'romance', '0:03:10', 'alugado', 5.00),
(2, 'O silêncio dos inocentes', 'policial', '0:02:00', 'disponível',02.50),
(3, 'Procurando Nemo', 'animação', '0:01:40','alugado', 02.50),
(4, 'Cidade de Deus', 'ação', '0:02:10','disponível',3.00);
```
#### p06q1a
``` sql
SELECT cli_nome, cli_cpf FROM clientes;
```
#### p06q1b
``` sql
SELECT * FROM filmes;
```
#### p06q1c
``` sql
SELECT cli_nome, cli_email FROM clientes WHERE cli_sexo='M';
```
#### p06q1d
``` sql
SELECT fil_codigo, fil_titulo FROM filmes;
``` 
#### p06q1e
``` sql
SELECT fil_duracao FROM filmes WHERE fil_titulo='E o vento Levou';
```
## p07
``` sql
USE a10locadora;
SELECT fil_titulo FROM filmes WHERE fil_preco < 3;
SELECT fil_titulo FROM filmes WHERE fil_situacao <> 'alugado';
SELECT cli_nome FROM clientes WHERE cli_data_nasc >= '1990-1-1';
SELECT fil_titulo FROM filmes WHERE fil_preco < 3 AND fil_situacao <> 'alugado';
SELECT fil_titulo FROM filmes WHERE fil_genero= 'romance' OR fil_genero = 'animação';
```
### v03
``` sql
USE a10vids;
SELECT * FROM pessoas WHERE pes_cidade = 'Natal';
SELECT pes_nome, pes_nascimento FROM pessoas WHERE pes_cidade = 'Natal';
```
## p10
``` sql
USE a10locadora;

SELECT fil_titulo FROM filmes WHERE fil_codigo BETWEEN 2 AND 20;

SELECT cli_nome FROM clientes
WHERE cli_data_nasc BETWEEN '1990-1-1' AND '2000-1-1';

SELECT cli_email FROM clientes
WHERE cli_nome BETWEEN 'A' AND 'G';

SELECT cli_nome FROM clientes
WHERE cli_email LIKE '%gmail.com';

SELECT fil_titulo FROM filmes
WHERE fil_genero IN ('comedia', 'romance', 'acao');

SELECT cli_nome FROM clientes
WHERE cli_email IS NULL;
```
### v04
``` sql
USE a10vids;

SELECT * FROM pessoas
WHERE pes_nascimento BETWEEN '1990-01-01' AND '1995-12-31';

SELECT * FROM pessoas
WHERE
pes_nascimento >= '1990-01-01'
AND
pes_nascimento <= '1995-12-31';

SELECT * FROM pessoas
WHERE pes_nascimento BETWEEN '1990-01-01' AND '1995-12-31'
AND pes_cidade = 'Recife';

SELECT * FROM pessoas
WHERE pes_nome LIKE 'c%';

SELECT * FROM pessoas
WHERE pes_cidade IN ('Natal','João Pessoa','Recife');

SELECT * FROM pessoas
WHERE pes_cidade = 'Natal'
OR
pes_cidade = 'João Pessoa'
OR
pes_cidade = 'Recife';

SELECT * FROM pessoas
WHERE pes_nascimento IS NULL;

SELECT * FROM pessoas
WHERE pes_nascimento IS NOT NULL;
```
## p09 (ativ)
### p09q1
``` sql
USE a10locadora;
```
#### p09q1a
``` sql
SELECT fil_titulo FROM filmes WHERE fil_preco >= 2.5;
```
#### p09q1b
``` sql
SELECT cli_nome FROM clientes WHERE cli_sexo = 'M';
```
#### p09q1c
``` sql
SELECT fil_titulo FROM filmes WHERE fil_genero IN ('comedia','policial');
```
#### p09q1d
``` sql
SELECT cli_nome FROM clientes WHERE cli_nome NOT LIKE 'A' OR 'B';
```
## p12 (ativ)
### p12q1
``` sql
USE a10sistEdu;
```
#### p12q1a
``` sql
SELECT prof_cod, prof_nome, prof_endereco FROM professores;
```
#### p12q1b
``` sql
SELECT * FROM alunos LIMIT 3;
```
#### p12q1c
``` sql
SELECT dis_nome, dis_professor FROM disciplina;
```
#### p12q1e
``` sql
SELECT * FROM disciplina WHERE dis_professor IS NULL;
```
#### p12q1f
``` sql
SELECT * FROM disciplina WHERE dis_cod BETWEEN 1 AND 5;
```
#### p12q1g
``` sql
SELECT * FROM alunos WHERE aluno_nome LIKE '%Silva';
```
