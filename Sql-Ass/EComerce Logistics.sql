CREATE DATABASE ECommerce;
USE ECommerce;

CREATE TABLE DeliveryPartner(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Orders(
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    partner_id INT,
    order_date DATE,
    promised_date DATE,
    delivered_date DATE,
    city VARCHAR(100),
    status VARCHAR(50),
    FOREIGN KEY (partner_id) REFERENCES DeliveryPartner(id)
);

CREATE TABLE TrackingLogs(
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    message VARCHAR(100),
    log_time DATETIME,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO DeliveryPartner(name) VALUES
 ('Usha'),
 ('John Doe'),
 ('Akshay'),
 ('Raj'),
 ('Suresh'),
 ('Jane Smith');

 INSERT INTO Orders
 ( partner_id, order_date, promised_date, delivered_date, city, status) VALUES
 (1, '2026-03-01', '2026-03-05', '2023-01-06', 'Hyderabad', 'Successful'),
 (2, '2026-03-02', '2026-03-06', '2026-03-06', 'Kolkata', 'Returned'),
 (3, '2026-03-03', '2026-03-07', NULL, 'Chennai', 'Processing'),
 (4, '2026-03-04', '2026-03-08', '2026-03-11', 'Bangalore', 'Returned'),
 (5, '2026-03-05', '2026-03-09', '2026-03-10', 'Delhi', 'Successful'),
 (6, '2026-03-06', '2026-03-10', NULL, 'Hyderabad', 'Processing');

INSERT INTO TrackingLogs(order_id, message, log_time) VALUES
 (1, 'Delayed due to traffic', '2026-03-01 10:00:00'),
 (1, 'Order Dispatched', '2026-03-02 15:00:00'),
 (1, 'Order Delivered', '2026-03-06 12:00:00'),
 (2, 'Delayed due to traffic', '2026-03-02 11:00:00'),
 (2, 'Arrived at hub', '2026-03-03 16:00:00'),
 (3, 'Customer requested change of address', '2026-03-03 12:00:00'),
 (4, 'Order Placed', '2026-03-04 09:00:00'),
 (4, 'Order Dispatched', '2026-03-05 14:00:00'),
 (4, 'Customer not available', '2026-03-11 18:00:00'),
 (5, 'Order Placed', '2026-03-05 13:00:00'),
 (5, 'Shipment lost in transit', '2026-03-06 17:00:00'),
 (6, 'Delivered successfully', '2026-03-06 14:00:00');

SELECT order_id,partner_id,promised_date,delivered_date FROM Orders
WHERE delivered_date > promised_date;

SELECT dp.name,
    COUNT(CASE WHEN o.status = 'Successful' THEN 1 END) AS successful_deliveries,
    COUNT(CASE WHEN o.status = 'Returned' THEN 1 END) AS returned_deliveries
FROM Orders o
JOIN DeliveryPartner dp ON o.partner_id = dp.id
GROUP BY dp.name;


SELECT city, COUNT(*) AS total_orders
FROM Orders
WHERE order_date >= CURRENT_DATE - INTERVAL 30 DAY
GROUP BY city
ORDER BY total_orders DESC
LIMIT 1;

SELECT 
    dp.name AS partner,
    COUNT(*) AS total_orders,
    SUM(CASE 
        WHEN o.delivered_date>o.promised_date  THEN 1 
        ELSE 0 END) AS delayed_orders,
    ROUND((COUNT(*) - SUM(CASE 
        WHEN o.delivered_date>o.promised_date  THEN 1 
        ELSE 0 END)) * 100/ COUNT(*) , 2) AS sucess_rate
FROM Orders o
JOIN DeliveryPartner dp ON o.partner_id = dp.id
GROUP BY dp.name
ORDER BY delayed_orders DESC
