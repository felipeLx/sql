CREATE TABLE Sales
(
	purchase_number INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL
    );
    
DROP TABLE Sales;