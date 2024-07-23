SELECT*FROM customers
SELECT*FROM customercustomerdemo
SELECT*FROM customerdemographics
SELECT*FROM categories
SELECT*FROM employees
SELECT*FROM employeeterritories
SELECT*FROM order_details
SELECT*FROM orders
SELECT*FROM products
SELECT*FROM region
SELECT*FROM shippers
SELECT*FROM shippers_tmp
SELECT*FROM suppliers
SELECT*FROM territories
SELECT*FROM usstates



--"The customers who place the most orders."
SELECT customers.company_name, COUNT(*) AS OrderCount
FROM customers
JOIN Orders ON customers.company_name = orders.ship_name
GROUP BY customers.company_name
ORDER BY OrderCount DESC;


We have identified our top ordering customers: 
Save-a Markets, Ernst Handel, Quick-stop. 
By offering special campaigns and discounts, we can continue to satisfy these customers
and enhance their loyalty. We can also expand our marketing strategy to attract
more orders from other markets. Alongside our product-based research, we can reassess and redefine our strategy and market direction.

-- The best-selling products.
SELECT products.product_id, products.product_name, SUM(order_details.Quantity) AS TotalSold
FROM products
INNER JOIN order_details ON products.product_id = order_details.product_id
GROUP BY products.product_id, products.product_name
ORDER BY TotalSold DESC
LIMIT 10;



"Our top 10 best-selling products are as follows, including sales
quantities and revenue generated. In our Python analyses, 
we considered the stock quantities. Stock levels and popular products are directly
proportional, meaning high-selling items have low stock levels and aren't long-term items in our inventory. 
This is a positive outcome. We need to keep our stocks updated better; 
popular products should always be available. If not, it can disturb both general and loyal customers. T
herefore, both stock and supply chain should be improved, and customer loyalty should be prioritized. This way, we can achieve better results."





-- "Personnel analysis.
SELECT e.last_name, e.first_name, COUNT(o.order_id) AS TotalOrders, SUM(od.quantity * (od.unit_price - od.discount)) AS TotalSales
FROM employees e
JOIN Orders o ON e.employee_id = o.employee_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY e.last_name, e.first_name
ORDER BY TotalSales DESC;

Rewarding our personnel will encourage them to achieve better sales performance. 
Therefore, I conducted a personnel analysis and measured their performance. 
The top revenue-generating personnel are as follows. 
We can motivate our staff by implementing systems such as Employee of the Month or Employee of the Week, and we could even consider a commission-based system. This way, we can increase our sales. 
Additionally, through our personnel, we can offer special treatment to our customers as discussed earlier. 
This approach can enhance both customer feedback and personnel performance.


--Sales over time.
SELECT EXTRACT(YEAR FROM o.order_date) AS OrderYear, EXTRACT(MONTH FROM o.order_date) AS OrderMonth, SUM(od.quantity * (od.unit_price - od.discount)) AS TotalSales
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY OrderYear, OrderMonth
ORDER BY OrderYear, OrderMonth;



When conducting sales analysis by months and years, we observe a baseline starting in the first four months of 1998. 
However, there is a decline every five months thereafter. Looking at other years and months, in 1996, there was a decline in months 8 and 9 with recovery towards the year-end. 
In 1997, despite a decline after New Year's, there was an increase after four months. Following a pause after the beginning of summer, momentum picks up again and continues in this manner. 
Generally, it can be said that there is an increase during seasonal transitions. This may be due to people being inclined to shop during seasonal changes and various campaigns being conducted during this period. 
We can increase our campaigns during these months and offer discounts to our special customers. During months with declines, we can increase personnel bonuses.

