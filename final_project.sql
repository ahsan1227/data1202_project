### check for nulls  ###

Select *
from orders_table
where  Sales is NULL ;


####### Products generating most sales #########
Create view Products_with_most_sales_amount as 
SELECT p.`Product Name`,p.`product id`,Sum(Sales) as Total_Sales 
FROM sales_analysis_1202.orders_table as o
join sales_analysis_1202.product_table p on o.`Product ID` = p.`Product ID`
group by `product name`,`Product ID`
order by Total_Sales desc
Limit 10 ;

####### Most popular products #########
Create view Hot_Selling_Products as 
SELECT p.`Product Name`,p.`product id`, Sum(Sales) as Total_Sales ,count(o.`Product ID`) as no_products_sold
FROM sales_analysis_1202.orders_table as o
join sales_analysis_1202.product_table p on o.`Product ID` = p.`Product ID`
group by `product name`,`Product ID`
order by no_products_sold desc
limit 10;

######## Least popular products #########
Create view Least_popular_products as 
SELECT p.`Product Name`,p.`product id`, Sum(Sales) as Total_Sales ,count(o.`Product ID`) as no_products_sold
FROM sales_analysis_1202.orders_table as o
join sales_analysis_1202.product_table p on o.`Product ID` = p.`Product ID`
group by `product name`,`Product ID`
order by no_products_sold asc
limit 5;

######### Most Loyal Customers ########

Create view most_loyal_customers as 
Select o.`customer ID`,c.`Customer name`,c.`country`,c.`city`, count(o.`Customer ID`) as orders_placed
from customer_table as c 
JOIN orders_table as o 
on c.`customer ID` = o.`customer ID`
group by c.`Customer Name`,c.`Customer ID`, c.`customer name`, c.`country`,c.`city`
order by orders_placed desc;

###### Top 3 Cities generating most orders #####
Create view Top_3_Cities as 
Select city,count(city) as order_placed_from_city
from orders_table as o 
inner join customer_table as  c
on o.`Customer ID` = c.`Customer ID` 
group by city
order by order_placed_from_city desc 
limit 5;