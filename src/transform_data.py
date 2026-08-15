import pandas as pd

# Input and output paths
input_file = "data/processed/online_retail_clean.csv"
output_file = "data/processed/retail_sales_final.csv"

# Load cleaned data
df = pd.read_csv(input_file)

print("Cleaned dataset loaded!")
print(f"Rows: {len(df)}")
print(f"Columns: {len(df.columns)}")

# Convert InvoiceDate to datetime
df["InvoiceDate"] = pd.to_datetime(df["InvoiceDate"])

# Create date-related fields
df["Year"] = df["InvoiceDate"].dt.year
df["Month"] = df["InvoiceDate"].dt.month
df["Month_Name"] = df["InvoiceDate"].dt.strftime("%B")
df["Day"] = df["InvoiceDate"].dt.day
df["Day_Name"] = df["InvoiceDate"].dt.strftime("%A")

# Create revenue if not already available
df["Revenue"] = df["Quantity"] * df["Price"]

# Create order type
df["Is_Return"] = df["Invoice"].astype(str).str.startswith("C")

# Save final transformed dataset
df.to_csv(output_file, index=False)

print("\n===== TRANSFORMATION COMPLETED =====")
print(f"Final rows: {len(df)}")
print(f"Final columns: {len(df.columns)}")
print(f"Saved to: {output_file}")

print("\nFinal columns:")
print(df.columns.tolist())