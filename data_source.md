# Data Source

## Dataset

This project uses the **Brazilian E-Commerce Public Dataset by Olist**, a public e-commerce dataset containing approximately 100,000 orders made between 2016 and 2018.

The dataset includes information about:

* Orders
* Customers
* Products
* Sellers
* Order items
* Payments
* Reviews
* Geographic information

## Source

The dataset was obtained from Kaggle.

The raw CSV files are intentionally **not included in this repository** because of their size. The project can be reproduced by downloading the original dataset and placing the CSV files in the project's `data/` directory.

## Data Used

The SQL analysis primarily uses:

* `olist_orders_dataset.csv`
* `olist_order_items_dataset.csv`
* `olist_customers_dataset.csv`
* `olist_products_dataset.csv`
* `product_category_name_translation.csv`

## Database

The dataset was imported into a SQLite database and analyzed using SQL.

### Tools

* SQLite
* DB Browser for SQLite
* SQL
* Git / GitHub
