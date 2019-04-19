# Used commands
_by page in the courseware_

## Before (with `.my.cnf` setted)
In the MySQL Server terminal:
``` sql
CREATE DATABASE a17sistVendas;
CREATE DATABASE a17locadora;
CREATE DATABASE a17folhaPagto;
CREATE DATABASE a17cineOnline;
CREATE DATABASE a17sistEdu;
exit;
```
In the Bash terminal:
``` bash
mysqldump a16sistVendas | mysql a17sistVendas;
mysqldump a14locadora | mysql a17locadora;
mysqldump a16folhaPagto | mysql a17folhaPagto;
mysqldump a13cineOnline | mysql a17cineOnline;
mysqldump a16sistEdu | mysql a17sistEdu;
mysql
```
## p03
Back to the MySQL Server terminal.
As root user:
``` sql
CREATE USER josemar IDENTIFIED BY '111111';
```

On bash:
``` bash
mysql -u josemar –p;
```

Back to MySQL, as root user:
``` sql
SELECT user, host, authentication_string FROM mysql.user;
```

## p04 (ativ)
### p04q1
As root user:
``` sql
CREATE USER fulano IDENTIFIED BY '1234';
```

## p04q2
On bash:
``` bash
mysql -u fulano -p
```

## p06
On MySQL, as root user:
``` sql
GRANT SELECT ON a17sistVendas.clientes TO josemar;
```

As josemar user:
``` sql
SHOW DATABASES;
USE a17sistVendas;
SHOW TABLES;
SELECT * FROM clientes;

SELECT * FROM produtos;
```

As root user:
``` sql
GRANT SELECT ON a17sistVendas.* TO josemar;
GRANT INSERT, UPDATE, DELETE ON a17sistVendas.* TO josemar;

USE a17locadora;
GRANT SELECT (cli_nome) ON a17locadora.clientes TO josemar;

USE a17folhaPagto;
GRANT SELECT ON a17folhaPagto.vw_basic_funcionario_id TO josemar;

USE a17cineOnline;
GRANT ALL ON a17cineOnline.* TO josemar WITH GRANT OPTION;

REVOKE SELECT ON a17locadora.clientes FROM josemar;

REVOKE GRANT OPTION ON a17cineOnline.*  FROM josemar;

REVOKE UPDATE ON a17cineOnline.* FROM josemar;

SHOW GRANTS FOR josemar;

GRANT SELECT ON a17sistVendas.* TO jose IDENTIFIED BY '22222';
```

### v03
As root user:
``` sql
CREATE DATABASE a17vids;
USE a17vids;
CREATE USER usrDBA@localhost IDENTIFIED BY 'dba';
CREATE USER usrProg@localhost IDENTIFIED BY 'prog';
CREATE USER usrVend@'%' IDENTIFIED BY 'vend';

GRANT ALL PRIVILEGES ON a17vids.* TO usrDBA@localhost;
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER, CREATE ROUTINE ON a17vids.* TO usrProg@localhost;
GRANT SELECT, INSERT, UPDATE, DELETE ON a17vids.* TO usrVend@'%';

REVOKE CREATE ON a17vids.* FROM usrProg@localhost;
SHOW GRANTS FOR usrProg@localhost;
SET PASSWORD FOR usrVend@'%' = PASSWORD('vendedor');
```

## p07 (ativ)
As root user:
``` sql
USE a17folhaPagto;
```

### p07q1
As root user:
``` sql
CREATE USER joao IDENTIFIED BY '111111';
CREATE USER maria IDENTIFIED BY '222222';
DROP USER jose;
CREATE USER jose IDENTIFIED BY '333333';
```

### p07q2a
As root user:
``` sql
GRANT UPDATE, INSERT, DELETE ON a17folhaPagto.* TO joao;
/* I wonder if this following code is a good solution... */
REVOKE CREATE VIEW, SHOW VIEW ON a17folhaPagto.* FROM joao;
```

### p07q2b
_'Clientes' is a table from another DBs. But how the question asked to consider just the DB 'pagamentos' (equivalent here to 'folhaPagto'), the table 'clientes' will be interpreted like 'empregados'._

As root user:
``` sql
GRANT INSERT, UPDATE ON a17folhaPagto.empregados TO maria;
```

### p07q2c
_Same interpretation of 'clientes' as in p07q2b._

As root user:
``` sql
GRANT SELECT ON a17folhaPagto.empregados TO jose;
GRANT SELECT ON a17folhaPagto.descontos TO jose;
```

### p07q2d
_Same interpretation of 'clientes' as in p07q2b._

As root user:
``` sql
GRANT UPDATE, INSERT, DELETE ON a17folhaPagto.empregados TO joao WITH GRANT OPTION;
```

As joao user:
``` sql
USE a17folhaPagto;
GRANT UPDATE, INSERT, DELETE ON a17folhaPagto.empregados TO jose;
```

### p07q2e
_Same interpretation of 'clientes' as in p07q2b._

As root user:
``` sql
USE a17folhaPagto;
REVOKE ALL ON a17folhaPagto.empregados FROM maria;
```

### p07q2f
_Same interpretation of 'clientes' as in p07q2b._

As root user:
``` sql
REVOKE ALL ON a17folhaPagto.empregados FROM joao;
FLUSH PRIVILEGES;
```

## p08
### v04
As root user:
``` sql
USE a17vids;

DROP USER usrDBA@localhost;
DROP USER usrProg@localhost;
DROP USER usrVend@'%';
CREATE USER usrDBA@localhost IDENTIFIED BY 'dba';
CREATE USER usrProg@localhost IDENTIFIED BY 'prog';
CREATE USER usrVend@'%' IDENTIFIED BY 'vend';

GRANT ALL PRIVILEGES ON a17vids.* TO usrDBA@localhost;
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER, CREATE ROUTINE ON a17vids.* TO usrProg@localhost;
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON a17vids.* TO usrVend@'%';

GRANT SELECT ON a17vids.* TO usrEst@localhost IDENTIFIED BY 'estagiario';
```

As usrDBA user:
``` sql
USE a17vids;
```

As usrProg user:
``` sql
USE a17vids;

CREATE TABLE produtos (
pro_cod INT,
pro_nome VARCHAR(50),
PRIMARY KEY (pro_cod)
);

DELIMITER #
CREATE PROCEDURE sp_produtos()
BEGIN
	SELECT * FROM produtos
	ORDER BY 2;
END;
#
DELIMITER ;
```

AS usrVend user:
``` sql
USE a17vids;

/* The following command must be denied. */

CREATE TABLE produtos2 (
pro_cod INT,
pro_nome VARCHAR(50),
PRIMARY KEY (pro_cod)
);

/* This must be denied too. */
DELIMITER #
CREATE PROCEDURE sp_produtos2()
BEGIN
	SELECT * FROM produtos
	ORDER BY 2;
END;
#

DELIMITER ;

/* The next commands must be accepted. */
INSERT INTO produtos
VALUES
(1,'Teste');

SELECT * FROM produtos;

UPDATE produtos
SET pro_nome = 'Alterado'
WHERE pro_cod = 1;

SELECT * FROM produtos;

CALL sp_produtos();
```

As root user:
``` sql
USE a17vids;

REVOKE CREATE ON a17vids.* FROM usrProg@localhost;

SHOW GRANTS FOR usrProg@localhost;

SET PASSWORD FOR usrVend@'%' = PASSWORD('vendedor');
```

As usrProg user:
``` sql
USE a17vids;

/* This command must be denied. */
CREATE TABLE produtos2 (
pro_cod INT,
pro_nome VARCHAR(50),
PRIMARY KEY (pro_cod)
);
```

## p11 (ativ)
As root user:
``` sql
USE a17sistEdu;

CREATE USER prof IDENTIFIED BY '111111';
CREATE USER coord IDENTIFIED BY '222222';
DROP USER maria;
CREATE USER maria IDENTIFIED BY '333333';
CREATE USER marcos IDENTIFIED BY '444444';

GRANT SELECT ON a17sistEdu.alunos TO marcos;
GRANT ALL ON a17sistEdu.* TO coord WITH GRANT OPTION;
GRANT SELECT, UPDATE (aluno_endereco, aluno_cidade) ON a17sistEdu.alunos TO maria;
GRANT SELECT, UPDATE, INSERT ON a17sistEdu.professores TO maria;

REVOKE SELECT ON a17sistEdu.alunos FROM marcos;
REVOKE INSERT ON a17sistEdu.professores FROM maria;
```

### p11q1
Answers, relative to a17sistEdu db:

| User | Object type | Object name | Permission(s) |
| ---- | ------------------------------ | ----------- | ---------- |
| marcos | table | alunos | SELECT (revoked at the end) |
| coord  | all | (all of them) | all (including grant option of these same permissions to others users) |
| maria | 2 columns of a table | columns: aluno_endereco, aluno_cidade / table: alunos | SELECT, UPDATE |
| maria | table | professores | SELECT, UPDATE, INSERT (this last was lost at the end) |
