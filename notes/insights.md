# Zepto SQL Analysis — Insights & Conclusions

## Executive Summary
This project analyzed Zepto product data to evaluate pricing behavior, discount strategy, inventory health, and category performance using SQL.

## Key Insights
1. Revenue Concentration:
The highest revenue potential comes from Cooking Essentials (₹337K) and Munchies (₹337K), confirming that everyday consumption categories drive the majority of business value.

2. Premium Product Demand:
The most expensive products in the catalog are premium cooking items such as Borges Olive Oil (₹1,399) and A2 Ghee (₹1,305), indicating strong customer demand for high-quality kitchen staples.

3. Discount Strategy Focus:
The highest average discounts are applied to Fruits & Vegetables (15.46%) and Meats, Fish & Eggs (11.03%), suggesting that discounts are strategically used to attract customers through essential fresh categories.

4. Promotional Leverage Products:
Products such as Dukes Waffy wafers (51% discount) and Chef’s Basket Pasta (50% discount) act as major promotional drivers to boost volume and engagement.

5. Inventory Risk Signals:
High-value products like Patanjali Cow’s Ghee (₹565) are frequently out of stock, highlighting potential supply chain constraints for premium SKUs.

6. Catalog Optimization:
The catalog is heavily skewed toward low-weight products (2,833 SKUs), enabling faster fulfillment, lower logistics cost, and higher delivery efficiency.
 

## Data Quality Actions
- Removed invalid product with MRP = 0
- Converted price fields from paise to rupees for readability
- Verified nulls and logical consistency
- Preserved raw data and created analysis-ready structure

## Business Implications
- Zepto’s revenue engine is built on daily essentials rather than luxury items.
- Discount strategy is optimized around fresh and fast-moving categories.
- Premium cooking products require better supply chain reinforcement.
- Catalog design prioritizes small, fast-moving SKUs, enabling operational efficiency.

## Next Steps
- Add visualizations
- Automate refresh pipeline
