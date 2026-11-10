# Blinkit – E-commerce Sales & Business Analytics

An end-to-end data analytics project exploring e-commerce sales, customer behaviour, product performance, delivery operations, customer feedback and inventory using MySQL and Power BI.

## Project Overview

This project analyses Blinkit e-commerce data to understand business performance and identify insights that can support data-driven decision-making.

The analysis uses SQL for data exploration and transformation, and Power BI to build an interactive dashboard covering key business areas.

## Business Objectives

- Analyse overall sales performance and revenue trends.
- Identify top-performing products and product categories.
- Understand customer purchasing behaviour and spending patterns.
- Evaluate delivery performance and delays.
- Analyse customer ratings and feedback sentiment.
- Examine inventory levels and reported damaged stock.

## Tools & Technologies

| Tool | Purpose |
|---|---|
| MySQL | Data querying and analysis |
| Power BI | Interactive dashboard development |
| DAX | Measures and calculated columns |
| Power Query | Data cleaning and transformation |
| Microsoft Excel | Data inspection and preparation |

## Dataset

The project uses a Blinkit-related e-commerce dataset containing seven tables:

1. `blinkit_orders`
2. `blinkit_order_items`
3. `blinkit_products`
4. `blinkit_customers`
5. `blinkit_delivery_performance`
6. `blinkit_customer_feedback`
7. `blinkit_inventory`

## Dataset Source & Attribution

- **Dataset Name:** Blinkit Sales Dataset
- **Original Platform:** Kaggle (as described by the mirror source; original listing not yet verified)
- **Dataset Mirror:** [Hugging Face – Blinkit Sales Dataset](https://huggingface.co/datasets/jason1966/akxiit_blinkit-sales-dataset)
- **Mirror Uploader:** `jason1966`
- **Original Creator:** Not yet verified
- **Licence:** Original dataset licence requires verification.

The dataset was used for educational and portfolio purposes. The original creator's attribution and applicable usage permissions should be verified before redistribution.

## SQL Analysis

SQL techniques used in this project include:

- Joins
- Aggregate functions
- Common Table Expressions (CTEs)
- Subqueries
- Window functions
- Ranking and analytical functions
- Date-based analysis

## Power BI Dashboard

The interactive dashboard contains four analytical pages:

### 1. Executive Overview
- Total Revenue
- Total Orders
- Average Order Value
- Unique Customers
- Overall sales performance

### 2. Sales & Product Analysis
- Revenue by product category
- Product performance
- Sales trends
- Payment method analysis
- Geographical sales analysis

### 3. Customer Analysis
- Customer purchasing frequency
- Repeat customer analysis
- Customer spending segments
- Customer behaviour patterns

### 4. Delivery, Feedback & Inventory
- Delivery performance
- Delivery delay analysis
- Customer ratings and feedback sentiment
- Inventory and damaged stock analysis

## Dashboard Preview

### 1. Executive Overview
![Executive Overview](Screenshots/Executive_Overview.png)

### 2. Sales & Product Analysis
![Sales & Product Analysis](Screenshots/Sales_Product_Analysis.png)

### 3. Customer Analysis
![Customer Analysis](Screenshots/Customer_Analysis.png)

### 4. Delivery, Feedback & Inventory
![Delivery, Feedback & Inventory](Screenshots/Delivery_Feedback_Inventory.png)

## Key Business Findings

Based on the Executive Overview dashboard for the selected reporting period (16 March 2023 – 4 November 2024):

1. **Sales Performance:** The business recorded total revenue of ₹23,63,300 across 1,061 orders.
2. **Average Order Value:** The average order value was approximately ₹2,227.
3. **Customer Base:** The dashboard recorded 885 unique customers.
4. **Delivery Performance:** 69.84% of orders were delivered on time, while 30.16% experienced delivery delays.
5. **Delivery Delays:** 20.92% of orders were slightly delayed and 9.24% were significantly delayed.
6. **Product Categories:** Dairy & Breakfast and Pharmacy were the highest-revenue categories among the five categories displayed in the Executive Overview.

## Business Recommendations

- Investigate the causes of delivery delays and identify opportunities to improve on-time delivery performance.
- Monitor high-revenue product categories to support better product availability and inventory planning.
- Analyse customer purchasing frequency and spending segments to identify opportunities for repeat purchases.
- Track monthly revenue and order trends to identify seasonal patterns and changes in business performance.
- Monitor customer feedback and ratings to identify areas requiring service improvements.

## Data Quality & Limitations

- Findings are based on the supplied project dataset and its available reporting period.
- Dashboard KPIs depend on the selected date and area filters.
- Inventory damage metrics should be interpreted according to the source dataset's definitions and should not automatically be treated as a confirmed stock-loss rate.
- Delivery metrics depend on the definitions and completeness of the supplied delivery records.
- The dataset represents the available project data and should not be interpreted as a complete representation of Blinkit's actual business performance.
## Key Skills Demonstrated

- Data cleaning and transformation
- Relational data analysis using MySQL
- Writing analytical SQL queries
- Data modelling
- DAX measure development
- Interactive dashboard design
- KPI tracking and business analysis
- Translating data into business insights

## Repository Structure

```text
Blinkit-Ecommerce-Sales-Analytics/
│
├── README.md
├── SQL/
│   └── Blinkit_Sales_Analysis.sql
│
├── PowerBI/
│   └── Blinkit Dashboard.pbix
│
├── Screenshots/
│   ├── Executive_Overview.png
│   ├── Sales_Product_Analysis.png
│   ├── Customer_Analysis.png
│   └── Delivery_Feedback_Inventory.png
│
└── Dataset/
    └── README.md
```

## Author

**Purva Pawaskar**
