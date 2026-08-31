# Data Quality Report

## Dataset Overview

The raw dataset contains 10,025 records and 18 columns representing e-commerce orders from January 2024 to December 2025.

## Data Quality Issues Identified

| Issue | Records Affected | Treatment |
|---|---:|---|
| Duplicate records | 25 | Removed duplicate rows |
| Missing customer names | 51 | Recovered using customer ID |
| Missing payment methods | 30 | Replaced with "Unknown" |
| Inconsistent product category | 40 | Standardized to "Electronics" |
| Invalid discounts | 15 | Replaced with NaN |
| Order date stored as text | 10,000 | Converted to datetime |

## Validation

The cleaned dataset contains:

- 10,000 records
- 18 columns
- No missing customer names
- No missing payment methods
- No duplicate records
- No invalid quantities
- No invalid unit prices
- No invalid unit costs
- No invalid revenue values

## Business Note

Negative-profit orders were not removed because negative profit can represent a legitimate business outcome rather than a data-quality error. These orders will be investigated during the exploratory analysis.