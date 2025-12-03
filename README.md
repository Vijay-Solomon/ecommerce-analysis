
# 📊 E-Commerce Sales Analytics Project

This is an **end-to-end Data Analytics project** built using Python, SQL, and Business Analytics techniques.
The goal is to analyze real-world e-commerce sales data and generate insights using:

✔ Data Cleaning  
✔ Exploratory Data Analysis (EDA)  
✔ RFM Customer Segmentation  
✔ Customer Lifetime Value (CLV)  
✔ Sales Forecasting (Time Series)  
✔ SQL Queries  
✔ Professional Folder Structure  

---

## 📁 Project Structure

ecommerce-analysis/
- data/
  - raw_ecomm_data.csv
  - clean_ecomm_data.csv
- scripts/
  - clean_data.py
- notebooks/
  - 01-data-cleaning.ipynb
  - 02-eda.ipynb
  - 03-rfm.ipynb
  - 04-clv.ipynb
  - 05-forecasting.ipynb
- reports/
  - rfm_segments.csv
  - customer_clv.csv
  - sales_forecast.csv
- images/
  - rfm_segments.png
  - clv_distribution.png
  - monthly_sales_trend.png
  - sales_forecast_ma.png
- README.md

---

## 🧼 1. Data Cleaning (Python)

Performed using Pandas:
- Removing duplicates
- Handling null values
- Standardizing text columns
- Converting dates
- Exporting cleaned dataset

---

## 📊 2. Exploratory Data Analysis (EDA)

Insights generated:
- Monthly & yearly sales trends
- Top selling categories & sub-categories
- Region-wise performance
- Shipping mode performance
- Customer segmentation by product

Visualizations created using **Matplotlib + Seaborn**.

---

## 🎯 3. RFM Customer Segmentation

RFM = Recency, Frequency, Monetary.

Steps:
- Calculated recency values
- Ranked frequency and monetary
- Scaled scores 1–5
- Created RFM Score
- Segmented customers into:
  - Champions
  - Loyal Customers
  - Potential Loyalists
  - Needs Attention
  - At Risk

Outputs:
- reports/rfm_segments.csv
- images/rfm_segments.png

---

## 💰 4. Customer Lifetime Value (CLV)

Calculated:
- Total revenue per customer
- Average order value
- Purchase frequency
- Annual Lifetime Value (simple CLV model)

Outputs:
- reports/customer_clv.csv
- images/clv_distribution.png

---

## 📈 5. Sales Forecasting (Time Series)

Created a moving average forecasting model:
- 3-month moving average
- 6-month moving average

Generated:
- Monthly sales trend
- Forecast comparison chart

Outputs:
- reports/sales_forecast.csv
- images/monthly_sales_trend.png
- images/sales_forecast_ma.png

---

## 🛠️ Tools Used

- Python (Pandas, NumPy, Matplotlib, Seaborn)
- SQL
- Jupyter Notebook
- Git & GitHub
- Excel (optional)

---

## 🚀 How to Run the Project

1. Clone the repository:
   git clone https://github.com/Vijay-Solomon/ecommerce-analysis.git

2. Install dependencies:
   pip install -r requirements.txt

3. Run notebooks:
   jupyter notebook

---

## 👤 Author

**Vijay Solomon**  
Aspiring Data Analyst | Python | SQL | Power BI | Excel  
GitHub: https://github.com/Vijay-Solomon  
LinkedIn: (your link here)

---

### ⭐ If you find this project useful, please consider giving it a star on GitHub!
