<p align="center">
  <img src="4_Images/FMCG_Sales_Performance_Cover.png"
       alt="FMCG Sales Performance Dashboard"
       width="100%">
</p>

<h1 align="center">FMCG Sales Performance Dashboard</h1>

<p align="center">
  <strong>Executive Sales Overview | 2023–2025</strong>
</p>

<p align="center">
  Interactive FMCG Sales & Profitability Analysis using Microsoft Power BI
</p>

---

## 📌 Project Overview

The **FMCG Sales Performance Dashboard** is an interactive **Power BI data analytics project** developed as part of the **Syntecxhub Data Analysis Internship**.

The project analyzes FMCG sales data from **2023–2025** to understand sales trends, revenue, profitability, product performance, regional performance, customer types, and sales channels.

The dashboard transforms transactional sales data into **clear, interactive, and actionable business insights**.

---

## 🎯 Business Objectives

The main objectives of this project are:

- Analyze **monthly, quarterly, and yearly sales trends**
- Track **revenue, profit, orders, and units sold**
- Identify **top-selling products**
- Compare performance across **product categories**
- Analyze **region-wise sales performance**
- Compare different **sales channels**
- Evaluate **customer type performance**
- Identify profitable products and categories
- Monitor key business KPIs through an interactive dashboard

---

## 📊 Dataset Summary

| Attribute | Details |
|---|---|
| **Data Source** | Kaggle |
| **Dataset** | FMCG Sales & Marketing Profitability Dataset |
| **Analysis Period** | 2023–2025 |
| **Data Type** | Transactional Sales Data |
| **Primary Tool** | Microsoft Power BI |

### Key Dataset Fields

The dataset contains information related to:

- Order ID
- Order Date
- Year
- Quarter
- Month
- Region
- Country
- City
- Sales Person
- Customer Type
- Sales Channel
- Promotion Type
- Product Category
- Brand
- Product Name
- SKU
- Units Sold
- Unit Price
- Discount
- Gross Sales
- Marketing Spend
- COGS
- Logistics Cost
- Net Revenue
- Profit
- Profit Margin

---

## 🛠️ Tools & Technologies Used

- **Microsoft Power BI** – Dashboard development, visualization and interactive analysis
- **Power Query** – Data cleaning and transformation
- **DAX** – KPI calculations and analytical measures
- **Microsoft Excel / CSV** – Dataset storage and preparation

> This project was developed using **Power BI only** for the analytical and visualization workflow.

---

## 🔄 Project Workflow

### 1. Data Collection

The FMCG sales dataset was sourced from **Kaggle**.

The dataset contains transactional sales, product, customer, regional, cost, revenue and profitability information.

---

### 2. Data Preparation

The raw dataset was imported into **Power BI** and prepared using **Power Query**.

Data preparation included:

- Checking missing values
- Checking duplicate records
- Correcting data types
- Formatting date fields
- Reviewing categorical fields
- Preparing fields for analysis
- Creating required calculated measures

---

### 3. Data Analysis

Business performance was analyzed across multiple dimensions:

- Time
- Region
- Product Category
- Product
- Customer Type
- Sales Channel
- Profitability

---

### 4. Dashboard Development

An interactive Power BI dashboard was created using:

- KPI Cards
- Line / Area Charts
- Clustered Column Charts
- Bar Charts
- Donut Charts
- Slicers
- Data Labels
- Interactive Filters

---

# 📈 Dashboard Pages

## 1. Executive Sales Overview

The **Executive Sales Overview** provides a high-level summary of FMCG business performance.

### Key KPIs

- **Total Revenue**
- **Total Profit**
- **Total Orders**
- **Total Units Sold**
- **Profit Margin %**
- **Sales Growth %**

### Visual Analysis

- Monthly Sales Trend
- Sales by Customer Type
- Sales by Sales Channel
- Sales by Region
- Sales by Product Category
- Top 10 Selling Products

---

## 2. Detailed Sales & Profitability Analysis

The second dashboard page provides a deeper analysis of sales and profitability.

### Key KPIs

- **Average Order Value**
- **Average Profit per Order**
- **Average Discount %**
- **Average Profit Margin**
- **Revenue per Unit**
- **Profit per Unit**

### Visual Analysis

- Profit by Product Category
- Sales by Product Category
- Revenue by Sales Channel
- Profit by Region
- Regional Performance
- Top 10 Products by Profit

Interactive slicers allow users to filter the analysis by:

- **Year**
- **Region**
- **Product Category**
- **Customer Segment**

---

## 📸 Dashboard Screenshots

### Executive Sales Overview

<p align="center">
  <img src="4_Images/FMCG_Sales_Performance_Dashboard-2.png"
       alt="FMCG Executive Sales Overview"
       width="100%">
</p>

---

### Detailed Sales & Profitability Analysis

<p align="center">
  <img src="4_Images/FMCG_Sales_Performance_Dashboard-1.png"
       alt="FMCG Detailed Sales and Profitability Analysis"
       width="100%">
</p>

---

## 🔑 Key Performance Indicators

The dashboard tracks the following important business KPIs:

| KPI | Purpose |
|---|---|
| **Total Revenue** | Measures overall revenue generated |
| **Total Profit** | Measures overall business profitability |
| **Total Orders** | Measures transaction volume |
| **Total Units Sold** | Measures product sales volume |
| **Profit Margin %** | Measures profitability efficiency |
| **Sales Growth %** | Measures business growth over time |
| **Average Order Value** | Measures average revenue per order |
| **Average Profit per Order** | Measures average profit generated per order |
| **Average Discount %** | Tracks discounting levels |
| **Revenue per Unit** | Measures revenue generated per unit |
| **Profit per Unit** | Measures profit generated per unit |

---

## 💡 Key Business Insights

The dashboard helps identify important business patterns such as:

1. **Sales performance varies significantly across regions**, allowing management to identify high-performing and underperforming markets.

2. **Product categories contribute differently to overall revenue and profit**, helping identify categories with stronger profitability.

3. **Wholesale and Distributor channels contribute a significant portion of sales**, highlighting the importance of channel performance.

4. **Top-selling products can be identified using sales volume**, while the most profitable products can be evaluated separately using profit.

5. **Profitability analysis provides a better business perspective than revenue alone**, because high-revenue products may not always generate the highest profit.

6. **Monthly sales trends help identify growth patterns and fluctuations** across the 2023–2025 period.

---

## 📁 Project Folder Structure

```text
Syntecxhub_FMCG_Sales_Performance_Dashboard/
│
├── 1_Data/
│   └── fmcg_sales_marketing_profitability_2023_2025.csv
│
├── 2_PowerBI/
│   ├── FMCG_Sales_Performance_Dashboard.pbix
│   └── FMCG_Sales_Performance_Dashboard.pdf
│
├── 3_Documentation/
│   └── Project_Documentation.pdf
│
├── 4_Images/
│   ├── FMCG_Sales_Performance_Cover.png
│   ├── FMCG_Sales_Performance_Dashboard-1.png
│   └── FMCG_Sales_Performance_Dashboard-2.png
│
└── README.md
