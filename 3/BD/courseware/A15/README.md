# Used commands
_by page in the courseware_

## Before (with `.my.cnf` setted)
In the MySQL Server terminal:
``` sql
CREATE DATABASE a15sistVendas;
CREATE DATABASE a15vids;
CREATE DATABASE a15folhaPagto;
exit;
```
In the Bash terminal:
``` bash
mysqldump a14sistVendas | mysql a15sistVendas;
mysqldump a14vids | mysql a15vids;
mysqldump a14folhaPagto | mysql a15folhaPagto;
mysql
```
## p02
Back to the MySQL Server terminal:
``` sql
USE a15sistVendas;

SELECT prod_nome
FROM produtos, compras
WHERE prod_codigo = comp_codproduto
GROUP BY prod_nome;
```
## p04
``` sql
DELIMITER |
CREATE PROCEDURE sp_produtos_vendidos()
BEGIN
	SELECT prod_nome
	FROM produtos, compras
	WHERE prod_codigo = comp_codproduto
	GROUP BY prod_nome;
END
|

DELIMITER ;
CALL sp_produtos_vendidos();
```
### v02
``` sql
USE a15vids;

DELIMITER #
CREATE PROCEDURE sp_list_aut_obras()
BEGIN
	SELECT * FROM vw_aut_obras_inner_join;
END
#
DELIMITER ;

CALL sp_list_aut_obras();
```
## p05
``` sql
USE a15sistVendas;

DELIMITER |
CREATE PROCEDURE sp_qtdCompras_cliente (
	IN nome_cliente VARCHAR(50),
	OUT qtd_tot INT
)
BEGIN
	SELECT SUM(comp_total) INTO qtd_tot
	FROM clientes, compras
	WHERE cli_nome = nome_cliente
	AND cli_codigo = comp_codcliente;
END
|

DELIMITER ;

CALL sp_qtdCompras_cliente('Luciana',@tot);

SELECT @tot;

DROP PROCEDURE sp_qtdCompras_cliente;
```
### v03
``` sql
USE a15vids;

DELIMITER #
CREATE PROCEDURE sp_obras_por_autor (
	pAutor VARCHAR(30)
)
BEGIN
	SELECT *
	FROM vw_aut_obras_inner_join
	WHERE aut_nome = pAutor;	
END
#

DELIMITER ;

CALL sp_obras_por_autor('Manzano');

DELIMITER #
CREATE PROCEDURE sp_obras_por_autor_2 (
	pAutor VARCHAR(30)
)
BEGIN
	SELECT *
	FROM vw_aut_obras_inner_join
	WHERE aut_nome LIKE CONCAT(pAutor,'%');	
END
#

DELIMITER ;

CALL sp_obras_por_autor_2('M');
CALL sp_obras_por_autor_2('Ma');
CALL sp_obras_por_autor_2('Man');
CALL sp_obras_por_autor_2('Manz');
CALL sp_obras_por_autor_2('Manza');
CALL sp_obras_por_autor_2('Manzan');
CALL sp_obras_por_autor_2('Manzano');
```
## p06 (ativ)
``` sql
USE a15folhaPagto;
```
### p06q1
#### Adapting the values to the brazilian tax reality
``` sql
UPDATE vw_lanc_folha SET valor_inss = valor_sal_bruto * 0.11;
```
#### Back to the question
The value for the brazilian income tax exemption [during 2018 is BRL 1.903,98](https://www1.brasilprev.com.br/simulacao-de-imposto-de-renda) (relative to the basis of tax calculation).
``` sql
DELIMITER |
CREATE PROCEDURE sp_func_isentos_IR()
BEGIN
	SELECT * FROM vw_calc_salario
	WHERE (salario_bruto - INSS) <= 1903.98;
END
|
DELIMITER ;

INSERT INTO vw_lanc_folha (empregado, cpf) VALUES ('Senhor Coelho', '3333333');
INSERT INTO vw_lanc_folha (p_emp_matr, valor_sal_bruto) VALUES (3, 2000);
INSERT INTO vw_lanc_folha (d_emp_matr, valor_inss) VALUES (3, 220);

CALL sp_func_isentos_IR();
```
### p06q2
``` sql
DELIMITER |
CREATE PROCEDURE sp_inserir_empregado(
	IN novo_emp_nome VARCHAR(50),
	IN novo_emp_cpf CHAR(7)
)
BEGIN
	INSERT INTO vw_lanc_folha (empregado, cpf)
	VALUES (novo_emp_nome, novo_emp_cpf);
END
|
DELIMITER ;

SELECT * FROM empregados;
SELECT * FROM vw_lanc_folha;

CALL sp_inserir_empregado('Dama de Copas','4444444');
SELECT * FROM empregados;
SELECT * FROM vw_lanc_folha;
```
### p06q3
``` sql
DELIMITER |
CREATE PROCEDURE sp_n_func_isentos_IR(
	OUT qtd_isentos INT
)
BEGIN
	SELECT COUNT(empreg_nome) INTO qtd_isentos
	FROM vw_calc_salario
	WHERE (salario_bruto - INSS) <= 1903.98;
END
|
DELIMITER ;

CALL sp_n_func_isentos_IR(@n_emp);

SELECT @n_emp;
```
### p06q4
``` sql
DROP PROCEDURE sp_func_isentos_IR;
DROP PROCEDURE sp_inserir_empregado;
DROP PROCEDURE sp_n_func_isentos_IR;
```
## p07
``` sql
USE a15sistVendas;
```
### Adapting the tables
``` sql
ALTER TABLE compras DROP FOREIGN KEY `compras_ibfk_2`;
ALTER TABLE clientes MODIFY COLUMN cli_codigo INT AUTO_INCREMENT;
SELECT * FROM clientes;
ALTER TABLE clientes AUTO_INCREMENT = 3;

ALTER TABLE clientes MODIFY COLUMN cli_sexo CHAR(1);
ALTER TABLE clientes MODIFY COLUMN cli_dataNascimento DATE;
SELECT * FROM clientes;
DESC clientes;
```
### Continuing
``` sql
DELIMITER |
CREATE PROCEDURE sp_inserir_cliente (
	nome_cliente VARCHAR(50),
	cpf_cliente VARCHAR(11)
)
BEGIN
	IF ((nome_cliente != '') AND (cpf_cliente != '')) THEN
		INSERT INTO clientes (cli_nome, cli_cpf) VALUES (nome_cliente, cpf_cliente);
	ELSE
		SELECT 'NOME e CPF devem ser fornecidos para o cadastro!' AS Msg;
	END IF;
END;
|

DELIMITER ;

CALL sp_inserir_cliente ('Angela','4444444');
CALL sp_inserir_cliente('Rebeca','');

SELECT * FROM clientes;
```
### v04
``` sql
USE a15vids;

DELIMITER #
CREATE PROCEDURE sp_relatorio(
	IN pTipoRelatorio CHAR(1),
	OUT pTotal TINYINT
)
BEGIN
	IF (pTipoRelatorio = 'a') THEN
		SELECT COUNT(aut_codigo) INTO pTotal
		FROM autores;
	ELSEIF (pTipoRelatorio = 'o') THEN
		SELECT COUNT(obr_codigo) INTO pTotal
		FROM obras;
	END IF;
END;
#

DELIMITER ;

CALL sp_relatorio ('o',@result);

SELECT @result;
SELECT * FROM obras;

CALL sp_relatorio('a',@result);

SELECT @result;
SELECT * FROM autores;
```
## p08
``` sql
USE a15sistVendas;

DELIMITER |
CREATE PROCEDURE sp_reajustePreco (
	preco_medio_esperado DECIMAL(10,2),
	percentual INT
)
BEGIN
	WHILE ((SELECT AVG(prod_preco) FROM produtos) < preco_medio_esperado) DO
		UPDATE produtos 
		SET prod_preco = prod_preco*(1+percentual/100);
	END WHILE;
END;
|

DELIMITER ;

SELECT * FROM produtos;
SELECT AVG(prod_preco) FROM produtos;

CALL sp_reajustePreco(850,50);

SELECT * FROM produtos;
SELECT AVG(prod_preco) FROM produtos;
```
## p09 (ativ)
``` sql
USE a15folhaPagto;
```
### p09q1
Same as in question [p06q2](#p06q2).
### p09q2
``` sql
DELIMITER |
CREATE PROCEDURE sp_atualiza_empregado(
	IN emp_cpf CHAR(7),
	IN emp_nome VARCHAR(50),
	IN emp_sexo CHAR(1),
	IN emp_dataNasc DATE
)
BEGIN
	IF (emp_nome != '') THEN
		UPDATE empregados
		SET empreg_nome = emp_nome
		WHERE empreg_cpf = emp_cpf;
		SELECT 'Nome atualizado' AS Msg1;
	ELSE
		SELECT 'Nome não atualizado' AS Msg1;
	END IF;
	IF (emp_sexo != '') THEN
		UPDATE empregados
		SET empreg_sexo = emp_sexo
		WHERE empreg_cpf = emp_cpf;
		SELECT 'Sexo atualizado' AS Msg2;
	ELSE
		SELECT 'Sexo não atualizado' AS Msg2;
	END IF;
	IF (emp_dataNasc != '') THEN
		UPDATE empregados
		SET empreg_dataNascimento = emp_dataNasc
		WHERE empreg_cpf = emp_cpf;
		SELECT 'DataNasc atualizada' AS Msg3;
	ELSE
		SELECT 'DataNasc não atualizada' AS Msg3;
	END IF;
END
|

DELIMITER ;

SELECT * FROM empregados;

CALL sp_atualiza_empregado('3333333','Sr Coelho','M','1849-01-13');

SELECT * FROM empregados;

CALL sp_atualiza_empregado('3333333','','','1848-01-13');

SELECT * FROM empregados;
```
### p09q3
#### Deleting the previous procedure
``` sql
DROP PROCEDURE sp_atualiza_empregado;
```
#### Before the procedure creation, some adjustments on the constraints…
``` sql
SHOW CREATE TABLE descontos;
DESC descontos;
SELECT * FROM descontos;
ALTER TABLE descontos DROP FOREIGN KEY `descontos_ibfk_1`;
ALTER TABLE descontos ADD FOREIGN KEY (desc_codempregado) REFERENCES empregados (empreg_codigo) ON DELETE CASCADE;
DESC descontos;

SHOW CREATE TABLE pagamentos;
DESC pagamentos;
SELECT * FROM pagamentos;
ALTER TABLE pagamentos DROP FOREIGN KEY `pagamentos_ibfk_1`;
ALTER TABLE pagamentos ADD FOREIGN KEY (pag_codempregado) REFERENCES empregados (empreg_codigo) ON DELETE CASCADE;
DESC pagamentos;
```
#### Answering the question
``` sql
DELIMITER |
CREATE PROCEDURE sp_exclui_empregado(
	IN emp_cpf CHAR(7)
)
BEGIN
	IF (emp_cpf != '') THEN
		DELETE FROM empregados
		WHERE empreg_cpf = emp_cpf;
		SELECT 'Empregado removido' AS Msg;
	ELSE
		SELECT 'Nenhum empregado foi removido' AS Msg;
	END IF;
END
|

DELIMITER ;

SELECT * FROM descontos;
SELECT * FROM pagamentos;
SELECT * FROM empregados;

CALL sp_exclui_empregado('2222222');

SELECT * FROM descontos;
SELECT * FROM pagamentos;
SELECT * FROM empregados;
```
## p12 (ativ)
### p12q1
``` sql
USE a15folhaPagto;
```
### p12q1a
#### Adjusting the table 'empregados'
``` sql
DESC empregados;
ALTER TABLE empregados ADD COLUMN empreg_cidade VARCHAR(50);
DESC empregados;
SELECT * FROM empregados;
UPDATE empregados SET empreg_cidade = 'Fortaleza' WHERE empreg_codigo = 1;
UPDATE empregados SET empreg_cidade = 'Natal' WHERE empreg_codigo = 3;
UPDATE empregados SET empreg_cidade = 'Recife' WHERE empreg_codigo = 4;
SELECT * FROM empregados;
```
#### Answering the question
``` sql
DELIMITER |
CREATE PROCEDURE sp_mostrar_cidades_empreg()
BEGIN
	SELECT empreg_nome, empreg_cidade
	FROM empregados;
END
|
DELIMITER ;

CALL sp_mostrar_cidades_empreg();
```
### p12q1b
``` sql
DELIMITER |
CREATE PROCEDURE sp_consulta_qt_empreg_cidade(
	IN nomeCidade varchar(50)
)
BEGIN
	SELECT COUNT(empreg_nome)
	FROM empregados
	WHERE empreg_cidade = nomeCidade;
END
|
DELIMITER ;

SELECT * FROM empregados;

CALL sp_consulta_qt_empreg_cidade('Recife');
CALL sp_consulta_qt_empreg_cidade('Fortaleza');
CALL sp_consulta_qt_empreg_cidade('Natal');
CALL sp_consulta_qt_empreg_cidade('Salvador');
```
### p12q1c
#### Adapting
``` sql
CREATE VIEW vw_calc_salario_2 AS
SELECT
	empreg_codigo,
	empreg_nome,
	(
		SELECT pag_salario FROM pagamentos
		WHERE empreg_codigo = pag_codempregado
	) AS salario_bruto,
	(
		SELECT desc_inss FROM descontos
		WHERE empreg_codigo = desc_codempregado
	) AS INSS,
	(
		SELECT desc_ir FROM descontos
		WHERE empreg_codigo = desc_codempregado
	) AS IR,
	(
		SELECT pag_salario FROM pagamentos
		WHERE empreg_codigo = pag_codempregado
	) - (
		SELECT desc_inss FROM descontos
		WHERE empreg_codigo = desc_codempregado
	)  - (
		SELECT desc_ir FROM descontos
		WHERE empreg_codigo = desc_codempregado
	) AS salario_liquido
FROM empregados;

SELECT * FROM vw_calc_salario_2;
```
#### Completing the data
``` sql
UPDATE descontos SET desc_ir = 365.12 WHERE desc_codempregado = 1;
UPDATE descontos SET desc_ir = 0 WHERE desc_codempregado = 3;
INSERT INTO pagamentos VALUES (10,4,4000);
INSERT INTO descontos VALUES (10,4,440,179.20);

SELECT * FROM vw_calc_salario_2;
```
#### Answering the question
``` sql
DELIMITER |
CREATE PROCEDURE sp_consulta_remunera_empreg(
	IN codEmpreg INT
)
BEGIN
	SELECT
		empreg_nome,
		salario_bruto,
		salario_liquido
	FROM vw_calc_salario_2
	WHERE codEmpreg = empreg_codigo;
END;
|
DELIMITER ;

SELECT * FROM vw_calc_salario_2;
CALL sp_consulta_remunera_empreg(1);
CALL sp_consulta_remunera_empreg(3);
CALL sp_consulta_remunera_empreg(4);
```
### p12q1d
``` sql
SELECT * FROM empregados;
DESC empregados;

DELIMITER |
CREATE PROCEDURE sp_retorna_nome_cid_empreg(
	IN codEmpreg INT,
	OUT nomeEmpreg VARCHAR(50),
	OUT cidadEmpreg VARCHAR(50)
)
BEGIN
	SELECT empreg_nome, empreg_cidade INTO nomeEmpreg, cidadEmpreg
	FROM empregados
	WHERE codEmpreg = empreg_codigo;
END;
|
DELIMITER ;

SELECT * FROM empregados;
CALL sp_retorna_nome_cid_empreg(1,@nome,@cidade);
SELECT @nome;
SELECT @cidade;
```
### p12q2
``` sql
USE a15sistVendas;
```
### p12q2a
``` sql
SELECT * FROM compras;
DELIMITER |
CREATE PROCEDURE sp_retorna_qtd_comprada(
	IN codCompra INT,
	OUT qtdComprada INT
)
BEGIN
	SELECT comp_total INTO qtdComprada
	FROM compras
	WHERE codCompra = comp_codigo;
END;
|
DELIMITER ;

SELECT * FROM compras;
CALL sp_retorna_qtd_comprada(1,@qtd);
SELECT @qtd;
```
### p12q2b
#### Preparing the available data
``` sql
INSERT INTO compras VALUES (5,1,3,4);
INSERT INTO clientes VALUES (4,'Rebeca','5555555',NULL,NULL);
```
#### Create an auxiliary view
``` sql
CREATE VIEW vw_calc_subtot_compras AS
SELECT
	cli_codigo,
	cli_nome,
	(comp_total * prod_preco) AS valor_compra
FROM
	clientes AS cl
	INNER JOIN
		compras AS co
		ON cl.cli_codigo = co.comp_codcliente
	INNER JOIN
		produtos AS p
		ON co.comp_codproduto = p.prod_codigo;
```
#### See how the data are available to you use
``` sql
SELECT * FROM vw_calc_subtot_compras;
```
#### Solve the problem
``` sql
DELIMITER |
CREATE PROCEDURE sp_fidelidade_cliente(
	IN c_cod INT
)
BEGIN
	DECLARE res_soma INT DEFAULT 0;
	SELECT
		SUM(valor_compra)
	INTO
		res_soma
	FROM
		vw_calc_subtot_compras
	WHERE
		cli_codigo = c_cod;
	IF ((res_soma < 500) OR (res_soma IS NULL)) THEN
		SELECT 'Cliente Popular' AS 'Classificação do Cliente';
	ELSEIF (res_soma <= 1000) THEN
		SELECT 'Cliente Normal' AS 'Classificação do Cliente';
	ELSE
		SELECT 'Cliente VIP' AS 'Classificação do Cliente';
	END IF;
END;
|

DELIMITER ;
```
#### See the source data
``` sql
SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM compras;
SELECT * FROM vw_calc_subtot_compras;
```
#### Test the solution
``` sql
CALL sp_fidelidade_cliente(1);
CALL sp_fidelidade_cliente(2);
CALL sp_fidelidade_cliente(3);
CALL sp_fidelidade_cliente(4);
```
