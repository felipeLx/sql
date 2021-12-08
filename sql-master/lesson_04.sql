CREATE TABLE Items
(
	item_code varchar(255) NOT NULL,
    item varchar(255),
    unit_price numeric(10,2),
    company_id VARCHAR(255),
PRIMARY KEY(item_code)
);

CREATE TABLE Companies
(
	company_id varchar(255) NOT NULL,
    company_name varchar(255) NOT NULL,
    headquarters_phone_number int(12),
primary key(company_id)
);