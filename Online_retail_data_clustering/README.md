# 🛒 Customer Segmentation – Online Retail Data

Segmenting customers based on purchasing behavior using clustering techniques to support **targeted marketing, personalized offers, and customer relationship management**.

---

## 📌 Table of Contents

- [Project Title](#-project-title)
- [Brief One Line Summary](#-brief-one-line-summary)
- [Overview](#-overview)
- [Business Problem](#-business-problem)
- [Dataset](#-dataset)
- [Tools and Technologies](#-tools-and-technologies)
- [Methods](#-methods)
- [Key Insights](#-key-insights)
- [Dashboard / Output](#-dashboard--output)
- [How to Run This Project](#-how-to-run-this-project)
- [Results & Conclusion](#-results--conclusion)
- [Future Work](#-future-work)
- [Author & Contact](#-author--contact)

---

## 🏷️ Project Title

**Customer Segmentation – Clustering Analysis of Online Retail Transactions**

---

## ✏️ Brief One Line Summary

Data-driven clustering of retail customers based on purchasing behavior using transaction-level data and unsupervised learning.

---

## 📖 Overview

This project applies **clustering analysis** to customer purchase history from an online retail dataset. The objective is to segment customers into meaningful groups based on their buying patterns, enabling the business to tailor marketing strategies, optimize promotions, and improve customer lifetime value.

The analysis follows the complete data science workflow: **data cleaning → feature engineering → clustering → evaluation → interpretation**.

---

## ❓ Business Problem

Retailers face challenges in treating all customers the same way. High-value loyal customers and one-time bargain hunters behave differently, and identifying these groups is critical for targeted marketing.

This project aims to:

- Segment customers by purchasing behavior (frequency, recency, monetary value).
- Identify high-value vs low-value customer clusters.
- Provide actionable insights for **personalized campaigns** and **retention strategies**.

---

## 📂 Dataset

- **Source**: Online Retail dataset (transaction-level sales records).
- **Rows**: ~500,000 transactions.
- **Features**:

  - `InvoiceNo`: Unique transaction ID (cancellations marked with “C”).
  - `StockCode`: Product code.
  - `Description`: Product name.
  - `Quantity`: Number of items purchased.
  - `InvoiceDate`: Date and time of purchase.
  - `UnitPrice`: Price per item (£).
  - `CustomerID`: Unique customer identifier.
  - `Country`: Customer location.

- **Cleaning considerations**:
  - Removed cancelled invoices, discounts, samples, bank charges, and test data.
  - Excluded transactions with null `CustomerID`.
  - Filtered out negative or invalid quantities.

---

## 🛠️ Tools and Technologies

- **Python (Pandas, NumPy, Scikit-learn, Matplotlib, Seaborn)**
- **Jupyter Notebook** (for analysis and documentation)
- **Clustering Methods**: K-Means, Elbow Method, Silhouette Score
- **Feature Engineering**: RFM (Recency, Frequency, Monetary value)

---

## ⚙️ Methods

1. **Data Cleaning & Preparation**

   - Removed invalid transactions (cancellations, discounts, test data).
   - Handled missing values.
   - Converted dates into proper datetime format.

2. **Feature Engineering**

   - Computed **RFM features**:
     - Recency = Days since last purchase.
     - Frequency = Number of transactions.
     - Monetary = Total spend.

3. **Clustering**

   - Standardized features.
   - Applied **K-Means clustering**.
   - Determined optimal number of clusters using the Elbow Method and Silhouette Score.

4. **Evaluation**
   - Interpreted cluster profiles (e.g., high spenders, frequent buyers, one-time shoppers).

---

## 🔑 Key Insights

- Segmentation revealed **3–5 meaningful clusters** of customers.
- One group contained **high-value loyal customers** who spend frequently and recently.
- Another group represented **occasional low spenders**, while others showed **one-time bulk buyers**.
- These clusters enable differentiated strategies: loyalty rewards for high-value customers, reactivation campaigns for dormant customers, and promotions for mid-tier groups.

---

## 📊 Dashboard / Output

- Cluster visualization plots (2D projections of RFM features).
- Summary tables showing average Recency, Frequency, and Monetary values per cluster.
- Distribution graphs highlighting customer diversity.

---

## ▶️ How to Run This Project

1. Clone the repository:

   ```bash
   git clone https://github.com/PhuNguyen0209/Data-Analytics-Data-Science-Portfolio.git


    jupyter notebook "Final_Project_Customer_Segmentation.ipynb"

    pip install pandas numpy matplotlib seaborn scikit-learn
   ```

## 📈 Results & Conclusion

- Achieved **distinct customer segments** with interpretable behavioral profiles.
- High-value cluster accounted for the **majority of revenue** despite being a small portion of customers.
- Demonstrated the value of **RFM + clustering** for customer analytics.

---

## 🔮 Future Work

- Apply alternative clustering algorithms (**Hierarchical, DBSCAN, Gaussian Mixture Models**).
- Integrate **customer demographics and geolocation** for richer segmentation.
- Build **interactive dashboards** to present segment profiles.
- Test marketing strategies (**A/B testing**) on identified clusters.

---

## 👤 Author & Contact

**Phu Nguyen Nhu**

- 📧 Email: [Your Email Here]
- 🔗 [LinkedIn](https://www.linkedin.com/in/phu-nguyen-nhu-897298286/)
- 📄 [Resume](https://drive.google.com/drive/u/0/folders/1e7KDADeQA-tRycGcJw0HI0s5bovpT0P6)
