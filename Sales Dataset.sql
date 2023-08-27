select * from sales_details

select * from sales_orders

-- Find out customers who lives in "Delhi"?
select "customer_name", "city"
from sales_orders
where city = 'Delhi';

-- What is the Average Amount Per Order?
select "order_id", round(avg("amount")) as Avg_Amount
from sales_details
group by "order_id";

-- Find out the Customers whose Amount is morethan 3000?
select O.order_id, O.customer_name, D.Amount
from sales_orders as O
join sales_details as D
on O.order_id = D.order_id
where Amount > 3000;

-- What is the Average Profit Per Order?
select "order_id", round(avg("profit")) as "Avg_Profit"
from sales_details
group by "order_id"
order by "Avg_Profit" desc

-- Which State has the Highest Total Sales Amount?
select O.state, sum(D.amount) as Total_Sales
from sales_orders as O
join sales_details as D
on O.order_id = D.order_id
where amount < 4000
group by O.state
limit 1;

-- What is the Most Common City for Orders? (DOUBT)
select "city", "order_id"
from sales_orders

SELECT "city", COUNT(*) AS "Num_Of_Orders"
FROM sales_orders
GROUP BY "city"
ORDER BY "Num_Of_Orders" DESC
LIMIT 1;

-- What is the Average Quantity Sold Per Order?
select "order_id", round(avg("quantity")) as Avg_Qty
from sales_details
group by "order_id";

-- Which payment mode is the most popular? (DOUBT)
select "paymentmode", "category"
from sales_details
group by "category" and 
limit 1

SELECT "paymentmode", COUNT(*) AS "NumOrders"
FROM sales_details
GROUP BY "paymentmode"
ORDER BY "NumOrders" DESC
LIMIT 1;

-- Who are the Top 10 Customers by the Total Amount Spent?
select "order_id", sum("amount") as "Total_Amount_Spent"
from sales_details
group by "order_id"
order by "Total_Amount_Spent" desc
limit 10;

-- What is the Correlation Between the Amount & Profit?
SELECT CORR("amount", "profit") AS "Correlation"
from sales_details

-- What is the Correlation Between the Quantity & Profit?
SELECT CORR("quantity", "profit") AS "Correlation"
from sales_details

-- What is the Average Amount for Orders Placed on each Date?
select O.order_date, round(avg(D.amount)) as Avg_Amount
from sales_orders as O
join sales_details as D
on O.order_id = D.order_id
group by O.order_date
order by Avg_Amount desc

-- What is the Distribution of Sales across different Categories?
SELECT "category", SUM("quantity") AS "Total_Sales"
from sales_details
GROUP BY "category"
ORDER BY "Total_Sales" DESC;

-- What is the Distribution of Sales across different Payment Modes?
SELECT "paymentmode", SUM("quantity") AS "Total_Sales"
from sales_details
GROUP BY "paymentmode"
ORDER BY "Total_Sales" DESC;

-- How many Orders were Placed on each Date?
select "order_date", count (*) as "Orders_Placed"
from sales_orders
group by "order_date"
order by "Orders_Placed" desc;

-- What is the Total Quantity Sold for each Category?
select "category", sum(quantity) as "Total_Quantity"
from sales_details
group by "category"
order by "Total_Quantity";

-- What is the Distribution of Sales across different States?
select O.state, sum(D.quantity) as Total_Qty_Sales
from sales_orders as O
join sales_details as D
on O.order_id = D.order_id
group by O.state
order by total_qty_sales desc;
