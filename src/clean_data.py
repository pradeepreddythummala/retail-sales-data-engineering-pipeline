import pandas as pd
from pathlib import Path

# File paths
input_file = "data/processed/online_retail_II.csv"
output_file = "data/processed/online_retail_clean.csv"

# Load dataset
df = pd.read_csv(input_file)

print("Original dataset:")
print(f"Rows: {len(df)}")
print(f"Columns: {len(df.columns)}")

# --------------------------------------------------
# 1. Remove duplicate rows
# --------------------------------------------------

duplicates = df.duplicated().sum()
df = df.drop_duplicates()

print(f"\nDuplicates removed: {duplicates}")

# --------------------------------------------------
# 2. Handle missing descriptions
# --------------------------------------------------

missing_description = df["Description"].isna().sum()

df["Description"] = df["Description"].fillna("Unknown Product")

print(f"Missing descriptions replaced: {missing_description}")

# --------------------------------------------------
# 3. Handle missing Customer IDs
# --------------------------------------------------

missing_customer = df["Customer ID"].isna().sum()

df["Customer ID"] = df["Customer ID"].fillna(0)

print(f"Missing Customer IDs replaced: {missing_customer}")

# --------------------------------------------------
# 4. Convert InvoiceDate to datetime
# --------------------------------------------------

df["InvoiceDate"] = pd.to_datetime(df["InvoiceDate"])

# --------------------------------------------------
# 5. Create Revenue column
# --------------------------------------------------

df["Revenue"] = df["Quantity"] * df["Price"]

# --------------------------------------------------
# 6. Remove invalid transactions
# --------------------------------------------------

invalid_quantity = (df["Quantity"] <= 0).sum()
invalid_price = (df["Price"] <= 0).sum()

df = df[df["Quantity"] > 0]
df = df[df["Price"] > 0]

print(f"Invalid quantity rows removed: {invalid_quantity}")
print(f"Invalid price rows removed: {invalid_price}")

# --------------------------------------------------
# 7. Save cleaned dataset
# --------------------------------------------------

df.to_csv(output_file, index=False)

print("\n===== CLEANING COMPLETED =====")
print(f"Final rows: {len(df)}")
print(f"Final columns: {len(df.columns)}")
print(f"Saved to: {output_file}")