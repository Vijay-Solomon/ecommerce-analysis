import pandas as pd
import numpy as np

def clean_data(input_path, output_path):
    print("🔄 Loading data...")
    df = pd.read_csv(input_path)

    print("🧽 Cleaning data...")

    # ---- STANDARD CLEANING ----

    # 1. Normalize column names
    df.columns = (
        df.columns.str.strip()
                 .str.lower()
                 .str.replace(" ", "_")
    )

    # 2. Remove duplicates
    df = df.drop_duplicates()

    # 3. Remove whitespace in string columns
    str_cols = df.select_dtypes(include='object').columns
    for col in str_cols:
        df[col] = df[col].astype(str).str.strip()

    # 4. Convert date columns
    date_cols = ['order_date', 'delivery_date', 'shipping_date']
    for col in date_cols:
        if col in df.columns:
            df[col] = pd.to_datetime(df[col], errors='coerce')

    # 5. Convert numeric columns
    num_cols = ['quantity', 'price', 'discount', 'tax', 'total_amount']
    for col in num_cols:
        if col in df.columns:
            df[col] = pd.to_numeric(df[col], errors='coerce')

    # 6. Fill missing values
    df = df.fillna({
        'discount': 0,
        'tax': 0,
        'quantity': df['quantity'].median() if 'quantity' in df else 1
    })

    # Drop rows missing ID fields
    if 'order_id' in df.columns:
        df = df[df['order_id'].notna()]
    if 'customer_id' in df.columns:
        df = df[df['customer_id'].notna()]

    # ---- FEATURE ENGINEERING ----

    # 7. Calculated total amount
    if {'quantity', 'price'}.issubset(df.columns):
        df['calculated_total'] = df['quantity'] * df['price']

    # 8. Flag mismatch in totals
    if {'total_amount', 'calculated_total'}.issubset(df.columns):
        df['difference_flag'] = np.where(
            abs(df['total_amount'] - df['calculated_total']) > 1,
            1, 0
        )

    # 9. Date breakdown columns
    if 'order_date' in df.columns:
        df['order_year'] = df['order_date'].dt.year
        df['order_month'] = df['order_date'].dt.month
        df['order_week'] = df['order_date'].dt.isocalendar().week

    print("💾 Saving cleaned file...")
    df.to_csv(output_path, index=False)

    print("✅ Cleaned data saved to:", output_path)


if __name__ == "__main__":
    input_file = "data/raw_ecomm_data.csv"
    output_file = "data/clean_ecomm_data.csv"
    clean_data(input_file, output_file)

