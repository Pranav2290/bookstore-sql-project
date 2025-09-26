--copy books table
copy
books(book_id, title, author, gener, published_year, price, stock)
from 'D:\Data Analytics\SQL\YT Learning\ST - SQL ALL PRACTICE FILES\All Excel Practice Files\Books.csv'
delimiter ','
csv header;

--copy customers table
copy 
customers(customer_id, name, email, phone, city, country)
from 'D:\Data Analytics\SQL\YT Learning\ST - SQL ALL PRACTICE FILES\All Excel Practice Files\Customers.csv'
delimiter ','
csv header;

--copy orders table (Linking table)
copy 
orders(order_id, customer_id, book_id, order_date, quantity, total_amount)
from 'D:\Data Analytics\SQL\YT Learning\ST - SQL ALL PRACTICE FILES\All Excel Practice Files\Orders.csv'
delimiter ',' csv header;