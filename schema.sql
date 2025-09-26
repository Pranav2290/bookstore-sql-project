create table books(
  book_ID serial primary key,
  Title varchar(100),
  Author varchar(100),
  Gener varchar(50),
  Published_Year int,
  price numeric(10,2),
  Stock int
);

create table customers(
	customer_id serial primary key,
	name varchar(100),
	email varchar(100),
	phone varchar(15),
	city varchar(100),
	country varchar(100)
);

create table orders(
	order_id serial primary key,
	customer_id INT references customers(customer_id), 
	book_id INT references books(book_id),
	order_date date,
	quantity int,
	total_amount numeric(10,2)
);


