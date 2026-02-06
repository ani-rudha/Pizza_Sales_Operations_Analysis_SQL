# 🍕 Pizza Sales & Operations Analysis (SQL | MySQL)

## 📌 Project Overview
This project analyzes pizza sales and kitchen operations data using **SQL (MySQL)** to uncover insights related to **revenue performance, customer preferences, peak demand patterns, and operational efficiency**.

The analysis simulates a real-world pizza business environment where **customer demand, menu composition, and preparation efficiency** directly impact sales performance and service quality. The project demonstrates how SQL can be used not only for sales analysis but also to identify **operational bottlenecks** and support **data-driven improvements** in staffing, menu design, and workflow optimization.

---

## 🎯 Business Objectives
- Measure overall pizza sales and revenue performance  
- Identify peak demand hours and high-traffic days  
- Understand customer preferences across pizza types, sizes, and categories  
- Evaluate operational efficiency using preparation time analysis  
- Detect revenue loss from cancellations and delayed orders  
- Provide actionable recommendations to improve operations and revenue realization  

---

## 📑 Dataset Description

The project uses four relational tables:

### 📦 Orders
| Column | Description |
|------|------------|
| order_id | Unique order identifier |
| order_date | Date of order |
| order_time | Time of order |
| order_status | Completed, Processing, Cancelled |

### 🧾 Order Details
| Column | Description |
|------|------------|
| order_id | Linked order |
| pizza_id | Ordered pizza |
| quantity | Number of pizzas |

### 🍕 Pizzas
| Column | Description |
|------|------------|
| pizza_id | Pizza identifier |
| pizza_name | Pizza name |
| pizza_category | Pizza category |
| pizza_size | S, M, L, XL |
| price_usd | Price in USD |

### 🚚 Operations
| Column | Description |
|------|------------|
| order_id | Linked order |
| prep_start_time | Preparation start time |
| prep_end_time | Preparation end time |

> Cancelled orders are intentionally excluded from the operations table to reflect real operational tracking.

---

## 🔍 Analysis Workflow

### 🧭 Step 1: Data Understanding & Sanity Checks
- Verified table relationships and constraints  
- Checked duplicates and null values  
- Validated operational data coverage  

---

### 💰 Step 2: Sales & Revenue Analysis
**Key Insights:**
- Total revenue is close to **$1,880**
- Only **31 out of 100 orders** generate realized revenue
- Average order value is **$60.36**
- **Classic** category drives the most revenue (~$740)
- **Large (L)** pizzas generate the highest revenue (~$835)
- **Pepperoni** is the top revenue-generating pizza (~$299)
- Revenue loss due to cancellations is approximately **$2,670**

---

### ⏰ Step 3: Peak Demand & Time-Based Analysis
**Key Insights:**
- Demand peaks during **lunch, evening, and dinner hours**
- Peak hours show higher processing and cancellation rates
- **Weekdays outperform weekends**
- Busiest days: **Thursday, Monday, Tuesday**
- Peak demand observed on **Sunday evenings (~17:00)** and **Thursday nights (~22:00)**
- Operational alignment exists but needs optimization

---

### 🍕 Step 4: Customer Preferences & Menu Performance
**Key Insights:**
- Top-selling pizzas: *Margherita, Pepperoni, Spicy Italian*
- Top revenue pizzas: *Pepperoni, Spicy Italian, BBQ Chicken*
- Leading categories: *Classic, Chicken, Spicy*
- Preferred sizes: *Large, Medium, Extra Large*
- Low-priced pizzas drive volume, high-priced pizzas are niche winners
- Poor performers (*Vegan Delight, Hawaiian, Veggie Supreme*) are candidates for menu revision

---

### 🚚 Step 5: Operations & Preparation Time Analysis
**Key Insights:**
- Average preparation time is **~23 minutes**
- Peak delay hours: **11–13 and 18–20**
- Fridays, Tuesdays, and Sundays show slightly higher prep times
- *Chicken, Supreme, and Spicy* pizzas take **2–3 minutes longer** to prepare

---

### 📊 Step 6: Advanced Insights
- Some pizzas generate high revenue with low sales volume
- Several profitable pizzas are operationally expensive
- Around **$2,170 revenue is stuck in Processing orders**
- Midday congestion (12–13) shows noticeable operational strain

---

## 💡 Business Recommendations
- Increase kitchen staffing during peak lunch and dinner hours  
- Simplify preparation workflows for high-prep-time pizzas  
- Reduce cancellations through early intervention on Processing orders  
- Promote high-revenue, low-prep pizzas for operational efficiency  
- Reassess or reprice underperforming menu items  

---

## 🛠 SQL Concepts Used
- INNER JOIN, LEFT JOIN  
- Aggregations (SUM, AVG, COUNT)  
- Date & time functions  
- CASE WHEN logic  
- Grouping and segmentation  
- KPI derivation  

---

## 📈 Skills Demonstrated
- Business-focused SQL analysis  
- Revenue and sales analytics  
- Time-based demand analysis  
- Operations and efficiency evaluation  
- Translating data into executive insights  

---

## 🧾 Tools Used
- MySQL Workbench  
- SQL

---
