
															--CUSTOMERS

--1) TOTAL CUSTOMERS
SELECT COUNT(Customer_ID) AS Total_Customers 
FROM CUSTOMERS;

--2) AVERAGE CUSTOMER AGE
SELECT ROUND(AVG(Age), 2) AS Avg_Customer_Age 
FROM CUSTOMERS;

--3) NO. OF CUSTOMERS PER CITY
SELECT City, COUNT(Customer_ID) AS No_of_Customers
FROM CUSTOMERS
GROUP BY City 
ORDER BY No_of_Customers DESC;

--4) NO. OF CUSTOMERS PER AGE BAND
SELECT Age_Band, COUNT(Customer_ID) AS No_of_Customers, ROUND(COUNT(Customer_ID) * 100.0 / (SELECT COUNT(Customer_ID) 
FROM CUSTOMERS), 2) AS Percentage FROM CUSTOMERS 
GROUP BY Age_Band 
ORDER BY No_of_Customers DESC;

--5) NO. OF CUSTOMERS PER GENDER
SELECT Gender, COUNT(Customer_ID) AS No_of_Customers, ROUND(COUNT(Customer_ID) * 100.0 / (SELECT COUNT(Customer_ID) 
FROM CUSTOMERS), 2) AS Percentage FROM CUSTOMERS 
GROUP BY Gender;

--6) TOTAL REVENUE PER AGE BAND
SELECT Age_Band, SUM(Total_Revenue_Capped) AS Total_Revenue_Capped 
FROM CUSTOMERS JOIN PERFORMANCE ON Customer_ID = Customer_ID 
GROUP BY Age_Band 
ORDER BY Total_Revenue_Capped DESC;


																--PRODUCTS

--7) TOTAL PRODUCTS
SELECT COUNT(Product_ID) AS Total_Products 
FROM PRODUCTS;

--8) AVERAGE WARRANTLY MONTHS
SELECT ROUND(AVG(Warranty_Months), 2) AS Avg_Warranty_Months 
FROM PRODUCTS;

--9) TOTAL REVENUE PER BRAND
SELECT Brand, SUM(Total_Revenue_Capped) AS Total_Revenue 
FROM PRODUCTS p JOIN ORDERS o ON p.Product_ID = o.Product_ID JOIN PERFORMANCE perf ON o.Order_ID = perf.Order_ID 
GROUP BY Brand 
ORDER BY Total_Revenue DESC;

--10) UNITS SOLD PER SUB CATEGORY
SELECT Sub_Category, SUM(Units_Sold) AS Units_Sold_Count 
FROM PRODUCTS p JOIN ORDERS o ON p.Product_ID = o.Product_ID 
GROUP BY Sub_Category 
ORDER BY Units_Sold_Count DESC;

--11) TOTAL PROFIT PER BRAND
SELECT Brand, SUM(Profit_Capped) AS Total_Profit 
FROM PRODUCTS p JOIN ORDERS o ON p.Product_ID = o.Product_ID JOIN PERFORMANCE perf ON o.Order_ID = perf.Order_ID 
GROUP BY Brand 
ORDER BY Total_Profit DESC;

--12) FINAL PRICE VS PROFIT PER BRAND AND SUB CATEGORY
SELECT p.Brand, p.Sub_Category, perf.Final_Price, perf.Profit_Capped AS Profit
FROM PRODUCTS p JOIN ORDERS o ON p.Product_ID = o.Product_ID JOIN PERFORMANCE perf ON o.Order_ID = perf.Order_ID
ORDER BY Brand;


															--ORDERS

--13) TOTAL ORDERS
SELECT COUNT(Order_ID) AS Total_Orders 
FROM ORDERS;

--14) AVERAGE UNIT PRICE
SELECT ROUND(AVG(Unit_Price), 2) AS Avg_Unit_Price 
FROM ORDERS;

--15) NO. OF ORDERS PER YEAR AND QUARTER
SELECT YEAR(Order_Date) AS Year, DATEPART(qq, Order_Date) AS Quarter, COUNT(Order_ID) AS Order_Count
FROM ORDERS
GROUP BY YEAR(Order_Date), DATEPART(qq, Order_Date)
ORDER BY Year, Quarter;

--16) NO. OF ORDERS PER DELIVERY STATUS
SELECT Delivery_Status, COUNT(Order_ID) AS No_of_Orders 
FROM ORDERS 
GROUP BY Delivery_Status;

--17) NO. ORDERS PER PAYMENT TYPE
SELECT Payment_Type, COUNT(Order_ID) AS No_of_Orders, ROUND(COUNT(Order_ID) * 100.0 / (SELECT COUNT(Order_ID) 
FROM ORDERS), 2) AS Percentage FROM ORDERS 
GROUP BY Payment_Type 
ORDER BY No_of_Orders DESC;

--18) NO. ORDERS PER SALES CHANNEL
SELECT Sales_Channel, COUNT(Order_ID) AS No_of_Orders, ROUND(COUNT(Order_ID) * 100.0 / (SELECT COUNT(Order_ID) 
FROM ORDERS), 2) AS Percentage FROM ORDERS 
GROUP BY Sales_Channel 
ORDER BY No_of_Orders DESC;


														--PERFORMANCE

--19) TOTAL REVENUE
SELECT SUM(Total_Revenue_Capped) AS Total_Revenue 
FROM PERFORMANCE;

--20) TOTAL PROFIT
SELECT SUM(Profit_Capped) AS Total_Profit 
FROM PERFORMANCE;

--21) AVERAGE FINAL PRICE
SELECT ROUND(AVG(Final_Price), 2) AS Avg_Final_Price 
FROM PERFORMANCE;

--22) TOTAL REVENUE PER YEAR
SELECT YEAR(YearMonth) AS Year, SUM(Total_Revenue_Capped) AS Total_Revenue
FROM PERFORMANCE
GROUP BY YEAR(YearMonth)
ORDER BY Year;

--23) TOTAL REVENUE PER CITY
SELECT City, SUM(Total_Revenue_Capped) AS Total_Revenue 
FROM CUSTOMERS c JOIN ORDERS o ON c.Customer_ID = o.Customer_ID JOIN PERFORMANCE p ON o.Order_ID = p.Order_ID 
GROUP BY City 
ORDER BY Total_Revenue DESC;

--24) NO. OF ORDERS PER SALES LEVEL
SELECT Sales_Level, COUNT(Order_ID) AS No_of_Orders 
FROM PERFORMANCE 
GROUP BY Sales_Level;
