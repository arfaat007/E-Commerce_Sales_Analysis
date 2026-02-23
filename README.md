# 🛒 E-Commerce Sales Analytics using SQL

## 📖 Project Overview
This project analyzes a real-world Brazilian E-Commerce dataset (Olist) using MySQL.  
The goal is to extract business insights related to sales performance, customer behavior, and revenue trends using advanced SQL queries.

---

## 🎯 Objectives
- Analyze total sales and order volume
- Identify top customers by revenue
- Track monthly sales trends
- Detect repeat customers
- Calculate average order value
- Rank customers based on revenue

---

## 🗂 Dataset Used
Brazilian E-Commerce Public Dataset (Olist) from Kaggle.

Tables used:
- olist_customers_dataset
- olist_orders_dataset
- olist_order_items_dataset

---

## 📊 Key Business KPIs Implemented

✔ Total Orders  
✔ Total Revenue  
✔ Total Customers  
✔ Average Order Value  
✔ Monthly Revenue Trend  
✔ Top 10 Customers by Revenue  
✔ Repeat Customers  
✔ Revenue Ranking using Window Functions  

---

## 🧠 SQL Concepts Used

- INNER JOIN
- GROUP BY
- HAVING
- Aggregate Functions (SUM, COUNT)
- Window Functions (RANK)
- Date Formatting (STR_TO_DATE, DATE_FORMAT)
- Subqueries
- Analytical Queries

---

## 🚀 Sample Query (Monthly Revenue Trend)

```sql
SELECT 
    DATE_FORMAT(STR_TO_DATE(order_purchase_timestamp,'%Y-%m-%d %H:%i:%s'),'%Y-%m') AS month,
    SUM(oi.price) AS revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;
