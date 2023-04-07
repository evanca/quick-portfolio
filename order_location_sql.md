# Order Location SQL 

[View code](https://github.com/gobr2005/BigCommerceCode/tree/main/order_location)

## Purpose

The goal of the Order Location SQL query is to find where packages are being shipped. 

## Details

This query first cleans the data through a temporary table. It takes shipping address from BigCommerce's `bc_order_shipping_addresses` table and joins it to a table containing state and state post codes. This table was uploaded to BigQuery from a CSV file. This join uses a `case` function to check the length of the state code and determines if the id is on the state post code or the name. The result returns the state name so everything is uniformed. We needed this because some of our API checkouts used state post code instead of the name. I also used a left to only pull the 5 digit zipcode. 

The main query takes the temporary table and joins it with `bc_order` table. This query adds order_created_date_time. It also is needed for the `WHERE` statement which reduces the record to only orders with an exchange of money. This means order which were fully refunded/returned were removed from the query. 

## Using the Query

I designed this query to be a simple copy and paste then to add your account information. 

1. You will need to upload a csv from state's name and state post codes.
2. You will need to update the table ids. By default, I set them as `project_name.store_name.bc_order_shipping_addresses` and kept the original table names that BigCommerce sends over. You can find the table ids in the table details. Below is an image of BigQuery's table details when click on the table. 

![BigCommerce Order Shipping Address Table Details](https://github.com/gobr2005/BigCommerceCode/blob/e6951ca6401397a763cba089f4f518c4ee772d63/order_location/Image/BigQuery-%E2%80%93-bc-order-shipping-addresses-%E2%80%93-Google-Cloud-console.png)

3. Save the query as a view so you can reuse it for different projects or add different information for further analysis. 
