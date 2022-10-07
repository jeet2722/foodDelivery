select * from foodDelivery;
update foodDelivery set time_taken = substring(time_taken,6,8);

-- PickupTime 
ALTER TABLE foodDelivery ADD pickup_time int;
update foodDelivery set pickup_time = DATEDIFF(minute,time_orderd, time_order_picked);
update foodDelivery set pickup_time = 1440 + pickup_time where pickup_time < 0 ;

--delivered distance
ALTER TABLE foodDelivery ADD delivered_distance float;
update foodDelivery set delivered_distance =  SQRT(SQUARE(delivery_location_latitude - restaurant_latitude)
+ SQUARE(delivery_location_longitude - restaurant_longitude));
DELETE from foodDelivery where delivered_distance > 1;

--finalizing table
ALTER table foodDelivery 
drop COLUMN 
delivery_location_latitude, restaurant_latitude, delivery_location_longitude,restaurant_longitude, time_order_picked;


create TABLE AgedDeliveryCount ( ages VARCHAR(20), deliveriesCount int);
select * from AgedDeliveryCount;

create TABLE totalTimeAndDistance ( city VARCHAR(20),typeOfVehicles VARCHAR(20), timeTaken float, deliveredDistance float);
select * from totalTimeAndDistance;

create TABLE totalVehiclesCount (city VARCHAR(20),typeOfVehicles VARCHAR(20), cnt int);
select * from totalVehiclesCount;
