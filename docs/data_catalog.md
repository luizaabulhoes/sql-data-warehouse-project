# 🟨 Gold Layer — Data Catalog Overview  

The **Gold Layer** is the **business-level data model**, designed to power **dashboards, analytics, and reporting**.  
It consists of **dimension tables** (descriptive data) and **fact tables** (quantitative, event-based data).

---

<details>
<summary>🧍‍♂️ <b>gold.dim_customers</b> — Customer Dimension</summary>

**Purpose:**  
Stores customer details enriched with demographic and geographic information.

<table>
  <tr><th>Column Name</th><th>Data Type</th><th>Description</th></tr>
  <tr><td>customer_key</td><td>INT</td><td>Surrogate key uniquely identifying each customer record.</td></tr>
  <tr><td>customer_id</td><td>INT</td><td>Unique numerical identifier assigned to each customer.</td></tr>
  <tr><td>customer_number</td><td>NVARCHAR(50)</td><td>Alphanumeric identifier representing the customer, used for tracking and referencing.</td></tr>
  <tr><td>first_name</td><td>NVARCHAR(50)</td><td>Customer’s first name.</td></tr>
  <tr><td>last_name</td><td>NVARCHAR(50)</td><td>Customer’s last or family name.</td></tr>
  <tr><td>country</td><td>NVARCHAR(50)</td><td>Country of residence (e.g., Australia).</td></tr>
  <tr><td>marital_status</td><td>NVARCHAR(50)</td><td>Marital status (e.g., Married, Single).</td></tr>
  <tr><td>gender</td><td>NVARCHAR(50)</td><td>Gender (Male, Female, n/a).</td></tr>
  <tr><td>birthdate</td><td>DATE</td><td>Date of birth (YYYY-MM-DD, e.g., 1971-10-06).</td></tr>
  <tr><td>create_date</td><td>DATE</td><td>Date when the record was created in the system.</td></tr>
</table>

</details>

---

<details>
<summary>🧩 <b>gold.dim_products</b> — Product Dimension</summary>

**Purpose:**  
Provides information about the products and their related attributes.

<table>
  <tr><th>Column Name</th><th>Data Type</th><th>Description</th></tr>
  <tr><td>product_key</td><td>INT</td><td>Surrogate key uniquely identifying each product record.</td></tr>
  <tr><td>product_id</td><td>INT</td><td>Unique identifier assigned to the product for internal tracking and referencing.</td></tr>
  <tr><td>product_number</td><td>NVARCHAR(50)</td><td>Structured alphanumeric code representing the product.</td></tr>
  <tr><td>product_name</td><td>NVARCHAR(50)</td><td>Descriptive product name (e.g., includes type, color, size).</td></tr>
  <tr><td>category_id</td><td>NVARCHAR(50)</td><td>Unique identifier for the product's category.</td></tr>
  <tr><td>category</td><td>NVARCHAR(50)</td><td>Broader classification (e.g., Bikes, Components).</td></tr>
  <tr><td>subcategory</td><td>NVARCHAR(50)</td><td>Detailed classification within the category.</td></tr>
  <tr><td>maintenance_required</td><td>NVARCHAR(50)</td><td>Indicates if the product requires maintenance (Yes/No).</td></tr>
  <tr><td>cost</td><td>INT</td><td>Base cost or price of the product.</td></tr>
  <tr><td>product_line</td><td>NVARCHAR(50)</td><td>Product line or series (e.g., Road, Mountain).</td></tr>
  <tr><td>start_date</td><td>DATE</td><td>Date when the product became available for sale.</td></tr>
</table>

</details>

---

<details>
<summary>💰 <b>gold.fact_sales</b> — Sales Fact Table</summary>

**Purpose:**  
Stores transactional sales data for analytical use.

<table>
  <tr><th>Column Name</th><th>Data Type</th><th>Description</th></tr>
  <tr><td>order_number</td><td>NVARCHAR(50)</td><td>Unique alphanumeric identifier for each sales order (e.g., SO54496).</td></tr>
  <tr><td>product_key</td><td>INT</td><td>Surrogate key linking to the product dimension.</td></tr>
  <tr><td>customer_key</td><td>INT</td><td>Surrogate key linking to the customer dimension.</td></tr>
  <tr><td>order_date</td><td>DATE</td><td>Date when the order was placed.</td></tr>
  <tr><td>shipping_date</td><td>DATE</td><td>Date when the order was shipped to the customer.</td></tr>
  <tr><td>due_date</td><td>DATE</td><td>Date when the payment was due.</td></tr>
  <tr><td>sales_amount</td><td>INT</td><td>Total monetary value of the sale (e.g., 25).</td></tr>
  <tr><td>quantity</td><td>INT</td><td>Number of units ordered in the line item.</td></tr>
  <tr><td>price</td><td>INT</td><td>Unit price of the product (e.g., 25).</td></tr>
</table>

</details>

---

