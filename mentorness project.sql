USE hotel_dataset;
SELECT * FROM hotel;

-- 1) What is the total number of reservations in the dataset?
SELECT 
count(*) AS Total_Reservation 
FROM hotel;


--  2) Which meal plan is the most popular among guests?
SELECT 
type_of_meal_plan,count(*)  
FROM hotel
GROUP BY type_of_meal_plan
ORDER BY count(*) DESC
LIMIT 1;


-- 3) What is the average price per room for reservations involving children?
 SELECT 
 round(AVG(avg_price_per_room),3)  AS average_price_per_room_with_children 
 FROM hotel
 WHERE no_of_children > 0;


-- 4) How many reservations were made for the year 2018 (replace XX with the desired year)?

SELECT 
count(*) AS 2018_reservation 
FROM hotel
WHERE YEAR(arrival_date)=2018;



-- 5) What is the most commonly booked room type?
SELECT 
room_type_reserved,
count(*) AS room_bookings 
FROM hotel
GROUP BY room_type_reserved
ORDER BY count(*) DESC
LIMIT 1;


-- 6) How many reservations fall on a weekend (no_of_weekend_nights > 0)?
SELECT 
count(*) AS weekend_bookings 
FROM hotel
WHERE no_of_weekend_nights > 0;


 -- 7) What is the highest and lowest lead time for reservations?
SELECT 
max(lead_time) AS max_lead_time , 
min(lead_time) AS min_lead_time 
FROM hotel;


-- 8) What is the most common market segment type for reservations?
SELECT 
market_segment_type,
count(*) AS segment_count 
FROM hotel
GROUP BY  market_segment_type
ORDER BY  count(*) DESC 
LIMIT 1;


-- 9) How many reservations have a booking status of "Confirmed"?
SELECT  
count(*) AS confirmed_reservations FROM hotel
WHERE booking_status="Not_Canceled";


-- 10) What is the total number of adults and children across all reservations?
SELECT 
sum(no_of_adults) AS total_adults,
sum(no_of_children) AS total_childrens
FROM hotel;


-- 11) What is the average number of weekend nights for reservations involving children?
SELECT 
avg(no_of_weekend_nights) AS average_weekend_nights_with_children 
FROM hotel
WHERE no_of_children > 0;


-- 12) How many reservations were made in each month of the year?

SELECT 
MONTH(arrival_date) AS Month , 
count(*) AS total_reservation FROM hotel
GROUP BY Month
ORDER BY Month;

-- 13) What is the average number of nights (both weekend and weekday) spent by guests for each room type?
SELECT 
room_type_reserved,
round(AVG(no_of_weekend_nights + no_of_week_nights),2) AS average_total_nights 
FROM hotel
GROUP BY room_type_reserved
ORDER BY room_type_reserved;


-- 14) For reservations involving children, what is the most common room type, and what is the average price for that room type?
SELECT room_type_reserved as most_common_room_type,
round(AVG(avg_price_per_room),2) AS average_price FROM hotel
WHERE room_type_reserved =(
    SELECT room_type_reserved
    FROM hotel
    WHERE no_of_children > 0
    GROUP BY room_type_reserved
   ORDER BY COUNT(*) DESC
    LIMIT 1
)
GROUP BY room_type_reserved;


-- 15) Find the market segment type that generates the highest average price per room.
SELECT 
market_segment_type,
round(AVG(avg_price_per_room),2) AS average_price_per_room 
FROM hotel 
GROUP BY market_segment_type
ORDER BY  AVG(avg_price_per_room) DESC
LIMIT 1;



