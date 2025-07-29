🛒 Retail Sales Analysis – SQL Project
---

This project focuses on performing data cleaning, KPI extraction, and trend analysis on a retail sales dataset using SQL. The goal is to uncover business insights such as customer value, category performance, and seasonal patterns to support sales strategy and marketing optimization.

---

📊 Project Overview
---

The dataset contains transactional-level retail sales data including:

Transaction IDs, dates, and times

Customer demographics (age, gender)

Product categories, quantity, and pricing

Cost of goods sold (COGS) and total sale value

The project uses SQL to transform, clean, and extract insights from this data.

🛠️ Tools & Technologies
---

Tool	Purpose

MySQL	Data querying and analysis

SQL DDL/DML	Table creation, insertion, cleaning

Window Functions	Trend and rank analysis


✅ Key SQL Features Used
---

Table creation with appropriate data types

Data cleaning by filtering/removing nulls

Aggregations to calculate Net Sales, Total Orders, and Category-wise Revenue

Window functions (RANK(), EXTRACT()) to find best months and top customers

KPIs calculated:
---

Total Revenue

Customer Frequency

Top 10 High-Value Customers

Category Sales Breakdown

Best-performing Months (year-wise)

📂 Suggested Folder Structure
---

├── sql project 27-7.sql         # SQL script with queries

├── README.md                    # Project documentation



🔍 Sample Insights
---
Electronics and Apparel are top-performing categories by revenue

The best-performing months are consistently Q4 (seasonal surge)

20% of customers account for 60% of total sales

Several transactions had missing fields, highlighting data quality gaps
