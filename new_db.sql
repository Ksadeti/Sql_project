-- All customers and their email addresses.
select name, email
from customers;

-- How many books are available in the books table.
select count(*) 
from books;

-- Distinct genres from the books table.
select distinct genre
from books;

-- All books that cost more than 50.
select * 
from books
where price > 50;

-- Order IDs and total amounts where the total is above 80.
select order_id, total_amount
from orders
where total_amount > 80;

-- Names of customers from Ghana.
select name, country 
from customers
where country = 'Ghana';

-- Average price of all books.
select AVG(price) as avg_price 
from books;

-- Titles and genres of all books that cost more than the average book price.
select title, genre
from books
where price > (select AVG(price) from books);

-- List of all orders including: order_id, customer name, order date, & total amount
select o.order_id, c.name, o.order_date, o.total_amount
from orders o
Join customers c on o.customer_id  = c.customer_id;

-- List of all books that have been reviewed, including: book title, average rating, & number of reviews
select b.title, AVG(r.rating) as avg_rating, count(r.review_id) as num_reviews
from reviews r
join books b on r.book_id = b.book_id
group by b.title;

-- Top 5 most expensive books and their genres.
select title, genre, price
from books
order by price desc
limit 5;

-- All orders with multiple items (quantity > 1).
select distinct o.order_id
from orders o 
join order_items oi on o.order_id = oi.order_id
where oi.quantity > 1;

-- All customers who have placed more than one order.
select customer_id, count(order_id) as order_count
from orders
group by customer_id
having count(order_id) > 1;

-- Books that have never been ordered.
select *
from books
where book_id not in
	(select distinct book_id from order_items
);

--  Most purchased book (by quantity sold across all orders).
select b.title, sum(oi.quantity) as total_sold
from order_items oi
join books b on oi.book_id = b.book_id
group by b.title
order by total_sold desc
limit 1;

-- Total sales amount per genre.
select b.genre, sum(b.price * oi.quantity) as genre_sales
from order_items oi
join books b on oi.book_id = b.book_id
group by b.genre;

-- top 3 customers by total spending, including their name and amount spent.
select c.name, sum(o.total_amount) as total_spent
from customers c
join orders o on c.customer_id = o.customer_id
group by c.name
order by total_spent desc
limit 3;


-- customer name, total number of orders, total quantity of books ordered, & total amount spent
select c.name, 
	count(distinct o.order_id) as num_orders, 
    sum(oi.quantity) as total_books, 
    sum(o.total_amount) as total_spent
from customers c
join orders o on c.customer_id = o.customer_id
join order_items oi on o.order_id = oi.order_id
group by c.name;

-- orders where the total amount does not match the sum of the prices of order items, assuming each quantity was 1.
select o.order_id, o.total_amount, sum(b.price) as calculated_sum
from orders o
join order_items oi on o.order_id = oi.order_id
join books b on oi.book_id = b.book_id
group by o.order_id, o.total_amount
having o.total_amount != sum(b.price);

-- customers who only ordered books in the “Technology” genre (and no other genres).
select distinct c.name
from customers c
where c.customer_id not in (
  select distinct o.customer_id
  from orders o
  join order_items oi on o.order_id = oi.order_id
  join books b on oi.book_id = b.book_id
  where b.genre != 'Technology'
);