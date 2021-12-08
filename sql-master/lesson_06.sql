drop table customers;

create table customers (
	customer_id int auto_increment not null,
	first_name varchar(255),
	last_name varchar(255),
	email_address varchar(255),
	number_of_complaints int,
primary key (customer_id),
unique key (email_address)
);

alter table customers
drop index email_address;

alter table customers
add column gender ENUM('M', 'F') after last_name;

insert into customers(first_name, last_name, gender, email_address, number_of_complaints)
values('Beatriz', 'Lisboa', 'F', 'beteamo@papai.com', 0);

alter table customers
change column number_of_complaints number_of_complaints int default 0;

insert into customers(first_name, last_name, gender)
values('Peter', 'Figaro', 'M');
