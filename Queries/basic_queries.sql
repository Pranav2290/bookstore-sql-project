Select * from books;
select * from customers;
select * from orders;

alter table books
rename column gener to genre;

--1) Retrieve all books in the "Fiction" genre.
select book_id, title, author, genre from books
where genre = 'Fiction';

--2) Find books published after the year 1950
select book_id, title, published_year from books
where published_year > 1950;

--3) List all customers from Canada.
select customer_id, name, country from customers 
where country = 'Canada';

--4) Show orders placed in November 2023.
select * from orders 
where order_date between '2023-11-01' and '2023-11-30';

--using EXTRACT
select * from orders
where extract(month from order_date) = 11
	and extract(year from order_date)= 2023;
--using DATE_TRUNC
select * from orders
where order_date >= date '2023-11-01' and
	  order_date <= date '2023-11-30';

--5) Retrieve the total stock of books available
select sum(stock) as total_stock from books;

--6) Find the details of the most expensive book.
select * from books order by price desc limit 1;

--7) Show all customers who ordered more than 1 quantity of the book.
select c.customer_id, c.name, o.quantity
from customers c
inner join orders o
on c.customer_id = o.customer_id 
where quantity > 1 order by quantity;

--8) Retrieve all the orders where the total amount exceeded $20.
select o.order_id, c.customer_id, c.name, 
       b.book_id, b.title, b.price, o.quantity, o.total_amount
from orders o
join customers c ON o.customer_id = c.customer_id
join books b ON o.book_id = b.book_id 
where total_amount >= 20.00; 

--9) List all genres available in the book table
select DISTINCT genre from Books; 

--10) Find the book with the lowest stock.
select book_id, title, stock from books order by stock desc;

--11) Calculate total revenue generated from all orders.
select sum(total_amount) as revenue_in_$ from orders;

