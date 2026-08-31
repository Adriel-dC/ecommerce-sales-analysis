# E-commerce Sales Analysis

## 📊 Project Overview

This project analyzes an e-commerce sales dataset covering the period from January 2024 to December 2025.

The objective is to clean and validate the data, perform exploratory data analysis, identify business insights, and communicate the results through visualizations.

> **Note:** This is a portfolio project using a synthetic dataset created for analytical purposes. It does not represent a real company or real customer data.

---

## 🎯 Business Questions

This analysis focuses on the following questions:

- How much revenue and profit did the business generate?
- Which product categories generate the most revenue and profit?
- Which categories have the highest profit margins?
- Which regions generate the most revenue?
- Which products contribute most to profit and losses?
- Is there a relationship between discounts and unprofitable orders?
- How does revenue change over time?

---

## 🛠️ Tools & Technologies

- Python 3.13
- Pandas
- Matplotlib
- Jupyter Notebook
- SQL
- Git & GitHub

---

## 🧹 Data Cleaning

The raw dataset originally contained:

- 10,025 records
- 18 columns

The following data quality issues were identified and addressed:

- Duplicate records
- Missing customer names
- Missing payment methods
- Inconsistent product categories
- Invalid discount values
- Date fields stored as text

After cleaning and validation, the final dataset contains:

- **10,000 records**
- **18 columns**
- No duplicate records
- No invalid quantities
- No invalid unit prices
- No invalid unit costs
- No invalid revenue values

Detailed documentation is available in [`reports/data_quality_report.md`](reports/data_quality_report.md).

---

## 📈 Key Performance Indicators

| KPI | Value |
|---|---:|
| Total Revenue | **$1,614,512.83** |
| Total Profit | **$537,122.14** |
| Profit Margin | **33.27%** |
| Total Orders | **10,000** |
| Average Order Value | **$161.45** |

---

## 🔎 Key Business Insights

### Home is the largest revenue category

Home generated **$648,072.15** in revenue and **$219,897.66** in profit, making it the strongest category in terms of total financial contribution.

### Fitness has the highest profit margin

Fitness achieved the highest category-level profit margin at **34.51%**.

### Europe is the largest market

Europe generated **$810,434.86** in revenue across **5,047 orders**, making it the company's largest regional market.

### Oceania has the highest regional margin

Oceania achieved a **33.81%** profit margin, slightly above Europe and North America.

### Higher discounts are associated with unprofitable orders

There were **916 orders with negative profit**.

These orders had an average discount of **10.28%**, compared with **6.87%** for profitable orders.

This indicates a potential relationship between higher discounts and order-level profitability that should be investigated further.

More detailed findings are available in [`reports/business_insights.md`](reports/business_insights.md).

---

## 📊 Visualizations

### Monthly Revenue

![Monthly Revenue](visualizations/monthly_revenue.png)

### Revenue by Region

![Revenue by Region](visualizations/revenue_by_region.png)

### Revenue and Profit by Category

![Revenue and Profit by Category](visualizations/category_revenue_profit.png)

---

## 📁 Project Structure

```text
ecommerce-sales-analysis/
│
├── data/
│   ├── raw/
│   │   └── ecommerce_orders_raw.csv
│   │
│   └── processed/
│       └── ecommerce_orders_clean.csv
│
├── dashboard/
│
├── notebooks/
│   └── 01_exploratory_data_analysis.ipynb
│
├── reports/
│   ├── data_quality_report.md
│   └── business_insights.md
│
├── sql/
│
├── src/
│   └── generate_dataset.py
│
├── visualizations/
│   ├── monthly_revenue.png
│   ├── revenue_by_region.png
│   └── category_revenue_profit.png
│
├── .gitignore
└── README.md
```

---

## 🚀 How to Run the Project

### 1. Clone the repository

```bash
git clone https://github.com/Adriel-dC/ecommerce-sales-analysis.git
cd ecommerce-sales-analysis
```

### 2. Create a virtual environment

```bash
py -3.13 -m venv .venv
```

### 3. Activate the environment

Windows PowerShell:

```powershell
.venv\Scripts\Activate.ps1
```

### 4. Install dependencies

```bash
pip install pandas matplotlib jupyter
```

### 5. Launch Jupyter Notebook

```bash
jupyter notebook
```

Then open:

```text
notebooks/01_exploratory_data_analysis.ipynb
```

---

## 👤 About This Project

This project was created as part of a Data Analyst portfolio to demonstrate practical skills in:

- Data cleaning
- Data validation
- Exploratory data analysis
- Business analysis
- Data visualization
- Python and Pandas
- SQL
- Git and GitHub
- Communicating analytical findings