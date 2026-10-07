# \# Business Insights

# 

# \## Executive Summary

# 

# This analysis evaluates 10,000 cleaned e-commerce orders from January 2024 through December 2025, focusing on revenue, profitability, product performance, regional performance, discount behavior, and order-level loss risk.

# 

# The business generated \*\*$1.61 million in revenue\*\* and \*\*$537.12 thousand in profit\*\*, resulting in an overall \*\*33.27% profit margin\*\*.

# 

# While overall profitability is strong, deeper analysis identified a concentrated profitability risk among higher-discount orders and several lower-priced products. These findings suggest opportunities to improve pricing, discount controls, and shipping policies without broadly reducing sales activity.

# 

# \---

# 

# \## Key Findings

# 

# \### 1. Home is the largest contributor to revenue and profit

# 

# Home generated \*\*$648,072.15 in revenue\*\* and \*\*$219,897.66 in profit\*\*, making it the largest category by total financial contribution.

# 

# This category should remain a priority because changes in its performance can have a meaningful impact on overall business results.

# 

# \---

# 

# \### 2. Fitness has the highest category-level profit margin

# 

# Fitness achieved a \*\*34.51% profit margin\*\*, the highest among the analyzed product categories.

# 

# Although it generates less total revenue than Home, its stronger margin indicates efficient profitability relative to sales.

# 

# \---

# 

# \### 3. Europe is the largest regional market

# 

# Europe generated \*\*$810,434.86 in revenue\*\* across \*\*5,047 orders\*\*, representing the largest regional market in the dataset.

# 

# Oceania, however, achieved the highest regional profit margin at \*\*33.81%\*\*.

# 

# This distinction is important: Europe leads in scale, while Oceania slightly leads in profitability efficiency.

# 

# \---

# 

# \### 4. Higher discount levels are associated with increasing loss risk

# 

# The dataset contains \*\*916 loss-making orders\*\*, representing \*\*9.16% of all orders\*\*.

# 

# Segmenting orders by discount level reveals a clear progression:

# 

# | Discount Band | Orders | Average Profit | Loss Order Rate |

# |---|---:|---:|---:|

# | No Discount | 4,293 | $66.04 | 5.89% |

# | 0-5% | 1,373 | $58.06 | 7.94% |

# | 5-10% | 1,429 | $47.48 | 9.45% |

# | 10-15% | 1,443 | $42.12 | 11.71% |

# | 15%+ | 1,462 | $30.97 | 17.10% |

# 

# Orders receiving discounts of \*\*15% or more\*\* have a \*\*17.10% loss rate\*\*, compared with \*\*5.89% for orders without discounts\*\*.

# 

# Their average profit is also substantially lower: \*\*$30.97 compared with $66.04\*\* for orders without discounts.

# 

# This represents an association rather than proof that discounts alone cause losses. Product mix, shipping costs, and product economics also affect profitability.

# 

# \---

# 

# \### 5. Profitability risk is concentrated in specific products

# 

# Several lower-priced products show significantly higher rates of loss-making orders:

# 

# | Product | Revenue | Profit Margin | Loss Order Rate |

# |---|---:|---:|---:|

# | USB-C Hub | $57,845.05 | 27.52% | 13.69% |

# | Desk Lamp | $47,641.93 | 26.60% | 17.10% |

# | Travel Mug | $33,737.36 | 26.03% | 23.99% |

# | Water Bottle | $31,679.47 | 27.68% | 24.16% |

# 

# \*\*Water Bottle\*\* has the highest loss-order rate at \*\*24.16%\*\*, followed closely by \*\*Travel Mug at 23.99%\*\*.

# 

# In contrast, high-revenue products such as Office Chair, Air Purifier, Smart Watch, and Fitness Tracker recorded no loss-making orders in this dataset.

# 

# This suggests that profitability risk is not evenly distributed across the product portfolio.

# 

# \---

# 

# \### 6. Discounts and shipping costs both contribute to margin pressure

# 

# A deeper investigation of the higher-risk products shows that loss-making orders tend to combine \*\*higher discounts with higher shipping costs\*\*.

# 

# | Product | Discount on Loss Orders | Discount on Profitable Orders | Shipping on Loss Orders | Shipping on Profitable Orders |

# |---|---:|---:|---:|---:|

# | Desk Lamp | 9.15% | 6.71% | $19.10 | $12.79 |

# | Travel Mug | 9.58% | 6.19% | $18.78 | $12.37 |

# | USB-C Hub | 12.13% | 6.28% | $19.89 | $13.40 |

# | Water Bottle | 9.65% | 6.13% | $18.27 | $12.22 |

# 

# For example, loss-making USB-C Hub orders received an average \*\*12.13% discount\*\*, compared with \*\*6.28%\*\* among profitable orders.

# 

# Shipping costs show a similar pattern. Loss-making USB-C Hub orders averaged \*\*$19.89 in shipping\*\*, compared with \*\*$13.40\*\* for profitable orders.

# 

# For lower-priced products, the combination of discounting and relatively high shipping costs can create substantial pressure on order-level margins.

# 

# \---

# 

# \### 7. Monthly revenue fluctuates without a clear sustained growth trend

# 

# Monthly revenue remained relatively stable across the two-year period but experienced several short-term increases and decreases.

# 

# The largest month-over-month decline occurred in \*\*June 2024 (-17.85%)\*\*, while one of the strongest increases occurred in \*\*March 2025 (+13.08%)\*\*.

# 

# Because the dataset does not contain information about marketing campaigns, promotions, seasonality drivers, or external events, the analysis does not assign causes to these changes.

# 

# The monthly analysis is therefore most useful for monitoring performance rather than establishing causal explanations.

# 

# \---

# 

# \## Business Recommendations

# 

# \### Review discount thresholds

# 

# Orders with discounts of \*\*15% or more\*\* show a substantially higher loss rate and lower average profit.

# 

# The business should evaluate whether higher discounts require additional approval or minimum-margin checks before being applied.

# 

# This does not mean eliminating discounts. The objective should be to identify discount levels that support sales without unnecessarily eroding profitability.

# 

# \### Prioritize Water Bottle and Travel Mug for profitability review

# 

# Water Bottle and Travel Mug have loss-order rates close to \*\*24%\*\*, making them the strongest candidates for further pricing and cost analysis.

# 

# The review should consider:

# 

# \- product pricing;

# \- unit economics;

# \- discount eligibility;

# \- shipping thresholds;

# \- minimum order value;

# \- product bundling opportunities.

# 

# \### Evaluate shipping policy for lower-priced products

# 

# Loss-making orders among the identified high-risk products consistently have higher shipping costs.

# 

# Because shipping represents a larger share of revenue for lower-priced products, the business should evaluate options such as minimum-order thresholds, bundled shipping, or product-specific shipping rules.

# 

# \### Protect strong-performing products

# 

# Office Chair, Air Purifier, Smart Watch, and Fitness Tracker combine high revenue with strong profitability and recorded no loss-making orders in this dataset.

# 

# Pricing or promotional changes affecting these products should therefore be evaluated carefully to avoid weakening currently strong unit economics.

# 

# \### Monitor profitability by product, not only total revenue

# 

# Revenue alone can hide product-level risk.

# 

# Future performance monitoring should combine:

# 

# \- revenue;

# \- profit;

# \- profit margin;

# \- loss-order rate;

# \- average discount;

# \- shipping cost.

# 

# This provides a more complete view of product performance and makes it easier to identify margin deterioration before it becomes significant.

# 

# \---

# 

# \## Analytical Conclusion

# 

# The business is profitable overall, but aggregate KPIs hide meaningful differences in order-level and product-level performance.

# 

# The analysis indicates that profitability risk is concentrated among specific lower-priced products and becomes more pronounced when higher discounts and shipping costs occur together.

# 

# Rather than applying broad pricing changes across the entire product portfolio, the evidence supports a targeted approach focused on discount controls, shipping economics, and the highest-risk SKUs.

# 

# The analysis identifies where management attention should be focused; further experimentation or operational data would be required before establishing causal relationships or implementing permanent pricing changes.

