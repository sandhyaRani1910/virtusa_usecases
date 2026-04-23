# ECommerce Logistics Database

## OverView

The Logistics Performance Tracker is a SQL-based database system designed to monitor shipment deliveries, identify delays, and evaluate delivery partner performance.

This project helps logistics companies:

-Track delayed shipments
-Measure delivery success rates
-Rank delivery partners
-Analyze delivery trends for route optimization

## Database Schema

The database consists of three main tables:
 
### DeliveryPartner
- `id` (INT, PRIMARY KEY, AUTO_INCREMENT): Unique identifier for each delivery partner
- `name` (VARCHAR(100), NOT NULL): Name of the delivery partner
 
### Orders
- `order_id` (INT, PRIMARY KEY, AUTO_INCREMENT): Unique identifier for each order
- `partner_id` (INT, FOREIGN KEY): References DeliveryPartner(id)
- `order_date` (DATE): Date when the order was placed
- `promised_date` (DATE): Promised delivery date
- `delivered_date` (DATE, NULLABLE): Actual delivery date (NULL if not yet delivered)
- `city` (VARCHAR(100)): City where the order is to be delivered
- `status` (VARCHAR(50)): Current status of the order (e.g., 'Successful', 'Returned', 'Processing')
 
### TrackingLogs
- `log_id` (INT, PRIMARY KEY, AUTO_INCREMENT): Unique identifier for each tracking log entry
- `order_id` (INT, FOREIGN KEY): References Orders(order_id)
- `message` (VARCHAR(100)): Tracking message or update
- `log_time` (DATETIME): Timestamp of the tracking update
 

## Queries

The script includes several analytical queries:

1.	**Delayed Orders**: Retrieves orders where the delivered date is after the promised date
 
2.	**Partner Performance**: Shows successful and returned deliveries per partner
 
3. **Top City**: Finds the city with the most orders in the last 30 days
 
4. **Success Rate**: Calculates delivery success rate per partner, ordered by delayed orders
 

## Features
. Shipment tracking system
. Delay detection logic
. Performance analytics using SQL aggregation
. Ranking system for delivery partners
. City-based demand analysis

## Tools & Technologies
### SQL (MySQL)
### Concepts Used:
.Joins (INNER JOIN)
.Aggregations (COUNT, SUM)
.Conditional Logic (CASE)
.Grouping (GROUP BY)
.Sorting (ORDER BY)
.Date Functions

## How to Run
1.Create the database:
CREATE DATABASE LogisticsDB;
USE LogisticsDB;
2.Run all table creation queries
3.Insert sample data
4.Execute the queries provided

## Usage

This system can be used by:

Logistics companies
E-commerce platforms
Delivery aggregators

to improve delivery efficiency and decision-making.


