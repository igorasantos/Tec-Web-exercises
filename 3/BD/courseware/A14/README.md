# Used commands
_by page in the courseware_

## Before (with `.my.cnf` setted)
In the MySQL Server terminal:
``` sql
CREATE DATABASE a14sistVendas;
CREATE DATABASE a14vids;
CREATE DATABASE a14locadora;
CREATE DATABASE a14sistEdu;
exit;
```
In the Bash terminal:
``` bash
mysqldump a13sistVendas | mysql a14sistVendas;
mysqldump a13vids | mysql a14vids;
mysqldump a13locadora | mysql a14locadora;
mysqldump a09sistEdu | mysql a14sistEdu;
mysql
```

## p02
Back to the MySQL Server terminal:
``` sql
USE a14sistVendas;
SHOW tables;

CREATE VIEW vw_prods_vendidos AS
SELECT prod_nome, (SELECT SUM(comp_total)  
FROM compras WHERE prod_codigo= comp_codproduto)
AS qtd_vendida FROM produtos;

SHOW TABLES;
DESC vw_prods_vendidos;

SELECT * FROM vw_prods_vendidos;

SELECT prod_nome, (SELECT SUM(comp_total)  
FROM compras WHERE prod_codigo= comp_codproduto)
AS qtd_vendida FROM produtos;

SELECT prod_nome FROM vw_prods_vendidos WHERE qtd_vendida > 0;

DROP VIEW vw_prods_vendidos;

SHOW TABLES;
```
### v02
``` sql
USE a14vids;
```
#### CROSS JOIN select
``` sql
SELECT obr_titulo, aut_nome
FROM autores AS a, autores_obras AS ao, obras AS o
WHERE a.aut_codigo = ao.aut_cod
AND ao.obr_cod = o.obr_codigo
ORDER BY 1;

SHOW TABLES;
```
#### CROSS JOIN view
``` sql
CREATE VIEW vw_aut_obras_cross_join AS
SELECT obr_titulo, aut_nome
FROM autores AS a, autores_obras AS ao, obras AS o
WHERE a.aut_codigo = ao.aut_cod
AND ao.obr_cod = o.obr_codigo
ORDER BY 1;

SHOW TABLES;

SELECT * FROM vw_aut_obras_cross_join;
```
## p03 (ativ)
``` sql
USE a14locadora;
```
### p03q01a
``` sql
CREATE VIEW vw_cli_dados_pessoais AS
SELECT cli_nome AS Nome, cli_cpf AS CPF, cli_sexo AS Sexo, cli_profissao AS 'Profissão'
FROM clientes;

SHOW TABLES;

DESC vw_cli_dados_pessoais;
```
### p03q01b
``` sql
SELECT * FROM vw_cli_dados_pessoais;
```
## p04
``` sql
CREATE DATABASE a14folhaPagto;
USE a14folhaPagto;

CREATE TABLE empregados (
empreg_codigo int NOT NULL AUTO_INCREMENT,
empreg_nome varchar(50),
empreg_cpf char(7) NOT NULL,
empreg_sexo char(1),
empreg_dataNascimento date,
PRIMARY KEY (empreg_codigo)
);

CREATE TABLE pagamentos (
pag_codigo int NOT NULL AUTO_INCREMENT,
pag_codempregado int,
pag_salario decimal (10,2),
PRIMARY KEY (pag_codigo),
FOREIGN KEY (pag_codempregado) REFERENCES empregados (empreg_codigo)
);

CREATE TABLE descontos (
desc_codigo int NOT NULL AUTO_INCREMENT,
desc_codempregado int NOT NULL,
desc_inss decimal(10,2),
desc_ir decimal(10,2),
PRIMARY KEY (desc_codigo),
FOREIGN KEY (desc_codempregado) REFERENCES empregados (empreg_codigo)
);

CREATE VIEW vw_basic_funcionario_id AS
SELECT empreg_nome, empreg_cpf
FROM empregados;

CREATE VIEW vw_calc_salario AS
SELECT empreg_nome,
(SELECT pag_salario FROM pagamentos
WHERE empreg_codigo = pag_codempregado) AS salario_bruto,
(SELECT desc_inss FROM descontos
WHERE empreg_codigo = desc_codempregado) AS INSS,
(SELECT desc_ir FROM descontos
WHERE empreg_codigo = desc_codempregado) AS IR,
(SELECT pag_salario FROM pagamentos
WHERE empreg_codigo = pag_codempregado)  -
(SELECT desc_inss FROM descontos
WHERE empreg_codigo = desc_codempregado)  -
(SELECT desc_ir FROM descontos
WHERE empreg_codigo = desc_codempregado)
AS salario_liquido
FROM empregados;
```
## p05
``` sql
INSERT INTO vw_basic_funcionario_id VALUES ('Maria da Silva', '1111111');

SELECT * FROM empregados;

SELECT * FROM vw_basic_funcionario_id;
```
## p06
``` sql
UPDATE vw_basic_funcionario_id SET empreg_nome = 'Maria da Silva Fernandes';
```
## p07
``` sql
DELETE FROM vw_basic_funcionario_id
WHERE empreg_nome = 'Maria da Silva Fernandes';
```
### v03
``` sql
USE a14vids;

CREATE VIEW vw_autores AS
SELECT * FROM autores;

SELECT * FROM autores;

SELECT * FROM vw_autores;

INSERT INTO vw_autores (aut_codigo, aut_nome)
VALUES (11, 'Testando o INSERT via Views…');

SELECT * FROM autores;
SELECT * FROM vw_autores;

UPDATE vw_autores SET aut_nome = 'Deitel' WHERE aut_codigo = 11;

SELECT * FROM autores;
SELECT * FROM vw_autores;

DELETE FROM vw_autores WHERE aut_codigo = 11;

SELECT * FROM autores;
SELECT * FROM vw_autores;
```
## p08 (ativ)
``` sql
USE a14folhaPagto;
```
### p08q01a
_The question asked to be created just one View, but maybe it would be interesting more than this._
``` sql
CREATE VIEW vw_lanc_folha AS
SELECT
empreg_nome AS empregado,
empreg_cpf AS cpf,
pag_codempregado AS p_emp_matr,
pag_salario AS valor_sal_bruto,
desc_codempregado AS d_emp_matr,
desc_inss AS valor_inss
FROM
empregados AS e,
pagamentos AS p,
descontos AS d
WHERE
e.empreg_codigo = p.pag_codempregado
AND e.empreg_codigo = d.desc_codempregado;

DESC vw_lanc_folha;

SELECT * FROM empregados;
SELECT * FROM pagamentos;
SELECT * FROM descontos;
SELECT * FROM vw_lanc_folha;
```
### p08q01b
``` sql
DELETE FROM descontos;
DELETE FROM pagamentos;
DELETE FROM empregados;

SELECT * FROM empregados;
SELECT * FROM pagamentos;
SELECT * FROM descontos;
SELECT * FROM vw_lanc_folha;

ALTER TABLE descontos AUTO_INCREMENT = 1;
ALTER TABLE pagamentos AUTO_INCREMENT = 1;
ALTER TABLE empregados AUTO_INCREMENT = 1;

INSERT INTO vw_lanc_folha
(empregado, cpf)
VALUES
('Roberta das Flores','1111111'),
('Alice das Maravilhas','2222222');

SELECT * FROM empregados;
SELECT * FROM pagamentos;
SELECT * FROM descontos;
SELECT * FROM vw_lanc_folha;

INSERT INTO vw_lanc_folha
(p_emp_matr, valor_sal_bruto)
VALUES
(1,5000),
(2,10000);

SELECT * FROM empregados;
SELECT * FROM pagamentos;
SELECT * FROM descontos;
SELECT * FROM vw_lanc_folha;

INSERT INTO vw_lanc_folha
(d_emp_matr, valor_inss)
VALUES
(1,1000),
(2,2000);

SELECT * FROM empregados;
SELECT * FROM pagamentos;
SELECT * FROM descontos;
SELECT * FROM vw_lanc_folha;
```
### q01c
``` sql
UPDATE vw_lanc_folha
SET valor_inss = valor_inss - 10;

SELECT * FROM empregados;
SELECT * FROM pagamentos;
SELECT * FROM descontos;
SELECT * FROM vw_lanc_folha;
```
## p09
### v04
``` sql
USE a14vids;
```
#### INNER JOIN select
``` sql
SELECT obr_titulo, aut_nome
FROM autores AS a
INNER JOIN autores_obras AS ao
ON a.aut_codigo = ao.aut_cod
INNER JOIN obras AS o
ON ao.obr_cod = o.obr_codigo;
```
#### INNER JOIN view
``` sql
CREATE VIEW vw_aut_obras_inner_join AS
SELECT obr_titulo, aut_nome
FROM autores AS a
INNER JOIN autores_obras AS ao
ON a.aut_codigo = ao.aut_cod
INNER JOIN obras AS o
ON ao.obr_cod = o.obr_codigo;

SHOW TABLES;

SELECT * FROM vw_aut_obras_inner_join;
```
## p12 (ativ)
``` sql
USE a14sistEdu;
```
### p12q01a
CREATE VIEW vw_profs_natal AS
SELECT
prof_nome
FROM
professores
WHERE
prof_cidade = 'Natal';

DESC vw_profs_natal;

SELECT * FROM professores;
SELECT * FROM vw_profs_natal;
```
### p12q01b
``` sql
INSERT INTO alunos
VALUES
(11,'Bianca','Eixo Rodoviário','Brasília');

CREATE VIEW vw_alunos_por_cidade AS
SELECT
aluno_cidade, COUNT(aluno_cidade)
FROM
alunos
GROUP BY aluno_cidade;

DESC vw_alunos_por_cidade;

SELECT * FROM alunos;
SELECT * FROM vw_alunos_por_cidade;
```
### p12q01c
``` sql
CREATE VIEW vw_discs_profs AS
SELECT
dis_nome, dis_professor
FROM
disciplina;

DESC vw_discs_profs;

SELECT * FROM disciplina;
SELECT * FROM vw_discs_profs;
```
_see the [update step](#p12q01c-updating)_
### p12q01d
#### Adaptation of table structure
``` sql
ALTER TABLE disciplina RENAME TO disciplinas;

ALTER TABLE disciplinas DROP COLUMN dis_professor;

ALTER TABLE disciplinas CHANGE COLUMN dis_carga dis_ch int;

ALTER TABLE disciplinas ADD PRIMARY KEY (dis_cod);

ALTER TABLE professores ADD PRIMARY KEY (prof_cod);

CREATE TABLE profs_discs (
prof_disc_cod int AUTO_INCREMENT,
dis_cod_fk int,
prof_cod_fk int,
PRIMARY KEY (prof_disc_cod),
FOREIGN KEY (dis_cod_fk) REFERENCES disciplinas (dis_cod),
FOREIGN KEY (prof_cod_fk) REFERENCES professores (prof_cod)
);
```
#### Data preparation
``` sql
INSERT INTO professores
VALUES
(6,'Sidarta','Av. Prudente de Morais','Recife'),
(7,'Pascoale','Av. das Nações','São Paulo');

INSERT INTO disciplinas
VALUES
(6,'Biologia',60),
(7,'História',90);

INSERT INTO profs_discs
(dis_cod_fk, prof_cod_fk)
VALUES
(6,1),
(7,5),
(1,1),
(6,7);
```
#### Answering the question
``` sql
CREATE VIEW vw_profs_NDiscs AS
SELECT
prof_nome,
COUNT(prof_cod_fk)
FROM
	professores,
	profs_discs
WHERE
	prof_cod = prof_cod_fk
GROUP BY
	prof_nome;

SELECT * FROM profs_discs;
SELECT * FROM professores;
SELECT * FROM disciplinas;
SELECT * FROM vw_profs_NDiscs;
```
### p12q01c updating
_Update the view vw_discs_profs, on p12q1c, due to the commands on p12q1d_
``` sql
DROP VIEW vw_discs_profs;

CREATE VIEW vw_discs_profs AS
SELECT
dis_nome, prof_nome
FROM
disciplinas, profs_discs, professores
WHERE prof_cod_fk = prof_cod
AND dis_cod_fk = dis_cod
ORDER BY 1,2;

DESC vw_discs_profs;

SELECT * FROM disciplinas;
SELECT * FROM profs_discs;
SELECT * FROM professores;
SELECT * FROM vw_discs_profs;
```
