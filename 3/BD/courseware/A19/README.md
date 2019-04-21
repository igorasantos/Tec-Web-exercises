# Used commands
_by page in the courseware_

## Before (with `.my.cnf` setted)
In the MySQL Server terminal:
``` sql
CREATE DATABASE a19locadora;
CREATE DATABASE a19sistEdu;
exit;
```
In the Bash terminal:
``` bash
mysqldump a18locadora | mysql a19locadora;
mysqldump a17sistEdu | mysql a19sistEdu;
mysql
```
## p04 onwards
- Download the [JDBC driver for MySQL](https://dev.mysql.com/downloads/connector/j/) (I prefer "Platform Independent" option).
- Follow the programming steps on the courseware text.
- Use some Java IDE (like Eclipse, e.g.). I used "File > New > Java Project" option.
- On the creation wizard, add the downloaded MySQL driver.
