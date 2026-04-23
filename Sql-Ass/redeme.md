# ECommerce Logistics Database

## OverView

The Logistics Performance Tracker is a SQL-based database system designed to monitor shipment deliveries, identify delays, and evaluate delivery partner performance.

This project helps logistics companies:

- Track delayed shipments
- Measure delivery success rates
- Rank delivery partners
- Analyze delivery trends for route optimization

## Database Schema

The database consists of three main tables:
 <img width="352" height="194" alt="image" src="https://github.com/user-attachments/assets/046a849b-340a-44fe-ba03-f344732377f1" />

### DeliveryPartner
- `id` (INT, PRIMARY KEY, AUTO_INCREMENT): Unique identifier for each delivery partner
- `name` (VARCHAR(100), NOT NULL): Name of the delivery 
<img width="366" height="292" alt="image" src="https://github.com/user-attachments/assets/950b2efe-97cb-4e6f-8686-58dfe2c735b5" />

 
### Orders
- `order_id` (INT, PRIMARY KEY, AUTO_INCREMENT): Unique identifier for each order
- `partner_id` (INT, FOREIGN KEY): References DeliveryPartner(id)
- `order_date` (DATE): Date when the order was placed
- `promised_date` (DATE): Promised delivery date
- `delivered_date` (DATE, NULLABLE): Actual delivery date (NULL if not yet delivered)
- `city` (VARCHAR(100)): City where the order is to be delivered
- `status` (VARCHAR(50)): Current status of the order (e.g., 'Successful', 'Returned', 'Processing')

- <img width="849" height="384" alt="image" src="https://github.com/user-attachments/assets/02f56e30-f64d-49a5-b925-6a5d3cff865c" />

 
### TrackingLogs
- `log_id` (INT, PRIMARY KEY, AUTO_INCREMENT): Unique identifier for each tracking log entry
- `order_id` (INT, FOREIGN KEY): References Orders(order_id)
- `message` (VARCHAR(100)): Tracking message or update
- `log_time` (DATETIME): Timestamp of the tracking update
- <img width="610" height="238" alt="image" src="https://github.com/user-attachments/assets/d0ae7127-49b5-4fd0-be3c-77959787b53b" />

 

## Queries

The script includes several analytical queries:

1.	**Delayed Orders**: Returns orders where the delivered date is after the promised date

   <img width="645" height="261" alt="image" src="https://github.com/user-attachments/assets/b26d08e0-4e14-4bc1-ac5e-43713b2bd257" />

 
3.	**Partner Performance**: Shows successful and returned deliveries per partner

   <img width="745" height="225" alt="image" src="https://github.com/user-attachments/assets/c9d3b795-b887-41d2-b8c8-f7b3b4202faf" />

 
5. **Top City**: Finds the city with the highest orders in the last 30 days
   <img width="386" height="114" alt="image" src="https://github.com/user-attachments/assets/58ff0cfa-37f1-4c2c-9f08-b28182cfc517" />

 
7. **Success Rate**: Calculates delivery success rate as per partner, ordered by delayed orders

   <img width="750" height="203" alt="image" src="https://github.com/user-attachments/assets/d93d3939-dd80-41d5-a406-fe4fd3fc21c0" />

 

## Features
-  Shipment tracking system
-  Delay detection logic
-  Performance analytics using SQL aggregation
-  Ranking system for delivery partners
-  City-based demand analysis

## Tools & Technologies
### SQL (MySQL)
### Concepts Used:
- . Joins (INNER JOIN)
- . Aggregations (COUNT, SUM)
- . Conditional Logic (CASE)
- . Grouping (GROUP BY)
- . Sorting (ORDER BY)
- . Date Functions

## How to Run
- 1.Create the database:
 CREATE DATABASE LogisticsDB;
 USE LogisticsDB;
- 2.Run all table creation queries
- 3.Insert sample data
- 4.Execute the queries provided

## Usage

This system can be used by:

- Logistics companies
- E-commerce platforms
- Delivery aggregators
to improve delivery efficiency and decision-making.


