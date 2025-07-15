📚 Bookstore SQL Analytics


Overview

This project contains SQL queries for analyzing a fictional bookstore database. It covers customer insights, book sales, order patterns, and genre performance using basic to advanced SQL techniques.


Tables Used

customers: Customer info (name, email, country)

books: Book details (title, genre, price)

orders: Order metadata (date, amount)

order_items: Books per order

reviews: Book ratings and feedback


 Queries & Use Cases

 
🔍 Basic Retrieval

List of all customers and their emails.

Total number of books available.

Distinct genres in the catalog.

Books priced over 50.

Orders with total amounts above 80.

Customers located in Ghana.


📊 Aggregations

Average price of books.

Titles and genres of books above average price.

Top 5 most expensive books.

Total sales per genre.

Top 3 customers by total spending.



🔗 Joins & Advanced Analysis

Full order summary: order ID, customer name, date, and total amount.

Reviewed books with average rating and review count.

Orders containing multiple items.

Customers with multiple orders.

Books never ordered.

Most purchased book by quantity.

Detailed customer purchase profiles: orders, quantity, spending.

Data validation: orders where recorded total doesn’t match calculated amount.
