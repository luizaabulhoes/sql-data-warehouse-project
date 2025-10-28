🟨 Gold Layer — Data Catalog
Overview

The Gold Layer is the business-level data model, designed to power dashboards, analytics, and reporting.
It consists of dimension tables (descriptive data) and fact tables (quantitative, event-based data).

<details> <summary>🧍‍♂️ <b>gold.dim_customers</b> — Customer Dimension</summary>

Purpose:
Stores customer details enriched with demographic and geographic information.

Column Name	Data Type	Description
customer_key	INT	Surrogate key uniquely identifying each customer record.
customer_id	INT	Unique numerical identifier assigned to each customer.
customer_number	NVARCHAR(50)	Alphanumeric identifier representing the customer, used for tracking and referencing.
first_name	NVARCHAR(50)	Customer’s first name.
last_name	NVARCHAR(50)	Customer’s last or family name.
country	NVARCHAR(50)	Country of residence (e.g., Australia).
marital_status	NVARCHAR(50)	Marital status (e.g., Married, Single).
gender	NVARCHAR(50)	Gender of the customer (Male, Female, n/a).
birthdate	DATE	Date of birth (YYYY-MM-DD, e.g., 1971-10-06).
create_date	DATE	Date when the record was created in the system.
</details>
<details> <summary>🧩 <b>gold.dim_products</b> — Product Dimension</summary>

Purpose:
Provides information about the products and their related attributes.

Column Name	Data Type	Description
product_key	INT	Surrogate key uniquely identifying each product record.
product_id	INT	Unique identifier assigned to the product for internal tracking.
product_number	NVARCHAR(50)	Structured alphanumeric code representing the product.
product_name	NVARCHAR(50)	Descriptive product name (e.g., includes type, color, size).
category_id	NVARCHAR(50)	Identifier for the product’s category.
category	NVARCHAR(50)	Broad classification (e.g., Bikes, Components).
subcategory	NVARCHAR(50)	Detailed classification within the category.
maintenance_required	NVARCHAR(50)	Indicates if maintenance is required (Yes / No).
cost	INT	Base cost of the product.
product_line	NVARCHAR(50)	Product line or series (e.g., Road, Mountain).
start_date	DATE	Date when the product became available.
</details>
<details> <summary>💰 <b>gold.fact_sales</b> — Sales Fact Table</summary>

Purpose:
Stores transactional sales data for analytical use.

Column Name	Data Type	Description
order_number	NVARCHAR(50)	Unique alphanumeric identifier for each sales order (e.g., SO54496).
product_key	INT	Surrogate key linking to the product dimension.
customer_key	INT	Surrogate key linking to the customer dimension.
order_date	DATE	Date when the order was placed.
shipping_date	DATE	Date when the order was shipped.
due_date	DATE	Payment due date.
sales_amount	INT	Total value of the sale (e.g., 25).
quantity	INT	Number of units sold in the order line.
price	INT	Unit price of the product (e.g., 25).
</details>
