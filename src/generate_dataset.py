import pandas as pd
import numpy as np
import random
from datetime import datetime, timedelta

# Reproducibility
np.random.seed(42)
random.seed(42)

# Dataset configuration
n_orders = 10000

# Lists used to generate realistic data
countries = ["United States", "Canada", "United Kingdom", "Germany", "France", "Australia"]
regions = {
    "United States": "North America",
    "Canada": "North America",
    "United Kingdom": "Europe",
    "Germany": "Europe",
    "France": "Europe",
    "Australia": "Oceania"
}

products = {
    "Electronics": [
        ("Wireless Headphones", 79.99, 45.00),
        ("Smart Watch", 129.99, 75.00),
        ("Bluetooth Speaker", 59.99, 32.00),
        ("USB-C Hub", 39.99, 21.00),
    ],
    "Home": [
        ("Coffee Maker", 89.99, 48.00),
        ("Desk Lamp", 34.99, 18.00),
        ("Office Chair", 199.99, 120.00),
        ("Air Purifier", 149.99, 82.00),
    ],
    "Fitness": [
        ("Yoga Mat", 29.99, 12.00),
        ("Dumbbell Set", 79.99, 42.00),
        ("Resistance Bands", 24.99, 10.00),
        ("Fitness Tracker", 99.99, 55.00),
    ],
    "Accessories": [
        ("Backpack", 69.99, 35.00),
        ("Travel Mug", 24.99, 11.00),
        ("Laptop Sleeve", 32.99, 15.00),
        ("Water Bottle", 21.99, 9.00),
    ],
}

payment_methods = ["Credit Card", "PayPal", "Bank Transfer", "Debit Card"]

# Generate customers
customer_ids = [f"C{str(i).zfill(5)}" for i in range(1, 2001)]

customer_names = [
    f"Customer {i}" for i in range(1, 2001)
]

customer_map = dict(zip(customer_ids, customer_names))

# Generate orders
orders = []

start_date = datetime(2024, 1, 1)

for i in range(1, n_orders + 1):

    order_id = f"ORD{str(i).zfill(6)}"

    customer_id = random.choice(customer_ids)

    country = random.choice(countries)
    region = regions[country]

    category = random.choice(list(products.keys()))

    product_name, unit_price, cost = random.choice(products[category])

    quantity = np.random.choice([1, 1, 1, 2, 2, 3, 4, 5])

    discount = np.random.choice(
        [0, 0, 0, 0.05, 0.10, 0.15, 0.20]
    )

    shipping_cost = round(
        np.random.uniform(3, 25),
        2
    )

    payment_method = random.choice(payment_methods)

    order_date = start_date + timedelta(
        days=random.randint(0, 729)
    )

    orders.append({
        "order_id": order_id,
        "order_date": order_date.strftime("%Y-%m-%d"),
        "customer_id": customer_id,
        "customer_name": customer_map[customer_id],
        "country": country,
        "region": region,
        "product_category": category,
        "product_name": product_name,
        "quantity": quantity,
        "unit_price": unit_price,
        "discount": discount,
        "shipping_cost": shipping_cost,
        "payment_method": payment_method,
        "unit_cost": cost
    })

# Convert to DataFrame
df = pd.DataFrame(orders)

# Calculate business metrics
df["revenue"] = (
    df["quantity"]
    * df["unit_price"]
    * (1 - df["discount"])
)

df["total_cost"] = (
    df["quantity"] * df["unit_cost"]
    + df["shipping_cost"]
)

df["profit"] = df["revenue"] - df["total_cost"]

df["profit_margin"] = (
    df["profit"] / df["revenue"]
)

# Round numerical values
df["unit_price"] = df["unit_price"].round(2)
df["shipping_cost"] = df["shipping_cost"].round(2)
df["unit_cost"] = df["unit_cost"].round(2)
df["revenue"] = df["revenue"].round(2)
df["total_cost"] = df["total_cost"].round(2)
df["profit"] = df["profit"].round(2)
df["profit_margin"] = df["profit_margin"].round(4)

# -------------------------------------------------
# Introduce realistic data-quality issues
# -------------------------------------------------

# Missing customer names
missing_indices = np.random.choice(
    df.index,
    size=50,
    replace=False
)

df.loc[missing_indices, "customer_name"] = np.nan

# Missing payment methods
missing_payment_indices = np.random.choice(
    df.index,
    size=30,
    replace=False
)

df.loc[missing_payment_indices, "payment_method"] = np.nan

# Inconsistent category names
category_indices = np.random.choice(
    df.index,
    size=40,
    replace=False
)

df.loc[category_indices, "product_category"] = "electronics"

# Invalid discounts
invalid_discount_indices = np.random.choice(
    df.index,
    size=15,
    replace=False
)

df.loc[invalid_discount_indices, "discount"] = 1.25

# Duplicate orders
duplicates = df.sample(
    25,
    random_state=42
)

df = pd.concat(
    [df, duplicates],
    ignore_index=True
)

# Shuffle dataset
df = df.sample(
    frac=1,
    random_state=42
).reset_index(drop=True)

# Save raw dataset
output_path = "data/raw/ecommerce_orders_raw.csv"

df.to_csv(
    output_path,
    index=False
)

print("Dataset created successfully!")
print(f"Rows: {len(df):,}")
print(f"Columns: {len(df.columns)}")
print(f"Saved to: {output_path}")