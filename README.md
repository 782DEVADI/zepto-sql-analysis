# zepto-sql-analysis
SQL-based business analysis of Zepto product data focusing on pricing trends, discount strategies, inventory behavior, and catalog optimization.

📌 Project Objective

To analyze Zepto’s product dataset using SQL and uncover business insights around:

Pricing & discount strategy

Revenue potential across categories

Inventory health & risk

Product catalog structure & optimization

This project simulates real-world decision-making scenarios faced by e-commerce and retail teams.

🧰 Tech Stack

MySQL

Excel (Data source & export)

SQL (Advanced analytical queries)

🗂️ Dataset Overview

Table: products

Column	Description
Name	Product name
Category	Product category
mrp	Maximum Retail Price (₹)
discountPercent	Discount percentage
availableQuantity	Units currently in stock
discountedSellingPrice	Final selling price
weightInGms	Product weight
outOfStock	Stock availability flag
quantity	Package quantity
🧹 Data Cleaning & Preparation

Performed directly in SQL:

Null value validation (0 nulls across all critical fields)

Removed duplicate product-name/category records for analysis consistency

Standardized price units from paise → rupees

Validated out-of-stock flags

Checked zero-MRP anomalies (found & documented edge cases)

🔍 Analysis Modules
1️⃣ Category Revenue Potential

Identified top revenue-driving categories:

Category	Estimated Revenue (₹)
Cooking Essentials	337,369
Munchies	337,369
Personal Care	270,849
Packaged Food	224,385
Ice Cream & Desserts	224,385
2️⃣ Pricing & Premium Products

Top premium products by selling price:

Borges Extra Light Olive Oil – ₹1,399

Praakritik A2 Ghee – ₹1,305

Saffola Gold Oil – ₹1,240

These premium kitchen staples dominate high-value purchases.

3️⃣ Discount Strategy Effectiveness

Top categories by average discount:

Category	Avg Discount (%)
Fruits & Vegetables	15.46%
Meats, Fish & Eggs	11.03%
Chocolates & Candies	8.32%
Ice Cream & Desserts	8.32%

High discounts on essentials suggest customer acquisition & retention strategy.

4️⃣ Best-Value Promotions

Products with 50–51% discounts drive promotional traction:

Dukes Waffy Wafers — 51%

Chef’s Basket Pasta — 50%

Ceres Instant Masala — 50%

5️⃣ Inventory Risk Analysis

High-MRP products frequently out of stock:

Patanjali Cow’s Ghee (₹565) — Out of stock in multiple categories

Indicates possible supply chain constraints for premium SKUs.

6️⃣ Product Size Segmentation
Product Size	SKU Count
Low	2,833
Medium	837
Bulk	61

Catalog is optimized for fast-moving, low-weight items → improved logistics efficiency.

🧠 Key Business Insights

Revenue Concentration: Cooking Essentials & Munchies dominate revenue.

Premium Demand: High-value kitchen staples lead premium sales.

Strategic Discounting: Essentials receive the strongest discount focus.

Promotional Leverage: Snacks & staples drive volume via heavy discounts.

Inventory Risk: Premium items show supply constraints.

Catalog Optimization: Heavy skew toward low-weight SKUs boosts delivery efficiency.

🧪 Sample Queries Included

Revenue estimation per category

High-MRP & out-of-stock detection

Discount optimization analysis

Dead inventory identification

Best-value product extraction

Product size segmentation

(All queries available inside the SQL script in the repo.)

🏁 Final Outcome

This project demonstrates end-to-end SQL analytics:

From raw data → cleaning → exploration → business insights → strategic recommendations                                                                                  
