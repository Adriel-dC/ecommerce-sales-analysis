# E-commerce Sales & Profitability Analysis

End-to-end data analytics project analyzing **10,000 e-commerce orders** to identify revenue drivers, profitability risks, discount behavior, and product-level opportunities.

The project combines **Python, SQL, SQLite, Power BI, DAX, and business analysis** to transform raw transactional data into actionable recommendations.

> **Portfolio project:** The dataset is synthetic and was created for analytical purposes. It does not represent a real company or real customers.

---

## Power BI Dashboard

![E-commerce Sales Dashboard](images/dashboard.png)

The Power BI dashboard provides an executive view of:

- Revenue and profit
- Profit margin
- Order volume
- Monthly performance
- Category performance
- Regional performance
- Product profitability
- Loss-making orders
- Interactive category, region, and year filters

The Power BI file is available in:

`powerbi/ecommerce_sales_dashboard.pbix`

---

## Business Problem

The objective was not only to measure sales performance, but to understand:

- Which categories and products drive revenue and profit?
- Which markets contribute most to the business?
- Where is profitability being lost?
- How are discounts associated with order profitability?
- Which products require pricing or cost attention?
- How do shipping costs affect lower-priced products?
- How does business performance change over time?

---

## Executive KPIs

| KPI | Result |
|---|---:|
| Revenue | **$1,614,512.83** |
| Profit | **$537,122.14** |
| Profit Margin | **33.27%** |
| Orders | **10,000** |
| Average Order Value | **$161.45** |
| Loss-Making Orders | **916 (9.16%)** |

---

## Key Findings

### Higher discounts are associated with greater profitability risk

Loss risk increases progressively across discount bands.

| Discount Band | Average Profit | Loss Order Rate |
|---|---:|---:|
| No Discount | $66.04 | 5.89% |
| 0-5% | $58.06 | 7.94% |
| 5-10% | $47.48 | 9.45% |
| 10-15% | $42.12 | 11.71% |
| 15%+ | $30.97 | **17.10%** |

Orders with discounts of **15% or more** have a loss rate approximately **2.9x higher** than orders without discounts.

This is an association rather than evidence that discounting alone causes losses.

---

### Profitability risk is concentrated in specific products

Several lower-priced products have substantially higher loss-order rates.

| Product | Revenue | Margin | Loss Order Rate |
|---|---:|---:|---:|
| USB-C Hub | $57,845 | 27.52% | 13.69% |
| Desk Lamp | $47,642 | 26.60% | 17.10% |
| Travel Mug | $33,737 | 26.03% | 23.99% |
| Water Bottle | $31,679 | 27.68% | **24.16%** |

Water Bottle and Travel Mug are the strongest candidates for pricing, discount, and shipping review.

---

### Shipping and discounting combine to pressure margins

Loss-making orders among the higher-risk products consistently show both higher discounts and higher shipping costs.

For **USB-C Hub**:

- Average discount on profitable orders: **6.28%**
- Average discount on loss orders: **12.13%**
- Average shipping on profitable orders: **$13.40**
- Average shipping on loss orders: **$19.89**

For lower-priced products, this combination can materially reduce order-level profitability.

---

### Home leads financial contribution

Home generated:

- **$648,072.15 revenue**
- **$219,897.66 profit**

It is the largest category by total financial contribution.

Fitness, however, achieved the highest category-level profit margin at **34.51%**.

---

### Europe leads in scale

Europe generated:

- **$810,434.86 revenue**
- **5,047 orders**

It is the largest regional market in the dataset.

Oceania recorded the highest regional margin at **33.81%**.

---

## Business Recommendations

Based on the analysis, the business should prioritize:

1. **Reviewing high-discount orders**  
   Evaluate approval or minimum-margin controls for discounts of 15% or more.

2. **Investigating Water Bottle and Travel Mug economics**  
   Review pricing, unit economics, discount eligibility, and shipping rules.

3. **Evaluating shipping thresholds for lower-priced products**  
   Consider minimum order values, bundling, or product-specific shipping policies.

4. **Protecting strong-performing products**  
   High-revenue products such as Office Chair and Air Purifier currently combine scale with strong profitability.

5. **Monitoring profitability beyond revenue**  
   Product monitoring should combine revenue, profit margin, loss rate, discounts, and shipping costs.

Detailed analysis is available in [`reports/business_insights.md`](reports/business_insights.md).

---

## SQL Analysis

The cleaned dataset was loaded into SQLite for independent business analysis.

The SQL layer includes:

- Aggregations and KPI calculations
- `CASE`-based segmentation
- Common Table Expressions (CTEs)
- Window functions
- `LAG()` for month-over-month analysis
- `RANK()` and `PARTITION BY`
- Revenue contribution analysis
- Product-level profitability
- Discount-band analysis
- Customer revenue ranking
- Monthly margin analysis

Example analytical workflow:

```sql
WITH monthly_sales AS (
    SELECT
        strftime('%Y-%m', order_date) AS month,
        SUM(revenue) AS revenue
    FROM orders
    GROUP BY strftime('%Y-%m', order_date)
)
SELECT
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS previous_month_revenue
FROM monthly_sales;
```

Full SQL analysis:

[`sql/01_business_analysis.sql`](sql/01_business_analysis.sql)

---

## Data Quality & Preparation

The raw dataset contained **10,025 rows and 18 columns**.

The preparation process addressed:

- Duplicate records
- Missing customer names
- Missing payment methods
- Inconsistent product categories
- Invalid discount values
- Date type conversion
- Numeric validation

The final analytical dataset contains:

- **10,000 orders**
- **18 columns**
- No duplicate records
- No invalid quantities
- No invalid unit prices
- No invalid unit costs
- No invalid revenue values

Detailed validation results:

[`reports/data_quality_report.md`](reports/data_quality_report.md)

---

## Exploratory Analysis

### Monthly Revenue

![Monthly Revenue](visualizations/monthly_revenue.png)

### Revenue by Region

![Revenue by Region](visualizations/revenue_by_region.png)

### Revenue and Profit by Category

![Revenue and Profit by Category](visualizations/category_revenue_profit.png)

---

## Project Structure

```text
ecommerce-sales-analysis/
|
|-- data/
|   |-- raw/
|   |   `-- ecommerce_orders_raw.csv
|   `-- processed/
|       `-- ecommerce_orders_clean.csv
|
|-- images/
|   `-- dashboard.png
|
|-- notebooks/
|   `-- 01_exploratory_data_analysis.ipynb
|
|-- powerbi/
|   `-- ecommerce_sales_dashboard.pbix
|
|-- reports/
|   |-- business_insights.md
|   `-- data_quality_report.md
|
|-- sql/
|   `-- 01_business_analysis.sql
|
|-- src/
|   |-- generate_dataset.py
|   `-- load_data_to_sqlite.py
|
|-- visualizations/
|   |-- category_revenue_profit.png
|   |-- monthly_revenue.png
|   `-- revenue_by_region.png
|
|-- ecommerce_sales_analysis.db
|-- .gitignore
`-- README.md
```

---

## Analytical Workflow

```text
Raw Data
   |
   v
Data Cleaning & Validation
   |
   v
Processed Dataset
   |
   +----------------+
   |                |
   v                v
Python / EDA      SQLite / SQL
   |                |
   +-------+--------+
           |
           v
     Business Analysis
           |
           v
     Power BI Dashboard
           |
           v
 Business Recommendations
```

---

## Tools & Technologies

**Python / Pandas**  
Data generation, cleaning, validation, and exploratory analysis.

**SQL / SQLite**  
Business analysis, segmentation, ranking, temporal analysis, and profitability investigation.

**Power BI / DAX**  
Interactive dashboard, KPI monitoring, filtering, and executive reporting.

**Matplotlib / Jupyter Notebook**  
Exploratory analysis and supporting visualizations.

**Git / GitHub**  
Version control and project documentation.

---

## How to Run

Clone the repository:

```bash
git clone https://github.com/Adriel-dC/ecommerce-sales-analysis.git
cd ecommerce-sales-analysis
```

Create and activate a virtual environment:

```powershell
py -3.13 -m venv .venv
.venv\Scripts\Activate.ps1
```

Install the required packages:

```bash
pip install pandas matplotlib jupyter
```

Generate or inspect the dataset, run the exploratory notebook, load the processed data into SQLite, and execute the SQL analysis.

The Power BI dashboard can be opened with Power BI Desktop using:

```text
powerbi/ecommerce_sales_dashboard.pbix
```

---

## Skills Demonstrated

- Data Cleaning & Validation
- Exploratory Data Analysis
- Advanced SQL
- CTEs & Window Functions
- Business Analysis
- KPI Development
- Profitability Analysis
- Product & Regional Analysis
- Power BI
- DAX
- Python & Pandas
- SQLite
- Data Visualization
- Analytical Communication
- Business Recommendations

---

## Conclusion

The analysis shows that strong overall profitability can hide meaningful product-level risk.

Higher discounts are associated with increasing loss rates, while several lower-priced products experience additional margin pressure from shipping costs.

The resulting recommendation is not to apply broad pricing changes, but to focus management attention on **high-discount transactions, shipping economics, and the highest-risk SKUs**.

This project demonstrates an end-to-end analytical workflow from raw data preparation to SQL analysis, dashboard development, and evidence-based business recommendations.