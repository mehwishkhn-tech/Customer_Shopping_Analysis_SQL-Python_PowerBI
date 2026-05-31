# Customer_Shopping_Analysis_SQL-Python_PowerBI
# 🛍️ Customer Shopping Behavior Analysis
### End-to-End Data Analytics Project

---

## 👩‍💻 Author
**Mehwish Nisha Khan**
**Date: May 2026**

---

## 📌 Project Overview
This project presents a complete end-to-end data analytics 
solution analyzing customer shopping behavior across multiple 
shopping malls in Istanbul, Turkey. The project covers data 
cleaning in Python, structured querying in PostgreSQL, and 
interactive visualization through a Power BI dashboard.

---

## ❓ Business Problem Statement
A retail shopping company wants to understand customer 
purchasing behavior across malls, product categories, age 
groups, and genders in order to improve sales performance 
and optimize marketing strategies.

**Core Business Question:**
> "How can the company leverage consumer shopping data to 
> identify trends, improve customer engagement, and optimize 
> marketing and product strategies?"

---

## 🚀 Project Workflow
Python (Data Cleaning)
↓
PostgreSQL (SQL Analysis)
↓
Power BI (Interactive Dashboard)
---

## 🛠️ Tools & Technologies Used
| Tool | Purpose |
|------|---------|
| Python 3.14 | Data Cleaning & Preparation |
| Pandas | Data Manipulation |
| NumPy | Numerical Operations |
| Matplotlib & Seaborn | Basic Visualization |
| PostgreSQL | Data Analysis & SQL Queries |
| pgAdmin 4 | Database Management |
| Power BI Desktop | Interactive Dashboard |
| Jupyter Notebook | Python Development Environment |
| GitHub | Version Control & Portfolio |

---

## 📂 Dataset Information
| Detail | Info |
|--------|------|
| Dataset Name | Customer Shopping Dataset - Retail Sales Data |
| Source | Kaggle |
| Location | Istanbul, Turkey |
| Currency | Turkish Lira (₺) |
| Total Rows | 99,457 |
| Original Columns | 10 |
| Final Columns | 12 (after cleaning) |
| File Format | CSV |

### Original Columns:
| Column | Description |
|--------|-------------|
| invoice_no | Unique invoice number |
| customer_id | Unique customer ID |
| gender | Gender of customer |
| age | Age of customer |
| category | Product category purchased |
| quantity | Number of items purchased |
| price | Price per item (₺) |
| payment_method | Mode of payment |
| invoice_date | Date of purchase |
| shopping_mall | Shopping mall name |

### New Columns Added After Cleaning:
| Column | Description |
|--------|-------------|
| total_amount | quantity × price (rounded to 2 decimal places) |
| age_group | Age category (Young / Young Adult / Adult / Middle Aged / Senior) |

---

## 🧹 Step 1: Data Cleaning (Python)

### Steps Performed:
| Step | Action | Result |
|------|--------|--------|
| 1 | Loaded dataset | Shape: (99457, 10) |
| 2 | Explored data (head, info, describe) | Understood structure |
| 3 | Checked missing values | 0 missing values found ✅ |
| 4 | Checked duplicates | 0 duplicates found ✅ |
| 5 | Removed duplicates | Shape remains (99457, 11) |
| 6 | Standardized column names | Lowercase + underscore format |
| 7 | Fixed invoice_date column | Converted to datetime format |
| 8 | Created total_amount column | quantity × price (rounded 2dp) |
| 9 | Created age_group column | 5 age categories using pd.cut() |
| 10 | Exported clean CSV | customer_shopping_data_clean.csv |

### Age Group Categories:
| Age Group | Age Range |
|-----------|-----------|
| Young | 0 – 19 |
| Young Adult | 20 – 25 |
| Adult | 26 – 40 |
| Middle Aged | 41 – 58 |
| Senior | 59 – 80 |

---

## 🗄️ Step 2: SQL Analysis (PostgreSQL)

### SQL Concepts Used:
| Concept | Used In |
|---------|---------|
| GROUP BY & ORDER BY | Q1, Q2, Q3, Q4, Q5 |
| ROUND & Aggregate Functions | All Queries |
| Subqueries | Q6, Q7 |
| RANK() Window Function | Q6, Q8 |
| ROW_NUMBER() Window Function | Q10 |
| CTE (WITH clause) | Q9 |
| Running Total (SUM OVER) | Q9 |
| PARTITION BY | Q6, Q10 |

### 10 Business Questions & Findings:

| # | Business Question | Finding |
|---|------------------|---------|
| Q1 | Which product category contributes the most to overall revenue? | **Clothing** — ₺113,996,791.04 |
| Q2 | Which shopping mall is the top performing location? | **Mall of Istanbul** — ₺50,872,481.68 |
| Q3 | What is the most preferred payment method? | **Cash** — 44,447 transactions |
| Q4 | Which gender drives higher purchasing power? | **Female** — ₺150,207,136.02 total |
| Q5 | Which age group is the most valuable segment? | **Middle Aged** — ₺87,245,011.86 |
| Q6 | What is the top category for each gender? | **Clothing** — both Male & Female |
| Q7 | Which mall attracts most young adult customers? | **Mall of Istanbul** — 2,382 customers |
| Q8 | How do malls rank by total revenue? | **Mall of Istanbul** Rank 1, **Kanyon** Rank 2 |
| Q9 | What is the running total of revenue day by day? | Consistent growth over time |
| Q10 | Who is the top customer in each age group? | All top customers spent ₺26,250.00 |

---

## 📊 Step 3: Power BI Dashboard

### KPI Cards:
| KPI | Value |
|-----|-------|
| Average Spending | ₺2.53K |
| Total Customers | 99K |
| Total Revenue | ₺251.51M |
| Total Transactions | 99K |

### Visualizations:
| Visual | Chart Type |
|--------|-----------|
| Total Revenue by Gender | Donut Chart |
| Revenue by Age Group | Clustered Column Chart |
| Total Transactions by Category | Clustered Column Chart |
| Average Spending by Age Group | Clustered Bar Chart |
| Revenue by Shopping Mall | Clustered Bar Chart |
| Revenue Trend Over Time | Line Chart |

### Interactive Slicers:
| Slicer | Style |
|--------|-------|
| Filter by Gender | Button |
| Payment Method | List |
| Filter by Category | List |
| Shopping Mall | List |

---

## 💡 Key Insights & Recommendations

1. **Clothing Dominates Revenue** — Prioritize clothing 
   inventory and seasonal campaigns

2. **Mall of Istanbul is Top Performer** — Invest more 
   in exclusive events and offers at this location

3. **Female Customers Drive Revenue** — Target female 
   shoppers with personalized campaigns in Clothing 
   and Cosmetics

4. **Middle Aged Segment Most Valuable** — Introduce 
   loyalty programs for 41-58 age group

5. **Cash Payments Dominate** — Introduce digital 
   payment incentives to modernize transactions

6. **Top 2 Malls Generate 40%+ Revenue** — Focus 
   promotional budgets on Mall of Istanbul and Kanyon

7. **Young Customers Have Lowest Spending** — Introduce 
   student discounts and affordable bundles to attract 
   future customers

---

## 📁 Project Files
| File | Description |
|------|-------------|
| `01_data_cleaning.ipynb` | Python data cleaning notebook |
| `02_sql_analysis.sql` | PostgreSQL SQL queries |
| `03_dashboard.pbix` | Power BI interactive dashboard |
| `customer_shopping_data.csv` | Raw original dataset |
| `customer_shopping_data_clean.csv` | Cleaned final dataset |
| `Customer_Shopping_Analysis_Report.pdf` | Complete project report |
| `README.md` | Project documentation |

---

## 🏆 Project Outcome
This project demonstrates a complete data analytics workflow 
from raw data to actionable business insights — showcasing 
skills in Python, SQL, and Power BI that are directly 
applicable to real-world data analyst roles.

---
*Customer Shopping Behavior Analysis | Mehwish Nisha Khan | 
