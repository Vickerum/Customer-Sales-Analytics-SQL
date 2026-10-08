# Customer & Sales Analytics — SQL Case Study

A portfolio-grade SQL analytics project focused on revenue performance, customer behavior, acquisition funnel drop-offs, growth, retention and data quality.

## Business Problem
A retail business wants to understand what is driving revenue, where customers are being lost, which customers are valuable, and whether acquired customers continue to purchase.

## What Are We Trying to Find?
- Revenue: total revenue, AOV, product/category/region contribution
- Customers: high-value, one-time, repeat and never-purchased customers
- Growth: monthly trends, growth/decline drivers
- Funnel: Visit → Signup → Add to Cart → Purchase and stage drop-offs
- Retention: repeat purchase behavior and customer cohorts
- Rankings: customers, products, categories and employees
- Data quality: missing values, duplicates and invalid relationships

## Data Model
| Table | Purpose | Grain |
|---|---|---|
| `customers` | Customer master data | 1 row/customer |
| `employees` | Employee hierarchy | 1 row/employee |
| `products` | Product catalogue | 1 row/product |
| `orders` | Sales transactions | 1 row/order |
| `customer_events` | Customer journey | 1 row/event |

## SQL Skills Demonstrated
Joins • Aggregations • CASE • CTEs • Subqueries • Window Functions • Ranking • Time Analysis • Cohorts • Retention • Funnel Analysis • Revenue Contribution • Data Quality

## Business Storytelling
For every analysis: **Business Question → SQL Analysis → Finding → Business Interpretation → Recommended Action**.

Example: if a small group of products drives most revenue, the analysis should explain the concentration, why it matters, and what management should do about availability, pricing or portfolio risk.

## Repository Structure
```text
Customer-Sales-Analytics-SQL/
├── README.md
├── data/
│   └── sales_analytics_database.sql
├── sql/
│   ├── 01_revenue_analysis.sql
│   ├── 02_customer_analysis.sql
│   ├── 03_growth_analysis.sql
│   ├── 04_funnel_analysis.sql
│   ├── 05_rankings.sql
│   ├── 06_data_quality.sql
│   └── 07_advanced_analytics.sql
└── docs/
    └── business_questions.md
```

## Project Roadmap
1. Revenue analysis
2. Customer analysis
3. Growth analysis
4. Funnel analysis
5. Rankings
6. Data quality
7. Cohorts, retention and advanced analytics
8. Power BI + DAX extension

**Database:** SQL Server / T-SQL  
**Status:** SQL analytics case study — in progress