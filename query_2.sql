CREATE TABLE Details_1 ( id INT PRIMARY KEY, name VARCHAR(20) );
INSERT INTO Details_1 VALUES ( 1, 'Alpha' );
INSERT INTO Details_1 VALUES ( 2, 'Beta' );
INSERT INTO Details_1 VALUES ( 3, 'Gamma' );
INSERT INTO Details_1 VALUES ( 4, 'Ele' ); 
CREATE TABLE Details_2 ( id INT PRIMARY KEY, contact INT );
INSERT INTO Details_2 VALUES ( 1, 8094989700 );
INSERT INTO Details_2 VALUES ( 2, 7896750090 );
INSERT INTO Details_2 VALUES ( 3, 8903321456 );
INSERT INTO Details_2 VALUES ( 4, 8902211134 ); */
SELECT Details_1.name,Details_2.contact
FROM Details_1
LEFT JOIN Details_2
ON Details_1.id = Details_2.id;
