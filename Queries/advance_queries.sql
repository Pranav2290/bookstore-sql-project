select * from books;
select * from customers;
select * from orders;

--1) Retrieve the total number of books sold from each genre.
select distinct b.genre, sum(o.quantity) as Books_sold 
from orders o 
join books b
on o.book_id = b.book_id
group by genre; --also use b.genre

select distinct genre from books; --to check how many types of genre.


--2) Find the average price of a book from the 'Fantasy' genre.
select avg(price) as avg_price
from books where genre = 'Fantasy';

--for all genres
select distinct genre, avg(price) as avg_price
from books
group by genre;

--3) List the customers who have placed at least 2 orders.
select c.customer_id, c.name, count(o.order_id) as order_count
from orders o
join customers c
on c.customer_id = o.customer_id
group by c.customer_id
having count(order_id) >= 2;

--4) Find the most frequently ordered book;
select b.book_id, b.title, count(o.order_id) as order_count
from orders o
join books b
on b.book_id = o.book_id
group by b.book_id
order by order_count desc limit 1; 

--5) Show the top 3 most expensive books from the 'Fantasy' genre.
select book_id, title, price 
from books 
where genre = 'Fantasy'
order by price desc limit 3;

--6) Retrieve the total quantity of books sold by each author.
select b.author, sum(o.quantity) as books_sold
from orders o
join books b
on o.book_id = b.book_id
group by b.author 
order by books_sold desc; 

--7) Find the author whose books never sold.
select distinct b.author, b.title, o.quantity
from books b
LEFT JOIN orders o      --return all rows(authors) from books and show only matching rows from the orders table if no match gives null
on b.book_id = o.book_id
where order_id is null; 

--8) List the cities where customers who spent over $30 are located.
select /*c.customer_id, c.name,*/ distinct c.city, o.total_amount
from orders o
join customers c
on o.customer_id = c.customer_id
--group by c.customer_id
where total_amount > 30.00;

--9) Retrieve the total amount spent by each customer.
select c.customer_id, c.name, sum(o.total_amount) AS total_amount_apent
from orders o
join customers c
on o.customer_id = c.customer_id
group by c.customer_id, c.name
order by total_amount_apent desc;

--10) Calculate the stock remaining after fulfilling all orders.
select b.book_id, b.title, b.stock, COALESCE(sum(o.quantity),0) AS order_quantity,
       b.stock - COALESCE(sum(o.quantity),0) AS stock_left
from books b
LEFT JOIN orders o on b.book_id = o.book_id
group by b.book_id;




