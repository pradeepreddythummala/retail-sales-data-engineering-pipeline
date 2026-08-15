import pandas as pd

# Load processed dataset
file_path = "data/processed/online_retail_II.csv"

df = pd.read_csv(file_path)

print("===== DATASET PROFILE =====")

# Shape
print("\nDataset shape:")
print(df.shape)

# Columns
print("\nColumns:")
print(df.columns.tolist())

# Data types
print("\nData types:")
print(df.dtypes)

# Missing values
print("\nMissing values:")
print(df.isnull().sum())

# Duplicate rows
print("\nDuplicate rows:")
print(df.duplicated().sum())

# Unique values
print("\nUnique values:")
print(df.nunique())

# Statistical summary
print("\nStatistical summary:")
print(df.describe(include="all"))