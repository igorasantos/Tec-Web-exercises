# Used commands
_by page in the courseware_

## Before (with `.my.cnf` setted)
``` sql
CREATE DATABASE a11locadora;
CREATE DATABASE a11vids;
CREATE DATABASE a11sistEdu;
exit;
```

``` bash
mysqldump a10locadora | mysql a11locadora;
mysqldump a10vids | mysql a11vids;
mysqldump a10sistEdu | mysql a11sistEdu;
mysql
```

## p02
``` sql
USE a11locadora;
SELECT cli_nome, cli_email FROM clientes;
SELECT cli_nome, cli_email FROM clientes ORDER BY cli_nome;
SELECT cli_nome, cli_email FROM clientes ORDER BY cli_nome DESC;

SELECT cli_nome, cli_email FROM clientes
WHERE cli_nome LIKE 'F%'
ORDER BY cli_nome;
```
### v02
``` sql
USE a11vids;

SELECT pes_cod, pes_nome, pes_filhos
FROM pessoas ORDER BY pes_nome;

SELECT pes_cod, pes_nome, pes_filhos FROM pessoas ORDER BY 2;

SELECT pes_cod, pes_nome, pes_filhos FROM pessoas ORDER BY 2 DESC;

SELECT pes_cod, pes_nome, pes_filhos
FROM pessoas ORDER BY 3 DESC, 2;
```
## p03 (ativ)
### p03q1
``` sql
USE a11locadora;
```
#### p03q1a
``` sql
SELECT cli_nome, cli_cpf FROM clientes ORDER BY cli_nome;
```
#### p03q1b
``` sql
SELECT * FROM filmes ORDER BY fil_codigo;
```
#### p03q1c
``` sql
SELECT cli_nome, cli_email FROM clientes
WHERE cli_sexo = 'M'
ORDER BY cli_nome DESC;
```
#### p03q1d
``` sql
SELECT cli_nome, cli_data_nasc FROM clientes
WHERE cli_email LIKE '%@hotmail.com'
ORDER BY cli_nome;
```
## p04
``` sql
SELECT fil_preco fROM filmes GROUP BY fil_preco;
SELECT COUNT(fil_titulo) FROM filmes;
SELECT COUNT(DISTINCT fil_titulo) FROM filmes;
SELECT MIN(fil_preco), AVG(fil_preco), MAX(fil_preco) FROM filmes;
```
### v03
``` sql
USE a11vids;

SELECT COUNT(pes_filhos) FROM pessoas
WHERE pes_cidade = 'Recife';

SELECT COUNT(*) FROM pessoas
WHERE pes_cidade = 'Recife';

SELECT DISTINCT(pes_cidade) FROM pessoas;

SELECT SUM(pes_filhos) FROM pessoas;

SELECT SUM(pes_filhos), MIN(pes_filhos), AVG(pes_filhos), MAX(pes_filhos) FROM pessoas;

SELECT pes_cidade, COUNT(pes_cidade) FROM pessoas
GROUP BY pes_cidade;

SELECT pes_cidade, COUNT(pes_cidade) FROM pessoas
GROUP BY pes_cidade
ORDER BY 1;

SELECT pes_cidade, COUNT(pes_cidade) FROM pessoas
GROUP BY pes_cidade
HAVING COUNT(pes_cidade) > 2;
```
## p06
``` sql
USE a11locadora;

SELECT cli_sexo, COUNT(cli_sexo)
FROM clientes
GROUP BY cli_sexo;

SELECT fil_titulo, COUNT(fil_titulo) AS Unidades
FROM filmes
GROUP BY fil_titulo;

INSERT INTO filmes VALUES (5,'E o vento Levou','romance','00:03:10','disponível',5.00);

SELECT fil_titulo AS Titulo, COUNT(fil_titulo) AS Quantidade
FROM filmes
GROUP BY fil_titulo
HAVING COUNT(fil_titulo)>1;
```
## p07 (ativ)
### p07q1
``` sql
USE a11locadora;
```
#### p07q1a
``` sql
SELECT fil_situacao AS Situacao, COUNT(fil_situacao) AS Quantidade FROM filmes GROUP BY fil_situacao;
```
#### p07q1b
``` sql
SELECT fil_genero AS Genero, COUNT(fil_genero) AS Quantidade FROM filmes GROUP BY fil_genero;
```
#### p07q1c
``` sql
SELECT SUM(fil_preco) as Saldo_Alugueis_A_Receber FROM filmes WHERE fil_situacao = 'alugado';
```
## p09
``` sql
SELECT DISTINCT ROUND(AVG(fil_preco),2)
FROM filmes;

SELECT DISTINCT UPPER(fil_titulo)
FROM filmes
WHERE fil_situacao='alugado';

SELECT cli_nome, EXTRACT(year FROM cli_data_nasc)
FROM clientes
WHERE cli_sexo='F';

SELECT cli_nome, EXTRACT(year FROM cli_data_nasc) AS 'Ano Nascimento'
FROM clientes
WHERE cli_sexo='F';

SELECT cli_nome, DATE_FORMAT(cli_data_nasc,'%d/%m/%Y')
FROM clientes
ORDER BY cli_nome;
```
### v04
``` sql
USE a11vids;
SELECT AVG(pes_filhos) FROM pessoas;
SELECT ROUND(AVG(pes_filhos),0) FROM pessoas;
SELECT SQRT(25);
SELECT pes_nome FROM pessoas;
SELECT UPPER(pes_nome) FROM pessoas;
SELECT SUBSTRING(UPPER(pes_nome),1,3) FROM pessoas;
SELECT pes_nome, pes_nascimento FROM pessoas;
SELECT pes_nome, pes_nascimento AS 'Data Nasc' FROM pessoas;
SELECT pes_nome, EXTRACT(month FROM pes_nascimento) FROM pessoas;
SELECT pes_nome, EXTRACT(month FROM pes_nascimento) AS 'Mês Nasc' FROM pessoas;

SELECT pes_nome, pes_nascimento AS 'Data Nasc' FROM pessoas
WHERE EXTRACT(month FROM pes_nascimento) = 7;

SELECT pes_nome AS 'Nome', pes_nascimento AS 'Data Nasc' FROM pessoas
WHERE EXTRACT(month FROM pes_nascimento) = 7;

SELECT pes_nome AS 'Nome', DATE_FORMAT(pes_nascimento,'%d/%m/%Y') AS 'Data Nasc' FROM pessoas
WHERE EXTRACT(month FROM pes_nascimento) = 7;

SELECT pes_nome AS 'Nome', DATE_FORMAT(pes_nascimento,'%d/%m/%y') AS 'Data Nasc' FROM pessoas
WHERE EXTRACT(month FROM pes_nascimento) = 7;
```
## p13 (ativ)
### p13q1
``` sql
USE a11sistEdu;
```
### p13q1a
``` sql
SELECT DISTINCT(aluno_cidade) AS Cidade, COUNT(aluno_cod) AS 'Qtd alunos' FROM alunos GROUP BY aluno_cidade;
```
### p13q1b
``` sql
SELECT DISTINCT(prof_cidade) AS Cidade, COUNT(prof_cod) AS 'Qtd profs' FROM professores GROUP BY prof_cidade ORDER BY prof_cidade;
```
### p13q1c
``` sql
SELECT COUNT(dis_cod) FROM disciplina;
```
### p13q1d
``` sql
INSERT INTO disciplina VALUES (8,'Filosofia',30,'Sidarta');

SELECT dis_professor, SUM(dis_carga) FROM disciplina
GROUP BY dis_professor;
```
### p13q1e
``` sql
SELECT dis_professor, SUM(dis_carga) FROM disciplina
GROUP BY dis_professor
HAVING COUNT(dis_professor) > 1;
```
### p13q1f
``` sql
INSERT INTO disciplina VALUES (1,'Matemática',60,'Aristóteles');

SELECT DISTINCT(UPPER(dis_nome)) FROM disciplina;
```
### p13q1g
``` sql
INSERT INTO professores VALUES (10,'Erica','R. José Estáquio','Caicó');

SELECT * FROM professores WHERE prof_nome BETWEEN 'A%' AND 'J%' ORDER BY prof_nome;
```
### p13q1h
``` sql
SELECT
dis_professor AS Prof,
ROUND(AVG(dis_carga),0) AS 'CH média'
FROM disciplina
GROUP BY dis_professor;
```
