# 🏅 Does Hosting the Olympics Improve Medal Performance?

Analyzing over 120 years of Olympic data to evaluate whether host nations gain a measurable "home advantage" in medal counts.

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
- [Visualizations / Output](#-visualizations--output)
- [How to Run This Project](#-how-to-run-this-project)
- [Results & Conclusion](#-results--conclusion)
- [Future Work](#-future-work)
- [Author & Contact](#-author--contact)

---

## 🏷️ Project Title

**Does Hosting the Olympics Improve Medal Performance?**

---

## ✏️ Brief One Line Summary

Exploratory data analysis and statistical testing of Olympic medal counts to determine if host nations gain a competitive advantage.

---

## 📖 Overview

The Olympics are the world’s largest sporting event, blending national pride and athletic competition. A recurring observation is that host nations often outperform expectations. This project investigates whether hosting the Olympics leads to significantly better performance in the medal table, using exploratory data analysis and statistical tests.

---

## ❓ Problem Statement

Do host nations perform better in medal counts compared to years before and after hosting? Specifically:

- Is there a consistent pattern of medal boosts during hosting years?
- Does the "home advantage" persist across both Summer and Winter Games?
- How significant is the difference when analyzed statistically?

---

## 📂 Dataset

1. **120 Years of Olympic History Dataset**

   - Athlete demographics, events, medals, and outcomes.
   - Includes: ID, Name, Sex, Age, Height, Weight, Team, NOC, Games, Year, Season, City, Sport, Event, Medal.
   - Supplemented by **NOC-to-region mapping** for country-level analysis.

2. **Tokyo 2021 Dataset**
   - Medal and performance data from the delayed Tokyo 2020 Games.

---

## 🛠️ Tools and Technologies

- **Python**
- **Libraries**: Pandas, NumPy, Matplotlib, Seaborn
- **Jupyter Notebook** for analysis & documentation

---

## ⚙️ Methods

1. **Data Cleaning**

   - Standardized NOC codes and mapped them to countries.
   - Removed missing or inconsistent entries.

2. **Exploratory Data Analysis (EDA)**

   - Medal distribution trends across years.
   - Host vs. non-host medal comparisons.
   - Visualizations for medal growth or decline.

3. **Statistical Testing**
   - Compared host nations’ medal counts in hosting years vs. non-hosting years.
   - Evaluated significance of observed trends.

---

## 🔑 Key Insights

- Host nations consistently show **increased medal counts** in the year they host.
- Medal boosts are often temporary, with performance normalizing in subsequent Games.
- The effect varies between **Summer and Winter Olympics**, with larger boosts observed in Summer Games.

---

## 📊 Visualizations / Output

- Line plots showing medal trends across multiple years.
- Bar charts comparing host vs. non-host performance.
- Statistical test summaries on medal differences.

---

## ▶️ How to Run This Project

1. Clone the repository:

   ```bash
   git clone https://github.com/PhuNguyen0209/Data-Analytics-Data-Science-Portfolio.git

   ```

2. Open the notebook:

   ```bash
   jupyter notebook "EDA_Statistics.ipynb"

   ```

3. Install required libraries:
   ```bash
   pip install pandas numpy matplotlib seaborn
   ```

## 📈 Results & Conclusion

- Confirmed a **“home advantage” effect**: host nations tend to perform better in medal counts during hosting years.
- Boosts are influenced by factors like **investment in sports infrastructure** and **athlete support**.
- However, improvements are **not permanent**, often declining in following Games.

---

## 🔮 Future Work

- Incorporate **GDP, population, and sports funding** data to control for external factors.
- Compare different host nations to explore **cultural and structural impacts**.
- Extend analysis to **paralympic data** for inclusivity.

---

## 👤 Author & Contact

**Phu Nguyen Nhu**

- 📧 Email: [Your Email Here]
- 🔗 [LinkedIn](https://www.linkedin.com/in/phu-nguyen-nhu-897298286/)
- 📄 [Resume](https://drive.google.com/drive/u/0/folders/1e7KDADeQA-tRycGcJw0HI0s5bovpT0P6)
