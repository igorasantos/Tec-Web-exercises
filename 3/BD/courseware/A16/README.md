# Used commands
_by page in the courseware_

## Before (with `.my.cnf` setted)
In the MySQL Server terminal:
``` sql
CREATE DATABASE a16sistVendas;
CREATE DATABASE a16vids;
CREATE DATABASE a16folhaPagto;
CREATE DATABASE a16sistEdu;
exit;
```
In the Bash terminal:
``` bash
mysqldump a15sistVendas | mysql a16sistVendas;
mysqldump a15vids | mysql a16vids;
mysqldump a15folhaPagto | mysql a16folhaPagto;
mysqldump a14sistEdu | mysql a16sistEdu;
mysql
```
## p03
Back to the MySQL Server terminal:
``` sql
USE a16sistVendas;

DELIMITER |
CREATE FUNCTION fn_total_vendas()
RETURNS INT
BEGIN
	DECLARE qtde_vendas INT;
	SELECT SUM(comp_total) INTO qtde_vendas
	FROM compras;
	RETURN qtde_vendas;
END
|
DELIMITER ;
```
## p04
``` sql
DELIMITER |
CREATE FUNCTION fn_total_vendas_prod (codigo_produto INT)
RETURNS INT
BEGIN
	DECLARE qtde_vendas INT;
	SELECT SUM(comp_total) INTO qtde_vendas
	FROM compras
	WHERE comp_codproduto = codigo_produto;
	RETURN qtde_vendas;
END
|
DELIMITER ;
```
### v02
``` sql
USE a16vids;

DELIMITER #
CREATE FUNCTION fn_qtdObras (pTitulo VARCHAR(50))
RETURNS INT
BEGIN
	DECLARE totObras INT;
	SELECT COUNT(obr_titulo) INTO totObras
	FROM obras
	WHERE obr_titulo LIKE CONCAT('%',pTitulo,'%');
	RETURN totObras;
END;
#

DELIMITER ;

SELECT fn_qtdObras ('BD');

SELECT * FROM obras;
```
## p05 (ativ)
### p05q4
``` sql
USE a16folhaPagto;
```
### p05q4a
``` sql
DELIMITER |
CREATE FUNCTION fn_inss_total()
RETURNS DECIMAL (10,2)
BEGIN
	DECLARE tot_inss DECIMAL (10,2);
	SELECT SUM(desc_inss) INTO tot_inss FROM descontos;
RETURN tot_inss;
END
|

DELIMITER ;
```
_Demo on [p07q1a_i](#p07q1a_i)_
### p05q4b
``` sql
DELIMITER |
CREATE FUNCTION fn_deducoes_empreg(codempregado INT)
RETURNS DECIMAL(10,2)
BEGIN
	DECLARE result DECIMAL(10,2);
	SELECT
		(SUM(desc_inss)+SUM(desc_ir))
	INTO result
	FROM descontos
	WHERE desc_codempregado = codempregado;
	RETURN result;
END;
|
DELIMITER ;
```
_Demo on [p07q1a_ii](#p07q1a_ii)_
### p05q4c
``` sql
DELIMITER |
CREATE FUNCTION fn_tot_empreg_sexo(s CHAR)
RETURNS INT
BEGIN
	DECLARE result INT;
	SELECT
		COUNT(empreg_sexo) INTO result
	FROM empregados
	WHERE empreg_sexo = s;
	RETURN result;
END;
|
DELIMITER ;
```
_Demo on [p07q1a_iii](#p07q1a_iii)_
## p06
``` sql
USE a16sistVendas;
SELECT fn_total_vendas();
SELECT fn_total_vendas_prod(3);

SET @Total = fn_total_vendas();
SELECT @Total;

SELECT
	prod_codigo AS Codigo,
	prod_nome AS Nome,
	fn_total_vendas_prod(prod_codigo) AS Vendas
FROM produtos
ORDER BY prod_codigo;

SELECT
	prod_codigo AS Codigo,
	prod_nome AS Nome,
	fn_total_vendas_prod(prod_codigo) AS Vendas
FROM produtos
WHERE fn_total_vendas_prod(prod_codigo) >= 15
ORDER BY prod_codigo;

DROP FUNCTION fn_total_vendas;
DROP FUNCTION fn_total_vendas_prod;
```
### v03
``` sql
USE a16vids;

DELIMITER #
CREATE FUNCTION fn_getSituacaoAluno(
	n1 FLOAT,
	n2 FLOAT
)
RETURNS VARCHAR(20)
BEGIN
	DECLARE media FLOAT;
	DECLARE situacao VARCHAR(20);
	SET media = (2 * n1 + 3 * n2)/5;
	IF media < 2 THEN
		SET situacao = 'Reprovado';
	ELSEIF media >= 6 THEN
		SET situacao = 'Aprovado';
	ELSE
		SET situacao = 'Recuperação';
	END IF;
RETURN situacao;
END
#
DELIMITER ;

SELECT fn_getSituacaoAluno(1,1);
SELECT fn_getSituacaoAluno(5,5);
SELECT fn_getSituacaoAluno(9,8);
```
## p07 (ativ)
### p07q1
``` sql
USE a16folhaPagto;
```
### p07q1a
#### p07q1a_i
_Demo of [p05q4a](#p05q4a)_
``` sql
SELECT * FROM descontos;
SELECT fn_inss_total();
```
#### p07q1a_ii
_Demo of [p05q4b](#p05q4b)_
``` sql
SELECT * FROM descontos;

SELECT fn_deducoes_empreg(1);
SELECT fn_deducoes_empreg(3);
SELECT fn_deducoes_empreg(4);
```
#### p07q1a_iii
_Demo of [p05q4c](#p05q4c)_
``` sql
SELECT * FROM empregados;

SELECT fn_tot_empreg_sexo('M');
SELECT fn_tot_empreg_sexo('F');
```
### p07q1b
``` sql
INSERT INTO empregados VALUES (20,'Malévola','5555555','F','1349-02-17','Moors');
INSERT INTO pagamentos VALUES (11,20,450);
INSERT INTO descontos VALUES (11,20,49.5,0);

DELIMITER |
CREATE FUNCTION fn_inss(codemp INT)
RETURNS FLOAT
BEGIN
	DECLARE inss FLOAT;
	SELECT SUM(desc_inss)
	INTO inss
	FROM descontos
	WHERE desc_codempregado = codemp;
	RETURN inss;
END;
|
DELIMITER ;

SELECT * FROM empregados
WHERE fn_inss(empreg_codigo) > 50
ORDER BY empreg_codigo;

SELECT * FROM descontos;
```
### p07q1c
``` sql
DELIMITER |
CREATE FUNCTION fn_sal_liq(codemp INT)
RETURNS FLOAT
BEGIN
	DECLARE sal_liq FLOAT;
	SELECT SUM(salario_liquido)
	INTO sal_liq
	FROM vw_calc_salario_2
	WHERE empreg_codigo = codemp;
	RETURN sal_liq;
END;
|
DELIMITER ;

SELECT * FROM empregados
WHERE fn_sal_liq(empreg_codigo) < 1000
ORDER BY empreg_codigo;

SELECT * FROM vw_calc_salario_2;
```
### p07q1d
``` sql
DROP FUNCTION fn_inss_total;
DROP FUNCTION fn_deducoes_empreg;
DROP FUNCTION fn_tot_empreg_sexo;
DROP FUNCTION fn_inss;
DROP FUNCTION fn_sal_liq;
```
## p08
### v04
``` sql
USE a16vids;

DELIMITER #
CREATE FUNCTION fn_getSomaPA (
	primeiroTermo INT,
	razao INT,
	qtdTermos INT
)
RETURNS INT
BEGIN
	DECLARE soma INT;
	DECLARE i INT;
	DECLARE proxTermo INT;
	SET i = 1;
	SET proxTermo = primeiroTermo;
	SET soma = 0;
	WHILE (i <= qtdTermos) DO
		SET soma = soma + proxTermo;
		SET proxTermo = proxTermo + razao;
		SET i = i + 1;
	END WHILE;
	RETURN soma;
END;
#
DELIMITER ;
SELECT fn_getSomaPA(1,2,8);
SELECT 1 + 3 + 5 + 7 + 9 + 11 + 13 + 15;
```
## p10 (ativ)
### p10q1
``` sql
USE a16sistEdu;
```
### p10q1a
``` sql
DELIMITER |
CREATE FUNCTION fn_pessoas_cidade(city VARCHAR(100))
RETURNS INT
BEGIN
	DECLARE cont_alu_cid INT;
	DECLARE cont_prof_cid INT;
	DECLARE result INT;
	SELECT COUNT(aluno_cidade)
	INTO cont_alu_cid
	FROM alunos
	WHERE aluno_cidade = city;
	SELECT COUNT(prof_cidade)
	INTO cont_prof_cid
	FROM professores
	WHERE prof_cidade = city;
	SET result = cont_alu_cid + cont_prof_cid;
	RETURN result;
END;
|

DELIMITER ;

SELECT * FROM alunos;
SELECT * FROM professores;
SELECT fn_pessoas_cidade('São Paulo');
```
### p10q1b
``` sql
DELIMITER |
CREATE FUNCTION fn_prof_ch(codProf INT)
RETURNS INT
BEGIN
	DECLARE result INT;
	SELECT
		SUM(dis_ch)
	INTO result
	FROM disciplinas AS d
	INNER JOIN
		profs_discs AS pd
		ON d.dis_cod = pd.dis_cod_fk
	INNER JOIN
		professores AS p
		ON pd.prof_cod_fk = p.prof_cod
	WHERE p.prof_cod = codProf; 
	RETURN result;
END
|
DELIMITER ;

SELECT * FROM professores;
SELECT * FROM disciplinas;
SELECT * FROM profs_discs;

SELECT fn_prof_ch(1);
SELECT fn_prof_ch(5);
SELECT fn_prof_ch(6);
SELECT fn_prof_ch(7);
```
### p10q1c
#### p10q1c_i
``` sql
DELIMITER |
CREATE FUNCTION fn_consult_cid_prof(codProf INT)
RETURNS VARCHAR(100)
BEGIN
	DECLARE cidade VARCHAR(100);
	SELECT
		prof_cidade
	INTO cidade
	FROM professores
	WHERE prof_cod = codProf; 
	RETURN cidade;
END
|
DELIMITER ;

SELECT * FROM professores;

SELECT fn_consult_cid_prof(1);
SELECT fn_consult_cid_prof(5);
SELECT fn_consult_cid_prof(6);
SELECT fn_consult_cid_prof(7);
```
#### p10q1c_ii
``` sql
DELIMITER |
CREATE FUNCTION fn_profs_cidade(city VARCHAR(100))
RETURNS INT
BEGIN
	DECLARE result INT;
	SELECT COUNT(prof_cidade)
	INTO result
	FROM professores
	WHERE prof_cidade = city;
	RETURN result;
END;
|

DELIMITER ;

INSERT INTO professores VALUES (11,'Giovana','Av. Antônio Conselheiro','São Paulo');
SELECT * FROM professores;

SELECT
	DISTINCT(prof_cidade),
	fn_profs_cidade(prof_cidade) AS nProfs
FROM professores
ORDER BY prof_cidade;
```
### p10q1d
#### p10q1d_i
``` sql
CREATE VIEW vw_profs_discs AS
SELECT
	prof_cod,
	prof_nome
	dis_cod,
	dis_nome,
	dis_ch
FROM disciplinas AS d
INNER JOIN
	profs_discs AS pd
	ON d.dis_cod = pd.dis_cod_fk
INNER JOIN
	professores AS p
	ON pd.prof_cod_fk = p.prof_cod
ORDER BY 1,3;

DELIMITER |
CREATE FUNCTION fn_disc_maior_ch_prof(codProf INT)
RETURNS VARCHAR(100)
BEGIN
	DECLARE discMaiorCH VARCHAR(100);
	SELECT
		dis_nome
	INTO discMaiorCH
	FROM vw_profs_discs
	WHERE prof_cod = codProf
	AND dis_ch = (
		SELECT MAX(dis_ch)
		FROM vw_profs_discs
		WHERE prof_cod = codProf
	);
	RETURN discMaiorCH;
END;
|
DELIMITER ;

SELECT * FROM professores;
SELECT * FROM disciplinas;
SELECT * FROM profs_discs;

SELECT fn_disc_maior_ch_prof(1);
SELECT fn_disc_maior_ch_prof(5);
SELECT fn_disc_maior_ch_prof(6);
SELECT fn_disc_maior_ch_prof(7);
SELECT fn_disc_maior_ch_prof(11);
```
#### p10q1d_ii
``` sql
SELECT
	prof_nome,
	fn_disc_maior_ch_prof(prof_cod) AS 'Disc c/ Maior CH'
FROM
	professores;
```
