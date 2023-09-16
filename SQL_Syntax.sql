**1-Data definition language (DDL): CREATE,ALTER,DROP,RENAME,TRUNCATE**

CREATE object_type object_name;
CREATE TABLE object_name(column_name data_type);

ALTER:ADD/REMOVE/RENAME
ALTER TABLE SALES
ADD COLUMN date_of_purchase DATE;

DROP object_type object_name;
DROP TABLE Customers;

RENAME object_type object_name TO new_object_name;
RENAME TABLE Customers TO Customers_data;

TRUNCATE object_type object_name;
TRUNCATE TABLE Customers;


**2-Data manipulation language (DML):SELECT, INSERT, UPDATE, DELETE**

SELECT.. FROM  ..;
SELECT * FROM sales;

INSERT INTO ..  VALUES..;
INSERT INTO sales(purchase_number,date_of_purchase) 
VALUES(1,'2017-10-11');

INSERT INTO sales
VALUES(1,'2017-10-11');

UPDATE.. SET.. WHERE..;
UPDATE sales
SET  date_of_purchase='2017-12-12'
WHERE purchase_number=1;


DELETE FROM .. WHERE..;
DELETE FROM sales;
Where  purchase_number=1;

**3-Data control language (DCL):GRANT, REVOKE**

GRANT type_of_permission 
ON database_name.table_name TO 'username'@'localhost';

--EXP:
CREATE USER 'frank'@'localhost' IDENTIFIED BY '7896351';
GRANT SELECT  ON sales.customers TO 'frank'@'localhost';
GRANT ALL ON sales.* TO 'frank'@'localhost';


REVOKE type_of_permission ON database_name.table_name FROM
‘username’@’localhost’;

--EXP:
REVOKE  SELECT ON sales.customers FROM 'frank'@'localhost';


**4-Transaction control language (TCL)**

-the COMMIT statement: committed states can accrue

-the ROLLBACK clause: the clause that will let you make a step back 

--EXP:
UPDATE customers
SET last_name = ‘Johnson’
WHERE customer_id = 4
COMMIT;
ROLLBACK;

