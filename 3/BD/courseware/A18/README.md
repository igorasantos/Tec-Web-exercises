# Used commands
_by page in the courseware_

## Before (with `.my.cnf` setted)
In the MySQL Server terminal:
``` sql
CREATE DATABASE a18locadora;
exit;
```
In the Bash terminal:
``` bash
mysqldump a17locadora | mysql a18locadora;
mysql
```
## p04
On MySQL Workbench, server GUI section:

- Begin the Reverse Engineer process ("Database" menu > "Reverse Engineer").
- Use the a18locadora db to make the process.

## p07
On MySQL Workbench, Models section:

- Use A05 model as base.
- Review the base file (including rename the Schema name, if necessary).
- Begin the Forward Engineer process ("Database" menu > "Forward Engineer").

## p14 (ativ)
### p14q1a
On MySQL Server:
``` sql
USE a18forward;
SHOW TABLES;
DESC Departamento;
DESC Empregado;
```

On MySQL Workbench, Models section:

- Change the column "Nome" and "Telefone" from table "Departamento" NOT NULL.
- Save and close.

### p14q1b
On MySQL Server:
``` sql
ALTER TABLE Empregado DROP FOREIGN KEY fk_Empregado_1;
DROP TABLE Departamento;
```

On MySQL Workbench, Models section:

- Do the Forward Engineer process.

Back to MySQL Server:
``` sql
USE a18forward;
SHOW TABLES;
DESC Departamento;
DESC Empregado;
```
