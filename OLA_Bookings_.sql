use Ola;
DESC bookings;
# Views are 

# 1. Retrieve all successful bookings ;
Select * from bookings where booking_status = "Success"; 

-- 2. Find the average ride distance for each vehicle type:
Select vehicle_type , Avg (ride_distance) as avg_distance 
From bookings 
Group by vehicle_type;

-- 3. Get the total number of cancelled rides by customers:
SELECT COUNT(*)
from bookings Where booking_status = "Canceled by Customer";

-- 4. List the top 5 customers who booked the highest number of rides;
SELECT customer_id,COUNT(booking_id) AS total_rides
FROM bookings
GROUP BY customer_id
ORDER BY total_rides DESC
LIMIT 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT COUNT(*) FROM  bookings 
WHERE Canceled_Rides_by_Driver = 'Personal & car related issue' ;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT MAX(Driver_Ratings)AS max_rating,
MIN(Driver_Ratings) AS min_rating
FROM bookings WHERE Vehicle_Type = "Prime Sedan" ;

-- 7. Retrieve all rides where payment was made using UPI:
SELECT * FROM bookings 
WHERE payment_method = "UPI";

-- 8. Find the average customer rating per vehicle type:
CREATE VIEW Customer_Rating_Per_VehicleType AS
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating 
FROM bookings
GROUP BY vehicle_type;

SELECT * FROM Customer_Rating_Per_VehicleType ;

-- 9. Calculate the total booking value of rides completed successfully:
SELECT SUM(Booking_Value) as Total_Successful_value
FROM bookings
WHERE booking_status = "Success";

-- 10. List all incomplete rides along with the reason:
SELECT booking_id, incomplete_rides_reason
FROM bookings
WHERE incomplete_rides = 'Yes';
