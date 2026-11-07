use Ola;
DESC bookings;
# Views are 

# 1. Retrieve all successful bookings ;
Create view Successful_Bookings AS
Select * from bookings where booking_status = "Success"; 

select * From Successful_Bookings ;

-- 2. Find the average ride distance for each vehicle type:
Create View ride_distance_for_each_vehicle As
Select vehicle_type , Avg (ride_distance) as avg_distance 
From bookings 
Group by vehicle_type;

select * from ride_distance_for_each_vehicle;

-- 3. Get the total number of cancelled rides by customers:
Create VIEW cancelled_rides_by_customers AS 
SELECT COUNT(*)
from bookings Where booking_status = "Canceled by Customer";

Select * from cancelled_rides_by_customers ;


-- 4. List the top 5 customers who booked the highest number of rides;
CREATE VIEW Top_Customers as
SELECT customer_id,COUNT(booking_id) AS total_rides
FROM bookings
GROUP BY customer_id
ORDER BY total_rides DESC
LIMIT 5;

SELECT * FROM Top_Customers;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW Rides_Canceled_by_Drivers_P_C_Issues AS
SELECT COUNT(*) FROM  bookings 
WHERE Canceled_Rides_by_Driver = 'Personal & car related issue' ;

SELECT * FROM Rides_Canceled_by_Drivers_P_C_Issues;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW MIN_MAX_Driver_Rating AS
SELECT MAX(Driver_Ratings)AS max_rating,
MIN(Driver_Ratings) AS min_rating
FROM bookings WHERE Vehicle_Type = "Prime Sedan" ;

SELECT * FROM  MIN_MAX_Driver_Rating;

-- 7. Retrieve all rides where payment was made using UPI:
CREATE VIEW PAYMENT_UPI AS
SELECT * FROM bookings 
WHERE payment_method = "UPI";

SELECT * FROM PAYMENT_UPI;

-- 8. Find the average customer rating per vehicle type:
CREATE VIEW Customer_Rating_Per_VehicleType AS
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating 
FROM bookings
GROUP BY vehicle_type;

SELECT * FROM Customer_Rating_Per_VehicleType ;

-- 9. Calculate the total booking value of rides completed successfully:
CREATE VIEW Total_Successful_Ride_Value AS
SELECT SUM(Booking_Value) as Total_Successful_value
FROM bookings
WHERE booking_status = "Success";

SELECT * FROM Total_Successful_Ride_Value ;

-- 10. List all incomplete rides along with the reason:
CREATE VIEW Incomplete_ride as
SELECT booking_id, incomplete_rides_reason
FROM bookings
WHERE incomplete_rides = 'Yes';

SELECT * FROM Incomplete_ride ;