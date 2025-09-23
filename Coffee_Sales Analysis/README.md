# ☕ Coffee Shop Sales Analysis

Analyzing sales, orders, and customer purchase behavior in a coffee shop chain to uncover trends, evaluate store and product performance, and support decision-making using **SQL, Excel, and Power BI**.

---

## 📌 Table of Contents

- [Project Title](#-project-title)
- [Brief One Line Summary](#-brief-one-line-summary)
- [Overview](#-overview)
- [Problem Statement](#-problem-statement)
- [Dataset](#-dataset)
- [Tools and Technologies](#-tools-and-technologies)
- [Methods](#-methods)
- [Key Insights](#-key-insights)
- [Dashboard / Model / Output](#-dashboard--model--output)
- [How to Run This Project](#-how-to-run-this-project)
- [Results & Conclusion](#-results--conclusion)
- [Future Work](#-future-work)
- [Author & Contact](#-author--contact)

---

## 🏷️ Project Title

**Coffee Shop Sales Analysis – Transactions, Sales Trends, and Store Insights**

---

## ✏️ Brief One Line Summary

End-to-end sales analysis pipeline for a coffee shop chain using SQL for data cleaning and aggregation, and Power BI for interactive visualization.

---

## 📖 Overview

This project evaluates **sales, customer demand, and product trends** for a multi-location coffee shop chain. By combining SQL-based exploratory data analysis with Power BI dashboards, the project identifies month-on-month growth patterns, product category performance, store-level contributions, and customer purchase behavior.

The goal is to help the business make **data-driven decisions** regarding marketing, stock management, and store optimization.

---

## ❓ Problem Statement

Coffee shops operate with high transaction volume and thin margins, making it crucial to understand:

- Which **months, days, and hours** drive the highest revenue?
- How do **store locations** perform compared to one another?
- Which **product categories and items** are the top revenue contributors?
- What are the **seasonal and weekly patterns** in customer behavior?

---

## 📂 Dataset

- **Source**: Coffee shop transactional dataset (`Coffee Shop Sales.csv` and `Coffee Shop Sales.xlsx`)
- **Rows**: 149,116 transactions
- **Features**: transaction date, time, quantity, store location, product details, and unit price
- **Target Variables**: Sales amount (`transaction_qty × unit_price`), order count, product performance

---

## 🛠️ Tools and Technologies

- **SQL (MySQL):** Data cleaning, transformations, and aggregation queries
- **Excel:** Quick validation and exploration
- **Power BI:** Dashboards and interactive reports (`Coffee_sales_analysis.pbix`)
- **GitHub:** Version control and documentation

---

## ⚙️ Methods

1. **Data Cleaning (SQL):**

   - Converted dates and times into proper formats.
   - Fixed data types for transaction IDs, quantities, prices, and categories.

2. **Exploratory Data Analysis (SQL):**

   - Monthly, weekly, and daily sales patterns.
   - Store-level comparisons.
   - Product category and top product analysis.
   - Weekend vs. weekday performance.

3. **Visualization (Power BI):**
   - Sales dashboards with KPIs.
   - Trend analysis (month-on-month changes).
   - Store heatmaps and product contribution charts.

---

## 🔑 Key Insights

- **Sales Growth**: Clear month-to-month growth trend with seasonal peaks.
- **Store Performance**: Some locations consistently outperform others, suggesting demand hotspots.
- **Product Categories**: Certain beverage categories dominate revenue, while others underperform.
- **Customer Behavior**: Sales are significantly higher on weekends and peak during morning hours.

---

## 📊 Dashboard / Model / Output

The **Power BI Dashboard (`Coffee_sales_analysis.pbix`)** includes:

- Total sales, orders, and quantity sold by time period.
- Month-on-month change visualization.
- Sales by store location.
- Top 10 products by revenue.
- Daily and hourly sales patterns.

_(Sample visualization included in the repo screenshots)_

---

## ▶️ How to Run This Project

1. Clone the repository:

   ```bash
   git clone https://github.com/PhuNguyen0209/Data-Analytics-Data-Science-Portfolio.

   ```

## 📈 Results & Conclusion

- **Month-on-Month Growth**: Identified periods of sales increase and decline with precise % change.
- **Store-Level Action**: Underperforming stores can be targeted for marketing.
- **Product Strategy**: Top 10 products drive most revenue; slower categories may need reevaluation.
- **Customer Engagement**: Strong weekend demand suggests leveraging promotions at peak hours.

---

## 🔮 Future Work

- Incorporate **customer demographic data** for deeper segmentation.
- Build **forecasting models** to predict future sales.
- Apply **RFM analysis** to assess customer loyalty.
- Extend to an interactive **web dashboard** with Python/Streamlit.

---

## 👤 Author & Contact

**Phu Nguyen Nhu**

- 📧 Email: [Your Email Here]
- 🔗 [LinkedIn](https://www.linkedin.com/in/phu-nguyen-nhu-897298286/)
- 📄 [Resume](https://drive.google.com/drive/u/0/folders/1e7KDADeQA-tRycGcJw0HI0s5bovpT0P6)
