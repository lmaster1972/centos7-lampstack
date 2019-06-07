/*script taken from http://bertvv.github.io/notes-to-self/2015/11/16/automating-mysql_secure_installation/ */
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
/* till here */
use mysql;
create user 'user'@'172.22.0.2';
create database project;
grant all on project.* to 'user'@'172.22.0.2';
FLUSH PRIVILEGES;
