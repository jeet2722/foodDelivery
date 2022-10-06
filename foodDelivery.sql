select * from foodDelivery;
update foodDelivery set Time_taken_min = substring(Time_taken_min,6,8);

-- PickupTime 
ALTER TABLE foodDelivery ADD PickupTime int;
update foodDelivery set PickupTime = DATEDIFF(minute,Time_Orderd, Time_Order_picked);
update foodDelivery set PickupTime = 1440 + PickupTime where PickupTime < 0 ;

--delivered distance
ALTER TABLE foodDelivery ADD deliveredDistance float;
update foodDelivery set deliveredDistance =  SQRT(SQUARE(Delivery_location_latitude - Restaurant_latitude)
+ SQUARE(Delivery_location_longitude - Restaurant_longitude));
DELETE from foodDelivery where deliveredDistance > 1;

--finalizing table
ALTER table foodDelivery 
drop COLUMN 
Delivery_location_latitude, Restaurant_latitude, Delivery_location_longitude,Restaurant_longitude, Time_Order_picked;


create TABLE AgeDeliveryCount ( ages VARCHAR(20), delivery_count int);
select * from AgeDeliveryCount;

create TABLE totalTimeAndDistance ( city VARCHAR(20),type_of_vehicle VARCHAR(20), time_taken_min float, delivereddistance float);
select * from totalTimeAndDistance;

create TABLE totalVehicleCount (city VARCHAR(20),type_of_vehicle VARCHAR(20), cnt int);
select * from totalVehicleCount;
