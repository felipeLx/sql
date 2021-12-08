DROP table Sales;

create table Sales
(
	purchase_number INT auto_increment,
    date_of_purchase Date,
    customer_id Int,
    item_code Varchar(10),
primary key(purchase_number)
);

alter table Sales
add foreign key (customer_id) references Customers(customer_id) on delete cascade;