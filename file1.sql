CREATE DATABASE mydb;
CREATE TABLE mytable ( id INT PRIMARY KEY, name VARCHAR(20) );
INSERT INTO mytable VALUES ( 1, 'A' );
INSERT INTO mytable VALUES ( 2, 'B' );
INSERT INTO mytable VALUES ( 3, 'C' );
SELECT id, name FROM mytable WHERE id > 1;
