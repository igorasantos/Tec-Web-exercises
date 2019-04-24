# Used commands
_by page in the courseware_

## Before (with `.my.cnf` setted)
In the MySQL Server terminal:
``` sql
CREATE DATABASE a20locadora;
CREATE DATABASE a20sistEdu;
CREATE DATABASE a20folhaPagto;
CREATE DATABASE a20vids;
exit;
```
In the Bash terminal:
``` bash
mysqldump a19locadora | mysql a20locadora;
mysqldump --routines a19sistEdu | mysql a20sistEdu;
mysqldump --routines a17folhaPagto | mysql a20folhaPagto;
mysqldump --routines a16vids | mysql a20vids;
mysql
```
## p02 onwards
- Download the [JDBC driver for MySQL](https://dev.mysql.com/downloads/connector/j/) (I prefer "Platform Independent" option).
- Follow the programming steps on the courseware text.
- Use some Java IDE (like Eclipse, e.g.). I used "File > New > Java Project" option.
- On the creation wizard, add the downloaded MySQL driver.
- Some Java codes from class A19 may be used at the begin of this class.

## p05 (ativ)
``` sql
USE a20locadora;

INSERT INTO clientes VALUES (30,'Rapaz da TI','123456789','M','Técnico de TI',1500);
```

## p06
### v03
``` sql
USE a20vids;
INSERT INTO autores_obras VALUES (20,10,1);

DELIMITER |
CREATE PROCEDURE sp_exclui_ao (
IN ao_cod INT
)
BEGIN
DELETE FROM autores_obras WHERE aut_obr_id = ao_cod;
END;
|
DELIMITER ;
```

## p08 (ativ)
### p08q3b
``` sql
USE a20locadora;

DELIMITER |
CREATE PROCEDURE sp_cl_dados_resumidos (
)
BEGIN
SELECT * FROM vw_cli_dados_pessoais;
END;
|
DELIMITER ;
```
