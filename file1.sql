USE Oracle_Retail;
CREATE TABLE Customers ( id INT PRIMARY KEY, name VARCHAR(20) );
INSERT INTO Customers VALUES ( 11, 'Alpha' );
INSERT INTO Customers VALUES ( 22, 'Beta' );
INSERT INTO Customers VALUES ( 33, 'Charlie' );
SELECT id, name FROM Customers WHERE id > 12;
