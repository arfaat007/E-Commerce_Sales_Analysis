# E-Commerce Sales Analysis using SQL

![SQL](https://img.shields.io/badge/SQL-MySQL-blue)
![Dataset](https://img.shields.io/badge/Dataset-Olist-orange)
![Status](https://img.shields.io/badge/Status-Completed-success)
![Project](https://img.shields.io/badge/Project-Data%20Analysis-green)

## Project Overview

**E-Commerce Sales Analysis** is a SQL-based data analysis project built using the Brazilian E-Commerce Public Dataset by Olist.

The main objective of this project is to analyze e-commerce sales data and extract business insights related to revenue, customers, orders, monthly trends, repeat customers, and customer ranking.

This project demonstrates practical SQL skills such as joins, aggregations, grouping, filtering, subqueries, date formatting, and window functions.

---

## Problem Statement

E-commerce businesses generate large amounts of order, customer, and transaction data. However, raw data alone does not help decision-making unless it is transformed into meaningful business insights.

This project uses SQL to answer important business questions such as:

- What is the total revenue generated?
- How many orders were placed?
- Who are the top customers by revenue?
- What is the monthly revenue trend?
- How many customers made repeat purchases?
- What is the average order value?
- How can customers be ranked based on revenue?

---

## Dataset Used

The project uses the **Brazilian E-Commerce Public Dataset by Olist**.

Tables used in this analysis:

- `olist_customers_dataset`
- `olist_orders_dataset`
- `olist_order_items_dataset`

---

## Business Objectives

- Analyze total orders and total revenue
- Calculate average order value
- Identify top customers by revenue
- Track monthly revenue trends
- Detect repeat customers
- Rank customers based on total revenue
- Generate business recommendations from SQL outputs

---

## Key Business KPIs

- Total Orders
- Total Revenue
- Total Customers
- Average Order Value
- Monthly Revenue Trend
- Top 10 Customers by Revenue
- Repeat Customers
- Customer Revenue Ranking

---

## SQL Concepts Used

- `INNER JOIN`
- `GROUP BY`
- `ORDER BY`
- `HAVING`
- Aggregate functions: `SUM`, `COUNT`, `AVG`
- Date functions: `STR_TO_DATE`, `DATE_FORMAT`
- Subqueries
- Window functions: `RANK()`
- Business KPI calculation

---

## Project Workflow

```text
Raw E-Commerce Dataset
        ↓
Import Tables into MySQL
        ↓
Understand Table Relationships
        ↓
Perform SQL Joins
        ↓
Calculate Revenue and Order KPIs
        ↓
Analyze Customers and Monthly Trends
        ↓
Generate Business Insights
```

---

## Sample SQL Queries

### Total Revenue and Orders

```sql
SELECT
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi
ON o.order_id = oi.order_id;
```

### Monthly Revenue Trend

```sql
SELECT
    DATE_FORMAT(
        STR_TO_DATE(o.order_purchase_timestamp, '%Y-%m-%d %H:%i:%s'),
        '%Y-%m'
    ) AS month,
    ROUND(SUM(oi.price), 2) AS revenue
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi
ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;
```

### Top 10 Customers by Revenue

```sql
SELECT
    c.customer_unique_id,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM olist_customers_dataset c
JOIN olist_orders_dataset o
ON c.customer_id = o.customer_id
JOIN olist_order_items_dataset oi
ON o.order_id = oi.order_id
GROUP BY c.customer_unique_id
ORDER BY total_revenue DESC
LIMIT 10;
```

### Customer Revenue Ranking

```sql
SELECT
    customer_unique_id,
    total_revenue,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM (
    SELECT
        c.customer_unique_id,
        ROUND(SUM(oi.price), 2) AS total_revenue
    FROM olist_customers_dataset c
    JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id
    JOIN olist_order_items_dataset oi
    ON o.order_id = oi.order_id
    GROUP BY c.customer_unique_id
) ranked_customers;
```

---

## Screenshots

Create a `screenshots` folder and upload SQL output screenshots with these names.

### Total KPIs

![Total KPIs](screenshots/total_kpis.png)

### Monthly Revenue Trend

![Monthly Revenue Trend](screenshots/monthly_revenue_trend.png)

### Top Customers

![Top Customers](screenshots/top_customers.png)

### Repeat Customers

![Repeat Customers](screenshots/repeat_customers.png)

---

## Key Insights

Add your actual SQL output values here after running the queries.

- Total revenue generated: `Add value`
- Total orders analyzed: `Add value`
- Average order value: `Add value`
- Highest revenue month: `Add value`
- Top customer by revenue: `Add value`
- Repeat customer count: `Add value`

---

## Business Recommendations

- Focus retention campaigns on high-value customers.
- Track monthly revenue trends to understand seasonal demand.
- Encourage repeat purchases using loyalty offers.
- Identify top revenue-generating customers for premium offers.
- Monitor average order value to improve pricing and bundling strategies.
- Use customer ranking to design targeted marketing campaigns.

---

## Folder Structure

```text
E-Commerce_Sales_Analysis/
│
├── sql/
│   └── 01_ecommerce_sales_analysis.sql
│
├── reports/
│   └── business_insights.md
│
├── screenshots/
│   ├── total_kpis.png
│   ├── monthly_revenue_trend.png
│   ├── top_customers.png
│   └── repeat_customers.png
│
└── README.md
```

---

## How to Use This Project

1. Download the Olist dataset.
2. Import the required tables into MySQL.
3. Open the SQL file from the `sql/` folder.
4. Run queries step by step.
5. Review KPI outputs and business insights.
6. Add screenshots of SQL outputs to the `screenshots/` folder.

---

## Resume Bullet

Analyzed Olist e-commerce sales data using **MySQL** to calculate revenue KPIs, monthly trends, repeat customers, top customers, and customer revenue ranking using joins, aggregations, subqueries, and window functions.

---

## Author

**Mohammed Shoaib Arfaat Nayyer**

- GitHub: [@arfaat007](https://github.com/arfaat007)
