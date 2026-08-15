import pandas as pd
from pathlib import Path

# File paths
input_file = "data/raw/online_retail_II.xlsx"
output_file = "data/processed/online_retail_II.csv"

# Load Excel dataset
df = pd.read_excel(input_file)

print("Dataset loaded successfully!")
print(f"Rows: {df.shape[0]}")
print(f"Columns: {df.shape[1]}")

# Save as CSV
df.to_csv(output_file, index=False)

print(f"\nProcessed file saved to: {output_file}")